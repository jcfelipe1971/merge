unit UIsoDMManualTipo;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  FIBDatabase, UFIBModificados, DB, FIBDataSet, FIBTableDataSet;

type
  TIsoDMManualTipo = class(TDataModule)
     QMIsoManualTipo: TFIBTableSet;
     DSQMIsoManualTipo: TDataSource;
     TLocal: THYTransaction;
     QMIsoManualTipoTIPO: TFIBStringField;
     QMIsoManualTipoDESCRIPCION: TFIBStringField;
     procedure QMIsoManualTipoAfterPost(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure DMIsoManualTipoCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  IsoDMManualTipo : TIsoDMManualTipo;

implementation

uses UDMMain, UFBusca;

{$R *.DFM}

procedure TIsoDMManualTipo.QMIsoManualTipoAfterPost(DataSet: TDataSet);
var
  Tipo : string;
begin
  graba(DataSet);

  Tipo := QMIsoManualTipoTIPO.AsString;
  with QMIsoManualTipo do
  begin
     DisableControls;
     Close;
     Open;
     try
        while ((not EOF) and (Tipo <> QMIsoManualTipoTIPO.AsString)) do
           Next;
     finally
        EnableControls;
     end;
  end;
end;

procedure TIsoDMManualTipo.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TIsoDMManualTipo.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMIsoManualTipo, '00000');
end;

procedure TIsoDMManualTipo.DMIsoManualTipoCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMIsoManualTipo.Open;
end;

end.
