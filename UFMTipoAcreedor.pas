unit UFMTipoAcreedor;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  UHYEdits, rxPlacemnt, NsDBGrid, ULFDBEdit, ULFFormStorage, ActnList,
  ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc;

type
  TFMTipoAcreedor = class(TFPEdit)
     DBTitulo: THYDBEdit;
     LBTipo: TLFLabel;
     LBTitulo: TLFLabel;
     DBTipo: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMTipoAcreedor : TFMTipoAcreedor;

implementation

uses UDMMain, UDMTipoAcreedor, UFormGest;

{$R *.DFM}

procedure TFMTipoAcreedor.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMTipoAcreedor, DMTipoAcreedor);
  NavMain.DataSource := DMTipoAcreedor.DSQMTipoAcreedor;
  DBGMain.DataSource := DMTipoAcreedor.DSQMTipoAcreedor;
end;

procedure TFMTipoAcreedor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMTipoAcreedor);
end;

procedure TFMTipoAcreedor.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMTipoAcreedor.BusquedaCompleja;
end;

end.
