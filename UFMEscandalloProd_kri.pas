unit UFMEscandalloProd_kri;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, DBCtrls, UDBDateTimePicker, Mask, NsDBGrid,
  rxPlacemnt, rxToolEdit, RXDBCtrl, ULFEdit, ULFDBCheckBox, ULFDBEditFind2000,
  ULFDBEdit, ULFFormStorage, ActnList, ULFActionList, ULFPageControl,
  ULFToolBar, ULFPanel, TFlatCheckBoxUnit, ULFCheckBox, ULFLabel, URecursos, ULFDBDateEdit,
  ULFEditFind2000, UG2kTBLoc, Buttons;

type
  TFMEscandalloProd_kri = class(TFPEdit)
     PDetalle: TLFPanel;
     DBGFDetalle: TDBGridFind2000;
     LBLNumero: TLFLabel;
     LBLArticulo: TLFLabel;
     LBLUnidades: TLFLabel;
     TBDetalle: TLFToolBar;
     NavDetalle: THYMNavigator;
     DBENumero: TLFDbedit;
     DBEFArticulo: TLFDBEditFind2000;
     DBEUnidades: TLFDbedit;
     DBCHKActivo: TLFDBCheckBox;
     GBVigencia: TGroupBox;
     LBLFechaDesde: TLFLabel;
     DBDTPDesde: TLFDBDateEdit;
     DBDTPHasta: TLFDBDateEdit;
     LBLFechaHasta: TLFLabel;
     DBETitArticulo: TLFDbedit;
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     LBLCoste: TLFLabel;
     DBECoste: TLFDbedit;
     LBLCosteUnitario: TLFLabel;
     DBESumaPesos: TLFDBEdit;
     TBCopiaEscandalloTyC: TToolButton;
     LPesoKri: TLFLabel;
     ECosteTotal: TLFEdit;
     LBLCosteTotal: TLFLabel;
     ECoste: TLFEdit;
     TSProcesos: TTabSheet;
     TBProcesoso: TLFToolBar;
     PNLInfoProceso: TLFPanel;
     DBENumeroArticulo: TLFDbedit;
     DBEArtProcesos: TLFDbedit;
     PNProcesos: TLFPanel;
     NavProcesos: THYMNavigator;
     CEProcesos: TControlEdit;
     CEProcesosPMEdit: TPopUpTeclas;
     DBGFProcesos: TDBGridFind2000;
     ToolButton1: TToolButton;
     ALstEscandallo: TAction;
     LFCategoryAction1: TLFCategoryAction;
     TButtFiltroActivo: TToolButton;
     AExportacionJMTChem: TAction;
     LFCategoryAction2: TLFCategoryAction;
     ACompuesto: TAction;
     SBCompuesto: TSpeedButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBEFArticuloBusqueda(Sender: TObject);
     procedure DBGFDetalleColEnter(Sender: TObject);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure TbuttCompClick(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure DBGFDetalleColExit(Sender: TObject);
     procedure EditFind20001Change(Sender: TObject);
     procedure EPMainClickReport(Sender: TObject; var Continua: boolean);
     procedure TBCopiaEscandalloTyCClick(Sender: TObject);
     procedure TSProcesosShow(Sender: TObject);
     procedure TSFichaShow(Sender: TObject);
     procedure ALstEscandalloExecute(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure TButtFiltroActivoClick(Sender: TObject);
     procedure DBGFDetalleDblClick(Sender: TObject);
     procedure AExportacionJMTChemExecute(Sender: TObject);
     procedure DBETitArticuloDblClick(Sender: TObject);
     procedure ACompuestoExecute(Sender: TObject);
     procedure DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
  private
     { Private declarations }
     procedure BorraCoste;
  public
     { Public declarations }
     procedure FiltraEscandallo(Filtro: string);
  end;

var
  FMEscandalloProd_kri : TFMEscandalloProd_kri;

implementation

uses UDMEscandalloProd_kri, UDMMain, UUtiles, UFormGest, UEntorno, UFPregEscandallo, UParam, UFMain;

{$R *.DFM}

procedure TFMEscandalloProd_kri.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMEscandalloProd_kri, DMEscandalloProd_kri);

  // Conectamos los datasources
  NavMain.DataSource := DMEscandalloProd_kri.DSQMEscandallo;
  DBGMain.DataSource := DMEscandalloProd_kri.DSQMEscandallo;
  G2KTableLoc.DataSource := DMEscandalloProd_kri.DSQMEscandallo; {dji lrk kri}

  NavDetalle.DataSource := DMEscandalloProd_kri.DSQMEscandalloDet;
  DBGFDetalle.DataSource := DMEscandalloProd_kri.DSQMEscandalloDet;

  // Conectamos las teclas
  CEMain.Teclas := DMMain.Teclas;
  CEDetalle.Teclas := DMMain.Teclas;

  BorraCoste;
  if REntorno.Delegacion = 'S' then {dji lrk kri}
  begin
     NavMain.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh];
     NavDetalle.VisibleButtons := [nbFirst, nbPrior, nbNext, nbLast, nbRefresh];
  end
  else
  begin
     NavMain.VisibleButtons :=
        [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit,
        nbPost, nbCancel, nbRefresh];
     NavDetalle.VisibleButtons :=
        [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbEdit,
        nbPost, nbCancel, nbRefresh];
  end;

  TBCopiaEscandalloTyC.Visible := (LeeParametro('MODREST017') = 'S');

  SolapaControles(SBCompuesto, DBETitArticulo);
  DBETitArticulo.Color := REntorno.ColorEnlaceActivo;
