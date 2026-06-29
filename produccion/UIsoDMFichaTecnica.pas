unit UIsoDMFichaTecnica;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet, FR_DSet,
  FR_DBSet, FR_Class, Fr_HYReport, FIBQuery, HYFIBQuery, FIBDataSetRO;

type
  TIsoDMFichaTecnica = class(TDataModule)
     QMFichaC: TFIBTableSet;
     DSQMFichaC: TDataSource;
     TLocal: THYTransaction;
     QMFichaD: TFIBTableSet;
     DSQMFichaD: TDataSource;
     frIsoFichaTecnica: TfrHYReport;
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
     QMFichaCTIPO: TFIBStringField;
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
     QGen: THYFIBQuery;
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
     xLstCabeceraID_ENSAYO: TIntegerField;
     xLstCabeceraARTICULO: TFIBStringField;
     xLstCabeceraFECHA_ENSAYO: TDateTimeField;
     xLstCabeceraREVISION: TIntegerField;
     xLstCabeceraRESPONSABLE: TIntegerField;
     xLstCabeceraACTIVO: TIntegerField;
     xLstCabeceraNOTAS: TBlobField;
     xLstCabeceraUNIDAD_ENVASE: TFIBStringField;
     xLstCabeceraUNIDAD_TRANSPORTE: TFIBStringField;
     xLstCabeceraLOTE_HOMOGENEO: TFIBStringField;
     xLstCabeceraEMPRESA: TIntegerField;
     xLstCabeceraTIPO: TFIBStringField;
     xLstCabeceraID_LOTE: TIntegerField;
     xLstCabeceraID_ORDEN: TIntegerField;
     xLstCabeceraCLIENTE: TIntegerField;
     xLstDetalleID_ENSAYO: TIntegerField;
     xLstDetalleISO_ENSAYO: TFIBStringField;
     xLstDetalleDESCRIPCION: TBlobField;
     xLstDetalleVALOR_1: TFIBStringField;
     xLstDetalleVALOR_2: TFIBStringField;
     xLstDetalleLINEA: TIntegerField;
     xLstDetalleEMPRESA: TIntegerField;
     xLstDetalleME_METODO_ENSAYO: TFIBStringField;
     xLstDetalleME_UNIDADES_MINIMO: TFloatField;
     xLstDetalleME_UNIDADES_MEDIO: TFloatField;
     xLstDetalleME_UNIDADES_MAXIMO: TFloatField;
     xLstDetalleME_UNIDADES_RESULTADO: TFloatField;
     xLstDetalleME_IMPRIMIR: TIntegerField;
     DSxDescEnsayo: TDataSource;
     xDescEnsayo: TFIBTableSet;
     QMFichaDDescNormativa: TStringField;
     DSxDescNormativa: TDataSource;
     xDescNormativa: TFIBTableSet;
     xDescNormativaLEY: TFIBStringField;
     DSxCliente: TDataSource;
     frDBQMArt: TfrDBDataSet;
     xLstArticulos: TFIBDataSetRO;
     DSxLstArticulos: TDataSource;
     xLstArticulosEMPRESA: TIntegerField;
     xLstArticulosID_ENSAYO: TIntegerField;
     xLstArticulosLINEA: TIntegerField;
     xLstArticulosARTICULO: TFIBStringField;
     xLstEnsayo: TFIBTableSet;
     DSxLstEnsayo: TDataSource;
     xLote: TFIBDataSetRO;
     DSxLote: TDataSource;
     xLoteLOTE: TFIBStringField;
     xDescArt: TFIBDataSetRO;
     DSxDescArt: TDataSource;
     xDescArtTITULO: TFIBStringField;
     xLstEnsayoCODIGO: TFIBStringField;
     xLstEnsayoISO_TIPO_ENSAYO: TFIBStringField;
     xLstEnsayoISO_NORMATIVAS: TFIBStringField;
     xLstEnsayoDESCRIPCION: TFIBStringField;
     xDescEnsayoDESCRIPCION: TFIBStringField;
     xLstCabeceraFICHA: TFIBStringField;
     xLstCabeceraREFERENCIA: TFIBStringField;
     xLstCabeceraDESCRIPCION: TFIBStringField;
     xLstCabeceraCOLORES: TFIBStringField;
     xLstCabeceraNOMBRE_PRODUCTO: TFIBStringField;
     xLstCabeceraAPLICACION_PREFERENTE: TFIBStringField;
     xLstDetalleCODIGO: TFIBStringField;
     xLstDetalleDESCRIPCION1: TFIBStringField;
     xLstCabeceraFICHA_ORIGEN: TIntegerField;
     QMFichaCFICHA: TFIBStringField;
     QMFichaCREFERENCIA: TFIBStringField;
     QMFichaCDESCRIPCION: TFIBStringField;
     QMFichaCCOLORES: TFIBStringField;
     QMFichaCNOMBRE_PRODUCTO: TFIBStringField;
     QMFichaCAPLICACION_PREFERENTE: TFIBStringField;
     QMFichaCFICHA_ORIGEN: TIntegerField;
     QMFichaCCAR_NORMAS_UNE: TFIBStringField;
     procedure QMFichaCAfterOpen(DataSet: TDataSet);
     procedure QMFichaCNewRecord(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
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
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
     procedure MarcarTodo;
     procedure DesMarcarTodo;
     procedure MostrarListado(listado, modo, cliente: integer);
     function ExisteFicha(id_orden: integer): integer;
     procedure Filtra(Filtro: string);
  end;

var
  IsoDMFichaTecnica : TIsoDMFichaTecnica;

implementation

{$R *.DFM}

uses UDMMain, UFBusca, UEntorno, URecursos, UDMListados, UFormGest, UUtiles, UDameDato;

procedure TIsoDMFichaTecnica.IsoDMFichaCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMFichaC, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMFichaD, MascaraN, MascaraI, ShortDateFormat);
  AsignaDisplayFormat(QMFichaArt, MascaraN, MascaraI, ShortDateFormat);

  DMMain.FiltraTabla(QMFichaC, '10000', True);
  AbreData(TDMListados, DMListados);
