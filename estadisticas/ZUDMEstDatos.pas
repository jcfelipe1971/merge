unit ZUDMEstDatos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, FIBTableDataSetRO, FIBQuery, HYFIBQuery,
  FR_DSet, FR_DBSet, FR_Class, Fr_HYReport, StdCtrls;

type
  TZDMEstDatos = class(TDataModule)
     TLocal: THYTransaction;
     QMEstadistica: TFIBTableSet;
     DSQMEstadistica: TDataSource;
     xEstadistica: TFIBDataSetRO;
     xDescGrupo: TFIBDataSetRO;
     xDescGrupoTITULO: TFIBStringField;
     xDescEstadistica: TFIBDataSetRO;
     xDescPeriodo: TFIBDataSetRO;
     DSxDescGrupo: TDataSource;
     DSxEstadistica: TDataSource;
     DSxDescEstadistica: TDataSource;
     xDescEstadisticaTITULO: TFIBStringField;
     xDescPeriodoTITULO: TFIBStringField;
     DSxDescPeriodo: TDataSource;
     xSelectMes: TFIBDataSetRO;
     frEstadistica: TfrHYReport;
     frDBDSEstadistica: TfrDBDataSet;
     xEjercicios: TFIBDataSetRO;
     xEjerciciosEJERCICIO: TIntegerField;
     xDescMeses: TFIBDataSetRO;
     xDescMesesTITULO: TFIBStringField;
     xEstadisticaESTADISTICA: TIntegerField;
     xEstadisticaGRUPO: TIntegerField;
     xEstadisticaTITULO: TFIBStringField;
     xEstadisticaNUM_CLAVES: TIntegerField;
     xEstadisticaCLAVE_1: TFIBStringField;
     xEstadisticaTITULO_1: TFIBStringField;
     xEstadisticaDESC_CLAVE_1: TFIBStringField;
     xEstadisticaTITULO_DESC_1: TFIBStringField;
     xEstadisticaCLAVE_2: TFIBStringField;
     xEstadisticaTITULO_2: TFIBStringField;
     xEstadisticaDESC_CLAVE_2: TFIBStringField;
     xEstadisticaTITULO_DESC_2: TFIBStringField;
     xEstadisticaCLAVE_3: TFIBStringField;
     xEstadisticaTITULO_3: TFIBStringField;
     xEstadisticaDESC_CLAVE_3: TFIBStringField;
     xEstadisticaTITULO_DESC_3: TFIBStringField;
     xEstadisticaACUMULADOS: TBlobField;
     xEstadisticaTABLAS: TBlobField;
     xEstadisticaCLAVES: TBlobField;
     xEstadisticaREGLAS: TBlobField;
     xEstadisticaEMPRESA: TIntegerField;
     xEstadisticaEJERCICIO: TIntegerField;
     xEstadisticaCANAL: TIntegerField;
     xEstadisticaSERIE: TFIBStringField;
     xEstadisticaORDEN_TOTAL: TIntegerField;
     QMEstadisticaCLAVE_1: TFIBStringField;
     QMEstadisticaDESC_CLAVE_1: TFIBStringField;
     QMEstadisticaCLAVE_2: TFIBStringField;
     QMEstadisticaDESC_CLAVE_2: TFIBStringField;
     QMEstadisticaCLAVE_3: TFIBStringField;
     QMEstadisticaDESC_CLAVE_3: TFIBStringField;
     QMEstadisticaMES01: TFloatField;
     QMEstadisticaMES02: TFloatField;
     QMEstadisticaMES03: TFloatField;
     QMEstadisticaMES04: TFloatField;
     QMEstadisticaMES05: TFloatField;
     QMEstadisticaMES06: TFloatField;
     QMEstadisticaMES07: TFloatField;
     QMEstadisticaMES08: TFloatField;
     QMEstadisticaMES09: TFloatField;
     QMEstadisticaMES10: TFloatField;
     QMEstadisticaMES11: TFloatField;
     QMEstadisticaMES12: TFloatField;
     QMEstadisticaTOTALPERIODO: TFloatField;
     QMEstadisticaCAMPO_AUX_1: TFIBStringField;
     QMEstadisticaCAMPO_AUX_2: TFIBStringField;
     QMEstadisticaCAMPO_AUX_3: TFIBStringField;
     QMEstadisticaCAMPO_AUX_4: TFIBStringField;
     QMEstadisticaCAMPO_AUX_5: TFIBStringField;
     xEstadisticaCAMPO_AUX_1: TFIBStringField;
     xEstadisticaTIT_CAMPO_AUX_1: TFIBStringField;
     xEstadisticaCAMPO_AUX_2: TFIBStringField;
     xEstadisticaTIT_CAMPO_AUX_2: TFIBStringField;
     xEstadisticaCAMPO_AUX_3: TFIBStringField;
     xEstadisticaTIT_CAMPO_AUX_3: TFIBStringField;
     xEstadisticaCAMPO_AUX_4: TFIBStringField;
     xEstadisticaTIT_CAMPO_AUX_4: TFIBStringField;
     xEstadisticaCAMPO_AUX_5: TFIBStringField;
     xEstadisticaTIT_CAMPO_AUX_5: TFIBStringField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure xEstadisticaAfterOpen(DataSet: TDataSet);
     procedure frEstadisticaGetValue(const ParName: string; var ParValue: variant);
     procedure frEstadisticaBeforePrint(Memo: TStringList; View: TfrView);
     procedure Graba(DataSet: TDataSet);
  private
     { Private declarations }
     InicioLog: TDateTime;
     RegistrosProcesados: integer;
  public
     { Public declarations }
     procedure VerEstadistica(Grupo, Estadistica: integer; Periodo: string; Modo: integer);
     procedure RecalcularEstadistica(Grupo, Estadistica: integer);
     procedure CalculaMes(Mes: integer);
     procedure InsertarLinea(ClavesComprueba, CamposInsert, ClavesInsert, MesStr: string; NumClaves: integer);
     procedure LimpiaTabla(Grupo, Estadistica: integer);
     function TituloMes(Mes: string): string;
  end;

