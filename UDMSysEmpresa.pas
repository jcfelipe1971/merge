unit UDMSysEmpresa;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, FIBDataSet, FIBTableDataSet, ExtDlgs, FIBQuery, ImgList,
  FIBDatabase, UFIBModificados, UComponentesBusquedaFiltrada, FIBDataSetRO,
  HYFIBQuery, jpeg, GIFImage;

type
  TDMSysEmpresa = class(TDataModule)
     QMSysEmpresas: TFIBTableSet;
     QMSysEmpresasEMPRESA: TIntegerField;
     QMSysEmpresasTERCERO: TIntegerField;
     QMSysEmpresasFECHA_ALTA: TDateTimeField;
     QMSysEmpresasAPERTURA: TDateTimeField;
     QMSysEmpresasDURACION: TIntegerField;
     QMSysEmpresasMONEDA: TFIBStringField;
     DSQMSysEmpresas: TDataSource;
     QMSysEmpresasTITULO: TFIBStringField;
     xTerceros: TFIBDataSetRO;
     DSxTerceros: TDataSource;
     QMSysEmpresasABIERTA: TIntegerField;
     xMoneda: TFIBDataSetRO;
     DSxMoneda: TDataSource;
     SPEmpAjusta: THYFIBQuery;
     QMGenEjercicios: TFIBTableSet;
     DSQMGenEjercicios: TDataSource;
     QMGenEjerciciosEMPRESA: TIntegerField;
     QMGenEjerciciosEJERCICIO: TIntegerField;
     QMGenEjerciciosACTIVO: TIntegerField;
     QMGenEjerciciosAPERTURA: TDateTimeField;
     QMGenEjerciciosCIERRE: TDateTimeField;
     QMSysEmpresasMODO_IVA: TIntegerField;
     xModosIVA: TFIBDataSetRO;
     DSxModosIVA: TDataSource;
     SPActEjercicios: THYFIBQuery;
     SPActEmpresa: THYFIBQuery;
     SPLimEmp: THYFIBQuery;
     QMSysEmpresasIMPRIME_CABECERA: TIntegerField;
     TLocal: THYTransaction;
     SPJustificaDomicilio: THYFIBQuery;
     QMSysEmpresasCLIENTE_AUT: TIntegerField;
     SPChangeMoneda: THYFIBQuery;
     xTercerosNOMBRE_R_SOCIAL: TFIBStringField;
     xTercerosNOMBRE_COMERCIAL: TFIBStringField;
     xTercerosTIPO_RAZON: TFIBStringField;
     xTercerosNIF: TFIBStringField;
     xTercerosTELEFONO01: TFIBStringField;
     xTercerosTELEFONO02: TFIBStringField;
     xTercerosTELEFAX: TFIBStringField;
     xTercerosEMAIL: TFIBStringField;
     xTercerosWEB: TFIBStringField;
     QMSysEmpresasPMP_CERO: TIntegerField;
     QMSysEmpresasFECHA_CONTABILIZACION_COMPRAS: TIntegerField;
     QMSysEmpresasCIERRE_CONTABLE: TIntegerField;
     QMSysEmpresasFECHA_VENTAS: TIntegerField;
     QMSysEmpresasLISTAR_PEDIDOS: TIntegerField;
     QMSysEmpresasSERIE_AUTOFAC: TFIBStringField;
     xSeries: TFIBDataSetRO;
     DSxSeries: TDataSource;
     QMSysEmpresasE_IMAGEN: TIntegerField;
     QMSysEmpresasCIERRA_DOC_CERO: TIntegerField;
     QMSysEmpresasE_MAIL: TFIBStringField;
     QMSysEmpresasSERIALIZADO_AUTO: TIntegerField;
     QMSysEmpresasMOV_STOCK_ANULA_VENTAS: TIntegerField;
     QMSysEmpresasMOV_STOCK_ANULA_COMPRAS: TIntegerField;
     QMSysEmpresasPORTES_VENTAS: TIntegerField;
     QMSysEmpresasPORTES_COMPRAS: TIntegerField;
     QMSysEmpresasSEPARAR_APUNTES_REMESAS: TIntegerField;
     QMSysEmpresasSEPARAR_PEDIDOS_RECEPCION: TIntegerField;
     QMSysEmpresasCONTROL_STOCK_NEG: TIntegerField;
     QMSysEmpresasCONTROL_ASIENTO_NEG: TIntegerField;
     QMSysEmpresasIMPORTE_MAX_PEP: TFloatField;
     TUpdate: THYTransaction;
     QMSysEmpresasNO_CONTABILIZAR_FECHA_KRI: TIntegerField;
     QMSysEmpresasFECHA_NO_CONTABILIZACION_KRI: TDateTimeField;
     QMSysEmpresasIMPORTE_LETRAS: TIntegerField;
     QMSysEmpresasSEPARAR_DTO_CIAL: TIntegerField;
     QMSysEmpresasRECC: TIntegerField;
     QMSysEmpresasINVENTARIO_PERMANENTE: TIntegerField;
     QMSysEmpresasTAMANYO_EMPRESA: TFIBStringField;
     QMSysEmpresasAGENCIA_TRIBUTARIA: TFIBStringField;
     xTipoGiro: TFIBTableSet;
     xTipoGiroEMPRESA: TIntegerField;
     xTipoGiroCODIGO_GIRO: TIntegerField;
     xTipoGiroDEFECTO: TIntegerField;
     xTipoGiroTITULO: TFIBStringField;
     DSxTipoGiro: TDataSource;
     QMSysEmpresasGS1_COMPANY_PREFIX: TFIBStringField;
     QMSysEmpresasPROVEEDOR_AUT: TIntegerField;
     QMSysEmpresasACREEDOR_AUT: TIntegerField;
     QMSysEmpresasF_IMAGEN: TIntegerField;
     xConfigEmail: TFIBTableSet;
     DSxConfigEmail: TDataSource;
     xConfigEmailEMPRESA: TIntegerField;
     xConfigEmailTIPO: TFIBStringField;
     xConfigEmailASUNTO: TFIBStringField;
     xConfigEmailCUERPO: TBlobField;
     xConfigEmailPIE: TBlobField;
     QMSysEmpresasTEXTO_LOPD_PIE_DOCUMENTO: TMemoField;
     QMSysEmpresasTEXTO_LOPD: TMemoField;
     QMSysEmpresasREG_MERCANTIL: TMemoField;
     xConfigEmailID_CONFIG_SERV_CORREOS: TIntegerField;
     procedure DMSysEmpresaCreate(Sender: TObject);
     procedure QMSysEmpresasTERCEROChange(Sender: TField);
     procedure QMSysEmpresasNewRecord(DataSet: TDataSet);
     procedure QMSysEmpresasMONEDAChange(Sender: TField);
     procedure QMSysEmpresasBeforeDelete(DataSet: TDataSet);
     procedure QMSysEmpresasMODO_IVAChange(Sender: TField);
     procedure QMSysEmpresasBeforePost(DataSet: TDataSet);
     procedure QMSysEmpresasAfterOpen(DataSet: TDataSet);
     procedure QMSysEmpresasAfterPost(DataSet: TDataSet);
     procedure QMSysEmpresasBeforeEdit(DataSet: TDataSet);
     procedure QMSysEmpresasSERIE_AUTOFACChange(Sender: TField);
     procedure QMSysEmpresasAfterScroll(DataSet: TDataSet);
     procedure xTipoGiroNewRecord(DataSet: TDataSet);
     procedure xTipoGiroAfterPost(DataSet: TDataSet);
     procedure xTipoGiroAfterDelete(DataSet: TDataSet);
     procedure QMSysEmpresasBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     RegistroModificado: boolean;
     MonedaOld: string;
     ChgMoneda: boolean;
     procedure AbreAuxiliares;
     procedure PosicionaEmpresa;
  public
     { Public declarations }
     procedure AjustaAuxiliaresDeEmpresa;
     procedure AbrirEmpresa(Accion: smallint);
     procedure ActivarEjercicio(Accion: smallint);
     procedure AltaDeEjercicios;
     procedure ActivarEmpresa;
     procedure LimpiaEmpTodo;
     procedure BusquedaCompleja;
  end;

