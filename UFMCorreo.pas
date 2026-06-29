unit UFMCorreo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ActnList, Buttons, UFormGest,
  IdMessage, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient,
  IdMessageClient, IdPOP3, IdSocks, IdSMTP, IdEMailAddress, IdNNTP, DB, URecursos,
  rxPlacemnt, NsDBGrid, ULFDBMemo, ULFDBEdit, ULFFormStorage, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc, Clipbrd, FIBDatabase, FIBDataSet, HYFIBQuery,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  IdExplicitTLSClientServerBase, IdSMTPBase, IdAttachmentFile, ULFComboBox;

type
  TFMCorreo = class(TFPEdit)
     PCCorreoDetalle: TLFPageControl;
     TSDestinos: TTabSheet;
     DBGFCorreoDetalle: TDBGridFind2000;
     PNLInfo: TLFPanel;
     LEMail: TLFLabel;
     LNombre: TLFLabel;
     LUsuario: TLFLabel;
     DBEUsuario: TLFDbedit;
     DBENombreCorreo: TLFDbedit;
     DBEDirCorreo: TLFDbedit;
     PNLMsg: TLFPanel;
     MemoMensaje: TLFDBMemo;
     TBAsunto: TLFToolBar;
     PNLSubject: TLFPanel;
     Asunto: TLFLabel;
     DBEAsunto: TLFDbedit;
     ALCorreo: TLFActionList;
     BitBtnATercero: TBitBtn;
     AAddTercero: TAction;
     AAddAgrupacion: TAction;
     BitBtnAAgrup: TBitBtn;
     BitBtnBajaTercero: TBitBtn;
     BitBtnBajaAgrupacion: TBitBtn;
     ABajaTercero: TAction;
     ABajaAgrupacion: TAction;
     TBDetalle: TLFToolBar;
     NavDetalle: THYMNavigator;
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     Mail: TIdMessage;
     TButtSend: TToolButton;
     SMTP: TIdSMTP;
     News: TIdNNTP;
     TSAdjuntos: TTabSheet;
     DBGFAdjuntos: TDBGridFind2000;
     BitBtnAdjuntar: TBitBtn;
     AAdjuntar: TAction;
     TSep1: TToolButton;
     AVisualizarCorreo: TAction;
     AImprimirCorreo: TAction;
     AVisualizarCorreosFiltrados: TAction;
     AImprimirCorreosFiltrados: TAction;
     LFCategoryAction1: TLFCategoryAction;
     AConfRapida: TAction;
     ASep: TAction;
     ASend: TAction;
     LFCategoryAction2: TLFCategoryAction;
     CBVariables: TLFComboBox;
     InsertaVariable: TSpeedButton;
     AAgregaClientesFiltrados: TAction;
     AAgregaTercerosFiltrados: TAction;
     AAgregaProveedoresFiltrados: TAction;
     AAgregaAcreedoresFiltrados: TAction;
     ASendListaCorreo: TAction;
     IdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL;
     procedure MuestraListado(tipo: byte);
     procedure MuestraFiltrado(tipo: byte);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure AAddAgrupacionExecute(Sender: TObject);
     procedure AAddTerceroExecute(Sender: TObject);
     procedure ABajaTerceroExecute(Sender: TObject);
     procedure ABajaAgrupacionExecute(Sender: TObject);
     procedure DBGFCorreoDetalleBeforeColEnter(Sender: TObject; var Continuar: boolean);
     procedure SMTPStatus(axSender: TObject; const axStatus: TIdStatus; const asStatusText: string);
     procedure SMTPWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
     procedure NewsStatus(axSender: TObject; const axStatus: TIdStatus; const asStatusText: string);
     procedure NewsWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: int64);
     procedure NewsWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: int64);
     procedure NewsWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
     procedure NavDetalleClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure NavDetalleBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
     procedure NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure NavDetalleClick(Sender: TObject; Button: TNavigateBtn);
     procedure NavDetalleClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure AAdjuntarExecute(Sender: TObject);
     procedure TSAdjuntosShow(Sender: TObject);
     procedure TSDestinosShow(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure AVisualizarCorreoExecute(Sender: TObject);
     procedure AImprimirCorreoExecute(Sender: TObject);
     procedure AVisualizarCorreosFiltradosExecute(Sender: TObject);
     procedure AImprimirCorreosFiltradosExecute(Sender: TObject);
     procedure AConfRapidaExecute(Sender: TObject);
     procedure ASendExecute(Sender: TObject);
     procedure InsertaVariableClick(Sender: TObject);
     procedure AAgregaTercerosFiltradosExecute(Sender: TObject);
     procedure ASendListaCorreoExecute(Sender: TObject);
     procedure SMTPWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: int64);
     procedure SMTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: int64);
  private
     { Private declarations }
     SWFil: integer;
     SizeAttach: longint;
     function ListasConDatos: boolean;
     procedure NuevoCorreo;
     procedure InitMail;
     procedure RellenaListasMail(var ListaMail: TIdEMailAddressList; Origen: TStrings);
     procedure SetAttachMentMail;
  public
     { Public declarations }
  end;

