unit UFMComprasProv;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, ComCtrls,
  ExtCtrls, UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid, UControlEdit,
  URightMaskEdit, UFormGest, Mask, DBCtrls, UEditPanel, NsDBGrid,
  ULFDBEdit, ULFCheckBox, ULFPanel, ULFToolBar, ULFEditFind2000,
  TFlatCheckBoxUnit, ULFLabel;

type
  TFMComprasProv = class(TG2KForm)
     TBMain: TLFToolBar;
     DBGFArticulosCli: TDBGridFind2000;
     PNLTotal: TLFPanel;
     RMETotal: THYGRightEdit;
     LBLTotal: TLFLabel;
     TSepOpciones: TToolButton;
     TButtImprimir: TToolButton;
     TButtConfigurar: TToolButton;
     ToolButton4: TToolButton;
     PNLOpciones: TLFPanel;
     CBEjercicio: TLFCheckBox;
     CBCanal: TLFCheckBox;
     CBSerie: TLFCheckBox;
     ToolButton1: TToolButton;
     EPMain: THYMEditPanel;
     PNLMoneda: TLFPanel;
     LBLMoneda: TLFLabel;
     DBEFMoneda: TLFEditFind2000;
     DBETitMoneda: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure CBCanalClick(Sender: TObject);
     procedure CBSerieClick(Sender: TObject);
     procedure CBEjercicioClick(Sender: TObject);
     procedure DBEFMonedaChange(Sender: TObject);
  private
     { Private declarations }
     Prov: integer;
     Modo: smallint;
     NoActualiza: smallint;
  public
     { Public declarations }
     procedure MuestraProveedor(Proveedor, aModo: integer);
  end;

var
  FMComprasProv : TFMComprasProv;

implementation

uses UDMMain, UDMComprasProv, UEntorno;

{$R *.DFM}

procedure TFMComprasProv.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE  
  AbreData(TDMComprasProv, DMComprasProv);
  DBGFArticulosCli.DataSource := DMComprasProv.DSxComprasProveedor;
  NoActualiza := 0;
  DBEFMoneda.Text := REntorno.Moneda;
end;

procedure TFMComprasProv.MuestraProveedor(Proveedor, aModo: integer);
var
  Total : double;
begin
  Prov := Proveedor;
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
  DMComprasProv.ActualizaTabla(Prov, Modo, Total, DBEFMoneda.Text);
  RMETotal.Text := FormatFloat(DMComprasProv.LocalMascaraN, Total);
  ShowModal;
end;

procedure TFMComprasProv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMComprasProv);
end;

procedure TFMComprasProv.CBEjercicioClick(Sender: TObject);
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
        DMComprasProv.ActualizaTabla(Prov, 0, Total, DBEFMoneda.Text);
     end
     else
     begin
        NoActualiza := 1;
        CBCanal.Checked := False;
        CBSerie.Checked := False;
        NoActualiza := 0;
        DMComprasProv.ActualizaTabla(Prov, Modo, Total, DBEFMoneda.Text);
     end;
     RMETotal.Text := FormatFloat(DMComprasProv.LocalMascaraN, total);
  end;
end;

procedure TFMComprasProv.CBCanalClick(Sender: TObject);
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
        DMComprasProv.ActualizaTabla(Prov, 1, total, DBEFMoneda.Text);
     end
     else
     begin
        NoActualiza := 1;
        CBEjercicio.Checked := False;
        CBSerie.Checked := False;
        NoActualiza := 0;
        DMComprasProv.ActualizaTabla(Prov, Modo, Total, DBEFMoneda.Text);
     end;
     RMETotal.Text := FormatFloat(DMComprasProv.LocalMascaraN, Total);
  end;
end;

procedure TFMComprasProv.CBSerieClick(Sender: TObject);
var
  Total : double;
begin
  if NoActualiza = 0 then
  begin
     if (CBSerie.Checked) then
        DMComprasProv.ActualizaTabla(Prov,
           2, total, DBEFMoneda.Text)
     else
     begin
        NoActualiza := 1;
        CBEjercicio.Checked := False;
        CBCanal.Checked := False;
        NoActualiza := 0;
        DMComprasProv.ActualizaTabla(Prov, Modo, Total, DBEFMoneda.Text);
     end;
     RMETotal.Text := FormatFloat(DMComprasProv.LocalMascaraN, Total);
  end;
end;

procedure TFMComprasProv.DBEFMonedaChange(Sender: TObject);
var
  Total : double;
begin
  DMComprasProv.CambiaMoneda(DBEFMoneda.Text);
  DMComprasProv.ActualizaTabla(Prov, Modo, Total, DBEFMoneda.Text);
  RMETotal.Text := FormatFloat(DMComprasProv.LocalMascaraN, Total);
end;

end.
