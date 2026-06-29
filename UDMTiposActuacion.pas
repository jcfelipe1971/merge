unit UDMTiposActuacion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados;

type
  TDMTiposActuacion = class(TDataModule)
     DSQMTiposActuacion: TDataSource;
     QMTiposActuacion: TFIBTableSet;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMTiposActuacionTIPO: TIntegerField;
     QMTiposActuacionTITULO: TFIBStringField;
     QMTiposActuacionDESCRIPCION: TMemoField;
     procedure BusquedaCompleja;
     procedure DMTiposActuacionCreate(Sender: TObject);
     procedure QMTiposActuacionNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMTiposActuacion : TDMTiposActuacion;

implementation

uses
  UDMMain, UFBusca, HYFIBQuery;

procedure TDMTiposActuacion.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMTiposActuacion, '00000');
end;

{$R *.DFM}

procedure TDMTiposActuacion.DMTiposActuacionCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMTiposActuacion.Open;
end;

procedure TDMTiposActuacion.QMTiposActuacionNewRecord(DataSet: TDataSet);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MAX(TIPO) FROM SYS_TIPO_ACTUACION';
        ExecQuery;
        QMTiposActuacionTIPO.AsInteger := FieldByName['MAX'].AsInteger + 1;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
