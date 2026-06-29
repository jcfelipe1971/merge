unit UDMTipoImpuestos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados;

type
  TDMTipoImpuestos = class(TDataModule)
     TLocal: THYTransaction;
     QMTipoImpuestos: TFIBTableSet;
     DSQMTipoImpuestos: TDataSource;
     QMTipoImpuestosPAIS: TFIBStringField;
     QMTipoImpuestosTIPO: TIntegerField;
     QMTipoImpuestosTITULO: TFIBStringField;
     QMTipoImpuestosPORCENTAJE: TFloatField;
     procedure DMTipoImpuestosCreate(Sender: TObject);
     procedure QMTipoImpuestosNewRecord(DataSet: TDataSet);
     procedure QMTipoImpuestosAfterPost(DataSet: TDataSet);
     procedure QMTipoImpuestosAfterDelete(DataSet: TDataSet);
     procedure QMTipoImpuestosBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     procedure BusquedaCompleja;
     { Public declarations }
  end;

var
  DMTipoImpuestos : TDMTipoImpuestos;

implementation

uses UDMMain, UEntorno, UFBusca;

{$R *.DFM}

procedure TDMTipoImpuestos.DMTipoImpuestosCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMTipoImpuestos, '00001');
  QMTipoImpuestosPORCENTAJE.DisplayFormat := MascaraP;
  QMTipoImpuestos.Open;
end;

procedure TDMTipoImpuestos.QMTipoImpuestosNewRecord(DataSet: TDataSet);
begin
  QMTipoImpuestos.FieldByName('PAIS').AsString := REntorno.Pais;
  QMTipoImpuestos.FieldByName('PORCENTAJE').AsInteger := 0;
end;

procedure TDMTipoImpuestos.QMTipoImpuestosAfterPost(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMTipoImpuestos.QMTipoImpuestosAfterDelete(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMTipoImpuestos.QMTipoImpuestosBeforePost(DataSet: TDataSet);
begin
  QMTipoImpuestos.FieldByName('TIPO').AsInteger :=
     DMMain.Contador_GEN(DataSet, 'CONTA_TIPO_IMPUESTO', 'TIPO', True);
end;

procedure TDMTipoImpuestos.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMTipoImpuestos, '00001');
end;

end.
