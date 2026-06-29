unit UDMSeries;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, FIBDatabase, FIBDataSet, FIBTableDataSet, FIBQuery,
  UFIBModificados;

type
  TDMSeries = class(TDataModule)
     QMSeries: TFIBTableSet;
     DSSeries: TDataSource;
     TLocal: THYTransaction;
     QMSeriesSERIE: TFIBStringField;
     QMSeriesTITULO: TFIBStringField;
     TUpdate: THYTransaction;
     procedure DMSeriesCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMSeries : TDMSeries;

implementation

uses UDMMain, UFBusca;

{$R *.DFM}

procedure TDMSeries.DMSeriesCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMSeries.Open;
end;

procedure TDMSeries.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMSeries, '00000');
end;

end.
