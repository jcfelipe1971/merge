unit UFMTarifaPArticulo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls, StdCtrls, Mask, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ExtCtrls, UEditPanel, Grids, DBGrids,
  UNavigator, Menus, UTeclas, UControlEdit, UFormGest, NsDBGrid, ULFDBEdit,
  ULFPanel, ULFToolBar, ULFEditFind2000, ULFLabel, rxPlacemnt, ULFFormStorage,
  UFPEditSimple, ActnList, ULFActionList, ULFEdit, Buttons,
  TFlatCheckBoxUnit, ULFCheckBox;

type
  TFMTarifaPArticulo = class(TFPEditSimple)
     DBGFTarifa: TDBGridFind2000;
     PNLTBMain: TLFPanel;
     LBLTarifa: TLFLabel;
     EFTarifa: TLFEditFind2000;
     TSep2: TToolButton;
     TButtBloqueaTodos: TToolButton;
     TButtDesbloqueaTodos: TToolButton;
     TSep4: TToolButton;
     TBCambiaMargen: TToolButton;
     TSep3: TToolButton;
     TButtImportarDesdeTarProvKri: TToolButton;
     TBDuplicarTarifa: TToolButton;
     TSep6: TToolButton;
     PNLFiltros: TPanel;
     LFamilia: TLFLabel;
     EFFamilia: TLFEditFind2000;
     EFamilia: TLFEdit;
     LSubfamilia: TLFLabel;
     EFSubfamilia: TLFEditFind2000;
     ESubfamilia: TLFEdit;
     ETarifa: TLFEdit;
     LArticulo: TLFLabel;
     EArticulo: TEdit;
     AInfoStock: TAction;
     TSep7: TToolButton;
     CBArticulosBaja: TLFCheckBox;
     TBInfoStock: TToolButton;
     TEsp8: TToolButton;
     TBCopiarTarifa: TToolButton;
     ACopiaTarifa: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFTarifaChange(Sender: TObject);
     procedure TButtBloqueaTodosClick(Sender: TObject);
     procedure TButtDesbloqueaTodosClick(Sender: TObject);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure TBCambiaMargenClick(Sender: TObject);
     procedure TButtImportarDesdeTarProvKriClick(Sender: TObject);
     procedure TBDuplicarTarifaClick(Sender: TObject);
     procedure EFFamiliaChange(Sender: TObject);
     procedure EFSubfamiliaChange(Sender: TObject);
     procedure EFSubfamiliaBusqueda(Sender: TObject);
     procedure EArticuloChange(Sender: TObject);
     procedure Filtra(Sender: TObject);
     procedure DBGFTarifaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGFTarifaDblClick(Sender: TObject);
     procedure DBGFTarifaCellClick(Column: TColumn);
     procedure FormShow(Sender: TObject);
     procedure AInfoStockExecute(Sender: TObject);
     procedure CBArticulosBajaChange(Sender: TObject);
     procedure ACopiaTarifaExecute(Sender: TObject);
  private
     { Private declarations }
     ColActual: TColumn;
     procedure MuestraStock(StockNegativo: smallint);
  public
     { Public declarations }
  end;

var
  FMTarifaPArticulo : TFMTarifaPArticulo;

implementation

uses UDMMain, UEntorno, UDMTarifaPArticulo, UFBusca, UFCambioMargen,
  UUtiles, UFMImportarPreciosTarProvKri, UFMDuplicarTarifa, UFMain, UFMDocInfoStocks,
  UFMSeleccion, UParam, UDameDato;

{$R *.DFM}

procedure TFMTarifaPArticulo.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMTarifaPArticulo, DMTarifaPArticulo);

  ControlEdit := CEMain;

  EFTarifa.Text := REntorno.TarifaDefecto;
  ColActual := DBGFTarifa.Columns[0];
end;

procedure TFMTarifaPArticulo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMTarifaPArticulo);
  FMTarifaPArticulo := nil;
end;

procedure TFMTarifaPArticulo.EFTarifaChange(Sender: TObject);
begin
  ETarifa.Text := DameTituloTarifa(EFTarifa.Text);
  Filtra(Sender);
end;

procedure TFMTarifaPArticulo.TButtBloqueaTodosClick(Sender: TObject);
begin
  // Bloquear todos los artículos de la tarifa
  if ConfirmaGrave then
     DMTarifaPArticulo.EstablecerBloqueo(1, Trim(EFTarifa.Text), Trim(EFFamilia.Text), Trim(EFSubfamilia.Text), Trim(EArticulo.Text));
end;

procedure TFMTarifaPArticulo.TButtDesbloqueaTodosClick(Sender: TObject);
begin
  // Desbloquear todos los artículos de la tarifa
  if ConfirmaGrave then
     DMTarifaPArticulo.EstablecerBloqueo(0, Trim(EFTarifa.Text), Trim(EFFamilia.Text), Trim(EFSubfamilia.Text), Trim(EArticulo.Text));
end;

procedure TFMTarifaPArticulo.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  DMTarifaPArticulo.BusquedaCompleja(EFTarifa.Text);
end;

procedure TFMTarifaPArticulo.TBCambiaMargenClick(Sender: TObject);
begin
  with TFCambioMargen.Create(Self) do
  begin
     try
        if (ShowModal = mrOk) then
        begin
           if (((Margen >= 0) and (Modo = 1)) or (Modo = 0)) then
              DMTarifaPArticulo.CambioMargen(EFTarifa.Text, Margen, Modo);
        end;
     finally
        Free;
     end;
  end;
