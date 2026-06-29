unit UDMSincronizacionKri;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, Dialogs, HYFIBQuery,
  FIBQuery, Forms, DB, DateUtils;

type
  TDMSincronizacionKri = class(TDataModule)
     DataBase: THYDatabase;
     TLocal: THYTransaction;
     Qo: TFIBQuery;
  private
     { Private declarations }
     UltimaSincronizacion, TiempoSincronizacion: TDateTime;
  public
     { Public declarations }
     function Conectar: boolean;
     procedure SincronizaBases;
     procedure RellenaDatosDocumento(Empresa, Ejercicio, Canal: integer; Serie, Tipo: string; RIG: integer; Lineas: TStrings);
     procedure ImportarDocumento(OEmpresa, OEjercicio, OCanal: integer; OSerie, OTipo: string; ORig: integer; DSerie: string; DCliente: integer);
  end;

var
  DMSincronizacionKri : TDMSincronizacionKri;

implementation

uses UEntorno, UDMMain, UFSendCorreo, UFMain, UUtiles, UDameDato;

{$R *.dfm}

function TDMSincronizacionKri.Conectar: boolean;
var
  BaseDeDatosOri : string;
begin
  Result := True;

  BaseDeDatosOri := LeeDatoIni('SincronizacionKri', 'BaseDeDatos', '');
  try
     UltimaSincronizacion := StrToDateTime(LeeDatoIni('SincronizacionKri', 'UltimaSincronizacion', DateTimeToStr(EncodeDateTime(REntorno.Ejercicio, 01, 01, 12, 00, 00, 000))));
  except
     UltimaSincronizacion := EncodeDateTime(REntorno.Ejercicio, 01, 01, 12, 00, 00, 000);
  end;

  {Solo sincronizo como maximo los últimos 6 meses}
  if (UltimaSincronizacion < Today - 180) then
     UltimaSincronizacion := Today - 180;

  FSendCorreo := TFSendCorreo.Create(Self);
  try
     FSendCorreo.Titulo(Format(_('Sincronizando base con %s'), [BaseDeDatosOri]));
     FSendCorreo.Show;
     FSendCorreo.Texto(_('Conectando ...'));
     try
        if not DataBase.TestConnected then
        begin
           DataBase.DBName := BaseDeDatosOri;
           DataBase.DBParams.Values['password'] := REntorno.ClaveBD;
           DataBase.Open;
           TLocal.StartTransaction;

           {Busco la hora del servidor}
           if (not Qo.Transaction.InTransaction) then
              Qo.Transaction.StartTransaction;
           Qo.Close;
           Qo.SQL.Text := 'select Cast(''NOW'' as DATE) as ult_sincronizacion from rdb$database ';
           Qo.ExecQuery;
           TiempoSincronizacion := Qo.FieldByName['ULT_SINCRONIZACION'].AsDateTime;
           Qo.Transaction.Commit;
        end;
     except
        on e: Exception do
        begin
           Result := False;
           ShowMessage(Format(_('Imposible abrir %s'), [BaseDeDatosOri]) + #13#10 + E.Message);
        end;
     end;
  finally
     FreeAndNil(FSendCorreo);
  end;
end;

procedure TDMSincronizacionKri.ImportarDocumento(OEmpresa, OEjercicio, OCanal: integer; OSerie, OTipo: string; ORig: integer; DSerie: string; DCliente: integer);
var
  id_s : integer;
  Q : THYFIBQuery;
  Tarifa : string;
  Transportista : integer;
  Articulo : string;
  DRig : integer;
  TipoIVA : integer;
begin
  // Obtengo Cabecera y Detalle origen
  with Qo do
  begin
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;
     Close;
     SQL.Text := 'SELECT ID_S FROM GES_CABECERAS_S WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL AND SERIE = :SERIE AND TIPO = :TIPO AND RIG = :RIG';
     Params.ByName['EMPRESA'].AsInteger := OEmpresa;
     Params.ByName['EJERCICIO'].AsInteger := OEjercicio;
     Params.ByName['CANAL'].AsInteger := OCanal;
     Params.ByName['SERIE'].AsString := OSerie;
     Params.ByName['TIPO'].AsString := OTipo;
     Params.ByName['RIG'].AsInteger := ORIG;
     ExecQuery;
     id_s := FieldByName['ID_S'].AsInteger;
     Close;
     SQL.Text := 'SELECT LINEA, ARTICULO, TITULO, UNIDADES, PRECIO, NOTAS FROM GES_DETALLES_S WHERE ID_S = :ID_S ORDER BY LINEA';
     Params.ByName['ID_S'].AsInteger := id_s;
     ExecQuery;
  end;

  if (not Qo.EOF) then
  begin
     // Tarifa y trasnportista del cliente
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT TARIFA, TRANSPORTISTA FROM EMP_CLIENTES WHERE EMPRESA = ?EMPRESA AND CLIENTE = ?CLIENTE';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['CLIENTE'].AsInteger := DCliente;
           ExecQuery;
           Tarifa := FieldByName['TARIFA'].AsString;
           Transportista := FieldByName['TRANSPORTISTA'].AsInteger;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;

     // Creo cabecera
     id_s := DMMain.ContadorGen('ID_GES_CABECERAS_S');
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Clear;
           SQL.Add(' INSERT INTO VER_CABECERAS_FACTURA ');
           SQL.Add(' (EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, FECHA, ');
           SQL.Add(' ALMACEN, CLIENTE, DIRECCION, ENTRADA, ID_S, SU_REFERENCIA, TARIFA, ');
           SQL.Add(' TIPO_PORTES, I_PORTES, TRANSPORTISTA)');
           SQL.Add(' VALUES ');
           SQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :FECHA, ');
           SQL.Add(' :ALMACEN, :CLIENTE, :DIRECCION, :ENTRADA, :ID_S, :SU_REFERENCIA, :TARIFA, ');
           SQL.Add(' :TIPO_PORTES, :I_PORTES, :TRANSPORTISTA)');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['SERIE'].AsString := DSerie;
           Params.ByName['TIPO'].AsString := 'FAC';
           Params.ByName['RIG'].AsInteger := 0;
           Params.ByName['FECHA'].AsDateTime := Now;
           Params.ByName['ALMACEN'].AsString := REntorno.AlmacenDefecto;
           Params.ByName['CLIENTE'].AsInteger := DCliente;
           Params.ByName['DIRECCION'].AsInteger := 1;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Params.ByName['SU_REFERENCIA'].AsString := Format(_('Importacion: %s %s/%d'), [OTipo, OSerie, ORig]);
           Params.ByName['ID_S'].AsInteger := id_s;
           Params.ByName['TARIFA'].AsString := Tarifa;
           Params.ByName['TRANSPORTISTA'].AsInteger := Transportista;
           {
           if (total_shipping_tax_excl > 0) then
           begin
              Params.ByName['TIPO_PORTES'].AsInteger := 4;
              Params.ByName['I_PORTES'].AsFloat := total_shipping_tax_excl;
           end
           else
           begin
              Params.ByName['TIPO_PORTES'].AsInteger := 0;
              Params.ByName['I_PORTES'].AsFloat := 0;
           end;
           }
           ExecQuery;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;
  end;

  // Creo detalle
  DRig := 0;
  while not Qo.EOF do
  begin
     Articulo := Qo.FieldByName['ARTICULO'].AsString;
     if (DameIdArticulo(Qo.FieldByName['ARTICULO'].AsString) = 0) then
        Articulo := '.';

     // Obtengo RIG para poder hacer los inserts en el detalle
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Clear;
           SQL.Text := 'SELECT RIG, TARIFA FROM GES_CABECERAS_S WHERE ID_S = :ID_S';
           Params.ByName['ID_S'].AsInteger := id_s;
           ExecQuery;
           DRig := FieldByName['RIG'].AsInteger;
           Tarifa := FieldByName['TARIFA'].AsString;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;

     // Obtengo el Tipo de IVA del artículo
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT TIPO_IVA FROM CON_CUENTAS_GES_ART WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL AND ARTICULO = :ARTICULO';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['ARTICULO'].AsString := Articulo;
           ExecQuery;
           TipoIVA := FieldByName['TIPO_IVA'].AsInteger;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;

     // Creo linea
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := DMMain.DataBase;
           SQL.Clear;
           SQL.Add(' INSERT INTO VER_DETALLE_FACTURA ');
           SQL.Add(' (EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, ARTICULO, TITULO, UNIDADES, PRECIO, ENTRADA, ID_S, ID_DETALLES_S, ');
           SQL.Add(' TIPO_UNIDAD_LOGISTICA, TIPO_IVA, NOTAS) ');
           SQL.Add(' VALUES ');
           SQL.Add(' (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :TIPO, :RIG, :LINEA, :ARTICULO, :TITULO, :UNIDADES, :PRECIO, :ENTRADA, :ID_S, :ID_DETALLES_S, ');
           SQL.Add(' ''GRNL'', :TIPO_IVA, :NOTAS) ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['SERIE'].AsString := DSerie;
           Params.ByName['TIPO'].AsString := 'FAC';
           Params.ByName['RIG'].AsInteger := DRig;
           Params.ByName['LINEA'].AsInteger := 0;
           Params.ByName['ARTICULO'].AsString := Articulo;
           Params.ByName['TITULO'].AsString := Qo.FieldByName['TITULO'].AsString;
           Params.ByName['UNIDADES'].AsFloat := Qo.FieldByName['UNIDADES'].AsFloat;
           Params.ByName['PRECIO'].AsFloat := Qo.FieldByName['PRECIO'].AsFloat;
           Params.ByName['TIPO_IVA'].AsInteger := TipoIVA;
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Params.ByName['ID_S'].AsInteger := id_s;
           Params.ByName['ID_DETALLES_S'].AsInteger := DMMain.ContadorGen('ID_GES_DETALLES_S');
           Params.ByName['NOTAS'].AsString := Qo.FieldByName['NOTAS'].AsString;
           ExecQuery;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;

     Qo.Next;
  end;
  Qo.Close;
  Qo.Transaction.Commit;

  FMain.MuestraDocumento(REntorno.Ejercicio, 'FAC', DSerie, DRig);
end;

procedure TDMSincronizacionKri.RellenaDatosDocumento(Empresa, Ejercicio, Canal: integer; Serie, Tipo: string; RIG: integer; Lineas: TStrings);
var
  Cliente : integer;
begin
  Lineas.Clear;
  with Qo do
  begin
     if (not Transaction.InTransaction) then
        Transaction.StartTransaction;
     Close;
     SQL.Text := 'SELECT CLIENTE, FECHA, S_BASES, S_CUOTA_IVA, LIQUIDO FROM GES_CABECERAS_S WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL AND SERIE = :SERIE AND TIPO = :TIPO AND RIG = :RIG';
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['TIPO'].AsString := Tipo;
     Params.ByName['RIG'].AsInteger := RIG;
     ExecQuery;
     Cliente := FieldByName['CLIENTE'].AsInteger;
     Lineas.Add(Format(_('Fecha   : %s'), [DateTimeToStr(FieldByName['FECHA'].AsDateTime)]));
     Lineas.Add(Format(_('Base    : %s'), [FieldByName['S_BASES'].AsString]));
     Lineas.Add(Format(_('IVA     : %s'), [FieldByName['S_CUOTA_IVA'].AsString]));
     Lineas.Add(Format(_('Liquido : %s'), [FieldByName['LIQUIDO'].AsString]));
     Lineas.Add(Format(_('Cliente : %s'), [FieldByName['CLIENTE'].AsString]));
     Close;
     SQL.Text := 'SELECT TITULO FROM VER_CLIENTES_EF WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL AND CLIENTE = :CLIENTE';
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['CLIENTE'].AsInteger := Cliente;
     ExecQuery;
     Lineas.Add(Format(_('Nombre  : %s'), [FieldByName['TITULO'].AsString]));
     Lineas.Add('--------------------------------------------------');
     Lineas.Add('Linea Articulo          Unidades   Precio');
     Close;
     SQL.Text := 'SELECT LINEA, ARTICULO, UNIDADES, PRECIO FROM GES_DETALLES_S WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL AND SERIE = :SERIE AND TIPO = :TIPO AND RIG = :RIG ORDER BY LINEA';
     Params.ByName['EMPRESA'].AsInteger := Empresa;
     Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Params.ByName['CANAL'].AsInteger := Canal;
     Params.ByName['SERIE'].AsString := Serie;
     Params.ByName['TIPO'].AsString := Tipo;
     Params.ByName['RIG'].AsInteger := RIG;
     ExecQuery;
     while not EOF do
     begin
        Lineas.Add(Format(_('%5d %-15s x %8.n = %10.2n'), [FieldByName['LINEA'].AsInteger, FieldByName['ARTICULO'].AsString, FieldByName['UNIDADES'].AsFloat, FieldByName['PRECIO'].AsFloat]));
        Next;
     end;
     Close;
     Transaction.Commit;
  end;
end;

procedure TDMSincronizacionKri.SincronizaBases;
var
  Q : THYFIBQuery;
  hayerror : boolean;
  existe : boolean;
begin
  hayerror := False;
  if (Conectar) then
  begin
     FSendCorreo := TFSendCorreo.Create(Self);
     try
        FSendCorreo.Titulo(Format(_('Sincronizando base con %s'), [DataBase.DBName]));
        FSendCorreo.Show;
        Application.ProcessMessages;

        { Sincronizar CON_CUENTAS }
        {
        EMPRESA,EJERCICIO,CANAL,CUENTA,TITULO,SUPERIOR,
        NIVEL,TIPO,GESTION,TIPO_TERCERO,REG_CIERRE,
        CENTRO_COSTE,RESTRICCION
        }
        if (not hayerror) then
        begin
           if (not Qo.Transaction.InTransaction) then
              Qo.Transaction.StartTransaction;
           Qo.Close;
           Qo.SQL.Text := 'select * from con_cuentas where empresa=?empresa and canal=1 and ult_modificacion>=?ult_sincronizacion order by nivel,ejercicio,cuenta';
           Qo.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Qo.Params.ByName['ULT_SINCRONIZACION'].AsDateTime := UltimaSincronizacion;
           Qo.ExecQuery;
           while not Qo.EOF do
           begin
              FSendCorreo.Texto(_('Sincronizando Cuentas') + #13#10 + Qo.FieldByName['EJERCICIO'].AsString + '-' + Qo.FieldByName['CUENTA'].AsString);

              Q := THYFIBQuery.Create(nil);
              with Q do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT COUNT(*) FROM CON_CUENTAS WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=1 AND CUENTA=?CUENTA';
                 Q.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Q.Params.ByName['EJERCICIO'].AsInteger := Qo.FieldByName['EJERCICIO'].AsInteger;
                 Q.Params.ByName['CUENTA'].AsString := Qo.FieldByName['CUENTA'].AsString;
                 ExecQuery;
                 existe := FieldByName['COUNT'].AsInteger > 0;
                 FreeHandle;
              end;
              FreeAndNil(Q);
              if (existe) then
              begin
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'UPDATE CON_CUENTAS SET TITULO=?TITULO,SUPERIOR=?SUPERIOR, ' +
                       'NIVEL=?NIVEL,TIPO=?TIPO,GESTION=?GESTION,TIPO_TERCERO=?TIPO_TERCERO,REG_CIERRE=?REG_CIERRE, ' +
                       'CENTRO_COSTE=?CENTRO_COSTE,RESTRICCION=?RESTRICCION ' +
                       'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=1 AND CUENTA=?CUENTA';
                    Q.Params.ByName['EMPRESA'].AsInteger := Qo.FieldByName['EMPRESA'].AsInteger;
                    Q.Params.ByName['EJERCICIO'].AsInteger := Qo.FieldByName['EJERCICIO'].AsInteger;
                    Q.Params.ByName['CUENTA'].AsString := Qo.FieldByName['CUENTA'].AsString;
                    Q.Params.ByName['TITULO'].AsString := Qo.FieldByName['TITULO'].AsString;
                    Q.Params.ByName['SUPERIOR'].AsString := Qo.FieldByName['SUPERIOR'].AsString;
                    Q.Params.ByName['NIVEL'].AsInteger := Qo.FieldByName['NIVEL'].AsInteger;
                    Q.Params.ByName['TIPO'].AsInteger := Qo.FieldByName['TIPO'].AsInteger;
                    Q.Params.ByName['GESTION'].AsInteger := Qo.FieldByName['GESTION'].AsInteger;
                    Q.Params.ByName['TIPO_TERCERO'].AsInteger := Qo.FieldByName['TIPO_TERCERO'].AsInteger;
                    Q.Params.ByName['REG_CIERRE'].AsInteger := Qo.FieldByName['REG_CIERRE'].AsInteger;
                    Q.Params.ByName['CENTRO_COSTE'].AsInteger := Qo.FieldByName['CENTRO_COSTE'].AsInteger;
                    Q.Params.ByName['RESTRICCION'].AsInteger := Qo.FieldByName['RESTRICCION'].AsInteger;
                    try
                       ExecQuery;
                    except
                       on e: Exception do
                          MessageDlg('UPD CON_CUENTAS' + #13#10 + e.Message, mtError, [mbOK], 0);
                    end;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
              end
              else
              begin
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'INSERT INTO CON_CUENTAS (EMPRESA,EJERCICIO,CANAL,CUENTA,TITULO,SUPERIOR, ' +
                       'NIVEL,TIPO,GESTION,TIPO_TERCERO,REG_CIERRE, ' +
                       'CENTRO_COSTE,RESTRICCION) ' +
                       'VALUES(?EMPRESA,?EJERCICIO,1,?CUENTA,?TITULO,?SUPERIOR, ' +
                       '?NIVEL,?TIPO,?GESTION,?TIPO_TERCERO,?REG_CIERRE, ' +
                       '?CENTRO_COSTE,?RESTRICCION) ';
                    Q.Params.ByName['EMPRESA'].AsInteger := Qo.FieldByName['EMPRESA'].AsInteger;
                    Q.Params.ByName['EJERCICIO'].AsInteger := Qo.FieldByName['EJERCICIO'].AsInteger;
                    Q.Params.ByName['CUENTA'].AsString := Qo.FieldByName['CUENTA'].AsString;
                    Q.Params.ByName['TITULO'].AsString := Qo.FieldByName['TITULO'].AsString;
                    Q.Params.ByName['SUPERIOR'].AsString := Qo.FieldByName['SUPERIOR'].AsString;
                    Q.Params.ByName['NIVEL'].AsInteger := Qo.FieldByName['NIVEL'].AsInteger;
                    Q.Params.ByName['TIPO'].AsInteger := Qo.FieldByName['TIPO'].AsInteger;
                    Q.Params.ByName['GESTION'].AsInteger := Qo.FieldByName['GESTION'].AsInteger;
                    Q.Params.ByName['TIPO_TERCERO'].AsInteger := Qo.FieldByName['TIPO_TERCERO'].AsInteger;
                    Q.Params.ByName['REG_CIERRE'].AsInteger := Qo.FieldByName['REG_CIERRE'].AsInteger;
                    Q.Params.ByName['CENTRO_COSTE'].AsInteger := Qo.FieldByName['CENTRO_COSTE'].AsInteger;
                    Q.Params.ByName['RESTRICCION'].AsInteger := Qo.FieldByName['RESTRICCION'].AsInteger;
                    try
                       ExecQuery;
                    except
                       on e: Exception do
                          MessageDlg('INS CON_CUENTAS' + #13#10 + e.Message, mtError, [mbOK], 0);
                    end;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
              end;
              Qo.Next;
           end; {while not eof}
        end;

        { Sincronizar ART_FAMILIAS }
        if (not hayerror) then
        begin
           FSendCorreo.Texto(_('Sincronizando Familias'));

           if (not Qo.Transaction.InTransaction) then
              Qo.Transaction.StartTransaction;
           Qo.Close;
           Qo.SQL.Text := 'select * from art_familias where empresa=?empresa and ult_modificacion>=?ult_sincronizacion order by familia';
           Qo.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Qo.Params.ByName['ULT_SINCRONIZACION'].AsDateTime := UltimaSincronizacion;
           Qo.ExecQuery;
           while not Qo.EOF do
           begin
              FSendCorreo.Texto(_('Sincronizando Familias') + #13#10 + Qo.FieldByName['FAMILIA'].AsString);

              Q := THYFIBQuery.Create(nil);
              with Q do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT COUNT(*) FROM ART_FAMILIAS WHERE EMPRESA=?EMPRESA AND FAMILIA=?FAMILIA';
                 Q.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Q.Params.ByName['FAMILIA'].AsString := Qo.FieldByName['FAMILIA'].AsString;
                 ExecQuery;
                 existe := FieldByName['COUNT'].AsInteger > 0;
                 FreeHandle;
              end;
              FreeAndNil(Q);
              if (existe) then
              begin
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'UPDATE ART_FAMILIAS SET TITULO=?TITULO, ACT_TAR_AUTOM=?ACT_TAR_AUTOM, MARGEN=?MARGEN, TIPO_REDONDEO=?TIPO_REDONDEO WHERE EMPRESA=?EMPRESA AND FAMILIA=?FAMILIA';
                    Q.Params.ByName['EMPRESA'].AsInteger := Qo.FieldByName['EMPRESA'].AsInteger;
                    Q.Params.ByName['FAMILIA'].AsString := Qo.FieldByName['FAMILIA'].AsString;
                    Q.Params.ByName['TITULO'].AsString := Qo.FieldByName['TITULO'].AsString;
                    Q.Params.ByName['ACT_TAR_AUTOM'].AsInteger := Qo.FieldByName['ACT_TAR_AUTOM'].AsInteger;
                    Q.Params.ByName['MARGEN'].AsFloat := Qo.FieldByName['MARGEN'].AsFloat;
                    Q.Params.ByName['TIPO_REDONDEO'].AsInteger := Qo.FieldByName['TIPO_REDONDEO'].AsInteger;
                    try
                       ExecQuery;
                    except
                       on e: Exception do
                          MessageDlg('UPD ART_FAMILIAS' + #13#10 + e.Message, mtError, [mbOK], 0);
                    end;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
              end
              else
              begin
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'INSERT INTO ART_FAMILIAS (EMPRESA,FAMILIA,TITULO,ACT_TAR_AUTOM,MARGEN,TIPO_REDONDEO) VALUES(?EMPRESA,?FAMILIA,?TITULO,?ACT_TAR_AUTOM,?MARGEN,?TIPO_REDONDEO)';
                    Q.Params.ByName['EMPRESA'].AsInteger := Qo.FieldByName['EMPRESA'].AsInteger;
                    Q.Params.ByName['FAMILIA'].AsString := Qo.FieldByName['FAMILIA'].AsString;
                    Q.Params.ByName['TITULO'].AsString := Qo.FieldByName['TITULO'].AsString;
                    Q.Params.ByName['ACT_TAR_AUTOM'].AsInteger := Qo.FieldByName['ACT_TAR_AUTOM'].AsInteger;
                    Q.Params.ByName['MARGEN'].AsFloat := Qo.FieldByName['MARGEN'].AsFloat;
                    Q.Params.ByName['TIPO_REDONDEO'].AsInteger := Qo.FieldByName['TIPO_REDONDEO'].AsInteger;
                    try
                       ExecQuery;
                    except
                       on e: Exception do
                          MessageDlg('INS ART_FAMILIAS' + #13#10 + e.Message, mtError, [mbOK], 0);
                    end;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
              end;
              Qo.Next;
           end; {while not eof}
        end;

        { Sincronizar CON_CUENTAS_GES_FAM }
        if (not hayerror) then
        begin
           FSendCorreo.Texto(_('Sincronizando Familias - Cuentas'));

           if (not Qo.Transaction.InTransaction) then
              Qo.Transaction.StartTransaction;
           Qo.Close;
           Qo.SQL.Text := 'select * from con_cuentas_ges_fam where empresa=?empresa and canal=1 and ult_modificacion>=?ult_sincronizacion order by ejercicio,familia';
           Qo.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Qo.Params.ByName['ULT_SINCRONIZACION'].AsDateTime := UltimaSincronizacion;
           Qo.ExecQuery;
           while not Qo.EOF do
           begin
              FSendCorreo.Texto(_('Sincronizando Familias - Cuentas') + #13#10 + Qo.FieldByName['EJERCICIO'].AsString + '-' + Qo.FieldByName['FAMILIA'].AsString);
              Q := THYFIBQuery.Create(nil);
              with Q do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT COUNT(*) FROM CON_CUENTAS_GES_FAM WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=1 AND FAMILIA=?FAMILIA';
                 Q.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Q.Params.ByName['EJERCICIO'].AsInteger := Qo.FieldByName['EJERCICIO'].AsInteger;
                 Q.Params.ByName['FAMILIA'].AsString := Qo.FieldByName['FAMILIA'].AsString;
                 ExecQuery;
                 existe := FieldByName['COUNT'].AsInteger > 0;
                 FreeHandle;
              end;
              FreeAndNil(Q);
              if (existe) then
              begin
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'UPDATE CON_CUENTAS_GES_FAM SET CTA_COMPRAS=?CTA_COMPRAS,CTA_VENTAS=?CTA_VENTAS,PAIS=?PAIS,TIPO_IVA=?TIPO_IVA,VENTA=?VENTA,PTO_VERDE=?PTO_VERDE, ' +
                       'CTA_DEVOLUCION_COMPRAS=?CTA_DEVOLUCION_COMPRAS,CTA_DEVOLUCION_VENTAS=?CTA_DEVOLUCION_VENTAS,CTA_ABONO_COMPRAS=?CTA_ABONO_COMPRAS, ' +
                       'CTA_ABONO_VENTAS=?CTA_ABONO_VENTAS WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=1 AND FAMILIA=?FAMILIA';
                    Q.Params.ByName['EMPRESA'].AsInteger := Qo.FieldByName['EMPRESA'].AsInteger;
                    Q.Params.ByName['EJERCICIO'].AsInteger := Qo.FieldByName['EJERCICIO'].AsInteger;
                    Q.Params.ByName['FAMILIA'].AsString := Qo.FieldByName['FAMILIA'].AsString;
                    Q.Params.ByName['CTA_COMPRAS'].AsString := Qo.FieldByName['CTA_COMPRAS'].AsString;
                    Q.Params.ByName['CTA_VENTAS'].AsString := Qo.FieldByName['CTA_VENTAS'].AsString;
                    Q.Params.ByName['PAIS'].AsString := Qo.FieldByName['PAIS'].AsString;
                    Q.Params.ByName['TIPO_IVA'].AsInteger := Qo.FieldByName['TIPO_IVA'].AsInteger;
                    Q.Params.ByName['VENTA'].AsInteger := Qo.FieldByName['VENTA'].AsInteger;
                    Q.Params.ByName['PTO_VERDE'].AsFloat := Qo.FieldByName['PTO_VERDE'].AsFloat;
                    Q.Params.ByName['CTA_DEVOLUCION_COMPRAS'].AsString := Qo.FieldByName['CTA_DEVOLUCION_COMPRAS'].AsString;
                    Q.Params.ByName['CTA_DEVOLUCION_VENTAS'].AsString := Qo.FieldByName['CTA_DEVOLUCION_VENTAS'].AsString;
                    Q.Params.ByName['CTA_ABONO_COMPRAS'].AsString := Qo.FieldByName['CTA_ABONO_COMPRAS'].AsString;
                    Q.Params.ByName['CTA_ABONO_VENTAS'].AsString := Qo.FieldByName['CTA_ABONO_VENTAS'].AsString;
                    try
                       ExecQuery;
                    except
                       on e: Exception do
                          MessageDlg('INS CON_CUENTAS_GES_FAM' + #13#10 + e.Message, mtError, [mbOK], 0);
                    end;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
              end
              else
              begin
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'INSERT INTO CON_CUENTAS_GES_FAM (EMPRESA,EJERCICIO,CANAL,FAMILIA,CTA_COMPRAS,CTA_VENTAS,PAIS,TIPO_IVA,VENTA,PTO_VERDE, ' +
                       'CTA_DEVOLUCION_COMPRAS,CTA_DEVOLUCION_VENTAS,CTA_ABONO_COMPRAS,CTA_ABONO_VENTAS) ' +
                       'VALUES(?EMPRESA,?EJERCICIO,1,?FAMILIA,?CTA_COMPRAS,?CTA_VENTAS,?PAIS,?TIPO_IVA,?VENTA,?PTO_VERDE, ' +
                       '?CTA_DEVOLUCION_COMPRAS,?CTA_DEVOLUCION_VENTAS,?CTA_ABONO_COMPRAS,?CTA_ABONO_VENTAS) ';
                    Q.Params.ByName['EMPRESA'].AsInteger := Qo.FieldByName['EMPRESA'].AsInteger;
                    Q.Params.ByName['EJERCICIO'].AsInteger := Qo.FieldByName['EJERCICIO'].AsInteger;
                    Q.Params.ByName['FAMILIA'].AsString := Qo.FieldByName['FAMILIA'].AsString;
                    Q.Params.ByName['CTA_COMPRAS'].AsString := Qo.FieldByName['CTA_COMPRAS'].AsString;
                    Q.Params.ByName['CTA_VENTAS'].AsString := Qo.FieldByName['CTA_VENTAS'].AsString;
                    Q.Params.ByName['PAIS'].AsString := Qo.FieldByName['PAIS'].AsString;
                    Q.Params.ByName['TIPO_IVA'].AsInteger := Qo.FieldByName['TIPO_IVA'].AsInteger;
                    Q.Params.ByName['VENTA'].AsInteger := Qo.FieldByName['VENTA'].AsInteger;
                    Q.Params.ByName['PTO_VERDE'].AsFloat := Qo.FieldByName['PTO_VERDE'].AsFloat;
                    Q.Params.ByName['CTA_DEVOLUCION_COMPRAS'].AsString := Qo.FieldByName['CTA_DEVOLUCION_COMPRAS'].AsString;
                    Q.Params.ByName['CTA_DEVOLUCION_VENTAS'].AsString := Qo.FieldByName['CTA_DEVOLUCION_VENTAS'].AsString;
                    Q.Params.ByName['CTA_ABONO_COMPRAS'].AsString := Qo.FieldByName['CTA_ABONO_COMPRAS'].AsString;
                    Q.Params.ByName['CTA_ABONO_VENTAS'].AsString := Qo.FieldByName['CTA_ABONO_VENTAS'].AsString;
                    try
                       ExecQuery;
                    except
                       on e: Exception do
                          MessageDlg('UPD CON_CUENTAS_GES_FAM' + #13#10 + e.Message, mtError, [mbOK], 0);
                    end;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
              end;
              Qo.Next;
           end; {while not eof}
        end;

        { Sincronizar ART_ARTICULOS }
        {Las notas no se sincronizan
         Las Imagenes no se sincronizan}
        if (not hayerror) then
        begin
           FSendCorreo.Texto(_('Sincronizando Articulos'));
           if (not Qo.Transaction.InTransaction) then
              Qo.Transaction.StartTransaction;
           Qo.Close;
           Qo.SQL.Text := 'select * from art_articulos where empresa=?empresa and ult_modificacion>=?ult_sincronizacion order by articulo';
           Qo.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Qo.Params.ByName['ULT_SINCRONIZACION'].AsDateTime := UltimaSincronizacion;
           Qo.ExecQuery;
           while not Qo.EOF do
           begin
              FSendCorreo.Texto(_('Sincronizando Articulos') + #13#10 + Qo.FieldByName['ARTICULO'].AsString);

              Q := THYFIBQuery.Create(nil);
              with Q do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT COUNT(*) FROM ART_ARTICULOS WHERE EMPRESA=?EMPRESA AND ARTICULO=?ARTICULO';
                 Q.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Q.Params.ByName['ARTICULO'].AsString := Qo.FieldByName['ARTICULO'].AsString;
                 ExecQuery;
                 existe := FieldByName['COUNT'].AsInteger > 0;
                 FreeHandle;
              end;
              FreeAndNil(Q);
              if (existe) then
              begin
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'UPDATE ART_ARTICULOS SET TITULO=?TITULO,FAMILIA=?FAMILIA,P_COSTE=?P_COSTE,CONTROL_STOCK=?CONTROL_STOCK,UNIDADES=?UNIDADES,VIRTUAL=?VIRTUAL,TITULO_CORTO=?TITULO_CORTO, ' +
                       'CONTROLA_MEDIDAS=?CONTROLA_MEDIDAS,SERIALIZADO=?SERIALIZADO,GARANTIA=?GARANTIA,DESCUENTO=?DESCUENTO,DESCUENTO_2=?DESCUENTO_2,DESCUENTO_3=?DESCUENTO_3,ALFA_1=?ALFA_1,ALFA_2=?ALFA_2, ' +
                       'DISPONIBILIDAD=?DISPONIBILIDAD,SERIALIZADO_KRI=?SERIALIZADO_KRI,PVP_POR_UD_SECUNDARIA=?PVP_POR_UD_SECUNDARIA,ALFA_3=?ALFA_3,ALFA_4=?ALFA_4,ALFA_5=?ALFA_5, ' +
                       'LOTES_KRI=?LOTES_KRI,LOTES=?LOTES,MULTIPLO_1=?MULTIPLO_1,MULTIPLO_2=?MULTIPLO_2,MULTIPLO_3=?MULTIPLO_3,MULTIPLO_4=?MULTIPLO_4,FACTOR_ESCALA=?FACTOR_ESCALA, ' +
                       'UD_MINIMO_COMPRA=?UD_MINIMO_COMPRA,UD_MINIMO_VENTA=?UD_MINIMO_VENTA,CODIGO_INTRA=?CODIGO_INTRA,PESO=?PESO,UBICABLE=?UBICABLE, ' +
                       'DEFECTO_UD_SECUNDARIA=?DEFECTO_UD_SECUNDARIA,VOLUMEN_UNIT=?VOLUMEN_UNIT,DIAMETRO_UNIT=?DIAMETRO_UNIT ' +
                       'WHERE EMPRESA=?EMPRESA AND ARTICULO=?ARTICULO';
                    Q.Params.ByName['EMPRESA'].AsInteger := Qo.FieldByName['EMPRESA'].AsInteger;
                    Q.Params.ByName['ARTICULO'].AsString := Qo.FieldByName['ARTICULO'].AsString;
                    Q.Params.ByName['TITULO'].AsString := Qo.FieldByName['TITULO'].AsString;
                    Q.Params.ByName['FAMILIA'].AsString := Qo.FieldByName['FAMILIA'].AsString;
                    Q.Params.ByName['P_COSTE'].AsFloat := Qo.FieldByName['P_COSTE'].AsFloat;
                    Q.Params.ByName['CONTROL_STOCK'].AsInteger := Qo.FieldByName['CONTROL_STOCK'].AsInteger;
                    Q.Params.ByName['UNIDADES'].AsString := Qo.FieldByName['UNIDADES'].AsString;
                    Q.Params.ByName['VIRTUAL'].AsInteger := Qo.FieldByName['VIRTUAL'].AsInteger;
                    Q.Params.ByName['TITULO_CORTO'].AsString := Qo.FieldByName['TITULO_CORTO'].AsString;
                    Q.Params.ByName['CONTROLA_MEDIDAS'].AsInteger := Qo.FieldByName['CONTROLA_MEDIDAS'].AsInteger;
                    Q.Params.ByName['SERIALIZADO'].AsInteger := Qo.FieldByName['SERIALIZADO'].AsInteger;
                    Q.Params.ByName['GARANTIA'].AsInteger := Qo.FieldByName['GARANTIA'].AsInteger;
                    Q.Params.ByName['DESCUENTO'].AsFloat := Qo.FieldByName['DESCUENTO'].AsFloat;
                    Q.Params.ByName['DESCUENTO_2'].AsFloat := Qo.FieldByName['DESCUENTO_2'].AsFloat;
                    Q.Params.ByName['DESCUENTO_3'].AsFloat := Qo.FieldByName['DESCUENTO_3'].AsFloat;
                    Q.Params.ByName['ALFA_1'].AsString := Qo.FieldByName['ALFA_1'].AsString;
                    Q.Params.ByName['ALFA_2'].AsString := Qo.FieldByName['ALFA_2'].AsString;
                    Q.Params.ByName['DISPONIBILIDAD'].AsInteger := Qo.FieldByName['DISPONIBILIDAD'].AsInteger;
                    Q.Params.ByName['SERIALIZADO_KRI'].AsInteger := Qo.FieldByName['SERIALIZADO_KRI'].AsInteger;
                    Q.Params.ByName['PVP_POR_UD_SECUNDARIA'].AsInteger := Qo.FieldByName['PVP_POR_UD_SECUNDARIA'].AsInteger;
                    Q.Params.ByName['ALFA_3'].AsString := Qo.FieldByName['ALFA_3'].AsString;
                    Q.Params.ByName['ALFA_4'].AsString := Qo.FieldByName['ALFA_4'].AsString;
                    Q.Params.ByName['ALFA_5'].AsString := Qo.FieldByName['ALFA_5'].AsString;
                    Q.Params.ByName['LOTES_KRI'].AsInteger := Qo.FieldByName['LOTES_KRI'].AsInteger;
                    Q.Params.ByName['LOTES'].AsFloat := Qo.FieldByName['LOTES'].AsFloat;
                    Q.Params.ByName['MULTIPLO_1'].AsFloat := Qo.FieldByName['MULTIPLO_1'].AsFloat;
                    Q.Params.ByName['MULTIPLO_2'].AsFloat := Qo.FieldByName['MULTIPLO_2'].AsFloat;
                    Q.Params.ByName['MULTIPLO_3'].AsFloat := Qo.FieldByName['MULTIPLO_3'].AsFloat;
                    Q.Params.ByName['MULTIPLO_4'].AsFloat := Qo.FieldByName['MULTIPLO_4'].AsFloat;
                    Q.Params.ByName['FACTOR_ESCALA'].AsFloat := Qo.FieldByName['FACTOR_ESCALA'].AsFloat;
                    Q.Params.ByName['UD_MINIMO_COMPRA'].AsFloat := Qo.FieldByName['UD_MINIMO_COMPRA'].AsFloat;
                    Q.Params.ByName['UD_MINIMO_VENTA'].AsFloat := Qo.FieldByName['UD_MINIMO_VENTA'].AsFloat;
                    Q.Params.ByName['CODIGO_INTRA'].AsString := Qo.FieldByName['CODIGO_INTRA'].AsString;
                    Q.Params.ByName['PESO'].AsFloat := Qo.FieldByName['PESO'].AsFloat;
                    Q.Params.ByName['UBICABLE'].AsInteger := Qo.FieldByName['UBICABLE'].AsInteger;
                    Q.Params.ByName['DEFECTO_UD_SECUNDARIA'].AsFloat := Qo.FieldByName['DEFECTO_UD_SECUNDARIA'].AsFloat;
                    Q.Params.ByName['VOLUMEN_UNIT'].AsFloat := Qo.FieldByName['VOLUMEN_UNIT'].AsFloat;
                    Q.Params.ByName['DIAMETRO_UNIT'].AsFloat := Qo.FieldByName['DIAMETRO_UNIT'].AsFloat;
                    try
                       ExecQuery;
                    except
                       on e: Exception do
                          MessageDlg('INS ART_ARTICULOS' + #13#10 + e.Message, mtError, [mbOK], 0);
                    end;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
              end
              else
              begin
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'INSERT INTO ART_ARTICULOS (EMPRESA,ARTICULO,TITULO,FAMILIA,P_COSTE,CONTROL_STOCK,UNIDADES,VIRTUAL,TITULO_CORTO, ' +
                       'CONTROLA_MEDIDAS,SERIALIZADO,GARANTIA,DESCUENTO,DESCUENTO_2,DESCUENTO_3,ALFA_1,ALFA_2, ' +
                       'DISPONIBILIDAD,SERIALIZADO_KRI,PVP_POR_UD_SECUNDARIA,ALFA_3,ALFA_4,ALFA_5, ' +
                       'LOTES_KRI,LOTES,MULTIPLO_1,MULTIPLO_2,MULTIPLO_3,MULTIPLO_4,FACTOR_ESCALA, ' +
                       'UD_MINIMO_COMPRA,UD_MINIMO_VENTA,CODIGO_INTRA,PESO,UBICABLE, ' +
                       'DEFECTO_UD_SECUNDARIA,VOLUMEN_UNIT,DIAMETRO_UNIT,ENTRADA) ' +
                       'VALUES(?EMPRESA,?ARTICULO,?TITULO,?FAMILIA,?P_COSTE,?CONTROL_STOCK,?UNIDADES,?VIRTUAL,?TITULO_CORTO, ' +
                       '?CONTROLA_MEDIDAS,?SERIALIZADO,?GARANTIA,?DESCUENTO,?DESCUENTO_2,?DESCUENTO_3,?ALFA_1,?ALFA_2, ' +
                       '?DISPONIBILIDAD,?SERIALIZADO_KRI,?PVP_POR_UD_SECUNDARIA,?ALFA_3,?ALFA_4,?ALFA_5, ' +
                       '?LOTES_KRI,?LOTES,?MULTIPLO_1,?MULTIPLO_2,?MULTIPLO_3,?MULTIPLO_4,?FACTOR_ESCALA, ' +
                       '?UD_MINIMO_COMPRA,?UD_MINIMO_VENTA,?CODIGO_INTRA,?PESO,?UBICABLE, ' +
                       '?DEFECTO_UD_SECUNDARIA,?VOLUMEN_UNIT,?DIAMETRO_UNIT,?ENTRADA) ';
                    Q.Params.ByName['EMPRESA'].AsInteger := Qo.FieldByName['EMPRESA'].AsInteger;
                    Q.Params.ByName['ARTICULO'].AsString := Qo.FieldByName['ARTICULO'].AsString;
                    Q.Params.ByName['TITULO'].AsString := Qo.FieldByName['TITULO'].AsString;
                    Q.Params.ByName['FAMILIA'].AsString := Qo.FieldByName['FAMILIA'].AsString;
                    Q.Params.ByName['P_COSTE'].AsFloat := Qo.FieldByName['P_COSTE'].AsFloat;
                    Q.Params.ByName['CONTROL_STOCK'].AsInteger := Qo.FieldByName['CONTROL_STOCK'].AsInteger;
                    Q.Params.ByName['UNIDADES'].AsString := Qo.FieldByName['UNIDADES'].AsString;
                    Q.Params.ByName['VIRTUAL'].AsInteger := Qo.FieldByName['VIRTUAL'].AsInteger;
                    Q.Params.ByName['TITULO_CORTO'].AsString := Qo.FieldByName['TITULO_CORTO'].AsString;
                    Q.Params.ByName['CONTROLA_MEDIDAS'].AsInteger := Qo.FieldByName['CONTROLA_MEDIDAS'].AsInteger;
                    Q.Params.ByName['SERIALIZADO'].AsInteger := Qo.FieldByName['SERIALIZADO'].AsInteger;
                    Q.Params.ByName['GARANTIA'].AsInteger := Qo.FieldByName['GARANTIA'].AsInteger;
                    Q.Params.ByName['DESCUENTO'].AsFloat := Qo.FieldByName['DESCUENTO'].AsFloat;
                    Q.Params.ByName['DESCUENTO_2'].AsFloat := Qo.FieldByName['DESCUENTO_2'].AsFloat;
                    Q.Params.ByName['DESCUENTO_3'].AsFloat := Qo.FieldByName['DESCUENTO_3'].AsFloat;
                    Q.Params.ByName['ALFA_1'].AsString := Qo.FieldByName['ALFA_1'].AsString;
                    Q.Params.ByName['ALFA_2'].AsString := Qo.FieldByName['ALFA_2'].AsString;
                    Q.Params.ByName['DISPONIBILIDAD'].AsInteger := Qo.FieldByName['DISPONIBILIDAD'].AsInteger;
                    Q.Params.ByName['SERIALIZADO_KRI'].AsInteger := Qo.FieldByName['SERIALIZADO_KRI'].AsInteger;
                    Q.Params.ByName['PVP_POR_UD_SECUNDARIA'].AsInteger := Qo.FieldByName['PVP_POR_UD_SECUNDARIA'].AsInteger;
                    Q.Params.ByName['ALFA_3'].AsString := Qo.FieldByName['ALFA_3'].AsString;
                    Q.Params.ByName['ALFA_4'].AsString := Qo.FieldByName['ALFA_4'].AsString;
                    Q.Params.ByName['ALFA_5'].AsString := Qo.FieldByName['ALFA_5'].AsString;
                    Q.Params.ByName['LOTES_KRI'].AsInteger := Qo.FieldByName['LOTES_KRI'].AsInteger;
                    Q.Params.ByName['LOTES'].AsFloat := Qo.FieldByName['LOTES'].AsFloat;
                    Q.Params.ByName['MULTIPLO_1'].AsFloat := Qo.FieldByName['MULTIPLO_1'].AsFloat;
                    Q.Params.ByName['MULTIPLO_2'].AsFloat := Qo.FieldByName['MULTIPLO_2'].AsFloat;
                    Q.Params.ByName['MULTIPLO_3'].AsFloat := Qo.FieldByName['MULTIPLO_3'].AsFloat;
                    Q.Params.ByName['MULTIPLO_4'].AsFloat := Qo.FieldByName['MULTIPLO_4'].AsFloat;
                    Q.Params.ByName['FACTOR_ESCALA'].AsFloat := Qo.FieldByName['FACTOR_ESCALA'].AsFloat;
                    Q.Params.ByName['UD_MINIMO_COMPRA'].AsFloat := Qo.FieldByName['UD_MINIMO_COMPRA'].AsFloat;
                    Q.Params.ByName['UD_MINIMO_VENTA'].AsFloat := Qo.FieldByName['UD_MINIMO_VENTA'].AsFloat;
                    Q.Params.ByName['CODIGO_INTRA'].AsString := Qo.FieldByName['CODIGO_INTRA'].AsString;
                    Q.Params.ByName['PESO'].AsFloat := Qo.FieldByName['PESO'].AsFloat;
                    Q.Params.ByName['UBICABLE'].AsInteger := Qo.FieldByName['UBICABLE'].AsInteger;
                    Q.Params.ByName['DEFECTO_UD_SECUNDARIA'].AsFloat := Qo.FieldByName['DEFECTO_UD_SECUNDARIA'].AsFloat;
                    Q.Params.ByName['VOLUMEN_UNIT'].AsFloat := Qo.FieldByName['VOLUMEN_UNIT'].AsFloat;
                    Q.Params.ByName['DIAMETRO_UNIT'].AsFloat := Qo.FieldByName['DIAMETRO_UNIT'].AsFloat;
                    Q.Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                    try
                       ExecQuery;
                    except
                       on e: Exception do
                          MessageDlg('UPD ART_ARTICULOS' + #13#10 + e.Message, mtError, [mbOK], 0);
                    end;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
              end;
              Qo.Next;
           end; {while not eof}
        end;

        { Sincronizar CON_CUENTAS_GES_ART }
        if (not hayerror) then
        begin
           FSendCorreo.Texto(_('Sincronizando Articulos - Cuentas'));

           if (not Qo.Transaction.InTransaction) then
              Qo.Transaction.StartTransaction;
           Qo.Close;
           Qo.SQL.Text := 'select * from con_cuentas_ges_art where empresa=?empresa and canal=1 and ult_modificacion>=?ult_sincronizacion order by ejercicio,articulo';
           Qo.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Qo.Params.ByName['ULT_SINCRONIZACION'].AsDateTime := UltimaSincronizacion;
           Qo.ExecQuery;
           while not Qo.EOF do
           begin
              FSendCorreo.Texto(_('Sincronizando Articulos - Cuentas') + #13#10 + Qo.FieldByName['EJERCICIO'].AsString + '-' + Qo.FieldByName['ARTICULO'].AsString);
              Q := THYFIBQuery.Create(nil);
              with Q do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT COUNT(*) FROM CON_CUENTAS_GES_ART WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=1 AND ARTICULO=?ARTICULO';
                 Q.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Q.Params.ByName['EJERCICIO'].AsInteger := Qo.FieldByName['EJERCICIO'].AsInteger;
                 Q.Params.ByName['ARTICULO'].AsString := Qo.FieldByName['ARTICULO'].AsString;
                 ExecQuery;
                 existe := FieldByName['COUNT'].AsInteger > 0;
                 FreeHandle;
              end;
              FreeAndNil(Q);
              if (existe) then
              begin
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'UPDATE CON_CUENTAS_GES_ART SET CTA_COMPRAS=?CTA_COMPRAS,CTA_VENTAS=?CTA_VENTAS, ' +
                       'PAIS=?PAIS,TIPO_IVA=?TIPO_IVA,DISPONIBILIDAD=?DISPONIBILIDAD,ACTUALIZA_VENTA=?ACTUALIZA_VENTA,PTO_VERDE=?PTO_VERDE, ' +
                       'IVA_ESCANDALLO=?IVA_ESCANDALLO,TITULO=?TITULO,FAMILIA=?FAMILIA,CTA_DEVOLUCION_COMPRAS=?CTA_DEVOLUCION_COMPRAS, ' +
                       'CTA_DEVOLUCION_VENTAS=?CTA_DEVOLUCION_VENTAS,CTA_ABONO_COMPRAS=?CTA_ABONO_COMPRAS,CTA_ABONO_VENTAS=?CTA_ABONO_VENTAS ' +
                       'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=1 AND ARTICULO=?ARTICULO';
                    Q.Params.ByName['EMPRESA'].AsInteger := Qo.FieldByName['EMPRESA'].AsInteger;
                    Q.Params.ByName['EJERCICIO'].AsInteger := Qo.FieldByName['EJERCICIO'].AsInteger;
                    Q.Params.ByName['ARTICULO'].AsString := Qo.FieldByName['ARTICULO'].AsString;
                    Q.Params.ByName['CTA_COMPRAS'].AsString := Qo.FieldByName['CTA_COMPRAS'].AsString;
                    Q.Params.ByName['CTA_VENTAS'].AsString := Qo.FieldByName['CTA_VENTAS'].AsString;
                    Q.Params.ByName['PAIS'].AsString := Qo.FieldByName['PAIS'].AsString;
                    Q.Params.ByName['TIPO_IVA'].AsInteger := Qo.FieldByName['TIPO_IVA'].AsInteger;
                    Q.Params.ByName['DISPONIBILIDAD'].AsInteger := Qo.FieldByName['DISPONIBILIDAD'].AsInteger;
                    Q.Params.ByName['ACTUALIZA_VENTA'].AsInteger := Qo.FieldByName['ACTUALIZA_VENTA'].AsInteger;
                    Q.Params.ByName['PTO_VERDE'].AsFloat := Qo.FieldByName['PTO_VERDE'].AsFloat;
                    Q.Params.ByName['IVA_ESCANDALLO'].AsInteger := Qo.FieldByName['IVA_ESCANDALLO'].AsInteger;
                    Q.Params.ByName['TITULO'].AsString := Qo.FieldByName['TITULO'].AsString;
                    Q.Params.ByName['FAMILIA'].AsString := Qo.FieldByName['FAMILIA'].AsString;
                    Q.Params.ByName['CTA_DEVOLUCION_COMPRAS'].AsString := Qo.FieldByName['CTA_DEVOLUCION_COMPRAS'].AsString;
                    Q.Params.ByName['CTA_DEVOLUCION_VENTAS'].AsString := Qo.FieldByName['CTA_DEVOLUCION_VENTAS'].AsString;
                    Q.Params.ByName['CTA_ABONO_COMPRAS'].AsString := Qo.FieldByName['CTA_ABONO_COMPRAS'].AsString;
                    Q.Params.ByName['CTA_ABONO_VENTAS'].AsString := Qo.FieldByName['CTA_ABONO_VENTAS'].AsString;
                    try
                       ExecQuery;
                    except
                       on e: Exception do
                          MessageDlg('UPD CON_CUENTAS_GES_ART' + #13#10 + e.Message, mtError, [mbOK], 0);
                    end;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
              end
              else
              begin
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'INSERT INTO CON_CUENTAS_GES_ART (EMPRESA,EJERCICIO,CANAL,ARTICULO,CTA_COMPRAS,CTA_VENTAS, ' +
                       'PAIS,TIPO_IVA,DISPONIBILIDAD,ACTUALIZA_VENTA,PTO_VERDE, ' +
                       'IVA_ESCANDALLO,TITULO,FAMILIA,CTA_DEVOLUCION_COMPRAS, ' +
                       'CTA_DEVOLUCION_VENTAS,CTA_ABONO_COMPRAS,CTA_ABONO_VENTAS) ' +
                       'VALUES(?EMPRESA,?EJERCICIO,1,?ARTICULO,?CTA_COMPRAS,?CTA_VENTAS, ' +
                       '?PAIS,?TIPO_IVA,?DISPONIBILIDAD,?ACTUALIZA_VENTA,?PTO_VERDE, ' +
                       '?IVA_ESCANDALLO,?TITULO,?FAMILIA,?CTA_DEVOLUCION_COMPRAS, ' +
                       '?CTA_DEVOLUCION_VENTAS,?CTA_ABONO_COMPRAS,?CTA_ABONO_VENTAS) ';
                    Q.Params.ByName['EMPRESA'].AsInteger := Qo.FieldByName['EMPRESA'].AsInteger;
                    Q.Params.ByName['EJERCICIO'].AsInteger := Qo.FieldByName['EJERCICIO'].AsInteger;
                    Q.Params.ByName['ARTICULO'].AsString := Qo.FieldByName['ARTICULO'].AsString;
                    Q.Params.ByName['CTA_COMPRAS'].AsString := Qo.FieldByName['CTA_COMPRAS'].AsString;
                    Q.Params.ByName['CTA_VENTAS'].AsString := Qo.FieldByName['CTA_VENTAS'].AsString;
                    Q.Params.ByName['PAIS'].AsString := Qo.FieldByName['PAIS'].AsString;
                    Q.Params.ByName['TIPO_IVA'].AsInteger := Qo.FieldByName['TIPO_IVA'].AsInteger;
                    Q.Params.ByName['DISPONIBILIDAD'].AsInteger := Qo.FieldByName['DISPONIBILIDAD'].AsInteger;
                    Q.Params.ByName['ACTUALIZA_VENTA'].AsInteger := Qo.FieldByName['ACTUALIZA_VENTA'].AsInteger;
                    Q.Params.ByName['PTO_VERDE'].AsFloat := Qo.FieldByName['PTO_VERDE'].AsFloat;
                    Q.Params.ByName['IVA_ESCANDALLO'].AsInteger := Qo.FieldByName['IVA_ESCANDALLO'].AsInteger;
                    Q.Params.ByName['TITULO'].AsString := Qo.FieldByName['TITULO'].AsString;
                    Q.Params.ByName['FAMILIA'].AsString := Qo.FieldByName['FAMILIA'].AsString;
                    Q.Params.ByName['CTA_DEVOLUCION_COMPRAS'].AsString := Qo.FieldByName['CTA_DEVOLUCION_COMPRAS'].AsString;
                    Q.Params.ByName['CTA_DEVOLUCION_VENTAS'].AsString := Qo.FieldByName['CTA_DEVOLUCION_VENTAS'].AsString;
                    Q.Params.ByName['CTA_ABONO_COMPRAS'].AsString := Qo.FieldByName['CTA_ABONO_COMPRAS'].AsString;
                    Q.Params.ByName['CTA_ABONO_VENTAS'].AsString := Qo.FieldByName['CTA_ABONO_VENTAS'].AsString;
                    try
                       ExecQuery;
                    except
                       on e: Exception do
                          MessageDlg('INS CON_CUENTAS_GES_ART' + #13#10 + e.Message, mtError, [mbOK], 0);
                    end;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
              end;
              Qo.Next;
           end; {while not eof}
        end;

        { Sincronizar SYS_TERCEROS }
        {Notas e Imagen no se actualizan}
        if (not hayerror) then
        begin
           FSendCorreo.Texto(_('Sincronizando Terceros'));

           if (not Qo.Transaction.InTransaction) then
              Qo.Transaction.StartTransaction;
           Qo.Close;
           Qo.SQL.Text := 'select * from sys_terceros where ult_modificacion>=?ult_sincronizacion order by tercero';
           Qo.Params.ByName['ULT_SINCRONIZACION'].AsDateTime := UltimaSincronizacion;
           Qo.ExecQuery;
           while not Qo.EOF do
           begin
              FSendCorreo.Texto(_('Sincronizando Terceros') + #13#10 + Qo.FieldByName['TERCERO'].AsString);

              Q := THYFIBQuery.Create(nil);
              with Q do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT COUNT(*) FROM SYS_TERCEROS WHERE TERCERO=?TERCERO';
                 Q.Params.ByName['TERCERO'].AsInteger := Qo.FieldByName['TERCERO'].AsInteger;
                 ExecQuery;
                 existe := FieldByName['COUNT'].AsInteger > 0;
                 FreeHandle;
              end;
              FreeAndNil(Q);
              if (existe) then
              begin
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'UPDATE SYS_TERCEROS SET NOMBRE_R_SOCIAL=?NOMBRE_R_SOCIAL,NOMBRE_COMERCIAL=?NOMBRE_COMERCIAL,TIPO_RAZON=?TIPO_RAZON,NIF=?NIF, ' +
                       'FECHA_ALTA=?FECHA_ALTA,TELEFONO01=?TELEFONO01,TELEFONO02=?TELEFONO02,TELEFAX=?TELEFAX,EMAIL=?EMAIL,WEB=?WEB, ' +
                       'CLIENTE_POTENCIAL=?CLIENTE_POTENCIAL,CODIGO_EDI=?CODIGO_EDI,REGISTRO_MERCANTIL=?REGISTRO_MERCANTIL,COD_CREDITO_Y_CAUCION=?COD_CREDITO_Y_CAUCION ' +
                       'WHERE TERCERO=?TERCERO';
                    Q.Params.ByName['TERCERO'].AsInteger := Qo.FieldByName['TERCERO'].AsInteger;
                    Q.Params.ByName['NOMBRE_R_SOCIAL'].AsString := Qo.FieldByName['NOMBRE_R_SOCIAL'].AsString;
                    Q.Params.ByName['NOMBRE_COMERCIAL'].AsString := Qo.FieldByName['NOMBRE_COMERCIAL'].AsString;
                    Q.Params.ByName['TIPO_RAZON'].AsString := Qo.FieldByName['TIPO_RAZON'].AsString;
                    Q.Params.ByName['NIF'].AsString := Qo.FieldByName['NIF'].AsString;
                    Q.Params.ByName['FECHA_ALTA'].AsDateTime := Qo.FieldByName['FECHA_ALTA'].AsDateTime;
                    Q.Params.ByName['NIF'].AsString := Qo.FieldByName['NIF'].AsString;
                    Q.Params.ByName['TELEFONO01'].AsString := Qo.FieldByName['TELEFONO01'].AsString;
                    Q.Params.ByName['TELEFONO02'].AsString := Qo.FieldByName['TELEFONO02'].AsString;
                    Q.Params.ByName['TELEFAX'].AsString := Qo.FieldByName['TELEFAX'].AsString;
                    Q.Params.ByName['EMAIL'].AsString := Qo.FieldByName['EMAIL'].AsString;
                    Q.Params.ByName['WEB'].AsString := Qo.FieldByName['WEB'].AsString;
                    Q.Params.ByName['CLIENTE_POTENCIAL'].AsInteger := Qo.FieldByName['CLIENTE_POTENCIAL'].AsInteger;
                    Q.Params.ByName['CODIGO_EDI'].AsString := Qo.FieldByName['CODIGO_EDI'].AsString;
                    Q.Params.ByName['REGISTRO_MERCANTIL'].AsString := Qo.FieldByName['REGISTRO_MERCANTIL'].AsString;
                    Q.Params.ByName['COD_CREDITO_Y_CAUCION'].AsInteger := Qo.FieldByName['COD_CREDITO_Y_CAUCION'].AsInteger;
                    try
                       ExecQuery;
                    except
                       on e: Exception do
                          MessageDlg('UPD SYS_TERCEROS' + #13#10 + e.Message, mtError, [mbOK], 0);
                    end;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
              end
              else
              begin
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'INSERT INTO SYS_TERCEROS (TERCERO,NOMBRE_R_SOCIAL,NOMBRE_COMERCIAL,TIPO_RAZON,NIF, ' +
                       'FECHA_ALTA,TELEFONO01,TELEFONO02,TELEFAX,EMAIL,WEB, ' +
                       'CLIENTE_POTENCIAL,CODIGO_EDI,REGISTRO_MERCANTIL,COD_CREDITO_Y_CAUCION) ' +
                       'VALUES(?TERCERO,?NOMBRE_R_SOCIAL,?NOMBRE_COMERCIAL,?TIPO_RAZON,?NIF, ' +
                       '?FECHA_ALTA,?TELEFONO01,?TELEFONO02,?TELEFAX,?EMAIL,?WEB, ' +
                       '?CLIENTE_POTENCIAL,?CODIGO_EDI,?REGISTRO_MERCANTIL,?COD_CREDITO_Y_CAUCION) ';
                    Q.Params.ByName['TERCERO'].AsInteger := Qo.FieldByName['TERCERO'].AsInteger;
                    Q.Params.ByName['NOMBRE_R_SOCIAL'].AsString := Qo.FieldByName['NOMBRE_R_SOCIAL'].AsString;
                    Q.Params.ByName['NOMBRE_COMERCIAL'].AsString := Qo.FieldByName['NOMBRE_COMERCIAL'].AsString;
                    Q.Params.ByName['TIPO_RAZON'].AsString := Qo.FieldByName['TIPO_RAZON'].AsString;
                    Q.Params.ByName['NIF'].AsString := Qo.FieldByName['NIF'].AsString;
                    Q.Params.ByName['FECHA_ALTA'].AsDateTime := Qo.FieldByName['FECHA_ALTA'].AsDateTime;
                    Q.Params.ByName['NIF'].AsString := Qo.FieldByName['NIF'].AsString;
                    Q.Params.ByName['TELEFONO01'].AsString := Qo.FieldByName['TELEFONO01'].AsString;
                    Q.Params.ByName['TELEFONO02'].AsString := Qo.FieldByName['TELEFONO02'].AsString;
                    Q.Params.ByName['TELEFAX'].AsString := Qo.FieldByName['TELEFAX'].AsString;
                    Q.Params.ByName['EMAIL'].AsString := Qo.FieldByName['EMAIL'].AsString;
                    Q.Params.ByName['WEB'].AsString := Qo.FieldByName['WEB'].AsString;
                    Q.Params.ByName['CLIENTE_POTENCIAL'].AsInteger := Qo.FieldByName['CLIENTE_POTENCIAL'].AsInteger;
                    Q.Params.ByName['CODIGO_EDI'].AsString := Qo.FieldByName['CODIGO_EDI'].AsString;
                    Q.Params.ByName['REGISTRO_MERCANTIL'].AsString := Qo.FieldByName['REGISTRO_MERCANTIL'].AsString;
                    Q.Params.ByName['COD_CREDITO_Y_CAUCION'].AsInteger := Qo.FieldByName['COD_CREDITO_Y_CAUCION'].AsInteger;
                    try
                       ExecQuery;
                    except
                       on e: Exception do
                          MessageDlg('INS SYS_TERCEROS' + #13#10 + e.Message, mtError, [mbOK], 0);
                    end;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
              end;
              Qo.Next;
           end; {while not eof}
        end;

        { Sincronizar SYS_TERCEROS_DIRECCIONES }
        {Notas no se actualiza}
        {
      TERCERO,DIRECCION,DIR_TIPO,DIR_NOMBRE,DIR_NOMBRE_2,DIR_NUMERO,
      DIR_BLOQUE_ESCALERA,DIR_PISO,DIR_PUERTA,DIR_LOCALIDAD,DIR_CLASE,
      DIR_TELEFONO01,DIR_TELEFONO02,DIR_TELEFAX,CODIGO_EDI,DIR_DEFECTO
      }
        if (not hayerror) then
        begin
           FSendCorreo.Texto(_('Sincronizando Terceros - Direcciones'));

           if (not Qo.Transaction.InTransaction) then
              Qo.Transaction.StartTransaction;
           Qo.Close;
           Qo.SQL.Text := 'select * from sys_terceros_direcciones where ult_modificacion>=?ult_sincronizacion order by tercero,direccion';
           Qo.Params.ByName['ULT_SINCRONIZACION'].AsDateTime := UltimaSincronizacion;
           Qo.ExecQuery;
           while not Qo.EOF do
           begin
              FSendCorreo.Texto(_('Sincronizando Terceros - Direcciones') + #13#10 + Qo.FieldByName['TERCERO'].AsString + ' - ' + Qo.FieldByName['DIRECCION'].AsString);

              Q := THYFIBQuery.Create(nil);
              with Q do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT COUNT(*) FROM SYS_TERCEROS_DIRECCIONES WHERE TERCERO=?TERCERO AND DIRECCION=?DIRECCION';
                 Q.Params.ByName['TERCERO'].AsInteger := Qo.FieldByName['TERCERO'].AsInteger;
                 Q.Params.ByName['DIRECCION'].AsInteger := Qo.FieldByName['DIRECCION'].AsInteger;
                 ExecQuery;
                 existe := FieldByName['COUNT'].AsInteger > 0;
                 FreeHandle;
              end;
              FreeAndNil(Q);
              if (existe) then
              begin
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'UPDATE SYS_TERCEROS_DIRECCIONES SET DIR_TIPO=?DIR_TIPO,DIR_NOMBRE=?DIR_NOMBRE,DIR_NOMBRE_2=?DIR_NOMBRE_2,DIR_NUMERO=?DIR_NUMERO, ' +
                       'DIR_BLOQUE_ESCALERA=?DIR_BLOQUE_ESCALERA,DIR_PISO=?DIR_PISO,DIR_PUERTA=?DIR_PUERTA,DIR_LOCALIDAD=?DIR_LOCALIDAD,DIR_CLASE=?DIR_CLASE, ' +
                       'DIR_TELEFONO01=?DIR_TELEFONO01,DIR_TELEFONO02=?DIR_TELEFONO02,DIR_TELEFAX=?DIR_TELEFAX,CODIGO_EDI=?CODIGO_EDI,DIR_DEFECTO=?DIR_DEFECTO ' +
                       'WHERE TERCERO=?TERCERO AND DIRECCION=?DIRECCION';
                    Q.Params.ByName['TERCERO'].AsInteger := Qo.FieldByName['TERCERO'].AsInteger;
                    Q.Params.ByName['DIRECCION'].AsInteger := Qo.FieldByName['DIRECCION'].AsInteger;
                    Q.Params.ByName['DIR_TIPO'].AsString := Qo.FieldByName['DIR_TIPO'].AsString;
                    Q.Params.ByName['DIR_NOMBRE'].AsString := Qo.FieldByName['DIR_NOMBRE'].AsString;
                    Q.Params.ByName['DIR_NOMBRE_2'].AsString := Qo.FieldByName['DIR_NOMBRE_2'].AsString;
                    Q.Params.ByName['DIR_NUMERO'].AsString := Qo.FieldByName['DIR_NUMERO'].AsString;
                    Q.Params.ByName['DIR_BLOQUE_ESCALERA'].AsString := Qo.FieldByName['DIR_BLOQUE_ESCALERA'].AsString;
                    Q.Params.ByName['DIR_PISO'].AsString := Qo.FieldByName['DIR_PISO'].AsString;
                    Q.Params.ByName['DIR_PUERTA'].AsString := Qo.FieldByName['DIR_PUERTA'].AsString;
                    Q.Params.ByName['DIR_LOCALIDAD'].AsString := Qo.FieldByName['DIR_LOCALIDAD'].AsString;
                    Q.Params.ByName['DIR_CLASE'].AsInteger := Qo.FieldByName['DIR_CLASE'].AsInteger;
                    Q.Params.ByName['DIR_TELEFONO01'].AsString := Qo.FieldByName['DIR_TELEFONO01'].AsString;
                    Q.Params.ByName['DIR_TELEFONO02'].AsString := Qo.FieldByName['DIR_TELEFONO02'].AsString;
                    Q.Params.ByName['DIR_TELEFAX'].AsString := Qo.FieldByName['DIR_TELEFAX'].AsString;
                    Q.Params.ByName['CODIGO_EDI'].AsString := Qo.FieldByName['CODIGO_EDI'].AsString;
                    Q.Params.ByName['DIR_DEFECTO'].AsInteger := Qo.FieldByName['DIR_DEFECTO'].AsInteger;
                    try
                       ExecQuery;
                    except
                       on e: Exception do
                          MessageDlg('UPD SYS_TERCEROS_DIRECCIONES' + #13#10 + e.Message, mtError, [mbOK], 0);
                    end;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
              end
              else
              begin
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'INSERT INTO SYS_TERCEROS_DIRECCIONES (TERCERO,DIRECCION,DIR_TIPO,DIR_NOMBRE,DIR_NOMBRE_2,DIR_NUMERO, ' +
                       'DIR_BLOQUE_ESCALERA,DIR_PISO,DIR_PUERTA,DIR_LOCALIDAD,DIR_CLASE, ' +
                       'DIR_TELEFONO01,DIR_TELEFONO02,DIR_TELEFAX,CODIGO_EDI,DIR_DEFECTO) ' +
                       'VALUES(?TERCERO,?DIRECCION,?DIR_TIPO,?DIR_NOMBRE,?DIR_NOMBRE_2,?DIR_NUMERO, ' +
                       '?DIR_BLOQUE_ESCALERA,?DIR_PISO,?DIR_PUERTA,?DIR_LOCALIDAD,?DIR_CLASE, ' +
                       '?DIR_TELEFONO01,?DIR_TELEFONO02,?DIR_TELEFAX,?CODIGO_EDI,?DIR_DEFECTO) ';
                    Q.Params.ByName['TERCERO'].AsInteger := Qo.FieldByName['TERCERO'].AsInteger;
                    Q.Params.ByName['DIRECCION'].AsInteger := Qo.FieldByName['DIRECCION'].AsInteger;
                    Q.Params.ByName['DIR_TIPO'].AsString := Qo.FieldByName['DIR_TIPO'].AsString;
                    Q.Params.ByName['DIR_NOMBRE'].AsString := Qo.FieldByName['DIR_NOMBRE'].AsString;
                    Q.Params.ByName['DIR_NOMBRE_2'].AsString := Qo.FieldByName['DIR_NOMBRE_2'].AsString;
                    Q.Params.ByName['DIR_NUMERO'].AsString := Qo.FieldByName['DIR_NUMERO'].AsString;
                    Q.Params.ByName['DIR_BLOQUE_ESCALERA'].AsString := Qo.FieldByName['DIR_BLOQUE_ESCALERA'].AsString;
                    Q.Params.ByName['DIR_PISO'].AsString := Qo.FieldByName['DIR_PISO'].AsString;
                    Q.Params.ByName['DIR_PUERTA'].AsString := Qo.FieldByName['DIR_PUERTA'].AsString;
                    Q.Params.ByName['DIR_LOCALIDAD'].AsString := Qo.FieldByName['DIR_LOCALIDAD'].AsString;
                    Q.Params.ByName['DIR_CLASE'].AsInteger := Qo.FieldByName['DIR_CLASE'].AsInteger;
                    Q.Params.ByName['DIR_TELEFONO01'].AsString := Qo.FieldByName['DIR_TELEFONO01'].AsString;
                    Q.Params.ByName['DIR_TELEFONO02'].AsString := Qo.FieldByName['DIR_TELEFONO02'].AsString;
                    Q.Params.ByName['DIR_TELEFAX'].AsString := Qo.FieldByName['DIR_TELEFAX'].AsString;
                    Q.Params.ByName['CODIGO_EDI'].AsString := Qo.FieldByName['CODIGO_EDI'].AsString;
                    Q.Params.ByName['DIR_DEFECTO'].AsInteger := Qo.FieldByName['DIR_DEFECTO'].AsInteger;
                    try
                       ExecQuery;
                    except
                       on e: Exception do
                          MessageDlg('INS SYS_TERCEROS_DIRECCIONES' + #13#10 + e.Message, mtError, [mbOK], 0);
                    end;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
              end;
              Qo.Next;
           end; {while not eof}
        end;

        { Sincronizar EMP_CLIENTES }
        {Notas y Notas Factracion no se sincroniza}
        {
      EMPRESA,CLIENTE,TERCERO,TARIFA,RIESGO_AUT,RIESGO_ACT,DIA_PAGO_1,DIA_PAGO_2,
      DESCUENTO_PP,AGENTE,RIESGO_FAC,RIESGO_ALB,RIESGO_CAR,RIESGO_REM,TIPO,PORTES,
      DESCUENTO_CIAL,USAR_ANTICIPOS,SU_PROVEEDOR,EVAL_FEB,EVAL_FEB_SI,TRANSPORTISTA,
      FINANCIACION,FACTURAR_DIRECCION,FACTURAR_AGENTE,FACTURAR_TRANSPORTISTA,
      FACTURAR_REFERENCIA,FACTURA_DIRECCION_ADMTVA,ALBARAN_DIRECCION_ENVIO,
      POR_FINANCIACION,NO_ALB_FAC,NO_VENTA_RIESGO,FACTURAR_SERIE,SERIE_A_FACTURAR,
      SU_REFERENCIA,FACTURAR_ALMACEN,NRO_EMPLEADOS,FACTURACION_TOTAL,
      CONSUMO_MATERIAL,PROVEEDORES_HABITUALES,RUTA,CLIENTE_POTENCIAL,CREDITO_Y_CAUCION,
      MOROSO,TIPO_CLIENTE,FACTURAR_TARIFA,NO_CALC_DESC_KRI,NO_AGRUPAR_PED_KRI,
      POTENCIAL_DE_COMPRA,RIESGO_FACTOR,INTRA,
      INTRA_TRANS,PAIS_C2,DIAS_ENTREGA,IDIOMA,APLICAR_PTO_VERDE,FACTURAS_POR_EMAIL_KRI,
      FRECUENCIA
      }
        if (not hayerror) then
        begin
           FSendCorreo.Texto(_('Sincronizando Clientes'));

           if (not Qo.Transaction.InTransaction) then
              Qo.Transaction.StartTransaction;
           Qo.Close;
           Qo.SQL.Text := 'select * from emp_clientes where empresa=?empresa and ult_modificacion>=?ult_sincronizacion order by cliente';
           Qo.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Qo.Params.ByName['ULT_SINCRONIZACION'].AsDateTime := UltimaSincronizacion;
           Qo.ExecQuery;
           while not Qo.EOF do
           begin
              FSendCorreo.Texto(_('Sincronizando Clientes') + #13#10 + Qo.FieldByName['CLIENTE'].AsString);

              Q := THYFIBQuery.Create(nil);
              with Q do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT COUNT(*) FROM EMP_CLIENTES WHERE EMPRESA=?EMPRESA AND CLIENTE=?CLIENTE';
                 Q.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Q.Params.ByName['CLIENTE'].AsInteger := Qo.FieldByName['CLIENTE'].AsInteger;
                 ExecQuery;
                 existe := FieldByName['COUNT'].AsInteger > 0;
                 FreeHandle;
              end;
              FreeAndNil(Q);
              if (existe) then
              begin
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'UPDATE EMP_CLIENTES SET TERCERO=?TERCERO,TARIFA=?TARIFA,RIESGO_AUT=?RIESGO_AUT,RIESGO_ACT=?RIESGO_ACT,DIA_PAGO_1=?DIA_PAGO_1,DIA_PAGO_2=?DIA_PAGO_2, ' +
                       'DESCUENTO_PP=?DESCUENTO_PP,AGENTE=?AGENTE,RIESGO_FAC=?RIESGO_FAC,RIESGO_ALB=?RIESGO_ALB,RIESGO_CAR=?RIESGO_CAR,RIESGO_REM=?RIESGO_REM,TIPO=?TIPO,PORTES=?PORTES, ' +
                       'DESCUENTO_CIAL=?DESCUENTO_CIAL,USAR_ANTICIPOS=?USAR_ANTICIPOS,SU_PROVEEDOR=?SU_PROVEEDOR,EVAL_FEB=?EVAL_FEB,EVAL_FEB_SI=?EVAL_FEB_SI,TRANSPORTISTA=?TRANSPORTISTA, ' +
                       'FINANCIACION=?FINANCIACION,FACTURAR_DIRECCION=?FACTURAR_DIRECCION,FACTURAR_AGENTE=?FACTURAR_AGENTE,FACTURAR_TRANSPORTISTA=?FACTURAR_TRANSPORTISTA, ' +
                       'FACTURAR_REFERENCIA=?FACTURAR_REFERENCIA,FACTURA_DIRECCION_ADMTVA=?FACTURA_DIRECCION_ADMTVA,ALBARAN_DIRECCION_ENVIO=?ALBARAN_DIRECCION_ENVIO, ' +
                       'POR_FINANCIACION=?POR_FINANCIACION,NO_ALB_FAC=?NO_ALB_FAC,NO_VENTA_RIESGO=?NO_VENTA_RIESGO,FACTURAR_SERIE=?FACTURAR_SERIE,SERIE_A_FACTURAR=?SERIE_A_FACTURAR, ' +
                       'SU_REFERENCIA=?SU_REFERENCIA,FACTURAR_ALMACEN=?FACTURAR_ALMACEN,NRO_EMPLEADOS=?NRO_EMPLEADOS,FACTURACION_TOTAL=?FACTURACION_TOTAL, ' +
                       'CONSUMO_MATERIAL=?CONSUMO_MATERIAL,PROVEEDORES_HABITUALES=?PROVEEDORES_HABITUALES,RUTA=?RUTA,CLIENTE_POTENCIAL=?CLIENTE_POTENCIAL,CREDITO_Y_CAUCION=?CREDITO_Y_CAUCION, ' +
                       'MOROSO=?MOROSO,TIPO_CLIENTE=?TIPO_CLIENTE,FACTURAR_TARIFA=?FACTURAR_TARIFA,NO_CALC_DESC_KRI=?NO_CALC_DESC_KRI,NO_AGRUPAR_PED_KRI=?NO_AGRUPAR_PED_KRI, ' +
                       'POTENCIAL_DE_COMPRA=?POTENCIAL_DE_COMPRA,RIESGO_FACTOR=?RIESGO_FACTOR,INTRA=?INTRA, ' +
                       'INTRA_TRANS=?INTRA_TRANS,PAIS_C2=?PAIS_C2,DIAS_ENTREGA=?DIAS_ENTREGA,IDIOMA=?IDIOMA,APLICAR_PTO_VERDE=?APLICAR_PTO_VERDE,FACTURAS_POR_EMAIL_KRI=?FACTURAS_POR_EMAIL_KRI, ' +
                       'FRECUENCIA=?FRECUENCIA ' +
                       'WHERE EMPRESA=?EMPRESA AND CLIENTE=?CLIENTE';
                    Q.Params.ByName['EMPRESA'].AsInteger := Qo.FieldByName['EMPRESA'].AsInteger;
                    Q.Params.ByName['CLIENTE'].AsInteger := Qo.FieldByName['CLIENTE'].AsInteger;
                    Q.Params.ByName['TERCERO'].AsInteger := Qo.FieldByName['TERCERO'].AsInteger;
                    Q.Params.ByName['TARIFA'].AsString := Qo.FieldByName['TARIFA'].AsString;
                    Q.Params.ByName['RIESGO_AUT'].AsFloat := Qo.FieldByName['RIESGO_AUT'].AsFloat;
                    Q.Params.ByName['RIESGO_ACT'].AsFloat := Qo.FieldByName['RIESGO_ACT'].AsFloat;
                    Q.Params.ByName['DIA_PAGO_1'].AsInteger := Qo.FieldByName['DIA_PAGO_1'].AsInteger;
                    Q.Params.ByName['DIA_PAGO_2'].AsInteger := Qo.FieldByName['DIA_PAGO_2'].AsInteger;
                    Q.Params.ByName['DESCUENTO_PP'].AsFloat := Qo.FieldByName['DESCUENTO_PP'].AsFloat;
                    Q.Params.ByName['AGENTE'].AsInteger := Qo.FieldByName['AGENTE'].AsInteger;
                    Q.Params.ByName['RIESGO_FAC'].AsFloat := Qo.FieldByName['RIESGO_FAC'].AsFloat;
                    Q.Params.ByName['RIESGO_ALB'].AsFloat := Qo.FieldByName['RIESGO_ALB'].AsFloat;
                    Q.Params.ByName['RIESGO_CAR'].AsFloat := Qo.FieldByName['RIESGO_CAR'].AsFloat;
                    Q.Params.ByName['RIESGO_REM'].AsFloat := Qo.FieldByName['RIESGO_REM'].AsFloat;
                    Q.Params.ByName['TIPO'].AsInteger := Qo.FieldByName['TIPO'].AsInteger;
                    Q.Params.ByName['PORTES'].AsInteger := Qo.FieldByName['PORTES'].AsInteger;
                    Q.Params.ByName['DESCUENTO_CIAL'].AsFloat := Qo.FieldByName['DESCUENTO_CIAL'].AsFloat;
                    Q.Params.ByName['USAR_ANTICIPOS'].AsInteger := Qo.FieldByName['USAR_ANTICIPOS'].AsInteger;
                    Q.Params.ByName['SU_PROVEEDOR'].AsString := Qo.FieldByName['SU_PROVEEDOR'].AsString;
                    Q.Params.ByName['EVAL_FEB'].AsInteger := Qo.FieldByName['EVAL_FEB'].AsInteger;
                    Q.Params.ByName['EVAL_FEB_SI'].AsInteger := Qo.FieldByName['EVAL_FEB_SI'].AsInteger;
                    Q.Params.ByName['TRANSPORTISTA'].AsInteger := Qo.FieldByName['TRANSPORTISTA'].AsInteger;
                    Q.Params.ByName['FACTURAR_REFERENCIA'].AsInteger := Qo.FieldByName['FACTURAR_REFERENCIA'].AsInteger;
                    Q.Params.ByName['FACTURA_DIRECCION_ADMTVA'].AsInteger := Qo.FieldByName['FACTURA_DIRECCION_ADMTVA'].AsInteger;
                    Q.Params.ByName['ALBARAN_DIRECCION_ENVIO'].AsInteger := Qo.FieldByName['ALBARAN_DIRECCION_ENVIO'].AsInteger;
                    Q.Params.ByName['POR_FINANCIACION'].AsFloat := Qo.FieldByName['POR_FINANCIACION'].AsFloat;
                    Q.Params.ByName['NO_ALB_FAC'].AsInteger := Qo.FieldByName['NO_ALB_FAC'].AsInteger;
                    Q.Params.ByName['NO_VENTA_RIESGO'].AsInteger := Qo.FieldByName['NO_VENTA_RIESGO'].AsInteger;
                    Q.Params.ByName['FACTURAR_SERIE'].AsInteger := Qo.FieldByName['FACTURAR_SERIE'].AsInteger;
                    Q.Params.ByName['SERIE_A_FACTURAR'].AsString := Qo.FieldByName['SERIE_A_FACTURAR'].AsString;
                    Q.Params.ByName['SU_REFERENCIA'].AsString := Qo.FieldByName['SU_REFERENCIA'].AsString;
                    Q.Params.ByName['FACTURAR_ALMACEN'].AsInteger := Qo.FieldByName['FACTURAR_ALMACEN'].AsInteger;
                    Q.Params.ByName['NRO_EMPLEADOS'].AsInteger := Qo.FieldByName['NRO_EMPLEADOS'].AsInteger;
                    Q.Params.ByName['FACTURACION_TOTAL'].AsFloat := Qo.FieldByName['FACTURACION_TOTAL'].AsFloat;
                    Q.Params.ByName['CONSUMO_MATERIAL'].AsFloat := Qo.FieldByName['CONSUMO_MATERIAL'].AsFloat;
                    Q.Params.ByName['PROVEEDORES_HABITUALES'].AsString := Qo.FieldByName['PROVEEDORES_HABITUALES'].AsString;
                    Q.Params.ByName['RUTA'].AsInteger := Qo.FieldByName['RUTA'].AsInteger;
                    Q.Params.ByName['CLIENTE_POTENCIAL'].AsInteger := Qo.FieldByName['CLIENTE_POTENCIAL'].AsInteger;
                    Q.Params.ByName['CREDITO_Y_CAUCION'].AsInteger := Qo.FieldByName['CREDITO_Y_CAUCION'].AsInteger;
                    Q.Params.ByName['MOROSO'].AsInteger := Qo.FieldByName['MOROSO'].AsInteger;
                    Q.Params.ByName['TIPO_CLIENTE'].AsString := Qo.FieldByName['TIPO_CLIENTE'].AsString;
                    Q.Params.ByName['FACTURAR_TARIFA'].AsInteger := Qo.FieldByName['FACTURAR_TARIFA'].AsInteger;
                    Q.Params.ByName['NO_CALC_DESC_KRI'].AsInteger := Qo.FieldByName['NO_CALC_DESC_KRI'].AsInteger;
                    Q.Params.ByName['FACTURAR_TARIFA'].AsInteger := Qo.FieldByName['FACTURAR_TARIFA'].AsInteger;
                    Q.Params.ByName['NO_AGRUPAR_PED_KRI'].AsInteger := Qo.FieldByName['NO_AGRUPAR_PED_KRI'].AsInteger;
                    Q.Params.ByName['POTENCIAL_DE_COMPRA'].AsFloat := Qo.FieldByName['POTENCIAL_DE_COMPRA'].AsFloat;
                    Q.Params.ByName['RIESGO_FACTOR'].AsFloat := Qo.FieldByName['RIESGO_FACTOR'].AsFloat;
                    Q.Params.ByName['INTRA'].AsInteger := Qo.FieldByName['INTRA'].AsInteger;
                    Q.Params.ByName['INTRA_TRANS'].AsInteger := Qo.FieldByName['INTRA_TRANS'].AsInteger;
                    Q.Params.ByName['PAIS_C2'].AsString := Qo.FieldByName['PAIS_C2'].AsString;
                    Q.Params.ByName['DIAS_ENTREGA'].AsInteger := Qo.FieldByName['DIAS_ENTREGA'].AsInteger;
                    Q.Params.ByName['IDIOMA'].AsString := Qo.FieldByName['IDIOMA'].AsString;
                    Q.Params.ByName['APLICAR_PTO_VERDE'].AsInteger := Qo.FieldByName['APLICAR_PTO_VERDE'].AsInteger;
                    Q.Params.ByName['FACTURAS_POR_EMAIL_KRI'].AsInteger := Qo.FieldByName['FACTURAS_POR_EMAIL_KRI'].AsInteger;
                    Q.Params.ByName['FRECUENCIA'].AsInteger := Qo.FieldByName['FRECUENCIA'].AsInteger;
                    try
                       ExecQuery;
                    except
                       on e: Exception do
                          MessageDlg('UPD EMP_CLIENTES' + #13#10 + e.Message, mtError, [mbOK], 0);
                    end;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
              end
              else
              begin
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'INSERT INTO EMP_CLIENTES (EMPRESA,CLIENTE,TERCERO,TARIFA,RIESGO_AUT,RIESGO_ACT,DIA_PAGO_1,DIA_PAGO_2, ' +
                       'DESCUENTO_PP,AGENTE,RIESGO_FAC,RIESGO_ALB,RIESGO_CAR,RIESGO_REM,TIPO,PORTES, ' +
                       'DESCUENTO_CIAL,USAR_ANTICIPOS,SU_PROVEEDOR,EVAL_FEB,EVAL_FEB_SI,TRANSPORTISTA, ' +
                       'FINANCIACION,FACTURAR_DIRECCION,FACTURAR_AGENTE,FACTURAR_TRANSPORTISTA, ' +
                       'FACTURAR_REFERENCIA,FACTURA_DIRECCION_ADMTVA,ALBARAN_DIRECCION_ENVIO, ' +
                       'POR_FINANCIACION,NO_ALB_FAC,NO_VENTA_RIESGO,FACTURAR_SERIE,SERIE_A_FACTURAR, ' +
                       'SU_REFERENCIA,FACTURAR_ALMACEN,NRO_EMPLEADOS,FACTURACION_TOTAL, ' +
                       'CONSUMO_MATERIAL,PROVEEDORES_HABITUALES,RUTA,CLIENTE_POTENCIAL,CREDITO_Y_CAUCION, ' +
                       'MOROSO,TIPO_CLIENTE,FACTURAR_TARIFA,NO_CALC_DESC_KRI,NO_AGRUPAR_PED_KRI, ' +
                       'POTENCIAL_DE_COMPRA,RIESGO_FACTOR,INTRA, ' +
                       'INTRA_TRANS,PAIS_C2,DIAS_ENTREGA,IDIOMA,APLICAR_PTO_VERDE,FACTURAS_POR_EMAIL_KRI, ' +
                       'FRECUENCIA) VALUES(?EMPRESA,?CLIENTE,?TERCERO,?TARIFA,?RIESGO_AUT,?RIESGO_ACT,?DIA_PAGO_1,?DIA_PAGO_2, ' +
                       '?DESCUENTO_PP,?AGENTE,?RIESGO_FAC,?RIESGO_ALB,?RIESGO_CAR,?RIESGO_REM,?TIPO,?PORTES, ' +
                       '?DESCUENTO_CIAL,?USAR_ANTICIPOS,?SU_PROVEEDOR,?EVAL_FEB,?EVAL_FEB_SI,?TRANSPORTISTA, ' +
                       '?FINANCIACION,?FACTURAR_DIRECCION,?FACTURAR_AGENTE,?FACTURAR_TRANSPORTISTA, ' +
                       '?FACTURAR_REFERENCIA,?FACTURA_DIRECCION_ADMTVA,?ALBARAN_DIRECCION_ENVIO, ' +
                       '?POR_FINANCIACION,?NO_ALB_FAC,?NO_VENTA_RIESGO,?FACTURAR_SERIE,?SERIE_A_FACTURAR, ' +
                       '?SU_REFERENCIA,?FACTURAR_ALMACEN,?NRO_EMPLEADOS,?FACTURACION_TOTAL, ' +
                       '?CONSUMO_MATERIAL,?PROVEEDORES_HABITUALES,?RUTA,?CLIENTE_POTENCIAL,?CREDITO_Y_CAUCION, ' +
                       '?MOROSO,?TIPO_CLIENTE,?FACTURAR_TARIFA,?NO_CALC_DESC_KRI,?NO_AGRUPAR_PED_KRI, ' +
                       '?POTENCIAL_DE_COMPRA,?RIESGO_FACTOR,?INTRA, ' +
                       '?INTRA_TRANS,?PAIS_C2,?DIAS_ENTREGA,?IDIOMA,?APLICAR_PTO_VERDE,?FACTURAS_POR_EMAIL_KRI, ' +
                       '?FRECUENCIA)';
                    Q.Params.ByName['EMPRESA'].AsInteger := Qo.FieldByName['EMPRESA'].AsInteger;
                    Q.Params.ByName['CLIENTE'].AsInteger := Qo.FieldByName['CLIENTE'].AsInteger;
                    Q.Params.ByName['TERCERO'].AsInteger := Qo.FieldByName['TERCERO'].AsInteger;
                    Q.Params.ByName['TARIFA'].AsString := Qo.FieldByName['TARIFA'].AsString;
                    Q.Params.ByName['RIESGO_AUT'].AsFloat := Qo.FieldByName['RIESGO_AUT'].AsFloat;
                    Q.Params.ByName['RIESGO_ACT'].AsFloat := Qo.FieldByName['RIESGO_ACT'].AsFloat;
                    Q.Params.ByName['DIA_PAGO_1'].AsInteger := Qo.FieldByName['DIA_PAGO_1'].AsInteger;
                    Q.Params.ByName['DIA_PAGO_2'].AsInteger := Qo.FieldByName['DIA_PAGO_2'].AsInteger;
                    Q.Params.ByName['DESCUENTO_PP'].AsFloat := Qo.FieldByName['DESCUENTO_PP'].AsFloat;
                    Q.Params.ByName['AGENTE'].AsInteger := Qo.FieldByName['AGENTE'].AsInteger;
                    Q.Params.ByName['RIESGO_FAC'].AsFloat := Qo.FieldByName['RIESGO_FAC'].AsFloat;
                    Q.Params.ByName['RIESGO_ALB'].AsFloat := Qo.FieldByName['RIESGO_ALB'].AsFloat;
                    Q.Params.ByName['RIESGO_CAR'].AsFloat := Qo.FieldByName['RIESGO_CAR'].AsFloat;
                    Q.Params.ByName['RIESGO_REM'].AsFloat := Qo.FieldByName['RIESGO_REM'].AsFloat;
                    Q.Params.ByName['TIPO'].AsInteger := Qo.FieldByName['TIPO'].AsInteger;
                    Q.Params.ByName['PORTES'].AsInteger := Qo.FieldByName['PORTES'].AsInteger;
                    Q.Params.ByName['DESCUENTO_CIAL'].AsFloat := Qo.FieldByName['DESCUENTO_CIAL'].AsFloat;
                    Q.Params.ByName['USAR_ANTICIPOS'].AsInteger := Qo.FieldByName['USAR_ANTICIPOS'].AsInteger;
                    Q.Params.ByName['SU_PROVEEDOR'].AsString := Qo.FieldByName['SU_PROVEEDOR'].AsString;
                    Q.Params.ByName['EVAL_FEB'].AsInteger := Qo.FieldByName['EVAL_FEB'].AsInteger;
                    Q.Params.ByName['EVAL_FEB_SI'].AsInteger := Qo.FieldByName['EVAL_FEB_SI'].AsInteger;
                    Q.Params.ByName['TRANSPORTISTA'].AsInteger := Qo.FieldByName['TRANSPORTISTA'].AsInteger;
                    Q.Params.ByName['FACTURAR_REFERENCIA'].AsInteger := Qo.FieldByName['FACTURAR_REFERENCIA'].AsInteger;
                    Q.Params.ByName['FACTURA_DIRECCION_ADMTVA'].AsInteger := Qo.FieldByName['FACTURA_DIRECCION_ADMTVA'].AsInteger;
                    Q.Params.ByName['ALBARAN_DIRECCION_ENVIO'].AsInteger := Qo.FieldByName['ALBARAN_DIRECCION_ENVIO'].AsInteger;
                    Q.Params.ByName['POR_FINANCIACION'].AsFloat := Qo.FieldByName['POR_FINANCIACION'].AsFloat;
                    Q.Params.ByName['NO_ALB_FAC'].AsInteger := Qo.FieldByName['NO_ALB_FAC'].AsInteger;
                    Q.Params.ByName['NO_VENTA_RIESGO'].AsInteger := Qo.FieldByName['NO_VENTA_RIESGO'].AsInteger;
                    Q.Params.ByName['FACTURAR_SERIE'].AsInteger := Qo.FieldByName['FACTURAR_SERIE'].AsInteger;
                    Q.Params.ByName['SERIE_A_FACTURAR'].AsString := Qo.FieldByName['SERIE_A_FACTURAR'].AsString;
                    Q.Params.ByName['SU_REFERENCIA'].AsString := Qo.FieldByName['SU_REFERENCIA'].AsString;
                    Q.Params.ByName['FACTURAR_ALMACEN'].AsInteger := Qo.FieldByName['FACTURAR_ALMACEN'].AsInteger;
                    Q.Params.ByName['NRO_EMPLEADOS'].AsInteger := Qo.FieldByName['NRO_EMPLEADOS'].AsInteger;
                    Q.Params.ByName['FACTURACION_TOTAL'].AsFloat := Qo.FieldByName['FACTURACION_TOTAL'].AsFloat;
                    Q.Params.ByName['CONSUMO_MATERIAL'].AsFloat := Qo.FieldByName['CONSUMO_MATERIAL'].AsFloat;
                    Q.Params.ByName['PROVEEDORES_HABITUALES'].AsString := Qo.FieldByName['PROVEEDORES_HABITUALES'].AsString;
                    Q.Params.ByName['RUTA'].AsInteger := Qo.FieldByName['RUTA'].AsInteger;
                    Q.Params.ByName['CLIENTE_POTENCIAL'].AsInteger := Qo.FieldByName['CLIENTE_POTENCIAL'].AsInteger;
                    Q.Params.ByName['CREDITO_Y_CAUCION'].AsInteger := Qo.FieldByName['CREDITO_Y_CAUCION'].AsInteger;
                    Q.Params.ByName['MOROSO'].AsInteger := Qo.FieldByName['MOROSO'].AsInteger;
                    Q.Params.ByName['TIPO_CLIENTE'].AsString := Qo.FieldByName['TIPO_CLIENTE'].AsString;
                    Q.Params.ByName['FACTURAR_TARIFA'].AsInteger := Qo.FieldByName['FACTURAR_TARIFA'].AsInteger;
                    Q.Params.ByName['NO_CALC_DESC_KRI'].AsInteger := Qo.FieldByName['NO_CALC_DESC_KRI'].AsInteger;
                    Q.Params.ByName['FACTURAR_TARIFA'].AsInteger := Qo.FieldByName['FACTURAR_TARIFA'].AsInteger;
                    Q.Params.ByName['NO_AGRUPAR_PED_KRI'].AsInteger := Qo.FieldByName['NO_AGRUPAR_PED_KRI'].AsInteger;
                    Q.Params.ByName['POTENCIAL_DE_COMPRA'].AsFloat := Qo.FieldByName['POTENCIAL_DE_COMPRA'].AsFloat;
                    Q.Params.ByName['RIESGO_FACTOR'].AsFloat := Qo.FieldByName['RIESGO_FACTOR'].AsFloat;
                    Q.Params.ByName['INTRA'].AsInteger := Qo.FieldByName['INTRA'].AsInteger;
                    Q.Params.ByName['INTRA_TRANS'].AsInteger := Qo.FieldByName['INTRA_TRANS'].AsInteger;
                    Q.Params.ByName['PAIS_C2'].AsString := Qo.FieldByName['PAIS_C2'].AsString;
                    Q.Params.ByName['DIAS_ENTREGA'].AsInteger := Qo.FieldByName['DIAS_ENTREGA'].AsInteger;
                    Q.Params.ByName['IDIOMA'].AsString := Qo.FieldByName['IDIOMA'].AsString;
                    Q.Params.ByName['APLICAR_PTO_VERDE'].AsInteger := Qo.FieldByName['APLICAR_PTO_VERDE'].AsInteger;
                    Q.Params.ByName['FACTURAS_POR_EMAIL_KRI'].AsInteger := Qo.FieldByName['FACTURAS_POR_EMAIL_KRI'].AsInteger;
                    Q.Params.ByName['FRECUENCIA'].AsInteger := Qo.FieldByName['FRECUENCIA'].AsInteger;
                    try
                       ExecQuery;
                    except
                       on e: Exception do
                          MessageDlg('INS EMP_CLIENTES' + #13#10 + e.Message, mtError, [mbOK], 0);
                    end;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
              end;
              Qo.Next;
           end; {while not eof}
        end;

        { Sincronizar CON_CUENTAS_GES_CLI }
        {
      EMPRESA,EJERCICIO,CANAL,CLIENTE,CUENTA,PERFIL,TIPO_IRPF,PAIS,
      MODO_IVA,INTERFIJO,FORMA_PAGO,MONEDA,TERCERO,NOMBRE_R_SOCIAL,
      NOMBRE_COMERCIAL,CUENTA_DTOPP
      }
        if (not hayerror) then
        begin
           FSendCorreo.Texto(_('Sincronizando Clientes - Cuentas'));

           if (not Qo.Transaction.InTransaction) then
              Qo.Transaction.StartTransaction;
           Qo.Close;
           Qo.SQL.Text := 'select * from con_cuentas_ges_cli where empresa=?empresa and canal=1 and ult_modificacion>=?ult_sincronizacion order by ejercicio,cliente';
           Qo.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Qo.Params.ByName['ULT_SINCRONIZACION'].AsDateTime := UltimaSincronizacion;
           Qo.ExecQuery;
           while not Qo.EOF do
           begin
              FSendCorreo.Texto(_('Sincronizando Clientes - Cuentas') + #13#10 + Qo.FieldByName['EJERCICIO'].AsString + '-' + Qo.FieldByName['CLIENTE'].AsString);

              Q := THYFIBQuery.Create(nil);
              with Q do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT COUNT(*) FROM CON_CUENTAS_GES_CLI WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=1 AND CLIENTE=?CLIENTE';
                 Q.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Q.Params.ByName['EJERCICIO'].AsInteger := Qo.FieldByName['EJERCICIO'].AsInteger;
                 Q.Params.ByName['CLIENTE'].AsInteger := Qo.FieldByName['CLIENTE'].AsInteger;
                 ExecQuery;
                 existe := FieldByName['COUNT'].AsInteger > 0;
                 FreeHandle;
              end;
              FreeAndNil(Q);
              if (existe) then
              begin
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'UPDATE CON_CUENTAS_GES_CLI SET CUENTA=?CUENTA,PERFIL=?PERFIL,TIPO_IRPF=?TIPO_IRPF,PAIS=?PAIS, ' +
                       'MODO_IVA=?MODO_IVA,INTERFIJO=?INTERFIJO,FORMA_PAGO=?FORMA_PAGO,MONEDA=?MONEDA,TERCERO=?TERCERO,NOMBRE_R_SOCIAL=?NOMBRE_R_SOCIAL, ' +
                       'NOMBRE_COMERCIAL=?NOMBRE_COMERCIAL,CUENTA_DTOPP=?CUENTA_DTOPP ' +
                       'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=1 AND CLIENTE=?CLIENTE';
                    Q.Params.ByName['EMPRESA'].AsInteger := Qo.FieldByName['EMPRESA'].AsInteger;
                    Q.Params.ByName['EJERCICIO'].AsInteger := Qo.FieldByName['EJERCICIO'].AsInteger;
                    Q.Params.ByName['CLIENTE'].AsInteger := Qo.FieldByName['CLIENTE'].AsInteger;
                    Q.Params.ByName['CUENTA'].AsString := Qo.FieldByName['CUENTA'].AsString;
                    Q.Params.ByName['PERFIL'].AsString := Qo.FieldByName['PERFIL'].AsString;
                    Q.Params.ByName['TIPO_IRPF'].AsInteger := Qo.FieldByName['TIPO_IRPF'].AsInteger;
                    Q.Params.ByName['PAIS'].AsString := Qo.FieldByName['PAIS'].AsString;
                    Q.Params.ByName['MODO_IVA'].AsInteger := Qo.FieldByName['MODO_IVA'].AsInteger;
                    Q.Params.ByName['INTERFIJO'].AsString := Qo.FieldByName['INTERFIJO'].AsString;
                    Q.Params.ByName['FORMA_PAGO'].AsString := Qo.FieldByName['FORMA_PAGO'].AsString;
                    Q.Params.ByName['MONEDA'].AsString := Qo.FieldByName['MONEDA'].AsString;
                    Q.Params.ByName['TERCERO'].AsInteger := Qo.FieldByName['TERCERO'].AsInteger;
                    Q.Params.ByName['NOMBRE_R_SOCIAL'].AsString := Qo.FieldByName['NOMBRE_R_SOCIAL'].AsString;
                    Q.Params.ByName['NOMBRE_COMERCIAL'].AsString := Qo.FieldByName['NOMBRE_COMERCIAL'].AsString;
                    Q.Params.ByName['CUENTA_DTOPP'].AsString := Qo.FieldByName['CUENTA_DTOPP'].AsString;
                    try
                       ExecQuery;
                    except
                       on e: Exception do
                          MessageDlg('UPD CON_CUENTAS_GES_CLI' + #13#10 + e.Message, mtError, [mbOK], 0);
                    end;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
              end
              else
              begin
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'INSERT INTO CON_CUENTAS_GES_CLI (EMPRESA,EJERCICIO,CANAL,CLIENTE,CUENTA,PERFIL,TIPO_IRPF,PAIS, ' +
                       'MODO_IVA,INTERFIJO,FORMA_PAGO,MONEDA,TERCERO,NOMBRE_R_SOCIAL, ' +
                       'NOMBRE_COMERCIAL,CUENTA_DTOPP) ' +
                       'VALUES(?EMPRESA,?EJERCICIO,1,?CLIENTE,?CUENTA,?PERFIL,?TIPO_IRPF,?PAIS, ' +
                       '?MODO_IVA,?INTERFIJO,?FORMA_PAGO,?MONEDA,?TERCERO,?NOMBRE_R_SOCIAL, ' +
                       '?NOMBRE_COMERCIAL,?CUENTA_DTOPP) ';
                    Q.Params.ByName['EMPRESA'].AsInteger := Qo.FieldByName['EMPRESA'].AsInteger;
                    Q.Params.ByName['EJERCICIO'].AsInteger := Qo.FieldByName['EJERCICIO'].AsInteger;
                    Q.Params.ByName['CLIENTE'].AsInteger := Qo.FieldByName['CLIENTE'].AsInteger;
                    Q.Params.ByName['CUENTA'].AsString := Qo.FieldByName['CUENTA'].AsString;
                    Q.Params.ByName['PERFIL'].AsString := Qo.FieldByName['PERFIL'].AsString;
                    Q.Params.ByName['TIPO_IRPF'].AsInteger := Qo.FieldByName['TIPO_IRPF'].AsInteger;
                    Q.Params.ByName['PAIS'].AsString := Qo.FieldByName['PAIS'].AsString;
                    Q.Params.ByName['MODO_IVA'].AsInteger := Qo.FieldByName['MODO_IVA'].AsInteger;
                    Q.Params.ByName['INTERFIJO'].AsString := Qo.FieldByName['INTERFIJO'].AsString;
                    Q.Params.ByName['FORMA_PAGO'].AsString := Qo.FieldByName['FORMA_PAGO'].AsString;
                    Q.Params.ByName['MONEDA'].AsString := Qo.FieldByName['MONEDA'].AsString;
                    Q.Params.ByName['TERCERO'].AsInteger := Qo.FieldByName['TERCERO'].AsInteger;
                    Q.Params.ByName['NOMBRE_R_SOCIAL'].AsString := Qo.FieldByName['NOMBRE_R_SOCIAL'].AsString;
                    Q.Params.ByName['NOMBRE_COMERCIAL'].AsString := Qo.FieldByName['NOMBRE_COMERCIAL'].AsString;
                    Q.Params.ByName['CUENTA_DTOPP'].AsString := Qo.FieldByName['CUENTA_DTOPP'].AsString;
                    try
                       ExecQuery;
                    except
                       on e: Exception do
                          MessageDlg('INS CON_CUENTAS_GES_CLI' + #13#10 + e.Message, mtError, [mbOK], 0);
                    end;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
              end;
              Qo.Next;
           end; {while not eof}
        end;

        { Sincronizar EMP_PROVEEDORES }
        {Notas no se sincronizan}
        {
      EMPRESA,PROVEEDOR,TERCERO,DESCUENTO,DIA_PAGO_1,DIA_PAGO_2,
      DESCUENTO_PP,TIPO,PORTES,USAR_ANTICIPOS,EVAL_FEB,EVAL_FEB_SI,
      ISO9000,FECHA_ISO9000,FINANCIACION,POR_FINANCIACION,
      FACTURAR_SERIE,SERIE_A_FACTURAR,FACTURAR_ALMACEN,INTRA,
      INTRA_TRANS,PAIS_C2,DIAS_ENTREGA
      }
        if (not hayerror) then
        begin
           FSendCorreo.Texto(_('Sincronizando Proveedores'));

           if (not Qo.Transaction.InTransaction) then
              Qo.Transaction.StartTransaction;
           Qo.Close;
           Qo.SQL.Text := 'select * from emp_proveedores where empresa=?empresa and ult_modificacion>=?ult_sincronizacion order by proveedor';
           Qo.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Qo.Params.ByName['ULT_SINCRONIZACION'].AsDateTime := UltimaSincronizacion;
           Qo.ExecQuery;
           while not Qo.EOF do
           begin
              FSendCorreo.Texto(_('Sincronizando Proveedores') + #13#10 + Qo.FieldByName['PROVEEDOR'].AsString);

              Q := THYFIBQuery.Create(nil);
              with Q do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT COUNT(*) FROM EMP_PROVEEDORES WHERE EMPRESA=?EMPRESA AND PROVEEDOR=?PROVEEDOR';
                 Q.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Q.Params.ByName['PROVEEDOR'].AsInteger := Qo.FieldByName['PROVEEDOR'].AsInteger;
                 ExecQuery;
                 existe := FieldByName['COUNT'].AsInteger > 0;
                 FreeHandle;
              end;
              FreeAndNil(Q);
              if (existe) then
              begin
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'UPDATE EMP_PROVEEDORES SET TERCERO=?TERCERO,DESCUENTO=?DESCUENTO,DIA_PAGO_1=?DIA_PAGO_1,DIA_PAGO_2=?DIA_PAGO_2, ' +
                       'DESCUENTO_PP=?DESCUENTO_PP,TIPO=?TIPO,PORTES=?PORTES,USAR_ANTICIPOS=?USAR_ANTICIPOS,EVAL_FEB=?EVAL_FEB,EVAL_FEB_SI=?EVAL_FEB_SI, ' +
                       'ISO9000=?ISO9000,FECHA_ISO9000=?FECHA_ISO9000,FINANCIACION=?FINANCIACION,POR_FINANCIACION=?POR_FINANCIACION, ' +
                       'FACTURAR_SERIE=?FACTURAR_SERIE,SERIE_A_FACTURAR=?SERIE_A_FACTURAR,FACTURAR_ALMACEN=?FACTURAR_ALMACEN,INTRA=?INTRA, ' +
                       'INTRA_TRANS=?INTRA_TRANS,PAIS_C2=?PAIS_C2,DIAS_ENTREGA=?DIAS_ENTREGA ' +
                       'WHERE EMPRESA=?EMPRESA AND PROVEEDOR=?PROVEEDOR';
                    Q.Params.ByName['EMPRESA'].AsInteger := Qo.FieldByName['EMPRESA'].AsInteger;
                    Q.Params.ByName['PROVEEDOR'].AsInteger := Qo.FieldByName['PROVEEDOR'].AsInteger;
                    Q.Params.ByName['TERCERO'].AsInteger := Qo.FieldByName['TERCERO'].AsInteger;
                    Q.Params.ByName['DESCUENTO'].AsFloat := Qo.FieldByName['DESCUENTO'].AsFloat;
                    Q.Params.ByName['DIA_PAGO_1'].AsInteger := Qo.FieldByName['DIA_PAGO_1'].AsInteger;
                    Q.Params.ByName['DIA_PAGO_2'].AsInteger := Qo.FieldByName['DIA_PAGO_2'].AsInteger;
                    Q.Params.ByName['DESCUENTO_PP'].AsFloat := Qo.FieldByName['DESCUENTO_PP'].AsFloat;
                    Q.Params.ByName['TIPO'].AsInteger := Qo.FieldByName['TIPO'].AsInteger;
                    Q.Params.ByName['PORTES'].AsInteger := Qo.FieldByName['PORTES'].AsInteger;
                    Q.Params.ByName['USAR_ANTICIPOS'].AsInteger := Qo.FieldByName['USAR_ANTICIPOS'].AsInteger;
                    Q.Params.ByName['EVAL_FEB'].AsInteger := Qo.FieldByName['EVAL_FEB'].AsInteger;
                    Q.Params.ByName['EVAL_FEB_SI'].AsInteger := Qo.FieldByName['EVAL_FEB_SI'].AsInteger;
                    Q.Params.ByName['ISO9000'].AsInteger := Qo.FieldByName['ISO9000'].AsInteger;
                    Q.Params.ByName['FECHA_ISO9000'].AsDateTime := Qo.FieldByName['FECHA_ISO9000'].AsDateTime;
                    Q.Params.ByName['FINANCIACION'].AsInteger := Qo.FieldByName['FINANCIACION'].AsInteger;
                    Q.Params.ByName['POR_FINANCIACION'].AsFloat := Qo.FieldByName['POR_FINANCIACION'].AsFloat;
                    Q.Params.ByName['FACTURAR_SERIE'].AsInteger := Qo.FieldByName['FACTURAR_SERIE'].AsInteger;
                    Q.Params.ByName['SERIE_A_FACTURAR'].AsString := Qo.FieldByName['SERIE_A_FACTURAR'].AsString;
                    Q.Params.ByName['FACTURAR_ALMACEN'].AsInteger := Qo.FieldByName['FACTURAR_ALMACEN'].AsInteger;
                    Q.Params.ByName['INTRA'].AsInteger := Qo.FieldByName['INTRA'].AsInteger;
                    Q.Params.ByName['INTRA_TRANS'].AsInteger := Qo.FieldByName['INTRA_TRANS'].AsInteger;
                    Q.Params.ByName['PAIS_C2'].AsString := Qo.FieldByName['PAIS_C2'].AsString;
                    Q.Params.ByName['DIAS_ENTREGA'].AsInteger := Qo.FieldByName['DIAS_ENTREGA'].AsInteger;
                    try
                       ExecQuery;
                    except
                       on e: Exception do
                          MessageDlg('UPD EMP_PROVEEDORES' + #13#10 + e.Message, mtError, [mbOK], 0);
                    end;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
              end
              else
              begin
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'INSERT INTO EMP_PROVEEDORES (EMPRESA,PROVEEDOR,TERCERO,DESCUENTO,DIA_PAGO_1,DIA_PAGO_2, ' +
                       'DESCUENTO_PP,TIPO,PORTES,USAR_ANTICIPOS,EVAL_FEB,EVAL_FEB_SI, ' +
                       'ISO9000,FECHA_ISO9000,FINANCIACION,POR_FINANCIACION, ' +
                       'FACTURAR_SERIE,SERIE_A_FACTURAR,FACTURAR_ALMACEN,INTRA, ' +
                       'INTRA_TRANS,PAIS_C2,DIAS_ENTREGA) ' +
                       'VALUES(?EMPRESA,?PROVEEDOR,?TERCERO,?DESCUENTO,?DIA_PAGO_1,?DIA_PAGO_2, ' +
                       '?DESCUENTO_PP,?TIPO,?PORTES,?USAR_ANTICIPOS,?EVAL_FEB,?EVAL_FEB_SI, ' +
                       '?ISO9000,?FECHA_ISO9000,?FINANCIACION,?POR_FINANCIACION, ' +
                       '?FACTURAR_SERIE,?SERIE_A_FACTURAR,?FACTURAR_ALMACEN,?INTRA, ' +
                       '?INTRA_TRANS,?PAIS_C2,?DIAS_ENTREGA)';
                    Q.Params.ByName['EMPRESA'].AsInteger := Qo.FieldByName['EMPRESA'].AsInteger;
                    Q.Params.ByName['PROVEEDOR'].AsInteger := Qo.FieldByName['PROVEEDOR'].AsInteger;
                    Q.Params.ByName['TERCERO'].AsInteger := Qo.FieldByName['TERCERO'].AsInteger;
                    Q.Params.ByName['DESCUENTO'].AsFloat := Qo.FieldByName['DESCUENTO'].AsFloat;
                    Q.Params.ByName['DIA_PAGO_1'].AsInteger := Qo.FieldByName['DIA_PAGO_1'].AsInteger;
                    Q.Params.ByName['DIA_PAGO_2'].AsInteger := Qo.FieldByName['DIA_PAGO_2'].AsInteger;
                    Q.Params.ByName['DESCUENTO_PP'].AsFloat := Qo.FieldByName['DESCUENTO_PP'].AsFloat;
                    Q.Params.ByName['TIPO'].AsInteger := Qo.FieldByName['TIPO'].AsInteger;
                    Q.Params.ByName['PORTES'].AsInteger := Qo.FieldByName['PORTES'].AsInteger;
                    Q.Params.ByName['USAR_ANTICIPOS'].AsInteger := Qo.FieldByName['USAR_ANTICIPOS'].AsInteger;
                    Q.Params.ByName['EVAL_FEB'].AsInteger := Qo.FieldByName['EVAL_FEB'].AsInteger;
                    Q.Params.ByName['EVAL_FEB_SI'].AsInteger := Qo.FieldByName['EVAL_FEB_SI'].AsInteger;
                    Q.Params.ByName['ISO9000'].AsInteger := Qo.FieldByName['ISO9000'].AsInteger;
                    Q.Params.ByName['FECHA_ISO9000'].AsDateTime := Qo.FieldByName['FECHA_ISO9000'].AsDateTime;
                    Q.Params.ByName['FINANCIACION'].AsInteger := Qo.FieldByName['FINANCIACION'].AsInteger;
                    Q.Params.ByName['POR_FINANCIACION'].AsFloat := Qo.FieldByName['POR_FINANCIACION'].AsFloat;
                    Q.Params.ByName['FACTURAR_SERIE'].AsInteger := Qo.FieldByName['FACTURAR_SERIE'].AsInteger;
                    Q.Params.ByName['SERIE_A_FACTURAR'].AsString := Qo.FieldByName['SERIE_A_FACTURAR'].AsString;
                    Q.Params.ByName['FACTURAR_ALMACEN'].AsInteger := Qo.FieldByName['FACTURAR_ALMACEN'].AsInteger;
                    Q.Params.ByName['INTRA'].AsInteger := Qo.FieldByName['INTRA'].AsInteger;
                    Q.Params.ByName['INTRA_TRANS'].AsInteger := Qo.FieldByName['INTRA_TRANS'].AsInteger;
                    Q.Params.ByName['PAIS_C2'].AsString := Qo.FieldByName['PAIS_C2'].AsString;
                    Q.Params.ByName['DIAS_ENTREGA'].AsInteger := Qo.FieldByName['DIAS_ENTREGA'].AsInteger;
                    try
                       ExecQuery;
                    except
                       on e: Exception do
                          MessageDlg('INS EMP_PROVEEDORES' + #13#10 + e.Message, mtError, [mbOK], 0);
                    end;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
              end;
              Qo.Next;
           end; {while not eof}
        end;

        { Sincronizar CON_CUENTAS_GES_PRO }
        {
      EMPRESA,EJERCICIO,CANAL,PROVEEDOR,CUENTA,TIPO_IRPF,
      PAIS,FORMA_PAGO,MODO_IVA,MONEDA,CUENTA_DTOPP
      }
        if (not hayerror) then
        begin
           FSendCorreo.Texto(_('Sincronizando Proveedores - Cuentas'));

           if (not Qo.Transaction.InTransaction) then
              Qo.Transaction.StartTransaction;
           Qo.Close;
           Qo.SQL.Text := 'select * from con_cuentas_ges_pro where empresa=?empresa and canal=1 and ult_modificacion>=?ult_sincronizacion order by ejercicio,proveedor';
           Qo.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Qo.Params.ByName['ULT_SINCRONIZACION'].AsDateTime := UltimaSincronizacion;
           Qo.ExecQuery;
           while not Qo.EOF do
           begin
              FSendCorreo.Texto(_('Sincronizando Proveedores - Cuentas') + #13#10 + Qo.FieldByName['EJERCICIO'].AsString + '-' + Qo.FieldByName['PROVEEDOR'].AsString);

              Q := THYFIBQuery.Create(nil);
              with Q do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT COUNT(*) FROM CON_CUENTAS_GES_PRO WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=1 AND PROVEEDOR=?PROVEEDOR';
                 Q.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Q.Params.ByName['EJERCICIO'].AsInteger := Qo.FieldByName['EJERCICIO'].AsInteger;
                 Q.Params.ByName['PROVEEDOR'].AsInteger := Qo.FieldByName['PROVEEDOR'].AsInteger;
                 ExecQuery;
                 existe := FieldByName['COUNT'].AsInteger > 0;
                 FreeHandle;
              end;
              FreeAndNil(Q);
              if (existe) then
              begin
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'UPDATE CON_CUENTAS_GES_PRO SET CUENTA=?CUENTA,TIPO_IRPF=?TIPO_IRPF, ' +
                       'PAIS=?PAIS,FORMA_PAGO=?FORMA_PAGO,MODO_IVA=?MODO_IVA,MONEDA=?MONEDA,CUENTA_DTOPP=?CUENTA_DTOPP ' +
                       'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=1 AND PROVEEDOR=?PROVEEDOR';
                    Q.Params.ByName['EMPRESA'].AsInteger := Qo.FieldByName['EMPRESA'].AsInteger;
                    Q.Params.ByName['EJERCICIO'].AsInteger := Qo.FieldByName['EJERCICIO'].AsInteger;
                    Q.Params.ByName['PROVEEDOR'].AsInteger := Qo.FieldByName['PROVEEDOR'].AsInteger;
                    Q.Params.ByName['CUENTA'].AsString := Qo.FieldByName['CUENTA'].AsString;
                    Q.Params.ByName['TIPO_IRPF'].AsInteger := Qo.FieldByName['TIPO_IRPF'].AsInteger;
                    Q.Params.ByName['PAIS'].AsString := Qo.FieldByName['PAIS'].AsString;
                    Q.Params.ByName['FORMA_PAGO'].AsString := Qo.FieldByName['FORMA_PAGO'].AsString;
                    Q.Params.ByName['MODO_IVA'].AsInteger := Qo.FieldByName['MODO_IVA'].AsInteger;
                    Q.Params.ByName['MONEDA'].AsString := Qo.FieldByName['MONEDA'].AsString;
                    Q.Params.ByName['CUENTA_DTOPP'].AsString := Qo.FieldByName['CUENTA_DTOPP'].AsString;
                    try
                       ExecQuery;
                    except
                       on e: Exception do
                          MessageDlg('UPD CON_CUENTAS_GES_PRO' + #13#10 + e.Message, mtError, [mbOK], 0);
                    end;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
              end
              else
              begin
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'INSERT INTO CON_CUENTAS_GES_PRO (EMPRESA,EJERCICIO,CANAL,PROVEEDOR,CUENTA,TIPO_IRPF, ' +
                       'PAIS,FORMA_PAGO,MODO_IVA,MONEDA,CUENTA_DTOPP) ' +
                       'VALUES(?EMPRESA,?EJERCICIO,1,?PROVEEDOR,?CUENTA,?TIPO_IRPF, ' +
                       '?PAIS,?FORMA_PAGO,?MODO_IVA,?MONEDA,?CUENTA_DTOPP) ';
                    Q.Params.ByName['EMPRESA'].AsInteger := Qo.FieldByName['EMPRESA'].AsInteger;
                    Q.Params.ByName['EJERCICIO'].AsInteger := Qo.FieldByName['EJERCICIO'].AsInteger;
                    Q.Params.ByName['PROVEEDOR'].AsInteger := Qo.FieldByName['PROVEEDOR'].AsInteger;
                    Q.Params.ByName['CUENTA'].AsString := Qo.FieldByName['CUENTA'].AsString;
                    Q.Params.ByName['TIPO_IRPF'].AsInteger := Qo.FieldByName['TIPO_IRPF'].AsInteger;
                    Q.Params.ByName['PAIS'].AsString := Qo.FieldByName['PAIS'].AsString;
                    Q.Params.ByName['FORMA_PAGO'].AsString := Qo.FieldByName['FORMA_PAGO'].AsString;
                    Q.Params.ByName['MODO_IVA'].AsInteger := Qo.FieldByName['MODO_IVA'].AsInteger;
                    Q.Params.ByName['MONEDA'].AsString := Qo.FieldByName['MONEDA'].AsString;
                    Q.Params.ByName['CUENTA_DTOPP'].AsString := Qo.FieldByName['CUENTA_DTOPP'].AsString;
                    try
                       ExecQuery;
                    except
                       on e: Exception do
                          MessageDlg('INS CON_CUENTAS_GES_PRO' + #13#10 + e.Message, mtError, [mbOK], 0);
                    end;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
              end;
              Qo.Next;
           end; {while not eof}
        end;

        { Sincronizar ART_TARIFAS_CALCULOS }
        {
      EMPRESA,CALCULO,TITULO,TIPO_REDONDEO,COMISION,CARGO_PORCENTUAL,
      CARGO_LINEAL,DESCUENTO,CARGO_COMERCIAL,PRECIO_PUNTOS,RE_INCLUIDO,
      TIPO_PRECIO_BASE
      }
        if (not hayerror) then
        begin
           FSendCorreo.Texto(_('Sincronizando Tarifas de Ventas - Calculos'));

           if (not Qo.Transaction.InTransaction) then
              Qo.Transaction.StartTransaction;
           Qo.Close;
           Qo.SQL.Text := 'select * from art_tarifas_calculos where empresa=?empresa and ult_modificacion>=?ult_sincronizacion order by calculo';
           Qo.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Qo.Params.ByName['ULT_SINCRONIZACION'].AsDateTime := UltimaSincronizacion;
           Qo.ExecQuery;
           while not Qo.EOF do
           begin
              FSendCorreo.Texto(_('Sincronizando Tarifas de Ventas - Calculos') + #13#10 + Qo.FieldByName['CALCULO'].AsString);

              Q := THYFIBQuery.Create(nil);
              with Q do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT COUNT(*) FROM ART_TARIFAS_CALCULOS WHERE EMPRESA=?EMPRESA AND CALCULO=?CALCULO';
                 Q.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Q.Params.ByName['CALCULO'].AsInteger := Qo.FieldByName['CALCULO'].AsInteger;
                 ExecQuery;
                 existe := FieldByName['COUNT'].AsInteger > 0;
                 FreeHandle;
              end;
              FreeAndNil(Q);
              if (existe) then
              begin
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'UPDATE ART_TARIFAS_CALCULOS SET TITULO=?TITULO,TIPO_REDONDEO=?TIPO_REDONDEO,COMISION=?COMISION,CARGO_PORCENTUAL=?CARGO_PORCENTUAL, ' +
                       'CARGO_LINEAL=?CARGO_LINEAL,DESCUENTO=?DESCUENTO,CARGO_COMERCIAL=?CARGO_COMERCIAL,PRECIO_PUNTOS=?PRECIO_PUNTOS,RE_INCLUIDO=?RE_INCLUIDO, ' +
                       'TIPO_PRECIO_BASE=?TIPO_PRECIO_BASE WHERE EMPRESA=?EMPRESA AND CALCULO=?CALCULO';
                    Q.Params.ByName['EMPRESA'].AsInteger := Qo.FieldByName['EMPRESA'].AsInteger;
                    Q.Params.ByName['CALCULO'].AsInteger := Qo.FieldByName['CALCULO'].AsInteger;
                    Q.Params.ByName['TITULO'].AsString := Qo.FieldByName['TITULO'].AsString;
                    Q.Params.ByName['TIPO_REDONDEO'].AsInteger := Qo.FieldByName['TIPO_REDONDEO'].AsInteger;
                    Q.Params.ByName['COMISION'].AsFloat := Qo.FieldByName['COMISION'].AsFloat;
                    Q.Params.ByName['CARGO_PORCENTUAL'].AsFloat := Qo.FieldByName['CARGO_PORCENTUAL'].AsFloat;
                    Q.Params.ByName['CARGO_LINEAL'].AsFloat := Qo.FieldByName['CARGO_LINEAL'].AsFloat;
                    Q.Params.ByName['DESCUENTO'].AsFloat := Qo.FieldByName['DESCUENTO'].AsFloat;
                    Q.Params.ByName['CARGO_COMERCIAL'].AsFloat := Qo.FieldByName['CARGO_COMERCIAL'].AsFloat;
                    Q.Params.ByName['PRECIO_PUNTOS'].AsFloat := Qo.FieldByName['PRECIO_PUNTOS'].AsFloat;
                    Q.Params.ByName['RE_INCLUIDO'].AsInteger := Qo.FieldByName['RE_INCLUIDO'].AsInteger;
                    Q.Params.ByName['TIPO_PRECIO_BASE'].AsInteger := Qo.FieldByName['TIPO_PRECIO_BASE'].AsInteger;
                    try
                       ExecQuery;
                    except
                       on e: Exception do
                          MessageDlg('UPD ART_TARIFAS_CALCULOS' + #13#10 + e.Message, mtError, [mbOK], 0);
                    end;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
              end
              else
              begin
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'INSERT INTO ART_TARIFAS_CALCULOS (EMPRESA,CALCULO,TITULO,TIPO_REDONDEO,COMISION,CARGO_PORCENTUAL, ' +
                       'CARGO_LINEAL,DESCUENTO,CARGO_COMERCIAL,PRECIO_PUNTOS,RE_INCLUIDO, ' +
                       'TIPO_PRECIO_BASE) ' +
                       'VALUES(?EMPRESA,?CALCULO,?TITULO,?TIPO_REDONDEO,?COMISION,?CARGO_PORCENTUAL, ' +
                       '?CARGO_LINEAL,?DESCUENTO,?CARGO_COMERCIAL,?PRECIO_PUNTOS,?RE_INCLUIDO, ' +
                       '?TIPO_PRECIO_BASE) ';
                    Q.Params.ByName['EMPRESA'].AsInteger := Qo.FieldByName['EMPRESA'].AsInteger;
                    Q.Params.ByName['CALCULO'].AsInteger := Qo.FieldByName['CALCULO'].AsInteger;
                    Q.Params.ByName['TITULO'].AsString := Qo.FieldByName['TITULO'].AsString;
                    Q.Params.ByName['TIPO_REDONDEO'].AsInteger := Qo.FieldByName['TIPO_REDONDEO'].AsInteger;
                    Q.Params.ByName['COMISION'].AsFloat := Qo.FieldByName['COMISION'].AsFloat;
                    Q.Params.ByName['CARGO_PORCENTUAL'].AsFloat := Qo.FieldByName['CARGO_PORCENTUAL'].AsFloat;
                    Q.Params.ByName['CARGO_LINEAL'].AsFloat := Qo.FieldByName['CARGO_LINEAL'].AsFloat;
                    Q.Params.ByName['DESCUENTO'].AsFloat := Qo.FieldByName['DESCUENTO'].AsFloat;
                    Q.Params.ByName['CARGO_COMERCIAL'].AsFloat := Qo.FieldByName['CARGO_COMERCIAL'].AsFloat;
                    Q.Params.ByName['PRECIO_PUNTOS'].AsFloat := Qo.FieldByName['PRECIO_PUNTOS'].AsFloat;
                    Q.Params.ByName['RE_INCLUIDO'].AsInteger := Qo.FieldByName['RE_INCLUIDO'].AsInteger;
                    Q.Params.ByName['TIPO_PRECIO_BASE'].AsInteger := Qo.FieldByName['TIPO_PRECIO_BASE'].AsInteger;
                    try
                       ExecQuery;
                    except
                       on e: Exception do
                          MessageDlg('INS ART_TARIFAS_CALCULOS' + #13#10 + e.Message, mtError, [mbOK], 0);
                    end;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
              end;
              Qo.Next;
           end; {while not eof}
        end;

        { Sincronizar ART_TARIFAS_C }
        {
      EMPRESA,TARIFA,TITULO,MONEDA,ACTIVA,IVA_INCLUIDO,BIENES_USADOS_KRI
      }
        if (not hayerror) then
        begin
           FSendCorreo.Texto(_('Sincronizando Tarifas de Ventas - Tarifa Cabecera'));

           if (not Qo.Transaction.InTransaction) then
              Qo.Transaction.StartTransaction;
           Qo.Close;
           Qo.SQL.Text := 'select * from art_tarifas_c where empresa=?empresa and ult_modificacion>=?ult_sincronizacion order by tarifa';
           Qo.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Qo.Params.ByName['ULT_SINCRONIZACION'].AsDateTime := UltimaSincronizacion;
           Qo.ExecQuery;
           while not Qo.EOF do
           begin
              FSendCorreo.Texto(_('Sincronizando Tarifas de Ventas - Tarifa Cabecera') + #13#10 + Qo.FieldByName['TARIFA'].AsString);

              Q := THYFIBQuery.Create(nil);
              with Q do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT COUNT(*) FROM ART_TARIFAS_C WHERE EMPRESA=?EMPRESA AND TARIFA=?TARIFA';
                 Q.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Q.Params.ByName['TARIFA'].AsString := Qo.FieldByName['TARIFA'].AsString;
                 ExecQuery;
                 existe := FieldByName['COUNT'].AsInteger > 0;
                 FreeHandle;
              end;
              FreeAndNil(Q);
              if (existe) then
              begin
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'UPDATE ART_TARIFAS_C SET TITULO=?TITULO,MONEDA=?MONEDA,ACTIVA=?ACTIVA,IVA_INCLUIDO=?IVA_INCLUIDO,BIENES_USADOS_KRI=?BIENES_USADOS_KRI ' +
                       'WHERE EMPRESA=?EMPRESA AND TARIFA=?TARIFA';
                    Q.Params.ByName['EMPRESA'].AsInteger := Qo.FieldByName['EMPRESA'].AsInteger;
                    Q.Params.ByName['TARIFA'].AsString := Qo.FieldByName['TARIFA'].AsString;
                    Q.Params.ByName['TITULO'].AsString := Qo.FieldByName['TITULO'].AsString;
                    Q.Params.ByName['MONEDA'].AsString := Qo.FieldByName['MONEDA'].AsString;
                    Q.Params.ByName['ACTIVA'].AsInteger := Qo.FieldByName['ACTIVA'].AsInteger;
                    Q.Params.ByName['IVA_INCLUIDO'].AsInteger := Qo.FieldByName['IVA_INCLUIDO'].AsInteger;
                    Q.Params.ByName['BIENES_USADOS_KRI'].AsInteger := Qo.FieldByName['BIENES_USADOS_KRI'].AsInteger;
                    try
                       ExecQuery;
                    except
                       on e: Exception do
                          MessageDlg('UPD ART_TARIFAS_C' + #13#10 + e.Message, mtError, [mbOK], 0);
                    end;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
              end
              else
              begin
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'INSERT INTO ART_TARIFAS_C (EMPRESA,TARIFA,TITULO,MONEDA,ACTIVA,IVA_INCLUIDO,BIENES_USADOS_KRI) ' +
                       'VALUES(?EMPRESA,?TARIFA,?TITULO,?MONEDA,?ACTIVA,?IVA_INCLUIDO,?BIENES_USADOS_KRI) ';
                    Q.Params.ByName['EMPRESA'].AsInteger := Qo.FieldByName['EMPRESA'].AsInteger;
                    Q.Params.ByName['TARIFA'].AsString := Qo.FieldByName['TARIFA'].AsString;
                    Q.Params.ByName['TITULO'].AsString := Qo.FieldByName['TITULO'].AsString;
                    Q.Params.ByName['MONEDA'].AsString := Qo.FieldByName['MONEDA'].AsString;
                    Q.Params.ByName['ACTIVA'].AsInteger := Qo.FieldByName['ACTIVA'].AsInteger;
                    Q.Params.ByName['IVA_INCLUIDO'].AsInteger := Qo.FieldByName['IVA_INCLUIDO'].AsInteger;
                    Q.Params.ByName['BIENES_USADOS_KRI'].AsInteger := Qo.FieldByName['BIENES_USADOS_KRI'].AsInteger;
                    try
                       ExecQuery;
                    except
                       on e: Exception do
                          MessageDlg('INS ART_TARIFAS_C' + #13#10 + e.Message, mtError, [mbOK], 0);
                    end;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
              end;
              Qo.Next;
           end; {while not eof}
        end;

        { Sincronizar ART_TARIFAS_D }
        {
      EMPRESA,TARIFA,LINEA,CALCULO,UNID_MINIMAS,UNID_MAXIMAS
      }
        if (not hayerror) then
        begin
           FSendCorreo.Texto(_('Sincronizando Tarifas de Ventas - Tarifa Detalle'));

           if (not Qo.Transaction.InTransaction) then
              Qo.Transaction.StartTransaction;
           Qo.Close;
           Qo.SQL.Text := 'select * from art_tarifas_d where empresa=?empresa and ult_modificacion>=?ult_sincronizacion order by tarifa,linea';
           Qo.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Qo.Params.ByName['ULT_SINCRONIZACION'].AsDateTime := UltimaSincronizacion;
           Qo.ExecQuery;
           while not Qo.EOF do
           begin
              FSendCorreo.Texto(_('Sincronizando Tarifas de Ventas - Tarifa Detalle') + #13#10 + Qo.FieldByName['TARIFA'].AsString + ' - ' + Qo.FieldByName['LINEA'].AsString);

              Q := THYFIBQuery.Create(nil);
              with Q do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT COUNT(*) FROM ART_TARIFAS_D WHERE EMPRESA=?EMPRESA AND TARIFA=?TARIFA AND LINEA=?LINEA';
                 Q.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Q.Params.ByName['TARIFA'].AsString := Qo.FieldByName['TARIFA'].AsString;
                 Q.Params.ByName['LINEA'].AsInteger := Qo.FieldByName['LINEA'].AsInteger;
                 ExecQuery;
                 existe := FieldByName['COUNT'].AsInteger > 0;
                 FreeHandle;
              end;
              FreeAndNil(Q);
              if (existe) then
              begin
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'UPDATE ART_TARIFAS_D SET CALCULO=?CALCULO,UNID_MINIMAS=?UNID_MINIMAS,UNID_MAXIMAS=?UNID_MAXIMAS ' +
                       'WHERE EMPRESA=?EMPRESA AND TARIFA=?TARIFA AND LINEA=?LINEA';
                    Q.Params.ByName['EMPRESA'].AsInteger := Qo.FieldByName['EMPRESA'].AsInteger;
                    Q.Params.ByName['TARIFA'].AsString := Qo.FieldByName['TARIFA'].AsString;
                    Q.Params.ByName['LINEA'].AsInteger := Qo.FieldByName['LINEA'].AsInteger;
                    Q.Params.ByName['CALCULO'].AsInteger := Qo.FieldByName['CALCULO'].AsInteger;
                    Q.Params.ByName['UNID_MINIMAS'].AsFloat := Qo.FieldByName['UNID_MINIMAS'].AsFloat;
                    Q.Params.ByName['UNID_MAXIMAS'].AsFloat := Qo.FieldByName['UNID_MAXIMAS'].AsFloat;
                    try
                       ExecQuery;
                    except
                       on e: Exception do
                          MessageDlg('UPD ART_TARIFAS_D' + #13#10 + e.Message, mtError, [mbOK], 0);
                    end;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
              end
              else
              begin
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'INSERT INTO ART_TARIFAS_D (EMPRESA,TARIFA,LINEA,CALCULO,UNID_MINIMAS,UNID_MAXIMAS) ' +
                       'VALUES(?EMPRESA,?TARIFA,?LINEA,?CALCULO,?UNID_MINIMAS,?UNID_MAXIMAS) ';
                    Q.Params.ByName['EMPRESA'].AsInteger := Qo.FieldByName['EMPRESA'].AsInteger;
                    Q.Params.ByName['TARIFA'].AsString := Qo.FieldByName['TARIFA'].AsString;
                    Q.Params.ByName['LINEA'].AsInteger := Qo.FieldByName['LINEA'].AsInteger;
                    Q.Params.ByName['CALCULO'].AsInteger := Qo.FieldByName['CALCULO'].AsInteger;
                    Q.Params.ByName['UNID_MINIMAS'].AsFloat := Qo.FieldByName['UNID_MINIMAS'].AsFloat;
                    Q.Params.ByName['UNID_MAXIMAS'].AsFloat := Qo.FieldByName['UNID_MAXIMAS'].AsFloat;
                    try
                       ExecQuery;
                    except
                       on e: Exception do
                          MessageDlg('INS ART_TARIFAS_D' + #13#10 + e.Message, mtError, [mbOK], 0);
                    end;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
              end;
              Qo.Next;
           end; {while not eof}
        end;

        { Sincronizar ART_TARIFAS_PRECIOS }
        {
      EMPRESA,TARIFA,ARTICULO,LINEA,CALCULO,UNID_MINIMAS,
      UNID_MAXIMAS,PRECIO_BASE,PRECIO_VENTA,MARGEN_PC,
      MARGEN_PV,COMISION,BLOQUEADO,MARGEN
      }
        if (not hayerror) then
        begin
           FSendCorreo.Texto(_('Sincronizando Tarifas de Ventas - Tarifa Precios'));

           if (not Qo.Transaction.InTransaction) then
              Qo.Transaction.StartTransaction;
           Qo.Close;
           Qo.SQL.Text := 'select * from art_tarifas_precios where empresa=?empresa and ult_modificacion>=?ult_sincronizacion order by tarifa,articulo,linea';
           Qo.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Qo.Params.ByName['ULT_SINCRONIZACION'].AsDateTime := UltimaSincronizacion;
           Qo.ExecQuery;
           while not Qo.EOF do
           begin
              FSendCorreo.Texto(_('Sincronizando Tarifas de Ventas - Tarifa Precios') + #13#10 + Qo.FieldByName['ARTICULO'].AsString + ' - ' + Qo.FieldByName['LINEA'].AsString);

              Q := THYFIBQuery.Create(nil);
              with Q do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT COUNT(*) FROM ART_TARIFAS_PRECIOS WHERE EMPRESA=?EMPRESA AND TARIFA=?TARIFA AND ARTICULO=?ARTICULO AND LINEA=?LINEA';
                 Q.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Q.Params.ByName['TARIFA'].AsString := Qo.FieldByName['TARIFA'].AsString;
                 Q.Params.ByName['ARTICULO'].AsString := Qo.FieldByName['ARTICULO'].AsString;
                 Q.Params.ByName['LINEA'].AsInteger := Qo.FieldByName['LINEA'].AsInteger;
                 ExecQuery;
                 existe := FieldByName['COUNT'].AsInteger > 0;
                 FreeHandle;
              end;
              FreeAndNil(Q);
              if (existe) then
              begin
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'UPDATE ART_TARIFAS_PRECIOS SET CALCULO=?CALCULO,UNID_MINIMAS=?UNID_MINIMAS, ' +
                       'UNID_MAXIMAS=?UNID_MAXIMAS,PRECIO_BASE=?PRECIO_BASE,PRECIO_VENTA=?PRECIO_VENTA,MARGEN_PC=?MARGEN_PC, ' +
                       'MARGEN_PV=?MARGEN_PV,COMISION=?COMISION,BLOQUEADO=?BLOQUEADO,MARGEN=?MARGEN ' +
                       'WHERE EMPRESA=?EMPRESA AND TARIFA=?TARIFA AND ARTICULO=?ARTICULO AND LINEA=?LINEA';
                    Q.Params.ByName['EMPRESA'].AsInteger := Qo.FieldByName['EMPRESA'].AsInteger;
                    Q.Params.ByName['TARIFA'].AsString := Qo.FieldByName['TARIFA'].AsString;
                    Q.Params.ByName['ARTICULO'].AsString := Qo.FieldByName['ARTICULO'].AsString;
                    Q.Params.ByName['LINEA'].AsInteger := Qo.FieldByName['LINEA'].AsInteger;
                    Q.Params.ByName['CALCULO'].AsInteger := Qo.FieldByName['CALCULO'].AsInteger;
                    Q.Params.ByName['UNID_MINIMAS'].AsFloat := Qo.FieldByName['UNID_MINIMAS'].AsFloat;
                    Q.Params.ByName['UNID_MAXIMAS'].AsFloat := Qo.FieldByName['UNID_MAXIMAS'].AsFloat;
                    Q.Params.ByName['PRECIO_BASE'].AsFloat := Qo.FieldByName['PRECIO_BASE'].AsFloat;
                    Q.Params.ByName['PRECIO_VENTA'].AsFloat := Qo.FieldByName['PRECIO_VENTA'].AsFloat;
                    Q.Params.ByName['MARGEN_PC'].AsFloat := Qo.FieldByName['MARGEN_PC'].AsFloat;
                    Q.Params.ByName['MARGEN_PV'].AsFloat := Qo.FieldByName['MARGEN_PV'].AsFloat;
                    Q.Params.ByName['COMISION'].AsFloat := Qo.FieldByName['COMISION'].AsFloat;
                    Q.Params.ByName['BLOQUEADO'].AsInteger := Qo.FieldByName['BLOQUEADO'].AsInteger;
                    Q.Params.ByName['MARGEN'].AsFloat := Qo.FieldByName['MARGEN'].AsFloat;
                    try
                       ExecQuery;
                    except
                       on e: Exception do
                          MessageDlg('UPD ART_TARIFAS_PRECIOS' + #13#10 + e.Message, mtError, [mbOK], 0);
                    end;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
              end
              else
              begin
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'INSERT INTO ART_TARIFAS_PRECIOS (EMPRESA,TARIFA,ARTICULO,LINEA,CALCULO,UNID_MINIMAS, ' +
                       'UNID_MAXIMAS,PRECIO_BASE,PRECIO_VENTA,MARGEN_PC, ' +
                       'MARGEN_PV,COMISION,BLOQUEADO,MARGEN) ' +
                       'VALUES(?EMPRESA,?TARIFA,?ARTICULO,?LINEA,?CALCULO,?UNID_MINIMAS, ' +
                       '?UNID_MAXIMAS,?PRECIO_BASE,?PRECIO_VENTA,?MARGEN_PC, ' +
                       '?MARGEN_PV,?COMISION,?BLOQUEADO,?MARGEN) ';
                    Q.Params.ByName['EMPRESA'].AsInteger := Qo.FieldByName['EMPRESA'].AsInteger;
                    Q.Params.ByName['TARIFA'].AsString := Qo.FieldByName['TARIFA'].AsString;
                    Q.Params.ByName['ARTICULO'].AsString := Qo.FieldByName['ARTICULO'].AsString;
                    Q.Params.ByName['LINEA'].AsInteger := Qo.FieldByName['LINEA'].AsInteger;
                    Q.Params.ByName['CALCULO'].AsInteger := Qo.FieldByName['CALCULO'].AsInteger;
                    Q.Params.ByName['UNID_MINIMAS'].AsFloat := Qo.FieldByName['UNID_MINIMAS'].AsFloat;
                    Q.Params.ByName['UNID_MAXIMAS'].AsFloat := Qo.FieldByName['UNID_MAXIMAS'].AsFloat;
                    Q.Params.ByName['PRECIO_BASE'].AsFloat := Qo.FieldByName['PRECIO_BASE'].AsFloat;
                    Q.Params.ByName['PRECIO_VENTA'].AsFloat := Qo.FieldByName['PRECIO_VENTA'].AsFloat;
                    Q.Params.ByName['MARGEN_PC'].AsFloat := Qo.FieldByName['MARGEN_PC'].AsFloat;
                    Q.Params.ByName['MARGEN_PV'].AsFloat := Qo.FieldByName['MARGEN_PV'].AsFloat;
                    Q.Params.ByName['COMISION'].AsFloat := Qo.FieldByName['COMISION'].AsFloat;
                    Q.Params.ByName['BLOQUEADO'].AsInteger := Qo.FieldByName['BLOQUEADO'].AsInteger;
                    Q.Params.ByName['MARGEN'].AsFloat := Qo.FieldByName['MARGEN'].AsFloat;
                    try
                       ExecQuery;
                    except
                       on e: Exception do
                          MessageDlg('INS ART_TARIFAS_PRECIOS' + #13#10 + e.Message, mtError, [mbOK], 0);
                    end;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
              end;
              Qo.Next;
           end; {while not eof}
        end;

        { Sincronizar ART_TARIFAS_COND_ART }
        {
      EMPRESA,TARIFA,ARTICULO,LINEA,CALCULO,UNID_MINIMAS,UNID_MAXIMAS
      }
        if (not hayerror) then
        begin
           FSendCorreo.Texto(_('Sincronizando Tarifas de Ventas - Condiciones de Articulo'));

           if (not Qo.Transaction.InTransaction) then
              Qo.Transaction.StartTransaction;
           Qo.Close;
           Qo.SQL.Text := 'select * from art_tarifas_cond_art where empresa=?empresa and ult_modificacion>=?ult_sincronizacion order by tarifa,articulo,linea';
           Qo.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Qo.Params.ByName['ULT_SINCRONIZACION'].AsDateTime := UltimaSincronizacion;
           Qo.ExecQuery;
           while not Qo.EOF do
           begin
              FSendCorreo.Texto(_('Sincronizando Tarifas de Ventas - Condiciones de Articulo') + #13#10 + Qo.FieldByName['ARTICULO'].AsString + ' - ' + Qo.FieldByName['LINEA'].AsString);

              Q := THYFIBQuery.Create(nil);
              with Q do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT COUNT(*) FROM ART_TARIFAS_COND_ART WHERE EMPRESA=?EMPRESA AND TARIFA=?TARIFA AND ARTICULO=?ARTICULO AND LINEA=?LINEA';
                 Q.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Q.Params.ByName['TARIFA'].AsString := Qo.FieldByName['TARIFA'].AsString;
                 Q.Params.ByName['ARTICULO'].AsString := Qo.FieldByName['ARTICULO'].AsString;
                 Q.Params.ByName['LINEA'].AsInteger := Qo.FieldByName['LINEA'].AsInteger;
                 ExecQuery;
                 existe := FieldByName['COUNT'].AsInteger > 0;
                 FreeHandle;
              end;
              FreeAndNil(Q);
              if (existe) then
              begin
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'UPDATE ART_TARIFAS_COND_ART SET CALCULO=?CALCULO,UNID_MINIMAS=?UNID_MINIMAS,UNID_MAXIMAS=?UNID_MAXIMAS ' +
                       'WHERE EMPRESA=?EMPRESA AND TARIFA=?TARIFA AND ARTICULO=?ARTICULO AND LINEA=?LINEA';
                    Q.Params.ByName['EMPRESA'].AsInteger := Qo.FieldByName['EMPRESA'].AsInteger;
                    Q.Params.ByName['TARIFA'].AsString := Qo.FieldByName['TARIFA'].AsString;
                    Q.Params.ByName['ARTICULO'].AsString := Qo.FieldByName['ARTICULO'].AsString;
                    Q.Params.ByName['LINEA'].AsInteger := Qo.FieldByName['LINEA'].AsInteger;
                    Q.Params.ByName['CALCULO'].AsInteger := Qo.FieldByName['CALCULO'].AsInteger;
                    Q.Params.ByName['UNID_MINIMAS'].AsFloat := Qo.FieldByName['UNID_MINIMAS'].AsFloat;
                    Q.Params.ByName['UNID_MAXIMAS'].AsFloat := Qo.FieldByName['UNID_MAXIMAS'].AsFloat;
                    try
                       ExecQuery;
                    except
                       on e: Exception do
                          MessageDlg('UPD ART_TARIFAS_COND_ART' + #13#10 + e.Message, mtError, [mbOK], 0);
                    end;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
              end
              else
              begin
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'INSERT INTO ART_TARIFAS_COND_ART (EMPRESA,TARIFA,ARTICULO,LINEA,CALCULO,UNID_MINIMAS,UNID_MAXIMAS) ' +
                       'VALUES(?EMPRESA,?TARIFA,?ARTICULO,?LINEA,?CALCULO,?UNID_MINIMAS,?UNID_MAXIMAS) ';
                    Q.Params.ByName['EMPRESA'].AsInteger := Qo.FieldByName['EMPRESA'].AsInteger;
                    Q.Params.ByName['TARIFA'].AsString := Qo.FieldByName['TARIFA'].AsString;
                    Q.Params.ByName['ARTICULO'].AsString := Qo.FieldByName['ARTICULO'].AsString;
                    Q.Params.ByName['LINEA'].AsInteger := Qo.FieldByName['LINEA'].AsInteger;
                    Q.Params.ByName['CALCULO'].AsInteger := Qo.FieldByName['CALCULO'].AsInteger;
                    Q.Params.ByName['UNID_MINIMAS'].AsFloat := Qo.FieldByName['UNID_MINIMAS'].AsFloat;
                    Q.Params.ByName['UNID_MAXIMAS'].AsFloat := Qo.FieldByName['UNID_MAXIMAS'].AsFloat;
                    try
                       ExecQuery;
                    except
                       on e: Exception do
                          MessageDlg('INS ART_TARIFAS_COND_ART' + #13#10 + e.Message, mtError, [mbOK], 0);
                    end;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
              end;
              Qo.Next;
           end; {while not eof}
        end;

        { Sincronizar ART_TARIFAS_COND_FAM }
        {
      EMPRESA,TARIFA,FAMILIA,LINEA,CALCULO,UNID_MINIMAS,UNID_MAXIMAS
      }
        if (not hayerror) then
        begin
           FSendCorreo.Texto(_('Sincronizando Tarifas de Ventas - Condiciones de Familia'));

           if (not Qo.Transaction.InTransaction) then
              Qo.Transaction.StartTransaction;
           Qo.Close;
           Qo.SQL.Text := 'select * from art_tarifas_cond_fam where empresa=?empresa and ult_modificacion>=?ult_sincronizacion order by tarifa,familia,linea';
           Qo.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Qo.Params.ByName['ULT_SINCRONIZACION'].AsDateTime := UltimaSincronizacion;
           Qo.ExecQuery;
           while not Qo.EOF do
           begin
              FSendCorreo.Texto(_('Sincronizando Tarifas de Ventas - Condiciones de Familia') + #13#10 + Qo.FieldByName['FAMILIA'].AsString + ' - ' + Qo.FieldByName['LINEA'].AsString);

              Q := THYFIBQuery.Create(nil);
              with Q do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT COUNT(*) FROM ART_TARIFAS_COND_FAM WHERE EMPRESA=?EMPRESA AND TARIFA=?TARIFA AND FAMILIA=?FAMILIA AND LINEA=?LINEA';
                 Q.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Q.Params.ByName['TARIFA'].AsString := Qo.FieldByName['TARIFA'].AsString;
                 Q.Params.ByName['FAMILIA'].AsString := Qo.FieldByName['FAMILIA'].AsString;
                 Q.Params.ByName['LINEA'].AsInteger := Qo.FieldByName['LINEA'].AsInteger;
                 ExecQuery;
                 existe := FieldByName['COUNT'].AsInteger > 0;
                 FreeHandle;
              end;
              FreeAndNil(Q);
              if (existe) then
              begin
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'UPDATE ART_TARIFAS_COND_FAM SET CALCULO=?CALCULO,UNID_MINIMAS=?UNID_MINIMAS,UNID_MAXIMAS=?UNID_MAXIMAS ' +
                       'WHERE EMPRESA=?EMPRESA AND TARIFA=?TARIFA AND FAMILIA=?FAMILIA AND LINEA=?LINEA';
                    Q.Params.ByName['EMPRESA'].AsInteger := Qo.FieldByName['EMPRESA'].AsInteger;
                    Q.Params.ByName['TARIFA'].AsString := Qo.FieldByName['TARIFA'].AsString;
                    Q.Params.ByName['FAMILIA'].AsString := Qo.FieldByName['FAMILIA'].AsString;
                    Q.Params.ByName['LINEA'].AsInteger := Qo.FieldByName['LINEA'].AsInteger;
                    Q.Params.ByName['CALCULO'].AsInteger := Qo.FieldByName['CALCULO'].AsInteger;
                    Q.Params.ByName['UNID_MINIMAS'].AsFloat := Qo.FieldByName['UNID_MINIMAS'].AsFloat;
                    Q.Params.ByName['UNID_MAXIMAS'].AsFloat := Qo.FieldByName['UNID_MAXIMAS'].AsFloat;
                    try
                       ExecQuery;
                    except
                       on e: Exception do
                          MessageDlg('UPD ART_TARIFAS_COND_FAM' + #13#10 + e.Message, mtError, [mbOK], 0);
                    end;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
              end
              else
              begin
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'INSERT INTO ART_TARIFAS_COND_ART (EMPRESA,TARIFA,FAMILIA,LINEA,CALCULO,UNID_MINIMAS,UNID_MAXIMAS) ' +
                       'VALUES(?EMPRESA,?TARIFA,?FAMILIA,?LINEA,?CALCULO,?UNID_MINIMAS,?UNID_MAXIMAS) ';
                    Q.Params.ByName['EMPRESA'].AsInteger := Qo.FieldByName['EMPRESA'].AsInteger;
                    Q.Params.ByName['TARIFA'].AsString := Qo.FieldByName['TARIFA'].AsString;
                    Q.Params.ByName['FAMILIA'].AsString := Qo.FieldByName['FAMILIA'].AsString;
                    Q.Params.ByName['LINEA'].AsInteger := Qo.FieldByName['LINEA'].AsInteger;
                    Q.Params.ByName['CALCULO'].AsInteger := Qo.FieldByName['CALCULO'].AsInteger;
                    Q.Params.ByName['UNID_MINIMAS'].AsFloat := Qo.FieldByName['UNID_MINIMAS'].AsFloat;
                    Q.Params.ByName['UNID_MAXIMAS'].AsFloat := Qo.FieldByName['UNID_MAXIMAS'].AsFloat;
                    try
                       ExecQuery;
                    except
                       on e: Exception do
                          MessageDlg('INS ART_TARIFAS_COND_FAM' + #13#10 + e.Message, mtError, [mbOK], 0);
                    end;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
              end;
              Qo.Next;
           end; {while not eof}
        end;

        if (not hayerror) then
           EscribeDatoIni('SincronizacionKri', 'UltimaSincronizacion', DateTimeToStr(TiempoSincronizacion));
     finally
        FreeAndNil(FSendCorreo);
     end;
  end;
end;

end.
