unit UDMSincronizacionHubSpot;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet;

type
  TDMSincronizacionHubSpot = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     xConfiguracion: TFIBTableSet;
     DSConfiguracion: TDataSource;
     xCompanies: TFIBTableSet;
     DSCompanies: TDataSource;
     xContacts: TFIBTableSet;
     DSContacts: TDataSource;
     xDeals: TFIBTableSet;
     DSDeals: TDataSource;
     xfiguracionEMPRESA: TIntegerField;
     xConfiguracionACCESS_TOKEN: TFIBStringField;
     xCompaniesHUBSPOT_COMPANY_ID: TFIBStringField;
     xCompaniesDELFOS_COMPANY_ID: TFIBStringField;
     xCompaniesNAME: TFIBStringField;
     xCompaniesCOMPANY_CIF: TFIBStringField;
     xCompaniesCOMPANY_DOMAIN: TFIBStringField;
     xCompaniesPHONE: TFIBStringField;
     xCompaniesEMAIL: TFIBStringField;
     xCompaniesADDRESS: TFIBStringField;
     xCompaniesZIP_CODE: TFIBStringField;
     xCompaniesCITY: TFIBStringField;
     xCompaniesCOUNTRY: TFIBStringField;
     xCompaniesSECTOR: TFIBStringField;
     xCompaniesDISCOUNT_PROFILE: TFIBStringField;
     xCompaniesID_CLIENTE: TIntegerField;
     xCompaniesTERCERO: TIntegerField;
     xCompaniesTERCERO_DIRECCION: TIntegerField;
     xCompaniesDATE_ADD: TDateTimeField;
     xCompaniesDATE_UPD: TDateTimeField;
     xContactsHUBSPOT_CONTACT_ID: TFIBStringField;
     xContactsHUBSPOT_COMPANY_ID: TFIBStringField;
     xContactsDELFOS_CONTACT_ID: TFIBStringField;
     xContactsDELFOS_COMPANY_ID: TFIBStringField;
     xContactsFIRSTNAME: TFIBStringField;
     xContactsLASTNAME: TFIBStringField;
     xContactsEMAIL: TFIBStringField;
     xContactsPHONE: TFIBStringField;
     xContactsJOBTITLE: TFIBStringField;
     xContactsDEPARTMENT: TFIBStringField;
     xContactsTERCERO: TIntegerField;
     xContactsTERCERO_CONTACTO: TIntegerField;
     xContactsDATE_ADD: TDateTimeField;
     xContactsDATE_UPD: TDateTimeField;
     xDealsHUBSPOT_DEAL_ID: TFIBStringField;
     xDealsDELFOS_DEAL_ID: TFIBStringField;
     xDealsHUBSPOT_CONTACT_ID: TFIBStringField;
     xDealsHUBSPOT_COMPANY_ID: TFIBStringField;
     xDealsDEAL_URL: TFIBStringField;
     xDealsDEAL_AMOUNT: TFloatField;
     xDealsCURRENCY: TFIBStringField;
     xDealsDEAL_STATUS: TFIBStringField;
     xDealsID_S: TIntegerField;
     xDealsDATE_ADD: TDateTimeField;
     xDealsDATE_UPD: TDateTimeField;
     xConfiguracionURL: TFIBStringField;
     xCompaniesRESULTADO_ENVIO: TIntegerField;
     xCompaniesRESPUESTA_ENVIO: TMemoField;
     xContactsRESULTADO_ENVIO: TIntegerField;
     xContactsRESPUESTA_ENVIO: TMemoField;
     xDealsRESULTADO_ENVIO: TIntegerField;
     xDealsRESPUESTA_ENVIO: TMemoField;
     xDealsDatos: TFIBTableSet;
     DSDealsDatos: TDataSource;
     xDealsDatosNAME: TFIBStringField;
     xDealsDatosCOMPANY_CIF: TFIBStringField;
     xDealsDatosFIRSTNAME: TFIBStringField;
     xDealsDatosLASTNAME: TFIBStringField;
     xDealsDatosPHONE: TFIBStringField;
     xDealsDatosEMAIL: TFIBStringField;
     xCompaniesDATE_SINC: TDateTimeField;
     xContactsID_CLIENTE: TIntegerField;
     xContactsDATE_SINC: TDateTimeField;
     xDealsDATE_SINC: TDateTimeField;
     procedure DataModuleCreate(Sender: TObject);
     procedure xCompaniesAfterOpen(DataSet: TDataSet);
     procedure xCompaniesBeforeClose(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
     procedure xDealsDEAL_STATUSGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure xDealsAfterOpen(DataSet: TDataSet);
     procedure xDealsBeforeClose(DataSet: TDataSet);
     procedure xDealsDEAL_STATUSSetText(Sender: TField; const Text: string);
  private
     { Private declarations }
     StatusCodes: TStrings;
  public
     { Public declarations }
     procedure EnviarCompaniesContactos;
     procedure EnviarDeals;
     function DameDealStatusText(Codigo: string): string;
     function DameDealStatusCode(Texto: string): string;
     procedure RefresarCompaniesContactos;
     procedure RefrescarDeals;
     procedure CrearCliente;
     function DameCliente(HubspotCompanyId: string): integer;
  end;

var
  DMSincronizacionHubSpot : TDMSincronizacionHubSpot;

implementation

uses UEntorno, UDMMain, UUtiles, UFormGest, UDMHubSpot, Dialogs, HYFIBQuery, DateUtils, UDMSincronizacion, uLkJSON, UDMLstOfertas, UDameDato;

{$R *.dfm}

procedure TDMSincronizacionHubSpot.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  StatusCodes := TStringList.Create;
  with StatusCodes do
  begin
     Values['appointmentscheduled'] := _('Cita programada');
     Values['qualifiedtobuy'] := _('Calificado para comprar');
     Values['presentationscheduled'] := _('Presentación programada');
     Values['decisionmakerboughtin'] := _('Propuesta aceptada');
     Values['contractsent'] := _('Contrato enviado');
     Values['closedwon'] := _('Cierre ganado');
     Values['closedlost'] := _('Cierre perdido');
  end;

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(xConfiguracion, MascaraN, MascaraI, ShortDateFormat + ' hh:nn');
  AsignaDisplayFormat(xCompanies, MascaraN, MascaraI, ShortDateFormat + ' hh:nn');
  AsignaDisplayFormat(xContacts, MascaraN, MascaraI, ShortDateFormat + ' hh:nn');
  AsignaDisplayFormat(xDeals, MascaraN, MascaraI, ShortDateFormat + ' hh:nn');

  with xConfiguracion do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Open;
  end;
  xCompanies.Open;
  xDeals.Open;

  AbreData(TDMHubSpot, DMHubSpot);
end;

procedure TDMSincronizacionHubSpot.DataModuleDestroy(Sender: TObject);
begin
  xConfiguracion.Close;
  xCompanies.Close;
  xDeals.Close;
  CierraData(DMHubSpot);
  StatusCodes.Free;
end;

function TDMSincronizacionHubSpot.DameDealStatusText(Codigo: string): string;
begin
  Result := StatusCodes.Values[Codigo];
end;

function TDMSincronizacionHubSpot.DameDealStatusCode(Texto: string): string;
var
  i : integer;
  Nombre : string;
begin
  Result := '';
  for i := 0 to StatusCodes.Count - 1 do
  begin
     Nombre := StatusCodes.Names[i];

     if StatusCodes.Values[Nombre] = Texto then
     begin
        Result := Nombre;
        Exit;
     end;
  end;
end;

procedure TDMSincronizacionHubSpot.EnviarCompaniesContactos;
var
  json, Respuesta : TStrings;
  Resultado : integer;
  hubspot_company_id : string;
  Documento, Nodo : TlkJSONBase;

  procedure EnviarContactos;
  var
     json, Respuesta : TStrings;
     Resultado : integer;
     hubspot_contact_id : string;
     Documento, Nodo : TlkJSONBase;
  begin
     json := TStringList.Create;
     Respuesta := TStringList.Create;
     try
        with xContacts do
        begin
           First;
           while not EOF do
           begin
              // Paso los pendientes de sincronizar SOLO si estan asociados a nuestra gestion.
              if ((SecondsBetween(FieldByName('DATE_UPD').AsDateTime, FieldByName('DATE_SINC').AsDateTime) > 60) and
                 (FieldByName('DELFOS_CONTACT_ID').AsString > '')) then
              begin
                 json.Clear;
                 json.Add('{');
                 if (FieldByName('HUBSPOT_CONTACT_ID').AsString > '') then
                    json.Add(format('"%s": "%s",', ['hubspot_contact_id', FieldByName('HUBSPOT_CONTACT_ID').AsString]));
                 if (FieldByName('HUBSPOT_COMPANY_ID').AsString > '') then
                    json.Add(format('"%s": "%s",', ['hubspot_company_id', FieldByName('HUBSPOT_COMPANY_ID').AsString]));
                 json.Add(format('"%s": "%s",', ['delfos_contact_id', FieldByName('DELFOS_CONTACT_ID').AsString]));
                 json.Add(format('"%s": "%s",', ['delfos_company_id', FieldByName('DELFOS_COMPANY_ID').AsString]));
                 json.Add(format('"%s": "%s",', ['firstname', FieldByName('FIRSTNAME').AsString]));
                 json.Add(format('"%s": "%s",', ['lastname', FieldByName('LASTNAME').AsString]));
                 json.Add(format('"%s": "%s",', ['email', FieldByName('EMAIL').AsString]));
                 json.Add(format('"%s": "%s",', ['phone', FieldByName('PHONE').AsString]));
                 json.Add(format('"%s": "%s",', ['jobtitle', FieldByName('JOBTITLE').AsString]));
                 json.Add(format('"%s": "%s" ', ['department', FieldByName('DEPARTMENT').AsString]));
                 json.Add('}');

                 Resultado := DMHubSpot.WS_Add('contacts', json, Respuesta);

                 hubspot_contact_id := '';
                 if ((Resultado = 200) or (Resultado = 201)) then
                 begin
                    Documento := TlkJSON.ParseText(Respuesta.Text) as TlkJSONObject;
                    try
                       if Assigned(Documento) then
                       begin
                          Nodo := TlkJSONObject(Documento).Field['hubspot_contact_id'];
                          if Assigned(Nodo) then
                             hubspot_contact_id := Nodo.Value;
                       end;
                    finally
                       Documento.Free;
                    end;
                 end;

                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' UPDATE HS_CONTACTS ');
                       SQL.Add(' SET ');
                       SQL.Add(' RESULTADO_ENVIO = :RESULTADO_ENVIO, ');
                       SQL.Add(' RESPUESTA_ENVIO = :RESPUESTA_ENVIO ');
                       if ((Resultado = 200) or (Resultado = 201)) then
                          SQL.Add(' ,DATE_SINC = ''NOW'' ');
                       if ((Resultado = 200) or (Resultado = 201)) and (Trim(hubspot_contact_id) > '') then
                          SQL.Add(' ,HUBSPOT_CONTACT_ID = ''' + Trim(hubspot_contact_id) + ''' ');
                       SQL.Add(' WHERE ');
                       SQL.Add(' DELFOS_COMPANY_ID = :DELFOS_COMPANY_ID AND ');
                       SQL.Add(' DELFOS_CONTACT_ID = :DELFOS_CONTACT_ID ');
                       Params.ByName['DELFOS_COMPANY_ID'].AsString := xContacts.FieldByName('DELFOS_COMPANY_ID').AsString;
                       Params.ByName['DELFOS_CONTACT_ID'].AsString := xContacts.FieldByName('DELFOS_CONTACT_ID').AsString;
                       Params.ByName['RESULTADO_ENVIO'].AsInteger := Resultado;
                       Params.ByName['RESPUESTA_ENVIO'].AsString := Respuesta.Text;
                       ExecQuery;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;
              end;

              Next;
           end;
        end;
     finally
        json.Free;
        Respuesta.Free;
     end;
  end;

begin
  if not DMHubSpot.WS_Inicializa(xConfiguracionURL.AsString, xConfiguracionACCESS_TOKEN.AsString, False) then
     ShowMessage(_('Error al inicializar servicio HubSpot'))
  else
  begin
     json := TStringList.Create;
     Respuesta := TStringList.Create;
     try
        with xCompanies do
        begin
           First;
           while not EOF do
           begin
              // Paso los pendientes de sincronizar SOLO si estan asociados a nuestra gestion.
              if ((SecondsBetween(FieldByName('DATE_UPD').AsDateTime, FieldByName('DATE_SINC').AsDateTime) > 60) and
                 (FieldByName('DELFOS_COMPANY_ID').AsString > '')) then
              begin
                 json.Clear;
                 json.Add('{');
                 if (FieldByName('HUBSPOT_COMPANY_ID').AsString <> '') then
                    json.Add(format('"%s": "%s",', ['hubspot_company_id', FieldByName('HUBSPOT_COMPANY_ID').AsString]));
                 json.Add(format('"%s": "%s",', ['delfos_company_id', FieldByName('DELFOS_COMPANY_ID').AsString]));
                 json.Add(format('"%s": "%s",', ['name', FieldByName('NAME').AsString]));
                 json.Add(format('"%s": "%s",', ['company_cif', FieldByName('COMPANY_CIF').AsString]));
                 json.Add(format('"%s": "%s",', ['company_domain', FieldByName('COMPANY_DOMAIN').AsString]));
                 json.Add(format('"%s": "%s",', ['phone', FieldByName('PHONE').AsString]));
                 json.Add(format('"%s": "%s",', ['email', FieldByName('EMAIL').AsString]));
                 json.Add(format('"%s": "%s",', ['address', FieldByName('ADDRESS').AsString]));
                 json.Add(format('"%s": "%s",', ['zip_code', FieldByName('ZIP_CODE').AsString]));
                 json.Add(format('"%s": "%s",', ['city', FieldByName('CITY').AsString]));
                 json.Add(format('"%s": "%s",', ['country', FieldByName('COUNTRY').AsString]));
                 json.Add(format('"%s": "%s",', ['sector', FieldByName('SECTOR').AsString]));
                 json.Add(format('"%s": "%s" ', ['discount_profile', FieldByName('DISCOUNT_PROFILE').AsString]));
                 json.Add('}');

                 Resultado := DMHubSpot.WS_Add('companies', json, Respuesta);

                 hubspot_company_id := '';
                 if ((Resultado = 200) or (Resultado = 201)) then
                 begin
                    Documento := TlkJSON.ParseText(Respuesta.Text) as TlkJSONObject;
                    try
                       if Assigned(Documento) then
                       begin
                          Nodo := TlkJSONObject(Documento).Field['hubspot_company_id'];
                          if Assigned(Nodo) then
                             hubspot_company_id := Nodo.Value;
                       end;
                    finally
                       Documento.Free;
                    end;
                 end;

                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' UPDATE HS_COMPANIES ');
                       SQL.Add(' SET ');
                       SQL.Add(' RESULTADO_ENVIO = :RESULTADO_ENVIO, ');
                       SQL.Add(' RESPUESTA_ENVIO = :RESPUESTA_ENVIO ');
                       if ((Resultado = 200) or (Resultado = 201)) then
                          SQL.Add(' ,DATE_SINC = ''NOW'' ');
                       if ((Resultado = 200) or (Resultado = 201)) and (Trim(hubspot_company_id) > '') then
                          SQL.Add(' ,HUBSPOT_COMPANY_ID = ''' + Trim(hubspot_company_id) + ''' ');
                       SQL.Add(' WHERE ');
                       SQL.Add(' DELFOS_COMPANY_ID = :DELFOS_COMPANY_ID ');
                       Params.ByName['DELFOS_COMPANY_ID'].AsString := xCompanies.FieldByName('DELFOS_COMPANY_ID').AsString;
                       Params.ByName['RESULTADO_ENVIO'].AsInteger := Resultado;
                       Params.ByName['RESPUESTA_ENVIO'].AsString := Respuesta.Text;
                       ExecQuery;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;
              end;

              EnviarContactos;

              Next;
           end;

           // Vuelvo al primer registro
           First;
        end;
     finally
        json.Free;
        Respuesta.Free;
     end;

     RefresarCompaniesContactos;

     // También refresco Deals por si se han actualizado datos de companies y contacts relacionados
     RefrescarDeals;
  end;
end;

procedure TDMSincronizacionHubSpot.EnviarDeals;
var
  json, Respuesta : TStrings;
  Resultado : integer;
  hubspot_deal_id : string;
  Documento, Nodo : TlkJSONBase;
  StreamOrigen : TStream;
  strBase64 : string;
begin
  if not DMHubSpot.WS_Inicializa(xConfiguracionURL.AsString, xConfiguracionACCESS_TOKEN.AsString, False) then
     ShowMessage(_('Error al inicializar servicio HubSpot'))
  else
  begin
     json := TStringList.Create;
     Respuesta := TStringList.Create;
     try
        with xDeals do
        begin
           First;
           while not EOF do
           begin
              // Paso los pendientes de sincronizar SOLO si estan asociados a nuestra gestion.
              if ((SecondsBetween(FieldByName('DATE_UPD').AsDateTime, FieldByName('DATE_SINC').AsDateTime) > 60) and
                 (FieldByName('DELFOS_DEAL_ID').AsString > '')) then
              begin
                 json.Clear;
                 json.Add('{');
                 json.Add(format('"%s": "%s",', ['hubspot_deal_id', FieldByName('HUBSPOT_DEAL_ID').AsString]));
                 json.Add(format('"%s": "%s",', ['delfos_deal_id', FieldByName('DELFOS_DEAL_ID').AsString]));
                 json.Add(format('"%s": "%s",', ['hubspot_contact_id', FieldByName('HUBSPOT_CONTACT_ID').AsString]));
                 json.Add(format('"%s": "%s",', ['hubspot_company_id', FieldByName('HUBSPOT_COMPANY_ID').AsString]));

                 if (FieldByName('DELFOS_DEAL_ID').AsString > '') then
                 begin
                    AbreData(TDMLstOfertas, DMLstOfertas);
                    DMLstOfertas.MostrarListadoMail(FieldByName('ID_S').AsInteger, '', 2, 0, False);

                    StreamOrigen := TFileStream.Create(DMLstOfertas.rutaFich, fmOpenRead);
                    try
                       StreamToStrB64(StreamOrigen, strBase64);
                    finally
                       StreamOrigen.Free;
                    end;
                    // Quito saltos de linea
                    strBase64 := StringReplace(strBase64, #13#10, '', [rfReplaceAll]);

                    json.Add(format('"%s": "%s",', ['deal_file', strBase64]));
                    json.Add(format('"%s": "%s",', ['deal_file_name', DMLstOfertas.nombreFich]));
                    CierraData(DMLstOfertas);
                 end;

                 json.Add(format('"%s": %s,  ', ['deal_amount', FloatToStrDec(FieldByName('DEAL_AMOUNT').AsFloat, '.')]));
                 json.Add(format('"%s": "%s",', ['currency', FieldByName('CURRENCY').AsString]));
                 json.Add(format('"%s": "%s" ', ['deal_status', FieldByName('DEAL_STATUS').AsString]));
                 json.Add('}');

                 {$IFDEF Debug}
                 json.SaveTofile(DameTempPath+format('Deal_%s-%d.json',[FieldByName('HUBSPOT_DEAL_ID').AsString,FieldByName('ID_S').AsInteger]));
                 {$ENDIF}

                 Resultado := DMHubSpot.WS_Add('deals', json, Respuesta);

                 hubspot_deal_id := '';
                 if ((Resultado = 200) or (Resultado = 201)) then
                 begin
                    Documento := TlkJSON.ParseText(Respuesta.Text) as TlkJSONObject;
                    try
                       if Assigned(Documento) then
                       begin
                          Nodo := TlkJSONObject(Documento).Field['hubspot_deal_id'];
                          if Assigned(Nodo) then
                             hubspot_deal_id := Nodo.Value;
                       end;
                    finally
                       Documento.Free;
                    end;
                 end;

                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' UPDATE HS_DEALS ');
                       SQL.Add(' SET ');
                       SQL.Add(' RESULTADO_ENVIO = :RESULTADO_ENVIO, ');
                       SQL.Add(' RESPUESTA_ENVIO = :RESPUESTA_ENVIO ');
                       if ((Resultado = 200) or (Resultado = 201)) then
                          SQL.Add(' ,DATE_SINC = ''NOW'' ');
                       if ((Resultado = 200) or (Resultado = 201)) and (Trim(hubspot_deal_id) > '') then
                          SQL.Add(' ,HUBSPOT_DEAL_ID = ''' + Trim(hubspot_deal_id) + ''' ');
                       SQL.Add(' WHERE ');
                       SQL.Add(' DELFOS_DEAL_ID = :DELFOS_DEAL_ID ');
                       Params.ByName['DELFOS_DEAL_ID'].AsString := xDeals.FieldByName('DELFOS_DEAL_ID').AsString;
                       Params.ByName['RESULTADO_ENVIO'].AsInteger := Resultado;
                       Params.ByName['RESPUESTA_ENVIO'].AsString := Respuesta.Text;
                       ExecQuery;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;
              end;

              Next;
           end;

           // Vuelvo al primer registro
           First;
        end;
     finally
        json.Free;
        Respuesta.Free;
     end;

     RefrescarDeals;
  end;
end;

procedure TDMSincronizacionHubSpot.xCompaniesAfterOpen(DataSet: TDataSet);
begin
  xContacts.Open;
end;

procedure TDMSincronizacionHubSpot.xCompaniesBeforeClose(DataSet: TDataSet);
begin
  xContacts.Close;
end;

procedure TDMSincronizacionHubSpot.xDealsDEAL_STATUSGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DameDealStatusText(xDealsDEAL_STATUS.AsString);
end;

procedure TDMSincronizacionHubSpot.xDealsDEAL_STATUSSetText(Sender: TField; const Text: string);
begin
  xDealsDEAL_STATUS.AsString := DameDealStatusCode(Text);
end;

procedure TDMSincronizacionHubSpot.xDealsAfterOpen(DataSet: TDataSet);
begin
  xDealsDatos.Open;
end;

procedure TDMSincronizacionHubSpot.xDealsBeforeClose(DataSet: TDataSet);
begin
  xDealsDatos.Close;
end;

procedure TDMSincronizacionHubSpot.RefresarCompaniesContactos;
var
  HSId, DEId, DECOId : string;
begin
  HSId := xCompaniesHUBSPOT_COMPANY_ID.AsString;
  DEId := xCompaniesDELFOS_COMPANY_ID.AsString;
  DECOId := xContactsDELFOS_CONTACT_ID.AsString;

  with xCompanies do
  begin
     try
        DisableControls;
        Close;
        Open;
        while (not EOF) and not ((HSId = xCompaniesHUBSPOT_COMPANY_ID.AsString) and (DEId = xCompaniesDELFOS_COMPANY_ID.AsString)) do
           Next;
        if EOF then
           First;
     finally
        EnableControls;
     end;
  end;

  with xContacts do
  begin
     try
        DisableControls;
        Close;
        Open;
        while (not EOF) and (DECOId <> xContactsDELFOS_CONTACT_ID.AsString) do
           Next;
        if EOF then
           First;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMSincronizacionHubSpot.RefrescarDeals;
var
  HSId, DEId : string;
begin
  HSId := xDealsHUBSPOT_DEAL_ID.AsString;
  DEId := xDealsDELFOS_DEAL_ID.AsString;

  with xDeals do
  begin
     try
        DisableControls;
        Close;
        Open;
        while (not EOF) and (HSId <> xDealsHUBSPOT_DEAL_ID.AsString) and (DEId <> xDealsDELFOS_DEAL_ID.AsString) do
           Next;
        if EOF then
           First;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMSincronizacionHubSpot.CrearCliente;
var
  DatosTercero : TTercero;
  DatosCliente : TCliente;
  TerceroAsociado : integer;
  DireccionAsociada : integer;
  IdCliente : integer;
begin
  InicializaTercero(DatosTercero);

  // Si ya esta enlazado con un tercero, lo mantengo
  TerceroAsociado := xCompanies.FieldByName('TERCERO').AsInteger;
  DireccionAsociada := xCompanies.FieldByName('TERCERO_DIRECCION').AsInteger;

  with DatosTercero do
  begin
     NombreRSocial := Copy(xCompanies.FieldByName('NAME').AsString, 1, 60);
     PaisTercero := REntorno.Pais; // TODO - Validar
     Nif := LimpiaNIF(PaisTercero, xCompanies.FieldByName('COMPANY_CIF').AsString);
     Tercero := TerceroAsociado;
     email := Copy(xCompanies.FieldByName('EMAIL').AsString, 1, 100);

     Notas := 'Importado de Hubspot';
     if (Trim(xCompanies.FieldByName('NAME').AsString) > '') then
        Notas := Notas + #13#10 + 'NAME: ' + xCompanies.FieldByName('NAME').AsString;
     if (Trim(xCompanies.FieldByName('COMPANY_CIF').AsString) > '') then
        Notas := Notas + #13#10 + 'COMPANY_CIF: ' + xCompanies.FieldByName('COMPANY_CIF').AsString;
     if (Trim(xCompanies.FieldByName('COMPANY_DOMAIN').AsString) > '') then
        Notas := Notas + #13#10 + 'COMPANY_DOMAIN: ' + xCompanies.FieldByName('COMPANY_DOMAIN').AsString;
     if (Trim(xCompanies.FieldByName('PHONE').AsString) > '') then
        Notas := Notas + #13#10 + 'PHONE: ' + xCompanies.FieldByName('PHONE').AsString;
     if (Trim(xCompanies.FieldByName('EMAIL').AsString) > '') then
        Notas := Notas + #13#10 + 'EMAIL: ' + xCompanies.FieldByName('EMAIL').AsString;
     if (Trim(xCompanies.FieldByName('ADDRESS').AsString) > '') then
        Notas := Notas + #13#10 + 'ADDRESS: ' + xCompanies.FieldByName('ADDRESS').AsString;
     if (Trim(xCompanies.FieldByName('ZIP_CODE').AsString) > '') then
        Notas := Notas + #13#10 + 'ZIP_CODE: ' + xCompanies.FieldByName('ZIP_CODE').AsString;
     if (Trim(xCompanies.FieldByName('CITY').AsString) > '') then
        Notas := Notas + #13#10 + 'CITY: ' + xCompanies.FieldByName('CITY').AsString;
     if (Trim(xCompanies.FieldByName('COUNTRY').AsString) > '') then
        Notas := Notas + #13#10 + 'COUNTRY: ' + xCompanies.FieldByName('COUNTRY').AsString;
     if (Trim(xCompanies.FieldByName('SECTOR').AsString) > '') then
        Notas := Notas + #13#10 + 'SECTOR: ' + xCompanies.FieldByName('SECTOR').AsString;
  end;

  // Esto crea/modifica el tercero y la direccion
  CreaTercero(DatosTercero);
  TerceroAsociado := DatosTercero.Tercero;

  // Debo al menos poner este texto para que cree una direccion asociada al tercero.
  DatosTercero.Direccion.Tercero := DatosTercero.Tercero;
  DatosTercero.Direccion.Direccion := DireccionAsociada;

  // Relleno la direccion con algo para que inserte por lo menos un registro
  DatosTercero.Direccion.DirNombre1 := xCompanies.FieldByName('ADDRESS').AsString;
  if DatosTercero.Direccion.DirNombre1 = '' then
     DatosTercero.Direccion.DirNombre1 := xCompanies.FieldByName('EMAIL').AsString;
  if DatosTercero.Direccion.DirNombre1 = '' then
     DatosTercero.Direccion.DirNombre1 := xCompanies.FieldByName('NAME').AsString;
  CreaDireccionTercero(DatosTercero.Direccion);
  DireccionAsociada := DatosTercero.Direccion.Direccion;

  InicializaCliente(DatosCliente);
  DatosCliente.Tercero := DatosTercero;
  CreaCliente(DatosCliente);

  IdCliente := DameIDCliente(DatosCliente.Cliente);

  xCompanies.Edit;
  xCompaniesDELFOS_COMPANY_ID.AsString := IntToStr(IdCliente);
  xCompaniesTERCERO.AsInteger := TerceroAsociado;
  xCompaniesTERCERO_DIRECCION.AsInteger := DireccionAsociada;
  xCompaniesID_CLIENTE.AsInteger := IdCliente;
  xCompanies.Post;
end;

function TDMSincronizacionHubSpot.DameCliente(HubspotCompanyId: string): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT CL.CLIENTE FROM HS_COMPANIES CO ');
        SQL.Add(' JOIN EMP_CLIENTES CL ON CO.ID_CLIENTE = CL.ID_CLIENTE ');
        SQL.Add(' WHERE ');
        SQL.Add(' CO.HUBSPOT_COMPANY_ID = :HUBSPOT_COMPANY_ID ');
        Params.ByName['HUBSPOT_COMPANY_ID'].AsString := HubspotCompanyId;
        ExecQuery;
        Result := FieldByName['CLIENTE'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
