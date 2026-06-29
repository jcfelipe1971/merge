unit UFMRCVCompra;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls,
  UNavigator, ToolWin, ULFToolBar, ExtCtrls, ULFPanel, TFlatCheckBoxUnit,
  ULFCheckBox, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFEditFind2000, StdCtrls, ULFEdit, ULFComboBox, ULFLabel, Grids,
  DBGrids, NsDBGrid, ULFPageControl;

type
  TFMRCVCompra = class(TFPEditSimple)
     PCMain: TLFPageControl;
     TSDocumentos: TTabSheet;
     DBGCompras: TDBGridFind2000;
     TBFiltros: TLFToolBar;
     TButtFiltrar: TToolButton;
     TBButtLimpiarFiltos: TToolButton;
     TBSep4: TToolButton;
     PNLRUTProveedor: TLFPanel;
     PNLFIltros: TPanel;
     LTipoDocumentoTributario: TLFLabel;
     EFTipoDocumentoTributario: TLFEditFind2000;
     ETipoDocumentoTributario: TLFEdit;
     Importar_Excel: TAction;
     LFolio: TLFLabel;
     EFolio: TLFEdit;
     EFPeriodo: TLFEditFind2000;
     ETituloPeriodo: TLFEdit;
     TBSep1: TToolButton;
     TBSep2: TToolButton;
     LPeriodo: TLFLabel;
     LRUTProveedor: TLFLabel;
     ERUTProveedor: TLFEdit;
     PNLFiltroFolio: TLFPanel;
     PNLFiltroPeriodo: TLFPanel;
     AEnviaAcuseDeRecibo: TAction;
     ACreaDteDesdeXml: TAction;
     TBSep3: TToolButton;
     AGeneraFacturasMarcadas: TAction;
     TButtMarcarTodas: TToolButton;
     TButtDesMarcarTodas: TToolButton;
     CBDocumentosPendientes: TLFCheckBox;
     LEjercicio: TLFLabel;
     EFEjercicio: TLFEditFind2000;
     procedure FormCreate(Sender: TObject);
     procedure TBButtLimpiarFiltosClick(Sender: TObject);
     procedure Importar_ExcelExecute(Sender: TObject);
     procedure EFPeriodoChange(Sender: TObject);
     procedure TButtFiltrarClick(Sender: TObject);
     procedure EFolioKeyPress(Sender: TObject; var Key: char);
     procedure EFTipoDocumentoTributarioChange(Sender: TObject);
     procedure EFTipoDocumentoTributarioBusqueda(Sender: TObject);
     procedure AEnviaAcuseDeReciboExecute(Sender: TObject);
     procedure ACreaDteDesdeXmlExecute(Sender: TObject);
     procedure DBGComprasDblClick(Sender: TObject);
     procedure DBGComprasCellClick(Column: TColumn);
     procedure DBGComprasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure FormShow(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure AGeneraFacturasMarcadasExecute(Sender: TObject);
     procedure TButtMarcarTodasClick(Sender: TObject);
     procedure TButtDesMarcarTodasClick(Sender: TObject);
     procedure CBDocumentosPendientesChange(Sender: TObject);
     procedure EFEjercicioChange(Sender: TObject);
  private
     { Private declarations }
     ColActual: TColumn;
     CorreoLeido: boolean;
  public
     { Public declarations }
  end;

var
  FMRCVCompra : TFMRCVCompra;

implementation

uses UDMRCVCompra, UFBusca, UEntorno, UFormGest, UDMMain, UUtiles,
  UParam, UDMAdjunto, DateUtils, UHojaCalc, UDMListados,
  UDMFacturasAProveedor, UFMain, UDMLstInfFacProveedor,
  UFMDteRecepcionCorreos, UDameDato;

{$R *.dfm}

procedure TFMRCVCompra.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMRCVCompra, DMRCVCompra);

  NavMain.DataSource := DMRCVCompra.DSQMQMRCV_COMPRA;
  DBGCompras.DataSource := DMRCVCompra.DSQMQMRCV_COMPRA;

  CEMainPMEdit.Teclas := DMMain.Teclas;
  ControlEdit := CEMain;
  ColActual := DBGCompras.Columns[0];
  TBButtLimpiarFiltosClick(Sender);
  EFTipoDocumentoTributario.Text := '33';
  CorreoLeido := False;
  EFEjercicio.Text := REntorno.EjercicioStr;

  DBGCompras.ColumnasChecked.Strings[DBGCompras.ColumnasCheckBoxes.IndexOf('ENTRADA_SELECCION')] := REntorno.EntradaStr;
