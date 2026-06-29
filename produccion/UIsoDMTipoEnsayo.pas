unit UIsoDMTipoEnsayo;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados;

type
  TIsoDMTipoEnsayo = class(TDataModule)
     QMIsoTipoEnsayo: TFIBTableSet;
     DSQMIsoTipoEnsayo: TDataSource;
     TLocal: THYTransaction;
     QMIsoTipoEnsayoCODIGO: TFIBStringField;
     QMIsoTipoEnsayoDESCRIPCION: TFIBStringField;
     TUpdate: THYTransaction;
     procedure Graba(DataSet: TDataSet);
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  IsoDMTipoEnsayo : TIsoDMTipoEnsayo;

implementation

uses UDMMain, UFBusca;

{$R *.DFM}


procedure TIsoDMTipoEnsayo.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMIsoTipoEnsayo.Open;
end;

procedure TIsoDMTipoEnsayo.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TIsoDMTipoEnsayo.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMIsoTipoEnsayo, '00000');
end;

end.