end;

procedure TFMTarifaPArticulo.TButtImportarDesdeTarProvKriClick(Sender: TObject);
begin
  AbreForm(TFMImportarPreciosTarProvKri, FMImportarPreciosTarProvKri);
  FMImportarPreciosTarProvKri.EFTarifa.Text := EFTarifa.Text;
end;

procedure TFMTarifaPArticulo.TBDuplicarTarifaClick(Sender: TObject);
begin
  AbreForm(TFMDuplicarTarifa, FMDuplicarTarifa);
  FMDuplicarTarifa.Inicializa(EFTarifa.Text);
end;

procedure TFMTarifaPArticulo.EFFamiliaChange(Sender: TObject);
begin
  inherited;
  EFamilia.Text := DameTituloFamilia(EFFamilia.Text);
  Filtra(Sender);
end;

procedure TFMTarifaPArticulo.EFSubfamiliaChange(Sender: TObject);
begin
  inherited;
  ESubfamilia.Text := DameTituloSubfamilia(EFSubfamilia.Text, EFFamilia.Text);
  Filtra(Sender);
end;

procedure TFMTarifaPArticulo.EFSubfamiliaBusqueda(Sender: TObject);
begin
  inherited;
  EFSubfamilia.CondicionBusqueda := 'ID_FAMILIA = ' + IntToStr(DameIDFamilia(EFFamilia.Text));
end;

procedure TFMTarifaPArticulo.EArticuloChange(Sender: TObject);
begin
  inherited;
  Filtra(Sender);
end;

procedure TFMTarifaPArticulo.Filtra(Sender: TObject);
begin
  inherited;
  DMTarifaPArticulo.FiltraVista(Trim(EFTarifa.Text), Trim(EFFamilia.Text), Trim(EFSubfamilia.Text), Trim(EArticulo.Text), CBArticulosBaja.Checked);
end;

procedure TFMTarifaPArticulo.DBGFTarifaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     // Enlaces
     if (UpperCase(Column.FieldName) = 'ARTICULO') then
        CeldaEnlace(TDBGridFind2000(Sender), Rect);

     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas);

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMTarifaPArticulo.DBGFTarifaDblClick(Sender: TObject);
begin
  if (UpperCase(ColActual.FieldName) = 'ARTICULO') then
  begin
     FMain.EjecutaAccion(FMain.AArticulos,
        'Articulo = ''' + DMTarifaPArticulo.QMTarifasArticuloARTICULO.AsString + '''');
  end;
end;

procedure TFMTarifaPArticulo.DBGFTarifaCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMTarifaPArticulo.FormShow(Sender: TObject);
var
  i, IdColumna : integer;
begin
  inherited;
  // DOCPCTA001 - Utiliza precios de coste en ART_ARTICULOS_TARIFAS
  if (LeeParametro('DOCPCTA001') <> 'S') then
  begin
     with DBGFTarifa do
     begin
        IdColumna := EncuentraField(DBGFTarifa, 'PRECIO_COSTE');
        if (IdColumna >= 0) then
           Columns[IdColumna].Visible := False;
        IdColumna := EncuentraField(DBGFTarifa, 'PRECIO_COMPRA');
        if (IdColumna >= 0) then
           Columns[IdColumna].Visible := False;
        IdColumna := EncuentraField(DBGFTarifa, 'DESCUENTO_COMPRA');
        if (IdColumna >= 0) then
           Columns[IdColumna].Visible := False;
        IdColumna := EncuentraField(DBGFTarifa, 'DESCUENTO_COMPRA_2');
        if (IdColumna >= 0) then
           Columns[IdColumna].Visible := False;
        IdColumna := EncuentraField(DBGFTarifa, 'DESCUENTO_COMPRA_3');
        if (IdColumna >= 0) then
           Columns[IdColumna].Visible := False;
     end;
  end;

  // Se establece descripcion de Campos ALFA_n
  // Se hace aquí porque la traducción reemplaza los titulos
  for i := 1 to 8 do
  begin
     IdColumna := EncuentraField(DBGFTarifa, Format('ALFA_%d', [i]));
     if (IdColumna >= 0) then
        DBGFTarifa.Columns[IdColumna].Title.Caption := LeeParametro(format('ARTDESC%3.3d', [i]));
  end;
end;

procedure TFMTarifaPArticulo.AInfoStockExecute(Sender: TObject);
begin
  inherited;
  MuestraStock(0);
end;

procedure TFMTarifaPArticulo.MuestraStock(StockNegativo: smallint);
var
  Articulo, Almacen : string;
begin
  DMTarifaPArticulo.DatosStocks(Articulo, Almacen);
  AbreStocks(REntorno.Empresa, REntorno.Canal, Articulo, Almacen, Self, StockNegativo);
end;

procedure TFMTarifaPArticulo.CBArticulosBajaChange(Sender: TObject);
begin
  inherited;
  Filtra(Sender);
end;

procedure TFMTarifaPArticulo.ACopiaTarifaExecute(Sender: TObject);
var
  TarifaOrigen : string;
  Margen : double;
begin
  TarifaOrigen := '';
  Margen := 0;

  if PideDato('TAR', TarifaOrigen, 'Seleccione Tarifa Origen', 'TARIFA <> ''' + EFTarifa.Text + '''') then
     if PideDato('DBL', Margen, 'Seleccione Margen a aplicar') then
     begin
        DMTarifaPArticulo.CopiaTarifa(TarifaOrigen, Margen);
     end;
end;

end.
