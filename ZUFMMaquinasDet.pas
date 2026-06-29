unit ZUFMMaquinasDet;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, UDBDateTimePicker,
  StdCtrls, Mask, DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  rxPlacemnt, NsDBGrid, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFDBMemo, ULFDBEditFind2000,
  ULFDBEdit, rxToolEdit, RXDBCtrl, UG2kTBLoc, ULFLabel, UHYDescription,
  ULFHYDBDescription;

type
  TZFMMaquinasDet = class(TFPEdit)
     LRIG: TLFLabel;
     LObservaciones: TLFLabel;
     DBMNotas: TLFDBMemo;
     PDetalle: TLFPanel;
     TBDetalle: TLFToolBar;
     NavDetalle: THYMNavigator;
     DBGFDetalle: TDBGridFind2000;
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     LFDBCodMaq: TLFDBEditFind2000;
     DBDescMaquina: TLFDbedit;
     LHorasCambioPlancha: TLFLabel;
     LCambioPlancha: TLFLabel;
     LFDBCambioPlancha: TLFDbedit;
     LFDBTiempoCambio: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure LFDBCodMaqChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ZFMMaquinasDet : TZFMMaquinasDet;

implementation

uses ZUDMMaquinasDet, UFormGest, UDMMain;

{$R *.DFM}

procedure TZFMMaquinasDet.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TZDMMaquinasDet, ZDMMaquinasDet);
  NavMain.DataSource := ZDMMaquinasDet.DSQMMaquinasC;
  EPMain.DataSource := ZDMMaquinasDet.DSQMMaquinasC;
  DBGMain.DataSource := ZDMMaquinasDet.DSQMMaquinasC;
  NavDetalle.DataSource := ZDMMaquinasDet.DSQMMaquinasD;
  DBGFDetalle.DataSource := ZDMMaquinasDet.DSQMMaquinasD;
  G2KTableLoc.DataSource := ZDMMaquinasDet.DSQMMaquinasC;
end;

procedure TZFMMaquinasDet.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMMaquinasDet);
end;

procedure TZFMMaquinasDet.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ZDMMaquinasDet.BusquedaCompleja;
end;

procedure TZFMMaquinasDet.LFDBCodMaqChange(Sender: TObject);
begin
  inherited;
  ZDMMaquinasDet.DescMaquina(StrToIntDef(LFDBCodMaq.Text, 0));
end;

procedure TZFMMaquinasDet.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

end.
