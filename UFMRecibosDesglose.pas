unit UFMRecibosDesglose;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, UEditPanel, ComCtrls, ExtCtrls, UNavigator, ToolWin,
  Grids, DBGrids, UFIBDBEditfind, UDBDateTimePicker, Mask, Buttons, Menus,
  UTeclas, UControlEdit, UHYDBGrid, UComponentesBusquedaFiltrada, DB, Urecursos,
  ActnList, UFormGest, Variants, NsDBGrid, rxPlacemnt, rxToolEdit, RXDBCtrl,
  ULFFormStorage, ULFActionList, ULFToolBar, ULFDBMemo, ULFDBCheckBox,
  ULFDBEditFind2000, ULFDBEdit, ULFPageControl, ULFPanel, ULFEditFind2000,
  TFlatCheckBoxUnit, ULFCheckBox, ULFLabel, ULFEdit, DbComboBoxValue,
  UFPEdit, ULFFIBDBEditFind, UG2kTBLoc, TFlatPanelUnit,
  UFPEditDetalle, UHYDescription, ULFHYDBDescription,
  ULFDBDateEdit, ULFComboBox;

type
  TFMRecibosDesglose = class(TFPEdit)
     LFRIg: TLFLabel;
     DBEID: TLFDbedit;
     LabEstado: TLFLabel;
     LCliente: TLFLabel;
     LBLDescripcion: TLFLabel;
     DBEDescripcion: TLFDbedit;
     DBDTPFecha: TLFDBDateEdit;
     LBLFecha: TLFLabel;
     LBLLugar: TLFLabel;
     DBELugar: TLFDbedit;
     PDetalle: TLFPanel;
     PCDetalle: TLFPageControl;
     TSCobros: TTabSheet;
     TBDetalle: TLFToolBar;
     NavCobros: THYMNavigator;
     TBSep1: TToolButton;
     TBSep2: TToolButton;
     ButtCobrar: TToolButton;
     DBGFDetalle: TDBGridFind2000;
     DBECliente: TLFDBEditFind2000;
     ETituloCliente: TLFEdit;
     LCuenta: TLFLabel;
     LCuentaCaja: TLFLabel;
     DBCuentaCobro: TLFDBEditFind2000;
     DBETituloEstado: TLFDbedit;
     LMontoPendiente: TLFLabel;
     LFDBCobros: TLFDbedit;
     RBEfectivo: TRadioButton;
     RBCheque: TRadioButton;
     DBRecibo: TLFDbedit;
     LFDCuenta: TLFDbedit;
     LFCategoryAction1: TLFCategoryAction;
     AListadoRecibo: TAction;
     DBEMontoRecibido: TLFDbedit;
     LMontoAplicado: TLFLabel;
     AListadoLimites: TAction;
     APrevisualizacion: TAction;
     AAbrirReciboIngreso: TAction;
     LFCategoryAction2: TLFCategoryAction;
     ADescobrarRecibo: TAction;
     TBDescobrarRecibo: TToolButton;
     ETituloCuenta: TLFEdit;
     LDiferencia: TLFLabel;
     EDTMontoRecibo: TLFEdit;
     LFDMontoEfectivo: TLFDbedit;
     LMontoEfectivo: TLFLabel;
     LMontoTarjeta: TLFLabel;
     LFDMontoTarjeta: TLFDbedit;
     LMontoCheque: TLFLabel;
     LFDMontoCheque: TLFDbedit;
     BTodos: TButton;
     BMarcados: TButton;
     PNLMontoTotal: TLFPanel;
     PNLSeleccion: TLFPanel;
     LCuentaCom: TLFLabel;
     LComisionADistribuir: TLFLabel;
     DBEFCuentaCom: TLFDBEditFind2000;
     RBTarjeta: TRadioButton;
     DBEComisionADistribuir: TLFDbedit;
     LFCategoryAction3: TLFCategoryAction;
     AConfListadoRecibo: TAction;
     AConfListadoLimites: TAction;
     ADesgloseFactura: TAction;
     TsFacDesglose: TTabSheet;
     TBDesglose: TLFToolBar;
     DBGFaDesglose: TDBGridFind2000;
     PNLBusqueda: TLFPanel;
     EBuscar: TLFEdit;
     RGBusqueda: TRadioGroup;
     NavDesglose: THYMNavigator;
     PNLTitSerie: TLFPanel;
     LSerie: TLFLabel;
     ETitSerie: TLFEdit;
     EFSerie: TLFEditFind2000;
     TBSep3: TToolButton;
     TBDesmarcarTodo: TToolButton;
     TBSep4: TToolButton;
     TBSep5: TToolButton;
     TBMarcarTodo: TToolButton;
     AMarcarTodo: TAction;
     ADesmarcarTodo: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure AreciboExecute(Sender: TObject);
     procedure BTodosClick(Sender: TObject);
     procedure DBEClienteChange(Sender: TObject);
     procedure AListadoLimitesExecute(Sender: TObject);
     procedure ButtCobrarClick(Sender: TObject);
     procedure APrevisualizacionExecute(Sender: TObject);
     procedure AAbrirReciboIngresoExecute(Sender: TObject);
     procedure BMarcadosClick(Sender: TObject);
     procedure ADescobrarRecibosExecute(Sender: TObject);
     procedure ActSumaRecibo(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure AConfListadoReciboExecute(Sender: TObject);
     procedure AConfListadoLimitesExecute(Sender: TObject);
     procedure ADesgloseFacturaExecute(Sender: TObject);
     procedure EBuscarChange(Sender: TObject);
     procedure RGBusquedaClick(Sender: TObject);
     procedure DBEIDChange(Sender: TObject);
     procedure LFDCuentaChange(Sender: TObject);
     procedure DBGFDetalleCellClick(Column: TColumn);
     procedure EFSerieChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure ADesmarcarTodoExecute(Sender: TObject);
     procedure AMarcarTodoExecute(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     NumSerie: string;
  end;

var
  FMRecibosDesglose : TFMRecibosDesglose;

implementation

uses UDMMain, UEntorno, UDMRecibosDesglose, UUtiles, UDMListados, UFMListconfig,
  UFMain, UFMNotasCampo, ZUDMLstRecibos, ZUFMLstRecibos, UDameDato
  (*, UFMDesgloseFacturas esta unidad no existe en el proyecto*);

{$R *.dfm}

procedure TFMRecibosDesglose.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMRecibosDesglose, DMRecibosDesglose);
  NavMain.DataSource := DMRecibosDesglose.DSCabecera;
  DBGMain.DataSource := DMRecibosDesglose.DSCabecera;
  EPMain.DataSource := DMRecibosDesglose.DSCabecera;
  G2kTableLoc.DataSource := DMRecibosDesglose.DSCabecera;

  NavCobros.DataSource := DMRecibosDesglose.DSCobros;
  DBGFDetalle.DataSource := DMRecibosDesglose.DSCobros;

  NavDesglose.DataSource := DMRecibosDesglose.DSFacturasDesglose;
  DBGFaDesglose.DataSource := DMRecibosDesglose.DSFacturasDesglose;

  if (REntorno.SerieRestringida = '') then
  begin
     EFSerie.Enabled := True;
     EFSerie.Text := REntorno.Serie;
  end
  else
  begin
     EFSerie.Enabled := False;
     EFSerie.Text := REntorno.SerieRestringida;
  end;

  PCDetalle.ActivePage := TSCobros;

  (*
  Esta unidad no existe en el proyecto
  *)
  ADesgloseFactura.Visible := False;
  ADesgloseFactura.Enabled := False;
end;

procedure TFMRecibosDesglose.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRecibosDesglose);
end;

