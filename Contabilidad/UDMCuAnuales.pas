unit UDMCuAnuales;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Classes, Forms, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  FIBDatabase, UFIBModificados, FR_Class, Fr_HYReport, FR_DSet, FR_DBSet,
  HYFIBQuery, FIBDataSetRO, Graphics, frxClass, frxHYReport;

type
  TDMCuAnuales = class(TDataModule)
     QMCuentasAn: TFIBTableSet;
     DSQMCuentasAn: TDataSource;
     QMCuentasAnEMPRESA: TIntegerField;
     QMCuentasAnCANAL: TIntegerField;
     QMCuentasAnEJERCICIO: TIntegerField;
     QMCuentasAnPERIODO: TFIBStringField;
     QMCuentasAnDESDE: TDateTimeField;
     QMCuentasAnHASTA: TDateTimeField;
     QMCuentasAnBALANCE: TIntegerField;
     QMCuentasAnB_TITULO: TFIBStringField;
     TLocal: THYTransaction;
     frDBCuentasAn: TfrDBDataSet;
     frHYCuentasAn: TfrHYReport;
     xVerBalanceHaber: TFIBDataSetRO;
     xVerBalanceDebe: TFIBDataSetRO;
     DSxHaber: TDataSource;
     DSxDebe: TDataSource;
     frDBHaber: TfrDBDataSet;
     frDBDebe: TfrDBDataSet;
     xVerBalanceDebeCuentas: TFIBDataSetRO;
     xVerBalanceHaberCuentas: TFIBDataSetRO;
     DSxVerBalanceHaberCuentas: TDataSource;
     DSxVerBalanceDebeCuentas: TDataSource;
     frDBxVerBalanceDebeCuentas: TfrDBDataSet;
     frDBxVerBalanceHaberCuentas: TfrDBDataSet;
     QMCuentasAnTIPO: TIntegerField;
     QMCuentasAnP_TITULO: TFIBStringField;
     QMCuentasAnMONEDA: TFIBStringField;
     xMonedasListado: TFIBDataSetRO;
     FIBStringField1: TFIBStringField;
     FIBStringField2: TFIBStringField;
     FIBStringField3: TFIBStringField;
     IntegerField1: TIntegerField;
     IntegerField2: TIntegerField;
     IntegerField3: TIntegerField;
     DSxMonedasListado: TDataSource;
     QMCuentasAnENTRADA: TIntegerField;
     xVerBalanceDebeCtaFin: TFIBDataSetRO;
     xVerBalanceHaberCtaFin: TFIBDataSetRO;
     DSxVerBalanceHaberCtaFin: TDataSource;
     DSxVerBalanceDebeCtaFin: TDataSource;
     frDBxVerBalanceDebeCtaFin: TfrDBDataSet;
     frDBxVerBalanceHaberCtaFin: TfrDBDataSet;
     frxHYCuentasAn: TfrxHYReport;
     xNotas: TFIBDataSetRO;
     DSxNotas: TDataSource;
     frDBxNotas: TfrDBDataSet;
     xNotasID_NOTA: TIntegerField;
     xNotasNUMERO_NOTA: TIntegerField;
     xNotasEMPRESA: TIntegerField;
     xNotasEJERCICIO: TIntegerField;
     xNotasCANAL: TIntegerField;
     xNotasRIC: TIntegerField;
     xNotasASIENTO: TIntegerField;
     xNotasVISIBLE: TIntegerField;
     xNotasFECHA: TDateTimeField;
     xNotasNOTA: TBlobField;
     xVerBalanceHaberEMPRESA: TIntegerField;
     xVerBalanceHaberCANAL: TIntegerField;
     xVerBalanceHaberEJERCICIO: TIntegerField;
     xVerBalanceHaberPERIODO: TFIBStringField;
     xVerBalanceHaberBALANCE: TIntegerField;
     xVerBalanceHaberCLAVE: TFIBStringField;
     xVerBalanceHaberORDEN: TIntegerField;
     xVerBalanceHaberTITULO: TFIBStringField;
     xVerBalanceHaberTIPO: TFIBStringField;
     xVerBalanceHaberGRUPO: TFIBStringField;
     xVerBalanceHaberANTERIOR: TFloatField;
     xVerBalanceHaberACTUAL: TFloatField;
     xVerBalanceHaberDIFERENCIA: TFloatField;
     xVerBalanceHaberPORCENTUAL: TFloatField;
     xVerBalanceHaberACTIVO: TIntegerField;
     xVerBalanceDebeEMPRESA: TIntegerField;
     xVerBalanceDebeCANAL: TIntegerField;
     xVerBalanceDebeEJERCICIO: TIntegerField;
     xVerBalanceDebePERIODO: TFIBStringField;
     xVerBalanceDebeBALANCE: TIntegerField;
     xVerBalanceDebeCLAVE: TFIBStringField;
     xVerBalanceDebeORDEN: TIntegerField;
     xVerBalanceDebeTITULO: TFIBStringField;
     xVerBalanceDebeTIPO: TFIBStringField;
     xVerBalanceDebeGRUPO: TFIBStringField;
     xVerBalanceDebeANTERIOR: TFloatField;
     xVerBalanceDebeACTUAL: TFloatField;
     xVerBalanceDebeDIFERENCIA: TFloatField;
     xVerBalanceDebePORCENTUAL: TFloatField;
     xVerBalanceDebeACTIVO: TIntegerField;
     xVerBalanceDebeCtaFinEMPRESA: TIntegerField;
     xVerBalanceDebeCtaFinEJERCICIO: TIntegerField;
     xVerBalanceDebeCtaFinCANAL: TIntegerField;
     xVerBalanceDebeCtaFinPERIODO: TFIBStringField;
     xVerBalanceDebeCtaFinBALANCE: TIntegerField;
     xVerBalanceDebeCtaFinCLAVE: TFIBStringField;
     xVerBalanceDebeCtaFinCUENTA: TFIBStringField;
     xVerBalanceDebeCtaFinCUENTA_FINAL: TFIBStringField;
     xVerBalanceDebeCtaFinTITULO: TFIBStringField;
     xVerBalanceDebeCtaFinANTERIOR: TFloatField;
     xVerBalanceDebeCtaFinACTUAL: TFloatField;
     xVerBalanceHaberCtaFinEMPRESA: TIntegerField;
     xVerBalanceHaberCtaFinEJERCICIO: TIntegerField;
     xVerBalanceHaberCtaFinCANAL: TIntegerField;
     xVerBalanceHaberCtaFinPERIODO: TFIBStringField;
     xVerBalanceHaberCtaFinBALANCE: TIntegerField;
     xVerBalanceHaberCtaFinCLAVE: TFIBStringField;
     xVerBalanceHaberCtaFinCUENTA: TFIBStringField;
     xVerBalanceHaberCtaFinCUENTA_FINAL: TFIBStringField;
     xVerBalanceHaberCtaFinTITULO: TFIBStringField;
     xVerBalanceHaberCtaFinANTERIOR: TFloatField;
     xVerBalanceHaberCtaFinACTUAL: TFloatField;
     xVerBalanceDebeCuentasEMPRESA: TIntegerField;
     xVerBalanceDebeCuentasEJERCICIO: TIntegerField;
     xVerBalanceDebeCuentasCANAL: TIntegerField;
     xVerBalanceDebeCuentasPERIODO: TFIBStringField;
     xVerBalanceDebeCuentasBALANCE: TIntegerField;
     xVerBalanceDebeCuentasCLAVE: TFIBStringField;
     xVerBalanceDebeCuentasCUENTA: TFIBStringField;
     xVerBalanceDebeCuentasTITULO: TFIBStringField;
     xVerBalanceDebeCuentasANTERIOR: TFloatField;
     xVerBalanceDebeCuentasACTUAL: TFloatField;
     xVerBalanceHaberCuentasEMPRESA: TIntegerField;
     xVerBalanceHaberCuentasEJERCICIO: TIntegerField;
     xVerBalanceHaberCuentasCANAL: TIntegerField;
     xVerBalanceHaberCuentasPERIODO: TFIBStringField;
     xVerBalanceHaberCuentasBALANCE: TIntegerField;
     xVerBalanceHaberCuentasCLAVE: TFIBStringField;
     xVerBalanceHaberCuentasCUENTA: TFIBStringField;
     xVerBalanceHaberCuentasTITULO: TFIBStringField;
     xVerBalanceHaberCuentasANTERIOR: TFloatField;
     xVerBalanceHaberCuentasACTUAL: TFloatField;
     TUpdate: THYTransaction;
     xComprobacionBalances: TFIBDataSetRO;
     DSxComprobacionBalances: TDataSource;
     frDBxComprobacionBalances: TfrDBDataSet;
     xComprobacionBalancesLINEA: TFIBStringField;
     xComprobacionBalancesTIP: TIntegerField;
     QMCuentasAnDIGITO_1: TFIBStringField;
     QMCuentasAnDIGITO_2: TFIBStringField;
     QMCuentasAnDIGITO_3: TFIBStringField;
     QMCuentasAnDIGITO_4: TFIBStringField;
     QMCuentasAnDIGITO_5: TFIBStringField;
     QMCuentasAnPAIS: TFIBStringField;
     xVerBalanceHaberCuentasExportacion: TFIBDataSetRO;
     xVerBalanceDebeCuentasExportacion: TFIBDataSetRO;
     QMCuentasAnARRASTRAR: TIntegerField;
     QMCuentasAnCOMENTARIO: TFIBStringField;
     QMCuentasAnFECHA: TDateTimeField;
     QMCuentasAnMULTI_CANAL: TFIBStringField;
     procedure DMCuAnualesCreate(Sender: TObject);
     procedure frHYCuentasAnGetValue(const ParName: string; var ParValue: variant);
     procedure frHYCuentasAnEnterRect(Memo: TStringList; View: TfrView);
     procedure DMCuAnualesDestroy(Sender: TObject);
     procedure xVerBalanceHaberAfterScroll(DataSet: TDataSet);
     procedure QMCuentasAnMONEDAChange(Sender: TField);
     procedure QMCuentasAnAfterOpen(DataSet: TDataSet);
     procedure xVerBalanceHaberCuentasBeforeScroll(DataSet: TDataSet);
     procedure xVerBalanceDebeCuentasBeforeScroll(DataSet: TDataSet);
     procedure frxHYCuentasAnBeforePrint(Sender: TfrxReportComponent);
     procedure frxHYCuentasAnGetValue(const VarName: string; var Value: variant);
     procedure SetPGCBeforeOpen(DataSet: TDataSet);
     procedure QMCuentasAnNewRecord(DataSet: TDataSet);
     procedure QMCuentasAnAfterPost(DataSet: TDataSet);
     procedure QMCuentasAnBeforePost(DataSet: TDataSet);
     procedure xVerBalanceDebeAfterScroll(DataSet: TDataSet);
  private
     { Private declarations }
     LocalMascaraL, LocalMascaraN: string;
     TituloDetalle1, TituloDetalle2: string;
     Comentario: string;
     FechaListado: TDateTime;
  public
     { Public declarations }
     procedure Genera(Arrastrar: smallint; Moneda: string; c_e_kri: string; i_e_kri: double; nivel_kri: integer; EmpresaAConsolidar: integer; d1, d2, d3, d4, d5, Comentario: string; FechaBalance: TDateTime; Periodo: string; Balance: integer; MultiBalance: string);
     procedure Procesa(Arrastrar: smallint; Moneda: string; c_e_kri: string; i_e_kri: double; nivel_kri: integer; EmpresaAConsolidar: integer; d1, d2, d3, d4, d5, Comentario: string; FechaBalance: TDateTime; Periodo: string; Balance: integer; MultiBalance: string);
     procedure VisualizaBalance;
     procedure CalculaInforme(CuentasSaldoCero: boolean);
     procedure MostrarListado(Modo: integer; Fecha: TDateTime; Desglosado, DesglosadoFin: boolean; AComentario: string);
     procedure MostrarListadoComprobacion(Modo: integer);
     procedure VaciaMultiSeleccion;
     function DameListaMultiBalance: string;
  end;

