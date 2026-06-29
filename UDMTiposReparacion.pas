unit UDMTiposReparacion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados;

type
  TDMTiposReparacion = class(TDataModule)
     DSQMTiposReparacion: TDataSource;
     QMTiposReparacion: TFIBTableSet;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMTiposReparacionTIPO: TIntegerField;
     QMTiposReparacionTITULO: TFIBStringField;
     procedure BusquedaCompleja;
     procedure DMTiposReparacionCreate(Sender: TObject);
     procedure QMTiposReparacionNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMTiposReparacion : TDMTiposReparacion;

implementation

uses
  UDMMain, UFBusca, HYFIBQuery;

procedure TDMTiposReparacion.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMTiposReparacion, '00000');
end;

{$R *.DFM}

procedure TDMTiposReparacion.DMTiposReparacionCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMTiposReparacion.Open;
end;

procedure TDMTiposReparacion.QMTiposReparacionNewRecord(DataSet: TDataSet);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MAX(TIPO) FROM SYS_TIPO_REPARACION';
        ExecQuery;
        QMTiposReparacionTIPO.AsInteger := FieldByName['MAX'].AsInteger + 1;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