var
  DMSysEmpresa : TDMSysEmpresa;

implementation

uses UDMMain, ExtCtrls, UEntorno, uFBusca, UUtiles, UFParada, UFMain;

{$R *.DFM}

procedure TDMSysEmpresa.DMSysEmpresaCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  MonedaOld := '';
  PosicionaEmpresa;
  Self.AbreAuxiliares;
  ChgMoneda := False;
end;

procedure TDMSysEmpresa.QMSysEmpresasTERCEROChange(Sender: TField);
begin
  with xTerceros do
  begin
     Close;
     Open;
     QMSysEmpresasE_MAIL.AsString := FieldByName('EMAIL').AsString;
  end;
end;

procedure TDMSysEmpresa.QMSysEmpresasNewRecord(DataSet: TDataSet);
begin
  QMSysEmpresasEMPRESA.AsInteger := 0;
  QMSysEmpresasTERCERO.AsInteger := 1;
  QMSysEmpresasDURACION.AsInteger := 1;
  QMSysEmpresasABIERTA.AsInteger := 1;
  QMSysEmpresasAPERTURA.AsDateTime := REntorno.FechaTrabSH;
  QMSysEmpresasFECHA_ALTA.AsDateTime := REntorno.FechaTrabSH;
  QMSysEmpresasMONEDA.AsString := REntorno.Moneda;
  QMSysEmpresasMODO_IVA.AsInteger := 1;
  QMSysEmpresasCLIENTE_AUT.AsInteger := 1;
  QMSysEmpresasPROVEEDOR_AUT.AsInteger := 1;
  QMSysEmpresasACREEDOR_AUT.AsInteger := 1;
  QMSysEmpresasPMP_CERO.AsInteger := 0;
  MonedaOld := '';
  QMSysEmpresasFECHA_CONTABILIZACION_COMPRAS.AsInteger := 0;
  QMSysEmpresasCierre_contable.AsInteger := 0;
  QMSysEmpresasFECHA_VENTAS.AsInteger := 0;
  QMSysEmpresasLISTAR_PEDIDOS.AsInteger := 0;
  QMSysEmpresasSERIE_AUTOFAC.AsString := REntorno.Serie;
  QMSysEmpresasE_IMAGEN.AsInteger := 0;
  QMSysEmpresasF_IMAGEN.AsInteger := -2;
  QMSysEmpresasCIERRA_DOC_CERO.AsInteger := 0;
  QMSysEmpresasSEPARAR_PEDIDOS_RECEPCION.AsInteger := 0;
  QMSysEmpresasCONTROL_STOCK_NEG.AsInteger := 1;
  QMSysEmpresasCONTROL_ASIENTO_NEG.AsInteger := 0;
  QMSysEmpresasIMPORTE_MAX_PEP.AsFloat := 0;
  QMSysEmpresasRECC.AsInteger := 0;
  QMSysEmpresasINVENTARIO_PERMANENTE.AsInteger := 0;
  QMSysEmpresasGS1_COMPANY_PREFIX.AsString := '';