var
  ZDMEstDatos : TZDMEstDatos;

implementation

uses UDMMain, UEntorno, ZUFMEstDatos, UDMListados, UFormGest, UUtiles;

{$R *.dfm}

procedure TZDMEstDatos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMEstadisticaMES01.DisplayFormat := MascaraN;
  QMEstadisticaMES02.DisplayFormat := MascaraN;
  QMEstadisticaMES03.DisplayFormat := MascaraN;
  QMEstadisticaMES04.DisplayFormat := MascaraN;
  QMEstadisticaMES05.DisplayFormat := MascaraN;
  QMEstadisticaMES06.DisplayFormat := MascaraN;
  QMEstadisticaMES07.DisplayFormat := MascaraN;
  QMEstadisticaMES08.DisplayFormat := MascaraN;
  QMEstadisticaMES09.DisplayFormat := MascaraN;
  QMEstadisticaMES10.DisplayFormat := MascaraN;
  QMEstadisticaMES11.DisplayFormat := MascaraN;
  QMEstadisticaMES12.DisplayFormat := MascaraN;
  QMEstadisticaTOTALPERIODO.DisplayFormat := MascaraN;

  AbreData(TDMListados, DMListados);
end;

procedure TZDMEstDatos.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TZDMEstDatos.VerEstadistica(Grupo, Estadistica: integer; Periodo: string; Modo: integer);
var
  campos, ordena, str : string;
begin
  campos := 'CLAVE_1, DESC_CLAVE_1, CLAVE_2, DESC_CLAVE_2, CLAVE_3, DESC_CLAVE_3,' +
     'CAMPO_AUX_1,CAMPO_AUX_2,CAMPO_AUX_3,CAMPO_AUX_4,CAMPO_AUX_5,' +
     'MES01,MES02,MES03,MES04,MES05,MES06,MES07,MES08,MES09,MES10,MES11,MES12,';

  if Periodo = '01' then
     campos := campos + 'MES01 as TotalPeriodo'
  else if Periodo = '02' then
     campos := campos + 'MES02 as TotalPeriodo'
  else if Periodo = '03' then
     campos := campos + 'MES03 as TotalPeriodo'
  else if Periodo = '04' then
     campos := campos + 'MES04 as TotalPeriodo'
  else if Periodo = '05' then
     campos := campos + 'MES05 as TotalPeriodo'
  else if Periodo = '06' then
     campos := campos + 'MES06 as TotalPeriodo'
  else if Periodo = '07' then
     campos := campos + 'MES07 as TotalPeriodo'
  else if Periodo = '08' then
     campos := campos + 'MES08 as TotalPeriodo'
  else if Periodo = '09' then
     campos := campos + 'MES09 as TotalPeriodo'
  else if Periodo = '10' then
     campos := campos + 'MES10 as TotalPeriodo'
  else if Periodo = '11' then
     campos := campos + 'MES11 as TotalPeriodo'
  else if Periodo = '12' then
     campos := campos + 'MES12 as TotalPeriodo'
  else if Periodo = '13' then
     campos := campos + 'MES01+MES02+MES03 as TotalPeriodo'
  else if Periodo = '14' then
     campos := campos + 'MES04+MES05+MES06 as TotalPeriodo'
  else if Periodo = '15' then
     campos := campos + 'MES07+MES08+MES09 as TotalPeriodo'
  else if Periodo = '16' then
     campos := campos + 'MES10+MES11+MES12 as TotalPeriodo'
  else if Periodo = '17' then
     campos := campos + 'MES01+MES02+MES03+MES04+MES05+MES06 as TotalPeriodo'
  else if Periodo = '18' then
     campos := campos + 'MES07+MES08+MES09+MES10+MES11+MES12 as TotalPeriodo'
  else
     campos := campos + 'MES01+MES02+MES03+MES04+MES05+MES06+MES07+MES08+MES09+MES10+MES11+MES12 as TotalPeriodo';

  with xEstadistica do
  begin
     Close;
     Params.ByName['GRUPO'].AsInteger := Grupo;
     Params.ByName['ESTADISTICA'].AsInteger := Estadistica;
     Open;
  end;

  ZFMEstDatos.MesesVer(Periodo);

  ordena := 'CLAVE_1, CLAVE_2, CLAVE_3';
  // Si ordenamos por el campo calculado TotalPeriodo
  // añadimos en el order la posicion: 24
  if ZFMEstDatos.CBOrdenTotal.ItemIndex = 1 then
     ordena := IntToStr(24) + ', ' + ordena
  else if ZFMEstDatos.CBOrdenTotal.ItemIndex = 2 then
     ordena := IntToStr(24) + ' DESC, ' + ordena;

  if (Modo = -1) then
  begin
     with QMEstadistica do
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Text := 'SELECT ' + campos + ' FROM EST_ESTADISTICAS_GRUPO' +
           ' WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND SERIE=?SERIE' +
           ' AND GRUPO=?GRUPO AND ESTADISTICA=?ESTADISTICA' +
           ' ORDER BY ' + ordena;
        Params.ByName['EMPRESA'].AsInteger := xEstadisticaEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := xEstadisticaEJERCICIO.AsInteger; // REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := xEstadisticaCANAL.AsInteger; // REntorno.Canal;
        Params.ByName['SERIE'].AsString := xEstadisticaSERIE.AsString; // REntorno.Serie;
        Params.ByName['GRUPO'].AsInteger := Grupo;
        Params.ByName['ESTADISTICA'].AsInteger := Estadistica;
        Open;
     end;
  end;

  if (Modo > -1) then
  begin
     with frEstadistica do
     begin
        if (ZFMEstDatos.ChkBOcultarMeses.Checked) then
           DMListados.Cargar(7001, '')
        else
           DMListados.Cargar(7000, '');
        LoadFromFIB(REntorno.Formato, str);
        PrepareReport;
        case Modo of
           0: ShowPreparedReport;
           1: PrintPreparedReport('', REntorno.Copias);
           // 2 : DesignReport;
        end;
     end;
     DMListados.LimpiaEntorno;
  end;
