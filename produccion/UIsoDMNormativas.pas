unit UIsoDMNormativas;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados;

type
  TIsoDMNormativas = class(TDataModule)
     QMIsoNormativas: TFIBTableSet;
     DSQMIsoNormativas: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMIsoNormativasCODIGO: TFIBStringField;
     QMIsoNormativasLEY: TFIBStringField;
     QMIsoNormativasFECHA_VIGOR: TDateTimeField;
     QMIsoNormativasDESCRIPCION: TBlobField;
     procedure QMIsoNormativasAfterPost(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  IsoDMNormativas : TIsoDMNormativas;

implementation

uses UDMMain, UFBusca, UIsoFMNormativas;

{$R *.DFM}

procedure TIsoDMNormativas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMIsoNormativas.Open;
end;

procedure TIsoDMNormativas.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TIsoDMNormativas.QMIsoNormativasAfterPost(DataSet: TDataSet);
begin
  graba(DataSet);
end;

procedure TIsoDMNormativas.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMIsoNormativas, '00000');
end;

end.
