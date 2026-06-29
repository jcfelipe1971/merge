unit UDMUsuarios;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, DB, FIBDataSet, FIBQuery, FIBTableDataSet, FIBDatabase,
  UFIBModificados, FIBDataSetRO, FIBTableDataSetRO;

type
  TDMUsuarios = class(TDataModule)
     DSQMUsuarios: TDataSource;
     DSxEmpresa: TDataSource;
     QMUsuarios: TFIBTableSet;
     QMUsuariosUSUARIO: TIntegerField;
     QMUsuariosNOMBRE: TFIBStringField;
     QMUsuariosCLAVE: TFIBStringField;
     QMUsuariosNIVEL: TIntegerField;
     QMUsuariosEMPRESA: TIntegerField;
     QMUsuariosEJERCICIO: TIntegerField;
     QMUsuariosICONOS_SIMPLES: TIntegerField;
     QMUsuariosFECHA_TRABAJO: TDateTimeField;
     QMUsuariosCANAL: TIntegerField;
     QMUsuariosMENU_LEFT: TIntegerField;
     QMUsuariosMENU_TOP: TIntegerField;
     DSxUsuariosPerfil: TDataSource;
     QMUsuariosPERFIL: TIntegerField;
     QMUsuariosMODO_CIERRA_FORM: TIntegerField;
     TLocal: THYTransaction;
     QMUsuariosMODO_ENTER: TIntegerField;
     QMUsuariosCOLOR_NAV_ACTIVO: TFloatField;
     QMUsuariosCOLOR_NAV_INACTIVO: TFloatField;
     QMUsuariosCOLOR_MENU_1_ON: TFloatField;
     QMUsuariosCOLOR_MENU_1_OFF: TFloatField;
     QMUsuariosCOLOR_MENU_2_ON: TFloatField;
     QMUsuariosCOLOR_MENU_2_OFF: TFloatField;
     xEmpresa: TFIBDataSetRO;
     xUsuariosPerfil: TFIBDataSetRO;
     xCierraForm: TFIBDataSetRO;
     DSxCierraForm: TDataSource;
     xModoTab: TFIBDataSetRO;
     DSxModoTab: TDataSource;
     xVerLog: TFIBTableSetRO;
     DSxVerLog: TDataSource;
     xVerLogENTRADA: TIntegerField;
     xVerLogF_ENTRADA: TDateTimeField;
     xVerLogF_SALIDA: TDateTimeField;
     QMUsuariosNOMBRE_CORREO: TFIBStringField;
     QMUsuariosDIR_CORREO: TFIBStringField;
     QMUsuariosMEMORIZAR_FECHA: TIntegerField;
     QMUsuariosLENGUA: TFIBStringField;
     QMUsuariosACTIVO: TIntegerField;
     QMUsuariosCOLOR_ENLACE_ACTIVO: TFloatField;
     QMUsuariosMODIFICA_DOC: TIntegerField;
     xModificaDoc: TFIBDataSetRO;
     QMUsuariosSERIE: TFIBStringField;
     QMUsuariosALMACEN: TFIBStringField;
     QMUsuariosDELEGACION: TIntegerField;
     QMUsuariosEDI_HABILIDADO: TIntegerField;
     QMUsuariosCONTABILIDAD_RESTRINGIDA: TIntegerField;
     QMUsuariosALBARAN_RESTRINGIDO: TIntegerField;
     QMUsuariosAGENTE: TIntegerField;
     QMUsuariosCUENTA_NUNCA_CADUCA: TIntegerField;
     QMUsuariosCUENTA_DESHABILITADA: TIntegerField;
     QMUsuariosFECHA_CAMBIO_PASSW: TDateTimeField;
     QMUsuariosDIAS_CADUCIDAD: TIntegerField;
     QMUsuariosRESTRINGIR_IMPORTE_MAX_PEP: TIntegerField;
     TUpdate: THYTransaction;
     QMUsuariosTACTIL: TIntegerField;
     QMUsuariosEMPLEADO: TIntegerField;
     xVerLogUBICACION: TIntegerField;
     xVerLogMAQUINA: TFIBStringField;
     xVerLogLOGIN: TFIBStringField;
     xVerLogNOMBRE: TFIBStringField;
     QMUsuariosRESTRINGIR_AGENTE: TIntegerField;
     QMUsuariosCLAVE_FIRMA: TFIBStringField;
     QMUsuariosFICHERO_FIRMA: TBlobField;
     QMUsuariosPUEDE_FIRMAR: TIntegerField;
     QMUsuariosSMTP_SERVIDOR: TFIBStringField;
     QMUsuariosSMTP_PUERTO: TIntegerField;
     QMUsuariosSMTP_USUARIO: TFIBStringField;
     QMUsuariosSMTP_PASSWORD: TFIBStringField;
     QMUsuariosSMTP_AUTENTIFICAR: TIntegerField;
     QMUsuariosSMTP_TSL: TIntegerField;
     QMUsuariosVER_SOLO_ART_DISPONIBLE: TIntegerField;
     QMUsuariosDATOS_ABIERTOS: TIntegerField;
     QMUsuariosGUARDA_FILTROS: TIntegerField;
     DSQMPermisos: TDataSource;
     QMPermisos: TFIBTableSet;
     QMPermisosUSUARIO: TIntegerField;
     QMPermisosPERMISO: TIntegerField;
     QMPermisosTITULO: TFIBStringField;
     QMPermisosLOGUEAR: TIntegerField;
     QMPermisosALMACENAR: TIntegerField;
     QMPermisosAUTORIZADO: TIntegerField;
     QMUsuariosACCION_INICIO: TFIBStringField;
     QMUsuariosCOLOR_CAMPO_ID: TFloatField;
     xUsuariosWeb: TFIBDataSetRO;
     DSxUsuariosWeb: TDataSource;
     xUsuariosWebUSUARIOID: TFIBStringField;
     xUsuariosWebEMAIL: TFIBStringField;
     xUsuariosWebNOMBRE: TFIBStringField;
     xUsuariosWebTELEFONO: TFIBStringField;
     xUsuariosWebTIPO_USUARIO: TIntegerField;
     xUsuariosWebACEPTAR: TIntegerField;
     xUsuariosWebID_CLIENTE_AGENTE: TIntegerField;
     xUsuariosWebSTOCK: TIntegerField;
     xUsuariosWebVISTA: TFIBStringField;
     xUsuariosWebWEB_EMPRESA: TIntegerField;
     xUsuariosWebWEB_EJERCICIO: TIntegerField;
     xUsuariosWebWEB_CANAL: TIntegerField;
     xUsuariosWebWEB_SERIE: TFIBStringField;
     xUsuariosWebWEB_ALMACEN: TFIBStringField;
     xUsuariosWebWEB_TARIFA: TFIBStringField;
     xUsuariosWebWEB_APLICA_TARIFA: TIntegerField;
     xUsuariosWebUSUARIO: TIntegerField;
     xUsuariosWebID_USUARIO: TIntegerField;
     xUsuariosWebDIRECCION_AMPLIADA: TBlobField;
     xUsuariosWebCONFIGURACION: TIntegerField;
     xUsuariosWebID_EMPLEADO: TIntegerField;
     xUsuariosWebSECCION: TFIBStringField;
     xUsuariosWebHOJA_TRABAJO_VER_MAQUINA: TIntegerField;
     xUsuariosWebIMAGEN: TIntegerField;
     xUsuariosWebTERCERO: TIntegerField;
     xUsuariosWebDIRECCION: TIntegerField;
     QMUsuariosNET2PHONE_EXTENSION: TIntegerField;
     QMUsuariosNET2PHONE_TOKEN: TFIBStringField;
     QMUsuariosCOPIA_OCULTA_CORREO: TStringField;
     procedure DMUsuariosCreate(Sender: TObject);
     procedure QMUsuariosBeforePost(DataSet: TDataSet);
     procedure QMUsuariosNewRecord(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMUsuariosAfterOpen(DataSet: TDataSet);
     procedure QMUsuariosPERFILChange(Sender: TField);
     procedure QMUsuariosAfterPost(DataSet: TDataSet);
     procedure QMUsuariosUSUARIOChange(Sender: TField);
     procedure QMUsuariosMODO_CIERRA_FORMChange(Sender: TField);
     procedure QMUsuariosMODO_ENTERChange(Sender: TField);
     procedure QMUsuariosBeforeClose(DataSet: TDataSet);
     procedure QMUsuariosACTIVOChange(Sender: TField);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
     procedure DameColoresNavegadores(var ColorActivo: TColor; var ColorInactivo: TColor);
     procedure PonColoresNavegadores(ColorActivo, ColorInactivo: TColor);
     procedure PonColorMenuDer(ColorOn, ColorOff: TColor);
     procedure PonColorMenuIzq(ColorOn, ColorOff: TColor);
     procedure DameColorMenuDer(var ColorOn, ColorOff: TColor);
     procedure DameColorMenuIzq(var ColorOn, ColorOff: TColor);
     procedure VerLogFiltrado(Filtro: smallint);
     procedure DameColorEnlaceActivo(var ColorEnlace, ColorCampoID: TColor);
     procedure PonColorEnlaceActivo(ColorEnlace, ColorCampoID: TColor);
     procedure DameRestriccionUser(var PEP, ALP, FCR, FAP, OFC, PEC, ALB, FAC, OFP, OCP: integer);
     procedure GuardaCertificado(const FileName: string);
     procedure FiltroActivos(SoloActivos: boolean);
     procedure ColoresPorDefecto;
  end;

var
  DMUsuarios : TDMUsuarios;

implementation

uses UFormGest, UUtiles, UEntorno, UDMMain, UFBusca, UControlEdit, UDameDato;

{$R *.DFM}

procedure TDMUsuarios.DMUsuariosCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMUsuarios.Open;
end;

procedure TDMUsuarios.QMUsuariosBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'Conta_Usuarios', 'Usuario');
  {Verifico que el almacen exista. Si no existe pongo '   '}
  if (DameTituloAlmacen(QMUsuariosALMACEN.AsString) = '') then
     QMUsuariosALMACEN.AsString := '   ';
  if (DameTituloSerie(QMUsuariosSERIE.AsString) = '') then
     QMUsuariosSERIE.AsString := '';
  if (DameTituloAgente(QMUsuariosAGENTE.AsInteger) = '') then
     QMUsuariosAGENTE.AsInteger := 0;
