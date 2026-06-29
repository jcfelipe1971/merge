unit UDMFirmaElectronica;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDataSet, UFIBModificados, FIBDatabase, DB;

type
  TDMFirmaElectronica = class(TDataModule)
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
     Clave: string;
     function DatosFirma: boolean;
  public
     { Public declarations }
     function FirmaPDF(Fichero: string): string;
  end;

var
  DMFirmaElectronica : TDMFirmaElectronica;

implementation

uses UDMMain, UEntorno, UUtiles, UFMain, Windows;

{$R *.dfm}

{ TDMFirmaElectronica }

procedure TDMFirmaElectronica.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
end;

function TDMFirmaElectronica.DatosFirma: boolean;
var
  DS : TFIBDataSet;
  m, f : TStream;
begin
  /// Verifica que el usuaio pueda firmar
  /// Si puede, obtiene los datos necesarios

  DS := TFIBDataSet.Create(nil);
  try
     with DS do
     begin
        Transaction := TFIBTransaction.Create(nil);
        try
           Close;
           DataBase := DMMain.DataBase;
           with Transaction do
           begin
              DefaultDatabase := DMMain.DataBase;
              TRParams.Clear;
              TRParams.Add('read_committed');
              TRParams.Add('read');
              if (not InTransaction) then
                 StartTransaction;
           end;
           SelectSQL.Add(' SELECT PUEDE_FIRMAR, CLAVE_FIRMA, FICHERO_FIRMA ');
           SelectSQL.Add(' FROM SYS_USUARIOS ');
           SelectSQL.Add(' WHERE USUARIO = :USUARIO ');
           Params.ByName['USUARIO'].AsInteger := REntorno.Usuario;
           Open;
           Result := (FieldByName('PUEDE_FIRMAR').AsInteger = 1);
           if (Result) then
           begin
              DMMain.Log('Usuario puede firmar');
              Clave := FieldByName('CLAVE_FIRMA').AsString;

              m := CreateBlobStream(FieldByName('FICHERO_FIRMA'), bmRead);
              try
                 f := TFileStream.Create(DameTempPath + 'certificado.pfx', fmCreate);
                 try
                    f.CopyFrom(m, m.Size);
                 finally
                    f.Free;
                 end;
              finally
                 m.Free;
              end;
           end
           else
              DMMain.Log('Usuario NO puede firmar');
           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     end;
  finally
     FreeAndNil(DS);
  end;
end;

function TDMFirmaElectronica.FirmaPDF(Fichero: string): string;
var
  Ruta, NombreFichero, Extension, Parametros, ParametrosSinClave : string;
  FicheroFirmado, DetalleError : string;
  ResultadoFirma : DWORD;
begin
  DMMain.LogIni('DMFirmaElectronica.FirmaPDF(' + Fichero + ')');
  Result := Fichero;
  ResultadoFirma := 0;
  try
     if (DatosFirma) then
     begin
        // Divido el nombre del fichero en sus partes
        Ruta := ExtractFilePath(Fichero);
        Extension := ExtractFileExt(Fichero);
        NombreFichero := ExtractFileName(Fichero);

        // Agrego '_Firmado' al nombre del fichero
        FicheroFirmado := Ruta + Copy(NombreFichero, 1, Length(NombreFichero) - Length(Extension)) + '_' + _('Firmado') + Extension;

        // Firmado mediante PDFSigner
        // Parametros := '-jar "' + REntorno.RutaEXE + 'PDFSigner.jar" "' + DameTempPath + 'certificado.pfx' + '" "' + Clave + '" "' + Fichero + '" "' + FicheroFirmado + '"';
        // ParametrosSinClave := '-jar "' + REntorno.RutaEXE + 'PDFSigner.jar" "' + DameTempPath + 'certificado.pfx' + '" "' + '*********' + '" "' + Fichero + '" "' + FicheroFirmado + '"';

        // Firmado mediante PortableSigner
        Parametros := '-jar "' + REntorno.RutaEXE + 'PortableSigner\PortableSigner.jar" -n -s "' + DameTempPath + 'certificado.pfx' + '" -p "' + Clave + '" -t "' + Fichero + '" -o "' + FicheroFirmado + '"';
        ParametrosSinClave := '-jar "' + REntorno.RutaEXE + 'PortableSigner\PortableSigner.jar" -n -s "' + DameTempPath + 'certificado.pfx' + '" -p "' + Clave + '" -t "' + Fichero + '" -o "' + FicheroFirmado + '"';

        ResultadoFirma := RunAndWait(FMain.Handle, PChar('Java.exe'), PChar(Parametros), '', SW_SHOWNORMAL {SW_HIDE});
        Sleep(4000);
        if (ResultadoFirma = 0) then
           Result := FicheroFirmado
        else
        begin
           case ResultadoFirma of
              1: DetalleError := Format(_('No hay suficientes parámetros' + #13#10 + '%s'), ['java ' + ParametrosSinClave]);
              2: DetalleError := _('No se encuentra el certificado');
              3: DetalleError := _('No se encuentra el password');
              4: DetalleError := _('No se encuentra el archivo pdf a firmar');
              5: DetalleError := _('No se encuentra la ruta para el documento firmado');
              6: DetalleError := _('Ruta de origen y destino es igual');
              7: DetalleError := _('El certificado y/o la contraseña no son válidos');
              8: DetalleError := _('Error desconocido');
           end;
           raise Exception.Create(Format(_('Ha habido un error al firmar el documento (%d).' + #13#10 + '%s'), [ResultadoFirma, DetalleError]));
        end;
     end;
  finally
     {$IFNDEF Debug}
     SysUtils.DeleteFile(DameTempPath + 'certificado.pfx');
     {$ENDIF}
     DMMain.Log('Parámetros: ' + Parametros);
     DMMain.LogFin('DMFirmaElectronica.FirmaPDF(' + Fichero + ') = ' + IntToStr(ResultadoFirma));
  end;
end;

end.