end;

procedure TZDMEstDatos.RecalcularEstadistica(Grupo, Estadistica: integer);
var
  Mes : integer;
begin
  DMMain.LogIni(Format('RecalcularEstadistica(%d, %d)', [Grupo, Estadistica]));
  // Limpiamos la tabla para volver a recalcular los datos de cada mes
  ZFMEstDatos.Log(_('Limpiando estadistica'));
  LimpiaTabla(Grupo, Estadistica);

  InicioLog := Now;
  RegistrosProcesados := 0;
  for Mes := 1 to 12 do
  begin
     ZFMEstDatos.Log(Format(_('Calculando Mes %d - %s - Registros Porcesados: %d'), [Mes, FormatDatetime('[hh:nn:ss]', Now - InicioLog), RegistrosProcesados]));
     CalculaMes(Mes);
  end;

  DMMain.LogFin(Format('RecalcularEstadistica(%d, %d)', [Grupo, Estadistica]));
end;

procedure TZDMEstDatos.CalculaMes(Mes: integer);
var
  fecha_d, fecha_h, MesStr : string;
  Claves, Claves2, Claves3 : string;
  CamposInsert, ClavesInsert : string;
  CondicionesWhere, FechasWhere : string;
  Ejer : boolean;
begin
  DMMain.LogIni(Format('CalculaMes(%d)', [Mes]));
  if Mes < 10 then
     MesStr := '0' + IntToStr(Mes)
  else
     MesStr := IntToStr(Mes);

  // Seleccionamos el mes de estadistica
  if Mes = 1 then
  begin
     fecha_d := '01/01/';
     fecha_h := '02/01/';
  end
  else if Mes = 2 then
  begin
     fecha_d := '02/01/';
     fecha_h := '03/01/';
  end
  else if Mes = 3 then
  begin
     fecha_d := '03/01/';
     fecha_h := '04/01/';
  end
  else if Mes = 4 then
  begin
     fecha_d := '04/01/';
     fecha_h := '05/01/';
  end
  else if Mes = 5 then
  begin
     fecha_d := '05/01/';
     fecha_h := '06/01/';
  end
  else if Mes = 6 then
  begin
     fecha_d := '06/01/';
     fecha_h := '07/01/';
  end
  else if Mes = 7 then
  begin
     fecha_d := '07/01/';
     fecha_h := '08/01/';
  end
  else if Mes = 8 then
  begin
     fecha_d := '08/01/';
     fecha_h := '09/01/';
  end
  else if Mes = 9 then
  begin
     fecha_d := '09/01/';
     fecha_h := '10/01/';
  end
  else if Mes = 10 then
  begin
     fecha_d := '10/01/';
     fecha_h := '11/01/';
  end
  else if Mes = 11 then
  begin
     fecha_d := '11/01/';
     fecha_h := '12/01/';
  end
  else if Mes = 12 then
  begin
     fecha_d := '12/01/';
     fecha_h := '01/01/';
  end;

  Claves := '';
  Claves2 := '';
  Claves3 := '';
  CamposInsert := '';
  ClavesInsert := '';

  // Buscar num_claves y que claves son en tabla de estadisticas
  if ((xEstadisticaCLAVE_1.AsString <> '') and (xEstadisticaNUM_CLAVES.AsInteger > 0)) then
  begin
     Claves := Claves + xEstadisticaCLAVE_1.AsString;
     Claves2 := Claves2 + xEstadisticaCLAVE_1.AsString;
     Claves3 := Claves3 + 'clave_1=:clave_1';
     CamposInsert := CamposInsert + 'clave_1';
     ClavesInsert := ClavesInsert + ':clave_1';
     if (xEstadisticaDESC_CLAVE_1.AsString <> '') then
     begin
        Claves := Claves + ',' + xEstadisticaDESC_CLAVE_1.AsString;
        Claves2 := Claves2 + ',' + xEstadisticaDESC_CLAVE_1.AsString;
        Claves3 := Claves3 + ' AND desc_clave_1=:desc_clave_1';
        CamposInsert := CamposInsert + ',desc_clave_1';
        ClavesInsert := ClavesInsert + ',:desc_clave_1';
     end;
  end;

  if ((xEstadisticaCLAVE_2.AsString <> '') and (xEstadisticaNUM_CLAVES.AsInteger > 1)) then
  begin
     Claves := Claves + ',' + xEstadisticaCLAVE_2.AsString;
     Claves2 := Claves2 + ',' + xEstadisticaCLAVE_2.AsString;
     Claves3 := Claves3 + ' AND clave_2=:clave_2';
     CamposInsert := CamposInsert + ',clave_2';
     ClavesInsert := ClavesInsert + ',:clave_2';
     if (xEstadisticaDESC_CLAVE_2.AsString <> '') then
     begin
        Claves := Claves + ',' + xEstadisticaDESC_CLAVE_2.AsString;
        Claves2 := Claves2 + ',' + xEstadisticaDESC_CLAVE_2.AsString;
        Claves3 := Claves3 + ' AND desc_clave_2=:desc_clave_2';
        CamposInsert := CamposInsert + ',desc_clave_2';
        ClavesInsert := ClavesInsert + ',:desc_clave_2';
     end;
  end;

  if ((xEstadisticaCLAVE_3.AsString <> '') and (xEstadisticaNUM_CLAVES.AsInteger > 2)) then
  begin
     Claves := Claves + ',' + xEstadisticaCLAVE_3.AsString;
     Claves2 := Claves2 + ',' + xEstadisticaCLAVE_3.AsString;
     Claves3 := Claves3 + ' AND clave_3=:clave_3';
     CamposInsert := CamposInsert + ',clave_3';
     ClavesInsert := ClavesInsert + ',:clave_3';
     if (xEstadisticaDESC_CLAVE_3.AsString <> '') then
     begin
        Claves := Claves + ',' + xEstadisticaDESC_CLAVE_3.AsString;
        Claves2 := Claves2 + ',' + xEstadisticaDESC_CLAVE_3.AsString;
        Claves3 := Claves3 + ' AND desc_clave_3=:desc_clave_3';
        CamposInsert := CamposInsert + ',desc_clave_3';
        ClavesInsert := ClavesInsert + ',:desc_clave_3';
     end;
  end;

  if (xEstadisticaCAMPO_AUX_1.AsString <> '') then
  begin
     Claves := Claves + ',' + xEstadisticaCAMPO_AUX_1.AsString;
     Claves2 := Claves2 + ',' + xEstadisticaCAMPO_AUX_1.AsString;
     // Claves3 := Claves3+' AND campo_aux_1=:campo_aux_1';
     CamposInsert := CamposInsert + ',campo_aux_1';
     ClavesInsert := ClavesInsert + ',:campo_aux_1';
  end;

  if (xEstadisticaCAMPO_AUX_2.AsString <> '') then
  begin
     Claves := Claves + ',' + xEstadisticaCAMPO_AUX_2.AsString;
     Claves2 := Claves2 + ',' + xEstadisticaCAMPO_AUX_2.AsString;
     // Claves3 := Claves3+' AND campo_aux_2=:campo_aux_2';
     CamposInsert := CamposInsert + ',campo_aux_2';
     ClavesInsert := ClavesInsert + ',:campo_aux_2';
  end;

  if (xEstadisticaCAMPO_AUX_3.AsString <> '') then
  begin
     Claves := Claves + ',' + xEstadisticaCAMPO_AUX_3.AsString;
     Claves2 := Claves2 + ',' + xEstadisticaCAMPO_AUX_3.AsString;
     // Claves3 := Claves3+' AND campo_aux_3=:campo_aux_3';
     CamposInsert := CamposInsert + ',campo_aux_3';
     ClavesInsert := ClavesInsert + ',:campo_aux_3';
  end;

  if (xEstadisticaCAMPO_AUX_4.AsString <> '') then
  begin
     Claves := Claves + ',' + xEstadisticaCAMPO_AUX_4.AsString;
     Claves2 := Claves2 + ',' + xEstadisticaCAMPO_AUX_4.AsString;
     // Claves3 := Claves3+' AND campo_aux_4=:campo_aux_4';
     CamposInsert := CamposInsert + ',campo_aux_4';
     ClavesInsert := ClavesInsert + ',:campo_aux_4';
  end;

  if (xEstadisticaCAMPO_AUX_5.AsString <> '') then
  begin
     Claves := Claves + ',' + xEstadisticaCAMPO_AUX_5.AsString;
     Claves2 := Claves2 + ',' + xEstadisticaCAMPO_AUX_5.AsString;
     // Claves3 := Claves3+' AND campo_aux_5=:campo_aux_5';
     CamposInsert := CamposInsert + ',campo_aux_5';
     ClavesInsert := ClavesInsert + ',:campo_aux_5';
  end;

  CamposInsert := CamposInsert + ')';
  ClavesInsert := ClavesInsert + ')';

  CondicionesWhere := '';

  if xEstadisticaEMPRESA.AsInteger <> 0 then
  begin
     CondicionesWhere := 'Empresa = ' + xEstadisticaEMPRESA.AsString;
     if xEstadisticaEJERCICIO.AsInteger <> 0 then
        CondicionesWhere := CondicionesWhere + ' and Ejercicio = ' + xEstadisticaEJERCICIO.AsString;
     if xEstadisticaCANAL.AsInteger <> 0 then
        CondicionesWhere := CondicionesWhere + ' and Canal = ' + xEstadisticaCANAL.AsString;
     if xEstadisticaSERIE.AsString <> 'TODAS' then
        CondicionesWhere := CondicionesWhere + ' and Serie = ''' + xEstadisticaSERIE.AsString + '''';
  end
  else if xEstadisticaEJERCICIO.AsInteger <> 0 then
  begin
     CondicionesWhere := 'Ejercicio = ' + xEstadisticaEJERCICIO.AsString;
     if xEstadisticaCANAL.AsInteger <> 0 then
        CondicionesWhere := CondicionesWhere + ' and Canal = ' + xEstadisticaCANAL.AsString;
     if xEstadisticaSERIE.AsString <> 'TODAS' then
        CondicionesWhere := CondicionesWhere + ' and Serie = ''' + xEstadisticaSERIE.AsString + '''';
  end
  else if xEstadisticaCANAL.AsInteger <> 0 then
  begin
     CondicionesWhere := 'Canal = ' + xEstadisticaCANAL.AsString;
     if xEstadisticaSERIE.AsString <> 'TODAS' then
        CondicionesWhere := CondicionesWhere + ' and Serie = ''' + xEstadisticaSERIE.AsString + '''';
  end
  else if xEstadisticaSERIE.AsString <> 'TODAS' then
     CondicionesWhere := 'Serie = ''' + xEstadisticaSERIE.AsString + '''';

  if xEstadisticaREGLAS.AsString <> '' then
  begin
     if CondicionesWhere <> '' then
        CondicionesWhere := CondicionesWhere + ' and ' + xEstadisticaREGLAS.AsString
     else
        CondicionesWhere := xEstadisticaREGLAS.AsString;
  end;

  if xEstadisticaEJERCICIO.AsInteger <> 0 then
  begin  // Si filtramos por ejercicio solo añadimos las fechas de un ejercicio
     if Mes <> 12 then
        FechasWhere := xEstadisticaCLAVES.AsString + '>=''' + fecha_d + xEstadisticaEJERCICIO.AsString + ''' and ' +
           xEstadisticaCLAVES.AsString + '<''' + fecha_h + xEstadisticaEJERCICIO.AsString + ''''
     else
        FechasWhere := xEstadisticaCLAVES.AsString + '>=''' + fecha_d + xEstadisticaEJERCICIO.AsString + ''' and ' +
           xEstadisticaCLAVES.AsString + '<''' + fecha_h + IntToStr(xEstadisticaEJERCICIO.AsInteger + 1) + '''';
  end
  else // Si tenemos todos los ejercicios, tenemos que indicar el intervalo del mes para cada ejercicio
  begin
     with xEjercicios do
     begin
        Close;
        if (xEstadisticaEJERCICIO.AsInteger <> 0) then
        begin
           SelectSQL.Text := 'SELECT EJERCICIO FROM EMP_EJERCICIOS WHERE EMPRESA = :EMPRESA AND ACTIVO = 1 ORDER BY EJERCICIO';
           Params.ByName['EMPRESA'].AsInteger := xEstadisticaEJERCICIO.AsInteger;
        end
        else
           SelectSQL.Text := 'SELECT DISTINCT EJERCICIO FROM EMP_EJERCICIOS WHERE ACTIVO = 1 ORDER BY EJERCICIO';
        Open;
        Ejer := True;
        while not EOF do
        begin
           if Ejer then
           begin
              Ejer := False;

              if Mes <> 12 then
                 FechasWhere := '((' +
                    xEstadisticaCLAVES.AsString + '>=''' + fecha_d + xEjerciciosEJERCICIO.AsString + ''' and ' +
                    xEstadisticaCLAVES.AsString + '<''' + fecha_h + xEjerciciosEJERCICIO.AsString + '''' +
                    ')'
              else
                 FechasWhere := '((' +
                    xEstadisticaCLAVES.AsString + '>=''' + fecha_d + xEjerciciosEJERCICIO.AsString + ''' and ' +
                    xEstadisticaCLAVES.AsString + '<''' + fecha_h + IntToStr(xEjerciciosEJERCICIO.AsInteger + 1) + '''' +
                    ')';
           end
           else
           begin
              if Mes <> 12 then
                 FechasWhere := FechasWhere + ' or (' +
                    xEstadisticaCLAVES.AsString + '>=''' + fecha_d + xEjerciciosEJERCICIO.AsString + ''' and ' +
                    xEstadisticaCLAVES.AsString + '<''' + fecha_h + xEjerciciosEJERCICIO.AsString + '''' +
                    ')'
              else
                 FechasWhere := FechasWhere + ' or (' +
                    xEstadisticaCLAVES.AsString + '>=''' + fecha_d + xEjerciciosEJERCICIO.AsString + ''' and ' +
                    xEstadisticaCLAVES.AsString + '<''' + fecha_h + IntToStr(xEjerciciosEJERCICIO.AsInteger + 1) + '''' +
                    ')';
           end;
           Next;
        end;
        FechasWhere := FechasWhere + ')';

        Close;
     end;
  end;

  if CondicionesWhere <> '' then
     CondicionesWhere := CondicionesWhere + ' AND ' + FechasWhere
  else
     CondicionesWhere := FechasWhere;

  if CondicionesWhere <> '' then
     CondicionesWhere := 'WHERE ' + CondicionesWhere;

  with xSelectMes do
  begin
     Close;
     SelectSQL.Text := 'SELECT ' + Claves + ',' + xEstadisticaACUMULADOS.AsString + ' AS CALC ' +
        'FROM ' + xEstadisticaTABLAS.AsString + ' ' +
        CondicionesWhere +
        ' GROUP BY ' + Claves2;
     DMMain.Log(Format('xSelectMes.SQL' + #13#10 + '%s', [SelectSQL.Text]));
     Open;
     First;
     while not EOF do
     begin
        // Muestro progreso para evitar desesperación ;-)
        Inc(RegistrosProcesados);
        if ((RegistrosProcesados mod 100) = 0) then
           ZFMEstDatos.Log(Format(_('Calculando Mes %d - %s - Registros Porcesados: %d'), [Mes, FormatDatetime('[hh:nn:ss]', Now - InicioLog), RegistrosProcesados]));

        InsertarLinea(Claves3, CamposInsert, ClavesInsert, MesStr, xEstadisticaNUM_CLAVES.AsInteger);
        Next;
     end;

     Close;
  end;
  DMMain.LogFin(Format('CalculaMes(%d)', [Mes]));
end;

procedure TZDMEstDatos.LimpiaTabla(Grupo, Estadistica: integer);
begin
  DMMain.LogIni(Format('LimpiaTabla(%d, %d)', [Grupo, Estadistica]));

  with xEstadistica do
  begin
     Close;
     Params.ByName['GRUPO'].AsInteger := Grupo;
     Params.ByName['ESTADISTICA'].AsInteger := Estadistica;
     Open;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' DELETE FROM EST_ESTADISTICAS_GRUPO ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' SERIE = :SERIE AND ');
        SQL.Add(' ESTADISTICA = :ESTADISTICA AND ');
        SQL.Add(' GRUPO = :GRUPO ');
        Params.ByName['EMPRESA'].AsInteger := xEstadisticaEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := xEstadisticaEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := xEstadisticaCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := xEstadisticaSERIE.AsString;
        Params.ByName['ESTADISTICA'].AsInteger := xEstadisticaESTADISTICA.AsInteger;
        Params.ByName['GRUPO'].AsInteger := xEstadisticaGRUPO.AsInteger;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  DMMain.LogFin(Format('LimpiaTabla(%d, %d)', [Grupo, Estadistica]));
end;

procedure TZDMEstDatos.InsertarLinea(ClavesComprueba, CamposInsert, ClavesInsert, MesStr: string; NumClaves: integer);
var
  NumDescClaves{, NumCamposAux} : smallint;
  ExisteClave : boolean;
begin
  // DMMain.LogIni(Format('InsertarLinea(%s, %s, %s, %s, %d)', [ClavesComprueba, CamposInsert, ClavesInsert, MesStr, NumClaves]));
  NumDescClaves := 0;
  {
  NumCamposAux := 0;

  if (xEstadisticaCAMPO_AUX_1.AsString <> '') then
     Inc(NumCamposAux);
  if (xEstadisticaCAMPO_AUX_2.AsString <> '') then
     Inc(NumCamposAux);
  if (xEstadisticaCAMPO_AUX_3.AsString <> '') then
     Inc(NumCamposAux);
  if (xEstadisticaCAMPO_AUX_4.AsString <> '') then
     Inc(NumCamposAux);
  if (xEstadisticaCAMPO_AUX_5.AsString <> '') then
     Inc(NumCamposAux);
  }

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT FIRST 1 ESTADISTICA ');
        SQL.Add(' FROM EST_ESTADISTICAS_GRUPO ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' SERIE = :SERIE AND ');
        SQL.Add(' ESTADISTICA = :ESTADISTICA AND ');
        SQL.Add(' GRUPO = :GRUPO AND ');
        SQL.Add(ClavesComprueba);
        Params.ByName['EMPRESA'].AsInteger := xEstadisticaEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := xEstadisticaEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := xEstadisticaCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := xEstadisticaSERIE.AsString;
        Params.ByName['ESTADISTICA'].AsInteger := xEstadisticaESTADISTICA.AsInteger;
        Params.ByName['GRUPO'].AsInteger := xEstadisticaGRUPO.AsInteger;
        if NumClaves >= 1 then
           if (xEstadisticaCLAVE_1.AsString <> '') then
           begin
              Params.ByName['CLAVE_1'].AsString := xSelectMes.Fields[0].AsString;
              if (xEstadisticaDESC_CLAVE_1.AsString <> '') then
              begin
                 Params.ByName['DESC_CLAVE_1'].AsString := xSelectMes.Fields[1].AsString;
                 Inc(NumDescClaves);
              end;
           end;
        if NumClaves >= 2 then
           if (xEstadisticaCLAVE_2.AsString <> '') then
           begin
              Params.ByName['CLAVE_2'].AsString := xSelectMes.Fields[1 + NumDescClaves].AsString;
              if (xEstadisticaDESC_CLAVE_2.AsString <> '') then
              begin
                 Params.ByName['DESC_CLAVE_2'].AsString := xSelectMes.Fields[2 + NumDescClaves].AsString;
                 Inc(NumDescClaves);
              end;
           end;
        if NumClaves = 3 then
           if (xEstadisticaCLAVE_3.AsString <> '') then
           begin
              Params.ByName['CLAVE_3'].AsString := xSelectMes.Fields[2 + NumDescClaves].AsString;
              if (xEstadisticaDESC_CLAVE_3.AsString <> '') then
              begin
                 Params.ByName['DESC_CLAVE_3'].AsString := xSelectMes.Fields[3 + NumDescClaves].AsString;
              end;
           end;
        ExecQuery;
        ExisteClave := (FieldByName['ESTADISTICA'].AsInteger <> 0);
        FreeHandle;
     finally
        Free;
     end;
  end;

  NumDescClaves := 0;
  if not ExisteClave then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' INSERT INTO EST_ESTADISTICAS_GRUPO ( ');
           SQL.Add(' EMPRESA, EJERCICIO, CANAL, SERIE, ESTADISTICA, GRUPO, ');
           SQL.Add(CamposInsert);
           SQL.Add(' VALUES (:EMPRESA, :EJERCICIO, :CANAL, :SERIE, :ESTADISTICA, :GRUPO, ');
           SQL.Add(ClavesInsert);
           Params.ByName['EMPRESA'].AsInteger := xEstadisticaEMPRESA.AsInteger; // REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := xEstadisticaEJERCICIO.AsInteger; // REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := xEstadisticaCANAL.AsInteger; // REntorno.Canal;
           Params.ByName['SERIE'].AsString := xEstadisticaSERIE.AsString; // REntorno.Serie;
           Params.ByName['ESTADISTICA'].AsInteger := xEstadisticaESTADISTICA.AsInteger;
           Params.ByName['GRUPO'].AsInteger := xEstadisticaGRUPO.AsInteger;
           if NumClaves >= 1 then
              if (xEstadisticaCLAVE_1.AsString <> '') then
              begin
                 Params.ByName['CLAVE_1'].AsString := xSelectMes.Fields[0].AsString;
                 if (xEstadisticaDESC_CLAVE_1.AsString <> '') then
                 begin
                    Params.ByName['DESC_CLAVE_1'].AsString := xSelectMes.Fields[1].AsString;
                    Inc(NumDescClaves);
                 end;
              end;
           if NumClaves >= 2 then
              if (xEstadisticaCLAVE_2.AsString <> '') then
              begin
                 Params.ByName['CLAVE_2'].AsString := xSelectMes.Fields[1 + NumDescClaves].AsString;
                 if (xEstadisticaDESC_CLAVE_2.AsString <> '') then
                 begin
                    Params.ByName['DESC_CLAVE_2'].AsString := xSelectMes.Fields[2 + NumDescClaves].AsString;
                    Inc(NumDescClaves);
                 end;
              end;
           if NumClaves = 3 then
              if (xEstadisticaCLAVE_3.AsString <> '') then
              begin
                 Params.ByName['CLAVE_3'].AsString := xSelectMes.Fields[2 + NumDescClaves].AsString;
                 if (xEstadisticaDESC_CLAVE_3.AsString <> '') then
                 begin
                    Params.ByName['DESC_CLAVE_3'].AsString := xSelectMes.Fields[3 + NumDescClaves].AsString;
                    Inc(NumDescClaves);
                 end;
              end;
           if (xEstadisticaCAMPO_AUX_1.AsString <> '') then
              Params.ByName['CAMPO_AUX_1'].AsString := xSelectMes.Fields[NumClaves + NumDescClaves].AsString;
           if (xEstadisticaCAMPO_AUX_2.AsString <> '') then
              Params.ByName['CAMPO_AUX_2'].AsString := xSelectMes.Fields[NumClaves + NumDescClaves + 1].AsString;
           if (xEstadisticaCAMPO_AUX_3.AsString <> '') then
              Params.ByName['CAMPO_AUX_3'].AsString := xSelectMes.Fields[NumClaves + NumDescClaves + 2].AsString;
           if (xEstadisticaCAMPO_AUX_4.AsString <> '') then
              Params.ByName['CAMPO_AUX_4'].AsString := xSelectMes.Fields[NumClaves + NumDescClaves + 3].AsString;
           if (xEstadisticaCAMPO_AUX_5.AsString <> '') then
              Params.ByName['CAMPO_AUX_5'].AsString := xSelectMes.Fields[NumClaves + NumDescClaves + 4].AsString;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  NumDescClaves := 0;
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE EST_ESTADISTICAS_GRUPO ');
        SQL.Add(' SET ');
        SQL.Add(' MES' + MesStr + ' = :CALC ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' SERIE = :SERIE AND ');
        SQL.Add(' ESTADISTICA = :ESTADISTICA AND ');
        SQL.Add(' GRUPO = :GRUPO AND ');
        SQL.Add(ClavesComprueba);
        Params.ByName['CALC'].AsFloat := xSelectMes.FieldByName('CALC'{dji NumClaves + NumDescClaves + NumCamposAux}).AsFloat;
        Params.ByName['EMPRESA'].AsInteger := xEstadisticaEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := xEstadisticaEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := xEstadisticaCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := xEstadisticaSERIE.AsString;
        Params.ByName['ESTADISTICA'].AsInteger := xEstadisticaESTADISTICA.AsInteger;
        Params.ByName['GRUPO'].AsInteger := xEstadisticaGRUPO.AsInteger;
        if (NumClaves >= 1) then
           if (xEstadisticaCLAVE_1.AsString <> '') then
           begin
              Params.ByName['CLAVE_1'].AsString := xSelectMes.Fields[0].AsString;
              if (xEstadisticaDESC_CLAVE_1.AsString <> '') then
              begin
                 Params.ByName['DESC_CLAVE_1'].AsString := xSelectMes.Fields[1].AsString;
                 Inc(NumDescClaves);
              end;
           end;
        if (NumClaves >= 2) then
           if (xEstadisticaCLAVE_2.AsString <> '') then
           begin
              Params.ByName['CLAVE_2'].AsString := xSelectMes.Fields[1 + NumDescClaves].AsString;
              if (xEstadisticaDESC_CLAVE_2.AsString <> '') then
              begin
                 Params.ByName['DESC_CLAVE_2'].AsString := xSelectMes.Fields[2 + NumDescClaves].AsString;
                 Inc(NumDescClaves);
              end;
           end;
        if (NumClaves = 3) then
           if (xEstadisticaCLAVE_3.AsString <> '') then
           begin
              Params.ByName['CLAVE_3'].AsString := xSelectMes.Fields[2 + NumDescClaves].AsString;
              if (xEstadisticaDESC_CLAVE_3.AsString <> '') then
              begin
                 Params.ByName['DESC_CLAVE_3'].AsString := xSelectMes.Fields[3 + NumDescClaves].AsString;
                 // Inc(NumDescClaves);
              end;
           end;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
  // DMMain.LogFin(Format('InsertarLinea(%s, %s, %s, %s, %d)', [ClavesComprueba, CamposInsert, ClavesInsert, MesStr, NumClaves]));
end;

function TZDMEstDatos.TituloMes(Mes: string): string;
begin
  with xDescMeses do
  begin
     Close;
     Params.ByName['MES'].AsString := Mes;
     Params.ByName['IDIOMA'].AsString := 'CAS';
     Open;
  end;

  Result := xDescMesesTITULO.AsString;
end;

procedure TZDMEstDatos.xEstadisticaAfterOpen(DataSet: TDataSet);
begin
  xDescGrupo.Close;
  xDescGrupo.Open;

  xDescEstadistica.Close;
  xDescEstadistica.Open;

  xDescPeriodo.Close;
  xDescPeriodo.Params.ByName['PERIODO'].AsString := ZFMEstDatos.EFPeriodo.Text;
  xDescPeriodo.Open;
end;

procedure TZDMEstDatos.frEstadisticaGetValue(const ParName: string; var ParValue: variant);
var
  col : integer;
begin
  DMListados.GetValue(ParName, ParValue);

  if ParName = 'VerEnero' then
  begin
     ParValue := False;
     col := EncuentraField(ZFMEstDatos.DBGFEstadistica, 'MES01');
     if (col >= 0) then
        ParValue := ZFMEstDatos.DBGFEstadistica.Columns[col].Visible;
  end;

  if ParName = 'VerFebrero' then
  begin
     ParValue := False;
     col := EncuentraField(ZFMEstDatos.DBGFEstadistica, 'MES02');
     if (col >= 0) then
        ParValue := ZFMEstDatos.DBGFEstadistica.Columns[col].Visible;
  end;

  if ParName = 'VerMarzo' then
  begin
     ParValue := False;
     col := EncuentraField(ZFMEstDatos.DBGFEstadistica, 'MES03');
     if (col >= 0) then
        ParValue := ZFMEstDatos.DBGFEstadistica.Columns[col].Visible;
  end;

  if ParName = 'VerAbril' then
  begin
     ParValue := False;
     col := EncuentraField(ZFMEstDatos.DBGFEstadistica, 'MES04');
     if (col >= 0) then
        ParValue := ZFMEstDatos.DBGFEstadistica.Columns[col].Visible;
  end;

  if ParName = 'VerMayo' then
  begin
     ParValue := False;
     col := EncuentraField(ZFMEstDatos.DBGFEstadistica, 'MES05');
     if (col >= 0) then
        ParValue := ZFMEstDatos.DBGFEstadistica.Columns[col].Visible;
  end;

  if ParName = 'VerJunio' then
  begin
     ParValue := False;
     col := EncuentraField(ZFMEstDatos.DBGFEstadistica, 'MES06');
     if (col >= 0) then
        ParValue := ZFMEstDatos.DBGFEstadistica.Columns[col].Visible;
  end;

  if ParName = 'VerJulio' then
  begin
     ParValue := False;
     col := EncuentraField(ZFMEstDatos.DBGFEstadistica, 'MES07');
     if (col >= 0) then
        ParValue := ZFMEstDatos.DBGFEstadistica.Columns[col].Visible;
  end;

  if ParName = 'VerAgosto' then
  begin
     ParValue := False;
     col := EncuentraField(ZFMEstDatos.DBGFEstadistica, 'MES08');
     if (col >= 0) then
        ParValue := ZFMEstDatos.DBGFEstadistica.Columns[col].Visible;
  end;

  if ParName = 'VerSeptiembre' then
  begin
     ParValue := False;
     col := EncuentraField(ZFMEstDatos.DBGFEstadistica, 'MES09');
     if (col >= 0) then
        ParValue := ZFMEstDatos.DBGFEstadistica.Columns[col].Visible;
  end;

  if ParName = 'VerOctubre' then
  begin
     ParValue := False;
     col := EncuentraField(ZFMEstDatos.DBGFEstadistica, 'MES10');
     if (col >= 0) then
        ParValue := ZFMEstDatos.DBGFEstadistica.Columns[col].Visible;
  end;

  if ParName = 'VerNoviembre' then
  begin
     ParValue := False;
     col := EncuentraField(ZFMEstDatos.DBGFEstadistica, 'MES11');
     if (col >= 0) then
        ParValue := ZFMEstDatos.DBGFEstadistica.Columns[col].Visible;
  end;

  if ParName = 'VerDiciembre' then
  begin
     ParValue := False;
     col := EncuentraField(ZFMEstDatos.DBGFEstadistica, 'MES12');
     if (col >= 0) then
        ParValue := ZFMEstDatos.DBGFEstadistica.Columns[col].Visible;
  end;

  if ParName = 'VerTotal' then
  begin
     ParValue := False;
     col := EncuentraField(ZFMEstDatos.DBGFEstadistica, 'TOTALPERIODO');
     if (col >= 0) then
        ParValue := ZFMEstDatos.DBGFEstadistica.Columns[col].Visible;
  end;
end;

procedure TZDMEstDatos.frEstadisticaBeforePrint(Memo: TStringList; View: TfrView);
begin
  if (Memo.Count > 0) then
  begin
     DMListados.BeforePrint(Memo, View);
  end;
end;

procedure TZDMEstDatos.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

end.
