unit UDMImportarDocumentos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, FIBQuery, HYFIBQuery;

type
  TDMImportarDocumentos = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QPrecios: THYFIBQuery;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
     function DameClienteSegunReferencia(Referencia: string): integer;
     function DameTransportistaCliente(Cliente: integer): integer;
     function DameTarifaCliente(Cliente: integer): string;
     procedure Log(s: string);
  public
     { Public declarations }
     procedure ImportarFacturaCompraPresident(Fichero, Serie, SerieAbono: string; Proveedor: integer);
     procedure ImportarFacturaVentaPresident(Fichero, Serie, SerieAbono: string);
     function CreaArticuloAnver(ArticuloImportado, Descripcion, CodigoArancelario, ClaseArticulo: string; Fecha: TDateTime; Log: TStrings): integer;
     procedure ImportarComprasAnver(Fichero: string; Serie: string; Log: TStrings);
     procedure ImportarVentasAnver(Fichero: string; Serie: string; Log: TStrings);
     function DameClienteSegunNIF(NIF: string): integer;
     function DameAgenteCliente(Cliente: integer): integer;
     function DameAgenteNTV(CodigoNTV: string): integer;
     function DameFacturaSegunReferenica(Serie, SerieAbono, SuReferencia: string): integer;
     procedure TraerDatosFTP(FTP_Host: string; FTP_Port: integer; FTP_User, FTP_Password, FTP_Carpeta, DirectorioDestino: string);
     procedure EnviarDatosFTP(FTP_Host: string; FTP_Port: integer; FTP_User, FTP_Password, FTP_Carpeta, Archivo: string);
     procedure SellforgeExpFamilias(Fichero: string);
     procedure SellforgeExpArticulos(Fichero, Almacen: string);
     procedure SellforgeExpClientes(Fichero: string);
     procedure SellforgeExpDirecciones(Fichero: string);
     procedure NTVExpFamilias(Fichero: string);
     procedure NTVExpArticulos(Fichero, Almacen: string);
     procedure NTVExpClientes(Fichero: string);
     procedure NTVExpDirecciones(Fichero: string);
     procedure NTVExpAgentes(Fichero: string);
     procedure NTVExpFormaPago(Fichero: string);
     procedure NTVExpZonas(Fichero: string);
     procedure NTVExpPortes(Fichero: string);
     function CreaCabecera(Cliente: integer; Fecha: TDateTime; Serie, SuReferencia: string): integer;
     function CreaDetalle(id_s, id_a: integer; Descripcion: string; Cantidad, Precio, Descuento: double): integer;
  end;

var
  DMImportarDocumentos : TDMImportarDocumentos;

implementation

{$R *.dfm}

uses UDMMain, UEntorno, UUtiles, UDameDato, DateUtils, Dialogs, Forms, IdFTP, IdFTPCommon, UParam, IdGlobalProtocols, UDMSincronizacion, FIBDataSetRW, DB;

{ TDMImportarDocumentos }

procedure TDMImportarDocumentos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
end;