end;

procedure TDMSysEmpresa.QMSysEmpresasMONEDAChange(Sender: TField);
begin
  with xMoneda do
  begin
     Close;
     Open;
  end;
end;

procedure TDMSysEmpresa.AjustaAuxiliaresDeEmpresa;
begin
  with SPEmpAjusta do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := QMSysEmpresasEMPRESA.AsInteger;
     TFParada.Create(Self).ExecQuery(SPEmpAjusta);
     // ExecQuery;
  end;
  Self.AbreAuxiliares;
end;

procedure TDMSysEmpresa.AbrirEmpresa(Accion: smallint);
begin
  //Accion (1-Abrir, 0-Cerrar)
  with QMSysEmpresas do
  begin
     Edit;
     QMSysEmpresasABIERTA.AsInteger := Accion;
     Post;
     Refresh;
  end;
end;

procedure TDMSysEmpresa.ActivarEjercicio(Accion: smallint);
begin
  with QMGenEjercicios do
  begin
     Edit;
     QMGenEjerciciosACTIVO.AsInteger := Accion;
     Post;
     Refresh;
  end;
end;

procedure TDMSysEmpresa.QMSysEmpresasBeforeDelete(DataSet: TDataSet);
begin
  if (QMSysEmpresasEMPRESA.AsInteger = REntorno.Empresa) then
     raise Exception.Create(_('No se puede borrar la empresa activa'));
