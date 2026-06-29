unit UFMImprimeRecibos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls, ExtCtrls, UEditPanel, Grids, DBGrids, UHYDBGrid,
  UNavigator, IOFFind, Menus, UTeclas, UControlEdit, DB, Urecursos, UFormGest,
  NsDBGrid, ULFPanel, ULFToolBar, ULFCheckBox, StdCtrls, ULFEdit, ULFLabel,
  TFlatCheckBoxUnit, ULFComboBox, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFEditFind2000, UFPEditSimple, rxPlacemnt,
  ULFFormStorage, ActnList, ULFActionList;

type
  TFMImprimeRecibos = class(TFPEditSimple)
     HYTDBGRecibos: THYTDBGrid;
     TButtCancelar: TToolButton;
     TbuttMarcar: TToolButton;
     TButtSeparador1: TToolButton;
     TButtSeparador2: TToolButton;
     TButtImprimir: TToolButton;
     PMImprime: TPopupMenu;
     MIImprimirRecibos: TMenuItem;
     MIConfiguracionRapida: TMenuItem;
     N1: TMenuItem;
     ToolButton1: TToolButton;
     TButtRefrescarKri: TToolButton;
     ToolButton3: TToolButton;
     MIEnvioPDF: TMenuItem;
     CBDocsPendientes: TLFCheckBox;
     ToolButton2: TToolButton;
     PNLFiltros: TLFPanel;
     LDesde: TLFLabel;
     LHasta: TLFLabel;
     EDesdeDocumento: TLFEdit;
     EHastaDocumento: TLFEdit;
     BtnFiltrar: TButton;
     BtnLimpiar: TButton;
     LTipo: TLFLabel;
     CBSigno: TLFComboBox;
     LAgente: TLFLabel;
     EFAgente: TLFEditFind2000;
     LDesdeCliente: TLFLabel;
     LHastaCliente: TLFLabel;
     LDocumento: TLabel;
     LCodCliPro: TLabel;
     EFDesdeCliente: TLFEditFind2000;
     EFHastaCliente: TLFEditFind2000;
     LFactura: TLabel;
     LDesdeFactura: TLFLabel;
     EDesdeFactura: TLFEdit;
     LHastaFactura: TLFLabel;
     EHastaFactura: TLFEdit;
     LSerie: TLFLabel;
     EFSerie: TLFEditFind2000;
     LFormaPago: TLFLabel;
     EFDesdeFormaPago: TLFEditFind2000;
     LDesdeFormaPago: TLFLabel;
     LHastaFormaPago: TLFLabel;
     EFHastaFormaPago: TLFEditFind2000;
     MIImprimirRecibosFiltrados: TMenuItem;
     LTipoEfecto: TLFLabel;
     LTipoEfectoDesde: TLFLabel;
     EFTipoEfectoDesde: TLFEditFind2000;
     EFTipoEfectoHasta: TLFEditFind2000;
     LTipoEfectoHasta: TLFLabel;
     procedure EPMainClickReport(Sender: TObject; var Continua: boolean);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TbuttMarcarClick(Sender: TObject);
     procedure TButtCancelarClick(Sender: TObject);
     procedure HYTDBGRecibosKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure HYTDBGRecibosKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure HYTDBGRecibosCellClick(Column: TColumn);
     procedure MIImprimirRecibosClick(Sender: TObject);
     procedure MIConfiguracionRapidaClick(Sender: TObject);
     procedure TButtRefrescarKriClick(Sender: TObject);
     procedure MIEnvioPDFClick(Sender: TObject);
     procedure CBDocsPendientesChange(Sender: TObject);
     procedure BtnFiltrarClick(Sender: TObject);
     procedure BtnLimpiarClick(Sender: TObject);
     procedure CBSignoChange(Sender: TObject);
     procedure MIImprimirRecibosFiltradosClick(Sender: TObject);
     procedure HYTDBGRecibosDblClick(Sender: TObject);
     procedure HYTDBGRecibosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
  private
     { Private declarations }
     SemaforoClick: boolean;
     ColActual: TColumn;
     procedure Filtrar;
  public
     { Public declarations }
     function Seleccionado: boolean;
     procedure Marca;
     function Muestra(Query: TDataSet): integer;
  end;

var
  FMImprimeRecibos : TFMImprimeRecibos;

