unit UCrmDMAcciones;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet;

type
  TCrmDMAcciones = class(TDataModule)
     TLocal: THYTransaction;
     QMAcciones: TFIBTableSet;
     DSQMAcciones: TDataSource;
     QMAccionesACCION: TFIBStringField;
     QMAccionesDESCRIPCION: TFIBStringField;
     QMAccionesFIN_ACCION: TIntegerField;
     QMAccionesTIPO_SEG: TFIBStringField;
     QMAccionesCREAR_SEGUIMIENTO: TIntegerField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMAccionesNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  CrmDMAcciones : TCrmDMAcciones;

implementation

uses UFBusca, UDMMain;

{$R *.DFM}

procedure TCrmDMAcciones.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMAcciones.Open;
end;

procedure TCrmDMAcciones.QMAccionesNewRecord(DataSet: TDataSet);
begin
  QMAccionesFIN_ACCION.AsInteger := 0;
end;

procedure TCrmDMAcciones.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMAcciones, '00000');
end;

end.
