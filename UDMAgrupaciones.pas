unit UDMAgrupaciones;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados;

type
  TDMAgrupaciones = class(TDataModule)
     TLocal: THYTransaction;
     QMAgrupaciones: TFIBTableSet;
     DSQMAgrupaciones: TDataSource;
     QMAgrupacionesAGRUPACION: TFIBStringField;
     QMAgrupacionesTITULO: TFIBStringField;
     QMAgrupacionesTIPO: TFIBStringField;
     QMAgrupacionesNOTAS: TBlobField;
     QMAgrupacionesTITULO_WEB: TFIBStringField;
     QMAgrupacionesWEB: TIntegerField;
     TUpdate: THYTransaction;
     procedure DMAgrupacionesCreate(Sender: TObject);
     procedure QMAgrupacionesNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMAgrupaciones : TDMAgrupaciones;

implementation

uses UDMMain, UFBusca;

{$R *.DFM}

procedure TDMAgrupaciones.DMAgrupacionesCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMAgrupaciones.Open;
end;

procedure TDMAgrupaciones.QMAgrupacionesNewRecord(DataSet: TDataSet);
begin
  // Cliente por Defecto
  QMAgrupacionesTIPO.AsString := 'C';
  QMAgrupacionesWEB.AsInteger := 1;
end;

procedure TDMAgrupaciones.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMAgrupaciones, '00000');
end;

end.
