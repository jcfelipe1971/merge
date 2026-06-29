unit UDMSincronizacionIncidencias;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, Dialogs, HYFIBQuery, FIBDataSet,
  FIBQuery, Forms, DB, DateUtils;

type
  TDMSincronizacionIncidencias = class(TDataModule)
     DataBase: THYDatabase;
     TLocal: THYTransaction;
     Qo: TFIBQuery;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
     UltimaSincronizacion: TDateTime;
     TiempoSincronizacion: TDateTime;
     hayerror: boolean;
     existe: boolean;
     Incidencias, ContactosNuevos, ContactosModificados, ClientesNuevos: integer;
     procedure MuestraProgreso(Tabla, Registro: string; BaseOrigen, Base_Destino: THYDatabase);
     procedure SincronozaSys_Terceros(BaseOrigen, Base_Destino: THYDatabase);
     procedure SincronozaEmp_Agentes(BaseOrigen, Base_Destino: THYDatabase);
     procedure SincronozaCon_Cuentas_Ges_Age(BaseOrigen, Base_Destino: THYDatabase);
     procedure SincronozaEmp_Clientes(BaseOrigen, Base_Destino: THYDatabase);
     procedure SincronozaTipo_Incidencias(BaseOrigen, Base_Destino: THYDatabase);
     procedure SincronizaCon_cuentas_ges_cli(BaseOrigen, Base_Destino: THYDatabase);
     procedure SincronozaSys_Usuarios(BaseOrigen, Base_Destino: THYDatabase);
     procedure SincronozaSys_Usuarios_perfiles(BaseOrigen, Base_Destino: THYDatabase);
     procedure InsertaContactosNuevos(BaseOrigen, Base_Destino: THYDatabase);
     procedure SincronozaEmp_Incidencias(BaseOrigen, Base_Destino: THYDatabase);
     procedure SincronozaSys_Perfiles(BaseOrigen, Base_Destino: THYDatabase);
     procedure SincronozaDic_Listados(BaseOrigen, Base_Destino: THYDatabase);
     procedure SincronozaDic_Listados_Grupos(BaseOrigen, Base_Destino: THYDatabase);
     procedure SincronozaModo_iva(BaseOrigen, Base_Destino: THYDatabase);
     procedure SincronozaArt_Tarifas_C(BaseOrigen, Base_Destino: THYDatabase);
     procedure BorrarContactos(Base: THYDatabase);
     procedure SincronozaSys_Paises(BaseOrigen, Base_Destino: THYDatabase);
     procedure SincronozaSys_Provincias(BaseOrigen, Base_Destino: THYDatabase);
     procedure SincronozaSys_Tipo_Direcciones(BaseOrigen, Base_Destino: THYDatabase);
     procedure SincronozaSys_Departamentos(BaseOrigen, Base_Destino: THYDatabase);
     procedure SincronozaSys_Terceros_contactos(BaseOrigen, Base_Destino: THYDatabase);
     procedure SincronozaSys_Tercero_Direcciones(BaseOrigen, Base_Destino: THYDatabase);
     procedure SincronozaSys_Localidades(BaseOrigen, Base_Destino: THYDatabase);
     procedure SincronizaDocumentos(Tipo: string; BaseOrigen, Base_Destino: THYDatabase);
     procedure InsertaGesCabecerasSOFC(ID: integer; BaseOrigen, Base_Destino: THYDatabase);
     procedure InsertaGesCabecerasSPEC(ID: integer; BaseOrigen, Base_Destino: THYDatabase);
     procedure InsertaGesDetallesS(Tipo: string; BaseOrigen, Base_Destino: THYDatabase);
     procedure InsertaGesDetallesSOFC(ID: integer; BaseOrigen, Base_Destino: THYDatabase);
     procedure InsertaGesDetallesSPEC(ID: integer; BaseOrigen, Base_Destino: THYDatabase);
  public
     { Public declarations }
     procedure SincronizaBases;
  end;

var
  DMSincronizacionIncidencias : TDMSincronizacionIncidencias;

implementation

uses UEntorno, UDMMain, UFSendCorreo, UUtiles;

{$R *.dfm}

procedure TDMSincronizacionIncidencias.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
end;

procedure TDMSincronizacionIncidencias.SincronizaBases;
var
  BaseDeDatosOri : string;
  sl : TStringList;
  HayErrorLocal : boolean;
  UltimaSincronizacion_Orig : TDateTime;
