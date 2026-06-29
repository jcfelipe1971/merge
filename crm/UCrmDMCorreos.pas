unit UCrmDMCorreos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, Controls, FIBTableDataSet, FIBDatabase,
  UFIBModificados, FIBQuery, HYFIBQuery, Dialogs, FIBDataSetRO, FIBDataSet;

type
  TCrmDMCorreos = class(TDataModule)
     TLocal: THYTransaction;
     QMCabecera: TFIBTableSet;
     QMCabeceraID_EMAIL: TIntegerField;
     QMCabeceraACTIVO: TIntegerField;
     QMCabeceraDIRECCION_EMAIL: TFIBStringField;
     DSQMCabecera: TDataSource;
     QMDetalle: TFIBTableSet;
     QMDetalleID_EMAIL: TIntegerField;
     QMDetalleAMBITO: TIntegerField;
     QMDetalleDescripcin: TStringField;
     DSQMDetalle: TDataSource;
     xExportaAmbitos: TFIBDataSetRO;
     xExportaAmbitosAMBITO: TIntegerField;
     xExportaAmbitosDESCRIPCION: TFIBStringField;
     xExportaEMails: TFIBDataSetRO;
     xExportaEMailsDIRECCION_EMAIL: TFIBStringField;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMCabeceraAfterOpen(DataSet: TDataSet);
     procedure QMCabeceraNewRecord(DataSet: TDataSet);
     procedure QMCabeceraBeforePost(DataSet: TDataSet);
     procedure QMDetalleNewRecord(DataSet: TDataSet);
     procedure QMDetalleDescripcinGetText(Sender: TField; var Text: string; DisplayText: boolean);
     procedure QMCabeceraBeforeClose(DataSet: TDataSet);
     procedure DataModuleDestroy(Sender: TObject);
  private
     { Private declarations }
     function ImportaAmbito(DescAmbito: string): integer;
     procedure ImportaEMail(ID_Ambito: integer; DireccionEMail: string);
  public
     { Public declarations }
     procedure BusquedaCompleja;
     procedure Importar;
     procedure ImportarCorreos(Tipo: char);
  end;

var
  CrmDMCorreos : TCrmDMCorreos;

implementation

uses
  UDMMain, uFBusca, UFormGest, Forms, Windows, UUtiles;

{$R *.dfm}

procedure TCrmDMCorreos.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;

  QMCabecera.Open;
end;

procedure TCrmDMCorreos.QMCabeceraAfterOpen(DataSet: TDataSet);
begin
  QMDetalle.Open;
end;

procedure TCrmDMCorreos.QMCabeceraNewRecord(DataSet: TDataSet);
begin
  QMCabeceraACTIVO.AsInteger := 1;
end;

procedure TCrmDMCorreos.QMCabeceraBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(DataSet, 'CRM_CONTA_EMAILS', 'ID_EMAIL');
  QMCabeceraDIRECCION_EMAIL.AsString := Trim(LowerCase(QMCabeceraDIRECCION_EMAIL.AsString));
end;

procedure TCrmDMCorreos.QMDetalleNewRecord(DataSet: TDataSet);
begin
  QMDetalleID_EMAIL.AsInteger := QMCabeceraID_EMAIL.AsInteger;
end;

procedure TCrmDMCorreos.QMDetalleDescripcinGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT DESCRIPCION FROM CRM_SYS_AMBITOS WHERE AMBITO = ?AMBITO';
        Params.ByName['AMBITO'].AsInteger := QMDetalleAMBITO.AsInteger;
        ExecQuery;
        Text := FieldByName['DESCRIPCION'].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TCrmDMCorreos.BusquedaCompleja;
begin
  TFBusca.Create(Self).SeleccionaBusqueda(QMCabecera, '00000');
end;

procedure TCrmDMCorreos.Importar;
var
  f : TextFile;
  DescAmbito, DirEMail : string;
  i, ID_Ambito, NumEMails : integer;
  Archivos : TStrings;

  function LimpiaDireccion(Direccion: string): string;
  var
     i : integer;
  begin
     /// Devuelve solo los carateres válidos para un correo electronico (az, AZ, 09, +-_.@)
     Result := '';
     for i := 1 to Length(Direccion) do
     begin
        if (Direccion[i] in ['a'..'z', 'A'..'Z', '0'..'9', '+', '-', '_', '.', '@']) then
           Result := Result + Direccion[i]
        else
           Result := Result + '_';
     end;
  end;

