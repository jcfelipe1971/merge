unit UIsoDMCertificadoAnalisis;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet, FR_DSet,
  FR_DBSet, FR_Class, Fr_HYReport, FIBQuery, HYFIBQuery, FIBDataSetRO;

type
  TIsoDMCertificadoAnalisis = class(TDataModule)
     QMFichaC: TFIBTableSet;
     DSQMFichaC: TDataSource;
     TLocal: THYTransaction;
     QMFichaD: TFIBTableSet;
     DSQMFichaD: TDataSource;
     frIsoCertificadoAnalisis: TfrHYReport;
     frDBQMDet: TfrDBDataSet;
     SPLineaSegDet: THYFIBQuery;
     QMFichaCDescArt: TStringField;
     QMFichaCDescResp: TStringField;
     frDBQMCab: TfrDBDataSet;
     TUpdate: THYTransaction;
     QMFichaCID_ENSAYO: TIntegerField;
     QMFichaCARTICULO: TFIBStringField;
     QMFichaCFECHA_ENSAYO: TDateTimeField;
     QMFichaCREVISION: TIntegerField;
     QMFichaCRESPONSABLE: TIntegerField;
     QMFichaCACTIVO: TIntegerField;
     QMFichaCNOTAS: TBlobField;
     QMFichaCUNIDAD_ENVASE: TFIBStringField;
     QMFichaCUNIDAD_TRANSPORTE: TFIBStringField;
     QMFichaCLOTE_HOMOGENEO: TFIBStringField;
     QMFichaCEMPRESA: TIntegerField;
     QMFichaDID_ENSAYO: TIntegerField;
     QMFichaDISO_ENSAYO: TFIBStringField;
     QMFichaDDESCRIPCION: TBlobField;
     QMFichaDVALOR_1: TFIBStringField;
     QMFichaDVALOR_2: TFIBStringField;
     QMFichaDLINEA: TIntegerField;
     QMFichaDEMPRESA: TIntegerField;
     QMFichaDIsoNormativa: TStringField;
     QMFichaDDescEnsayo: TStringField;
     xIsoEnsayo: TFIBTableSet;
     DSxIsoEnsayo: TDataSource;
     xIsoEnsayoCODIGO: TFIBStringField;
     xIsoEnsayoISO_TIPO_ENSAYO: TFIBStringField;
     xIsoEnsayoISO_NORMATIVAS: TFIBStringField;
     xIsoEnsayoDESCRIPCION: TFIBStringField;
     QMFichaDIsoTipoEnsayo: TStringField;
     QMFichaCID_ORDEN: TIntegerField;
     QMFichaCCLIENTE: TIntegerField;
     QMFichaDME_METODO_ENSAYO: TFIBStringField;
     QMFichaDME_UNIDADES_MINIMO: TFloatField;
     QMFichaDME_UNIDADES_MEDIO: TFloatField;
     QMFichaDME_UNIDADES_MAXIMO: TFloatField;
     QMFichaDME_UNIDADES_RESULTADO: TFloatField;
     QMFichaCDescCli: TStringField;
     QMFichaArt: TFIBTableSet;
     DSQMFichaArt: TDataSource;
     SPLineaSegArt: THYFIBQuery;
     QMFichaArtEMPRESA: TIntegerField;
     QMFichaArtID_ENSAYO: TIntegerField;
     QMFichaArtLINEA: TIntegerField;
     QMFichaArtARTICULO: TFIBStringField;
     QMFichaArtDescArticulo: TStringField;
     QMFichaDME_IMPRIMIR: TIntegerField;
     QMFichaCDescLote: TStringField;
     xCliente: TFIBDataSetRO;
     xClienteEMPRESA: TIntegerField;
     xClienteEJERCICIO: TIntegerField;
     xClienteCANAL: TIntegerField;
     xClienteNUM_CLIENTE: TIntegerField;
     xClienteNUM_TERCERO: TIntegerField;
     xClienteCUENTA_CONTABLE: TFIBStringField;
     xClienteNOMBRE_SOCIAL: TFIBStringField;
     xClienteNOMBRE_COMERCIAL: TFIBStringField;
     xClienteNIF: TFIBStringField;
     xClienteTELEFONO01: TFIBStringField;
     xClienteTELEFONO02: TFIBStringField;
     xClienteFAX: TFIBStringField;
     xClienteE_MAIL: TFIBStringField;
     xClienteWEB: TFIBStringField;
     xClienteBANCO: TFIBStringField;
     xClienteENTIDAD: TFIBStringField;
     xClienteSUCURSAL: TFIBStringField;
     xClienteDC: TFIBStringField;
     xClienteCC: TFIBStringField;
     xClienteTIPO_DIRECCION: TFIBStringField;
     xClienteDIRECCION: TFIBStringField;
     xClienteDIRECCION2: TFIBStringField;
     xClienteDIR_NUMERO: TFIBStringField;
     xClienteDIR_ESCALERA: TFIBStringField;
     xClienteDIR_PISO: TFIBStringField;
     xClienteDIR_PUERTA: TFIBStringField;
     xClienteDIR_COMPLETA: TFIBStringField;
     xClienteDIR_COMPLETA2: TFIBStringField;
     xClienteCODIGO_POSTAL: TFIBStringField;
     xClientePOBLACION: TFIBStringField;
     xClientePROVINCIA: TFIBStringField;
     xClientePAIS: TFIBStringField;
     QMFichaCID_LOTE: TIntegerField;
     xLstCabecera: TFIBDataSetRO;
     DSxLstCabecera: TDataSource;
     xLstDetalle: TFIBDataSetRO;
     DSxLstDetalle: TDataSource;
     DSxDescEnsayo: TDataSource;
     xDescEnsayo: TFIBTableSet;
     QMFichaDDescNormativa: TStringField;
     SPDuplicaFicha: THYFIBQuery;
     DSxDescNormativa: TDataSource;
     xDescNormativa: TFIBTableSet;
     xDescNormativaLEY: TFIBStringField;
     DSxCliente: TDataSource;
     frDBQMArt: TfrDBDataSet;
     xLstArticulos: TFIBDataSetRO;
     DSxLstArticulos: TDataSource;
     xLstEnsayo: TFIBTableSet;
     DSxLstEnsayo: TDataSource;
     xLote: TFIBDataSetRO;
     DSxLote: TDataSource;
     xDescArt: TFIBDataSetRO;
     DSxDescArt: TDataSource;
     xDescEnsayoDESCRIPCION: TFIBStringField;
     QMFichaCFICHA: TFIBStringField;
     QMFichaCREFERENCIA: TFIBStringField;
     QMFichaCDESCRIPCION: TFIBStringField;
     QMFichaCCOLORES: TFIBStringField;
     QMFichaCNOMBRE_PRODUCTO: TFIBStringField;
     QMFichaCAPLICACION_PREFERENTE: TFIBStringField;
     QMFichaCFICHA_ORIGEN: TIntegerField;
     QMFichaCCAR_NORMAS_UNE: TFIBStringField;
     QMFichaCIMPRIME_VALOR_2: TIntegerField;
     procedure QMFichaCAfterOpen(DataSet: TDataSet);
     procedure QMFichaCNewRecord(DataSet: TDataSet);
     procedure QMFichaDNewRecord(DataSet: TDataSet);
     procedure IsoDMFichaCreate(Sender: TObject);
     procedure QMFichaCDescArtGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMFichaCDescRespGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMFichaCBeforePost(DataSet: TDataSet);
     procedure QMFichaDIsoTipoEnsayoGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMFichaDIsoNormativaGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMFichaDDescEnsayoGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMFichaCDescCliGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMFichaArtNewRecord(DataSet: TDataSet);
     procedure QMFichaArtDescArticuloGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMFichaCDescLoteGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMFichaDDescNormativaGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMFichaDAfterOpen(DataSet: TDataSet);
     procedure QMFichaDBeforeClose(DataSet: TDataSet);
     procedure QMFichaArtBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
     function ExisteFicha(id_orden: integer): integer;
  public
     { Public declarations }
     procedure BusquedaCompleja;
     procedure MarcarTodo;
     procedure DesMarcarTodo;
     procedure CrearFicha(id_orden, cliente, id_lote: integer; compuesto: string);
     procedure MostrarListado(Grupo, Modo, Cliente: integer);
     procedure Filtra(Filtro: string);
  end;

