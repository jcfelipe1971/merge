unit UDMMemoriaContable;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, frxClass, frxHYReport, UHYReportMail, UHYReport,
  FR_Class, Fr_HYReport, FIBDatabase, UFIBModificados, HYFIBQuery,
  frxDBSet, DB, FIBDataSetRO, FR_DSet, FR_DBSet, FIBDataSet,
  FIBTableDataSet;

type
  TDMMemoriaContable = class(TDataModule)
     TLocal: THYTransaction;
     frMemoriaContable: TfrHYReport;
     HYRMemoriaContable: THYReport;
     HYMMemoriaContable: THYReportMail;
     frDBEmpresa: TfrDBDataSet;
     QMEmpresa: TFIBDataSetRO;
     DSQMEmpresa: TDataSource;
     HYRSEmpresa: THYReportSource;
     frxDBEmpresa: TfrxDBDataset;
     TUpdate: THYTransaction;
     DSQMVarCab: TDataSource;
     DSQMVarCTA: TDataSource;
     QMVarCTA: TFIBTableSet;
     QMVarCab: TFIBTableSet;
     QMVarCabEMPRESA: TIntegerField;
     QMVarCabEJERCICIO: TIntegerField;
     QMVarCabCANAL: TIntegerField;
     QMVarCabVAR: TFIBStringField;
     QMVarCabTITULO: TFIBStringField;
     QMVarCTAEMPRESA: TIntegerField;
     QMVarCTAEJERCICIO: TIntegerField;
     QMVarCTACANAL: TIntegerField;
     QMVarCTACUENTA: TFIBStringField;
     QMVarCTAVAR: TFIBStringField;
     QMVarCTASALDO: TCurrencyField;
     frxMemoriaContable: TfrxHYReport;
     procedure DataModuleCreate(Sender: TObject);
     procedure frMemoriaContableGetValue(const ParName: string; var ParValue: variant);
     procedure DataModuleDestroy(Sender: TObject);
     procedure frxMemoriaContableGetValue(const VarName: string; var Value: variant);
     procedure QMVarCabAfterOpen(DataSet: TDataSet);
     procedure QMVarCabNewRecord(DataSet: TDataSet);
     procedure QMVarCTANewRecord(DataSet: TDataSet);
     procedure QMVarCabBeforeClose(DataSet: TDataSet);
     procedure QMVarCTACalcFields(DataSet: TDataSet);
  private
     { Private declarations }
     Grupo: integer;
     function DameSaldo(Cuenta, aPeriodo: string): double;
  public
     { Public declarations }
     CalcularSaldos: boolean;
     Periodo: string;
     procedure MostrarInforme(Modo: smallint; Titulo: string; FechaListado: TDateTime);
     procedure RefrescarSaldos;
  end;

var
  DMMemoriaContable : TDMMemoriaContable;

implementation

uses UDMMain, UFormGest, UDMListados, UEntorno, Variants, UUtiles;

{$R *.dfm}

procedure TDMMemoriaContable.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;

  Grupo := 634;
  AbreData(TDMListados, DMListados);

  QMVarCTASALDO.DisplayFormat := MascaraN;
  CalcularSaldos := False;
  Periodo := '00';

  DMMain.FiltraRO(QMEmpresa, '111000', False);
  DMMain.FiltraTabla(QMVarCab, '111000', False);
  QMVarCab.Open;
end;

procedure TDMMemoriaContable.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TDMMemoriaContable.frMemoriaContableGetValue(const ParName: string; var ParValue: variant);
var
  Variable : string;
