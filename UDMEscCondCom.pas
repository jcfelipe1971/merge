unit UDMEscCondCom;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, FIBDataSetRO, FIBQuery, HYFIBQuery;

type
  TDMEscCondCom = class(TDataModule)
     TLocal: THYTransaction;
     QMDetalle: TFIBTableSet;
     DSQMDetalle: TDataSource;
     xCondProv: TFIBDataSetRO;
     DSxCondProv: TDataSource;
     SPLineaSiguiente: THYFIBQuery;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleEJERCICIO: TIntegerField;
     QMDetalleCANAL: TIntegerField;
     QMDetalleTIPO: TFIBStringField;
     QMDetalleRIG: TIntegerField;
     QMDetalleLINEA: TIntegerField;
     QMDetalleUNID_MINIMAS: TFloatField;
     QMDetalleUNID_MAXIMAS: TFloatField;
     QMDetallePRECIO: TFloatField;
     QMDetalleDESCUENTO: TFloatField;
     QMDetalleDESCUENTO_2: TFloatField;
     QMDetalleDESCUENTO_3: TFloatField;
     xCondProvPROVEEDOR: TIntegerField;
     xCondProvTITULO_PROVEEDOR: TFIBStringField;
     xCondProvARTICULO: TFIBStringField;
     xCondProvFAMILIA: TFIBStringField;
     xCondProvTITULO_ARTICULO: TFIBStringField;
     xCondProvTITULO_FAMILIA: TFIBStringField;
     xCondProvAGRUPACION: TFIBStringField;
     xCondProvTITULO_AGRUPACION: TFIBStringField;
     QMDetallePorPrecio: TFIBTableSet;
     DSQMDetallePorPrecio: TDataSource;
     xCondProvPorPrecio: TFIBDataSetRO;
     DSxCondProvPorPrecio: TDataSource;
     QMDetallePorPrecioEMPRESA: TIntegerField;
     QMDetallePorPrecioEJERCICIO: TIntegerField;
     QMDetallePorPrecioCANAL: TIntegerField;
     QMDetallePorPrecioTIPO: TFIBStringField;
     QMDetallePorPrecioRIG: TIntegerField;
     QMDetallePorPrecioLINEA: TIntegerField;
     QMDetallePorPrecioPRECIO_MIN: TFloatField;
     QMDetallePorPrecioPRECIO_MAX: TFloatField;
     QMDetallePorPrecioDESCUENTO: TFloatField;
     QMDetallePorPrecioDESCUENTO_2: TFloatField;
     QMDetallePorPrecioDESCUENTO_3: TFloatField;
     QMDetallePorPrecioUNIDADES: TFloatField;
     xCondProvPorPrecioPROVEEDOR: TIntegerField;
     xCondProvPorPrecioTITULO_PROVEEDOR: TFIBStringField;
     xCondProvPorPrecioARTICULO: TFIBStringField;
     xCondProvPorPrecioFAMILIA: TFIBStringField;
     xCondProvPorPrecioTITULO_ARTICULO: TFIBStringField;
     xCondProvPorPrecioTITULO_FAMILIA: TFIBStringField;
     xCondProvPorPrecioAGRUPACION: TFIBStringField;
     xCondProvPorPrecioTITULO_AGRUPACION: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMDetallePorPrecioNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Filtra(tipo: string; RIG: integer);
  end;

var
  DMEscCondCom : TDMEscCondCom;

implementation

uses UDMMain, UEntorno;

var
  TipoActual : string;
  RIGActual : integer;

  {$R *.dfm}

procedure TDMEscCondCom.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMDetalleUNID_MINIMAS.DisplayFormat := MascaraN;
  QMDetalleUNID_MAXIMAS.DisplayFormat := MascaraN;
  QMDetalleDESCUENTO.DisplayFormat := MascaraP;
  QMDetalleDESCUENTO_2.DisplayFormat := MascaraP;
  QMDetalleDESCUENTO_3.DisplayFormat := MascaraP;
  QMDetallePRECIO.DisplayFormat := MascaraL;

  QMDetallePorPrecioDESCUENTO.DisplayFormat := MascaraP;
  QMDetallePorPrecioDESCUENTO_2.DisplayFormat := MascaraP;
  QMDetallePorPrecioDESCUENTO_3.DisplayFormat := MascaraP;
  QMDetallePorPrecioPRECIO_MIN.DisplayFormat := MascaraN;
  QMDetallePorPrecioPRECIO_MAX.DisplayFormat := MascaraN;
  QMDetallePorPrecioUNIDADES.DisplayFormat := MascaraP;

  DMMain.FiltraTabla(QMDetalle, '11100', True);
  DMMain.FiltraTabla(QMDetallePorPrecio, '11100', True);
