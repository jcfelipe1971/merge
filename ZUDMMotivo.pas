unit ZUDMMotivo;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, FIBQuery, HYFIBQuery, Dialogs;

type
  TZDMMotivo = class(TDataModule)
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Z_MotivoAnula(id: integer; motivo: string);
  end;

var
  ZDMMotivo : TZDMMotivo;

implementation

uses UDMMain;

{$R *.dfm}

procedure TZDMMotivo.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
end;

procedure TZDMMotivo.Z_MotivoAnula(id: integer; Motivo: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE Z_DESCOBRAR_MARCADOS(:ID, :MOTIVO)';
        Params.ByName['ID'].AsInteger := id;
        Params.ByName['MOTIVO'].AsString := Motivo;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  ShowMessage(_('Los recibos marcados se han descobrado correctamente'));
end;

end.
