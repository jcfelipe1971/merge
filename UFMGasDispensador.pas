unit UFMGasDispensador;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  rxPlacemnt, NsDBGrid, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, UG2kTBLoc, ULFDBEdit, ULFLabel,
  rxToolEdit, RXDBCtrl, ULFDBDateEdit, ULFDBMemo, TFlatCheckBoxUnit,
  ULFCheckBox, ULFDBCheckBox, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFDBEditFind2000;

type
  TFMGasDispensador = class(TFPEdit)
     LCodigo: TLFLabel;
     LTitulo: TLFLabel;
     DBETitulo: TLFDbedit;
     DBECodigo: TLFDbedit;
     LNotas: TLFLabel;
     DBMNotas: TLFDBMemo;
     Z_LblEstado: TLFLabel;
     DBCBEstado: TLFDBCheckBox;
     DBETituloSerie: TLFDbedit;
     DBEFSerie: TLFDBEditFind2000;
     LSerie: TLFLabel;
     LFDBDistribucion: TLFDBCheckBox;
     LLecturaFinal: TLFLabel;
     DBELecturaFinal: TLFDbedit;
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
  FMGasDispensador : TFMGasDispensador;

implementation

uses UFormGest, UDMGasDispensador, UDMMain;

{$R *.DFM}

procedure TFMGasDispensador.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMGasDispensador, DMGasDispensador);
  NavMain.DataSource := DMGasDispensador.DSQMGasDispensador;
  EPMain.DataSource := DMGasDispensador.DSQMGasDispensador;
  DBGMain.DataSource := DMGasDispensador.DSQMGasDispensador;
  G2kTableLoc.DataSource := DMGasDispensador.DSQMGasDispensador;
end;

procedure TFMGasDispensador.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMGasDispensador);
end;

procedure TFMGasDispensador.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMGasDispensador.BusquedaCompleja;
  Continua := False;
end;

procedure TFMGasDispensador.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

end.
