unit UFMVentasArt;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, ComCtrls,
  ExtCtrls, UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid, UControlEdit,
  URightMaskEdit, UFormGest, Mask, DBCtrls, UEditPanel, NsDBGrid,
  ULFDBEdit, ULFPanel, ULFToolBar, ULFCheckBox, ULFEditFind2000,
  TFlatCheckBoxUnit, ULFLabel, UFPEditSinNavegador, rxPlacemnt,
  ULFFormStorage, ActnList, ULFActionList, Menus, UTeclas;

type
  TFMVentasArt = class(TFPEditSinNavegador)
     DBGFClientesArt: TDBGridFind2000;
     TSepOpciones: TToolButton;
     PNLTotal: TLFPanel;
     RMETotalVentas: THYGRightEdit;
     LTotalUnidades: TLFLabel;
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
     RMETotalUnidades: THYGRightEdit;
     LTotalImporte: TLFLabel;
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
     Articulo: string;
     Modo: smallint;
     id_articulo: integer;
     Actualizando: boolean;
  public
     { Public declarations }
     procedure MuestraArticulo(aArticulo: string; aModo, id_a: integer);
  end;

var
  FMVentasArt : TFMVentasArt;

implementation

uses UDMMain, UDMVentasArt, UEntorno, UUtiles;

{$R *.DFM}

procedure TFMVentasArt.FormCreate(Sender: TObject);
var
  c : integer;
begin
  inherited;
  AbreData(TDMVentasArt, DMVentasArt);

  DBGFClientesArt.DataSource := DMVentasArt.DSxVentasCliente;
  Actualizando := False;
  DBEFMoneda.Text := REntorno.Moneda;
  if REntorno.PVP_Ud_Sec then
  begin
     c := EncuentraField(DBGFClientesArt, 'UNIDADES_SEC');
     if (c >= 0) then
     begin
        DBGFClientesArt.Columns[c].Visible := True;
        DBGFClientesArt.Columns[c].Width := 60;
     end;
     c := EncuentraField(DBGFClientesArt, 'TITULO');
     if (c >= 0) then
        DBGFClientesArt.Columns[c].Width := DBGFClientesArt.Columns[c].Width - 60;
  end;
end;

procedure TFMVentasArt.MuestraArticulo(aArticulo: string; aModo, id_a: integer);
var
  TotalVentas, TotalUnidades : double;
begin
  Articulo := aArticulo;
  Modo := aModo;
  id_articulo := id_a;
  case modo of
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
  DMVentasArt.ActualizaTabla(Articulo, Modo, id_articulo, TotalVentas, TotalUnidades, DBEFMoneda.Text);
  RMETotalVentas.Text := FormatFloat(DMVentasArt.LocalMascaraN, TotalVentas);
  RMETotalUnidades.Text := FormatFloat(DMVentasArt.LocalMascaraN, TotalUnidades);
  ShowModal;
end;

procedure TFMVentasArt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMVentasArt);
end;

procedure TFMVentasArt.CBEjercicioClick(Sender: TObject);
var
  TotalVentas, TotalUnidades : double;
begin
  if not Actualizando then
  begin
     if (CBEjercicio.Checked) then
     begin
        Actualizando := True;
        CBCanal.Checked := True;
        CBSerie.Checked := True;
        Actualizando := False;
        DMVentasArt.ActualizaTabla(Articulo, 0, id_articulo, TotalVentas, TotalUnidades, DBEFMoneda.Text);
     end
     else
     begin
        Actualizando := True;
        CBCanal.Checked := False;
        CBSerie.Checked := False;
        Actualizando := False;
        DMVentasArt.ActualizaTabla(Articulo, Modo, id_articulo, TotalVentas, TotalUnidades, DBEFMoneda.Text);
     end;
     RMETotalVentas.Text := FormatFloat(DMVentasArt.LocalMascaraN, TotalVentas);
     RMETotalUnidades.Text := FormatFloat(DMVentasArt.LocalMascaraN, TotalUnidades);
  end;
end;

procedure TFMVentasArt.CBCanalClick(Sender: TObject);
var
  TotalVentas, TotalUnidades : double;
begin
  if not Actualizando then
  begin
     if (CBCanal.Checked) then
     begin
        Actualizando := True;
        CBSerie.Checked := True;
        Actualizando := False;
        DMVentasArt.ActualizaTabla(Articulo, 1, id_articulo, TotalVentas, TotalUnidades, DBEFMoneda.Text);
     end
     else
     begin
        Actualizando := True;
        CBEjercicio.Checked := False;
        CBSerie.Checked := False;
        Actualizando := False;
        DMVentasArt.ActualizaTabla(Articulo, Modo, id_articulo, TotalVentas, TotalUnidades, DBEFMoneda.Text);
     end;
     RMETotalVentas.Text := FormatFloat(DMVentasArt.LocalMascaraN, TotalVentas);
     RMETotalUnidades.Text := FormatFloat(DMVentasArt.LocalMascaraN, TotalUnidades);
  end;
end;

procedure TFMVentasArt.CBSerieClick(Sender: TObject);
var
  TotalVentas, TotalUnidades : double;
begin
  if not Actualizando then
  begin
     if (CBSerie.Checked) then
        DMVentasArt.ActualizaTabla(Articulo, 2, id_articulo, TotalVentas, TotalUnidades, DBEFMoneda.Text)
     else
     begin
        Actualizando := True;
        CBEjercicio.Checked := False;
        CBCanal.Checked := False;
        Actualizando := False;
        DMVentasArt.ActualizaTabla(Articulo, Modo, id_articulo, TotalVentas, TotalUnidades, DBEFMoneda.Text);
     end;
     RMETotalVentas.Text := FormatFloat(DMVentasArt.LocalMascaraN, TotalVentas);
     RMETotalUnidades.Text := FormatFloat(DMVentasArt.LocalMascaraN, TotalUnidades);
  end;
end;

procedure TFMVentasArt.TButtImprimirClick(Sender: TObject);
begin
  DMVentasArt.Visualizar(DBEFMoneda.Text);
end;

procedure TFMVentasArt.TButtConfigurarClick(Sender: TObject);
begin
  DMVentasArt.Configurar;
end;

procedure TFMVentasArt.DBEFMonedaChange(Sender: TObject);
var
  TotalVentas, TotalUnidades : double;
begin
  DMVentasArt.CambiaMoneda(DBEFMoneda.Text);
  DMVentasArt.ActualizaTabla(Articulo, Modo, id_articulo, TotalVentas, TotalUnidades, DBEFMoneda.Text);
  RMETotalVentas.Text := FormatFloat(DMVentasArt.LocalMascaraN, TotalVentas);
  RMETotalUnidades.Text := FormatFloat(DMVentasArt.LocalMascaraN, TotalUnidades);
end;

end.
