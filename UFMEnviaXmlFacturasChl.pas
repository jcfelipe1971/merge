unit UFMEnviaXmlFacturasChl;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls, ExtCtrls, UEditPanel, Grids, DBGrids, UHYDBGrid,
  UNavigator, IOFFind, Menus, UTeclas, UControlEdit, DB, Urecursos, UFormGest,
  NsDBGrid, ULFPanel, ULFToolBar, ULFCheckBox, TFlatCheckBoxUnit, StdCtrls,
  ULFEdit, ULFLabel, UFPEditSimple, rxPlacemnt, ULFFormStorage, ActnList,
  ULFActionList, ULFComboBox, Buttons, uUtiles, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, DbComboBoxValue, ULFDBComboBoxValue, Mask,
  DBCtrls, ULFDBEditFind2000, ULFEditFind2000, ULFPageControl, ULFDBEdit,
  ImgList;

type
  TFMEnviaXmlFacturasChl = class(TFPEditSimple)
     TButtCancelar: TToolButton;
     TButtMarcar: TToolButton;
     TBSep2: TToolButton;
     TBSep1: TToolButton;
     PnlPedidos: TLFPanel;
     LDesdeCliente: TLFLabel;
     LHastaCliente: TLFLabel;
     EDesdeDocumento: TLFEdit;
     EHastaDocumento: TLFEdit;
     LSerie: TLFLabel;
     CBSeries: TLFComboBox;
     PNLSeries: TLFPanel;
     TButtEnviaDTE: TToolButton;
     PNLFIltros: TPanel;
     LTipo: TLFLabel;
     LTipoDocumentoTributario: TLFLabel;
     DBEFTipoDocumentoTributario: TLFEditFind2000;
     DBECliente: TLFEditFind2000;
     LFLabel1: TLFLabel;
     CBTipo: TLFComboBox;
     ETipoDocumentoTributario: TLFEdit;
     TBFiltros: TLFToolBar;
     TButtFiltrar: TToolButton;
     TBButtLimpiarFiltos: TToolButton;
     TBSep4: TToolButton;
     TBSep5: TToolButton;
     PNLFiltroPendientes: TLFPanel;
     CBDocumentosPendientes: TLFCheckBox;
     PNLFiltroFolio: TLFPanel;
     LFolio: TLFLabel;
     EFolio: TLFEdit;
     ListadoFAC: TAction;
     AdjuntoFAC: TAction;
     Exportar_Excel: TAction;
     Importar_Excel: TAction;
     PCMain: TLFPageControl;
     TSDocumentos: TTabSheet;
     TSRCVVenta: TTabSheet;
     DBGDocumentos: TDBGridFind2000;
     DBGRCVVenta: TDBGridFind2000;
     ResumenTotal: TAction;
     LPeriodo: TLFLabel;
     ETituloPeriodo: TLFEdit;
     EFPeriodo: TLFEditFind2000;
     PNLFiltroPeriodo: TLFPanel;
     TBSep3: TToolButton;
     AAsignaEstadoEnvio: TAction;
     AObtencionDeCorreos: TAction;
     Splitter: TSplitter;
     ImageList1: TImageList;
     AAbreAdjunto: TAction;
     ToolButton1: TToolButton;
     TButtVerEmail: TToolButton;
     LFCategoryAction1: TLFCategoryAction;
     LFCategoryAction2: TLFCategoryAction;
     LFCategoryAction3: TLFCategoryAction;
     AConsultaDocumentoSii: TAction;
     AConsultaDocumentoMasivoSii: TAction;
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TButtMarcarClick(Sender: TObject);
     procedure TButtCancelarClick(Sender: TObject);
     procedure DBGDocumentosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGDocumentosDblClick(Sender: TObject);
     procedure TButtEnviaDTEClick(Sender: TObject);
     procedure DBGDocumentosCellClick(Column: TColumn);
     procedure DBEFTipoDocumentoTributarioChange(Sender: TObject);
     procedure TBButtLimpiarFiltosClick(Sender: TObject);
     procedure TButtFiltrarClick(Sender: TObject);
     procedure EFolioKeyPress(Sender: TObject; var Key: char);
     procedure DBEFTipoDocumentoTributarioBusqueda(Sender: TObject);
     procedure Exportar_ExcelExecute(Sender: TObject);
     procedure Importar_ExcelExecute(Sender: TObject);
     procedure ResumenTotalExecute(Sender: TObject);
     procedure TSDocumentosShow(Sender: TObject);
     procedure TSRCVVentaShow(Sender: TObject);
     procedure EFPeriodoChange(Sender: TObject);
     procedure AAsignaEstadoEnvioExecute(Sender: TObject);
     procedure AObtencionDeCorreosExecute(Sender: TObject);
     procedure AAbreAdjuntoExecute(Sender: TObject);
     procedure AConsultaDocumentoSiiExecute(Sender: TObject);
     procedure AConsultaDocumentoMasivoSiiExecute(Sender: TObject);
  private
     { Private declarations }
     Serie: string;
     ColActual: TColumn;
  public
     { Public declarations }
     procedure PosicionaDocumento(IdDoc: integer);
  end;

