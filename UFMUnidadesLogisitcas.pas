unit UFMUnidadesLogisitcas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox;

type
  TFMUnidadesLogisitcas = class(TFPEdit)
     LUnidad: TLFLabel;
     LTitulo: TLFLabel;
     LUnidades: TLFLabel;
     DBETipo: TLFDbedit;
     DBETitulo: TLFDbedit;
     DBEUnidades: TLFDbedit;
     DBCHKCambio: TLFDBCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMUnidadesLogisitcas : TFMUnidadesLogisitcas;

implementation

uses UDMUnidadesLogisitcas, UDMMain, UFormGest, uUtiles;

{$R *.dfm}

procedure TFMUnidadesLogisitcas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMUnidadesLogisitcas, DMUnidadesLogisitcas);
  NavMain.DataSource := DMUnidadesLogisitcas.DSQMUnidadesLogisticas;
  DBGMain.DataSource := DMUnidadesLogisitcas.DSQMUnidadesLogisticas;

  // Color campo ID
  ColorCampoID(DBETipo);
end;

procedure TFMUnidadesLogisitcas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMUnidadesLogisitcas);
end;

procedure TFMUnidadesLogisitcas.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.DataSource := DMUnidadesLogisitcas.DSQMUnidadesLogisticas;
  G2kTableLoc.Click;
end;

end.
