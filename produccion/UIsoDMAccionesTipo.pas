unit UIsoDMAccionesTipo;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados;

type
  TIsoDMAccionesTipo = class(TDataModule)
     QMIsoAccionesTipo: TFIBTableSet;
     DSQMAccionesTipo: TDataSource;
     TLocal: THYTransaction;
     QMIsoAccionesTipoDESCRIPCION: TFIBStringField;
     QMIsoAccionesTipoTIPO: TFIBStringField;
     procedure DMIsoAccionesTipoCreate(Sender: TObject);
     procedure QMIsoAccionesTipoAfterPost(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure BusquedaCompleja;
  end;

var
  IsoDMAccionesTipo : TIsoDMAccionesTipo;

implementation

uses UDMMain, UFBusca;

{$R *.DFM}

procedure TIsoDMAccionesTipo.DMIsoAccionesTipoCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMIsoAccionesTipo.Open;
end;

procedure TIsoDMAccionesTipo.QMIsoAccionesTipoAfterPost(DataSet: TDataSet);
var
  Tipo : string;
begin
  graba(DataSet);

  Tipo := QMIsoAccionesTipoTIPO.AsString;
  with QMIsoAccionesTipo do
  begin
     DisableControls;
     Close;
     Open;
     try
        while ((not EOF) and (Tipo <> QMIsoAccionesTipoTIPO.AsString)) do
           Next;
     finally
        EnableControls;
     end;
  end;
end;

procedure TIsoDMAccionesTipo.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TIsoDMAccionesTipo.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMIsoAccionesTipo, '00000');
end;

end.