begin
  Incidencias := 0;
  ContactosNuevos := 0;
  ContactosModificados := 0;
  ClientesNuevos := 0;

  hayerror := False;
  HayErrorLocal := False;
  TiempoSincronizacion := Now;

  BaseDeDatosOri := LeeDatoIni('Sincronizacionincidencias', 'BaseDeDatos', '');
  try
     UltimaSincronizacion_Orig := StrToDateTime(LeeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacion', DateTimeToStr(EncodeDateTime(REntorno.Ejercicio, 01, 01, 12, 00, 00, 000))));
  except
     UltimaSincronizacion_Orig := EncodeDateTime(REntorno.Ejercicio, 01, 01, 12, 00, 00, 000);
  end;

  FSendCorreo := TFSendCorreo.Create(Self);
  try
     FSendCorreo.Titulo(Format(_('Sincronizando base con %s'), [BaseDeDatosOri]));
     FSendCorreo.Font.Size := 12;
     FSendCorreo.CambiarSizeFont(10);
     FSendCorreo.AlineamientoFont(taLeftJustify);
     FSendCorreo.Show;
     FSendCorreo.Texto(_('conectando ...'));
     try
        if not DataBase.TestConnected then
        begin
           DataBase.DBName := BaseDeDatosOri;
           DataBase.DBParams.Values['user_name'] := 'SYSDBA';
           DataBase.DBParams.Values['password'] := REntorno.ClaveBD;
           DataBase.Open;
           TLocal.StartTransaction;

           // Busco la hora del servidor
           if (not Qo.Transaction.InTransaction) then
              Qo.Transaction.StartTransaction;
           Qo.Close;
           Qo.DataBase := DataBase;
           Qo.SQL.Text := 'select Cast(''NOW'' as DATE) as ult_sincronizacion from rdb$database ';
           Qo.ExecQuery;
           TiempoSincronizacion := Qo.FieldByName['ULT_SINCRONIZACION'].AsDateTime;
           Qo.Transaction.Commit;
           Qo.FreeHandle;
        end;
     except
        on e: Exception do
        begin
           hayerror := True;
           HayErrorLocal := True;
           ShowMessage(Format(_('Imposible abrir %s'), [BaseDeDatosOri]) + #13#10 + E.Message);
        end;
     end;

     // Sincronizamos datos desde el programa generador de incidencias SYS_TERCEROS_CONTACTOS, EMP_INCIDENCIAS
     if (not hayerror) then
     begin
        //SincronozaSys_empresas(DataBase,DMMain.DataBase);
        sl := TStringList.Create;
        try
           sl.Add('InsertaContactosNuevos');
           sl.SaveToFile('Incidencias.log');
           UltimaSincronizacion := StrToDateTime(LeeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionContactosNuevos', DateTimeToStr(UltimaSincronizacion_Orig)));
           InsertaContactosNuevos(DMMain.DataBase, DataBase);
           if (not hayerror) then
              EscribeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionContactosNuevos', DateTimeToStr(TiempoSincronizacion));
           if (HayError) then
              HayErrorLocal := HayError;
           HayError := False;

           sl.Add('SincronozaEmp_Incidencias');
           sl.SaveToFile('Incidencias.log');
           UltimaSincronizacion := StrToDateTime(LeeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionEmp_Incidencias', DateTimeToStr(UltimaSincronizacion_Orig)));
           SincronozaEmp_Incidencias(DMMain.DataBase, DataBase);
           if (not hayerror) then
              EscribeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionEmp_Incidencias', DateTimeToStr(TiempoSincronizacion));
           if (HayError) then
              HayErrorLocal := HayError;
           HayError := False;

           //sl.Add('BorrarIncidencias');
           //BorrarIncidencias(DMMain.DataBase);

           sl.Add('BorrarContactos');
           sl.SaveToFile('Incidencias.log');
           UltimaSincronizacion := StrToDateTime(LeeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionBorrarContactos', DateTimeToStr(UltimaSincronizacion_Orig)));
           BorrarContactos(DMMain.DataBase);
           if (not hayerror) then
              EscribeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionBorrarContactos', DateTimeToStr(TiempoSincronizacion));
           if (HayError) then
              HayErrorLocal := HayError;
           HayError := False;

           // RECIBIMOS DATOS NUEVOS del program G2K

           sl.Add('SincronozaSys_Departamentos');
           sl.SaveToFile('Incidencias.log');
           UltimaSincronizacion := StrToDateTime(LeeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionSys_Departamentos', DateTimeToStr(UltimaSincronizacion_Orig)));
           SincronozaSys_Departamentos(DataBase, DMMain.DataBase);
           if (not hayerror) then
              EscribeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionSys_Departamentos', DateTimeToStr(TiempoSincronizacion));
           if (HayError) then
              HayErrorLocal := HayError;
           HayError := False;

           sl.Add('SincronozaDic_Listados_Grupos');
           sl.SaveToFile('Incidencias.log');
           UltimaSincronizacion := StrToDateTime(LeeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionDic_Listados_Grupos', DateTimeToStr(UltimaSincronizacion_Orig)));
           SincronozaDic_Listados_Grupos(DataBase, DMMain.DataBase);
           if (not hayerror) then
              EscribeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionDic_Listados_Grupos', DateTimeToStr(TiempoSincronizacion));
           if (HayError) then
              HayErrorLocal := HayError;
           HayError := False;

           sl.Add('SincronozaDic_Listados');
           sl.SaveToFile('Incidencias.log');
           UltimaSincronizacion := StrToDateTime(LeeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionDic_Listados', DateTimeToStr(UltimaSincronizacion_Orig)));
           SincronozaDic_Listados(DataBase, DMMain.DataBase);
           if (not hayerror) then
              EscribeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionDic_Listados', DateTimeToStr(TiempoSincronizacion));
           if (HayError) then
              HayErrorLocal := HayError;
           HayError := False;

           sl.Add('SincronozaSys_Perfiles');
           sl.SaveToFile('Incidencias.log');
           UltimaSincronizacion := StrToDateTime(LeeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionSys_Perfiles', DateTimeToStr(UltimaSincronizacion_Orig)));
           SincronozaSys_Perfiles(DataBase, DMMain.DataBase);
           if (not hayerror) then
              EscribeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionSys_Perfiles', DateTimeToStr(TiempoSincronizacion));
           if (HayError) then
              HayErrorLocal := HayError;
           HayError := False;

           sl.Add('SincronozaSys_Usuarios_perfiles');
           sl.SaveToFile('Incidencias.log');
           UltimaSincronizacion := StrToDateTime(LeeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionSys_Usuarios_perfiles', DateTimeToStr(UltimaSincronizacion_Orig)));
           SincronozaSys_Usuarios_perfiles(DataBase, DMMain.DataBase);
           if (not hayerror) then
              EscribeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionSys_Usuarios_perfiles', DateTimeToStr(TiempoSincronizacion));
           if (HayError) then
              HayErrorLocal := HayError;
           HayError := False;

           sl.Add('SincronozaSys_Usuarios');
           sl.SaveToFile('Incidencias.log');
           UltimaSincronizacion := StrToDateTime(LeeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionSys_Usuarios', DateTimeToStr(UltimaSincronizacion_Orig)));
           SincronozaSys_Usuarios(DataBase, DMMain.DataBase);
           if (not hayerror) then
              EscribeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionSys_Usuarios', DateTimeToStr(TiempoSincronizacion));
           if (HayError) then
              HayErrorLocal := HayError;
           HayError := False;

           sl.Add('SincronozaSys_Paises');
           sl.SaveToFile('Incidencias.log');
           UltimaSincronizacion := StrToDateTime(LeeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionSys_Paises', DateTimeToStr(UltimaSincronizacion_Orig)));
           SincronozaSys_Paises(DataBase, DMMain.DataBase);
           if (not hayerror) then
              EscribeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionSys_Paises', DateTimeToStr(TiempoSincronizacion));
           if (HayError) then
              HayErrorLocal := HayError;
           HayError := False;

           sl.Add('SincronozaSys_Provincias');
           sl.SaveToFile('Incidencias.log');
           UltimaSincronizacion := StrToDateTime(LeeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionSys_Provincias', DateTimeToStr(UltimaSincronizacion_Orig)));
           SincronozaSys_Provincias(DataBase, DMMain.DataBase);
           if (not hayerror) then
              EscribeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionSys_Provincias', DateTimeToStr(TiempoSincronizacion));
           if (HayError) then
              HayErrorLocal := HayError;
           HayError := False;

           sl.Add('SincronozaSys_Localidades');
           sl.SaveToFile('Incidencias.log');
           UltimaSincronizacion := StrToDateTime(LeeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionSys_Localidades', DateTimeToStr(UltimaSincronizacion_Orig)));
           SincronozaSys_Localidades(DataBase, DMMain.DataBase);
           if (not hayerror) then
              EscribeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionSys_Localidades', DateTimeToStr(TiempoSincronizacion));
           if (HayError) then
              HayErrorLocal := HayError;
           HayError := False;

           sl.Add('SincronozaSys_Tipo_Direcciones');
           sl.SaveToFile('Incidencias.log');
           UltimaSincronizacion := StrToDateTime(LeeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionSys_Tipo_Direcciones', DateTimeToStr(UltimaSincronizacion_Orig)));
           SincronozaSys_Tipo_Direcciones(DataBase, DMMain.DataBase);
           if (not hayerror) then
              EscribeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionSys_Tipo_Direcciones', DateTimeToStr(TiempoSincronizacion));
           if (HayError) then
              HayErrorLocal := HayError;
           HayError := False;

           sl.Add('SincronozaSys_Terceros');
           sl.SaveToFile('Incidencias.log');
           UltimaSincronizacion := StrToDateTime(LeeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionSys_Terceros', DateTimeToStr(UltimaSincronizacion_Orig)));
           SincronozaSys_Terceros(DataBase, DMMain.DataBase);
           if (not hayerror) then
              EscribeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionSys_Terceros', DateTimeToStr(TiempoSincronizacion));
           if (HayError) then
              HayErrorLocal := HayError;
           HayError := False;

           sl.Add('SincronozaSys_Tercero_Direcciones');
           sl.SaveToFile('Incidencias.log');
           UltimaSincronizacion := StrToDateTime(LeeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionSys_Tercero_Direcciones', DateTimeToStr(UltimaSincronizacion_Orig)));
           SincronozaSys_Tercero_Direcciones(DataBase, DMMain.DataBase);
           if (not hayerror) then
              EscribeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionSys_Tercero_Direcciones', DateTimeToStr(TiempoSincronizacion));
           if (HayError) then
              HayErrorLocal := HayError;
           HayError := False;

           sl.Add('SincronozaEmp_Agentes');
           sl.SaveToFile('Incidencias.log');
           UltimaSincronizacion := StrToDateTime(LeeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionEmp_Agentes', DateTimeToStr(UltimaSincronizacion_Orig)));
           SincronozaEmp_Agentes(DataBase, DMMain.DataBase);
           if (not hayerror) then
              EscribeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionEmp_Agentes', DateTimeToStr(TiempoSincronizacion));
           if (HayError) then
              HayErrorLocal := HayError;
           HayError := False;

           sl.Add('SincronozaCon_Cuentas_Ges_Age');
           sl.SaveToFile('Incidencias.log');
           UltimaSincronizacion := StrToDateTime(LeeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionCon_Cuentas_Ges_Age', DateTimeToStr(UltimaSincronizacion_Orig)));
           SincronozaCon_Cuentas_Ges_Age(DataBase, DMMain.DataBase);
           if (not hayerror) then
              EscribeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionCon_Cuentas_Ges_Age', DateTimeToStr(TiempoSincronizacion));
           if (HayError) then
              HayErrorLocal := HayError;
           HayError := False;

           sl.Add('SincronozaArt_Tarifas_C');
           sl.SaveToFile('Incidencias.log');
           UltimaSincronizacion := StrToDateTime(LeeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionArt_Tarifas_C', DateTimeToStr(UltimaSincronizacion_Orig)));
           SincronozaArt_Tarifas_C(DataBase, DMMain.DataBase);
           if (not hayerror) then
              EscribeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionArt_Tarifas_C', DateTimeToStr(TiempoSincronizacion));
           if (HayError) then
              HayErrorLocal := HayError;
           HayError := False;

           sl.Add('SincronozaEmp_Clientes');
           sl.SaveToFile('Incidencias.log');
           UltimaSincronizacion := StrToDateTime(LeeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionEmp_Clientes', DateTimeToStr(UltimaSincronizacion_Orig)));
           SincronozaEmp_Clientes(DataBase, DMMain.DataBase);
           if (not hayerror) then
              EscribeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionEmp_Clientes', DateTimeToStr(TiempoSincronizacion));
           if (HayError) then
              HayErrorLocal := HayError;
           HayError := False;

           sl.Add('SincronozaModo_iva');
           sl.SaveToFile('Incidencias.log');
           UltimaSincronizacion := StrToDateTime(LeeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionModo_iva', DateTimeToStr(UltimaSincronizacion_Orig)));
           SincronozaModo_iva(DataBase, DMMain.DataBase);
           if (not hayerror) then
              EscribeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionModo_iva', DateTimeToStr(TiempoSincronizacion));
           if (HayError) then
              HayErrorLocal := HayError;
           HayError := False;

           sl.Add('SincronizaCon_cuentas_ges_cli');
           sl.SaveToFile('Incidencias.log');
           UltimaSincronizacion := StrToDateTime(LeeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionCon_cuentas_ges_cli', DateTimeToStr(UltimaSincronizacion_Orig)));
           SincronizaCon_cuentas_ges_cli(DataBase, DMMain.DataBase);
           if (not hayerror) then
              EscribeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionCon_cuentas_ges_cli', DateTimeToStr(TiempoSincronizacion));
           if (HayError) then
              HayErrorLocal := HayError;
           HayError := False;

           sl.Add('SincronozaTipo_Incidencias');
           sl.SaveToFile('Incidencias.log');
           UltimaSincronizacion := StrToDateTime(LeeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionTipo_Incidencias', DateTimeToStr(UltimaSincronizacion_Orig)));
           SincronozaTipo_Incidencias(DataBase, DMMain.DataBase);
           if (not hayerror) then
              EscribeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionTipo_Incidencias', DateTimeToStr(TiempoSincronizacion));
           if (HayError) then
              HayErrorLocal := HayError;
           HayError := False;

           sl.Add('SincronozaSys_Terceros_contactos');
           sl.SaveToFile('Incidencias.log');
           UltimaSincronizacion := StrToDateTime(LeeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionSys_Terceros_contactos', DateTimeToStr(UltimaSincronizacion_Orig)));
           SincronozaSys_Terceros_contactos(DataBase, DMMain.DataBase);
           if (not hayerror) then
              EscribeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionSys_Terceros_contactos', DateTimeToStr(TiempoSincronizacion));
           if (HayError) then
              HayErrorLocal := HayError;
           HayError := False;

           sl.Add('Sincronoza Ofertas');
           sl.SaveToFile('Incidencias.log');
           UltimaSincronizacion := StrToDateTime(LeeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionOfertas', DateTimeToStr(UltimaSincronizacion_Orig)));
           SincronizaDocumentos('OFC', DataBase, DMMain.DataBase);
           if (not hayerror) then
              EscribeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionOfertas', DateTimeToStr(TiempoSincronizacion));
           if (HayError) then
              HayErrorLocal := HayError;
           HayError := False;

           sl.Add('Sincronoza Pedidos');
           UltimaSincronizacion := StrToDateTime(LeeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionPedidos', DateTimeToStr(UltimaSincronizacion_Orig)));
           SincronizaDocumentos('PEC', DataBase, DMMain.DataBase);
           sl.SaveToFile('Incidencias.log');
           if (not hayerror) then
              EscribeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacionPedidos', DateTimeToStr(TiempoSincronizacion));
           if (HayError) then
              HayErrorLocal := HayError;
           HayError := False;

        finally
           sl.Free;
        end;
     end;
  finally
     FreeAndNil(FSendCorreo);
  end;

  if (not HayErrorLocal) then
     EscribeDatoIni('Sincronizacionincidencias', 'UltimaSincronizacion', DateTimeToStr(TiempoSincronizacion));

  FSendCorreo := TFSendCorreo.Create(Self);
  FSendCorreo.BitBtnOk.Visible := True;
  FSendCorreo.sepuede := True;
  FSendCorreo.Caption := Format(_('Reporte de la sincronización'), [BaseDeDatosOri]);
  FSendCorreo.CambiarSizeFont(10);
  FSendCorreo.AlineamientoFont(taLeftJustify);
  FSendCorreo.Show;
  FSendCorreo.Texto(
     'Incidencias :' + IntToStr(Incidencias) + #13#10 +
     'Contactos nuevos :' + IntToStr(ContactosNuevos) + #13#10 +
     'Contactos modificados :' + IntToStr(ContactosModificados) + #13#10 +
     'Clientes nuevos :' + IntToStr(ClientesNuevos));
  {FSendCorreo.Free;}
end;

procedure TDMSincronizacionIncidencias.SincronozaSys_Terceros(BaseOrigen, Base_Destino: THYDatabase);
var
  Q : THYFIBQuery;
  DS : TFIBDataSet;
begin
  if (not hayerror) then
  begin
     MuestraProgreso('Terceros', '', BaseOrigen, Base_Destino);
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := TFIBTransaction.Create(nil);
           try
              with Transaction do
              begin
                 DefaultDatabase := BaseOrigen;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
              end;
              Close;
              DataBase := BaseOrigen;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;

              SelectSQL.Add('SELECT * FROM SYS_TERCEROS WHERE ULT_MODIFICACION >= ?ULT_MODIFICACION AND ULT_MODIFICACION <= ?TIEMPO_SINCRONIZACION ORDER BY TERCERO');
              Params.ByName['ULT_MODIFICACION'].AsDateTime := UltimaSincronizacion;
              Params.ByName['TIEMPO_SINCRONIZACION'].AsDateTime := TiempoSincronizacion;
              Open;
              while not DS.EOF do
              begin
                 MuestraProgreso('Terceros', DS.FieldByName('TERCERO').AsString + ' ' + DS.FieldByName('NOMBRE_R_SOCIAL').AsString, BaseOrigen, Base_Destino);
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := Base_Destino;
                    SQL.Text :=
                       'SELECT COUNT(*) FROM SYS_TERCEROS WHERE TERCERO = :TERCERO';
                    Q.Prepare;
                    Params.ByName['TERCERO'].AsInteger := DS.FieldByName('TERCERO').AsInteger;
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
                       Q.Close;
                       Q.DataBase := Base_Destino;
                       Q.SQL.Text :=
                          'UPDATE SYS_TERCEROS SET ' +
                          'NOMBRE_R_SOCIAL   = ?NOMBRE_R_SOCIAL, ' +
                          'NOMBRE_COMERCIAL  = ?NOMBRE_COMERCIAL, ' +
                          'TIPO_RAZON        = ?TIPO_RAZON, ' +
                          'NIF               = ?NIF, ' +
                          'FECHA_ALTA        = ?FECHA_ALTA, ' +
                          'NOTAS             = ?NOTAS, ' +
                          'TELEFONO01        = ?TELEFONO01, ' +
                          'TELEFONO02        = ?TELEFONO02, ' +
                          'TELEFAX           = ?TELEFAX, ' +
                          'EMAIL             = ?EMAIL, ' +
                          'WEB               = ?WEB, ' +
                          'CLIENTE_POTENCIAL = ?CLIENTE_POTENCIAL, ' +
                          'IMAGEN            = ?IMAGEN, ' +
                          'COD_CREDITO_Y_CAUCION = ?COD_CREDITO_Y_CAUCION, ' +
                          'CODIGO_EDI        = ?CODIGO_EDI, ' +
                          'REGISTRO_MERCANTIL= ?REGISTRO_MERCANTIL ' +
                          'WHERE ' +
                          'TERCERO = ?TERCERO';
                       Q.Prepare;
                       Q.Params.ByName['TERCERO'].AsInteger := DS.FieldByName('TERCERO').AsInteger;
                       Q.Params.ByName['NOMBRE_R_SOCIAL'].AsString := DS.FieldByName('NOMBRE_R_SOCIAL').AsString;
                       Q.Params.ByName['NOMBRE_COMERCIAL'].AsString := DS.FieldByName('NOMBRE_COMERCIAL').AsString;
                       Q.Params.ByName['TIPO_RAZON'].AsString := DS.FieldByName('TIPO_RAZON').AsString;
                       Q.Params.ByName['NIF'].AsString := DS.FieldByName('NIF').AsString;
                       Q.Params.ByName['FECHA_ALTA'].AsDateTime := DS.FieldByName('FECHA_ALTA').AsDateTime;
                       Q.Params.ByName['NOTAS'].AsString := DS.FieldByName('NOTAS').AsString;
                       Q.Params.ByName['TELEFONO01'].AsString := DS.FieldByName('TELEFONO01').AsString;
                       Q.Params.ByName['TELEFONO02'].AsString := DS.FieldByName('TELEFONO02').AsString;
                       Q.Params.ByName['TELEFAX'].AsString := DS.FieldByName('TELEFAX').AsString;
                       Q.Params.ByName['EMAIL'].AsString := DS.FieldByName('EMAIL').AsString;
                       Q.Params.ByName['WEB'].AsString := DS.FieldByName('WEB').AsString;
                       //Params.ByName['BANCOS'].AsInteger := DS.FieldByName('BANCOS').AsInteger;
                       //Params.ByName['CONTACTOS'].AsInteger := DS.FieldByName('CONTACTOS').AsInteger;
                       //Params.ByName['DIRECCIONES'].AsInteger := DS.FieldByName('DIRECCIONES').AsInteger;
                       Q.Params.ByName['CLIENTE_POTENCIAL'].AsInteger := DS.FieldByName('CLIENTE_POTENCIAL').AsInteger;
                       Q.Params.ByName['IMAGEN'].AsInteger := DS.FieldByName('IMAGEN').AsInteger;
                       Q.Params.ByName['COD_CREDITO_Y_CAUCION'].AsInteger := DS.FieldByName('COD_CREDITO_Y_CAUCION').AsInteger;
                       Q.Params.ByName['CODIGO_EDI'].AsString := DS.FieldByName('CODIGO_EDI').AsString;
                       Q.Params.ByName['REGISTRO_MERCANTIL'].AsString := DS.FieldByName('REGISTRO_MERCANTIL').AsString;
                       try
                          Q.ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg(' UPD SYS_TERCEROS ' + #13#10 + e.Message, mtError, [mbOK], 0);
                       end;
                       Q.FreeHandle;
                    end;
                    FreeAndNil(Q);
                 end
                 else
                 begin
                    Q := THYFIBQuery.Create(nil);
                    with Q do
                    begin
                       Q.Close;
                       Q.DataBase := Base_Destino;
                       Q.SQL.Text :=
                          'INSERT INTO SYS_TERCEROS  ' +
                          '(TERCERO,NOMBRE_R_SOCIAL ,NOMBRE_COMERCIAL ,TIPO_RAZON ,NIF ,FECHA_ALTA ,NOTAS ,TELEFONO01 ,TELEFONO02 ,TELEFAX ,EMAIL ,WEB, ' +
                          ' CLIENTE_POTENCIAL ,IMAGEN ,CODIGO_EDI ,REGISTRO_MERCANTIL ,COD_CREDITO_Y_CAUCION ) ' +
                          'VALUES ' +
                          '(:TERCERO,:NOMBRE_R_SOCIAL ,:NOMBRE_COMERCIAL ,:TIPO_RAZON ,:NIF ,:FECHA_ALTA ,:NOTAS ,:TELEFONO01 ,:TELEFONO02 ,:TELEFAX ,:EMAIL ,:WEB, ' +
                          ' :CLIENTE_POTENCIAL ,:IMAGEN ,:CODIGO_EDI ,:REGISTRO_MERCANTIL ,:COD_CREDITO_Y_CAUCION ) ';
                       Q.Prepare;
                       Q.Params.ByName['TERCERO'].AsInteger := DS.FieldByName('TERCERO').AsInteger;
                       Q.Params.ByName['NOMBRE_R_SOCIAL'].AsString := DS.FieldByName('NOMBRE_R_SOCIAL').AsString;
                       Q.Params.ByName['NOMBRE_COMERCIAL'].AsString := DS.FieldByName('NOMBRE_COMERCIAL').AsString;
                       Q.Params.ByName['TIPO_RAZON'].AsString := DS.FieldByName('TIPO_RAZON').AsString;
                       Q.Params.ByName['NIF'].AsString := DS.FieldByName('NIF').AsString;
                       Q.Params.ByName['FECHA_ALTA'].AsDateTime := DS.FieldByName('FECHA_ALTA').AsDateTime;
                       Q.Params.ByName['NOTAS'].AsString := DS.FieldByName('NOTAS').AsString;
                       Q.Params.ByName['TELEFONO01'].AsString := DS.FieldByName('TELEFONO01').AsString;
                       Q.Params.ByName['TELEFONO02'].AsString := DS.FieldByName('TELEFONO02').AsString;
                       Q.Params.ByName['TELEFAX'].AsString := DS.FieldByName('TELEFAX').AsString;
                       Q.Params.ByName['EMAIL'].AsString := DS.FieldByName('EMAIL').AsString;
                       Q.Params.ByName['WEB'].AsString := DS.FieldByName('WEB').AsString;
                       {
                       Params.ByName['BANCOS'].AsInteger := DS.FieldByName('BANCOS').AsInteger;
                       Params.ByName['CONTACTOS'].AsInteger := DS.FieldByName('CONTACTOS').AsInteger;
                       Params.ByName['DIRECCIONES'].AsInteger := DS.FieldByName('DIRECCIONES').AsInteger;
}
                       Q.Params.ByName['CLIENTE_POTENCIAL'].AsInteger := DS.FieldByName('CLIENTE_POTENCIAL').AsInteger;
                       Q.Params.ByName['IMAGEN'].AsInteger := DS.FieldByName('IMAGEN').AsInteger;
                       Q.Params.ByName['CODIGO_EDI'].AsString := DS.FieldByName('CODIGO_EDI').AsString;
                       Q.Params.ByName['REGISTRO_MERCANTIL'].AsString := DS.FieldByName('REGISTRO_MERCANTIL').AsString;
                       Q.Params.ByName['COD_CREDITO_Y_CAUCION'].AsInteger := DS.FieldByName('COD_CREDITO_Y_CAUCION').AsInteger;
                       try
                          Q.ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg(' INS SYS_TERCEROS ' + #13#10 + e.Message, mtError, [mbOK], 0);
                       end;
                       Q.FreeHandle;
                    end;
                    FreeAndNil(Q);
                 end;
                 DS.Next;
              end; {while not eof}
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;
  end;
end;

procedure TDMSincronizacionIncidencias.SincronozaEmp_Agentes(BaseOrigen, Base_Destino: THYDatabase);
var
  Q : THYFIBQuery;
  DS : TFIBDataSet;
begin
  if (not hayerror) then
  begin
     MuestraProgreso('Agentes', '', BaseOrigen, Base_Destino);
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := TFIBTransaction.Create(nil);
           try
              with Transaction do
              begin
                 DefaultDatabase := BaseOrigen;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
              end;
              Close;
              DataBase := BaseOrigen;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;

              SelectSQL.Add('SELECT * FROM EMP_AGENTES WHERE EMPRESA = ?EMPRESA AND ULT_MODIFICACION >= ?ULT_MODIFICACION AND ULT_MODIFICACION <= ?TIEMPO_SINCRONIZACION ORDER BY AGENTE');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['ULT_MODIFICACION'].AsDateTime := UltimaSincronizacion;
              Params.ByName['TIEMPO_SINCRONIZACION'].AsDateTime := TiempoSincronizacion;
              Open;
              while not DS.EOF do
              begin
                 MuestraProgreso('Agentes', DS.FieldByName('AGENTE').AsString, BaseOrigen, Base_Destino);
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := Base_Destino;
                    SQL.Text :=
                       'SELECT COUNT(*) FROM EMP_AGENTES WHERE EMPRESA = ?EMPRESA AND AGENTE = ?AGENTE';
                    Q.Params.ByName['EMPRESA'].AsInteger := DS.FieldByName('EMPRESA').AsInteger;
                    Q.Params.ByName['AGENTE'].AsInteger := DS.FieldByName('AGENTE').AsInteger;
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
                       DataBase := Base_Destino;
                       SQL.Text :=

                          'UPDATE EMP_AGENTES SET ' +
                          'TERCERO    = ?TERCERO,   ' +
                          'P_COMISION = ?P_COMISION,' +
                          'NOTAS      = ?NOTAS,     ' +
                          'ID_AGENTE  = ?ID_AGENTE  ' +
                          'WHERE EMPRESA = ?EMPRESA AND AGENTE = ?AGENTE';
                       Q.Params.ByName['EMPRESA'].AsInteger := DS.FieldByName('EMPRESA').AsInteger;
                       Q.Params.ByName['AGENTE'].AsInteger := DS.FieldByName('AGENTE').AsInteger;
                       Q.Params.ByName['TERCERO'].AsInteger := DS.FieldByName('TERCERO').AsInteger;
                       Q.Params.ByName['P_COMISION'].AsFloat := DS.FieldByName('P_COMISION').AsFloat;
                       Q.Params.ByName['NOTAS'].AsString := DS.FieldByName('NOTAS').AsString;
                       Q.Params.ByName['ID_AGENTE'].AsInteger := DS.FieldByName('ID_AGENTE').AsInteger;
                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg(' UPD EMP_AGENTES ' + #13#10 + e.Message, mtError, [mbOK], 0);
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
                       DataBase := Base_Destino;
                       SQL.Text :=
                          'INSERT INTO EMP_AGENTES ' +
                          '(EMPRESA, AGENTE, TERCERO, P_COMISION, NOTAS, ID_AGENTE) ' +
                          'VALUES ' +
                          '(?EMPRESA, ?AGENTE, ?TERCERO, ?P_COMISION, ?NOTAS, ?ID_AGENTE)';
                       Q.Params.ByName['EMPRESA'].AsInteger := DS.FieldByName('EMPRESA').AsInteger;
                       Q.Params.ByName['AGENTE'].AsInteger := DS.FieldByName('AGENTE').AsInteger;
                       Q.Params.ByName['TERCERO'].AsInteger := DS.FieldByName('TERCERO').AsInteger;
                       Q.Params.ByName['P_COMISION'].AsFloat := DS.FieldByName('P_COMISION').AsFloat;
                       Q.Params.ByName['NOTAS'].AsString := DS.FieldByName('NOTAS').AsString;
                       Q.Params.ByName['ID_AGENTE'].AsInteger := DS.FieldByName('ID_AGENTE').AsInteger;
                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg(' INS EMP_AGENTES ' + #13#10 + e.Message, mtError, [mbOK], 0);
                       end;
                       FreeHandle;
                    end;
                    FreeAndNil(Q);
                 end;
                 DS.Next;
              end; {while not eof}
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;
  end;
end;

procedure TDMSincronizacionIncidencias.SincronozaEmp_Clientes(BaseOrigen, Base_Destino: THYDatabase);
var
  Q : THYFIBQuery;
  DS : TFIBDataSet;
begin
  if (not hayerror) then
  begin
     MuestraProgreso('Clientes', '', BaseOrigen, Base_Destino);
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := TFIBTransaction.Create(nil);
           try
              with Transaction do
              begin
                 DefaultDatabase := BaseOrigen;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
              end;
              Close;
              DataBase := BaseOrigen;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;

              SelectSQL.Add('SELECT  * FROM EMP_CLIENTES WHERE EMPRESA = ?EMPRESA AND ULT_MODIFICACION >= ?ULT_MODIFICACION ORDER BY CLIENTE');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['ULT_MODIFICACION'].AsDateTime := UltimaSincronizacion;
              Open;
              while not DS.EOF do
              begin
                 MuestraProgreso('Clientes', DS.FieldByName('CLIENTE').AsString, BaseOrigen, Base_Destino);
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := Base_Destino;
                    SQL.Text :=
                       'SELECT  COUNT(*)FROM EMP_CLIENTES WHERE EMPRESA = ?EMPRESA AND CLIENTE = ?CLIENTE';
                    Q.Params.ByName['EMPRESA'].AsInteger := DS.FieldByName('EMPRESA').AsInteger;
                    Q.Params.ByName['CLIENTE'].AsInteger := DS.FieldByName('CLIENTE').AsInteger;
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
                       DataBase := Base_Destino;
                       SQL.Text :=
                          'UPDATE EMP_CLIENTES SET             ' +
                          'TERCERO                  = ?TERCERO,' +
                          'TARIFA                   = ?TARIFA, ' +
                          'RIESGO_AUT               = ?RIESGO_AUT, ' +
                          'RIESGO_ACT               = ?RIESGO_ACT, ' +
                          'DIA_PAGO_1               = ?DIA_PAGO_1, ' +
                          'DIA_PAGO_2               = ?DIA_PAGO_2, ' +
                          'DESCUENTO_PP             = ?DESCUENTO_PP, ' +
                          'AGENTE                   = ?AGENTE, ' +
                          'NOTAS                    = ?NOTAS, ' +
                          'RIESGO_FAC               = ?RIESGO_FAC, ' +
                          'RIESGO_ALB               = ?RIESGO_ALB, ' +
                          'RIESGO_CAR               = ?RIESGO_CAR,  ' +
                          'RIESGO_REM               = ?RIESGO_REM, ' +
                          'TIPO                     = ?TIPO, ' +
                          'PORTES                   = ?PORTES, ' +
                          'DESCUENTO_CIAL           = ?DESCUENTO_CIAL, ' +
                          'USAR_ANTICIPOS           = ?USAR_ANTICIPOS, ' +
                          'SU_PROVEEDOR             = ?SU_PROVEEDOR,' +
                          'EVAL_FEB                 = ?EVAL_FEB, ' +
                          'EVAL_FEB_SI              = ?EVAL_FEB_SI, ' +
                          'TRANSPORTISTA            = ?TRANSPORTISTA, ' +
                          'FINANCIACION             = ?FINANCIACION, ' +
                          'FACTURAR_DIRECCION       = ?FACTURAR_DIRECCION,' +
                          'FACTURAR_AGENTE          = ?FACTURAR_AGENTE, ' +
                          'FACTURAR_TRANSPORTISTA   = ?FACTURAR_TRANSPORTISTA, ' +
                          'FACTURAR_REFERENCIA      = ?FACTURAR_REFERENCIA, ' +
                          'FACTURA_DIRECCION_ADMTVA = ?FACTURA_DIRECCION_ADMTVA,' +
                          'ALBARAN_DIRECCION_ENVIO  = ?ALBARAN_DIRECCION_ENVIO, ' +
                          'POR_FINANCIACION         = ?POR_FINANCIACION, ' +
                          'NO_ALB_FAC               = ?NO_ALB_FAC, ' +
                          'NO_VENTA_RIESGO          = ?NO_VENTA_RIESGO, ' +
                          'FACTURAR_SERIE           = ?FACTURAR_SERIE, ' +
                          'SERIE_A_FACTURAR         = ?SERIE_A_FACTURAR, ' +
                          'SU_REFERENCIA            = ?SU_REFERENCIA, ' +
                          'FACTURAR_ALMACEN         = ?FACTURAR_ALMACEN, ' +
                          'NRO_EMPLEADOS            = ?NRO_EMPLEADOS, ' +
                          'FACTURACION_TOTAL        = ?FACTURACION_TOTAL ,' +
                          'CONSUMO_MATERIAL         = ?CONSUMO_MATERIAL, ' +
                          'PROVEEDORES_HABITUALES   = ?PROVEEDORES_HABITUALES, ' +
                          'RUTA                     = ?RUTA, ' +
                          'CLIENTE_POTENCIAL        = ?CLIENTE_POTENCIAL, ' +
                          'CREDITO_Y_CAUCION        = ?CREDITO_Y_CAUCION, ' +
                          'MOROSO                   = ?MOROSO,' +
                          'TIPO_CLIENTE             = ?TIPO_CLIENTE, ' +
                          'FACTURAR_TARIFA          = ?FACTURAR_TARIFA, ' +
                          'NO_CALC_DESC_KRI         = ?NO_CALC_DESC_KRI, ' +
                          'NO_AGRUPAR_PED_KRI       = ?NO_AGRUPAR_PED_KRI, ' +
                          'POTENCIAL_DE_COMPRA      = ?POTENCIAL_DE_COMPRA, ' +
                          'NOTAS_FACTURACION_KRI    = ?NOTAS_FACTURACION_KRI, ' +
                          'RIESGO_FACTOR            = ?RIESGO_FACTOR, INTRA = ?INTRA,' +
                          'INTRA_TRANS              = ?INTRA_TRANS, ' +
                          'PAIS_C2                  = ?PAIS_C2, ' +
                          'DIAS_ENTREGA             = ?DIAS_ENTREGA, ' +
                          'IDIOMA                   = ?IDIOMA, ' +
                          'APLICAR_PTO_VERDE        = ?APLICAR_PTO_VERDE,' +
                          'FACTURAS_POR_EMAIL_KRI   = ?FACTURAS_POR_EMAIL_KRI, ' +
                          'FRECUENCIA               = ?FRECUENCIA, ' +
                          'ULT_MODIFICACION         = ?ULT_MODIFICACION, ' +
                          'ID_CLIENTE               = ?ID_CLIENTE, ' +
                          'ZONA                     = ?ZONA, ' +
                          'PROTOCOLO                = ?PROTOCOLO,' +
                          'BLOQUEO                  = ?BLOQUEO, ' +
                          'MOTIVO_BLOQUEO           = ?MOTIVO_BLOQUEO, ' +
                          'CODIGO_INCOTERM          = ?CODIGO_INCOTERM, ' +
                          'DIR_DEFECTO_VENTAS       = ?DIR_DEFECTO_VENTAS, ' +
                          'DIRECCION_DEFECTO        = ?DIRECCION_DEFECTO,' +
                          'FECHA_ENTREGA_X_STOCK    = ?FECHA_ENTREGA_X_STOCK, ' +
                          'SIN_DESCUENTOS           = ?SIN_DESCUENTOS ' +
                          'WHERE ' +
                          'EMPRESA  = ?EMPRESA AND CLIENTE = ?CLIENTE';

                       Q.Params.ByName['EMPRESA'].AsInteger := DS.FieldByName('EMPRESA').AsInteger;
                       Q.Params.ByName['CLIENTE'].AsInteger := DS.FieldByName('CLIENTE').AsInteger;
                       Q.Params.ByName['TERCERO'].AsInteger := DS.FieldByName('TERCERO').AsInteger;
                       Q.Params.ByName['TARIFA'].AsString := DS.FieldByName('TARIFA').AsString;
                       Q.Params.ByName['RIESGO_AUT'].AsFloat := DS.FieldByName('RIESGO_AUT').AsFloat;
                       Q.Params.ByName['DIA_PAGO_1'].AsInteger := DS.FieldByName('DIA_PAGO_1').AsInteger;
                       Q.Params.ByName['DIA_PAGO_2'].AsInteger := DS.FieldByName('DIA_PAGO_2').AsInteger;
                       Q.Params.ByName['DESCUENTO_PP'].AsFloat := DS.FieldByName('DESCUENTO_PP').AsFloat;
                       Q.Params.ByName['AGENTE'].AsInteger := DS.FieldByName('AGENTE').AsInteger;
                       Q.Params.ByName['NOTAS'].AsString := DS.FieldByName('NOTAS').AsString;
                       Q.Params.ByName['RIESGO_FAC'].AsFloat := DS.FieldByName('RIESGO_FAC').AsFloat;
                       Q.Params.ByName['RIESGO_ALB'].AsFloat := DS.FieldByName('RIESGO_ALB').AsFloat;
                       Q.Params.ByName['RIESGO_CAR'].AsFloat := DS.FieldByName('RIESGO_CAR').AsFloat;
                       Q.Params.ByName['RIESGO_REM'].AsFloat := DS.FieldByName('RIESGO_REM').AsFloat;
                       Q.Params.ByName['TIPO'].AsInteger := DS.FieldByName('TIPO').AsInteger;
                       Q.Params.ByName['PORTES'].AsInteger := DS.FieldByName('PORTES').AsInteger;
                       Q.Params.ByName['DESCUENTO_CIAL'].AsFloat := DS.FieldByName('DESCUENTO_CIAL').AsFloat;
                       Q.Params.ByName['USAR_ANTICIPOS'].AsInteger := DS.FieldByName('USAR_ANTICIPOS').AsInteger;
                       Q.Params.ByName['SU_PROVEEDOR'].AsString := DS.FieldByName('SU_PROVEEDOR').AsString;
                       Q.Params.ByName['EVAL_FEB'].AsInteger := DS.FieldByName('EVAL_FEB').AsInteger;
                       Q.Params.ByName['EVAL_FEB_SI'].AsInteger := DS.FieldByName('EVAL_FEB_SI').AsInteger;
                       Q.Params.ByName['TRANSPORTISTA'].AsInteger := DS.FieldByName('TRANSPORTISTA').AsInteger;
                       Q.Params.ByName['FINANCIACION'].AsInteger := DS.FieldByName('FINANCIACION').AsInteger;
                       Q.Params.ByName['FACTURAR_DIRECCION'].AsInteger := DS.FieldByName('FACTURAR_DIRECCION').AsInteger;
                       Q.Params.ByName['FACTURAR_AGENTE'].AsInteger := DS.FieldByName('FACTURAR_AGENTE').AsInteger;
                       Q.Params.ByName['FACTURAR_TRANSPORTISTA'].AsInteger := DS.FieldByName('FACTURAR_TRANSPORTISTA').AsInteger;
                       Q.Params.ByName['FACTURAR_REFERENCIA'].AsInteger := DS.FieldByName('FACTURAR_REFERENCIA').AsInteger;
                       Q.Params.ByName['FACTURA_DIRECCION_ADMTVA'].AsInteger := DS.FieldByName('FACTURA_DIRECCION_ADMTVA').AsInteger;
                       Q.Params.ByName['ALBARAN_DIRECCION_ENVIO'].AsInteger := DS.FieldByName('ALBARAN_DIRECCION_ENVIO').AsInteger;
                       Q.Params.ByName['POR_FINANCIACION'].AsFloat := DS.FieldByName('POR_FINANCIACION').AsFloat;
                       Q.Params.ByName['NO_ALB_FAC'].AsInteger := DS.FieldByName('NO_ALB_FAC').AsInteger;
                       Q.Params.ByName['NO_VENTA_RIESGO'].AsInteger := DS.FieldByName('NO_VENTA_RIESGO').AsInteger;
                       Q.Params.ByName['FACTURAR_SERIE'].AsInteger := DS.FieldByName('FACTURAR_SERIE').AsInteger;
                       Q.Params.ByName['SERIE_A_FACTURAR'].AsString := DS.FieldByName('SERIE_A_FACTURAR').AsString;
                       Q.Params.ByName['SU_REFERENCIA'].AsString := DS.FieldByName('SU_REFERENCIA').AsString;
                       Q.Params.ByName['FACTURAR_ALMACEN'].AsInteger := DS.FieldByName('FACTURAR_ALMACEN').AsInteger;
                       Q.Params.ByName['NRO_EMPLEADOS'].AsInteger := DS.FieldByName('FACTURACION_TOTAL').AsInteger;
                       Q.Params.ByName['FACTURACION_TOTAL'].AsFloat := DS.FieldByName('FACTURACION_TOTAL').AsFloat;
                       Q.Params.ByName['CONSUMO_MATERIAL'].AsFloat := DS.FieldByName('CONSUMO_MATERIAL').AsFloat;
                       Q.Params.ByName['PROVEEDORES_HABITUALES'].AsString := DS.FieldByName('PROVEEDORES_HABITUALES').AsString;
                       Q.Params.ByName['RUTA'].AsInteger := DS.FieldByName('RUTA').AsInteger;
                       Q.Params.ByName['CLIENTE_POTENCIAL'].AsInteger := DS.FieldByName('CLIENTE_POTENCIAL').AsInteger;
                       Q.Params.ByName['CREDITO_Y_CAUCION'].AsInteger := DS.FieldByName('CREDITO_Y_CAUCION').AsInteger;
                       Q.Params.ByName['MOROSO'].AsInteger := DS.FieldByName('MOROSO').AsInteger;
                       Q.Params.ByName['TIPO_CLIENTE'].AsString := DS.FieldByName('TIPO_CLIENTE').AsString;
                       Q.Params.ByName['FACTURAR_TARIFA'].AsInteger := DS.FieldByName('FACTURAR_TARIFA').AsInteger;
                       Q.Params.ByName['NO_CALC_DESC_KRI'].AsInteger := DS.FieldByName('NO_CALC_DESC_KRI').AsInteger;
                       Q.Params.ByName['NO_AGRUPAR_PED_KRI'].AsInteger := DS.FieldByName('NO_AGRUPAR_PED_KRI').AsInteger;
                       Q.Params.ByName['POTENCIAL_DE_COMPRA'].AsFloat := DS.FieldByName('POTENCIAL_DE_COMPRA').AsFloat;
                       Q.Params.ByName['NOTAS_FACTURACION_KRI'].AsString := DS.FieldByName('NOTAS_FACTURACION_KRI').AsString;
                       Q.Params.ByName['RIESGO_FACTOR'].AsFloat := DS.FieldByName('RIESGO_FACTOR').AsFloat;
                       Q.Params.ByName['INTRA'].AsInteger := DS.FieldByName('INTRA').AsInteger;
                       Q.Params.ByName['INTRA_TRANS'].AsInteger := DS.FieldByName('INTRA_TRANS').AsInteger;
                       Q.Params.ByName['PAIS_C2'].AsString := DS.FieldByName('PAIS_C2').AsString;
                       Q.Params.ByName['DIAS_ENTREGA'].AsInteger := DS.FieldByName('DIAS_ENTREGA').AsInteger;
                       Q.Params.ByName['IDIOMA'].AsString := DS.FieldByName('IDIOMA').AsString;
                       Q.Params.ByName['APLICAR_PTO_VERDE'].AsInteger := DS.FieldByName('APLICAR_PTO_VERDE').AsInteger;
                       Q.Params.ByName['FACTURAS_POR_EMAIL_KRI'].AsInteger := DS.FieldByName('FACTURAS_POR_EMAIL_KRI').AsInteger;
                       Q.Params.ByName['FRECUENCIA'].AsInteger := DS.FieldByName('FRECUENCIA').AsInteger;
                       Q.Params.ByName['ULT_MODIFICACION'].AsDateTime := DS.FieldByName('ULT_MODIFICACION').AsDateTime;
                       Q.Params.ByName['ID_CLIENTE'].AsInteger := DS.FieldByName('ID_CLIENTE').AsInteger;
                       Q.Params.ByName['ZONA'].AsString := DS.FieldByName('ZONA').AsString;
                       Q.Params.ByName['PROTOCOLO'].AsString := DS.FieldByName('PROTOCOLO').AsString;
                       Q.Params.ByName['BLOQUEO'].AsInteger := DS.FieldByName('BLOQUEO').AsInteger;
                       Q.Params.ByName['MOTIVO_BLOQUEO'].AsString := DS.FieldByName('MOTIVO_BLOQUEO').AsString;
                       Q.Params.ByName['CODIGO_INCOTERM'].AsString := 'EXW';
                       Q.Params.ByName['DIR_DEFECTO_VENTAS'].AsInteger := DS.FieldByName('DIR_DEFECTO_VENTAS').AsInteger;
                       Q.Params.ByName['DIRECCION_DEFECTO'].AsInteger := DS.FieldByName('DIRECCION_DEFECTO').AsInteger;
                       Q.Params.ByName['FECHA_ENTREGA_X_STOCK'].AsInteger := DS.FieldByName('FECHA_ENTREGA_X_STOCK').AsInteger;
                       Q.Params.ByName['SIN_DESCUENTOS'].AsInteger := DS.FieldByName('SIN_DESCUENTOS').AsInteger;
                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg(' UPD SYS_TERCEROS ' + #13#10 + e.Message, mtError, [mbOK], 0);
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
                       DataBase := Base_Destino;
                       SQL.Text :=
                          'INSERT INTO EMP_CLIENTES ' +
                          '(EMPRESA,CLIENTE,TERCERO,TARIFA, RIESGO_AUT, RIESGO_ACT, DIA_PAGO_1, DIA_PAGO_2,DESCUENTO_PP, AGENTE, NOTAS, RIESGO_FAC, RIESGO_ALB, RIESGO_CAR,  ' +
                          'RIESGO_REM, TIPO, PORTES, DESCUENTO_CIAL, USAR_ANTICIPOS, SU_PROVEEDOR,EVAL_FEB, EVAL_FEB_SI, TRANSPORTISTA, FINANCIACION, FACTURAR_DIRECCION,' +
                          'FACTURAR_AGENTE, FACTURAR_TRANSPORTISTA, FACTURAR_REFERENCIA,FACTURA_DIRECCION_ADMTVA, ALBARAN_DIRECCION_ENVIO, POR_FINANCIACION, ' +
                          'NO_ALB_FAC, NO_VENTA_RIESGO, FACTURAR_SERIE, SERIE_A_FACTURAR,SU_REFERENCIA, FACTURAR_ALMACEN, NRO_EMPLEADOS, FACTURACION_TOTAL,' +
                          'CONSUMO_MATERIAL, PROVEEDORES_HABITUALES, RUTA, CLIENTE_POTENCIAL,CREDITO_Y_CAUCION, MOROSO,TIPO_CLIENTE, FACTURAR_TARIFA, NO_CALC_DESC_KRI, NO_AGRUPAR_PED_KRI, ' +
                          'POTENCIAL_DE_COMPRA, NOTAS_FACTURACION_KRI, RIESGO_FACTOR, INTRA,INTRA_TRANS, PAIS_C2, DIAS_ENTREGA, IDIOMA, APLICAR_PTO_VERDE,' +
                          'FACTURAS_POR_EMAIL_KRI, FRECUENCIA, ULT_MODIFICACION, ID_CLIENTE, ZONA, PROTOCOLO,BLOQUEO, MOTIVO_BLOQUEO, CODIGO_INCOTERM, DIR_DEFECTO_VENTAS, DIRECCION_DEFECTO,' +
                          'FECHA_ENTREGA_X_STOCK, SIN_DESCUENTOS) ' +
                          'VALUES ' +
                          '(?EMPRESA,?CLIENTE,?TERCERO,?TARIFA, ?RIESGO_AUT, ?RIESGO_ACT, ?DIA_PAGO_1, ?DIA_PAGO_2,?DESCUENTO_PP, ?AGENTE, ?NOTAS, ?RIESGO_FAC, ?RIESGO_ALB, ?RIESGO_CAR,  ' +
                          '?RIESGO_REM, ?TIPO, ?PORTES, ?DESCUENTO_CIAL, ?USAR_ANTICIPOS, ?SU_PROVEEDOR,?EVAL_FEB, ?EVAL_FEB_SI, ?TRANSPORTISTA, ?FINANCIACION, ?FACTURAR_DIRECCION,' +
                          '?FACTURAR_AGENTE, ?FACTURAR_TRANSPORTISTA, ?FACTURAR_REFERENCIA,?FACTURA_DIRECCION_ADMTVA, ?ALBARAN_DIRECCION_ENVIO, ?POR_FINANCIACION, ' +
                          '?NO_ALB_FAC, ?NO_VENTA_RIESGO, ?FACTURAR_SERIE, ?SERIE_A_FACTURAR,?SU_REFERENCIA, ?FACTURAR_ALMACEN, ?NRO_EMPLEADOS, ?FACTURACION_TOTAL,' +
                          '?CONSUMO_MATERIAL, ?PROVEEDORES_HABITUALES, ?RUTA, ?CLIENTE_POTENCIAL,?CREDITO_Y_CAUCION, ?MOROSO,?TIPO_CLIENTE, ?FACTURAR_TARIFA, ?NO_CALC_DESC_KRI, ?NO_AGRUPAR_PED_KRI, ' +
                          '?POTENCIAL_DE_COMPRA, ?NOTAS_FACTURACION_KRI, ?RIESGO_FACTOR, ?INTRA,?INTRA_TRANS, ?PAIS_C2, ?DIAS_ENTREGA, ?IDIOMA, ?APLICAR_PTO_VERDE,' +
                          '?FACTURAS_POR_EMAIL_KRI, ?FRECUENCIA, ?ULT_MODIFICACION, ?ID_CLIENTE, ?ZONA, ?PROTOCOLO,?BLOQUEO, ?MOTIVO_BLOQUEO, ?CODIGO_INCOTERM, ?DIR_DEFECTO_VENTAS, ?DIRECCION_DEFECTO,' +
                          '?FECHA_ENTREGA_X_STOCK, ?SIN_DESCUENTOS) ';
                       Q.Params.ByName['EMPRESA'].AsInteger := DS.FieldByName('EMPRESA').AsInteger;
                       Q.Params.ByName['CLIENTE'].AsInteger := DS.FieldByName('CLIENTE').AsInteger;
                       Q.Params.ByName['TERCERO'].AsInteger := DS.FieldByName('TERCERO').AsInteger;
                       Q.Params.ByName['TARIFA'].AsString := DS.FieldByName('TARIFA').AsString;
                       Q.Params.ByName['RIESGO_AUT'].AsFloat := DS.FieldByName('RIESGO_AUT').AsFloat;
                       Q.Params.ByName['RIESGO_ACT'].AsFloat := DS.FieldByName('RIESGO_ACT').AsFloat;
                       Q.Params.ByName['DIA_PAGO_1'].AsInteger := DS.FieldByName('DIA_PAGO_1').AsInteger;
                       Q.Params.ByName['DIA_PAGO_2'].AsInteger := DS.FieldByName('DIA_PAGO_2').AsInteger;
                       Q.Params.ByName['DESCUENTO_PP'].AsFloat := DS.FieldByName('DESCUENTO_PP').AsFloat;
                       Q.Params.ByName['AGENTE'].AsInteger := DS.FieldByName('AGENTE').AsInteger;
                       Q.Params.ByName['NOTAS'].AsString := DS.FieldByName('NOTAS').AsString;
                       Q.Params.ByName['RIESGO_FAC'].AsFloat := DS.FieldByName('RIESGO_FAC').AsFloat;
                       Q.Params.ByName['RIESGO_ALB'].AsFloat := DS.FieldByName('RIESGO_ALB').AsFloat;
                       Q.Params.ByName['RIESGO_CAR'].AsFloat := DS.FieldByName('RIESGO_CAR').AsFloat;
                       Q.Params.ByName['RIESGO_REM'].AsFloat := DS.FieldByName('RIESGO_REM').AsFloat;
                       Q.Params.ByName['TIPO'].AsInteger := DS.FieldByName('TIPO').AsInteger;
                       Q.Params.ByName['PORTES'].AsInteger := DS.FieldByName('PORTES').AsInteger;
                       Q.Params.ByName['DESCUENTO_CIAL'].AsFloat := DS.FieldByName('DESCUENTO_CIAL').AsFloat;
                       Q.Params.ByName['USAR_ANTICIPOS'].AsInteger := DS.FieldByName('USAR_ANTICIPOS').AsInteger;
                       Q.Params.ByName['SU_PROVEEDOR'].AsString := DS.FieldByName('SU_PROVEEDOR').AsString;
                       Q.Params.ByName['EVAL_FEB'].AsInteger := DS.FieldByName('EVAL_FEB').AsInteger;
                       Q.Params.ByName['EVAL_FEB_SI'].AsInteger := DS.FieldByName('EVAL_FEB_SI').AsInteger;
                       Q.Params.ByName['TRANSPORTISTA'].AsInteger := DS.FieldByName('TRANSPORTISTA').AsInteger;
                       Q.Params.ByName['FINANCIACION'].AsInteger := DS.FieldByName('FINANCIACION').AsInteger;
                       Q.Params.ByName['FACTURAR_DIRECCION'].AsInteger := DS.FieldByName('FACTURAR_DIRECCION').AsInteger;
                       Q.Params.ByName['FACTURAR_AGENTE'].AsInteger := DS.FieldByName('FACTURAR_AGENTE').AsInteger;
                       Q.Params.ByName['FACTURAR_TRANSPORTISTA'].AsInteger := DS.FieldByName('FACTURAR_TRANSPORTISTA').AsInteger;
                       Q.Params.ByName['FACTURAR_REFERENCIA'].AsInteger := DS.FieldByName('FACTURAR_REFERENCIA').AsInteger;
                       Q.Params.ByName['FACTURA_DIRECCION_ADMTVA'].AsInteger := DS.FieldByName('FACTURA_DIRECCION_ADMTVA').AsInteger;
                       Q.Params.ByName['ALBARAN_DIRECCION_ENVIO'].AsInteger := DS.FieldByName('ALBARAN_DIRECCION_ENVIO').AsInteger;
                       Q.Params.ByName['POR_FINANCIACION'].AsFloat := DS.FieldByName('POR_FINANCIACION').AsFloat;
                       Q.Params.ByName['NO_ALB_FAC'].AsInteger := DS.FieldByName('NO_ALB_FAC').AsInteger;
                       Q.Params.ByName['NO_VENTA_RIESGO'].AsInteger := DS.FieldByName('NO_VENTA_RIESGO').AsInteger;
                       Q.Params.ByName['FACTURAR_SERIE'].AsInteger := DS.FieldByName('FACTURAR_SERIE').AsInteger;
                       Q.Params.ByName['SERIE_A_FACTURAR'].AsString := DS.FieldByName('SERIE_A_FACTURAR').AsString;
                       Q.Params.ByName['SU_REFERENCIA'].AsString := DS.FieldByName('SU_REFERENCIA').AsString;
                       Q.Params.ByName['FACTURAR_ALMACEN'].AsInteger := DS.FieldByName('FACTURAR_ALMACEN').AsInteger;
                       Q.Params.ByName['NRO_EMPLEADOS'].AsInteger := DS.FieldByName('FACTURACION_TOTAL').AsInteger;
                       Q.Params.ByName['FACTURACION_TOTAL'].AsFloat := DS.FieldByName('FACTURACION_TOTAL').AsFloat;
                       Q.Params.ByName['CONSUMO_MATERIAL'].AsFloat := DS.FieldByName('CONSUMO_MATERIAL').AsFloat;
                       Q.Params.ByName['PROVEEDORES_HABITUALES'].AsString := DS.FieldByName('PROVEEDORES_HABITUALES').AsString;
                       Q.Params.ByName['RUTA'].AsInteger := DS.FieldByName('RUTA').AsInteger;
                       Q.Params.ByName['CLIENTE_POTENCIAL'].AsInteger := DS.FieldByName('CLIENTE_POTENCIAL').AsInteger;
                       Q.Params.ByName['CREDITO_Y_CAUCION'].AsInteger := DS.FieldByName('CREDITO_Y_CAUCION').AsInteger;
                       Q.Params.ByName['MOROSO'].AsInteger := DS.FieldByName('MOROSO').AsInteger;
                       Q.Params.ByName['TIPO_CLIENTE'].AsString := DS.FieldByName('TIPO_CLIENTE').AsString;
                       Q.Params.ByName['FACTURAR_TARIFA'].AsInteger := DS.FieldByName('FACTURAR_TARIFA').AsInteger;
                       Q.Params.ByName['NO_CALC_DESC_KRI'].AsInteger := DS.FieldByName('NO_CALC_DESC_KRI').AsInteger;
                       Q.Params.ByName['NO_AGRUPAR_PED_KRI'].AsInteger := DS.FieldByName('NO_AGRUPAR_PED_KRI').AsInteger;
                       Q.Params.ByName['POTENCIAL_DE_COMPRA'].AsFloat := DS.FieldByName('POTENCIAL_DE_COMPRA').AsFloat;
                       Q.Params.ByName['NOTAS_FACTURACION_KRI'].AsString := DS.FieldByName('NOTAS_FACTURACION_KRI').AsString;
                       Q.Params.ByName['RIESGO_FACTOR'].AsFloat := DS.FieldByName('RIESGO_FACTOR').AsFloat;
                       Q.Params.ByName['INTRA'].AsInteger := DS.FieldByName('INTRA').AsInteger;
                       Q.Params.ByName['INTRA_TRANS'].AsInteger := DS.FieldByName('INTRA_TRANS').AsInteger;
                       Q.Params.ByName['PAIS_C2'].AsString := DS.FieldByName('PAIS_C2').AsString;
                       Q.Params.ByName['DIAS_ENTREGA'].AsInteger := DS.FieldByName('DIAS_ENTREGA').AsInteger;
                       Q.Params.ByName['IDIOMA'].AsString := DS.FieldByName('IDIOMA').AsString;
                       Q.Params.ByName['APLICAR_PTO_VERDE'].AsInteger := DS.FieldByName('APLICAR_PTO_VERDE').AsInteger;
                       Q.Params.ByName['FACTURAS_POR_EMAIL_KRI'].AsInteger := DS.FieldByName('FACTURAS_POR_EMAIL_KRI').AsInteger;
                       Q.Params.ByName['FRECUENCIA'].AsInteger := DS.FieldByName('FRECUENCIA').AsInteger;
                       Q.Params.ByName['ULT_MODIFICACION'].AsDateTime := DS.FieldByName('ULT_MODIFICACION').AsDateTime;
                       Q.Params.ByName['ID_CLIENTE'].AsInteger := DS.FieldByName('ID_CLIENTE').AsInteger;
                       Q.Params.ByName['ZONA'].AsString := DS.FieldByName('ZONA').AsString;
                       Q.Params.ByName['PROTOCOLO'].AsString := DS.FieldByName('PROTOCOLO').AsString;
                       Q.Params.ByName['BLOQUEO'].AsInteger := DS.FieldByName('BLOQUEO').AsInteger;
                       Q.Params.ByName['MOTIVO_BLOQUEO'].AsString := DS.FieldByName('MOTIVO_BLOQUEO').AsString;
                       Q.Params.ByName['CODIGO_INCOTERM'].AsString := 'EXW';
                       Q.Params.ByName['DIR_DEFECTO_VENTAS'].AsInteger := DS.FieldByName('DIR_DEFECTO_VENTAS').AsInteger;
                       Q.Params.ByName['DIRECCION_DEFECTO'].AsInteger := DS.FieldByName('DIRECCION_DEFECTO').AsInteger;
                       Q.Params.ByName['FECHA_ENTREGA_X_STOCK'].AsInteger := DS.FieldByName('FECHA_ENTREGA_X_STOCK').AsInteger;
                       Q.Params.ByName['SIN_DESCUENTOS'].AsInteger := DS.FieldByName('SIN_DESCUENTOS').AsInteger;
                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg(' INS SYS_TERCEROS ' + #13#10 + e.Message, mtError, [mbOK], 0);
                       end;
                       FreeHandle;
                    end;
                    FreeAndNil(Q);
                 end;
                 DS.Next;
              end; {while not eof}
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;
  end;
end;

procedure TDMSincronizacionIncidencias.SincronizaCon_cuentas_ges_cli(BaseOrigen, Base_Destino: THYDatabase);
var
  Q : THYFIBQuery;
  DS : TFIBDataSet;
  Tercero : integer;
begin
  if (not hayerror) then
  begin
     MuestraProgreso('Cuentas de Cliente', '', BaseOrigen, Base_Destino);

     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := TFIBTransaction.Create(nil);
           try
              with Transaction do
              begin
                 DefaultDatabase := BaseOrigen;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
              end;
              Close;
              DataBase := BaseOrigen;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add('SELECT * FROM CON_CUENTAS_GES_CLI WHERE EMPRESA = ?EMPRESA AND EJERCICIO >= 2010 AND CANAL = ?CANAL AND ULT_MODIFICACION >= ?ULT_MODIFICACION ORDER BY EJERCICIO, CLIENTE');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              //Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['ULT_MODIFICACION'].AsDateTime := UltimaSincronizacion;
              Open;
              while not DS.EOF do
              begin
                 if DS.FieldByName('TERCERO').AsString = '' then
                    tercero := 0
                 else
                    tercero := DS.FieldByName('TERCERO').AsInteger;
                 MuestraProgreso('Cuentas de Cliente', DS.FieldByName('CLIENTE').AsString + ' ' + DS.FieldByName('CUENTA').AsString, BaseOrigen, Base_Destino);
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := Base_Destino;
                    SQL.Text := 'SELECT COUNT(*) FROM CON_CUENTAS_GES_CLI WHERE EMPRESA = ?EMPRESA AND EJERCICIO = ?EJERCICIO AND CANAL = ?CANAL AND CLIENTE = ?CLIENTE ';
                    Params.ByName['EMPRESA'].AsInteger := DS.FieldByName('EMPRESA').AsInteger;
                    Params.ByName['EJERCICIO'].AsInteger := DS.FieldByName('EJERCICIO').AsInteger;
                    Params.ByName['CANAL'].AsInteger := DS.FieldByName('CANAL').AsInteger;
                    Params.ByName['CLIENTE'].AsInteger := DS.FieldByName('CLIENTE').AsInteger;
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
                       DataBase := Base_Destino;
                       SQL.Text :=
                          'UPDATE  CON_CUENTAS_GES_CLI SET ' +
                          'CUENTA           = ?CUENTA, ' +
                          'PERFIL           = ?PERFIL, ' +
                          'TIPO_IRPF        = ?TIPO_IRPF, ' +
                          'PAIS             = ?PAIS, ' +
                          'MODO_IVA         = ?MODO_IVA, ' +
                          'FORMA_PAGO       = ?FORMA_PAGO, ' +
                          'MONEDA           = ?MONEDA, ' +
                          'TERCERO          = ?TERCERO, ' +
                          'NOMBRE_R_SOCIAL  = ?NOMBRE_R_SOCIAL, ' +
                          'NOMBRE_COMERCIAL = ?NOMBRE_COMERCIAL, ' +
                          'CUENTA_DTOPP     = ?CUENTA_DTOPP, ' +
                          'ULT_MODIFICACION = ?ULT_MODIFICACION, ' +
                          'TIPO_PORTES      = ?TIPO_PORTES, ' +
                          'POR_PORTES       = ?POR_PORTES, ' +
                          'I_PORTES         = ?I_PORTES, ' +
                          'RANGO            = ?RANGO, ' +
                          'INDICE           = ?INDICE, ' +
                          'CUENTA_PGC       = ?CUENTA_PGC, ' +
                          'CUENTA_DTOPP_PGC = ?CUENTA_DTOPP_PGC ' +
                          'WHERE ' +
                          'EMPRESA = ?EMPRESA AND EJERCICIO = ?EJERCICIO AND CANAL = ?CANAL AND CLIENTE = ?CLIENTE';
                       Q.Params.ByName['CLIENTE'].AsInteger := DS.FieldByName('CLIENTE').AsInteger;
                       Q.Params.ByName['CUENTA'].AsString := DS.FieldByName('CUENTA').AsString;
                       Q.Params.ByName['PERFIL'].AsString := DS.FieldByName('PERFIL').AsString;
                       Q.Params.ByName['TIPO_IRPF'].AsInteger := DS.FieldByName('TIPO_IRPF').AsInteger;
                       Q.Params.ByName['PAIS'].AsString := DS.FieldByName('PAIS').AsString;
                       Q.Params.ByName['MODO_IVA'].AsInteger := DS.FieldByName('MODO_IVA').AsInteger;
                       Q.Params.ByName['FORMA_PAGO'].AsString := DS.FieldByName('FORMA_PAGO').AsString;
                       Q.Params.ByName['MONEDA'].AsString := DS.FieldByName('MONEDA').AsString;
                       Q.Params.ByName['TERCERO'].AsInteger := Tercero;
                       Q.Params.ByName['NOMBRE_R_SOCIAL'].AsString := DS.FieldByName('NOMBRE_R_SOCIAL').AsString;
                       Q.Params.ByName['NOMBRE_COMERCIAL'].AsString := DS.FieldByName('NOMBRE_COMERCIAL').AsString;
                       Q.Params.ByName['CUENTA_DTOPP'].AsString := DS.FieldByName('CUENTA_DTOPP').AsString;
                       Q.Params.ByName['ULT_MODIFICACION'].AsDateTime := DS.FieldByName('ULT_MODIFICACION').AsDateTime;
                       Q.Params.ByName['TIPO_PORTES'].AsInteger := DS.FieldByName('TIPO_PORTES').AsInteger;
                       Q.Params.ByName['POR_PORTES'].AsFloat := DS.FieldByName('POR_PORTES').AsFloat;
                       Q.Params.ByName['I_PORTES'].AsFloat := DS.FieldByName('I_PORTES').AsFloat;
                       Q.Params.ByName['RANGO'].AsInteger := DS.FieldByName('RANGO').AsInteger;
                       Q.Params.ByName['INDICE'].AsInteger := DS.FieldByName('INDICE').AsInteger;
                       Q.Params.ByName['CUENTA_PGC'].AsInteger := DS.FieldByName('CUENTA_PGC').AsInteger;
                       Q.Params.ByName['CUENTA_DTOPP_PGC'].AsInteger := DS.FieldByName('CUENTA_DTOPP_PGC').AsInteger;
                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg(' UPD CON_CUENTAS_GES_CLI ' + #13#10 + e.Message, mtError, [mbOK], 0);
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
                       DataBase := Base_Destino;
                       SQL.Text :=
                          'INSERT INTO CON_CUENTAS_GES_CLI ' +
                          '(EMPRESA , EJERCICIO, CANAL, CLIENTE, CUENTA, PERFIL, TIPO_IRPF, PAIS, MODO_IVA, INTERFIJO, FORMA_PAGO, MONEDA, TERCERO, NOMBRE_R_SOCIAL, NOMBRE_COMERCIAL, ' +
                          'CUENTA_DTOPP, TIPO_PORTES, POR_PORTES, I_PORTES, RANGO, INDICE, CUENTA_PGC, CUENTA_DTOPP_PGC)' +
                          'VALUES ' +
                          '(?EMPRESA , ?EJERCICIO, ?CANAL, ?CLIENTE, ?CUENTA, ?PERFIL, ?TIPO_IRPF, ?PAIS, ?MODO_IVA, ?INTERFIJO, ?FORMA_PAGO, ?MONEDA, ?TERCERO, ?NOMBRE_R_SOCIAL, ?NOMBRE_COMERCIAL, ' +
                          '?CUENTA_DTOPP, ?TIPO_PORTES, ?POR_PORTES, ?I_PORTES, ?RANGO, ?INDICE, ?CUENTA_PGC, ?CUENTA_DTOPP_PGC)';

                       Q.Params.ByName['EMPRESA'].AsInteger := DS.FieldByName('EMPRESA').AsInteger;
                       Q.Params.ByName['EJERCICIO'].AsInteger := DS.FieldByName('EJERCICIO').AsInteger;
                       Q.Params.ByName['CANAL'].AsInteger := DS.FieldByName('CANAL').AsInteger;
                       Q.Params.ByName['CLIENTE'].AsInteger := DS.FieldByName('CLIENTE').AsInteger;
                       Q.Params.ByName['CUENTA'].AsString := '430000000';
                       Q.Params.ByName['PERFIL'].AsString := DS.FieldByName('PERFIL').AsString;
                       Q.Params.ByName['TIPO_IRPF'].AsInteger := DS.FieldByName('TIPO_IRPF').AsInteger;
                       Q.Params.ByName['PAIS'].AsString := DS.FieldByName('PAIS').AsString;
                       Q.Params.ByName['MODO_IVA'].AsInteger := DS.FieldByName('MODO_IVA').AsInteger;
                       Q.Params.ByName['FORMA_PAGO'].AsString := 'CON';
                       Q.Params.ByName['MONEDA'].AsString := DS.FieldByName('MONEDA').AsString;
                       Q.Params.ByName['TERCERO'].AsInteger := Tercero;
                       Q.Params.ByName['NOMBRE_R_SOCIAL'].AsString := DS.FieldByName('NOMBRE_R_SOCIAL').AsString;
                       Q.Params.ByName['NOMBRE_COMERCIAL'].AsString := DS.FieldByName('NOMBRE_COMERCIAL').AsString;
                       Q.Params.ByName['CUENTA_DTOPP'].AsString := '706000000';
                       Q.Params.ByName['TIPO_PORTES'].AsInteger := DS.FieldByName('TIPO_PORTES').AsInteger;
                       Q.Params.ByName['POR_PORTES'].AsFloat := DS.FieldByName('POR_PORTES').AsFloat;
                       Q.Params.ByName['I_PORTES'].AsFloat := DS.FieldByName('I_PORTES').AsFloat;
                       Q.Params.ByName['RANGO'].AsInteger := DS.FieldByName('RANGO').AsInteger;
                       Q.Params.ByName['INDICE'].AsInteger := DS.FieldByName('INDICE').AsInteger;
                       Q.Params.ByName['CUENTA_PGC'].AsInteger := 0;
                       Q.Params.ByName['CUENTA_DTOPP_PGC'].AsInteger := 0;
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
                 DS.Next;
              end; {while not eof}
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;
  end;
end;

procedure TDMSincronizacionIncidencias.SincronozaTipo_Incidencias(BaseOrigen, Base_Destino: THYDatabase);
var
  Q : THYFIBQuery;
  DS : TFIBDataSet;
begin
  if (not hayerror) then
  begin
     MuestraProgreso('Tipos de Incidencia', '', BaseOrigen, Base_Destino);
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := TFIBTransaction.Create(nil);
           try
              with Transaction do
              begin
                 DefaultDatabase := BaseOrigen;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
              end;
              Close;
              DataBase := BaseOrigen;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add('SELECT * FROM SYS_TIPO_INCIDENCIA_KRI WHERE  ULT_MODIFICACION >= ?ULT_MODIFICACION ORDER BY TIPO');
              Params.ByName['ULT_MODIFICACION'].AsDateTime := UltimaSincronizacion;
              Open;
              while not DS.EOF do
              begin
                 MuestraProgreso('Tipos de Incidencia', DS.FieldByName('TIPO').AsString + ' ' + DS.FieldByName('TITULO').AsString, BaseOrigen, Base_Destino);
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := Base_Destino;
                    SQL.Text := 'SELECT COUNT(*) FROM SYS_TIPO_INCIDENCIA_KRI WHERE TIPO = ?TIPO';
                    Params.ByName['TIPO'].AsString := DS.FieldByName('TIPO').AsString;
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
                       DataBase := Base_Destino;
                       SQL.Text :=
                          'UPDATE SYS_TIPO_INCIDENCIA_KRI SET ' +
                          'TITULO = ?TITULO ' +
                          'WHERE ' +
                          'TIPO = ?TIPO   ';
                       Q.Params.ByName['TIPO'].AsString := DS.FieldByName('TIPO').AsString;
                       Q.Params.ByName['TITULO'].AsString := DS.FieldByName('TITULO').AsString;
                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg(' UPD SYS_TIPO_INCIDENCIA_KRI ' + #13#10 + e.Message, mtError, [mbOK], 0);
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
                       DataBase := Base_Destino;
                       SQL.Text :=
                          'INSERT INTO SYS_TIPO_INCIDENCIA_KRI ' +
                          '(TIPO, TITULO) ' +
                          'VALUES ' +
                          '(?TIPO, ?TITULO)';
                       Q.Params.ByName['TIPO'].AsString := DS.FieldByName('TIPO').AsString;
                       Q.Params.ByName['TITULO'].AsString := DS.FieldByName('TITULO').AsString;
                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg('INS SYS_TIPO_INCIDENCIA_KRI' + #13#10 + e.Message, mtError, [mbOK], 0);
                       end;
                       FreeHandle;
                    end;
                    FreeAndNil(Q);
                 end;
                 DS.Next;
              end; {while not eof}
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;
  end;
end;

procedure TDMSincronizacionIncidencias.SincronozaSys_Usuarios(BaseOrigen, Base_Destino: THYDatabase);
var
  Q : THYFIBQuery;
  DS : TFIBDataSet;
begin
  if (not hayerror) then
  begin
     FSendCorreo.Texto(Format(_('Sincronizando Usuarios con %s' + #13#10 + 'Ultima Sincronización: %s'), [BaseOrigen.DBFileName, DateTimeToStr(UltimaSincronizacion)]));
     MuestraProgreso('Usuarios', '', BaseOrigen, Base_Destino);

     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := TFIBTransaction.Create(nil);
           try
              with Transaction do
              begin
                 DefaultDatabase := BaseOrigen;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
              end;
              Close;
              DataBase := BaseOrigen;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add('SELECT * FROM SYS_USUARIOS WHERE ULT_MODIFICACION >= ?ULT_MODIFICACION ORDER BY USUARIO');
              Params.ByName['ULT_MODIFICACION'].AsDateTime := UltimaSincronizacion;
              Open;
              while not DS.EOF do
              begin
                 MuestraProgreso('Usuarios', DS.FieldByName('USUARIO').AsString + ' ' + DS.FieldByName('NOMBRE').AsString, BaseOrigen, Base_Destino);
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := Base_Destino;
                    SQL.Text := 'SELECT COUNT(*) FROM SYS_USUARIOS WHERE USUARIO = ?USUARIO';
                    Params.ByName['USUARIO'].AsInteger := DS.FieldByName('USUARIO').AsInteger;
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
                       DataBase := Base_Destino;
                       SQL.Text :=
                          'UPDATE SYS_USUARIOS SET ' +
                          'NOMBRE             = ?NOMBRE, ' +
                          'CLAVE              = ?CLAVE, ' +
                          'NIVEL              = ?NIVEL, ' +
                          'EMPRESA            = ?EMPRESA, ' +
                          'CANAL              = ?CANAL, ' +
                          'EJERCICIO          = ?EJERCICIO, ' +
                          'ICONOS_SIMPLES     = ?ICONOS_SIMPLES, ' +
                          'FECHA_TRABAJO      = ?FECHA_TRABAJO, ' +
                          'MEMORIZAR_FECHA    = ?MEMORIZAR_FECHA, ' +
                          'ACTIVO             = ?ACTIVO, ' +
                          'MENU_LEFT          = ?MENU_LEFT, ' +
                          'MENU_TOP           = ?MENU_TOP, ' +
                          'PERFIL             = ?PERFIL, ' +
                          'MODO_CIERRA_FORM   = ?MODO_CIERRA_FORM, ' +
                          'MODO_ENTER         = ?MODO_ENTER, ' +
                          'COLOR_NAV_ACTIVO   = ?COLOR_NAV_ACTIVO, ' +
                          'COLOR_NAV_INACTIVO = ?COLOR_NAV_INACTIVO, ' +
                          'COLOR_MENU_1_ON    = ?COLOR_MENU_1_ON, ' +
                          'COLOR_MENU_1_OFF   = ?COLOR_MENU_1_OFF, ' +
                          'COLOR_MENU_2_ON    = ?COLOR_MENU_2_ON, ' +
                          'COLOR_MENU_2_OFF   = ?COLOR_MENU_2_OFF, ' +
                          'NOMBRE_CORREO      = ?NOMBRE_CORREO, ' +
                          'DIR_CORREO         = ?DIR_CORREO, ' +
                          'COLOR_ENLACE_ACTIVO= ?COLOR_ENLACE_ACTIVO, ' +
                          'ALMACEN            = ?ALMACEN, ' +
                          'SERIE              = ?SERIE, ' +
                          'DELEGACION         = ?DELEGACION, ' +
                          'EDI_HABILIDADO     = ?EDI_HABILIDADO, ' +
                          'AGENTE             = ?AGENTE, ' +
                          'MODIFICA_DOC       = ?MODIFICA_DOC, ' +
                          'CONTABILIDAD_RESTRINGIDA = ?CONTABILIDAD_RESTRINGIDA, ' +
                          'ALBARAN_RESTRINGIDO = ?ALBARAN_RESTRINGIDO, ' +
                          'RESTRINGIR_IMPORTE_MAX_PEP = ?RESTRINGIR_IMPORTE_MAX_PEP, ' +
                          'CUENTA_NUNCA_CADUCA  = ?CUENTA_NUNCA_CADUCA, ' +
                          'CUENTA_DESHABILITADA = ?CUENTA_DESHABILITADA, ' +
                          'FECHA_CAMBIO_PASSW   = ?FECHA_CAMBIO_PASSW, ' +
                          'DIAS_CADUCIDAD       = ?DIAS_CADUCIDAD, ' +
                          'TACTIL               = ?TACTIL, ' +
                          'EMPLEADO             = ?EMPLEADO ' +
                          'WHERE ' +
                          'USUARIO = ?USUARIO ';
                       Q.Params.ByName['USUARIO'].AsInteger := DS.FieldByName('USUARIO').AsInteger;
                       Q.Params.ByName['NOMBRE'].AsString := DS.FieldByName('NOMBRE').AsString;
                       Q.Params.ByName['CLAVE'].AsString := DS.FieldByName('CLAVE').AsString;
                       Q.Params.ByName['NIVEL'].AsInteger := DS.FieldByName('NIVEL').AsInteger;
                       Q.Params.ByName['EMPRESA'].AsInteger := DS.FieldByName('EMPRESA').AsInteger;
                       Q.Params.ByName['CANAL'].AsInteger := DS.FieldByName('CANAL').AsInteger;
                       Q.Params.ByName['EJERCICIO'].AsInteger := DS.FieldByName('EJERCICIO').AsInteger;
                       Q.Params.ByName['ICONOS_SIMPLES'].AsInteger := DS.FieldByName('ICONOS_SIMPLES').AsInteger;
                       Q.Params.ByName['FECHA_TRABAJO'].AsDateTime := DS.FieldByName('FECHA_TRABAJO').AsDateTime;
                       Q.Params.ByName['MEMORIZAR_FECHA'].AsInteger := DS.FieldByName('MEMORIZAR_FECHA').AsInteger;
                       Q.Params.ByName['ACTIVO'].AsInteger := DS.FieldByName('ACTIVO').AsInteger;
                       Q.Params.ByName['MENU_LEFT'].AsInteger := DS.FieldByName('MENU_LEFT').AsInteger;
                       Q.Params.ByName['MENU_TOP'].AsInteger := DS.FieldByName('MENU_TOP').AsInteger;
                       Q.Params.ByName['PERFIL'].AsInteger := DS.FieldByName('PERFIL').AsInteger;
                       Q.Params.ByName['MODO_CIERRA_FORM'].AsInteger := DS.FieldByName('MODO_CIERRA_FORM').AsInteger;
                       Q.Params.ByName['MODO_ENTER'].AsInteger := DS.FieldByName('MODO_ENTER').AsInteger;
                       Q.Params.ByName['COLOR_NAV_ACTIVO'].AsFloat := DS.FieldByName('COLOR_NAV_ACTIVO').AsFloat;
                       Q.Params.ByName['COLOR_NAV_INACTIVO'].AsFloat := DS.FieldByName('COLOR_NAV_INACTIVO').AsFloat;
                       Q.Params.ByName['COLOR_MENU_1_ON'].AsFloat := DS.FieldByName('COLOR_MENU_1_ON').AsFloat;
                       Q.Params.ByName['COLOR_MENU_1_OFF'].AsFloat := DS.FieldByName('COLOR_MENU_1_OFF').AsFloat;
                       Q.Params.ByName['COLOR_MENU_2_ON'].AsFloat := DS.FieldByName('COLOR_MENU_2_ON').AsFloat;
                       Q.Params.ByName['COLOR_MENU_2_OFF'].AsFloat := DS.FieldByName('COLOR_MENU_2_OFF').AsFloat;
                       Q.Params.ByName['NOMBRE_CORREO'].AsString := DS.FieldByName('NOMBRE_CORREO').AsString;
                       Q.Params.ByName['DIR_CORREO'].AsString := DS.FieldByName('DIR_CORREO').AsString;
                       Q.Params.ByName['COLOR_ENLACE_ACTIVO'].AsFloat := DS.FieldByName('COLOR_ENLACE_ACTIVO').AsFloat;
                       Q.Params.ByName['ALMACEN'].AsString := DS.FieldByName('ALMACEN').AsString;
                       Q.Params.ByName['SERIE'].AsString := DS.FieldByName('SERIE').AsString;
                       Q.Params.ByName['DELEGACION'].AsInteger := DS.FieldByName('DELEGACION').AsInteger;
                       Q.Params.ByName['EDI_HABILIDADO'].AsInteger := DS.FieldByName('EDI_HABILIDADO').AsInteger;
                       Q.Params.ByName['AGENTE'].AsInteger := DS.FieldByName('AGENTE').AsInteger;
                       Q.Params.ByName['MODIFICA_DOC'].AsInteger := DS.FieldByName('MODIFICA_DOC').AsInteger;
                       Q.Params.ByName['CONTABILIDAD_RESTRINGIDA'].AsInteger := DS.FieldByName('CONTABILIDAD_RESTRINGIDA').AsInteger;
                       Q.Params.ByName['ALBARAN_RESTRINGIDO'].AsInteger := DS.FieldByName('ALBARAN_RESTRINGIDO').AsInteger;
                       Q.Params.ByName['RESTRINGIR_IMPORTE_MAX_PEP'].AsInteger := DS.FieldByName('RESTRINGIR_IMPORTE_MAX_PEP').AsInteger;
                       Q.Params.ByName['CUENTA_NUNCA_CADUCA'].AsInteger := DS.FieldByName('CUENTA_NUNCA_CADUCA').AsInteger;
                       Q.Params.ByName['CUENTA_DESHABILITADA'].AsInteger := DS.FieldByName('CUENTA_DESHABILITADA').AsInteger;
                       Q.Params.ByName['FECHA_CAMBIO_PASSW'].AsDateTime := DS.FieldByName('FECHA_CAMBIO_PASSW').AsDateTime;
                       Q.Params.ByName['DIAS_CADUCIDAD'].AsInteger := DS.FieldByName('DIAS_CADUCIDAD').AsInteger;
                       Q.Params.ByName['TACTIL'].AsInteger := DS.FieldByName('TACTIL').AsInteger;
                       Q.Params.ByName['EMPLEADO'].AsInteger := DS.FieldByName('EMPLEADO').AsInteger;
                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg(' UPD SYS_USUARIOS ' + #13#10 + e.Message, mtError, [mbOK], 0);
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
                       DataBase := Base_Destino;
                       SQL.Text :=
                          'INSERT INTO SYS_USUARIOS ' +
                          '(USUARIO,NOMBRE,CLAVE, NIVEL, EMPRESA, CANAL, EJERCICIO, ICONOS_SIMPLES, FECHA_TRABAJO, MEMORIZAR_FECHA, ACTIVO, MENU_LEFT, MENU_TOP, PERFIL, MODO_CIERRA_FORM, MODO_ENTER, ' +
                          'COLOR_NAV_ACTIVO, COLOR_NAV_INACTIVO, COLOR_MENU_1_ON, COLOR_MENU_1_OFF, COLOR_MENU_2_ON, COLOR_MENU_2_OFF, NOMBRE_CORREO, DIR_CORREO, COLOR_ENLACE_ACTIVO, ALMACEN, ' +
                          'SERIE, DELEGACION, EDI_HABILIDADO, AGENTE, MODIFICA_DOC, CONTABILIDAD_RESTRINGIDA, ALBARAN_RESTRINGIDO, RESTRINGIR_IMPORTE_MAX_PEP, CUENTA_NUNCA_CADUCA, CUENTA_DESHABILITADA,' +
                          'FECHA_CAMBIO_PASSW, DIAS_CADUCIDAD, TACTIL, EMPLEADO) ' +
                          'VALUES ' +
                          '(?USUARIO,?NOMBRE,?CLAVE, ?NIVEL, ?EMPRESA, ?CANAL, ?EJERCICIO, ?ICONOS_SIMPLES, ?FECHA_TRABAJO, ?MEMORIZAR_FECHA, ?ACTIVO, ?MENU_LEFT, ?MENU_TOP, ?PERFIL, ?MODO_CIERRA_FORM, ?MODO_ENTER, ' +
                          '?COLOR_NAV_ACTIVO, ?COLOR_NAV_INACTIVO, ?COLOR_MENU_1_ON, ?COLOR_MENU_1_OFF, ?COLOR_MENU_2_ON, ?COLOR_MENU_2_OFF, ?NOMBRE_CORREO, ?DIR_CORREO, ?COLOR_ENLACE_ACTIVO, ?ALMACEN, ' +
                          '?SERIE,?DELEGACION, ?EDI_HABILIDADO, ?AGENTE, ?MODIFICA_DOC, ?CONTABILIDAD_RESTRINGIDA, ?ALBARAN_RESTRINGIDO, ?RESTRINGIR_IMPORTE_MAX_PEP, ?CUENTA_NUNCA_CADUCA, ?CUENTA_DESHABILITADA,' +
                          '?FECHA_CAMBIO_PASSW, ?DIAS_CADUCIDAD, ?TACTIL, ?EMPLEADO)';
                       Q.Params.ByName['USUARIO'].AsInteger := DS.FieldByName('USUARIO').AsInteger;
                       Q.Params.ByName['NOMBRE'].AsString := DS.FieldByName('NOMBRE').AsString;
                       Q.Params.ByName['CLAVE'].AsString := DS.FieldByName('CLAVE').AsString;
                       Q.Params.ByName['NIVEL'].AsInteger := DS.FieldByName('NIVEL').AsInteger;
                       Q.Params.ByName['EMPRESA'].AsInteger := DS.FieldByName('EMPRESA').AsInteger;
                       Q.Params.ByName['CANAL'].AsInteger := DS.FieldByName('CANAL').AsInteger;
                       Q.Params.ByName['EJERCICIO'].AsInteger := DS.FieldByName('EJERCICIO').AsInteger;
                       Q.Params.ByName['ICONOS_SIMPLES'].AsInteger := DS.FieldByName('ICONOS_SIMPLES').AsInteger;
                       Q.Params.ByName['FECHA_TRABAJO'].AsDateTime := DS.FieldByName('FECHA_TRABAJO').AsDateTime;
                       Q.Params.ByName['MEMORIZAR_FECHA'].AsInteger := DS.FieldByName('MEMORIZAR_FECHA').AsInteger;
                       Q.Params.ByName['ACTIVO'].AsInteger := DS.FieldByName('ACTIVO').AsInteger;
                       Q.Params.ByName['MENU_LEFT'].AsInteger := DS.FieldByName('MENU_LEFT').AsInteger;
                       Q.Params.ByName['MENU_TOP'].AsInteger := DS.FieldByName('MENU_TOP').AsInteger;
                       Q.Params.ByName['PERFIL'].AsInteger := DS.FieldByName('PERFIL').AsInteger;
                       Q.Params.ByName['MODO_CIERRA_FORM'].AsInteger := DS.FieldByName('MODO_CIERRA_FORM').AsInteger;
                       Q.Params.ByName['MODO_ENTER'].AsInteger := DS.FieldByName('MODO_ENTER').AsInteger;
                       Q.Params.ByName['COLOR_NAV_ACTIVO'].AsFloat := DS.FieldByName('COLOR_NAV_ACTIVO').AsFloat;
                       Q.Params.ByName['COLOR_NAV_INACTIVO'].AsFloat := DS.FieldByName('COLOR_NAV_INACTIVO').AsFloat;
                       Q.Params.ByName['COLOR_MENU_1_ON'].AsFloat := DS.FieldByName('COLOR_MENU_1_ON').AsFloat;
                       Q.Params.ByName['COLOR_MENU_1_OFF'].AsFloat := DS.FieldByName('COLOR_MENU_1_OFF').AsFloat;
                       Q.Params.ByName['COLOR_MENU_2_ON'].AsFloat := DS.FieldByName('COLOR_MENU_2_ON').AsFloat;
                       Q.Params.ByName['COLOR_MENU_2_OFF'].AsFloat := DS.FieldByName('COLOR_MENU_2_OFF').AsFloat;
                       Q.Params.ByName['NOMBRE_CORREO'].AsString := DS.FieldByName('NOMBRE_CORREO').AsString;
                       Q.Params.ByName['DIR_CORREO'].AsString := DS.FieldByName('DIR_CORREO').AsString;
                       Q.Params.ByName['COLOR_ENLACE_ACTIVO'].AsFloat := DS.FieldByName('COLOR_ENLACE_ACTIVO').AsFloat;
                       Q.Params.ByName['ALMACEN'].AsString := DS.FieldByName('ALMACEN').AsString;
                       Q.Params.ByName['SERIE'].AsString := DS.FieldByName('SERIE').AsString;
                       Q.Params.ByName['DELEGACION'].AsInteger := DS.FieldByName('DELEGACION').AsInteger;
                       Q.Params.ByName['EDI_HABILIDADO'].AsInteger := DS.FieldByName('EDI_HABILIDADO').AsInteger;
                       Q.Params.ByName['AGENTE'].AsInteger := DS.FieldByName('AGENTE').AsInteger;
                       Q.Params.ByName['MODIFICA_DOC'].AsInteger := DS.FieldByName('MODIFICA_DOC').AsInteger;
                       Q.Params.ByName['CONTABILIDAD_RESTRINGIDA'].AsInteger := DS.FieldByName('CONTABILIDAD_RESTRINGIDA').AsInteger;
                       Q.Params.ByName['ALBARAN_RESTRINGIDO'].AsInteger := DS.FieldByName('ALBARAN_RESTRINGIDO').AsInteger;
                       Q.Params.ByName['RESTRINGIR_IMPORTE_MAX_PEP'].AsInteger := DS.FieldByName('RESTRINGIR_IMPORTE_MAX_PEP').AsInteger;
                       Q.Params.ByName['CUENTA_NUNCA_CADUCA'].AsInteger := DS.FieldByName('CUENTA_NUNCA_CADUCA').AsInteger;
                       Q.Params.ByName['CUENTA_DESHABILITADA'].AsInteger := DS.FieldByName('CUENTA_DESHABILITADA').AsInteger;
                       Q.Params.ByName['FECHA_CAMBIO_PASSW'].AsDateTime := DS.FieldByName('FECHA_CAMBIO_PASSW').AsDateTime;
                       Q.Params.ByName['DIAS_CADUCIDAD'].AsInteger := DS.FieldByName('DIAS_CADUCIDAD').AsInteger;
                       Q.Params.ByName['TACTIL'].AsInteger := DS.FieldByName('TACTIL').AsInteger;
                       Q.Params.ByName['EMPLEADO'].AsInteger := DS.FieldByName('EMPLEADO').AsInteger;

                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg('INS SYS_USUARIOS' + #13#10 + e.Message, mtError, [mbOK], 0);
                       end;
                       FreeHandle;
                    end;
                    FreeAndNil(Q);
                 end;
                 DS.Next;
              end; {while not eof}
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;
  end;
end;

procedure TDMSincronizacionIncidencias.SincronozaSys_Usuarios_perfiles(BaseOrigen, Base_Destino: THYDatabase);
var
  Q : THYFIBQuery;
  DS : TFIBDataSet;
begin
  if (not hayerror) then
  begin
     MuestraProgreso('Perfiles', '', BaseOrigen, Base_Destino);
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := TFIBTransaction.Create(nil);
           try
              with Transaction do
              begin
                 DefaultDatabase := BaseOrigen;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
              end;
              Close;
              DataBase := BaseOrigen;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add('SELECT * FROM SYS_USUARIOS_PERFIL WHERE ULT_MODIFICACION >= ?ULT_MODIFICACION ORDER BY PERFIL');
              Params.ByName['ULT_MODIFICACION'].AsDateTime := UltimaSincronizacion;
              Open;
              while not DS.EOF do
              begin
                 MuestraProgreso('Perfiles', DS.FieldByName('PERFIL').AsString + ' ' + DS.FieldByName('TITULO').AsString, BaseOrigen, Base_Destino);
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := Base_Destino;
                    SQL.Text := 'SELECT COUNT(*) FROM SYS_USUARIOS_PERFIL WHERE PERFIL = ?PERFIL';
                    Params.ByName['PERFIL'].AsInteger := DS.FieldByName('PERFIL').AsInteger;
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
                       DataBase := Base_Destino;
                       SQL.Text :=
                          'UPDATE SYS_USUARIOS_PERFIL SET ' +
                          'TITULO           = ?TITULO, ' +

                          'PROTECCION       = ?PROTECCION, ' +
                          'PERFIL_DE_AGENTE = ?PERFIL_DE_AGENTE, ' +
                          'AGENTE           = ?AGENTE, ' +
                          'SUPERIOR         = ?SUPERIOR, ' +
                          'CONTABILIDAD_ANALITICA = ?CONTABILIDAD_ANALITICA, ' +
                          'TACTIL           = ?TACTIL ' +
                          'WHERE PERFIL = ?PERFIL ';
                       Q.Params.ByName['PERFIL'].AsInteger := DS.FieldByName('PERFIL').AsInteger;
                       Q.Params.ByName['TITULO'].AsString := DS.FieldByName('TITULO').AsString;
                       Q.Params.ByName['PROTECCION'].AsString := DS.FieldByName('PROTECCION').AsString;
                       Q.Params.ByName['PERFIL_DE_AGENTE'].AsInteger := DS.FieldByName('PERFIL_DE_AGENTE').AsInteger;
                       Q.Params.ByName['AGENTE'].AsInteger := DS.FieldByName('AGENTE').AsInteger;
                       Q.Params.ByName['SUPERIOR'].AsInteger := DS.FieldByName('SUPERIOR').AsInteger;
                       Q.Params.ByName['CONTABILIDAD_ANALITICA'].AsInteger := DS.FieldByName('CONTABILIDAD_ANALITICA').AsInteger;
                       Q.Params.ByName['TACTIL'].AsInteger := DS.FieldByName('TACTIL').AsInteger;
                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg(' UPD SYS_USUARIOS_PERFIL ' + #13#10 + e.Message, mtError, [mbOK], 0);
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
                       DataBase := Base_Destino;
                       SQL.Text :=
                          'INSERT INTO SYS_USUARIOS_PERFIL ' +
                          '(PERFIL, TITULO, PROTECCION, PERFIL_DE_AGENTE, AGENTE, SUPERIOR, CONTABILIDAD_ANALITICA, TACTIL) ' +
                          'VALUES ' +
                          '(?PERFIL, ?TITULO, ?PROTECCION, ?PERFIL_DE_AGENTE, ?AGENTE , ?SUPERIOR, ?CONTABILIDAD_ANALITICA, ?TACTIL) ';

                       Q.Params.ByName['PERFIL'].AsInteger := DS.FieldByName('PERFIL').AsInteger;
                       Q.Params.ByName['TITULO'].AsString := DS.FieldByName('TITULO').AsString;
                       Q.Params.ByName['PROTECCION'].AsString := DS.FieldByName('PROTECCION').AsString;
                       Q.Params.ByName['PERFIL_DE_AGENTE'].AsInteger := DS.FieldByName('PERFIL_DE_AGENTE').AsInteger;
                       Q.Params.ByName['AGENTE'].AsInteger := DS.FieldByName('AGENTE').AsInteger;
                       Q.Params.ByName['SUPERIOR'].AsInteger := DS.FieldByName('SUPERIOR').AsInteger;
                       Q.Params.ByName['CONTABILIDAD_ANALITICA'].AsInteger := DS.FieldByName('CONTABILIDAD_ANALITICA').AsInteger;
                       Q.Params.ByName['TACTIL'].AsInteger := DS.FieldByName('TACTIL').AsInteger;
                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg('INS SYS_USUARIOS_PERFIL' + #13#10 + e.Message, mtError, [mbOK], 0);
                       end;
                       FreeHandle;
                    end;
                    FreeAndNil(Q);
                 end;
                 DS.Next;
              end; {while not eof}
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;
  end;
end;

procedure TDMSincronizacionIncidencias.InsertaContactosNuevos(BaseOrigen, Base_Destino: THYDatabase);
var
  Q : THYFIBQuery;
  DS : TFIBDataSet;
  Contacto{, Cliente} : integer;
begin
  if (not hayerror) then
  begin
     MuestraProgreso('Contactos', '', BaseOrigen, Base_Destino);
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           unidirectional := True;
           Transaction := TFIBTransaction.Create(nil);
           try
              with Transaction do
              begin
                 DefaultDatabase := BaseOrigen;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
              end;
              Close;
              DataBase := BaseOrigen;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add('SELECT * FROM SYS_TERCEROS_CONTACTOS WHERE ULT_MODIFICACION > ?ULT_MODIFICACION ORDER BY TERCERO, CONTACTO');
              Params.ByName['ULT_MODIFICACION'].AsDateTime := UltimaSincronizacion;
              Open;
              while not DS.EOF do
              begin
                 MuestraProgreso('Contactos', DS.FieldByName('CONTACTO').AsString + ' ' + DS.FieldByName('APELLIDOS').AsString + ' ' + DS.FieldByName('NOMBRE').AsString, BaseOrigen, Base_Destino);
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := Base_Destino;
                    SQL.Text :=
                       'SELECT COUNT(*) FROM SYS_TERCEROS_CONTACTOS WHERE TERCERO = ?TERCERO AND CONTACTO = ?CONTACTO AND ' +
                       'NOMBRE = ?NOMBRE AND APELLIDOS = ?APELLIDOS';
                    Params.ByName['TERCERO'].AsInteger := DS.FieldByName('TERCERO').AsInteger;
                    Params.ByName['CONTACTO'].AsInteger := DS.FieldByName('CONTACTO').AsInteger;
                    Params.ByName['NOMBRE'].AsString := DS.FieldByName('NOMBRE').AsString;
                    Params.ByName['APELLIDOS'].AsString := DS.FieldByName('APELLIDOS').AsString;

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
                       DataBase := Base_Destino;
                       SQL.Text :=
                          'UPDATE SYS_TERCEROS_CONTACTOS SET ' +
                          'MOVIL     = ?MOVIL,' +
                          'TELEFONO  = ?TELEFONO,' +
                          'FAX       = ?FAX,' +
                          'EXTENSION = ?EXTENSION,' +
                          'CORREO    = ?CORREO,' +
                          'NOTAS     = ?NOTAS,' +
                          'AGENTE    = ?AGENTE,' +
                          'ZONA      = ?ZONA,' +
                          'DIRECCION = ?DIRECCION,' +
                          'PADRE     = ?PADRE,' +
                          'DEPARTAMENTO = ?DEPARTAMENTO ' +
                          'WHERE TERCERO=?TERCERO AND CONTACTO=?CONTACTO';

                       Q.Params.ByName['TERCERO'].AsInteger := DS.FieldByName('TERCERO').AsInteger;
                       Q.Params.ByName['CONTACTO'].AsInteger := DS.FieldByName('CONTACTO').AsInteger;
                       Q.Params.ByName['MOVIL'].AsString := DS.FieldByName('MOVIL').AsString;
                       Q.Params.ByName['TELEFONO'].AsString := DS.FieldByName('TELEFONO').AsString;
                       Q.Params.ByName['FAX'].AsString := DS.FieldByName('FAX').AsString;
                       Q.Params.ByName['EXTENSION'].AsString := DS.FieldByName('EXTENSION').AsString;
                       Q.Params.ByName['CORREO'].AsString := DS.FieldByName('CORREO').AsString;
                       Q.Params.ByName['NOTAS'].AsString := DS.FieldByName('NOTAS').AsString;
                       Q.Params.ByName['AGENTE'].AsInteger := DS.FieldByName('AGENTE').AsInteger;
                       Q.Params.ByName['ZONA'].AsString := DS.FieldByName('ZONA').AsString;
                       Q.Params.ByName['DIRECCION'].AsInteger := DS.FieldByName('DIRECCION').AsInteger;
                       Q.Params.ByName['PADRE'].AsInteger := DS.FieldByName('PADRE').AsInteger;
                       Q.Params.ByName['DEPARTAMENTO'].AsString := DS.FieldByName('DEPARTAMENTO').AsString;
                       try
                          ExecQuery;

                       except
                          on e: Exception do
                             MessageDlg(' upd SYS_TERCEROS_CONTACTOS ' + #13#10 + e.Message, mtError, [mbOK], 0);
                       end;
                       FreeHandle;
                    end;
                    ContactosModificados := ContactosModificados + 1;
                 end
                 else
                 begin
                    {Genero ID Contacto}
                    Q := THYFIBQuery.Create(nil);
                    try
                       with Q do
                       begin
                          Close;
                          DataBase := Base_Destino;
                          SQL.Text := 'select max(contacto) from sys_terceros_contactos ' +
                             'where(tercero=?tercero)';
                          Params.ByName['tercero'].AsInteger := DS.FieldByName('TERCERO').AsInteger;
                          ExecQuery;
                          Contacto := FieldByName['max'].AsInteger;
                          FreeHandle;
                          {                     if ( Contacto is null ) then Contacto = 0 ;}
                          Contacto := Contacto + 1;
                       end;
                    finally
                       FreeAndNil(Q);
                    end;

                    Q := THYFIBQuery.Create(nil);
                    with Q do
                    begin
                       Close;
                       DataBase := Base_Destino;
                       SQL.Text :=
                          'INSERT INTO SYS_TERCEROS_CONTACTOS ' +
                          '(TERCERO ,CONTACTO, NOMBRE, APELLIDOS, MOVIL ,TELEFONO ,FAX ,EXTENSION ,CORREO ,NOTAS ,AGENTE ,ZONA ,DIRECCION ,PADRE ,DEPARTAMENTO )' +
                          'VALUES ' +
                          '(?TERCERO, ?CONTACTO, ?NOMBRE, ?APELLIDOS, ?MOVIL, ?TELEFONO, ?FAX, ?EXTENSION, ?CORREO, ?NOTAS, ?AGENTE, ?ZONA, ?DIRECCION, ?PADRE, ?DEPARTAMENTO ) ';

                       Q.Params.ByName['TERCERO'].AsInteger := DS.FieldByName('TERCERO').AsInteger;
                       Q.Params.ByName['CONTACTO'].AsInteger := Contacto;
                       Q.Params.ByName['NOMBRE'].AsString := DS.FieldByName('NOMBRE').AsString;
                       Q.Params.ByName['APELLIDOS'].AsString := DS.FieldByName('APELLIDOS').AsString;
                       Q.Params.ByName['MOVIL'].AsString := DS.FieldByName('MOVIL').AsString;
                       Q.Params.ByName['TELEFONO'].AsString := DS.FieldByName('TELEFONO').AsString;
                       Q.Params.ByName['FAX'].AsString := DS.FieldByName('FAX').AsString;
                       Q.Params.ByName['EXTENSION'].AsString := DS.FieldByName('EXTENSION').AsString;
                       Q.Params.ByName['CORREO'].AsString := DS.FieldByName('CORREO').AsString;
                       Q.Params.ByName['NOTAS'].AsString := DS.FieldByName('NOTAS').AsString;
                       Q.Params.ByName['AGENTE'].AsInteger := DS.FieldByName('AGENTE').AsInteger;
                       Q.Params.ByName['ZONA'].AsString := DS.FieldByName('ZONA').AsString;
                       Q.Params.ByName['DIRECCION'].AsInteger := DS.FieldByName('DIRECCION').AsInteger;
                       Q.Params.ByName['PADRE'].AsInteger := DS.FieldByName('PADRE').AsInteger;
                       Q.Params.ByName['DEPARTAMENTO'].AsString := DS.FieldByName('DEPARTAMENTO').AsString;
                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg(' INS SYS_TERCEROS_CONTACTOS ' + #13#10 + e.Message, mtError, [mbOK], 0);
                       end;
                       FreeHandle;
                    end;
                    FreeAndNil(Q);
                    {Asignamos Contacto a Incidencia}
                    Q := THYFIBQuery.Create(nil);
                    try
                       with Q do
                       begin
                          Close;
                          DataBase := BaseOrigen;
                          SQL.Text :=
                             'UPDATE EMP_INCIDENCIAS ' +
                             'SET CONTACTO = ?CONTACTO ' +
                             'WHERE EMPRESA = ?EMPRESA AND TIPO_TERCERO = ''CLI'' AND TERCERO=?TERCERO AND CONTACTO = ?CONTACTO_ANTERIOR';
                          Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                          Params.ByName['TERCERO'].AsInteger := DS.FieldByName('TERCERO').AsInteger;
                          Params.ByName['CONTACTO'].AsInteger := Contacto;
                          Params.ByName['CONTACTO_ANTERIOR'].AsInteger := DS.FieldByName('CONTACTO').AsInteger;
                          ExecQuery;
                          FreeHandle;
                       end;
                    finally
                       FreeAndNil(Q);
                    end;

                    Q := THYFIBQuery.Create(nil);
                    try
                       with Q do
                       begin
                          Close;
                          DataBase := BaseOrigen;
                          SQL.Text :=
                             'UPDATE EMP_INCIDENCIAS ' +
                             'SET CONTACTO2 = ?CONTACTO ' +
                             'WHERE EMPRESA = ?EMPRESA AND TIPO_TERCERO = ''CLI'' AND TERCERO=?TERCERO AND CONTACTO2 = ?CONTACTO_ANTERIOR';
                          Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                          Params.ByName['TERCERO'].AsInteger := DS.FieldByName('TERCERO').AsInteger;
                          Params.ByName['CONTACTO'].AsInteger := Contacto;
                          Params.ByName['CONTACTO_ANTERIOR'].AsInteger := DS.FieldByName('CONTACTO').AsInteger;
                          ExecQuery;
                          FreeHandle;
                       end;
                    finally
                       FreeAndNil(Q);
                    end;

                    Q := THYFIBQuery.Create(nil);
                    try
                       with Q do
                       begin
                          Close;
                          DataBase := BaseOrigen;
                          SQL.Text :=
                             'UPDATE EMP_INCIDENCIAS ' +
                             'SET CONTACTO3 = ?CONTACTO ' +
                             'WHERE EMPRESA = ?EMPRESA AND TIPO_TERCERO = ''CLI'' AND TERCERO=?TERCERO AND CONTACTO3 = ?CONTACTO_ANTERIOR';
                          Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                          Params.ByName['TERCERO'].AsInteger := DS.FieldByName('TERCERO').AsInteger;
                          Params.ByName['CONTACTO'].AsInteger := Contacto;
                          Params.ByName['CONTACTO_ANTERIOR'].AsInteger := DS.FieldByName('CONTACTO').AsInteger;
                          ExecQuery;
                          FreeHandle;
                       end;
                    finally
                       FreeAndNil(Q);
                    end;

                    ContactosNuevos := ContactosNuevos + 1;
                 end;{si no existe}
                 DS.Next;
              end; {while not eof}
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;
  end;
end;

{
procedure TDMSincronizacionIncidencias.SincronozaEmp_Incidencias(BaseOrigen, Base_Destino: THYDataBase);
var
  Q : THYFIBQuery;
  DS : TFIBDataSet;
  incidencia_sincronizacion : integer;
begin
  if (not hayerror) then
  begin
     MuestraProgreso('Incidencias', '', BaseOrigen, Base_Destino);
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := TFIBTransaction.Create(nil);
           try
              with Transaction do
              begin
                 DefaultDatabase := BaseOrigen;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
              end;
              Close;
              DataBase := BaseOrigen;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add('SELECT * FROM EMP_INCIDENCIAS WHERE EMPRESA = ?EMPRESA AND TIPO_TERCERO = ''CLI'' AND ULT_MODIFICACION >= ?ULT_MODIFICACION ORDER BY  COD_CLI_PRO, INCIDENCIA');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['ULT_MODIFICACION'].AsDateTime := UltimaSincronizacion;
              Open;
              while not DS.EOF do
              begin
                 MuestraProgreso('Incidencias', DS.FieldByName('TITULO').AsString, BaseOrigen, Base_Destino);
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := Base_Destino;
                    SQL.Text :=
                       'SELECT COUNT(*) FROM EMP_INCIDENCIAS WHERE EMPRESA = ?EMPRESA AND TIPO_TERCERO = ?TIPO_TERCERO AND COD_CLI_PRO = ?COD_CLI_PRO AND ' +
                       'INCIDENCIA = ?INCIDENCIA';
                    Params.ByName['EMPRESA'].AsInteger := DS.FieldByName('EMPRESA').AsInteger;
                    Params.ByName['TIPO_TERCERO'].AsString := 'CLI';
                    Params.ByName['COD_CLI_PRO'].AsInteger := DS.FieldByName('COD_CLI_PRO').AsInteger;
                    Params.ByName['INCIDENCIA'].AsInteger := DS.FieldByName('INCIDENCIA').AsInteger;
                    ExecQuery;
                    existe := FieldByName['COUNT'].AsInteger > 0;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
                 if not (existe) then
                 begin
                    Q := THYFIBQuery.Create(nil);
                    with Q do
                    begin
                       Close;
                       DataBase := Base_Destino;
                       SQL.Text :=
                          'INSERT INTO EMP_INCIDENCIAS ' +
                          '(EMPRESA, TIPO_TERCERO, COD_CLI_PRO, INCIDENCIA, TITULO, FECHA, FECHA_RECEPCION, TERCERO, DATOS_INCIDENCIA, FECHA_RESPUESTA,' +
                          ' RESPUESTA_INCIDENCIA, ID_S, ID_E, DOC_EJERCICIO, DOC_CANAL, DOC_SERIE, DOC_TIPO, DOC_RIG, ENTRADA, DIRECCION ,AGENTE ,CONTACTO ,CONTACTO2 ,CONTACTO3 ,TIPO_INCIDENCIA_KRI )' +
                          'VALUES ' +
                          '(?EMPRESA, ?TIPO_TERCERO, ?COD_CLI_PRO, ?INCIDENCIA, ?TITULO, ?FECHA, ?FECHA_RECEPCION, ?TERCERO, ?DATOS_INCIDENCIA, ?FECHA_RESPUESTA,' +
                          ' ?RESPUESTA_INCIDENCIA, ?ID_S, ?ID_E, ?DOC_EJERCICIO, ?DOC_CANAL, ?DOC_SERIE, ?DOC_TIPO, ?DOC_RIG, ?ENTRADA, ?DIRECCION ,?AGENTE ,?CONTACTO ,?CONTACTO2 ,?CONTACTO3 ,?TIPO_INCIDENCIA_KRI)';

                       Q.Params.ByName['EMPRESA'].AsInteger := DS.FieldByName('EMPRESA').AsInteger;
                       Q.Params.ByName['TIPO_TERCERO'].AsString := DS.FieldByName('TIPO_TERCERO').AsString;
                       Q.Params.ByName['COD_CLI_PRO'].AsInteger := DS.FieldByName('COD_CLI_PRO').AsInteger;
                       Q.Params.ByName['INCIDENCIA'].AsInteger := 0;  //Para que genere ID en base destino
                       Q.Params.ByName['TITULO'].AsString := DS.FieldByName('TITULO').AsString;
                       Q.Params.ByName['FECHA'].AsDateTime := DS.FieldByName('FECHA').AsDateTime;
                       Q.Params.ByName['FECHA_RECEPCION'].AsDateTime := DS.FieldByName('FECHA_RECEPCION').AsDateTime;
                       Q.Params.ByName['TERCERO'].AsInteger := DS.FieldByName('TERCERO').AsInteger;
                       Q.Params.ByName['DATOS_INCIDENCIA'].AsString := DS.FieldByName('DATOS_INCIDENCIA').AsString;
                       Q.Params.ByName['FECHA_RESPUESTA'].AsDateTime := DS.FieldByName('FECHA_RESPUESTA').AsDateTime;
                       Q.Params.ByName['RESPUESTA_INCIDENCIA'].AsString := DS.FieldByName('RESPUESTA_INCIDENCIA').AsString;
                       Q.Params.ByName['ID_S'].AsInteger := DS.FieldByName('ID_S').AsInteger;
                       Q.Params.ByName['ID_E'].AsInteger := DS.FieldByName('ID_E').AsInteger;
                       Q.Params.ByName['DOC_EJERCICIO'].AsInteger := DS.FieldByName('DOC_EJERCICIO').AsInteger;
                       Q.Params.ByName['DOC_SERIE'].AsString := DS.FieldByName('DOC_SERIE').AsString;
                       Q.Params.ByName['DOC_CANAL'].AsInteger := DS.FieldByName('DOC_CANAL').AsInteger;
                       Q.Params.ByName['DOC_TIPO'].AsString := DS.FieldByName('DOC_TIPO').AsString;
                       Q.Params.ByName['DOC_RIG'].AsInteger := DS.FieldByName('DOC_RIG').AsInteger;
                       Q.Params.ByName['ENTRADA'].AsInteger := DS.FieldByName('ENTRADA').AsInteger;
                       Q.Params.ByName['DIRECCION'].AsInteger := DS.FieldByName('DIRECCION').AsInteger;
                       Q.Params.ByName['AGENTE'].AsInteger := DS.FieldByName('AGENTE').AsInteger;
                       Q.Params.ByName['CONTACTO'].AsInteger := DS.FieldByName('CONTACTO').AsInteger;
                       Q.Params.ByName['CONTACTO2'].AsInteger := DS.FieldByName('CONTACTO2').AsInteger;
                       Q.Params.ByName['CONTACTO3'].AsInteger := DS.FieldByName('CONTACTO3').AsInteger;
                       Q.Params.ByName['TIPO_INCIDENCIA_KRI'].AsString := DS.FieldByName('TIPO_INCIDENCIA_KRI').AsString;
                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg(' INS EMP_INCIDENCIAS ' + #13#10 + e.Message, mtError, [mbOK], 0);
                       end;
                       FreeHandle;
                    end;
                    FreeAndNil(Q);
                    Incidencias := Incidencias + 1;
                    if DS.FieldByName('COD_CLI_PRO').AsInteger = -1 then
                       ClientesNuevos := ClientesNuevos + 1;
                 end;
                 DS.Next;
              end; //while not eof
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;
  end;
end;
}

procedure TDMSincronizacionIncidencias.SincronozaEmp_Incidencias(BaseOrigen, Base_Destino: THYDatabase);
var
  Q : THYFIBQuery;
  DS : TFIBDataSet;
  incidencia, incidencia_sincronizacion : integer;
begin
  /// Primero paso las que tengo y luego me traigo las nuevas

  // Envio las nuevas incidencias y las que haya modificado
  if (not hayerror) then
  begin
     MuestraProgreso('Incidencias', '', BaseOrigen, Base_Destino);
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := TFIBTransaction.Create(nil);
           try
              with Transaction do
              begin
                 DefaultDatabase := BaseOrigen;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
              end;
              Close;
              DataBase := BaseOrigen;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add('SELECT * FROM EMP_INCIDENCIAS WHERE EMPRESA = ?EMPRESA AND TIPO_TERCERO = ''CLI'' AND ULT_MODIFICACION >= ?ULT_MODIFICACION ORDER BY  COD_CLI_PRO, INCIDENCIA');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['ULT_MODIFICACION'].AsDateTime := UltimaSincronizacion;
              Open;
              while not DS.EOF do
              begin
                 MuestraProgreso('Incidencias', DS.FieldByName('TITULO').AsString, BaseOrigen, Base_Destino);

                 // Si incidencia_sincronizacion = 0 es una nueva incidencia
                 if (DS.FieldByName('INCIDENCIA_SINCRONIZACION').AsInteger = 0) then
                 begin
                    // Obtengo el numero de incidencia que voy a utilizar para insertar
                    incidencia_sincronizacion := DMMain.ContadorGen('CONTA_INCIDENCIAS');

                    // Inserto la incidencia
                    Q := THYFIBQuery.Create(nil);
                    with Q do
                    begin
                       Close;
                       DataBase := Base_Destino;
                       SQL.Text :=
                          'INSERT INTO EMP_INCIDENCIAS ' +
                          '(EMPRESA, TIPO_TERCERO, COD_CLI_PRO, INCIDENCIA, TITULO, FECHA, FECHA_RECEPCION, TERCERO, DATOS_INCIDENCIA, FECHA_RESPUESTA, ' +
                          ' RESPUESTA_INCIDENCIA, ID_S, ID_E, DOC_EJERCICIO, DOC_CANAL, DOC_SERIE, DOC_TIPO, DOC_RIG, ENTRADA, DIRECCION, AGENTE, CONTACTO, CONTACTO2, CONTACTO3, TIPO_INCIDENCIA_KRI, FINALIZADO )' +
                          'VALUES ' +
                          '(?EMPRESA, ?TIPO_TERCERO, ?COD_CLI_PRO, ?INCIDENCIA, ?TITULO, ?FECHA, ?FECHA_RECEPCION, ?TERCERO, ?DATOS_INCIDENCIA, ?FECHA_RESPUESTA, ' +
                          ' ?RESPUESTA_INCIDENCIA, ?ID_S, ?ID_E, ?DOC_EJERCICIO, ?DOC_CANAL, ?DOC_SERIE, ?DOC_TIPO, ?DOC_RIG, ?ENTRADA, ?DIRECCION, ?AGENTE, ?CONTACTO, ?CONTACTO2, ?CONTACTO3, ?TIPO_INCIDENCIA_KRI, ?FINALIZADO)';

                       Q.Params.ByName['EMPRESA'].AsInteger := DS.FieldByName('EMPRESA').AsInteger;
                       Q.Params.ByName['TIPO_TERCERO'].AsString := DS.FieldByName('TIPO_TERCERO').AsString;
                       Q.Params.ByName['COD_CLI_PRO'].AsInteger := DS.FieldByName('COD_CLI_PRO').AsInteger;
                       Q.Params.ByName['INCIDENCIA'].AsInteger := incidencia_sincronizacion;
                       Q.Params.ByName['TITULO'].AsString := DS.FieldByName('TITULO').AsString;
                       Q.Params.ByName['FECHA'].AsDateTime := DS.FieldByName('FECHA').AsDateTime;
                       Q.Params.ByName['FECHA_RECEPCION'].AsDateTime := DS.FieldByName('FECHA_RECEPCION').AsDateTime;
                       Q.Params.ByName['TERCERO'].AsInteger := DS.FieldByName('TERCERO').AsInteger;
                       Q.Params.ByName['DATOS_INCIDENCIA'].AsString := DS.FieldByName('DATOS_INCIDENCIA').AsString;
                       Q.Params.ByName['FECHA_RESPUESTA'].AsDateTime := DS.FieldByName('FECHA_RESPUESTA').AsDateTime;
                       Q.Params.ByName['RESPUESTA_INCIDENCIA'].AsString := DS.FieldByName('RESPUESTA_INCIDENCIA').AsString;
                       Q.Params.ByName['ID_S'].AsInteger := DS.FieldByName('ID_S').AsInteger;
                       Q.Params.ByName['ID_E'].AsInteger := DS.FieldByName('ID_E').AsInteger;
                       Q.Params.ByName['DOC_EJERCICIO'].AsInteger := DS.FieldByName('DOC_EJERCICIO').AsInteger;
                       Q.Params.ByName['DOC_SERIE'].AsString := DS.FieldByName('DOC_SERIE').AsString;
                       Q.Params.ByName['DOC_CANAL'].AsInteger := DS.FieldByName('DOC_CANAL').AsInteger;
                       Q.Params.ByName['DOC_TIPO'].AsString := DS.FieldByName('DOC_TIPO').AsString;
                       Q.Params.ByName['DOC_RIG'].AsInteger := DS.FieldByName('DOC_RIG').AsInteger;
                       Q.Params.ByName['ENTRADA'].AsInteger := 1;
                       Q.Params.ByName['DIRECCION'].AsInteger := DS.FieldByName('DIRECCION').AsInteger;
                       Q.Params.ByName['AGENTE'].AsInteger := DS.FieldByName('AGENTE').AsInteger;
                       Q.Params.ByName['CONTACTO'].AsInteger := DS.FieldByName('CONTACTO').AsInteger;
                       Q.Params.ByName['CONTACTO2'].AsInteger := DS.FieldByName('CONTACTO2').AsInteger;
                       Q.Params.ByName['CONTACTO3'].AsInteger := DS.FieldByName('CONTACTO3').AsInteger;
                       Q.Params.ByName['TIPO_INCIDENCIA_KRI'].AsString := DS.FieldByName('TIPO_INCIDENCIA_KRI').AsString;
                       Q.Params.ByName['FINALIZADO'].AsInteger := DS.FieldByName('FINALIZADO').AsInteger;
                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg(' INS EMP_INCIDENCIAS ' + #13#10 + e.Message, mtError, [mbOK], 0);
                       end;
                       FreeHandle;
                    end;
                    FreeAndNil(Q);

                    // Modifico el incidenica_sincronizacion y ult_modificacion = 01/01/1900 para marcarla como sincronizada
                    Q := THYFIBQuery.Create(nil);
                    with Q do
                    begin
                       Close;
                       DataBase := BaseOrigen;
                       SQL.Text := ' UPDATE EMP_INCIDENCIAS ' +
                          ' SET INCIDENCIA_SINCRONIZACION=?INCIDENCIA_SINCRONIZACION, ULT_MODIFICACION=''01/01/1900'' ' +
                          ' WHERE EMPRESA=?EMPRESA AND TIPO_TERCERO=?TIPO_TERCERO AND COD_CLI_PRO=?COD_CLI_PRO AND INCIDENCIA=?INCIDENCIA';
                       Q.Params.ByName['EMPRESA'].AsInteger := DS.FieldByName('EMPRESA').AsInteger;
                       Q.Params.ByName['TIPO_TERCERO'].AsString := DS.FieldByName('TIPO_TERCERO').AsString;
                       Q.Params.ByName['COD_CLI_PRO'].AsInteger := DS.FieldByName('COD_CLI_PRO').AsInteger;
                       Q.Params.ByName['INCIDENCIA'].AsInteger := DS.FieldByName('INCIDENCIA').AsInteger;
                       Q.Params.ByName['INCIDENCIA_SINCRONIZACION'].AsInteger := incidencia_sincronizacion;
                       ExecQuery;
                       Close;
                       FreeHandle;
                    end;
                    FreeAndNil(Q);

                    Incidencias := Incidencias + 1;
                 end
                 else // Si incidencia_sincronizacion <> 0 es que esta sincronizada y se ha modificado
                 begin
                    // Inserto la incidencia
                    Q := THYFIBQuery.Create(nil);
                    with Q do
                    begin
                       Close;
                       DataBase := Base_Destino;
                       SQL.Text :=
                          ' UPDATE EMP_INCIDENCIAS ' +
                          ' SET TITULO = ?TITULO, FECHA = ?FECHA, FECHA_RECEPCION = ?FECHA_RECEPCION, TERCERO = ?TERCERO, ' +
                          ' FECHA_RESPUESTA = ?FECHA_RESPUESTA, ID_S = ?ID_S, ID_E = ?ID_E, DOC_EJERCICIO = ?DOC_EJERCICIO, ' +
                          ' DOC_CANAL = ?DOC_CANAL, DOC_SERIE = ?DOC_SERIE, DOC_TIPO = ?DOC_TIPO, DOC_RIG = ?DOC_RIG, ' +
                          ' /*ENTRADA = ?ENTRADA,*/ DIRECCION = ?DIRECCION, AGENTE = ?AGENTE, CONTACTO = ?CONTACTO, ' +
                          ' TIPO_INCIDENCIA_KRI = ?TIPO_INCIDENCIA_KRI, ' +
                          ' DATOS_INCIDENCIA = ?DATOS_INCIDENCIA, RESPUESTA_INCIDENCIA = ?RESPUESTA_INCIDENCIA, ' +
                          ' HORAS = ?HORAS, FINALIZADO = ?FINALIZADO, CONTACTO2 = ?CONTACTO2, CONTACTO3 = ?CONTACTO3, ' +
                          ' ULT_MODIFICACION = ?ULT_MODIFICACION, FINALIZADO = ?FINALIZADO, COD_CLI_PRO = ?COD_CLI_PRO ' +
                          ' WHERE (EMPRESA = ?EMPRESA) AND (TIPO_TERCERO = ?TIPO_TERCERO) AND (INCIDENCIA = ?INCIDENCIA) ';

                       Q.Params.ByName['EMPRESA'].AsInteger := DS.FieldByName('EMPRESA').AsInteger;
                       Q.Params.ByName['TIPO_TERCERO'].AsString := DS.FieldByName('TIPO_TERCERO').AsString;
                       Q.Params.ByName['COD_CLI_PRO'].AsInteger := DS.FieldByName('COD_CLI_PRO').AsInteger;
                       Q.Params.ByName['INCIDENCIA'].AsInteger := DS.FieldByName('INCIDENCIA_SINCRONIZACION').AsInteger;
                       Q.Params.ByName['TITULO'].AsString := DS.FieldByName('TITULO').AsString;
                       Q.Params.ByName['FECHA'].AsDateTime := DS.FieldByName('FECHA').AsDateTime;
                       Q.Params.ByName['FECHA_RECEPCION'].AsDateTime := DS.FieldByName('FECHA_RECEPCION').AsDateTime;
                       Q.Params.ByName['TERCERO'].AsInteger := DS.FieldByName('TERCERO').AsInteger;
                       Q.Params.ByName['DATOS_INCIDENCIA'].AsString := DS.FieldByName('DATOS_INCIDENCIA').AsString;
                       Q.Params.ByName['FECHA_RESPUESTA'].AsDateTime := DS.FieldByName('FECHA_RESPUESTA').AsDateTime;
                       Q.Params.ByName['RESPUESTA_INCIDENCIA'].AsString := DS.FieldByName('RESPUESTA_INCIDENCIA').AsString;
                       Q.Params.ByName['ID_S'].AsInteger := DS.FieldByName('ID_S').AsInteger;
                       Q.Params.ByName['ID_E'].AsInteger := DS.FieldByName('ID_E').AsInteger;
                       Q.Params.ByName['DOC_EJERCICIO'].AsInteger := DS.FieldByName('DOC_EJERCICIO').AsInteger;
                       Q.Params.ByName['DOC_SERIE'].AsString := DS.FieldByName('DOC_SERIE').AsString;
                       Q.Params.ByName['DOC_CANAL'].AsInteger := DS.FieldByName('DOC_CANAL').AsInteger;
                       Q.Params.ByName['DOC_TIPO'].AsString := DS.FieldByName('DOC_TIPO').AsString;
                       Q.Params.ByName['DOC_RIG'].AsInteger := DS.FieldByName('DOC_RIG').AsInteger;
                       //Q.Params.ByName['ENTRADA'].AsInteger := 1;
                       Q.Params.ByName['DIRECCION'].AsInteger := DS.FieldByName('DIRECCION').AsInteger;
                       Q.Params.ByName['AGENTE'].AsInteger := DS.FieldByName('AGENTE').AsInteger;
                       Q.Params.ByName['CONTACTO'].AsInteger := DS.FieldByName('CONTACTO').AsInteger;
                       Q.Params.ByName['CONTACTO2'].AsInteger := DS.FieldByName('CONTACTO2').AsInteger;
                       Q.Params.ByName['CONTACTO3'].AsInteger := DS.FieldByName('CONTACTO3').AsInteger;
                       Q.Params.ByName['TIPO_INCIDENCIA_KRI'].AsString := DS.FieldByName('TIPO_INCIDENCIA_KRI').AsString;
                       Q.Params.ByName['ULT_MODIFICACION'].AsDateTime := DS.FieldByName('ULT_MODIFICACION').AsDateTime;
                       Q.Params.ByName['FINALIZADO'].AsInteger := DS.FieldByName('FINALIZADO').AsInteger;
                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg(' UPD EMP_INCIDENCIAS ' + #13#10 + e.Message, mtError, [mbOK], 0);
                       end;
                       FreeHandle;
                    end;
                    FreeAndNil(Q);
                 end;

                 if (DS.FieldByName('COD_CLI_PRO').AsInteger = -1) then
                    ClientesNuevos := ClientesNuevos + 1;

                 DS.Next;
              end; {while not eof}
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;
  end;

  // Ahora me traigo las de los demas
  if (not hayerror) then
  begin
     MuestraProgreso('Incidencias', '', BaseOrigen, Base_Destino);
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := TFIBTransaction.Create(nil);
           try
              with Transaction do
              begin
                 DefaultDatabase := Base_Destino;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
              end;
              Close;
              DataBase := Base_Destino;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add('SELECT * FROM EMP_INCIDENCIAS WHERE EMPRESA = ?EMPRESA AND TIPO_TERCERO = ''CLI'' AND ULT_MODIFICACION >= ?ULT_MODIFICACION ORDER BY  COD_CLI_PRO, INCIDENCIA');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['ULT_MODIFICACION'].AsDateTime := UltimaSincronizacion;
              Open;
              while not DS.EOF do
              begin
                 MuestraProgreso('Incidencias', DS.FieldByName('TITULO').AsString, BaseOrigen, Base_Destino);

                 // Ver si inserto o modifico
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := BaseOrigen;
                    SQL.Text :=
                       'SELECT COUNT(*) FROM EMP_INCIDENCIAS WHERE EMPRESA = ?EMPRESA AND TIPO_TERCERO = ?TIPO_TERCERO AND ' +
                       'INCIDENCIA_SINCRONIZACION = ?INCIDENCIA_SINCRONIZACION';
                    Params.ByName['EMPRESA'].AsInteger := DS.FieldByName('EMPRESA').AsInteger;
                    Params.ByName['TIPO_TERCERO'].AsString := DS.FieldByName('TIPO_TERCERO').AsString;
                    Params.ByName['INCIDENCIA_SINCRONIZACION'].AsInteger := DS.FieldByName('INCIDENCIA').AsInteger;
                    ExecQuery;
                    existe := FieldByName['COUNT'].AsInteger > 0;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);

                 if (not existe) then
                 begin
                    // Obtengo el numero de incidencia que voy a utilizar para insertar
                    incidencia := DMMain.ContadorGen('CONTA_INCIDENCIAS');

                    // Inserto la incidencia
                    Q := THYFIBQuery.Create(nil);
                    with Q do
                    begin
                       Close;
                       DataBase := BaseOrigen;
                       SQL.Text :=
                          'INSERT INTO EMP_INCIDENCIAS ' +
                          '(EMPRESA, TIPO_TERCERO, COD_CLI_PRO, INCIDENCIA, TITULO, FECHA, FECHA_RECEPCION, TERCERO, DATOS_INCIDENCIA, FECHA_RESPUESTA, ' +
                          ' RESPUESTA_INCIDENCIA, ID_S, ID_E, DOC_EJERCICIO, DOC_CANAL, DOC_SERIE, DOC_TIPO, DOC_RIG, ENTRADA, DIRECCION, AGENTE, CONTACTO, CONTACTO2, CONTACTO3, TIPO_INCIDENCIA_KRI, INCIDENCIA_SINCRONIZACION, ULT_MODIFICACION, FINALIZADO )' +
                          'VALUES ' +
                          '(?EMPRESA, ?TIPO_TERCERO, ?COD_CLI_PRO, ?INCIDENCIA, ?TITULO, ?FECHA, ?FECHA_RECEPCION, ?TERCERO, ?DATOS_INCIDENCIA, ?FECHA_RESPUESTA, ' +
                          ' ?RESPUESTA_INCIDENCIA, ?ID_S, ?ID_E, ?DOC_EJERCICIO, ?DOC_CANAL, ?DOC_SERIE, ?DOC_TIPO, ?DOC_RIG, ?ENTRADA, ?DIRECCION, ?AGENTE, ?CONTACTO, ?CONTACTO2, ?CONTACTO3, ?TIPO_INCIDENCIA_KRI, ?INCIDENCIA_SINCRONIZACION, ?ULT_MODIFICACION, ?FINALIZADO)';

                       Q.Params.ByName['EMPRESA'].AsInteger := DS.FieldByName('EMPRESA').AsInteger;
                       Q.Params.ByName['TIPO_TERCERO'].AsString := DS.FieldByName('TIPO_TERCERO').AsString;
                       Q.Params.ByName['COD_CLI_PRO'].AsInteger := DS.FieldByName('COD_CLI_PRO').AsInteger;
                       Q.Params.ByName['INCIDENCIA'].AsInteger := incidencia;
                       Q.Params.ByName['TITULO'].AsString := DS.FieldByName('TITULO').AsString;
                       Q.Params.ByName['FECHA'].AsDateTime := DS.FieldByName('FECHA').AsDateTime;
                       Q.Params.ByName['FECHA_RECEPCION'].AsDateTime := DS.FieldByName('FECHA_RECEPCION').AsDateTime;
                       Q.Params.ByName['TERCERO'].AsInteger := DS.FieldByName('TERCERO').AsInteger;
                       Q.Params.ByName['DATOS_INCIDENCIA'].AsString := DS.FieldByName('DATOS_INCIDENCIA').AsString;
                       Q.Params.ByName['FECHA_RESPUESTA'].AsDateTime := DS.FieldByName('FECHA_RESPUESTA').AsDateTime;
                       Q.Params.ByName['RESPUESTA_INCIDENCIA'].AsString := DS.FieldByName('RESPUESTA_INCIDENCIA').AsString;
                       Q.Params.ByName['ID_S'].AsInteger := DS.FieldByName('ID_S').AsInteger;
                       Q.Params.ByName['ID_E'].AsInteger := DS.FieldByName('ID_E').AsInteger;
                       Q.Params.ByName['DOC_EJERCICIO'].AsInteger := DS.FieldByName('DOC_EJERCICIO').AsInteger;
                       Q.Params.ByName['DOC_SERIE'].AsString := DS.FieldByName('DOC_SERIE').AsString;
                       Q.Params.ByName['DOC_CANAL'].AsInteger := DS.FieldByName('DOC_CANAL').AsInteger;
                       Q.Params.ByName['DOC_TIPO'].AsString := DS.FieldByName('DOC_TIPO').AsString;
                       Q.Params.ByName['DOC_RIG'].AsInteger := DS.FieldByName('DOC_RIG').AsInteger;
                       Q.Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                       Q.Params.ByName['DIRECCION'].AsInteger := DS.FieldByName('DIRECCION').AsInteger;
                       Q.Params.ByName['AGENTE'].AsInteger := DS.FieldByName('AGENTE').AsInteger;
                       Q.Params.ByName['CONTACTO'].AsInteger := DS.FieldByName('CONTACTO').AsInteger;
                       Q.Params.ByName['CONTACTO2'].AsInteger := DS.FieldByName('CONTACTO2').AsInteger;
                       Q.Params.ByName['CONTACTO3'].AsInteger := DS.FieldByName('CONTACTO3').AsInteger;
                       Q.Params.ByName['TIPO_INCIDENCIA_KRI'].AsString := DS.FieldByName('TIPO_INCIDENCIA_KRI').AsString;
                       Q.Params.ByName['INCIDENCIA_SINCRONIZACION'].AsInteger := DS.FieldByName('INCIDENCIA').AsInteger;
                       Q.Params.ByName['ULT_MODIFICACION'].AsDateTime := EncodeDate(1900, 01, 01);
                       Q.Params.ByName['FINALIZADO'].AsInteger := DS.FieldByName('FINALIZADO').AsInteger;
                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg(' INS EMP_INCIDENCIAS (2)' + #13#10 + e.Message, mtError, [mbOK], 0);
                       end;
                       FreeHandle;
                    end;
                    FreeAndNil(Q);
                 end
                 else
                 begin
                    // Inserto la incidencia
                    Q := THYFIBQuery.Create(nil);
                    with Q do
                    begin
                       Close;
                       DataBase := BaseOrigen;
                       SQL.Text :=
                          ' UPDATE EMP_INCIDENCIAS ' +
                          ' SET TITULO = ?TITULO, FECHA = ?FECHA, FECHA_RECEPCION = ?FECHA_RECEPCION, TERCERO = ?TERCERO, ' +
                          ' FECHA_RESPUESTA = ?FECHA_RESPUESTA, ID_S = ?ID_S, ID_E = ?ID_E, DOC_EJERCICIO = ?DOC_EJERCICIO, ' +
                          ' DOC_CANAL = ?DOC_CANAL, DOC_SERIE = ?DOC_SERIE, DOC_TIPO = ?DOC_TIPO, DOC_RIG = ?DOC_RIG, ' +
                          ' ENTRADA = ?ENTRADA, DIRECCION = ?DIRECCION, AGENTE = ?AGENTE, CONTACTO = ?CONTACTO, ' +
                          ' TIPO_INCIDENCIA_KRI = ?TIPO_INCIDENCIA_KRI, ' +
                          ' DATOS_INCIDENCIA = ?DATOS_INCIDENCIA, RESPUESTA_INCIDENCIA = ?RESPUESTA_INCIDENCIA, ' +
                          ' HORAS = ?HORAS, FINALIZADO = ?FINALIZADO, CONTACTO2 = ?CONTACTO2, CONTACTO3 = ?CONTACTO3, ' +
                          ' ULT_MODIFICACION = ?ULT_MODIFICACION, COD_CLI_PRO = ?COD_CLI_PRO ' +
                          ' WHERE (EMPRESA = ?EMPRESA) AND (TIPO_TERCERO = ?TIPO_TERCERO) AND (INCIDENCIA_SINCRONIZACION = ?INCIDENCIA_SINCRONIZACION) ';

                       Q.Params.ByName['EMPRESA'].AsInteger := DS.FieldByName('EMPRESA').AsInteger;
                       Q.Params.ByName['TIPO_TERCERO'].AsString := DS.FieldByName('TIPO_TERCERO').AsString;
                       Q.Params.ByName['COD_CLI_PRO'].AsInteger := DS.FieldByName('COD_CLI_PRO').AsInteger;
                       Q.Params.ByName['INCIDENCIA_SINCRONIZACION'].AsInteger := DS.FieldByName('INCIDENCIA').AsInteger;
                       Q.Params.ByName['TITULO'].AsString := DS.FieldByName('TITULO').AsString;
                       Q.Params.ByName['FECHA'].AsDateTime := DS.FieldByName('FECHA').AsDateTime;
                       Q.Params.ByName['FECHA_RECEPCION'].AsDateTime := DS.FieldByName('FECHA_RECEPCION').AsDateTime;
                       Q.Params.ByName['TERCERO'].AsInteger := DS.FieldByName('TERCERO').AsInteger;
                       Q.Params.ByName['DATOS_INCIDENCIA'].AsString := DS.FieldByName('DATOS_INCIDENCIA').AsString;
                       Q.Params.ByName['FECHA_RESPUESTA'].AsDateTime := DS.FieldByName('FECHA_RESPUESTA').AsDateTime;
                       Q.Params.ByName['RESPUESTA_INCIDENCIA'].AsString := DS.FieldByName('RESPUESTA_INCIDENCIA').AsString;
                       Q.Params.ByName['ID_S'].AsInteger := DS.FieldByName('ID_S').AsInteger;
                       Q.Params.ByName['ID_E'].AsInteger := DS.FieldByName('ID_E').AsInteger;
                       Q.Params.ByName['DOC_EJERCICIO'].AsInteger := DS.FieldByName('DOC_EJERCICIO').AsInteger;
                       Q.Params.ByName['DOC_SERIE'].AsString := DS.FieldByName('DOC_SERIE').AsString;
                       Q.Params.ByName['DOC_CANAL'].AsInteger := DS.FieldByName('DOC_CANAL').AsInteger;
                       Q.Params.ByName['DOC_TIPO'].AsString := DS.FieldByName('DOC_TIPO').AsString;
                       Q.Params.ByName['DOC_RIG'].AsInteger := DS.FieldByName('DOC_RIG').AsInteger;
                       Q.Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                       Q.Params.ByName['DIRECCION'].AsInteger := DS.FieldByName('DIRECCION').AsInteger;
                       Q.Params.ByName['AGENTE'].AsInteger := DS.FieldByName('AGENTE').AsInteger;
                       Q.Params.ByName['CONTACTO'].AsInteger := DS.FieldByName('CONTACTO').AsInteger;
                       Q.Params.ByName['CONTACTO2'].AsInteger := DS.FieldByName('CONTACTO2').AsInteger;
                       Q.Params.ByName['CONTACTO3'].AsInteger := DS.FieldByName('CONTACTO3').AsInteger;
                       Q.Params.ByName['TIPO_INCIDENCIA_KRI'].AsString := DS.FieldByName('TIPO_INCIDENCIA_KRI').AsString;
                       Q.Params.ByName['ULT_MODIFICACION'].AsDateTime := EncodeDate(1900, 01, 01);
                       Q.Params.ByName['FINALIZADO'].AsInteger := DS.FieldByName('FINALIZADO').AsInteger;
                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg(' UPD EMP_INCIDENCIAS (2)' + #13#10 + e.Message, mtError, [mbOK], 0);
                       end;
                       FreeHandle;
                    end;
                    FreeAndNil(Q);
                 end;

                 DS.Next;
              end; {while not eof}
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;
  end;
end;

procedure TDMSincronizacionIncidencias.SincronozaSys_Perfiles(BaseOrigen, Base_Destino: THYDatabase);
var
  Q : THYFIBQuery;
  DS : TFIBDataSet;
begin
  if (not hayerror) then
  begin
     MuestraProgreso('Perfiles', '', BaseOrigen, Base_Destino);
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := TFIBTransaction.Create(nil);
           try
              with Transaction do
              begin
                 DefaultDatabase := BaseOrigen;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
              end;
              Close;
              DataBase := BaseOrigen;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add('SELECT * FROM SYS_PERFILES WHERE ULT_MODIFICACION >= ?ULT_MODIFICACION ORDER BY PERFIL');
              Params.ByName['ULT_MODIFICACION'].AsDateTime := UltimaSincronizacion;
              Open;
              while not DS.EOF do
              begin
                 MuestraProgreso('Perfiles', DS.FieldByName('PERFIL').AsString + ' ' + DS.FieldByName('TITULO').AsString, BaseOrigen, Base_Destino);
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := Base_Destino;
                    SQL.Text := 'SELECT COUNT(*) FROM SYS_PERFILES WHERE PERFIL = ?PERFIL';
                    Params.ByName['PERFIL'].AsString := DS.FieldByName('PERFIL').AsString;
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
                       DataBase := Base_Destino;
                       SQL.Text :=
                          'UPDATE SYS_PERFILES SET ' +
                          'TITULO = ?TITULO, ' +
                          'COPIAS_OFERTA    = ?COPIAS_OFERTA, ' +
                          'MODELO_OFERTA    = ?MODELO_OFERTA, ' +
                          'COPIAS_PEDIDO    = ?COPIAS_PEDIDO, ' +
                          'MODELO_PEDIDO    = ?MODELO_PEDIDO, ' +
                          'COPIAS_ALBARAN   = ?COPIAS_ALBARAN, ' +
                          'MODELO_ALBARAN   = ?MODELO_ALBARAN, ' +
                          'COPIAS_FACTURA   = ?COPIAS_FACTURA, ' +
                          'MODELO_FACTURA   = ?MODELO_FACTURA, ' +
                          'DEFECTO          = ?DEFECTO, ' +
                          'IMPONER_LISTADOS = ?IMPONER_LISTADOS, ' +
                          'IMPONER_COPIAS   = ?IMPONER_COPIAS ' +
                          'WHERE PERFIL     = ?PERFIL';
                       Q.Params.ByName['PERFIL'].AsString := DS.FieldByName('PERFIL').AsString;
                       Q.Params.ByName['TITULO'].AsString := DS.FieldByName('TITULO').AsString;
                       Q.Params.ByName['COPIAS_OFERTA'].AsInteger := DS.FieldByName('COPIAS_OFERTA').AsInteger;
                       Q.Params.ByName['MODELO_OFERTA'].AsInteger := DS.FieldByName('MODELO_OFERTA').AsInteger;
                       Q.Params.ByName['COPIAS_PEDIDO'].AsInteger := DS.FieldByName('COPIAS_PEDIDO').AsInteger;
                       Q.Params.ByName['MODELO_PEDIDO'].AsInteger := DS.FieldByName('MODELO_PEDIDO').AsInteger;
                       Q.Params.ByName['COPIAS_ALBARAN'].AsInteger := DS.FieldByName('COPIAS_ALBARAN').AsInteger;
                       Q.Params.ByName['MODELO_ALBARAN'].AsInteger := DS.FieldByName('MODELO_ALBARAN').AsInteger;
                       Q.Params.ByName['COPIAS_FACTURA'].AsInteger := DS.FieldByName('COPIAS_ALBARAN').AsInteger;
                       Q.Params.ByName['MODELO_FACTURA'].AsInteger := DS.FieldByName('MODELO_ALBARAN').AsInteger;
                       Q.Params.ByName['DEFECTO'].AsInteger := DS.FieldByName('DEFECTO').AsInteger;
                       Q.Params.ByName['IMPONER_LISTADOS'].AsInteger := DS.FieldByName('IMPONER_LISTADOS').AsInteger;
                       Q.Params.ByName['IMPONER_COPIAS'].AsInteger := DS.FieldByName('IMPONER_COPIAS').AsInteger;

                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg(' UPD SYS_PERFILES ' + #13#10 + e.Message, mtError, [mbOK], 0);
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
                       DataBase := Base_Destino;
                       SQL.Text :=
                          'INSERT INTO SYS_PERFILES ' +
                          '(PERFIL,TITULO,COPIAS_OFERTA,MODELO_OFERTA,COPIAS_PEDIDO,MODELO_PEDIDO,COPIAS_ALBARAN,MODELO_ALBARAN,' +
                          'COPIAS_FACTURA,MODELO_FACTURA,DEFECTO,IMPONER_LISTADOS,IMPONER_COPIAS) ' +
                          'VALUES ' +
                          '(?PERFIL,?TITULO,?COPIAS_OFERTA,?MODELO_OFERTA,?COPIAS_PEDIDO,?MODELO_PEDIDO,?COPIAS_ALBARAN,?MODELO_ALBARAN,' +
                          '?COPIAS_FACTURA,?MODELO_FACTURA,?DEFECTO,?IMPONER_LISTADOS,?IMPONER_COPIAS)';

                       Q.Params.ByName['PERFIL'].AsString := DS.FieldByName('PERFIL').AsString;
                       Q.Params.ByName['TITULO'].AsString := DS.FieldByName('TITULO').AsString;
                       Q.Params.ByName['COPIAS_OFERTA'].AsInteger := DS.FieldByName('COPIAS_OFERTA').AsInteger;
                       Q.Params.ByName['MODELO_OFERTA'].AsInteger := DS.FieldByName('MODELO_OFERTA').AsInteger;
                       Q.Params.ByName['COPIAS_PEDIDO'].AsInteger := DS.FieldByName('COPIAS_PEDIDO').AsInteger;
                       Q.Params.ByName['MODELO_PEDIDO'].AsInteger := DS.FieldByName('MODELO_PEDIDO').AsInteger;
                       Q.Params.ByName['COPIAS_ALBARAN'].AsInteger := DS.FieldByName('COPIAS_ALBARAN').AsInteger;
                       Q.Params.ByName['MODELO_ALBARAN'].AsInteger := DS.FieldByName('MODELO_ALBARAN').AsInteger;
                       Q.Params.ByName['COPIAS_FACTURA'].AsInteger := DS.FieldByName('COPIAS_ALBARAN').AsInteger;
                       Q.Params.ByName['MODELO_FACTURA'].AsInteger := DS.FieldByName('MODELO_ALBARAN').AsInteger;
                       Q.Params.ByName['DEFECTO'].AsInteger := DS.FieldByName('DEFECTO').AsInteger;
                       Q.Params.ByName['IMPONER_LISTADOS'].AsInteger := DS.FieldByName('IMPONER_LISTADOS').AsInteger;
                       Q.Params.ByName['IMPONER_COPIAS'].AsInteger := DS.FieldByName('IMPONER_COPIAS').AsInteger;
                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg('INS SYS_PERFILES' + #13#10 + e.Message, mtError, [mbOK], 0);
                       end;
                       FreeHandle;
                    end;
                    FreeAndNil(Q);
                 end;
                 DS.Next;
              end; {while not eof}
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;
  end;
end;

procedure TDMSincronizacionIncidencias.SincronozaDic_Listados(BaseOrigen, Base_Destino: THYDatabase);
var
  Q : THYFIBQuery;
  DS : TFIBDataSet;
begin
  if (not hayerror) then
  begin
     MuestraProgreso('Listados', '', BaseOrigen, Base_Destino);
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := TFIBTransaction.Create(nil);
           try
              with Transaction do
              begin
                 DefaultDatabase := BaseOrigen;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
              end;
              Close;
              DataBase := BaseOrigen;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add('SELECT * FROM DIC_LISTADOS WHERE ULT_MODIFICACION >= ?ULT_MODIFICACION ORDER BY LISTADO');
              Params.ByName['ULT_MODIFICACION'].AsDateTime := UltimaSincronizacion;
              Open;
              while not DS.EOF do
              begin
                 MuestraProgreso('Listados', DS.FieldByName('LISTADO').AsString + ' ' + DS.FieldByName('TITULO').AsString, BaseOrigen, Base_Destino);
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Q.Close;
                    Q.DataBase := Base_Destino;
                    Q.SQL.Text := ' SELECT COUNT(LISTADO) FROM DIC_LISTADOS WHERE LISTADO=:LISTADO ';
                    Q.Prepare;
                    Q.Params.ByName['LISTADO'].AsInteger := DS.FieldByName('LISTADO').AsInteger;
                    Q.ExecQuery;
                    existe := Q.FieldByName['COUNT'].AsInteger > 0;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
                 if (existe) then
                 begin
                    Q := THYFIBQuery.Create(nil);
                    with Q do
                    begin
                       Close;
                       DataBase := Base_Destino;
                       SQL.Text :=
                          'UPDATE DIC_LISTADOS SET ' +
                          'GRUPO            = ?GRUPO, ' +
                          'TITULO           = ?TITULO, ' +
                          'DEF_LISTADO      = ?DEF_LISTADO, ' +
                          'EDITABLE         = ?EDITABLE, ' +
                          'CABECERA         = ?CABECERA, ' +
                          'TIPO             = ?TIPO ' +
                          'WHERE LISTADO = ?LISTADO';
                       Q.Prepare;
                       Q.Params.ByName['GRUPO'].AsInteger := DS.FieldByName('GRUPO').AsInteger;
                       Q.Params.ByName['TITULO'].AsString := DS.FieldByName('TITULO').AsString;
                       Q.Params.ByName['DEF_LISTADO'].AsString := DS.FieldByName('DEF_LISTADO').AsString;
                       Q.Params.ByName['EDITABLE'].AsInteger := DS.FieldByName('EDITABLE').AsInteger;
                       Q.Params.ByName['CABECERA'].AsInteger := DS.FieldByName('CABECERA').AsInteger;
                       Q.Params.ByName['TIPO'].AsString := DS.FieldByName('TIPO').AsString;
                       Q.Params.ByName['LISTADO'].AsInteger := DS.FieldByName('LISTADO').AsInteger;

                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg(' UPD DIC_LISTADOS ' + #13#10 + e.Message, mtError, [mbOK], 0);
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
                       Q.Close;
                       Q.DataBase := Base_Destino;
                       Q.SQL.Text :=
                          'INSERT INTO DIC_LISTADOS ' +
                          '(GRUPO,TITULO,DEF_LISTADO,EDITABLE,CABECERA ,TIPO,LISTADO) ' +
                          'VALUES ' +
                          '(:GRUPO, :TITULO, :DEF_LISTADO, :EDITABLE, :CABECERA , :TIPO, :LISTADO)';
                       Q.Prepare;
                       Q.Params.ByName['GRUPO'].AsInteger := DS.FieldByName('GRUPO').AsInteger;
                       Q.Params.ByName['TITULO'].AsString := DS.FieldByName('TITULO').AsString;
                       Q.Params.ByName['DEF_LISTADO'].AsString := DS.FieldByName('DEF_LISTADO').AsString;
                       Q.Params.ByName['EDITABLE'].AsInteger := DS.FieldByName('EDITABLE').AsInteger;
                       Q.Params.ByName['CABECERA'].AsInteger := DS.FieldByName('CABECERA').AsInteger;
                       Q.Params.ByName['TIPO'].AsString := DS.FieldByName('TIPO').AsString;
                       Q.Params.ByName['LISTADO'].AsInteger := DS.FieldByName('LISTADO').AsInteger;

                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg('INS DIC_LISTADOS' + #13#10 + e.Message, mtError, [mbOK], 0);
                       end;
                       FreeHandle;
                    end;
                    FreeAndNil(Q);
                 end;
                 DS.Next;
              end; {while not eof}
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;
  end;
end;

procedure TDMSincronizacionIncidencias.SincronozaDic_Listados_Grupos(BaseOrigen, Base_Destino: THYDatabase);
var
  Q : THYFIBQuery;
  DS : TFIBDataSet;
begin
  if (not hayerror) then
  begin
     MuestraProgreso('Grupos de Listado', '', BaseOrigen, Base_Destino);
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := TFIBTransaction.Create(nil);
           try
              with Transaction do
              begin
                 DefaultDatabase := BaseOrigen;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
              end;
              Close;
              DataBase := BaseOrigen;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add('SELECT * FROM DIC_LISTADOS_GRUPOS WHERE ULT_MODIFICACION >= ?ULT_MODIFICACION ORDER BY GRUPO');
              Params.ByName['ULT_MODIFICACION'].AsDateTime := UltimaSincronizacion;
              Open;
              while not DS.EOF do
              begin
                 MuestraProgreso('Grupos de Listado', DS.FieldByName('GRUPO').AsString + ' ' + DS.FieldByName('TITULO').AsString, BaseOrigen, Base_Destino);
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := Base_Destino;
                    SQL.Text := 'SELECT COUNT(*) FROM DIC_LISTADOS_GRUPOS WHERE GRUPO = ?GRUPO';
                    Params.ByName['GRUPO'].AsInteger := DS.FieldByName('GRUPO').AsInteger;
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
                       DataBase := Base_Destino;
                       SQL.Text :=
                          'UPDATE DIC_LISTADOS_GRUPOS SET ' +
                          'TITULO           = ?TITULO, ' +
                          'LISTADODEF       = ?LISTADODEF, ' +
                          'COPIAS           = ?COPIAS, ' +
                          'PIJAMA           = ?PIJAMA, ' +
                          'LISTADODEFMAIL   = ?LISTADODEFMAIL ' +
                          'WHERE GRUPO = ?GRUPO ';
                       Q.Params.ByName['GRUPO'].AsInteger := DS.FieldByName('GRUPO').AsInteger;
                       Q.Params.ByName['TITULO'].AsString := DS.FieldByName('TITULO').AsString;
                       Q.Params.ByName['LISTADODEF'].AsInteger := DS.FieldByName('LISTADODEF').AsInteger;
                       Q.Params.ByName['COPIAS'].AsInteger := DS.FieldByName('COPIAS').AsInteger;
                       Q.Params.ByName['PIJAMA'].AsInteger := DS.FieldByName('PIJAMA').AsInteger;
                       Q.Params.ByName['LISTADODEFMAIL'].AsInteger := DS.FieldByName('LISTADODEFMAIL').AsInteger;

                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg(' UPD DIC_LISTADOS_GRUPOS ' + #13#10 + e.Message, mtError, [mbOK], 0);
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
                       DataBase := Base_Destino;
                       SQL.Text :=
                          'INSERT INTO DIC_LISTADOS_GRUPOS ' +
                          '(TITULO,LISTADODEF,COPIAS,PIJAMA,LISTADODEFMAIL,GRUPO)' +
                          'VALUES ' +
                          '(?TITULO,?LISTADODEF,?COPIAS,?PIJAMA,?LISTADODEFMAIL,?GRUPO)';
                       Q.Params.ByName['GRUPO'].AsInteger := DS.FieldByName('GRUPO').AsInteger;
                       Q.Params.ByName['TITULO'].AsString := DS.FieldByName('TITULO').AsString;
                       Q.Params.ByName['LISTADODEF'].AsInteger := DS.FieldByName('LISTADODEF').AsInteger;
                       Q.Params.ByName['COPIAS'].AsInteger := DS.FieldByName('COPIAS').AsInteger;
                       Q.Params.ByName['PIJAMA'].AsInteger := DS.FieldByName('PIJAMA').AsInteger;
                       Q.Params.ByName['LISTADODEFMAIL'].AsInteger := DS.FieldByName('LISTADODEFMAIL').AsInteger;

                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg('INS DIC_LISTADOS_GRUPOS' + #13#10 + e.Message, mtError, [mbOK], 0);
                       end;
                       FreeHandle;
                    end;
                    FreeAndNil(Q);
                 end;
                 DS.Next;
              end; {while not eof}
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;
  end;
end;

procedure TDMSincronizacionIncidencias.SincronozaModo_iva(BaseOrigen, Base_Destino: THYDatabase);
var
  Q : THYFIBQuery;
  DS : TFIBDataSet;
begin
  if (not hayerror) then
  begin
     MuestraProgreso('Modos de IVA', '', BaseOrigen, Base_Destino);
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := TFIBTransaction.Create(nil);
           try
              with Transaction do
              begin
                 DefaultDatabase := BaseOrigen;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
              end;
              Close;
              DataBase := BaseOrigen;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add('SELECT * FROM SYS_MODO_IVA WHERE ULT_MODIFICACION >= ?ULT_MODIFICACION ORDER BY MODO');
              Params.ByName['ULT_MODIFICACION'].AsDateTime := UltimaSincronizacion;
              Open;
              while not DS.EOF do
              begin
                 MuestraProgreso('Modos de IVA', DS.FieldByName('MODO').AsString + ' ' + DS.FieldByName('TITULO').AsString, BaseOrigen, Base_Destino);
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := Base_Destino;
                    SQL.Text := 'SELECT COUNT(*) FROM SYS_MODO_IVA WHERE MODO = ?MODO';
                    Params.ByName['MODO'].AsInteger := DS.FieldByName('MODO').AsInteger;
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
                       DataBase := Base_Destino;
                       SQL.Text :=
                          'UPDATE SYS_MODO_IVA SET ' +
                          'TITULO           = ?TITULO, ' +
                          'IVA              = ?IVA, ' +
                          'RECARGO          = ?RECARGO, ' +
                          'DEDUCIBLE        = ?DEDUCIBLE, ' +
                          'TIPO_TRANSACCION = ?TIPO_TRANSACCION ' +
                          'WHERE MODO = ?MODO';
                       Q.Params.ByName['MODO'].AsInteger := DS.FieldByName('MODO').AsInteger;
                       Q.Params.ByName['TITULO'].AsString := DS.FieldByName('TITULO').AsString;
                       Q.Params.ByName['IVA'].AsInteger := DS.FieldByName('IVA').AsInteger;
                       Q.Params.ByName['RECARGO'].AsInteger := DS.FieldByName('RECARGO').AsInteger;
                       Q.Params.ByName['DEDUCIBLE'].AsInteger := DS.FieldByName('DEDUCIBLE').AsInteger;
                       Q.Params.ByName['TIPO_TRANSACCION'].AsInteger := DS.FieldByName('TIPO_TRANSACCION').AsInteger;

                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg(' UPD SYS_MODO_IVA ' + #13#10 + e.Message, mtError, [mbOK], 0);
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
                       DataBase := Base_Destino;
                       SQL.Text :=
                          'INSERT INTO SYS_MODO_IVA ' +
                          '(MODO,TITULO, IVA, RECARGO, DEDUCIBLE, TIPO_TRANSACCION)' +
                          'VALUES ' +
                          '(?MODO,?TITULO, ?IVA, ?RECARGO, ?DEDUCIBLE, ?TIPO_TRANSACCION)';
                       Q.Params.ByName['MODO'].AsInteger := DS.FieldByName('MODO').AsInteger;
                       Q.Params.ByName['TITULO'].AsString := DS.FieldByName('TITULO').AsString;
                       Q.Params.ByName['IVA'].AsInteger := DS.FieldByName('IVA').AsInteger;
                       Q.Params.ByName['RECARGO'].AsInteger := DS.FieldByName('RECARGO').AsInteger;
                       Q.Params.ByName['DEDUCIBLE'].AsInteger := DS.FieldByName('DEDUCIBLE').AsInteger;
                       Q.Params.ByName['TIPO_TRANSACCION'].AsInteger := DS.FieldByName('TIPO_TRANSACCION').AsInteger;

                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg('INS SYS_MODO_IVA' + #13#10 + e.Message, mtError, [mbOK], 0);
                       end;
                       FreeHandle;
                    end;
                    FreeAndNil(Q);
                 end;
                 DS.Next;
              end; {while not eof}
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;
  end;
end;

procedure TDMSincronizacionIncidencias.SincronozaArt_Tarifas_C(BaseOrigen, Base_Destino: THYDatabase);
var
  Q : THYFIBQuery;
  DS : TFIBDataSet;
begin
  if (not hayerror) then
  begin
     MuestraProgreso('Tarifas', '', BaseOrigen, Base_Destino);
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := TFIBTransaction.Create(nil);
           try
              with Transaction do
              begin
                 DefaultDatabase := BaseOrigen;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
              end;
              Close;
              DataBase := BaseOrigen;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add('SELECT * FROM ART_TARIFAS_C WHERE EMPRESA = ?EMPRESA AND ULT_MODIFICACION >= ?ULT_MODIFICACION ORDER BY TARIFA');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['ULT_MODIFICACION'].AsDateTime := UltimaSincronizacion;
              Open;
              while not DS.EOF do
              begin
                 MuestraProgreso('Tarifas', DS.FieldByName('TARIFA').AsString + ' ' + DS.FieldByName('TITULO').AsString, BaseOrigen, Base_Destino);
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := Base_Destino;
                    SQL.Text := 'SELECT COUNT(*) FROM ART_TARIFAS_C WHERE EMPRESA=?EMPRESA AND TARIFA = ?TARIFA';
                    Params.ByName['EMPRESA'].AsInteger := DS.FieldByName('EMPRESA').AsInteger;
                    Params.ByName['TARIFA'].AsString := DS.FieldByName('TARIFA').AsString;
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
                       DataBase := Base_Destino;
                       SQL.Text :=
                          'UPDATE ART_TARIFAS_C SET ' +
                          'TITULO            = ?TITULO, ' +
                          'MONEDA            = ?MONEDA, ' +
                          'ACTIVA            = ?ACTIVA, ' +
                          'IVA_INCLUIDO      = ?IVA_INCLUIDO, ' +
                          'BIENES_USADOS_KRI = ?BIENES_USADOS_KRI ' +
                          'WHERE EMPRESA = ?EMPRESA AND TARIFA= ?TARIFA';

                       Q.Params.ByName['EMPRESA'].AsInteger := DS.FieldByName('EMPRESA').AsInteger;
                       Q.Params.ByName['TARIFA'].AsString := DS.FieldByName('TARIFA').AsString;
                       Q.Params.ByName['TITULO'].AsString := DS.FieldByName('TITULO').AsString;
                       Q.Params.ByName['MONEDA'].AsString := DS.FieldByName('MONEDA').AsString;
                       Q.Params.ByName['ACTIVA'].AsInteger := DS.FieldByName('ACTIVA').AsInteger;
                       Q.Params.ByName['IVA_INCLUIDO'].AsInteger := DS.FieldByName('IVA_INCLUIDO').AsInteger;
                       Q.Params.ByName['BIENES_USADOS_KRI'].AsInteger := DS.FieldByName('BIENES_USADOS_KRI').AsInteger;

                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg(' UPD ART_TARIFAS_C ' + #13#10 + e.Message, mtError, [mbOK], 0);
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
                       DataBase := Base_Destino;
                       SQL.Text :=
                          'INSERT INTO ART_TARIFAS_C ' +
                          '(EMPRESA, TARIFA, TITULO, MONEDA, ACTIVA, IVA_INCLUIDO, BIENES_USADOS_KRI) ' +
                          'VALUES ' +
                          '(?EMPRESA, ?TARIFA, ?TITULO, ?MONEDA, ?ACTIVA, ?IVA_INCLUIDO, ?BIENES_USADOS_KRI) ';

                       Q.Params.ByName['EMPRESA'].AsInteger := DS.FieldByName('EMPRESA').AsInteger;
                       Q.Params.ByName['TARIFA'].AsString := DS.FieldByName('TARIFA').AsString;
                       Q.Params.ByName['TITULO'].AsString := DS.FieldByName('TITULO').AsString;
                       Q.Params.ByName['MONEDA'].AsString := DS.FieldByName('MONEDA').AsString;
                       Q.Params.ByName['ACTIVA'].AsInteger := DS.FieldByName('ACTIVA').AsInteger;
                       Q.Params.ByName['IVA_INCLUIDO'].AsInteger := DS.FieldByName('IVA_INCLUIDO').AsInteger;
                       Q.Params.ByName['BIENES_USADOS_KRI'].AsInteger := DS.FieldByName('BIENES_USADOS_KRI').AsInteger;
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
                 DS.Next;
              end; {while not eof}
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;
  end;
end;

procedure TDMSincronizacionIncidencias.SincronozaSys_Terceros_contactos(BaseOrigen, Base_Destino: THYDatabase);
var
  Q : THYFIBQuery;
  DS : TFIBDataSet;
  {sl : TStringList;}
begin
  if (not hayerror) then
  begin
     MuestraProgreso('Contactos', '', BaseOrigen, Base_Destino);
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           UniDirectional := True;
           Transaction := TFIBTransaction.Create(nil);
           try
              with Transaction do
              begin
                 DefaultDatabase := BaseOrigen;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
              end;
              Close;
              DataBase := BaseOrigen;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;

              SelectSQL.Add('SELECT * FROM SYS_TERCEROS_CONTACTOS WHERE ULT_MODIFICACION >= ?ULT_MODIFICACION ORDER BY TERCERO, CONTACTO');{sin restriccion de fecha de modificación}
              Params.ByName['ULT_MODIFICACION'].AsDateTime := UltimaSincronizacion;
              Open;
              while not DS.EOF do
              begin
                 MuestraProgreso('Contactos', DS.FieldByName('CONTACTO').AsString + ' ' + DS.FieldByName('APELLIDOS').AsString + ' ' + DS.FieldByName('NOMBRE').AsString, BaseOrigen, Base_Destino);
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := Base_Destino;
                    SQL.Text := 'SELECT COUNT(*) FROM SYS_TERCEROS_CONTACTOS WHERE CONTACTO=?CONTACTO AND TERCERO = ?TERCERO';
                    Params.ByName['TERCERO'].AsInteger := DS.FieldByName('TERCERO').AsInteger;
                    Params.ByName['CONTACTO'].AsInteger := DS.FieldByName('CONTACTO').AsInteger;
                    ExecQuery;
                    existe := FieldByName['COUNT'].AsInteger > 0;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
                 if (existe) then
                 begin
                    Q := THYFIBQuery.Create(nil);
                    //ShowMessage('updating sys_terceros_contactos');
                    with Q do
                    begin
                       Close;
                       DataBase := Base_Destino;
                       SQL.Text :=
                          'UPDATE SYS_TERCEROS_CONTACTOS SET ' +
                          'NOMBRE        = ?NOMBRE,      ' +
                          'APELLIDOS     = ?APELLIDOS,   ' +
                          'MOVIL         = ?MOVIL,       ' +
                          'TELEFONO      = ?TELEFONO,    ' +
                          'FAX           = ?FAX,         ' +
                          'EXTENSION     = ?EXTENSION,   ' +
                          'CORREO        = ?CORREO,      ' +
                          'NOTAS         = ?NOTAS,       ' +
                          'AGENTE        = ?AGENTE,      ' +
                          'ZONA          = ?ZONA,        ' +
                          'DIRECCION     = ?DIRECCION,   ' +
                          'PADRE         = ?PADRE,       ' +
                          'DEPARTAMENTO  = ?DEPARTAMENTO ' +
                          'WHERE TERCERO = ?TERCERO AND CONTACTO = ?CONTACTO';

                       Q.Params.ByName['TERCERO'].AsInteger := DS.FieldByName('TERCERO').AsInteger;
                       Q.Params.ByName['CONTACTO'].AsInteger := DS.FieldByName('CONTACTO').AsInteger;
                       Q.Params.ByName['NOMBRE'].AsString := DS.FieldByName('NOMBRE').AsString;
                       Q.Params.ByName['APELLIDOS'].AsString := DS.FieldByName('APELLIDOS').AsString;
                       Q.Params.ByName['MOVIL'].AsString := DS.FieldByName('MOVIL').AsString;
                       Q.Params.ByName['TELEFONO'].AsString := DS.FieldByName('TELEFONO').AsString;
                       Q.Params.ByName['FAX'].AsString := DS.FieldByName('FAX').AsString;
                       Q.Params.ByName['EXTENSION'].AsString := DS.FieldByName('EXTENSION').AsString;
                       Q.Params.ByName['CORREO'].AsString := DS.FieldByName('CORREO').AsString;
                       Q.Params.ByName['NOTAS'].AsString := DS.FieldByName('NOTAS').AsString;
                       Q.Params.ByName['AGENTE'].AsInteger := DS.FieldByName('AGENTE').AsInteger;
                       Q.Params.ByName['ZONA'].AsString := DS.FieldByName('ZONA').AsString;
                       Q.Params.ByName['DIRECCION'].AsInteger := DS.FieldByName('DIRECCION').AsInteger;
                       Q.Params.ByName['PADRE'].AsInteger := DS.FieldByName('PADRE').AsInteger;
                       Q.Params.ByName['DEPARTAMENTO'].AsString := DS.FieldByName('DEPARTAMENTO').AsString;

                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg('UPD SYS_TERCEROS_CONTACTOS' + #13#10 + e.Message, mtError, [mbOK], 0);
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
                       DataBase := Base_Destino;
                       //ShowMessage('Insertando sys_terceros_contactos');
                       SQL.Text :=
                          'INSERT INTO SYS_TERCEROS_CONTACTOS ' +
                          '(TERCERO, CONTACTO, NOMBRE, APELLIDOS, MOVIL, TELEFONO, FAX, EXTENSION, ' +
                          ' CORREO, NOTAS, AGENTE, ZONA, DIRECCION,PADRE, DEPARTAMENTO )           ' +
                          'VALUES ' +
                          '(?TERCERO, ?CONTACTO, ?NOMBRE, ?APELLIDOS, ?MOVIL, ?TELEFONO, ?FAX, ?EXTENSION, ' +
                          ' ?CORREO, ?NOTAS, ?AGENTE, ?ZONA, ?DIRECCION,?PADRE, ?DEPARTAMENTO)             ';

                       Q.Params.ByName['TERCERO'].AsInteger := DS.FieldByName('TERCERO').AsInteger;
                       Q.Params.ByName['CONTACTO'].AsInteger := DS.FieldByName('CONTACTO').AsInteger;
                       Q.Params.ByName['NOMBRE'].AsString := DS.FieldByName('NOMBRE').AsString;
                       Q.Params.ByName['APELLIDOS'].AsString := DS.FieldByName('APELLIDOS').AsString;
                       Q.Params.ByName['MOVIL'].AsString := DS.FieldByName('MOVIL').AsString;
                       Q.Params.ByName['TELEFONO'].AsString := DS.FieldByName('TELEFONO').AsString;
                       Q.Params.ByName['FAX'].AsString := DS.FieldByName('FAX').AsString;
                       Q.Params.ByName['EXTENSION'].AsString := DS.FieldByName('EXTENSION').AsString;
                       Q.Params.ByName['CORREO'].AsString := DS.FieldByName('CORREO').AsString;
                       Q.Params.ByName['NOTAS'].AsString := DS.FieldByName('NOTAS').AsString;
                       Q.Params.ByName['AGENTE'].AsInteger := DS.FieldByName('AGENTE').AsInteger;
                       Q.Params.ByName['ZONA'].AsString := DS.FieldByName('ZONA').AsString;
                       Q.Params.ByName['DIRECCION'].AsInteger := DS.FieldByName('DIRECCION').AsInteger;
                       Q.Params.ByName['PADRE'].AsInteger := DS.FieldByName('PADRE').AsInteger;
                       Q.Params.ByName['DEPARTAMENTO'].AsString := DS.FieldByName('DEPARTAMENTO').AsString;

                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg('INS SYS_TERCEROS_CONTACTOS' + #13#10 + e.Message, mtError, [mbOK], 0);
                       end;
                       FreeHandle;
                    end;
                    FreeAndNil(Q);
                 end;
                 DS.Next;
              end; {while not eof}
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;
     { Actualizamos ult_modificacion en contactos nuevos }
     Q := THYFIBQuery.Create(nil);
     try
        with Q do
        begin
           Close;
           DataBase := Base_Destino;
           SQL.Text := 'UPDATE SYS_TERCEROS_CONTACTOS ' +
              'SET ULT_MODIFICACION = ?ULT_MODIFICACION ' +
              'WHERE ULT_MODIFICACION > ''01/01/1900''';
           Params.ByName['ULT_MODIFICACION'].AsDateTime := EncodeDate(1900, 01, 01);
           ExecQuery;
           FreeHandle;
        end;
     finally
        FreeAndNil(Q);
     end;
  end;
end;

procedure TDMSincronizacionIncidencias.SincronozaSys_Localidades(BaseOrigen, Base_Destino: THYDatabase);
var
  Q : THYFIBQuery;
  DS : TFIBDataSet;
begin
  if (not hayerror) then
  begin
     MuestraProgreso('Localidades', '', BaseOrigen, Base_Destino);
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := TFIBTransaction.Create(nil);
           try
              with Transaction do
              begin
                 DefaultDatabase := BaseOrigen;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
              end;
              Close;
              DataBase := BaseOrigen;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add('SELECT * FROM SYS_LOCALIDADES WHERE ULT_MODIFICACION >= ?ULT_MODIFICACION ORDER BY LOCALIDAD');
              Params.ByName['ULT_MODIFICACION'].AsDateTime := UltimaSincronizacion;
              Open;
              while not DS.EOF do
              begin
                 MuestraProgreso('Localidades', DS.FieldByName('LOCALIDAD').AsString + ' ' + DS.FieldByName('TITULO').AsString, BaseOrigen, Base_Destino);
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := Base_Destino;
                    SQL.Text := 'SELECT COUNT(*) FROM SYS_LOCALIDADES WHERE LOCALIDAD = ?LOCALIDAD';
                    Params.ByName['LOCALIDAD'].AsString := DS.FieldByName('LOCALIDAD').AsString;
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
                       DataBase := Base_Destino;
                       SQL.Text :=
                          'UPDATE SYS_LOCALIDADES SET ' +
                          'TITULO        = ?TITULO,        ' +
                          'CODIGO_POSTAL = ?CODIGO_POSTAL, ' +
                          'PAIS          = ?PAIS,          ' +
                          'PROVINCIA     = ?PROVINCIA,     ' +
                          'ID_LOCAL      = ?ID_LOCAL       ' +
                          'WHERE LOCALIDAD = ?LOCALIDAD    ';

                       Q.Params.ByName['LOCALIDAD'].AsString := DS.FieldByName('LOCALIDAD').AsString;
                       Q.Params.ByName['TITULO'].AsString := DS.FieldByName('TITULO').AsString;
                       Q.Params.ByName['CODIGO_POSTAL'].AsString := DS.FieldByName('CODIGO_POSTAL').AsString;
                       Q.Params.ByName['PAIS'].AsString := DS.FieldByName('PAIS').AsString;
                       Q.Params.ByName['PROVINCIA'].AsString := DS.FieldByName('PROVINCIA').AsString;
                       Q.Params.ByName['ID_LOCAL'].AsInteger := DS.FieldByName('ID_LOCAL').AsInteger;

                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg('INS SYS_LOCALIDADES' + #13#10 + e.Message, mtError, [mbOK], 0);
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
                       DataBase := Base_Destino;
                       SQL.Text :=
                          'INSERT INTO SYS_LOCALIDADES ' +
                          '(LOCALIDAD, TITULO, CODIGO_POSTAL, PAIS, PROVINCIA, ID_LOCAL) ' +
                          'VALUES ' +
                          '(?LOCALIDAD, ?TITULO, ?CODIGO_POSTAL, ?PAIS, ?PROVINCIA, ?ID_LOCAL) ';

                       Q.Params.ByName['LOCALIDAD'].AsString := DS.FieldByName('LOCALIDAD').AsString;
                       Q.Params.ByName['TITULO'].AsString := DS.FieldByName('TITULO').AsString;
                       Q.Params.ByName['CODIGO_POSTAL'].AsString := DS.FieldByName('CODIGO_POSTAL').AsString;
                       Q.Params.ByName['PAIS'].AsString := DS.FieldByName('PAIS').AsString;
                       Q.Params.ByName['PROVINCIA'].AsString := DS.FieldByName('PROVINCIA').AsString;
                       Q.Params.ByName['ID_LOCAL'].AsInteger := DS.FieldByName('ID_LOCAL').AsInteger;

                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg('INS SYS_LOCALIDADES' + #13#10 + e.Message, mtError, [mbOK], 0);
                       end;
                       FreeHandle;
                    end;
                    FreeAndNil(Q);
                 end;
                 DS.Next;
              end; {while not eof}
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;
  end;
end;

procedure TDMSincronizacionIncidencias.SincronozaSys_Tercero_Direcciones(BaseOrigen, Base_Destino: THYDatabase);
var
  Q : THYFIBQuery;
  DS : TFIBDataSet;
begin
  if (not hayerror) then
  begin
     MuestraProgreso('Direcciones', '', BaseOrigen, Base_Destino);
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := TFIBTransaction.Create(nil);
           try
              with Transaction do
              begin
                 DefaultDatabase := BaseOrigen;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
              end;
              Close;
              DataBase := BaseOrigen;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add('SELECT * FROM SYS_TERCEROS_DIRECCIONES WHERE ULT_MODIFICACION >= ?ULT_MODIFICACION ORDER BY TERCERO, DIRECCION');
              Params.ByName['ULT_MODIFICACION'].AsDateTime := UltimaSincronizacion;
              Open;
              while not DS.EOF do
              begin
                 MuestraProgreso('Direcciones', DS.FieldByName('DIRECCION').AsString + ' ' + DS.FieldByName('DIR_COMPLETA').AsString, BaseOrigen, Base_Destino);
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := Base_Destino;
                    SQL.Text := 'SELECT COUNT(*) FROM SYS_TERCEROS_DIRECCIONES WHERE TERCERO = ?TERCERO AND DIRECCION = ?DIRECCION';
                    Params.ByName['TERCERO'].AsInteger := DS.FieldByName('TERCERO').AsInteger;
                    Params.ByName['DIRECCION'].AsInteger := DS.FieldByName('DIRECCION').AsInteger;
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
                       DataBase := Base_Destino;
                       SQL.Text :=
                          'UPDATE  SYS_TERCEROS_DIRECCIONES SET        ' +
                          'DIR_TIPO            = ?DIR_TIPO,            ' +
                          'DIR_NOMBRE          = ?DIR_NOMBRE,          ' +
                          'DIR_NOMBRE_2        = ?DIR_NOMBRE_2,        ' +
                          'DIR_NUMERO          = ?DIR_NUMERO,          ' +
                          'DIR_BLOQUE_ESCALERA = ?DIR_BLOQUE_ESCALERA, ' +
                          'DIR_PISO            = ?DIR_PISO,            ' +
                          'DIR_PUERTA          = ?DIR_PUERTA,          ' +
                          'DIR_LOCALIDAD       = ?DIR_LOCALIDAD,       ' +
                          'DIR_CLASE           = ?DIR_CLASE,           ' +
                          'DIR_TELEFONO01      = ?DIR_TELEFONO01,      ' +
                          'DIR_TELEFONO02      = ?DIR_TELEFONO02,      ' +
                          'DIR_TELEFAX         = ?DIR_TELEFAX,         ' +
                          'CODIGO_EDI          = ?CODIGO_EDI,          ' +
                          'DIR_DEFECTO         = ?DIR_DEFECTO,         ' +
                          'ID_LOCAL            = ?ID_LOCAL,            ' +
                          'DIR_TRANSPORTISTA   = ?DIR_TRANSPORTISTA    ' +
                          'WHERE TERCERO = ?TERCERO AND DIRECCION = ?DIRECCION ';

                       Q.Params.ByName['DIR_TIPO'].AsString := DS.FieldByName('DIR_TIPO').AsString;
                       Q.Params.ByName['DIR_NOMBRE'].AsString := DS.FieldByName('DIR_NOMBRE').AsString;
                       Q.Params.ByName['DIR_NOMBRE_2'].AsString := DS.FieldByName('DIR_NOMBRE_2').AsString;
                       Q.Params.ByName['DIR_NUMERO'].AsString := DS.FieldByName('DIR_NUMERO').AsString;
                       Q.Params.ByName['DIR_BLOQUE_ESCALERA'].AsString := DS.FieldByName('DIR_BLOQUE_ESCALERA').AsString;
                       Q.Params.ByName['DIR_PISO'].AsString := DS.FieldByName('DIR_PISO').AsString;
                       Q.Params.ByName['DIR_PUERTA'].AsString := DS.FieldByName('DIR_PUERTA').AsString;
                       Q.Params.ByName['DIR_LOCALIDAD'].AsString := DS.FieldByName('DIR_LOCALIDAD').AsString;
                       Q.Params.ByName['DIR_CLASE'].AsInteger := DS.FieldByName('DIR_CLASE').AsInteger;
                       Q.Params.ByName['DIR_TELEFONO01'].AsString := DS.FieldByName('DIR_TELEFONO01').AsString;
                       Q.Params.ByName['DIR_TELEFONO02'].AsString := DS.FieldByName('DIR_TELEFONO02').AsString;
                       Q.Params.ByName['DIR_TELEFAX'].AsString := DS.FieldByName('DIR_TELEFAX').AsString;
                       Q.Params.ByName['CODIGO_EDI'].AsString := DS.FieldByName('CODIGO_EDI').AsString;
                       Q.Params.ByName['DIR_DEFECTO'].AsInteger := DS.FieldByName('DIR_DEFECTO').AsInteger;
                       Q.Params.ByName['ID_LOCAL'].AsInteger := DS.FieldByName('ID_LOCAL').AsInteger;
                       Q.Params.ByName['DIR_TRANSPORTISTA'].AsString := DS.FieldByName('DIR_TRANSPORTISTA').AsString;
                       Q.Params.ByName['TERCERO'].AsInteger := DS.FieldByName('TERCERO').AsInteger;
                       Q.Params.ByName['DIRECCION'].AsInteger := DS.FieldByName('DIRECCION').AsInteger;

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
                       DataBase := Base_Destino;
                       SQL.Text :=
                          'INSERT INTO SYS_TERCEROS_DIRECCIONES ' +
                          '(DIR_TIPO,DIR_NOMBRE,DIR_NOMBRE_2,DIR_NUMERO,DIR_BLOQUE_ESCALERA,DIR_PISO,DIR_PUERTA,DIR_LOCALIDAD,DIR_CLASE,DIR_TELEFONO01,' +
                          'DIR_TELEFONO02,DIR_TELEFAX,CODIGO_EDI,DIR_DEFECTO,ID_LOCAL,DIR_TRANSPORTISTA,TERCERO,DIRECCION)' +
                          'VALUES ' +
                          '(?DIR_TIPO,?DIR_NOMBRE,?DIR_NOMBRE_2,?DIR_NUMERO,?DIR_BLOQUE_ESCALERA,?DIR_PISO,?DIR_PUERTA,?DIR_LOCALIDAD,?DIR_CLASE,?DIR_TELEFONO01,' +
                          '?DIR_TELEFONO02,?DIR_TELEFAX,?CODIGO_EDI,?DIR_DEFECTO,?ID_LOCAL,?DIR_TRANSPORTISTA,?TERCERO,?DIRECCION)';

                       Q.Params.ByName['DIR_TIPO'].AsString := DS.FieldByName('DIR_TIPO').AsString;
                       Q.Params.ByName['DIR_NOMBRE'].AsString := DS.FieldByName('DIR_NOMBRE').AsString;
                       Q.Params.ByName['DIR_NOMBRE_2'].AsString := DS.FieldByName('DIR_NOMBRE_2').AsString;
                       Q.Params.ByName['DIR_NUMERO'].AsString := DS.FieldByName('DIR_NUMERO').AsString;
                       Q.Params.ByName['DIR_BLOQUE_ESCALERA'].AsString := DS.FieldByName('DIR_BLOQUE_ESCALERA').AsString;
                       Q.Params.ByName['DIR_PISO'].AsString := DS.FieldByName('DIR_PISO').AsString;
                       Q.Params.ByName['DIR_PUERTA'].AsString := DS.FieldByName('DIR_PUERTA').AsString;
                       Q.Params.ByName['DIR_LOCALIDAD'].AsString := DS.FieldByName('DIR_LOCALIDAD').AsString;
                       Q.Params.ByName['DIR_CLASE'].AsInteger := DS.FieldByName('DIR_CLASE').AsInteger;
                       Q.Params.ByName['DIR_TELEFONO01'].AsString := DS.FieldByName('DIR_TELEFONO01').AsString;
                       Q.Params.ByName['DIR_TELEFONO02'].AsString := DS.FieldByName('DIR_TELEFONO02').AsString;
                       Q.Params.ByName['DIR_TELEFAX'].AsString := DS.FieldByName('DIR_TELEFAX').AsString;
                       Q.Params.ByName['CODIGO_EDI'].AsString := DS.FieldByName('CODIGO_EDI').AsString;
                       Q.Params.ByName['DIR_DEFECTO'].AsInteger := DS.FieldByName('DIR_DEFECTO').AsInteger;
                       Q.Params.ByName['ID_LOCAL'].AsInteger := DS.FieldByName('ID_LOCAL').AsInteger;
                       Q.Params.ByName['DIR_TRANSPORTISTA'].AsString := DS.FieldByName('DIR_TRANSPORTISTA').AsString;
                       Q.Params.ByName['TERCERO'].AsInteger := DS.FieldByName('TERCERO').AsInteger;
                       Q.Params.ByName['DIRECCION'].AsInteger := DS.FieldByName('DIRECCION').AsInteger;

                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg('INS SYS-TERCEROS_DIRECCIONES' + #13#10 + e.Message, mtError, [mbOK], 0);
                       end;
                       FreeHandle;
                    end;
                    FreeAndNil(Q);
                 end;
                 DS.Next;
              end; {while not eof}
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;
  end;
end;

{No se utiliza
procedure TDMSincronizacionIncidencias.BorrarIncidencias(Base: THYDataBase);
var
  Q : THYFIBQuery;
begin
  FSendCorreo.Texto(_('Borrando Incidencias'));
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := Base;
        SQL.Text := 'DELETE FROM EMP_INCIDENCIAS';
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
  FSendCorreo.Texto('Fin ' + _('Borrando Incidencias'));
end;
}

procedure TDMSincronizacionIncidencias.BorrarContactos(Base: THYDatabase);
var
  Q : THYFIBQuery;
begin
  FSendCorreo.Texto(_('Borrando Contactos'));
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := Base;
        SQL.Text := 'execute procedure borra_contactos(?ULT_MODIFICACION) ';
        Params.ByName['ULT_MODIFICACION'].AsDateTime := UltimaSincronizacion;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
  FSendCorreo.Texto('Fin ' + _('Borrando Contactos'));
end;

procedure TDMSincronizacionIncidencias.SincronozaSys_Provincias(BaseOrigen, Base_Destino: THYDatabase);
var
  Q : THYFIBQuery;
  DS : TFIBDataSet;
begin
  if (not hayerror) then
  begin
     MuestraProgreso('Provincias', '', BaseOrigen, Base_Destino);
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := TFIBTransaction.Create(nil);
           try
              with Transaction do
              begin
                 DefaultDatabase := BaseOrigen;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
              end;
              Close;
              DataBase := BaseOrigen;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add('SELECT * FROM SYS_PROVINCIAS WHERE ULT_MODIFICACION >= ?ULT_MODIFICACION ORDER BY PAIS, PROVINCIA');
              Params.ByName['ULT_MODIFICACION'].AsDateTime := UltimaSincronizacion;
              Open;
              while not DS.EOF do
              begin
                 MuestraProgreso('Provincias', DS.FieldByName('PROVINCIA').AsString + ' ' + DS.FieldByName('TITULO').AsString, BaseOrigen, Base_Destino);
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := Base_Destino;
                    SQL.Text := 'SELECT COUNT(*) FROM SYS_PROVINCIAS WHERE PAIS = ?PAIS AND PROVINCIA = ?PROVINCIA';
                    Params.ByName['PAIS'].AsString := DS.FieldByName('PAIS').AsString;
                    Params.ByName['PROVINCIA'].AsString := DS.FieldByName('PROVINCIA').AsString;
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
                       DataBase := Base_Destino;
                       SQL.Text :=
                          'UPDATE SYS_PROVINCIAS SET ' +
                          'TITULO = ?TITULO,         ' +
                          'CODIGO_TEL = ?CODIGO_TEL, ' +
                          'INE = ?INE                ' +
                          'WHERE PAIS = ?PAIS AND PROVINCIA = ?PROVINCIA';
                       Q.Params.ByName['TITULO'].AsString := DS.FieldByName('TITULO').AsString;
                       Q.Params.ByName['CODIGO_TEL'].AsString := DS.FieldByName('CODIGO_TEL').AsString;
                       Q.Params.ByName['INE'].AsString := DS.FieldByName('INE').AsString;
                       Q.Params.ByName['PAIS'].AsString := DS.FieldByName('PAIS').AsString;
                       Q.Params.ByName['PROVINCIA'].AsString := DS.FieldByName('PROVINCIA').AsString;

                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg('INS SYS_PROVINCIAS' + #13#10 + e.Message, mtError, [mbOK], 0);
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
                       DataBase := Base_Destino;
                       SQL.Text :=
                          'INSERT INTO SYS_PROVINCIAS                 ' +
                          '(TITULO,CODIGO_TEL,INE,PAIS,PROVINCIA)     ' +
                          'VALUES                                     ' +
                          '(?TITULO,?CODIGO_TEL,?INE,?PAIS,?PROVINCIA)';
                       Q.Params.ByName['TITULO'].AsString := DS.FieldByName('TITULO').AsString;
                       Q.Params.ByName['CODIGO_TEL'].AsString := DS.FieldByName('CODIGO_TEL').AsString;
                       Q.Params.ByName['INE'].AsString := DS.FieldByName('INE').AsString;
                       Q.Params.ByName['PAIS'].AsString := DS.FieldByName('PAIS').AsString;
                       Q.Params.ByName['PROVINCIA'].AsString := DS.FieldByName('PROVINCIA').AsString;

                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg('INS SYS_+PROVINCIAS' + #13#10 + e.Message, mtError, [mbOK], 0);
                       end;
                       FreeHandle;
                    end;
                    FreeAndNil(Q);
                 end;
                 DS.Next;
              end; {while not eof}
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;
  end;
end;

procedure TDMSincronizacionIncidencias.SincronozaSys_Paises(BaseOrigen, Base_Destino: THYDatabase);
var
  Q : THYFIBQuery;
  DS : TFIBDataSet;
begin
  if (not hayerror) then
  begin
     MuestraProgreso('Paises', '', BaseOrigen, Base_Destino);
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := TFIBTransaction.Create(nil);
           try
              with Transaction do
              begin
                 DefaultDatabase := BaseOrigen;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
              end;
              Close;
              DataBase := BaseOrigen;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add('SELECT * FROM SYS_PAISES WHERE ULT_MODIFICACION >= ?ULT_MODIFICACION ORDER BY PAIS');
              Params.ByName['ULT_MODIFICACION'].AsDateTime := UltimaSincronizacion;
              Open;
              while not DS.EOF do
              begin
                 MuestraProgreso('Paises', DS.FieldByName('PAIS').AsString + ' ' + DS.FieldByName('TITULO').AsString, BaseOrigen, Base_Destino);
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := Base_Destino;
                    SQL.Text := 'SELECT COUNT(*) FROM SYS_PAISES WHERE PAIS = ?PAIS';
                    Params.ByName['PAIS'].AsString := DS.FieldByName('PAIS').AsString;
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
                       DataBase := Base_Destino;
                       SQL.Text :=
                          'UPDATE SYS_PAISES SET          ' +
                          'TITULO        = ?TITULO,       ' +
                          'PAIS_C2       = ?PAIS_C2,      ' +
                          'PAIS_N3       = ?PAIS_N3,      ' +
                          'CODIGO_TEL    = ?CODIGO_TEL,   ' +
                          'IDIOMA        = ?IDIOMA,       ' +
                          'PERTENECE_CEE = ?PERTENECE_CEE ' +
                          'WHERE PAIS = ?PAIS             ';
                       Q.Params.ByName['PAIS'].AsString := DS.FieldByName('PAIS').AsString;
                       Q.Params.ByName['TITULO'].AsString := DS.FieldByName('TITULO').AsString;
                       Q.Params.ByName['PAIS_C2'].AsString := DS.FieldByName('PAIS_C2').AsString;
                       Q.Params.ByName['PAIS_N3'].AsString := DS.FieldByName('PAIS_N3').AsString;
                       Q.Params.ByName['CODIGO_TEL'].AsString := DS.FieldByName('CODIGO_TEL').AsString;
                       Q.Params.ByName['IDIOMA'].AsString := DS.FieldByName('IDIOMA').AsString;
                       Q.Params.ByName['PERTENECE_CEE'].AsString := DS.FieldByName('PERTENECE_CEE').AsString;

                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg('INS SYS_PAISES' + #13#10 + e.Message, mtError, [mbOK], 0);
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
                       DataBase := Base_Destino;
                       SQL.Text :=
                          'INSERT INTO SYS_PAISES ' +
                          '(PAIS, TITULO, PAIS_C2, PAIS_N3, CODIGO_TEL, IDIOMA, PERTENECE_CEE)' +
                          'VALUES ' +
                          '(?PAIS, ?TITULO, ?PAIS_C2, ?PAIS_N3, ?CODIGO_TEL, ?IDIOMA, ?PERTENECE_CEE)';
                       Q.Params.ByName['PAIS'].AsString := DS.FieldByName('PAIS').AsString;
                       Q.Params.ByName['TITULO'].AsString := DS.FieldByName('TITULO').AsString;
                       Q.Params.ByName['PAIS_C2'].AsString := DS.FieldByName('PAIS_C2').AsString;
                       Q.Params.ByName['PAIS_N3'].AsString := DS.FieldByName('PAIS_N3').AsString;
                       Q.Params.ByName['CODIGO_TEL'].AsString := DS.FieldByName('CODIGO_TEL').AsString;
                       Q.Params.ByName['IDIOMA'].AsString := DS.FieldByName('IDIOMA').AsString;
                       Q.Params.ByName['PERTENECE_CEE'].AsString := DS.FieldByName('PERTENECE_CEE').AsString;

                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg('INS SYS_PAISES' + #13#10 + e.Message, mtError, [mbOK], 0);
                       end;
                       FreeHandle;
                    end;
                    FreeAndNil(Q);
                 end;
                 DS.Next;
              end; {while not eof}
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;
  end;
end;

procedure TDMSincronizacionIncidencias.SincronozaSys_Tipo_Direcciones(BaseOrigen, Base_Destino: THYDatabase);
var
  Q : THYFIBQuery;
  DS : TFIBDataSet;
begin
  if (not hayerror) then
  begin
     MuestraProgreso('Tipos de Direccion', '', BaseOrigen, Base_Destino);
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := TFIBTransaction.Create(nil);
           try
              with Transaction do
              begin
                 DefaultDatabase := BaseOrigen;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
              end;
              Close;
              DataBase := BaseOrigen;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add('SELECT * FROM SYS_TIPO_DIRECCION WHERE ULT_MODIFICACION >= ?ULT_MODIFICACION ORDER BY TIPO');
              Params.ByName['ULT_MODIFICACION'].AsDateTime := UltimaSincronizacion;
              Open;
              while not DS.EOF do
              begin
                 MuestraProgreso('Tipos de Direccion', DS.FieldByName('TIPO').AsString + ' ' + DS.FieldByName('TITULO').AsString, BaseOrigen, Base_Destino);
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := Base_Destino;
                    SQL.Text := 'SELECT COUNT(*) FROM SYS_TIPO_DIRECCION WHERE TIPO = ?TIPO';
                    Params.ByName['TIPO'].AsString := DS.FieldByName('TIPO').AsString;
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
                       DataBase := Base_Destino;
                       SQL.Text :=
                          'UPDATE SYS_TIPO_DIRECCION SET  ' +
                          'TITULO = ?TITULO ' +
                          'WHERE TIPO = ?TIPO';
                       Q.Params.ByName['TITULO'].AsString := DS.FieldByName('TITULO').AsString;
                       Q.Params.ByName['TIPO'].AsString := DS.FieldByName('TIPO').AsString;

                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg('INS SYS_TIPO_DIRECCION' + #13#10 + e.Message, mtError, [mbOK], 0);
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
                       DataBase := Base_Destino;
                       SQL.Text :=
                          'INSERT INTO SYS_TIPO_DIRECCION ' +
                          '(TIPO, TITULO) ' +
                          'VALUES ' +
                          '(?TIPO, ?TITULO) ';
                       Q.Params.ByName['TIPO'].AsString := DS.FieldByName('TIPO').AsString;
                       Q.Params.ByName['TITULO'].AsString := DS.FieldByName('TITULO').AsString;

                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg('INS SYS_TIPO_DIRECCION' + #13#10 + e.Message, mtError, [mbOK], 0);
                       end;
                       FreeHandle;
                    end;
                    FreeAndNil(Q);
                 end;
                 DS.Next;
              end; {while not eof}
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;
  end;
end;

procedure TDMSincronizacionIncidencias.SincronozaSys_Departamentos(BaseOrigen, Base_Destino: THYDatabase);
var
  Q : THYFIBQuery;
  DS : TFIBDataSet;
begin
  if (not hayerror) then
  begin
     MuestraProgreso('Departamentos', '', BaseOrigen, Base_Destino);
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := TFIBTransaction.Create(nil);
           try
              with Transaction do
              begin
                 DefaultDatabase := BaseOrigen;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
              end;
              Close;
              DataBase := BaseOrigen;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add('SELECT * FROM SYS_DEPARTAMENTOS WHERE ULT_MODIFICACION >= ?ULT_MODIFICACION ORDER BY DEPARTAMENTO');
              Params.ByName['ULT_MODIFICACION'].AsDateTime := UltimaSincronizacion;
              Open;
              while not DS.EOF do
              begin
                 MuestraProgreso('Departamentos', DS.FieldByName('DEPARTAMENTO').AsString + ' ' + DS.FieldByName('TITULO').AsString, BaseOrigen, Base_Destino);
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := Base_Destino;
                    SQL.Text := 'SELECT COUNT(*) FROM SYS_DEPARTAMENTOS WHERE DEPARTAMENTO = ?DEPARTAMENTO';
                    Params.ByName['DEPARTAMENTO'].AsString := DS.FieldByName('DEPARTAMENTO').AsString;
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
                       DataBase := Base_Destino;
                       SQL.Text :=
                          'UPDATE SYS_DEPARTAMENTOS SET  ' +
                          'TITULO = ?TITULO ' +
                          'WHERE DEPARTAMENTO = ?DEPARTAMENTO';
                       Q.Params.ByName['TITULO'].AsString := DS.FieldByName('TITULO').AsString;
                       Q.Params.ByName['DEPARTAMENTO'].AsString := DS.FieldByName('DEPARTAMENTO').AsString;

                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg('UPD SYS_DEPARTAMENTOS' + #13#10 + e.Message, mtError, [mbOK], 0);
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
                       DataBase := Base_Destino;
                       SQL.Text :=
                          'INSERT INTO SYS_DEPARTAMENTOS ' +
                          '(DEPARTAMENTO, TITULO) ' +
                          'VALUES ' +
                          '(?DEPARTAMENTO, ?TITULO) ';
                       Q.Params.ByName['DEPARTAMENTO'].AsString := DS.FieldByName('DEPARTAMENTO').AsString;
                       Q.Params.ByName['TITULO'].AsString := DS.FieldByName('TITULO').AsString;

                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg('INS SYS_DEPARTAMENTOS' + #13#10 + e.Message, mtError, [mbOK], 0);
                       end;
                       FreeHandle;
                    end;
                    FreeAndNil(Q);
                 end;
                 DS.Next;
              end; {while not eof}
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;
  end;
end;

procedure TDMSincronizacionIncidencias.MuestraProgreso(Tabla, Registro: string; BaseOrigen, Base_Destino: THYDatabase);
begin
  if (Registro = '') then
     FSendCorreo.Texto(Format(_('Sincronizando %s con %s' + #13#10 +
        'Ultima Sincronización: %s'),
        [Tabla, BaseOrigen.DBFileName, DateTimeToStr(UltimaSincronizacion)]))
  else
     FSendCorreo.Texto(Format(_('Sincronizando %s con %s' + #13#10 +
        'Ultima Sincronización: %s' + #13#10 +
        'Registro Actual: %s'),
        [Tabla, BaseOrigen.DBFileName,
        DateTimeToStr(UltimaSincronizacion),
        Registro]));
end;

procedure TDMSincronizacionIncidencias.SincronizaDocumentos(Tipo: string; BaseOrigen, Base_Destino: THYDatabase);
var
  Q : THYFIBQuery;
  DS : TFIBDataSet;
  NombreDocumento : string;
begin
  if (not hayerror) then
  begin
     if (Tipo = 'OFC') then
        NombreDocumento := 'Ofertas'
     else
        NombreDocumento := 'Pedidos';
     MuestraProgreso(NombreDocumento, 'Buscando Registros', BaseOrigen, Base_Destino);
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := TFIBTransaction.Create(nil);
           try
              with Transaction do
              begin
                 DefaultDatabase := BaseOrigen;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
              end;
              UniDirectional := True;
              Close;
              DataBase := BaseOrigen;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add('SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, ID_S, FECHA, ' +
                 ' CLIENTE, TERCERO, DIRECCION, SU_REFERENCIA, AGENTE, DTO_PP, DTO_CIAL, ' +
                 ' POR_FINANCIACION, TIPO_PORTES ' +
                 ' FROM GES_CABECERAS_S WHERE EMPRESA=?EMPRESA AND EJERCICIO>=2010 AND (SERIE=''A'' or SERIE=''MA'') AND TIPO=?TIPO AND ULT_MODIFICACION >= ?ULT_MODIFICACION AND ULT_MODIFICACION <= ?TIEMPO_SINCRONIZACION ORDER BY EJERCICIO, SERIE, RIG');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['TIPO'].AsString := Tipo;
              Params.ByName['ULT_MODIFICACION'].AsDateTime := UltimaSincronizacion;
              Params.ByName['TIEMPO_SINCRONIZACION'].AsDateTime := TiempoSincronizacion;
              Open;
              while not DS.EOF do
              begin
                 MuestraProgreso(NombreDocumento, DS.FieldByName('EJERCICIO').AsString + '-' + DS.FieldByName('SERIE').AsString + '/' + DS.FieldByName('RIG').AsString, BaseOrigen, Base_Destino);
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := Base_Destino;
                    SQL.Text := 'SELECT COUNT(*) FROM GES_CABECERAS_S WHERE ID_S=?ID_S';
                    Params.ByName['ID_S'].AsInteger := DS.FieldByName('ID_S').AsInteger;
                    ExecQuery;
                    existe := FieldByName['COUNT'].AsInteger > 0;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
                 {Si existe la oferta, la borro y la vuelvo a insertar}
                 if (existe) then
                 begin
                    Q := THYFIBQuery.Create(nil);
                    with Q do
                    begin
                       Close;
                       DataBase := Base_Destino;
                       SQL.Text := ' UPDATE GES_CABECERAS_S  ' +
                          ' SET ALMACEN=?ALMACEN, FECHA=?FECHA, CLIENTE=?CLIENTE, TERCERO=?TERCERO, ' +
                          ' DIRECCION=?DIRECCION, SU_REFERENCIA=?SU_REFERENCIA, FORMA_PAGO=?FORMA_PAGO, AGENTE=?AGENTE, ' +
                          ' DTO_PP=?DTO_PP, DTO_CIAL=?DTO_CIAL, POR_FINANCIACION=?POR_FINANCIACION, TIPO_PORTES=?TIPO_PORTES ' +
                          ' WHERE ID_S=?ID_S ';

                       Params.ByName['ID_S'].AsInteger := DS.FieldByName('ID_S').AsInteger;
                       Params.ByName['ALMACEN'].AsString := '000'; //DS.FieldByName('ALMACEN').AsString;
                       Params.ByName['FECHA'].AsDateTime := DS.FieldByName('FECHA').AsDateTime;
                       Params.ByName['CLIENTE'].AsInteger := DS.FieldByName('CLIENTE').AsInteger;
                       Params.ByName['TERCERO'].AsInteger := DS.FieldByName('TERCERO').AsInteger;
                       Params.ByName['DIRECCION'].AsInteger := DS.FieldByName('DIRECCION').AsInteger;
                       Params.ByName['SU_REFERENCIA'].AsString := DS.FieldByName('SU_REFERENCIA').AsString;
                       Params.ByName['FORMA_PAGO'].AsString := 'CON'; //DS.FieldByName('FORMA_PAGO').AsString;
                       Params.ByName['AGENTE'].AsInteger := DS.FieldByName('AGENTE').AsInteger;
                       Params.ByName['DTO_PP'].AsFloat := DS.FieldByName('DTO_PP').AsFloat;
                       Params.ByName['DTO_CIAL'].AsFloat := DS.FieldByName('DTO_CIAL').AsFloat;
                       Params.ByName['POR_FINANCIACION'].AsFloat := DS.FieldByName('POR_FINANCIACION').AsFloat;
                       Params.ByName['TIPO_PORTES'].AsInteger := DS.FieldByName('TIPO_PORTES').AsInteger;
                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg('UPD GES_CABECERAS_S (' + Tipo + ')' + #13#10 + e.Message, mtError, [mbOK], 0);
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
                       DataBase := Base_Destino;
                       SQL.Text :=
                          'INSERT INTO GES_CABECERAS_S ' +
                          '(EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, ID_S, ALMACEN, FECHA, ' +
                          ' CLIENTE, TERCERO, DIRECCION, SU_REFERENCIA, FORMA_PAGO, AGENTE, DTO_PP, DTO_CIAL, ' +
                          ' POR_FINANCIACION, ENTRADA, TIPO_PORTES) ' +
                          'VALUES ' +
                          '(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?ID_S, ?ALMACEN, ?FECHA, ' +
                          ' ?CLIENTE, ?TERCERO, ?DIRECCION, ?SU_REFERENCIA, ?FORMA_PAGO, ?AGENTE, ?DTO_PP, ?DTO_CIAL, ' +
                          ' ?POR_FINANCIACION, ?ENTRADA, ?TIPO_PORTES) ';
                       Params.ByName['EMPRESA'].AsInteger := DS.FieldByName('EMPRESA').AsInteger;
                       Params.ByName['EJERCICIO'].AsInteger := DS.FieldByName('EJERCICIO').AsInteger;
                       Params.ByName['CANAL'].AsInteger := DS.FieldByName('CANAL').AsInteger;
                       Params.ByName['SERIE'].AsString := DS.FieldByName('SERIE').AsString;
                       Params.ByName['TIPO'].AsString := DS.FieldByName('TIPO').AsString;
                       Params.ByName['RIG'].AsInteger := DS.FieldByName('RIG').AsInteger;
                       Params.ByName['ID_S'].AsInteger := DS.FieldByName('ID_S').AsInteger;
                       Params.ByName['ALMACEN'].AsString := '000'; //DS.FieldByName('ALMACEN').AsString;
                       Params.ByName['FECHA'].AsDateTime := DS.FieldByName('FECHA').AsDateTime;
                       Params.ByName['CLIENTE'].AsInteger := DS.FieldByName('CLIENTE').AsInteger;
                       Params.ByName['TERCERO'].AsInteger := DS.FieldByName('TERCERO').AsInteger;
                       Params.ByName['DIRECCION'].AsInteger := DS.FieldByName('DIRECCION').AsInteger;
                       Params.ByName['SU_REFERENCIA'].AsString := DS.FieldByName('SU_REFERENCIA').AsString;
                       Params.ByName['FORMA_PAGO'].AsString := 'CON'; //DS.FieldByName('FORMA_PAGO').AsString;
                       Params.ByName['AGENTE'].AsInteger := DS.FieldByName('AGENTE').AsInteger;
                       Params.ByName['DTO_PP'].AsFloat := DS.FieldByName('DTO_PP').AsFloat;
                       Params.ByName['DTO_CIAL'].AsFloat := DS.FieldByName('DTO_CIAL').AsFloat;
                       Params.ByName['POR_FINANCIACION'].AsFloat := DS.FieldByName('POR_FINANCIACION').AsFloat;
                       Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
                       Params.ByName['TIPO_PORTES'].AsInteger := DS.FieldByName('TIPO_PORTES').AsInteger;

                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg('INS GES_CABECERAS_S (' + Tipo + ')' + #13#10 + e.Message, mtError, [mbOK], 0);
                       end;
                       FreeHandle;
                    end;
                    FreeAndNil(Q);
                    if (Tipo = 'OFC') then
                       InsertaGesCabecerasSOFC(DS.FieldByName('ID_S').AsInteger, BaseOrigen, Base_Destino)
                    else
                       InsertaGesCabecerasSPEC(DS.FieldByName('ID_S').AsInteger, BaseOrigen, Base_Destino);
                 end;

                 DS.Next;
              end; {while not eof}
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;

     InsertaGesDetallesS(Tipo, BaseOrigen, Base_Destino);
  end;
end;

procedure TDMSincronizacionIncidencias.InsertaGesCabecerasSOFC(ID: integer; BaseOrigen, Base_Destino: THYDatabase);
var
  Q : THYFIBQuery;
  DS : TFIBDataSet;
begin
  if (not hayerror) then
  begin
     {Como no interesa esta informacion, la invento, para no tener que traerla}
     {Obtengo los datos basicos de la cabecera local e inserto la cabecera de oferta}
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := TFIBTransaction.Create(nil);
           try
              with Transaction do
              begin
                 DefaultDatabase := Base_Destino; //Esta es la base local, la utilizo para averiguar EECS Tipo y RIG
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
              end;
              Close;
              DataBase := Base_Destino;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add('SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG FROM GES_CABECERAS_S WHERE ID_S=?ID_S');
              Params.ByName['ID_S'].AsInteger := ID;
              Open;

              Q := THYFIBQuery.Create(nil);
              with Q do
              begin
                 Close;
                 DataBase := Base_Destino;
                 SQL.Text :=
                    'INSERT INTO GES_CABECERAS_S_OFC ' +
                    '(EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, ID_S, PRESUPUESTO) ' +
                    'VALUES ' +
                    '(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?ID_S, ?PRESUPUESTO) ';
                 Params.ByName['EMPRESA'].AsInteger := DS.FieldByName('EMPRESA').AsInteger;
                 Params.ByName['EJERCICIO'].AsInteger := DS.FieldByName('EJERCICIO').AsInteger;
                 Params.ByName['CANAL'].AsInteger := DS.FieldByName('CANAL').AsInteger;
                 Params.ByName['SERIE'].AsString := DS.FieldByName('SERIE').AsString;
                 Params.ByName['TIPO'].AsString := DS.FieldByName('TIPO').AsString;
                 Params.ByName['RIG'].AsInteger := DS.FieldByName('RIG').AsInteger;
                 Params.ByName['ID_S'].AsInteger := ID;
                 Params.ByName['PRESUPUESTO'].AsInteger := 0; //DS.FieldByName('PRESUPUESTO').AsInteger;

                 try
                    ExecQuery;
                 except
                    on e: Exception do
                       MessageDlg('INS GES_CABECERAS_S_OFC' + #13#10 + e.Message, mtError, [mbOK], 0);
                 end;
                 FreeHandle;
              end;
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;

     {
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := TFIBTransaction.Create(nil);
           try
              with Transaction do
              begin
                 DefaultDatabase := BaseOrigen;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
              end;
              Close;
              DataBase := BaseOrigen;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add('SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, ID_S, PRESUPUESTO FROM GES_CABECERAS_S_OFC WHERE ID_S=?ID_S');
              Params.ByName['ID_S'].AsInteger := ID;
              Open;
              while not DS.EOF do
              begin
                 MuestraProgreso('Ofertas Cabecera', DS.FieldByName('SERIE').AsString + '/' + DS.FieldByName('RIG').AsString, BaseOrigen, Base_Destino);
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := Base_Destino;
                    SQL.Text := 'SELECT COUNT(*) FROM GES_CABECERAS_S_OFC WHERE ID_S=?ID_S';
                    Params.ByName['ID_S'].AsInteger := DS.FieldByName('ID_S').AsInteger;
                    ExecQuery;
                    existe := FieldByName['COUNT'].AsInteger > 0;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
                 //Si existe la oferta, la borro y la vuelvo a insertar
                 if (existe) then
                 begin
                    Q := THYFIBQuery.Create(nil);
                    with Q do
                    begin
                       Close;
                       DataBase := Base_Destino;
                       SQL.Text := 'DELETE FROM GES_CABECERAS_S_OFC WHERE ID_S=?ID_S ';
                       Params.ByName['ID_S'].AsInteger := DS.FieldByName('ID_S').AsInteger;

                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg('DEL GES_CABECERAS_S_OFC' + #13#10 + e.Message, mtError, [mbOK], 0);
                       end;
                       FreeHandle;
                    end;
                    FreeAndNil(Q);
                 end;

                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := Base_Destino;
                    SQL.Text :=
                       'INSERT INTO GES_CABECERAS_S_OFC ' +
                       '(EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, ID_S, PRESUPUESTO) ' +
                       'VALUES ' +
                       '(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?ID_S, ?PRESUPUESTO) ';
                    Params.ByName['EMPRESA'].AsInteger := DS.FieldByName('EMPRESA').AsInteger;
                    Params.ByName['EJERCICIO'].AsInteger := DS.FieldByName('EJERCICIO').AsInteger;
                    Params.ByName['CANAL'].AsInteger := DS.FieldByName('CANAL').AsInteger;
                    Params.ByName['SERIE'].AsString := DS.FieldByName('SERIE').AsString;
                    Params.ByName['TIPO'].AsString := DS.FieldByName('TIPO').AsString;
                    Params.ByName['RIG'].AsInteger := DS.FieldByName('RIG').AsInteger;
                    Params.ByName['ID_S'].AsInteger := DS.FieldByName('ID_S').AsInteger;
                    Params.ByName['PRESUPUESTO'].AsInteger := DS.FieldByName('PRESUPUESTO').AsInteger;

                    try
                       ExecQuery;
                    except
                       on e: Exception do
                          MessageDlg('INS GES_CABECERAS_S_OFC' + #13#10 + e.Message, mtError, [mbOK], 0);
                    end;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
                 DS.Next;
              end; //while not eof
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;
}
  end;
end;

procedure TDMSincronizacionIncidencias.InsertaGesCabecerasSPEC(ID: integer; BaseOrigen, Base_Destino: THYDatabase);
var
  Q : THYFIBQuery;
  DS : TFIBDataSet;
begin
  if (not hayerror) then
  begin
     {Como no interesa esta informacion, la invento, para no tener que traerla}
     {Obtengo los datos basicos de la cabecera local e inserto la cabecera de oferta}
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := TFIBTransaction.Create(nil);
           try
              with Transaction do
              begin
                 DefaultDatabase := Base_Destino; //Esta es la base local, la utilizo para averiguar EECS Tipo y RIG
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
              end;
              Close;
              DataBase := Base_Destino;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add('SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG FROM GES_CABECERAS_S WHERE ID_S=?ID_S');
              Params.ByName['ID_S'].AsInteger := ID;
              Open;

              Q := THYFIBQuery.Create(nil);
              with Q do
              begin
                 Close;
                 DataBase := Base_Destino;
                 SQL.Text :=
                    'INSERT INTO GES_CABECERAS_S_PED ' +
                    '(EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, ID_S, TRANSPORTISTA) ' +
                    'VALUES ' +
                    '(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?ID_S, ?TRANSPORTISTA) ';
                 Params.ByName['EMPRESA'].AsInteger := DS.FieldByName('EMPRESA').AsInteger;
                 Params.ByName['EJERCICIO'].AsInteger := DS.FieldByName('EJERCICIO').AsInteger;
                 Params.ByName['CANAL'].AsInteger := DS.FieldByName('CANAL').AsInteger;
                 Params.ByName['SERIE'].AsString := DS.FieldByName('SERIE').AsString;
                 Params.ByName['TIPO'].AsString := DS.FieldByName('TIPO').AsString;
                 Params.ByName['RIG'].AsInteger := DS.FieldByName('RIG').AsInteger;
                 Params.ByName['ID_S'].AsInteger := ID;
                 Params.ByName['TRANSPORTISTA'].AsInteger := 0; //DS.FieldByName('PRESUPUESTO').AsInteger;

                 try
                    ExecQuery;
                 except
                    on e: Exception do
                       MessageDlg('INS GES_CABECERAS_S_PED' + #13#10 + e.Message, mtError, [mbOK], 0);
                 end;
                 FreeHandle;
              end;
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;
     {
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := TFIBTransaction.Create(nil);
           try
              with Transaction do
              begin
                 DefaultDatabase := BaseOrigen;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
              end;
              Close;
              DataBase := BaseOrigen;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add('SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, ID_S, TRANSPORTISTA FROM GES_CABECERAS_S_PED WHERE ID_S=?ID_S');
              Params.ByName['ID_S'].AsInteger := ID;
              Open;
              while not DS.EOF do
              begin
                 MuestraProgreso('Pedidos Cabecera', DS.FieldByName('SERIE').AsString + '/' + DS.FieldByName('RIG').AsString, BaseOrigen, Base_Destino);
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := Base_Destino;
                    SQL.Text := 'SELECT COUNT(*) FROM GES_CABECERAS_S_PED WHERE ID_S=?ID_S';
                    Params.ByName['ID_S'].AsInteger := DS.FieldByName('ID_S').AsInteger;
                    ExecQuery;
                    existe := FieldByName['COUNT'].AsInteger > 0;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
                 //Si existe la oferta, la borro y la vuelvo a insertar
                 if (existe) then
                 begin
                    Q := THYFIBQuery.Create(nil);
                    with Q do
                    begin
                       Close;
                       DataBase := Base_Destino;
                       SQL.Text := 'DELETE FROM GES_CABECERAS_S_PED WHERE ID_S=?ID_S ';
                       Params.ByName['ID_S'].AsInteger := DS.FieldByName('ID_S').AsInteger;

                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg('DEL GES_CABECERAS_S_PED' + #13#10 + e.Message, mtError, [mbOK], 0);
                       end;
                       FreeHandle;
                    end;
                    FreeAndNil(Q);
                 end;

                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := Base_Destino;
                    SQL.Text :=
                       'INSERT INTO GES_CABECERAS_S_PED ' +
                       '(EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, ID_S, TRANSPORTISTA) ' +
                       'VALUES ' +
                       '(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?ID_S, ?TRANSPORTISTA) ';
                    Params.ByName['EMPRESA'].AsInteger := DS.FieldByName('EMPRESA').AsInteger;
                    Params.ByName['EJERCICIO'].AsInteger := DS.FieldByName('EJERCICIO').AsInteger;
                    Params.ByName['CANAL'].AsInteger := DS.FieldByName('CANAL').AsInteger;
                    Params.ByName['SERIE'].AsString := DS.FieldByName('SERIE').AsString;
                    Params.ByName['TIPO'].AsString := DS.FieldByName('TIPO').AsString;
                    Params.ByName['RIG'].AsInteger := DS.FieldByName('RIG').AsInteger;
                    Params.ByName['ID_S'].AsInteger := DS.FieldByName('ID_S').AsInteger;
                    Params.ByName['TRANSPORTISTA'].AsInteger := DS.FieldByName('TRANSPORTISTA').AsInteger;

                    try
                       ExecQuery;
                    except
                       on e: Exception do
                          MessageDlg('INS GES_CABECERAS_S_PED' + #13#10 + e.Message, mtError, [mbOK], 0);
                    end;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
                 DS.Next;
              end; //while not eof
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;
}
  end;
end;

procedure TDMSincronizacionIncidencias.InsertaGesDetallesS(Tipo: string; BaseOrigen, Base_Destino: THYDatabase);
var
  Q : THYFIBQuery;
  DS : TFIBDataSet;
  NombreDocumento : string;
begin
  if (not hayerror) then
  begin
     if (Tipo = 'OFC') then
        NombreDocumento := 'Ofertas Detalle'
     else
        NombreDocumento := 'Pedidos Detalle';
     MuestraProgreso(NombreDocumento, 'Buscando Registros', BaseOrigen, Base_Destino);
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := TFIBTransaction.Create(nil);
           try
              with Transaction do
              begin
                 DefaultDatabase := BaseOrigen;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
              end;
              UniDirectional := True;
              Close;
              DataBase := BaseOrigen;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add('SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, ID_S, ID_DETALLES_S, ' +
                 ' ALMACEN, TITULO, UNIDADES, PRECIO, DESCUENTO, DESCUENTO_2, DESCUENTO_3, ' +
                 ' PAIS, TIPO_IVA, IVA_INCLUIDO, ORDEN ' +
                 ' FROM GES_DETALLES_S WHERE EMPRESA=?EMPRESA AND EJERCICIO>=2010 AND (SERIE=''A'' or SERIE=''MA'') AND TIPO=?TIPO AND ULT_MODIFICACION>=?ULT_MODIFICACION AND ULT_MODIFICACION <= ?TIEMPO_SINCRONIZACION ORDER BY EJERCICIO, SERIE, RIG, LINEA');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['TIPO'].AsString := Tipo;
              Params.ByName['ULT_MODIFICACION'].AsDateTime := UltimaSincronizacion;
              Params.ByName['TIEMPO_SINCRONIZACION'].AsDateTime := TiempoSincronizacion;
              Open;
              while not DS.EOF do
              begin
                 MuestraProgreso(NombreDocumento, DS.FieldByName('EJERCICIO').AsString + '-' + DS.FieldByName('SERIE').AsString + '/' + DS.FieldByName('RIG').AsString + '.' + DS.FieldByName('LINEA').AsString, BaseOrigen, Base_Destino);
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := Base_Destino;
                    {Pueden borrar y volver a insertar una linea. El ID_DETALLES_S cambia, pero la EECS, Tipo, RIG y linea no}
                    //SQL.Text := 'SELECT COUNT(*) FROM GES_DETALLES_S WHERE ID_DETALLES_S=?ID_DETALLES_S';
                    //Params.ByName['ID_DETALLES_S'].AsInteger := DS.FieldByName('ID_DETALLES_S').AsInteger;
                    SQL.Text := 'SELECT COUNT(*) FROM GES_DETALLES_S WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND SERIE=?SERIE AND TIPO=?TIPO AND RIG=?RIG AND LINEA=?LINEA ';
                    Params.ByName['EMPRESA'].AsInteger := DS.FieldByName('EMPRESA').AsInteger;
                    Params.ByName['EJERCICIO'].AsInteger := DS.FieldByName('EJERCICIO').AsInteger;
                    Params.ByName['CANAL'].AsInteger := DS.FieldByName('CANAL').AsInteger;
                    Params.ByName['SERIE'].AsString := DS.FieldByName('SERIE').AsString;
                    Params.ByName['TIPO'].AsString := DS.FieldByName('TIPO').AsString;
                    Params.ByName['RIG'].AsInteger := DS.FieldByName('RIG').AsInteger;
                    Params.ByName['LINEA'].AsInteger := DS.FieldByName('LINEA').AsInteger;
                    ExecQuery;
                    existe := FieldByName['COUNT'].AsInteger > 0;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
                 {Si existe la linea de la oferta, la borro y la vuelvo a insertar}
                 if (existe) then
                 begin
                    Q := THYFIBQuery.Create(nil);
                    with Q do
                    begin
                       Close;
                       DataBase := Base_Destino;
                       //SQL.Text := 'DELETE FROM GES_DETALLES_S WHERE ID_DETALLES_S=?ID_DETALLES_S ';
                       //Params.ByName['ID_DETALLES_S'].AsInteger := DS.FieldByName('ID_DETALLES_S').AsInteger;
                       SQL.Text := 'DELETE FROM GES_DETALLES_S WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND SERIE=?SERIE AND TIPO=?TIPO AND RIG=?RIG AND LINEA=?LINEA ';
                       Params.ByName['EMPRESA'].AsInteger := DS.FieldByName('EMPRESA').AsInteger;
                       Params.ByName['EJERCICIO'].AsInteger := DS.FieldByName('EJERCICIO').AsInteger;
                       Params.ByName['CANAL'].AsInteger := DS.FieldByName('CANAL').AsInteger;
                       Params.ByName['SERIE'].AsString := DS.FieldByName('SERIE').AsString;
                       Params.ByName['TIPO'].AsString := DS.FieldByName('TIPO').AsString;
                       Params.ByName['RIG'].AsInteger := DS.FieldByName('RIG').AsInteger;
                       Params.ByName['LINEA'].AsInteger := DS.FieldByName('LINEA').AsInteger;

                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg('DEL GES_DETALLES_S (OFC)' + #13#10 + e.Message, mtError, [mbOK], 0);
                       end;
                       FreeHandle;
                    end;
                    FreeAndNil(Q);
                 end;

                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := Base_Destino;
                    SQL.Text :=
                       'INSERT INTO GES_DETALLES_S ' +
                       '(EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, ID_S, ID_DETALLES_S, ' +
                       ' ALMACEN, ARTICULO, TITULO, UNIDADES, PRECIO, DESCUENTO, DESCUENTO_2, DESCUENTO_3, ' +
                       ' PAIS, TIPO_IVA, ENTRADA, IVA_INCLUIDO, ORDEN, TIPO_LINEA ) ' +
                       'VALUES ' +
                       '(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?LINEA, ?ID_S, ?ID_DETALLES_S, ' +
                       ' ?ALMACEN, ?ARTICULO, ?TITULO, ?UNIDADES, ?PRECIO, ?DESCUENTO, ?DESCUENTO_2, ?DESCUENTO_3, ' +
                       ' ?PAIS, ?TIPO_IVA, ?ENTRADA, ?IVA_INCLUIDO, ?ORDEN, ?TIPO_LINEA ) ';
                    Params.ByName['EMPRESA'].AsInteger := DS.FieldByName('EMPRESA').AsInteger;
                    Params.ByName['EJERCICIO'].AsInteger := DS.FieldByName('EJERCICIO').AsInteger;
                    Params.ByName['CANAL'].AsInteger := DS.FieldByName('CANAL').AsInteger;
                    Params.ByName['SERIE'].AsString := DS.FieldByName('SERIE').AsString;
                    Params.ByName['TIPO'].AsString := DS.FieldByName('TIPO').AsString;
                    Params.ByName['RIG'].AsInteger := DS.FieldByName('RIG').AsInteger;
                    Params.ByName['LINEA'].AsInteger := DS.FieldByName('LINEA').AsInteger;
                    Params.ByName['ID_S'].AsInteger := DS.FieldByName('ID_S').AsInteger;
                    Params.ByName['ID_DETALLES_S'].AsInteger := DS.FieldByName('ID_DETALLES_S').AsInteger;
                    Params.ByName['ALMACEN'].AsString := '000'; //DS.FieldByName('ALMACEN').AsString;
                    Params.ByName['ARTICULO'].AsString := '.'; //DS.FieldByName('ARTICULO').AsString;
                    Params.ByName['TITULO'].AsString := DS.FieldByName('TITULO').AsString;
                    Params.ByName['UNIDADES'].AsFloat := DS.FieldByName('UNIDADES').AsFloat;
                    Params.ByName['PRECIO'].AsFloat := DS.FieldByName('PRECIO').AsFloat;
                    Params.ByName['DESCUENTO'].AsFloat := DS.FieldByName('DESCUENTO').AsFloat;
                    Params.ByName['DESCUENTO_2'].AsFloat := DS.FieldByName('DESCUENTO_2').AsFloat;
                    Params.ByName['DESCUENTO_3'].AsFloat := DS.FieldByName('DESCUENTO_3').AsFloat;
                    Params.ByName['PAIS'].AsString := DS.FieldByName('PAIS').AsString;
                    Params.ByName['TIPO_IVA'].AsInteger := DS.FieldByName('TIPO_IVA').AsInteger;
                    Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada; //DS.FieldByName('ENTRADA').AsInteger;
                    Params.ByName['IVA_INCLUIDO'].AsInteger := DS.FieldByName('IVA_INCLUIDO').AsInteger;
                    Params.ByName['ORDEN'].AsInteger := DS.FieldByName('ORDEN').AsInteger;
                    Params.ByName['TIPO_LINEA'].AsString := 'NOR'; //DS.FieldByName('TIPO_LINEA').AsString;

                    try
                       ExecQuery;
                    except
                       on e: Exception do
                          MessageDlg('INS GES_DETALLES_S (OFC)' + #13#10 + e.Message, mtError, [mbOK], 0);
                    end;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
                 if (Tipo = 'OFC') then
                    InsertaGesDetallesSOFC(DS.FieldByName('ID_DETALLES_S').AsInteger, BaseOrigen, Base_Destino)
                 else
                    InsertaGesDetallesSPEC(DS.FieldByName('ID_DETALLES_S').AsInteger, BaseOrigen, Base_Destino);

                 DS.Next;
              end; {while not eof}
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;
  end;
end;

procedure TDMSincronizacionIncidencias.InsertaGesDetallesSOFC(ID: integer; BaseOrigen, Base_Destino: THYDatabase);
var
  Q : THYFIBQuery;
  DS : TFIBDataSet;
begin
  if (not hayerror) then
  begin
     {Como no interesa esta informacion, la invento, para no tener que traerla}
     {Obtengo los datos basicos de la cabecera local e inserto la cabecera de oferta}
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := TFIBTransaction.Create(nil);
           try
              with Transaction do
              begin
                 DefaultDatabase := Base_Destino; //Esta es la base local, la utilizo para averiguar EECS Tipo y RIG
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
              end;
              Close;
              DataBase := Base_Destino;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add('SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA FROM GES_DETALLES_S WHERE ID_DETALLES_S=?ID_DETALLES_S');
              Params.ByName['ID_DETALLES_S'].AsInteger := ID;
              Open;

              Q := THYFIBQuery.Create(nil);
              with Q do
              begin
                 Close;
                 DataBase := Base_Destino;
                 SQL.Text :=
                    'INSERT INTO GES_DETALLES_S_OFC ' +
                    '(EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, ID_DETALLES_S, ' +
                    ' TIPO_UNIDAD_LOGISTICA, UNIDADES_LOGISTICAS) ' +
                    'VALUES ' +
                    '(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?LINEA, ?ID_DETALLES_S, ' +
                    ' ?TIPO_UNIDAD_LOGISTICA, ?UNIDADES_LOGISTICAS ) ';
                 Params.ByName['EMPRESA'].AsInteger := DS.FieldByName('EMPRESA').AsInteger;
                 Params.ByName['EJERCICIO'].AsInteger := DS.FieldByName('EJERCICIO').AsInteger;
                 Params.ByName['CANAL'].AsInteger := DS.FieldByName('CANAL').AsInteger;
                 Params.ByName['SERIE'].AsString := DS.FieldByName('SERIE').AsString;
                 Params.ByName['TIPO'].AsString := DS.FieldByName('TIPO').AsString;
                 Params.ByName['RIG'].AsInteger := DS.FieldByName('RIG').AsInteger;
                 Params.ByName['LINEA'].AsInteger := DS.FieldByName('LINEA').AsInteger;
                 Params.ByName['ID_DETALLES_S'].AsInteger := ID; //DS.FieldByName('ID_DETALLES_S').AsInteger;
                 Params.ByName['TIPO_UNIDAD_LOGISTICA'].AsString := ''; //DS.FieldByName('TIPO_UNIDAD_LOGISTICA').AsString;
                 Params.ByName['UNIDADES_LOGISTICAS'].AsFloat := 0; //DS.FieldByName('UNIDADES_LOGISTICAS').AsFloat;
                 try
                    ExecQuery;
                 except
                    on e: Exception do
                       MessageDlg('INS GES_DETALLES_S_OFC' + #13#10 + e.Message, mtError, [mbOK], 0);
                 end;
                 FreeHandle;
              end;
              FreeAndNil(Q);
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;
     {
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := TFIBTransaction.Create(nil);
           try
              with Transaction do
              begin
                 DefaultDatabase := BaseOrigen;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
              end;
              Close;
              DataBase := BaseOrigen;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add('SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, ID_DETALLES_S '+
                       ' FROM GES_DETALLES_S_OFC WHERE ID_DETALLES_S=?ID_DETALLES_S');
              Params.ByName['ID_DETALLES_S'].AsInteger := ID;
              Open;
              while not DS.EOF do
              begin
                 MuestraProgreso('Ofertas Detalle', DS.FieldByName('SERIE').AsString + '/' + DS.FieldByName('RIG').AsString + '.' + DS.FieldByName('LINEA').AsString, BaseOrigen, Base_Destino);
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := Base_Destino;
                    SQL.Text := 'SELECT COUNT(*) FROM GES_DETALLES_S_OFC WHERE ID_DETALLES_S=?ID_DETALLES_S';
                    Params.ByName['ID_DETALLES_S'].AsInteger := DS.FieldByName('ID_DETALLES_S').AsInteger;
                    ExecQuery;
                    existe := FieldByName['COUNT'].AsInteger > 0;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
                 //Si existe la linea de la oferta, la borro y la vuelvo a insertar
                 if (existe) then
                 begin
                    Q := THYFIBQuery.Create(nil);
                    with Q do
                    begin
                       Close;
                       DataBase := Base_Destino;
                       SQL.Text := 'DELETE FROM GES_DETALLES_S_OFC WHERE ID_DETALLES_S=?ID_DETALLES_S ';
                       Params.ByName['ID_DETALLES_S'].AsInteger := DS.FieldByName('ID_DETALLES_S').AsInteger;

                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg('DEL GES_DETALLES_S_OFC' + #13#10 + e.Message, mtError, [mbOK], 0);
                       end;
                       FreeHandle;
                    end;
                    FreeAndNil(Q);
                 end;

                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := Base_Destino;
                    SQL.Text :=
                       'INSERT INTO GES_DETALLES_S_OFC ' +
                       '(EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, ID_DETALLES_S, '+
                       ' TIPO_UNIDAD_LOGISTICA, UNIDADES_LOGISTICAS) ' +
                       'VALUES ' +
                       '(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?LINEA, ?ID_DETALLES_S, ' +
                       ' ?TIPO_UNIDAD_LOGISTICA, ?UNIDADES_LOGISTICAS ) ';
                    Params.ByName['EMPRESA'].AsInteger := DS.FieldByName('EMPRESA').AsInteger;
                    Params.ByName['EJERCICIO'].AsInteger := DS.FieldByName('EJERCICIO').AsInteger;
                    Params.ByName['CANAL'].AsInteger := DS.FieldByName('CANAL').AsInteger;
                    Params.ByName['SERIE'].AsString := DS.FieldByName('SERIE').AsString;
                    Params.ByName['TIPO'].AsString := DS.FieldByName('TIPO').AsString;
                    Params.ByName['RIG'].AsInteger := DS.FieldByName('RIG').AsInteger;
                    Params.ByName['LINEA'].AsInteger := DS.FieldByName('LINEA').AsInteger;
                    Params.ByName['ID_DETALLES_S'].AsInteger := DS.FieldByName('ID_DETALLES_S').AsInteger;
                    Params.ByName['TIPO_UNIDAD_LOGISTICA'].AsString := ''; //DS.FieldByName('TIPO_UNIDAD_LOGISTICA').AsString;
                    Params.ByName['UNIDADES_LOGISTICAS'].AsFloat := 0; //DS.FieldByName('UNIDADES_LOGISTICAS').AsFloat;

                    try
                       ExecQuery;
                    except
                       on e: Exception do
                          MessageDlg('INS GES_DETALLES_S_OFC' + #13#10 + e.Message, mtError, [mbOK], 0);
                    end;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);

                 DS.Next;
              end; //while not eof
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;
}
  end;
end;

procedure TDMSincronizacionIncidencias.InsertaGesDetallesSPEC(ID: integer; BaseOrigen, Base_Destino: THYDatabase);
var
  Q : THYFIBQuery;
  DS : TFIBDataSet;
begin
  if (not hayerror) then
  begin
     {Como no interesa esta informacion, la invento, para no tener que traerla}
     {Obtengo los datos basicos de la cabecera local e inserto la cabecera de oferta}
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := TFIBTransaction.Create(nil);
           try
              with Transaction do
              begin
                 DefaultDatabase := Base_Destino; //Esta es la base local, la utilizo para averiguar EECS Tipo y RIG
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
              end;
              Close;
              DataBase := Base_Destino;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add('SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, ID_S FROM GES_DETALLES_S WHERE ID_DETALLES_S=?ID_DETALLES_S');
              Params.ByName['ID_DETALLES_S'].AsInteger := ID;
              Open;

              Q := THYFIBQuery.Create(nil);
              with Q do
              begin
                 Close;
                 DataBase := Base_Destino;
                 SQL.Text :=
                    'INSERT INTO GES_DETALLES_S_PED ' +
                    '(EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, ID_S, ID_DETALLES_S, ' +
                    ' DIRECCION_ENTREGA, TIPO_UNIDAD_LOGISTICA, UNIDADES_LOGISTICAS) ' +
                    'VALUES ' +
                    '(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?LINEA, ?ID_S, ?ID_DETALLES_S, ' +
                    ' ?DIRECCION_ENTREGA, ?TIPO_UNIDAD_LOGISTICA, ?UNIDADES_LOGISTICAS ) ';
                 Params.ByName['EMPRESA'].AsInteger := DS.FieldByName('EMPRESA').AsInteger;
                 Params.ByName['EJERCICIO'].AsInteger := DS.FieldByName('EJERCICIO').AsInteger;
                 Params.ByName['CANAL'].AsInteger := DS.FieldByName('CANAL').AsInteger;
                 Params.ByName['SERIE'].AsString := DS.FieldByName('SERIE').AsString;
                 Params.ByName['TIPO'].AsString := DS.FieldByName('TIPO').AsString;
                 Params.ByName['RIG'].AsInteger := DS.FieldByName('RIG').AsInteger;
                 Params.ByName['LINEA'].AsInteger := DS.FieldByName('LINEA').AsInteger;
                 Params.ByName['ID_S'].AsInteger := DS.FieldByName('ID_S').AsInteger;
                 Params.ByName['ID_DETALLES_S'].AsInteger := ID;
                 Params.ByName['DIRECCION_ENTREGA'].AsInteger := 0; //DS.FieldByName('DIRECCION_ENTREGA').AsInteger;
                 Params.ByName['TIPO_UNIDAD_LOGISTICA'].AsString := ''; //DS.FieldByName('TIPO_UNIDAD_LOGISTICA').AsString;
                 Params.ByName['UNIDADES_LOGISTICAS'].AsFloat := 0; //DS.FieldByName('UNIDADES_LOGISTICAS').AsFloat;
                 try
                    ExecQuery;
                 except
                    on e: Exception do
                       MessageDlg('INS GES_DETALLES_S_PED' + #13#10 + e.Message, mtError, [mbOK], 0);
                 end;
                 FreeHandle;
              end;
              FreeAndNil(Q);
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;
     {
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := TFIBTransaction.Create(nil);
           try
              with Transaction do
              begin
                 DefaultDatabase := BaseOrigen;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
              end;
              Close;
              DataBase := BaseOrigen;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Add('SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, ID_S, ID_DETALLES_S, '+
                       ' DIRECCION_ENTREGA '+
                       ' FROM GES_DETALLES_S_PED WHERE ID_DETALLES_S=?ID_DETALLES_S');
              Params.ByName['ID_DETALLES_S'].AsInteger := ID;
              Open;
              while not DS.EOF do
              begin
                 MuestraProgreso('Pedidos Detalle', DS.FieldByName('SERIE').AsString + '/' + DS.FieldByName('RIG').AsString + '.' + DS.FieldByName('LINEA').AsString, BaseOrigen, Base_Destino);
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := Base_Destino;
                    SQL.Text := 'SELECT COUNT(*) FROM GES_DETALLES_S_PED WHERE ID_DETALLES_S=?ID_DETALLES_S';
                    Params.ByName['ID_DETALLES_S'].AsInteger := DS.FieldByName('ID_DETALLES_S').AsInteger;
                    ExecQuery;
                    existe := FieldByName['COUNT'].AsInteger > 0;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);
                 //Si existe la linea del pedido, la borro y la vuelvo a insertar
                 if (existe) then
                 begin
                    Q := THYFIBQuery.Create(nil);
                    with Q do
                    begin
                       Close;
                       DataBase := Base_Destino;
                       SQL.Text := 'DELETE FROM GES_DETALLES_S_PED WHERE ID_DETALLES_S=?ID_DETALLES_S ';
                       Params.ByName['ID_DETALLES_S'].AsInteger := DS.FieldByName('ID_DETALLES_S').AsInteger;

                       try
                          ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg('DEL GES_DETALLES_S_PED' + #13#10 + e.Message, mtError, [mbOK], 0);
                       end;
                       FreeHandle;
                    end;
                    FreeAndNil(Q);
                 end;

                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Close;
                    DataBase := Base_Destino;
                    SQL.Text :=
                       'INSERT INTO GES_DETALLES_S_PED ' +
                       '(EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, ID_S, ID_DETALLES_S, '+
                       ' DIRECCION_ENTREGA, TIPO_UNIDAD_LOGISTICA, UNIDADES_LOGISTICAS) ' +
                       'VALUES ' +
                       '(?EMPRESA, ?EJERCICIO, ?CANAL, ?SERIE, ?TIPO, ?RIG, ?LINEA, ?ID_S, ?ID_DETALLES_S, ' +
                       ' ?DIRECCION_ENTREGA, ?TIPO_UNIDAD_LOGISTICA, ?UNIDADES_LOGISTICAS ) ';
                    Params.ByName['EMPRESA'].AsInteger := DS.FieldByName('EMPRESA').AsInteger;
                    Params.ByName['EJERCICIO'].AsInteger := DS.FieldByName('EJERCICIO').AsInteger;
                    Params.ByName['CANAL'].AsInteger := DS.FieldByName('CANAL').AsInteger;
                    Params.ByName['SERIE'].AsString := DS.FieldByName('SERIE').AsString;
                    Params.ByName['TIPO'].AsString := DS.FieldByName('TIPO').AsString;
                    Params.ByName['RIG'].AsInteger := DS.FieldByName('RIG').AsInteger;
                    Params.ByName['LINEA'].AsInteger := DS.FieldByName('LINEA').AsInteger;
                    Params.ByName['ID_S'].AsInteger := DS.FieldByName('ID_S').AsInteger;
                    Params.ByName['ID_DETALLES_S'].AsInteger := DS.FieldByName('ID_DETALLES_S').AsInteger;
                    Params.ByName['DIRECCION_ENTREGA'].AsInteger := DS.FieldByName('DIRECCION_ENTREGA').AsInteger;
                    Params.ByName['TIPO_UNIDAD_LOGISTICA'].AsString := ''; //DS.FieldByName('TIPO_UNIDAD_LOGISTICA').AsString;
                    Params.ByName['UNIDADES_LOGISTICAS'].AsFloat := 0; //DS.FieldByName('UNIDADES_LOGISTICAS').AsFloat;

                    try
                       ExecQuery;
                    except
                       on e: Exception do
                          MessageDlg('INS GES_DETALLES_S_PED' + #13#10 + e.Message, mtError, [mbOK], 0);
                    end;
                    FreeHandle;
                 end;
                 FreeAndNil(Q);

                 DS.Next;
              end; //while not eof
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;
}
  end;
end;

procedure TDMSincronizacionIncidencias.SincronozaCon_Cuentas_Ges_Age(BaseOrigen, Base_Destino: THYDatabase);
var
  Q : THYFIBQuery;
  DS : TFIBDataSet;
  Cuenta : string;
begin
  if (not hayerror) then
  begin
     MuestraProgreso('Cuentas de Agente', '', BaseOrigen, Base_Destino);
     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := TFIBTransaction.Create(nil);
           try
              with Transaction do
              begin
                 DefaultDatabase := BaseOrigen;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
              end;
              Close;
              DataBase := BaseOrigen;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;

              SelectSQL.Add(' SELECT EMPRESA, EJERCICIO, CANAL, AGENTE, MONEDA, CUENTA_PGC FROM CON_CUENTAS_GES_AGE WHERE EMPRESA = ?EMPRESA AND EJERCICIO>=2010 AND ULT_MODIFICACION >= ?ULT_MODIFICACION AND ULT_MODIFICACION <= ?TIEMPO_SINCRONIZACION ORDER BY EJERCICIO, AGENTE ');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['ULT_MODIFICACION'].AsDateTime := UltimaSincronizacion;
              Params.ByName['TIEMPO_SINCRONIZACION'].AsDateTime := TiempoSincronizacion;
              Open;
              while not DS.EOF do
              begin
                 MuestraProgreso('Cuentas de Agente', DS.FieldByName('AGENTE').AsString, BaseOrigen, Base_Destino);
                 Q := THYFIBQuery.Create(nil);
                 with Q do
                 begin
                    Q.Close;
                    Q.DataBase := Base_Destino;
                    Q.SQL.Text :=
                       ' SELECT COUNT(*) FROM CON_CUENTAS_GES_AGE WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND AGENTE=?AGENTE ';
                    Q.Params.ByName['EMPRESA'].AsInteger := DS.FieldByName('EMPRESA').AsInteger;
                    Q.Params.ByName['EJERCICIO'].AsInteger := DS.FieldByName('EJERCICIO').AsInteger;
                    Q.Params.ByName['CANAL'].AsInteger := DS.FieldByName('CANAL').AsInteger;
                    Q.Params.ByName['AGENTE'].AsInteger := DS.FieldByName('AGENTE').AsInteger;
                    Q.ExecQuery;
                    existe := FieldByName['COUNT'].AsInteger > 0;
                    Q.FreeHandle;
                 end;
                 FreeAndNil(Q);
                 if (existe) then
                 begin
                    Q := THYFIBQuery.Create(nil);
                    with Q do
                    begin
                       Q.Close;
                       Q.DataBase := Base_Destino;
                       Q.SQL.Text :=
                          ' UPDATE CON_CUENTAS_GES_AGE SET ' +
                          ' MONEDA = ?MONEDA ' +
                          ' WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND AGENTE=?AGENTE ';
                       Q.Params.ByName['EMPRESA'].AsInteger := DS.FieldByName('EMPRESA').AsInteger;
                       Q.Params.ByName['EJERCICIO'].AsInteger := DS.FieldByName('EJERCICIO').AsInteger;
                       Q.Params.ByName['CANAL'].AsInteger := DS.FieldByName('CANAL').AsInteger;
                       Q.Params.ByName['AGENTE'].AsInteger := DS.FieldByName('AGENTE').AsInteger;
                       Q.Params.ByName['MONEDA'].AsString := DS.FieldByName('MONEDA').AsString;
                       try
                          Q.ExecQuery;
                       except
                          on e: Exception do
                             MessageDlg(' UPD CON_CUENTAS_GES_AGE ' + #13#10 + e.Message, mtError, [mbOK], 0);
                       end;
                       Q.FreeHandle;
                    end;
                    FreeAndNil(Q);
                 end
                 else
                 begin
                    {Obtengo la cuenta generica de agentes}
                    Q := THYFIBQuery.Create(nil);
                    with Q do
                    begin
                       Q.Close;
                       Q.DataBase := Base_Destino;
                       Q.SQL.Text :=
                          'SELECT CUENTA FROM CON_CUENTAS_GES_AGE WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND AGENTE=1';
                       Q.Params.ByName['EMPRESA'].AsInteger := DS.FieldByName('EMPRESA').AsInteger;
                       Q.Params.ByName['EJERCICIO'].AsInteger := DS.FieldByName('EJERCICIO').AsInteger;
                       Q.Params.ByName['CANAL'].AsInteger := DS.FieldByName('CANAL').AsInteger;
                       Q.ExecQuery;
                       Cuenta := FieldByName['CUENTA'].AsString;
                       Q.FreeHandle;
                    end;
                    FreeAndNil(Q);

                    Q := THYFIBQuery.Create(nil);
                    with Q do
                    begin
                       Q.Close;
                       Q.DataBase := Base_Destino;
                       Q.SQL.Text :=
                          ' INSERT INTO CON_CUENTAS_GES_AGE ' +
                          ' (EMPRESA, EJERCICIO, CANAL, AGENTE, CUENTA, MONEDA, CUENTA_PGC) ' +
                          ' VALUES ' +
                          ' (?EMPRESA, ?EJERCICIO, ?CANAL, ?AGENTE, ?CUENTA, '''', 0) ';
                       Q.Params.ByName['EMPRESA'].AsInteger := DS.FieldByName('EMPRESA').AsInteger;
                       Q.Params.ByName['EJERCICIO'].AsInteger := DS.FieldByName('EJERCICIO').AsInteger;
                       Q.Params.ByName['CANAL'].AsInteger := DS.FieldByName('CANAL').AsInteger;
                       Q.Params.ByName['AGENTE'].AsInteger := DS.FieldByName('AGENTE').AsInteger;
                       Q.Params.ByName['CUENTA'].AsString := Cuenta;
                       try
                          Q.ExecQuery;
                       except
                          //on e: Exception do
                          //   MessageDlg(' INS CON_CUENTAS_GES_AGE ' + #13#10 + e.Message, mtError, [mbOK], 0);
                       end;
                       Q.FreeHandle;
                    end;
                    FreeAndNil(Q);
                 end;
                 DS.Next;
              end; {while not eof}
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;
  end;
end;

end.
