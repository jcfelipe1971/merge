unit UDMSIICertificados;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, UEntorno;

type
  TDMSIICertificados = class(TDataModule)
     QMCertificados: TFIBTableSet;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     DSQMCertificados: TDataSource;
     QMCertificadosEMPRESA: TIntegerField;
     QMCertificadosCERTIFICADO: TBlobField;
     QMCertificadosCONTRASENYA: TFIBStringField;
     QMCertificadosRUT: TFIBStringField;
     QMCertificadosFECHA_RESOLUCION: TDateTimeField;
     QMCertificadosNRO_RESOLUCION: TIntegerField;
     QMCertificadosNOMBRE_RESPONSABLE: TFIBStringField;
     QMCertificadosSUCSII: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMCertificadosNewRecord(DataSet: TDataSet);
     procedure QMCertificadosBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
     function ConsultaSiiChile(Pagina: string; Respuesta: TStrings): integer;
  public
     { Public declarations }
     procedure GuardaCertificado(const FileName: string);
  end;

var
  DMSIICertificados : TDMSIICertificados;

implementation

uses
  UDMMain, UUtiles, HttpConnectionWinInet, UlkJSON, HYFIBQuery;

{$R *.dfm}

procedure TDMSIICertificados.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMCertificados, '10000', True);
end;

procedure TDMSIICertificados.QMCertificadosNewRecord(DataSet: TDataSet);
begin
  QMCertificadosEMPRESA.AsInteger := REntorno.empresa;
  QMCertificadosCONTRASENYA.AsString := '';
  QMCertificadosRUT.AsString := '';
  QMCertificadosFECHA_RESOLUCION.AsDateTime := REntorno.FechaTrab;
  QMCertificadosNOMBRE_RESPONSABLE.AsString := '';
  QMCertificadosSUCSII.AsString := '';
end;

procedure TDMSIICertificados.GuardaCertificado(const FileName: string);
var
  m, f : TStream;
  UrlFactronicaPfx, UrlFactronicaPfxRecepcion, UrlFactronicaPfxProcesa, NombreArchivo : string;
  Respuesta : TStrings;
  //FicheroTemporalJson : TStrings;
  Status, Exponent : string;
  Documento, NodoPadre : TlkJSONbase;
  //Nodo : TlkJSONbase;
  Modulus, LlavePublica, LlavePrivada, LlavePrivada2 : TStrings;
  //TextoEnLineas : TStrings;
  TextoOrigen, TextoProcesado : TStringList;

  procedure DivideLineasEn64Caracteres(TextoOrigen, TextoProcesado: TStrings);
  var
     i, Largo : integer;
     Linea, Fragmento : string;
  begin
     // Limpiamos TextoProcesado
     TextoProcesado.Clear;

     for i := 0 to TextoOrigen.Count - 1 do
     begin
        Linea := TextoOrigen[i];
        Largo := Length(Linea);

        // Dividimos la línea en fragmentos de 64 caracteres
        while Largo > 0 do
        begin
           Fragmento := Copy(Linea, 1, 64);
           if (Trim(Fragmento) <> '') then
           begin
              TextoProcesado.Add(Fragmento);
              DMMain.Log('Fragmento: ' + IntToStr(Largo) + ' - ' + Fragmento);
           end;
           Delete(Linea, 1, 64);
           Largo := Length(Linea);
        end;
     end;
  end;