var
  DMCuAnuales : TDMCuAnuales;

implementation

uses UDMMain, UEntorno, UFVerBalances, SysUtils, UDMListados, UFormGest, UFMCuAnualesValorExistencias, UUtiles, UDameDato;

{$R *.DFM}

procedure TDMCuAnuales.DMCuAnualesCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AbreData(TDMListados, DMListados);

  QMCuentasAnDESDE.DisplayFormat := ShortDateFormat;
  QMCuentasAnHASTA.DisplayFormat := ShortDateFormat;

  with QMCuentasAn do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['PAIS'].AsString := REntorno.Pais;
     Open;
  end;
end;

procedure TDMCuAnuales.DMCuAnualesDestroy(Sender: TObject);
begin
  VaciaMultiSeleccion;
  CierraData(DMListados);
end;

procedure TDMCuAnuales.Genera(Arrastrar: smallint; Moneda: string; c_e_kri: string; i_e_kri: double; nivel_kri: integer; EmpresaAConsolidar: integer; d1, d2, d3, d4, d5, Comentario: string; FechaBalance: TDateTime; Periodo: string; Balance: integer; MultiBalance: string);
var
  i, Canal : integer;

  procedure Marcar(Periodo: string; Balance, Canal: integer);
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' UPDATE TMP_MULTIBALANCES ');
           SQL.Add(' SET ');
           SQL.Add('   MARCADO = :MARCADO ');
           SQL.Add(' WHERE ');
           SQL.Add('   ENTRADA = :ENTRADA AND ');
           SQL.Add('   EMPRESA = :EMPRESA AND ');
           SQL.Add('   EJERCICIO = :EJERCICIO AND ');
           SQL.Add('   CANAL = :CANAL AND ');
           SQL.Add('   PERIODO = :PERIODO AND ');
           SQL.Add('   BALANCE = :BALANCE ');
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := Canal;
           Params.ByName['PERIODO'].AsString := Periodo;
           Params.ByName['BALANCE'].AsInteger := Balance;
           Params.ByName['MARCADO'].AsInteger := 1;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

