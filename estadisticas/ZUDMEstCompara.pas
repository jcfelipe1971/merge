unit ZUDMEstCompara;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBDataSetRO, FIBTableDataSet, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport;

type
  TZDMEstCompara = class(TDataModule)
     TLocal: THYTransaction;
     xDescPeriodo: TFIBDataSetRO;
     xDescPeriodoTITULO: TFIBStringField;
     DSxDescPeriodo: TDataSource;
     QMEstadistica: TFIBTableSet;
     DSQMEstadistica: TDataSource;
     xEstadistica: TFIBDataSetRO;
     xDescGrupo: TFIBDataSetRO;
     xDescGrupoTITULO: TFIBStringField;
     DSxDescGrupo: TDataSource;
     xDescEst1: TFIBDataSetRO;
     xDescEst1TITULO: TFIBStringField;
     DSxDescEst1: TDataSource;
     xDescEst2: TFIBDataSetRO;
     DSxDescEst2: TDataSource;
     frEstadisticaComp: TfrHYReport;
     frDBDSEstadistica: TfrDBDataSet;
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
     xEstadisticaComp: TFIBDataSetRO;
     xEstadisticaCompESTADISTICA: TIntegerField;
     xEstadisticaCompGRUPO: TIntegerField;
     xEstadisticaCompTITULO: TFIBStringField;
     xEstadisticaCompNUM_CLAVES: TIntegerField;
     xEstadisticaCompCLAVE_1: TFIBStringField;
     xEstadisticaCompTITULO_1: TFIBStringField;
     xEstadisticaCompDESC_CLAVE_1: TFIBStringField;
     xEstadisticaCompTITULO_DESC_1: TFIBStringField;
     xEstadisticaCompCLAVE_2: TFIBStringField;
     xEstadisticaCompTITULO_2: TFIBStringField;
     xEstadisticaCompDESC_CLAVE_2: TFIBStringField;
     xEstadisticaCompTITULO_DESC_2: TFIBStringField;
     xEstadisticaCompCLAVE_3: TFIBStringField;
     xEstadisticaCompTITULO_3: TFIBStringField;
     xEstadisticaCompDESC_CLAVE_3: TFIBStringField;
     xEstadisticaCompTITULO_DESC_3: TFIBStringField;
     xEstadisticaCompACUMULADOS: TBlobField;
     xEstadisticaCompTABLAS: TBlobField;
     xEstadisticaCompCLAVES: TBlobField;
     xEstadisticaCompREGLAS: TBlobField;
     xEstadisticaCompEMPRESA: TIntegerField;
     xEstadisticaCompEJERCICIO: TIntegerField;
     xEstadisticaCompCANAL: TIntegerField;
     xEstadisticaCompSERIE: TFIBStringField;
     xEstadisticaCompORDEN_TOTAL: TIntegerField;
     QMEstadisticaCLAVE_1: TFIBStringField;
     QMEstadisticaDESC_CLAVE_1: TFIBStringField;
     QMEstadisticaCLAVE_2: TFIBStringField;
     QMEstadisticaDESC_CLAVE_2: TFIBStringField;
     QMEstadisticaCLAVE_3: TFIBStringField;
     QMEstadisticaDESC_CLAVE_3: TFIBStringField;
     QMEstadisticaTOTALPERIODO1: TFloatField;
     QMEstadisticaTOTALPERIODO2: TFloatField;
     TUpdate: THYTransaction;
     xDescEst2TITULO: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure VerComparacion(Grupo, Estadistica1, Estadistica2: integer; Periodo: string; Modo: integer);
  end;

var
  ZDMEstCompara : TZDMEstCompara;

implementation

uses UDMListados, UFormGest, UEntorno;

{$R *.dfm}

procedure TZDMEstCompara.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMEstadisticaTOTALPERIODO1.DisplayFormat := MascaraN;
  QMEstadisticaTOTALPERIODO2.DisplayFormat := MascaraN;

  AbreData(TDMListados, DMListados);
