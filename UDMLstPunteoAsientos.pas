unit UDMLstPunteoAsientos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, frxClass, frxHYReport, UHYReport, DB, FIBDataSet,
  FIBDatabase, UFIBModificados, FIBDataSetRO, FR_DSet, FR_DBSet, FR_Class,
  Fr_HYReport;

type
  TDMLstPunteoAsientos = class(TDataModule)
     frPunteo: TfrHYReport;
     frDBPunteos: TfrDBDataSet;
     frDBNorma43: TfrDBDataSet;
     QMPunteos: TFIBDataSetRO;
     DSQMPunteos: TDataSource;
     QMNorma43: TFIBDataSetRO;
     DSQMNorma43: TDataSource;
     TLocal: THYTransaction;
     QMPunteosEMPRESA: TIntegerField;
     QMPunteosEJERCICIO: TIntegerField;
     QMPunteosCANAL: TIntegerField;
     QMPunteosRIC: TIntegerField;
     QMPunteosLINEA: TIntegerField;
     QMPunteosCUENTA: TFIBStringField;
     QMPunteosSIGNO: TFIBStringField;
     QMPunteosTEXTO: TFIBStringField;
     QMPunteosIMPORTE: TFloatField;
     QMPunteosDOC_NUMERO: TIntegerField;
     QMPunteosDOC_SERIE: TFIBStringField;
     QMPunteosDOC_FECHA: TDateTimeField;
     QMPunteosFECHA: TDateTimeField;
     QMPunteosASIENTO: TIntegerField;
     QMPunteosPUNTEO: TIntegerField;
     QMPunteosFECHA_PUNTEO: TDateTimeField;
     QMPunteosRELACIONES: TIntegerField;
     QMNorma43ID: TIntegerField;
     QMNorma43ID_CAB: TIntegerField;
     QMNorma43COD_DATO: TIntegerField;
     QMNorma43CONCEPTO1: TFIBStringField;
     QMNorma43CONCEPTO2: TFIBStringField;
     QMNorma43LINEA_IMPORTADA: TFIBStringField;
     QMNorma43ID1: TIntegerField;
     QMNorma43EMPRESA: TIntegerField;
     QMNorma43OFICINA: TFIBStringField;
     QMNorma43FECHA_OPERACION: TDateTimeField;
     QMNorma43FECHA_VALOR: TDateTimeField;
     QMNorma43CONCEPTO_COMUN: TIntegerField;
     QMNorma43CONCEPTO_PROPIO: TIntegerField;
     QMNorma43SIGNO: TFIBStringField;
     QMNorma43IMPORTE: TFloatField;
     QMNorma43DOC_NUMERO: TIntegerField;
     QMNorma43REFERENCIA1: TFIBStringField;
     QMNorma43REFERENCIA2: TFIBStringField;
     QMNorma43PUNTEO: TIntegerField;
     QMNorma43LINEA_IMPORTADA1: TFIBStringField;
     QMNorma43BANCO: TIntegerField;
     HYReport: THYReport;
     frxPunteo: TfrxHYReport;
     procedure QMPunteosAfterOpen(DataSet: TDataSet);
     procedure QMPunteosBeforeClose(DataSet: TDataSet);
     procedure frPunteoGetValue(const ParName: string; var ParValue: variant);
     procedure frxPunteoGetValue(const VarName: string; var Value: variant);
     procedure HYReportEnterFields(Sender: THYReport; Field: THYField; var Source: string);
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frPunteoBeforePrint(Memo: TStringList; View: TfrView);
     procedure frxPunteoBeforePrint(Sender: TfrxReportComponent);
  private
     { Private declarations }
     Pagina: integer;
     Cuenta: string;
     Desde, Hasta: TDateTime;
  public
     { Public declarations }
     procedure MostrarListado(aCuenta: string; aDesde, aHasta: TDateTime; Modo: byte);
  end;

var
  DMLstPunteoAsientos : TDMLstPunteoAsientos;

implementation

