unit UFMContRec;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, ToolWin, ExtCtrls, Grids, DBGrids, UHYDBGrid, UControlEdit,
  Menus, UTeclas, UNavigator, URecursos, UFIBDBEditfind, UFormGest,
  UComponentesBusquedaFiltrada, StdCtrls, DBCtrls, NsDBGrid, ULFToolBar,
  ULFPanel, ULFPageControl, UFPEditSinNavegador, rxPlacemnt,
  ULFFormStorage, ActnList, ULFActionList, UEditPanel;

type
  TFMContRec = class(TFPEditSinNavegador)
     PCMain: TLFPageControl;
     TSEmpresa: TTabSheet;
     TSEjercicio: TTabSheet;
     TSCanal: TTabSheet;
     TSSerie: TTabSheet;
     TButtBorrarTodos: TToolButton;
     TSSeriesSimples: TTabSheet;
     PE: TLFPanel;
     HYTDBG_E: TDBGridFind2000;
     PEE: TLFPanel;
     HYTDBG_EE: TDBGridFind2000;
     PEEC: TLFPanel;
     HYTDBG_EEC: TDBGridFind2000;
     PEECS: TLFPanel;
     HYTDBG_EECS: TDBGridFind2000;
     PEES: TLFPanel;
     HYTDBG_EES: TDBGridFind2000;
     CEEmpresa: TControlEdit;
     CEEmpresaPMEdit: TPopUpTeclas;
     CEEjercicio: TControlEdit;
     CECanal: TControlEdit;
     CEEjercicioPMEdit: TPopUpTeclas;
     CECanalPMEdit: TPopUpTeclas;
     CESerie: TControlEdit;
     CESerieSimple: TControlEdit;
     CESeriePMEdit: TPopUpTeclas;
     CESerieSimplePMEdit: TPopUpTeclas;
     TBEmpresa: TLFToolBar;
     NavEmpresa: THYMNavigator;
     PNLInfo_E: TLFPanel;
     TBEjercicio: TLFToolBar;
     NavEjercicio: THYMNavigator;
     PNLInfo_EE: TLFPanel;
     TBCanal: TLFToolBar;
     NavCanal: THYMNavigator;
     PNLInfo_EEC: TLFPanel;
     TBSerie: TLFToolBar;
     NavSerie: THYMNavigator;
     PNLInfo_EECS: TLFPanel;
     TBSerieSimple: TLFToolBar;
     NavSerieSimple: THYMNavigator;
     PNLInfo_EES: TLFPanel;
     DBCBTipoE: TDBLookupComboBox;
     ToolButton2: TToolButton;
     DBCBTipoEE: TDBLookupComboBox;
     ToolButton3: TToolButton;
     ToolButton4: TToolButton;
     DBCBTipoEEC: TDBLookupComboBox;
     ToolButton5: TToolButton;
     DBCBTipoEECS: TDBLookupComboBox;
     ToolButton6: TToolButton;
     DBCBTipoEES: TDBLookupComboBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TSCanalShow(Sender: TObject);
     procedure TSEjercicioShow(Sender: TObject);
     procedure TSEmpresaShow(Sender: TObject);
     procedure TSSerieShow(Sender: TObject);
     procedure TSSeriesSimplesShow(Sender: TObject);
     procedure HYTDBGRowChange(Sender: TObject);
     procedure TButtBorrarTodosClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMContRec : TFMContRec;

implementation

uses UDMContRec, UUtiles;

{$R *.DFM}

procedure TFMContRec.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMContRec, DMContRec);
  PCMain.ActivePage := TSEmpresa;

  HYTDBG_E.DataSource := DMContRec.DSxContRec_E;
  HYTDBG_EE.DataSource := DMContRec.DSxContRec_EE;
  HYTDBG_EEC.DataSource := DMContRec.DSxContRec_EEC;
  HYTDBG_EECS.DataSource := DMContRec.DSxContRec_EECS;
  HYTDBG_EES.DataSource := DMContRec.DSxContRec_EES;

  DBCBTipoE.KeyValue := DMContRec.Dame_TipoE;
  DBCBTipoEE.KeyValue := DMContRec.Dame_TipoEE;
  DBCBTipoEEC.KeyValue := DMContRec.Dame_TipoEEC;
  DBCBTipoEECS.KeyValue := DMContRec.Dame_TipoEECS;
  DBCBTipoEES.KeyValue := DMContRec.Dame_TipoEES;

  // Por defecto, la empresa estará activa
  ControlEdit := CEEmpresa;
end;

procedure TFMContRec.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMContRec);
  Action := caFree;
end;

// Empresa
procedure TFMContRec.TSEmpresaShow(Sender: TObject);
begin
  ControlEdit := CEEmpresa;
end;

// Ejercicio
procedure TFMContRec.TSEjercicioShow(Sender: TObject);
begin
  ControlEdit := CEEjercicio;
end;

// Canales
procedure TFMContRec.TSCanalShow(Sender: TObject);
begin
  ControlEdit := CECanal;
end;

// Serie
procedure TFMContRec.TSSerieShow(Sender: TObject);
begin
  ControlEdit := CESerie;
end;

// Serie Simple
procedure TFMContRec.TSSeriesSimplesShow(Sender: TObject);
begin
  ControlEdit := CESerieSimple;
end;

procedure TFMContRec.HYTDBGRowChange(Sender: TObject);
var
  i : integer;
begin
  for i := 0 to PCMain.PageCount - 1 do
     PCMain.Pages[i].TabVisible := True;
end;

procedure TFMContRec.TButtBorrarTodosClick(Sender: TObject);
begin
  if Confirma then
  begin
     DMContRec.BorraTodosTipo(PCMain.ActivePage.TabIndex);
     DMContRec.Refresca;
  end;
end;

end.
