unit UDMGasDispensador;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados;

type
  TDMGasDispensador = class(TDataModule)
     QMGasDispensador: TFIBTableSet;
     DSQMGasDispensador: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMGasDispensadorCOD_DISPENSADOR: TIntegerField;
     QMGasDispensadorTITULO: TFIBStringField;
     QMGasDispensadorESTADO: TIntegerField;
     QMGasDispensadorNOTAS: TBlobField;
     QMGasDispensadorSERIE: TFIBStringField;
     QMGasDispensadorDISTRIBUCION: TIntegerField;
     QMGasDispensadorLECTURA_FINAL: TFloatField;
     QMGasDispensadorID_VENTA_LECTURA: TIntegerField;
     procedure QMGasDispensadorAfterPost(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  DMGasDispensador : TDMGasDispensador;

implementation

uses UDMMain, UFBusca, UEntorno;

{$R *.DFM}

procedure TDMGasDispensador.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMGasDispensador.QMGasDispensadorAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);
end;

procedure TDMGasDispensador.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMGasDispensador, '00000');
end;

procedure TDMGasDispensador.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMGasDispensadorLECTURA_FINAL.DisplayFormat := MascaraN;
  QMGasDispensador.Open;
end;

end.