var
  FMCorreo : TFMCorreo;

implementation

uses UDMCorreo, UDMMain, UFPregAgrupTer, UEntorno, UFInfoCorreo,
  UDMLstCorreo, UFMListConfig, UDMTerceros, UUtiles;

{$R *.DFM}

procedure TFMCorreo.FormCreate(Sender: TObject);
begin
  inherited;
  MemoMensaje.Clear;
  AbreData(TDMCorreo, DMCorreo);
  NavMain.DataSource := DMCorreo.DSQMCorreo;
  NavDetalle.DataSource := DMCorreo.DSQMCorreoDetalle;

  DBGMain.DataSource := DMCorreo.DSQMCorreo;
  DBGFAdjuntos.DataSource := DMCorreo.DSQMCorreoAdjuntos;
  PCCorreoDetalle.ActivePage := TSDestinos;
  NavDetalle.Visible := True;
  SWFil := 0;
  InitMail;

  // Asigno Imagenes a Botones
  GetBitmapFromImageList(BitBtnATercero, 1, DMMain.ILMain_Ac, 54);
  GetBitmapFromImageList(BitBtnAAgrup, 1, DMMain.ILMain_Ac, 4);
  GetBitmapFromImageList(BitBtnBajaTercero, 1, DMMain.ILMain_Ac, 20);
  GetBitmapFromImageList(BitBtnBajaAgrupacion, 1, DMMain.ILMain_Ac, 39);
  GetBitmapFromImageList(BitBtnAdjuntar, 1, DMMain.ILMain_Ac, 59);
  GetBitmapFromImageList(InsertaVariable, 1, DMMain.ILMain_Ac, 25);
end;

procedure TFMCorreo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMCorreo);
end;

procedure TFMCorreo.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if button = nbInsert then
     NuevoCorreo;

  PEdit.Enabled := True;
end;

procedure TFMCorreo.NuevoCorreo;
begin
  DMCorreo.QMCorreo.Post;
  DMCorreo.QMCorreo.Edit;
  MemoMensaje.Clear;

  DMCorreo.QMCorreoDetalle.Insert;
  PEdit.Enabled := True;
  DBGFCorreoDetalle.SetFocus;
end;

procedure TFMCorreo.AAddAgrupacionExecute(Sender: TObject);
var
  Agrupacion, Tipo : string;
  Tercero, modo : integer;
begin
  inherited;

  modo := 0;
  UFPregAgrupTer.DevuelveValor(modo, _('Seleccione Agrupación'), Tercero,
     Agrupacion, Tipo, Self, DMCorreo.QMCorreoRIG.AsInteger);
  if modo <> -1 then
  begin
     if ((Agrupacion = '') or (Tipo = '')) then
        raise Exception.Create(_('Datos incompletos!'));
     DMCorreo.AddAgrupacion(Agrupacion, Tipo);
  end;
end;

procedure TFMCorreo.AAddTerceroExecute(Sender: TObject);
var
  Agrupacion, Tipo : string;
  Tercero, modo : integer;
begin
  inherited;
  modo := 1;
  UFPregAgrupTer.DevuelveValor(modo, _('Seleccione e-mail de un Tercero'),
     Tercero, Agrupacion, Tipo, Self, DMCorreo.QMCorreoRIG.AsInteger);
  if modo <> -1 then
  begin
     if ((Tercero = 0) or (Tipo = '')) then
        raise Exception.Create(_('Datos incompletos!'));
     DMCorreo.AddTercero(Tercero, Tipo);
  end;
end;

procedure TFMCorreo.ABajaTerceroExecute(Sender: TObject);
var
  Agrupacion, Tipo : string;
  Tercero, modo : integer;
begin
  inherited;

  modo := 3;
  UFPregAgrupTer.DevuelveValor(modo, _('Seleccione e-mail de un Tercero para Borrar'),
     Tercero, Agrupacion, Tipo, Self, DMCorreo.QMCorreoRIG.AsInteger);
  if modo <> -1 then
  begin
     if ((Tercero = 0)) then
        raise Exception.Create(_('Datos incompletos!'));
     DMCorreo.SubTercero(Tercero);
  end;
end;

procedure TFMCorreo.ABajaAgrupacionExecute(Sender: TObject);
var
  Agrupacion, Tipo : string;
  Tercero, modo : integer;
