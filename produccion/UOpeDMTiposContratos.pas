unit UOpeDMTiposContratos;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados;

type
  TOpeDMTiposContratos = class(TDataModule)
     QMTipoContratos: TFIBTableSet;
     QMTipoContratosTIPO: TFIBStringField;
     QMTipoContratosDESCRIPCION: TFIBStringField;
     QMTipoContratosHORAS_MES: TFloatField;
     QMTipoContratosESPECIFICACIONES: TBlobField;
     DSQMTipoContratos: TDataSource;
     TLocal: THYTransaction;
     procedure Duplicados(Sender: TField);
     procedure OpeDMTiposContratosCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMTipoContratosAfterPost(DataSet: TDataSet);
     procedure QMTipoContratosNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  OpeDMTiposContratos : TOpeDMTiposContratos;

implementation

{$R *.DFM}

uses UDMMain, UFBusca, UUtiles;

procedure TOpeDMTiposContratos.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMTipoContratos, '00000');
end;

procedure TOpeDMTiposContratos.Duplicados(Sender: TField);
begin
  // DMMain.ControlaDuplicados(Sender);
end;

procedure TOpeDMTiposContratos.OpeDMTiposContratosCreate(Sender: TObject);
begin
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMTipoContratos.Open;
end;

procedure TOpeDMTiposContratos.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TOpeDMTiposContratos.QMTipoContratosAfterPost(DataSet: TDataSet);
begin
  Graba(DataSet);

  Refrescar(QMTipoContratos, 'TIPO', QMTipoContratosTIPO.AsString);
end;

procedure TOpeDMTiposContratos.QMTipoContratosNewRecord(DataSet: TDataSet);
begin
  QMTipoContratosHORAS_MES.AsInteger := 0;
end;

end.
