unit UProDMGrafMateriales;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDataSetRO, FIBDatabase,
  UFIBModificados;

type
  TProDMGrafMateriales = class(TDataModule)
     TLocal: THYTransaction;
     xGrafCosteMateriales: TFIBDataSetRO;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Datos(id_orden: integer);
  end;

var
  ProDMGrafMateriales : TProDMGrafMateriales;

implementation

{$R *.dfm}

procedure TProDMGrafMateriales.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
end;

procedure TProDMGrafMateriales.Datos(id_orden: integer);
begin
  xGrafCosteMateriales.Close;
  xGrafCosteMateriales.Params.ByName['ID_ORDEN'].AsInteger := id_orden;
  xGrafCosteMateriales.Open;
end;

end.
