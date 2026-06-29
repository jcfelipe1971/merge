unit UDMMonedas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, FIBDatabase, FIBDataSet, FIBTableDataSet, FIBQuery,
  UFIBModificados, FIBDataSetRO;

type
  TDMMonedas = class(TDataModule)
     DSQMMonedas: TDataSource;
     QMMonedas: TFIBTableSet;
     QMMonedasMONEDA: TFIBStringField;
     QMMonedasSIGNO_MONEDA: TFIBStringField;
     QMMonedasDEC_VER: TIntegerField;
     QMMonedasDEC_CALCULOS: TIntegerField;
     QMMonedasDEFECTO: TIntegerField;
     QMMonedasTITULO: TFIBStringField;
     TLocal: THYTransaction;
     QMMonedasGENERO_MASCULINO: TIntegerField;
     QMIdiomas: TFIBTableSet;
     DSQMIdiomas: TDataSource;
     QMIdiomasMONEDA: TFIBStringField;
     QMIdiomasIDIOMA: TFIBStringField;
     QMIdiomasTITULO: TFIBStringField;
     TUpdate: THYTransaction;
     QMMonedasCODIGO_SEUR: TFIBStringField;
     QMMonedasDESC_DECIMALES: TFIBStringField;
     QMMonedasCUENTA_PRI_VENTAS: TFIBStringField;
     QMMonedasCUENTA_PRI_COMPRAS: TFIBStringField;
     QMMonedasCUENTA_CLIENTE: TFIBStringField;
     QMMonedasCUENTA_PROVEEDOR: TFIBStringField;
     procedure DMAuxiliaresCreate(Sender: TObject);
     procedure QMMonedasAfterPost(DataSet: TDataSet);
     procedure QMIdiomasNewRecord(DataSet: TDataSet);
     procedure QMMonedasAfterOpen(DataSet: TDataSet);
     procedure QMMonedasNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMMonedas : TDMMonedas;

implementation

uses UDMMain, UUtiles, UEntorno, UFBusca;

{$R *.DFM}

procedure TDMMonedas.DMAuxiliaresCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMMonedas.Open;
end;

procedure TDMMonedas.QMMonedasAfterPost(DataSet: TDataSet);
begin
  Refrescar(QMMonedas, 'MONEDA', QMMonedasMONEDA.AsString);
  DMMain.AjustaMascaraMoneda;
end;

procedure TDMMonedas.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMMonedas, '00000');
end;

procedure TDMMonedas.QMIdiomasNewRecord(DataSet: TDataSet);
begin
  QMIdiomasMONEDA.AsString := QMMonedasMONEDA.AsString;
end;

procedure TDMMonedas.QMMonedasAfterOpen(DataSet: TDataSet);
begin
  with QMIdiomas do
  begin
     Close;
     Params.ByName['MONEDA'].AsString := QMMonedasMONEDA.AsString;
     Open;
  end;
end;

procedure TDMMonedas.QMMonedasNewRecord(DataSet: TDataSet);
begin
  QMMonedasCUENTA_PRI_VENTAS.AsString := '';
  QMMonedasCUENTA_PRI_COMPRAS.AsString := '';
  QMMonedasCUENTA_CLIENTE.AsString := '';
  QMMonedasCUENTA_PROVEEDOR.AsString := '';
end;

end.