var
  FMEnviaXmlFacturasChl : TFMEnviaXmlFacturasChl;

implementation

uses UDMEnviaxmLfacturasChl, UDMMain, UEntorno, UFMain, UParam,
  UFMEnviaXmlFacturasChlResumen, UFMDteRecepcionCorreos, UDameDato, URellenaLista;

{$R *.DFM}

procedure TFMEnviaXmlFacturasChl.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMEnviaXMLFacturasChl, DMEnviaXMLFacturasChl);
  NavMain.DataSource := DMEnviaXMLFacturasChl.DSQMDocumentos;
  CEMainPMEdit.Teclas := DMMain.Teclas;
  ControlEdit := CEMain;

  PCMain.ActivePage := TSDocumentos;

  ColActual := DBGDocumentos.Columns[0];
  DBGDocumentos.ColumnasChecked.Strings[DBGDocumentos.ColumnasCheckBoxes.IndexOf('ENTRADA_FACTURACION')] := IntToStr(REntorno.Entrada);

  // Datos a mostrar
  RellenaSeries(CBSeries.Items);

  TBButtLimpiarFiltosClick(Sender);
  EFPeriodo.Text := DMMain.DamePeriodo(REntorno.FechaTrab);
end;

procedure TFMEnviaXmlFacturasChl.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMEnviaXMLFacturasChl);
end;

procedure TFMEnviaXmlFacturasChl.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  DMEnviaXMLFacturasChl.BusquedaCompleja(Serie);
  Continua := False;
end;

procedure TFMEnviaXmlFacturasChl.TButtMarcarClick(Sender: TObject);
begin
  DMEnviaXMLFacturasChl.MarcaTodas(REntorno.Entrada);
end;

procedure TFMEnviaXmlFacturasChl.TButtCancelarClick(Sender: TObject);
begin
  DMEnviaXMLFacturasChl.MarcaTodas(0);
end;

procedure TFMEnviaXmlFacturasChl.DBGDocumentosDblClick(Sender: TObject);
begin
  inherited;
  if (DMEnviaXMLFacturasChl.QMDocumentos.FieldByName('ID_S').AsInteger <> 0) then
  begin
     if ((UpperCase(ColActual.FieldName) = 'SERIE') or (UpperCase(ColActual.FieldName) = 'TIPO') or (UpperCase(ColActual.FieldName) = 'RIG')) then
        FMain.TraspasoDeDocumentosSalida(DMEnviaXMLFacturasChl.QMDocumentos.FieldByName('ID_S').AsInteger)
     else
     if (UpperCase(ColActual.FieldName) = 'CLIENTE') then
        FMain.EjecutaAccion(FMain.AClientes, 'CLIENTE = ' + DMEnviaXMLFacturasChl.QMDocumentos.FieldByName('CLIENTE').AsString)
     else
     if ((UpperCase(ColActual.FieldName) = 'XML_DTE_RECIBIDO') and (DMEnviaXMLFacturasChl.QMDocumentos.FieldByName('XML_DTE_RECIBIDO').AsInteger = 1)) then
        DMEnviaXMLFacturasChl.AbreXmlDTE
     else
     if ((UpperCase(ColActual.FieldName) = 'XML_RESPUESTA_ENVIO') and (DMEnviaXMLFacturasChl.QMDocumentos.FieldByName('XML_RESPUESTA_ENVIO').AsInteger = 1)) then
        DMEnviaXMLFacturasChl.AbreXmlRespuestaEnvio;
  end;
