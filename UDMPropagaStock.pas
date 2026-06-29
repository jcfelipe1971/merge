unit UDMPropagaStock;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet, FIBQuery,
  FIBDataSetRO, HYFIBQuery;

type
  TDMPropagaStock = class(TDataModule)
     QMPropaga: TFIBTableSet;
     TLocal: THYTransaction;
     DSQMPropaga: TDataSource;
     QMPropagaEMPRESA_O: TIntegerField;
     QMPropagaCANAL_O: TIntegerField;
     QMPropagaALMACEN_O: TFIBStringField;
     QMPropagaEMPRESA_D: TIntegerField;
     QMPropagaCANAL_D: TIntegerField;
     QMPropagaALMACEN_D: TFIBStringField;
     QMPropagaPMP: TIntegerField;
     QMPropagaSTOCK: TIntegerField;
     procedure DMPropagaCreate(Sender: TObject);
     procedure QMPropagaNewRecord(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMPropagaStock : TDMPropagaStock;

implementation

uses UDMMain, UFBusca, UEntorno;

{$R *.DFM}

procedure TDMPropagaStock.DMPropagaCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMPropaga.Open;
end;

procedure TDMPropagaStock.QMPropagaNewRecord(DataSet: TDataSet);
begin
  QMPropagaEMPRESA_D.AsInteger := REntorno.Empresa;
  QMPropagaEMPRESA_O.AsInteger := REntorno.Empresa;
  QMPropagaCANAL_O.AsInteger := REntorno.Canal;
  QMPropagaCANAL_D.AsInteger := REntorno.Canal;
  QMPropagaALMACEN_O.AsString := REntorno.AlmacenDefecto;
  QMPropagaALMACEN_D.AsString := REntorno.AlmacenDefecto;
  QMPropagaPMP.AsInteger := 0;
  QMPropagaSTOCK.AsInteger := 1;
end;

procedure TDMPropagaStock.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

end.
