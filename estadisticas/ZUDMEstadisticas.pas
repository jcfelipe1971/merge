unit ZUDMEstadisticas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, FIBQuery, HYFIBQuery, FIBDataSetRO;

type
  TZDMEstadisticas = class(TDataModule)
     TLocal: THYTransaction;
     QMGrupo: TFIBTableSet;
     QMGrupoGRUPO: TIntegerField;
     QMGrupoTITULO: TFIBStringField;
     DSQMGrupo: TDataSource;
     QMDetalle: TFIBTableSet;
     DSQMDetalle: TDataSource;
     QDuplicaEst: THYFIBQuery;
     xEmpresas: TFIBDataSetRO;
     xEmpresasEMPRESA: TIntegerField;
     xEmpresasTITULO: TFIBStringField;
     xEjercicios: TFIBDataSetRO;
     xEjerciciosEJERCICIO: TIntegerField;
     xCanales: TFIBDataSetRO;
     xCanalesCANAL: TIntegerField;
     xSeries: TFIBDataSetRO;
     xSeriesSERIE: TFIBStringField;
     DSxEmpresas: TDataSource;
     DSxEjercicios: TDataSource;
     DSxCanales: TDataSource;
     DSxSeries: TDataSource;
     QMDetalleESTADISTICA: TIntegerField;
     QMDetalleGRUPO: TIntegerField;
     QMDetalleTITULO: TFIBStringField;
     QMDetalleNUM_CLAVES: TIntegerField;
     QMDetalleCLAVE_1: TFIBStringField;
     QMDetalleTITULO_1: TFIBStringField;
     QMDetalleDESC_CLAVE_1: TFIBStringField;
     QMDetalleTITULO_DESC_1: TFIBStringField;
     QMDetalleCLAVE_2: TFIBStringField;
     QMDetalleTITULO_2: TFIBStringField;
     QMDetalleDESC_CLAVE_2: TFIBStringField;
     QMDetalleTITULO_DESC_2: TFIBStringField;
     QMDetalleCLAVE_3: TFIBStringField;
     QMDetalleTITULO_3: TFIBStringField;
     QMDetalleDESC_CLAVE_3: TFIBStringField;
     QMDetalleTITULO_DESC_3: TFIBStringField;
     QMDetalleACUMULADOS: TBlobField;
     QMDetalleTABLAS: TBlobField;
     QMDetalleCLAVES: TBlobField;
     QMDetalleREGLAS: TBlobField;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleEJERCICIO: TIntegerField;
     QMDetalleCANAL: TIntegerField;
     QMDetalleSERIE: TFIBStringField;
     QMDetalleORDEN_TOTAL: TIntegerField;
     SPMaxGrupo: THYFIBQuery;
     SPMaxEstadistica: THYFIBQuery;
     QMDetalleCAMPO_AUX_1: TFIBStringField;
     QMDetalleTIT_CAMPO_AUX_1: TFIBStringField;
     QMDetalleCAMPO_AUX_2: TFIBStringField;
     QMDetalleTIT_CAMPO_AUX_2: TFIBStringField;
     QMDetalleCAMPO_AUX_3: TFIBStringField;
     QMDetalleTIT_CAMPO_AUX_3: TFIBStringField;
     QMDetalleCAMPO_AUX_4: TFIBStringField;
     QMDetalleTIT_CAMPO_AUX_4: TFIBStringField;
     QMDetalleCAMPO_AUX_5: TFIBStringField;
     QMDetalleTIT_CAMPO_AUX_5: TFIBStringField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMGrupoAfterOpen(DataSet: TDataSet);
     procedure QMGrupoAfterScroll(DataSet: TDataSet);
     procedure QMDetalleNUM_CLAVESChange(Sender: TField);
     procedure QMDetalleAfterOpen(DataSet: TDataSet);
     procedure QMDetalleAfterScroll(DataSet: TDataSet);
     procedure ActivaEstadistica(DataSet: TDataSet);
     procedure DesactivaEstadistica(DataSet: TDataSet);
     procedure QMGrupoBeforePost(DataSet: TDataSet);
     procedure QMDetalleBeforePost(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure RellenaEmpresas;
     procedure RellenaEjercicios(Empresa: integer);
     procedure RellenaCanales(Empresa, Ejercicio: integer);
     procedure RellenaSeries(Empresa, Ejercicio, Canal: integer);
     procedure DuplicaEstadistica;
     procedure BusquedaCompleja;
  end;

var
  ZDMEstadisticas : TZDMEstadisticas;

implementation

uses UDMMain, UEntorno, ZUFMEstadisticas, UFBusca;

{$R *.dfm}

procedure TZDMEstadisticas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMGrupo.Open;
end;

procedure TZDMEstadisticas.RellenaEmpresas;
var
  Empresa : integer;
begin
  ZFMEstadisticas.DBCBVEmpresas.Items.Clear;
  ZFMEstadisticas.DBCBVEmpresas.Values.Clear;
  ZFMEstadisticas.DBCBVEmpresas.Items.AddObject(_('Todas las Empresas'), Pointer(0));
  ZFMEstadisticas.DBCBVEmpresas.Values.AddObject('0', Pointer(0));

  with xEmpresas do
  begin
     Close;
     Open;
     while not EOF do
     begin
        Empresa := xEmpresasEMPRESA.AsInteger;
        ZFMEstadisticas.DBCBVEmpresas.Items.AddObject(IntToStr(Empresa) + ' - ' + xEmpresasTITULO.AsString, Pointer(Empresa));
        ZFMEstadisticas.DBCBVEmpresas.Values.AddObject(IntToStr(Empresa), Pointer(Empresa));
        Next;
     end;
  end;
  ZFMEstadisticas.DBCBVEmpresas.ItemIndex := 0;
end;

procedure TZDMEstadisticas.RellenaEjercicios(Empresa: integer);
var
  Ejercicio : integer;
begin
  ZFMEstadisticas.DBCBVEjercicios.Items.Clear;
  ZFMEstadisticas.DBCBVEjercicios.Values.Clear;
  ZFMEstadisticas.DBCBVEjercicios.Items.AddObject(_('Todos los Ejercicios'), Pointer(0));
  ZFMEstadisticas.DBCBVEjercicios.Values.AddObject('0', Pointer(0));

  with xEjercicios do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT DISTINCT EJERCICIO FROM EMP_EJERCICIOS ');
     SelectSQL.Add(' WHERE ACTIVO = 1 ');
     if (Empresa <> 0) then
        SelectSQL.Add(' AND EMPRESA = :EMPRESA ');
     SelectSQL.Add(' ORDER BY EJERCICIO ');
     if (Empresa <> 0) then
        Params.ByName['EMPRESA'].AsInteger := Empresa;
     Open;

     while not EOF do
     begin
        Ejercicio := xEjerciciosEJERCICIO.AsInteger;
        ZFMEstadisticas.DBCBVEjercicios.Items.AddObject(_('Ejercicio') + ' ' + IntToStr(Ejercicio), Pointer(Ejercicio));
        ZFMEstadisticas.DBCBVEjercicios.Values.AddObject(IntToStr(Ejercicio), Pointer(Ejercicio));
        Next;
     end;
  end;

  ZFMEstadisticas.DBCBVEjercicios.ItemIndex := 0;
end;

procedure TZDMEstadisticas.RellenaCanales(Empresa, Ejercicio: integer);
var
  Canal : integer;
begin
  ZFMEstadisticas.DBCBVCanales.Items.Clear;
  ZFMEstadisticas.DBCBVCanales.Values.Clear;
  ZFMEstadisticas.DBCBVCanales.Items.AddObject(_('Todos los Canales'), Pointer(0));
  ZFMEstadisticas.DBCBVCanales.Values.AddObject('0', Pointer(0));

  with xCanales do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT DISTINCT CANAL FROM EMP_CANALES ');
     SelectSQL.Add(' WHERE ACTIVO = 1 ');
     if (Empresa <> 0) then
        SelectSQL.Add(' AND EMPRESA = :EMPRESA ');
     if (Ejercicio <> 0) then
        SelectSQL.Add(' AND EJERCICIO = :EJERCICIO ');
     SelectSQL.Add(' ORDER BY CANAL ');
     if (Empresa <> 0) then
        Params.ByName['EMPRESA'].AsInteger := Empresa;
     if (Ejercicio <> 0) then
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     Open;

     while not EOF do
     begin
        Canal := xCanalesCANAL.AsInteger;
        ZFMEstadisticas.DBCBVCanales.Items.AddObject(_('Canal') + ' ' + IntToStr(Canal), Pointer(Canal));
        ZFMEstadisticas.DBCBVCanales.Values.AddObject(IntToStr(Canal), Pointer(Canal));
        Next;
     end;
  end;

  ZFMEstadisticas.DBCBVCanales.ItemIndex := 0;
end;

procedure TZDMEstadisticas.RellenaSeries(Empresa, Ejercicio, Canal: integer);
var
  Serie : string;
begin
  ZFMEstadisticas.DBCBVSeries.Items.Clear;
  ZFMEstadisticas.DBCBVSeries.Values.Clear;
  ZFMEstadisticas.DBCBVSeries.Items.AddObject(_('Todas las Series'), Pointer(Serie));
  ZFMEstadisticas.DBCBVSeries.Values.AddObject('TODAS', Pointer(Serie));

  with xSeries do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT DISTINCT SERIE FROM EMP_SERIES ');
     SelectSQL.Add(' WHERE ACTIVO = 1 ');
     if (Empresa <> 0) then
        SelectSQL.Add(' and EMPRESA = :EMPRESA ');
     if (Ejercicio <> 0) then
        SelectSQL.Add(' and EJERCICIO = :EJERCICIO ');
     if (Canal <> 0) then
        SelectSQL.Add(' and CANAL = :CANAL ');
     SelectSQL.Add(' ORDER BY SERIE ');
     if (Empresa <> 0) then
        Params.ByName['EMPRESA'].AsInteger := Empresa;
     if (Ejercicio <> 0) then
        Params.ByName['EJERCICIO'].AsInteger := Ejercicio;
     if (Canal <> 0) then
        Params.ByName['CANAL'].AsInteger := Canal;
     Open;

     while (not EOF) do
     begin
        Serie := xSeriesSERIE.AsString;
        ZFMEstadisticas.DBCBVSeries.Items.AddObject(_('Serie') + ' ' + Serie, Pointer(Serie));
        ZFMEstadisticas.DBCBVSeries.Values.AddObject(Serie, Pointer(Serie));
        Next;
     end;
  end;

  ZFMEstadisticas.DBCBVSeries.ItemIndex := 0;
end;

procedure TZDMEstadisticas.QMGrupoAfterOpen(DataSet: TDataSet);
begin
  QMDetalle.Close;
  QMDetalle.Open;
end;

procedure TZDMEstadisticas.QMDetalleNewRecord(DataSet: TDataSet);
begin
  QMDetalleGRUPO.AsInteger := QMGrupoGRUPO.AsInteger;
  QMDetalleNUM_CLAVES.AsInteger := 3;

  ZFMEstadisticas.DBCBVEmpresas.ItemIndex := 0;
  ZFMEstadisticas.DBCBVEjercicios.ItemIndex := 0;
  ZFMEstadisticas.DBCBVCanales.ItemIndex := 0;
  ZFMEstadisticas.DBCBVSeries.ItemIndex := 0;
end;

procedure TZDMEstadisticas.QMGrupoAfterScroll(DataSet: TDataSet);
begin
  QMDetalle.Close;
  QMDetalle.Open;
end;

procedure TZDMEstadisticas.QMDetalleNUM_CLAVESChange(Sender: TField);
begin
  ZFMEstadisticas.NumClaves(Sender.AsInteger);
end;

procedure TZDMEstadisticas.QMDetalleAfterOpen(DataSet: TDataSet);
begin
  ZFMEstadisticas.NumClaves(QMDetalleNUM_CLAVES.AsInteger);
end;

procedure TZDMEstadisticas.QMDetalleAfterScroll(DataSet: TDataSet);
begin
  ZFMEstadisticas.NumClaves(QMDetalleNUM_CLAVES.AsInteger);
end;

procedure TZDMEstadisticas.DuplicaEstadistica;
begin
  with QDuplicaEst do
  begin
     Close;
     Params.ByName['GRUPO'].AsInteger := QMDetalleGRUPO.AsInteger;
     Params.ByName['ESTADISTICA'].AsInteger := QMDetalleESTADISTICA.AsInteger;
     ExecQuery;
     FreeHandle;
  end;

  QMDetalle.Close;
  QMDetalle.Open;
  QMDetalle.Last;
end;

procedure TZDMEstadisticas.ActivaEstadistica(DataSet: TDataSet);
begin
  ZFMEstadisticas.GBEstadistica.Enabled := True;
  ZFMEstadisticas.GBConsulta.Enabled := True;
  ZFMEstadisticas.GBCondiciones.Enabled := True;
end;

procedure TZDMEstadisticas.DesactivaEstadistica(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;

  ZFMEstadisticas.GBEstadistica.Enabled := False;
  ZFMEstadisticas.GBConsulta.Enabled := False;
  ZFMEstadisticas.GBCondiciones.Enabled := False;
end;

procedure TZDMEstadisticas.QMGrupoBeforePost(DataSet: TDataSet);
var
  num : integer;
begin
  if (QMGrupo.State = dsInsert) then
  begin
     with SPMaxGrupo do
     begin
        Close;
        ExecQuery;
        num := FieldByName['MAX'].AsInteger + 1;
        FreeHandle;
     end;
     if num >= 1000 then
        QMGrupoGRUPO.AsInteger := num
     else
        QMGrupoGRUPO.AsInteger := 1000;
  end;
end;

procedure TZDMEstadisticas.QMDetalleBeforePost(DataSet: TDataSet);
var
  num : integer;
begin
  if (QMDetalle.State = dsInsert) then
  begin
     with SPMaxEstadistica do
     begin
        Close;
        ExecQuery;
        num := FieldByName['MAX'].AsInteger + 1;
        FreeHandle;
     end;
     if num >= 1000 then
        QMDetalleESTADISTICA.AsInteger := num
     else
        QMDetalleESTADISTICA.AsInteger := 1000;
  end;
end;

procedure TZDMEstadisticas.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TZDMEstadisticas.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMGrupo, '00000');
end;

end.
