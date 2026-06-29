unit UDMDetPromo;

interface

uses
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, FIBDataSetRO, FIBQuery, HYFIBQuery;

type
  TDMDetPromo = class(TDataModule)
     TLocal: THYTransaction;
     QMDetalle: TFIBTableSet;
     DSQMDetalle: TDataSource;
     xCabecera: TFIBDataSetRO;
     DSxCabecera: TDataSource;
     SPLineaSiguiente: THYFIBQuery;
     xCabeceraCLIENTE: TIntegerField;
     xCabeceraTITULO_CLIENTE: TFIBStringField;
     xCabeceraARTICULO: TFIBStringField;
     xCabeceraFAMILIA: TFIBStringField;
     xCabeceraTITULO_ARTICULO: TFIBStringField;
     xCabeceraTITULO_FAMILIA: TFIBStringField;
     xCabeceraAGRUPACION: TFIBStringField;
     xCabeceraTITULO_AGRUPACION: TFIBStringField;
     xCabeceraTARIFA: TFIBStringField;
     xCabeceraTITULO_TARIFA: TFIBStringField;
     xCabeceraUNIDADES: TFloatField;
     xCabeceraPRECIO: TFloatField;
     xCabeceraDTO1: TFloatField;
     xCabeceraDTO2: TFloatField;
     xCabeceraDTO3: TFloatField;
     QMDetalleEMPRESA: TIntegerField;
     QMDetalleEJERCICIO: TIntegerField;
     QMDetalleCANAL: TIntegerField;
     QMDetalleTIPO: TFIBStringField;
     QMDetalleRIG: TIntegerField;
     QMDetalleLINEA: TIntegerField;
     QMDetallePROMOCION: TFIBStringField;
     QMDetalleTITULO_PROMOCION: TFIBStringField;
     QMDetalleUDS_PROMOCION: TFloatField;
     QMDetallePRECIO_PROMO: TFloatField;
     QArticulo: THYFIBQuery;
     QMDetalleDTO1_PROMO: TFloatField;
     QMDetalleDTO2_PROMO: TFloatField;
     QMDetalleDTO3_PROMO: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMDetallePROMOCIONChange(Sender: TField);
  private
     { Private declarations }
     TipoActual: string;
     RIGActual: integer;
  public
     { Public declarations }
     procedure Filtra(tipo: string; RIG: integer);
  end;

var
  DMDetPromo : TDMDetPromo;

implementation

uses UDMMain, UEntorno, UUtiles;

{$R *.dfm}

procedure TDMDetPromo.DataModuleCreate(Sender: TObject);
begin
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMDetalle, MascaraN, MascaraI, ShortDateFormat);
  QMDetalleUDS_PROMOCION.DisplayFormat := MascaraI;
  QMDetalleDTO1_PROMO.DisplayFormat := MascaraP;
  QMDetalleDTO2_PROMO.DisplayFormat := MascaraP;
  QMDetalleDTO3_PROMO.DisplayFormat := MascaraP;
end;

procedure TDMDetPromo.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMDetPromo.Filtra(tipo: string; RIG: integer);
begin
  TipoActual := Tipo;
  RigActual := RIG;

  with xCabecera do
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
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     Params.ByName['TIPO'].AsString := tipo;
     Params.ByName['RIG'].AsInteger := RIG;
     Open;
  end;
end;

procedure TDMDetPromo.QMDetalleNewRecord(DataSet: TDataSet);
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
  QMDetallePRECIO_PROMO.AsFloat := 0;
end;

procedure TDMDetPromo.QMDetallePROMOCIONChange(Sender: TField);
begin
  with QArticulo do
  begin
     Close;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['ARTICULO'].AsString := QMDetallePROMOCION.AsString;
     ExecQuery;
     QMDetalleTITULO_PROMOCION.AsString := FieldByName['TITULO'].AsString;
     FreeHandle;
  end;
end;

end.
