unit UProDMGrafCostesFases;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSetRO, FIBDatabase, UFIBModificados,
  FIBDataSet;

type
  TProDMGrafCostesFases = class(TDataModule)
     TLocal: THYTransaction;
     xGrafCostesFases: TFIBDataSetRO;
     xGrafCostesFasesLINEA_FASE: TIntegerField;
     xGrafCostesFasesFASE: TFIBStringField;
     xGrafCostesFasesTAREA_PREV: TFloatField;
     xGrafCostesFasesTAREA_REAL: TFloatField;
     xGrafCostesFasesMATERIAL_PREV: TFloatField;
     xGrafCostesFasesMATERIAL_REAL: TFloatField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Datos(id_orden: integer);
  end;

var
  ProDMGrafCostesFases : TProDMGrafCostesFases;

implementation

{$R *.dfm}

procedure TProDMGrafCostesFases.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TProDMGrafCostesFases.Datos(id_orden: integer);
begin
  xGrafCostesFases.Close;
  xGrafCostesFases.Params.ByName['ID_ORDEN'].AsInteger := id_orden;
  xGrafCostesFases.Open;
end;

end.
