unit UFMEscandalloOrden;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, DBCtrls, UDBDateTimePicker, Mask, rxPlacemnt,
  NsDBGrid, rxToolEdit, RXDBCtrl, ULFDBCheckBox, ULFDBEditFind2000,
  ULFDBEdit, ULFFormStorage, ActnList, ULFActionList, ULFPageControl,
  ULFToolBar, ULFPanel, TFlatCheckBoxUnit, ULFCheckBox, ULFLabel, UG2kTBLoc,
  ULFEdit, ULFDBDateEdit;

type
  TFMEscandalloOrden = class(TFPEdit)
     PDetalle: TLFPanel;
     LBLNumero: TLFLabel;
     LBLArticulo: TLFLabel;
     LBLUnidades: TLFLabel;
     TBDetalle: TLFToolBar;
     NavDetalle: THYMNavigator;
     DBENumero: TLFDbedit;
     DBEFArticulo: TLFDBEditFind2000;
     DBEUnidades: TLFDbedit;
     DBCHKActivo: TLFDBCheckBox;
     GBVigencia: TGroupBox;
     LBLFechaDesde: TLFLabel;
     DBDTPDesde: TLFDBDateEdit;
     DBDTPHasta: TLFDBDateEdit;
     LBLFechaHasta: TLFLabel;
     DBETitArticulo: TLFDbedit;
     CEDetalle: TControlEdit;
     CEDetallePMEdit: TPopUpTeclas;
     LIncSobreProd: TLFLabel;
     DBECoste: TLFDbedit;
     DBSerie: TLFDBEdit;
     LSerie: TLFLabel;
     PCDetalle: TLFPageControl;
     TSArticulos: TTabSheet;
     TSLotes: TTabSheet;
     DBGFDetalle: TDBGridFind2000;
     DBGFLotes: TDBGridFind2000;
     TBLotes: TLFToolBar;
     NavLotes: THYMNavigator;
     CELotes: TControlEdit;
     CELotesPMEdit: TPopUpTeclas;
     PNArticulo: TLFPanel;
     DBEArticulo: TLFDbedit;
     LBCantTotal: TLFLabel;
     EUdsTotal: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBEFArticuloBusqueda(Sender: TObject);
     procedure DBGFDetalleColEnter(Sender: TObject);
     procedure DBGFDetalleBusqueda(Sender: TObject);
     procedure NavLotesClick(Sender: TObject; Button: TNavigateBtn);
     procedure DBGFLotesColEnter(Sender: TObject);
     procedure TSArticulosShow(Sender: TObject);
     procedure TSLotesShow(Sender: TObject);
     procedure DBGFLotesBusqueda(Sender: TObject);
     procedure TSLotesHide(Sender: TObject);
     procedure DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGFDetalleCellClick(Column: TColumn);
     procedure DBGFDetalleDblClick(Sender: TObject);
  private
     { Private declarations }
     ColActual: TColumn;
     procedure ArticuloVisible(Visible: byte);
     procedure AbreMaestro(Orden: integer; Serie: string);
  public
     { Public declarations }
  end;

var
  FMEscandalloOrden : TFMEscandalloOrden;

procedure EscandalloOrden(Padre: TComponent; Orden: integer; Serie: string);

implementation

uses UDMMain, UFormGest, UEntorno, UDMEscandalloOrden, UUtiles, UFMain;

{$R *.DFM}

procedure EscandalloOrden(Padre: TComponent; Orden: integer; Serie: string);
var
  FMEscandalloOrden : TFMEscandalloOrden;
begin
  FMEscandalloOrden := TFMEscandalloOrden.Create(Padre);
  try
     FMEscandalloOrden.AbreMaestro(Orden, Serie);
     FMEscandalloOrden.ShowModal;
  finally
     FMEscandalloOrden.Free;
  end;
end;

procedure TFMEscandalloOrden.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMEscandalloOrden, DMEscandalloOrden);
  // Conectamos los datasources
  NavMain.DataSource := DMEscandalloOrden.DSQMEscandallo;
  DBGMain.DataSource := DMEscandalloOrden.DSQMEscandallo;

  NavDetalle.DataSource := DMEscandalloOrden.DSQMEscandalloDet;
  DBGFDetalle.DataSource := DMEscandalloOrden.DSQMEscandalloDet;

  NavLotes.DataSource := DMEscandalloOrden.DSQMLotes;
  DBGFLotes.DataSource := DMEscandalloOrden.DSQMLotes;

  // Conectamos las teclas
  CEMain.Teclas := DMMain.Teclas;
  CEDetalle.Teclas := DMMain.Teclas;
  CELotes.Teclas := DMMain.Teclas;

  PCDetalle.ActivePage := TSArticulos;
  ArticuloVisible(0);
  ColActual := DBGFDetalle.Columns[0];
