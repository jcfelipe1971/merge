unit UDMMonedaCuenta;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, FIBDatabase, FIBDataSet, FIBTableDataSet, FIBQuery,
  UFIBModificados, FIBDataSetRO;

type
  TDMMonedaCuenta = class(TDataModule)
     DSQMMonedas: TDataSource;
     QMMonedas: TFIBTableSet;
     TLocal: THYTransaction;
     QMMonedasEMPRESA: TIntegerField;
     QMMonedasEJERCICIO: TIntegerField;
     QMMonedasCANAL: TIntegerField;
     QMMonedasMONEDA: TFIBStringField;
     QMMonedasTITULO: TFIBStringField;
     QMMonedasCUENTA_NEGATIVO: TFIBStringField;
     QMMonedasCUENTA_POSITIVO: TFIBStringField;
     TUpdate: THYTransaction;
     procedure Graba(DataSet: TDataSet);
     procedure QMMonedasAfterPost(DataSet: TDataSet);
     procedure DMMonedaCuentaCreate(Sender: TObject);
  private
     { Private declarations }
  public
     procedure BusquedaCompleja;
     { Public declarations }
  end;

var
  DMMonedaCuenta : TDMMonedaCuenta;

implementation

uses UDMMain, UUtiles, UEntorno, UFBusca, UFMMonedaCuenta;

{$R *.DFM}

procedure TDMMonedaCuenta.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMMonedaCuenta.QMMonedasAfterPost(DataSet: TDataSet);
begin
  graba(DataSet);
end;

procedure TDMMonedaCuenta.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMMonedas, '11100');
end;

procedure TDMMonedaCuenta.DMMonedaCuentaCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  DMMain.FiltraTabla(QMMonedas, '11100', True);
end;

end.
