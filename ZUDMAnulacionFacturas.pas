unit ZUDMAnulacionFacturas;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, FIBQuery, HYFIBQuery;

type
  TZDMAnulacionFacturas = class(TDataModule)
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Z_AnulaFacturas(id_s, Anula, Motivo: integer; sMotivo, Tipo: string);
  end;

var
  ZDMAnulacionFacturas : TZDMAnulacionFacturas;

implementation

uses UDMMain;

{$R *.dfm}

procedure TZDMAnulacionFacturas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
end;

procedure TZDMAnulacionFacturas.Z_AnulaFacturas(id_s, Anula, Motivo: integer; sMotivo, Tipo: string);
var
  TextoMotivo : string;
begin
  case Motivo of
     1: TextoMotivo := _('Error de digitación');
     2:
     begin
        if (Tipo = 'FAC') then
           TextoMotivo := _('Cliente no desea la mercancía')
        else
           TextoMotivo := _('Proveedor no desea la mercancía');
     end;
     3: TextoMotivo := sMotivo;
     else
        TextoMotivo := '';
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE Z_ANULA_FACTURAS(:ID_S, :MOTIVO, :ANULA, :TIPO)';
        Params.ByName['ID_S'].AsInteger := id_s;
        Params.ByName['MOTIVO'].AsString := Trim(Copy(TextoMotivo, 1, 40));
        Params.ByName['ANULA'].AsInteger := Anula;
        Params.ByName['TIPO'].AsString := Tipo;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
