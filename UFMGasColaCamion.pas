unit UFMGasColaCamion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  rxPlacemnt, NsDBGrid, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, UG2kTBLoc, ULFDBEdit, ULFLabel,
  rxToolEdit, RXDBCtrl, ULFDBDateEdit, ULFDBMemo, TFlatCheckBoxUnit,
  ULFCheckBox, ULFDBCheckBox;

type
  TFMGasColaCamion = class(TFPEdit)
     LCodigo: TLFLabel;
     LLey: TLFLabel;
     DBETitulo: TLFDbedit;
     DBECodigo: TLFDbedit;
     LNotas: TLFLabel;
     DBMNotas: TLFDBMemo;
     LFLCapacidad: TLFLabel;
     LFDCapacidad: TLFDbedit;
     DBCBEstado: TLFDBCheckBox;
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
  FMGasColaCamion : TFMGasColaCamion;

implementation

uses UFormGest, UDMGasColaCamion, UDMMain;

{$R *.DFM}

procedure TFMGasColaCamion.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMGasColaCamion, DMGasColaCamion);
  NavMain.DataSource := DMGasColaCamion.DSQMGasColaCamion;
  EPMain.DataSource := DMGasColaCamion.DSQMGasColaCamion;
  DBGMain.DataSource := DMGasColaCamion.DSQMGasColaCamion;
  G2kTableLoc.DataSource := DMGasColaCamion.DSQMGasColaCamion;
end;

procedure TFMGasColaCamion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMGasColaCamion);
end;

procedure TFMGasColaCamion.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMGasColaCamion.BusquedaCompleja;
  Continua := False;
end;

procedure TFMGasColaCamion.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

end.
