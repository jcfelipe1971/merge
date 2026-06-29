unit UFMEscandalloProd;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, DBCtrls, UDBDateTimePicker, Mask, NsDBGrid,
  rxPlacemnt, rxToolEdit, RXDBCtrl, ULFEdit, ULFDBCheckBox, ULFDBEditFind2000,
  ULFDBEdit, ULFFormStorage, ActnList, ULFActionList, ULFPageControl,
  ULFToolBar, ULFPanel, TFlatCheckBoxUnit, ULFCheckBox, ULFLabel, UG2kTBLoc, ULFDBDateEdit;

type
  TFMEscandalloProd = class(TFPEdit)
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
     ECoste: TLFEdit;
     LBLCosteTotal: TLFLabel;
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
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBEFArticuloBusqueda(Sender: TObject);
     procedure DBGFDetalleColEnter(Sender: TObject);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure TbuttCompClick(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure TSProcesosShow(Sender: TObject);
     procedure TSFichaShow(Sender: TObject);
     procedure ALstEscandalloExecute(Sender: TObject);
     procedure DBGFDetalleDblClick(Sender: TObject);
  private
     { Private declarations }
     procedure BorraCoste;
  public
     { Public declarations }
     procedure FiltraEscandallo(Filtro: string);
  end;

var
  FMEscandalloProd : TFMEscandalloProd;

implementation

uses UDMEscandalloProd, UDMMain, UFormGest, UEntorno, UFPregEscandallo, UFMain;

{$R *.DFM}

procedure TFMEscandalloProd.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMEscandalloProd, DMEscandalloProd);

  // Conectamos los datasources
  NavMain.DataSource := DMEscandalloProd.DSQMEscandallo;
  DBGMain.DataSource := DMEscandalloProd.DSQMEscandallo;

  NavDetalle.DataSource := DMEscandalloProd.DSQMEscandalloDet;
  DBGFDetalle.DataSource := DMEscandalloProd.DSQMEscandalloDet;

  //Conectamos las teclas
  CEMain.Teclas := DMMain.Teclas;
  CEDetalle.Teclas := DMMain.Teclas;

  BorraCoste;
end;

procedure TFMEscandalloProd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMEscandalloProd);
end;

procedure TFMEscandalloProd.DBEFArticuloBusqueda(Sender: TObject);
begin
  { Filtro para no elegir ni artículos del sistema ni artículos virtuales ya que
    no tienen producción }
  DBEFArticulo.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema +
     ''' AND VIRTUAL=0 AND ABIERTO=0';
end;

procedure TFMEscandalloProd.DBGFDetalleColEnter(Sender: TObject);
begin
  inherited;
  ControlEdit := CEDetalle;
end;

procedure TFMEscandalloProd.DBGFDetalleBusqueda(Sender: TObject);
begin
  inherited;
  // Filtramos por los artículos del sistema
  DBGFDetalle.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMEscandalloProd.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMEscandalloProd.BusquedaCompleja;
  BorraCoste;
end;

procedure TFMEscandalloProd.TbuttCompClick(Sender: TObject);
begin
  LBLCosteTotal.Visible := True;
  ECoste.Text := FormatFloat(MascaraN, DMEscandalloProd.CosteTotal);
  ECoste.Visible := True;
end;

procedure TFMEscandalloProd.BorraCoste;
begin
  LBLCosteTotal.Visible := False;
  ECoste.Visible := False;
end;

procedure TFMEscandalloProd.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  BorraCoste;
end;

procedure TFMEscandalloProd.TSProcesosShow(Sender: TObject);
begin
  ControlEdit := CEProcesos;
end;

procedure TFMEscandalloProd.TSFichaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMEscandalloProd.ALstEscandalloExecute(Sender: TObject);
begin
  inherited;
  TFPregEscandallo.Create(Self).Muestra(DBENumero.Text, DBEFArticulo.Text);
end;

procedure TFMEscandalloProd.DBGFDetalleDblClick(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AArticulos, 'ARTICULO = ''' +
     DMEscandalloProd.QMEscandalloDetDETALLE.AsString + '''' +
     ' AND EJERCICIO=' + REntorno.EjercicioStr);
end;

procedure TFMEscandalloProd.FiltraEscandallo(Filtro: string);
begin
  DMEscandalloProd.FiltraEscandallo(Filtro);
end;

end.