end;

procedure TZDMEstCompara.DataModuleDestroy(Sender: TObject);
begin
  CierraData(DMListados);
end;

procedure TZDMEstCompara.VerComparacion(Grupo, Estadistica1, Estadistica2: integer; Periodo: string; Modo: integer);
var
  campo, campo_comp, str : string;
  nombre_claves, nombre_claves_comp : string;
  Num_claves, Num_claves_comp : integer;
begin
  //DATOS DE LA ESTADISTICA 1
  with xEstadistica do
  begin
     Close;
     Params.ByName['GRUPO'].AsInteger := Grupo;
     Params.ByName['ESTADISTICA'].AsInteger := Estadistica1;
     Open;
  end;

  //DATOS DE LA ESTADISTICA 2 (de comparacion)
  with xEstadisticaComp do
  begin
     Close;
     Params.ByName['GRUPO'].AsInteger := Grupo;
     Params.ByName['ESTADISTICA'].AsInteger := Estadistica2;
     Open;
  end;

  Num_claves := xEstadisticaNUM_CLAVES.AsInteger;
  Num_claves_comp := xEstadisticaCompNUM_CLAVES.AsInteger;

  if (Num_claves = Num_claves_comp) then
  begin
     nombre_claves := xEstadisticaCLAVE_1.AsString;
     nombre_claves_comp := xEstadisticaCompCLAVE_1.AsString;

     if Periodo = '01' then
     begin
        campo := 'est.MES01 as TotalPeriodo1, comp.MES01 as TotalPeriodo2';
        campo_comp := 'est2.MES01 as TotalPeriodo1, comp2.MES01 as TotalPeriodo2';
     end
     else if Periodo = '02' then
     begin
        campo := 'est.MES02 as TotalPeriodo1, comp.MES02 as TotalPeriodo2';
        campo_comp := 'est2.MES02 as TotalPeriodo1, comp2.MES02 as TotalPeriodo2';
     end
     else if Periodo = '03' then
     begin
        campo := 'est.MES03 as TotalPeriodo1, comp.MES03 as TotalPeriodo2';
        campo_comp := 'est2.MES03 as TotalPeriodo1, comp2.MES03 as TotalPeriodo2';
     end
     else if Periodo = '04' then
     begin
        campo := 'est.MES04 as TotalPeriodo1, comp.MES04 as TotalPeriodo2';
        campo_comp := 'est2.MES04 as TotalPeriodo1, comp2.MES04 as TotalPeriodo2';
     end
     else if Periodo = '05' then
     begin
        campo := 'est.MES05 as TotalPeriodo1, comp.MES05 as TotalPeriodo2';
        campo_comp := 'est2.MES05 as TotalPeriodo1, comp2.MES05 as TotalPeriodo2';
     end
     else if Periodo = '06' then
     begin
        campo := 'est.MES06 as TotalPeriodo1, comp.MES06 as TotalPeriodo2';
        campo_comp := 'est2.MES06 as TotalPeriodo1, comp2.MES06 as TotalPeriodo2';
     end
     else if Periodo = '07' then
     begin
        campo := 'est.MES07 as TotalPeriodo1, comp.MES07 as TotalPeriodo2';
        campo_comp := 'est2.MES07 as TotalPeriodo1, comp2.MES07 as TotalPeriodo2';
     end
     else if Periodo = '08' then
     begin
        campo := 'est.MES08 as TotalPeriodo1, comp.MES08 as TotalPeriodo2';
        campo_comp := 'est2.MES08 as TotalPeriodo1, comp2.MES08 as TotalPeriodo2';
     end
     else if Periodo = '09' then
     begin
        campo := 'est.MES09 as TotalPeriodo1, comp.MES09 as TotalPeriodo2';
        campo_comp := 'est2.MES09 as TotalPeriodo1, comp2.MES09 as TotalPeriodo2';
     end
     else if Periodo = '10' then
     begin
        campo := 'est.MES10 as TotalPeriodo1, comp.MES10 as TotalPeriodo2';
        campo_comp := 'est2.MES10 as TotalPeriodo1, comp2.MES10 as TotalPeriodo2';
     end
     else if Periodo = '11' then
     begin
        campo := 'est.MES11 as TotalPeriodo1, comp.MES11 as TotalPeriodo2';
        campo_comp := 'est2.MES11 as TotalPeriodo1, comp2.MES11 as TotalPeriodo2';
     end
     else if Periodo = '12' then
     begin
        campo := 'est.MES12 as TotalPeriodo1, comp.MES12 as TotalPeriodo2';
        campo_comp := 'est2.MES12 as TotalPeriodo1, comp2.MES12 as TotalPeriodo2';
     end
     else if Periodo = '13' then
     begin
        campo := 'est.MES01+est.MES02+est.MES03 as TotalPeriodo1, comp.MES01+comp.MES02+comp.MES03 as TotalPeriodo2';
        campo_comp := 'est2.MES01+est2.MES02+est2.MES03 as TotalPeriodo1, comp2.MES01+comp2.MES02+comp2.MES03 as TotalPeriodo2';
     end
     else if Periodo = '14' then
     begin
        campo := 'est.MES04+est.MES05+est.MES06 as TotalPeriodo1, comp.MES04+comp.MES05+comp.MES06 as TotalPeriodo2';
        campo_comp := 'est2.MES04+est2.MES05+est2.MES06 as TotalPeriodo1, comp2.MES04+comp2.MES05+comp2.MES06 as TotalPeriodo2';
     end
     else if Periodo = '15' then
     begin
        campo := 'est.MES07+est.MES08+est.MES09 as TotalPeriodo1, comp.MES07+comp.MES08+comp.MES09 as TotalPeriodo2';
        campo_comp := 'est2.MES07+est2.MES08+est2.MES09 as TotalPeriodo1, comp2.MES07+comp2.MES08+comp2.MES09 as TotalPeriodo2';
     end
     else if Periodo = '16' then
     begin
        campo := 'est.MES10+est.MES11+est.MES12 as TotalPeriodo1, comp.MES10+comp.MES11+comp.MES12 as TotalPeriodo2';
        campo_comp := 'est2.MES10+est2.MES11+est2.MES12 as TotalPeriodo1, comp2.MES10+comp2.MES11+comp2.MES12 as TotalPeriodo2';
     end
     else if Periodo = '17' then
     begin
        campo := 'est.MES01+est.MES02+est.MES03+est.MES04+est.MES05+est.MES06 as TotalPeriodo1,' +
           'comp.MES01+comp.MES02+comp.MES03+comp.MES04+comp.MES05+comp.MES06 as TotalPeriodo2';
        campo_comp := 'est2.MES01+est2.MES02+est2.MES03+est2.MES04+est2.MES05+est2.MES06 as TotalPeriodo1,' +
           'comp2.MES01+comp2.MES02+comp2.MES03+comp2.MES04+comp2.MES05+comp2.MES06 as TotalPeriodo2';
     end
     else if Periodo = '18' then
     begin
        campo := 'est.MES07+est.MES08+est.MES09+est.MES10+est.MES11+est.MES12 as TotalPeriodo1,' +
           'comp.MES07+comp.MES08+comp.MES09+comp.MES10+comp.MES11+comp.MES12 as TotalPeriodo2';
        campo_comp := 'est2.MES07+est2.MES08+est2.MES09+est2.MES10+est2.MES11+est2.MES12 as TotalPeriodo1,' +
           'comp2.MES07+comp2.MES08+comp2.MES09+comp2.MES10+comp2.MES11+comp2.MES12 as TotalPeriodo2';
     end
     else
     begin
        campo := 'est.MES01+est.MES02+est.MES03+est.MES04+est.MES05+est.MES06+est.MES07+est.MES08+est.MES09+est.MES10+est.MES11+est.MES12 as TotalPeriodo1,' +
           'comp.MES01+comp.MES02+comp.MES03+comp.MES04+comp.MES05+comp.MES06+comp.MES07+comp.MES08+comp.MES09+comp.MES10+comp.MES11+comp.MES12 as TotalPeriodo2';
        campo_comp := 'est2.MES01+est2.MES02+est2.MES03+est2.MES04+est2.MES05+est2.MES06+est2.MES07+est2.MES08+est2.MES09+est2.MES10+est2.MES11+est2.MES12 as TotalPeriodo1,' +
           'comp2.MES01+comp2.MES02+comp2.MES03+comp2.MES04+comp2.MES05+comp2.MES06+comp2.MES07+comp2.MES08+comp2.MES09+comp2.MES10+comp2.MES11+comp2.MES12 as TotalPeriodo2';
     end;

     campo := 'est.clave_1,est.desc_clave_1,est.clave_2,est.desc_clave_2,est.clave_3,est.desc_clave_3,' + campo;
     campo_comp := 'comp2.clave_1,comp2.desc_clave_1,comp2.clave_2,comp2.desc_clave_2,comp2.clave_3,comp2.desc_clave_3,' + campo_comp;

     if Num_claves > 1 then
     begin
        nombre_claves := nombre_claves + xEstadisticaCLAVE_2.AsString;
        nombre_claves_comp := nombre_claves_comp + xEstadisticaCompCLAVE_2.AsString;
     end;
     if Num_claves > 2 then
     begin
        nombre_claves := nombre_claves + xEstadisticaCLAVE_3.AsString;
        nombre_claves_comp := nombre_claves_comp + xEstadisticaCompCLAVE_3.AsString;
     end;

     if (Modo = -1) then
     begin
        with QMEstadistica do
        begin
           Close;
           TableName := 'EST_ESTADISTICAS_GRUPO';//_'+IntToStr(Grupo);
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT ' + campo);
           SelectSQL.Add(' FROM EST_ESTADISTICAS_GRUPO EST ');
           SelectSQL.Add(' LEFT JOIN EST_ESTADISTICAS_GRUPO COMP ');
           SelectSQL.Add(' ON (EST.GRUPO = COMP.GRUPO AND EST.ESTADISTICA <> COMP.ESTADISTICA AND ');
           SelectSQL.Add(' (COMP.ESTADISTICA = :ESTADISTICA_COMP OR COMP.ESTADISTICA IS NULL) AND ');
           SelectSQL.Add(' EST.CLAVE_1 = COMP.CLAVE_1 AND ');
           SelectSQL.Add(' EST.CLAVE_2 = COMP.CLAVE_2 AND ');
           SelectSQL.Add(' EST.CLAVE_3 = COMP.CLAVE_3) ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' EST.GRUPO = :GRUPO AND ');
           SelectSQL.Add(' EST.ESTADISTICA = :ESTADISTICA AND ');
           SelectSQL.Add(' EST.EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' EST.EJERCICIO = :EJERCICIO AND ');
           SelectSQL.Add(' EST.CANAL = :CANAL AND ');
           SelectSQL.Add(' EST.SERIE = :SERIE AND ');
           SelectSQL.Add(' ((COMP.EMPRESA = :EMPRESA_COMP OR COMP.EMPRESA IS NULL) AND ');
           SelectSQL.Add(' (COMP.EJERCICIO = :EJERCICIO_COMP OR COMP.EJERCICIO IS NULL) AND ');
           SelectSQL.Add(' (COMP.CANAL = :CANAL_COMP OR COMP.CANAL IS NULL) AND ');
           SelectSQL.Add(' (COMP.SERIE = :SERIE_COMP OR COMP.SERIE IS NULL)) ');
           SelectSQL.Add(' UNION ');
           SelectSQL.Add(' SELECT ' + campo_comp);
           SelectSQL.Add(' FROM EST_ESTADISTICAS_GRUPO EST2 RIGHT ');
           SelectSQL.Add(' JOIN EST_ESTADISTICAS_GRUPO COMP2 ');
           SelectSQL.Add(' ON (EST2.GRUPO = COMP2.GRUPO AND EST2.ESTADISTICA <> COMP2.ESTADISTICA AND ');
           SelectSQL.Add(' (EST2.ESTADISTICA = :ESTADISTICA OR EST2.ESTADISTICA IS NULL) AND ');
           SelectSQL.Add(' EST2.CLAVE_1 = COMP2.CLAVE_1 AND ');
           SelectSQL.Add(' EST2.CLAVE_2 = COMP2.CLAVE_2 AND ');
           SelectSQL.Add(' EST2.CLAVE_3 = COMP2.CLAVE_3) ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' COMP2.GRUPO = :GRUPO AND ');
           SelectSQL.Add(' COMP2.ESTADISTICA = :ESTADISTICA_COMP AND ');
           SelectSQL.Add(' COMP2.EMPRESA = :EMPRESA_COMP AND ');
           SelectSQL.Add(' COMP2.EJERCICIO = :EJERCICIO_COMP AND ');
           SelectSQL.Add(' COMP2.CANAL = :CANAL_COMP AND ');
           SelectSQL.Add(' COMP2.SERIE = :SERIE_COMP AND ');
           SelectSQL.Add(' ((EST2.EMPRESA = :EMPRESA OR EST2.EMPRESA IS NULL) AND ');
           SelectSQL.Add(' (EST2.EJERCICIO = :EJERCICIO OR EST2.EJERCICIO IS NULL) AND ');
           SelectSQL.Add(' (EST2.CANAL = :CANAL OR EST2.CANAL IS NULL) AND ');
           SelectSQL.Add(' (EST2.SERIE = :SERIE OR EST2.SERIE IS NULL)) ');
           Params.ByName['GRUPO'].AsInteger := Grupo;
           Params.ByName['ESTADISTICA'].AsInteger := Estadistica1;
           Params.ByName['ESTADISTICA_COMP'].AsInteger := Estadistica2;
           Params.ByName['EMPRESA'].AsInteger := xEstadisticaEMPRESA.AsInteger;
           Params.ByName['EJERCICIO'].AsInteger := xEstadisticaEJERCICIO.AsInteger; //REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := xEstadisticaCANAL.AsInteger; //REntorno.Canal;
           Params.ByName['SERIE'].AsString := xEstadisticaSERIE.AsString; //REntorno.Serie;
           Params.ByName['EMPRESA_COMP'].AsInteger := xEstadisticaCompEMPRESA.AsInteger;
           Params.ByName['EJERCICIO_COMP'].AsInteger := xEstadisticaCompEJERCICIO.AsInteger; //REntorno.Ejercicio;
           Params.ByName['CANAL_COMP'].AsInteger := xEstadisticaCompCANAL.AsInteger; //REntorno.Canal;
           Params.ByName['SERIE_COMP'].AsString := xEstadisticaCompSERIE.AsString; //REntorno.Serie;
           Open;
        end;
     end;

     if (nombre_claves = nombre_claves_comp) then
        if (Modo > -1) then
        begin
           with frEstadisticaComp do
           begin
              DMListados.Cargar(7002, '');
              LoadFromFIB(REntorno.Formato, str);
              PrepareReport;
              case Modo of
                 0: ShowPreparedReport;
                 1: PrintPreparedReport('', REntorno.Copias);
              end;
           end;
           DMListados.LimpiaEntorno;
        end;
  end; //END IF (Num_claves=Num_claves_comp)
end;

procedure TZDMEstCompara.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

end.