end;

procedure TFMEnviaXmlFacturasChl.DBGDocumentosDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if ((UpperCase(Column.FieldName) = 'SERIE') or (UpperCase(Column.FieldName) = 'TIPO') or (UpperCase(Column.FieldName) = 'RIG') or (UpperCase(Column.FieldName) = 'CLIENTE')) then
        CeldaEnlace(TDBGridFind2000(Sender), Rect);

     if (gdFocused in State) then
        ColorFocused(Canvas)
     else
     begin
        if ((UpperCase(Column.FieldName) = 'SERIE') or (UpperCase(Column.FieldName) = 'TIPO') or (UpperCase(Column.FieldName) = 'RIG')) then
        begin
           if (DMEnviaXMLFacturasChl.QMDocumentosTIPO.AsString = 'ALB') then
              ColorResaltado(Canvas)
           else
              ColorResaltado2(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'FOLIO') then
        begin
           if (DMEnviaXMLFacturasChl.QMDocumentosFOLIO.AsInteger = 0) then
              ColorInfo(Canvas)
           else
              ColorInactivo(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'TIPO_DOC_TRIBUTARIO') then
        begin
           if (DMEnviaXMLFacturasChl.QMDocumentosTIPO_DOC_TRIBUTARIO.AsString = 'DES') then
              ColorError(Canvas)
           else
              ColorInfo(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'FECHA_RECLAMO') then
        begin
           if (DMEnviaXMLFacturasChl.QMDocumentosFOLIO.AsInteger = 0) then
              ColorInactivo(Canvas)
           else
           // Existe Fecha de reclamación -> Rojo
           if (DMEnviaXMLFacturasChl.QMDocumentosFECHA_RECLAMO.IsNull) then
              ColorInfo(Canvas)
           else
              ColorError(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'FECHA_DOCTO') then
        begin
           if (DMEnviaXMLFacturasChl.QMDocumentosFOLIO.AsInteger = 0) then
              ColorInactivo(Canvas)
           else
           // Fechas diferentes -> Fucsia
           if (Trunc(DMEnviaXMLFacturasChl.QMDocumentosFECHA_DOCTO.AsDateTime) <> Trunc(DMEnviaXMLFacturasChl.QMDocumentosFECHA.AsDateTime)) then
              ColorResaltado3(Canvas)
           else
              ColorInfo(Canvas);
        end
        else
        if (UpperCase(Column.FieldName) = 'MONTO_TOTAL') then
        begin
           if (DMEnviaXMLFacturasChl.QMDocumentosFOLIO.AsInteger = 0) then
              ColorInactivo(Canvas)
           else
           // Liquido diferente MONTO_TOTAL
           if (DMEnviaXMLFacturasChl.QMDocumentosMONTO_TOTAL.AsFloat <> DMEnviaXMLFacturasChl.QMDocumentosLIQUIDO.AsFloat) then
              ColorError(Canvas)
           else
              ColorInfo(Canvas);
        end;
     end;
  end;
end;

procedure TFMEnviaXmlFacturasChl.TButtEnviaDTEClick(Sender: TObject);
begin
  inherited;
  DMEnviaXMLFacturasChl.EnvioDteMasivo;
  TButtFiltrar.Click;
end;

procedure TFMEnviaXmlFacturasChl.PosicionaDocumento(IdDoc: integer);
var
  i : integer;
  Serie : string;
  Tipo : string;
  Rig : integer;
  Cliente : integer;
