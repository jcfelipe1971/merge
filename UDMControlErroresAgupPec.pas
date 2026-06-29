unit UDMControlErroresAgupPec;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBQuery, HYFIBQuery;

type
  TDMControlErroresAgrupPec = class(TDataModule)
     DSQMErrores: TDataSource;
     QMErrores: TFIBTableSet;
     TLocal: THYTransaction;
     QMErroresENTRADA: TIntegerField;
     QMErroresEMPRESA: TIntegerField;
     QMErroresEJERCICIO: TIntegerField;
     QMErroresCANAL: TIntegerField;
     QMErroresSERIE: TFIBStringField;
     QMErroresTIPO: TFIBStringField;
     QMErroresRIG: TIntegerField;
     QMErroresTEXTO_ERROR: TFIBStringField;
     QMErroresAGRUPACION: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Filtra;
     procedure BorraTemporales;
  end;

var
  DMControlErroresAgrupPec : TDMControlErroresAgrupPec;

implementation

uses UEntorno, UDMMain;

{$R *.dfm}

procedure TDMControlErroresAgrupPec.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  Filtra;
end;

procedure TDMControlErroresAgrupPec.Filtra;
begin
  with QMErrores do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;
end;

procedure TDMControlErroresAgrupPec.DataModuleDestroy(Sender: TObject);
begin
  BorraTemporales;
end;

procedure TDMControlErroresAgrupPec.BorraTemporales;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM TMP_ERRORES_AGRUP_PEDIDOS WHERE ENTRADA = :ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
