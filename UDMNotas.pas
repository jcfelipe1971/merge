unit UDMNotas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBQuery, HYFIBQuery;

type
  TDMNotas = class(TDataModule)
     TLocal: THYTransaction;
     QMNotas: TFIBTableSet;
     DSQMNotas: TDataSource;
     QMNotasDetalle: TFIBTableSet;
     DSQMNotasDetalle: TDataSource;
     QMNotasID_NOTA: TIntegerField;
     QMNotasNUMERO_NOTA: TIntegerField;
     QMNotasEMPRESA: TIntegerField;
     QMNotasEJERCICIO: TIntegerField;
     QMNotasCANAL: TIntegerField;
     QMNotasRIC: TIntegerField;
     QMNotasASIENTO: TIntegerField;
     QMNotasVISIBLE: TIntegerField;
     QMNotasFECHA: TDateTimeField;
     QMNotasNOTA: TBlobField;
     QMNotasDetalleID_NOTA: TIntegerField;
     QMNotasDetalleCUENTA: TFIBStringField;
     QMNotasNOTA_TEXTO: TStringField;
     QMNotasDetallePGC: TIntegerField;
     QMNotasDetalleTITULO: TFIBStringField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMNotasBeforePost(DataSet: TDataSet);
     procedure QMNotasAfterOpen(DataSet: TDataSet);
     procedure QMNotasBeforeClose(DataSet: TDataSet);
     procedure QMNotasNewRecord(DataSet: TDataSet);
     procedure QMNotasDetalleNewRecord(DataSet: TDataSet);
     procedure QMNotasNOTA_TEXTOGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
     Asiento, Ric, Empresa, Ejercicio, Canal: integer;
     Fecha: TDateTime;
  public
     { Public declarations }
     procedure AbreNotas(aAsiento, aRic, aEmpresa, aEjercicio, aCanal: integer; aFecha: TDateTime);
     procedure Renumerar;
  end;

var
  DMNotas : TDMNotas;

implementation

uses UDMMain, UEntorno, DateUtils;

{$R *.dfm}

procedure TDMNotas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMNotas.Graba(DataSet: TDataSet);
begin
  DataSet.Refresh;
end;

procedure TDMNotas.QMNotasBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_GEN(DataSet, 'CONTA_NOTAS', 'ID_NOTA');
end;

procedure TDMNotas.QMNotasAfterOpen(DataSet: TDataSet);
begin
  QMNotasDetalle.Open;
end;

procedure TDMNotas.QMNotasBeforeClose(DataSet: TDataSet);
begin
  QMNotasDetalle.Close;
end;

procedure TDMNotas.QMNotasNewRecord(DataSet: TDataSet);
begin
  QMNotasASIENTO.AsInteger := Asiento;
  QMNotasRIC.AsInteger := Ric;
  QMNotasEMPRESA.AsInteger := Empresa;
  QMNotasEJERCICIO.AsInteger := Ejercicio;
  QMNotasCANAL.AsInteger := Canal;
  QMNotasVisible.AsInteger := 1;
  QMNotasFECHA.AsDateTime := RecodeTime(Fecha, 0, 0, 0, 0);
end;

procedure TDMNotas.AbreNotas(aAsiento, aRic, aEmpresa, aEjercicio, aCanal: integer; aFecha: TDateTime);
begin
  Asiento := aAsiento;
  Fecha := aFecha;
  Ric := aRic;
  Empresa := aEmpresa;
  Ejercicio := aEjercicio;
  Canal := aCanal;

  // DMMain.FiltraTabla(QMNotas, '11100', False);
  QMNotas.Params.ByName['EMPRESA'].AsInteger := Empresa;
  QMNotas.Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
  QMNotas.Params.ByName['CANAL'].AsInteger := Canal;
  QMNotas.Params.ByName['ASIENTO'].AsInteger := Asiento;
  QMNotas.Open;
end;

procedure TDMNotas.QMNotasDetalleNewRecord(DataSet: TDataSet);
begin
  QMNotasDetalleID_NOTA.AsInteger := QMNotasID_NOTA.AsInteger;
  QMNotasDetallePGC.AsInteger := REntorno.Pgc;
end;

procedure TDMNotas.Renumerar;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE CON_NOTAS_RENUMERA(?EMPRESA, ?EJERCICIO, ?CANAL)';
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
        Params.ByName['CANAL'].AsInteger := Canal;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMNotas.Refresh;
end;

procedure TDMNotas.QMNotasNOTA_TEXTOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := Copy(QMNotasNOTA.AsString, 1, 20);
end;

end.
