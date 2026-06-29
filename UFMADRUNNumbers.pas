unit UFMADRUNNumbers;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  UHYEdits, rxPlacemnt, NsDBGrid, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc, ULFDBEdit;

type
  TFMADRUNNumbers = class(TFPEdit)
     DBENumeroUN: TLFDbedit;
     DBETitulo: TLFDbedit;
     LNumeroUN: TLFLabel;
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
  FMADRUNNumbers : TFMADRUNNumbers;

implementation

uses UDMADRUNNumbers, UFormGest, UDMMain, UUtiles;

{$R *.DFM}

procedure TFMADRUNNumbers.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMADRUNNumbers, DMADRUNNumbers);
  NavMain.DataSource := DMADRUNNumbers.DSQMADRUNNumbers;
  EPMain.DataSource := DMADRUNNumbers.DSQMADRUNNumbers;
  DBGMain.DataSource := DMADRUNNumbers.DSQMADRUNNumbers;

  // Color campo ID
  ColorCampoID(DBENumeroUN);
end;

procedure TFMADRUNNumbers.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMADRUNNumbers);
end;

procedure TFMADRUNNumbers.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMADRUNNumbers.BusquedaCompleja;
end;

procedure TFMADRUNNumbers.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

end.
