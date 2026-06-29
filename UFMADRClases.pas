unit UFMADRClases;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  UHYEdits, rxPlacemnt, NsDBGrid, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc, ULFDBEdit;

type
  TFMADRClases = class(TFPEdit)
     DBEClase: TLFDbedit;
     DBETitulo: TLFDbedit;
     LClase: TLFLabel;
     LTitulo: TLFLabel;
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
  FMADRClases : TFMADRClases;

implementation

uses UDMADRClases, UFormGest, UDMMain, UUtiles;

{$R *.DFM}

procedure TFMADRClases.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMADRClases, DMADRClases);
  NavMain.DataSource := DMADRClases.DSQMADRClases;
  EPMain.DataSource := DMADRClases.DSQMADRClases;
  DBGMain.DataSource := DMADRClases.DSQMADRClases;

  // Color campo ID
  ColorCampoID(DBEClase);
end;

procedure TFMADRClases.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMADRClases);
end;

procedure TFMADRClases.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMADRClases.BusquedaCompleja;
end;

procedure TFMADRClases.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

end.