end;

procedure TDMEscCondCom.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
  Filtra(TipoActual, RIGActual);
end;

procedure TDMEscCondCom.Filtra(tipo: string; RIG: integer);
begin
  TipoActual := tipo;
  RIGActual := RIG;

  with xCondProv do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['TIPO'].AsString := tipo;
     Params.ByName['RIG'].AsInteger := RIG;
     Open;
  end;

  with QMDetalle do
  begin
     Close;
     DMMain.FiltraTabla(QMDetalle, '11100', False);
     Params.ByName['TIPO'].AsString := tipo;
     Params.ByName['RIG'].AsInteger := RIG;
     Open;
  end;

  with xCondProvPorPrecio do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['TIPO'].AsString := tipo;
     Params.ByName['RIG'].AsInteger := RIG;
     Open;
  end;

  with QMDetallePorPrecio do
  begin
     Close;
     DMMain.FiltraTabla(QMDetallePorPrecio, '11100', False);
     Params.ByName['TIPO'].AsString := tipo;
     Params.ByName['RIG'].AsInteger := RIG;
     Open;
  end;
end;

procedure TDMEscCondCom.QMDetalleNewRecord(DataSet: TDataSet);
begin
  QMDetalleEMPRESA.AsInteger := REntorno.Empresa;
  QMDetalleEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMDetalleCANAL.AsInteger := REntorno.Canal;
  QMDetalleTIPO.AsString := TipoActual;
  QMDetalleRIG.AsInteger := RIGActual;
  with SPLineaSiguiente do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['TIPO'].AsString := TipoActual;
     Params.ByName['RIG'].AsInteger := RIGActual;
     ExecQuery;
     QMDetalleLINEA.AsInteger := FieldByName['LINEA'].AsInteger;
     FreeHandle;
  end;
  QMDetallePRECIO.AsFloat := 0;
  QMDetalleDESCUENTO.AsFloat := 0;
  QMDetalleDESCUENTO_2.AsFloat := 0;
  QMDetalleDESCUENTO_3.AsFloat := 0;
end;

procedure TDMEscCondCom.QMDetallePorPrecioNewRecord(DataSet: TDataSet);
var
  Q : THYFIBQuery;
begin
  QMDetallePorPrecioEMPRESA.AsInteger := REntorno.Empresa;
  QMDetallePorPrecioEJERCICIO.AsInteger := REntorno.Ejercicio;
  QMDetallePorPrecioCANAL.AsInteger := REntorno.Canal;
  QMDetallePorPrecioTIPO.AsString := TipoActual;
  QMDetallePorPrecioRIG.AsInteger := RIGActual;

  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     Close;
     DataBase := DMMain.DataBase;
     SQL.Text := 'select max(linea) as linea from art_cond_com_precio_d where ((empresa=:empresa)and(ejercicio=:ejercicio)and(canal=:canal)and(tipo=:tipo)and(rig=:rig))';
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['TIPO'].AsString := TipoActual;
     Params.ByName['RIG'].AsInteger := RIGActual;
     ExecQuery;
     QMDetallePorPrecioLINEA.AsInteger := FieldByName['LINEA'].AsInteger + 1;
     FreeHandle;
  end;
  FreeAndNil(Q);

  QMDetallePorPrecioPRECIO_MIN.AsFloat := 0;
  QMDetallePorPrecioPRECIO_MAX.AsFloat := 0;
  QMDetallePorPrecioDESCUENTO.AsFloat := 0;
  QMDetallePorPrecioDESCUENTO_2.AsFloat := 0;
  QMDetallePorPrecioDESCUENTO_3.AsFloat := 0;
  QMDetallePorPrecioUNIDADES.AsFloat := 0;
end;

end.
