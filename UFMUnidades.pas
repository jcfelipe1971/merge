unit UFMUnidades;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  rxPlacemnt, NsDBGrid, ULFDBEdit, ULFFormStorage, ActnList, ULFActionList,
  ULFToolBar, ULFPanel, ULFPageControl, ULFLabel, UG2kTBLoc,
  UFIBDBEditfind, UComponentesBusquedaFiltrada;

type
  TFMUnidades = class(TFPEdit)
     LBLTipo: TLFLabel;
     LBLTitulo: TLFLabel;
     LBLSigno: TLFLabel;
     LBLDecimales: TLFLabel;
     DBETipo: TLFDbedit;
     DBETitulo: TLFDbedit;
     DBESigno: TLFDbedit;
     DBEDecimales: TLFDbedit;
     TSIdioma: TTabSheet;
     TBIdioma: TLFToolBar;
     NavIdioma: THYMNavigator;
     DBGIdioma: TDBGridFind2000;
     CEIdioma: TControlEdit;
     ControlEdit1PMEdit: TPopUpTeclas;
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormCreate(Sender: TObject);
     procedure NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMUnidades : TFMUnidades;

implementation

uses UDMUnidades, UDMMain, UFormGest, uUtiles;

{$R *.DFM}

procedure TFMUnidades.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMUnidades, DMUnidades);

  NavMain.DataSource := DMUnidades.DSQMUnidades;
  EPMain.DataSource := DMUnidades.DSQMUnidades;
  DBGMain.DataSource := DMUnidades.DSQMUnidades;
  // Color campo ID
  ColorCampoID(DBETipo);
end;

procedure TFMUnidades.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMUnidades);
end;

procedure TFMUnidades.NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  inherited;
  if (Button = nbEdit) then
     Continua := (DMUnidades.QMUnidades.RecordCount > 0);
end;

procedure TFMUnidades.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMUnidades.BusquedaCompleja;
  Continua := False;
end;

end.