implementation

uses UDMImprimeRecibos, UDMMain, UFMListConfig, UDMLstCarteraRecibos,
  UFMain, UUtiles, DateUtils;

{$R *.DFM}

procedure TFMImprimeRecibos.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMImprimeRecibos, DMImprimeRecibos);
  CEMainPMEdit.Teclas := DMMain.teclas;
  ControlEdit := CEMain;
  SemaforoClick := False;
  CBSigno.ItemIndex := 0;

  BtnLimpiarClick(Sender);
  Filtrar;
  ColActual := HYTDBGRecibos.Columns[0];
end;

procedure TFMImprimeRecibos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMImprimeRecibos);
end;

procedure TFMImprimeRecibos.EPMainClickReport(Sender: TObject; var Continua: boolean);
begin
  DMImprimeRecibos.ImprimeRecibos(Self, 0);  // Imprimir Pedidos Normales
end;

function TFMImprimeRecibos.Seleccionado: boolean;
begin
  Result := HYTDBGRecibos.SelectedRows.CurrentRowSelected;
end;

procedure TFMImprimeRecibos.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  DMImprimeRecibos.BusquedaCompleja;
  Continua := False;
end;

function TFMImprimeRecibos.Muestra(Query: TDataSet): integer;
begin
  EPMain.VisibleButtons := [neReport, neSalir];
  DMImprimeRecibos.Filtra(Query);
  Result := ShowModal;
end;

procedure TFMImprimeRecibos.TbuttMarcarClick(Sender: TObject);
begin
  HYTDBGRecibos.SelectedRows.Clear;
  DMImprimeRecibos.MarcaTodas(Self);
end;

procedure TFMImprimeRecibos.Marca;
begin
  HYTDBGRecibos.SelectedRows.CurrentRowSelected := True;
end;

procedure TFMImprimeRecibos.TButtCancelarClick(Sender: TObject);
begin
  HYTDBGRecibos.SelectedRows.Clear;
end;

procedure TFMImprimeRecibos.HYTDBGRecibosKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (Shift = [ssShift, ssCtrl]) then
     SemaforoClick := True;
end;

procedure TFMImprimeRecibos.HYTDBGRecibosKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if Shift = [] then
     SemaforoClick := False;
end;

procedure TFMImprimeRecibos.HYTDBGRecibosCellClick(Column: TColumn);
begin
  ColActual := Column;

  if SemaforoClick then
  begin
     HYTDBGRecibos.SelectedRows.CurrentRowSelected := False;
     DMImprimeRecibos.MarcaHasta(Self);
     SemaforoClick := False;
  end;
end;

procedure TFMImprimeRecibos.MIImprimirRecibosClick(Sender: TObject);
begin
  DMImprimeRecibos.ImprimeRecibos(Self, 0); // Imprimir Pedidos Normales
end;