begin
  // Parámetros comunes
  DMListados.GetValue(ParName, ParValue);

  // Si no es un parámetro comun lo calculo
  if (VarType(ParValue) = varEmpty) or (VarType(ParValue) = varNull) then
  begin
     if (Copy(ParName, 1, 1) = '&') then
     begin
        Variable := Copy(ParName, 2, Length(ParName));

        // ParValue := '*** ' + Variable + ' ***';

        // Sumo los saldos de las cuentas de ultimo nivel desde la apertura hasta el período pedido.
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT SUM(S.SALDO) ');
              SQL.Add(' FROM CON_CUENTAS_SALDOS S ');
              SQL.Add(' JOIN CON_MEMORIA_CONTABLE_VAR_CTA V ON S.EMPRESA = V.EMPRESA AND S.EJERCICIO = V.EJERCICIO AND S.CANAL = V.CANAL AND S.CUENTA STARTING WITH V.CUENTA ');
              SQL.Add(' WHERE ');
              SQL.Add(' V.EMPRESA = :EMPRESA AND ');
              SQL.Add(' V.EJERCICIO = :EJERCICIO AND ');
              SQL.Add(' V.CANAL = :CANAL AND ');
              SQL.Add(' V.VAR = :VAR AND ');
              SQL.Add(' S.NIVEL = 5 AND ');
              SQL.Add(' S.PERIODO <= :PERIODO ');
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['VAR'].AsString := UpperCase(Variable);
              Params.ByName['PERIODO'].AsString := Periodo;
              ExecQuery;
              ParValue := FieldByName['SUM'].AsFloat;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;
  end;
end;

function TDMMemoriaContable.DameSaldo(Cuenta, aPeriodo: string): double;
begin
  /// Devuelve la suma de saldos de las cuentas que empiezan por CUENTA.
  /// Toma todos los periodos desde la apertura hasta el APERIODO pedido.

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT SUM(SALDO) ');
        SQL.Add(' FROM CON_CUENTAS_SALDOS  ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' NIVEL = 5 AND ');
        SQL.Add(' CUENTA STARTING WITH :CUENTA AND');
        SQL.Add(' PERIODO <= :PERIODO ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['CUENTA'].AsString := Cuenta;
        Params.ByName['PERIODO'].AsString := aPeriodo;
        ExecQuery;
        Result := FieldByName['SUM'].AsFloat;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMMemoriaContable.frxMemoriaContableGetValue(const VarName: string; var Value: variant);
begin
  frMemoriaContableGetValue(VarName, Value);
end;

procedure TDMMemoriaContable.MostrarInforme(Modo: smallint; Titulo: string; FechaListado: TDateTime);
begin
  DMMain.FiltraRO(QMEmpresa, '111000', False);
  QMEmpresa.Params.ByName['PERIODO'].AsString := Periodo;
  QMEmpresa.Open;

  DMListados.DatosInforme(FechaListado, Titulo);
  DMListados.Imprimir(Grupo, 0, Modo, REntorno.Serie, Titulo, frMemoriaContable, frxMemoriaContable, HYRMemoriaContable);
end;

procedure TDMMemoriaContable.QMVarCabAfterOpen(DataSet: TDataSet);
begin
  QMVarCTA.Open;
end;

procedure TDMMemoriaContable.QMVarCabBeforeClose(DataSet: TDataSet);
begin
  QMVarCTA.Close;
end;

procedure TDMMemoriaContable.QMVarCabNewRecord(DataSet: TDataSet);
begin
  QMVarCabEMPRESA.AsInteger := REntorno.Empresa;
  QMVarCabEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMVarCabCANAL.AsInteger := REntorno.Canal;
end;

procedure TDMMemoriaContable.QMVarCTANewRecord(DataSet: TDataSet);
begin
  QMVarCTAEMPRESA.AsInteger := REntorno.Empresa;
  QMVarCTAEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMVarCTACANAL.AsInteger := REntorno.Canal;
  QMVarCTAVAR.AsString := QMVarCabVAR.AsString;
end;

procedure TDMMemoriaContable.QMVarCTACalcFields(DataSet: TDataSet);
begin
  if CalcularSaldos then
     QMVarCTASALDO.AsFloat := DameSaldo(QMVarCTACUENTA.AsString, Periodo)
  else
     QMVarCTASALDO.AsFloat := 0;
end;

procedure TDMMemoriaContable.RefrescarSaldos;
begin
  Refrescar(QMVarCTA, 'CUENTA', QMVarCTACUENTA.AsString);
end;

end.
