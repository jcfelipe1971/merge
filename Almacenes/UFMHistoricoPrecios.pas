unit UFMHistoricoPrecios;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, ToolWin, ComCtrls, UEditPanel, Mask, DBCtrls, StdCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, Grids, DBGrids, Menus,
  UTeclas, UControlEdit, UNavigator, UFormGest, NsDBGrid, DB, ULFDBEdit,
  ULFPanel, ULFToolBar, ULFEditFind2000, ULFLabel, rxPlacemnt, ULFFormStorage,
  ULFEdit, UFPEditSimple, ActnList, ULFActionList;

type
  TFMHistoricoPrecios = class(TFPEditSimple)
     PnDetalle: TLFPanel;
     DBGFHistPrecios: TDBGridFind2000;
     EFArticulo: TLFEditFind2000;
     EArticulo: TLFEdit;
     LAlmacen: TLFLabel;
     LArticulo: TLFLabel;
     EFAlmacen: TLFEditFind2000;
     EAlmacen: TLFEdit;
     TBRefrescar: TToolButton;
     TBPonderarDocs: TToolButton;
     TSep1: TToolButton;
     TSep2: TToolButton;
     procedure EFAlmacenChange(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFArticuloBusqueda(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure TBRefrescarClick(Sender: TObject);
     procedure TBPonderarDocsClick(Sender: TObject);
     procedure EFArticuloKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGFHistPreciosDblClick(Sender: TObject);
     procedure EFArticuloChange(Sender: TObject);
     procedure EFAlmacenExiste(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure RefrescarArticulo(const Almacen, Articulo: string);
  end;

var
  FMHistoricoPrecios : TFMHistoricoPrecios;

implementation

{$R *.DFM}

uses UDMMain, UDameDato, UDMHistoricoPrecios, UEntorno, UFMPonderarDocs, UFMain,
  UFCDocumentos;

procedure TFMHistoricoPrecios.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE

  AbreData(TDMHistoricoPrecios, DMHistoricoPrecios);

  NavMain.DataSource := DMHistoricoPrecios.DSQMHistPrecios;
  DBGFHistPrecios.DataSource := DMHistoricoPrecios.DSQMHistPrecios;
end;

procedure TFMHistoricoPrecios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMHistoricoPrecios);
end;

procedure TFMHistoricoPrecios.EFAlmacenChange(Sender: TObject);
begin
  EAlmacen.Text := DameTituloAlmacen(EFAlmacen.Text);
end;

procedure TFMHistoricoPrecios.EFArticuloBusqueda(Sender: TObject);
begin
  TEditFind2000(Sender).CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMHistoricoPrecios.FormShow(Sender: TObject);
begin
  EFArticulo.SetFocus;
end;

procedure TFMHistoricoPrecios.RefrescarArticulo(const Almacen, Articulo: string);
begin
  EFArticulo.Text := Articulo;
  if (Almacen = '') then
     EFAlmacen.Text := REntorno.AlmacenDefecto
  else
     EFAlmacen.Text := Almacen;

  TBRefrescar.Click;
end;

procedure TFMHistoricoPrecios.TBRefrescarClick(Sender: TObject);
begin
  DMHistoricoPrecios.Refrescar(EFAlmacen.Text, EFArticulo.Text);
end;

procedure TFMHistoricoPrecios.TBPonderarDocsClick(Sender: TObject);
begin
  FMain.EjecutaAccion(FMain.APonderarDocs);
end;

procedure TFMHistoricoPrecios.EFArticuloKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Key = VK_RETURN) then
  begin
     TBRefrescar.Click;
  end;
end;

procedure TFMHistoricoPrecios.DBGFHistPreciosDblClick(Sender: TObject);
var
  Ejercicio : integer;
  Serie : string;
  Tipo : string;
  Rig : integer;
begin
  Ejercicio := DameEjercicio(REntorno.Empresa, DMHistoricoPrecios.QMHistPreciosFECHA_P.AsDateTime);
  Serie := DMHistoricoPrecios.QMHistPreciosDOC_SERIE.AsString;
  Tipo := DMHistoricoPrecios.QMHistPreciosDOC_TIPO.AsString;
  if (Tipo = 'MAN') and (DMHistoricoPrecios.QMHistPreciosTIPO_OPER.AsString = 'E') then
     Tipo := 'MVE'
  else
  if (Tipo = 'MAN') and (DMHistoricoPrecios.QMHistPreciosTIPO_OPER.AsString = 'S') then
     Tipo := 'MVS'
  else
  if (Tipo = 'MAN') then
     Tipo := 'MVT';
  Rig := DMHistoricoPrecios.QMHistPreciosDOC_NUMERO.AsInteger;

  FMain.MuestraDocumento(Ejercicio, Tipo, Serie, Rig);
end;

procedure TFMHistoricoPrecios.EFArticuloChange(Sender: TObject);
begin
  EArticulo.Text := DameTituloArticulo(EFArticulo.Text);
end;

procedure TFMHistoricoPrecios.EFAlmacenExiste(Sender: TObject);
begin
  DMHistoricoPrecios.Refrescar(EFAlmacen.Text, EFArticulo.Text);
end;

end.