end;

procedure TDMSysEmpresa.QMSysEmpresasMODO_IVAChange(Sender: TField);
begin
  with xModosIVA do
  begin
     Close;
     Open;
  end;
end;

procedure TDMSysEmpresa.AltaDeEjercicios;
begin
  with SPActEjercicios do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := QMSysEmpresasEMPRESA.AsInteger;
     TFParada.Create(Self).ExecQuery(SPActEjercicios);
     // ExecQuery;
     ShowMessage(Format(_('Se ha dado de alta el ejercicio : %d'), [FieldByName['EJERCICIO'].AsInteger]));
     FreeHandle;
  end;
  QMGenEjercicios.Close;
  QMGenEjercicios.Open;
end;

procedure TDMSysEmpresa.ActivarEmpresa;
begin
  with SPActEmpresa do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := QMSysEmpresasEMPRESA.AsInteger;
     TFParada.Create(Self).ExecQuery(SPActEmpresa);
     // ExecQuery;
     FreeHandle;
  end;
end;

procedure TDMSysEmpresa.QMSysEmpresasBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_GEN(QMSysEmpresas, 'CONTA_EMPRESAS', 'EMPRESA');
  RegistroModificado := QMSysEmpresas.Modified;

  if RegistroModificado then
  begin
     if (MonedaOld <> '') and (MonedaOld <> QMSysEmpresasMONEDA.AsString) then
     begin
        if not (ConfirmaMensaje(_('El cambio de Moneda de la empresa es peligroso y afecta ' + #13#10 +
           'a todas las tarifas y precios de los artículos ...'))) then
           DataSet.Cancel;

        ChgMoneda := True;
     end;
  end;
end;

procedure TDMSysEmpresa.AbreAuxiliares;
begin
  DMMain.FiltraTabla(QMGenEjercicios, '10000', True);
end;

procedure TDMSysEmpresa.QMSysEmpresasAfterOpen(DataSet: TDataSet);
begin
  xTerceros.Open;
  xMoneda.Open;
  xModosIVA.Open;
  xSeries.Open;
  xTipoGiro.Open;
  xConfigEmail.Open;
end;

procedure TDMSysEmpresa.QMSysEmpresasBeforeClose(DataSet: TDataSet);
begin
  xTerceros.Close;
  xMoneda.Close;
  xModosIVA.Close;
  xSeries.Close;
  xTipoGiro.Close;
  xConfigEmail.Close;
end;

procedure TDMSysEmpresa.LimpiaEmpTodo;
begin
  with SPLimEmp do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := QMSysEmpresasEMPRESA.AsInteger;
     Params.ByName['MODO'].AsInteger := 1;
     TFParada.Create(Self).ExecQuery(SPLimEmp);
     // ExecQuery;
     FreeHandle;
  end;
  QMSysEmpresas.Close;
  QMSysEmpresas.Open;
end;

procedure TDMSysEmpresa.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMSysEmpresas, '00000');
end;

