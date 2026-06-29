unit UFMDivideFacturas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls, ExtCtrls, UEditPanel, Grids, DBGrids, UHYDBGrid,
  UNavigator, IOFFind, Menus, UTeclas, UControlEdit, DB, Urecursos, UFormGest,
  NsDBGrid, ULFPanel, ULFToolBar, ULFCheckBox, TFlatCheckBoxUnit, StdCtrls,
  ULFEdit, ULFLabel, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFEditFind2000, Mask, rxToolEdit, ULFDateEdit, ULFComboBox,
  UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList;

type
  TFMDivideFacturas = class(TFPEditSimple)
     DBGFacturas: THYTDBGrid;
     TButtCancelar: TToolButton;
     TbuttMarcar: TToolButton;
     TSep2: TToolButton;
     TSep1: TToolButton;
     TButtDividir: TToolButton;
     TSep3: TToolButton;
     TButtRefrescarKri: TToolButton;
     PnlPedidos: TLFPanel;
     LDesdeFecha: TLFLabel;
     LHastaFecha: TLFLabel;
     BFiltrar: TButton;
     BLimpiar: TButton;
     LDesdeCliente: TLFLabel;
     LHastaCliente: TLFLabel;
     LPorcentaje: TLFLabel;
     DEDesdeFecha: TLFDateEdit;
     DEHastaFecha: TLFDateEdit;
     EDesdeCliente: TLFEdit;
     EHastaCliente: TLFEdit;
     EPorcentaje: TLFEdit;
     EFDesdeCliente: TLFEditFind2000;
     EFHastaCliente: TLFEditFind2000;
     LProyecto: TLFLabel;
     EFProyecto: TLFEditFind2000;
     EProyecto: TLFEdit;
     LCanalDestino: TLFLabel;
     EFCanalDestino: TLFEditFind2000;
     ECanalDestino: TLFEdit;
     CBSeries: TLFComboBox;
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TbuttMarcarClick(Sender: TObject);
     procedure TButtCancelarClick(Sender: TObject);
     procedure DBGFacturasKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGFacturasKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure DBGFacturasCellClick(Column: TColumn);
     procedure TButtRefrescarKriClick(Sender: TObject);
     procedure BFiltrarClick(Sender: TObject);
     procedure BLimpiarClick(Sender: TObject);
     procedure EFHastaClienteChange(Sender: TObject);
     procedure EFDesdeClienteChange(Sender: TObject);
     procedure TButtDividirClick(Sender: TObject);
     procedure EFProyectoChange(Sender: TObject);
     procedure EFCanalDestinoChange(Sender: TObject);
  private
     { Private declarations }
     SemaforoClick: boolean;
  public
     { Public declarations }
     function Seleccionado: boolean;
     procedure Marca;
  end;

var
  FMDivideFacturas : TFMDivideFacturas;

implementation

uses UDMDivideFacturas, UDMMain, UEntorno, UDameDato, URellenaLista;

{$R *.DFM}

procedure TFMDivideFacturas.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMDivideFacturas, DMDivideFacturas);
  NavMain.DataSource := DMDivideFacturas.DSQMFacturas;
  CEMain.Teclas := DMMain.Teclas;
  ControlEdit := CEMain;
  SemaforoClick := False;
  BLimpiar.Click;
  RellenaSeries(CBSeries.Items);
  CBSeries.ItemIndex := 0;
end;

procedure TFMDivideFacturas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMDivideFacturas);
end;

function TFMDivideFacturas.Seleccionado: boolean;
begin
  Result := DBGFacturas.SelectedRows.CurrentRowSelected;
end;

procedure TFMDivideFacturas.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  DMDivideFacturas.BusquedaCompleja;
  Continua := False;
end;

procedure TFMDivideFacturas.TbuttMarcarClick(Sender: TObject);
begin
  DBGFacturas.SelectedRows.Clear;
  DMDivideFacturas.Marcatodas(Self);
end;

procedure TFMDivideFacturas.Marca;
begin
  DBGFacturas.SelectedRows.CurrentRowSelected := True;
end;

procedure TFMDivideFacturas.TButtCancelarClick(Sender: TObject);
begin
  DBGFacturas.SelectedRows.Clear;
end;

procedure TFMDivideFacturas.DBGFacturasKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Shift = [ssShift, ssCtrl]) then
     SemaforoClick := True;
end;

procedure TFMDivideFacturas.DBGFacturasKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if Shift = [] then
     SemaforoClick := False;
end;

procedure TFMDivideFacturas.DBGFacturasCellClick(Column: TColumn);
begin
  if SemaforoClick then
  begin
     DBGFacturas.SelectedRows.CurrentRowSelected := False;
     DMDivideFacturas.MarcaHasta(Self);
     SemaforoClick := False;
  end;
end;

procedure TFMDivideFacturas.TButtRefrescarKriClick(Sender: TObject);
begin
  DMDivideFacturas.Refrescar;
end;

procedure TFMDivideFacturas.BFiltrarClick(Sender: TObject);
var
  Serie : string;
begin
  Serie := '';
  if (CBSeries.ItemIndex > 0) then
  begin
     // Obtengo el texto del item y no de la propiedad Text, por si escribieron y no conicide (mayúsculas/minúsculas, por ejemplo)
     Serie := CBSeries.Items[CBSeries.ItemIndex];
     Serie := Copy(Serie, 1, Pos(' ', Serie) - 1);
  end;

  DMDivideFacturas.CambiarSeleccion(DEDesdeFecha.Date, DEHastaFecha.Date, StrToIntDef(EFDesdeCliente.Text, 0), StrToIntDef(EFHastaCliente.Text, 0), StrToIntDef(EFProyecto.Text, 0), Serie);
end;

procedure TFMDivideFacturas.BLimpiarClick(Sender: TObject);
var
  Desde, Hasta : integer;
begin
  DMDivideFacturas.DameMinMax(Desde, Hasta);
  EFDesdeCliente.Text := IntToStr(Desde);
  EFHastaCliente.Text := IntToStr(Hasta);
  DEDesdeFecha.Date := EncodeDate(REntorno.Ejercicio, 1, 1);
  DEHastaFecha.Date := EncodeDate(REntorno.Ejercicio, 12, 31);
  EFProyecto.Text := '0';
  EPorcentaje.Text := '100';
  BFiltrar.Click;
  CBSeries.ItemIndex := 0;
end;

procedure TFMDivideFacturas.EFHastaClienteChange(Sender: TObject);
begin
  EHastaCliente.Text := DameTituloCliente(StrToIntDef(EFHastaCliente.Text, 0));
end;

procedure TFMDivideFacturas.EFDesdeClienteChange(Sender: TObject);
begin
  EDesdeCliente.Text := DameTituloCliente(StrToIntDef(EFDesdeCliente.Text, 0));
end;

procedure TFMDivideFacturas.TButtDividirClick(Sender: TObject);
begin
  DMDivideFacturas.DivideFacturas(Self, StrToInt(EFCanalDestino.Text), StrToFloat(EPorcentaje.Text));
end;

procedure TFMDivideFacturas.EFProyectoChange(Sender: TObject);
begin
  EProyecto.Text := DameTituloProyecto(StrToIntDef(EFProyecto.Text, 0));
end;

procedure TFMDivideFacturas.EFCanalDestinoChange(Sender: TObject);
begin
  ECanalDestino.Text := DameTituloCanal(StrToIntDef(EFCanaldestino.Text, 0));
end;

end.