function TDMImportarDocumentos.DameClienteSegunReferencia(Referencia: string): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT CLIENTE FROM EMP_CLIENTES WHERE EMPRESA = ?EMPRESA AND SU_REFERENCIA = ?SU_REFERENCIA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['SU_REFERENCIA'].AsString := Referencia;
        ExecQuery;
        Result := FieldByName['CLIENTE'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMImportarDocumentos.DameAgenteCliente(Cliente: integer): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT AGENTE FROM EMP_CLIENTES WHERE EMPRESA = ?EMPRESA AND CLIENTE = ?CLIENTE';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CLIENTE'].AsInteger := Cliente;
        ExecQuery;
        Result := FieldByName['AGENTE'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMImportarDocumentos.DameAgenteNTV(CodigoNTV: string): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT AGENTE FROM EMP_AGENTES WHERE EMPRESA = ?EMPRESA AND CODIGO_NTV = :CODIGO_NTV';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CODIGO_NTV'].AsString := CodigoNTV;
        ExecQuery;
        Result := FieldByName['AGENTE'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMImportarDocumentos.DameTransportistaCliente(Cliente: integer): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TRANSPORTISTA FROM EMP_CLIENTES WHERE EMPRESA = ?EMPRESA AND CLIENTE = ?CLIENTE';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CLIENTE'].AsInteger := Cliente;
        ExecQuery;
        Result := FieldByName['TRANSPORTISTA'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMImportarDocumentos.DameTarifaCliente(Cliente: integer): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TARIFA FROM EMP_CLIENTES WHERE EMPRESA = ?EMPRESA AND CLIENTE = ?CLIENTE';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CLIENTE'].AsInteger := Cliente;
        ExecQuery;
        Result := FieldByName['TARIFA'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMImportarDocumentos.ImportarFacturaCompraPresident(Fichero, Serie, SerieAbono: string; Proveedor: integer);
var
  ts : TStrings;
  i : integer;
  Ejercicio : integer;
  RIG : integer;
  FraProveedor : string;
  FraProveedor_ant : string;
  FraProveedor_Existe : string;
  Fecha : TDateTime;
  Articulo : string;
  TipoIVA : integer;
  Unidades : double;
  Precio : double;
  Descuento : double;
  id : integer;
  FormaPago : string;
  Linea : integer;
  Titulo : string;
begin
  {
         1         2         3         4         5         6         7         8         9         0
123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789
--------------------------------------------------------------------------------------------------------------
012   3310831      20131212   0TXMU403              1      14.0000      40.00000 0.00 0  13020131212S3                                                                       0.0000
012   3310831      20131212   0ACSA110              1       2.0000      30.45000 0.00 0  13020131212S3                                                                       0.0000
012   3310831      20131212   0TXKT680              1       6.0000      60.00000 0.00 0  13020131212S3                                                                       0.0000
012   3310831      20131212   0AMMI129              1       1.0000      23.70000 0.00 0  13020131212S3                                                                       0.0000

01-03 -> NO USAR
04-06 -> NO USAR
07-10 -> Nro. Factura Prov. (3310)
11-16 -> Proveedor (831)
20-27 -> Fecha (20131212)
31-31 -> NO USAR (0)
32-46 -> Articulo (TXMU403)
53-54 -> NO USAR
57-67 -> Unidades (14.0000)
69-81 -> Precio (40.00000)
82-85 -> Descuento (0.00)
87-88 -> NO USAR
90-103-> NO USAR
}
  i := 0;
  id := 0;
  FraProveedor_ant := '';
  FraProveedor_Existe := '';
  RIG := 0;
  Linea := 0;

  Log('Fichero: ' + Fichero);
  Log('Serie: ' + Serie);
  Log('Serie Abono: ' + SerieAbono);
  Log('Proveedor: ' + IntToStr(Proveedor));
  Log('--------------------------------------------------');

  ts := TStringList.Create;
  with ts do
  begin
     try
        LoadFromFile(Fichero);

        while (Count > i) do
        begin
           Log('Linea: ' + IntToStr(i));
           Log('--------------------------------------------------');
           Log(ts[i]);
           if (Length(ts[i]) > 10) then
           begin
              // Inicializo datos
              FraProveedor := '';
              Fecha := Now;
              Ejercicio := 0;
              Articulo := '';
              Titulo := '';
              Unidades := 0;
              Precio := 0;
              Descuento := 0;
              TipoIVA := 0;

              try
                 FraProveedor := Trim(Copy(ts[i], 4, 7));
                 Log('Nro. Factura Prov.: ' + FraProveedor);
                 Fecha := EncodeDate(StrToIntDef(Copy(ts[i], 20, 4), 1900), StrToIntDef(Copy(ts[i], 24, 2), 1), StrToIntDef(Copy(ts[i], 26, 2), 1));
                 Log('Fecha: ' + DateToStr(Fecha));
                 Ejercicio := YearOf(Fecha);
                 Log('Ejercicio: ' + IntToStr(Ejercicio));
                 Articulo := Trim(Copy(ts[i], 32, 15));
                 Log('Articulo: ' + Articulo);
                 Titulo := DameTituloArticulo(Articulo);
                 Log('Titulo: ' + Titulo);
                 Unidades := StrToFloatDec(Copy(ts[i], 54, 13), '.');
                 Log('Unidades: ' + FloatToStr(Unidades));
                 Precio := StrToFloatDec(Copy(ts[i], 68, 13), '.');
                 Log('Precio: ' + FloatToStr(Precio));
                 Descuento := StrToFloatDec(Copy(ts[i], 82, 4), '.');
                 Log('Descuento: ' + FloatToStr(Descuento));
                 TipoIVA := DameTipoIVAArticulo(Articulo, REntorno.Empresa, Ejercicio);
                 Log('TipoIVA: ' + IntToStr(TipoIVA));
              except
                 on E: Exception do
                 begin
                    Log(E.Message);
                    FraProveedor := '';
                    ShowMessage(_('Ha ocurrido un error al obtener los datos de la linea') + #13#10 + E.Message);
                 end;
              end;

              if (FraProveedor > '') then
              begin
                 if (Titulo = '') then
                 begin
                    ShowMessage(Format(_('El articulo %s no existe. No se importará este registro en la factura %s'), [Articulo, FraProveedor]));
                    Log('*** Articulo no existe');
                 end
                 else
                 begin
                    // Si cambia el número de factura debo crear una nueva cabecera.
                    // Verifico si la factura ya existe
                    // Averiguo la forma de pago para este proveedor
                    if ((FraProveedor_ant <> FraProveedor) and (FraProveedor_Existe <> FraProveedor)) then
                    begin
                       with THYFIBQuery.Create(nil) do
                       begin
                          try
                             Close;
                             DataBase := DMMain.DataBase;
                             SQL.Text := 'SELECT ID_E FROM GES_CABECERAS_E_FAC WHERE EMPRESA = ?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND SERIE=?SERIE AND TIPO=?TIPO AND PROVEEDOR = ?PROVEEDOR AND NUM_FACTURA=?NUM_FACTURA';
                             Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                             Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                             Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                             if (Unidades > 0) then
                                Params.ByName['SERIE'].AsString := Serie
                             else
                                Params.ByName['SERIE'].AsString := SerieAbono;
                             Params.ByName['TIPO'].AsString := 'FAP';
                             Params.ByName['NUM_FACTURA'].AsString := FraProveedor;
                             Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
                             ExecQuery;
                             if (FieldByName['ID_E'].AsInteger > 0) then
                                FraProveedor_Existe := FraProveedor
                             else
                                FraProveedor_Existe := '';
                             FreeHandle;
                          finally
                             Free;
                          end;
                       end;

                       if (FraProveedor_Existe = '') then
                       begin
                          with THYFIBQuery.Create(nil) do
                          begin
                             try
                                Close;
                                DataBase := DMMain.DataBase;
                                SQL.Text := 'SELECT FORMA_PAGO FROM CON_CUENTAS_GES_PRO WHERE EMPRESA = ?EMPRESA AND EJERCICIO = ?EJERCICIO AND CANAL = ?CANAL AND PROVEEDOR = ?PROVEEDOR';
                                Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                                Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                                Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                                Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
                                ExecQuery;
                                FormaPago := FieldByName['FORMA_PAGO'].AsString;
                                FreeHandle;
                             finally
                                Free;
                             end;
                          end;
                       end;
                    end;

                    if ((FormaPago = '') and (FraProveedor_Existe = '')) then
                       ShowMessage(Format(_('No se encuentra la forma de pago para este proveedor en el ejercicio %d. No se importará este registro'), [Ejercicio]))
                    else
                    begin
                       // Si cambia el número de factura, creo una nueva cabecera.
                       if ((FraProveedor_ant <> FraProveedor) and (FraProveedor_Existe = '')) then
                       begin
                          Linea := 0;
                          id := DMMain.ContadorGen('ID_GES_CABECERAS_E');
                          RIG := DMMain.Contador_EECS(Serie, 'FAP');

                          with THYFIBQuery.Create(nil) do
                          begin
                             try
                                Close;
                                DataBase := DMMain.DataBase;
                                SQL.Add(' INSERT INTO VER_CABECERAS_FACTURA_PROV ');
                                SQL.Add(' (EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, ID_E, PROVEEDOR, FORMA_DE_PAGO, ENTRADA, NUM_FACTURA, FECHA, FECHA_CON, SU_REFERENCIA) ');
                                SQL.Add(' VALUES ');
                                SQL.Add(' (?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?ID_E, ?PROVEEDOR, ?FORMA_DE_PAGO, ?ENTRADA, ?NUM_FACTURA, ?FECHA, ?FECHA_CON, ?SU_REFERENCIA) ');
                                Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                                Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                                Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                                if (Unidades > 0) then
                                   Params.ByName['SERIE'].AsString := Serie
                                else
                                   Params.ByName['SERIE'].AsString := SerieAbono;
                                Params.ByName['TIPO'].AsString := 'FAP';
                                Params.ByName['RIG'].AsInteger := RIG;
                                Params.ByName['ID_E'].AsInteger := id;
                                Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
                                Params.ByName['FORMA_DE_PAGO'].AsString := FormaPago;
                                Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                                Params.ByName['NUM_FACTURA'].AsString := FraProveedor;
                                Params.ByName['SU_REFERENCIA'].AsString := 'IMPORTADO ' + DateToStr(Date);
                                Params.ByName['FECHA'].AsDateTime := Fecha;
                                Params.ByName['FECHA_CON'].AsDateTime := Fecha;
                                ExecQuery;
                                FreeHandle;
                             finally
                                Free;
                             end;
                          end;

                          FraProveedor_ant := FraProveedor;
                       end;

                       if (FraProveedor_Existe = '') then
                       begin
                          Inc(Linea);
                          with THYFIBQuery.Create(nil) do
                          begin
                             try
                                Close;
                                DataBase := DMMain.DataBase;
                                SQL.Add(' INSERT INTO VER_DETALLE_FACTURA_PROV ');
                                SQL.Add(' (EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, ID_E, ENTRADA, PAIS, ARTICULO, UNIDADES, P_COSTE, DESCUENTO, TIPO_IVA) ');
                                SQL.Add(' VALUES ');
                                SQL.Add(' (?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?LINEA, ?ID_E, ?ENTRADA, ?PAIS, ?ARTICULO, ?UNIDADES, ?P_COSTE, ?DESCUENTO, ?TIPO_IVA) ');
                                Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                                Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                                Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                                if (Unidades > 0) then
                                   Params.ByName['SERIE'].AsString := Serie
                                else
                                   Params.ByName['SERIE'].AsString := SerieAbono;
                                Params.ByName['TIPO'].AsString := 'FAP';
                                Params.ByName['RIG'].AsInteger := RIG;
                                Params.ByName['LINEA'].AsInteger := Linea;
                                Params.ByName['ID_E'].AsInteger := id;
                                Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                                Params.ByName['PAIS'].AsString := REntorno.Pais;
                                Params.ByName['ARTICULO'].AsString := Articulo;
                                Params.ByName['TIPO_IVA'].AsInteger := TipoIVA;
                                Params.ByName['UNIDADES'].AsFloat := Unidades;
                                Params.ByName['P_COSTE'].AsFloat := Precio;
                                Params.ByName['DESCUENTO'].AsFloat := Descuento;
                                ExecQuery;
                                FreeHandle;
                             finally
                                Free;
                             end;
                          end;
                       end;
                    end;
                 end;
              end;
           end;

           Inc(i);
        end;
     finally
        Free;
     end;
  end;
end;

procedure TDMImportarDocumentos.ImportarFacturaVentaPresident(Fichero, Serie, SerieAbono: string);
var
  ts : TStrings;
  i : integer;
  Ejercicio : integer;
  RIG : integer;
  Fecha : TDateTime;
  Articulo : string;
  TipoIVA : integer;
  Unidades : double;
  Precio : double;
  Descuento : double;
  id : integer;
  RIG_ant : integer;
  RIG_Existe : integer;
  Cliente : integer;
  Tercero : integer;
  Direccion : integer;
  Agente : integer;
  Transportista : integer;
  Tarifa : string;
  FormaPago : string;
  Linea : integer;
  Titulo : string;
begin
  {
         1         2         3         4         5         6         7         8         9         0
123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789
--------------------------------------------------------------------------------------------------------------
012 12011006R002   20131212  MOB                  1       1.0000       42.50000 0.00 3  12920131212V1                                                                2       0.0000REPUESTOS DE LA SEREN
012 12011006R002   20131212  REC                  1       1.0000       33.82000 0.00 3  12920131212V1                                                                2       0.0000REPUESTOS DE LA SEREN
012 12011006R002   20131212  PORTE                1       1.0000       14.00000 0.00 3  12920131212V1                                                                2       0.0000REPUESTOS DE LA SEREN
012 12011143M910   20131212  MOB                  1       1.0000       42.50000 0.00 3  12920131212V1                                                                2       0.0000JOSE ANTONIO MORENO M
012 12011143M910   20131212  REC                  1       1.0000        3.52000 0.00 3  12920131212V1                                                                2       0.0000JOSE ANTONIO MORENO M
012 12011243M910   20131212  MOB                  1       1.0000       42.50000 0.00 3  12920131212V1                                                                2       0.0000JOSE ANTONIO MORENO M
012 12011243M910   20131212  REC                  1       1.0000       32.16000 0.00 3  12920131212V1                                                                2       0.0000JOSE ANTONIO MORENO M
012 12011243M910   20131212  PORTE                1       1.0000       14.00000 0.00 3  12920131212V1                                                                2       0.0000JOSE ANTONIO MORENO M
012   101128I910   20131212  TXMU403              1      13.0000       97.00000 0.00 3  11520131212V1                                                                2       0.0000IVECO ESPA¥A S.L
012   101228I910   20131212  TXMU403              1       1.0000       97.00000 0.00 3  11520131212V1                                                                2       0.0000IVECO ESPA¥A S.L
012   101314V002   20131212  ACSA110              1       2.0000       46.56000 0.00 3  11520131212V1                                                                2       0.0000VIDEOCAR, SL
012   101314V002   20131212  TXKT680              1       6.0000       85.36000 0.00 3  11520131212V1                                                                2       0.0000VIDEOCAR, SL
012   101408E925   20131212  AMMI129              1       1.0000       34.92000 0.00 3  1 020131212V1                                                                2       0.0000ESTABLIMENTS COLL, S.

01-03 -> NO USAR
05-10 -> RIG (120112)
11-17 -> Ref. Cliente (06R002)
20-27 -> Fecha (20131212)
30-45 -> Articulo (MOB)
51-52 -> NO USAR
55-65 -> Cantidad (1.0000)
66-80 -> Precio (42.50000)
81-85 -> Decuento (0.00)
87-87 -> NO USAR
89-102-> NO USAR
}
  i := 0;
  id := 0;
  RIG_ant := 0;
  RIG_Existe := 0;
  Linea := 0;
  FormaPago := 'CON';

  Log('Fichero: ' + Fichero);
  Log('Serie: ' + Serie);
  Log('Serie Abono: ' + SerieAbono);
  Log('--------------------------------------------------');

  ts := TStringList.Create;
  with ts do
  begin
     try
        LoadFromFile(Fichero);

        while (Count > i) do
        begin
           // Inicializo datos
           Fecha := Now;
           Ejercicio := 0;
           Cliente := 0;
           Tercero := 0;
           Agente := 0;
           Transportista := 0;
           Tarifa := '';
           Direccion := 1;
           Articulo := '';
           Titulo := '';
           Unidades := 0;
           Precio := 0;
           Descuento := 0;
           TipoIVA := 0;

           Log('Linea: ' + IntToStr(i));
           Log('--------------------------------------------------');
           Log(ts[i]);
           if (Length(ts[i]) > 10) then
           begin
              RIG := StrToIntDef(Copy(ts[i], 5, 6), -1);
              Log('RIG: ' + IntToStr(RIG));
              try
                 Fecha := EncodeDate(StrToIntDef(Copy(ts[i], 20, 4), 1900), StrToIntDef(Copy(ts[i], 24, 2), 1), StrToIntDef(Copy(ts[i], 26, 2), 1));
                 Log('Fecha: ' + DateToStr(Fecha));
                 Ejercicio := YearOf(Fecha);
                 Log('Ejercicio: ' + IntToStr(Ejercicio));
                 Log('Referencia: ' + Copy(ts[i], 11, 6));
                 Cliente := DameClienteSegunReferencia(Trim(Copy(ts[i], 11, 6)));
                 Log('Cliente: ' + IntToStr(Cliente));
                 Tercero := DameTercero('CLI', Cliente);
                 Log('Tercero: ' + IntToStr(Tercero));
                 Agente := DameAgenteCliente(Cliente);
                 Log('Agente: ' + IntToStr(Agente));
                 Transportista := DameTransportistaCliente(Cliente);
                 Log('Transportista: ' + IntToStr(Transportista));
                 Tarifa := DameTarifaCliente(Cliente);
                 Log('Tarifa: ' + Tarifa);
                 Direccion := 1;
                 Articulo := Trim(Copy(ts[i], 30, 15));
                 Log('Articulo: ' + Articulo);
                 Titulo := DameTituloArticulo(Articulo);
                 Log('Titulo: ' + Titulo);
                 Unidades := StrToFloatDec(Copy(ts[i], 54, 13), '.');
                 Log('Unidades: ' + FloatToStr(Unidades));
                 Precio := StrToFloatDec(Copy(ts[i], 67, 13), '.');
                 Log('Precio: ' + FloatToStr(Precio));
                 Descuento := StrToFloatDec(Copy(ts[i], 82, 4), '.');
                 Log('Descuento: ' + FloatToStr(Descuento));
                 TipoIVA := DameTipoIVAArticulo(Articulo, REntorno.Empresa, Ejercicio);
                 Log('TipoIVA: ' + IntToStr(TipoIVA));
              except
                 on E: Exception do
                 begin
                    RIG := -1;
                    Log(E.Message);
                    ShowMessage(_('Ha ocurrido un error al obtener los datos de la linea') + #13#10 + E.Message);
                 end;
              end;

              if (RIG > 0) then
              begin
                 if (Cliente = 0) then
                 begin
                    ShowMessage(Format(_('El cliente con referencia %s no existe. No se importará este registro (factura %d)'), [Trim(Copy(ts[i], 11, 6)), RIG]));
                    Log('*** Cliente no existe');
                 end
                 else
                 begin
                    if (Titulo = '') then
                    begin
                       ShowMessage(Format(_('El artículo %s no existe. No se importará este registro en la factura %d'), [Articulo, RIG]));
                       Log('*** Articulo no existe');
                    end
                    else
                    begin
                       // Si cambia el número de factura, creo una nueva cabecera.
                       if ((RIG_ant <> RIG) and (RIG_Existe <> RIG)) then
                       begin
                          with THYFIBQuery.Create(nil) do
                          begin
                             try
                                Close;
                                DataBase := DMMain.DataBase;
                                SQL.Text := 'SELECT ID_S FROM GES_CABECERAS_S WHERE EMPRESA = ?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND SERIE=?SERIE AND TIPO=?TIPO AND RIG=?RIG';
                                Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                                Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                                Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                                if (Unidades > 0) then
                                   Params.ByName['SERIE'].AsString := Serie
                                else
                                   Params.ByName['SERIE'].AsString := SerieAbono;
                                Params.ByName['TIPO'].AsString := 'FAC';
                                Params.ByName['RIG'].AsInteger := RIG;
                                ExecQuery;
                                if (FieldByName['ID_S'].AsInteger > 0) then
                                   RIG_Existe := RIG
                                else
                                   RIG_Existe := 0;
                                FreeHandle;
                             finally
                                Free;
                             end;
                          end;

                          if (RIG_Existe = 0) then
                          begin
                             Linea := 0;
                             id := DMMain.ContadorGen('ID_GES_CABECERAS_S');

                             with THYFIBQuery.Create(nil) do
                             begin
                                try
                                   Close;
                                   DataBase := DMMain.DataBase;
                                   SQL.Add(' INSERT INTO VER_CABECERAS_FACTURA ');
                                   SQL.Add(' (EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, ID_S, CLIENTE, TERCERO, DIRECCION, ENTRADA, AGENTE, TRANSPORTISTA, TARIFA, FECHA) ');
                                   SQL.Add(' VALUES ');
                                   SQL.Add(' (?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?ID_S, ?CLIENTE, ?TERCERO, ?DIRECCION, ?ENTRADA, ?AGENTE, ?TRANSPORTISTA, ?TARIFA, ?FECHA) ');
                                   Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                                   Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                                   Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                                   if (Unidades > 0) then
                                      Params.ByName['SERIE'].AsString := Serie
                                   else
                                      Params.ByName['SERIE'].AsString := SerieAbono;
                                   Params.ByName['TIPO'].AsString := 'FAC';
                                   Params.ByName['RIG'].AsInteger := RIG;
                                   Params.ByName['ID_S'].AsInteger := id;
                                   Params.ByName['CLIENTE'].AsInteger := Cliente;
                                   Params.ByName['TERCERO'].AsInteger := Tercero;
                                   Params.ByName['DIRECCION'].AsInteger := Direccion;
                                   Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                                   Params.ByName['AGENTE'].AsInteger := Agente;
                                   Params.ByName['TRANSPORTISTA'].AsInteger := Transportista;
                                   Params.ByName['TARIFA'].AsString := Tarifa;
                                   Params.ByName['FECHA'].AsDateTime := Fecha;
                                   ExecQuery;
                                   FreeHandle;
                                finally
                                   Free;
                                end;
                             end;

                             RIG_ant := RIG;
                          end;
                       end;

                       if (RIG_Existe = 0) then
                       begin
                          Inc(Linea);
                          with THYFIBQuery.Create(nil) do
                          begin
                             try
                                Close;
                                DataBase := DMMain.DataBase;
                                SQL.Add(' INSERT INTO VER_DETALLE_FACTURA ');
                                SQL.Add(' (EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, ID_S, ENTRADA, ARTICULO, TITULO, TIPO_UNIDAD_LOGISTICA, UNIDADES, PRECIO, DESCUENTO, TIPO_IVA) ');
                                SQL.Add(' VALUES ');
                                SQL.Add(' (?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?LINEA, ?ID_S, ?ENTRADA, ?ARTICULO, ?TITULO, ?TIPO_UNIDAD_LOGISTICA, ?UNIDADES, ?PRECIO, ?DESCUENTO, ?TIPO_IVA) ');
                                Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                                Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                                Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                                if (Unidades > 0) then
                                   Params.ByName['SERIE'].AsString := Serie
                                else
                                   Params.ByName['SERIE'].AsString := SerieAbono;
                                Params.ByName['TIPO'].AsString := 'FAC';
                                Params.ByName['RIG'].AsInteger := RIG;
                                Params.ByName['LINEA'].AsInteger := Linea;
                                Params.ByName['ID_S'].AsInteger := id;
                                Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                                Params.ByName['ARTICULO'].AsString := Articulo;
                                Params.ByName['TITULO'].AsString := Titulo;
                                Params.ByName['TIPO_IVA'].AsInteger := TipoIVA;
                                Params.ByName['TIPO_UNIDAD_LOGISTICA'].AsString := 'GRNL';
                                Params.ByName['UNIDADES'].AsFloat := Unidades;
                                Params.ByName['PRECIO'].AsFloat := Precio;
                                Params.ByName['DESCUENTO'].AsFloat := Descuento;
                                ExecQuery;
                                FreeHandle;
                             finally
                                Free;
                             end;
                          end;
                       end;
                    end;
                 end;
              end;
           end;

           Inc(i);
        end;
     finally
        Free;
     end;
  end;
end;

procedure TDMImportarDocumentos.Log(s: string);
var
  F : TextFile;
  FileName : string;
begin
  FileName := ChangeFileExt(Application.ExeName, '.log');
  AssignFile(F, FileName);
  try
     Append(F);
  except
     try
        Rewrite(F);
     except
        on e: Exception do
           ShowMessage('Error al abrir fichero : ' + FileName + #13#10 + e.Message);
     end;
  end;
  WriteLn(F, FormatDatetime('[yyyy-mm-dd hh:nn:ss.zzz] ', Now) + s);
  CloseFile(F);
end;

function TDMImportarDocumentos.DameClienteSegunNIF(NIF: string): integer;
begin
  NIF := Copy(NIF, 1, 20);

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT CLIENTE FROM VER_CLIENTES_EF WHERE EMPRESA = ?EMPRESA AND NIF = ?NIF';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['NIF'].AsString := NIF;
        ExecQuery;
        Result := FieldByName['CLIENTE'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMImportarDocumentos.TraerDatosFTP(FTP_Host: string; FTP_Port: integer; FTP_User, FTP_Password, FTP_Carpeta, DirectorioDestino: string);
var
  s : TStrings;
  i : integer;
begin
  /// Conecta a FTP y trae todos los archivos.
  /// Una vez descargados borra/renombra los archivos del servidor FTP.

  // Log(ArchivoLog, 'Recepcion FTP');
  DMMain.LogIni('Recepcion FTP');
  DirectorioDestino := IncludeTrailingPathDelimiter(DirectorioDestino);
  DMMain.Log('DirectorioDestino: ' + DirectorioDestino);

  if (not DirectoryExists(DirectorioDestino)) then
     raise Exception.Create(_('No existe carpeta destino'));

  with TIdFTP.Create(Self) do
  begin
     try
        // ConnectTimeout := 10;
        Host := FTP_Host;
        DMMain.Log('Host: ' + Host);
        Port := FTP_Port;
        DMMain.Log('Port: ' + IntToStr(Port));
        Username := FTP_User;
        DMMain.Log('Username: ' + Username);
        Password := FTP_Password;
        DMMain.Log('Password: ' + '****' {Password});

        Passive := True;
        TransferType := ftASCII;

        Connect;
        DMMain.Log('FTP Conectado.');

        DMMain.Log('CurrentDir: ' + RetrieveCurrentDir);
        FTP_Carpeta := Trim(FTP_Carpeta);
        if (FTP_Carpeta <> '') then
        begin
           DMMain.Log('ChangeFTPDir ' + FTP_Carpeta);
           ChangeDir(FTP_Carpeta);
           DMMain.Log('CurrentDir: ' + RetrieveCurrentDir);
        end;

        // Traigo pedidos
        s := TStringList.Create;
        try
           List(s, '', False);
           for i := 0 to s.Count - 1 do
           begin
              DMMain.Log(Format('List[%d] - %s', [i, s[i]]));

              if (LowerCase(Copy(ExtractFileNAme(s[i]), 1, 6)) = 'pedido') and (LowerCase(ExtractFileExt(s[i])) = '.csv') then
              begin
                 DMMain.Log('Get ' + s[i]);
                 try
                    Get(s[i], DirectorioDestino + s[i], True, ResumeSupported);

                    DMMain.Log('Rename ' + s[i]);
                    Rename(s[i], s[i] + '.' + FormatDateTime('yyyymmdd_hhnnss', Now) + '.bak');
                 except
                    // Puede fallar si ya existe el fichero
                    on E: Exception do
                       ShowMessage(Format(_('Error obteniendo fichero %s'), [s[i]]) + #13#10 + E.Message);
                 end;
              end;
           end;
        finally
           s.Free;
        end;

        ChangeDirUp;
        Disconnect;
     finally
        Free;
     end;
  end;

  DMMain.LogFin('Recepcion FTP');
end;

procedure TDMImportarDocumentos.EnviarDatosFTP(FTP_Host: string; FTP_Port: integer; FTP_User, FTP_Password, FTP_Carpeta, Archivo: string);
begin
  /// Conecta a FTP y trae todos los archivos.
  /// Una vez descargados borra/renombra los archivos del servidor FTP.

  DMMain.LogIni('Envio FTP');
  with TIdFTP.Create(Self) do
  begin
     try
        // ConnectTimeout := 10;
        Host := FTP_Host;
        DMMain.Log('Host: ' + Host);
        Port := FTP_Port;
        DMMain.Log('Port: ' + IntToStr(Port));
        Username := FTP_User;
        DMMain.Log('Username: ' + Username);
        Password := FTP_Password;
        DMMain.Log('Password: ' + '****' {Password});

        Passive := True;
        TransferType := ftASCII;

        Connect;
        DMMain.Log('FTP Conectado.');

        DMMain.Log('CurrentDir: ' + RetrieveCurrentDir);
        FTP_Carpeta := Trim(FTP_Carpeta);
        if (FTP_Carpeta <> '') then
        begin
           DMMain.Log('ChangeFTPDir ' + FTP_Carpeta);
           ChangeDir(FTP_Carpeta);
           DMMain.Log('CurrentDir: ' + RetrieveCurrentDir);
        end;

        // Renombro archivo si existe
        try
           Rename(ExtractFileName(Archivo), ExtractFileName(Archivo) + '.' + FormatDateTime('yyyymmdd_hhnnss', Now) + '.bak');
        except
        end;

        try
           Put(Archivo, ExtractFileName(Archivo));
        except
           on E: Exception do
              ShowMessage(Format(_('Error enviando fichero %s'), [Archivo]) + #13#10 + E.Message);
        end;

        ChangeDirUp;
        Disconnect;
     finally
        Free;
     end;
  end;

  DMMain.LogFin('Envio FTP');
end;

procedure TDMImportarDocumentos.ImportarComprasAnver(Fichero, Serie: string; Log: TStrings);
var
  sl, Notas : TStrings;
  Columnas, Campos : TStrings;
  i : integer;
  HayError, ExisteAlbaran : boolean;
  ID_E, ID_A, Ejercicio, Proveedor : integer;
  Fecha : TDateTime;
  NombreProveedor, Almacen, ArticuloImportado, ClaseArticulo, Descripcion, Pedido, Unidad, NroAlbaranProv : string;
  Cantidad, Precio : double;
  ID_A_TextoLibre, ID_A_Generico : integer;
  // Nro de Columna dentro del CSV
  ColPedido : integer;
  ColNombreProveedor : integer;
  ColProveedor : integer;
  ColFecha : integer;
  ColArticulo : integer;
  ColClaseArticulo : integer;
  ColDescripcion : integer;
  ColCantidad : integer;
  ColPrecio : integer;
  ColNroAlbaranProv : integer;
  ColObservaciones : integer;

  procedure Dividir(CommaText: string; Valores: TStrings; Separador: char);
  var
     i : integer;
     s : string;
  begin
     Valores.Clear;
     s := '';

     for i := 1 to Length(CommaText) do
     begin
        if (CommaText[i] = Separador) then
        begin
           Valores.Add(s);
           s := '';
        end
        else
           s := s + CommaText[i];
     end;

     // Si queda algo lo agrego a la lista de valores
     if (s > '') then
        Valores.Add(s);
  end;

  function QuitaComillas(s: string): string;
  var
     i : integer;
  begin
     Result := '';

     for i := 1 to Length(s) do
     begin
        if (s[i] <> '"') then
           Result := Result + s[i];
     end;
  end;

  function StrToDateYYYYMMDDHHNNSS(s: string): TDateTime;
  begin                                     { 20231211114352213 }
     Result := EncodeDate(1900, 01, 01);    { YYYYMMDDHHNNSS--- }
     s := Trim(s);
     if (Length(s) >= 8) then
        Result := EncodeDate(StrToIntDef(Copy(s, 1, 4), 1900), StrToIntDef(Copy(s, 5, 2), 1), StrToIntDef(Copy(s, 7, 2), 1));
     if (Length(s) >= 10) then
        Result := RecodeHour(Result, StrToIntDef(Copy(s, 9, 2), 0));
     if (Length(s) >= 12) then
        Result := RecodeMinute(Result, StrToIntDef(Copy(s, 11, 2), 0));
     if (Length(s) >= 14) then
        Result := RecodeSecond(Result, StrToIntDef(Copy(s, 13, 2), 0));
  end;

  function DameUnidadArticulo(ID_A: integer): string;
  begin
     Result := '';
     if (ID_A > 0) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT UNIDADES FROM ART_ARTICULOS WHERE ID_A = :ID_A';
              Params.ByName['ID_A'].AsInteger := ID_A;
              ExecQuery;
              Result := FieldByName['UNIDADES'].AsString;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;

begin
  {
  0    1              2                    3                   4                          5                    6                 7             8                     9
  "Nº";"Nº DE PEDIDO";"CÓDIGO DE ARTÍCULO";"CLASE DE ARTÍCULO";"DESCRIPCIÓN DEL ARTÍCULO";"UNIDADES RECIBIDAS";"PRECIO DE COSTE";"N DE CUENTA";"NOMBRE DE PROVEEDOR";"OBSERVACIONES"
  "20250325145004513";"1250260";"010720101371100";"ADH PAP";"COATED 80 FSC / P1000 / YG60";"987.5";"0.35";"430";"ARCONVERT SAU";"M25023249"
  "Nº"            = Fecha del albaran y Nro Albaran Proveedor
  "N DE CUENTA"   = Nro. de Proveedor.
  }
  HayError := False;
  Columnas := TStringList.Create;
  Campos := TStringList.Create;
  sl := TStringList.Create;
  Notas := TStringList.Create;
  try
     sl.LoadFromFile(Fichero);

     ID_A_TextoLibre := DameIDArticulo(REntorno.ArtTextoLibre);
     ID_A_Generico := DameIDArticulo('030000000000');
     Almacen := DMMain.DameAlmacenDocumento('ALP', Serie);
     // Proyecto := StrToIntDef(LeeParametro('DOCVPRY001', Serie), 0);

     Log.Add('--------- --------- --------- --------- --------- --------- ');
     Log.Add(format(_('Abriendo fichero: %s'), [Fichero]));

     Columnas.Delimiter := ';';
     Campos.Delimiter := ';';

     // Obtengo nombre de campos para establecer su posicion
     // DelimitedText no funciona porque el espacio también se toma como separador de campos
     // Columnas.DelimitedText := sl[0];
     if (sl.Count > 0) then
        Dividir(sl[0], Columnas, ';');

     ColPedido := -1;
     ColNombreProveedor := -1;
     ColProveedor := -1;
     ColFecha := -1;
     ColArticulo := -1;
     ColClaseArticulo := -1;
     ColDescripcion := -1;
     ColCantidad := -1;
     ColPrecio := -1;
     ColNroAlbaranProv := -1;
     ColObservaciones := -1;

     for i := 0 to Columnas.Count - 1 do
     begin
        if QuitaComillas(Columnas[i]) = 'Nº' then
        begin
           ColFecha := i;
           ColNroAlbaranProv := i;
        end;
        if QuitaComillas(Columnas[i]) = 'Nº DE PEDIDO' then
           ColPedido := i;
        if QuitaComillas(Columnas[i]) = 'CÓDIGO DE ARTÍCULO' then
           ColArticulo := i;
        if QuitaComillas(Columnas[i]) = 'CLASE DE ARTÍCULO' then
           ColClaseArticulo := i;
        if QuitaComillas(Columnas[i]) = 'DESCRIPCIÓN DEL ARTÍCULO' then
           ColDescripcion := i;
        if QuitaComillas(Columnas[i]) = 'UNIDADES RECIBIDAS' then
           ColCantidad := i;
        if QuitaComillas(Columnas[i]) = 'PRECIO DE COSTE' then
           ColPrecio := i;
        if QuitaComillas(Columnas[i]) = 'N DE CUENTA' then
           ColProveedor := i;
        if QuitaComillas(Columnas[i]) = 'NOMBRE DE PROVEEDOR' then
           ColNombreProveedor := i;
        if QuitaComillas(Columnas[i]) = 'OBSERVACIONES' then
           ColObservaciones := i;
     end;

     // Recorro desde la segunda línea (evito titulos)
     // Primera pasada para buscar errores
     Log.Add('--------- --------- --------- --------- --------- --------- ');
     Log.Add(_('Verificando datos'));
     i := 1;
     while (i < sl.Count) do
     begin
        // DelimitedText no funciona porque el espacio también se toma como separador de campos
        // Campos.DelimitedText := sl[i];
        Dividir(sl[i], Campos, ';');

        if (Campos.Count < 1) then
        begin
           Log.Add('    ' + _('ATENCION - La linea tiene menos de 1 campo. Se ignora.') + #13#10 + sl[i]);
           sl.Delete(i);
           Dec(i);
           if i < 1 then
              i := 1;
        end
        else
        begin
           Pedido := '';
           NombreProveedor := '';
           {Proveedor := 0;
           Fecha := Today;}
           ClaseArticulo := '';
           ArticuloImportado := '';
           Descripcion := '';
           {Cantidad := 0;
           Precio := 0;}
           NroAlbaranProv := '';

           // "Nº";"Nº DE PEDIDO";"CÓDIGO DE ARTÍCULO";"DESCRIPCIÓN DEL ARTÍCULO";"UNIDADES RECIBIDAS";"PRECIO DE COSTE";"N DE CUENTA";"NOMBRE   DE PROVEEDOR";"OBSERVACIONES"
           if (ColPedido >= 0) then
              Pedido := Trim(QuitaComillas(Campos[ColPedido]))
           else
           begin
              Pedido := '';
              Log.Add('    ' + _('ERROR - No hay dato para la columan Pedido'));
              HayError := True;
           end;

           if (ColNombreProveedor >= 0) then
              NombreProveedor := Trim(Copy(QuitaComillas(Campos[ColNombreProveedor]), 1, 60))
           else
              NombreProveedor := '';

           if (ColProveedor >= 0) then
              Proveedor := StrToIntDef(QuitaComillas(Campos[ColProveedor]), 0)
           else
           begin
              Proveedor := 0;
              Log.Add('    ' + _('ERROR - No hay dato para la columan Proveedor'));
              HayError := True;
           end;

           if (ColFecha >= 0) then
              Fecha := StrToDateYYYYMMDDHHNNSS(QuitaComillas(Campos[ColFecha]))
           else
           begin
              Fecha := Today;
              Log.Add('    ' + _('ERROR - No hay dato para la columan Fecha'));
              HayError := True;
           end;

           if (ColClaseArticulo >= 0) then
              ClaseArticulo := Trim(QuitaComillas(Campos[ColClaseArticulo]))
           else
              ClaseArticulo := '';

           if (ColArticulo >= 0) then
              ArticuloImportado := Trim(QuitaComillas(Campos[ColArticulo]))
           else
              ArticuloImportado := '';

           if (ColDescripcion >= 0) then
              Descripcion := Trim(Copy(QuitaComillas(Campos[ColDescripcion]), 1, 256))
           else
              Descripcion := '';

           if (ColCantidad >= 0) then
              Cantidad := StrToFloatDec(QuitaComillas(Campos[ColCantidad]), '.')
           else
              Cantidad := 0;

           if (ColPrecio >= 0) then
              Precio := StrToFloatDec(QuitaComillas(Campos[ColPrecio]), '.')
           else
              Precio := 0;

           if (ColNroAlbaranProv >= 0) then
              NroAlbaranProv := Copy(QuitaComillas(Campos[ColNroAlbaranProv]), 1, 40)
           else
           begin
              NroAlbaranProv := '';
              Log.Add('    ' + _('ERROR - No hay dato para la columan Nro. Albaran'));
              HayError := True;
           end;

           // Total := StrToFloatDec(Campos[Columnas.IndexOf('TOTAL')], '.');

           Ejercicio := DameEjercicio(REntorno.Empresa, Fecha);

           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT ID_E FROM GES_CABECERAS_E_ALB WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL AND SERIE = :SERIE AND TIPO = :TIPO AND NUM_ALBARAN = :NUM_ALBARAN AND PROVEEDOR = :PROVEEDOR';
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                 Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                 Params.ByName['SERIE'].AsString := Serie;
                 Params.ByName['TIPO'].AsString := 'ALP';
                 Params.ByName['NUM_ALBARAN'].AsString := NroAlbaranProv;
                 Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
                 ExecQuery;
                 ExisteAlbaran := (FieldByName['ID_E'].AsInteger <> 0);
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           if (Ejercicio <> REntorno.Ejercicio) then
           begin
              Log.Add(format(_('ERROR - La fecha %s (%s) no se encuentra dentro del ejercicio. - Linea: %d'), [QuitaComillas(Campos[ColFecha]), FormatDateTime('dd/mm/yyyy', Fecha), i]));
              HayError := True;
           end
           else
           if ExisteAlbaran then
           begin
              Log.Add('    ' + format(_('ATENCION - El albaran %s para el proveedor %s ya existe. Se ignora.'), [NroAlbaranProv, NombreProveedor]));
              sl.Delete(i);
              Dec(i);
           end
           else
           if (DameTituloProveedor(Proveedor) = '') then
           begin
              Log.Add('    ' + format(_('ERROR - No existe el proveedor (%d) %s para el albaran %s') + #13#10 + sl[i], [Proveedor, NombreProveedor, NroAlbaranProv]));
              HayError := True;
           end;

           Inc(i);
        end;
     end;

     if (not HayError) and (sl.Count > 1) then
     begin
        // Recorro desde la segunda línea (evito titulos)
        // Segunda pasada para importar documentos
        Log.Add('--------- --------- --------- --------- --------- --------- ');
        Log.Add(_('Importando datos'));
        for i := 1 to sl.Count - 1 do
        begin
           // DelimitedText no funciona porque el espacio también se toma como separador de campos
           // Campos.DelimitedText := sl[i];
           Dividir(sl[i], Campos, ';');

           Pedido := '';
           NombreProveedor := '';
           //Proveedor := 0;
           //Fecha := Today;
           ClaseArticulo := '';
           ArticuloImportado := '';
           Descripcion := '';
           //Cantidad := 0;
           //Precio := 0;
           NroAlbaranProv := '';

           Log.Add(format(_('Procesando linea: %d'), [i]));
           // "Nº";"Nº DE PEDIDO";"CÓDIGO DE ARTÍCULO";"DESCRIPCIÓN DEL ARTÍCULO";"UNIDADES RECIBIDAS";"PRECIO DE COSTE";"N DE CUENTA";"NOMBRE   DE PROVEEDOR";"OBSERVACIONES"
           if (ColPedido >= 0) then
              Pedido := Trim(QuitaComillas(Campos[ColPedido]))
           else
              Pedido := '';

           if (ColNombreProveedor >= 0) then
              NombreProveedor := Trim(Copy(QuitaComillas(Campos[ColNombreProveedor]), 1, 60))
           else
              NombreProveedor := '';

           if (ColProveedor >= 0) then
              Proveedor := StrToIntDef(QuitaComillas(Campos[ColProveedor]), 0)
           else
              Proveedor := 0;

           if (ColFecha >= 0) then
              Fecha := StrToDateYYYYMMDDHHNNSS(QuitaComillas(Campos[ColFecha]))
           else
              Fecha := Today;

           if (ColClaseArticulo >= 0) then
              ClaseArticulo := Trim(QuitaComillas(Campos[ColClaseArticulo]))
           else
              ClaseArticulo := '';

           if (ColArticulo >= 0) then
              ArticuloImportado := Trim(QuitaComillas(Campos[ColArticulo]))
           else
              ArticuloImportado := '';

           if (ColDescripcion >= 0) then
              Descripcion := Trim(Copy(QuitaComillas(Campos[ColDescripcion]), 1, 256))
           else
              Descripcion := '';

           if (ColCantidad >= 0) then
              Cantidad := StrToFloatDec(QuitaComillas(Campos[ColCantidad]), '.')
           else
              Cantidad := 0;

           if (ColPrecio >= 0) then
              Precio := StrToFloatDec(QuitaComillas(Campos[ColPrecio]), '.')
           else
              Precio := 0;

           if (ColNroAlbaranProv >= 0) then
              NroAlbaranProv := Copy(QuitaComillas(Campos[ColNroAlbaranProv]), 1, 40)
           else
              NroAlbaranProv := '';

           // Total := StrToFloatDec(Campos[Columnas.IndexOf('TOTAL')], '.');

           Notas.Clear;
              {
              if (Trim(Campos[6]) > '') then
                 Notas.Add(Format(_('Nro. de Cuenta: %s'), [Trim(Campos[ColProveedor])]));
              if (Trim(Campos[8]) > '') then
                 Notas.Add(Format(_('OBSERVACIONES: %s'), [Trim(Campos[ColObservaciones])]));
              }

           Ejercicio := DameEjercicio(REntorno.Empresa, Fecha);

           // Verifico si existe el artículo
           ID_A := DameIDArticulo(ArticuloImportado);
           if (ID_A = 0) then
              ID_A := DameIDArticulo(Copy(ArticuloImportado, 1, Pos('/', ArticuloImportado) - 1));
           if (ID_A = 0) then
              ID_A := DameIDArticulo(DMMain.DameArticuloDesdeAlfa(ArticuloImportado, 8));

           if (ID_A = 0) then
           begin
              ID_A := CreaArticuloAnver(ArticuloImportado, Descripcion, '', ClaseArticulo, Fecha, Log);

                 (*
                 Log.Add('    ' + '*** *** *** *** *** *** *** *** *** *** ');
                 Log.Add('    ' + '*** *** *** *** *** *** *** *** *** *** ');
                 Log.Add('    ' + format(_('ATENCION - No existe articulo %s'), [ArticuloImportado]));
                 Log.Add('               ' + Descripcion);
                 Log.Add('    ' + '*** *** *** *** *** *** *** *** *** *** ');
                 Log.Add('    ' + '*** *** *** *** *** *** *** *** *** *** ');
                 if Copy(ArticuloImportado, 1, 2) = '03' then
                    ID_A := ID_A_Generico
                 else
                    ID_A := ID_A_TextoLibre;
                 *)
           end;

           // Obtengo unidad de medida para ver si tengo que dividir por 1000
           Unidad := DameUnidadArticulo(ID_A);
           if (Unidad = 'K') then
              Cantidad := Cantidad / 1000;

           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT ID_E FROM GES_CABECERAS_E_ALB WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL AND SERIE = :SERIE AND TIPO = :TIPO AND NUM_ALBARAN = :NUM_ALBARAN';
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                 Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                 Params.ByName['SERIE'].AsString := Serie;
                 Params.ByName['TIPO'].AsString := 'ALP';
                 Params.ByName['NUM_ALBARAN'].AsString := NroAlbaranProv;
                 ExecQuery;
                 ID_E := FieldByName['ID_E'].AsInteger;
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           if (ID_E = 0) then
           begin
              Log.Add('    ' + format(_('Creando cabecera de albaran %s'), [NroAlbaranProv]));

              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' SELECT ID_E FROM INS_CABECERA_COMPRA( ');
                    SQL.Add(' :EMPRESA, :EJERCICIO, :CANAL, :SERIE, ''ALP'', :PROVEEDOR, :REFERENCIA, ');
                    SQL.Add(' :ALMACEN, :FECHA_DOC, :ENTRADA, :NUM_ALBARAN_FACTURA) ');
                    Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                    Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                    Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                    Params.ByName['SERIE'].AsString := Serie;
                    Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
                    Params.ByName['REFERENCIA'].AsString := Copy('PED. ' + Pedido, 1, 40);
                    Params.ByName['ALMACEN'].AsString := Almacen;
                    Params.ByName['FECHA_DOC'].AsDateTime := Fecha;
                    Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                    Params.ByName['NUM_ALBARAN_FACTURA'].AsString := NroAlbaranProv;
                    ExecQuery;
                    ID_E := FieldByName['ID_E'].AsInteger;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;

              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' UPDATE GES_CABECERAS_E ');
                    SQL.Add(' SET ');
                    SQL.Add(' ORIGEN_DOCUMENTO = :ORIGEN_DOCUMENTO ');
                    if (Trim(Notas.Text) > '') then
                       SQL.Add(' ,NOTAS = :NOTAS ');
                    SQL.Add(' WHERE ');
                    SQL.Add(' ID_E = :ID_E ');
                    Params.ByName['ID_E'].AsInteger := ID_E;
                    Params.ByName['ORIGEN_DOCUMENTO'].AsString := 'ETH';
                    if (Trim(Notas.Text) > '') then
                       Params.ByName['NOTAS'].AsString := Notas.Text;
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;
           end;

           Log.Add('    ' + format(_('Creando linea de albaran para articulo %s x %d'), [ArticuloImportado, Trunc(Cantidad)]));
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'EXECUTE PROCEDURE WEB_INS_DETALLE_COMPRA(:ID_E, :ID_A, :TITULO, :UNIDADES, NULL, :PRECIO, :DESCUENTO)';
                 Params.ByName['ID_E'].AsInteger := ID_E;
                 Params.ByName['ID_A'].AsInteger := ID_A;
                 Params.ByName['TITULO'].AsString := Descripcion;
                 Params.ByName['UNIDADES'].AsFloat := Cantidad;
                 Params.ByName['PRECIO'].AsFloat := Precio;
                 Params.ByName['DESCUENTO'].AsFloat := 0;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;
     end;
  finally
     sl.Free;
     Columnas.Free;
     Campos.Free;
     Notas.Free;
  end;

  if (not HayError) then
  begin
     Log.Add('--------- --------- --------- --------- --------- --------- ');
     Log.Add(_('Renombrando fichero'));
     if CopyFileTo(Fichero, ChangeFileExt(Fichero, FormatDateTime('_yyyymmdd-hhnnss', Now) + '.bak')) then
        DeleteFile(PChar(Fichero))
     else
        Log.Add('   ' + _('ERROR - No se ha podido renombrar el fichero'));
  end;

  Log.Add('--------- --------- --------- --------- --------- --------- ');
  Log.Add('Impotacion finalizada');
  Log.Add('--------- --------- --------- --------- --------- --------- ');
end;

function TDMImportarDocumentos.CreaArticuloAnver(ArticuloImportado, Descripcion, CodigoArancelario, ClaseArticulo: string; Fecha: TDateTime; Log: TStrings): integer;
var
  ArticuloNuevo, FamiliaImportacion, SubfamiliaImportacion, UnidadImportacion : string;
  CuentaVenta : string;
  {
  Almacen, Articulo, ArticuloImportado, Descripcion, PedidoCliente, Unidad : string;
  RefCliente, Lote, CodigoArancelario, NombreContacto : string;
  Cantidad, Precio, Total : double;
  }
  ID_A, ID_A_TextoLibre : integer;
  ID_A_Generico : integer;
  A : TArticulo;
  QuitarSufijo : boolean;
begin
  ID_A_TextoLibre := DameIDArticulo(REntorno.ArtTextoLibre);
  ID_A_Generico := DameIDArticulo('030000000000');

  // Articulo no existe debo crearlo.
  // Primeros dos digitos es la familia
  // Si no es ninguna de las familias lo inserto en la familia "01" - Papel (Materia Prima).

  ID_A := 0;
  FamiliaImportacion := '';
  SubfamiliaImportacion := '';
  UnidadImportacion := '';
  ArticuloNuevo := '';
  CuentaVenta := '';
  QuitarSufijo := True;
  if Copy(ArticuloImportado, 1, 2) = '01' then
  begin
     // Familia "01" - Papel (Materia Prima)
     FamiliaImportacion := '01';
     SubfamiliaImportacion := '';

     if ClaseArticulo = 'ADH PAP' then
        SubfamiliaImportacion := 'PAPEL';
     if ClaseArticulo = 'ADH SIN' then
        SubfamiliaImportacion := 'SINT';
     if ClaseArticulo = 'FOIL' then
        SubfamiliaImportacion := 'FOIL';
  end
  else
  if Copy(ArticuloImportado, 1, 2) = '02' then
  begin
     // Ribbon
     FamiliaImportacion := '02';
     SubfamiliaImportacion := '02';
  end
  else
  if Copy(ArticuloImportado, 1, 2) = '03' then
  begin
     // Familia "03" - Etiquetas
     FamiliaImportacion := '03';

     // Si la descripcion del articulo contiene "ROLLO" la unidade de medida debe ser "Unidad" de lo contraro Millar (K)
     if not (Pos('ROLLO', UpperCase(Descripcion)) > 0) then
        UnidadImportacion := 'K';

     // Tercer digito es la subfamilia
     {
     SUBFAMILIA  |  DELFOS  |  ETHIQ
     ------------+----------+-------
     NEUTRA      |     N    |    1
     IMPRESA     |     I    |    2
     MULTICAPA   |    ML    |    3
     BOOKLET     |    BK    |    4
     SLEEVE      |    SL    |    5
     }

     SubfamiliaImportacion := Copy(ArticuloImportado, 3, 1);
     if (SubfamiliaImportacion = '1') then
        SubfamiliaImportacion := 'N'
     else
     if (SubfamiliaImportacion = '2') then
        SubfamiliaImportacion := 'I'
     else
     if (SubfamiliaImportacion = '3') then
        SubfamiliaImportacion := 'ML'
     else
     if (SubfamiliaImportacion = '4') then
        SubfamiliaImportacion := 'BK'
     else
     if (SubfamiliaImportacion = '5') then
        SubfamiliaImportacion := 'SL'
     else
     if (SubfamiliaImportacion = '6') then
        SubfamiliaImportacion := 'PL'
     else
     if (SubfamiliaImportacion = '7') then
     begin
        SubfamiliaImportacion := 'AW';
        CuentaVenta := '700100000';
     end;
  end
  else
  if Copy(ArticuloImportado, 1, 2) = '041' then
  begin
     // Material Gráfico Externo
     FamiliaImportacion := '18';
     SubfamiliaImportacion := '18';
  end
  else
  if Copy(ArticuloImportado, 1, 2) = '04' then
  begin
     // Hojas Laser
     FamiliaImportacion := '15';
     SubfamiliaImportacion := '15';
  end
  else
  if Copy(ArticuloImportado, 1, 2) = '07' then
  begin
     // Maquinas y Accesorios
     FamiliaImportacion := '07';

     // Tercer digito es la subfamilia
     {
     SUBFAMILIA  |  DELFOS  |  ETHIQ
     ------------+----------+-------
     MAQUINA FAB |     0    |    0
     RECAMBIOS   |     1    |    1
     IMPR. TT    |     2    |    2
     RECAMB. IMP |     3    |    3
     CARNETS     |     4    |    4
     }

     SubfamiliaImportacion := Copy(ArticuloImportado, 3, 1);
     if (SubfamiliaImportacion = '0') then
        SubfamiliaImportacion := '0'
     else
     if (SubfamiliaImportacion = '1') then
        SubfamiliaImportacion := '1'
     else
     if (SubfamiliaImportacion = '2') then
        SubfamiliaImportacion := '2'
     else
     if (SubfamiliaImportacion = '3') then
        SubfamiliaImportacion := '3'
     else
     if (SubfamiliaImportacion = '4') then
        SubfamiliaImportacion := '4';
  end
  else
  if Copy(ArticuloImportado, 1, 2) = '08' then
  begin
     // Packaging
     FamiliaImportacion := '08';
     SubfamiliaImportacion := '08';
  end
  else
  if Copy(ArticuloImportado, 1, 2) = '14' then
  begin
     // Tintas
     FamiliaImportacion := '04';
     SubfamiliaImportacion := '04';
  end
  else
  if Copy(ArticuloImportado, 1, 2) = '11' then
  begin
     // Programas
     FamiliaImportacion := '11';
     SubfamiliaImportacion := '';
  end
  else
  if Copy(ArticuloImportado, 1, 1) = '9' then
  begin
     // Indefinido
     FamiliaImportacion := 'VAR';
     SubfamiliaImportacion := '';
  end
  else
  if (Copy(ArticuloImportado, 1, 3) = '090') then
  begin
     if (Pos('/', ArticuloImportado) > 0) then
        ArticuloImportado := Copy(ArticuloImportado, 1, Pos('/', ArticuloImportado) - 1)
     else
     if (Pos('-', ArticuloImportado) > 0) then
        ArticuloImportado := Copy(ArticuloImportado, 1, Pos('-', ArticuloImportado) - 1)
     else
        ArticuloImportado := Trim(ArticuloImportado);

     if (Copy(ArticuloImportado, Length(ArticuloImportado), 1) = '1') then
     begin
        // Troqueles
        FamiliaImportacion := '05';
        SubfamiliaImportacion := '05';
     end
     else
     if (Copy(ArticuloImportado, Length(ArticuloImportado), 1) = '2') then
     begin
        // Grabados
        FamiliaImportacion := '12';
        SubfamiliaImportacion := '12';
     end
     else
     if (Copy(ArticuloImportado, Length(ArticuloImportado), 1) = '3') then
     begin
        // Portes
        FamiliaImportacion := 'PORTS';
        SubfamiliaImportacion := 'PORTS';
     end
     else
     if (Copy(ArticuloImportado, Length(ArticuloImportado), 1) = '6') then
     begin
        // Serigrafia
        FamiliaImportacion := '17';
        SubfamiliaImportacion := 'P';
     end;
  end
  else
  if Copy(ArticuloImportado, 1, 1) = 'P' then
  begin
     // Indefinido
     FamiliaImportacion := '16';
     SubfamiliaImportacion := 'ETIQU';
  end
  else
  if Copy(ArticuloImportado, 1, 2) = '00' then
  begin
     // Indefinido
     FamiliaImportacion := '';
     SubfamiliaImportacion := '';
  end
  else
  if Copy(ArticuloImportado, 1, 2) = 'GR' then
  begin
     // Grabados
     FamiliaImportacion := '12';
     SubfamiliaImportacion := '12';
     QuitarSufijo := False;
  end
  else
  if Copy(ArticuloImportado, 1, 2) = 'RL' then
  begin
     // Relieves
     FamiliaImportacion := '18';
     SubfamiliaImportacion := '18';
     QuitarSufijo := False;
  end
  else
  if Copy(ArticuloImportado, 1, 2) = 'SE' then
  begin
     // Serigrafia
     FamiliaImportacion := '17';
     SubfamiliaImportacion := '17';
     QuitarSufijo := False;
  end
  else
  if Copy(ArticuloImportado, 1, 2) = 'ST' then
  begin
     // Stamping
     FamiliaImportacion := '19';
     SubfamiliaImportacion := '19';
     QuitarSufijo := False;
  end
  else
  if Copy(ArticuloImportado, 1, 2) = 'TR' then
  begin
     // Troqueles
     FamiliaImportacion := '05';
     SubfamiliaImportacion := '05';
     QuitarSufijo := False;
  end
  else
  begin
     // Resto de familias a la "01"
     FamiliaImportacion := '01';
     SubfamiliaImportacion := '';

     // El artículo será el siguiente despues del "01000_______"
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT MAX(ARTICULO) FROM ART_ARTICULOS ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' ARTICULO STARTING WITH ''01000'' AND ');
           SQL.Add(' CHAR_LENGTH(ARTICULO) = 12 ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           ExecQuery;

           if (StrToIntDef(Copy(FieldByName['MAX'].AsString, 6, 7), -1) = -1) then
           begin
              // Si no llega un codigo numerico evito error utilizando el articulo Texto Libre
              FamiliaImportacion := '';
              SubfamiliaImportacion := '';
           end
           else
           begin
              ArticuloNuevo := '01000' + format('%7.7d', [StrToIntDef(Copy(FieldByName['MAX'].AsString, 6, 7), -1) + 1]);
           end;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if (FamiliaImportacion = '') then
  begin
     ID_A := ID_A_TextoLibre;
     Log.Add('    ' + '*** *** *** *** *** *** *** *** *** *** ');
     Log.Add('    ' + '*** *** *** *** *** *** *** *** *** *** ');
     Log.Add('    ' + format(_('ATENCION - No existe articulo %s'), [ArticuloImportado]));
     Log.Add('               ' + Descripcion);
     Log.Add('    ' + '*** *** *** *** *** *** *** *** *** *** ');
     Log.Add('    ' + '*** *** *** *** *** *** *** *** *** *** ');
  end
  else
  begin
     InicializaArticulo(A);
     with A do
     begin
        Ejercicio := DameEjercicio(REntorno.Empresa, Fecha);
        if ((FamiliaImportacion = '01') and (ArticuloNuevo <> '')) then
           Articulo := ArticuloNuevo
        else
        begin
           if QuitarSufijo and (Pos('/', ArticuloImportado) > 0) then
              Articulo := Copy(ArticuloImportado, 1, Pos('/', ArticuloImportado) - 1)
           else
           if QuitarSufijo and (Pos('-', ArticuloImportado) > 0) then
              Articulo := Copy(ArticuloImportado, 1, Pos('-', ArticuloImportado) - 1)
           else
              Articulo := Trim(ArticuloImportado);
        end;
        Titulo := Descripcion;
        Familia := FamiliaImportacion;
        Subfamilia := SubfamiliaImportacion;
        unidades := UnidadImportacion;
        alfa_8 := ArticuloImportado;
        codigo_intra := CodigoArancelario;
        TipoIVA := 1;
        cta_ventas := CuentaVenta;
     end;
     CreaArticulo(A);

     ID_A := A.ID_A;
  end;

  Result := ID_A;
end;

procedure TDMImportarDocumentos.ImportarVentasAnver(Fichero, Serie: string; Log: TStrings);
var
  sl, Notas, DirEntregaManual : TStrings;
  Columnas, Campos : TStrings;
  i : integer;
  s : string;
  HayError, ExisteAlbaran : boolean;
  ID_S, ID_DETALLES_S, ID_A, Proyecto, RIG, Ejercicio, Cliente, Contacto : integer;
  Fecha : TDateTime;
  Almacen, Articulo, ArticuloImportado, ArticuloNuevo, ClaseArticulo, FamiliaImportacion : string;
  SubfamiliaImportacion, UnidadImportacion, Descripcion, PedidoCliente, Unidad : string;
  RefCliente, Lote, CodigoArancelario, NombreContacto, CodigoTransportista : string;
  Cantidad, Precio, Total : double;
  ID_A_TextoLibre, ID_A_Generico : integer;
  A : TArticulo;
  Transportista : integer;

  procedure Dividir(CommaText: string; Valores: TStrings; Separador: char);
  var
     i : integer;
     s : string;
  begin
     Valores.Clear;
     s := '';

     for i := 1 to Length(CommaText) do
     begin
        if (CommaText[i] = Separador) then
        begin
           Valores.Add(s);
           s := '';
        end
        else
           s := s + CommaText[i];
     end;

     // Si queda algo lo agrego a la lista de valores
     if (s > '') then
        Valores.Add(s);
  end;

  function DameUnidadArticulo(ID_A: integer): string;
  begin
     Result := '';
     if (ID_A > 0) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT UNIDADES FROM ART_ARTICULOS WHERE ID_A = :ID_A';
              Params.ByName['ID_A'].AsInteger := ID_A;
              ExecQuery;
              Result := FieldByName['UNIDADES'].AsString;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;

  function DameTransportistaETHIC(CodigoTransportista: string): integer;
  begin
     /// El codigo de transportista ETHIC está en el campo ALFA_8 del acreedor tipo 7 (Transportista)

     Result := 0;
     if (CodigoTransportista > '') then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT ACREEDOR FROM EMP_ACREEDORES WHERE EMPRESA = :EMPRESA AND TIPO = 7 AND ALFA_8 = :ALFA_8';
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['ALFA_8'].AsString := CodigoTransportista;
              ExecQuery;
              Result := FieldByName['ACREEDOR'].AsInteger;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;

  function ReemplazaAcentos(texto: string): string;
  begin
     // Acento agudo
     texto := StringReplace(texto, 'á', '_', [rfReplaceAll]);
     texto := StringReplace(texto, 'é', '_', [rfReplaceAll]);
     texto := StringReplace(texto, 'í', '_', [rfReplaceAll]);
     texto := StringReplace(texto, 'ó', '_', [rfReplaceAll]);
     texto := StringReplace(texto, 'ú', '_', [rfReplaceAll]);

     texto := StringReplace(texto, 'Á', '_', [rfReplaceAll]);
     texto := StringReplace(texto, 'É', '_', [rfReplaceAll]);
     texto := StringReplace(texto, 'Í', '_', [rfReplaceAll]);
     texto := StringReplace(texto, 'Ó', '_', [rfReplaceAll]);
     texto := StringReplace(texto, 'Ú', '_', [rfReplaceAll]);

     // Acento grave
     texto := StringReplace(texto, 'à', '_', [rfReplaceAll]);
     texto := StringReplace(texto, 'è', '_', [rfReplaceAll]);
     texto := StringReplace(texto, 'ì', '_', [rfReplaceAll]);
     texto := StringReplace(texto, 'ò', '_', [rfReplaceAll]);
     texto := StringReplace(texto, 'ù', '_', [rfReplaceAll]);

     texto := StringReplace(texto, 'À', '_', [rfReplaceAll]);
     texto := StringReplace(texto, 'È', '_', [rfReplaceAll]);
     texto := StringReplace(texto, 'Ì', '_', [rfReplaceAll]);
     texto := StringReplace(texto, 'Ò', '_', [rfReplaceAll]);
     texto := StringReplace(texto, 'Ù', '_', [rfReplaceAll]);

     // Dieresis
     texto := StringReplace(texto, 'ä', '_', [rfReplaceAll]);
     texto := StringReplace(texto, 'ë', '_', [rfReplaceAll]);
     texto := StringReplace(texto, 'ï', '_', [rfReplaceAll]);
     texto := StringReplace(texto, 'ö', '_', [rfReplaceAll]);
     texto := StringReplace(texto, 'ü', '_', [rfReplaceAll]);

     texto := StringReplace(texto, 'Ä', '_', [rfReplaceAll]);
     texto := StringReplace(texto, 'Ë', '_', [rfReplaceAll]);
     texto := StringReplace(texto, 'Ï', '_', [rfReplaceAll]);
     texto := StringReplace(texto, 'Ö', '_', [rfReplaceAll]);
     texto := StringReplace(texto, 'Ü', '_', [rfReplaceAll]);

     // Acento circunflejo
     texto := StringReplace(texto, 'â', '_', [rfReplaceAll]);
     texto := StringReplace(texto, 'ê', '_', [rfReplaceAll]);
     texto := StringReplace(texto, 'î', '_', [rfReplaceAll]);
     texto := StringReplace(texto, 'ô', '_', [rfReplaceAll]);
     texto := StringReplace(texto, 'û', '_', [rfReplaceAll]);

     texto := StringReplace(texto, 'Â', '_', [rfReplaceAll]);
     texto := StringReplace(texto, 'Ê', '_', [rfReplaceAll]);
     texto := StringReplace(texto, 'Î', '_', [rfReplaceAll]);
     texto := StringReplace(texto, 'Ô', '_', [rfReplaceAll]);
     texto := StringReplace(texto, 'Û', '_', [rfReplaceAll]);

     // Acento tilde
     texto := StringReplace(texto, 'ã', '_', [rfReplaceAll]);
     texto := StringReplace(texto, 'õ', '_', [rfReplaceAll]);
     texto := StringReplace(texto, 'ñ', '_', [rfReplaceAll]);

     texto := StringReplace(texto, 'Ã', '_', [rfReplaceAll]);
     texto := StringReplace(texto, 'Õ', '_', [rfReplaceAll]);
     texto := StringReplace(texto, 'Ñ', '_', [rfReplaceAll]);

     // Otros
     texto := StringReplace(texto, 'ç', '_', [rfReplaceAll]);
     texto := StringReplace(texto, 'Ç', '_', [rfReplaceAll]);
     Result := texto;
  end;

begin
  {
  0         1                  2                3                     4                          5     6       7         8             9                 10          11       12     13
  NOALBARAN;NOCOMMANDE;PEDIDO_DEL_CLIENTE;CONTACTO;ALBARAN_ENTRADA_STOCK;ALBARAN_DEVOLUCION_CLIENTE;FECHA;CLIENTE;DIRECCION;CODIGO_POSTAL;CIUDAD;REFERENCIA;DESCRIPCION;CANTIDAD;PRECIO;TOTAL;REF_CLIENTE;LOTE;CÓDIGO_ARANCELARIO;CÓDIGO_TRANSPORTISTA
  240231;240125;4340098949;ROBERT STANCU;0;0;20240126 07:57:00;359;FEIXA LLARGA, 14/20;08040;BARCELONA;0320000292/001;ETQ. AKZO SIKKENS PRIMER SURF EP II  40022174 186x535;300;1699.97;509.99;40022174;170;EA
  240232;240160;FALTA EN LA COMANDA 240096;;0;0;20240126 08:11:00;415;DELS GERDS,, S/N;08395;SANT POL DE MAR;0320001762/001;ETQ. ACEITES MILLAS GYM BEAM CHOCOLATE SYRUP 320ML. FRONTAL 107.6x46;10000;24.7;247;751086 FR;203;TIP
  240232;240160;FALTA EN LA COMANDA 240096;;0;0;20240126 08:11:00;415;DELS GERDS,, S/N;08395;SANT POL DE MAR;0320001765/001;ETQ. ACEITES MILLAS GYM BEAM CHOCOLATE SYRUP 320ML. DORSAL 107.6x46;10000;24.7;247;751086 DR;203;REC
  }
  HayError := False;
  Columnas := TStringList.Create;
  Campos := TStringList.Create;
  sl := TStringList.Create;
  Notas := TStringList.Create;
  DirEntregaManual := TStringList.Create;
  try
     sl.LoadFromFile(Fichero);

     ID_A_TextoLibre := DameIDArticulo(REntorno.ArtTextoLibre);
     ID_A_Generico := DameIDArticulo('030000000000');
     Almacen := DMMain.DameAlmacenDocumento('ALB', Serie);
     Proyecto := StrToIntDef(LeeParametro('DOCVPRY001', Serie), 0);

     Log.Add('--------- --------- --------- --------- --------- --------- ');
     Log.Add(format(_('Abriendo fichero: %s'), [Fichero]));

     Columnas.Delimiter := ';';
     Campos.Delimiter := ';';

     // Obtengo nombre de campos para establecer su posicion
     // DelimitedText no funciona porque el espacio también se toma como separador de campos
     // Columnas.DelimitedText := sl[0];
     if (sl.Count > 0) then
        Dividir(sl[0], Columnas, ';');

     // Recorro desde la segunda línea (evito titulos)
     // Primera pasada para buscar errores
     Log.Add('--------- --------- --------- --------- --------- --------- ');
     Log.Add(_('Verificando datos'));
     i := 1;
     while (i < sl.Count) do
     begin
        // DelimitedText no funciona porque el espacio también se toma como separador de campos
        // Campos.DelimitedText := sl[i];
        Dividir(sl[i], Campos, ';');

        if (Campos.Count < 14) then
        begin
           Log.Add('    ' + _('ATENCION - La linea tiene menos de 10 campos. Se ignora.') + #13#10 + sl[i]);
           sl.Delete(i);
           Dec(i);
        end
        else
        begin
           // Otros campos disponibles: ;PEDIDO_DEL_CLIENTE;NOMPRENOMCONTACT;ALBARAN_ENTRADA_STOCK;ALBARAN_DEVOLUCION_CLIENTE;;;DIRECCION;CODIGO_POSTAL;CIUDAD;;;;;
           RIG := StrToIntDef(Campos[Columnas.IndexOf('NOALBARAN')], 0);
           Cliente := StrToIntDef(Campos[Columnas.IndexOf('CLIENTE')], 0);
           Fecha := StrToDateYYYYMMDD_HH_NN_SS(Campos[Columnas.IndexOf('FECHA')]);
           ClaseArticulo := '';
           ArticuloImportado := Trim(Campos[Columnas.IndexOf('REFERENCIA')]);
           Descripcion := Trim(Copy(Campos[Columnas.IndexOf('DESCRIPCION')], 1, 256));
           Cantidad := StrToFloatDec(Campos[Columnas.IndexOf('CANTIDAD')], ',');
           Precio := StrToFloatDec(Campos[Columnas.IndexOf('PRECIO')], ',');
           Total := StrToFloatDec(Campos[Columnas.IndexOf('TOTAL')], ',');
           RefCliente := '';
           if (Campos.Count > Columnas.IndexOf('REF_CLIENTE')) then
              RefCliente := Trim(Copy(Campos[Columnas.IndexOf('REF_CLIENTE')], 1, 40));
           Lote := '';
           if (Campos.Count > Columnas.IndexOf('LOTE')) then
              Lote := Trim(Copy(Campos[Columnas.IndexOf('LOTE')], 1, 40));
           CodigoArancelario := '';
           if (Campos.Count > Columnas.IndexOf('CÓDIGO_ARANCELARIO')) and (Columnas.IndexOf('CÓDIGO_ARANCELARIO') >= 0) then
              CodigoArancelario := Trim(Copy(Campos[Columnas.IndexOf('CÓDIGO_ARANCELARIO')], 1, 10));

           Ejercicio := DameEjercicio(REntorno.Empresa, Fecha);

           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT ID_S FROM GES_CABECERAS_S WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL AND SERIE = :SERIE AND TIPO = :TIPO AND RIG = :RIG';
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                 Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                 Params.ByName['SERIE'].AsString := Serie;
                 Params.ByName['TIPO'].AsString := 'ALB';
                 Params.ByName['RIG'].AsInteger := RIG;
                 ExecQuery;
                 ExisteAlbaran := (FieldByName['ID_S'].AsInteger <> 0);
                 FreeHandle;
              finally
                 Free;
              end;
           end;

           if (Ejercicio <> REntorno.Ejercicio) then
           begin
              Log.Add(format(_('ERROR - La fecha %s (%s) no se encuentra dentro del ejercicio. - Linea: %d'), [Campos[Columnas.IndexOf('FECHA')], FormatDateTime('dd/mm/yyyy', Fecha), i]));
              HayError := True;
           end
           else
           if ExisteAlbaran then
           begin
              Log.Add('    ' + format(_('ATENCION - El albaran %d ya existe. Se ignora.'), [RIG]));
              sl.Delete(i);
              Dec(i);
           end
           else
           if (DameTituloCliente(Cliente) = '') then
           begin
              Log.Add('    ' + format(_('ERROR - No existe el cliente %d para el albaran %d') + #13#10 + sl[i], [Cliente, RIG]));
              HayError := True;
           end;

           Inc(i);
        end;
     end;

     if (not HayError) and (sl.Count > 1) then
     begin
        // Recorro desde la segunda línea (evito titulos)
        // Segunda pasada para importar documentos
        Log.Add('--------- --------- --------- --------- --------- --------- ');
        Log.Add(_('Importando datos'));
        for i := 1 to sl.Count - 1 do
        begin
           // DelimitedText no funciona porque el espacio también se toma como separador de campos
           // Campos.DelimitedText := sl[i];
           Dividir(sl[i], Campos, ';');

           Log.Add(format(_('Procesando linea: %d'), [i]));
           if (Campos.Count >= 14) then
           begin
              RIG := StrToIntDef(Campos[Columnas.IndexOf('NOALBARAN')], 0);
              Cliente := StrToIntDef(Campos[Columnas.IndexOf('CLIENTE')], 0);
              Fecha := StrToDateYYYYMMDD_HH_NN_SS(Campos[Columnas.IndexOf('FECHA')]);
              ClaseArticulo := '';
              ArticuloImportado := Trim(Campos[Columnas.IndexOf('REFERENCIA')]);
              Descripcion := Trim(Copy(Campos[Columnas.IndexOf('DESCRIPCION')], 1, 256));
              Cantidad := StrToFloatDec(Campos[Columnas.IndexOf('CANTIDAD')], ',');
              Precio := StrToFloatDec(Campos[Columnas.IndexOf('PRECIO')], ',');
              Total := StrToFloatDec(Campos[Columnas.IndexOf('TOTAL')], ',');
              PedidoCliente := Trim(Copy(Campos[Columnas.IndexOf('PEDIDO_DEL_CLIENTE')], 1, 20));
              NombreContacto := '';
              if ((Campos.Count > Columnas.IndexOf('CONTACTO')) and (Columnas.IndexOf('CONTACTO') >= 0)) then
                 NombreContacto := Trim(Copy(Campos[Columnas.IndexOf('CONTACTO')], 1, 60));
              RefCliente := '';
              if (Campos.Count > Columnas.IndexOf('REF_CLIENTE')) then
              begin
                 RefCliente := Trim(Copy(Campos[Columnas.IndexOf('REF_CLIENTE')], 1, 40));
                 if (RefCliente <> '') then
                    Log.Add(format(_('RefCliente: %s'), [RefCliente]));
              end;
              Lote := '';
              if (Campos.Count > Columnas.IndexOf('LOTE')) then
              begin
                 Lote := Trim(Copy(Campos[Columnas.IndexOf('LOTE')], 1, 20));
                 if (Lote <> '') then
                    Log.Add(format(_('Lote: %s'), [Lote]));
              end;
              CodigoArancelario := '';
              if (Campos.Count > Columnas.IndexOf('CÓDIGO_ARANCELARIO')) and (Columnas.IndexOf('CÓDIGO_ARANCELARIO') >= 0) then
                 CodigoArancelario := Trim(Copy(Campos[Columnas.IndexOf('CÓDIGO_ARANCELARIO')], 1, 10));

              CodigoTransportista := '';
              if (Campos.Count > Columnas.IndexOf('CÓDIGO_TRANSPORTISTA')) and (Columnas.IndexOf('CÓDIGO_TRANSPORTISTA') >= 0) then
                 CodigoTransportista := Trim(Copy(Campos[Columnas.IndexOf('CÓDIGO_TRANSPORTISTA')], 1, 40));

              Notas.Clear;
              {
              if (Campos.Count > Columnas.IndexOf('CONTACTO')) then
                 if (Trim(Campos[Columnas.IndexOf('CONTACTO')]) > '') then
                    Notas.Add(Format(_('Contacto: %s'), [Trim(Campos[Columnas.IndexOf('CONTACTO')])]));
              if (Campos.Count > Columnas.IndexOf('DIRECCION')) then
                 if (Trim(Campos[Columnas.IndexOf('DIRECCION')]) > '') then
                    Notas.Add(Format(_('Direccion: %s'), [Trim(Campos[Columnas.IndexOf('DIRECCION')])]));
              if (Campos.Count > Columnas.IndexOf('CODIGO_POSTAL')) then
                 if (Trim(Campos[Columnas.IndexOf('CODIGO_POSTAL')]) > '') then
                    Notas.Add(Format(_('Cod. Postal: %s'), [Trim(Campos[Columnas.IndexOf('CODIGO_POSTAL')])]));
              if (Campos.Count > Columnas.IndexOf('CIUDAD')) then
                 if (Trim(Campos[Columnas.IndexOf('CIUDAD')]) > '') then
                    Notas.Add(Format(_('Ciudad: %s'), [Trim(Campos[Columnas.IndexOf('CIUDAD')])]));
              }

              Contacto := 0;
              if (NombreContacto > '') then
              begin
                 // Busco un contacto de ese cliente que coincida total o parcialmente con el nombre importado.
                 // Reemplazo acentos por "_"
                 // Busco Pérez como LIKE "%P_rez%"
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' SELECT 1, C.CONTACTO, TRIM(UPPER(C.NOMBRE || '' '' || C.APELLIDOS)) ');
                       SQL.Add(' FROM SYS_TERCEROS_CONTACTOS C ');
                       SQL.Add(' JOIN EMP_CLIENTES CC ON CC.TERCERO = C.TERCERO ');
                       SQL.Add(' WHERE ');
                       SQL.Add(' CC.EMPRESA = :EMPRESA AND ');
                       SQL.Add(' CC.CLIENTE = :CLIENTE AND ');
                       SQL.Add(' (TRIM(UPPER(C.NOMBRE || '' '' || C.APELLIDOS)) LIKE TRIM(UPPER(CAST(:NOMBRE_COMPLETO AS VARCHAR(60))))) ');
                       SQL.Add(' UNION ');
                       SQL.Add(' SELECT 2, C.CONTACTO, TRIM(UPPER(C.NOMBRE || '' '' || C.APELLIDOS)) ');
                       SQL.Add(' FROM SYS_TERCEROS_CONTACTOS C ');
                       SQL.Add(' JOIN EMP_CLIENTES CC ON CC.TERCERO = C.TERCERO ');
                       SQL.Add(' WHERE ');
                       SQL.Add(' CC.EMPRESA = :EMPRESA AND ');
                       SQL.Add(' CC.CLIENTE = :CLIENTE AND ');
                       SQL.Add(' (TRIM(UPPER(C.NOMBRE || '' '' || C.APELLIDOS)) LIKE TRIM(UPPER(CAST(:NOMBRE AS VARCHAR(60))))) ');
                       SQL.Add(' UNION ');
                       SQL.Add(' SELECT 3, C.CONTACTO, TRIM(UPPER(C.NOMBRE || '' '' || C.APELLIDOS)) ');
                       SQL.Add(' FROM SYS_TERCEROS_CONTACTOS C ');
                       SQL.Add(' JOIN EMP_CLIENTES CC ON CC.TERCERO = C.TERCERO ');
                       SQL.Add(' WHERE ');
                       SQL.Add(' CC.EMPRESA = :EMPRESA AND ');
                       SQL.Add(' CC.CLIENTE = :CLIENTE AND ');
                       SQL.Add(' (TRIM(UPPER(C.NOMBRE || '' '' || C.APELLIDOS)) LIKE TRIM(UPPER(CAST(:APELLIDOS AS VARCHAR(60))))) ');
                       Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                       Params.ByName['CLIENTE'].AsInteger := Cliente;
                       Params.ByName['NOMBRE_COMPLETO'].AsString := '%' + ReemplazaAcentos(Trim(NombreContacto)) + '%';
                       Params.ByName['NOMBRE'].AsString := '%' + ReemplazaAcentos(Trim(Copy(NombreContacto, 1, Pos(' ', NombreContacto) - 1))) + '%';
                       Params.ByName['APELLIDOS'].AsString := '%' + ReemplazaAcentos(Trim(Copy(NombreContacto, Pos(' ', NombreContacto) + 1, 60))) + '%';
                       ExecQuery;
                       Contacto := FieldByName['CONTACTO'].AsInteger;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;
              end;

              DirEntregaManual.Clear;
              if (Contacto = 0) then
              begin
                 if (NombreContacto > '') then
                    DirEntregaManual.Add(Format(_('Contacto: %s'), [NombreContacto]));
              end;
              if (Campos.Count > Columnas.IndexOf('DIRECCION')) then
                 if (Trim(Campos[Columnas.IndexOf('DIRECCION')]) > '') then
                    DirEntregaManual.Add(Format(_('%s'), [Trim(Campos[Columnas.IndexOf('DIRECCION')])]));
              if (Campos.Count > Columnas.IndexOf('CODIGO_POSTAL')) then
                 if (Trim(Campos[Columnas.IndexOf('CODIGO_POSTAL')]) > '') then
                    DirEntregaManual.Add(Format(_('%s'), [Trim(Campos[Columnas.IndexOf('CODIGO_POSTAL')])]));
              if (Campos.Count > Columnas.IndexOf('CIUDAD')) then
                 if (Trim(Campos[Columnas.IndexOf('CIUDAD')]) > '') then
                    DirEntregaManual.Add(Format(_('%s'), [Trim(Campos[Columnas.IndexOf('CIUDAD')])]));

              Ejercicio := DameEjercicio(REntorno.Empresa, Fecha);

              // Verifico si existe el artículo
              ID_A := DameIDArticulo(ArticuloImportado);
              if (ID_A = 0) then
                 ID_A := DameIDArticulo(Copy(ArticuloImportado, 1, Pos('/', ArticuloImportado) - 1));
              if (ID_A = 0) then
                 ID_A := DameIDArticulo(DMMain.DameArticuloDesdeAlfa(ArticuloImportado, 8));

              if (ID_A = 0) then
              begin
                 // Articulo no existe debo crearlo.
                 ID_A := CreaArticuloAnver(ArticuloImportado, Descripcion, CodigoArancelario, ClaseArticulo, Fecha, Log);

                 (* LLAMAMOS A CreaArticuloAnver()

                 // Primeros dos digitos es la familia
                 // Si no es ninguna de las familias lo inserto en la familia "01" - Papel (Materia Prima).

                 FamiliaImportacion := '';
                 SubfamiliaImportacion := '';
                 UnidadImportacion := '';
                 ArticuloNuevo := '';
                 if Copy(ArticuloImportado, 1, 2) = '01' then
                 begin
                    // Familia "01" - Papel (Materia Prima)
                    FamiliaImportacion := '01';
                    SubfamiliaImportacion := '';
                    { Debemos saber si es PAPEL o SINTETICO
                    SUBFAMILIA – PAPEL
                    CART, COU, DIV, ESPEC, FLUOR, JET, KRAFT, LASER, MATE, ORO, PLATA, REC, THERM

                    SUBFAMILIA – SINT
                    PE, PET, PP, PVC, ULTRA
                    }
                 end
                 else
                 if Copy(ArticuloImportado, 1, 2) = '02' then
                 begin
                    // Ribbon
                    FamiliaImportacion := '02';
                    SubfamiliaImportacion := '02';
                 end
                 else
                 if Copy(ArticuloImportado, 1, 2) = '03' then
                 begin
                    // Familia "03" - Etiquetas
                    FamiliaImportacion := '03';
                    UnidadImportacion := 'K';
                    // Tercer digito es la subfamilia
                    {
                    SUBFAMILIA  |  DELFOS  |  ETHIQ
                    ------------+----------+-------
                    NEUTRA      |     N    |    1
                    IMPRESA     |     I    |    2
                    MULTICAPA   |    ML    |    3
                    BOOKLET     |    BK    |    4
                    SLEEVE      |    SL    |    5
                    }

                    SubfamiliaImportacion := Copy(ArticuloImportado, 3, 1);
                    if (SubfamiliaImportacion = '1') then
                       SubfamiliaImportacion := 'N'
                    else
                    if (SubfamiliaImportacion = '2') then
                       SubfamiliaImportacion := 'I'
                    else
                    if (SubfamiliaImportacion = '3') then
                       SubfamiliaImportacion := 'ML'
                    else
                    if (SubfamiliaImportacion = '4') then
                       SubfamiliaImportacion := 'BK'
                    else
                    if (SubfamiliaImportacion = '5') then
                       SubfamiliaImportacion := 'SL'
                    else
                    if (SubfamiliaImportacion = '6') then
                       SubfamiliaImportacion := 'PL';
                 end
                 else
                 if Copy(ArticuloImportado, 1, 2) = '04' then
                 begin
                    // Hojas Laser
                    FamiliaImportacion := '15';
                    SubfamiliaImportacion := '15';
                 end
                 else
                 if Copy(ArticuloImportado, 1, 2) = '07' then
                 begin
                    // Maquinas y Accesorios
                    FamiliaImportacion := '07';

                    // Tercer digito es la subfamilia
                    {
                    SUBFAMILIA  |  DELFOS  |  ETHIQ
                    ------------+----------+-------
                    MAQUINA FAB |     0    |    0
                    RECAMBIOS   |     1    |    1
                    IMPR. TT    |     2    |    2
                    RECAMB. IMP |     3    |    3
                    CARNETS     |     4    |    4
                    }

                    SubfamiliaImportacion := Copy(ArticuloImportado, 3, 1);
                    if (SubfamiliaImportacion = '0') then
                       SubfamiliaImportacion := '0'
                    else
                    if (SubfamiliaImportacion = '1') then
                       SubfamiliaImportacion := '1'
                    else
                    if (SubfamiliaImportacion = '2') then
                       SubfamiliaImportacion := '2'
                    else
                    if (SubfamiliaImportacion = '3') then
                       SubfamiliaImportacion := '3'
                    else
                    if (SubfamiliaImportacion = '4') then
                       SubfamiliaImportacion := '4';
                 end
                 else
                 if Copy(ArticuloImportado, 1, 2) = '11' then
                 begin
                    // Programas
                    FamiliaImportacion := '11';
                    SubfamiliaImportacion := '';
                 end
                 else
                 if Copy(ArticuloImportado, 1, 1) = '9' then
                 begin
                    // Indefinido
                    FamiliaImportacion := 'VAR';
                    SubfamiliaImportacion := '';
                 end
                 else
                 if (Copy(ArticuloImportado, 1, 3) = '090') and (Copy(ArticuloImportado, Length(ArticuloImportado), 1) = '1') then
                 begin
                    // Troqueles
                    FamiliaImportacion := '05';
                    SubfamiliaImportacion := '05';
                 end
                 else
                 if (Copy(ArticuloImportado, 1, 3) = '090') and (Copy(ArticuloImportado, Length(ArticuloImportado), 1) = '2') then
                 begin
                    // Grabados
                    FamiliaImportacion := '12';
                    SubfamiliaImportacion := '12';
                 end
                 else
                 if (Copy(ArticuloImportado, 1, 3) = '090') and (Copy(ArticuloImportado, Length(ArticuloImportado), 1) = '6') then
                 begin
                    // Serigrafia
                    FamiliaImportacion := '17';
                    SubfamiliaImportacion := 'P';
                 end
                 else
                 if Copy(ArticuloImportado, 1, 1) = 'P' then
                 begin
                    // Indefinido
                    FamiliaImportacion := '16';
                    SubfamiliaImportacion := 'ETIQU';
                 end
                 else
                 if Copy(ArticuloImportado, 1, 2) = '00' then
                 begin
                    // Indefinido
                    FamiliaImportacion := '';
                    SubfamiliaImportacion := '';
                 end
                 else
                 begin
                    // Resto de familias a la "01"
                    FamiliaImportacion := '01';
                    SubfamiliaImportacion := '';

                    // El artículo será el siguiente despues del "01000_______"
                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add(' SELECT MAX(ARTICULO) FROM ART_ARTICULOS ');
                          SQL.Add(' WHERE ');
                          SQL.Add(' EMPRESA = :EMPRESA AND ');
                          SQL.Add(' ARTICULO STARTING WITH ''01000'' AND ');
                          SQL.Add(' CHAR_LENGTH(ARTICULO) = 12 ');
                          Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                          ExecQuery;

                          if (StrToIntDef(Copy(FieldByName['MAX'].AsString, 6, 7), -1) = -1) then
                          begin
                             // Si no llega un codigo numerico evito error utilizando el articulo Texto Libre
                             FamiliaImportacion := '';
                             SubfamiliaImportacion := '';
                          end
                          else
                          begin
                             ArticuloNuevo := '01000' + format('%7.7d', [StrToIntDef(Copy(FieldByName['MAX'].AsString, 6, 7), -1) + 1]);
                          end;
                          FreeHandle;
                       finally
                          Free;
                       end;
                    end;
                 end;

                 if (FamiliaImportacion = '') then
                 begin
                    ID_A := ID_A_TextoLibre;
                    Log.Add('    ' + '*** *** *** *** *** *** *** *** *** *** ');
                    Log.Add('    ' + '*** *** *** *** *** *** *** *** *** *** ');
                    Log.Add('    ' + format(_('ATENCION - No existe articulo %s'), [ArticuloImportado]));
                    Log.Add('               ' + Descripcion);
                    Log.Add('    ' + '*** *** *** *** *** *** *** *** *** *** ');
                    Log.Add('    ' + '*** *** *** *** *** *** *** *** *** *** ');
                 end
                 else
                 begin
                    InicializaArticulo(A);
                    with A do
                    begin
                       Ejercicio := Ejercicio;
                       if ((FamiliaImportacion = '01') and (ArticuloNuevo <> '')) then
                          Articulo := ArticuloNuevo
                       else
                          Articulo := Copy(ArticuloImportado, 1, Pos('/', ArticuloImportado) - 1);
                       Titulo := Descripcion;
                       Familia := FamiliaImportacion;
                       Subfamilia := SubfamiliaImportacion;
                       unidades := UnidadImportacion;
                       alfa_8 := ArticuloImportado;
                       codigo_intra := CodigoArancelario;
                       TipoIVA := 1;
                    end;
                    CreaArticulo(A);

                    ID_A := A.ID_A;
                 end;
                 *)
              end;

              Articulo := DameArticulo(ID_A);

              if ((ID_A <> ID_A_TextoLibre) and (RefCliente <> '')) then
              begin
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' UPDATE OR INSERT INTO ART_ARTICULOS_CODCLI ( ');
                       SQL.Add(' EMPRESA, ARTICULO, CLIENTE, CODIGO_CLIENTE) ');
                       SQL.Add(' VALUES ( ');
                       SQL.Add(' :EMPRESA, :ARTICULO, :CLIENTE, :CODIGO_CLIENTE) ');
                       SQL.Add(' MATCHING (EMPRESA, ARTICULO, CLIENTE) ');
                       Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                       Params.ByName['ARTICULO'].AsString := Articulo;
                       Params.ByName['CLIENTE'].AsInteger := Cliente;
                       Params.ByName['CODIGO_CLIENTE'].AsString := RefCliente;
                       ExecQuery;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;
              end;

              if ((ID_A <> ID_A_TextoLibre) and (CodigoArancelario <> '')) then
              begin
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' UPDATE ART_ARTICULOS ');
                       SQL.Add(' SET ');
                       SQL.Add(' CODIGO_INTRA = :CODIGO_INTRA ');
                       SQL.Add(' WHERE ');
                       SQL.Add(' ID_A = :ID_A ');
                       Params.ByName['ID_A'].AsInteger := ID_A;
                       Params.ByName['CODIGO_INTRA'].AsString := CodigoArancelario;
                       ExecQuery;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;
              end;

              // Obtengo unidad de medida para ver si tengo que dividir por 1000
              Unidad := DameUnidadArticulo(ID_A);
              if (Unidad = 'K') then
                 Cantidad := Cantidad / 1000;

              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'SELECT ID_S FROM GES_CABECERAS_S WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL AND SERIE = :SERIE AND TIPO = :TIPO AND RIG = :RIG';
                    Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                    Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
                    Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                    Params.ByName['SERIE'].AsString := Serie;
                    Params.ByName['TIPO'].AsString := 'ALB';
                    Params.ByName['RIG'].AsInteger := RIG;
                    ExecQuery;
                    ID_S := FieldByName['ID_S'].AsInteger;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;

              if (ID_S = 0) then
              begin
                 Log.Add('    ' + format(_('Creando cabecera de albaran %d'), [RIG]));
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' SELECT ID_S FROM WEB_INS_CABECERA_VENTA_9( ');
                       SQL.Add(' :USUARIOID, ''ALB'', :CLIENTE, :REFERENCIA, :ENTRADA, ');
                       SQL.Add(' :ALMACEN, :FECHA_DOC, :AGENTE, :SERIE, :RIG_IN, :EMPRESA, ');
                       SQL.Add(' :CANAL, 0, :DIRECCION, :PROYECTO, ');
                       SQL.Add(' 0, NULL, :OBSERVACIONES) ');
                       Params.ByName['USUARIOID'].AsInteger := REntorno.Usuario;
                       Params.ByName['CLIENTE'].AsInteger := Cliente;
                       Params.ByName['REFERENCIA'].AsString := '';
                       Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                       Params.ByName['ALMACEN'].AsString := Almacen;
                       Params.ByName['FECHA_DOC'].AsDateTime := Fecha;
                       Params.ByName['AGENTE'].AsInteger := 0;
                       Params.ByName['SERIE'].AsString := Serie;
                       Params.ByName['RIG_IN'].AsInteger := RIG;
                       Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                       Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                       Params.ByName['DIRECCION'].AsInteger := 0;
                       Params.ByName['PROYECTO'].AsInteger := Proyecto;
                       Params.ByName['OBSERVACIONES'].AsString := _('Importado') + ' ' + DateTimeToStr(Now);
                       ExecQuery;
                       ID_S := FieldByName['ID_S'].AsInteger;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;

                 Transportista := 0;
                 if (CodigoTransportista > '') then
                    Transportista := DameTransportistaETHIC(CodigoTransportista);

                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' UPDATE GES_CABECERAS_S ');
                       SQL.Add(' SET ');
                       SQL.Add(' PEDIDO_CLIENTE = :PEDIDO_CLIENTE ');
                       SQL.Add(' ,NOTAS = :NOTAS ');
                       SQL.Add(' ,DIR_ENTREGA_MANUAL = :DIR_ENTREGA_MANUAL ');
                       SQL.Add(' ,CONTACTO = :CONTACTO ');
                       SQL.Add(' ,ORIGEN_DOCUMENTO = :ORIGEN_DOCUMENTO ');
                       if (Transportista <> 0) then
                          SQL.Add(' ,TRANSPORTISTA = :TRANSPORTISTA ');
                       SQL.Add(' WHERE ');
                       SQL.Add(' ID_S = :ID_S ');
                       Params.ByName['ID_S'].AsInteger := ID_S;
                       Params.ByName['PEDIDO_CLIENTE'].AsString := PedidoCliente;
                       Params.ByName['NOTAS'].AsString := Notas.Text;
                       Params.ByName['DIR_ENTREGA_MANUAL'].AsString := DirEntregaManual.Text;
                       Params.ByName['CONTACTO'].AsInteger := Contacto;
                       Params.ByName['ORIGEN_DOCUMENTO'].AsString := 'ETH';
                       if (Transportista <> 0) then
                          Params.ByName['TRANSPORTISTA'].AsInteger := Transportista;
                       ExecQuery;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;
              end;

              Log.Add('    ' + format(_('Creando linea de albaran para articulo %s x %d - Lote: %s.'), [ArticuloImportado, Trunc(Cantidad), Lote]));
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'SELECT ID_DETALLES_S FROM WEB_INS_DETALLE_VENTA_2(''ALB'', :ID_S, :ID_A, :TITULO, :UNIDADES, 1, ''GRNL'', NULL, :PRECIO, 1 /*ACEPTAR_VALOR_PRECIO_CERO*/, :DESCUENTO, '''')';
                    Params.ByName['ID_S'].AsInteger := ID_S;
                    Params.ByName['ID_A'].AsInteger := ID_A;
                    Params.ByName['TITULO'].AsString := Descripcion;
                    Params.ByName['UNIDADES'].AsFloat := Cantidad;
                    Params.ByName['PRECIO'].AsFloat := Precio;
                    Params.ByName['DESCUENTO'].AsFloat := 0;
                    ExecQuery;
                    ID_DETALLES_S := FieldByName['ID_DETALLES_S'].AsInteger;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;

              if ((Lote <> '') and (Lote <> '0')) then
              begin
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Text := 'UPDATE GES_DETALLES_S SET LOTE_SIMPLE = :LOTE_SIMPLE WHERE ID_DETALLES_S = :ID_DETALLES_S';
                       Params.ByName['ID_DETALLES_S'].AsInteger := ID_DETALLES_S;
                       Params.ByName['LOTE_SIMPLE'].AsString := Lote;
                       ExecQuery;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;
              end;
           end;
        end;
     end;
  finally
     sl.Free;
     Columnas.Free;
     Campos.Free;
     Notas.Free;
     DirEntregaManual.Free;
  end;

  if (not HayError) then
  begin
     Log.Add('--------- --------- --------- --------- --------- --------- ');
     Log.Add(_('Renombrando fichero'));
     if CopyFileTo(Fichero, ChangeFileExt(Fichero, FormatDateTime('_yyyymmdd-hhnnss', Now) + '.bak')) then
        DeleteFile(PChar(Fichero))
     else
        Log.Add('    ' + _('ERROR - No se ha podido renombrar el fichero'));
  end;

  Log.Add('--------- --------- --------- --------- --------- --------- ');
  Log.Add('Impotacion finalizada');
  Log.Add('--------- --------- --------- --------- --------- --------- ');
end;

procedure TDMImportarDocumentos.SellforgeExpFamilias(Fichero: string);
var
  ts : TStrings;
begin
  ts := TStringList.Create;
  try
     with ts do
     begin
        Add(' SELECT F.FAMILIA, F.TITULO DECRIPCION_FAMILIA, S.SUBFAMILIA, S.TITULO DECRIPCION_SUBFAMILIA ');
        Add(' FROM ART_FAMILIAS F ');
        Add(' JOIN ART_SUBFAMILIAS S ON F.ID_FAMILIA = S.ID_FAMILIA ');
        Add(' WHERE ');
        Add(' F.EMPRESA = ' + REntorno.EmpresaStr + ' AND ');
        Add(' F.FAMILIA <> ''' + REntorno.FamSistema + ''' ');
        Add(' ORDER BY F.FAMILIA, S.SUBFAMILIA ');
     end;

     ExportarCSV(Fichero, ts.Text);
  finally
     ts.Free;
  end;
end;

procedure TDMImportarDocumentos.SellforgeExpArticulos(Fichero, Almacen: string);
var
  xTabla : TFIBDataSetRW;
  DSxTabla : TDataSource;
  i : integer;
  s, Union, Comilla : string;
  ts : TStrings;
  Separador : string;
  Encabezado : boolean;
  FechaSinHora : boolean;
  SeparadorDecimal : string;
  Articulo : string;
begin
  Comilla := '"';
  Separador := ';';
  Encabezado := True;
  FechaSinHora := False;
  SeparadorDecimal := '.';

  // Se crea una tabla y un datasource para ejecutar el SQL
  xTabla := TFIBDataSetRW.Create(nil);
  DSxTabla := TDataSource.Create(nil);
  try
     DMMain.LogIni(format('SellforgeExpArticulos(%s, %s)', [Fichero, Almacen]));
     DSxTabla.DataSet := xTabla;
     with xTabla do
     begin
        Unidirectional := True;
        xTabla.DataBase := DMMain.DataBase;
        Transaction := TFIBTransaction.Create(xTabla);
        Transaction.DefaultDatabase := DMMain.DataBase;
        if (not Transaction.InTransaction) then
           Transaction.StartTransaction;
        if (Active) then
           Close;
        with SelectSQL do
        begin
           Add(' SELECT A.ARTICULO, A.TITULO_LARGO DESCRIPCION, A.FAMILIA, A.SUBFAMILIA, A.ALFA_2 EMBALAJE, A.ALFA_1 CAJA, ');
           Add('        A.ALFA_6 CAJA_MC, ');
           Add('               CASE A.VIRTUAL ');
           Add('               WHEN 1 THEN ');
           Add('                   999 ');
           Add('               ELSE (SELECT STOCK ');
           Add('                       FROM A_ART_DAME_STOCK2(A.EMPRESA, C.CANAL, ''' + Almacen + ''', A.ARTICULO, ''3000.01.01'')) ');
           Add('               END STOCK, ');
           Add('               COALESCE(TBD.PRECIO_VENTA, 0) TARIFA_BD, -- ');
           Add('               COALESCE(TM1.PRECIO_VENTA, 0) TARIFA_M1, -- ');
           Add('               COALESCE(TM2.PRECIO_VENTA, 0) TARIFA_M2, -- ');
           Add('               COALESCE(TMC1.PRECIO_VENTA, 0) TARIFA_MC1, -- ');
           Add('               COALESCE(TMC2.PRECIO_VENTA, 0) TARIFA_MC2, -- ');
           Add('               COALESCE(T3.PRECIO_VENTA, 0) TARIFA_T3, ');
           Add('        -- ');
           Add('        COALESCE((SELECT FIRST 1 DD.UNID_MINIMAS ');
           Add('                  FROM ART_CONDICIONES_C CC ');
           Add('                  JOIN ART_CONDICIONES_D DD ON CC.EMPRESA = DD.EMPRESA AND CC.EJERCICIO = DD.EJERCICIO AND CC.CANAL = DD.CANAL AND CC.TIPO = DD.TIPO AND CC.RIG = DD.RIG ');
           Add('                  WHERE ');
           Add('                  CC.EMPRESA = A.EMPRESA AND ');
           Add('                  CC.EJERCICIO = C.EJERCICIO AND ');
           Add('                  CC.CANAL = C.CANAL AND ');
           Add('                  CC.TIPO = ''CAA'' AND ');
           Add('                  CC.ARTICULO = A.ARTICULO AND ');
           Add('                  CC.AGRUPACION = ''T3'' ');
           Add('                  ORDER BY DD.UNID_MINIMAS), 0) COND_ESP_UNID_MINIMAS_T3, -- ');
           Add('        COALESCE((SELECT FIRST 1 DD.PRECIO ');
           Add('                  FROM ART_CONDICIONES_C CC ');
           Add('                  JOIN ART_CONDICIONES_D DD ON CC.EMPRESA = DD.EMPRESA AND CC.EJERCICIO = DD.EJERCICIO AND CC.CANAL = DD.CANAL AND CC.TIPO = DD.TIPO AND CC.RIG = DD.RIG ');
           Add('                  WHERE ');
           Add('                  CC.EMPRESA = A.EMPRESA AND ');
           Add('                  CC.EJERCICIO = C.EJERCICIO AND ');
           Add('                  CC.CANAL = C.CANAL AND ');
           Add('                  CC.TIPO = ''CAA'' AND ');
           Add('                  CC.ARTICULO = A.ARTICULO AND ');
           Add('                  CC.AGRUPACION = ''T3'' ');
           Add('                  ORDER BY DD.UNID_MINIMAS), 0) COND_ESP_T3, -- ');
           Add('        -- ');
           Add('        COALESCE((SELECT FIRST 1 DD.UNID_MINIMAS ');
           Add('                  FROM ART_CONDICIONES_C CC ');
           Add('                  JOIN ART_CONDICIONES_D DD ON CC.EMPRESA = DD.EMPRESA AND CC.EJERCICIO = DD.EJERCICIO AND CC.CANAL = DD.CANAL AND CC.TIPO = DD.TIPO AND CC.RIG = DD.RIG ');
           Add('                  WHERE ');
           Add('                  CC.EMPRESA = A.EMPRESA AND ');
           Add('                  CC.EJERCICIO = C.EJERCICIO AND ');
           Add('                  CC.CANAL = C.CANAL AND ');
           Add('                  CC.TIPO = ''CAA'' AND ');
           Add('                  CC.ARTICULO = A.ARTICULO AND ');
           Add('                  CC.AGRUPACION = ''BD'' ');
           Add('                  ORDER BY DD.UNID_MINIMAS), 0) COND_ESP_UNID_MINIMAS_BD, -- ');
           Add('        COALESCE((SELECT FIRST 1 DD.PRECIO ');
           Add('                  FROM ART_CONDICIONES_C CC ');
           Add('                  JOIN ART_CONDICIONES_D DD ON CC.EMPRESA = DD.EMPRESA AND CC.EJERCICIO = DD.EJERCICIO AND CC.CANAL = DD.CANAL AND CC.TIPO = DD.TIPO AND CC.RIG = DD.RIG ');
           Add('                  WHERE ');
           Add('                  CC.EMPRESA = A.EMPRESA AND ');
           Add('                  CC.EJERCICIO = C.EJERCICIO AND ');
           Add('                  CC.CANAL = C.CANAL AND ');
           Add('                  CC.TIPO = ''CAA'' AND ');
           Add('                  CC.ARTICULO = A.ARTICULO AND ');
           Add('                  CC.AGRUPACION = ''BD'' ');
           Add('                  ORDER BY DD.UNID_MINIMAS), 0) COND_ESP_BD, -- ');
           Add('        -- ');
           Add('        B.BARRAS CODIGO_BARRAS, A.BAJA, ALFA_5 BOLSA_MC, ');
           Add('        -- ');
           Add('        COALESCE((SELECT FIRST 1 SKIP 1 DD.UNID_MINIMAS ');
           Add('                  FROM ART_CONDICIONES_C CC ');
           Add('                  JOIN ART_CONDICIONES_D DD ON CC.EMPRESA = DD.EMPRESA AND CC.EJERCICIO = DD.EJERCICIO AND CC.CANAL = DD.CANAL AND CC.TIPO = DD.TIPO AND CC.RIG = DD.RIG ');
           Add('                  WHERE ');
           Add('                  CC.EMPRESA = A.EMPRESA AND ');
           Add('                  CC.EJERCICIO = C.EJERCICIO AND ');
           Add('                  CC.CANAL = C.CANAL AND ');
           Add('                  CC.TIPO = ''CAA'' AND ');
           Add('                  CC.ARTICULO = A.ARTICULO AND ');
           Add('                  CC.AGRUPACION = ''T3'' ');
           Add('                  ORDER BY DD.UNID_MINIMAS), 0) COND_ESP_UNID_MINIMAS_T3_2, -- ');
           Add('        COALESCE((SELECT FIRST 1 SKIP 1 DD.PRECIO ');
           Add('                  FROM ART_CONDICIONES_C CC ');
           Add('                  JOIN ART_CONDICIONES_D DD ON CC.EMPRESA = DD.EMPRESA AND CC.EJERCICIO = DD.EJERCICIO AND CC.CANAL = DD.CANAL AND CC.TIPO = DD.TIPO AND CC.RIG = DD.RIG ');
           Add('                  WHERE ');
           Add('                  CC.EMPRESA = A.EMPRESA AND ');
           Add('                  CC.EJERCICIO = C.EJERCICIO AND ');
           Add('                  CC.CANAL = C.CANAL AND ');
           Add('                  CC.TIPO = ''CAA'' AND ');
           Add('                  CC.ARTICULO = A.ARTICULO AND ');
           Add('                  CC.AGRUPACION = ''T3'' ');
           Add('                  ORDER BY DD.UNID_MINIMAS), 0) COND_ESP_T3_2, -- ');
           Add('        -- ');
           Add('        COALESCE((SELECT FIRST 1 SKIP 1 DD.UNID_MINIMAS ');
           Add('                  FROM ART_CONDICIONES_C CC ');
           Add('                  JOIN ART_CONDICIONES_D DD ON CC.EMPRESA = DD.EMPRESA AND CC.EJERCICIO = DD.EJERCICIO AND CC.CANAL = DD.CANAL AND CC.TIPO = DD.TIPO AND CC.RIG = DD.RIG ');
           Add('                  WHERE ');
           Add('                  CC.EMPRESA = A.EMPRESA AND ');
           Add('                  CC.EJERCICIO = C.EJERCICIO AND ');
           Add('                  CC.CANAL = C.CANAL AND ');
           Add('                  CC.TIPO = ''CAA'' AND ');
           Add('                  CC.ARTICULO = A.ARTICULO AND ');
           Add('                  CC.AGRUPACION = ''BD'' ');
           Add('                  ORDER BY DD.UNID_MINIMAS), 0) COND_ESP_UNID_MINIMAS_BD_2, -- ');
           Add('                  COALESCE((SELECT FIRST 1 SKIP 1 DD.PRECIO ');
           Add('                  FROM ART_CONDICIONES_C CC ');
           Add('                  JOIN ART_CONDICIONES_D DD ON CC.EMPRESA = DD.EMPRESA AND CC.EJERCICIO = DD.EJERCICIO AND CC.CANAL = DD.CANAL AND CC.TIPO = DD.TIPO AND CC.RIG = DD.RIG ');
           Add('                  WHERE ');
           Add('                  CC.EMPRESA = A.EMPRESA AND ');
           Add('                  CC.EJERCICIO = C.EJERCICIO AND ');
           Add('                  CC.CANAL = C.CANAL AND ');
           Add('                  CC.TIPO = ''CAA'' AND ');
           Add('                  CC.ARTICULO = A.ARTICULO AND ');
           Add('                  CC.AGRUPACION = ''BD'' ');
           Add('                  ORDER BY DD.UNID_MINIMAS), 0) COND_ESP_BD_2 -- ');
           Add(' FROM ART_ARTICULOS A ');
           Add(' JOIN CON_CUENTAS_GES_ART C ON A.EMPRESA = C.EMPRESA AND A.ARTICULO = C.ARTICULO ');
           Add(' LEFT JOIN ART_ARTICULOS_BARRAS B ON A.EMPRESA = B.EMPRESA AND A.ARTICULO = B.ARTICULO AND B.TIPO = 3 ');
           Add(' LEFT JOIN ART_TARIFAS_PRECIOS TBD ON A.EMPRESA = TBD.EMPRESA AND A.ARTICULO = TBD.ARTICULO AND TBD.TARIFA = ''BD'' AND TBD.LINEA = (SELECT MIN(LINEA) ');
           Add('                                                                                                                                   FROM ART_TARIFAS_PRECIOS ');
           Add('                                                                                                                                   WHERE ');
           Add('                                                                                                                                   EMPRESA = A.EMPRESA AND ');
           Add('                                                                                                                                   ARTICULO = A.ARTICULO AND ');
           Add('                                                                                                                                   TARIFA = ''BD'') ');
           Add(' LEFT JOIN ART_TARIFAS_PRECIOS TM1 ON A.EMPRESA = TM1.EMPRESA AND A.ARTICULO = TM1.ARTICULO AND TM1.TARIFA = ''M1'' AND TM1.LINEA = (SELECT MIN(LINEA) ');
           Add('                                                                                                                                   FROM ART_TARIFAS_PRECIOS ');
           Add('                                                                                                                                   WHERE ');
           Add('                                                                                                                                   EMPRESA = A.EMPRESA AND ');
           Add('                                                                                                                                   ARTICULO = A.ARTICULO AND ');
           Add('                                                                                                                                   TARIFA = ''M1'') ');
           Add(' LEFT JOIN ART_TARIFAS_PRECIOS TM2 ON A.EMPRESA = TM2.EMPRESA AND A.ARTICULO = TM2.ARTICULO AND TM2.TARIFA = ''M2'' AND TM2.LINEA = (SELECT MIN(LINEA) ');
           Add('                                                                                                                                   FROM ART_TARIFAS_PRECIOS ');
           Add('                                                                                                                                   WHERE ');
           Add('                                                                                                                                   EMPRESA = A.EMPRESA AND ');
           Add('                                                                                                                                   ARTICULO = A.ARTICULO AND ');
           Add('                                                                                                                                   TARIFA = ''M2'') ');
           Add(' LEFT JOIN ART_TARIFAS_PRECIOS TMC1 ON A.EMPRESA = TMC1.EMPRESA AND A.ARTICULO = TMC1.ARTICULO AND TMC1.TARIFA = ''MC1'' AND TMC1.LINEA = (SELECT MIN(LINEA) ');
           Add('                                                                                                                                         FROM ART_TARIFAS_PRECIOS ');
           Add('                                                                                                                                         WHERE ');
           Add('                                                                                                                                         EMPRESA = A.EMPRESA AND ');
           Add('                                                                                                                                         ARTICULO = A.ARTICULO AND ');
           Add('                                                                                                                                         TARIFA = ''MC1'') ');
           Add(' LEFT JOIN ART_TARIFAS_PRECIOS TMC2 ON A.EMPRESA = TMC2.EMPRESA AND A.ARTICULO = TMC2.ARTICULO AND TMC2.TARIFA = ''MC2'' AND TMC2.LINEA = (SELECT MIN(LINEA) ');
           Add('                                                                                                                                         FROM ART_TARIFAS_PRECIOS ');
           Add('                                                                                                                                         WHERE ');
           Add('                                                                                                                                         EMPRESA = A.EMPRESA AND ');
           Add('                                                                                                                                         ARTICULO = A.ARTICULO AND ');
           Add('                                                                                                                                         TARIFA = ''MC2'') ');
           Add(' LEFT JOIN ART_TARIFAS_PRECIOS T3 ON A.EMPRESA = T3.EMPRESA AND A.ARTICULO = T3.ARTICULO AND T3.TARIFA = ''T3'' AND T3.LINEA = (SELECT MIN(LINEA) ');
           Add('                                                                                                                              FROM ART_TARIFAS_PRECIOS ');
           Add('                                                                                                                              WHERE ');
           Add('                                                                                                                              EMPRESA = A.EMPRESA AND ');
           Add('                                                                                                                              ARTICULO = A.ARTICULO AND ');
           Add('                                                                                                                              TARIFA = ''T3'') ');
           Add(' WHERE ');
           Add(' A.EMPRESA = ' + REntorno.EmpresaStr + ' AND ');
           Add(' C.EJERCICIO = ' + REntorno.EjercicioStr + ' AND ');
           Add(' C.CANAL = ' + REntorno.CanalStr + ' AND ');
           Add(' A.FAMILIA <> ''' + REntorno.FamSistema + ''' AND ');
           Add(' A.ARTICULO <> ''' + REntorno.ArtTextoLibre + ''' AND ');
           Add(' A.EXPORTAR = 1 ');
           Add(' ORDER BY A.ARTICULO ');
        end;
        Open;

        // ExportarCSV(Fichero, DSxTabla, Separador, EntrecomillarString, Encabezado, FechaSinHora);
        ts := TStringList.Create;
        try
           First;

           if (Encabezado) then
           begin
              // Primera linea son los titulos de los campos
              s := '';
              Union := '';
              for i := 0 to FieldCount - 1 do
              begin
                 if (Fields[i].Visible) then
                 begin
                    s := s + Union + Comilla + Fields[i].FieldName + Comilla;
                    Union := Separador;
                 end;
              end;
              ts.Add(s);
           end;

           while not EOF do
           begin
              s := '';
              Union := '';
              for i := 0 to FieldCount - 1 do
              begin
                 if (Fields[i].Visible) then
                 begin
                    {Campo tipo String}
                    // Reemplazado: xxxReemplazo comilla doble por dos comillas simples si se entrecomillan los stringsxxx
                    // Reemplazo comilla doble por dos comillas dobles si se entrecomillan los strings
                    if (Fields[i] is TStringField) then
                    begin
                       if (Comilla = '"') then
                          s := s + Union + Comilla + StringReplace(Trim(Fields[i].AsString), '"', '""', [rfReplaceAll]) + Comilla
                       else
                          s := s + Union + Comilla + Trim(Fields[i].AsString) + Comilla;
                    end
                    else
                    {Campo tipo Float}
                    // Utilizo 3 decimales
                    if (Fields[i] is TFloatField) then
                       if (Fields[i].FieldName = 'STOCK') then
                       begin
                          Articulo := FieldByName('ARTICULO').AsString;
                          if (Articulo = 'MEVI16E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI4076O', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI27E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI4061O', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI23E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI4075BO', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI16E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI4076O', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI24E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI4075NO', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI21E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI4130BO', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI22E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI4130NO', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI20E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI45INO', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI19E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI45IBO', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI25E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI4079O', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI26E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI4095O', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI27E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI4062O', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI28E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI43AN', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI29E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI54AN', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI1E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI1001O', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI2E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI1001NO', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI3E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI1073O', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI4E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI135O', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI7E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI1022O', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI7NE') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI1022NO', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI5E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI137', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI8E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI1054O', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI10E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI1014E', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI31E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI1074O', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI11E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI1014T', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI12E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI1014TN', Almacen), SeparadorDecimal[1], '0.000')
                          else
                             s := s + Union + FloatToStrDec(Fields[i].AsFloat, SeparadorDecimal[1], '0.000');
                       end
                       else
                          s := s + Union + FloatToStrDec(Fields[i].AsFloat, SeparadorDecimal[1], '0.000')
                    else
                    {Campo tipo Integer}
                    if (Fields[i] is TIntegerField) then
                       s := s + Union + Trim(IntToStr(Fields[i].AsInteger))
                    else
                    {Campo tipo Fecha}
                    // El formato será el del sistema en que se ejecute
                    if (Fields[i] is TDateTimeField) then
                    begin
                       if (FechaSinHora) then
                          s := s + Union + DateToStr(Fields[i].AsDateTime)
                       else
                          s := s + Union + DateTimeToStr(Fields[i].AsDateTime);
                    end
                    else
                    {Campo tipo Blob}
                    // Los blobs exportan solo caracteres basicos.
                    if (Fields[i] is TBlobField) then
                    begin
                       try
                          if (Comilla = '"') then
                             s := s + Union + Comilla + StringReplace(Trim(LimpiaCadena(Fields[i].AsString)), '"', '""', [rfReplaceAll]) + Comilla
                          else
                             s := s + Union + Comilla + Trim(LimpiaCadena(Fields[i].AsString)) + Comilla;

                             {FMain.RichEdit1.PlainText := False;
                             tmps := TStringList.Create;
                             try
                                MS := TMemoryStream.Create;
                                try
                                   tmps.Assign(xTabla.Fields[i]);
                                   tmps.SaveToStream(MS);
                                   MS.Position := 0;
                                   FMain.RichEdit1.Lines.LoadFromStream(MS);
                                finally
                                   MS.Free;
                                end;
                             finally
                                tmps.Free;
                             end;
                             FMain.RichEdit1.PlainText := True;

                             saux := '"';
                             for j := 0 to FMain.RichEdit1.Lines.Count -1 do
                                saux := saux+Trim(FMain.RichEdit1.Lines[j])+'|';

                             while (pos(#9,saux)>1) do
                             begin
                                k := pos(#9,saux);
                                saux := copy(saux,1,k-1)+' '+copy(saux,k+1,length(saux));
                             end;

                             s := s + Union + saux + '"';
                             FMain.RichEdit1.Clear;}
                       except
                          s := s + Union + Comilla + '--  ERROR  --' + Comilla;
                       end;
                    end;

                    Union := Separador;
                 end;
              end;
              ts.Add(s);

              Next;
           end;

           ts.SaveToFile(Fichero);
        finally
           ts.Free;
        end;

        Close;
        if (Transaction.InTransaction) then
           Transaction.Commit;
     end; {with xTabla}
  finally
     DSxTabla.Free;
     xTabla.Free;
     DMMain.LogFin('');
  end;
end;

procedure TDMImportarDocumentos.SellforgeExpClientes(Fichero: string);
var
  ts : TStrings;
begin
  ts := TStringList.Create;
  try
     with ts do
     begin
        Add(' SELECT C.CLIENTE, T.NIF, T.NOMBRE_R_SOCIAL, T.NOMBRE_COMERCIAL, T.TELEFONO01, T.TELEFONO02, T.EMAIL, D.DIR_COMPLETA_N, ');
        Add('        L.TITULO LOCALIDAD, P.TITULO PROVINCIA, L.CODIGO_POSTAL, C.AGENTE, C.TARIFA, C.DTO_CIAL_LINEA, CC.FORMA_PAGO, ');
        Add('        CASE CC.MODO_IVA ');
        Add('          WHEN 0 THEN ');
        Add('              ''EXENTO'' ');
        Add('          WHEN 1 THEN ');
        Add('              ''NORMAL'' ');
        Add('          WHEN 2 THEN ');
        Add('              ''RECARGO'' ');
        Add('          WHEN 3 THEN ');
        Add('              ''INTRACOMUNITARIO'' ');
        Add('          WHEN 4 THEN ');
        Add('              ''INTRACOMUNITARIO RECARGO'' ');
        Add('          WHEN 5 THEN ');
        Add('              ''EXTRANJERO'' ');
        Add('          ELSE ''DESCONOCIDO'' ');
        Add('        END TIPO_IMPUESTOS, ');
        Add('        CAST('''' AS VARCHAR(1)) NOTAS, C.Z_MOTIVO_BLOQUEO BLOQUEO, C.BAJA, CAST('''' AS VARCHAR(1)) PERFIL, C.ZONA, T.WEB, ');
        Add('        C.ALFA_5 CLIENTE_WEB, C.ALFA_6 PASSWORD_WEB, C.ALFA_3 CODIGO_PORTES ');
        Add(' FROM EMP_CLIENTES C ');
        Add(' JOIN SYS_TERCEROS T ON C.TERCERO = T.TERCERO ');
        Add(' LEFT JOIN SYS_TERCEROS_DIRECCIONES D ON C.TERCERO = D.TERCERO AND D.DIR_DEFECTO = 1 ');
        Add(' LEFT JOIN SYS_LOCALIDADES L ON D.ID_LOCAL = L.ID_LOCAL ');
        Add(' LEFT JOIN SYS_PROVINCIAS P ON L.PAIS = P.PAIS AND L.PROVINCIA = P.PROVINCIA ');
        Add(' JOIN CON_CUENTAS_GES_CLI CC ON C.EMPRESA = CC.EMPRESA AND C.CLIENTE = CC.CLIENTE ');
        Add(' WHERE ');
        Add(' C.EMPRESA = ' + REntorno.EmpresaStr + ' AND ');
        Add(' CC.EJERCICIO = ' + REntorno.EjercicioStr + ' AND ');
        Add(' CC.CANAL = ' + REntorno.CanalStr + ' AND ');
        Add(' C.CLIENTE > 1 AND ');
        Add(' C.EXPORTAR = 1 ');
        Add(' ORDER BY C.CLIENTE ');
     end;

     ExportarCSV(Fichero, ts.Text);
  finally
     ts.Free;
  end;
end;

procedure TDMImportarDocumentos.SellforgeExpDirecciones(Fichero: string);
var
  ts : TStrings;
begin
  ts := TStringList.Create;
  try
     with ts do
     begin
        Add(' SELECT C.CLIENTE, D.DIRECCION NOMBRE, DIR_TELEFONO01 TELEFONO1, DIR_TELEFONO02 TELEFONO2, CAST('''' AS VARCHAR(1)) EMAIL1, CAST('''' AS VARCHAR(1)) EMAIL2, ');
        Add('        L.TITULO LOCALIDAD, P.TITULO PROVINCIA, D.DIR_COMPLETA_N, L.CODIGO_POSTAL, T.WEB ');
        Add(' FROM EMP_CLIENTES C ');
        Add(' JOIN SYS_TERCEROS T ON C.TERCERO = T.TERCERO ');
        Add(' LEFT JOIN SYS_TERCEROS_DIRECCIONES D ON C.TERCERO = D.TERCERO AND D.DIR_DEFECTO = 0 ');
        Add(' LEFT JOIN SYS_LOCALIDADES L ON D.ID_LOCAL = L.ID_LOCAL ');
        Add(' LEFT JOIN SYS_PROVINCIAS P ON L.PAIS = P.PAIS AND L.PROVINCIA = P.PROVINCIA ');
        Add(' JOIN CON_CUENTAS_GES_CLI CC ON C.EMPRESA = CC.EMPRESA AND C.CLIENTE = CC.CLIENTE ');
        Add(' WHERE ');
        Add(' C.EMPRESA = ' + REntorno.EmpresaStr + ' AND ');
        Add(' CC.EJERCICIO = ' + REntorno.EjercicioStr + ' AND ');
        Add(' CC.CANAL = ' + REntorno.CanalStr + ' AND ');
        Add(' C.CLIENTE > 1 AND ');
        Add(' C.EXPORTAR = 1 AND ');
        Add(' D.ACTIVO = 1 ');
        Add(' ORDER BY C.CLIENTE, D.DIRECCION ');
     end;

     ExportarCSV(Fichero, ts.Text);
  finally
     ts.Free;
  end;
end;

procedure TDMImportarDocumentos.NTVExpArticulos(Fichero, Almacen: string);
var
  xTabla : TFIBDataSetRW;
  DSxTabla : TDataSource;
  i : integer;
  s, Union, Comilla : string;
  ts : TStrings;
  Separador : string;
  Encabezado : boolean;
  FechaSinHora : boolean;
  SeparadorDecimal : string;
  Articulo : string;
begin
  Comilla := '"';
  Separador := ';';
  Encabezado := True;
  FechaSinHora := False;
  SeparadorDecimal := '.';

  // Se crea una tabla y un datasource para ejecutar el SQL
  xTabla := TFIBDataSetRW.Create(nil);
  DSxTabla := TDataSource.Create(nil);
  try
     DMMain.LogIni(format('NTVExpArticulos(%s, %s)', [Fichero, Almacen]));
     DSxTabla.DataSet := xTabla;
     with xTabla do
     begin
        Unidirectional := True;
        xTabla.DataBase := DMMain.DataBase;
        Transaction := TFIBTransaction.Create(xTabla);
        Transaction.DefaultDatabase := DMMain.DataBase;
        if (not Transaction.InTransaction) then
           Transaction.StartTransaction;
        if (Active) then
           Close;
        with SelectSQL do
        begin
           Add(' SELECT A.ARTICULO, A.TITULO_LARGO DESCRIPCION, A.FAMILIA, A.SUBFAMILIA, A.ALFA_2 EMBALAJE, A.ALFA_1 CAJA, ');
           Add('        A.ALFA_6 CAJA_MC, ');
           Add('               CASE A.VIRTUAL ');
           Add('               WHEN 1 THEN ');
           Add('                   999 ');
           Add('               ELSE (SELECT STOCK ');
           Add('                       FROM A_ART_DAME_STOCK2(A.EMPRESA, C.CANAL, ''' + Almacen + ''', A.ARTICULO, ''3000.01.01'')) ');
           Add('               END STOCK, ');
           Add('               COALESCE(TBD.PRECIO_VENTA, 0) TARIFA_BD, -- ');
           Add('               COALESCE(TM1.PRECIO_VENTA, 0) TARIFA_M1, -- ');
           Add('               COALESCE(TM2.PRECIO_VENTA, 0) TARIFA_M2, -- ');
           Add('               COALESCE(TMC1.PRECIO_VENTA, 0) TARIFA_MC1, -- ');
           Add('               COALESCE(TMC2.PRECIO_VENTA, 0) TARIFA_MC2, -- ');
           Add('               COALESCE(T3.PRECIO_VENTA, 0) TARIFA_T3, ');
           Add('        -- ');
           Add('        COALESCE((SELECT FIRST 1 DD.UNID_MINIMAS ');
           Add('                  FROM ART_CONDICIONES_C CC ');
           Add('                  JOIN ART_CONDICIONES_D DD ON CC.EMPRESA = DD.EMPRESA AND CC.EJERCICIO = DD.EJERCICIO AND CC.CANAL = DD.CANAL AND CC.TIPO = DD.TIPO AND CC.RIG = DD.RIG ');
           Add('                  WHERE ');
           Add('                  CC.EMPRESA = A.EMPRESA AND ');
           Add('                  CC.EJERCICIO = C.EJERCICIO AND ');
           Add('                  CC.CANAL = C.CANAL AND ');
           Add('                  CC.TIPO = ''CAA'' AND ');
           Add('                  CC.ARTICULO = A.ARTICULO AND ');
           Add('                  CC.AGRUPACION = ''T3'' ');
           Add('                  ORDER BY DD.UNID_MINIMAS), 0) COND_ESP_UNID_MINIMAS_T3, -- ');
           Add('        COALESCE((SELECT FIRST 1 DD.PRECIO ');
           Add('                  FROM ART_CONDICIONES_C CC ');
           Add('                  JOIN ART_CONDICIONES_D DD ON CC.EMPRESA = DD.EMPRESA AND CC.EJERCICIO = DD.EJERCICIO AND CC.CANAL = DD.CANAL AND CC.TIPO = DD.TIPO AND CC.RIG = DD.RIG ');
           Add('                  WHERE ');
           Add('                  CC.EMPRESA = A.EMPRESA AND ');
           Add('                  CC.EJERCICIO = C.EJERCICIO AND ');
           Add('                  CC.CANAL = C.CANAL AND ');
           Add('                  CC.TIPO = ''CAA'' AND ');
           Add('                  CC.ARTICULO = A.ARTICULO AND ');
           Add('                  CC.AGRUPACION = ''T3'' ');
           Add('                  ORDER BY DD.UNID_MINIMAS), 0) COND_ESP_T3, -- ');
           Add('        -- ');
           Add('        COALESCE((SELECT FIRST 1 DD.UNID_MINIMAS ');
           Add('                  FROM ART_CONDICIONES_C CC ');
           Add('                  JOIN ART_CONDICIONES_D DD ON CC.EMPRESA = DD.EMPRESA AND CC.EJERCICIO = DD.EJERCICIO AND CC.CANAL = DD.CANAL AND CC.TIPO = DD.TIPO AND CC.RIG = DD.RIG ');
           Add('                  WHERE ');
           Add('                  CC.EMPRESA = A.EMPRESA AND ');
           Add('                  CC.EJERCICIO = C.EJERCICIO AND ');
           Add('                  CC.CANAL = C.CANAL AND ');
           Add('                  CC.TIPO = ''CAA'' AND ');
           Add('                  CC.ARTICULO = A.ARTICULO AND ');
           Add('                  CC.AGRUPACION = ''BD'' ');
           Add('                  ORDER BY DD.UNID_MINIMAS), 0) COND_ESP_UNID_MINIMAS_BD, -- ');
           Add('        COALESCE((SELECT FIRST 1 DD.PRECIO ');
           Add('                  FROM ART_CONDICIONES_C CC ');
           Add('                  JOIN ART_CONDICIONES_D DD ON CC.EMPRESA = DD.EMPRESA AND CC.EJERCICIO = DD.EJERCICIO AND CC.CANAL = DD.CANAL AND CC.TIPO = DD.TIPO AND CC.RIG = DD.RIG ');
           Add('                  WHERE ');
           Add('                  CC.EMPRESA = A.EMPRESA AND ');
           Add('                  CC.EJERCICIO = C.EJERCICIO AND ');
           Add('                  CC.CANAL = C.CANAL AND ');
           Add('                  CC.TIPO = ''CAA'' AND ');
           Add('                  CC.ARTICULO = A.ARTICULO AND ');
           Add('                  CC.AGRUPACION = ''BD'' ');
           Add('                  ORDER BY DD.UNID_MINIMAS), 0) COND_ESP_BD, -- ');
           Add('        -- ');
           Add('        B.BARRAS CODIGO_BARRAS, A.BAJA, ALFA_5 BOLSA_MC, ');
           Add('        -- ');
           Add('        COALESCE((SELECT FIRST 1 SKIP 1 DD.UNID_MINIMAS ');
           Add('                  FROM ART_CONDICIONES_C CC ');
           Add('                  JOIN ART_CONDICIONES_D DD ON CC.EMPRESA = DD.EMPRESA AND CC.EJERCICIO = DD.EJERCICIO AND CC.CANAL = DD.CANAL AND CC.TIPO = DD.TIPO AND CC.RIG = DD.RIG ');
           Add('                  WHERE ');
           Add('                  CC.EMPRESA = A.EMPRESA AND ');
           Add('                  CC.EJERCICIO = C.EJERCICIO AND ');
           Add('                  CC.CANAL = C.CANAL AND ');
           Add('                  CC.TIPO = ''CAA'' AND ');
           Add('                  CC.ARTICULO = A.ARTICULO AND ');
           Add('                  CC.AGRUPACION = ''T3'' ');
           Add('                  ORDER BY DD.UNID_MINIMAS), 0) COND_ESP_UNID_MINIMAS_T3_2, -- ');
           Add('        COALESCE((SELECT FIRST 1 SKIP 1 DD.PRECIO ');
           Add('                  FROM ART_CONDICIONES_C CC ');
           Add('                  JOIN ART_CONDICIONES_D DD ON CC.EMPRESA = DD.EMPRESA AND CC.EJERCICIO = DD.EJERCICIO AND CC.CANAL = DD.CANAL AND CC.TIPO = DD.TIPO AND CC.RIG = DD.RIG ');
           Add('                  WHERE ');
           Add('                  CC.EMPRESA = A.EMPRESA AND ');
           Add('                  CC.EJERCICIO = C.EJERCICIO AND ');
           Add('                  CC.CANAL = C.CANAL AND ');
           Add('                  CC.TIPO = ''CAA'' AND ');
           Add('                  CC.ARTICULO = A.ARTICULO AND ');
           Add('                  CC.AGRUPACION = ''T3'' ');
           Add('                  ORDER BY DD.UNID_MINIMAS), 0) COND_ESP_T3_2, -- ');
           Add('        -- ');
           Add('        COALESCE((SELECT FIRST 1 SKIP 1 DD.UNID_MINIMAS ');
           Add('                  FROM ART_CONDICIONES_C CC ');
           Add('                  JOIN ART_CONDICIONES_D DD ON CC.EMPRESA = DD.EMPRESA AND CC.EJERCICIO = DD.EJERCICIO AND CC.CANAL = DD.CANAL AND CC.TIPO = DD.TIPO AND CC.RIG = DD.RIG ');
           Add('                  WHERE ');
           Add('                  CC.EMPRESA = A.EMPRESA AND ');
           Add('                  CC.EJERCICIO = C.EJERCICIO AND ');
           Add('                  CC.CANAL = C.CANAL AND ');
           Add('                  CC.TIPO = ''CAA'' AND ');
           Add('                  CC.ARTICULO = A.ARTICULO AND ');
           Add('                  CC.AGRUPACION = ''BD'' ');
           Add('                  ORDER BY DD.UNID_MINIMAS), 0) COND_ESP_UNID_MINIMAS_BD_2, -- ');
           Add('                  COALESCE((SELECT FIRST 1 SKIP 1 DD.PRECIO ');
           Add('                  FROM ART_CONDICIONES_C CC ');
           Add('                  JOIN ART_CONDICIONES_D DD ON CC.EMPRESA = DD.EMPRESA AND CC.EJERCICIO = DD.EJERCICIO AND CC.CANAL = DD.CANAL AND CC.TIPO = DD.TIPO AND CC.RIG = DD.RIG ');
           Add('                  WHERE ');
           Add('                  CC.EMPRESA = A.EMPRESA AND ');
           Add('                  CC.EJERCICIO = C.EJERCICIO AND ');
           Add('                  CC.CANAL = C.CANAL AND ');
           Add('                  CC.TIPO = ''CAA'' AND ');
           Add('                  CC.ARTICULO = A.ARTICULO AND ');
           Add('                  CC.AGRUPACION = ''BD'' ');
           Add('                  ORDER BY DD.UNID_MINIMAS), 0) COND_ESP_BD_2 -- ');
           Add(' FROM ART_ARTICULOS A ');
           Add(' JOIN CON_CUENTAS_GES_ART C ON A.EMPRESA = C.EMPRESA AND A.ARTICULO = C.ARTICULO ');
           Add(' LEFT JOIN ART_ARTICULOS_BARRAS B ON A.EMPRESA = B.EMPRESA AND A.ARTICULO = B.ARTICULO AND B.TIPO = 3 ');
           Add(' LEFT JOIN ART_TARIFAS_PRECIOS TBD ON A.EMPRESA = TBD.EMPRESA AND A.ARTICULO = TBD.ARTICULO AND TBD.TARIFA = ''BD'' AND TBD.LINEA = (SELECT MIN(LINEA) ');
           Add('                                                                                                                                   FROM ART_TARIFAS_PRECIOS ');
           Add('                                                                                                                                   WHERE ');
           Add('                                                                                                                                   EMPRESA = A.EMPRESA AND ');
           Add('                                                                                                                                   ARTICULO = A.ARTICULO AND ');
           Add('                                                                                                                                   TARIFA = ''BD'') ');
           Add(' LEFT JOIN ART_TARIFAS_PRECIOS TM1 ON A.EMPRESA = TM1.EMPRESA AND A.ARTICULO = TM1.ARTICULO AND TM1.TARIFA = ''M1'' AND TM1.LINEA = (SELECT MIN(LINEA) ');
           Add('                                                                                                                                   FROM ART_TARIFAS_PRECIOS ');
           Add('                                                                                                                                   WHERE ');
           Add('                                                                                                                                   EMPRESA = A.EMPRESA AND ');
           Add('                                                                                                                                   ARTICULO = A.ARTICULO AND ');
           Add('                                                                                                                                   TARIFA = ''M1'') ');
           Add(' LEFT JOIN ART_TARIFAS_PRECIOS TM2 ON A.EMPRESA = TM2.EMPRESA AND A.ARTICULO = TM2.ARTICULO AND TM2.TARIFA = ''M2'' AND TM2.LINEA = (SELECT MIN(LINEA) ');
           Add('                                                                                                                                   FROM ART_TARIFAS_PRECIOS ');
           Add('                                                                                                                                   WHERE ');
           Add('                                                                                                                                   EMPRESA = A.EMPRESA AND ');
           Add('                                                                                                                                   ARTICULO = A.ARTICULO AND ');
           Add('                                                                                                                                   TARIFA = ''M2'') ');
           Add(' LEFT JOIN ART_TARIFAS_PRECIOS TMC1 ON A.EMPRESA = TMC1.EMPRESA AND A.ARTICULO = TMC1.ARTICULO AND TMC1.TARIFA = ''MC1'' AND TMC1.LINEA = (SELECT MIN(LINEA) ');
           Add('                                                                                                                                         FROM ART_TARIFAS_PRECIOS ');
           Add('                                                                                                                                         WHERE ');
           Add('                                                                                                                                         EMPRESA = A.EMPRESA AND ');
           Add('                                                                                                                                         ARTICULO = A.ARTICULO AND ');
           Add('                                                                                                                                         TARIFA = ''MC1'') ');
           Add(' LEFT JOIN ART_TARIFAS_PRECIOS TMC2 ON A.EMPRESA = TMC2.EMPRESA AND A.ARTICULO = TMC2.ARTICULO AND TMC2.TARIFA = ''MC2'' AND TMC2.LINEA = (SELECT MIN(LINEA) ');
           Add('                                                                                                                                         FROM ART_TARIFAS_PRECIOS ');
           Add('                                                                                                                                         WHERE ');
           Add('                                                                                                                                         EMPRESA = A.EMPRESA AND ');
           Add('                                                                                                                                         ARTICULO = A.ARTICULO AND ');
           Add('                                                                                                                                         TARIFA = ''MC2'') ');
           Add(' LEFT JOIN ART_TARIFAS_PRECIOS T3 ON A.EMPRESA = T3.EMPRESA AND A.ARTICULO = T3.ARTICULO AND T3.TARIFA = ''T3'' AND T3.LINEA = (SELECT MIN(LINEA) ');
           Add('                                                                                                                              FROM ART_TARIFAS_PRECIOS ');
           Add('                                                                                                                              WHERE ');
           Add('                                                                                                                              EMPRESA = A.EMPRESA AND ');
           Add('                                                                                                                              ARTICULO = A.ARTICULO AND ');
           Add('                                                                                                                              TARIFA = ''T3'') ');
           Add(' WHERE ');
           Add(' A.EMPRESA = ' + REntorno.EmpresaStr + ' AND ');
           Add(' C.EJERCICIO = ' + REntorno.EjercicioStr + ' AND ');
           Add(' C.CANAL = ' + REntorno.CanalStr + ' AND ');
           Add(' A.FAMILIA <> ''' + REntorno.FamSistema + ''' AND ');
           Add(' A.ARTICULO <> ''' + REntorno.ArtTextoLibre + ''' AND ');
           Add(' A.EXPORTAR = 1 ');
           Add(' ORDER BY A.ARTICULO ');
        end;
        Open;

        // ExportarCSV(Fichero, DSxTabla, Separador, EntrecomillarString, Encabezado, FechaSinHora);
        ts := TStringList.Create;
        try
           First;

           if (Encabezado) then
           begin
              // Primera linea son los titulos de los campos
              s := '';
              Union := '';
              for i := 0 to FieldCount - 1 do
              begin
                 if (Fields[i].Visible) then
                 begin
                    s := s + Union + Comilla + Fields[i].FieldName + Comilla;
                    Union := Separador;
                 end;
              end;
              ts.Add(s);
           end;

           while not EOF do
           begin
              s := '';
              Union := '';
              for i := 0 to FieldCount - 1 do
              begin
                 if (Fields[i].Visible) then
                 begin
                    {Campo tipo String}
                    // Reemplazado: xxxReemplazo comilla doble por dos comillas simples si se entrecomillan los stringsxxx
                    // Reemplazo comilla doble por dos comillas dobles si se entrecomillan los strings
                    if (Fields[i] is TStringField) then
                    begin
                       if (Comilla = '"') then
                          s := s + Union + Comilla + StringReplace(Trim(Fields[i].AsString), '"', '""', [rfReplaceAll]) + Comilla
                       else
                          s := s + Union + Comilla + Trim(Fields[i].AsString) + Comilla;
                    end
                    else
                    {Campo tipo Float}
                    // Utilizo 3 decimales
                    if (Fields[i] is TFloatField) then
                       if (Fields[i].FieldName = 'STOCK') then
                       begin
                          Articulo := FieldByName('ARTICULO').AsString;
                          if (Articulo = 'MEVI16E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI4076O', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI27E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI4061O', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI23E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI4075BO', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI16E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI4076O', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI24E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI4075NO', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI21E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI4130BO', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI22E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI4130NO', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI20E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI45INO', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI19E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI45IBO', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI25E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI4079O', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI26E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI4095O', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI27E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI4062O', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI28E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI43AN', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI29E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI54AN', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI1E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI1001O', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI2E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI1001NO', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI3E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI1073O', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI4E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI135O', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI7E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI1022O', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI7NE') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI1022NO', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI5E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI137', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI8E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI1054O', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI10E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI1014E', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI31E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI1074O', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI11E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI1014T', Almacen), SeparadorDecimal[1], '0.000')
                          else
                          if (Articulo = 'MEVI12E') then
                             s := s + Union + FloatToStrDec(DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, 'MEVI1014TN', Almacen), SeparadorDecimal[1], '0.000')
                          else
                             s := s + Union + FloatToStrDec(Fields[i].AsFloat, SeparadorDecimal[1], '0.000');
                       end
                       else
                          s := s + Union + FloatToStrDec(Fields[i].AsFloat, SeparadorDecimal[1], '0.000')
                    else
                    {Campo tipo Integer}
                    if (Fields[i] is TIntegerField) then
                       s := s + Union + Trim(IntToStr(Fields[i].AsInteger))
                    else
                    {Campo tipo Fecha}
                    // El formato será el del sistema en que se ejecute
                    if (Fields[i] is TDateTimeField) then
                    begin
                       if (FechaSinHora) then
                          s := s + Union + DateToStr(Fields[i].AsDateTime)
                       else
                          s := s + Union + DateTimeToStr(Fields[i].AsDateTime);
                    end
                    else
                    {Campo tipo Blob}
                    // Los blobs exportan solo caracteres basicos.
                    if (Fields[i] is TBlobField) then
                    begin
                       try
                          if (Comilla = '"') then
                             s := s + Union + Comilla + StringReplace(Trim(LimpiaCadena(Fields[i].AsString)), '"', '""', [rfReplaceAll]) + Comilla
                          else
                             s := s + Union + Comilla + Trim(LimpiaCadena(Fields[i].AsString)) + Comilla;

                             {FMain.RichEdit1.PlainText := False;
                             tmps := TStringList.Create;
                             try
                                MS := TMemoryStream.Create;
                                try
                                   tmps.Assign(xTabla.Fields[i]);
                                   tmps.SaveToStream(MS);
                                   MS.Position := 0;
                                   FMain.RichEdit1.Lines.LoadFromStream(MS);
                                finally
                                   MS.Free;
                                end;
                             finally
                                tmps.Free;
                             end;
                             FMain.RichEdit1.PlainText := True;

                             saux := '"';
                             for j := 0 to FMain.RichEdit1.Lines.Count -1 do
                                saux := saux+Trim(FMain.RichEdit1.Lines[j])+'|';

                             while (pos(#9,saux)>1) do
                             begin
                                k := pos(#9,saux);
                                saux := copy(saux,1,k-1)+' '+copy(saux,k+1,length(saux));
                             end;

                             s := s + Union + saux + '"';
                             FMain.RichEdit1.Clear;}
                       except
                          s := s + Union + Comilla + '--  ERROR  --' + Comilla;
                       end;
                    end;

                    Union := Separador;
                 end;
              end;
              ts.Add(s);

              Next;
           end;

           ts.SaveToFile(Fichero);
        finally
           ts.Free;
        end;

        Close;
        if (Transaction.InTransaction) then
           Transaction.Commit;
     end; {with xTabla}
  finally
     DSxTabla.Free;
     xTabla.Free;
     DMMain.LogFin('');
  end;
end;

procedure TDMImportarDocumentos.NTVExpClientes(Fichero: string);
var
  ts : TStrings;
begin
  ts := TStringList.Create;
  try
     with ts do
     begin
        Add(' SELECT C.CLIENTE, T.NIF, T.NOMBRE_R_SOCIAL, T.NOMBRE_COMERCIAL, T.TELEFONO01, T.TELEFONO02, T.EMAIL, D.DIR_COMPLETA_N, ');
        Add('        L.TITULO LOCALIDAD, P.TITULO PROVINCIA, L.CODIGO_POSTAL, C.AGENTE, C.TARIFA, C.DTO_CIAL_LINEA, CC.FORMA_PAGO, ');
        Add('        CASE CC.MODO_IVA ');
        Add('          WHEN 0 THEN ');
        Add('              ''EXENTO'' ');
        Add('          WHEN 1 THEN ');
        Add('              ''NORMAL'' ');
        Add('          WHEN 2 THEN ');
        Add('              ''RECARGO'' ');
        Add('          WHEN 3 THEN ');
        Add('              ''INTRACOMUNITARIO'' ');
        Add('          WHEN 4 THEN ');
        Add('              ''INTRACOMUNITARIO RECARGO'' ');
        Add('          WHEN 5 THEN ');
        Add('              ''EXTRANJERO'' ');
        Add('          ELSE ''DESCONOCIDO'' ');
        Add('        END TIPO_IMPUESTOS, ');
        Add('        CAST('''' AS VARCHAR(1)) NOTAS, C.Z_MOTIVO_BLOQUEO BLOQUEO, C.BAJA, CAST('''' AS VARCHAR(1)) PERFIL, C.ZONA, T.WEB, ');
        Add('        C.ALFA_5 CLIENTE_WEB, C.ALFA_6 PASSWORD_WEB, C.ALFA_3 CODIGO_PORTES ');
        Add(' FROM EMP_CLIENTES C ');
        Add(' JOIN SYS_TERCEROS T ON C.TERCERO = T.TERCERO ');
        Add(' LEFT JOIN SYS_TERCEROS_DIRECCIONES D ON C.TERCERO = D.TERCERO AND D.DIR_DEFECTO = 1 ');
        Add(' LEFT JOIN SYS_LOCALIDADES L ON D.ID_LOCAL = L.ID_LOCAL ');
        Add(' LEFT JOIN SYS_PROVINCIAS P ON L.PAIS = P.PAIS AND L.PROVINCIA = P.PROVINCIA ');
        Add(' JOIN CON_CUENTAS_GES_CLI CC ON C.EMPRESA = CC.EMPRESA AND C.CLIENTE = CC.CLIENTE ');
        Add(' WHERE ');
        Add(' C.EMPRESA = ' + REntorno.EmpresaStr + ' AND ');
        Add(' CC.EJERCICIO = ' + REntorno.EjercicioStr + ' AND ');
        Add(' CC.CANAL = ' + REntorno.CanalStr + ' AND ');
        Add(' C.CLIENTE > 1 AND ');
        Add(' C.EXPORTAR = 1 ');
        Add(' ORDER BY C.CLIENTE ');
     end;

     ExportarCSV(Fichero, ts.Text);
  finally
     ts.Free;
  end;
end;

procedure TDMImportarDocumentos.NTVExpDirecciones(Fichero: string);
var
  ts : TStrings;
begin
  ts := TStringList.Create;
  try
     with ts do
     begin
        Add(' SELECT C.CLIENTE, D.DIRECCION NOMBRE, DIR_TELEFONO01 TELEFONO1, DIR_TELEFONO02 TELEFONO2, CAST('''' AS VARCHAR(1)) EMAIL1, CAST('''' AS VARCHAR(1)) EMAIL2, ');
        Add('        L.TITULO LOCALIDAD, P.TITULO PROVINCIA, D.DIR_COMPLETA_N, L.CODIGO_POSTAL, T.WEB ');
        Add(' FROM EMP_CLIENTES C ');
        Add(' JOIN SYS_TERCEROS T ON C.TERCERO = T.TERCERO ');
        Add(' LEFT JOIN SYS_TERCEROS_DIRECCIONES D ON C.TERCERO = D.TERCERO AND D.DIR_DEFECTO = 0 ');
        Add(' LEFT JOIN SYS_LOCALIDADES L ON D.ID_LOCAL = L.ID_LOCAL ');
        Add(' LEFT JOIN SYS_PROVINCIAS P ON L.PAIS = P.PAIS AND L.PROVINCIA = P.PROVINCIA ');
        Add(' JOIN CON_CUENTAS_GES_CLI CC ON C.EMPRESA = CC.EMPRESA AND C.CLIENTE = CC.CLIENTE ');
        Add(' WHERE ');
        Add(' C.EMPRESA = ' + REntorno.EmpresaStr + ' AND ');
        Add(' CC.EJERCICIO = ' + REntorno.EjercicioStr + ' AND ');
        Add(' CC.CANAL = ' + REntorno.CanalStr + ' AND ');
        Add(' C.CLIENTE > 1 AND ');
        Add(' C.EXPORTAR = 1 AND ');
        Add(' D.ACTIVO = 1 ');
        Add(' ORDER BY C.CLIENTE, D.DIRECCION ');
     end;

     ExportarCSV(Fichero, ts.Text);
  finally
     ts.Free;
  end;
end;

procedure TDMImportarDocumentos.NTVExpFamilias(Fichero: string);
var
  ts : TStrings;
begin
  ts := TStringList.Create;
  try
     with ts do
     begin
        Add(' SELECT F.FAMILIA, F.TITULO DECRIPCION_FAMILIA, S.SUBFAMILIA, S.TITULO DECRIPCION_SUBFAMILIA ');
        Add(' FROM ART_FAMILIAS F ');
        Add(' JOIN ART_SUBFAMILIAS S ON F.ID_FAMILIA = S.ID_FAMILIA ');
        Add(' WHERE ');
        Add(' F.EMPRESA = ' + REntorno.EmpresaStr + ' AND ');
        Add(' F.FAMILIA <> ''' + REntorno.FamSistema + ''' ');
        Add(' ORDER BY F.FAMILIA, S.SUBFAMILIA ');
     end;

     ExportarCSV(Fichero, ts.Text);
  finally
     ts.Free;
  end;
end;

procedure TDMImportarDocumentos.NTVExpAgentes(Fichero: string);
var
  ts : TStrings;
begin
  ts := TStringList.Create;
  try
     with ts do
     begin
        Add(' SELECT A.AGENTE, T.NOMBRE_R_SOCIAL, T.NIF, A.CODIGO_NTV ');
        Add(' FROM EMP_AGENTES A ');
        Add(' JOIN SYS_TERCEROS T ON A.TERCERO = T.TERCERO ');
        Add(' WHERE ');
        Add(' A.EMPRESA = ' + REntorno.EmpresaStr + ' AND ');
        Add(' AGENTE > 0 ');
        Add(' ORDER BY AGENTE ');
     end;

     ExportarCSV(Fichero, ts.Text);
  finally
     ts.Free;
  end;
end;

procedure TDMImportarDocumentos.NTVExpFormaPago(Fichero: string);
var
  ts : TStrings;
begin
  ts := TStringList.Create;
  try
     with ts do
     begin
        Add(' SELECT FORMA FORMA_PAGO, TITULO DESCRIPCION');
        Add(' FROM VER_FORMAS_PAGO_EMP ');
        Add(' WHERE ');
        Add(' EMPRESA = ' + REntorno.EmpresaStr + ' AND ');
        Add(' EJERCICIO = ' + REntorno.EjercicioStr + ' AND ');
        Add(' CANAL = ' + REntorno.CanalStr);
        Add(' ORDER BY FORMA ');
     end;

     ExportarCSV(Fichero, ts.Text);
  finally
     ts.Free;
  end;
end;

procedure TDMImportarDocumentos.NTVExpPortes(Fichero: string);
var
  ts : TStrings;
begin
  /// Esto deberia informar de un codigo de VILALTA para el tipo de porte de los clientes

  ts := TStringList.Create;
  try
     with ts do
     begin
        Add('"CODIGO_PORTES";"DESCRIPCION"');
        Add('1;"T3 IMPORTE DE PORTES"');
        Add('2;"BD IMPORTE DE PORTES"');
        Add('3;"PORTES CANARIAS BD"');
        Add('4;"T3 PORTES PORTUGAL"');
        Add('5;"PORTES CANARIAS T3"');
        Add('6;"PORTES CEUTA T3"');
        Add('7;"PORTES BCN T3"');
        Add('8;"PORTES CEUTA BD"');
     end;

     ts.SaveToFile(Fichero);
  finally
     ts.Free;
  end;
end;

procedure TDMImportarDocumentos.NTVExpZonas(Fichero: string);
var
  ts : TStrings;
begin
  ts := TStringList.Create;
  try
     with ts do
     begin
        Add(' SELECT ZONA, TITULO DESCRIPCION');
        Add(' FROM SYS_ZONAS ');
        Add(' ORDER BY ZONA ');
     end;

     ExportarCSV(Fichero, ts.Text);
  finally
     ts.Free;
  end;
end;

function TDMImportarDocumentos.DameFacturaSegunReferenica(Serie, SerieAbono, SuReferencia: string): integer;
begin
  Serie := Copy(Serie, 1, 10);
  SuReferencia := Copy(SuReferencia, 1, 40);

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ID_S FROM GES_CABECERAS_S WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL AND SERIE IN (:SERIE, :SERIE_ABONO) AND TIPO = :TIPO AND SU_REFERENCIA = :SU_REFERENCIA';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['SERIE_ABONO'].AsString := SerieAbono;
        Params.ByName['TIPO'].AsString := 'FAC';
        Params.ByName['SU_REFERENCIA'].AsString := SuReferencia;
        ExecQuery;
        Result := FieldByName['ID_S'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;


function TDMImportarDocumentos.CreaCabecera(Cliente: integer; Fecha: TDateTime; Serie, SuReferencia: string): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT ID_S FROM WEB_INS_CABECERA_VENTA_9( ');
        SQL.Add(' :USUARIOID, ''FAC'', :CLIENTE, :REFERENCIA, :ENTRADA, ');
        SQL.Add(' :ALMACEN, :FECHA_DOC, :AGENTE, :SERIE, :RIG_IN, :EMPRESA, ');
        SQL.Add(' :CANAL, 0, :DIRECCION, :PROYECTO, ');
        SQL.Add(' 0, NULL, :OBSERVACIONES) ');
        Params.ByName['USUARIOID'].AsInteger := REntorno.Usuario;
        Params.ByName['CLIENTE'].AsInteger := Cliente;
        Params.ByName['REFERENCIA'].AsString := SuReferencia;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ALMACEN'].AsString := REntorno.AlmacenDefecto;
        Params.ByName['FECHA_DOC'].AsDateTime := Fecha;
        Params.ByName['AGENTE'].AsInteger := 0;
        Params.ByName['SERIE'].AsString := Serie;
        Params.ByName['RIG_IN'].AsInteger := 0;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['DIRECCION'].AsInteger := 0;
        Params.ByName['PROYECTO'].AsInteger := 0;
        Params.ByName['OBSERVACIONES'].AsString := _('Importado') + ' ' + DateTimeToStr(Now);
        ExecQuery;
        Result := FieldByName['ID_S'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMImportarDocumentos.CreaDetalle(id_s, id_a: integer; Descripcion: string; Cantidad, Precio, Descuento: double): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ID_DETALLES_S FROM WEB_INS_DETALLE_VENTA_2(''FAC'', :ID_S, :ID_A, :TITULO, :UNIDADES, 1, ''GRNL'', NULL, :PRECIO, 1 /*ACEPTAR_VALOR_PRECIO_CERO*/, :DESCUENTO, '''')';
        Params.ByName['ID_S'].AsInteger := ID_S;
        Params.ByName['ID_A'].AsInteger := ID_A;
        Params.ByName['TITULO'].AsString := Descripcion;
        Params.ByName['UNIDADES'].AsFloat := Cantidad;
        Params.ByName['PRECIO'].AsFloat := Precio;
        Params.ByName['DESCUENTO'].AsFloat := 0;
        ExecQuery;
        Result := FieldByName['ID_DETALLES_S'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