end;

procedure TDMUsuarios.QMUsuariosNewRecord(DataSet: TDataSet);
begin
  QMUsuariosNIVEL.AsInteger := 0;
  QMUsuariosPERFIL.AsInteger := 0;
  QMUsuariosEMPRESA.AsInteger := REntorno.Empresa;
  QMUsuariosEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMUsuariosSERIE.AsString := '';
  QMUsuariosICONOS_SIMPLES.AsInteger := 0;
  QMUsuariosMODO_CIERRA_FORM.AsInteger := 0;
  QMUsuariosMODO_ENTER.AsInteger := 0;
  QMUsuariosFECHA_TRABAJO.AsDateTime := REntorno.FechaTrab;
  QMUsuariosALMACEN.AsString := '';
  QMUsuariosDELEGACION.AsInteger := 0;
  QMUsuariosCONTABILIDAD_RESTRINGIDA.AsInteger := 0;
  QMUsuariosEDI_HABILIDADO.AsInteger := 0;
  QMUsuariosMODIFICA_DOC.AsInteger := 512;
  QMUsuariosRESTRINGIR_IMPORTE_MAX_PEP.AsInteger := 0;
  QMUsuariosLENGUA.AsString := REntorno.IdiomaCanal;
  QMUsuariosGUARDA_FILTROS.AsInteger := 1;
  QMUsuariosDATOS_ABIERTOS.AsInteger := 1;

  // Asignamos valores caducidad password
  QMUsuariosCUENTA_NUNCA_CADUCA.AsInteger := 1;
  QMUsuariosACTIVO.AsInteger := 1;
  QMUsuariosCUENTA_DESHABILITADA.AsInteger := 0;
  QMUsuariosFECHA_CAMBIO_PASSW.AsDateTime := REntorno.FechaTrab;
  QMUsuariosDIAS_CADUCIDAD.AsInteger := 0;

  ColoresPorDefecto;
