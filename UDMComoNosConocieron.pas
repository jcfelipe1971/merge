unit UDMComoNosConocieron;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DB, FIBDataSet, FIBTableDataSet, FIBDatabase, UFIBModificados;

type
  TDMComoNosConocieron = class(TDataModule)
     DSQMComoNosConocieron: TDataSource;
     QMComoNosConocieron: TFIBTableSet;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMComoNosConocieronMODO: TIntegerField;
     QMComoNosConocieronTITULO: TFIBStringField;
     procedure BusquedaCompleja;
     procedure DMComoNosConocieronCreate(Sender: TObject);
     procedure QMComoNosConocieronNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMComoNosConocieron : TDMComoNosConocieron;

implementation

uses
  UDMMain, UFBusca, HYFIBQuery;

procedure TDMComoNosConocieron.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMComoNosConocieron, '00000');
end;

{$R *.DFM}

procedure TDMComoNosConocieron.DMComoNosConocieronCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMComoNosConocieron.Open;
end;

procedure TDMComoNosConocieron.QMComoNosConocieronNewRecord(DataSet: TDataSet);
begin
  if (DataSet.State = dsInsert) and (QMComoNosConocieronMODO.AsInteger <= 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT MAX(MODO) FROM SYS_COMO_NOS_CONOCIERON';
           ExecQuery;
           QMComoNosConocieronMODO.AsInteger := FieldByName['MAX'].AsInteger + 1;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

end.