end;

procedure TFMRCVCompra.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMRCVCompra);
end;

procedure TFMRCVCompra.FormShow(Sender: TObject);
{$IFNDEF Debug}
var
  FM : TFMDteRecepcionCorreos;
{$ENDIF}
begin
  inherited;

  {$IFNDEF Debug}
  if (not CorreoLeido) then
  begin
     FM := TFMDteRecepcionCorreos.Create(Self);
     FM.ShowModal;
     FreeAndNil(FM);

     CorreoLeido := True;
  end;
  {$ENDIF}
end;

procedure TFMRCVCompra.TBButtLimpiarFiltosClick(Sender: TObject);
begin
  inherited;
  EFTipoDocumentoTributario.Text := '33';
  ERUTProveedor.Text := '';
  EFPeriodo.Text := '';
  CBDocumentosPendientes.Checked := True;

  TButtFiltrar.Click;
end;

procedure TFMRCVCompra.Importar_ExcelExecute(Sender: TObject);
var
  Archivo : string;
begin
  inherited;

  Archivo := '';
  if (MyOpenDialog(Archivo, 'CSV,ALL', '', 'FMRCVCompra-Importar_Excel')) then
     DMRCVCompra.ImportarCSV(Archivo);
end;

procedure TFMRCVCompra.EFPeriodoChange(Sender: TObject);
begin
  inherited;
  ETituloPeriodo.Text := DameTituloPeriodo(EFPeriodo.Text);
  TButtFiltrarClick(Sender);
end;

procedure TFMRCVCompra.TButtFiltrarClick(Sender: TObject);
begin
  inherited;
  DMRCVCompra.CambiarSeleccion(Trim(ERUTProveedor.Text), EFTipoDocumentoTributario.Text, Trim(EFPeriodo.Text), CBDocumentosPendientes.Checked, StrToIntDef(EFEjercicio.Text, 0));
end;