begin
  m := DMSIICertificados.QMCertificados.CreateBlobStream(DMSIICertificados.QMCertificadosCERTIFICADO, bmWrite);
  try
     f := TFileStream.Create(FileName, fmOpenRead);
     try
        m.CopyFrom(f, f.Size);
     finally
        f.Free;
     end;
  finally
     m.Free;
  end;

  // Obtenemos datos del certificado en modo texto
  UrlFactronicaPfx := DMMain.DameUrlEndPoint('FAC') + '/' + 'api_pfx2txtcliente/';
  UrlFactronicaPfxRecepcion := UrlFactronicaPfx + 'recepcionFichero.php';

  if not (UploadFile(UrlFactronicaPfxRecepcion, FileName)) then
     DMMain.Log('No se ha podido subir el Certificado')
  else
  begin
     NombreArchivo := ExtractFileName(FileName);
     UrlFactronicaPfxProcesa := UrlFactronicaPfx + 'delfos_procesar.php?clave=' + QMCertificadosCONTRASENYA.AsString + '&token=abc123&nombreArchivo=' + nombreArchivo;
     Respuesta := TStringList.Create;
     try
        ConsultaSiiChile(UrlFactronicaPfxProcesa, Respuesta);

        Documento := TlkJSON.ParseText(Respuesta.Text);
        DMMain.Log('Respuestade obtencion de datos para certificado en modo texto: ' + Respuesta.Text);

        { *** Comentado para pruebas ***
        FicheroTemporalJson := TStringList.Create;
        FicheroTemporalJson.LoadFromFile(IncludeTrailingPathDelimiter(GetSpecialFolderPath(CSIDL_PERSONAL, False)) + 'respuestaJson.txt');
        Documento := TlkJSON.ParseText(FicheroTemporalJson.Text);}
        try
           if Assigned(Documento) then
           begin
              // Verificamos si tiene estado del envio la respuesta
              NodoPadre := Documento.Field['Status'];
              if Assigned(NodoPadre) then
              begin
                 Status := NodoPadre.Field['Status'].Value;
                 if (Status = 'OK') then
                 begin
                    // Inicializamos variables
                    Status := '';
                    Exponent := '';
                    Modulus := TStringList.Create;
                    LlavePublica := TStringList.Create;
                    LlavePrivada := TStringList.Create;
                    LlavePrivada2 := TStringList.Create;
                    TextoOrigen := TStringList.Create;
                    TextoProcesado := TStringList.Create;

                    NodoPadre := Documento.Field['Exponent'];
                    if Assigned(NodoPadre) then
                       Exponent := NodoPadre.Field['Exponent'].Value
                    else
                       DMMain.Log('No se ha podio obtener el Exponent');

                    NodoPadre := Documento.Field['Modulus'];
                    if Assigned(NodoPadre) then
                    begin
                       TextoOrigen.Clear;
                       TextoOrigen.Text := NodoPadre.Field['Modulus'].Value;
                       DivideLineasEn64Caracteres(TextoOrigen, TextoProcesado);
                       Modulus.Clear;
                       Modulus.Text := TextoProcesado.Text;
                    end
                    else
                       DMMain.Log('No se ha podio obtener el Modulus');

                    NodoPadre := Documento.Field['X509Certificate'];
                    if Assigned(NodoPadre) then
                    begin
                       TextoOrigen.Clear;
                       TextoOrigen.Text := NodoPadre.Field['X509Certificate'].Value;
                       DivideLineasEn64Caracteres(TextoOrigen, TextoProcesado);
                       LlavePublica.Clear;
                       LlavePublica.Add(TextoProcesado.Text);
                    end
                    else
                       DMMain.Log('No se ha podio obtener el LlavePublica');

                    NodoPadre := Documento.Field['PrivKey'];
                    if Assigned(NodoPadre) then
                    begin
                       TextoOrigen.Clear;
                       TextoOrigen.Text := NodoPadre.Field['PrivKey'].Value;
                       //Quitamos el inicio y el final de la clave privada
                       TextoOrigen.Text := StringReplace(TextoOrigen.Text, '-----BEGIN RSA PRIVATE KEY-----', '', [rfReplaceAll, rfIgnoreCase]);
                       TextoOrigen.Text := StringReplace(TextoOrigen.Text, '-----END RSA PRIVATE KEY-----', '', [rfReplaceAll, rfIgnoreCase]);
                       DivideLineasEn64Caracteres(TextoOrigen, TextoProcesado);
                       LlavePrivada.Clear;
                       LlavePrivada.Add('-----BEGIN RSA PRIVATE KEY-----');
                       LlavePrivada.Add(Trim(TextoProcesado.Text));
                       LlavePrivada.Add('-----END RSA PRIVATE KEY-----');
                    end
                    else
                       DMMain.Log('No se ha podio obtener el LlavePrivada');

                    NodoPadre := Documento.Field['PrivKey2'];
                    if Assigned(NodoPadre) then
                    begin
                       TextoOrigen.Clear;
                       TextoOrigen.Text := NodoPadre.Field['PrivKey2'].Value;
                       //Quitamos el inicio y el final de la clave privada
                       TextoOrigen.Text := StringReplace(TextoOrigen.Text, '-----BEGIN PRIVATE KEY-----', '', [rfReplaceAll, rfIgnoreCase]);
                       TextoOrigen.Text := StringReplace(TextoOrigen.Text, '-----END PRIVATE KEY-----', '', [rfReplaceAll, rfIgnoreCase]);
                       DivideLineasEn64Caracteres(TextoOrigen, TextoProcesado);
                       LlavePrivada2.Clear;
                       LlavePrivada2.Add('-----BEGIN PRIVATE KEY-----');
                       LlavePrivada2.Add(Trim(TextoProcesado.Text));
                       LlavePrivada2.Add('-----END PRIVATE KEY-----');

                    end
                    else
                       DMMain.Log('No se ha podio obtener el LlavePrivada2');

                    // Actualizamos valores
                    with THYFIBQuery.Create(nil) do
                    begin
                       try
                          Close;
                          DataBase := DMMain.DataBase;
                          SQL.Add(' UPDATE SII_CERTIFICADOS ');
                          SQL.Add(' SET ');
                          SQL.Add(' EXPONENT = :EXPONENT, ');
                          SQL.Add(' MODULO = :MODULO, ');
                          SQL.Add(' LLAVE_PUBLICA_X509 = :LLAVE_PUBLICA_X509, ');
                          SQL.Add(' LLAVE_PRIVADA_RSA = :LLAVE_PRIVADA_RSA, ');
                          SQL.Add(' LLAVE_PRIVADA_2 = :LLAVE_PRIVADA_2 ');
                          SQL.Add(' WHERE ');
                          SQL.Add(' EMPRESA = :EMPRESA AND ');
                          SQL.Add(' RUT = :RUT ');
                          Params.ByName['EMPRESA'].AsInteger := QMCertificadosEMPRESA.AsInteger;
                          Params.ByName['RUT'].AsString := QMCertificadosRUT.AsString;
                          Params.ByName['EXPONENT'].AsString := Exponent;
                          Params.ByName['MODULO'].AsString := Modulus.Text;
                          Params.ByName['LLAVE_PUBLICA_X509'].AsString := LlavePublica.Text;
                          Params.ByName['LLAVE_PRIVADA_RSA'].AsString := LlavePrivada.Text;
                          Params.ByName['LLAVE_PRIVADA_2'].AsString := LlavePrivada2.Text;
                          ExecQuery;
                          FreeHandle;
                       finally
                          Free;
                       end;
                    end;
                 end;
              end
              else
                 raise Exception.Create(_('No se ha podido obtener los datos de la respuesta'));
           end;
        finally
           Documento.Free;
        end;
     finally
        Respuesta.Free;
     end;
  end;
