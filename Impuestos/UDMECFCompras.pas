unit UDMECFCompras;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDatabase, UFIBModificados, FIBDataSet,
  FIBTableDataSet;

type
  TDMECFCompras = class(TDataModule)
     QMDocumentos: TFIBTableSet;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     DSQMDocumentos: TDataSource;
     QMDocumentosID_E: TIntegerField;
     QMDocumentosID_ENVIO: TFIBStringField;
     QMDocumentosSTAMP_DATE: TFIBStringField;
     QMDocumentosSTATUS: TFIBStringField;
     QMDocumentosSECURITY_CODE: TFIBStringField;
     QMDocumentosSEQUENCE_CONSUMED: TIntegerField;
     QMDocumentosENCF: TFIBStringField;
     QMDocumentosURL_XML: TFIBStringField;
     QMDocumentosURL_PDF: TFIBStringField;
     QMDocumentosXML: TMemoField;
     QMDocumentosPDF: TBlobField;
     QMDocumentosDOCUMENT_STAMP_URL: TFIBStringField;
     QMDocumentosTRACK_ID: TFIBStringField;
     QMDocumentosENVIO_RESPUESTA_JSON: TMemoField;
     QMDocumentosCONSULTA_RESPUESTA_JSON: TMemoField;
     QMDocumentosGOVERMENT_RESPONSE: TFIBStringField;
     QMDocumentosMENSAJE_ERROR_ENVIO_ECF: TFIBStringField;
     QMDocumentosSTATUS_CONSULTA: TFIBStringField;
     QMDocumentosLEGAL_STATUS_CONSULTA: TFIBStringField;
     QMDocumentosMENSAJE_ERROR_CONSULTA_ECF: TFIBStringField;
     QMDocumentosEMPRESA: TIntegerField;
     QMDocumentosEJERCICIO: TIntegerField;
     QMDocumentosCANAL: TIntegerField;
     QMDocumentosSERIE: TFIBStringField;
     QMDocumentosTIPO: TFIBStringField;
     QMDocumentosRIG: TIntegerField;
     QMDocumentosFECHA: TDateTimeField;
     QMDocumentosTOTAL_FACTURA: TFloatField;
     QMDocumentosMODO_IVA: TIntegerField;
     QMDocumentosPROVEEDOR: TIntegerField;
     QMDocumentosZ_PREFIJO_NCF: TFIBStringField;
     QMDocumentosZ_CONTADOR_NCF: TFIBStringField;
     QMDocumentosZ_TIPO_NCF: TIntegerField;
     QMDocumentosCODIGO_ERROR_ENVIO: TFIBStringField;
     QMDocumentosRESPUESTA_ENVIO: TIntegerField;
     QMDocumentosRESPUESTA_CONSULTA: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMDocumentosCalcFields(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure CambiarSeleccion(DesdeRig, HastaRig, Proveedor, TipoCF: integer; Serie: string);
     procedure AbreJsonRespuesta(Consulta: boolean);
  end;

var
  DMECFCompras : TDMECFCompras;

implementation

uses
  UDMMain, UEntorno, UUtiles;

{$R *.dfm}

procedure TDMECFCompras.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMDocumentos, MascaraN, MascaraI, ShortDateFormat);
end;

procedure TDMECFCompras.CambiarSeleccion(DesdeRig, HastaRig, Proveedor, TipoCF: integer; Serie: string);
var
  Tipo : string;
