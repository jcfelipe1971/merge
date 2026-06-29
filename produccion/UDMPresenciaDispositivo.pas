unit UDMPresenciaDispositivo;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, HYFIBQuery;

type
  TDMPresenciaDispositivo = class(TDataModule)
     TLocal: THYTransaction;
     QMDisPre: TFIBTableSet;
     DSQMDisPre: TDataSource;
     TUpdate: THYTransaction;
     QMDisPreID: TIntegerField;
     QMDisPreDESCRIPCION: TFIBStringField;
     QMDisPreIDENTIFICADOR_DISPOSITIVO: TFIBStringField;
     QMDisPreLATITUD: TFloatField;
     QMDisPreLONGITUD: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMDisPreNewRecord(DataSet: TDataSet);
     procedure QMDisPreBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMPresenciaDispositivo : TDMPresenciaDispositivo;

implementation

uses UDMMain, UUtiles, UEntorno;

{$R *.dfm}

procedure TDMPresenciaDispositivo.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  AsignaDisplayFormat(QMDisPre, MascaraN, MascaraI, ShortDateFormat + 'hh:nn');
  QMDisPreLATITUD.DisplayFormat := '0.00000';
  QMDisPreLONGITUD.DisplayFormat := '0.00000';

  QMDisPre.Open;
end;

procedure TDMPresenciaDispositivo.QMDisPreNewRecord(DataSet: TDataSet);
begin
  QMDisPreID.AsInteger := 0;
  QMDisPreDESCRIPCION.AsString := '';
  QMDisPreIDENTIFICADOR_DISPOSITIVO.AsString := '';
  QMDisPreLATITUD.AsFloat := 0;
  QMDisPreLONGITUD.AsFloat := 0;
end;

procedure TDMPresenciaDispositivo.QMDisPreBeforePost(DataSet: TDataSet);
begin
  if ((DataSet.State = dsInsert) and (QMDisPreID.AsInteger = 0)) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT MAX(ID) FROM PRO_SYS_DISP_PRESENCIA';
           ExecQuery;
           QMDisPreID.AsInteger := FieldByName['MAX'].AsInteger + 1;
        finally
           Free;
        end;
     end;
  end;
end;

end.
