unit UFMNaturalezaMat;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, StdCtrls, Mask, DBCtrls, Menus, UTeclas, UControlEdit,
  UEditPanel, ComCtrls, UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid,
  ExtCtrls, rxPlacemnt, NsDBGrid, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, ULFDBEdit;

type
  TFMNaturalezaMat = class(TFPEdit)
     LBLNaturaleza: TLFLabel;
     DBENaturaleza: TLFDBEdit;
     LBLTitulo: TLFLabel;
     DBETitulo: TLFDBEdit;
     DBCHKDefecto: TLFDBCheckBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMNaturalezaMat : TFMNaturalezaMat;

implementation

uses UDMNaturalezaMat, UFormGest, UDMMain, uUtiles;

{$R *.DFM}

procedure TFMNaturalezaMat.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMNaturalezaMat, DMNaturalezaMat);
  NavMain.DataSource := DMNaturalezaMat.DSQMNaturalezaMat;
  DBGMain.DataSource := DMNaturalezaMat.DSQMNaturalezaMat;
  G2kTableLoc.DataSource := DMNaturalezaMat.DSQMNaturalezaMat;
  CEMainPMEdit.Teclas := DMMain.Teclas;

  // Color campo ID
  ColorCampoID(DBENaturaleza);
end;

procedure TFMNaturalezaMat.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMNaturalezaMat);
end;

procedure TFMNaturalezaMat.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMNaturalezaMat.BusquedaCompleja;
  Continua := False;
end;

procedure TFMNaturalezaMat.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