begin
  inherited;
  modo := 2;
  UFPregAgrupTer.DevuelveValor(modo, _('Seleccione Agrupación para Borrar'),
     Tercero, Agrupacion, Tipo, Self, DMCorreo.QMCorreoRIG.AsInteger);
  if modo <> -1 then
  begin
     if ((Agrupacion = '')) then
        raise Exception.Create(_('Datos incompletos!'));
     DMCorreo.SubAgrupacion(Agrupacion);
  end;
end;

procedure TFMCorreo.InitMail;
begin
  // Correo
  with SMTP do
  begin
     IOHandler := nil;
     ManagedIOHandler := True;

     Host := REntorno.Smtp;
     Username := REntorno.UserID;
     Password := REntorno.Password;
     Port := REntorno.Port;
     if (Host = 'smtp.gmail.com') then
     begin
        IOHandler := IdSSLIOHandlerSocketOpenSSL;
        UseTLS := utUseExplicitTLS;
        IdSSLIOHandlerSocketOpenSSL.Host := SMTP.Host;
        IdSSLIOHandlerSocketOpenSSL.Port := SMTP.Port;
        IdSSLIOHandlerSocketOpenSSL.SSLOptions.Method := sslvTLSv1;
     end;

     AuthType := satNone;
     if REntorno.Identificacion = True then
     begin
        AuthType := satDefault;
     end;
  end;

  // News
  with News do
  begin
     Host := REntorno.News;
     Username := REntorno.UserIDNews;
     Password := REntorno.PasswordNews;
     Port := REntorno.PortNews;
     ForceAuth := False;
     if REntorno.Identificacion = True then
     begin
        ForceAuth := True;
     end;
  end;

  (* INDY Original Delhi 6
  with SMTP do
  begin
     Host := REntorno.Smtp;
     UserID := REntorno.UserID;
     Password := REntorno.Password;
     Port := REntorno.Port;
     SocksInfo.Authentication := saNoAuthentication;
     AuthenticationType := atNone;
     if REntorno.Identificacion = True then
     begin
        AuthenticationType := atLogin;
        SocksInfo.Authentication := saUsernamePassword;
        SocksInfo.Host := REntorno.Smtp;
        SocksInfo.Password := REntorno.Password;
        SocksInfo.Port := REntorno.Port;
        SocksInfo.UserID := REntorno.UserID;
     end;
  end;

  // News
  with News do
  begin
     Host := REntorno.News;
     UserID := REntorno.UserIDNews;
     Password := REntorno.PasswordNews;
     Port := REntorno.PortNews;
     SocksInfo.Authentication := saNoAuthentication;
     if REntorno.Identificacion = True then
     begin
        SocksInfo.Authentication := saUsernamePassword;
        SocksInfo.Host := REntorno.News;
        SocksInfo.Password := REntorno.PasswordNews;
        SocksInfo.Port := REntorno.PortNews;
        SocksInfo.UserID := REntorno.UserIDNews;
     end;
  end;
*)
end;

procedure TFMCorreo.DBGFCorreoDetalleBeforeColEnter(Sender: TObject; var Continuar: boolean);
begin
  inherited;
  ControlEdit := CEDetalle;
end;

procedure TFMCorreo.RellenaListasMail(var ListaMail: TIdEMailAddressList; Origen: TStrings);
var
  i : integer;
  Item : TIdEMailAddressItem;
begin
  ListaMail.Clear;

  if Origen.Count <> 0 then
     for i := 0 to (Origen.Count - 1) do
     begin
        Item := ListaMail.Add;
        Item.Address := Origen[i];
     end;
end;

function TFMCorreo.ListasConDatos: boolean;
begin
  Result := False;

  with Mail do
  begin
     if CCList.Count <> 0 then
        Result := True;
     if BCCList.Count <> 0 then
        Result := True;
     if Recipients.Count <> 0 then
        Result := True;
  end;
end;

procedure TFMCorreo.SMTPStatus(axSender: TObject; const axStatus: TIdStatus; const asStatusText: string);
begin
  inherited;
  case axStatus of
     hsConnecting: FInfoCorreo.Mensajes.Caption := _('Conectando ...');
     hsConnected: FInfoCorreo.Mensajes.Caption := _('Host Encontrado. Conectado.');
     hsResolving: FInfoCorreo.Mensajes.Caption := _('Resolviendo Host ...');
  end;
  Application.ProcessMessages;
end;

procedure TFMCorreo.SMTPWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: int64);
var
  Total : integer;
begin
  inherited;

  if AWorkCountMax <> 0 then
     Total := AWorkCountMax
  else
     Total := SizeAttach;

  if Total < 100 then
     Total := 100;

  FInfoCorreo.Total := Total;
  FInfoCorreo.Progreso.Max := Total;
  FInfoCorreo.Progreso.Visible := True;
  FInfoCorreo.IProgreso.Visible := True;
  FInfoCorreo.PWork := 1;
  FInfoCorreo.Mensajes.Caption := _('Enviando Mensaje(s) ...');
  FInfoCorreo.IncrementaBarra;
  Application.ProcessMessages;