var
  IsoDMCertificadoAnalisis : TIsoDMCertificadoAnalisis;

implementation

{$R *.DFM}

uses UDMMain, UFBusca, UEntorno, URecursos, UDMListados, UFormGest, UUtiles, UDameDato;

procedure TIsoDMCertificadoAnalisis.IsoDMFichaCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMFichaC, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMFichaD, MascaraN, MascaraI, ShortDateFormat);

  DMMain.FiltraTabla(QMFichaC, '10000', True);
end;

procedure TIsoDMCertificadoAnalisis.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMFichaC, '10000');
end;

procedure TIsoDMCertificadoAnalisis.QMFichaCAfterOpen(DataSet: TDataSet);
begin
  QMFichaD.Open;
  QMFichaArt.Open;
end;

procedure TIsoDMCertificadoAnalisis.QMFichaCNewRecord(DataSet: TDataSet);
begin
  QMFichaCEMPRESA.AsInteger := REntorno.Empresa;
  QMFichaCFECHA_ENSAYO.AsDateTime := REntorno.FechaTrab;
  QMFichaCACTIVO.AsInteger := 0;
  QMFichaCREVISION.AsInteger := 0;
end;

procedure TIsoDMCertificadoAnalisis.QMFichaDNewRecord(DataSet: TDataSet);
begin
  if ((QMFichaC.State = dsInsert) or (QMFichaC.State = dsEdit)) then
  begin
     QMFichaC.Post;
     QMFichaD.Edit;
  end;
  QMFichaDEMPRESA.AsInteger := QMFichaCEMPRESA.AsInteger;
  QMFichaDID_ENSAYO.AsInteger := QMFichaCID_ENSAYO.AsInteger;

  with SPLineaSegDet do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := QMFichaCEMPRESA.AsInteger;
     Params.ByName['ID_ENSAYO'].AsInteger := QMFichaCID_ENSAYO.AsInteger;
     ExecQuery;
     QMFichaDLINEA.AsInteger := SPLineaSegDet.FieldByName['LINEA'].AsInteger + 1;
     FreeHandle;
  end;