begin
  Tipo := 'FAP';

  with QMDocumentos do
  begin
     Close;
     with SelectSQL do
     begin
        Clear;
        Add(' SELECT D.*, S.EMPRESA, S.EJERCICIO, S.CANAL, S.SERIE, S.TIPO, S.RIG, S.FECHA, ');
        Add(' F.TOTAL_FACTURA, F.MODO_IVA, F.PROVEEDOR, F.Z_PREFIJO_NCF, F.Z_CONTADOR_NCF, F.Z_TIPO_NCF ');
        Add(' FROM GES_CABECERAS_E_FAC_DGII D ');
        Add(' JOIN GES_CABECERAS_E S ON D.ID_E = S.ID_E ');
        Add(' JOIN GES_CABECERAS_E_FAC F ON D.ID_E = F.ID_E ');
        Add(' WHERE ');
        Add(' S.EMPRESA = :EMPRESA AND ');
        Add(' S.EJERCICIO = :EJERCICIO AND ');
        Add(' S.CANAL = :CANAL AND ');
        Add(' S.TIPO = :TIPO ');

        if (Serie > '') then
           Add('AND S.SERIE = :SERIE ');

        if (DesdeRig > 0) then
           Add('AND S.RIG >= :RIG_DESDE ');

        if (HastaRig > 0) then
           Add('AND S.RIG <= :RIG_HASTA ');

        if (Proveedor > 0) then
           Add('AND F.PROVEEDOR = :PROVEEDOR ');

        if (TipoCF > 0) then
           Add('AND F.Z_TIPO_NCF = :TIPO_NCF ');

        Add(' ORDER BY S.FECHA DESC ');

        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['TIPO'].AsString := Tipo;

        if (Serie > '') then
           Params.ByName['SERIE'].AsString := Serie;

        if (DesdeRig > 0) then
           Params.ByName['RIG_DESDE'].AsInteger := DesdeRig;

        if (HastaRig > 0) then
           Params.ByName['RIG_HASTA'].AsInteger := HastaRig;

        if (Proveedor <> 0) then
           Params.ByName['PROVEEDOR'].AsInteger := Proveedor;

        if (TipoCF > 0) then
           Params.ByName['TIPO_NCF'].AsInteger := TipoCF;

        Open;
     end;
  end;
end;

procedure TDMECFCompras.QMDocumentosCalcFields(DataSet: TDataSet);
begin
  if (QMDocumentosENVIO_RESPUESTA_JSON.IsNull) then
     QMDocumentosRESPUESTA_ENVIO.AsInteger := 0
  else
     QMDocumentosRESPUESTA_ENVIO.AsInteger := 1;

  if (QMDocumentosCONSULTA_RESPUESTA_JSON.IsNull) then
     QMDocumentosRESPUESTA_CONSULTA.AsInteger := 0
  else
     QMDocumentosRESPUESTA_CONSULTA.AsInteger := 1;
end;

procedure TDMECFCompras.AbreJsonRespuesta(Consulta: boolean);
var
  DS : TFIBDataSet;
  Archivo : string;
  m : TStream;
  RawJson, FormattedJson : string;
  SS : TStringStream;
  Encf : string;
  FS : TFileStream;
begin
  DS := TFIBDataSet.Create(nil);
  try
     with DS do
     begin
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           Close;
           DataBase := DMMain.DataBase;
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;

           SelectSQL.Clear;
           SelectSQL.Add('SELECT ENVIO_RESPUESTA_JSON, CONSULTA_RESPUESTA_JSON, ENCF ');
           SelectSQL.Add('FROM GES_CABECERAS_E_FAC_DGII ');
           SelectSQL.Add('WHERE ID_E = :ID_E ');
           Params.ByName['ID_E'].AsInteger := QMDocumentosID_E.AsInteger;
           Open;

           Encf := FieldByName('ENCF').AsString;

           if Consulta then
           begin
              Archivo := DameTempPath + Format('%s%s.json', [Trim(Encf), '_consulta_respuesta']);
              m := CreateBlobStream(FieldByName('CONSULTA_RESPUESTA_JSON'), bmRead);
           end
           else
           begin
              Archivo := DameTempPath + Format('%s%s.json', [Trim(Encf), '_envio_respuesta']);
              m := CreateBlobStream(FieldByName('ENVIO_RESPUESTA_JSON'), bmRead);
           end;

           try
              // Leer JSON
              SS := TStringStream.Create('');
              try
                 SS.CopyFrom(m, m.Size);
                 RawJson := SS.DataString;
              finally
                 SS.Free;
              end;

              // Formateamos JSON
              FormattedJson := PrettyJSON(RawJson);

              // Guardamoa JSON formateado
              SS := TStringStream.Create(FormattedJson);
              try
                 FS := TFileStream.Create(Archivo, fmCreate);
                 try
                    SS.Position := 0;
                    FS.CopyFrom(SS, SS.Size);
                 finally
                    FS.Free;
                 end;
              finally
                 SS.Free;
              end;
           finally
              m.Free;
           end;

           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     end;
  finally
     FreeAndNil(DS);
  end;

  DMMain.AbrirArchivo(Archivo);
end;

end.