end;

procedure TDMUsuarios.VerLogFiltrado(Filtro: smallint);
begin
  with xVerLog do
  begin
     Close;
     Params.ByName['FILTRO'].AsInteger := Filtro;
     Open;
  end;
end;

procedure TDMUsuarios.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMUsuarios.QMUsuariosAfterOpen(DataSet: TDataSet);
begin
  xVerLog.Open;
  xEmpresa.Open;
  xUsuariosPerfil.Open;
  xCierraForm.Open;
  xModoTab.Open;
  QMPermisos.Open;
  xUsuariosWeb.Open;
end;

procedure TDMUsuarios.QMUsuariosPERFILChange(Sender: TField);
begin
  with xUsuariosPerfil do
  begin
     Close;
     Open;
  end;
end;

procedure TDMUsuarios.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMUsuarios, '00000');
end;

procedure TDMUsuarios.DameColoresNavegadores(var ColorActivo: TColor; var ColorInactivo: TColor);
begin
  ColorActivo := QMUsuariosCOLOR_NAV_ACTIVO.AsInteger;
  ColorInactivo := QMUsuariosCOLOR_NAV_INACTIVO.AsInteger;
end;

procedure TDMUsuarios.PonColoresNavegadores(ColorActivo, ColorInactivo: TColor);
begin
  QMUsuariosCOLOR_NAV_ACTIVO.AsInteger := ColorActivo;
  QMUsuariosCOLOR_NAV_INACTIVO.AsInteger := ColorInactivo;
