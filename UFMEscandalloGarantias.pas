unit UFMEscandalloGarantias;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, UNavigator, Grids, DBGrids, ComCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, StdCtrls, Mask, DBCtrls, NsDBGrid,
  UControlEdit, DB, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UHYDBGrid, ULFToolBar, UG2kTBLoc,
  ULFPageControl, UEditPanel, ToolWin, ULFPanel, ULFLabel;

type
  TFMEscandalloGarantias = class(TFPEdit)
     PNLDetalle: TPanel;
     DBGDetalle: TDBGridFind2000;
     LArticulo: TLabel;
     DBEFArticulo: TDBEditFind2000;
     DBEDescripcion: TDBEdit;
     LDescripcion: TLabel;
     LNroEtiquetas: TLabel;
     DBENroEtiquetas: TDBEdit;
     NavDetalle: THYMNavigator;
     EFArticulo: TEditFind2000;
     PNLEscandallo: TPanel;
     PNLFiltro: TLFPanel;
     LEscandallo: TLFLabel;
     TBDetalle: TLFToolBar;
     procedure FormShow(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBEFArticuloExiste(Sender: TObject);
     procedure EFArticuloChange(Sender: TObject);
     procedure NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
     procedure FormCreate(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMEscandalloGarantias : TFMEscandalloGarantias;

implementation

uses UDMEscandalloGarantias, UDMMain, UFormGest, UEntorno, UDameDato;

{$R *.DFM}

procedure TFMEscandalloGarantias.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMEscandalloGarantias, DMEscandalloGarantias);

  NavMain.DataSource := DMEscandalloGarantias.DSxEscandalloGarantia;
  DBGMain.DataSource := DMEscandalloGarantias.DSxEscandalloGarantia;
  G2kTableLoc.DataSource := DMEscandalloGarantias.DSxEscandalloGarantia;
end;

procedure TFMEscandalloGarantias.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMEscandalloGarantias);
end;

procedure TFMEscandalloGarantias.FormShow(Sender: TObject);
begin
  inherited;
  if not DMEscandalloGarantias.xEscandalloGarantia.Transaction.InTransaction then
     DMEscandalloGarantias.xEscandalloGarantia.Transaction.StartTransaction;
  DMEscandalloGarantias.xEscandalloGarantia.Close;
  DMEscandalloGarantias.xEscandalloGarantia.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  DMEscandalloGarantias.xEscandalloGarantia.Open;
  PCMain.ActivePage := TSFicha;
end;

procedure TFMEscandalloGarantias.DBEFArticuloExiste(Sender: TObject);
begin
  if ((DMEscandalloGarantias.xEscandalloGarantia.State = dsInsert) and (DBEDescripcion.Text = '')) then
     DMEscandalloGarantias.xEscandalloGarantiaDESCRIPCION.AsString := DameTituloArticulo(DBEFArticulo.Text);
end;

procedure TFMEscandalloGarantias.EFArticuloChange(Sender: TObject);
begin
  if (Trim(EFArticulo.Text) = '') then
     with DMEscandalloGarantias.xEscandalloGarantia do
     begin
        Close;
        SelectSQL.Text := 'SELECT * FROM ART_ARTICULOS_ESC_GARANTIA WHERE EMPRESA=?EMPRESA ORDER BY ARTICULO';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Open;
     end
  else
  begin
     with DMEscandalloGarantias.xEscandalloGarantia do
     begin
        Close;
        SelectSQL.Text := 'SELECT * FROM ART_ARTICULOS_ESC_GARANTIA WHERE EMPRESA=?EMPRESA AND ARTICULO STARTING WITH ?ARTICULO';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ARTICULO'].AsString := EFArticulo.Text;
        Open;
     end;
  end;
end;

procedure TFMEscandalloGarantias.NavMainBeforeAction(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if (Button = nbInsert) then
  begin
     DBEFArticulo.Enabled := True;
     DBEFArticulo.Color := clWindow;
     DBEFArticulo.SetFocus;
  end
  else
  begin
     DBEFArticulo.Enabled := False;
     DBEFArticulo.Color := clInfoBk;
  end;
  if Button = nbEdit then
     DBEDescripcion.SetFocus;
end;

procedure TFMEscandalloGarantias.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
