unit UDMLstInformeMoldes;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FR_DSet, FR_DBSet, FR_Class, DB, FIBDataSet,
  FIBDatabase, UFIBModificados, FIBDataSetRO, Fr_HYReport, FIBQuery,
  HYFIBQuery, StrUtils, FIBDataSetRW;

type
  TDMLstInformeMoldes = class(TDataModule)
     frDBlstMoldesDet: TfrDBDataSet;
     TLocal: THYTransaction;
     frListadoN: TfrHYReport;
     QTemp: THYFIBQuery;
     QMCabecera: TFIBDataSetRO;
     DSCabecera: TDataSource;
     DSDetalle: TDataSource;
     QMDetalle: TFIBDataSetRO;
     QMCabeceraEMPRESA: TIntegerField;
     QMCabeceraNUM_MOLDE: TFIBStringField;
     QMCabeceraPROPIETARIO: TIntegerField;
     QMCabeceraALTO: TIntegerField;
     QMCabeceraLARGO: TIntegerField;
     QMCabeceraANCHO: TIntegerField;
     QMCabeceraTIPO_BOQUILLA: TIntegerField;
     QMCabeceraDIAMETRO_EXPULSOR: TIntegerField;
     QMCabeceraTIPO_INYECCION: TIntegerField;
     QMCabeceraNUM_CAVIDADES: TIntegerField;
     QMCabeceraFECHA_LLEGADA: TDateTimeField;
     QMCabeceraFECHA_SALIDA: TDateTimeField;
     QMCabeceraACTIVO: TIntegerField;
     QMCabeceraDESCRIPCION: TFIBStringField;
     QMCabeceraID_UBICACION: TIntegerField;
     QMCabeceraARO_CENTRADOR: TIntegerField;
     QMCabeceraIMAGEN: TIntegerField;
     QMCabeceraCORREDERAS: TIntegerField;
     QMCabeceraNOYOS: TIntegerField;
     QMCabeceraTIPO_NOYO: TIntegerField;
     QMCabeceraFABRICADO: TIntegerField;
     QMCabeceraFABRICANTE: TIntegerField;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleNUM_MOLDE: TFIBStringField;
     QMDetalleLINEA: TIntegerField;
     QMDetalleFECHA_DETECCION: TDateTimeField;
     QMDetalleFECHA_REPARACION: TDateTimeField;
     QMDetalleDESCRIPCION: TFIBStringField;
     QMDetalleCOMENTARIO: TFIBStringField;
     QMDetalleLABORATORIO: TFIBStringField;
     QMDetalleCOSTE_REP: TFloatField;
     QMDetalleTALLER: TIntegerField;
     QMDetalleNOTAS: TBlobField;
     frDBlstMoldesCab: TfrDBDataSet;
     procedure DataModuleCreate(Sender: TObject);
     procedure frListadoNGetValue(const ParName: string; var ParValue: variant);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
     Comentario: string;
     FechaListado: TDateTime;
  public
     { Public declarations }
     UtilizaLinea: integer;
     function BuscaDesc(Tabla, campo1, campo2: string): string;
     procedure MostrarListado(grupo, molde, linea, tipo: integer; aComentario: string; aFechaListado: TDateTime);
  end;

var
  DMLstInformeMoldes : TDMLstInformeMoldes;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, UFMLstInformeMoldes;

{$R *.dfm}

function TDMLstInformeMoldes.BuscaDesc(Tabla, campo1, campo2: string): string;
begin
  if ((Tabla = 'EMP_MOLDES') and (campo1 <> '')) then
  begin
     with QTemp do
     begin
        SQL.Clear;
        SQL.Add('Select DESCRIPCION from EMP_MOLDES where EMPRESA=?EMPRESA and NUM_MOLDE=?NUM_MOLDE');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['NUM_MOLDE'].AsInteger := StrToInt(campo1);
        ExecQuery;
     end;
     Result := QTemp.FieldByName['DESCRIPCION'].AsString;
  end;

  if ((Tabla = 'EMP_MOLDES_REPARACIONES') and (campo1 <> '') and (campo2 <> '')) then
  begin
     with QTemp do
     begin
        SQL.Clear;
        SQL.Add('Select DESCRIPCION from EMP_MOLDES_REPARACIONES where EMPRESA=?EMPRESA and NUM_MOLDE=?NUM_MOLDE');
        SQL.Add('and linea=?linea');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['NUM_MOLDE'].AsInteger := StrToInt(campo1);
        Params.ByName['LINEA'].AsInteger := StrToInt(campo2);
        ExecQuery;
     end;
     Result := QTemp.FieldByName['DESCRIPCION'].AsString;
  end;
end;

procedure TDMLstInformeMoldes.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
  UtilizaLinea := 1;
end;

procedure TDMLstInformeMoldes.MostrarListado(grupo, molde, linea, tipo: integer; aComentario: string; aFechaListado: TDateTime);
var
  str : string;
begin
  Comentario := aComentario;
  FechaListado := aFechaListado;
  with QMCabecera do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['NUM_MOLDE'].AsInteger := molde;
     Open;
  end;

  if (Utilizalinea = 1) then
  begin
     with QMDetalle do
     begin
        Close;
        SelectSQL.Text := 'SELECT * FROM emp_moldes_reparaciones where ' +
           'empresa = ?empresa and num_molde=?num_molde and linea= ?linea';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['NUM_MOLDE'].AsInteger := molde;
        Params.ByName['LINEA'].AsInteger := linea;
        Open;
     end;
  end
  else
  begin
     with QMDetalle do
     begin
        Close;
        SelectSQL.Text := 'SELECT * FROM emp_moldes_reparaciones where ' +
           'empresa = ?empresa and num_molde=?num_molde';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['NUM_MOLDE'].AsInteger := molde;
        Open;
     end;
  end;

  DMListados.Imprimir(grupo, tipo, '', str, frListadoN, nil);
end;

procedure TDMLstInformeMoldes.frListadoNGetValue(const ParName: string; var ParValue: variant);
begin
  if Trim(ParName) = 'Comentario' then
     ParValue := Comentario;
  if Trim(ParName) = 'FechaListado' then
     ParValue := FechaListado;
end;

procedure TDMLstInformeMoldes.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

end.
