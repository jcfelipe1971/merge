unit UIsoDMIncTipo;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados;

type
  TIsoDMIncTipo = class(TDataModule)
     QMIsoIncTipo: TFIBTableSet;
     DSQMIsoIncTipo: TDataSource;
     TLocal: THYTransaction;
     QMIsoIncTipoDESCRIPCION: TFIBStringField;
     QMIsoIncTipoTIPO: TFIBStringField;
     procedure QMIsoIncTipoAfterPost(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
     procedure DMIsoIncTipoCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  IsoDMIncTipo : TIsoDMIncTipo;

implementation

uses UDMMain, UFBusca;

{$R *.DFM}

procedure TIsoDMIncTipo.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TIsoDMIncTipo.QMIsoIncTipoAfterPost(DataSet: TDataSet);
var
  Tipo : string;
begin
  graba(DataSet);

  Tipo := QMIsoIncTipoTIPO.AsString;
  with QMIsoIncTipo do
  begin
     DisableControls;
     Close;
     Open;
     try
        while ((not EOF) and (Tipo <> QMIsoIncTipoTIPO.AsString)) do
           Next;
     finally
        EnableControls;
     end;
  end;
end;

procedure TIsoDMIncTipo.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMIsoIncTipo, '00000');
end;

procedure TIsoDMIncTipo.DMIsoIncTipoCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMIsoIncTipo.Open;
end;

end.
