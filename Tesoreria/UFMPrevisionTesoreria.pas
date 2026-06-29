unit UFMPrevisionTesoreria;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls,
  UNavigator, ToolWin, ULFToolBar, ExtCtrls, ULFPanel, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, Mask, rxToolEdit,
  ULFDateEdit, StdCtrls, ULFEdit, ULFLabel, ULFPageControl, Grids, DBGrids,
  NsDBGrid, UHYDBGrid, DBCtrls, ULFDBEdit, ULFDBMemo, UFPEdit, UG2kTBLoc;

type
  TFMPrevisionTesoreria = class(TFPEdit)
     TSPrevision: TTabSheet;
     TSResultado: TTabSheet;
     TSConfiguracion: TTabSheet;
     LMesInicial: TLFLabel;
     LCantidadMeses: TLFLabel;
     LFechaPivote: TLFLabel;
     ECantidadMeses: TLFEdit;
     EFPeriodo: TLFEditFind2000;
     EFEjercicio: TLFEditFind2000;
     BCalcular: TButton;
     TBPrevision: TLFToolBar;
     NavPrevision: THYMNavigator;
     CEPrevision: TControlEdit;
     PNLPrevision: TLFPanel;
     PNLEjercicioPrevision: TLFPanel;
     LEjercicioPrevision: TLFLabel;
     EFEjercicioPrevision: TLFEditFind2000;
     ToolButton1: TToolButton;
     DBGPrevision: THYTDBGrid;
     TBResultado: TLFToolBar;
     NavResultado: THYMNavigator;
     DBGResultado: THYTDBGrid;
     ToolButton2: TToolButton;
     PCConfiguracion: TLFPageControl;
     TSFichaConfiguracion: TTabSheet;
     TSTablaConfiguracion: TTabSheet;
     TBConfiguracion: TLFToolBar;
     NavConfiguracion: THYMNavigator;
     ToolButton3: TToolButton;
     DBGConfiguracion: THYTDBGrid;
     LOrden: TLFLabel;
     LTitulo: TLFLabel;
     LSQL: TLFLabel;
     DBMSQL: TLFDBMemo;
     DBEOrden: TLFDbedit;
     DBETitulo: TLFDbedit;
     CEResultado: TControlEdit;
     CEConfiguracion: TControlEdit;
     PNLResultado: TLFPanel;
     PNLConfiguracion: TLFPanel;
     LCeldaExcel: TLFLabel;
     DBECeldaExcel: TLFDbedit;
     TButtExportarExcel: TToolButton;
     LPrevision: TLFLabel;
     PNLFichaPrevision: TLFPanel;
     DBEPrevision: TLFDbedit;
     DBETituloPrevision: TLFDbedit;
     LTituloPrevision: TLFLabel;
     LPlantilla: TLFLabel;
     DBEPlantilla: TLFDbedit;
     BBuscarArchivo: TButton;
     BGenerarPrevisionEjercicio: TButton;
     LPeriodo: TLFLabel;
     LMeses: TLFLabel;
     LCeldaExcelPrev: TLFLabel;
     DBECeldaExcelPrev: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure BCalcularClick(Sender: TObject);
     procedure TButtExportarExcelClick(Sender: TObject);
     procedure BBuscarArchivoClick(Sender: TObject);
     procedure BGenerarPrevisionEjercicioClick(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMPrevisionTesoreria : TFMPrevisionTesoreria;

implementation

uses UDMMain, UEntorno, DateUtils, UDMPrevisionTesoreria, UFormGest, UUtiles;

{$R *.dfm}

procedure TFMPrevisionTesoreria.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMPrevisionTesoreria, DMPrevisionTesoreria);

  NavMain.DataSource := DMPrevisionTesoreria.DSQMPrevision;
  DBGMain.DataSource := DMPrevisionTesoreria.DSQMPrevision;
  G2kTableLoc.DataSource := DMPrevisionTesoreria.DSQMPrevision;

  EFPeriodo.Text := '01';
  ECantidadMeses.Text := '12';
  EFEjercicio.Text := REntorno.EjercicioStr;
  EFEjercicioPrevision.Text := REntorno.EjercicioStr;
end;

procedure TFMPrevisionTesoreria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPrevisionTesoreria);
end;

procedure TFMPrevisionTesoreria.BCalcularClick(Sender: TObject);
begin
  inherited;
  DMPrevisionTesoreria.Calcular(StrToIntDef(DBEPrevision.Text, 0), StrToIntDef(EFEjercicio.Text, 0), EFPeriodo.Text, StrToIntDef(ECantidadMeses.Text, 12));
  PCMain.ActivePage := TSResultado;
end;

procedure TFMPrevisionTesoreria.TButtExportarExcelClick(Sender: TObject);
var
  Archivo : string;
begin
  inherited;
  if (Trim(DBEPlantilla.Text) = '') then
  begin
     Archivo := '';
     if MySaveDialog(Archivo, 'XLS,XLT', '', 'FMPrevisionTesoreria-ExportarExcel') then
        DMPrevisionTesoreria.ExportaExcel(Archivo);
  end
  else
     DMPrevisionTesoreria.ExportaExcel(DBEPlantilla.Text);
end;

procedure TFMPrevisionTesoreria.BBuscarArchivoClick(Sender: TObject);
var
  Archivo : string;
begin
  inherited;
  Archivo := '';
  if MyOpenDialog(Archivo, 'XLS,XLT', '', 'FMPrevisionTesoreria-BuscarArchiv') then
     DBEPlantilla.Text := Trim(Archivo);
end;

procedure TFMPrevisionTesoreria.BGenerarPrevisionEjercicioClick(Sender: TObject);
begin
  inherited;
  DMPrevisionTesoreria.RegeneraPrevision(StrToIntDef(EFEjercicioPrevision.Text, 0));
end;

procedure TFMPrevisionTesoreria.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
