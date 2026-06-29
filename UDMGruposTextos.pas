unit UDMGruposTextos;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, HYFIBQuery;

type
  TDMGruposTextos = class(TDataModule)
     QMGrupos: TFIBTableSet;
     TLocal: THYTransaction;
     DSGrupos: TDataSource;
     QMGruposIdiomas: TFIBTableSet;
     DSQMGruposIdiomas: TDataSource;
     QMGruposIdiomasGRUPO: TIntegerField;
     QMGruposIdiomasIDIOMA: TFIBStringField;
     QMGruposIdiomasNOTA: TFIBStringField;
     QMGruposIdiomasTEXTO: TFIBStringField;
     QMGruposGRUPO: TIntegerField;
     QMGruposNOTA: TFIBStringField;
     QMGruposTEXTO: TFIBStringField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMGruposIdiomasNewRecord(DataSet: TDataSet);
     procedure QMGruposBeforePost(DataSet: TDataSet);
     procedure QMGruposNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure ActivaFichaIdioma;
     procedure BusquedaCompleja;
  end;

var
  DMGruposTextos : TDMGruposTextos;

implementation

{$R *.dfm}

uses UDMMain, UEntorno, uFBusca;

procedure TDMGruposTextos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  QMGrupos.Open;
end;

procedure TDMGruposTextos.ActivaFichaIdioma;
begin
  with QMGruposIdiomas do
  begin
     Close;
     Params.ByName['Grupo'].AsInteger := QMGruposGRUPO.AsInteger;
     Open;
  end;
end;

procedure TDMGruposTextos.Graba(DataSet: TDataSet);
begin
  if (not TLocal.InTransaction) then
     TLocal.CommitRetaining;
end;

procedure TDMGruposTextos.QMGruposIdiomasNewRecord(DataSet: TDataSet);
begin
  QMGruposIdiomasGrupo.AsInteger := QMGruposGRUPO.AsInteger;
  QMGruposIdiomasNOTA.AsString := QMGruposNOTA.AsString;
end;

procedure TDMGruposTextos.QMGruposBeforePost(DataSet: TDataSet);
begin
  {if ((QMGrupos.State = dsInsert) and (QMGruposGRUPO.AsInteger = 0)) then
    DMMain.Contador_Gen(DataSet, 'Conta_grupos_texto', 'GRUPO');}
end;

procedure TDMGruposTextos.QMGruposNewRecord(DataSet: TDataSet);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  with Q do
  begin
     DataBase := DMMain.DataBase;
     SQL.Text := 'select max(grupo) as grupo from sys_textos_grupos';
     ExecQuery;
     if (FieldByName['GRUPO'].AsInteger < 2000) then
        QMGruposGRUPO.AsInteger := 2001
     else
        QMGruposGRUPO.AsInteger := FieldByName['GRUPO'].AsInteger + 1;
     FreeHandle;
  end;
  FreeAndNil(Q);
end;

procedure TDMGruposTextos.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMGrupos, '00000');
end;

end.