end;

procedure TDMUsuarios.PonColorMenuDer(ColorOn, ColorOff: TColor);
begin
  QMUsuariosCOLOR_MENU_2_ON.AsInteger := ColorOn;
  QMUsuariosCOLOR_MENU_2_OFF.AsInteger := ColorOff;
end;

procedure TDMUsuarios.PonColorMenuIzq(ColorOn, ColorOff: TColor);
begin
  QMUsuariosCOLOR_MENU_1_ON.AsInteger := ColorOn;
  QMUsuariosCOLOR_MENU_1_OFF.AsInteger := ColorOff;
end;

procedure TDMUsuarios.DameColorMenuDer(var ColorOn, ColorOff: TColor);
begin
  ColorOn := QMUsuariosCOLOR_MENU_2_ON.AsInteger;
  ColorOff := QMUsuariosCOLOR_MENU_2_OFF.AsInteger;
end;

procedure TDMUsuarios.DameColorMenuIzq(var ColorOn, ColorOff: TColor);
begin
  ColorOn := QMUsuariosCOLOR_MENU_1_ON.AsInteger;
  ColorOff := QMUsuariosCOLOR_MENU_1_OFF.AsInteger;
end;

procedure TDMUsuarios.QMUsuariosAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);
  if QMUsuariosUSUARIO.AsInteger = REntorno.Usuario then
  begin
     REntorno.ModoEnter := QMUsuariosMODO_ENTER.AsInteger;
     CE_Color_Activo := QMUsuariosCOLOR_NAV_ACTIVO.AsInteger;
     CE_Color_Inactivo := QMUsuariosCOLOR_NAV_INACTIVO.AsInteger;
     CE_Menu_1_Off := QMUsuariosCOLOR_MENU_1_OFF.AsInteger;
     CE_Menu_2_Off := QMUsuariosCOLOR_MENU_2_OFF.AsInteger;
     CE_Menu_1_On := QMUsuariosCOLOR_MENU_1_ON.AsInteger;
     CE_Menu_2_On := QMUsuariosCOLOR_MENU_2_ON.AsInteger;
     REntorno.ColorEnlaceActivo := QMUsuariosCOLOR_ENLACE_ACTIVO.AsInteger;
     REntorno.ColorCampoID := QMUsuariosCOLOR_CAMPO_ID.AsInteger;
     if (QMUsuariosDELEGACION.AsInteger = 1) then
        REntorno.Delegacion := 'S'
     else
        REntorno.Delegacion := 'N';
     REntorno.GuardaFiltros := (QMUsuariosGUARDA_FILTROS.AsInteger = 1);
     REntorno.DatosAbiertos := (QMUsuariosDATOS_ABIERTOS.AsInteger = 1);

     REntorno.Smtp := QMUsuariosSMTP_SERVIDOR.AsString;
     REntorno.UserID := QMUsuariosSMTP_USUARIO.AsString;
     REntorno.Password := QMUsuariosSMTP_PASSWORD.AsString;
     REntorno.Port := QMUsuariosSMTP_PUERTO.AsInteger;
     REntorno.Identificacion := (QMUsuariosSMTP_AUTENTIFICAR.AsInteger = 1);
     REntorno.AutenticacionTLS := (QMUsuariosSMTP_TSL.AsInteger = 1);
  end;
end;

procedure TDMUsuarios.QMUsuariosUSUARIOChange(Sender: TField);
begin
  VerLogFiltrado(0);
end;

procedure TDMUsuarios.QMUsuariosMODO_CIERRA_FORMChange(Sender: TField);
begin
  with xCierraForm do
  begin
     Close;
     Open;
  end;
end;

