unit UFMAsignacionCodigoBarra;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, ULFPanel, StdCtrls, ULFComboBox, ULFLabel,
  UNavigator, Grids, DBGrids, NsDBGrid, UFIBDBEditfind,
  UComponentesBusquedaFiltrada;

type
  TFMAsignacionCodigoBarra = class(TFPEditSinNavegador)
     PNLTipoCodigoBarra: TLFPanel;
     LTipoCodigoBarra: TLFLabel;
     CBTipoCodigoBarra: TLFComboBox;
     NavMain: THYMNavigator;
     TSep1: TToolButton;
     DBGMain: TDBGridFind2000;
     TSep2: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure CBTipoCodigoBarraChange(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGMainKeyPress(Sender: TObject; var Key: char);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Filtrar(Filtro: string);
  end;

var
  FMAsignacionCodigoBarra : TFMAsignacionCodigoBarra;

implementation

uses
  UDMMain, UDMAsignacionCodigoBarra, UFormGest;

{$R *.dfm}

procedure TFMAsignacionCodigoBarra.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMAsignacionCodigoBarra, DMAsignacionCodigoBarra);
  NavMain.DataSource := DMAsignacionCodigoBarra.DSQMCodigosBarra;
  DBGMain.DataSource := DMAsignacionCodigoBarra.DSQMCodigosBarra;

  DMAsignacionCodigoBarra.RellenaTipoCodigoBarra(CBTipoCodigoBarra.Items);
  CBTipoCodigoBarra.ItemIndex := 0;
  CBTipoCodigoBarraChange(Sender);
end;

procedure TFMAsignacionCodigoBarra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMAsignacionCodigoBarra);
end;

procedure TFMAsignacionCodigoBarra.CBTipoCodigoBarraChange(Sender: TObject);
begin
  inherited;
  DMAsignacionCodigoBarra.FiltraTipo(integer(CBTipoCodigoBarra.Items.Objects[CBTipoCodigoBarra.ItemIndex]));
end;

procedure TFMAsignacionCodigoBarra.DBGMainKeyPress(Sender: TObject; var Key: char);
begin
  inherited;
  // Si presionan ENTER, Guardo y salto a siguiente linea
  if (Key = #13) then
     DMAsignacionCodigoBarra.NextCodigoBarra;
end;

procedure TFMAsignacionCodigoBarra.Filtrar(Filtro: string);
begin
  DMAsignacionCodigoBarra.Filtrar(Filtro);
end;

end.
