unit UFMVentasCli;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, ComCtrls,
  ExtCtrls, UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid, UControlEdit,
  URightMaskEdit, UFormGest, Mask, DBCtrls, UEditPanel, NsDBGrid,
  ULFDBEdit, ULFCheckBox, ULFPanel, ULFToolBar, ULFEditFind2000,
  TFlatCheckBoxUnit, ULFLabel, UFPEditSimple, rxPlacemnt, ULFFormStorage,
  ActnList, ULFActionList, Menus, UTeclas;

type
  TFMVentasCli = class(TFPEditSimple)
     DBGFArticulosCli: TDBGridFind2000;
     TSepOpciones: TToolButton;
     TBTotales: TLFToolBar;
     PNLTotal: TLFPanel;
     RMETotal: THYGRightEdit;
     LBLTotal: TLFLabel;
     TButtImprimir: TToolButton;
     TButtConfigurar: TToolButton;
     ToolButton4: TToolButton;
     ToolButton5: TToolButton;
     PNLOpciones: TLFPanel;
     CBEjercicio: TLFCheckBox;
     CBCanal: TLFCheckBox;
     CBSerie: TLFCheckBox;
     PNLMoneda: TLFPanel;
     LBLMoneda: TLFLabel;
     DBEFMoneda: TLFEditFind2000;
     DBETitMoneda: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure CBCanalClick(Sender: TObject);
     procedure CBSerieClick(Sender: TObject);
     procedure CBEjercicioClick(Sender: TObject);
     procedure TButtImprimirClick(Sender: TObject);
     procedure TButtConfigurarClick(Sender: TObject);
     procedure DBEFMonedaChange(Sender: TObject);
  private
     { Private declarations }
     Cliente: integer;
     Modo: smallint;
     NoActualiza: smallint;
  public
     { Public declarations }
     procedure MuestraCliente(aCliente, aModo: integer);
  end;

var
  FMVentasCli : TFMVentasCli;

implementation

uses UDMMain, UDMVentasCli, UEntorno, UUtiles;

{$R *.DFM}

procedure TFMVentasCli.FormCreate(Sender: TObject);
var
  c : integer;
begin
  inherited;

  AbreData(TDMVentasCli, DMVentasCli);
  DBGFArticulosCli.DataSource := DMVentasCli.DSxVentasCliente;
  NoActualiza := 0;
  DBEFMoneda.Text := REntorno.Moneda;
  if REntorno.PVP_Ud_Sec then
  begin
     c := EncuentraField(DBGFArticulosCli, 'UNIDADES_SEC');
     if (c >= 0) then
     begin
        DBGFArticulosCli.Columns[c].Visible := True;
        DBGFArticulosCli.Columns[c].Width := 60;
     end;
     c := EncuentraField(DBGFArticulosCli, 'TITULO');
     if (c >= 0) then
        DBGFArticulosCli.Columns[c].Width := DBGFArticulosCli.Columns[c].Width - 60;
  end;
end;

procedure TFMVentasCli.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMVentasCli);
end;

procedure TFMVentasCli.MuestraCliente(aCliente, aModo: integer);
var
  Total : double;
begin
  Cliente := aCliente;
  Modo := aModo;
  case Modo of
     0:
     begin
        CBEjercicio.Visible := False;
        CBCanal.Visible := False;
        CBSerie.Visible := False;
     end;
     1:
     begin
        CBCanal.Visible := False;
        CBSerie.Visible := False;
     end;
     2:
     begin
        CBSerie.Visible := False;
     end;
  end;

  DMVentasCli.ActualizaTabla(Cliente, Modo, Total, DBEFMoneda.Text);
  RMETotal.Text := FormatFloat(DMVentasCli.LocalMascaraN, Total);
  ShowModal;
end;

procedure TFMVentasCli.CBEjercicioClick(Sender: TObject);
var
  Total : double;
begin
  if NoActualiza = 0 then
  begin
     if (CBEjercicio.Checked) then
     begin
        NoActualiza := 1;
        CBCanal.Checked := True;
        CBSerie.Checked := True;
        NoActualiza := 0;
        DMVentasCli.ActualizaTabla(Cliente, 0, Total, DBEFMoneda.Text);
     end
     else
     begin
        NoActualiza := 1;
        CBCanal.Checked := False;
        CBSerie.Checked := False;
        NoActualiza := 0;
        DMVentasCli.ActualizaTabla(Cliente, Modo, Total, DBEFMoneda.Text);
     end;
     RMETotal.Text := FormatFloat(DMVentasCli.LocalMascaraN, total);
  end;
end;

procedure TFMVentasCli.CBCanalClick(Sender: TObject);
var
  Total : double;
begin
  if NoActualiza = 0 then
  begin
     if (CBCanal.Checked) then
     begin
        NoActualiza := 1;
        CBSerie.Checked := True;
        NoActualiza := 0;
        DMVentasCli.ActualizaTabla(Cliente, 1, Total, DBEFMoneda.Text);
     end
     else
     begin
        NoActualiza := 1;
        CBEjercicio.Checked := False;
        CBSerie.Checked := False;
        NoActualiza := 0;
        DMVentasCli.ActualizaTabla(Cliente, Modo, Total, DBEFMoneda.Text);
     end;
     RMETotal.Text := FormatFloat(DMVentasCli.LocalMascaraN, total);
  end;
end;

procedure TFMVentasCli.CBSerieClick(Sender: TObject);
var
  Total : double;
begin
  if NoActualiza = 0 then
  begin
     if (CBSerie.Checked) then
        DMVentasCli.ActualizaTabla(Cliente, 2, Total, DBEFMoneda.Text)
     else
     begin
        NoActualiza := 1;
        CBEjercicio.Checked := False;
        CBCanal.Checked := False;
        NoActualiza := 0;
        DMVentasCli.ActualizaTabla(Cliente, Modo, Total, DBEFMoneda.Text);
     end;
     RMETotal.Text := FormatFloat(DMVentasCli.LocalMascaraN, Total);
  end;
end;

procedure TFMVentasCli.TButtImprimirClick(Sender: TObject);
begin
  DMVentasCli.Visualizar(DBEFMoneda.Text);
end;

procedure TFMVentasCli.TButtConfigurarClick(Sender: TObject);
begin
  DMVentasCli.Configurar;
end;

procedure TFMVentasCli.DBEFMonedaChange(Sender: TObject);
var
  Total : double;
begin
  DMVentasCli.CambiaMoneda(DBEFMoneda.Text);
  DMVentasCli.ActualizaTabla(Cliente, Modo, Total, DBEFMoneda.Text);
  RMETotal.Text := FormatFloat(DMVentasCli.LocalMascaraN, Total);
end;

end.
