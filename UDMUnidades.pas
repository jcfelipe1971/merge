unit UDMUnidades;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet;

type
  TDMUnidades = class(TDataModule)
     TLocal: THYTransaction;
     QMUnidades: TFIBTableSet;
     DSQMUnidades: TDataSource;
     QMUnidadesTIPO: TFIBStringField;
     QMUnidadesTITULO: TFIBStringField;
     QMUnidadesSIGNO: TFIBStringField;
     QMUnidadesDECIMALES: TIntegerField;
     TUpdate: THYTransaction;
     QMUnidadesIdioma: TFIBTableSet;
     DSQMUnidadesIdioma: TDataSource;
     QMUnidadesIdiomaTIPO: TFIBStringField;
     QMUnidadesIdiomaIDIOMA: TFIBStringField;
     QMUnidadesIdiomaTITULO: TFIBStringField;
     procedure DMUnidadesCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMUnidadesNewRecord(DataSet: TDataSet);
     procedure QMUnidadesAfterOpen(DataSet: TDataSet);
     procedure QMUnidadesBeforeClose(DataSet: TDataSet);
     procedure QMUnidadesIdiomaNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMUnidades : TDMUnidades;

implementation

uses UFBusca, UDMMain;

{$R *.DFM}

procedure TDMUnidades.DMUnidadesCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMUnidades.Open;
end;

procedure TDMUnidades.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMUnidades.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMUnidades, '00000');
end;

procedure TDMUnidades.QMUnidadesNewRecord(DataSet: TDataSet);
begin
  QMUnidadesDECIMALES.AsInteger := 0;
end;

procedure TDMUnidades.QMUnidadesAfterOpen(DataSet: TDataSet);
begin
  QMUnidadesIdioma.Open;
end;

procedure TDMUnidades.QMUnidadesBeforeClose(DataSet: TDataSet);
begin
  QMUnidadesIdioma.Close;
end;

procedure TDMUnidades.QMUnidadesIdiomaNewRecord(DataSet: TDataSet);
begin
  QMUnidadesIdiomaTIPO.AsString := QMUnidadesTIPO.AsString;
end;

end.
