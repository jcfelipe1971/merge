unit UDMProcesosMasivosLineas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDatabase, UFIBModificados, FIBDataSet,
  FIBTableDataSet;

type
  TDMProcesosMasivosLineas = class(TDataModule)
     QMDocLineas: TFIBTableSet;
     DSQMDocLineas: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMDocLineasENTRADA: TIntegerField;
     QMDocLineasID_DOC: TIntegerField;
     QMDocLineasID_DETALLES_DOC: TIntegerField;
     QMDocLineasSELECCIONADO: TIntegerField;
     QMDocLineasLINEA: TIntegerField;
     QMDocLineasORDEN: TIntegerField;
     QMDocLineasARTICULO: TFIBStringField;
     QMDocLineasTITULO: TFIBStringField;
     QMDocLineasUNIDADES: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     procedure Inicializar(Tipo: string; ID_Doc: integer);
     procedure MarcarTodo(Seleccionado: boolean);
     procedure BorrarTemporal;
  end;

var
  DMProcesosMasivosLineas : TDMProcesosMasivosLineas;

implementation

{$R *.dfm}

uses UDMMain, UEntorno, HYFIBQuery, UUtiles;

procedure TDMProcesosMasivosLineas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMProcesosMasivosLineas.BorrarTemporal;
begin
  /// Borra los datos temporales relacionados con esta entrada

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM TMP_DOC_LINEAS_A_PROC WHERE ENTRADA = :ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMProcesosMasivosLineas.Inicializar(Tipo: string; ID_Doc: integer);
begin
  /// Inserta las lineas del documento seleccinoado a la tabla de datos temporales

  // Limpio tabla temporal
  BorrarTemporal;

  // Inserto lineas de documento
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' INSERT INTO TMP_DOC_LINEAS_A_PROC ( ');
        SQL.Add(' ENTRADA, ID_DOC, ID_DETALLES_DOC, SELECCIONADO) ');

        if ((tipo = 'OFC') or (Tipo = 'PEC') or (Tipo = 'ALB') or (Tipo = 'FAC')) then
        begin
           SQL.Add(' SELECT :ENTRADA, ID_S, ID_DETALLES_S, 0 ');
           SQL.Add(' FROM GES_DETALLES_S ');
           SQL.Add(' WHERE ');
           SQL.Add(' ID_S = :ID_DOC ');
        end
        else
        begin
           SQL.Add(' SELECT :ENTRADA, ID_E, ID_DETALLES_E, 0 ');
           SQL.Add(' FROM GES_DETALLES_E ');
           SQL.Add(' WHERE ');
           SQL.Add(' ID_E = :ID_DOC ');
        end;

        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['ID_DOC'].AsInteger := ID_Doc;

        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with QMDocLineas do
  begin
     Close;

     RefreshSQL.Clear;
     RefreshSQL.Add(' SELECT T.ENTRADA, T.ID_DOC, T.ID_DETALLES_DOC, T.SELECCIONADO, D.LINEA, D.ORDEN, D.ARTICULO, D.TITULO, UNIDADES ');
     RefreshSQL.Add(' FROM TMP_DOC_LINEAS_A_PROC T ');
     if ((Tipo = 'OFC') or (Tipo = 'PEC') or (Tipo = 'ALB') or (Tipo = 'FAC')) then
        RefreshSQL.Add(' JOIN GES_DETALLES_S D ON T.ID_DETALLES_DOC = D.ID_DETALLES_S ')
     else
        RefreshSQL.Add(' JOIN GES_DETALLES_E D ON T.ID_DETALLES_DOC = D.ID_DETALLES_E ');
     RefreshSQL.Add(' WHERE ');
     RefreshSQL.Add(' T.ID_DETALLES_DOC = :ID_DETALLES_DOC AND ');
     RefreshSQL.Add(' T.ID_DOC = :ID_DOC AND ');
     RefreshSQL.Add(' T.ENTRADA = :ENTRADA AND ');
     RefreshSQL.Add(' D.TIPO = ''' + Tipo + ''' ');
     RefreshSQL.Add(' ORDER BY D.ORDEN ');

     SelectSQL.Clear;
     SelectSQL.Add(' SELECT T.ENTRADA, T.ID_DOC, T.ID_DETALLES_DOC, T.SELECCIONADO, D.LINEA, D.ORDEN, D.ARTICULO, D.TITULO, UNIDADES ');
     SelectSQL.Add(' FROM TMP_DOC_LINEAS_A_PROC T ');
     if ((Tipo = 'OFC') or (Tipo = 'PEC') or (Tipo = 'ALB') or (Tipo = 'FAC')) then
        SelectSQL.Add(' JOIN GES_DETALLES_S D ON T.ID_DETALLES_DOC = D.ID_DETALLES_S ')
     else
        SelectSQL.Add(' JOIN GES_DETALLES_E D ON T.ID_DETALLES_DOC = D.ID_DETALLES_E ');
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' T.ENTRADA = :ENTRADA AND ');
     SelectSQL.Add(' D.TIPO = ''' + Tipo + ''' ');
     SelectSQL.Add(' ORDER BY D.ORDEN ');

     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;

     Open;
  end;
end;

procedure TDMProcesosMasivosLineas.MarcarTodo(Seleccionado: boolean);
begin
  /// Borra los datos temporales relacionados con esta entrada

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE TMP_DOC_LINEAS_A_PROC SET SELECCIONADO = :SELECCIONADO WHERE ENTRADA = :ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        Params.ByName['SELECCIONADO'].AsInteger := BoolToInt(Seleccionado);
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Refrescar(QMDocLineas, 'ID_DETALLES_DOC', QMDocLineasID_DETALLES_DOC.AsInteger);
end;

end.
