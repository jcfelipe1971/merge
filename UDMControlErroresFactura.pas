unit UDMControlErroresFactura;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBQuery, HYFIBQuery;

type
  TDMControlErroresFactura = class(TDataModule)
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
  DMControlErroresFactura : TDMControlErroresFactura;

implementation

uses UEntorno, UDMMain;

{$R *.dfm}

procedure TDMControlErroresFactura.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  Filtra;
end;

procedure TDMControlErroresFactura.Filtra;
begin
  with QMErrores do
  begin
     Close;
     Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
     Open;
  end;
end;

procedure TDMControlErroresFactura.DataModuleDestroy(Sender: TObject);
begin
  BorraTemporales;
end;

procedure TDMControlErroresFactura.BorraTemporales;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM TMP_ERRORES_FACTURACION WHERE ENTRADA = :ENTRADA';
        Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
