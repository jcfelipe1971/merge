unit UProDMPregDeslanza;

interface

uses
  SysUtils, Classes, DB, FIBDatabase, UFIBModificados, FIBDataSet,
  FIBTableDataSet, FIBQuery, HYFIBQuery, Dialogs;

type
  TProDMPregDeslanza = class(TDataModule)
     QMLanza_Masivo: TFIBTableSet;
     TLocal: THYTransaction;
     DSQMLanza_Masivo: TDataSource;
     SPUpdateSituacion: THYFIBQuery;
     QMLanza_MasivoID_CAB: TIntegerField;
     QMLanza_MasivoFECHA: TDateTimeField;
     QMLanza_MasivoMARCA: TIntegerField;
     QMLanza_MasivoENTRADA: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMLanza_MasivoBeforePost(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProDMPregDeslanza : TProDMPregDeslanza;

implementation

uses UDMMain, UEntorno;

{$R *.dfm}

procedure TProDMPregDeslanza.DataModuleCreate(Sender: TObject);
begin
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMLanza_Masivo.Close;
  QMLanza_Masivo.Open;
end;

procedure TProDMPregDeslanza.QMLanza_MasivoBeforePost(DataSet: TDataSet);
begin
  if QMLanza_MasivoMARCA.AsInteger <> 0 then
     QMLanza_MasivoENTRADA.AsInteger := REntorno.Entrada
  else
     QMLanza_MasivoENTRADA.AsInteger := 0;
end;

procedure TProDMPregDeslanza.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

end.
