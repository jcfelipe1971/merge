unit UFMADRTunelCodes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  UHYEdits, rxPlacemnt, NsDBGrid, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc, ULFDBEdit;

type
  TFMADRTunelCodes = class(TFPEdit)
     DBECodigo: TLFDbedit;
     DBETitulo: TLFDbedit;
     LCodigo: TLFLabel;
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
  FMADRTunelCodes : TFMADRTunelCodes;

implementation

uses UDMADRTunelCodes, UFormGest, UDMMain, UUtiles;

{$R *.DFM}

procedure TFMADRTunelCodes.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMADRTunelCodes, DMADRTunelCodes);
  NavMain.DataSource := DMADRTunelCodes.DSQMADRTunelCodes;
  EPMain.DataSource := DMADRTunelCodes.DSQMADRTunelCodes;
  DBGMain.DataSource := DMADRTunelCodes.DSQMADRTunelCodes;

  // Color campo ID
  ColorCampoID(DBECodigo);
end;

procedure TFMADRTunelCodes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMADRTunelCodes);
end;

procedure TFMADRTunelCodes.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMADRTunelCodes.BusquedaCompleja;
end;

procedure TFMADRTunelCodes.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

end.