procedure TFMImprimeRecibos.MIConfiguracionRapidaClick(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  AbreData(TDMLstCarteraRecibos, DMLstCarteraRecibos);
  TFMListConfig.Create(Self).Muestra(1, Formato, Cabecera, Copias,
     Pijama, '', DMLstCarteraRecibos.frRecibos);
  CierraData(DMLstCarteraRecibos);
end;

procedure TFMImprimeRecibos.TButtRefrescarKriClick(Sender: TObject);
begin
  DMImprimeRecibos.Refrescar;
end;

procedure TFMImprimeRecibos.MIEnvioPDFClick(Sender: TObject);
begin
  DMImprimeRecibos.ImprimeRecibos(Self, 3);
end;

procedure TFMImprimeRecibos.CBDocsPendientesChange(Sender: TObject);
begin
  Filtrar;
end;

procedure TFMImprimeRecibos.BtnFiltrarClick(Sender: TObject);
begin
  Filtrar;
end;

procedure TFMImprimeRecibos.BtnLimpiarClick(Sender: TObject);
begin
  EDesdeDocumento.Text := '';
  EHastaDocumento.Text := '';
  EFAgente.Text := '';
  EFDesdeCliente.Text := '';
  EFHastaCliente.Text := '';
  EFDesdeFormaPago.Text := '';
  EFHastaFormaPago.Text := '';
  EFSerie.Text := '';
  EDesdeFactura.Text := '';
  EHastaFactura.Text := '';

  Filtrar;
end;

procedure TFMImprimeRecibos.CBSignoChange(Sender: TObject);
begin
  EFDesdeCliente.Enabled := CBSigno.ItemIndex = 0;
  EFHastaCliente.Enabled := CBSigno.ItemIndex = 0;
  EFAgente.Enabled := CBSigno.ItemIndex = 0;

  Filtrar;
end;

procedure TFMImprimeRecibos.MIImprimirRecibosFiltradosClick(Sender: TObject);
begin
  inherited;
  Filtrar;

  DMImprimeRecibos.ImprimeRecibosFiltrados(CBSigno.ItemIndex);
end;

procedure TFMImprimeRecibos.Filtrar;
begin
  DMImprimeRecibos.CambiarSeleccion(CBDocsPendientes.Checked, StrToIntDef(EDesdeDocumento.Text, 0), StrToIntDef(EHastaDocumento.Text, 0), CBSigno.ItemIndex, StrToIntDef(EFAgente.Text, 0), StrToIntDef(EFDesdeCliente.Text, 0), StrToIntDef(EFHastaCliente.Text, 0),
     Trim(EFDesdeFormaPago.Text), Trim(EFHastaFormaPago.Text), Trim(EFTipoEfectoDesde.Text), Trim(EFTipoEfectoHasta.Text), Trim(EFSerie.Text), StrToIntDef(EDesdeFactura.Text, 0), StrToIntDef(EHastaFactura.Text, 0));
end;

procedure TFMImprimeRecibos.HYTDBGRecibosDblClick(Sender: TObject);
var
  Signo : char;
begin
  inherited;
  if (UpperCase(ColActual.FieldName) = 'REGISTRO') then
  begin
     if (DMImprimeRecibos.QMRecibosSIGNO.AsString = 'C') then
        Signo := 'C'
     else
        Signo := 'P';
     FMain.MuestraCartera(DMImprimeRecibos.QMRecibosEJERCICIO.AsInteger, DMImprimeRecibos.QMRecibosCANAL.AsInteger, Signo, DMImprimeRecibos.QMRecibosREGISTRO.AsInteger);
  end;

  if (UpperCase(ColActual.FieldName) = 'COD_CLI_PRO') then
     FMain.EjecutaAccion(FMain.AClientes, 'CLIENTE = ' + IntToStr(DMImprimeRecibos.QMRecibosCOD_CLI_PRO.AsInteger));

  if ((UpperCase(ColActual.FieldName) = 'DOC_SERIE') or (UpperCase(ColActual.FieldName) = 'DOC_NUMERO')) then
  begin
     if (CBSigno.ItemIndex = 0) then
        FMain.TraspasoDeDocumentosSalida(DMImprimeRecibos.QMRecibosID_DOC.AsInteger)
     else
        FMain.TraspasoDeDocumentosEntrada(DMImprimeRecibos.QMRecibosID_DOC.AsInteger);
  end;
end;

procedure TFMImprimeRecibos.HYTDBGRecibosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ((UpperCase(Column.FieldName) = 'REGISTRO') or (UpperCase(Column.FieldName) = 'COD_CLI_PRO') or (UpperCase(Column.FieldName) = 'DOC_SERIE') or (UpperCase(Column.FieldName) = 'DOC_NUMERO')) then
     CeldaEnlace(THYTDBGrid(Sender), Rect);

  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (Column.FieldName = 'REMESA') then
        begin
           if (DataSource.DataSet.FieldByName('REMESAR').AsInteger = 1) and (DataSource.DataSet.FieldByName('SIGNO').AsString = 'C') then
           begin
              if (DataSource.DataSet.FieldByName('REMESAR').AsInteger > 0) then
                 ColorResaltado4(Canvas)
              else
                 ColorResaltado2(Canvas);
           end
           else
              ColorInactivoInvisible(Canvas);
        end
        else
        if (Column.FieldName = 'VENCIMIENTO') then
        begin
           if (DataSource.DataSet.FieldByName('VENCIMIENTO').AsDateTime < Today) then
           begin
              if (DataSource.DataSet.FieldByName('PAGADO').AsInteger = 0) then
                 ColorError(Canvas)
              else
                 ColorResaltado2(Canvas);
           end
           else
              ColorInfo(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

end.
