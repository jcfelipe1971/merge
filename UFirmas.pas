unit UFirmas;

interface

procedure FirmarFacturaE(Certificado, Fichero: string);
procedure FirmarTBAI(Certificado, Fichero: string);

implementation

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Dialogs, UUtiles, UDMMain, SysUtils, Classes, Controls, Windows, UFMain;

procedure MemoWrit(const FileName, SourceString: string);
var
  Stream : TFileStream;
begin
  Stream := TFileStream.Create(FileName, fmCreate);
  try
     Stream.WriteBuffer(Pointer(SourceString)^, Length(SourceString));
  finally
     Stream.Free;
  end;
end;

function MemoRead(const FileName: TFileName): string;
var
  FileStream : TFileStream;
begin
  FileStream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyWrite);
  try
     if FileStream.Size > 0 then
     begin
        SetLength(Result, FileStream.Size);
        FileStream.Read(Pointer(Result)^, FileStream.Size);
     end;
  finally
     FileStream.Free;
  end;
end;

procedure Firmar(Tipo: integer; Certificado, Fichero: string);
var
  RutaAutofirma, VersionAutofirma : string;
begin
  /// Firma mediante aplicacion externa Autofirma.
  /// Tipo 1 : Firma formato FacturaE
  /// Tipo 2 : Firma formato TickerBAI

  if (Certificado <> '') and (Tipo in [1..2]) then
  begin
     RutaAutofirma := LeeDatoIni('AutoFirma', 'InstallDir', '');
     VersionAutofirma := LeeDatoIni('AutoFirma', 'Version', '');

     DMMain.Log(Format('Autofirma - Ruta: %s, Version: %s.', [RutaAutofirma, VersionAutofirma]));
     if (RutaAutofirma <> '') and (VersionAutofirma >= '1.6.0.0') then
     begin
        DMMain.Log('Firma');
        while SysUtils.FileExists(DameTempPath + 'ToSign.xml') and (MessageDlg(('La opción se encuentra en uso por otro usuario'), mtConfirmation, [mbYes, mbNo], 0) = mrYes) do
        begin
        end;

        if not SysUtils.FileExists(DameTempPath + 'ToSign.xml') and CopyFile(PChar(Fichero), PChar(DameTempPath + 'ToSign.xml'), False) then
        begin
           DeleteFile(PChar(DameTempPath + 'ToSign.xsig'));
           if SysUtils.FileExists(DameTempPath + 'sign_result.txt') then
           begin
              DeleteFile(PChar(DameTempPath + 'sign_result.txt'));
           end;

           case Tipo of
              1:
              begin
                 MemoWrit(DameTempPath + 'sign.bat', '"' + RutaAutofirma + 'AutoFirma\AutoFirmaCommandLine.exe" sign ' +
                    '-i "' + DameTempPath + 'ToSign.xml' + '" ' +
                    '-o "' + DameTempPath + 'ToSign.xsig' + '" ' +
                    '-store windows -filter "subject.contains:' + PChar(Certificado) + '" ' +
                    '-format facturae > "' + DameTempPath + 'sign_result.txt"');
              end;
              2:
              begin
                 MemoWrit(DameTempPath + 'sign.bat', '"' + RutaAutofirma + 'AutoFirma\AutoFirmaCommandLine.exe" sign ' +
                    '-i "' + DameTempPath + 'ToSign.xml' + '" ' +
                    '-o "' + DameTempPath + 'ToSign.xsig' + '" ' +
                    '-store windows -filter "subject.contains:' + PChar(Certificado) + '" ' +
                    '-config "format=XAdES Enveloped\npolicyIdentifier=https://www.gipuzkoa.eus/ticketbai/sinadura\npolicyIdentifierHash=6NrKAm60o7u62FUQwzZew24ra2ve9PRQYwC21AM6In0=\npolicy' +
                    'IdentifierHashAlgorithm=http://www.w3.org/2001/04/xmlenc#sha256\npolicyQualifier=https://www.gipuzkoa.eus/ticketbai/sinadura"' +
                    ' > "' + DameTempPath + 'sign_result.txt"');
              end;
           end;

           RunAndWait(FMain.Handle, PChar(DameTempPath + 'sign.bat'), '', PChar(DameTempPath), SW_SHOWNORMAL);

           if ((SysUtils.FileExists(DameTempPath + 'sign_result.txt')) and (Pos('La operacion ha terminado correctamente', MemoRead(DameTempPath + 'sign_result.txt')) > 0)) then
           begin
              if SysUtils.FileExists(DameTempPath + 'ToSign.xsig') then
              begin
                 Fichero := ChangeFileExt(Fichero, '-Firmado.xsig');
                 CopyFile(PChar(DameTempPath + 'ToSign.xsig'), PChar(Fichero), False);
                 DeleteFile(PChar(DameTempPath + 'ToSign.xsig'));

                 // ShowMessage(Format(_('Se ha creado el fichero' + #13#10 + '%s'), [Fichero]));
              end;
           end
           else
           begin
              case Tipo of
                 1:
                 begin
                    MemoWrit(DameTempPath + 'sign.bat', '"' + RutaAutofirma + 'AutoFirma\AutoFirmaCommandLine.exe" sign -gui ' +
                       '-i "' + DameTempPath + 'ToSign.xml' + '" ' +
                       '-o "' + DameTempPath + 'ToSign.xsig' + '" ' +
                       '-store windows -filter "subject.contains:' + PChar(Certificado) + '" ' +
                       '-format facturae');
                 end;
                 2:
                 begin
                    MemoWrit(DameTempPath + 'sign.bat', '"' + RutaAutofirma + 'AutoFirma\AutoFirmaCommandLine.exe" sign -gui ' +
                       '-i "' + DameTempPath + 'ToSign.xml' + '" ' +
                       '-o "' + DameTempPath + 'ToSign.xsig' + '" ' +
                       '-store windows -filter "subject.contains:' + PChar(Certificado) + '" ' +
                       '-config "format=XAdES Enveloped\npolicyIdentifier=https://www.gipuzkoa.eus/ticketbai/sinadura\npolicyIdentifierHash=6NrKAm60o7u62FUQwzZew24ra2ve9PRQYwC21AM6In0=\npolicy' +
                       'IdentifierHashAlgorithm=http://www.w3.org/2001/04/xmlenc#sha256\npolicyQualifier=https://www.gipuzkoa.eus/ticketbai/sinadura"');
                 end;
              end;

              RunAndWait(FMain.Handle, PChar(DameTempPath + 'sign.bat'), PChar(''), PChar(''), SW_SHOWNORMAL);

              if (SysUtils.FileExists(DameTempPath + 'ToSign.xml_signed.xsig')) then
              begin
                 Fichero := ChangeFileExt(Fichero, '-Firmado.xsig');
                 CopyFile(PChar(DameTempPath + 'ToSign.xml_signed.xsig'), PChar(Fichero), False);
                 DeleteFile(PChar(DameTempPath + 'ToSign.xml_signed.xsig'));

                 ShowMessage(Format(_('Se ha creado el fichero' + #13#10 + '%s'), [Fichero]));
              end
              else
                 ShowMessage(_('No se ha creado el fichero firmado'));
           end;

           DeleteFile(PChar(DameTempPath + 'ToSign.xml')); // Eliminamos flag y xml sin firmar.
        end;
     end;
  end;
end;

procedure FirmarFacturaE(Certificado, Fichero: string);
begin
  Firmar(1, Certificado, Fichero);
end;

procedure FirmarTBAI(Certificado, Fichero: string);
begin
  Firmar(2, Certificado, Fichero);
end;

end.