end;

procedure TFMCorreo.SMTPWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
begin
  inherited;
  FInfoCorreo.PWork := FInfoCorreo.Total;
  FInfoCorreo.IncrementaBarra;
  FInfoCorreo.Mensajes.Caption := _('Mensaje(s) enviado(s) con éxito.');
  Application.ProcessMessages;
end;

procedure TFMCorreo.NewsStatus(axSender: TObject; const axStatus: TIdStatus; const asStatusText: string);
begin
  inherited;

  case axStatus of
     hsConnecting: FInfoCorreo.Mensajes.Caption := _('Conectando ...');
     hsConnected: FInfoCorreo.Mensajes.Caption := _('Host Encontrado. Conectado.');
     hsResolving: FInfoCorreo.Mensajes.Caption := _('Resolviendo Host ...');
  end;

  Application.ProcessMessages;
end;

procedure TFMCorreo.NewsWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: int64);
begin
  inherited;
  FInfoCorreo.PWork := AWorkCount;
  FInfoCorreo.IncrementaBarra;
  Application.ProcessMessages;
end;

procedure TFMCorreo.NewsWorkBegin(ASender: TObject; AWorkMode: TWorkMode; AWorkCountMax: int64);
var
  Total : integer;
begin
  inherited;

  if AWorkCountMax <> 0 then
     Total := AWorkCountMax
  else
     Total := SizeAttach;

  if Total < 100 then
     Total := 100;

  FInfoCorreo.Total := Total;
  FInfoCorreo.Progreso.Max := Total;
  FInfoCorreo.Progreso.Visible := True;
  FInfoCorreo.IProgreso.Visible := True;
  FInfoCorreo.PWork := 1;
  FInfoCorreo.Mensajes.Caption := _('Enviando Mensaje(s) al grupo(s) ...');
  FInfoCorreo.IncrementaBarra;
  Application.ProcessMessages;
end;

procedure TFMCorreo.NewsWorkEnd(Sender: TObject; AWorkMode: TWorkMode);
begin
  inherited;
  FInfoCorreo.PWork := FInfoCorreo.Total;
  FInfoCorreo.IncrementaBarra;
  FInfoCorreo.Mensajes.Caption := _('Mensaje(s) enviado(s) con éxito al grupo(s).');
  Application.ProcessMessages;
end;

procedure TFMCorreo.NavDetalleClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  PEdit.Enabled := True;
end;

procedure TFMCorreo.NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  PEdit.Enabled := True;
  if Button = nbCancel then
     NavMain.SetFocus;
end;

procedure TFMCorreo.NavDetalleBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  PEdit.Enabled := True;
end;

procedure TFMCorreo.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  PEdit.Enabled := True;
end;

procedure TFMCorreo.NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  inherited;
  PEdit.Enabled := True;
end;

procedure TFMCorreo.NavDetalleClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  PEdit.Enabled := True;
end;

procedure TFMCorreo.NavDetalleClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  inherited;
  if Button = nbInsert then
  begin
     if ((DMCorreo.DSQMCorreo.State = dsInsert) or
        (DMCorreo.DSQMCorreo.State = dsEdit)) then
     begin
        DMCorreo.QMCorreo.Post;
     end;
  end;
  PEdit.Enabled := True;
end;

procedure TFMCorreo.AAdjuntarExecute(Sender: TObject);
var
  Size : longint;
  Archivo : string;
  Fichero : file of byte;
begin
  inherited;
  Archivo := '';
  if MyOpenDialog(Archivo, 'PDF,DOC,XLS,ODT,ODS,TXT', '', 'FMCorreo.AAdjuntar') then
  begin
     // Obtener Tamaño del fichero
     AssignFile(Fichero, Archivo);
     try
        Reset(Fichero);
        Size := FileSize(Fichero);
     except
        raise Exception.Create(Format(_('Imposible Abrir Fichero : %s'), [Archivo]));
     end;
     CloseFile(Fichero);
     if ((DMCorreo.DSQMCorreo.State = dsInsert) or
        (DMCorreo.DSQMCorreo.State = dsEdit)) then
        DMCorreo.QMCorreo.Post;

     DMCorreo.InsertaFichero(Archivo, Size);
     PEdit.Enabled := True;
  end;
end;