procedure TDMSysEmpresa.QMSysEmpresasAfterPost(DataSet: TDataSet);
begin
  // ¿Es la empresa abierta la modificada? Entonces se reinicia la aplicación...
  if (QMSysEmpresasEMPRESA.AsInteger = REntorno.Empresa) and RegistroModificado then
  begin
     REntorno.Tercero := QMSysEmpresasTERCERO.AsInteger;
     REntorno.NombreEmpresa := QMSysEmpresasTITULO.AsString;
     REntorno.TipoRazon := xTerceros.FieldByName('TIPO_RAZON').AsString;
     REntorno.ImagenEmpresa := QMSysEmpresasE_IMAGEN.AsInteger;
     REntorno.ImagenFondo := QMSysEmpresasF_IMAGEN.AsInteger;
     REntorno.NombreEmpCom := xTerceros.FieldByName('NOMBRE_COMERCIAL').AsString;
     REntorno.CifEmpresa := xTerceros.FieldByName('NIF').AsString;
     REntorno.Tel1Empresa := xTerceros.FieldByName('TELEFONO01').AsString;
     REntorno.Tel2Empresa := xTerceros.FieldByName('TELEFONO02').AsString;
     REntorno.FaxEmpresa := xTerceros.FieldByName('TELEFAX').AsString;
     REntorno.EmailEmpresa := xTerceros.FieldByName('EMAIL').AsString;
     REntorno.WebEmpresa := xTerceros.FieldByName('WEB').AsString;
     REntorno.Cliente_aut := (QMSysEmpresasCLIENTE_AUT.AsInteger = 1);
     REntorno.Proveedor_aut := (QMSysEmpresasPROVEEDOR_AUT.AsInteger = 1);
     REntorno.Acreedor_aut := (QMSysEmpresasACREEDOR_AUT.AsInteger = 1);
     REntorno.ListaPedCompra := QMSysEmpresasLISTAR_PEDIDOS.AsInteger;

     with SPJustificaDomicilio do
     begin
        Close;
        Params.ByName['TERCERO'].AsInteger := QMSysEmpresasTERCERO.AsInteger;
        ExecQuery;
        REntorno.DirEmpresa := FieldByName['DIRECCION'].AsString;
        REntorno.PobEmpresa := FieldByName['CODPOB'].AsString;
        REntorno.ProvEmpresa := FieldByName['PROVINCIA'].AsString;
        REntorno.ColoniaEmpresa := FieldByName['COLONIA'].AsString;
        REntorno.Riesgo := 0;
        FreeHandle;
     end;

     FMain.ImagenFondo;
  end;

  if ChgMoneda then
  begin
     ChgMoneda := False;
     with SPChangeMoneda do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := QMSysEmpresasEMPRESA.AsInteger;
        Params.ByName['ORIGEN'].AsString := MonedaOld;
        Params.ByName['DESTINO'].AsString := QMSysEmpresasMONEDA.AsString;
        Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        TFParada.Create(Self).ExecQuery(SPChangeMoneda);
        // ExecQuery;
        FreeHandle;
        if QMSysEmpresasEMPRESA.AsInteger = REntorno.Empresa then
        begin
           REntorno.MonedaEmpresa := QMSysEmpresasMONEDA.AsString;
           DMMain.AjustaMascaraMoneda;
        end;
     end;
  end;
end;

procedure TDMSysEmpresa.PosicionaEmpresa;
var
  busqueda, clave : integer;
begin
  // Nos posicionamos en la empresa
  with QMSysEmpresas do
  begin
     Close;
     Open;
     clave := REntorno.Empresa;
     busqueda := QMSysEmpresasEMPRESA.AsInteger;
     while ((busqueda <> clave) and (not EOF)) do
     begin
        Next;
        busqueda := QMSysEmpresasEMPRESA.AsInteger;
     end;
  end;
end;

procedure TDMSysEmpresa.QMSysEmpresasBeforeEdit(DataSet: TDataSet);
begin
  MonedaOld := QMSysEmpresasMONEDA.AsString;
end;

procedure TDMSysEmpresa.QMSysEmpresasSERIE_AUTOFACChange(Sender: TField);
begin
  with xSeries do
  begin
     Close;
     Open;
  end;
end;

procedure TDMSysEmpresa.QMSysEmpresasAfterScroll(DataSet: TDataSet);
begin
  QMSysEmpresasIMPORTE_MAX_PEP.DisplayFormat := DMMain.MascaraMoneda(QMSysEmpresasMONEDA.AsString, 1); {dji lrk kri}
end;

procedure TDMSysEmpresa.xTipoGiroNewRecord(DataSet: TDataSet);
begin
  xTipoGiroEMPRESA.AsInteger := QMSysEmpresasEMPRESA.AsInteger;
end;

procedure TDMSysEmpresa.xTipoGiroAfterPost(DataSet: TDataSet);
begin
  Refrescar(xTipoGiro, 'CODIGO_GIRO', xTipoGiroCODIGO_GIRO.AsInteger);
end;

procedure TDMSysEmpresa.xTipoGiroAfterDelete(DataSet: TDataSet);
begin
  Refrescar(xTipoGiro, 'CODIGO_GIRO', 0);
end;

end.
