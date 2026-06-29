unit UDMArtBultos;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, FIBDatabase,
  UFIBModificados, FIBQuery, HYFIBQuery;

type
  TDMArtBultos = class(TDataModule)
     DSQMArtBultos: TDataSource;
     TLocal: THYTransaction;
     QMArtBultos: TFIBTableSet;
     QMArtBultosEMPRESA: TIntegerField;
     QMArtBultosBULTO: TIntegerField;
     QMArtBultosTITULO: TFIBStringField;
     QMArtBultosPESO: TFloatField;
     QMArtBultosVOLUMEN: TFloatField;
     QMArtBultosDIAMETRO: TFloatField;
     TUpdate: THYTransaction;
     QMArtBultosTIPO_BULTO: TFIBStringField;
     QMArtBultosNO_UNIDADES: TIntegerField;
     QMArtBultosALTO: TFloatField;
     QMArtBultosANCHO: TFloatField;
     QMArtBultosFONDO: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
     procedure Graba(DataSet: TDataSet);
     procedure QMArtBultosNewRecord(DataSet: TDataSet);
  private
     { Private declarations }
     function ProxBulto: integer;
  public
     { Public declarations }
     procedure BusquedaCompleja;
     function DameTituloTipoBulto(Tipo: string): string;
  end;

var
  DMArtBultos : TDMArtBultos;

implementation

{$R *.dfm}

uses
  UDMMain, UEntorno, UFBusca;

procedure TDMArtBultos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DMMain.FiltraTabla(QMArtBultos, '10000', True);
end;

procedure TDMArtBultos.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

function TDMArtBultos.ProxBulto: integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        Database := DMMain.Database;
        SQL.Text := 'SELECT MAX(BULTO) AS MAXIMO FROM ART_BULTOS WHERE EMPRESA = ' + REntorno.EmpresaStr;
        ExecQuery;
        Result := FieldByName['MAXIMO'].AsInteger + 1;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMArtBultos.QMArtBultosNewRecord(DataSet: TDataSet);
begin
  QMArtBultosEMPRESA.AsInteger := REntorno.Empresa;
  QMArtBultosBULTO.AsInteger := ProxBulto;
  QMArtBultosPESO.AsFloat := 0;
  QMArtBultosALTO.AsFloat := 0;
  QMArtBultosANCHO.AsFloat := 0;
  QMArtBultosFONDO.AsFloat := 0;
  QMArtBultosVOLUMEN.AsFloat := 0;
  QMArtBultosDIAMETRO.AsFloat := 0;
  QMArtBultosTIPO_BULTO.AsString := 'DES';
end;

procedure TDMArtBultos.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMArtBultos, '00000');
end;

function TDMArtBultos.DameTituloTipoBulto(Tipo: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TITULO FROM SYS_TIPO_BULTO WHERE TIPO = :TIPO';
        Params.ByName['TIPO'].AsString := Tipo;
        ExecQuery;
        Result := FieldByName['TITULO'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