begin
  // Crea los registros sin marcar. Por si hubiera algo en la tabla temporal
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE T_RELLENA_MULTIBALANCES(:ENTRADA, :EMPRESA, :EJERCICIO, :BALANCE, :PERIODO)';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['PERIODO'].AsString := Periodo;
        Params.ByName['BALANCE'].AsInteger := Balance;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Asignar canales a consolidar para el balance-periodo que voy a calcular
  MultiBalance := Trim(MultiBalance);
  if (MultiBalance > '') then
  begin
     i := Pos(',', MultiBalance);
     while i > 0 do
     begin
        // Obtengo primer canal (hasta la coma)
        Canal := StrToInt(Copy(MultiBalance, 1, i - 1));

        // Selecciono ese canal
        Marcar(Periodo, Balance, Canal);

        // Quito de la cadena la parte ya procesada
        MultiBalance := Copy(MultiBalance, i + 1, Length(MultiBalance));
        i := Pos(',', MultiBalance);
     end;

     // Si queda algo, es el ultimo item. Es un numero que identifica al canal
     if (MultiBalance > '') then
     begin
        Canal := StrToInt(MultiBalance);
        Marcar(Periodo, Balance, Canal);
     end;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add('EXECUTE PROCEDURE E_BALANCES_RELLENA_MULTI ');
        SQL.Add('(?EMPRESA, ?EJERCICIO, ?CANAL, ?PERIODO, ?BALANCE, ');
        SQL.Add('?ARRASTRAR, ?MONEDA, ?CUENTA, ?IMPORTE, ?NIVEL, ?ENTRADA, ');
        SQL.Add('?DETALLADO, ?EMPRESA_CONSOLIDAR, ');
        SQL.Add('?D1, ?D2, ?D3, ?D4, ?D5, ');
        SQL.Add('?COMENTARIO, ?FECHA_BALANCE)');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['PERIODO'].AsString := Periodo;
        Params.ByName['BALANCE'].AsInteger := Balance;
        Params.ByName['ARRASTRAR'].AsInteger := Arrastrar;
        Params.ByName['MONEDA'].AsString := Moneda;
        Params.ByName['CUENTA'].AsString := c_e_kri;
        Params.ByName['IMPORTE'].Value := i_e_kri;
        Params.ByName['NIVEL'].AsInteger := nivel_kri;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['EMPRESA_CONSOLIDAR'].AsInteger := EmpresaAConsolidar;
        Params.ByName['DETALLADO'].AsInteger := 1;
        Params.ByName['D1'].AsString := D1;
        Params.ByName['D2'].AsString := D2;
        Params.ByName['D3'].AsString := D3;
        Params.ByName['D4'].AsString := D4;
        Params.ByName['D5'].AsString := D5;
        Params.ByName['COMENTARIO'].AsString := Comentario;
        Params.ByName['FECHA_BALANCE'].AsDateTime := FechaBalance;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMCuAnuales.Procesa(Arrastrar: smallint; Moneda: string; c_e_kri: string; i_e_kri: double; nivel_kri: integer; EmpresaAConsolidar: integer; d1, d2, d3, d4, d5, Comentario: string; FechaBalance: TDateTime; Periodo: string; Balance: integer; MultiBalance: string);
