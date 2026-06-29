unit UDMColon;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, ComCtrls, ULFLabel;

type
  TDMColon = class(TDataModule)
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
     FTP_Host, FTP_User, FTP_Password, FTP_Carpeta: string;
     FTP_Port: integer;
  public
     { Public declarations }
     procedure TraerDatosFTP(DirectorioDestino: string; PBProgreso: TProgressBar; LProgreso: TLFLabel);
     procedure Inicializa(aHost: string; aPort: integer; aFTP_User, aPassword, aCarpeta: string);
  end;

var
  DMColon : TDMColon;

implementation

uses UDMMain, IdFTP, IdFTPCommon, Dialogs, Forms;

{$R *.dfm}

procedure TDMColon.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
end;

procedure TDMColon.Inicializa(aHost: string; aPort: integer; aFTP_User, aPassword, aCarpeta: string);
begin
  FTP_Host := aHost;
  FTP_User := aFTP_User;
  FTP_Password := aPassword;
  FTP_Carpeta := aCarpeta;
  FTP_Port := aPort;
end;

procedure TDMColon.TraerDatosFTP(DirectorioDestino: string; PBProgreso: TProgressBar; LProgreso: TLFLabel);
var
  s : TStrings;
  i : integer;
begin
  /// Conecta a FTP y trae todos los archivos "ALB*.csv".
  /// Va renombrando los archivos descargados en el servidor FTP.

  DMMain.LogIni('Recepcion FTP');
  DirectorioDestino := IncludeTrailingPathDelimiter(DirectorioDestino);
  DMMain.Log('DirectorioDestino: ' + DirectorioDestino);

  LProgreso.Caption := _('Conectando a servidor FTP');
  if (not DirectoryExists(DirectorioDestino)) then
     raise Exception.Create(_('No existe carpeta destino'));

  with TIdFTP.Create(Self) do
  begin
     try
        // ConnectTimeout := 10;
        Host := FTP_Host;
        DMMain.Log('Host: ' + Host);
        Port := FTP_Port;
        DMMain.Log('Port: ' + IntToStr(Port));
        Username := FTP_User;
        DMMain.Log('Username: ' + Username);
        Password := FTP_Password;
        DMMain.Log('Password: ' + '****' {Password});

        Passive := True;
        TransferType := ftASCII;

        Connect;
        DMMain.Log('FTP Conectado.');

        DMMain.Log('CurrentDir: ' + RetrieveCurrentDir);
        FTP_Carpeta := Trim(FTP_Carpeta);
        if (FTP_Carpeta <> '') then
        begin
           DMMain.Log('ChangeFTPDir ' + FTP_Carpeta);
           ChangeDir(FTP_Carpeta);
           DMMain.Log('CurrentDir: ' + RetrieveCurrentDir);
        end;

        // Traigo pedidos
        s := TStringList.Create;
        try
           List(s, '', False);
           // Progreso es el doble de lineas. Mitad descarga mitad procesado
           PBProgreso.Max := s.Count * 2;
           PBProgreso.Position := 0;
           for i := 0 to s.Count - 1 do
           begin
              DMMain.Log(Format('Descargando fichero %d - %s', [i, s[i]]));
              LProgreso.Caption := Format('Descargando fichero %d de %d - %s', [i + 1, s.Count, s[i]]);
              PBProgreso.StepIt;
              Application.ProcessMessages;

              if (LowerCase(Copy(ExtractFileName(s[i]), 1, 3)) = 'alb') and (LowerCase(ExtractFileExt(s[i])) = '.csv') then
              begin
                 DMMain.Log('Get ' + s[i]);
                 try
                    Get(s[i], DirectorioDestino + s[i], True, ResumeSupported);

                   {$IFNDEF Debug}
                    DMMain.Log('Rename ' + s[i]);
                    Rename(s[i], s[i] + '.' + FormatDateTime('yyyymmdd_hhnnss', Now) + '.bak');
                   {$ENDIF}
                 except
                    // Puede fallar si ya existe el fichero
                    on E: Exception do
                       ShowMessage(Format(_('Error obteniendo fichero %s'), [s[i]]) + #13#10 + E.Message);
                 end;
              end;
           end;
        finally
           s.Free;
        end;

        ChangeDirUp;
        Disconnect;
     finally
        Free;
     end;
  end;

  DMMain.LogFin('Recepcion FTP');
end;

end.
