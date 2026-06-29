unit UProDMTareas;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, FR_DSet, FR_DBSet, FR_Class, Fr_HYReport, HYFIBQuery;

type
  TProDMTareas = class(TDataModule)
     DSQMProSysTareas: TDataSource;
     TLocal: THYTransaction;
     QMProSysTareas: TFIBTableSet;
     QMProSysTareasTAREA: TFIBStringField;
     QMProSysTareasTITULO: TFIBStringField;
     QMProSysTareasABSOLUTO: TIntegerField;
     frProTareas: TfrHYReport;
     frDBLstTareas: TfrDBDataSet;
     QMProSysTareasFASE: TFIBStringField;
     QMProSysTareasEMPRESA: TIntegerField;
     QMProSysTareasCENTRO: TFIBStringField;
     DSxArtRep: TDataSource;
     xArtRep: TFIBTableSet;
     xArtRepEMPRESA: TIntegerField;
     xArtRepARTICULO: TFIBStringField;
     xArtRepTITULO_LARGO: TFIBStringField;
     xArtRepTAREA: TFIBStringField;
     xArtRepTITULO: TFIBStringField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMProSysTareasNewRecord(DataSet: TDataSet);
     procedure xArtRepNewRecord(DataSet: TDataSet);
     procedure QMProSysTareasAfterOpen(DataSet: TDataSet);
     procedure QMProSysTareasBeforeClose(DataSet: TDataSet);
  private
     { Private declarations }
  public
     procedure BusquedaCompleja;
     function DameCenTrabTitulo(CTrabajo: string): string;
  end;

var
  ProDMTareas : TProDMTareas;

implementation

uses UDMMain, UFBusca, UEntorno;

{$R *.dfm}

procedure TProDMTareas.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMProSysTareas, '10000');
end;

procedure TProDMTareas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMProSysTareas.Close;
  QMProSysTareas.Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
  QMProSysTareas.Open;
end;

function TProDMTareas.DameCenTrabTitulo(CTrabajo: string): string;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT DESCRIPCION FROM OPE_CENT_TRABAJO ' +
           'WHERE EMPRESA = ?EMPRESA AND CENTRO = ?CENTRO ';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ;
        Params.ByName['CENTRO'].AsString := CTrabajo;
        ExecQuery;
        Result := FieldByName['DESCRIPCION'].AsString;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TProDMTareas.QMProSysTareasNewRecord(DataSet: TDataSet);
begin
  QMProSysTareasEMPRESA.AsInteger := REntorno.Empresa;
end;

procedure TProDMTareas.xArtRepNewRecord(DataSet: TDataSet);
begin
  xArtRepEMPRESA.AsInteger := QMProSysTareasEMPRESA.AsInteger;
  xArtRepTAREA.AsString := QMProSysTareasTAREA.AsString;
end;

procedure TProDMTareas.QMProSysTareasAfterOpen(DataSet: TDataSet);
begin
  xArtRep.Open;
end;

procedure TProDMTareas.QMProSysTareasBeforeClose(DataSet: TDataSet);
begin
  xArtRep.Close;
end;

end.
