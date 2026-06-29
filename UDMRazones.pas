unit UDMRazones;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, DBTables, FIBDatabase, FIBDataSet, FIBTableDataSet, FIBQuery,
  UFIBModificados;

type
  TDMRazones = class(TDataModule)
     QMRazones: TFIBTableSet;
     DSRazones: TDataSource;
     TLocal: THYTransaction;
     QMRazonesRAZON: TFIBStringField;
     QMRazonesTITULO: TFIBStringField;
     QMRazonesZ_TIPO: TIntegerField;
     TUpdate: THYTransaction;
     procedure DMSeriesCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
  private
     { Private declarations }
  public
     procedure BusquedaCompleja;
     { Public declarations }
  end;

var
  DMRazones : TDMRazones;

implementation

uses UDMMain, UUtiles, UEntorno, UFBusca;

{$R *.DFM}

procedure TDMRazones.DMSeriesCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMRazones.Open;
end;

procedure TDMRazones.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMRazones.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMRazones, '00000');
end;

end.