end;

procedure TIsoDMFichaTecnica.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TIsoDMFichaTecnica.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMFichaC, '10000');
end;

procedure TIsoDMFichaTecnica.QMFichaCAfterOpen(DataSet: TDataSet);
begin
  QMFichaD.Open;
  QMFichaArt.Open;
end;

procedure TIsoDMFichaTecnica.QMFichaCNewRecord(DataSet: TDataSet);
begin
  QMFichaCEMPRESA.AsInteger := REntorno.Empresa;
  QMFichaCFECHA_ENSAYO.AsDateTime := REntorno.FechaTrab;
  QMFichaCACTIVO.AsInteger := 0;
  QMFichaCREVISION.AsInteger := 0;
  QMFichaCTIPO.AsInteger := 0;
end;

procedure TIsoDMFichaTecnica.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  //QMFichaC.Refresh;
end;

procedure TIsoDMFichaTecnica.QMFichaDNewRecord(DataSet: TDataSet);
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
     Params.ByName['empresa'].AsInteger := QMFichaCEMPRESA.AsInteger;
     Params.ByName['id_ensayo'].AsInteger := QMFichaCID_ENSAYO.AsInteger;
     ExecQuery;
     QMFichaDLINEA.AsInteger := SPLineaSegDet.FieldByName['LINEA'].AsInteger + 1;
     FreeHandle;
  end;
end;

procedure TIsoDMFichaTecnica.QMFichaCDescArtGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloArticulo(QMFichaCARTICULO.AsString);
end;

procedure TIsoDMFichaTecnica.QMFichaCDescRespGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloEmpleado(QMFichaCRESPONSABLE.AsInteger);
end;

procedure TIsoDMFichaTecnica.QMFichaCBeforePost(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) then
     QMFichaCID_ENSAYO.AsInteger := DMMain.Contador_E('IFT');
end;

procedure TIsoDMFichaTecnica.QMFichaDIsoTipoEnsayoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := xIsoEnsayoISO_TIPO_ENSAYO.AsString;
end;

procedure TIsoDMFichaTecnica.QMFichaDIsoNormativaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := xIsoEnsayoISO_NORMATIVAS.AsString;
end;

procedure TIsoDMFichaTecnica.QMFichaDDescEnsayoGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  with xIsoEnsayo do
  begin
     Close;
     Open;
  end;
  Text := xIsoEnsayoDESCRIPCION.AsString;
end;

procedure TIsoDMFichaTecnica.QMFichaCDescCliGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloCliente(QMFichaCCLIENTE.AsInteger);
end;