procedure TFMRCVCompra.EFolioKeyPress(Sender: TObject; var Key: char);
begin
  inherited;
  if (Key = #13) then
  begin
     DMRCVCompra.PosicionarFolioRCVCompra(StrToIntDef(EFolio.Text, 0));
  end;
end;

procedure TFMRCVCompra.EFTipoDocumentoTributarioChange(Sender: TObject);
begin
  inherited;
  ETipoDocumentoTributario.Text := DameTituloTipoDocTributario(EFTipoDocumentoTributario.Text);
  TButtFiltrarClick(Sender);
end;

procedure TFMRCVCompra.EFTipoDocumentoTributarioBusqueda(Sender: TObject);
begin
  inherited;
  EFTipoDocumentoTributario.CondicionBusqueda := '((VISIBLE_ALB = 1) OR (VISIBLE_FAC = 1))';
end;

procedure TFMRCVCompra.AEnviaAcuseDeReciboExecute(Sender: TObject);
begin
  inherited;
  DMRCVCompra.EnviaAcuseDeRecibo;
end;

procedure TFMRCVCompra.ACreaDteDesdeXmlExecute(Sender: TObject);
var
  Log : TStrings;
  RutaFicheroLog : string;
begin
  Log := TStringList.Create;
  try
     DMRCVCompra.CreaDteDesdeXml(Log);

     // Mostramos resumen  de la importacion en fichero temporal
     RutaFicheroLog := IncludeTrailingPathDelimiter(GetSpecialFolderPath(CSIDL_PERSONAL, False)) + 'Importacion_DTE_Compras_' + FormatDateTime('yyyymmdd_hhnnss', Now) + '.Log';
     Log.SaveToFile(RutaFicheroLog);
     DMMain.AbrirArchivo(RutaFicheroLog);
  finally
     Log.Free;
  end;
end;

procedure TFMRCVCompra.DBGComprasDblClick(Sender: TObject);
begin
  inherited;
  if (UpperCase(ColActual.FieldName) = 'RIG') then
  begin
     if (DMRCVCompra.QMRCV_COMPRA.FieldByName('ID_E').AsInteger <> 0) then
        FMain.TraspasoDeDocumentosEntrada(DMRCVCompra.QMRCV_COMPRA.FieldByName('ID_E').AsInteger);
  end
  else
  if (UpperCase(ColActual.FieldName) = 'PDF_RECIBIDO') then
  begin
     if (DMRCVCompra.QMRCV_COMPRA.FieldByName('ID_ADJUNTO_PDF').AsInteger > 0) then
        DMRCVCompra.AbrePdfAdjuntoDTE
     else
     begin
        AbreData(TDMLstInfFacProveedor, DMLstInfFacProveedor);
        try
           DMLstInfFacProveedor.MostrarInforme(DMRCVCompra.QMRCV_COMPRA.FieldByName('SERIE').AsString,
              DMRCVCompra.QMRCV_COMPRA.FieldByName('RIG').AsInteger,
              DMRCVCompra.QMRCV_COMPRA.FieldByName('ID_E').AsInteger,
              0, DMRCVCompra.QMRCV_COMPRA.FieldByName('EJERCICIO').AsInteger);
        finally
           CierraData(DMLstInfFacProveedor);
        end;
     end;
  end
  else
  if (UpperCase(ColActual.FieldName) = 'XML_RECIBIDO') then
     if (DMRCVCompra.QMRCV_COMPRA.FieldByName('ID_ADJUNTO_XML').AsInteger > 0) then
        DMRCVCompra.AbreXmlAdjuntoDTE;
end;

procedure TFMRCVCompra.DBGComprasCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;

  { TODO : Debe marcarse cuando se pica sobre cualquier columna del registro? }
  // DMRCVCompra.MarcaDocumento;
end;

procedure TFMRCVCompra.DBGComprasDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ((UpperCase(Column.FieldName) = 'RIG') or (UpperCase(Column.FieldName) = 'XML_RECIBIDO') or (UpperCase(Column.FieldName) = 'PDF_RECIBIDO')) then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);

  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'RIG') then
        begin
           if (DMRCVCompra.QMRCV_COMPRA.FieldByName('ID_E').AsInteger = 0) then
              ColorError(Canvas);
        end;

        if (UpperCase(Column.FieldName) = 'ENTRADA_SELECCION') then
        begin
           if (DMRCVCompra.QMRCV_COMPRA.FieldByName('ID_E').AsInteger <> 0) then
              ColorInfo(Canvas)
           else
              ColorEdicion(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMRCVCompra.AGeneraFacturasMarcadasExecute(Sender: TObject);
begin
  inherited;
  DMRCVCompra.GeneraFacturasMarcadas;
end;

procedure TFMRCVCompra.TButtMarcarTodasClick(Sender: TObject);
begin
  inherited;
  DMRCVCompra.MarcaTodas(REntorno.Entrada);
end;

procedure TFMRCVCompra.TButtDesMarcarTodasClick(Sender: TObject);
begin
  inherited;
  DMRCVCompra.MarcaTodas(0);
end;

procedure TFMRCVCompra.CBDocumentosPendientesChange(Sender: TObject);
begin
  inherited;
  TButtFiltrarClick(Sender);
end;

procedure TFMRCVCompra.EFEjercicioChange(Sender: TObject);
begin
  inherited;
  TButtFiltrarClick(Sender);
end;

end.