end;

procedure TFMEscandalloOrden.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMEscandalloOrden);
end;

procedure TFMEscandalloOrden.AbreMaestro(Orden: integer; Serie: string);
begin
  DMEscandalloOrden.AbreMaestro(Orden, Serie);
end;

procedure TFMEscandalloOrden.DBEFArticuloBusqueda(Sender: TObject);
begin
  { Filtro para no elegir ni artículos del sistema ni artículos virtuales ya que
    no tienen producción }
  DBEFArticulo.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + ''' AND VIRTUAL=0';
end;

procedure TFMEscandalloOrden.DBGFDetalleColEnter(Sender: TObject);
begin
  inherited;
  ControlEdit := CEDetalle;
end;

procedure TFMEscandalloOrden.DBGFDetalleBusqueda(Sender: TObject);
begin
  inherited;
  // Filtramos por los artículos del sistema
  DBGFDetalle.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

procedure TFMEscandalloOrden.NavLotesClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  // Se habilita la columna del artículo sólo al insertar
  if Button = nbInsert then
  begin
     DBGFLotes.Columns[0].ReadOnly := False;
     DBGFLotes.Columns[0].Font.Color := clWindowText;
     DBGFLotes.Columns[0].Color := clWindow;
  end
  else
  begin
     DBGFLotes.Columns[0].ReadOnly := True;
     DBGFLotes.Columns[0].Color := clInfoBk;
     DBGFLotes.Columns[0].Font.Color := clGrayText;
  end;
end;

procedure TFMEscandalloOrden.DBGFLotesColEnter(Sender: TObject);
begin
  inherited;
  ControlEdit := CELotes;
end;

procedure TFMEscandalloOrden.TSArticulosShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEDetalle;
  ArticuloVisible(0);
end;

procedure TFMEscandalloOrden.TSLotesShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CELotes;
  DMEscandalloOrden.AbrirLotes;
  ArticuloVisible(1);
end;

procedure TFMEscandalloOrden.DBGFLotesBusqueda(Sender: TObject);
begin
  inherited;
  DBGFLotes.CondicionBusqueda := 'articulo=''' + DMEscandalloOrden.DameDetalle +
     ''' and almacen=''' + DMEscandalloOrden.DameAlmacen + '''';
end;

procedure TFMEscandalloOrden.ArticuloVisible(Visible: byte);
begin
  PNArticulo.Visible := (Visible = 1);

  if (Visible = 1) then
     EUdsTotal.Text := DMEscandalloOrden.DameTotalFabricacion;
end;

procedure TFMEscandalloOrden.TSLotesHide(Sender: TObject);
begin
  inherited;
  if not (DMEscandalloOrden.CompruebaTotalLotes) then
     ShowMessage(_('Las unidades de lotes DIFIEREN de las unidades a fabricar del artículo.'));
end;

procedure TFMEscandalloOrden.DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  {
  if (DMEscandalloOrden.HayDetalle) then
  begin
     if ( not (DMEscandalloOrden.TieneLotes)) then
     begin
        if (DBGFDetalle.CamposNoAccesibles.IndexOf('LINEAL_PORCENTUAL') = -1) then
           DBGFDetalle.CamposNoAccesibles.Add('LINEAL_PORCENTUAL');
     end
     else
        if (DBGFDetalle.CamposNoAccesibles.IndexOf('LINEAL_PORCENTUAL') > -1) then
           DBGFDetalle.CamposNoAccesibles.Delete(DBGFDetalle.CamposNoAccesibles.IndexOf('LINEAL_PORCENTUAL'));
  end;
  }
end;

procedure TFMEscandalloOrden.DBGFDetalleCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMEscandalloOrden.DBGFDetalleDblClick(Sender: TObject);
begin
  inherited;
  if (UpperCase(ColActual.FieldName) = 'ARTICULO') then
  begin
     if EstructuraCreada then
        FMain.EjecutaAccion(FMain.AArticulos,
           'Articulo = ''' + DMEscandalloOrden.QMEscandalloDetARTICULO.AsString + '''');
  end;
end;

end.
