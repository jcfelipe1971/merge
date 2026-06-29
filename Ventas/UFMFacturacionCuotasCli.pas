unit UFMFacturacionCuotasCli;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, UFIBDBEditfind, UComponentesBusquedaFiltrada, ExtCtrls,
  ToolWin, ComCtrls, StdCtrls, Spin, Buttons, UEditPanel, DBCtrls, UControlEdit,
  UFormGest, Mask, NsDBGrid, rxToolEdit, ULFDBEdit, ULFPanel, ULFComboBox,
  ULFToolBar, ULFEditFind2000, ULFLabel, rxPlacemnt, ULFFormStorage, ULFDateEdit,
  UFPEditSinNavegador, ActnList, ULFActionList, Menus, UTeclas, ULFEdit;

type
  TFMFacturacionCuotasCli = class(TFPEditSinNavegador)
     TButtSep2: TToolButton;
     TButtTodos: TToolButton;
     TButtDesmarcar: TToolButton;
     TButtSep3: TToolButton;
     TButtFacturar: TToolButton;
     LBLSerie: TLFLabel;
     TButtSep4: TToolButton;
     TButtRefrescar: TToolButton;
     LBLFFactura: TLFLabel;
     DTPFechaFactura: TLFDateEdit;
     CBSeries: TLFComboBox;
     TBBorrar: TToolButton;
     DBGFCuotas: TDBGridFind2000;
     TBFiltroClientes: TLFToolBar;
     TButtAnyadirSelecClientes: TToolButton;
     TButtQuitarSelecClientes: TToolButton;
     PNLDesdeCliente: TLFPanel;
     EFClienteDesde: TLFEditFind2000;
     ETituloClienteDesde: TLFEdit;
     PNLHastaCliente: TLFPanel;
     EFClienteHasta: TLFEditFind2000;
     ETituloClienteHasta: TLFEdit;
     TButSep3: TToolButton;
     TButtMostrarFiltros: TToolButton;
     TBFiltros: TLFToolBar;
     TButtAnyadirSelecFechas: TToolButton;
     TButtQuitarSelecFechas: TToolButton;
     PNLDesdeFecha: TLFPanel;
     DTPDesdeFecha: TLFDateEdit;
     PNLHastaFecha: TLFPanel;
     DTPHastaFecha: TLFDateEdit;
     PNLSerieDoc: TLFPanel;
     PNLFechaDoc: TLFPanel;
     LDesdeFecha: TLFLabel;
     LHastaFecha: TLFLabel;
     LDesdeCliente: TLFLabel;
     LHastaCliente: TLFLabel;
     EValorUF: TLFEdit;
     FValorUF: TLFLabel;
     TBSep1: TToolButton;
     PNLValorUF: TLFPanel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TButtTodosClick(Sender: TObject);
     procedure TButtDesmarcarClick(Sender: TObject);
     procedure TButtFacturarClick(Sender: TObject);
     procedure TButtRefrescarClick(Sender: TObject);
     procedure TBBorrarClick(Sender: TObject);
     procedure CBSeriesChange(Sender: TObject);
     procedure TButtMostrarFiltrosClick(Sender: TObject);
     procedure TButtAnyadirSelecFechasClick(Sender: TObject);
     procedure TButtQuitarSelecFechasClick(Sender: TObject);
     procedure TButtAnyadirSelecClientesClick(Sender: TObject);
     procedure TButtQuitarSelecClientesClick(Sender: TObject);
     procedure EFClienteDesdeChange(Sender: TObject);
     procedure EFClienteHastaChange(Sender: TObject);
     procedure DBGFCuotasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGFCuotasDblClick(Sender: TObject);
     procedure DBGFCuotasCellClick(Column: TColumn);
     procedure FormShow(Sender: TObject);
  private
     { Private declarations }
     MostrandoFiltros: boolean;
     Serie: string;
     ColActual: TColumn;
  public
     { Public declarations }
  end;

var
  FMFacturacionCuotasCli : TFMFacturacionCuotasCli;

implementation

