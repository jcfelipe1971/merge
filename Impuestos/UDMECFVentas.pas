unit UDMECFVentas;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, ShellAPI, Forms, Dialogs, Windows;

type
  TDMECFVentas = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMDocumentos: TFIBTableSet;
     DSQMDocumentos: TDataSource;
     QMDocumentosID_S: TIntegerField;
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
     QMDocumentosEMPRESA: TIntegerField;
     QMDocumentosEJERCICIO: TIntegerField;
     QMDocumentosCANAL: TIntegerField;
     QMDocumentosSERIE: TFIBStringField;
     QMDocumentosTIPO: TFIBStringField;
     QMDocumentosRIG: TIntegerField;
     QMDocumentosFECHA: TDateTimeField;
     QMDocumentosTOTAL_A_COBRAR: TFloatField;
     QMDocumentosMODO_IVA: TIntegerField;
     QMDocumentosCLIENTE: TIntegerField;
     QMDocumentosZ_PREFIJO_NCF: TFIBStringField;
     QMDocumentosZ_CONTADOR_NCF: TFIBStringField;
     QMDocumentosZ_TIPO_NCF: TIntegerField;
     QMDocumentosMENSAJE_ERROR_CONSULTA_ECF: TFIBStringField;
     QMDocumentosRESPUESTA_ENVIO: TIntegerField;
     QMDocumentosRESPUESTA_CONSULTA: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMDocumentosBeforeDelete(DataSet: TDataSet);
     procedure QMDocumentosCalcFields(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure CambiarSeleccion(DesdeRig, HastaRig, Cliente, TipoCF: integer; Serie: string);
     procedure AbreJsonRespuesta(Consulta: boolean);
  end;

var
  DMECFVentas : TDMECFVentas;

implementation

uses
  UDMMain, UEntorno, UUtiles;

{$R *.dfm}

procedure TDMECFVentas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMDocumentos, MascaraN, MascaraI, ShortDateFormat);
end;

procedure TDMECFVentas.CambiarSeleccion(DesdeRig, HastaRig, Cliente, TipoCF: integer; Serie: string);
var
  Tipo : string;
begin
  Tipo := 'FAC';

  with QMDocumentos do
  begin
     Close;
     with SelectSQL do
     begin
        Clear;
        Add(' SELECT D.*, S.EMPRESA, S.EJERCICIO, S.CANAL, S.SERIE, S.TIPO, S.RIG, S.FECHA, ');
        Add(' F.TOTAL_A_COBRAR, F.MODO_IVA, S.CLIENTE, F.Z_PREFIJO_NCF, F.Z_CONTADOR_NCF, F.Z_TIPO_NCF ');
        Add(' FROM GES_CABECERAS_S_FAC_DGII D ');
        Add(' JOIN GES_CABECERAS_S S ON D.ID_S = S.ID_S ');
        Add(' JOIN GES_CABECERAS_S_FAC F ON D.ID_S = F.ID_S ');
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

        if (Cliente > 0) then
           Add('AND S.CLIENTE = :CLIENTE ');

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

        if (Cliente <> 0) then
           Params.ByName['CLIENTE'].AsInteger := Cliente;

        if (TipoCF > 0) then
           Params.ByName['TIPO_NCF'].AsInteger := TipoCF;

        Open;
     end;
  end;
end;

procedure TDMECFVentas.QMDocumentosBeforeDelete(DataSet: TDataSet);
begin
  if (QMDocumentosSEQUENCE_CONSUMED.AsInteger > 0) then
     raise Exception.Create(_('No se puede eliminar un envio con la secuencia consumida'));
end;

procedure TDMECFVentas.AbreJsonRespuesta(Consulta: boolean);
var
  DS : TFIBDataSet;
  FicheroJson : string;
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
           SelectSQL.Add('FROM GES_CABECERAS_S_FAC_DGII ');
           SelectSQL.Add('WHERE ID_S = :ID_S ');
           Params.ByName['ID_S'].AsInteger := QMDocumentosID_S.AsInteger;
           Open;

           Encf := FieldByName('ENCF').AsString;

           if Consulta then
           begin
              FicheroJson := DameTempPath + Format('%s%s.json', [Trim(Encf), '_consulta_respuesta']);
              m := CreateBlobStream(FieldByName('CONSULTA_RESPUESTA_JSON'), bmRead);
           end
           else
           begin
              FicheroJson := DameTempPath + Format('%s%s.json', [Trim(Encf), '_envio_respuesta']);
              m := CreateBlobStream(FieldByName('ENVIO_RESPUESTA_JSON'), bmRead);
           end;

           try
              // Leer JSON
              SS := TStringStream.Create('');
              SS.CopyFrom(m, m.Size);
              RawJson := SS.DataString;
              SS.Free;

              // Formateamos JSON
              FormattedJson := PrettyJSON(RawJson);

              // Guardamoa JSON formateado
              SS := TStringStream.Create(FormattedJson);
              try
                 FS := TFileStream.Create(FicheroJson, fmCreate);
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

  // Abrimos el archivo
  if ShellExecute(Application.Handle, nil, PChar(FicheroJson), nil, nil, SW_SHOWNA) <= 32 then
     ShowMessage(_('No se pudo abrir el JSON del ECF'));
end;


procedure TDMECFVentas.QMDocumentosCalcFields(DataSet: TDataSet);
begin
  if (QMDocumentosENVIO_RESPUESTA_JSON.AsString > '') then
     QMDocumentosRESPUESTA_ENVIO.AsInteger := 1
  else
     QMDocumentosRESPUESTA_ENVIO.AsInteger := 0;

  if (QMDocumentosCONSULTA_RESPUESTA_JSON.AsString > '') then
     QMDocumentosRESPUESTA_CONSULTA.AsInteger := 1
  else
     QMDocumentosRESPUESTA_CONSULTA.AsInteger := 0;
end;

end.