procedure TIsoDMFichaTecnica.QMFichaArtNewRecord(DataSet: TDataSet);
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

procedure TIsoDMFichaTecnica.QMFichaArtDescArticuloGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloArticulo(QMFichaArtARTICULO.AsString);
end;

procedure TIsoDMFichaTecnica.MarcarTodo;
begin
  with QGen do
  begin
     Close;
     SQL.Clear;
     SQL.Text := 'UPDATE ISO_ENSAYO_DET SET ME_IMPRIMIR = 1 WHERE EMPRESA = ?EMPRESA ' +
        'AND ID_ENSAYO = ?ID_ENSAYO';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ID_ENSAYO'].AsInteger := QMFichaDID_ENSAYO.AsInteger;
     ExecQuery;
     FreeHandle;
  end;
  with QMFichaD do
  begin
     DisableControls;
     Close;
     Open;
     EnableControls;
  end;
end;

procedure TIsoDMFichaTecnica.DesMarcarTodo;
begin
  with QGen do
  begin
     Close;
     SQL.Clear;
     SQL.Text := 'UPDATE ISO_ENSAYO_DET SET ME_IMPRIMIR = 0 WHERE EMPRESA = ?EMPRESA ' +
        'AND ID_ENSAYO = ?ID_ENSAYO';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ID_ENSAYO'].AsInteger := QMFichaDID_ENSAYO.AsInteger;
     ExecQuery;
     FreeHandle;
  end;
  with QMFichaD do
  begin
     DisableControls;
     Close;
     Open;
     EnableControls;
  end;
end;

procedure TIsoDMFichaTecnica.QMFichaCDescLoteGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameLote(QMFichaCID_LOTE.AsInteger);
end;

procedure TIsoDMFichaTecnica.MostrarListado(listado, modo, cliente: integer);
var
  str : string;
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
     Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['ejercicio'].AsInteger := REntorno.Ejercicio;
     Params.ByName['canal'].AsInteger := REntorno.Canal;
     Params.ByName['cliente'].AsInteger := cliente;
     Open;
  end;

  with xLote do
  begin
     Close;
     Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['id_lote'].AsInteger := QMFichaCID_LOTE.AsInteger;
     Open;
  end;
  with xDescArt do
  begin
     Close;
     Params.ByName['empresa'].AsInteger := REntorno.Empresa;
     Params.ByName['articulo'].AsString := QMFichaCARTICULO.AsString;
     Open;
  end;

  DMListados.Cargar(listado, '');

  if (REntorno.TipoListado = 'FRF') then
  begin
     frIsoFichaTecnica.LoadFromFIB(REntorno.Formato, str);
     frIsoFichaTecnica.PrepareReport;
     case Modo of
        0: frIsoFichaTecnica.ShowPreparedReport;
        1: frIsoFichaTecnica.PrintPreparedReport('', REntorno.Copias);
     end;
  end;

  DMListados.LimpiaEntorno;
end;

procedure TIsoDMFichaTecnica.QMFichaDDescNormativaGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameTituloNormativa(xIsoEnsayoISO_NORMATIVAS.AsString);
end;

function TIsoDMFichaTecnica.ExisteFicha(id_orden: integer): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'Select ID_ENSAYO From ISO_ENSAYO_CAB Where Empresa=?Empresa' +
           ' and id_orden=?id_orden';
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

procedure TIsoDMFichaTecnica.QMFichaDAfterOpen(DataSet: TDataSet);
begin
  xIsoEnsayo.Open;
end;

procedure TIsoDMFichaTecnica.QMFichaDBeforeClose(DataSet: TDataSet);
begin
  xIsoEnsayo.Close;
end;

procedure TIsoDMFichaTecnica.QMFichaArtBeforePost(DataSet: TDataSet);
var
  ID : integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'select art.id_ensayo from iso_ensayo_art art ' +
           ' join iso_ensayo_cab cab on (art.empresa=cab.empresa and art.id_ensayo=cab.id_ensayo)' +
           ' where art.empresa=?empresa and art.articulo=?articulo and cab.activo=1;';
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

procedure TIsoDMFichaTecnica.Filtra(Filtro: string);
begin
  if (filtro <> '') then
  begin
     QMFichaC.Close;
     QMFichaC.SelectSQL.Text := 'select * from iso_ensayo_cab WHERE ' + Filtro;
     QMFichaC.Open;
  end;
end;

end.
