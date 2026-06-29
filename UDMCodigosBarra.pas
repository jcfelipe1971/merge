unit UDMCodigosBarra;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados;

type
  TDMCodigosBarra = class(TDataModule)
     TLocal: THYTransaction;
     QMCodigosBarra: TFIBTableSet;
     DSQMCodigosBarra: TDataSource;
     QMCodigosBarraTIPO: TIntegerField;
     QMCodigosBarraTITULO: TFIBStringField;
     QMCodigosBarraLONGITUD: TIntegerField;
     TUpdate: THYTransaction;
     procedure DMCodigosBarraCreate(Sender: TObject);
     procedure QMCodigosBarraAfterDelete(DataSet: TDataSet);
     procedure QMCodigosBarraAfterPost(DataSet: TDataSet);
     procedure QMCodigosBarraBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     procedure BusquedaCompleja;
     { Public declarations }
  end;

var
  DMCodigosBarra : TDMCodigosBarra;

implementation

uses UDMMain, UFBusca;

{$R *.DFM}

procedure TDMCodigosBarra.DMCodigosBarraCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMCodigosBarra.Open;
end;

procedure TDMCodigosBarra.QMCodigosBarraAfterDelete(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMCodigosBarra.QMCodigosBarraAfterPost(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TDMCodigosBarra.QMCodigosBarraBeforePost(DataSet: TDataSet);
begin
  QMCodigosBarraTIPO.AsInteger := DMMain.Contador_GEN(DataSet, 'CONTA_BARRAS', 'TIPO');
end;

procedure TDMCodigosBarra.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMCodigosBarra, '00000');
end;

end.
