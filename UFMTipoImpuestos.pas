unit UFMTipoImpuestos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  ULFDBEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList, NsDBGrid,
  ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc;

type
  TFMTipoImpuestos = class(TFPEdit)
     LTipo: TLFLabel;
     DBETipo: TLFDbedit;
     LTitulo: TLFLabel;
     DBETitulo: TLFDbedit;
     LPorcentaje: TLFLabel;
     DBEPorcentaje: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMTipoImpuestos : TFMTipoImpuestos;

implementation

uses UDMTipoImpuestos, UFormGest, UDMMain;

{$R *.DFM}

procedure TFMTipoImpuestos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMTipoImpuestos, DMTipoImpuestos);
  NavMain.DataSource := DMTipoImpuestos.DSQMTipoImpuestos;
  DBGMain.DataSource := DMTipoImpuestos.DSQMTipoImpuestos;
end;

procedure TFMTipoImpuestos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMTipoImpuestos);
end;

procedure TFMTipoImpuestos.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMTipoImpuestos.BusquedaCompleja;
end;

end.