end;

procedure TFMEscandalloProd_kri.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMEscandalloProd_kri);
end;

procedure TFMEscandalloProd_kri.DBEFArticuloBusqueda(Sender: TObject);
begin
  { Filtro para no elegir ni artículos del sistema ni artículos virtuales ya que
    no tienen producción }
  DBEFArticulo.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema +
     ''' AND VIRTUAL=0 AND ABIERTO=0';
  {
  DBEFArticulo.SelectSQL.Text := 'select gart.articulo,gart.titulo ' +
    'from  con_cuentas_ges_art gart join art_articulos art ' +
    'on(art.empresa=gart.empresa and art.articulo=gart.articulo) ';
  DBEFArticulo.Plan.Text      :=
    'PLAN JOIN (ART INDEX (PK_ART_ARTICULOS),GART INDEX (PK_CON_CUENTAS_GES_ART))';
  DBEFArticulo.CondicionBusqueda := 'gart.FAMILIA<>''' + REntorno.FamSistema +
    ''' AND art.VIRTUAL=0 AND art.ABIERTO=0';
}
end;

procedure TFMEscandalloProd_kri.DBGFDetalleColEnter(Sender: TObject);
begin
  inherited;
  ControlEdit := CEDetalle;
end;

procedure TFMEscandalloProd_kri.DBGFDetalleBusqueda(Sender: TObject);
begin
  inherited;
  // Filtramos por los artículos del sistema
  DBGFDetalle.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMEscandalloProd_kri.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMEscandalloProd_kri.BusquedaCompleja;
  BorraCoste;
end;

procedure TFMEscandalloProd_kri.TbuttCompClick(Sender: TObject);
begin
  LBLCosteUnitario.Visible := True;
  ECosteTotal.Visible := True;
  ECosteTotal.Text := FormatFloat(MascaraN, DMEscandalloProd_kri.CosteTotal *
     DMEscandalloProd_kri.QMEscandalloUNIDADES.AsFloat);
  LBLCosteTotal.Visible := True;
  ECoste.Text := FormatFloat(MascaraN, DMEscandalloProd_kri.CosteTotal);
  ECoste.Visible := True;
end;

procedure TFMEscandalloProd_kri.BorraCoste;
begin
  LBLCosteTotal.Visible := False;
  ECosteTotal.Visible := False;
  LBLCosteUnitario.Visible := False;
  ECoste.Visible := False;
end;

procedure TFMEscandalloProd_kri.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  BorraCoste;
end;

procedure TFMEscandalloProd_kri.DBGFDetalleColExit(Sender: TObject);
begin
  inherited;
  DBESumaPesos.Visible := False;
  DBESumaPesos.Visible := True;
end;

procedure TFMEscandalloProd_kri.EditFind20001Change(Sender: TObject);
begin
  inherited;
  {  DMEscandalloProd_kri.QMEscandallo.Close;
  DMEscandalloProd_kri.QMEscandallo.SelectSQL.Clear;
  DMEscandalloProd_kri.QMEscandallo.SelectSQL.Add(
    'SELECT * FROM ART_ARTICULOS_ESC_PRODUCCION');
  DMEscandalloProd_kri.QMEscandallo.SelectSQL.Add('WHERE');
  DMEscandalloProd_kri.QMEscandallo.SelectSQL.Add(
    'EMPRESA =' + REntorno.EmpresaStr + ' AND');
  DMEscandalloProd_kri.QMEscandallo.SelectSQL.Add(
    'ARTICULO = ''' + EditFind20001.Text + ''' AND');
  DMEscandalloProd_kri.QMEscandallo.SelectSQL.Add('NUMERO > 0');
  DMEscandalloProd_kri.QMEscandallo.Open;}
end;

procedure TFMEscandalloProd_kri.EPMainClickReport(Sender: TObject; var Continua: boolean);
begin
  inherited;
  TFPregEscandallo.Create(Self).Muestra(DBENumero.Text, DBEFArticulo.Text);
end;

procedure TFMEscandalloProd_kri.TBCopiaEscandalloTyCClick(Sender: TObject);
begin
  inherited;
  // crear para todas las tallas y colores.
  DMEscandalloProd_Kri.DuplicaEscandalloTyC;
end;

procedure TFMEscandalloProd_kri.TSProcesosShow(Sender: TObject);
begin
  ControlEdit := CEProcesos;
end;

procedure TFMEscandalloProd_kri.TSFichaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMEscandalloProd_kri.ALstEscandalloExecute(Sender: TObject);
begin
  inherited;
  TFPregEscandallo.Create(Self).Muestra(DBENumero.Text, DBEFArticulo.Text);
end;

procedure TFMEscandalloProd_kri.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TFMEscandalloProd_kri.TButtFiltroActivoClick(Sender: TObject);
var
  Todos : boolean;
begin
  inherited;
  Todos := TButtFiltroActivo.Caption = _('Todos');
  if (Todos) then
  begin
     TButtFiltroActivo.Caption := _('Solo Activos');
     TButtFiltroActivo.Hint := _('Filtra escandallos activos');
     TButtFiltroActivo.ImageIndex := 22;
  end
  else
  begin
     TButtFiltroActivo.Caption := _('Todos');
     TButtFiltroActivo.Hint := _('Muestra escandallos activos e inactivos');
     TButtFiltroActivo.ImageIndex := 23;
  end;
  DMEscandalloProd_Kri.MuestraTodos(Todos);
end;

procedure TFMEscandalloProd_kri.DBGFDetalleDblClick(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AArticulos, 'ARTICULO = ''' +
     DMEscandalloProd_Kri.QMEscandalloDetDETALLE.AsString + '''' +
     ' AND EJERCICIO=' + REntorno.EjercicioStr);
end;

procedure TFMEscandalloProd_kri.FiltraEscandallo(Filtro: string);
begin
  DMEscandalloProd_Kri.FiltraEscandallo(Filtro);
end;

procedure TFMEscandalloProd_kri.AExportacionJMTChemExecute(Sender: TObject);
begin
  inherited;
  DMEscandalloProd_Kri.ExportacionJMTChem;
end;

procedure TFMEscandalloProd_kri.DBETitArticuloDblClick(Sender: TObject);
begin
  inherited;
  ACompuesto.Execute;
end;

procedure TFMEscandalloProd_kri.ACompuestoExecute(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AArticulos, 'ARTICULO = ''' +
     DMEscandalloProd_kri.QMEscandalloARTICULO.AsString + '''' +
     ' AND EJERCICIO=' + REntorno.EjercicioStr);
end;

procedure TFMEscandalloProd_kri.DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (UpperCase(Column.FieldName) = 'DETALLE') then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);
end;

end.
