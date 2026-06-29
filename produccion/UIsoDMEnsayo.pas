unit UIsoDMEnsayo;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados;

type
  TIsoDMEnsayo = class(TDataModule)
     QMIsoEnsayo: TFIBTableSet;
     DSQMIsoEnsayo: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMIsoEnsayoCODIGO: TFIBStringField;
     QMIsoEnsayoISO_TIPO_ENSAYO: TFIBStringField;
     QMIsoEnsayoISO_NORMATIVAS: TFIBStringField;
     QMIsoEnsayoDESCRIPCION: TFIBStringField;
     procedure QMIsoEnsayoAfterPost(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  IsoDMEnsayo : TIsoDMEnsayo;

implementation

uses UDMMain, UFBusca;

{$R *.DFM}

procedure TIsoDMEnsayo.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMIsoEnsayo.Open;
end;

procedure TIsoDMEnsayo.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TIsoDMEnsayo.QMIsoEnsayoAfterPost(DataSet: TDataSet);
begin
  graba(DataSet);
end;

end.
