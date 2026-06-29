unit ZUFMRecibos;

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
  ULFDBDateEdit, ULFComboBox, ULFDBComboBoxValue;

type
  TZFMRecibos = class(TFPEdit)
     LId: TLFLabel;
     DBEID: TLFDbedit;
     LEstado: TLFLabel;
     LCliente: TLFLabel;
     LDescripcion: TLFLabel;
     DBEDescripcion: TLFDbedit;
     DBDTPFecha: TLFDBDateEdit;
     LFecha: TLFLabel;
     LLugar: TLFLabel;
     DBELugar: TLFDbedit;
     PDetalle: TLFPanel;
     PCDetalle: TLFPageControl;
     TSCobros: TTabSheet;
     TBDetalle: TLFToolBar;
     NavCobros: THYMNavigator;
     TBSep1: TToolButton;
     TButtCobrar: TToolButton;
     DBGFDetalle: TDBGridFind2000;
     DBEFCliente: TLFDBEditFind2000;
     DBETituloCliente: TLFDbedit;
     LCuenta: TLFLabel;
     LCuentaCaja: TLFLabel;
     DBEFCuentaCobro: TLFDBEditFind2000;
     DBETituloEstado: TLFDbedit;
     LMontoPendiente: TLFLabel;
     DBECobros: TLFDbedit;
     DBERecibo: TLFDbedit;
     DBECuenta: TLFDbedit;
     LFCategoryAction1: TLFCategoryAction;
     AListadoRecibo: TAction;
     DBEMontoRecibido: TLFDbedit;
     LMontoAplicado: TLFLabel;
     AListadoLimites: TAction;
     APrevisualizacion: TAction;
     AAbrirReciboIngreso: TAction;
     LFCategoryAction2: TLFCategoryAction;
     ADescobrarRecibo: TAction;
     TButtDescobrarRecibo: TToolButton;
     LMontoTotal: TLFLabel;
     EMontoRecibo: TLFEdit;
     DBEMontoEfectivo: TLFDbedit;
     LMontoEfectivo: TLFLabel;
     LMontoTarjeta: TLFLabel;
     DBEMontoTarjeta: TLFDbedit;
     LMontoCheque: TLFLabel;
     DBEMontoCheque: TLFDbedit;
     PNLMontoTotal: TLFPanel;
     LComisionADistribuir: TLFLabel;
     DBEComisionADistribuir: TLFDbedit;
     LFCategoryAction3: TLFCategoryAction;
     AConfListadoRecibo: TAction;
     AConfListadoLimites: TAction;
     PNLTitSerie: TLFPanel;
     LSerie: TLFLabel;
     ETitSerie: TLFEdit;
     EFSerie: TLFEditFind2000;
     DBCBTipoEfecto: TLFDBComboBoxValue;
     LEfecto: TLFLabel;
     ECuentaCobro: TLFEdit;
     ECuenta: TLFEdit;
     LDocumento: TLFLabel;
     ACobrarRecibosMarcados: TAction;
     ACobrarTodosHastaImporte: TAction;
     ACobrarMarcadosHastaImporte: TAction;
     TBettCobrarMarcadosHastaImporte: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure AreciboExecute(Sender: TObject);
     procedure AListadoLimitesExecute(Sender: TObject);
     procedure APrevisualizacionExecute(Sender: TObject);
     procedure AAbrirReciboIngresoExecute(Sender: TObject);
     procedure ADescobrarRecibosExecute(Sender: TObject);
     procedure ActSumaRecibo(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure AConfListadoReciboExecute(Sender: TObject);
     procedure AConfListadoLimitesExecute(Sender: TObject);
     procedure EFSerieChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBGFDetalleDblClick(Sender: TObject);
     procedure DBGFDetalleCellClick(Column: TColumn);
     procedure DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBEFCuentaCobroChange(Sender: TObject);
     procedure DBECuentaChange(Sender: TObject);
     procedure ACobrarRecibosMarcadosExecute(Sender: TObject);
     procedure ACobrarTodosHastaImporteExecute(Sender: TObject);
     procedure ACobrarMarcadosHastaImporteExecute(Sender: TObject);
  private
     { Private declarations }
     ColActual: TColumn;
  public
     { Public declarations }
  end;

var
  ZFMRecibos : TZFMRecibos;

implementation

uses UDMMain, UEntorno, ZUDMRecibos, UUtiles, UDMListados, UFMListconfig,
  UFMain, ZUDMLstRecibos, ZUFMLstRecibos, UDameDato;

{$R *.dfm}

procedure TZFMRecibos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TZDMRecibos, ZDMRecibos);
  NavMain.DataSource := ZDMRecibos.DSCabecera;
  DBGMain.DataSource := ZDMRecibos.DSCabecera;
  EPMain.DataSource := ZDMRecibos.DSCabecera;
  G2KTableLoc.DataSource := ZDMRecibos.DSCabecera;

  NavCobros.DataSource := ZDMRecibos.DSCobros;
  DBGFDetalle.DataSource := ZDMRecibos.DSCobros;

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

  ZDMRecibos.CambiaSerie(EFSerie.Text);
  ColActual := DBGFDetalle.Columns[0];

  // Esta accion esta comentada y no ejecuta nada
  AAbrirReciboIngreso.Visible := False;
  AAbrirReciboIngreso.Enabled := False;