procedure TFMRecibosDesglose.AreciboExecute(Sender: TObject);
begin
  inherited;
  AbreData(TZDMLstRecibos, ZDMLstRecibos);
  ZDMLstRecibos.MostrarListado(1, 0, DMRecibosdesglose.QMCabecera.FieldByName('ID').AsInteger);
  CierraData(ZDMLstRecibos);
end;

procedure TFMRecibosDesglose.BTodosClick(Sender: TObject);
begin
  inherited;
  DMRecibosDesglose.UpdateMarcados;
  DMRecibosDesglose.Todos(StrToFloatDef(EDTMontoRecibo.Text, 0.00));
  EDTMontoRecibo.Text := FormatFloat(DMRecibosDesglose.MascaraMonedaCobro, 0.00);
end;

procedure TFMRecibosDesglose.DBEClienteChange(Sender: TObject);
begin
  inherited;
  ETituloCliente.Text := DameTituloCliente(DMRecibosDesglose.QMCabeceraCLIENTE.AsInteger);
  if (DBECliente.DataSource.DataSet.State in [dsEdit, dsInsert]) then
     LFDCuenta.Text := DMRecibosDesglose.DameCuentaCliente;
end;

procedure TFMRecibosDesglose.AListadoLimitesExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TZFMLstRecibos, ZFMLstRecibos, Sender);
end;

procedure TFMRecibosDesglose.ButtCobrarClick(Sender: TObject);
begin
  inherited;
  DMRecibosDesglose.Marcar;
end;

procedure TFMRecibosDesglose.APrevisualizacionExecute(Sender: TObject);
begin
  inherited;
  AbreData(TZDMLstRecibos, ZDMLstRecibos);
  ZDMLstRecibos.MostrarListado(0, 0, DMRecibosDesglose.QMCabecera.FieldByName('ID').AsInteger);
  CierraData(ZDMLstRecibos);
end;

procedure TFMRecibosDesglose.AAbrirReciboIngresoExecute(Sender: TObject);
begin
  inherited;
  // ZDMRecibos.Abrir;
end;

procedure TFMRecibosDesglose.BMarcadosClick(Sender: TObject);
var
  MontoRecibo : real;
