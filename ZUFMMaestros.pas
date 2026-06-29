unit ZUFMMaestros;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, rxPlacemnt, NsDBGrid,
  ULFFormStorage, ActnList, ULFActionList, ULFPageControl, ULFToolBar,
  ULFPanel, ULFDBEdit, UG2kTBLoc, ULFLabel;

type
  TZFMMaestros = class(TFPEdit)
     LblCodigo: TLFLabel;
     DBECodigo: TLFDbedit;
     LblDescripcion: TLFLabel;
     DBEDescripcion: TLFDbedit;
     EFTipoMaestros: TFIBHYGEditFind;
     PSeleccion: TLFPanel;
     LblSeleccion: TLFLabel;
     LCantidad: TLFLabel;
     DBECantidad: TLFDbedit;
     LPorcentaje: TLFLabel;
     DBEPorcentaje: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFTipoMaestrosChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
     Maestro: string;
  end;

var
  ZFMMaestros : TZFMMaestros;

implementation

{$R *.DFM}

uses UDMMain, UFormGest, UFMain, ZUDMMaestros;

procedure TZFMMaestros.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TZDMMaestros, ZDMMaestros);

  NavMain.DataSource := ZDMMaestros.DSQMTablasMaestras;
  EPMain.DataSource := ZDMMaestros.DSQMTablasMaestras;
  DBGMain.DataSource := ZDMMaestros.DSQMTablasMaestras;
  CEMainPMEdit.Teclas := DMMain.teclas;
  G2KTableLoc.DataSource := ZDMMaestros.DSQMTablasMaestras;

  {sfg.rsp Maestro := FMain.TipoMaestro;
  EFTipoMaestros.Text := Maestro;
  if (EFTipoMaestros.Text <> '') then
  begin
     EFTipoMaestrosChange(Self);
     EFTipoMaestros.Enabled := False;
  end;}
end;

procedure TZFMMaestros.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  Action := caFree;
  CierraData(ZDMMaestros);
end;

procedure TZFMMaestros.EFTipoMaestrosChange(Sender: TObject);
begin
  inherited;
  ZDMMaestros.FiltrarTablasMaestras(EFTipoMaestros.Text);
  Caption := Format(_('Mantenimiento del %s'), [ZDMMaestros.xTiposTablasMaestrasDESC_TIPO_AUX.AsString]);
  G2KTableLoc.CondicionBusqueda := 'TIPO_AUX=''' + ZDMMaestros.xTiposTablasMaestrasTIPO_AUX.AsString + '''';
end;

procedure TZFMMaestros.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
