unit UFMVerifactu;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, UFPEditSinNavegador, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, StdCtrls, Mask, DBCtrls, ULFDBEdit,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, rxToolEdit, RXDBCtrl,
  ULFDBDateEdit, ULFLabel, dbcgrids, ULFDBCtrlGrid, Buttons, RxDBComb,
  ULFDBMemo;

type
  TFMVerifactu = class(TFPEditSinNavegador)
     PCMain: TLFPageControl;
     TSPendientes: TTabSheet;
     TSRemision: TTabSheet;
     TBRegistroFactura: TLFToolBar;
     NavRegistroFactura: THYMNavigator;
     DBGRegistroFactura: TDBGridFind2000;
     PNLRegistroFactura: TLFPanel;
     PNLRegistroFacturaAlta: TLFPanel;
     PNLRegistroFacturaAnulacion: TLFPanel;
     LIdSecuencia: TLFLabel;
     DBEIdSecuencia: TLFDbedit;
     LIdVersion: TLFLabel;
     DBEIdVersion: TLFDbedit;
     LIdFactIdEmisor: TLFLabel;
     DBEIdFactIdEmisor: TLFDbedit;
     LPendAltaIdFactura: TLFLabel;
     DBEIdFactNumSerie: TLFDbedit;
     LIdFactNumSerie: TLFLabel;
     LIdFactFechaExpedicion: TLFLabel;
     LRefExterna: TLFLabel;
     DBERefExterna: TLFDbedit;
     DBENombreRazonEmisor: TLFDbedit;
     LNombreRazonEmisor: TLFLabel;
     LTerceroIdOtroCodPais: TLFLabel;
     DBETerceroIdOtroCodPais: TLFDbedit;
     LTerceroNIF: TLFLabel;
     DBETerceroNIF: TLFDbedit;
     LTipoFactura: TLFLabel;
     LTipoRectificativa: TLFLabel;
     LPendAltaRectificativa: TLFLabel;
     LFechaOperacion: TLFLabel;
     DBDEFechaOperacion: TLFDBDateEdit;
     LDescOperacion: TLFLabel;
     DBEDescOperacion: TLFDbedit;
     DBCBFactSimplificada: TLFDBCheckBox;
     DBDEIdFactFechaExpedicion: TLFDBDateEdit;
     DBCBSubsanacion: TLFDBCheckBox;
     DBCBRechazoPrevio: TLFDBCheckBox;
     DBCBFactSinIdentificarDest: TLFDBCheckBox;
     DBCBMacrodato: TLFDBCheckBox;
     LEmitidaPorTerceroDestinatario: TLFLabel;
     LTerceroNombreRazon: TLFLabel;
     DBETerceroNombreRazon: TLFDbedit;
     DBETerceroIdOtroIdType: TLFDbedit;
     LTerceroIdOtroIdType: TLFLabel;
     DBETerceroIdOtroId: TLFDbedit;
     LTerceroIdOtroId: TLFLabel;
     LDestoIdOtroCodPais: TLFLabel;
     DBEDestoIdOtroCodPais: TLFDbedit;
     LDestNIF: TLFLabel;
     DBEDestNIF: TLFDbedit;
     LDestNombreRazon: TLFLabel;
     DBEDestNombreRazon: TLFDbedit;
     DBEDestIdOtroIdType: TLFDbedit;
     LDestIdOtroIdType: TLFLabel;
     DBEDestIdOtroId: TLFDbedit;
     LDestIdOtroId: TLFLabel;
     DBCBCupon: TLFDBCheckBox;
     LCuotaTotal: TLFLabel;
     DBECuotaTotal: TLFDbedit;
     LImporteTotal: TLFLabel;
     DBEImporteTotal: TLFDbedit;
     LNumRegistroAcuerdoFact: TLFLabel;
     DBENumRegistroAcuerdoFact: TLFDbedit;
     LIdAcuerdoSistemaInf: TLFLabel;
     DBEIdAcuerdoSistemaInf: TLFDbedit;
     LEstado: TLFLabel;
     DBEEstadoRegistro: TLFDbedit;
     LCodigoErrorRegistro: TLFLabel;
     DBECodigoErrorRegistro: TLFDbedit;
     LDescErrorRegistro: TLFLabel;
     DBEDescErrorRegistro: TLFDbedit;
     LRectIdEmisor: TLFLabel;
     DBERectIdEmisor: TLFDbedit;
     DBERectNumSerie: TLFDbedit;
     LRectNumSerie: TLFLabel;
     LRectFechaExpedicion: TLFLabel;
     DBDERectFechaExpedicion: TLFDBDateEdit;
     LSusIdEmisor: TLFLabel;
     DBESusIdEmisor: TLFDbedit;
     DBESusNumSerie: TLFDbedit;
     LSusNumSerie: TLFLabel;
     LSusFechaExpedicion: TLFLabel;
     DBDESusFechaExpedicion: TLFDBDateEdit;
     LSustitutiva: TLFLabel;
     LEmitidaPorTercero: TLFLabel;
     LDestinatario: TLFLabel;
     DBCGRegistroFacturaDesg: TLFDBCtrlGrid;
     LDesgImpuesto: TLFLabel;
     LDesgClaveRegimen: TLFLabel;
     LDesgCaliificacion: TLFLabel;
     LDesgOperacionExenta: TLFLabel;
     LDesgTipoImpositivo: TLFLabel;
     DBEDesgTipoImpositivo: TLFDbedit;
     LDesgBaseImponible: TLFLabel;
     DBEDesgBaseImponible: TLFDbedit;
     DBEDesgCuota: TLFDbedit;
     LDesgTipoRecargo: TLFLabel;
     DBEDesgTipoRecargo: TLFDbedit;
     DBEDesgCuotaRecargo: TLFDbedit;
     DBEDesgBaseImponibleACoste: TLFDbedit;
     LDesgBaseImponibleACoste: TLFLabel;
     LAnulIdSecuencia: TLFLabel;
     DBEAnulIdSecuencia: TLFDbedit;
     LAnulIdVersion: TLFLabel;
     DBEAnulIdVersion: TLFDbedit;
     LAnulIdEmisor: TLFLabel;
     DBEAnulIdEmisor: TLFDbedit;
     LAnulIdFactura: TLFLabel;
     DBEAnulNumSerieFactura: TLFDbedit;
     LAnulNumSerieFactura: TLFLabel;
     LAnulFechaExpedicion: TLFLabel;
     DBDEAnulFechaExpedicion: TLFDBDateEdit;
     LAnulRefExterna: TLFLabel;
     DBEAnulRefExterna: TLFDbedit;
     DBCBSinRegistroPrevio: TLFDBCheckBox;
     DBCBAnulRechazoPrevio: TLFDBCheckBox;
     DBCBGeneradoPor: TRxDBComboBox;
     LGeneradoPor: TLFLabel;
     LAnulGPNombreRazon: TLFLabel;
     DBEAnulGPNombreRazon: TLFDbedit;
     LAnulGPIdOtroCodPais: TLFLabel;
     DBEAnulGPIdOtroCodPais: TLFDbedit;
     LAnulGPNIF: TLFLabel;
     DBEAnulGPNIF: TLFDbedit;
     DBEAnulGPIDOTRO_IDTYPE: TLFDbedit;
     LAnulGPIDOTRO_IDTYPE: TLFLabel;
     DBEAnulGPIDOTRO_ID: TLFDbedit;
     LAnulGPIDOTRO_ID: TLFLabel;
     LAnulGeneradoPor: TLFLabel;
     SBFactura: TSpeedButton;
     SBFacturaAnulacion: TSpeedButton;
     TBRemision: TLFToolBar;
     NavRemision: THYMNavigator;
     DBGRemision: TDBGridFind2000;
     PNLSecuencias: TLFPanel;
     DBCBTipoFactura: TRxDBComboBox;
     DBCBTipoRectificativa: TRxDBComboBox;
     DBCBEmitidaPorTerceroDestinatario: TRxDBComboBox;
     DBCBDesgImpuesto: TRxDBComboBox;
     DBCBDesgClaveRegimen: TRxDBComboBox;
     DBCBDesgCaliificacion: TRxDBComboBox;
     DBCBDesgOperacionExenta: TRxDBComboBox;
     PCRemision: TLFPageControl;
     TSVistaRemision: TTabSheet;
     TSRemisionRAW: TTabSheet;
     PNLSOAPRequest: TLFPanel;
     PNLSOAPResponse: TLFPanel;
     splSOAP: TSplitter;
     DBMSOAPResponse: TLFDBMemo;
     DBMSOAPRequest: TLFDBMemo;
     PNLSOAP: TLFPanel;
     LSOAPRequest: TLFLabel;
     LSOAPResponse: TLFLabel;
     TBSep1: TToolButton;
     TBSep2: TToolButton;
     TBAnularRegistro: TToolButton;
     LEstadoRegistroAnul: TLFLabel;
     DBEEstadoRegistroAnul: TLFDbedit;
     LCodigoErrorAnul: TLFLabel;
     DBECodigoErrorAnul: TLFDbedit;
     LDescErrorAnul: TLFLabel;
     DBEDescErrorAnul: TLFDbedit;
     NavRegFactAlta: THYMNavigator;
     NavRegFactAnulacion: THYMNavigator;
     LFLabel1: TLFLabel;
     LFLabel2: TLFLabel;
     TBSep3: TToolButton;
     TBDuplicar: TToolButton;
     TBSep4: TToolButton;
     TBRefrescar: TToolButton;
     TSConfiguracion: TTabSheet;
     LSICodPais: TLFLabel;
     LSINIF: TLFLabel;
     LSINombreRazon: TLFLabel;
     LSIIdType: TLFLabel;
     LSIID: TLFLabel;
     LConfiguracionSI: TLFLabel;
     DBESICodPais: TLFDbedit;
     DBESINIF: TLFDbedit;
     DBESINombreRazon: TLFDbedit;
     DBESIIdType: TLFDbedit;
     DBESIID: TLFDbedit;
     LSINombreSistemaInformatico: TLFLabel;
     DBESINombreSistemaInformatico: TLFDbedit;
     LSIIdSistemaInformatico: TLFLabel;
     DBESIIdSistemaInformatico: TLFDbedit;
     LSINumeroInstalacion: TLFLabel;
     DBESINumeroInstalacion: TLFDbedit;
     LSITipoUsoPosibleSoloVerifactu: TLFLabel;
     DBESITipoUsoPosibleSoloVerifactu: TLFDbedit;
     LSITipoUsoPosibleMultiOT: TLFLabel;
     DBESITipoUsoPosibleMultiOT: TLFDbedit;
     LSIIndicadorMultipleOT: TLFLabel;
     DBESIIndicadorMultipleOT: TLFDbedit;
     LSIIntervaloRefresco: TLFLabel;
     DBESIIntervaloRefresco: TLFDbedit;
     LCertificado1: TLFLabel;
     LCertificadoClave: TLFLabel;
     DBECertificadoClave: TLFDbedit;
     BCargarCertificado: TButton;
     LServicio: TLFLabel;
     NavClave: THYMNavigator;
     DBCBEntornoPruebas: TLFDBCheckBox;
     DBTCertificadoCargado: TDBText;
     LCertificadoFichero: TLFLabel;
     DBECertificadoFichero: TLFDbedit;
     LCertificadoVencimiento: TLFLabel;
     DBDECertificadoClave: TLFDBDateEdit;
     LVersionSIF: TLFLabel;
     DBEVersionSIF: TLFDbedit;
     LEmisor: TLFLabel;
     TSErrores: TTabSheet;
     TBErrores: TLFToolBar;
     NavErrores: THYMNavigator;
     TBSep11: TToolButton;
     DBGErrores: TDBGridFind2000;
     SBVerFacturaError: TToolButton;
     TBDuplicarErrores: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBEIdSecuenciaChange(Sender: TObject);
     procedure SBFacturaClick(Sender: TObject);
     procedure SBFacturaAnulacionClick(Sender: TObject);
     procedure TSPendientesShow(Sender: TObject);
     procedure TSRemisionShow(Sender: TObject);
     procedure PNLSOAPResize(Sender: TObject);
     procedure TSVistaRemisionShow(Sender: TObject);
     procedure TSRemisionRAWShow(Sender: TObject);
     procedure DBEEstadoRegistroChange(Sender: TObject);
     procedure DBGRegistroFacturaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGRemisionDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure TBAnularRegistroClick(Sender: TObject);
     procedure TBDuplicarClick(Sender: TObject);
     procedure TBRefrescarClick(Sender: TObject);
     procedure BCargarCertificadoClick(Sender: TObject);
     procedure TSErroresShow(Sender: TObject);
     procedure SBVerFacturaErrorClick(Sender: TObject);
     procedure DBGErroresDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure DBGErroresCellClick(Column: TColumn);
     procedure DBGErroresDblClick(Sender: TObject);
  private
     { Private declarations }
     ColActual: TColumn;
     procedure Posiciona(IdRemision, IdSecuencia: integer);
  public
     { Public declarations }
  end;