uses UDMMain, UEntorno, UDMListados, UFormGest, UUtiles;

{$R *.dfm}

{ TDMLstPunteoAsientos }

procedure TDMLstPunteoAsientos.DataModuleCreate(Sender: TObject);
begin
  // Abrir la transacción local
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TDMLstPunteoAsientos.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMLstPunteoAsientos.MostrarListado(aCuenta: string; aDesde, aHasta: TDateTime; Modo: byte);
var
  str : string;
  grupo, i : integer;
begin
  Cuenta := aCuenta;
  Desde := aDesde;
  Hasta := HourIntoDate(aHasta, '23:59:59');

  with QMPunteos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['CUENTA'].AsString := Cuenta;
     Params.ByName['DFECHA'].AsDateTime := Desde;
     Params.ByName['HFECHA'].AsDateTime := Hasta;
     Open;
  end;

  grupo := 171;
  DMListados.Cargar(grupo, '');

  if (REntorno.TipoListado = 'FRF') then
  begin
     frPunteo.LoadFromFIB(REntorno.Formato, str);
     frPunteo.PrepareReport;
     case Modo of
        0:
        begin
           frPunteo.DefaultCopies := REntorno.Copias;
           frPunteo.ShowPreparedReport;
        end;
        1: frPunteo.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end
  else if (REntorno.TipoListado = 'FR3') then
  begin
     frxPunteo.LoadFromFIB(REntorno.Formato, str);
     frxPunteo.PrepareReport;
     case Modo of
        0:
        begin
           frxPunteo.PrintOptions.Copies := REntorno.Copias;
           frxPunteo.ShowPreparedReport;
        end;
        1: frxPunteo.PrintPreparedReport(' ', REntorno.Copias);
     end;
  end
  else if (REntorno.TipoListado = 'HYR') then
  begin
     Pagina := 0;
     HYReport.LoadFromFIB(REntorno.Formato, str);
     HYReport.Prepare;
     case Modo of
        0: HYReport.Preview;
        1: for i := 1 to REntorno.Copias do
              HYReport.Print(REntorno.NombreMatricial);
     end;
  end;
  DMListados.LimpiaEntorno;
  DMListados.Copias := 0;
end;

procedure TDMLstPunteoAsientos.QMPunteosAfterOpen(DataSet: TDataSet);
begin
  QMNorma43.Open;
end;

procedure TDMLstPunteoAsientos.QMPunteosBeforeClose(DataSet: TDataSet);
begin
  QMNorma43.Close;
end;

procedure TDMLstPunteoAsientos.frPunteoGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if (ParName = 'Cuenta') then
     ParValue := Cuenta;
  if (ParName = 'Desde') then
     ParValue := Desde;
  if (ParName = 'Hasta') then
     ParValue := Hasta;
end;

procedure TDMLstPunteoAsientos.frxPunteoGetValue(const VarName: string; var Value: variant);
begin
  frPunteoGetValue(VarName, Value);
end;

procedure TDMLstPunteoAsientos.HYReportEnterFields(Sender: THYReport; Field: THYField; var Source: string);
begin
  if Source = '[EMPRESA]' then
     Source := REntorno.NombreEmpresa;

  if Source = '[NIF_EMPRESA]' then
     Source := REntorno.CifEmpresa;

  if Source = '[DIR_EMPRESA]' then
     Source := REntorno.DirEmpresa + #13#10 + REntorno.PobEmpresa +
        ' (' + REntorno.ProvEmpresa + ' - ' + REntorno.Pais + ')';

  if Source = '[TELF_EMPRESA]' then
     Source := REntorno.Tel1Empresa;

  if Source = '[CUENTA]' then
     Source := Cuenta;

  if Source = '[DESDE]' then
     Source := DateToStr(Desde);

  if Source = '[HASTA]' then
     Source := DateToStr(Hasta);
end;

procedure TDMLstPunteoAsientos.frPunteoBeforePrint(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);
  end;
end;

procedure TDMLstPunteoAsientos.frxPunteoBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);
end;

end.