end;

procedure TZFMRecibos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMRecibos);
end;

procedure TZFMRecibos.AReciboExecute(Sender: TObject);
begin
  inherited;
  AbreData(TZDMLstRecibos, ZDMLstRecibos);
  ZDMLstRecibos.MostrarListado(1, 0, ZDMRecibos.QMCabecera.FieldByName('ID').AsInteger);
  CierraData(ZDMLstRecibos);
end;

procedure TZFMRecibos.AListadoLimitesExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TZFMLstRecibos, ZFMLstRecibos, Sender);
end;

procedure TZFMRecibos.APrevisualizacionExecute(Sender: TObject);
begin
  inherited;
  AbreData(TZDMLstRecibos, ZDMLstRecibos);
  ZDMLstRecibos.MostrarListado(0, 0, ZDMRecibos.QMCabecera.FieldByName('ID').AsInteger);
  CierraData(ZDMLstRecibos);
end;

procedure TZFMRecibos.ActSumaRecibo(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  inherited;
  EMontoRecibo.Text := FormatFloat('0.00', ZDMRecibos.QMCabeceraMONTO_EFECTIVO.AsFloat + ZDMRecibos.QMCabeceraMONTO_TARJETA.AsFloat + ZDMRecibos.QMCabeceraMONTO_CHEQUE.AsFloat);
end;

procedure TZFMRecibos.AConfListadoReciboExecute(Sender: TObject);
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

procedure TZFMRecibos.AConfListadoLimitesExecute(Sender: TObject);
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

procedure TZFMRecibos.EFSerieChange(Sender: TObject);
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
     ZDMRecibos.CambiaSerie(EFSerie.Text);
  end;
end;

procedure TZFMRecibos.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.CondicionBusqueda := 'SERIE=''' + EFSerie.Text + '''';
  G2KTableLoc.Click;
end;

procedure TZFMRecibos.DBGFDetalleDblClick(Sender: TObject);
begin
  inherited;
  if (UpperCase(ColActual.FieldName) = 'REGISTRO') then
     FMain.MuestraCartera(ZDMRecibos.QMCobrosEJERCICIO.AsInteger, ZDMRecibos.QMCobrosCANAL.AsInteger, 'C', ZDMRecibos.QMCobrosREGISTRO.AsInteger);
end;

procedure TZFMRecibos.DBGFDetalleCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TZFMRecibos.DBGFDetalleDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if (UpperCase(Column.FieldName) = 'REGISTRO') then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);

  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then
        ColorFocused(Canvas);
     {
        else
        begin
           if (UpperCase(Column.FieldName) = '...') then
           begin
              if (...) then
                 ColorEdicion(Canvas)
              else
                 ColorInactivo(Canvas);
           end;
        end;
        }

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TZFMRecibos.DBEFCuentaCobroChange(Sender: TObject);
begin
  inherited;
  ECuentaCobro.Text := DameTituloCuenta(DBEFCuentaCobro.Text);
end;

procedure TZFMRecibos.DBECuentaChange(Sender: TObject);
begin
  inherited;
  ECuenta.Text := DameTituloCuenta(DBECuenta.Text);
end;

procedure TZFMRecibos.ACobrarRecibosMarcadosExecute(Sender: TObject);
begin
  inherited;
  ZDMRecibos.CobrarRecibosMarcados;
end;

procedure TZFMRecibos.ADescobrarRecibosExecute(Sender: TObject);
begin
  //Verificamos que el usuario tenga un perfil administrador
  if (DamePerfilUsuario(REntorno.Usuario) = 0) then
     ZDMRecibos.AnularRecibo
  else
     ShowMessage(_('Solo un usuario administrador puede anular el recibo'));
end;

procedure TZFMRecibos.ACobrarTodosHastaImporteExecute(Sender: TObject);
var
  MontoRecibo : real;
begin
  inherited;
  MontoRecibo := ZDMRecibos.QMCabeceraMONTO_EFECTIVO.AsFloat;
  if (MontoRecibo <> 0) then
  begin
     ZDMRecibos.UpdateMarcados;
     ZDMRecibos.CobrarTodosHastaImporte(MontoRecibo);

     EMontoRecibo.Text := FormatFloat(ZDMRecibos.MascaraMonedacobro, 0.00);
  end;
end;

procedure TZFMRecibos.ACobrarMarcadosHastaImporteExecute(Sender: TObject);
var
  MontoRecibo : real;
begin
  inherited;
  // Trato de convertir el monto. Si puedo, realizo el resto de operaciones.
  MontoRecibo := ZDMRecibos.QMCabeceraMONTO_EFECTIVO.AsFloat;
  if (MontoRecibo <> 0) then
  begin
     ZDMRecibos.UpdateMarcados;
     ZDMRecibos.CobrarMarcadosHastaImporte(MontoRecibo);

     EMontoRecibo.Text := FormatFloat(ZDMRecibos.MascaraMonedacobro, 0.00);
  end;
end;

procedure TZFMRecibos.AAbrirReciboIngresoExecute(Sender: TObject);
begin
  inherited;
  // ZDMRecibos.Abrir;
end;

end.