end;

procedure TDMSIICertificados.QMCertificadosBeforePost(DataSet: TDataSet);
begin
  if ((QMCertificados.State = dsInsert) or (QMCertificados.State = dsEdit)) then
     if (QMCertificadosNOMBRE_RESPONSABLE.AsString = '') then
        raise Exception.Create(_('Debe asignar Nombre del responsable'))
     else
     if (QMCertificadosSUCSII.AsString = '') then
        raise Exception.Create(_('Debe asignar una sucursal del SII'));
end;

function TDMSIICertificados.ConsultaSiiChile(Pagina: string; Respuesta: TStrings): integer;
var
  HttpConnectionWinInet : THttpConnectionWinInet;
  AResponse : TStream;
  Metodo : string;
begin
  //Result := 0;
  Metodo := 'GET';

  // Transmision
  HttpConnectionWinInet := THttpConnectionWinInet.Create;
  AResponse := TStringStream.Create('');
  try
     with HttpConnectionWinInet do
     begin
        Headers.Add('Accept=*/*');
        Headers.Add('Content-Type=application/x-www-form-urlencoded');

        if (Metodo = 'GET') then
           Get(Pagina, AResponse);

        Result := GetResponseCode;
     end;

     if Assigned(Respuesta) then
     begin
        AResponse.Position := 0;
        Respuesta.LoadFromStream(AResponse);
     end;
  finally
     HttpConnectionWinInet.Free;
     AResponse.Free;
  end;
end;

end.
