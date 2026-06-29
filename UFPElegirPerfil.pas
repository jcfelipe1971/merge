unit UFPElegirPerfil;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFEditFind2000, ULFLabel, HYFIBQuery, FibDatabase;

type
  TFPElegirPerfil = class(TForm)
     LPerfil: TLFLabel;
     btnAceptar: TButton;
     btnCancelar: TButton;
     EFPerfil: TLFEditFind2000;
     procedure EFPerfilBusqueda(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure FormCreate(Sender: TObject);
  private
     { Private declarations }
     FProfile: integer;
     function DameMinPerfil: integer;
  public
     function ShowDialog(Profile: integer): integer;
     { Public declarations }
  end;

var
  FPElegirPerfil : TFPElegirPerfil;

implementation

uses UDMMain;

{$R *.dfm}

{ TFPElejirPerfil }

function TFPElegirPerfil.ShowDialog(Profile: integer): integer;
begin
  FProfile := Profile;
  if (FProfile <> -1) then
     EFPerfil.Text := IntToStr(FProfile)
  else
     EFPerfil.Text := IntToStr(DameMinPerfil);
  if ShowModal = mrOk then
  begin
     Result := StrToInt(EFPerfil.Text);
  end
  else
     Result := -255;
end;

procedure TFPElegirPerfil.EFPerfilBusqueda(Sender: TObject);
begin
  if (FProfile <> -1) then
     EFPerfil.CondicionBusqueda := 'PERFIL=' + IntToStr(FProfile) + ' OR SUPERIOR=' + IntToStr(FProfile)
  else
     EFPerfil.CondicionBusqueda := 'SUPERIOR=-1'; // Super solo a padres
end;

function TFPElegirPerfil.DameMinPerfil: integer;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MIN(PERFIL) FROM SYS_USUARIOS_PERFIL WHERE SUPERIOR = -1';
        ExecQuery;
        Result := FieldByName['MIN'].AsInteger;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TFPElegirPerfil.FormShow(Sender: TObject);
begin
  EFPerfil.SetFocus;
end;

procedure TFPElegirPerfil.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
end;

end.
