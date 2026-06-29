unit UProDMGrafTareas;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBDataSetRO;

type
  TProDMGrafTareas = class(TDataModule)
     TLocal: THYTransaction;
     xGrafCosteTareas: TFIBDataSetRO;
     xGrafCosteTareasLINEA_FASE: TIntegerField;
     xGrafCosteTareasTIPOTAREA: TFIBStringField;
     xGrafCosteTareasTAREA: TFIBStringField;
     xGrafCosteTareasTOTAL_PREV: TFloatField;
     xGrafCosteTareasTOTAL_REAL: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Datos(id_orden: integer);
  end;

var
  ProDMGrafTareas : TProDMGrafTareas;

implementation

{$R *.dfm}

procedure TProDMGrafTareas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TProDMGrafTareas.Datos(id_orden: integer);
begin
  xGrafCosteTareas.Close;
  xGrafCosteTareas.Params.ByName['ID_ORDEN'].AsInteger := id_orden;
  xGrafCosteTareas.Open;
end;

end.