var
  FMVerifactu : TFMVerifactu;

implementation

uses UFormGest, UDMVerifactu, UFMain, UUtiles, UDMMain;

{$R *.dfm}

procedure TFMVerifactu.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMVerifactu, DMVerifactu);

  PCMain.ActivePage := TSPendientes;
  NavRegistroFactura.DataSource := DMVerifactu.DSRegFacturasPend;
  DBGRegistroFactura.DataSource := DMVerifactu.DSRegFacturasPend;

  PNLRegistroFacturaAlta.Visible := True;
  PNLRegistroFacturaAlta.Align := alClient;

  PNLRegistroFacturaAnulacion.Visible := False;
  PNLRegistroFacturaAnulacion.Align := alClient;

  PCRemision.ActivePage := TSVistaRemision;

  // Asigno Imagenes a BitdBtn
  GetBitmapFromImageList(SBFactura, 1, DMMain.ILMain_Ac, 61);
  GetBitmapFromImageList(SBFacturaAnulacion, 1, DMMain.ILMain_Ac, 61);
end;

procedure TFMVerifactu.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMVerifactu);
end;

procedure TFMVerifactu.DBEIdSecuenciaChange(Sender: TObject);
begin
  inherited;
  PNLRegistroFacturaAlta.Visible := (DMVerifactu.xRegFacturasTIPO_REGISTRO.AsString = 'ALT');
  PNLRegistroFacturaAnulacion.Visible := (DMVerifactu.xRegFacturasTIPO_REGISTRO.AsString = 'ANU');