uses UDMMain, UDMFacturacionCuotasCli, UEntorno, UUtiles, UFMain, UDameDato, URellenaLista;

{$R *.DFM}

procedure TFMFacturacionCuotasCli.FormCreate(Sender: TObject);
begin
  inherited;
  MostrandoFiltros := False;
  AbreData(TDMFacturacionCuotasCli, DMFacturacionCuotasCli);
  RellenaSeries(CBSeries.Items);
  // Pongo la serie por defecto
  CBSeries.ItemIndex := 0;
  while (((Copy(CBSeries.Text, 1, Length(REntorno.Serie)) + ' ') <> REntorno.Serie + ' ') and (CBSeries.ItemIndex <> CBSeries.Items.Count - 1)) do
     CBSeries.ItemIndex := CBSeries.ItemIndex + 1;
  CBSeriesChange(Self);
  DTPDesdeFecha.Date := REntorno.FechaTrabSH;
  DTPHastaFecha.Date := EncodeDate(REntorno.Ejercicio, 12, 31);
  DTPFechaFactura.Date := REntorno.FechaTrabSH;
  TButtRefrescarClick(Self);

  ColActual := DBGFCuotas.Columns[0];
end;

procedure TFMFacturacionCuotasCli.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMFacturacionCuotasCli);
end;

procedure TFMFacturacionCuotasCli.TButtTodosClick(Sender: TObject);
begin
  DMFacturacionCuotasCli.MarcarTodo;
end;

procedure TFMFacturacionCuotasCli.TButtDesmarcarClick(Sender: TObject);
begin
  DMFacturacionCuotasCli.DesMarcarTodo;
end;

procedure TFMFacturacionCuotasCli.TButtFacturarClick(Sender: TObject);
begin
  DMFacturacionCuotasCli.Traspasar(DTPFechaFactura.Date, Serie, StrToFloatDef(EValorUF.Text, 0));
end;

procedure TFMFacturacionCuotasCli.TButtRefrescarClick(Sender: TObject);
begin
  DMFacturacionCuotasCli.CalculaCuotas;
end;

procedure TFMFacturacionCuotasCli.TBBorrarClick(Sender: TObject);
begin
  if ConfirmaMensaje(_('¿Eliminar la cuota seleccionada?')) then
     DMFacturacionCuotasCli.QMCuotas.Delete;
end;

procedure TFMFacturacionCuotasCli.CBSeriesChange(Sender: TObject);
begin
  if (CBSeries.Text <> '') then
  begin
     // Obtengo el texto del item y no de la propiedad Text, por si escribieron y no conicide (mayúsculas/minúsculas, por ejemplo)
     Serie := CBSeries.Items[CBSeries.ItemIndex];
     Serie := Copy(Serie, 1, Pos(' ', Serie) - 1);
  end;
end;

procedure TFMFacturacionCuotasCli.TButtMostrarFiltrosClick(Sender: TObject);
var
  min_fecha, max_fecha : TDateTime;
  min_cliente, max_cliente : integer;
begin
  if not MostrandoFiltros then
  begin
     // Se muestran los filtros...
     MostrandoFiltros := True;
     TButtMostrarFiltros.ImageIndex := 22;
     TBFiltros.Visible := True;
     TBFiltroClientes.Visible := True;

     // Se actualiza la información de los filtros...
     DMFacturacionCuotasCli.DameMinMaxFechaCliente(min_fecha, max_fecha,
        min_cliente, max_cliente);
     DTPDesdeFecha.Date := min_fecha;
     DTPHastaFecha.Date := max_fecha;
     EFClienteDesde.Text := IntToStr(min_cliente);
     EFClienteHasta.Text := IntToStr(max_cliente);
  end
  else
  begin
     MostrandoFiltros := False;
     TButtMostrarFiltros.ImageIndex := 23;
     TBFiltros.Visible := False;
     TBFiltroClientes.Visible := False;
  end;
end;

procedure TFMFacturacionCuotasCli.TButtAnyadirSelecFechasClick(Sender: TObject);
begin
  DMFacturacionCuotasCli.MarcarPorFecha(DTPDesdeFecha.Date, DTPHastaFecha.Date, 1);
