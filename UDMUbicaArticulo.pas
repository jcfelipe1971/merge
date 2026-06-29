unit UDMUbicaArticulo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBQuery, HYFIBQuery;

type
  TDMUbicaArticulo = class(TDataModule)
     TLocal: THYTransaction;
     xArticulos: TFIBTableSet;
     xArticulosARTICULO: TFIBStringField;
     xArticulosTITULO: TFIBStringField;
     DSxArticulos: TDataSource;
     DSQMArticuloUbicacion: TDataSource;
     xArticulosID_A: TIntegerField;
     QMArticuloUbicacion: TFIBTableSet;
     QMArticuloUbicacionEMPRESA: TIntegerField;
     QMArticuloUbicacionID_A: TIntegerField;
     QMArticuloUbicacionARTICULO: TFIBStringField;
     QMArticuloUbicacionTITULO_DESCRIPCION: TFIBStringField;
     QMArticuloUbicacionID_UBICACION: TIntegerField;
     QMArticuloUbicacionPRIORIDAD: TIntegerField;
     QMArticuloUbicacionLINEA: TIntegerField;
     QMArticuloUbicacionCOMPOSICION: TFIBStringField;
     QMArticuloUbicacionID_A_UBICACION: TIntegerField;
     QMArticuloUbicacionGENERAL: TIntegerField;
     TUpdate: THYTransaction;
     procedure xArticulosBeforePost(DataSet: TDataSet);
     procedure xArticulosBeforeEdit(DataSet: TDataSet);
     procedure xArticulosNewRecord(DataSet: TDataSet);
     procedure xArticulosAfterOpen(DataSet: TDataSet);
     procedure QMArticuloUbicacionCOMPOSICIONChange(Sender: TField);
     procedure QMArticuloUbicacionNewRecord(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
     procedure QMArticuloUbicacionAfterPost(DataSet: TDataSet);
     procedure QMArticuloUbicacionBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure InicializaRegistro(Articulo: string);
  end;

var
  DMUbicaArticulo : TDMUbicaArticulo;

implementation

uses UDMMain, UEntorno, UUtiles;

{$R *.dfm}

procedure TDMUbicaArticulo.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TDMUbicaArticulo.xArticulosBeforePost(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMUbicaArticulo.xArticulosBeforeEdit(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMUbicaArticulo.xArticulosNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMUbicaArticulo.InicializaRegistro(Articulo: string);
begin
  with xArticulos do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ARTICULO'].AsString := Articulo;
     Open;
  end;
end;

procedure TDMUbicaArticulo.xArticulosAfterOpen(DataSet: TDataSet);
begin
  with QMArticuloUbicacion do
  begin
     Close;
     Open;
  end;
end;

procedure TDMUbicaArticulo.QMArticuloUbicacionCOMPOSICIONChange(Sender: TField);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text :=
           'SELECT ID_UBICACION, TITULO FROM ART_ALMACENES_UBICACIONES WHERE EMPRESA = :EMPRESA AND COMPOSICION = :COMPOSICION';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['COMPOSICION'].AsString := QMArticuloUbicacionCOMPOSICION.AsString;
        ExecQuery;
        QMArticuloUbicacionID_UBICACION.AsInteger := FieldByName['ID_UBICACION'].AsInteger;
        QMArticuloUbicacionTITULO_DESCRIPCION.AsString := FieldByName['TITULO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMUbicaArticulo.QMArticuloUbicacionNewRecord(DataSet: TDataSet);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MAX(LINEA) MAX_LINEA, MAX(PRIORIDAD) MAX_PRIORIDAD FROM ART_ARTICULOS_UBICACIONES WHERE ID_A = :ID_A';
        Params.ByName['ID_A'].AsInteger := xArticulosID_A.AsInteger;
        ExecQuery;
        QMArticuloUbicacionLINEA.AsInteger := FieldByName['MAX_LINEA'].AsInteger + 1;
        QMArticuloUbicacionPRIORIDAD.AsInteger := FieldByName['MAX_PRIORIDAD'].AsInteger + 1;
        FreeHandle;
     finally
        Free;
     end;
  end;

  QMArticuloUbicacionID_A.AsInteger := xArticulosID_A.AsInteger;
end;

procedure TDMUbicaArticulo.QMArticuloUbicacionAfterPost(DataSet: TDataSet);
begin
  Refrescar(QMArticuloUbicacion, 'ID_A_UBICACION', QMArticuloUbicacionID_A_UBICACION.AsInteger);
end;

procedure TDMUbicaArticulo.QMArticuloUbicacionBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'ID_A_UBICACION', 'ID_A_UBICACION');
end;

end.
