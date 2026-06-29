unit UFMTipoIMPuestoAdicional;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, StdCtrls, DBCtrls, Mask, Menus, UTeclas, UControlEdit,
  UEditPanel, ComCtrls, UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid,
  ExtCtrls, rxPlacemnt, NsDBGrid, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000, ULFDBCheckBox,
  ULFDBEdit, ULFFormStorage, ActnList, ULFActionList, ULFPageControl,
  ULFToolBar, ULFPanel, TFlatCheckBoxUnit, ULFCheckBox, ULFLabel, UG2kTBLoc;

type
  TFMTipoImpuestoAdicional = class(TFPEdit)
     LTipo: TLFLabel;
     DBETipo: TLFDbedit;
     LTitulo: TLFLabel;
     DBETitulo: TLFDbedit;
     DBCBActivo: TLFDBCheckBox;
     DBEPorcentaje: TLFDbedit;
     LPorcentaje: TLFLabel;
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
  FMTipoImpuestoAdicional : TFMTipoImpuestoAdicional;

implementation

uses UDMTipoIMPuestoAdicional, UFormGest, UDMMain;

{$R *.DFM}

procedure TFMTipoImpuestoAdicional.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMTipoImpuestoAdicional, DMTipoImpuestoAdicional);
  NavMain.DataSource := DMTipoIMPuestoAdicional.DSQMTipoImpuestoAdicional;
  DBGMain.DataSource := DMTipoIMPuestoAdicional.DSQMTipoImpuestoAdicional;
  G2kTableLoc.DataSource := DMTipoIMPuestoAdicional.DSQMTipoImpuestoAdicional;
end;

procedure TFMTipoImpuestoAdicional.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  CierraData(DMTipoIMPuestoAdicional);
end;

procedure TFMTipoImpuestoAdicional.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMTipoIMPuestoAdicional.BusquedaCompleja;
  Continua := False;
end;

procedure TFMTipoImpuestoAdicional.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

end.
