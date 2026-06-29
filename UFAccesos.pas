unit UFAccesos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, ULFPanel, ULFEdit, ULFLabel, ULFComboBox, UFormGest,
  jpeg;

type
  TFAccesos = class(TG2KForm)
     PNLAccesos: TLFPanel;
     BBAceptar: TBitBtn;
     BBSalir: TBitBtn;
     TEspera: TTimer;
     PMain: TLFPanel;
     ILogoDelfos: TImage;
     ILogoMaxFactu: TImage;
     LNombre: TLFLabel;
     ENombre: TLFEdit;
     EClave: TLFEdit;
     LClave: TLFLabel;
     LIdioma: TLFLabel;
     CBIdioma: TLFComboBox;
     PNLLicencia: TLFPanel;
     LLicencia: TLFLabel;
     LEmailLicencia: TLFLabel;
     ELicencia: TLFEdit;
     EEmailLicencia: TLFEdit;
     PNLAcceso: TLFPanel;
     ILogoAdmXXI: TImage;
     procedure BBAceptarClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure ENombreChange(Sender: TObject);
     procedure EClaveChange(Sender: TObject);
     procedure CBIdiomaChange(Sender: TObject);
     procedure TEsperaTimer(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
     procedure ReiniciaTimer;
  public
     { Public declarations }
     function Muestra(Itera: smallint): integer;
  end;

var
  FAccesos : TFAccesos;

implementation

uses UEntorno, UDMMain, UUtiles, UDameDato, HYFIBQuery, UParam;

{$R *.DFM}

procedure TFAccesos.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  DMMain.LogIni('TFAccesos.FormCreate');

  CBIdioma.Clear;
  DefaultInstance.GetListOfLanguages(Copy(ExtractFileName(Application.ExeName), 1, Pos('.', ExtractFileName(Application.ExeName)) - 1), CBIdioma.Items);
  CBIdioma.ItemIndex := CBIdioma.Items.IndexOf(LeeDatoIni('Usuario', 'Lang', GetCurrentLanguage)); //IDIOMA_CODE

  ILogoDelfos.Visible := True;
  ILogoAdmXXI.Visible := False;
  ILogoMaxFactu.Visible := False;

  {$IFDEF AdmXXI}
  ILogoAdmXXI.Visible := True;
  ILogoDelfos.Visible := False;
  {$ENDIF}

  {$IFDEF MaxFactu}
  ILogoMaxFactu.Visible := True;
  ILogoDelfos.Visible := False;
  {$ENDIF}

  if (LeeParametro('SYSCONF004') <> 'S') then
  begin
     LIdioma.Visible := False;
     CBIdioma.Visible := False;
  end;

  HelpFile := REntorno.FicheroAyuda;
  HelpType := htKeyword;
  HelpKeyword := 'FACCESOS';

  TEspera.Interval := StrToIntDef(LeeParametro('LOGINTM001'), 60) * 1000;
  ReiniciaTimer;
  DMMain.LogFin('TFAccesos.FormCreate');

  ELicencia.Text := DameLicencia;
  EEmailLicencia.Text := DameEmailLicencia;

  // Asigno Imagenes a BitdBtn
  GetBitmapFromImageList(BBAceptar, 1, DMMain.ILMain_Ac, 19);
  GetBitmapFromImageList(BBSalir, 1, DMMain.ILMain_Ac, 0);
end;

procedure TFAccesos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

function TFAccesos.Muestra(Itera: smallint): integer;
begin
  DMMain.LogIni(Format('TFAccesos.Create(Self).Muestra(%d)', [Itera]));
  HelpFile := REntorno.FicheroAyuda;  // Asignamos fichero de Ayuda

  DMMain.Log('Caption');
  Caption := '( ' + IntToStr(Itera + 1) + ' ) ' + Caption;
  if (REntorno.Nombre <> '') then
  begin
     DMMain.Log('ENombre');
     ENombre.Text := REntorno.Nombre;

     DMMain.Log('ActiveControl');
     ActiveControl := EClave;
  end;

  if (REntorno.Clave <> '') then
  begin
     DMMain.Log('EClave');
     EClave.Text := REntorno.Clave;
  end;

  // Esto es una posible solucion
  // Application.ProcessMessages;

  DMMain.Log('ShowModal');
  Result := ShowModal;
  DMMain.LogFin(Format('TFAccesos.Create(Self).Muestra(%d)', [Itera]));
end;

procedure TFAccesos.BBAceptarClick(Sender: TObject);
begin
  REntorno.Nombre := ENombre.Text;
  REntorno.Clave := EClave.Text;

  try
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'UPDATE SYS_CONSTANTES SET EMAIL_LICENCIA = :EMAIL_LICENCIA';
           Params.ByName['EMAIL_LICENCIA'].AsString := EEmailLicencia.Text;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  except
  end;

  /////////////////////// IDIOMA_CODE ////////////////////
  if ((CBIdioma.ItemIndex > -1) and
     (CBIdioma.Text <> GetCurrentLanguage)) then
  begin
     UseLanguage(CBIdioma.Text);
     // El dominio se establece la primera vez en REntorno.InicializaIdioma
     // TextDomain('delfos_' + GetCurrentLanguage);
     RetranslateForms;
  end;
  ///////////////////// FIN IDIOMA_CODE //////////////////
end;

procedure TFAccesos.ReiniciaTimer;
begin
  TEspera.Enabled := False;
  TEspera.Enabled := True;
end;

procedure TFAccesos.TEsperaTimer(Sender: TObject);
begin
  BBSalir.Click;
end;

procedure TFAccesos.ENombreChange(Sender: TObject);
begin
  ReiniciaTimer;
end;

procedure TFAccesos.EClaveChange(Sender: TObject);
begin
  ReiniciaTimer;
end;

procedure TFAccesos.CBIdiomaChange(Sender: TObject);
begin
  ReiniciaTimer;
end;

end.