procedure TFMCorreo.TSAdjuntosShow(Sender: TObject);
begin
  inherited;
  NavDetalle.DataSource := DMCorreo.DSQMCorreoAdjuntos;
  CEDetalle.FichaEdicion := TSAdjuntos;
  NavDetalle.Width := 113;
  NavDetalle.EditaControl := nil;
  NavDetalle.InsertaControl := nil;
  NavDetalle.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbRefresh];
  NavDetalle.Width := 132;
  ControlEdit := CEDetalle;
end;

procedure TFMCorreo.TSDestinosShow(Sender: TObject);
begin
  inherited;
  NavDetalle.DataSource := DMCorreo.DSQMCorreoDetalle;
  CEDetalle.FichaEdicion := TSDestinos;
  NavDetalle.Width := 200;
  NavDetalle.EditaControl := DBGFCorreoDetalle;
  NavDetalle.InsertaControl := DBGFCorreoDetalle;
  NavDetalle.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbInsert,
     nbDelete, nbEdit, nbPost, nbCancel, nbRefresh];
  NavDetalle.Width := 220;
  ControlEdit := CEDetalle;
end;

procedure TFMCorreo.SetAttachMentMail;
var
  ListaAttach : TStrings;
  i : integer;
begin
  ListaAttach := TStringList.Create;
  Mail.MessageParts.Clear;
  SizeAttach := 0;
  DMCorreo.RellenaListaAttach(ListaAttach, SizeAttach);
  if ListaAttach.Count <> 0 then
  begin
     for i := 0 to Pred(ListaAttach.Count) do
        // TIdAttachment.Create(Mail.MessageParts, ListaAttach[i]);
        TIdAttachmentFile.Create(Mail.MessageParts, ListaAttach[i]);
  end;
  ListaAttach.Free;
end;

procedure TFMCorreo.MuestraListado(tipo: byte);
begin
  AbreData(TDMLstCorreo, DMLstCorreo);
  DMLstCorreo.MostrarListado(tipo, DMCorreo.QMCorreo.FieldByName('RIG').AsInteger);
  CierraData(DMLstCorreo);
end;

procedure TFMCorreo.MuestraFiltrado(tipo: byte);
var
  TempSQL, SQLFiltro : TStringList;
begin
  TempSql := TStringList.Create;
  SqlFiltro := TStringList.Create;
  SqlFiltro.AddStrings(DMCorreo.QMCorreo.SelectSQL);
  AbreData(TDMLstCorreo, DMLstCorreo);
  TempSql.AddStrings(DMLstCorreo.xCorreo.SelectSQL);
  DMLstCorreo.xCorreo.Close;
  DMLstCorreo.xCorreo.SelectSQL.Assign(SqlFiltro);
  DMLstCorreo.MostrarListadoFiltrado(tipo, SWFil);
  DMLstCorreo.xCorreo.Close;
  DMLstCorreo.xCorreo.SelectSQL.Assign(TempSQL);
  CierraData(DMLstCorreo);
  SqlFiltro.Free;
  TempSql.Free;
end;

procedure TFMCorreo.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  SWFil := 1;
  DMCorreo.BusquedaCompleja;
  Continua := False;
end;

procedure TFMCorreo.AVisualizarCorreoExecute(Sender: TObject);
begin
  MuestraListado(0);  // Previsualizar
end;

procedure TFMCorreo.AImprimirCorreoExecute(Sender: TObject);
begin
  MuestraListado(1);  // Imprimir
end;

procedure TFMCorreo.AVisualizarCorreosFiltradosExecute(Sender: TObject);
begin
  MuestraFiltrado(0);  // Previsualizar
end;

procedure TFMCorreo.AImprimirCorreosFiltradosExecute(Sender: TObject);
begin
  MuestraFiltrado(1);  // Previsualizar
end;

procedure TFMCorreo.AConfRapidaExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstCorreo, DMLstCorreo);
  TFMListConfig.Create(Self).Muestra(506, formato, cabecera, copias,
     pijama, '', DMLstCorreo.frCorreo);
  CierraData(DMLstCorreo);
end;

procedure TFMCorreo.ASendExecute(Sender: TObject);
var
  error : boolean;
  Lista : TStrings;
  ListaMail : TIdEMailAddressList;
  Cuerpo : TStrings;
  i, j : integer;
  variable : string;
  Linea : string;
  Texto : boolean;
  DS : TFIBDataSet;
  Q : THYFIBQuery;