begin
  if (IdDoc <> 0) then
  begin
     DMEnviaXMLFacturasChl.DameDatosDocVenta(IdDoc, Serie, Tipo, Rig, Cliente);

     // Establezco filtro segun el documento
     i := 0;
     while (i < CBSeries.Items.Count - 1) and
        (Copy(CBSeries.Items[i], 1, Pos(' ', CBSeries.Items[i]) - 1) <> Serie) do
        Inc(i);
     if (i < CBSeries.Items.Count) then
        CBSeries.ItemIndex := i;

     if (Tipo = 'ALB') then
        CBTipo.ItemIndex := 1
     else
     if (Tipo = 'FAC') then
        CBTipo.ItemIndex := 2
     else
        CBTipo.ItemIndex := 0;

     EDesdeDocumento.Text := IntToStr(Rig);
     EHastaDocumento.Text := IntToStr(Rig);

     CBDocumentosPendientes.Checked := True;
     DBEFTipoDocumentoTributario.Text := '';
     DBECliente.Text := IntToStr(Cliente);

     // Marco el documento
     DMEnviaXMLFacturasChl.MarcarDocumento(Tipo, IdDoc);

     // Aplico filtro
     TButtFiltrar.Click;
  end;
end;

procedure TFMEnviaXmlFacturasChl.DBGDocumentosCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMEnviaXmlFacturasChl.DBEFTipoDocumentoTributarioChange(Sender: TObject);
begin
  inherited;
  ETipoDocumentoTributario.Text := DameTituloTipoDocTributario(DBEFTipoDocumentoTributario.Text);
  TButtFiltrarClick(Sender);
end;

procedure TFMEnviaXmlFacturasChl.TBButtLimpiarFiltosClick(Sender: TObject);
begin
  inherited;
  CBSeries.ItemIndex := 0;
  EDesdeDocumento.Text := '';
  EHastaDocumento.Text := '';
  CBTipo.ItemIndex := 0;
  DBEFTipoDocumentoTributario.Text := '';
  DBECliente.Text := '';

  TButtFiltrar.Click;

  DMEnviaXMLFacturasChl.MarcaTodas(0);
end;

procedure TFMEnviaXmlFacturasChl.TButtFiltrarClick(Sender: TObject);
begin
  inherited;
  if (CBSeries.Text <> '') then
  begin
     if (CBSeries.ItemIndex = 0) then
        Serie := ''
     else
     begin
        // Obtengo el texto del item y no de la propiedad Text, por si escribieron y no conicide (mayúsculas/minúsculas, por ejemplo)
        Serie := CBSeries.Items[CBSeries.ItemIndex];
        Serie := Copy(Serie, 1, Pos(' ', Serie) - 1);
     end;
     DMEnviaXMLFacturasChl.CambiarSeleccion(StrToIntDef(EDesdeDocumento.Text, 0), StrToIntDef(EHastaDocumento.Text, 0), StrToIntDef(DBECliente.Text, 0), Serie, DBEFTipoDocumentoTributario.Text, Trim(EFPeriodo.Text), CBTipo.ItemIndex, CBDocumentosPendientes.Checked);
  end;
end;

