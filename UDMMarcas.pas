unit UDMMarcas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Classes, Forms, DB, DBTables, FIBDatabase, FIBDataSet,
  FIBTableDataSet, FIBQuery, UFIBModificados;

type
  TDMMarcas = class(TDataModule)
     DSQMMarcas: TDataSource;
     QMMarcas: TFIBTableSet;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMMarcasID_MARCA: TIntegerField;
     QMMarcasMARCA: TFIBStringField;
     QMMarcasTITULO: TFIBStringField;
     QMMarcasID_IMAGEN: TIntegerField;
     DSxModelos: TDataSource;
     xModelos: TFIBTableSet;
     xModelosID_MODELO: TIntegerField;
     xModelosID_MARCA: TIntegerField;
     xModelosMODELO: TFIBStringField;
     xModelosTITULO: TFIBStringField;
     xModelosID_IMAGEN: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMMarcasNewRecord(DataSet: TDataSet);
     procedure QMMarcasBeforePost(DataSet: TDataSet);
     procedure xModelosNewRecord(DataSet: TDataSet);
     procedure xModelosBeforePost(DataSet: TDataSet);
     procedure QMMarcasAfterOpen(DataSet: TDataSet);
     procedure QMMarcasBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMMarcas : TDMMarcas;

implementation

uses UDMMain, UUtiles, UEntorno, UFBusca;

{$R *.DFM}

procedure TDMMarcas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMMarcas.Open;
end;

procedure TDMMarcas.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMMarcas, '00000');
end;

procedure TDMMarcas.QMMarcasNewRecord(DataSet: TDataSet);
begin
  QMMarcasID_IMAGEN.AsInteger := 0;
end;

procedure TDMMarcas.QMMarcasBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'CONTA_MARCAS', 'ID_MARCA');
end;

procedure TDMMarcas.xModelosNewRecord(DataSet: TDataSet);
begin
  xModelosID_MARCA.AsInteger := QMMarcasID_MARCA.AsInteger;
  xModelosID_IMAGEN.AsInteger := 0;
end;

procedure TDMMarcas.xModelosBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'CONTA_MODELOS', 'ID_MODELO');
end;

procedure TDMMarcas.QMMarcasAfterOpen(DataSet: TDataSet);
begin
  xModelos.Open;
end;

procedure TDMMarcas.QMMarcasBeforeClose(DataSet: TDataSet);
begin
  xModelos.Close;
end;

end.