begin
  inherited;
  with Mail do
  begin
     Clear;
     UseNowForDate := True;

     // Rellena las listas
     BccList.Clear;
     CCList.Clear;
     ReplyTo.Clear;
     NewsGroups.Clear;
     Lista := TStringList.Create;
     ListaMail := TIdEMailAddressList.Create(Self);

     // Correo Ciego
     DMCorreo.RellenaLista(Lista, 'BCC');
     BCCList.Clear;
     RellenaListasMail(ListaMail, Lista);
     BCCList.Assign(ListaMail);

     // Correo Adjunto
     DMCorreo.RellenaLista(Lista, 'CC');
     CCList.Clear;
     RellenaListasMail(ListaMail, Lista);
     CCList.Assign(ListaMail);

     // News o grupos
     DMCorreo.RellenaLista(Lista, 'GROUP');
     NewsGroups.Clear;
     NewsGroups.AddStrings(Lista);

     // Replys
     DMCorreo.RellenaLista(Lista, 'REPLYTO');
     ReplyTo.Clear;
     RellenaListasMail(ListaMail, Lista);
     ReplyTo.Assign(ListaMail);

     // Destinos simples
     ReceiptRecipient.Text := ''; // No pedimos mensaje devuelto
     DMCorreo.RellenaLista(Lista, 'TO');
     Recipients.Clear;
     RellenaListasMail(ListaMail, Lista);
     Recipients.Assign(ListaMail);

     // Rellena Datos Usuario
     From.Address := DBEDirCorreo.Text;
     From.Name := DBENombreCorreo.Text;

     Organization := REntorno.NombreEmpresa;

     // AttachMents
     SetAttachmentMail;

     // Datos del Mensaje
     Subject := DMCorreo.QMCorreoASUNTO.AsString;

     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Transaction := TFIBTransaction.Create(nil);
           try
              with Transaction do
              begin
                 DefaultDatabase := DMMain.DataBase;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
              end;
              Close;
              DataBase := DMMain.DataBase;
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Text := 'SELECT NOMBRE_R_SOCIAL AS NOMBRE,NOMBRE_COMERCIAL,NIF,TELEFONO01,TELEFONO02,TELEFAX FROM SYS_TERCEROS WHERE TERCERO = :TERCERO';
              Params.ByName['TERCERO'].AsInteger := +DMCorreo.QMCorreoDetalleTERCERO.AsInteger;
              Open;
              Cuerpo := TStringList.Create;
              Texto := True;
              for i := 0 to MemoMensaje.Lines.Count - 1 do
              begin
                 linea := '';
                 for j := 1 to Length(MemoMensaje.Lines[i]) do
                 begin
                    if MemoMensaje.Lines[i][j] = '[' then
                       Texto := False
                    else
                    begin
                       if MemoMensaje.Lines[i][j] = ']' then
                       begin
                          Texto := True;
                          Linea := Linea + FieldByName(variable).AsString;
                          variable := '';
                       end
                       else
                       begin
                          if (Texto) then
                          begin
                             Linea := Linea + MemoMensaje.Lines[i][j];
                          end
                          else
                          begin
                             variable := variable + MemoMensaje.Lines[i][j];
                          end;
                       end;
                    end;
                 end;
                 Cuerpo.Add(Linea);
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
     Body.Clear;
     Body.AddStrings(Cuerpo);
     Cuerpo.Free;
  end;

  // Liberamos objetos

  Lista.Free;
  ListaMail.Free;
  error := False;

  if ListasConDatos then
  begin
     FInfoCorreo := TFInfoCorreo.Create(Self);
     FInfoCorreo.ANITempo.Visible := True;
     FInfoCorreo.AniTempo.Active := True;
     FInfoCorreo.Mensajes.Visible := True;
     FInfoCorreo.Show;

     try
        SMTP.Connect;
     except
        ShowMessage(_('Error al intentar realizar la conexión'));
        error := True;
     end;

     if not error then
        try
           SMTP.Send(Mail);
        except
           ShowMessage(_('Error al intentar enviar el mensaje'));
           error := True;
        end;

     if not error then
     begin
        Q := THYFIBQuery.Create(nil);
        try
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'insert into emp_correo_enviado (empresa,rig,usuario,tercero,linea) ' +
                 'select ec.empresa,ec.rig,ec.usuario,ecd.tercero,0 from emp_correo ec ' +
                 'join emp_correo_detalle ecd on ec.empresa=ecd.empresa and ec.rig=ecd.rig ' +
                 'where ec.empresa=' + REntorno.EmpresaStr + ' and ec.rig=' + DMCorreo.QMCorreoDetalleRIG.AsString + ' ' +
                 'and tipo=''TO'' and tercero > 0';
              ExecQuery;
              FreeHandle;
           end;
        finally
           FreeAndNil(Q);
        end;
        FInfoCorreo.BitButtOK.Visible := True;
        FInfoCorreo.Visible := False;
        FInfoCorreo.ShowModal;
     end;

     FInfoCorreo.Free;
     SMTP.Disconnect;
  end;

  error := False;

  if Mail.NewsGroups.Count <> 0 then
  begin
     FInfoCorreo := TFInfoCorreo.Create(Self);
     FInfoCorreo.ANITempo.Visible := True;
     FInfoCorreo.AniTempo.Active := True;
     FInfoCorreo.Mensajes.Visible := True;
     FInfoCorreo.Show;

     try
        News.Connect;
     except
        ShowMessage(_('Error al intentar realizar la conexión'));
        error := True;
     end;

     if not error then
        try
           News.SendMsg(Mail);
        except
           ShowMessage(_('Error al intentar enviar el mensaje al grupo'));
           error := True;
        end;

     if not error then
     begin
        FInfoCorreo.BitButtOK.Visible := True;
        FInfoCorreo.Visible := False;
        FInfoCorreo.ShowModal;
     end;

     FInfoCorreo.Free;
     News.Disconnect;
  end;