procedure TFMEnviaXmlFacturasChl.EFolioKeyPress(Sender: TObject; var Key: char);
begin
  inherited;
  if (Key = #13) then
  begin
     if (PCMain.ActivePage = TSDocumentos) then
        DMEnviaXMLFacturasChl.PosicionarFolioDocumentos(StrToIntDef(EFolio.Text, 0))
     else
     if (PCMain.ActivePage = TSRCVVenta) then
        DMEnviaXMLFacturasChl.PosicionarFolioRCVVenta(StrToIntDef(EFolio.Text, 0));
  end;
end;

procedure TFMEnviaXmlFacturasChl.DBEFTipoDocumentoTributarioBusqueda(Sender: TObject);
begin
  inherited;
  case CBTipo.ItemIndex of
     1: DBEFTipoDocumentoTributario.CondicionBusqueda := 'VISIBLE_ALB = 1';
     2: DBEFTipoDocumentoTributario.CondicionBusqueda := 'VISIBLE_FAC = 1';
     else
        DBEFTipoDocumentoTributario.CondicionBusqueda := '((VISIBLE_ALB = 1) OR (VISIBLE_FAC = 1))';
  end;
end;

procedure TFMEnviaXmlFacturasChl.Exportar_ExcelExecute(Sender: TObject);
var
  Archivo : string;
begin
  Archivo := Format(_('Documentos-%s.csv'), [FormatDateTime('yyyymmdd-hhnnss', Now)]);
  if MySaveDialog(Archivo, 'CSV,ALL', '', 'FMEnviaXmlFacturasChl') then
     ExportarCSV(Archivo, DMEnviaXMLFacturasChl.DSQMDocumentos);
end;

procedure TFMEnviaXmlFacturasChl.Importar_ExcelExecute(Sender: TObject);
var
  Archivo : string;
begin
  inherited;

  Archivo := '';
  if (MyOpenDialog(Archivo, 'CSV,ALL', '', 'FMEnviaXmlFacturasChl-Importar_Excel')) then
     DMEnviaXMLFacturasChl.ImportarCSV(Archivo);
end;

procedure TFMEnviaXmlFacturasChl.ResumenTotalExecute(Sender: TObject);
begin
  inherited;
  DMEnviaXMLFacturasChl.QMRCV_VENTA_TOTAL.Close;
  DMEnviaXMLFacturasChl.QMRCV_VENTA_TOTAL.Open;

  DMEnviaXMLFacturasChl.QMDocumentos_Totales.Close;
  DMEnviaXMLFacturasChl.QMDocumentos_Totales.Open;

  AbreForm(TFMEnviaXmlFacturasChlResumen, FMEnviaXmlFacturasChlResumen, Sender);
end;

procedure TFMEnviaXmlFacturasChl.TSDocumentosShow(Sender: TObject);
begin
  inherited;
  NavMain.DataSource := DMEnviaXMLFacturasChl.DSQMDocumentos;
end;

procedure TFMEnviaXmlFacturasChl.TSRCVVentaShow(Sender: TObject);
begin
  inherited;
  NavMain.DataSource := DMEnviaxmLfacturasChl.DSQMRCV_VENTA;
end;

procedure TFMEnviaXmlFacturasChl.EFPeriodoChange(Sender: TObject);
begin
  inherited;
  ETituloPeriodo.Text := DameTituloPeriodo(EFPeriodo.Text);
  TButtFiltrarClick(Sender);
end;

procedure TFMEnviaXmlFacturasChl.AAsignaEstadoEnvioExecute(Sender: TObject);
begin
  inherited;
  DMEnviaXmlFacturasChl.AsignaEstado;
  TButtFiltrar.Click;
end;

procedure TFMEnviaXmlFacturasChl.AObtencionDeCorreosExecute(Sender: TObject);
var
  FM : TFMDteRecepcionCorreos;
begin
  inherited;
  FM := TFMDteRecepcionCorreos.Create(Self);
  FM.ShowModal;
  FreeAndNil(FM);
end;

procedure TFMEnviaXmlFacturasChl.AAbreAdjuntoExecute(Sender: TObject);
begin
  inherited;
  DMEnviaXmlFacturasChl.AbreMensaje;
end;

procedure TFMEnviaXmlFacturasChl.AConsultaDocumentoSiiExecute(Sender: TObject);
begin
  inherited;
  DMEnviaXmlFacturasChl.EnviaConsultaDocumentoSII;
  TButtFiltrarClick(Sender);
end;

procedure TFMEnviaXmlFacturasChl.AConsultaDocumentoMasivoSiiExecute(Sender: TObject);
begin
  inherited;
  DMEnviaXmlFacturasChl.EnviaConsultaMasivaDocumentoSII;
  TButtFiltrarClick(Sender);
end;

end.
