unit UDMBrevo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet;

type
  TDMBrevo = class(TDataModule)
     DSxListas: TDataSource;
     DSxPersonas: TDataSource;
     xPersonas: TFIBTableSet;
     xListas: TFIBTableSet;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     xPersonasID: TIntegerField;
     xPersonasEMAIL: TFIBStringField;
     xPersonasEMAIL_BLACKLISTED: TIntegerField;
     xPersonasSMS_BLACKLISTED: TIntegerField;
     xPersonasCREATED_AT: TDateTimeField;
     xPersonasMODIFIED_AT: TDateTimeField;
     xPersonasULT_SINCRONIZACION: TDateTimeField;
     xListasID: TIntegerField;
     xListasNAME: TFIBStringField;
     xListasTOTAL_BLACKLISTED: TIntegerField;
     xListasTOTAL_SUBSCRIBERS: TIntegerField;
     xListasUNIQUE_SUBSCRIBERS: TIntegerField;
     xListasFOLDER_ID: TIntegerField;
     xListasULT_SINCRONIZACION: TDateTimeField;
     xPersonasID_CONTACTO: TIntegerField;
     xPersonasNUM_PERSONA: TIntegerField;
     xPersonasID_PERSONA: TIntegerField;
     xPersonasNOMBRE: TFIBStringField;
     xPersonasAPELLIDOS: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure FiltrarPersonas(IdLista: integer);
  end;

var
  DMBrevo : TDMBrevo;

implementation

uses
  UDMMain;

{$R *.dfm}

procedure TDMBrevo.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  xListas.Open;
  FiltrarPersonas(0);
end;

procedure TDMBrevo.FiltrarPersonas(IdLista: integer);
begin
  with xPersonas do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT P.* FROM VER_CRM_PERSONAS_BREVO P ');
     if (IdLista <> 0) then
     begin
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' EXISTS(SELECT * ');
        SelectSQL.Add('        FROM CRM_PERSONAS_LISTAS_BREVO ');
        SelectSQL.Add('        WHERE ');
        SelectSQL.Add('        ID_LISTA = :ID_LISTA AND ');
        SelectSQL.Add('        ID_PERSONA = P.ID) ');
     end;
     SelectSQL.Add(' ORDER BY P.EMAIL ');

     if (IdLista <> 0) then
        Params.ByName['ID_LISTA'].AsInteger := IdLista;
     Open;
  end;
end;

end.