end;

procedure TFMFacturacionCuotasCli.TButtQuitarSelecFechasClick(Sender: TObject);
begin
  DMFacturacionCuotasCli.MarcarPorFecha(DTPDesdeFecha.Date, DTPHastaFecha.Date, 0);
end;

procedure TFMFacturacionCuotasCli.TButtAnyadirSelecClientesClick(Sender: TObject);
begin
  DMFacturacionCuotasCli.MarcarPorCliente(StrToIntDef(EFClienteDesde.Text, 0),
     StrToIntDef(EFClienteHasta.Text, 0), 1);
end;

procedure TFMFacturacionCuotasCli.TButtQuitarSelecClientesClick(Sender: TObject);
begin
  DMFacturacionCuotasCli.MarcarPorCliente(StrToIntDef(EFClienteDesde.Text, 0),
     StrToIntDef(EFClienteHasta.Text, 0), 0);
end;

procedure TFMFacturacionCuotasCli.EFClienteDesdeChange(Sender: TObject);
begin
  ETituloClienteDesde.Text := DameTituloCliente(StrToIntDef(EFClienteDesde.Text, 0));
end;

procedure TFMFacturacionCuotasCli.EFClienteHastaChange(Sender: TObject);
begin
  ETituloClienteHasta.Text := DameTituloCliente(StrToIntDef(EFClienteHasta.Text, 0));
end;

procedure TFMFacturacionCuotasCli.DBGFCuotasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;

  if ((UpperCase(Column.FieldName) = 'ARTICULO') or (UpperCase(Column.FieldName) = 'CLIENTE') or (UpperCase(Column.FieldName) = 'PROYECTO')) then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);

  if ((UpperCase(Column.FieldName) = 'CLIENTE') or
     (UpperCase(Column.FieldName) = 'TITULO') or
     (UpperCase(Column.FieldName) = 'ARTICULO') or
     (UpperCase(Column.FieldName) = 'DESCRIPCION') or
     (UpperCase(Column.FieldName) = 'TIPO_DOC') or
     (UpperCase(Column.FieldName) = 'FECHA')) then
  begin
     with TDBGridFind2000(Sender) do
     begin
        if (gdFocused in State) then //If the cell has the focus
           ColorFocused(Canvas)
        else
        if (DMFacturacionCuotasCli.QMCuotasPUEDE_FACTURAR.AsInteger = 1) then
           ColorInfo(Canvas)
        else
           ColorError(Canvas);
     end;
  end; {FieldName = xxx}

  TDBGridFind2000(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TFMFacturacionCuotasCli.DBGFCuotasDblClick(Sender: TObject);
begin
  inherited;
  if (UpperCase(ColActual.FieldName) = 'ARTICULO') then
     FMain.EjecutaAccion(FMain.AArticulos, 'Articulo = ''' + DMFacturacionCuotasCli.QMCuotas.FieldByName('ARTICULO').AsString + '''')
  else
  if (UpperCase(ColActual.FieldName) = 'PROYECTO') then
     FMain.EjecutaAccion(FMain.AProyectos, DMFacturacionCuotasCli.QMCuotas.FieldByName('PROYECTO').AsString)
  else
  if (UpperCase(ColActual.FieldName) = 'CLIENTE') then
     FMain.EjecutaAccion(FMain.AClientes, 'CLIENTE = ' + DMFacturacionCuotasCli.QMCuotas.FieldByName('CLIENTE').AsString);
end;

procedure TFMFacturacionCuotasCli.DBGFCuotasCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMFacturacionCuotasCli.FormShow(Sender: TObject);
var
  //i : integer;
  IdColumna : integer;
begin
  inherited;

  // Datos para Chile
  PNLValorUF.Visible := (REntorno.Pais = 'CHL');
  IdColumna := EncuentraField(DBGFCuotas, 'UNIDAD_FOMENTO');
  if (IdColumna >= 0) then
     DBGFCuotas.Columns[IdColumna].Visible := (REntorno.Pais = 'CHL');
end;

end.
