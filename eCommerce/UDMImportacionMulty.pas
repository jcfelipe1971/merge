unit UDMImportacionMulty;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados;

type
  TDMImportacionMulty = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure ImportarFichero(Fichero: string; Log, Errores: TStrings; CrearCliPro: boolean; FicheroTratado: string; FechaContabilizacion: TDateTime);
  end;

var
  DMImportacionMulty : TDMImportacionMulty;

implementation

uses
  UDMMain, FIBDataSet, HYFIBQuery, UEntorno, UDMSincronizacion, DateUtils, UUtiles, IdGlobalProtocols, UDameDato;

{$R *.dfm}

procedure TDMImportacionMulty.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMImportacionMulty.ImportarFichero(Fichero: string; Log, Errores: TStrings; CrearCliPro: boolean; FicheroTratado: string; FechaContabilizacion: TDateTime);
var
  s : string;
  sl : TStrings;
  Fila : TStrings;
  f, c : integer;

  Serie : string;
  Numero : integer;
  Fecha : TDateTime;
  CodigoCliente : integer;
  RazonSocial : string;
  NIF : string;
  FormaPago : string;
  DescComercial : double;
  DescPP : double;
  RecargoEquivalencia : double;
  PorcIRPF : double;
  TotalFactura : double;

  Unidades : double;
  BaseImponible : double;
  PorcIVA : double;
  CuotaIVA : double;
  PorcRE : double;
  CuotaRE : double;
  TipoIRPF : integer;

  Tipo : string;
  Ejercicio : integer;
  Tercero : integer;
  IdDoc : integer;
  ClienteNuevo : TCliente;
  TotalFacturaImportada : double;

  IdDetalleDoc : integer;
  TipoIVA : integer;

  CodigoProveedor : integer;
  Referencia : string;

  Proceso : integer;

  procedure DivideString(s: string; separador: char; sl: TStrings);
  var
     i : integer;
     t : string;
  begin
     t := '';
     sl.Clear;

     for i := 1 to Length(s) do
     begin
        if (s[i] = separador) then
        begin
           sl.Add(t);
           t := '';
        end
        else
           t := t + s[i];
     end;

     if (t <> '') then
        sl.Add(t);
  end;

  function DameFactura(Tipo: string; Fecha: TDateTime; Serie: string; Numero: integer): integer;
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           if (Tipo = 'FAC') then
              SQL.Add(' SELECT ID_S AS ID_DOC FROM GES_CABECERAS_S ')
           else
              SQL.Add(' SELECT ID_E AS ID_DOC FROM GES_CABECERAS_E ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' EJERCICIO = :EJERCICIO AND ');
           SQL.Add(' CANAL = :CANAL AND ');
           SQL.Add(' SERIE = :SERIE AND ');
           SQL.Add(' TIPO = :TIPO AND ');
           SQL.Add(' RIG = :RIG ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := DameEjercicio(REntorno.Empresa, Fecha);
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['SERIE'].AsString := Serie;
           Params.ByName['TIPO'].AsString := Tipo;
           Params.ByName['RIG'].AsInteger := Numero;
           ExecQuery;
           Result := FieldByName['ID_DOC'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  function DameTotalFactura(Tipo: string; IdDoc: integer): double;
  begin
     // Se busca el totad a cobrar/pagar de la factura, ya que se tiene que tener en cuenta el IRPF.
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           if (Tipo = 'FAC') then
              SQL.Add(' SELECT TOTAL_A_COBRAR AS TOTAL FROM GES_CABECERAS_S_FAC WHERE ID_S = :ID_DOC ')
           else
              SQL.Add(' SELECT TOTAL_FACTURA  AS TOTAL FROM GES_CABECERAS_E_FAC WHERE ID_E = :ID_DOC ');
           Params.ByName['ID_DOC'].AsInteger := IdDoc;
           ExecQuery;
           Result := FieldByName['TOTAL'].AsFloat;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  function DameIRPF(Porcentaje: double): integer;
  begin
     /// Devuelve el primer tipo de IRPF que corresponda con el porcentaje.

     Result := -1;
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT TIPO, CAST(''EXISTE'' AS VARCHAR(10)) EXISTE ');
           SQL.Add(' FROM SYS_TIPO_IRPF ');
           SQL.Add(' WHERE ');
           SQL.Add(' PAIS = :PAIS AND ');
           SQL.Add(' P_IRPF = :P_IRPF AND ');
           SQL.Add(' TIPO_GANADERO = 0 ');
           SQL.Add(' ORDER BY TIPO ');
           Params.ByName['PAIS'].AsString := REntorno.Pais;
           Params.ByName['P_IRPF'].AsFloat := Porcentaje;
           ExecQuery;
           if (FieldByName['EXISTE'].AsString = 'EXISTE') then
              Result := FieldByName['TIPO'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  function DameTipoIva(Porcentaje: double): integer;
  begin
     Result := -1;
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT TIPO, CAST(''EXISTE'' AS VARCHAR(10)) EXISTE ');
           SQL.Add(' FROM SYS_TIPO_IVA ');
           SQL.Add(' WHERE ');
           SQL.Add(' PAIS = :PAIS AND ');
           SQL.Add(' P_IVA = :P_IVA AND ');
           SQL.Add(' REGIMEN = 0 ');
           SQL.Add(' ORDER BY TIPO ');
           Params.ByName['PAIS'].AsString := REntorno.Pais;
           Params.ByName['P_IVA'].AsFloat := Porcentaje;
           ExecQuery;
           if (FieldByName['EXISTE'].AsString = 'EXISTE') then
              Result := FieldByName['TIPO'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  function DameDetalleFactura(Tipo: string; IdDoc, TipoIVA: integer): integer;
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           if (Tipo = 'FAC') then
              SQL.Add(' SELECT ID_DETALLES_S AS ID_DETALLE_DOC FROM GES_DETALLES_S ')
           else
              SQL.Add(' SELECT ID_DETALLES_E AS ID_DETALLE_DOC FROM GES_DETALLES_E ');
           SQL.Add(' WHERE ');
           if (Tipo = 'FAC') then
              SQL.Add(' ID_S = :ID_DOC AND ')
           else
              SQL.Add(' ID_E = :ID_DOC AND ');
           SQL.Add(' TIPO_IVA = :TIPO_IVA ');
           Params.ByName['ID_DOC'].AsInteger := IdDoc;
           Params.ByName['TIPO_IVA'].AsInteger := TipoIVA;
           ExecQuery;
           Result := FieldByName['ID_DETALLE_DOC'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  procedure AgregaDocumentoAProceso(Proceso, Ejercicio: integer; Serie, Tipo: string; Rig: integer);
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' INSERT INTO TMP_PROCESOS_AUTO ( ');
           SQL.Add(' CONTADOR, ENTRADA, EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG) ');
           SQL.Add(' VALUES ( ');
           SQL.Add(' :PROCESO, :ENTRADA, :EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG) ');
           Params.ByName['PROCESO'].AsInteger := Proceso;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['SERIE'].AsString := Serie;
           Params.ByName['TIPO'].AsString := Tipo;
           Params.ByName['RIG'].AsInteger := Rig;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  procedure CierraFactura(Ejercicio: integer; Serie, Tipo: string; Rig, IdDoc: integer; Fecha: TDateTime);
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           if (Tipo = 'FAC') then
           begin
              SQL.Add(' EXECUTE PROCEDURE G_FACTURA_CIERRA2 (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :RIG, :FECHA, :ENTRADA, :ID_S) ');
              Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['SERIE'].AsString := Serie;
              Params.ByName['RIG'].AsInteger := Rig;
              Params.ByName['FECHA'].AsDateTime := Fecha;
              Params.ByName['ID_S'].AsInteger := IdDoc;
           end
           else
           begin
              SQL.Add(' EXECUTE PROCEDURE G_FACTURA_PROV_CIERRA (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :RIG, :TIPO, :FECHA, :ENTRADA, :ID_E) ');
              Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['SERIE'].AsString := Serie;
              Params.ByName['TIPO'].AsString := Tipo;
              Params.ByName['RIG'].AsInteger := Rig;
              Params.ByName['FECHA'].AsDateTime := Fecha;
              Params.ByName['ID_E'].AsInteger := IdDoc;
           end;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

begin
  FechaContabilizacion := FechaContabilizacion + Frac(REntorno.FechaTrab);
  Log.Add(FormatDatetime('[yyyy-mm-dd hh:nn:ss.zzz] ', Now) + _('Inicio importacion'));
  Log.Add(Format(_('Fichero: %s'), [Fichero]));
  Log.Add(Format(_('Fecha contabilizacion compras: %s'), [DateToStr(FechaContabilizacion)]));

  Errores.Clear;

  Proceso := DMMain.ContadorGen('CONTA_TMP_PROC_AUTO');
  Log.Add(Format(_('Proceso: %d'), [Proceso]));

  sl := TStringList.Create;
  Fila := TStringList.Create;
  try
     Fila.Delimiter := '#';
     sl.LoadFromFile(Fichero);

     Serie := '';
     Numero := 0;
     Fecha := Today;
     TotalFactura := 0;
     for f := 0 to sl.Count - 1 do
     begin
        DivideString(sl[f], '#', Fila);
        // No puedo utilizar DelimitedString porque tambien separa por espacio
        // Fila.DelimitedText := sl[f];
        DivideString(sl[f], '#', Fila);

        {
        Log.Add('------------------------------------------------------------');
        Log.Add(format('Fila: %d: ',[f]) + sl[f]);
        for c := 0 to Fila.Count -1 do
           Log.Add(format('Campo %d: ',[c]) + Fila[c]);
        }

        // Limpio campos
        for c := 0 to Fila.Count - 1 do
           Fila[c] := Trim(Fila[c]);

        // Si se trata de una factura emitida
        if (Fila[1] = 'BAFEMT') then
        begin
           Tipo := 'FAC';

           if (Fila[3] = 'H') then
           begin
              // Cabecera

              // Si entro en un nuevo registro y tengo datos del anterior, compruebo totales.
              if ((Serie <> '') and (Numero <> 0)) then
              begin
                 IdDoc := DameFactura(Tipo, Fecha, Serie, Numero);
                 TotalFacturaImportada := DameTotalFactura(Tipo, IdDoc);
                 if (abs(TotalFactura - TotalFacturaImportada) > 0.01) then
                 begin
                    Errores.Add('******************************');
                    Errores.Add(Format(_('El total de la factura no corresponde con el importado. (Factura %s/%d)'), [Serie, Numero]));
                    Errores.Add(Format(_('Total Factura %.2f'), [TotalFactura]));
                    Errores.Add(Format(_('Total Factura Importada: %2f'), [TotalFacturaImportada]));
                    Errores.Add(Format(_('Diferencia: %2f'), [TotalFacturaImportada - TotalFactura]));
                    Errores.Add('******************************');
                 end;
              end;

              Serie := Copy(Fila[4], 1, 2);
              Numero := StrToIntDef(Copy(Fila[4], 3, Length(Fila[4])), 0);
              Fecha := EncodeDate(StrToIntDef(Copy(Fila[5], 7, 4), 0), StrToIntDef(Copy(Fila[5], 4, 2), 0), StrToIntDef(Copy(Fila[5], 1, 2), 0));
              CodigoCliente := StrToIntDef(Fila[6], 0);
              RazonSocial := Fila[7];
              NIF := Fila[8];
              FormaPago := Fila[9];
              try
                 DescComercial := StrToFloat(Fila[10]) / 100;
              except
                 DescComercial := 0;
              end;
              try
                 DescPP := StrToFloat(Fila[11]) / 100;
              except
                 DescPP := 0;
              end;
              try
                 RecargoEquivalencia := StrToFloat(Fila[12]) / 100;
              except
                 RecargoEquivalencia := 0;
              end;
              try
                 PorcIRPF := StrToFloat(Fila[13]) / 100;
              except
                 PorcIRPF := 0;
              end;
              try
                 TotalFactura := StrToFloat(Fila[14]) / 100;
              except
                 TotalFactura := 0;
              end;

              // {
              Log.Add('------------------------------------------------------------');
              Log.Add(format(_('Serie: %s'), [Serie]));
              Log.Add(format(_('Numero: %d'), [Numero]));
              Log.Add(format(_('Fecha: %s'), [FormatDateTime('dd/mm/yyyy', Fecha)]));
              Log.Add(format(_('Cliente: %d'), [CodigoCliente]));
              Log.Add(format(_('RazonSocial: %s'), [RazonSocial]));
              Log.Add(format(_('NIF: %s'), [NIF]));
              Log.Add(format(_('FormaPago: %s'), [FormaPago]));
              Log.Add(format(_('DescComercial: %.2f'), [DescComercial]));
              Log.Add(format(_('DescPP: %.2f'), [DescPP]));
              Log.Add(format(_('RecargoEquivalencia: %.2f'), [RecargoEquivalencia]));
              Log.Add(format(_('IRPF: %.2f'), [PorcIRPF]));
              Log.Add(format(_('TotalFactura: %.2f'), [TotalFactura]));
              // }

              IdDoc := DameFactura(Tipo, Fecha, Serie, Numero);
              Log.Add(format(_('Id Documento: %d'), [IdDoc]));

              if (IdDoc = 0) then
              begin
                 Tercero := DameTercero('CLI', CodigoCliente);
                 if (Tercero = 0) then
                 begin
                    if CrearCliPro then
                    begin
                       // Crear cliente
                       with ClienteNuevo do
                       begin
                          InicializaCliente(ClienteNuevo);

                          Cliente := CodigoCliente;
                          Tercero.NombreRSocial := RazonSocial;
                          Tercero.Nif := Nif;
                          Tercero.Tercero := DMMain.DameTerceroNIF(NIF);
                          Tercero.Direccion.Direccion := DMMain.DameMinDireccion(Tercero.Tercero);
                          if (Tercero.Direccion.Direccion = 0) then
                             Tercero.Direccion.DirNombre1 := 'SIN DIRECCION';

                          CreaCliente(ClienteNuevo);
                       end;
                       Tercero := ClienteNuevo.Tercero.Tercero;

                       Errores.Add(Format(_('Nuevo cliente creado. %d - %s (NIF: %s)'), [CodigoCliente, RazonSocial, Nif]));
                       Errores.Add(_('Compruebe Pais y Modo de IVA del cliente y de las facturas creadas.'));
                    end
                    else
                    begin
                       Errores.Add(Format(_('No existe cliente %d - %s (NIF: %s)'), [CodigoCliente, RazonSocial, Nif]));
                    end;
                 end;

                 if (Tercero <> 0) then
                 begin
                    if (DameTituloFormaPago(FormaPago) = '') then
                    begin
                       FormaPago := 'CON';
                       Log.Add('***');
                       Log.Add('*** ' + format(_('Forma de Pago no existe. Se utiliza : %s'), [FormaPago]));
                       Log.Add('***');
                    end;

                    TipoIRPF := DameIRPF(PorcIRPF);

                    if (TipoIRPF >= 0) then
                    begin
                       Ejercicio := DameEjercicio(REntorno.Empresa, Fecha);

                       with THYFIBQuery.Create(nil) do
                       begin
                          try
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add(' INSERT INTO VER_CABECERAS_FACTURA ( ');
                             SQL.Add(' EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, TARIFA, CLIENTE, DIRECCION, ENTRADA, ');
                             SQL.Add(' FECHA, FORMA_PAGO, DTO_PP, DTO_CIAL, TIPO_IRPF, P_RETENCION, ');
                             SQL.Add(' MODO_IVA) ');
                             SQL.Add(' VALUES ( ');
                             SQL.Add(' :EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :TARIFA, :CLIENTE, :DIRECCION, :ENTRADA, ');
                             SQL.Add(' :FECHA, :FORMA_PAGO, :DTO_PP, :DTO_CIAL, :TIPO_IRPF, :P_RETENCION, ');
                             SQL.Add(' (SELECT MODO_IVA FROM CON_CUENTAS_GES_CLI ');
                             SQL.Add('  WHERE ');
                             SQL.Add('  EMPRESA = :EMPRESA AND ');
                             SQL.Add('  EJERCICIO = :EJERCICIO AND ');
                             SQL.Add('  CANAL = :CANAL AND ');
                             SQL.Add('  CLIENTE = :CLIENTE) ');
                             SQL.Add(' ) ');
                             Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                             Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                             Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                             Params.ByName['SERIE'].AsString := Serie;
                             Params.ByName['TIPO'].AsString := Tipo;
                             Params.ByName['RIG'].AsInteger := Numero;
                             Params.ByName['TARIFA'].AsString := REntorno.TarifaDefecto;
                             Params.ByName['CLIENTE'].AsInteger := CodigoCliente;
                             Params.ByName['DIRECCION'].AsInteger := DMMain.DameMinDireccion(Tercero);
                             Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                             Params.ByName['FECHA'].AsDateTime := Fecha;
                             Params.ByName['FORMA_PAGO'].AsString := FormaPago;
                             Params.ByName['DTO_PP'].AsFloat := DescPP;
                             Params.ByName['DTO_CIAL'].AsFloat := DescComercial;
                             Params.ByName['TIPO_IRPF'].AsInteger := TipoIRPF;
                             Params.ByName['P_RETENCION'].AsFloat := PorcIRPF;
                             ExecQuery;
                             FreeHandle;
                          finally
                             Free;
                          end;
                       end;

                       AgregaDocumentoAProceso(Proceso, Ejercicio, Serie, Tipo, Numero);
                    end
                    else
                    begin
                       Errores.Add(Format(_('Tipo de IRPF no reconocido %.2f %% (Factura %s/%d)'), [PorcIRPF, Serie, Numero]));
                       Errores.Add(sl[f]);
                    end;
                 end;
              end
              else
              begin
                 Log.Add('***');
                 Log.Add('*** ' + _('Ya existe documento, se omite.'));
                 Log.Add('***');
              end;
           end
           else
           if (Fila[3] = 'B') then
           begin
              // Bases
              Serie := Copy(Fila[4], 1, 2);
              Numero := StrToIntDef(Copy(Fila[4], 3, Length(Fila[4])), 0);
              Fecha := EncodeDate(StrToIntDef(Copy(Fila[5], 7, 4), 0), StrToIntDef(Copy(Fila[5], 4, 2), 0), StrToIntDef(Copy(Fila[5], 1, 2), 0));
              try
                 BaseImponible := StrToFloat(Fila[6]) / 100;
              except
                 BaseImponible := 0;
              end;
              try
                 PorcIVA := StrToFloat(Fila[7]) / 100;
              except
                 PorcIVA := 0;
              end;
              try
                 CuotaIVA := StrToFloat(Fila[8]) / 100;
              except
                 CuotaIVA := 0;
              end;
              try
                 PorcRE := StrToFloat(Fila[9]) / 100;
              except
                 PorcRE := 0;
              end;
              try
                 CuotaRE := StrToFloat(Fila[10]) / 100;
              except
                 CuotaRE := 0;
              end;

              // {
              Log.Add('------------------------------------------------------------');
              Log.Add(format(_('Serie: %s'), [Serie]));
              Log.Add(format(_('Numero: %d'), [Numero]));
              Log.Add(format(_('Fecha: %s'), [FormatDateTime('dd/mm/yyyy', Fecha)]));
              Log.Add(format(_('BaseImponible: %.2f'), [BaseImponible]));
              if (DescPP <> 0) then
              begin
                 // Calculo la base **SIN** el descuento pronto pago aplicado
                 BaseImponible := BaseImponible / (1 - (DescPP / 100));
                 Log.Add(format(_('  * BaseImponible sin DtoPP: %.2f'), [BaseImponible]));
              end;
              Log.Add(format(_('PorcIVA: %.2f'), [PorcIVA]));
              Log.Add(format(_('CuotaIVA: %.2f'), [CuotaIVA]));
              Log.Add(format(_('PorcRE: %.2f'), [PorcRE]));
              Log.Add(format(_('CuotaRE: %.2f'), [CuotaRE]));
              // }

              IdDoc := DameFactura(Tipo, Fecha, Serie, Numero);
              Log.Add(format(_('Id Documento: %d'), [IdDoc]));

              TipoIVA := DameTipoIva(PorcIVA);
              if (TipoIVA >= 0) then
              begin
                 IdDetalleDoc := DameDetalleFactura(Tipo, IdDoc, TipoIVA);
                 if (IdDetalleDoc = 0) then
                 begin
                    // Los importes siempre debe ser positivos
                    Unidades := 1;
                    if (BaseImponible < 0) then
                    begin
                       Unidades := -1;
                       BaseImponible := BaseImponible * -1;
                    end;

                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add(' INSERT INTO VER_DETALLE_FACTURA ( ');
                          SQL.Add(' EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, ARTICULO, ENTRADA, TIPO_IVA, UNIDADES, PRECIO) ');
                          SQL.Add(' SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, 0, :ARTICULO, :ENTRADA, :TIPO_IVA, :UNIDADES, :PRECIO ');
                          SQL.Add(' FROM GES_CABECERAS_S ');
                          SQL.Add(' WHERE ');
                          SQL.Add(' ID_S = :ID_S ');
                          Params.ByName['ID_S'].AsInteger := IdDoc;
                          Params.ByName['ARTICULO'].AsString := REntorno.ArtTextoLibre;
                          Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                          Params.ByName['TIPO_IVA'].AsInteger := TipoIVA;
                          Params.ByName['UNIDADES'].AsFloat := Unidades;
                          Params.ByName['PRECIO'].AsFloat := BaseImponible;
                          ExecQuery;
                          FreeHandle;
                       finally
                          Free;
                       end;
                    end;
                 end
                 else
                 begin
                    Log.Add('***');
                    Log.Add('*** ' + _('Ya existe linea de documento, se omite.'));
                    Log.Add('***');
                 end;
              end
              else
              begin
                 Errores.Add(Format(_('Tipo de iva no reconocido %.2f %% (Factura %s/%d)'), [PorcIVA, Serie, Numero]));
                 Errores.Add(sl[f]);
              end;
           end
           else
           begin
              Errores.Add(_('ERROR - TIPO NO RECONOCIDO'));
              Errores.Add(sl[f]);
           end;
        end
        else
        if (Fila[1] = 'BAFREC') then
        begin
           Tipo := 'FAP';

           if (Fila[3] = 'D') then
           begin
              // Cabecera
              // Si entro en un nuevo registro y tengo datos del anterior, compruebo totales.
              if ((Serie <> '') and (Numero <> 0)) then
              begin
                 IdDoc := DameFactura(Tipo, Fecha, Serie, Numero);
                 TotalFacturaImportada := DameTotalFactura(Tipo, IdDoc);
                 if (abs(TotalFactura - TotalFacturaImportada) > 0.01) then
                 begin
                    Errores.Add('******************************');
                    Errores.Add(Format(_('El total de la factura no corresponde con el importado. (Factura %s/%d)'), [Serie, Numero]));
                    Errores.Add(Format(_('Total Factura %.2f'), [TotalFactura]));
                    Errores.Add(Format(_('Total Factura Importada: %2f'), [TotalFacturaImportada]));
                    Errores.Add(Format(_('Diferencia: %2f'), [TotalFacturaImportada - TotalFactura]));
                    Errores.Add('******************************');
                 end;
              end;

              Serie := Copy(Fila[4], 1, 2);
              Numero := StrToIntDef(Copy(Fila[4], 3, Length(Fila[4])), 0);
              Fecha := EncodeDate(StrToIntDef(Copy(Fila[5], 7, 4), 0), StrToIntDef(Copy(Fila[5], 4, 2), 0), StrToIntDef(Copy(Fila[5], 1, 2), 0));
              CodigoProveedor := StrToIntDef(Fila[6], 0);
              RazonSocial := Fila[7];
              NIF := Fila[8];
              FormaPago := Fila[9];
              try
                 DescComercial := StrToFloat(Fila[10]) / 100;
              except
                 DescComercial := 0;
              end;
              try
                 DescPP := StrToFloat(Fila[11]) / 100;
              except
                 DescPP := 0;
              end;
              try
                 RecargoEquivalencia := StrToFloat(Fila[12]) / 100;
              except
                 RecargoEquivalencia := 0;
              end;
              try
                 PorcIRPF := StrToFloat(Fila[13]) / 100;
              except
                 PorcIRPF := 0;
              end;
              try
                 TotalFactura := StrToFloat(Fila[14]) / 100;
              except
                 TotalFactura := 0;
              end;

              Referencia := Copy(Fila[15], 1, 40);

              // {
              Log.Add('------------------------------------------------------------');
              Log.Add(format(_('Serie: %s'), [Serie]));
              Log.Add(format(_('Numero: %d'), [Numero]));
              Log.Add(format(_('Fecha: %s'), [FormatDateTime('dd/mm/yyyy', Fecha)]));
              Log.Add(format(_('Proveedor: %d'), [CodigoProveedor]));
              Log.Add(format(_('RazonSocial: %s'), [RazonSocial]));
              Log.Add(format(_('NIF: %s'), [NIF]));
              Log.Add(format(_('FormaPago: %s'), [FormaPago]));
              Log.Add(format(_('DescComercial: %.2f'), [DescComercial]));
              Log.Add(format(_('DescPP: %.2f'), [DescPP]));
              Log.Add(format(_('RecargoEquivalencia: %.2f'), [RecargoEquivalencia]));
              Log.Add(format(_('IRPF: %.2f'), [PorcIRPF]));
              Log.Add(format(_('TotalFactura: %.2f'), [TotalFactura]));
              Log.Add(format(_('Referencia: %s'), [Referencia]));
              // }

              IdDoc := DameFactura(Tipo, Fecha, Serie, Numero);
              Log.Add(format(_('Id Documento: %d'), [IdDoc]));

              if (IdDoc = 0) then
              begin
                 Tercero := DameTercero('PRO', CodigoProveedor);
                 if (Tercero = 0) then
                 begin
                    (*
                    if CrearCliPro then
                    begin
                       // Crear cliente
                       with ClienteNuevo do
                       begin
                          InicializaCliente(ClienteNuevo);

                          Proveedor := CodigoProveedor;
                          Tercero.NombreRSocial := RazonSocial;
                          Tercero.Nif := Nif;
                          Tercero.Tercero := DMMain.DameTerceroNIF(NIF);
                          Tercero.Direccion.Direccion := DMMain.DameMinDireccion(Tercero.Tercero);
                          if (Tercero.Direccion.Direccion = 0) then
                             Tercero.Direccion.DirNombre1 := 'SIN DIRECCION';

                          CreaCliente(ClienteNuevo);
                       end;
                       Tercero := ClienteNuevo.Tercero.Tercero;

                       Errores.Add(Format(_('Nuevo cliente creado. %d - %s (NIF: %s)'), [CodigoCliente, RazonSocial, Nif]));
                       Errores.Add(_('Compruebe Pais y Modo de IVA.'));
                    end
                    else
                    *)
                    begin
                       Errores.Add(Format(_('No existe proveedor %d - %s (NIF: %s)'), [CodigoProveedor, RazonSocial, Nif]));
                    end;
                 end;

                 if (Tercero <> 0) then
                 begin
                    if (DameTituloFormaPago(FormaPago) = '') then
                    begin
                       FormaPago := 'CON';
                       Log.Add('***');
                       Log.Add('*** ' + format(_('Forma de Pago no existe. Se utiliza : %s'), [FormaPago]));
                       Log.Add('***');
                    end;

                    TipoIRPF := DameIRPF(PorcIRPF);

                    if (TipoIRPF >= 0) then
                    begin
                       Ejercicio := DameEjercicio(REntorno.Empresa, Fecha);

                       with THYFIBQuery.Create(nil) do
                       begin
                          try
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Add(' INSERT INTO VER_CABECERAS_FACTURA_PROV ( ');
                             SQL.Add(' EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, PROVEEDOR, ENTRADA, FECHA, FORMA_DE_PAGO, DTO_PP, DTO_CIAL, ');
                             SQL.Add('  TIPO_IRPF, MONEDA, NUM_FACTURA, FECHA_CON, P_IRPF) ');
                             SQL.Add(' VALUES ( ');
                             SQL.Add(' :EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :PROVEEDOR, :ENTRADA, :FECHA, :FORMA_PAGO, :DTO_PP, :DTO_CIAL, ');
                             SQL.Add('  :TIPO_IRPF, :MONEDA, :NUM_FACTURA, :FECHA_CON, :P_IRPF) ');
                             Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                             Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                             Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                             Params.ByName['SERIE'].AsString := Serie;
                             Params.ByName['TIPO'].AsString := Tipo;
                             Params.ByName['RIG'].AsInteger := Numero;
                             Params.ByName['PROVEEDOR'].AsInteger := CodigoProveedor;
                             Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                             Params.ByName['FECHA'].AsDateTime := Fecha;
                             Params.ByName['FECHA_CON'].AsDateTime := FechaContabilizacion;
                             Params.ByName['FORMA_PAGO'].AsString := FormaPago;
                             Params.ByName['DTO_PP'].AsFloat := DescPP;
                             Params.ByName['DTO_CIAL'].AsFloat := DescComercial;
                             Params.ByName['TIPO_IRPF'].AsInteger := TipoIRPF;
                             Params.ByName['P_IRPF'].AsFloat := PorcIRPF;
                             Params.ByName['MONEDA'].AsString := REntorno.Moneda;
                             Params.ByName['NUM_FACTURA'].AsString := Referencia;
                             ExecQuery;
                             FreeHandle;
                          finally
                             Free;
                          end;
                       end;

                       AgregaDocumentoAProceso(Proceso, Ejercicio, Serie, Tipo, Numero);
                    end
                    else
                    begin
                       Errores.Add(Format(_('Tipo de IRPF no reconocido %.2f %% (Factura %s/%d)'), [PorcIRPF, Serie, Numero]));
                       Errores.Add(sl[f]);
                    end;
                 end;
              end
              else
              begin
                 Log.Add('***');
                 Log.Add('*** ' + _('Ya existe documento, se omite.'));
                 Log.Add('***');
              end;
           end
           else
           if (Fila[3] = 'B') then
           begin
              // Bases
              Serie := Copy(Fila[4], 1, 2);
              Numero := StrToIntDef(Copy(Fila[4], 3, Length(Fila[4])), 0);
              Fecha := EncodeDate(StrToIntDef(Copy(Fila[5], 7, 4), 0), StrToIntDef(Copy(Fila[5], 4, 2), 0), StrToIntDef(Copy(Fila[5], 1, 2), 0));
              try
                 BaseImponible := StrToFloat(Fila[6]) / 100;
              except
                 BaseImponible := 0;
              end;
              try
                 PorcIVA := StrToFloat(Fila[7]) / 100;
              except
                 PorcIVA := 0;
              end;
              try
                 CuotaIVA := StrToFloat(Fila[8]) / 100;
              except
                 CuotaIVA := 0;
              end;
              try
                 PorcRE := StrToFloat(Fila[9]) / 100;
              except
                 PorcRE := 0;
              end;
              try
                 CuotaRE := StrToFloat(Fila[10]) / 100;
              except
                 CuotaRE := 0;
              end;

              // {
              Log.Add('------------------------------------------------------------');
              Log.Add(format(_('Serie: %s'), [Serie]));
              Log.Add(format(_('Numero: %d'), [Numero]));
              Log.Add(format(_('Fecha: %s'), [FormatDateTime('dd/mm/yyyy', Fecha)]));
              Log.Add(format(_('BaseImponible: %.2f'), [BaseImponible]));
              if (DescPP <> 0) then
              begin
                 // Calculo la base **SIN** el descuento pronto pago aplicado
                 BaseImponible := BaseImponible / (1 - (DescPP / 100));
                 Log.Add(format(_('  * BaseImponible sin DtoPP: %.2f'), [BaseImponible]));
              end;
              Log.Add(format(_('PorcIVA: %.2f'), [PorcIVA]));
              Log.Add(format(_('CuotaIVA: %.2f'), [CuotaIVA]));
              Log.Add(format(_('PorcRE: %.2f'), [PorcRE]));
              Log.Add(format(_('CuotaRE: %.2f'), [CuotaRE]));
              // }

              IdDoc := DameFactura(Tipo, Fecha, Serie, Numero);
              Log.Add(format(_('Id Documento: %d'), [IdDoc]));

              TipoIVA := DameTipoIva(PorcIVA);
              if (TipoIVA >= 0) then
              begin
                 IdDetalleDoc := DameDetalleFactura(Tipo, IdDoc, TipoIVA);
                 if (IdDetalleDoc = 0) then
                 begin
                    // Los importes siempre debe ser positivos
                    Unidades := 1;
                    if (BaseImponible < 0) then
                    begin
                       Unidades := -1;
                       BaseImponible := BaseImponible * -1;
                    end;

                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add(' INSERT INTO VER_DETALLE_FACTURA_PROV ( ');
                          SQL.Add(' EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, ARTICULO, ENTRADA, TIPO_IVA, UNIDADES, P_COSTE) ');
                          SQL.Add(' SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, 0, :ARTICULO, :ENTRADA, :TIPO_IVA, :UNIDADES, :P_COSTE ');
                          SQL.Add(' FROM GES_CABECERAS_E ');
                          SQL.Add(' WHERE ');
                          SQL.Add(' ID_E = :ID_E ');
                          Params.ByName['ID_E'].AsInteger := IdDoc;
                          Params.ByName['ARTICULO'].AsString := REntorno.ArtTextoLibre;
                          Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                          Params.ByName['TIPO_IVA'].AsInteger := TipoIVA;
                          Params.ByName['UNIDADES'].AsFloat := Unidades;
                          Params.ByName['P_COSTE'].AsFloat := BaseImponible;
                          ExecQuery;
                          FreeHandle;
                       finally
                          Free;
                       end;
                    end;
                 end
                 else
                 begin
                    Log.Add('***');
                    Log.Add('*** ' + _('Ya existe linea de documento, se omite.'));
                    Log.Add('***');
                 end;
              end
              else
              begin
                 Errores.Add(Format(_('Tipo de iva no reconocido %.2f %% (Factura %s/%d)'), [PorcIVA, Serie, Numero]));
                 Errores.Add(sl[f]);
              end;
           end
           else
           begin
              Errores.Add(_('ERROR - TIPO NO RECONOCIDO'));
              Errores.Add(sl[f]);
           end;
        end
        else
        begin
           Tipo := 'ERR';

           Log.Add(_('ERROR - FORMATO NO RECONOCIDO'));
           Errores.Add(sl[f]);
        end;
     end;

     // Verifico ultimo registro importado, compruebo totales.
     if ((Serie <> '') and (Numero <> 0)) then
     begin
        IdDoc := DameFactura(Tipo, Fecha, Serie, Numero);
        TotalFacturaImportada := DameTotalFactura(Tipo, IdDoc);

        if (abs(TotalFactura - TotalFacturaImportada) > 0.01) then
        begin
           Errores.Add('******************************');
           Errores.Add(Format(_('El total de la factura no corresponde con el importado. (Factura %s/%d)'), [Serie, Numero]));
           Errores.Add(Format(_('Total Factura %.2f'), [TotalFactura]));
           Errores.Add(Format(_('Total Factura Importada: %2f'), [TotalFacturaImportada]));
           Errores.Add(Format(_('Diferencia: %2f'), [TotalFacturaImportada - TotalFactura]));
           Errores.Add('******************************');
        end;
     end;
  finally
     sl.Free;
     Fila.Free;
  end;

  // Ahora cierro las facturas agregadas al proceso automatico.
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add(' SELECT P.*, C.FECHA,  ');
           if (Tipo = 'FAC') then
              SelectSQL.Add(' C.ID_S AS ID_DOC ')
           else
              SelectSQL.Add(' C.ID_E AS ID_DOC ');
           SelectSQL.Add(' FROM TMP_PROCESOS_AUTO P ');
           if (Tipo = 'FAC') then
              SelectSQL.Add(' JOIN GES_CABECERAS_S C ')
           else
              SelectSQL.Add(' JOIN GES_CABECERAS_E C ');
           SelectSQL.Add(' ON ');
           SelectSQL.Add(' P.EMPRESA = C.EMPRESA AND ');
           SelectSQL.Add(' P.EJERCICIO = C.EJERCICIO AND ');
           SelectSQL.Add(' P.CANAL = C.CANAL AND ');
           SelectSQL.Add(' P.SERIE = C.SERIE AND ');
           SelectSQL.Add(' P.TIPO = C.TIPO AND ');
           SelectSQL.Add(' P.RIG = C.RIG ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' P.CONTADOR = :PROCESO ');
           SelectSQL.Add(' ORDER BY C.FECHA, C.RIG ');
           Params.ByName['PROCESO'].AsInteger := Proceso;
           Open;
           while not EOF do
           begin
              try
                 Log.Add(format(_('Cerrando factura %s/%d'), [FieldByName('SERIE').AsString, FieldByName('RIG').AsInteger]));

                 if (Tipo = 'FAC') then
                    Fecha := FieldByName('FECHA').AsDateTime
                 else
                    Fecha := FechaContabilizacion;

                 CierraFactura(
                    FieldByName('EJERCICIO').AsInteger,
                    FieldByName('SERIE').AsString,
                    FieldByName('TIPO').AsString,
                    FieldByName('RIG').AsInteger,
                    FieldByName('ID_DOC').AsInteger,
                    Fecha);
              except
                 on E: Exception do
                 begin
                    Errores.Add(format(_('Error cerrando factura %s/%d'), [FieldByName('SERIE').AsString, FieldByName('RIG').AsInteger]));
                    Errores.Add(E.Message);
                 end;
              end;

              Next;
           end;
           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;

  // Muevo fichero a carpeta de tratados.
  if (Errores.Count = 0) then
  begin
     CopyFileTo(Fichero, FicheroTratado);
     DeleteFile(Fichero);
  end;
end;

end.
