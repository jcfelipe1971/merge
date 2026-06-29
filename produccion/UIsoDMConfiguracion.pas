unit UIsoDMConfiguracion;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, DB, FIBDataSet, FIBTableDataSet, DBCtrls,
  URecursos;

type
  TIsoDMConfiguracion = class(TDataModule)
     TLocal: TFIBTransaction;
     QMConfig: TFIBTableSet;
     DSConfig: TDataSource;
     QMConfigID: TIntegerField;
     QMConfigVALORACION_MANUAL: TIntegerField;
     QMConfigVALORACION_INC_PED: TIntegerField;
     QMConfigVALORACION_COSTE: TIntegerField;
     QMConfigVALORACION_ENTREGAS: TIntegerField;
     QMConfigVALOR_INC_PED_A: TIntegerField;
     QMConfigVALOR_INC_PED_B: TIntegerField;
     QMConfigVALOR_INC_PED_C: TIntegerField;
     QMConfigVALOR_COSTE_A: TIntegerField;
     QMConfigVALOR_COSTE_B: TIntegerField;
     QMConfigVALOR_COSTE_C: TIntegerField;
     QMConfigVALOR_ENTREGAS_A: TIntegerField;
     QMConfigVALOR_ENTREGAS_B: TIntegerField;
     QMConfigVALOR_ENTREGAS_C: TIntegerField;
     QMConfigVALOR_MANUAL_A: TIntegerField;
     QMConfigVALOR_MANUAL_B: TIntegerField;
     QMConfigVALOR_MANUAL_C: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMConfigAfterOpen(DataSet: TDataSet);
     procedure Graba(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  IsoDMConfiguracion : TIsoDMConfiguracion;

implementation

uses UDMMain, UIsoFMConfiguracion;

{$R *.dfm}

procedure TIsoDMConfiguracion.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  //sfg.albert - S'obre la taula  
  QMConfig.Close;
  QMConfig.Open;
end;

procedure TIsoDMConfiguracion.Graba(DataSet: TDataSet);
begin
  TFIBTableSet(DataSet).Transaction.CommitRetaining;
end;

procedure TIsoDMConfiguracion.QMConfigAfterOpen(DataSet: TDataSet);
begin
  if (QMConfig.RecordCount > 0) then
     IsoFMConfiguracion.NavMain.VisibleButtons :=
        IsoFMConfiguracion.NavMain.VisibleButtons - [nbInsert];
end;

end.