end;

procedure TFMCorreo.InsertaVariableClick(Sender: TObject);
var
  TextPtr : PChar;
begin
  inherited;
  if (CBVariables.ItemIndex >= 0) then
  begin
     ClipBoard.Clear;
     { TODO 1 -oDuilio -cMemoryLeak : Donde esta el FreeMem?}
     GetMem(TextPtr, Length(CBVariables.Text) + 3);
     StrPCopy(TextPtr, '[' + CBVariables.Text + ']');
     ClipBoard.SetTextBuf(TextPtr);
     MemoMensaje.PasteFromClipboard;
     CBVariables.ItemIndex := -1;
     CBVariables.Text := _('Variables');
     MemoMensaje.SetFocus;
  end;
end;

procedure TFMCorreo.AAgregaTercerosFiltradosExecute(Sender: TObject);
var
  NoMail : boolean;
begin
  inherited;
  if (DMTerceros <> nil) then
  begin
     DMTerceros.QMTerceros.First;
     NoMail := False;
     while (not DMTerceros.QMTerceros.EOF) do
     begin
        if (DMTerceros.QMTercerosEMAIL.AsString > '') then
           DMCorreo.AddTercero(DMTerceros.QMTercerosTERCERO.AsInteger, 'TO')
        else
           NoMail := True;
        DMTerceros.QMTerceros.Next;
     end;
     if NoMail then
        MessageDlg(_('Algun/os tercero/s no tienen direccion de email'), mtInformation, [mbOK], 0);
  end;
end;

procedure TFMCorreo.ASendListaCorreoExecute(Sender: TObject);
var
  error : boolean;
  Lista : TStrings;
  ListaMail : TIdEMailAddressList;
  Cuerpo : TStrings;
  i, j : integer;
  variable : string;
  Linea : string;
  Texto : boolean;
  DS : TFIBDataSet;
  Q : THYFIBQuery;
