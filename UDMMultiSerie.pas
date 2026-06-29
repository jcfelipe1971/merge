unit UDMMultiSerie;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSetRO, FIBDatabase, UFIBModificados,
  FIBDataSet, FIBQuery, HYFIBQuery, FIBTableDataSet;

type
  TDMMultiserie = class(TDataModule)
     TLocal: THYTransaction;
     DSQMSeries: TDataSource;
     QMSeries: TFIBTableSet;
     QMSeriesEMPRESA: TIntegerField;
     QMSeriesEJERCICIO: TIntegerField;
     QMSeriesCANAL: TIntegerField;
     QMSeriesSERIE: TFIBStringField;
     QMSeriesTITULO: TFIBStringField;
     QMSeriesMARCADO: TIntegerField;
     QMSeriesENTRADA: TIntegerField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMSeriesAfterPost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure GuardarMarcados(var ListaMarcados: TStringList);
     procedure MarcarTodos(Marca: smallint);
     procedure RellenarSeleccion;
     procedure FiltrarSeleccion;
     procedure BorraTemporal;
  end;

var
  DMMultiserie : TDMMultiserie;

implementation

uses UDMMain, UEntorno, UFMMultiSerie;

{$R *.dfm}

procedure TDMMultiserie.DataModuleCreate(Sender: TObject);
begin
  // Abrir la transacción local
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMSeries, '11100', False);
  QMSeries.Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
  QMSeries.Open;
end;

procedure TDMMultiserie.GuardarMarcados(var ListaMarcados: TStringList);
begin
  // Inserto las series marcadas en una lista de strings
  ListaMarcados.Clear;
  with QMSeries do
  begin
     First;
     while not EOF do
     begin
        if (QMSeriesMARCADO.AsInteger = 1) then
           ListaMarcados.Add(QMSeriesSERIE.AsString);
        Next;
     end;
  end;
end;

procedure TDMMultiserie.MarcarTodos(Marca: smallint);
begin
  // Cancelo la edición para evitar el error de: hay otro usuario modificando este registro
  QMSeries.Cancel;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE TMP_MULTISERIE ');
        SQL.Add(' SET MARCADO = ?MARCA ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' ENTRADA = ?ENTRADA ');
        Params.ByName['MARCA'].AsInteger := Marca;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  DMMain.FiltraTabla(QMSeries, '11100', False);
  QMSeries.Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
  QMSeries.Open;
end;

procedure TDMMultiSerie.RellenarSeleccion;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE T_RELLENA_MULTISERIE(?ENTRADA, ?EMPRESA, ?EJERCICIO, ?CANAL)';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  // Se pone a marcado el check de la serie por defecto
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE TMP_MULTISERIE ');
        SQL.Add(' SET MARCADO = 1 ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL AND ');
        SQL.Add(' SERIE = ?SERIE AND ');
        SQL.Add(' ENTRADA = ?ENTRADA ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['SERIE'].AsString := REntorno.Serie;
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMMultiSerie.FiltrarSeleccion;
begin
  with QMSeries do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM TMP_MULTISERIE ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = ?EJERCICIO AND ');
     SelectSQL.Add(' CANAL = ?CANAL AND ');
     SelectSQL.Add(' ENTRADA = ?ENTRADA ');
     SelectSQL.Add(' ORDER BY SERIE ');
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;
end;

procedure TDMMultiSerie.BorraTemporal;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' DELETE FROM TMP_MULTISELECCION ');
        SQL.Add(' WHERE ');
        SQL.Add(' ENTRADA = ?ENTRADA AND ');
        SQL.Add(' EMPRESA = ?EMPRESA AND ');
        SQL.Add(' EJERCICIO = ?EJERCICIO AND ');
        SQL.Add(' CANAL = ?CANAL ');
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMMultiserie.DataModuleDestroy(Sender: TObject);
begin
  BorraTemporal;
end;

procedure TDMMultiserie.QMSeriesAfterPost(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

end.
