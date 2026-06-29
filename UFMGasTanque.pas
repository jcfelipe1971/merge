unit UFMGasTanque;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  rxPlacemnt, NsDBGrid, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, UG2kTBLoc, ULFDBEdit, ULFLabel,
  rxToolEdit, RXDBCtrl, ULFDBDateEdit, ULFDBMemo, UHYDescription,
  ULFHYDBDescription, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFDBEditFind2000, TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox;

type
  TFMGasTanque = class(TFPEdit)
     LCodigo: TLFLabel;
     LLey: TLFLabel;
     DBETitulo: TLFDbedit;
     DBECodigo: TLFDbedit;
     LDescripcion: TLFLabel;
     DBMNotas: TLFDBMemo;
     LPorcFinanciacion: TLFLabel;
     DBEEvaporacion: TLFDbedit;
     LFLCapacidad: TLFLabel;
     LFDCapacidad: TLFDbedit;
     LblAlmSalida: TLFLabel;
     DBEFAlmacen: TLFDBEditFind2000;
     LFLArticulo: TLFLabel;
     LFDBEArticulo: TLFDBEditFind2000;
     LBLTarifa: TLFLabel;
     DBEFTarifa: TLFDBEditFind2000;
     DBCBEstado: TLFDBCheckBox;
     DBESerie: TLFDBEditFind2000;
     LFSerie: TLFLabel;
     LFDBSerie: TLFDbedit;
     LFDBAlmacen: TLFDbedit;
     LFDBArticulo: TLFDbedit;
     LFDBTarifa: TLFDbedit;
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
  FMGasTanque : TFMGasTanque;

implementation

uses UFormGest, UDMGasTanque, UDMMain;

{$R *.DFM}

procedure TFMGasTanque.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMGasTanque, DMGasTanque);
  NavMain.DataSource := DMGasTanque.DSQMGasTanque;
  EPMain.DataSource := DMGasTanque.DSQMGasTanque;
  DBGMain.DataSource := DMGasTanque.DSQMGasTanque;
  G2kTableLoc.DataSource := DMGasTanque.DSQMGasTanque;
end;

procedure TFMGasTanque.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMGasTanque);
end;

procedure TFMGasTanque.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMGasTanque.BusquedaCompleja;
  Continua := False;
end;

procedure TFMGasTanque.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

end.
