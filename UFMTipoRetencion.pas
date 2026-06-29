unit UFMTipoRetencion;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, StdCtrls, Mask, DBCtrls, ULFDBEdit, TFlatCheckBoxUnit,
  ULFCheckBox, ULFDBCheckBox, ULFLabel, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid,
  UHYDBGrid, ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel,
  UNavigator, ToolWin, ExtCtrls, ULFPanel, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000;

type
  TFMTipoRetencion = class(TFPEdit)
     LTipoRetencion: TLFLabel;
     LTitulo: TLFLabel;
     DBETipoRetencion: TLFDbedit;
     DBETitulo: TLFDbedit;
     LPorcentajeITBIS: TLFLabel;
     DBEPorcetajeITBIS: TLFDbedit;
     LCuentaITBIS: TLFLabel;
     LPorcetnajeISR: TLFLabel;
     DBEPorcentajeISR: TLFDbedit;
     LCuentaISR: TLFLabel;
     LDBCuentaITBIS: TLFDBEditFind2000;
     LFDCuentaISR: TLFDBEditFind2000;
     DBRGTipoCalc: TDBRadioGroup;
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
  FMTipoRetencion : TFMTipoRetencion;

implementation

uses UDMTipoRetencion, UFormGest, UDMMain;

{$R *.dfm}

procedure TFMTipoRetencion.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMTipoRetencion, DMTipoRetencion);
  NavMain.DataSource := DMTipoRetencion.DSQMTipoRet;
  DBGMain.DataSource := DMTipoRetencion.DSQMTipoRet;
  G2KTableLoc.DataSource := DMTipoRetencion.DSQMTipoRet;
end;

procedure TFMTipoRetencion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMTipoRetencion);
end;

procedure TFMTipoRetencion.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  DMTipoRetencion.BusquedaCompleja;
  Continua := False;
end;

procedure TFMTipoRetencion.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

end.