end;

procedure TFMVerifactu.SBFacturaClick(Sender: TObject);
begin
  inherited;
  FMain.TraspasoDeDocumentosSalida(DMVerifactu.xRegFactAltaID_S.AsInteger);
end;

procedure TFMVerifactu.SBFacturaAnulacionClick(Sender: TObject);
begin
  inherited;
  FMain.TraspasoDeDocumentosSalida(DMVerifactu.xRegFactAnulacionID_S.AsInteger);
end;

procedure TFMVerifactu.TSPendientesShow(Sender: TObject);
begin
  inherited;
  PNLSecuencias.Parent := TSPendientes;
  DMVerifactu.MuestraRegistrosPendientes;
end;

procedure TFMVerifactu.TSRemisionShow(Sender: TObject);
begin
  inherited;
  PNLSecuencias.Parent := TSVistaRemision;
  DMVerifactu.MuestraRegistrosRemision;

  if (PCRemision.ActivePage = TSVistaRemision) then
     TSVistaRemisionShow(Sender)
  else
  if (PCRemision.ActivePage = TSRemisionRAW) then
     TSRemisionRAWShow(Sender);
end;

procedure TFMVerifactu.PNLSOAPResize(Sender: TObject);
begin
  inherited;
  PNLSOAPRequest.Width := PNLSOAP.Width div 2;
