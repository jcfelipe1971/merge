unit UProDMDesTipoMat;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, FIBQuery, HYFIBQuery;

type
  TProDMDesTipoMat = class(TDataModule)
     DSCabTipoMat: TDataSource;
     QMCabTipoMat: TFIBTableSet;
     TLocal: THYTransaction;
     QMDetTipoMat: TFIBTableSet;
     DSDetTipoMat: TDataSource;
     xLineaDetTipoMat: THYFIBQuery;
     QMCabTipoMatTIPO: TFIBStringField;
     QMCabTipoMatDESCRIPCION: TFIBStringField;
     QMCabTipoMatID: TIntegerField;
     QMDetTipoMatID_CAB: TIntegerField;
     QMDetTipoMatARTICULO: TFIBStringField;
     QMDetTipoMatLINEA: TIntegerField;
     QMDetTipoMatDescArticulo: TStringField;
     xDescArticulo: TFIBDataSetRO;
     xDescArticuloTITULO: TFIBStringField;
     QMDetTipoMatPOR_DEFECTO: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMCabTipoMatAfterOpen(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure QMDetTipoMatNewRecord(DataSet: TDataSet);
     procedure QMDetTipoMatARTICULOChange(Sender: TField);
     procedure QMDetTipoMatDescArticuloGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  ProDMDesTipoMat : TProDMDesTipoMat;

implementation

uses UDMMain, UEntorno, UFBusca;

{$R *.dfm}

procedure TProDMDesTipoMat.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMCabTipoMat.Open;
end;

procedure TProDMDesTipoMat.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  DataSet.Refresh;
  QMCabTipoMat.Refresh;
end;

procedure TProDMDesTipoMat.QMCabTipoMatAfterOpen(DataSet: TDataSet);
begin
  QMDetTipoMat.Open;
end;

procedure TProDMDesTipoMat.QMDetTipoMatNewRecord(DataSet: TDataSet);
begin
  QMDetTipoMatID_CAB.AsInteger := QMCabTipoMatID.AsInteger;

  //Núm. Línea
  xLineaDetTipoMat.Close;
  xLineaDetTipoMat.Params.ByName['idcab'].AsInteger := QMCabTipoMatID.AsInteger;
  xLineaDetTipoMat.ExecQuery;
  QMDetTipoMatLINEA.AsInteger := xLineaDetTipoMat.FieldByName['NLinea'].AsInteger + 1;
end;

procedure TProDMDesTipoMat.QMDetTipoMatARTICULOChange(Sender: TField);
begin
  xDescArticulo.Close;
  xDescArticulo.Params.ByName['empresa'].AsInteger := REntorno.Empresa;
  xDescArticulo.Params.ByName['articulo'].AsString := QMDetTipoMatARTICULO.AsString;
  xDescArticulo.Open;

  QMDetTipoMatDescArticulo.AsString := xDescArticuloTITULO.AsString;
end;

procedure TProDMDesTipoMat.QMDetTipoMatDescArticuloGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  xDescArticulo.Close;
  xDescArticulo.Params.ByName['empresa'].AsInteger := REntorno.Empresa;
  xDescArticulo.Params.ByName['articulo'].AsString := QMDetTipoMatARTICULO.AsString;
  xDescArticulo.Open;

  Text := xDescArticuloTITULO.AsString;
end;

procedure TProDMDesTipoMat.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMCabTipoMat, '00000');
end;

end.
