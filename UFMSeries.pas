unit UFMSeries;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, StdCtrls, Mask, DBCtrls, Menus, UTeclas, UControlEdit,
  UEditPanel, ComCtrls, UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid,
  ExtCtrls, rxPlacemnt, NsDBGrid, ULFDBEdit, ULFFormStorage, ActnList,
  ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc;

type
  TFMSeries = class(TFPEdit)
     LSerie: TLFLabel;
     DBESerie: TLFDbedit;
     LTitulo: TLFLabel;
     DBETitulo: TLFDbedit;
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
  FMSeries : TFMSeries;

implementation

uses UFormGest, UDMSeries;

{$R *.DFM}

procedure TFMSeries.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMSeries, DMSeries);
  NavMain.DataSource := DMSeries.DSSeries;
  DBGMain.DataSource := DMSeries.DSSeries;
end;

procedure TFMSeries.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMSeries);
end;

procedure TFMSeries.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMSeries.BusquedaCompleja;
  Continua := False;
end;

procedure TFMSeries.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

end.