procedure TDMUsuarios.QMUsuariosMODO_ENTERChange(Sender: TField);
begin
  with xModoTab do
  begin
     Close;
     Open;
  end;
end;

procedure TDMUsuarios.DameColorEnlaceActivo(var ColorEnlace, ColorCampoID: TColor);
begin
  ColorEnlace := QMUsuariosCOLOR_ENLACE_ACTIVO.AsInteger;
  ColorCampoID := QMUsuariosCOLOR_CAMPO_ID.AsInteger;
end;

procedure TDMUsuarios.PonColorEnlaceActivo(ColorEnlace, ColorCampoID: TColor);
begin
  QMUsuariosCOLOR_ENLACE_ACTIVO.AsInteger := ColorEnlace;
  QMUsuariosCOLOR_CAMPO_ID.AsInteger := ColorCampoID;
end;

procedure TDMUsuarios.DameRestriccionUser(var PEP, ALP, FCR, FAP, OFC, PEC, ALB, FAC, OFP, OCP: integer);
var
  cont : integer;
begin
  cont := 0; // Posicion del numero binario
  while cont < 10 do
  begin
     with xModificaDoc do
     begin
        Close;
        Params.ByName['PERMISO'].AsInteger := QMUsuariosMODIFICA_DOC.AsInteger;
        Params.ByName['POSICION'].AsInteger := Cont;
        Open;
        case cont of
           0: FAC := FieldByName('ACTIVO').AsInteger;
           1: ALB := FieldByName('ACTIVO').AsInteger;
           2: PEC := FieldByName('ACTIVO').AsInteger;
           3: OFC := FieldByName('ACTIVO').AsInteger;
           4: FCR := FieldByName('ACTIVO').AsInteger;
           5: FAP := FieldByName('ACTIVO').AsInteger;
           6: ALP := FieldByName('ACTIVO').AsInteger;
           7: PEP := FieldByName('ACTIVO').AsInteger;
           8: OFP := FieldByName('ACTIVO').AsInteger;
           9: OCP := FieldByName('ACTIVO').AsInteger;
        end;
     end;
     cont := cont + 1;
  end;
end;

procedure TDMUsuarios.GuardaCertificado(const FileName: string);
var
  m, f : TStream;
begin
  m := DMUsuarios.QMUsuarios.CreateBlobStream(DMUsuarios.QMUsuariosFICHERO_FIRMA, bmWrite);
  try
     f := TFileStream.Create(FileName, fmOpenRead);
     try
        m.CopyFrom(f, f.Size);
     finally
        f.Free;
     end;
  finally
     m.Free;
  end;
end;

procedure TDMUsuarios.QMUsuariosBeforeClose(DataSet: TDataSet);
begin
  xVerLog.Close;
  xEmpresa.Close;
  xUsuariosPerfil.Close;
  xCierraForm.Close;
  xModoTab.Close;
  QMPermisos.Close;
  xUsuariosWeb.Close;
end;

procedure TDMUsuarios.QMUsuariosACTIVOChange(Sender: TField);
begin
  if (QMUsuariosACTIVO.AsInteger = 0) then
     QMUsuariosCUENTA_DESHABILITADA.AsInteger := 1;
end;

procedure TDMUsuarios.FiltroActivos(SoloActivos: boolean);
begin
  with QMUsuarios do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM SYS_USUARIOS ');
     if SoloActivos then
     begin
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' ACTIVO = 1 ');
     end;
     SelectSQL.Add(' ORDER BY USUARIO ');

     Open;
  end;
end;

procedure TDMUsuarios.ColoresPorDefecto;
begin
  if (QMUsuarios.State in [dsEdit, dsInsert]) then
  begin
     QMUsuariosCOLOR_NAV_ACTIVO.AsFloat := 3275761;
     QMUsuariosCOLOR_NAV_INACTIVO.AsFloat := 12632256;
     QMUsuariosCOLOR_MENU_1_ON.AsFloat := 16744448;
     QMUsuariosCOLOR_MENU_1_OFF.AsFloat := 16777215;
     QMUsuariosCOLOR_MENU_2_ON.AsFloat := 16744448;
     QMUsuariosCOLOR_MENU_2_OFF.AsFloat := 16777215;
     QMUsuariosCOLOR_ENLACE_ACTIVO.AsFloat := 16705138;
     QMUsuariosCOLOR_CAMPO_ID.AsFloat := 15183615;
  end;
end;

end.