end;

procedure TIsoDMCertificadoAnalisis.QMFichaCDescArtGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloArticulo(QMFichaCARTICULO.AsString);
end;

procedure TIsoDMCertificadoAnalisis.QMFichaCDescRespGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloEmpleado(QMFichaCRESPONSABLE.AsInteger);
end;

procedure TIsoDMCertificadoAnalisis.QMFichaCBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
     QMFichaCID_ENSAYO.AsInteger := DMMain.Contador_E('IFT');
end;

procedure TIsoDMCertificadoAnalisis.QMFichaDIsoTipoEnsayoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := xIsoEnsayoISO_TIPO_ENSAYO.AsString;
end;

procedure TIsoDMCertificadoAnalisis.QMFichaDIsoNormativaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := xIsoEnsayoISO_NORMATIVAS.AsString;
end;

procedure TIsoDMCertificadoAnalisis.QMFichaDDescEnsayoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  with xIsoEnsayo do
  begin
     Close;
     Open;
  end;
  Text := xIsoEnsayoDESCRIPCION.AsString;
end;

procedure TIsoDMCertificadoAnalisis.QMFichaCDescCliGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloCliente(QMFichaCCLIENTE.AsInteger);
end;

procedure TIsoDMCertificadoAnalisis.QMFichaArtNewRecord(DataSet: TDataSet);
begin
  if ((QMFichaC.State = dsInsert) or (QMFichaC.State = dsEdit)) then
  begin
     QMFichaC.Post;
     QMFichaArt.Edit;
  end;
  QMFichaArtEMPRESA.AsInteger := QMFichaCEMPRESA.AsInteger;
  QMFichaArtID_ENSAYO.AsInteger := QMFichaCID_ENSAYO.AsInteger;

  with SPLineaSegArt do
  begin
     Close;
     Params.ByName['empresa'].AsInteger := QMFichaCEMPRESA.AsInteger;
     Params.ByName['id_ensayo'].AsInteger := QMFichaCID_ENSAYO.AsInteger;
     ExecQuery;
     QMFichaArtLINEA.AsInteger := SPLineaSegArt.FieldByName['LINEA'].AsInteger + 1;
     FreeHandle;
  end;
end;

procedure TIsoDMCertificadoAnalisis.QMFichaArtDescArticuloGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloArticulo(QMFichaArtARTICULO.AsString);
end;

procedure TIsoDMCertificadoAnalisis.MarcarTodo;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        SQL.Clear;
        SQL.Text := 'UPDATE ISO_ENSAYO_ORD_DET SET ME_IMPRIMIR = 1 WHERE EMPRESA = ?EMPRESA ' +
           'AND ID_ENSAYO = ?ID_ENSAYO';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ID_ENSAYO'].AsInteger := QMFichaDID_ENSAYO.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with QMFichaD do
  begin
     DisableControls;
     Close;
     Open;
     EnableControls;
  end;
end;

procedure TIsoDMCertificadoAnalisis.DesMarcarTodo;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        SQL.Clear;
        SQL.Text := 'UPDATE ISO_ENSAYO_ORD_DET SET ME_IMPRIMIR = 0 WHERE EMPRESA = ?EMPRESA AND ID_ENSAYO = ?ID_ENSAYO';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ID_ENSAYO'].AsInteger := QMFichaDID_ENSAYO.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with QMFichaD do
  begin
     DisableControls;
     Close;
     Open;
     EnableControls;
  end;