begin
  inherited;
  // Trato de convertir el monto. Si puedo, realizo el resto de operaciones.
  MontoRecibo := StrToFloatDef(EDTMontoRecibo.Text, 0.00);
  if (MontoRecibo <> 0) then
  begin
     DMRecibosDesglose.UpdateMarcados;
     DMRecibosDesglose.Marcados(MontoRecibo);
     EDTMontoRecibo.Text := FormatFloat(DMRecibosDesglose.MascaraMonedaCobro, 0.00);
  end;
end;

procedure TFMRecibosDesglose.ADescobrarRecibosExecute(Sender: TObject);
begin
  DMRecibosDesglose.EliminarRecibo;
end;

procedure TFMRecibosDesglose.ActSumaRecibo(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  EDTMontoRecibo.Text := FormatFloat('0.00', StrToFloatDef(LFDMontoEfectivo.Text, 0.00) + StrToFloatDef(LFDMontoTarjeta.Text, 0.00) + StrToFloatDef(LFDMontoCheque.Text, 0.00));
end;

procedure TFMRecibosDesglose.AConfListadoReciboExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TZDMLstRecibos, ZDMLstRecibos);
  try
     TFMListConfig.Create(Self).Muestra(9006, formato, cabecera, copias,
        pijama, '', ZDMLstRecibos.frRecibosIngresos);
  finally
     CierraData(ZDMLstRecibos);
  end;
end;

procedure TFMRecibosDesglose.AConfListadoLimitesExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TZDMLstRecibos, ZDMLstRecibos);
  try
     TFMListConfig.Create(Self).Muestra(9007, formato, cabecera, copias,
        pijama, '', ZDMLstRecibos.frRecibosIngresos);
  finally
     CierraData(ZDMLstRecibos);
  end;
end;

procedure TFMRecibosDesglose.ADesgloseFacturaExecute(Sender: TObject);
begin
  inherited;
  (*
  Esta unidad no existe en el proyecto
  AbreForm(TFMDesgloseFacturas, FMDesgloseFacturas, Sender);
  *)
end;

procedure TFMRecibosDesglose.EBuscarChange(Sender: TObject);
begin
  inherited;
  with DMRecibosDesglose.QMFacturasDesglose do
  begin
     case RGBusqueda.ItemIndex of
        0:
           Locate('RIG', StrToIntDef(EBuscar.Text, 0), []);
        1:
           Locate('TITULO', EBuscar.Text, [loCaseInsensitive, loPartialKey]);
        2:
           Locate('TITULO_IDIOMA', EBuscar.Text, [loCaseInsensitive, loPartialKey]);
        3:
           Locate('PRO_NUM_PLANO', EBuscar.Text, []);
     end;
  end;
end;

procedure TFMRecibosDesglose.RGBusquedaClick(Sender: TObject);
begin
  inherited;
  EBuscar.SetFocus;
end;

procedure TFMRecibosDesglose.DBEIDChange(Sender: TObject);
begin
  inherited;
  DBGFaDesglose.ColumnasChecked.Strings[DBGFaDesglose.ColumnasCheckBoxes.IndexOf('ID_RECIBO')] := IntToStr(DMRecibosDesglose.QMCabeceraID.AsInteger);
end;

procedure TFMRecibosDesglose.LFDCuentaChange(Sender: TObject);
begin
  inherited;
  ETituloCuenta.Text := DameTituloCuenta(LFDCuenta.Text);
end;

procedure TFMRecibosDesglose.DBGFDetalleCellClick(Column: TColumn);
begin
  inherited;
  DBGFaDesglose.ColumnasChecked.Strings[DBGFaDesglose.ColumnasCheckBoxes.IndexOf('ID_RECIBO')] := IntToStr(DMRecibosDesglose.QMCabeceraID.AsInteger);
end;

procedure TFMRecibosDesglose.EFSerieChange(Sender: TObject);
var
  serie_aux : string;
begin
  if (EFSerie.Text <> '') then
  begin
     serie_aux := dame_serie_activa(EFSerie.Text);
     // Bloqueo series
     if (serie_aux <> EFSerie.Text) then
        EFSerie.Text := serie_aux;

     ETitSerie.Text := DameTituloSerie(EFSerie.Text);
     DMRecibosDesglose.CambiaSerie(EFSerie.Text);
  end;
end;

procedure TFMRecibosDesglose.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.CondicionBusqueda := 'SERIE=''' + EFSerie.Text + '''';
  G2KTableLoc.Click;
end;

procedure TFMRecibosDesglose.ADesmarcarTodoExecute(Sender: TObject);
begin
  inherited;
  DMRecibosDesglose.MarcaDesmarca(0);
end;

procedure TFMRecibosDesglose.AMarcarTodoExecute(Sender: TObject);
begin
  inherited;
  DMRecibosDesglose.MarcaDesmarca(DMRecibosDesglose.QMCabeceraID.AsInteger);
end;

end.
