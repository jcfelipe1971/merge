unit UFMOrdenProduccionTallas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, Grids, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  UHYDescription, rxToolEdit, RXDBCtrl, StdCtrls, Mask, DBCtrls, ActnList,
  rxPlacemnt, ULFFormStorage, ULFActionList, Menus, UTeclas, UControlEdit,
  DBGrids, NsDBGrid, UHYDBGrid, ULFToolBar, UG2kTBLoc, ComCtrls,
  ULFPageControl, UEditPanel, UNavigator, ToolWin, ExtCtrls, ULFPanel, UFormGest, ULFDBDateEdit,
  ULFLabel, ULFDBEdit;

type
  TFMOrdenProduccionTallas = class(TFPEdit)
     ATraspasoAProduccion: TAction;
     PDetalle: TLFPanel;
     TBDetalle: TLFToolBar;
     NavDetalle: THYMNavigator;
     ToolButton3: TToolButton;
     DBGFDetalle: TDBGridFind2000;
     SGDatos: TStringGrid;
     LBLPrioridad: TLFLabel;
     LBLMerma: TLFLabel;
     LBLMaterial: TLFLabel;
     LBLAlmacen: TLFLabel;
     LBLSerie: TLFLabel;
     Label1: TLFLabel;
     LBLOperario: TLFLabel;
     GBPedido: TGroupBox;
     LBLPedido: TLFLabel;
     LBLLinea: TLFLabel;
     DBEFPedido: TDBEditFind2000;
     DBEFLinea: TDBEditFind2000;
     GBFechas: TGroupBox;
     LBLFechaEntrega: TLFLabel;
     DBDTPFEntrega: TLFDBDateEdit;
     DBEPrioridad: TLFDBEdit;
     DBEMerma: TLFDBEdit;
     DBEFMaterial: TDBEditFind2000;
     DBETitMaterial: TLFDBEdit;
     DBEFAlmacen: TDBEditFind2000;
     DBETitAlmacen: TLFDBEdit;
     DBEFSerie: TDBEditFind2000;
     DBETitSerie: TLFDBEdit;
     DBDTPFecha_orden: TLFDBDateEdit;
     DBETercero: TDBEditFind2000;
     HYDBDOperario: THYDBDescripcion;
     CEDetalle: TControlEdit;
     CEDetalleMifirst: TMenuItem;
     CEDetalleMiprior: TMenuItem;
     CEDetalleMinext: TMenuItem;
     CEDetalleMilast: TMenuItem;
     CEDetalleMiinsert: TMenuItem;
     CEDetalleMidelete: TMenuItem;
     CEDetalleMiedit: TMenuItem;
     CEDetalleMipost: TMenuItem;
     CEDetalleMicancel: TMenuItem;
     CEDetalleMirefresh: TMenuItem;
     CEDetallePMEdit: TPopUpTeclas;
     procedure ATraspasoAProduccionExecute(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGFDetalleRowChange(Sender: TObject);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMOrdenProduccionTallas : TFMOrdenProduccionTallas;

implementation

uses UDMOrdenProduccionTallas, UDMMain, UDMTallas;

{$R *.dfm}

procedure TFMOrdenProduccionTallas.FormCreate(Sender: TObject);
var
  i : integer;
begin
  inherited;
  AbreData(TDMOrdenProduccionTallas, DMOrdenProduccionTallas);
  NavMain.DataSource := DMOrdenProduccionTallas.DSQMCabecera;
  NavDetalle.DataSource := DMOrdenProduccionTallas.DSQMDetalle;
  DBGMain.DataSource := DMOrdenProduccionTallas.DSQMCabecera;
  SGDatos.Cells[0, 0] := _('Stock');
  SGDatos.Cells[0, 1] := _('Falta');
  SGDatos.Cells[0, 2] := _('En Producción');
  SGDatos.ColWidths[0] := 15 + DBGFDetalle.Columns[0].Width +
     DBGFDetalle.Columns[1].Width + DBGFDetalle.Columns[2].Width +
     DBGFDetalle.Columns[3].Width;
  for i := 1 to 21 do
  begin
     SGDatos.ColWidths[i] := DBGFDetalle.Columns[i + 3].Width;
     if (DMOrdenProduccionTallas.DameVisible(i)) then
     begin
        SGDatos.Cells[i, 0] := IntToStr(DMOrdenProduccionTallas.DameStock(i));
        SGDatos.Cells[i, 1] := IntToStr(DMOrdenProduccionTallas.DameUds(
           i) - StrToInt(SGDatos.Cells[i, 0]));
        SGDatos.Cells[i, 2] := IntToStr(DMOrdenProduccionTallas.DameEnProduccion(i));
     end
     else
     begin
        SGDatos.Cells[i, 0] := '';
        SGDatos.Cells[i, 1] := '';
        SGDatos.Cells[i, 2] := '';
     end;
  end;
  PCMain.ActivePage := TSFicha;
end;

procedure TFMOrdenProduccionTallas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMOrdenProduccionTallas);
end;

procedure TFMOrdenProduccionTallas.ATraspasoAProduccionExecute(Sender: TObject);
begin
  inherited;
  DMOrdenProduccionTallas.TraspasaOrden;
end;

procedure TFMOrdenProduccionTallas.DBGFDetalleRowChange(Sender: TObject);
var
  i : integer;
begin
  inherited;
  dmTallas.setColumns(DMOrdenProduccionTallas.QMDetalle['ID_G_T'], DBGFDetalle);
  SGDatos.ColWidths[0] := 15 + DBGFDetalle.Columns[0].Width +
     DBGFDetalle.Columns[1].Width + DBGFDetalle.Columns[2].Width +
     DBGFDetalle.Columns[3].Width;
  for i := 1 to 21 do
  begin
     SGDatos.ColWidths[i] := DBGFDetalle.Columns[i + 3].Width;
     if (DMOrdenProduccionTallas.DameVisible(i)) then
     begin
        SGDatos.Cells[i, 0] := IntToStr(DMOrdenProduccionTallas.DameStock(i));
        SGDatos.Cells[i, 1] := IntToStr(DMOrdenProduccionTallas.DameUds(
           i) - StrToInt(SGDatos.Cells[i, 0]));
        SGDatos.Cells[i, 2] := IntToStr(DMOrdenProduccionTallas.DameEnProduccion(i));
     end
     else
     begin
        SGDatos.Cells[i, 0] := '';
        SGDatos.Cells[i, 1] := '';
        SGDatos.Cells[i, 2] := '';
     end;
  end;
end;

procedure TFMOrdenProduccionTallas.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  {  if ((Button = nbEdit) or (Button = nbInsert)) then
  begin
    Panel1.Enabled := true;
    DBDTPFecha_orden.SetFocus;
  end
  else
    Panel1.Enabled := false;}
  if ((Button = nbFirst) or (Button = nbPrior) or (Button = nbNext) or
     (Button = nbLast)) then
     DBGFDetalleRowChange(Sender);
end;

end.