end;

procedure TFMVerifactu.TSVistaRemisionShow(Sender: TObject);
begin
  inherited;
  DMVerifactu.DesconectaSOAP;
end;

procedure TFMVerifactu.TSRemisionRAWShow(Sender: TObject);
begin
  inherited;
  DMVerifactu.ConectaSOAP;
end;

procedure TFMVerifactu.DBEEstadoRegistroChange(Sender: TObject);
begin
  inherited;
  if (DMVerifactu.xRegFacturasESTADO_REGISTRO.AsString = 'Correcto') then
     ColorResaltado2(Sender)
  else
  if (DMVerifactu.xRegFacturasESTADO_REGISTRO.AsString = 'AceptadoConErrores') then
     ColorResaltado(Sender)
  else
  if (DMVerifactu.xRegFacturasESTADO_REGISTRO.AsString = 'Incorrecto') then
     ColorError(Sender)
  else
     ColorInactivo(Sender);
end;

procedure TFMVerifactu.DBGRegistroFacturaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'ESTADO_REGISTRO') then
        begin
           if (DMVerifactu.xRegFacturasESTADO_REGISTRO.AsString = 'Correcto') then
              ColorResaltado2(Canvas)
           else
           if (DMVerifactu.xRegFacturasESTADO_REGISTRO.AsString = 'AceptadoConErrores') then
              ColorResaltado(Canvas)
           else
           if (DMVerifactu.xRegFacturasESTADO_REGISTRO.AsString = 'Incorrecto') then
              ColorError(Canvas)
           else
              ColorInactivo(Canvas);
        end
        else
        if (DMVerifactu.xRegFacturasACTIVO.AsInteger = 1) then
           ColorInfo(Canvas)
        else
           ColorInactivo(Canvas);
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMVerifactu.DBGRemisionDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'ESTADO_ENVIO') then
        begin
           if (DMVerifactu.xRemisionESTADO_ENVIO.AsString = 'Correcto') then
              ColorResaltado2(Canvas)
           else
           if (DMVerifactu.xRemisionESTADO_ENVIO.AsString = 'ParcialmenteCorrecto') then
              ColorResaltado(Canvas)
           else
           if (DMVerifactu.xRemisionESTADO_ENVIO.AsString = 'Incorrecto') then
              ColorError(Canvas)
           else
              ColorInactivo(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMVerifactu.TBAnularRegistroClick(Sender: TObject);
var
  IdSecuencia : integer;
begin
  inherited;
  if (ConfirmaMensaje(_('Esta seguro de que desea crear un registro de anulacion?'))) then
  begin
     IdSecuencia := DMVerifactu.DSRegFacturasPend.DataSet.FieldByName('ID_SECUENCIA').AsInteger;

     // La anulacino se creara inactiva y Pendientes ya que no estara asociado a una remision.
     // Por eso salto a esa página
     PCMain.ActivePage := TSPendientes;
     DMVerifactu.AnularRegistroFacturacion(IdSecuencia);
  end;
end;

procedure TFMVerifactu.TBDuplicarClick(Sender: TObject);
var
  IdSecuencia : integer;
begin
  inherited;
  if (ConfirmaMensaje(_('Esta seguro de que desea crear un duplicado del registro?'))) then
  begin
     IdSecuencia := DMVerifactu.DSRegFacturasPend.DataSet.FieldByName('ID_SECUENCIA').AsInteger;

     // El registro se creara inactivo y dentro de Pendientes ya que no estara asociado a una remision.
     // Por eso salto a esa página
     PCMain.ActivePage := TSPendientes;
     DMVerifactu.DuplicarRegistroFacturacion(IdSecuencia);
  end;
end;

procedure TFMVerifactu.TBRefrescarClick(Sender: TObject);
begin
  inherited;
  if (PCMain.ActivePage = TSPendientes) then
     TSPendientesShow(Sender)
  else
  if (PCMain.ActivePage = TSRemision) then
     TSRemisionShow(Sender);
end;

procedure TFMVerifactu.BCargarCertificadoClick(Sender: TObject);
var
  Archivo : string;
begin
  inherited;
  if MyOpenDialog(Archivo, '', '', 'FMVerifactu_CargarCertificado') then
  begin
     DMVerifactu.CargaCertificado(Archivo);
  end;
end;

procedure TFMVerifactu.TSErroresShow(Sender: TObject);
begin
  inherited;
  DMVerifactu.MuestraRegistrosError;
end;

procedure TFMVerifactu.SBVerFacturaErrorClick(Sender: TObject);
begin
  inherited;
  FMain.TraspasoDeDocumentosSalida(DMVerifactu.xErroresID_S.AsInteger);
end;

procedure TFMVerifactu.DBGErroresDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  if ((UpperCase(Column.FieldName) = 'EJERCICIO') or
     (UpperCase(Column.FieldName) = 'SERIE') or
     (UpperCase(Column.FieldName) = 'TIPO') or
     (UpperCase(Column.FieldName) = 'RIG') or
     (UpperCase(Column.FieldName) = 'ID_REMISION') or
     (UpperCase(Column.FieldName) = 'ID_SECUENCIA')) then
     CeldaEnlace(TDBGridFind2000(Sender), Rect);

  with TDBGridFind2000(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        if (UpperCase(Column.FieldName) = 'ESTADO_REGISTRO') then
        begin
           if (DataSource.DataSet.FieldByName('ESTADO_REGISTRO').AsString = 'Incorrecto') then
              ColorError(Canvas)
           else
           if (DataSource.DataSet.FieldByName('ESTADO_REGISTRO').AsString = 'ParcialmenteCorrecto') then
              ColorResaltado(Canvas)
           else
           if (DataSource.DataSet.FieldByName('ESTADO_REGISTRO').AsString = 'Correcto') then
              ColorResaltado2(Canvas)
           else
              ColorInactivo(Canvas);
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMVerifactu.DBGErroresCellClick(Column: TColumn);
begin
  inherited;
  ColActual := Column;
end;

procedure TFMVerifactu.DBGErroresDblClick(Sender: TObject);
begin
  inherited;
  if ((UpperCase(ColActual.FieldName) = 'EJERCICIO') or (UpperCase(ColActual.FieldName) = 'RIG') or (UpperCase(ColActual.FieldName) = 'SERIE') or (UpperCase(ColActual.FieldName) = 'TIPO')) then
     FMain.TraspasoDeDocumentosSalida(DMVerifactu.xErroresID_S.AsInteger);
  if ((UpperCase(ColActual.FieldName) = 'ID_REMISION') or (UpperCase(ColActual.FieldName) = 'ID_SECUENCIA')) then
     Posiciona(DMVerifactu.xErroresID_REMISION.AsInteger, DMVerifactu.xErroresID_SECUENCIA.AsInteger);
end;

procedure TFMVerifactu.Posiciona(IdRemision, IdSecuencia: integer);
begin
  PCMain.ActivePage := TSRemision;
  DMVerifactu.Posiciona(IdRemision, IdSecuencia);
end;

end.