begin
  inherited;
  NumEMails := 0;

  Archivos := TStringList.Create;
  try
     with TOpenDialog.Create(nil) do
     begin
        try
           Filter := _('Archivos de texto|*.txt|Todos los archivos|*.*');
           FilterIndex := 1;
           InitialDir := GetSpecialFolderPath(CSIDL_PERSONAL, False);
           Title := _('Carga direcciones');
           Options := Options + [ofAllowMultiSelect];
           if (Execute) then
              Archivos.AddStrings(Files);
        finally
           Free;
        end;
     end;

     Screen.Cursor := crHourGlass;
     try
        for i := 0 to Archivos.Count - 1 do
        begin
           DescAmbito := ExtractFileName(Archivos[i]) + '.'; // Añadimos un punto al final por si el fichero no tiene extension.
           DescAmbito := Copy(DescAmbito, 1, Pos('.', DescAmbito) - 1); // Quitamos la extension del nombre del fichero.
           DescAmbito := Copy(Trim(DescAmbito), 1, 40); // Eliminamos espacios y limitamos a 40 caracteres (medida del campo DESCRIPCION).
           ID_Ambito := ImportaAmbito(DescAmbito);
           AssignFile(f, Archivos[i]);
           try
              Reset(f);
              while not EOF(f) do
              begin
                 ReadLn(f, DirEMail);

                 DirEmail := Copy(LimpiaDireccion(DirEmail), 1, 100);
                 if (DirEMail <> '') and (Pos('@', DirEMail) > 0) then
                    ImportaEMail(ID_Ambito, DirEMail);

                 Inc(NumEmails);
              end; // while
           finally
              CloseFile(f);
           end;
        end; // for
        Application.MessageBox(PChar(string(Format(_('Importación realizada con éxito.'#13#10 +
           '%d emails procesados.'#13#10 +
           '%d ámbitos procesados.'), [NumEMails, Archivos.Count]))),
           PChar(string(_('Información'))), MB_OK or MB_ICONINFORMATION or MB_DEFBUTTON1);

        QMCabecera.Close;
        QMCabecera.Open;
     finally
        Screen.Cursor := crDefault;
     end; // try
  finally
     Archivos.Free;
  end;
end;

function TCrmDMCorreos.ImportaAmbito(DescAmbito: string): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE CRM_IMPORTA_AMBITO (?DESC_AMBITO)';
        Params.ByName['DESC_AMBITO'].AsString := DescAmbito;
        ExecQuery;
        Result := Fields[0].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TCrmDMCorreos.ImportaEMail(ID_Ambito: integer; DireccionEMail: string);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE CRM_IMPORTA_EMAIL (?ID_AMBITO, ?DIRECCION_EMAIL)';
        Params.ByName['ID_AMBITO'].AsInteger := ID_Ambito;
        Params.ByName['DIRECCION_EMAIL'].AsString := DireccionEMail;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TCrmDMCorreos.ImportarCorreos(Tipo: char);
begin
  /// Tipo = C-Contactos, P-Personas

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'EXECUTE PROCEDURE CRM_EXPORTA_MAILS_CONTACTOS (?PERSONAS)';
        if (Tipo = 'C') then
           Params.ByName['PERSONAS'].AsInteger := 0
        else
           Params.ByName['PERSONAS'].AsInteger := 1;
        ExecQuery;
        Application.MessageBox(PChar(string(Format(_('Importación realizada con éxito.'#13#10 +
           '%d emails procesados.'#13#10), [FieldByName['CONT_EMAILS'].AsInteger]))),
           PChar(string(_('Información'))), MB_OK or MB_ICONINFORMATION or MB_DEFBUTTON1);
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TCrmDMCorreos.QMCabeceraBeforeClose(DataSet: TDataSet);
begin
  QMDetalle.Close;
end;

procedure TCrmDMCorreos.DataModuleDestroy(Sender: TObject);
begin
  if (TLocal.InTransaction) then
     TLocal.Commit;
end;

end.
