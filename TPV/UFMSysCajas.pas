unit UFMSysCajas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  UHYEdits, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList, NsDBGrid,
  ULFPageControl, ULFToolBar, ULFPanel, ULFDBEdit, UG2kTBLoc;

type
  TFMSysCajas = class(TFPEdit)
     LBTipo: TLabel;
     LBTitulo: TLabel;
     DBCaja: TLFDbedit;
     DBTitulo: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMSysCajas : TFMSysCajas;

implementation

uses UDMMain, UDMSysCajas, UFormGest;

{$R *.DFM}

procedure TFMSysCajas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMSysCajas, DMSysCajas);
  NavMain.DataSource := DMSysCajas.DSQMSysCajas;
  DBGMain.DataSource := DMSysCajas.DSQMSysCajas;
end;

procedure TFMSysCajas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMSysCajas);
  Action := caFree;
end;

procedure TFMSysCajas.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMSysCajas.BusquedaCompleja;
end;

end.
