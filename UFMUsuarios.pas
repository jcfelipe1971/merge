unit UFMUsuarios;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, DBCtrls, Spin,
  UDBSpin, Mask, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  DbComboBoxValue, rxPlacemnt, NsDBGrid, ULFEdit, ULFDBCheckBox, ULFDBEdit,
  ULFFormStorage, ActnList, ULFActionList, ULFToolBar, ULFPanel,
  ULFDBEditFind2000, ULFPageControl, TFlatCheckBoxUnit, ULFCheckBox,
  ULFLabel, UG2kTBLoc, rxToolEdit, RXDBCtrl, ULFDBDateEdit, Buttons,
  ULFFIBDBEditFind, ULFDBComboBoxValue;

type
  TFMUsuarios = class(TFPEdit)
     LUsuario: TLFLabel;
     LNombre: TLFLabel;
     LClave: TLFLabel;
     LPerfil: TLFLabel;
     DBEUsuario: TLFDbedit;
     DBENombre: TLFDbedit;
     DBEClave: TLFDbedit;
     DBCBIconosSimples: TLFDBCheckBox;
     PInfo: TLFPanel;
     LFechaTrabajo: TLFLabel;
     LEmpresa: TLFLabel;
     DBEFechaTrabajo: TLFDbedit;
     DBEEmpresa: TLFDbedit;
     DBEEjercicio: TLFDbedit;
     DBETitEmp: TLFDbedit;
     TSLog: TTabSheet;
     DBGLog: THYTDBGrid;
     DBEF2000Perfil: TLFDBEditFind2000;
     DBETituloPerfil: TLFDbedit;
     LModoCF: TLFLabel;
     LModoTab: TLFLabel;
     CEVerLog: TControlEdit;
     CEVerLogPMEdit: TPopUpTeclas;
     LBLColorActivo: TLFLabel;
     LBLColorInactivo: TLFLabel;
     EColorNavActivo: TLFEdit;
     EColorNavInactivo: TLFEdit;
     EColorMenuIzqActivo: TLFEdit;
     EColorMenuDerInactivo: TLFEdit;
     EColorMenuIzqInactivo: TLFEdit;
     EColorMenuDerActivo: TLFEdit;
     LColorMenuIzqAct: TLFLabel;
     LColorMenuIzqInact: TLFLabel;
     LColorMenuDerAct: TLFLabel;
     LColorMenuDerInact: TLFLabel;
     DBEFCierraForm: TLFDBEditFind2000;
     DBETitCierraForm: TLFDbedit;
     DBEFModoTab: TLFDBEditFind2000;
     DBETitModoTab: TLFDbedit;
     LColorEnlaceActivo: TLFLabel;
     EColorEnlaceActivo: TLFEdit;
     TSRestricciones: TTabSheet;
     PNRestriccion: TLFPanel;
     CERestricciones: TControlEdit;
     CERestriccionesPMEdit: TPopUpTeclas;
     TBRestriccion: TLFToolBar;
     NavRestricciones: THYMNavigator;
     PNPermiso: TLFPanel;
     GBDocumentos: TGroupBox;
     LBCompras: TLFLabel;
     LBVentas: TLFLabel;
     CBPedCompras: TLFCheckBox;
     CBAlbCompras: TLFCheckBox;
     CBFacCompras: TLFCheckBox;
     CBOfertasVentas: TLFCheckBox;
     CBFacturasAAcr: TLFCheckBox;
     CBPedidosVentas: TLFCheckBox;
     CBAlbaranesVentas: TLFCheckBox;
     CBFacturasVentas: TLFCheckBox;
     ToolButton1: TToolButton;
     PNLDatosUsuarioRestricciones: TLFPanel;
     DBENumUsuarioRestricciones: TLFDbedit;
     DBENombreUsuarioRestricciones: TLFDbedit;
     LSerieRestringida: TLFLabel;
     LAlmacenRestringido: TLFLabel;
     DBEFSerieRestringida: TLFDBEditFind2000;
     DBEFAlmacenRestringido: TLFDBEditFind2000;
     DBCBDelegacion: TLFDBCheckBox;
     DBCBContabilidadRestringida: TLFDBCheckBox;
     DBCBEDI: TLFDBCheckBox;
     LFDBCheckBox1: TLFDBCheckBox;
     LAgente: TLFLabel;
     DBEFAgente: TLFDBEditFind2000;
     EAgente: TLFEdit;
     TSPermisos: TTabSheet;
     CEPermisos: TControlEdit;
     CEPermisosPMEdit: TPopUpTeclas;
     TBPermisos: TLFToolBar;
     NavPermisos: THYMNavigator;
     TSep1: TToolButton;
     DBENombreUsuarioPermisosTPV: TLFDbedit;
     DBGPermisos: TDBGridFind2000;
     LBLDiasCaducidad: TLFLabel;
     DBEDiasCaducidad: TLFDbedit;
     LBLFechaCambioPassw: TLFLabel;
     DBDTPFechaCambioPassw: TLFDBDateEdit;
     DBCBCuentaNuncaCaduca: TLFDBCheckBox;
     DBCBCuentaDeshabilitada: TLFDBCheckBox;
     DBCBRestriccionLimitePEPKri: TLFDBCheckBox;
     EAlmacenRestringido: TLFEdit;
     ESerieRestringida: TLFEdit;
     DBCBRestriccionPorAgente: TLFDBCheckBox;
     TSFirma: TTabSheet;
     TBFirmaDigital: TLFToolBar;
     NavFirma: THYMNavigator;
     PnFirmas: TLFPanel;
     LClaveFirmaDigital: TLFLabel;
     DBEClaveFirmaDigital: TLFDbedit;
     SBCargaFirmaDigital: TSpeedButton;
     CEFirma: TControlEdit;
     CEFirmaPMEdit: TPopUpTeclas;
     DBCBPuedeFirmar: TLFDBCheckBox;
     PNLDatosUsuarioFirmaDigital: TLFPanel;
     DBENumUsuarioFirmaDigital: TLFDbedit;
     DBENombreUsuarioFirmaDigital: TLFDbedit;
     PNLDatosUsuarioLog: TLFPanel;
     DBENumUsuarioLog: TLFDbedit;
     DBENombreUsuarioLog: TLFDbedit;
     TSep3: TToolButton;
     CBPropuesta: TLFCheckBox;
     CBPropuestaConfirmada: TLFCheckBox;
     TButSep1: TToolButton;
     TButBuscaEntrada: TToolButton;
     TSEmail: TTabSheet;
     LNombreCorreo: TLFLabel;
     DBENombreCorreo: TLFDbedit;
     LEmail: TLFLabel;
     DBEDirCorreo: TLFDbedit;
     LSMTP: TLFLabel;
     LPuertoSMTP: TLFLabel;
     LUsuarioSMTP: TLFLabel;
     LPasswordSMTP: TLFLabel;
     DBEServidorSMTP: TLFDbedit;
     DBEPuertoSMTP: TLFDbedit;
     DBEUsuarioSMTP: TLFDbedit;
     DBEPasswordSMTP: TLFDbedit;
     DBCBAutentificarSMTP: TLFDBCheckBox;
     DBCBCifrarTSL: TLFDBCheckBox;
     TBEmail: TLFToolBar;
     LFPanel1: TLFPanel;
     DBENumUsuarioEmail: TLFDbedit;
     DBENombreUsuarioEmail: TLFDbedit;
     ToolButton4: TToolButton;
     NavEmail: THYMNavigator;
     PNLEmail: TLFPanel;
     CEEmail: TControlEdit;
     CEEmailPMEdit: TPopUpTeclas;
     DBCBVerSoloArticulosDisponibles: TLFDBCheckBox;
     DBCBGuardaFiltros: TLFDBCheckBox;
     DBCBDatosAbiertos: TLFDBCheckBox;
     DBCBAccionInicio: TLFDBComboBoxValue;
     LAccionInicio: TLFLabel;
     LColorCampoID: TLFLabel;
     EColorCampoID: TLFEdit;
     DBCBActivo: TLFDBCheckBox;
     DBCBNivel: TLFDBComboBoxValue;
     LNivel: TLFLabel;
     TSUsuariosWeb: TTabSheet;
     TBUsuariosWeb: TLFToolBar;
     PNLDatosUsuarioUsuariosWeb: TLFPanel;
     DBEUsuariosWebUsuario: TLFDbedit;
     DBEUsuariosWebNombre: TLFDbedit;
     TBSep1: TToolButton;
     NavUsuariosWeb: THYMNavigator;
     PNLUsuariosWeb: TLFPanel;
     DBGUsuariosWeb: THYTDBGrid;
     TSNet2Phone: TTabSheet;
     PNLNet2Phone: TLFPanel;
     LNet2PhoneToken: TLFLabel;
     DBENet2PhoneToken: TLFDbedit;
     TBNet2Phone: TLFToolBar;
     PNLNet2PhoneUsuario: TLFPanel;
     DBENet2PhoneUsuario: TLFDbedit;
     DBENet2PhoneNombre: TLFDbedit;
     TBSep2: TToolButton;
     NavNet2Phone: THYMNavigator;
     DBENet2PhoneExtension: TLFDbedit;
     LNet2PhoneExtension: TLFLabel;
     CENet2Phone: TControlEdit;
     CENet2PhonePMEdit: TPopUpTeclas;
     PNLSoloActivos: TLFPanel;
     CBSoloActivos: TLFCheckBox;
     LCopiaOculta: TLFLabel;
     DBECopiaOculta: TLFDbedit;
     BColoresPorDefecto: TButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure VerLogFiltrado(Sender: TObject);
     procedure TSLogShow(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure TSFichaShow(Sender: TObject);
     procedure TSTablaShow(Sender: TObject);
     procedure EColorNavActivoClick(Sender: TObject);
     procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure EColorNavInactivoClick(Sender: TObject);
     procedure EColorMenuIzqInactivoClick(Sender: TObject);
     procedure EColorMenuIzqActivoClick(Sender: TObject);
     procedure EColorMenuDerActivoClick(Sender: TObject);
     procedure EColorMenuDerInactivoClick(Sender: TObject);
     procedure EColorEnlaceActivoClick(Sender: TObject);
     procedure TSRestriccionesShow(Sender: TObject);
     procedure NavRestriccionesClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure DBGMainDblClick(Sender: TObject);
     procedure DBGMainMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
     procedure DBGMainKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBEFAgenteChange(Sender: TObject);
     procedure DBEFAlmacenRestringidoChange(Sender: TObject);
     procedure DBEFSerieRestringidaChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure SBCargaFirmaDigitalClick(Sender: TObject);
     procedure TSFirmaShow(Sender: TObject);
     procedure TButBuscaEntradaClick(Sender: TObject);
     procedure EColorCampoIDClick(Sender: TObject);
     procedure DBENumUsuarioRestriccionesChange(Sender: TObject);
     procedure CBSoloActivosChange(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure BColoresPorDefectoClick(Sender: TObject);
  private
     { Private declarations }
     Cerrando: boolean;
     procedure FiltroActivos;
  public
     { Public declarations }
     procedure RefrescaColores;
     procedure ModificaDocumentos;
     function DameMarcados: integer;
  end;

var
  FMUsuarios : TFMUsuarios;

implementation

{$R *.DFM}

uses UDMUsuarios, UFormGest, UDMMain, UUtiles, UParam, UFMSeleccion, HYFIBQuery, UFMain, UEntorno, UDameDato;

procedure TFMUsuarios.FormCreate(Sender: TObject);
var
  i : integer;
  TS : TStrings;
begin
  inherited;

  Cerrando := False;

  // Relleno lista de acciones.
  // Para poder ordenarla: "Descripcion de accion" = "Accion"
  // Luego la asigno invertida al combo.
  ts := TStringList.Create;
  try
     for i := 0 to (FMain.ALMain.ActionCount - 1) do
        ts.Values[TAction(FMain.ALMain.Actions[i]).Category + '-' + TAction(FMain.ALMain.Actions[i]).Hint] := TAction(FMain.ALMain.Actions[i]).Name;
     TStringList(ts).Sorted := True;

     with DBCBAccionInicio do
     begin
        Items.Clear;
        Values.Clear;
        Items.Add(_('Sin accion inicial'));
        Values.Add('');
        for i := 0 to ts.Count - 1 do
        begin
           Items.Add(ts.Names[i]);
           Values.Add(ts.Values[ts.Names[i]]);
        end;
     end;
  finally
     ts.Free;
  end;

  AbreData(TDMUsuarios, DMUsuarios);
  NavMain.DataSource := DMUsuarios.DSQMUsuarios;
  DBGMain.DataSource := DMUsuarios.DSQMUsuarios;
  NavPermisos.DataSource := DMUsuarios.DSQMPermisos;
  DBGPermisos.DataSource := DMUsuarios.DSQMPermisos;
  DBGLog.DataSource := DMUsuarios.DSxVerLog;

  RefrescaColores;
  ModificaDocumentos;

  DBCBRestriccionLimitePEPKri.Visible := DMMain.EstadoKri(208) = 1;
  TSFirma.TabVisible := (LeeParametro('MODFIRMAELECTRONICA') = 'S');
  DBCBEDI.Visible := (LeeParametro('MODREST026') = 'S');

  // Color campo ID
  ColorCampoID(DBEUsuario);

  // Asigno Imagenes a Botones
  GetBitmapFromImageList(SBCargaFirmaDigital, 1, DMMain.ILMain_Ac, 49);
end;

procedure TFMUsuarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Cerrando := True;

  inherited;

  CierraData(DMUsuarios);
end;

procedure TFMUsuarios.RefrescaColores;
var
  auxNavActivo, auxNavInactivo : TColor;
begin
  DMUsuarios.DameColoresNavegadores(auxNavActivo, auxNavInactivo);
  EColorNavActivo.Color := auxNavActivo;
  EColorNavInactivo.Color := auxNavInactivo;
  DMUsuarios.DameColorMenuDer(auxNavActivo, auxNavInactivo);
  EColorMenuDerInactivo.Color := auxNavInactivo;
  EColorMenuDeractivo.Color := auxNavactivo;
  DMUsuarios.DameColorMenuIzq(auxNavActivo, auxNavInactivo);
  EColorMenuIzqInactivo.Color := auxNavInactivo;
  EColorMenuIzqActivo.Color := auxNavActivo;
  DMUsuarios.DameColorEnlaceActivo(auxNavActivo, auxNavInactivo);
  EColorEnlaceActivo.Color := auxNavActivo;
  EColorCampoID.Color := auxNavInactivo;
end;

procedure TFMUsuarios.VerLogFiltrado(Sender: TObject);
begin
  DMUsuarios.VerLogFiltrado(TComponent(Sender).Tag);
end;

procedure TFMUsuarios.TSLogShow(Sender: TObject);
begin
  ControlEdit := CEVerLog;
  DBGLog.SetFocus;
end;

procedure TFMUsuarios.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  RefrescaColores;
  ModificaDocumentos;
  BColoresPorDefecto.Visible := (Button in [nbEdit, nbInsert]);
end;

procedure TFMUsuarios.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMUsuarios.BusquedaCompleja;
  Continua := False;
end;

procedure TFMUsuarios.TSFichaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMUsuarios.TSTablaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMUsuarios.EColorNavActivoClick(Sender: TObject);
begin
  EColorNavActivo.Color := DameColor(EColorNavActivo.Color);
end;

procedure TFMUsuarios.NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if (Button = nbPost) then
  begin
     DMUsuarios.PonColoresNavegadores(EColorNavActivo.Color, EColorNavInactivo.Color);
     DMUsuarios.PonColorMenuDer(EColorMenuDerActivo.Color, EColorMenuDerInactivo.Color);
     DMUsuarios.PonColorMenuIzq(EColorMenuIzqActivo.Color, EColorMenuIzqInactivo.Color);
     DMUsuarios.PonColorEnlaceActivo(EColorEnlaceActivo.Color, EColorCampoID.Color);
  end;
end;

procedure TFMUsuarios.EColorNavInactivoClick(Sender: TObject);
begin
  EColorNavInactivo.Color := DameColor(EColorNavInactivo.Color);
end;

procedure TFMUsuarios.EColorMenuIzqInactivoClick(Sender: TObject);
begin
  EColorMenuIzqInactivo.Color := DameColor(EColorMenuIzqInactivo.Color);
end;

procedure TFMUsuarios.EColorMenuIzqActivoClick(Sender: TObject);
begin
  EColorMenuIzqActivo.Color := DameColor(EColorMenuIzqActivo.Color);
end;

procedure TFMUsuarios.EColorMenuDerActivoClick(Sender: TObject);
begin
  EColorMenuDerActivo.Color := DameColor(EColorMenuDerActivo.Color);
end;

procedure TFMUsuarios.EColorMenuDerInactivoClick(Sender: TObject);
begin
  EColorMenuDerInActivo.Color := DameColor(EColorMenuDerInActivo.Color);
end;

procedure TFMUsuarios.EColorEnlaceActivoClick(Sender: TObject);
begin
  EColorEnlaceActivo.Color := DameColor(EColorEnlaceActivo.Color);
end;

procedure TFMUsuarios.TSRestriccionesShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CERestricciones;
end;

procedure TFMUsuarios.ModificaDocumentos;
var
  PEP, ALP, FCR, FAP, OFC, PEC, ALB, FAC, OFP, OCP : integer;
begin
  if not Cerrando then
  begin
     DMUsuarios.DameRestriccionUser(PEP, ALP, FCR, FAP, OFC, PEC, ALB, FAC, OFP, OCP);

     if (PEP = 1) then
        CBPedCompras.State := cbChecked
     else
        CBPedCompras.State := cbUnchecked;

     if (ALP = 1) then
        CBAlbCompras.State := cbChecked
     else
        CBAlbCompras.State := cbUnchecked;

     if (FCR = 1) then
        CBFacturasAAcr.State := cbChecked
     else
        CBFacturasAAcr.State := cbUnchecked;

     if (FAP = 1) then
        CBFacCompras.State := cbChecked
     else
        CBFacCompras.State := cbUnchecked;

     if (OFC = 1) then
        CBOfertasVentas.State := cbChecked
     else
        CBOfertasVentas.State := cbUnchecked;

     if (PEC = 1) then
        CBPedidosVentas.State := cbChecked
     else
        CBPedidosVentas.State := cbUnchecked;

     if (ALB = 1) then
        CBAlbaranesVentas.State := cbChecked
     else
        CBAlbaranesVentas.State := cbUnchecked;

     if (FAC = 1) then
        CBFacturasVentas.State := cbChecked
     else
        CBFacturasVentas.State := cbUnchecked;

     if (OFP = 1) then
        CBPropuesta.State := cbChecked
     else
        CBPropuesta.State := cbUnchecked;

     if (OCP = 1) then
        CBPropuestaConfirmada.State := cbChecked
     else
        CBPropuestaConfirmada.State := cbUnchecked;
  end;
end;

function TFMUsuarios.DameMarcados;
var
  ModificaDoc : integer;
begin
  ModificaDoc := 0;
  if (CBPropuestaConfirmada.State = cbChecked) then
     ModificaDoc := ModificaDoc + 512;
  if (CBPropuesta.State = cbChecked) then
     ModificaDoc := ModificaDoc + 256;
  if (CBPedCompras.State = cbChecked) then
     ModificaDoc := ModificaDoc + 128;
  if (CBAlbCompras.State = cbChecked) then
     ModificaDoc := ModificaDoc + 64;
  if (CBFacCompras.State = cbChecked) then
     ModificaDoc := ModificaDoc + 32;
  if (CBFacturasAAcr.State = cbChecked) then
     ModificaDoc := ModificaDoc + 16;
  if (CBOfertasVentas.State = cbChecked) then
     ModificaDoc := ModificaDoc + 8;
  if (CBPedidosVentas.State = cbChecked) then
     ModificaDoc := ModificaDoc + 4;
  if (CBAlbaranesVentas.State = cbChecked) then
     ModificaDoc := ModificaDoc + 2;
  if (CBFacturasVentas.State = cbChecked) then
     ModificaDoc := ModificaDoc + 1;

  Result := ModificaDoc;
end;

procedure TFMUsuarios.NavRestriccionesClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  inherited;
  if Button = nbPost then
     DMUsuarios.QMUsuariosMODIFICA_DOC.AsInteger := DameMarcados;
end;

procedure TFMUsuarios.DBGMainDblClick(Sender: TObject);
begin
  inherited;
  RefrescaColores;
  ModificaDocumentos;
end;

procedure TFMUsuarios.DBGMainMouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: integer);
begin
  inherited;
  RefrescaColores;
  ModificaDocumentos;
end;

procedure TFMUsuarios.DBGMainKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  RefrescaColores;
  ModificaDocumentos;
end;

procedure TFMUsuarios.DBEFAgenteChange(Sender: TObject);
begin
  inherited;
  EAgente.Text := DameTituloAgente(StrToIntDef(DBEFAgente.Text, 0));
end;

procedure TFMUsuarios.DBEFAlmacenRestringidoChange(Sender: TObject);
begin
  inherited;
  EAlmacenRestringido.Text := DameTituloAlmacen(DBEFAlmacenRestringido.Text);
end;

procedure TFMUsuarios.DBEFSerieRestringidaChange(Sender: TObject);
begin
  inherited;
  ESerieRestringida.Text := DameTituloSerie(DBEFSerieRestringida.Text);
end;

procedure TFMUsuarios.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMUsuarios.SBCargaFirmaDigitalClick(Sender: TObject);
begin
  inherited;
  with TOpenDialog.Create(nil) do
  begin
     try
        Filter := _('Certificados|*.pfx|Todos los archivos|*.*');
        FilterIndex := 1;
        // Posicion inicial en Mis Documentos
        InitialDir := GetSpecialFolderPath(CSIDL_PERSONAL, False);
        Title := _('Carga de Certificado');
        if (Execute) then
        begin
           DMUsuarios.GuardaCertificado(FileName);
           DBCBPuedeFirmar.Checked := True;
        end;
     finally
        Free;
     end;
  end;
end;

procedure TFMUsuarios.TSFirmaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEFirma;
end;

procedure TFMUsuarios.TButBuscaEntradaClick(Sender: TObject);
var
  Entrada, Usuario : integer;
begin
  inherited;
  Entrada := 0;
  if PideDato('INT', Entrada, 'Entrada') then
  begin
     // Obtengo el usuario de la entrada
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT USUARIO FROM SYS_ENTRADAS WHERE ENTRADA = :ENTRADA';
           Params.ByName['ENTRADA'].AsInteger := Entrada;
           ExecQuery;
           Usuario := FieldByName['USUARIO'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;

     // Posiciono en el usuario
     Posicionar(DMUsuarios.QMUsuarios, 'USUARIO', Usuario);
     // Posiciono en el usuario
     Posicionar(DMUsuarios.xVerLog, 'ENTRADA', Entrada);
  end;
end;

procedure TFMUsuarios.EColorCampoIDClick(Sender: TObject);
begin
  inherited;
  EColorCampoID.Color := DameColor(EColorCampoID.Color);
end;

procedure TFMUsuarios.DBENumUsuarioRestriccionesChange(Sender: TObject);
begin
  inherited;
  ModificaDocumentos;
end;

procedure TFMUsuarios.CBSoloActivosChange(Sender: TObject);
begin
  inherited;
  FiltroActivos;
  RefrescaColores;
  ModificaDocumentos;
end;

procedure TFMUsuarios.FormShow(Sender: TObject);
begin
  inherited;
  FiltroActivos;
  RefrescaColores;
  ModificaDocumentos;
end;

procedure TFMUsuarios.FiltroActivos;
begin
  if CBSoloActivos.Checked then
     G2kTableLoc.CondicionBusqueda := 'ACTIVO = 1'
  else
     G2kTableLoc.CondicionBusqueda := '';

  DMUsuarios.FiltroActivos(CBSoloActivos.Checked);
end;

procedure TFMUsuarios.BColoresPorDefectoClick(Sender: TObject);
begin
  inherited;
  DMUsuarios.ColoresPorDefecto;
  RefrescaColores;
end;

end.
