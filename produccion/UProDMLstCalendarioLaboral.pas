unit UProDMLstCalendarioLaboral;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSetRO,
  FR_Class, Fr_HYReport, FIBDataSet, FR_DSet, FR_DBSet, FIBQuery,
  HYFIBQuery, frxClass, frxHYReport;

type
  TProDMLstCalendarioLaboral = class(TDataModule)
     TLocal: THYTransaction;
     frCalendarioLaboral: TfrHYReport;
     QMLstCalendarioLaboral: TFIBDataSetRO;
     DSQMLstCalendarioLaboral: TDataSource;
     frDBCalendarioLaboral: TfrDBDataSet;
     frxCalendarioLaboral: TfrxHYReport;
     frDBMarcajePresencia: TfrDBDataSet;
     DSMarcajePresencia: TDataSource;
     xMarcajePresencia: TFIBDataSetRO;
     frDBResumenIncidencia: TfrDBDataSet;
     DSResumenIncidencia: TDataSource;
     QMResumenIncidencia: TFIBDataSetRO;
     procedure DataModuleCreate(Sender: TObject);
     procedure CalendarioLaboralGetValue(const ParName: string; var ParValue: variant);
     procedure DataModuleDestroy(Sender: TObject);
     procedure CalendarioLaboralBeforePrint(Memo: TStringList; View: TfrView);
     procedure QMLstCalendarioLaboralBeforeOpen(DataSet: TDataSet);
     procedure QMLstCalendarioLaboralBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
     FechaDesde, FechaHasta: TDateTime;
  public
     { Public declarations }
     procedure MostrarListado(Modo, OperarioD, OperarioH: integer; aFechaDesde, aFechaHasta: TDateTime; Comentario: string; FechaListado: TDateTime);
  end;

var
  ProDMLstCalendarioLaboral : TProDMLstCalendarioLaboral;

implementation

uses UDMMain, UDMListados, UFormGest, UEntorno, DateUtils;

{$R *.dfm}

{ TProDMLstCalendarioLaboral }

procedure TProDMLstCalendarioLaboral.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);
end;

procedure TProDMLstCalendarioLaboral.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TProDMLstCalendarioLaboral.MostrarListado(Modo, OperarioD, OperarioH: integer; aFechaDesde, aFechaHasta: TDateTime; Comentario: string; FechaListado: TDateTime);
begin
  // Valores a variables que pueden llamarse desde el listado
  FechaDesde := aFechaDesde;
  FechaHasta := RecodeTime(aFechaHasta, 23, 59, 59, 999);
  DMListados.DatosInforme(FechaListado, Comentario);

  with QMLstCalendarioLaboral do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['OPERARIO_DESDE'].AsInteger := OperarioD;
     Params.ByName['OPERARIO_HASTA'].AsInteger := OperarioH;
     Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
     Params.ByName['FECHA_HASTA'].AsDateTime := FechaHasta;
     Open;
  end;

  DMListados.Imprimir(172, 0, Modo, '', '', frCalendarioLaboral, frxCalendarioLaboral, nil, nil);
end;

procedure TProDMLstCalendarioLaboral.CalendarioLaboralGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if (ParName = 'FechaDesde') then
     ParValue := FechaDesde;

  if (ParName = 'FechaHasta') then
     ParValue := FechaHasta;

  if (ParName = 'Resumen') then
  begin
     with QMResumenIncidencia do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := QMLstCalendarioLaboral.FieldByName('EMPRESA').AsInteger;
        Params.ByName['OPERARIO'].AsInteger := QMLstCalendarioLaboral.FieldByName('OPERARIO').AsInteger;
        Params.ByName['FECHA_DESDE'].AsDateTime := FechaDesde;
        Params.ByName['FECHA_HASTA'].AsDateTime := FechaHasta;
        Open;
     end;

     ParValue := '';
  end;
end;

procedure TProDMLstCalendarioLaboral.CalendarioLaboralBeforePrint(Memo: TStringList; View: TfrView);
begin
  DMListados.BeforePrint(Memo, View);
end;

procedure TProDMLstCalendarioLaboral.QMLstCalendarioLaboralBeforeOpen(DataSet: TDataSet);
begin
  xMarcajePresencia.Open;
end;

procedure TProDMLstCalendarioLaboral.QMLstCalendarioLaboralBeforeClose(DataSet: TDataSet);
begin
  xMarcajePresencia.Close;
end;

end.
