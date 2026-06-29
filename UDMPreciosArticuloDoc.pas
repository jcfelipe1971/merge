unit UDMPreciosArticuloDoc;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet,
  FIBDataSetRO, FIBQuery, HYFIBQuery;

type
  TDMPreciosArticuloDoc = class(TDataModule)
     TLocal: THYTransaction;
     SPDevuelvePrecio: THYFIBQuery;
     xMonedas: TFIBDataSetRO;
     DSxMonedas: TDataSource;
     DSQMTarifas: TDataSource;
     QMTarifas: TFIBTableSet;
     QMTarifasEMPRESA: TIntegerField;
     QMTarifasCANAL: TIntegerField;
     QMTarifasTARIFA: TFIBStringField;
     QMTarifasFAMILIA: TFIBStringField;
     QMTarifasARTICULO: TFIBStringField;
     QMTarifasALMACEN: TFIBStringField;
     QMTarifasTITULO: TFIBStringField;
     QMTarifasP_COSTE: TFloatField;
     QMTarifasCOMISION: TFloatField;
     QMTarifasPVP: TFloatField;
     QMTarifasBLOQUEADO: TIntegerField;
     QMTarifasPRECIO_PONDERADO: TFloatField;
     QMTarifasMONEDA: TFIBStringField;
     QMTarifasFECHA: TDateTimeField;
     QMTarifasUNID_MINIMAS: TFloatField;
     QMTarifasUNID_MAXIMAS: TFloatField;
     QMTarifasLINEA: TIntegerField;
     QMTarifasMARGEN: TFloatField;
     TUpdate: THYTransaction;
     procedure DMPreciosArticuloDocCreate(Sender: TObject);
     procedure QMTarifasNewRecord(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Filtra(Articulo, Almacen, Moneda: string; Fecha: TDateTime; id_a: integer);
     procedure Devuelve_pvp;
  end;

var
  DMPreciosArticuloDoc : TDMPreciosArticuloDoc;

implementation

uses UDMMain, UEntorno;

{$R *.DFM}

procedure TDMPreciosArticuloDoc.DMPreciosArticuloDocCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMTarifasMARGEN.DisplayFormat := MascaraP;
end;

procedure TDMPreciosArticuloDoc.Filtra(Articulo, Almacen, Moneda: string; Fecha: TDateTime; id_a: integer);
var
  LocalMascaraL : string;
begin
  with QMTarifas do
  begin
     Close;
     DMMain.FiltraTabla(QMTarifas, '10100', False);
     Params.ByName['ARTICULO'].AsString := Articulo;
     Params.ByName['ALMACEN'].AsString := Almacen;
     Params.ByName['MONEDA'].AsString := Moneda;
     Params.ByName['FECHA'].AsDateTime := Fecha;
     Params.ByName['ID_A'].AsInteger := id_a;
     Open;
  end;

  with xMonedas do
  begin
     Close;
     Params.ByName['MONEDA'].AsString := Moneda;
     Open;
  end;

  LocalMascaraL := DMMain.MascaraMoneda(Moneda, 0);
  QMTarifasP_COSTE.DisplayFormat := LocalMascaraL;
  QMTarifasPVP.DisplayFormat := LocalMascaraL;
  QMTarifasCOMISION.DisplayFormat := LocalMascaraL;
  QMTarifasPRECIO_PONDERADO.DisplayFormat := LocalMascaraL;
end;

procedure TDMPreciosArticuloDoc.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMPreciosArticuloDoc.QMTarifasNewRecord(DataSet: TDataSet);
begin
  DataSet.Cancel;
end;

procedure TDMPreciosArticuloDoc.Devuelve_pvp;
begin
  with SPDevuelvePrecio do
  begin
     Params.ByName['EMPRESA'].AsInteger := QMTarifasEMPRESA.AsInteger;
     Params.ByName['TARIFA'].AsString := QMTarifasTARIFA.AsString;
     Params.ByName['ARTICULO'].AsString := QMTarifasARTICULO.AsString;
     Params.ByName['LINEA'].AsInteger := QMTarifasLINEA.AsInteger;
     Params.ByName['BLOQUEADO'].AsInteger := QMTarifasBLOQUEADO.AsInteger;
     Params.ByName['PVP'].AsFloat := QMTarifasPVP.AsFloat;
     Params.ByName['MONEDA'].AsString := QMTarifasMONEDA.AsString;
     Params.ByName['FECHA'].AsDateTime := QMTarifasFECHA.AsDateTime;
     Params.ByName['MARGEN'].AsFloat := QMTarifasMARGEN.AsFloat;
     ExecQuery;
     FreeHandle;
  end;
end;

end.