begin
  // Genera el balance, sobreescribiendo si ya existe
  Self.Genera(Arrastrar, Moneda, c_e_kri, i_e_kri, nivel_kri, EmpresaAConsolidar, D1, D2, D3, D4, D5, Comentario, FechaBalance, Periodo, Balance, MultiBalance);

  // Refresco y reposiciono
  with QMCuentasAn do
  begin
     DisableControls;
     try
        Close;
        Open;
        while (not EOF) and ((QMCuentasAnPERIODO.AsString <> Periodo) or (QMCuentasAnBALANCE.AsInteger <> Balance)) do
           Next;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMCuAnuales.VisualizaBalance;
begin
  TFVerBalances.Create(Self).Carga(QMCuentasAnBALANCE.AsString,
     QMCuentasAnPERIODO.AsString,
     QMCuentasAnB_TITULO.AsString,
     QMCuentasAnP_TITULO.AsString,
     QMCuentasAnMONEDA.AsString);
end;

procedure TDMCuAnuales.frHYCuentasAnGetValue(const ParName: string; var ParValue: variant);
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'TituloEmpresa' then
     ParValue := REntorno.NombreEmpresa;

  if ParName = 'EjercicioAnterior' then
     ParValue := QMCuentasAnEJERCICIO.AsInteger - 1;

  if ParName = 'TituloBalance' then
     ParValue := QMCuentasAnB_Titulo.AsString;

  if ParName = 'FechaListado' then
     ParValue := StrToDate(DateToStr(FechaListado));

  if ParName = 'Comentario' then
     ParValue := Comentario;

  if ParName = 'Moneda' then
     ParValue := QMCuentasAnMONEDA.AsString;

  if ParName = 'TituloPeriodo' then
     ParValue := QMCuentasAnP_Titulo.AsString;

  if ParName = 'Canales' then
  begin
     with TFIBDataSet.Create(nil) do
     begin
        try
           Transaction := TFIBTransaction.Create(nil);
           try
              Close;
              DataBase := DMMain.DataBase;
              with Transaction do
              begin
                 DefaultDatabase := DMMain.DataBase;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
                 if (not InTransaction) then
                    StartTransaction;
              end;
              SelectSQL.Add(' SELECT DISTINCT(CANAL) FROM TMP_MULTIBALANCES ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
              SelectSQL.Add(' EJERCICIO = ?EJERCICIO AND ');
              SelectSQL.Add(' ENTRADA = ?ENTRADA AND ');
              SelectSQL.Add(' PERIODO = ?PERIODO AND ');
              SelectSQL.Add(' BALANCE = ?BALANCE AND ');
              SelectSQL.Add(' MARCADO <> 0 ');
              SelectSQL.Add(' ORDER BY CANAL ');
              Params.ByName['EMPRESA'].AsInteger := QMCuentasAnEMPRESA.AsInteger;
              Params.ByName['EJERCICIO'].AsInteger := QMCuentasAnEJERCICIO.AsInteger;
              Params.ByName['ENTRADA'].AsInteger := QMCuentasAnENTRADA.AsInteger;
              Params.ByName['PERIODO'].AsString := QMCuentasAnPERIODO.AsString;
              Params.ByName['BALANCE'].AsInteger := QMCuentasAnBALANCE.AsInteger;
              Open;

              if (RecordCount > 0) then
              begin
                 ParValue := IntToStr(FieldByName('CANAL').AsInteger);
                 Next;
                 while not EOF do
                 begin
                    ParValue := ParValue + ', ' + IntToStr(FieldByName('CANAL').AsInteger);
                    Next;
                 end;
              end
              else
                 ParValue := REntorno.Canal;

              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        finally
           Free;
        end;
     end;
  end;

  if ParName = 'Tipo1' then
  begin
     case QMCuentasAnTIPO.AsInteger of
        1: ParValue := 'ACTIVO';
        2: ParValue := 'DEBE';
        3: ParValue := 'APLICACIONES';
        4: ParValue := 'ACTIVO';
        5: ParValue := '';
        6: ParValue := 'ACTIVO';
        7, 8: ParValue := '';
     end;
  end;
  if ParName = 'Tipo2' then
  begin
     case QMCuentasAnTIPO.AsInteger of
        1: ParValue := 'PASIVO';
        2: ParValue := 'HABER';
        3: ParValue := 'ORIGENES';
        4: ParValue := 'PATRIMONIO NETO Y PASIVO';
        5: ParValue := '';
        6: ParValue := 'PATRIMONIO NETO Y PASIVO';
        7, 8: ParValue := '';
     end;
  end;

  if ParName = 'TituloDetalle1' then
     ParValue := TituloDetalle1;

  if ParName = 'TituloDetalle2' then
     ParValue := TituloDetalle2;

  if ParName = 'NotasD' then
  begin
     ParValue := '';
     with TFIBDataSet.Create(nil) do
     begin
        try
           Transaction := TFIBTransaction.Create(nil);
           try
              Close;
              DataBase := DMMain.DataBase;
              with Transaction do
              begin
                 DefaultDatabase := DMMain.DataBase;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
                 if (not InTransaction) then
                    StartTransaction;
              end;
              SelectSQL.Text := 'EXECUTE PROCEDURE C_DAME_NOTAS_BALANCE_CLAVE(:EMPRESA, :EJERCICIO, :CANAL, :PERIODO, :BALANCE, :CLAVE)';
              Params.ByName['EMPRESA'].AsInteger := xVerBalanceDebeEMPRESA.AsInteger;
              Params.ByName['EJERCICIO'].AsInteger := xVerBalanceDebeEJERCICIO.AsInteger;
              Params.ByName['CANAL'].AsInteger := xVerBalanceDebeCANAL.AsInteger;
              Params.ByName['PERIODO'].AsString := xVerBalanceDebePERIODO.AsString;
              Params.ByName['BALANCE'].AsInteger := xVerBalanceDebeBALANCE.AsInteger;
              Params.ByName['CLAVE'].AsString := xVerBalanceDebeCLAVE.AsString;
              Open;
              if (not EOF) then
              begin
                 ParValue := FieldByName('ID_NOTA').AsString;
                 Next;
              end;
              while (not EOF) do
              begin
                 ParValue := ParValue + ',' + FieldByName('ID_NOTA').AsString;
                 Next;
              end;
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        finally
           Free;
        end;
     end;
  end;

  if ParName = 'NotasH' then
  begin
     ParValue := '';
     with TFIBDataSet.Create(nil) do
     begin
        try
           Transaction := TFIBTransaction.Create(nil);
           try
              Close;
              DataBase := DMMain.DataBase;
              with Transaction do
              begin
                 DefaultDatabase := DMMain.DataBase;
                 TRParams.Clear;
                 TRParams.Add('read_committed');
                 TRParams.Add('read');
                 if (not InTransaction) then
                    StartTransaction;
              end;
              SelectSQL.Text := 'EXECUTE PROCEDURE C_DAME_NOTAS_BALANCE_CLAVE(:EMPRESA, :EJERCICIO, :CANAL, :PERIODO, :BALANCE, :CLAVE)';
              Params.ByName['EMPRESA'].AsInteger := xVerBalanceHaberEMPRESA.AsInteger;
              Params.ByName['EJERCICIO'].AsInteger := xVerBalanceHaberEJERCICIO.AsInteger;
              Params.ByName['CANAL'].AsInteger := xVerBalanceHaberCANAL.AsInteger;
              Params.ByName['PERIODO'].AsString := xVerBalanceHaberPERIODO.AsString;
              Params.ByName['BALANCE'].AsInteger := xVerBalanceHaberBALANCE.AsInteger;
              Params.ByName['CLAVE'].AsString := xVerBalanceHaberCLAVE.AsString;
              Open;
              if (not EOF) then
              begin
                 ParValue := FieldByName('ID_NOTA').AsString;
                 Next;
              end;
              while (not EOF) do
              begin
                 ParValue := ParValue + ',' + FieldByName('ID_NOTA').AsString;
                 Next;
              end;
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        finally
           Free;
        end;
     end;
  end;

  if (ParName = 'Digito1') then
     ParValue := QMCuentasAnDIGITO_1.AsString;
  if (ParName = 'Digito2') then
     ParValue := QMCuentasAnDIGITO_2.AsString;
  if (ParName = 'Digito3') then
     ParValue := QMCuentasAnDIGITO_3.AsString;
  if (ParName = 'Digito4') then
     ParValue := QMCuentasAnDIGITO_4.AsString;
  if (ParName = 'Digito5') then
     ParValue := QMCuentasAnDIGITO_5.AsString;

  if (ParName = 'TituloDigito1') then
     ParValue := DameTituloCentroCoste(1, QMCuentasAnDIGITO_1.AsString);
  if (ParName = 'TituloDigito2') then
     ParValue := DameTituloCentroCoste(2, QMCuentasAnDIGITO_2.AsString);
  if (ParName = 'TituloDigito3') then
     ParValue := DameTituloCentroCoste(3, QMCuentasAnDIGITO_3.AsString);
  if (ParName = 'TituloDigito4') then
     ParValue := DameTituloCentroCoste(4, QMCuentasAnDIGITO_4.AsString);
  if (ParName = 'TituloDigito5') then
     ParValue := DameTituloCentroCoste(5, QMCuentasAnDIGITO_5.AsString);

  //  if ParName='Factor' then
  //   ParValue := Factor;
end;

procedure TDMCuAnuales.frHYCuentasAnEnterRect(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);

     if (Pos('[MascaraN]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraN;
     if (Pos('[MascaraL]', Memo[0]) > 0) then
        View.FormatStr := LocalMascaraL;
     if ((Memo[0] = '[xVerBalanceHaber."ACTUAL"]') or
        (Memo[0] = '[xVerBalanceHaber."ANTERIOR"]') or
        (Memo[0] = '[xVerBalanceDebe."ACTUAL"]') or
        (Memo[0] = '[xVerBalanceDebe."ANTERIOR"]')) then
     begin
        if (xVerBalanceHaberTipo.AsString = 'R') or (xVerBalanceDebeTipo.AsString = 'R') then
           View.Visible := False
        else
           View.Visible := True;
     end;

     if (Memo[0] = '[TituloDetalle1]') then
     begin
        if (xVerBalanceHaberTipo.AsString = 'R') then
           TfrMemoView(view).Font.Style := [fsbold, fsUnderline]// FontStyle:= 6
        else
           TfrMemoView(view).Font.Style := []; // 0
     end;

     if (Memo[0] = '[TituloDetalle2]') then
     begin
        if (xVerBalanceDebeTipo.AsString = 'R') then
           TfrMemoView(view).Font.Style := [fsbold, fsUnderline]// FontStyle:= 6
        else
           TfrMemoView(view).Font.Style := []; // 0;
     end;
  end;

  if xVerBalanceHaberTipo.AsString = 'T' then
     TituloDetalle1 := xVerBalanceHaberTitulo.AsString +
        '..................................................................................'
  else
     TituloDetalle1 := xVerBalanceHaberTitulo.AsString;

  if xVerBalanceDebeTipo.AsString = 'T' then
     TituloDetalle2 := xVerBalanceDebeTitulo.AsString +
        '..................................................................................'
  else
     TituloDetalle2 := xVerBalanceDebeTitulo.AsString;
end;

procedure TDMCuAnuales.CalculaInforme(CuentasSaldoCero: boolean);
var
  Grupo1, Grupo2 : string;
begin
  case QMCuentasAnTIPO.AsInteger of
     1:   // Balance de Situación
     begin
        Grupo1 := 'A';
        Grupo2 := 'P';
     end;
     2:   // Pérdidas y Ganancias
     begin
        Grupo1 := 'D';
        Grupo2 := 'H';
     end;
     3:   // Cuadro de Financiación
     begin
        Grupo1 := 'A';
        Grupo2 := 'O';
     end;
     4:   // Balance de Cierre PYMES
     begin
        Grupo1 := 'A';
        Grupo2 := 'P';
     end;
     5:   // Pérdidas y Ganancias PYMES
     begin
        Grupo1 := 'D';
        Grupo2 := 'H';
     end;
     6:   // Balance de Cierre General
     begin
        Grupo1 := 'A';
        Grupo2 := 'P';
     end;
     7:   // Pérdidas y Ganancias General
     begin
        Grupo1 := 'D';
        Grupo2 := 'H';
     end;
  end;

  with xVerBalanceHaberCuentas do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_BALANCES_CONTENIDO_CTA_FIN ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = :EJERCICIO AND ');
     SelectSQL.Add(' CANAL = :CANAL AND ');
     SelectSQL.Add(' PERIODO = :PERIODO AND ');
     SelectSQL.Add(' BALANCE = :BALANCE AND ');
     SelectSQL.Add(' CLAVE = :CLAVE AND ');
     SelectSQL.Add(' CUENTA = :CUENTA AND ');
     SelectSQL.Add(' PGC = :PGC ');
     if (not CuentasSaldoCero) then
        SelectSQL.Add(' AND NOT (ANTERIOR = 0 AND ACTUAL = 0) ');
     SelectSQL.Add(' ORDER BY CUENTA_FINAL ');
  end;

  with xVerBalanceDebeCtaFin do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_BALANCES_CONTENIDO_CTA_FIN ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = :EJERCICIO AND ');
     SelectSQL.Add(' CANAL = :CANAL AND ');
     SelectSQL.Add(' PERIODO = :PERIODO AND ');
     SelectSQL.Add(' BALANCE = :BALANCE AND ');
     SelectSQL.Add(' CLAVE = :CLAVE AND ');
     SelectSQL.Add(' CUENTA = :CUENTA AND ');
     SelectSQL.Add(' PGC = :PGC ');
     if (not CuentasSaldoCero) then
        SelectSQL.Add(' AND NOT (ANTERIOR = 0 AND ACTUAL = 0) ');
     SelectSQL.Add(' ORDER BY CUENTA_FINAL ');
  end;

  with xVerBalanceHaberCuentas do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_BALANCES_CONTENIDO_CUENTAS ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = :EJERCICIO AND ');
     SelectSQL.Add(' CANAL = :CANAL AND ');
     SelectSQL.Add(' PERIODO = :PERIODO AND ');
     SelectSQL.Add(' BALANCE = :BALANCE AND ');
     SelectSQL.Add(' CLAVE = :CLAVE AND ');
     SelectSQL.Add(' PGC = :PGC ');
     if (not CuentasSaldoCero) then
        SelectSQL.Add(' AND NOT (ANTERIOR = 0 AND ACTUAL = 0) ');
     SelectSQL.Add(' ORDER BY CUENTA ');
  end;

  with xVerBalanceDebeCuentas do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_BALANCES_CONTENIDO_CUENTAS ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = :EJERCICIO AND ');
     SelectSQL.Add(' CANAL = :CANAL AND ');
     SelectSQL.Add(' PERIODO = :PERIODO AND ');
     SelectSQL.Add(' BALANCE = :BALANCE AND ');
     SelectSQL.Add(' CLAVE = :CLAVE AND ');
     SelectSQL.Add(' PGC = :PGC ');
     if (not CuentasSaldoCero) then
        SelectSQL.Add(' AND NOT (ANTERIOR = 0 AND ACTUAL = 0) ');
     SelectSQL.Add(' ORDER BY CUENTA ');
  end;

  with xVerBalanceHaber do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_BALANCES_CONTENIDO ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = ?EJERCICIO AND ');
     SelectSQL.Add(' CANAL = ?CANAL AND ');
     SelectSQL.Add(' PERIODO = ?PERIODO AND ');
     SelectSQL.Add(' BALANCE = ?BALANCE AND ');
     SelectSQL.Add(' GRUPO = ?GRUPO AND ');
     SelectSQL.Add(' ACTIVO = 1 ');
     if (not CuentasSaldoCero) then
        SelectSQL.Add(' AND NOT (TIPO = ''L'' AND ANTERIOR = 0 AND ACTUAL = 0) ');
     SelectSQL.Add(' ORDER BY ORDEN ');

     Params.ByName['EMPRESA'].AsInteger := QMCuentasAnEmpresa.AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := QMCuentasAnEjercicio.AsInteger;
     Params.ByName['CANAL'].AsInteger := QMCuentasAnCanal.AsInteger;
     Params.ByName['PERIODO'].AsString := QMCuentasAnPeriodo.AsString;
     Params.ByName['BALANCE'].AsInteger := QMCuentasAnBalance.AsInteger;
     Params.ByName['GRUPO'].AsString := Grupo1;
     Open;
  end;

  with xVerBalanceDebe do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM VER_BALANCES_CONTENIDO ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = ?EJERCICIO AND ');
     SelectSQL.Add(' CANAL = ?CANAL AND ');
     SelectSQL.Add(' PERIODO = ?PERIODO AND ');
     SelectSQL.Add(' BALANCE = ?BALANCE AND ');
     SelectSQL.Add(' GRUPO = ?GRUPO AND ');
     SelectSQL.Add(' ACTIVO = 1 ');
     if (not CuentasSaldoCero) then
        SelectSQL.Add(' AND NOT (TIPO = ''L'' AND ANTERIOR = 0 AND ACTUAL = 0) ');
     SelectSQL.Add(' ORDER BY ORDEN ');
     Params.ByName['EMPRESA'].AsInteger := QMCuentasAnEmpresa.AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := QMCuentasAnEjercicio.AsInteger;
     Params.ByName['CANAL'].AsInteger := QMCuentasAnCanal.AsInteger;
     Params.ByName['PERIODO'].AsString := QMCuentasAnPeriodo.AsString;
     Params.ByName['BALANCE'].AsInteger := QMCuentasAnBalance.AsInteger;
     Params.ByName['GRUPO'].AsString := Grupo2;
     Open;
  end;

  with xNotas do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := QMCuentasAnEmpresa.AsInteger;
     Params.ByName['EJERCICIO'].AsInteger := QMCuentasAnEjercicio.AsInteger;
     Params.ByName['CANAL'].AsInteger := QMCuentasAnCanal.AsInteger;
     Params.ByName['PERIODO'].AsString := QMCuentasAnPeriodo.AsString;
     Params.ByName['BALANCE'].AsInteger := QMCuentasAnBalance.AsInteger;
     Open;
  end;
end;

procedure TDMCuAnuales.MostrarListado(Modo: integer; Fecha: TDateTime; Desglosado, DesglosadoFin: boolean; AComentario: string);
var
  Grupo : integer;
begin
  LocalMascaraN := DMMain.MascaraMoneda(QMCuentasAnMoneda.AsString, 1);
  LocalMascaraL := DMMain.MascaraMoneda(QMCuentasAnMoneda.AsString, 0);
  Comentario := AComentario;
  FechaListado := Fecha;

  Grupo := 0;
  if Desglosado then
  begin
     if DesglosadoFin then
        case QMCuentasAnTIPO.AsInteger of
           1, 2, 3: Grupo := 190;
           4: Grupo := 1032;
           5: Grupo := 1033;
           6: Grupo := 1034;
           7: Grupo := 1035;
           8: Grupo := 1036;
        end
     else
        case QMCuentasAnTIPO.AsInteger of
           1, 2, 3: Grupo := 135;
           4: Grupo := 1027;
           5: Grupo := 1028;
           6: Grupo := 1029;
           7: Grupo := 1030;
           8: Grupo := 1031;
        end;
  end
  else
     case QMCuentasAnTIPO.AsInteger of
        1, 2, 3: Grupo := 32;
        4: Grupo := 1022;
        5: Grupo := 1023;
        6: Grupo := 1024;
        7: Grupo := 1025;
        8: Grupo := 1026;
     end;

  DMListados.Imprimir(Grupo, 0, Modo, '', '', frHYCuentasAn, frxHYCuentasAn, nil, nil);
end;

procedure TDMCuAnuales.xVerBalanceHaberAfterScroll(DataSet: TDataSet);
begin
  xVerBalanceHaberCuentas.Close;
  xVerBalanceHaberCuentas.Open;
end;

procedure TDMCuAnuales.xVerBalanceDebeAfterScroll(DataSet: TDataSet);
begin
  xVerBalanceDebeCuentas.Close;
  xVerBalanceDebeCuentas.Open;
end;

procedure TDMCuAnuales.QMCuentasAnMONEDAChange(Sender: TField);
begin
  xMonedasListado.Close;
  xMonedasListado.Open;
end;

procedure TDMCuAnuales.QMCuentasAnAfterOpen(DataSet: TDataSet);
begin
  xMonedasListado.Open;
end;

procedure TDMCuAnuales.xVerBalanceHaberCuentasBeforeScroll(DataSet: TDataSet);
begin
  with xVerBalanceHaberCtaFin do
  begin
     Close;
     Params.ByName['CUENTA'].AsString := xVerBalanceHaberCuentasCUENTA.AsString;
     Open;
  end;
end;

procedure TDMCuAnuales.xVerBalanceDebeCuentasBeforeScroll(DataSet: TDataSet);
begin
  with xVerBalanceDebeCtaFin do
  begin
     Close;
     Params.ByName['CUENTA'].AsString := xVerBalanceDebeCuentasCUENTA.AsString;
     Open;
  end;
end;

procedure TDMCuAnuales.frxHYCuentasAnBeforePrint(Sender: TfrxReportComponent);
begin
  DMListados.BeforePrint(Sender);

  if (Sender is TfrxCustomMemoView) then
     with TfrxCustomMemoView(Sender) do
        if (Memo.Count > 0) then
        begin
           if Pos('[MascaraN]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := LocalMascaraN;
              DisplayFormat.Kind := fkNumeric;
           end;
           if Pos('[MascaraL]', Memo[0]) > 0 then
           begin
              DisplayFormat.FormatStr := LocalMascaraL;
              DisplayFormat.Kind := fkNumeric;
           end;

           if (Pos('[xVerBalanceHaber."ACTUAL"]', Memo[0]) > 0) or
              (Pos('[xVerBalanceHaber."ANTERIOR"]', Memo[0]) > 0) or
              (Pos('[xVerBalanceDebe."ACTUAL"]', Memo[0]) > 0) or
              (Pos('[xVerBalanceDebe."ANTERIOR"]', Memo[0]) > 0) then
           begin
              if (xVerBalanceHaberTipo.AsString = 'R') or (xVerBalanceDebeTipo.AsString = 'R') then
                 Visible := False
              else
                 Visible := True;
           end;

           if (Pos('[TituloDetalle1]', Memo[0]) > 0) or
              (Pos('[TituloDetalle2]', Memo[0]) > 0) then
           begin
              if (xVerBalanceHaberTipo.AsString = 'R') or (xVerBalanceDebeTipo.AsString = 'R') then
              begin
                 Font.Style := [fsbold, fsUnderline];
              end
              else
              begin
                 Font.Style := [];
              end;
           end;
        end;

  if xVerBalanceHaberTIPO.AsString = 'T' then
     TituloDetalle1 := xVerBalanceHaberTITULO.AsString +
        '..................................................................................'
  else
     TituloDetalle1 := xVerBalanceHaberTITULO.AsString;

  if xVerBalanceDebeTipo.AsString = 'T' then
     TituloDetalle2 := xVerBalanceDebeTitulo.AsString +
        '..................................................................................'
  else
     TituloDetalle2 := xVerBalanceDebeTitulo.AsString;
end;

procedure TDMCuAnuales.frxHYCuentasAnGetValue(const VarName: string; var Value: variant);
begin
  frHYCuentasAnGetValue(VarName, Value);
end;

procedure TDMCuAnuales.SetPGCBeforeOpen(DataSet: TDataSet);
begin
  TFIBDataSetRO(DataSet).Params.ByName['PGC'].AsInteger := REntorno.PGC;
end;

procedure TDMCuAnuales.MostrarListadoComprobacion(Modo: integer);
begin
  with xComprobacionBalances do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['BALANCE'].AsInteger := 0;
     Open;
  end;

  DMListados.Imprimir(900, 0, Modo, '', '', frHYCuentasAn, frxHYCuentasAn, nil, nil);
end;

procedure TDMCuAnuales.VaciaMultiSeleccion;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM TMP_MULTIBALANCES WHERE ENTRADA = ?ENTRADA AND EMPRESA = ?EMPRESA AND EJERCICIO = ?EJERCICIO';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMCuAnuales.QMCuentasAnNewRecord(DataSet: TDataSet);
begin
  VaciaMultiSeleccion;

  QMCuentasAnEMPRESA.AsInteger := REntorno.Empresa;
  QMCuentasAnEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMCuentasAnCANAL.AsInteger := REntorno.Canal;
  QMCuentasAnENTRADA.AsInteger := REntorno.Canal;
  QMCuentasAnPAIS.AsString := REntorno.Pais;
  QMCuentasAnMONEDA.AsString := REntorno.Moneda;
  QMCuentasAnFECHA.AsDateTime := REntorno.FechaTrab;

  QMCuentasAnPERIODO.AsString := '20';
  QMCuentasAnBALANCE.AsString := '31'; // Con el nuevo plan contable debe ser el 31 por defecto
  QMCuentasAnARRASTRAR.AsInteger := 0;
  QMCuentasAnMULTI_CANAL.AsString := IntToStr(QMCuentasAnCANAL.AsInteger);
end;

procedure TDMCuAnuales.QMCuentasAnAfterPost(DataSet: TDataSet);
begin
  { COMENTAMOS LA PETICION DE DATOS DE CUENTA E IMPORTE DE EXISTENCIAS
  cuenta_existencias_kri := '';
  importe_existencias_kri := 0;
  nivel_kri := 4;

  if PedirDatos then
  begin
     PideDatos := TFMCuAnualesValorExistencias.Create(nil);
     PideDatos.ShowModal;
     PideDatos.Free;
  end;}

  Procesa(QMCuentasAnARRASTRAR.AsInteger, QMCuentasAnMONEDA.AsString, '',
     0, 4, 0,
     QMCuentasAnDIGITO_1.AsString, QMCuentasAnDIGITO_2.AsString, QMCuentasAnDIGITO_3.AsString, QMCuentasAnDIGITO_4.AsString, QMCuentasAnDIGITO_5.AsString,
     QMCuentasAnCOMENTARIO.AsString, QMCuentasAnFECHA.AsDateTime, QMCuentasAnPERIODO.AsString, QMCuentasAnBALANCE.AsInteger, QMCuentasAnMULTI_CANAL.AsString);
end;

procedure TDMCuAnuales.QMCuentasAnBeforePost(DataSet: TDataSet);
begin
  // Borro el balance porque el procedimiento lo volverá a crear.
  {
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' DELETE FROM TMP_BALANCES ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' PERIODO = :PERIODO AND ');
        SQL.Add(' BALANCE = :BALANCE AND ');
        SQL.Add(' PAIS = :PAIS ');
        Params.ByName['EMPRESA'].AsInteger := QMCuentasAnEMPRESA.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMCuentasAnCANAL.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMCuentasAnEJERCICIO.AsInteger;
        Params.ByName['PERIODO'].AsString := QMCuentasAnPERIODO.AsString;
        Params.ByName['BALANCE'].AsInteger := QMCuentasAnBALANCE.AsInteger;
        Params.ByName['PAIS'].AsString := QMCuentasAnPAIS.AsString;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
  }
end;

function TDMCuAnuales.DameListaMultiBalance: string;
var
  Separador : string;
begin
  /// Devuelve un cadena separada por comas de los canales seleccionados
  /// No tiene en cuenta BALANCE ni PERIODO. Se rellenan con 0.

  Result := '';
  Separador := '';

  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Add(' SELECT CANAL FROM TMP_MULTIBALANCES ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' ENTRADA = :ENTRADA AND ');
           SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' EJERCICIO = :EJERCICIO AND ');
           SelectSQL.Add(' BALANCE = :BALANCE AND ');
           SelectSQL.Add(' PERIODO = :PERIODO AND ');
           SelectSQL.Add(' MARCADO = 1 ');
           Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['BALANCE'].AsInteger := 0;
           Params.ByName['PERIODO'].AsString := '00';
           Open;
           while not EOF do
           begin
              Result := Result + Separador + IntToStr(FieldByName('CANAL').AsInteger);
              Separador := ', ';
              Next;
           end;
           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;
end;

end.
