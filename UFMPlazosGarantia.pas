unit UFMPlazosGarantia;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  UHYEdits, rxPlacemnt, NsDBGrid, ULFDBEdit, ULFFormStorage, ActnList,
  ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc;

type
  TFMPlazosGarantia = class(TFPEdit)
     LTipo: TLFLabel;
     LTitulo: TLFLabel;
     DBDias: THYDBEdit;
     DBMeses: THYDBEdit;
     DBAnyos: THYDBEdit;
     LMeses: TLFLabel;
     LDias: TLFLabel;
     LAnyos: TLFLabel;
     DBTipo: TLFDbedit;
     DBTitulo: TLFDbedit;
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
  FMPlazosGarantia : TFMPlazosGarantia;

implementation

uses UDMMain, UDMPlazosGarantia, UFormGest;

{$R *.DFM}

procedure TFMPlazosGarantia.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMPlazosGarantia, DMPlazosGarantia);
  NavMain.DataSource := DMPlazosGarantia.DSQMPlazosGarantia;
  DBGMain.DataSource := DMPlazosGarantia.DSQMPlazosGarantia;
  G2kTableLoc.DataSource := DMPlazosGarantia.DSQMPlazosGarantia;
end;

procedure TFMPlazosGarantia.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPlazosGarantia);
end;

procedure TFMPlazosGarantia.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMPlazosGarantia.BusquedaCompleja;
end;

procedure TFMPlazosGarantia.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
