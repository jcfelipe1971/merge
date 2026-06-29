unit UProFMDesTipoMat;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditDetalle, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel;

type
  TProFMDesTipoMat = class(TFPEditDetalle)
     LTipo: TLFLabel;
     LDescripcion: TLFLabel;
     LFDTipo: TLFDbedit;
     LFDesc: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFMDesTipoMat : TProFMDesTipoMat;

implementation

uses UProDMDesTipoMat, UFormGest, UDMMain;

{$R *.dfm}

procedure TProFMDesTipoMat.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMDesTipoMat, ProDMDesTipoMat);
  Navmain.DataSource := ProDMDesTipoMat.DSCabTipoMat;
end;

procedure TProFMDesTipoMat.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMDesTipoMat);
end;

procedure TProFMDesTipoMat.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ProDMDesTipoMat.BusquedaCompleja;
  Continua := False;
end;

end.