end;

procedure TIsoDMCertificadoAnalisis.QMFichaCDescLoteGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameLote(QMFichaCID_LOTE.AsInteger);
end;

procedure TIsoDMCertificadoAnalisis.CrearFicha(id_orden, cliente, id_lote: integer; compuesto: string);
var
  id_ensayod : integer;
begin
  if (ExisteFicha(id_orden) = 0) then
  begin
     with SPDuplicaFicha do
     begin
        Close;
        Params.ByName['id_orden'].AsInteger := id_orden;
        Params.ByName['cliente'].AsInteger := cliente;
        Params.ByName['id_lote'].AsInteger := id_lote;
        Params.ByName['compuesto'].AsString := compuesto;
        Params.ByName['empresa'].AsInteger := REntorno.Empresa;
        ExecQuery;
        id_ensayod := FieldByName['ID_ENSAYOD'].AsInteger;
        FreeHandle;
     end;
     if (id_ensayod = 0) then
     begin
        QMFichaC.Insert;
        QMFichaCID_ORDEN.AsInteger := id_orden;
        QMFichaCCLIENTE.AsInteger := cliente;
        QMFichaCID_LOTE.AsInteger := id_lote;
        QMFichaCARTICULO.AsString := compuesto;
     end
     else
        with QMFichaC do
        begin
           Close;
           Open;
           if not Locate('ID_ENSAYO', ID_ENSAYOD, []) then
              Last;
        end;
  end
  else
     ShowMessage(_('Orden ya traspasada'));
end;

procedure TIsoDMCertificadoAnalisis.MostrarListado(Grupo, Modo, Cliente: integer);
begin
  with xLstCabecera do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ID_ENSAYO'].AsInteger := QMFichaCID_ENSAYO.AsInteger;
     Open;
  end;

  with xLstDetalle do
  begin
     Close;
     Open;
  end;

  with xCliente do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CLIENTE'].AsInteger := Cliente;
     Open;
  end;

  with xLote do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ID_LOTE'].AsInteger := QMFichaCID_LOTE.AsInteger;
     Open;
  end;

  with xDescArt do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ARTICULO'].AsString := QMFichaCARTICULO.AsString;
     Open;
  end;

  AbreData(TDMListados, DMListados);
  DMListados.Imprimir(Grupo, Modo, '', _('Certificado de Analisis'), frIsoCertificadoAnalisis, nil);
  CierraData(DMListados);
end;

procedure TIsoDMCertificadoAnalisis.QMFichaDDescNormativaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloNormativa(xIsoEnsayoISO_NORMATIVAS.AsString);
end;

function TIsoDMCertificadoAnalisis.ExisteFicha(id_orden: integer): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ID_ENSAYO FROM ISO_ENSAYO_ORD_CAB WHERE EMPRESA = ?EMPRESA AND ID_ORDEN = ?ID_ORDEN';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['ID_ORDEN'].AsInteger := id_orden;
        ExecQuery;
        Result := FieldByName['ID_ENSAYO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TIsoDMCertificadoAnalisis.QMFichaDAfterOpen(DataSet: TDataSet);
begin
  xIsoEnsayo.Open;
end;

procedure TIsoDMCertificadoAnalisis.QMFichaDBeforeClose(DataSet: TDataSet);
begin
  xIsoEnsayo.Close;
end;

procedure TIsoDMCertificadoAnalisis.QMFichaArtBeforePost(DataSet: TDataSet);
var
  ID : integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ID_ENSAYO FROM ISO_ENSAYO_ART WHERE EMPRESA = ?EMPRESA AND ARTICULO = ?ARTICULO';
        Params.ByName['EMPRESA'].AsInteger := QMFichaArtEMPRESA.AsInteger;
        Params.ByName['ARTICULO'].AsString := QMFichaArtARTICULO.AsString;
        ExecQuery;
        ID := FieldByName['ID_ENSAYO'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  if (ID <> 0) then
  begin
     ShowMessage(_('Ya existe una Ficha con este artículo'));
     Abort;
  end;
end;

procedure TIsoDMCertificadoAnalisis.Filtra(Filtro: string);
begin
  if (Filtro <> '') then
  begin
     QMFichaC.Close;
     QMFichaC.SelectSQL.Text := 'SELECT * FROM ISO_ENSAYO_ORD_CAB WHERE ' + Filtro;
     QMFichaC.Open;
  end;
end;

end.
