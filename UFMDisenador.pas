unit UFMDisenador;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, DBCtrls, StdCtrls, ComCtrls, UDBDateTimePicker, Mask,
  Menus, UTeclas, UControlEdit, UEditPanel, UNavigator, ToolWin, Grids,
  DBGrids, UHYDBGrid, ExtCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, UHYEdits, rxPlacemnt, NsDBGrid, ULFCheckBox,
  ULFDBEditFind2000, ULFDBCheckBox, ULFDBEdit, ULFFormStorage, ActnList,
  ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, ULFEditFind2000,
  TFlatCheckBoxUnit, ULFLabel, UG2kTBLoc, HYFIBQuery;

type
  TFMDisenador = class(TFPEdit)
     PNGrupos: TLFPanel;
     DBEGrupo: TLFDbedit;
     LBLGrupo: TLFLabel;
     LBLTitulo: TLFLabel;
     DBETitulo: TLFDbedit;
     DBECopias: TLFDbedit;
     LBLCopias: TLFLabel;
     DBEDefecto: TLFDbedit;
     LBLDefecto: TLFLabel;
     DBEPijama: TLFDBCheckBox;
     LBLListDefEEC: TLFLabel;
     DBEListDefEEC: TLFDbedit;
     CEListadoSerie: TControlEdit;
     CEListadoSeriePMEdit: TPopUpTeclas;
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     PDetalle: TLFPanel;
     PCListados: TLFPageControl;
     TSFichaLis: TTabSheet;
     PNListados: TLFPanel;
     LBLListado: TLFLabel;
     LBLTituloLis: TLFLabel;
     LBLCabecera: TLFLabel;
     LBLTipo: TLFLabel;
     DBEListado: TLFDbedit;
     DBETituloLis: TLFDbedit;
     DBEEFCabecera: TLFDBEditFind2000;
     DBExCabecera: TLFDbedit;
     EFProforma: TLFEditFind2000;
     TBDetalle: TLFToolBar;
     ToolButton2: TToolButton;
     TButtDisenar: TToolButton;
     TSSerieLis: TTabSheet;
     PNLListadoSerie: TLFPanel;
     DBGFListadosSerie: TDBGridFind2000;
     TBSeries: TLFToolBar;
     ToolButton1: TToolButton;
     TButtDisenarSerie: TToolButton;
     TSTablaLis: TTabSheet;
     DBGListados: THYTDBGrid;
     NavDetalle: THYMNavigator;
     NavListadoSerie: THYMNavigator;
     EPDetalle: THYMEditPanel;
     LBLDefectoEmail: TLFLabel;
     LBLListDefEECEmail: TLFLabel;
     DBELDefectoMail: TLFDbedit;
     DBELDefectoMailEEC: TLFDbedit;
     ChkBProforma: TLFCheckBox;
     DBCBTipo: TDBComboBox;
     ToolButton3: TToolButton;
     AListDefGrupo: TAction;
     AListDefEEC: TAction;
     ALimpiaListDefEEC: TAction;
     AListDefMail: TAction;
     AListDefMailEEC: TAction;
     LFCategoryAction1: TLFCategoryAction;
     SaveToFR3: TToolButton;
     AImportarListados: TAction;
     AExportarListados: TAction;
     DBRGImpresora: TDBRadioGroup;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure TButtDisenarClick(Sender: TObject);
     procedure NavDetalleClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure NavDetalleClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure EFProformaBusqueda(Sender: TObject);
     procedure TSFichaShow(Sender: TObject);
     procedure TSTablaShow(Sender: TObject);
     procedure TSFichaLisShow(Sender: TObject);
     procedure TSTablaLisShow(Sender: TObject);
     procedure TSSerieLisShow(Sender: TObject);
     procedure DBGFListadosSerieBusqueda(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure TButtDisenarSerieClick(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure EFProformaChange(Sender: TObject);
     procedure EPDetalleClickRango(Sender: TObject; var Continua: boolean);
     procedure DBELDefectoMailChange(Sender: TObject);
     procedure DBELDefectoMailEECChange(Sender: TObject);
     procedure DBEListDefEECChange(Sender: TObject);
     procedure ChkBProformaClick(Sender: TObject);
     procedure DBCBTipoChange(Sender: TObject);
     procedure AListDefGrupoExecute(Sender: TObject);
     procedure AListDefEECExecute(Sender: TObject);
     procedure ALimpiaListDefEECExecute(Sender: TObject);
     procedure AListDefMailExecute(Sender: TObject);
     procedure AListDefMailEECExecute(Sender: TObject);
     procedure TbuttCompClick(Sender: TObject);
     procedure SaveToFR3Click(Sender: TObject);
     procedure AImportarListadosExecute(Sender: TObject);
     procedure AExportarListadosExecute(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
     function DameGrupo: string;
  public
     { Public declarations }
     Grupo: integer;
  end;

var
  FMDisenador : TFMDisenador;
  sw : string;

implementation

uses UFormGest, UDMDisenador, UDMMain, UEntorno, UUtiles, UFMain;

{$R *.DFM}

procedure TFMDisenador.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMDisenador, DMDisenador);
  Grupo := 0;
  PCMain.ActivePage := TSFicha;
  PCListados.ActivePage := TSFichaLis;
  NavMain.DataSource := DMDisenador.DSQMGrupo;
  DBGMain.DataSource := DMDisenador.DSQMGrupo;
  NavDetalle.DataSource := DMDisenador.DSQMListado;
  DBGListados.DataSource := DMDisenador.DSQMListado;
  NavListadoSerie.DataSource := DMDisenador.DSQMListadosEECS;
  DBGFListadosSerie.DataSource := DMDisenador.DSQMListadosEECS;
  CEMainPMEdit.Teclas := DMMain.Teclas;
  sw := '';
  ChkBProforma.Visible := False;

  // Color campo ID
  ColorCampoID(DBEGrupo);
  ColorCampoID(DBEListado);
end;

procedure TFMDisenador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMDisenador);
end;

procedure TFMDisenador.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  DMDisenador.BusquedaCompleja;
  Continua := False;
end;

// Diseñar el listado
procedure TFMDisenador.TButtDisenarClick(Sender: TObject);
begin
  // DMDisenador.ExportarListados;
  // DMDisenador.ImportarListados;
  DMDisenador.Disenyar(DMDisenador.QMListadoLISTADO.AsInteger,
     DMDisenador.QMListadoTIPO.AsString);
end;

procedure TFMDisenador.NavDetalleClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
var
  LstProf : string;
begin
  if ((button = nbPost) and (sw = 'insert')) then
  begin
     if not (ChkBProforma.Checked) then
        LstProf := DBCBTipo.Text
     else
        LstProf := EFProforma.Text;

     DMDisenador.GuardaInforme(LstProf);
     sw := '';
  end;
end;

procedure TFMDisenador.NavDetalleClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  inherited;
  if (Button = nbInsert) then
  begin
     Grupo := DMDisenador.QMGrupoGRUPO.Value;
     EFProforma.Visible := True;
     ChkBProforma.Visible := True;
     ChkBProforma.Checked := True;
     sw := 'insert';
  end;

  DBCBTipo.Color := clInfoBk;
  DBCBTipo.Font.Color := clGrayText;
  DBCBTipo.Enabled := False;

  if ((Button = nbPost) or (Button = nbCancel)) then
  begin
     EFProforma.Visible := False;
     ChkBProforma.Visible := False;
  end;
end;

procedure TFMDisenador.EFProformaBusqueda(Sender: TObject);
begin
  EFProforma.CondicionBusqueda := DameGrupo;
end;

procedure TFMDisenador.TSFichaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMDisenador.TSTablaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMDisenador.TSFichaLisShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEDetalle;
end;

procedure TFMDisenador.TSTablaLisShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEDetalle;
end;

procedure TFMDisenador.TSSerieLisShow(Sender: TObject);
begin
  ControlEdit := CEListadoSerie;
  DMDisenador.RefrescarListadoEECS;
end;

procedure TFMDisenador.DBGFListadosSerieBusqueda(Sender: TObject);
begin
  if DBGFListadosSerie.ColumnaActual = 'LISTADODEFMAIL' then
     DBGFListadosSerie.CondicionBusqueda :=
        'Grupo = ' + IntToStr(DMDisenador.QMGrupoGRUPO.AsInteger) +
        'and TIPO = ''HYM''';

  if DBGFListadosSerie.ColumnaActual = 'LISTADODEF' then
     DBGFListadosSerie.CondicionBusqueda := 'Grupo = ' +
        IntToStr(DMDisenador.QMGrupoGRUPO.AsInteger);

  if DBGFListadosSerie.ColumnaActual = 'SERIE' then
     DBGFListadosSerie.CondicionBusqueda := 'Empresa = ' +
        IntToStr(REntorno.Empresa) + ' and Activo=1';
end;

procedure TFMDisenador.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  if (Button = nbFirst) or (Button = nbPrior) or (Button = nbNext) or
     (Button = nbLast) or (Button = nbDelete) or (Button = nbRefresh) then

     DMDisenador.RefrescarListadoEECS;
end;

// Diseñar el listado por EECS
procedure TFMDisenador.TButtDisenarSerieClick(Sender: TObject);
var
  Listado : integer;
begin
  Listado := DMDisenador.QMListadosEECSLISTADODEF.AsInteger;
  DMDisenador.Disenyar(Listado, DMDisenador.GetTipoListado(Listado));
end;

procedure TFMDisenador.FormShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMDisenador.EFProformaChange(Sender: TObject);
begin
  DMDisenador.SetTipoListado(StrToIntDef(EFProforma.Text, 0));
end;

procedure TFMDisenador.EPDetalleClickRango(Sender: TObject; var Continua: boolean);
begin
  DMDisenador.BusquedaDetalle;
  Continua := False;
end;

procedure TFMDisenador.DBELDefectoMailChange(Sender: TObject);
begin
  inherited;
  if DBELDefectoMail.Text = '0' then
     DBELDefectoMail.Text := '';
end;

procedure TFMDisenador.DBELDefectoMailEECChange(Sender: TObject);
begin
  inherited;
  if DBELDefectoMailEEC.Text = '0' then
     DBELDefectoMailEEC.Text := '';
end;

procedure TFMDisenador.DBEListDefEECChange(Sender: TObject);
begin
  inherited;
  if DBEListDefEEC.Text = '0' then
     DBEListDefEEC.Text := '';
end;

function TFMDisenador.DameGrupo: string;
begin
  // Mostrará todos los listados incluidos en todos los grupos equivalentes
  case Grupo of
     38, 107, 108, 109: Result := 'grupo=38 or grupo=107 or grupo=108 or grupo=109' +
           ' or listado=1 or listado=2 or listado=3 or listado = 4'; //Ofertas
     39, 110, 111, 112: Result := 'grupo=39 or grupo=110 or grupo=111 or grupo=112' +
           ' or listado=1 or listado=2 or listado=3 or listado = 4'; //Pedidos
     34, 113, 114, 115: Result := 'grupo=34 or grupo=113 or grupo=114 or grupo=115' +
           ' or listado=1 or listado=2 or listado=3 or listado = 4'; //Albaranes
     36, 116, 117, 118: Result := 'grupo=36 or grupo=116 or grupo=117 or grupo=118' +
           ' or listado=1 or listado=2 or listado=3 or listado = 4'; //Facturas
     else
        Result := 'grupo=' + IntToStr(Grupo) + ' or listado=1 or listado=2 or listado=3 or listado = 4';
  end;
end;

procedure TFMDisenador.ChkBProformaClick(Sender: TObject);
begin
  if ChkBProforma.Checked then
  begin
     EFProforma.Visible := True;
     DBCBTipo.Color := clInfoBk;
     DBCBTipo.Font.Color := clGrayText;
     DBCBTipo.Enabled := False;
     EFProformaChange(Self);
  end
  else
  begin
     EFProforma.Visible := False;
     DBCBTipo.Color := clWindow;
     DBCBTipo.Font.Color := clWindowText;
     DBCBTipo.Enabled := True;
     DBCBTipo.SetFocus;
  end;
end;

procedure TFMDisenador.DBCBTipoChange(Sender: TObject);
begin
  DMDisenador.TipoListado := DBCBTipo.Text;
end;

procedure TFMDisenador.AListDefGrupoExecute(Sender: TObject);
begin
  inherited;
  DMDisenador.ListadoDefecto;
end;

procedure TFMDisenador.AListDefEECExecute(Sender: TObject);
begin
  inherited;
  if (DBEListDefEEC.Text <> DBEListado.Text) then
     DMDisenador.ListadoDefectoEEC;
end;

procedure TFMDisenador.ALimpiaListDefEECExecute(Sender: TObject);
begin
  inherited;
  if (DBEListDefEEC.Text <> '') then
     DMDisenador.BorraListadoDefectoEEC;
end;

procedure TFMDisenador.AListDefMailExecute(Sender: TObject);
begin
  inherited;
  DMDisenador.ListadoDefectoMail;
end;

procedure TFMDisenador.AListDefMailEECExecute(Sender: TObject);
begin
  inherited;
  DMDisenador.ListadoDefectoMailEEC;
end;

procedure TFMDisenador.TbuttCompClick(Sender: TObject);
begin
  inherited;
  DMDisenador.ExportarListados;
end;

procedure TFMDisenador.SaveToFR3Click(Sender: TObject);
begin
  inherited;
  DMDisenador.GuardarFR3(DMDisenador.QMListadoLISTADO.AsInteger,
     DMDisenador.QMListadoTIPO.AsString);
end;

procedure TFMDisenador.AImportarListadosExecute(Sender: TObject);
begin
  inherited;
  DMDisenador.ImportarListados;
end;

procedure TFMDisenador.AExportarListadosExecute(Sender: TObject);
begin
  inherited;
  DMDisenador.ExportarListados;
end;

procedure TFMDisenador.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