begin
  inherited;
  DMCorreo.QMCorreoDetalle.First;
  while not DMCorreo.QMCorreoDetalle.EOF do
  begin
     with Mail do
     begin
        Clear;
        UseNowForDate := True;

        // Rellena las listas
        BccList.Clear;
        CCList.Clear;
        ReplyTo.Clear;
        NewsGroups.Clear;
        Lista := TStringList.Create;
        ListaMail := TIdEMailAddressList.Create(Self);

        // Correo Ciego
        DMCorreo.RellenaLista(Lista, 'BCC');
        BCCList.Clear;
        RellenaListasMail(ListaMail, Lista);
        BCCList.Assign(ListaMail);

        // Correo Adjunto
        DMCorreo.RellenaLista(Lista, 'CC');
        CCList.Clear;
        RellenaListasMail(ListaMail, Lista);
        CCList.Assign(ListaMail);

        // News o grupos
        DMCorreo.RellenaLista(Lista, 'GROUP');
        NewsGroups.Clear;
        NewsGroups.AddStrings(Lista);

        // Replys
        DMCorreo.RellenaLista(Lista, 'REPLYTO');
        ReplyTo.Clear;
        RellenaListasMail(ListaMail, Lista);
        ReplyTo.Assign(ListaMail);

        // Destinos simples
        {    ReceiptRecipient.Text := '';
      DMCorreo.RellenaLista(Lista, 'TO');
      Recipients.Clear;
      RellenaListasMail(ListaMail, Lista);
      Recipients.Assign(ListaMail);
  }
        // Destinos simples
        ReceiptRecipient.Text := ''; // No pedimos mensaje devuelto
        { DMCorreo.RellenaLista(Lista, 'TO');}
        Recipients.EMailAddresses := DMCorreo.QMCorreoDetalleDESTINO_ADRESS.AsString;

        // Rellena Datos Usuario
        From.Address := DBEDirCorreo.Text;
        From.Name := DBENombreCorreo.Text;

        Organization := REntorno.NombreEmpresa;

        // AttachMents
        SetAttachmentMail;

        // Datos del Mensaje
        Subject := DMCorreo.QMCorreoASUNTO.AsString;

        DS := TFIBDataSet.Create(nil);
        try
           with DS do
           begin
              Transaction := TFIBTransaction.Create(nil);
              try
                 with Transaction do
                 begin
                    DefaultDatabase := DMMain.DataBase;
                    TRParams.Clear;
                    TRParams.Add('read_committed');
                    TRParams.Add('read');
                 end;
                 Close;
                 DataBase := DMMain.DataBase;
                 if (not Transaction.InTransaction) then
                    Transaction.StartTransaction;
                 SelectSQL.Text := 'SELECT NOMBRE_R_SOCIAL AS NOMBRE,NOMBRE_COMERCIAL,NIF,TELEFONO01,TELEFONO02,TELEFAX FROM SYS_TERCEROS WHERE TERCERO = :TERCERO';
                 Params.ByName['TERCERO'].AsInteger := +DMCorreo.QMCorreoDetalleTERCERO.AsInteger;
                 Open;
                 Cuerpo := TStringList.Create;
                 Texto := True;
                 for i := 0 to MemoMensaje.Lines.Count - 1 do
                 begin
                    linea := '';
                    for j := 1 to Length(MemoMensaje.Lines[i]) do
                    begin
                       if MemoMensaje.Lines[i][j] = '[' then
                          Texto := False
                       else
                       begin
                          if MemoMensaje.Lines[i][j] = ']' then
                          begin
                             Texto := True;
                             Linea := Linea + FieldByName(variable).AsString;
                             variable := '';
                          end
                          else
                          begin
                             if (Texto) then
                             begin
                                Linea := Linea + MemoMensaje.Lines[i][j];
                             end
                             else
                             begin
                                variable := variable + MemoMensaje.Lines[i][j];
                             end;
                          end;
                       end;
                    end;
                    Cuerpo.Add(Linea);
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
        Body.Clear;
        Body.AddStrings(Cuerpo);
        Cuerpo.Free;
     end;

     // Liberamos objetos
     Lista.Free;
     ListaMail.Free;
     error := False;

     if ListasConDatos then
     begin
        FInfoCorreo := TFInfoCorreo.Create(Self);
        FInfoCorreo.ANITempo.Visible := True;
        FInfoCorreo.AniTempo.Active := True;
        FInfoCorreo.Mensajes.Visible := True;
        FInfoCorreo.Show;

        try
           SMTP.Connect;
        except
           ShowMessage(_('Error al intentar realizar la conexión'));
           error := True;
        end;

        if not error then
           try
              SMTP.Send(Mail);
           except
              ShowMessage(_('Error al intentar enviar el mensaje') + #13#10 + Mail.References);
              error := True;
           end;

        if not error then
        begin
           Q := THYFIBQuery.Create(nil);
           try
              with Q do
              begin
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'insert into emp_correo_enviado (empresa,rig,usuario,tercero,linea) ' +
                    'values (' + REntorno.EmpresaStr + ',' + DMCorreo.QMCorreoDetalleRIG.AsString + ',' +
                    DMCorreo.QMCorreoUSUARIO.AsString + ',' + DMCorreo.QMCorreoDetalleTERCERO.AsString + ',0)';
                 ExecQuery;
                 FreeHandle;
              end;
           finally
              FreeAndNil(Q);
           end;
           {        FInfoCorreo.BitButtOK.Visible := True;
        FInfoCorreo.Visible := False;
        FInfoCorreo.ShowModal;}
        end;

        FInfoCorreo.Free;
        SMTP.Disconnect;
     end;

     error := False;

     if Mail.NewsGroups.Count <> 0 then
     begin
        FInfoCorreo := TFInfoCorreo.Create(Self);
        FInfoCorreo.ANITempo.Visible := True;
        FInfoCorreo.AniTempo.Active := True;
        FInfoCorreo.Mensajes.Visible := True;
        FInfoCorreo.Show;

        try
           News.Connect;
        except
           ShowMessage(_('Error al intentar realizar la conexión'));
           error := True;
        end;

        if not error then
           try
              News.SendMsg(Mail);
           except
              ShowMessage(_('Error al intentar enviar el mensaje al grupo'));
              error := True;
           end;

        if not error then
        begin
           FInfoCorreo.BitButtOK.Visible := True;
           FInfoCorreo.Visible := False;
           FInfoCorreo.ShowModal;
        end;

        FInfoCorreo.Free;
        News.Disconnect;
     end;
     DMCorreo.QMCorreoDetalle.Next;
  end;
end;

procedure TFMCorreo.SMTPWork(ASender: TObject; AWorkMode: TWorkMode; AWorkCount: int64);
begin
  inherited;
  FInfoCorreo.PWork := AWorkCount;
  FInfoCorreo.IncrementaBarra;
  Application.ProcessMessages;
end;

end.
