unit UDMVerificacionesImpuestos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSetRO,
  FIBDataSet, HYFIBQuery;

type
  TDMVerificacionesImpuestos = class(TDataModule)
     xClientesIntra: TFIBDataSetRO;
     xProveedoresIntra: TFIBDataSetRO;
     DSxClientesIntra: TDataSource;
     DSxProveedoresIntra: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     xClientesIntraEMPRESA: TIntegerField;
     xClientesIntraEJERCICIO: TIntegerField;
     xClientesIntraCANAL: TIntegerField;
     xClientesIntraCLIENTE: TIntegerField;
     xClientesIntraNOMBRE_R_SOCIAL: TFIBStringField;
     xClientesIntraINTRA: TIntegerField;
     xClientesIntraMODO_IVA: TIntegerField;
     xClientesIntraPAIS: TFIBStringField;
     xClientesIntraPERTENECE_CEE: TIntegerField;
     xClientesIntraDIR_COMPLETA_N: TFIBStringField;
     xClientesIntraTITULO: TFIBStringField;
     xClientesIntraTITULO1: TFIBStringField;
     xProveedoresIntraEMPRESA: TIntegerField;
     xProveedoresIntraEJERCICIO: TIntegerField;
     xProveedoresIntraCANAL: TIntegerField;
     xProveedoresIntraPROVEEDOR: TIntegerField;
     xProveedoresIntraNOMBRE_R_SOCIAL: TFIBStringField;
     xProveedoresIntraINTRA: TIntegerField;
     xProveedoresIntraMODO_IVA: TIntegerField;
     xProveedoresIntraPAIS: TFIBStringField;
     xProveedoresIntraPERTENECE_CEE: TIntegerField;
     xProveedoresIntraDIR_COMPLETA_N: TFIBStringField;
     xProveedoresIntraTITULO: TFIBStringField;
     xProveedoresIntraTITULO1: TFIBStringField;
     xFAPModoIncorrecto: TFIBDataSetRO;
     DSxFAPModoIncorrecto: TDataSource;
     xFAPModoIncorrectoEMPRESA: TIntegerField;
     xFAPModoIncorrectoEJERCICIO: TIntegerField;
     xFAPModoIncorrectoCANAL: TIntegerField;
     xFAPModoIncorrectoSERIE: TFIBStringField;
     xFAPModoIncorrectoTIPO: TFIBStringField;
     xFAPModoIncorrectoRIG: TIntegerField;
     xFAPModoIncorrectoPROVEEDOR: TIntegerField;
     xFAPModoIncorrectoNOMBRE_R_SOCIAL: TFIBStringField;
     xFAPModoIncorrectoRIG_VISIBLE: TIntegerField;
     xFAPModoIncorrectoMODO: TIntegerField;
     xFAPModoIncorrectoMODO_IVA: TIntegerField;
     xFAPModoIncorrectoS_BASES: TFloatField;
     xFAPModoIncorrectoS_IVAS: TFloatField;
     xFAPModoIncorrectoFECHA: TDateTimeField;
     xFCRModoIncorrecto: TFIBDataSetRO;
     DSxFCRModoIndorrecto: TDataSource;
     xFCRModoIncorrectoEMPRESA: TIntegerField;
     xFCRModoIncorrectoEJERCICIO: TIntegerField;
     xFCRModoIncorrectoCANAL: TIntegerField;
     xFCRModoIncorrectoSERIE: TFIBStringField;
     xFCRModoIncorrectoTIPO: TFIBStringField;
     xFCRModoIncorrectoRIG: TIntegerField;
     xFCRModoIncorrectoACREEDOR: TIntegerField;
     xFCRModoIncorrectoNOMBRE_R_SOCIAL: TFIBStringField;
     xFCRModoIncorrectoRIG_VISIBLE: TIntegerField;
     xFCRModoIncorrectoMODO: TIntegerField;
     xFCRModoIncorrectoMODO_IVA: TIntegerField;
     xFCRModoIncorrectoS_BASES: TFloatField;
     xFCRModoIncorrectoS_IVAS: TFloatField;
     xFCRModoIncorrectoFECHA: TDateTimeField;
     xFACModoIncorrecto: TFIBDataSetRO;
     DSxFACModoIncorrecto: TDataSource;
     xFACModoIncorrectoEMPRESA: TIntegerField;
     xFACModoIncorrectoEJERCICIO: TIntegerField;
     xFACModoIncorrectoCANAL: TIntegerField;
     xFACModoIncorrectoSERIE: TFIBStringField;
     xFACModoIncorrectoTIPO: TFIBStringField;
     xFACModoIncorrectoRIG: TIntegerField;
     xFACModoIncorrectoNOMBRE_R_SOCIAL: TFIBStringField;
     xFACModoIncorrectoRIG_VISIBLE: TIntegerField;
     xFACModoIncorrectoMODO: TIntegerField;
     xFACModoIncorrectoMODO_IVA: TIntegerField;
     xFACModoIncorrectoS_BASES: TFloatField;
     xFACModoIncorrectoS_IVAS: TFloatField;
     xFACModoIncorrectoFECHA: TDateTimeField;
     xFACModoIncorrectoCLIENTE: TIntegerField;
     xMod349Pais: TFIBDataSetRO;
     DSxMod349Pais: TDataSource;
     xMod349PaisTIPO_DOC: TFIBStringField;
     xMod349PaisDOC_SERIE: TFIBStringField;
     xMod349PaisDOC_NUMERO: TIntegerField;
     xMod349PaisDOC_FECHA: TDateTimeField;
     xMod349PaisFECHA_REGISTRO: TDateTimeField;
     xMod349PaisB_IMPONIBLE: TFloatField;
     xMod349PaisI_IVA: TFloatField;
     xMod349PaisPAIS: TFIBStringField;
     xMod349Modo: TFIBDataSetRO;
     DSxMod349Modo: TDataSource;
     xMod349ModoTIPO_DOC: TFIBStringField;
     xMod349ModoDOC_SERIE: TFIBStringField;
     xMod349ModoDOC_NUMERO: TIntegerField;
     xMod349ModoDOC_FECHA: TDateTimeField;
     xMod349ModoFECHA_REGISTRO: TDateTimeField;
     xMod349ModoB_IMPONIBLE: TFloatField;
     xMod349ModoI_IVA: TFloatField;
     xMod349ModoPAIS: TFIBStringField;
     xMod349: TFIBDataSetRO;
     DSxMod349: TDataSource;
     xMod349PaisRIG_VISIBLE: TIntegerField;
     xMod349ModoRIG_VISIBLE: TIntegerField;
     xMod349PaisSIGNO: TFIBStringField;
     xMod349ModoSIGNO: TFIBStringField;
     xMod349SIGNO: TFIBStringField;
     xMod349RIG_VISIBLE: TIntegerField;
     xMod349TIPO_DOC: TFIBStringField;
     xMod349DOC_SERIE: TFIBStringField;
     xMod349DOC_NUMERO: TIntegerField;
     xMod349DOC_FECHA: TDateTimeField;
     xMod349FECHA_REGISTRO: TDateTimeField;
     xMod349B_IMPONIBLE: TFloatField;
     xMod349PAIS2: TFIBStringField;
     xAcreedoresIntra: TFIBDataSetRO;
     DSxAcreedoresIntra: TDataSource;
     xAcreedoresIntraEMPRESA: TIntegerField;
     xAcreedoresIntraEJERCICIO: TIntegerField;
     xAcreedoresIntraCANAL: TIntegerField;
     xAcreedoresIntraACREEDOR: TIntegerField;
     xAcreedoresIntraNOMBRE_R_SOCIAL: TFIBStringField;
     xAcreedoresIntraINTRA: TIntegerField;
     xAcreedoresIntraMODO_IVA: TIntegerField;
     xAcreedoresIntraPAIS: TFIBStringField;
     xAcreedoresIntraPERTENECE_CEE: TIntegerField;
     xAcreedoresIntraDIR_COMPLETA_N: TFIBStringField;
     xAcreedoresIntraTITULO: TFIBStringField;
     xAcreedoresIntraTITULO1: TFIBStringField;
     xAutofactura: TFIBDataSetRO;
     DSxAutofactura: TDataSource;
     xAutofacturaEMPRESA: TIntegerField;
     xAutofacturaEJERCICIO: TIntegerField;
     xAutofacturaCANAL: TIntegerField;
     xAutofacturaSERIE: TFIBStringField;
     xAutofacturaTIPO: TFIBStringField;
     xAutofacturaRIG: TIntegerField;
     xAutofacturaID_E: TIntegerField;
     xAutofacturaSERIE_AUTOFACTURA: TFIBStringField;
     xAutofacturaAUTOFACTURA: TIntegerField;
     xAutofacturaRIS: TIntegerField;
     xAutofacturaNOMBRE_R_SOCIAL: TFIBStringField;
     xAutofacturaPROACR: TIntegerField;
     procedure xMod349AfterScroll(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
     FDesdeFecha: TDateTime;
     FHastaFecha: TDateTime;
     Buscando: boolean;
     procedure Posiciona(DataSet: TDataSet; Signo: string; Registro: integer);
  public
     { Public declarations }
     procedure AbreDatosIntraCliente;
     procedure AbreDatosIntraProveedor;
     procedure AbreDatosIntraAcreedor;
     procedure AbreDatosModoIncorrectoCliente;
     procedure AbreDatosModoIncorrectoProveedor;
     procedure AbreDatosModoIncorrectoAcreedor;
     procedure AbreDatosMod349Pais;
     procedure AbreDatosMod349Modo;
     procedure AbreDatosMod349;
     procedure AbreDatosAutofactura;
     function DameRIC(Empresa, Ejercicio, Canal: integer; Signo: string; Registro: integer): integer;
     procedure BuscaSiguienteErrorPais;
     procedure BuscaErrorAnteriorPais;
     procedure BuscaSiguienteErrorModo;
     procedure BuscaErrorAnteriorModo;
     procedure BuscaSiguienteErrorModelo;
     procedure BuscaErrorAnteriorModelo;
     property DesdeFecha: TDateTime Read FDesdeFecha Write FDesdeFecha;
     property HastaFecha: TDateTime Read FHastaFecha Write FHastaFecha;
  end;

var
  DMVerificacionesImpuestos : TDMVerificacionesImpuestos;

implementation

uses UDMMain, UEntorno;

{$R *.dfm}

procedure TDMVerificacionesImpuestos.AbreDatosIntraCliente;
begin
  with xClientesIntra do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;
end;

procedure TDMVerificacionesImpuestos.AbreDatosIntraProveedor;
begin
  with xProveedoresIntra do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;
end;

procedure TDMVerificacionesImpuestos.AbreDatosIntraAcreedor;
begin
  with xAcreedoresIntra do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;
end;

procedure TDMVerificacionesImpuestos.AbreDatosMod349;
begin
  with xMod349 do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['DFECHA'].AsDateTime := FDesdeFecha;
     Params.ByName['HFECHA'].AsDateTime := FHastaFecha;
     Open;
  end;
end;

procedure TDMVerificacionesImpuestos.AbreDatosMod349Modo;
begin
  with xMod349Modo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['DFECHA'].AsDateTime := FDesdeFecha;
     Params.ByName['HFECHA'].AsDateTime := FHastaFecha;
     Open;
  end;
end;

procedure TDMVerificacionesImpuestos.AbreDatosMod349Pais;
begin
  with xMod349Pais do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['DFECHA'].AsDateTime := FDesdeFecha;
     Params.ByName['HFECHA'].AsDateTime := FHastaFecha;
     Open;
  end;
end;

procedure TDMVerificacionesImpuestos.AbreDatosModoIncorrectoAcreedor;
begin
  with xFCRModoIncorrecto do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;
end;

procedure TDMVerificacionesImpuestos.AbreDatosModoIncorrectoCliente;
begin
  with xFACModoIncorrecto do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;
end;

procedure TDMVerificacionesImpuestos.AbreDatosModoIncorrectoProveedor;
begin
  with xFAPModoIncorrecto do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Open;
  end;
end;

procedure TDMVerificacionesImpuestos.Posiciona(DataSet: TDataSet; Signo: string; Registro: integer);
begin
  if (DataSet.Active) then
  begin
     with DataSet do
     begin
        DisableControls;
        First;
        while (not EOF) and ((FieldByName('RIG_VISIBLE').AsInteger <> Registro) or (FieldByName('SIGNO').AsString <> Signo)) do
           Next;
        EnableControls;
     end;
  end;
end;

procedure TDMVerificacionesImpuestos.xMod349AfterScroll(DataSet: TDataSet);
var
  Signo : string;
  Registro : integer;
begin
  if (not Buscando) then
  begin
     Buscando := True;
     Signo := DataSet.FieldByName('SIGNO').AsString;
     Registro := DataSet.FieldByName('RIG_VISIBLE').AsInteger;

     if (DataSet <> xMod349Modo) then
        Posiciona(xMod349Modo, Signo, Registro);

     if (DataSet <> xMod349Pais) then
        Posiciona(xMod349Pais, Signo, Registro);

     if (DataSet <> xMod349) then
        Posiciona(xMod349, Signo, Registro);

     Buscando := False;
  end;
end;

procedure TDMVerificacionesImpuestos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  xFAPModoIncorrectoS_BASES.DisplayFormat := MascaraN;
  xFAPModoIncorrectoS_IVAS.DisplayFormat := MascaraN;
  xFCRModoIncorrectoS_BASES.DisplayFormat := MascaraN;
  xFCRModoIncorrectoS_IVAS.DisplayFormat := MascaraN;
  xFACModoIncorrectoS_BASES.DisplayFormat := MascaraN;
  xFACModoIncorrectoS_IVAS.DisplayFormat := MascaraN;
  xMod349PaisB_IMPONIBLE.DisplayFormat := MascaraN;
  xMod349PaisI_IVA.DisplayFormat := MascaraN;
  xMod349ModoB_IMPONIBLE.DisplayFormat := MascaraN;
  xMod349ModoI_IVA.DisplayFormat := MascaraN;
  xMod349B_IMPONIBLE.DisplayFormat := MascaraN;
  xFAPModoIncorrectoFECHA.DisplayFormat := ShortDateFormat;
  xFCRModoIncorrectoFECHA.DisplayFormat := ShortDateFormat;
  xFACModoIncorrectoFECHA.DisplayFormat := ShortDateFormat;
  xMod349PaisDOC_FECHA.DisplayFormat := ShortDateFormat;
  xMod349PaisFECHA_REGISTRO.DisplayFormat := ShortDateFormat;
  xMod349ModoDOC_FECHA.DisplayFormat := ShortDateFormat;
  xMod349ModoFECHA_REGISTRO.DisplayFormat := ShortDateFormat;
  xMod349DOC_FECHA.DisplayFormat := ShortDateFormat;
  xMod349FECHA_REGISTRO.DisplayFormat := ShortDateFormat;
end;

function TDMVerificacionesImpuestos.DameRIC(Empresa, Ejercicio, Canal: integer; Signo: string; Registro: integer): integer;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT ENLACE_ASIENTO FROM EMP_REGISTRO_IVA WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND SIGNO=?SIGNO AND RIG_VISIBLE=?RIG_VISIBLE';
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['CANAL'].AsInteger := Canal;
        Params.ByName['SIGNO'].AsString := Signo;
        Params.ByName['RIG_VISIBLE'].AsInteger := Registro;
        ExecQuery;
        Result := FieldByName['ENLACE_ASIENTO'].AsInteger;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMVerificacionesImpuestos.BuscaErrorAnteriorPais;
begin
  with xMod349Pais do
  begin
     DisableControls;
     if not (BOF) then
        Prior;
     while ((xMod349PaisSIGNO.AsString = xMod349ModoSIGNO.AsString) and (xMod349PaisRIG_VISIBLE.AsInteger = xMod349ModoRIG_VISIBLE.AsInteger) and
           (xMod349PaisSIGNO.AsString = xMod349SIGNO.AsString) and (xMod349PaisRIG_VISIBLE.AsInteger = xMod349RIG_VISIBLE.AsInteger) and
           (not (BOF))) do
        Prior;
     EnableControls;
  end;
end;

procedure TDMVerificacionesImpuestos.BuscaSiguienteErrorPais;
begin
  with xMod349Pais do
  begin
     DisableControls;
     if not (EOF) then
        Next;
     while ((xMod349PaisSIGNO.AsString = xMod349ModoSIGNO.AsString) and (xMod349PaisRIG_VISIBLE.AsInteger = xMod349ModoRIG_VISIBLE.AsInteger) and
           (xMod349PaisSIGNO.AsString = xMod349SIGNO.AsString) and (xMod349PaisRIG_VISIBLE.AsInteger = xMod349RIG_VISIBLE.AsInteger) and
           (not (EOF))) do
        Next;
     EnableControls;
  end;
end;

procedure TDMVerificacionesImpuestos.BuscaErrorAnteriorModo;
begin
  with xMod349Modo do
  begin
     DisableControls;
     if not (BOF) then
        Prior;
     while ((xMod349PaisSIGNO.AsString = xMod349ModoSIGNO.AsString) and (xMod349PaisRIG_VISIBLE.AsInteger = xMod349ModoRIG_VISIBLE.AsInteger) and
           (xMod349PaisSIGNO.AsString = xMod349SIGNO.AsString) and (xMod349PaisRIG_VISIBLE.AsInteger = xMod349RIG_VISIBLE.AsInteger) and
           (not (BOF))) do
        Prior;
     EnableControls;
  end;
end;

procedure TDMVerificacionesImpuestos.BuscaSiguienteErrorModo;
begin
  with xMod349Modo do
  begin
     DisableControls;
     if not (EOF) then
        Next;
     while ((xMod349PaisSIGNO.AsString = xMod349ModoSIGNO.AsString) and (xMod349PaisRIG_VISIBLE.AsInteger = xMod349ModoRIG_VISIBLE.AsInteger) and
           (xMod349PaisSIGNO.AsString = xMod349SIGNO.AsString) and (xMod349PaisRIG_VISIBLE.AsInteger = xMod349RIG_VISIBLE.AsInteger) and
           (not (EOF))) do
        Next;
     EnableControls;
  end;
end;

procedure TDMVerificacionesImpuestos.BuscaErrorAnteriorModelo;
begin
  with xMod349 do
  begin
     DisableControls;
     if not (BOF) then
        Prior;
     while ((xMod349PaisSIGNO.AsString = xMod349ModoSIGNO.AsString) and (xMod349PaisRIG_VISIBLE.AsInteger = xMod349ModoRIG_VISIBLE.AsInteger) and
           (xMod349PaisSIGNO.AsString = xMod349SIGNO.AsString) and (xMod349PaisRIG_VISIBLE.AsInteger = xMod349RIG_VISIBLE.AsInteger) and
           (not (BOF))) do
        Prior;
     EnableControls;
  end;
end;

procedure TDMVerificacionesImpuestos.BuscaSiguienteErrorModelo;
begin
  with xMod349 do
  begin
     DisableControls;
     if not (EOF) then
        Next;
     while ((xMod349PaisSIGNO.AsString = xMod349ModoSIGNO.AsString) and (xMod349PaisRIG_VISIBLE.AsInteger = xMod349ModoRIG_VISIBLE.AsInteger) and
           (xMod349PaisSIGNO.AsString = xMod349SIGNO.AsString) and (xMod349PaisRIG_VISIBLE.AsInteger = xMod349RIG_VISIBLE.AsInteger) and
           (not (EOF))) do
        Next;
     EnableControls;
  end;
end;

procedure TDMVerificacionesImpuestos.AbreDatosAutofactura;
begin
  with xAutofactura do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['DFECHA'].AsDateTime := FDesdeFecha;
     Params.ByName['HFECHA'].AsDateTime := FHastaFecha;
     Open;
  end;
end;

end.
