unit UDMImagenes;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBTableDataSet, ImgList, Controls,
  Dialogs, ExtDlgs, FIBDatabase, UFIBModificados, Graphics, jpeg, GIFImage,
  FIBQuery, HYFIBQuery;

type
  TDMImagenes = class(TDataModule)
     TLocal: THYTransaction;
     DSQMImagenes: TDataSource;
     QMImagenes: TFIBTableSet;
     QMImagenesCODIGO: TIntegerField;
     QMImagenesNOMBRE: TFIBStringField;
     QMImagenesIMAGEN: TBlobField;
     QMImagenesFORMATO: TFIBStringField;
     QMImagenesREPOSITORIO: TIntegerField;
     QMImagenesRUTA: TFIBStringField;
     TUpdate: THYTransaction;
     QMImagenesRUTA_WEB: TFIBStringField;
     QMImagenesSINC_TIPO: TFIBStringField;
     QMImagenesSINC_REFERENCIA: TFIBStringField;
     QMImagenesDESCRIPCION_REPOSITORIO: TStringField;
     QMImagenesIMAGE_SIZE: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMImagenesNewRecord(DataSet: TDataSet);
     procedure QMImagenesBeforePost(DataSet: TDataSet);
     procedure QMImagenesBeforeEdit(DataSet: TDataSet);
     procedure QMImagenesAfterPost(DataSet: TDataSet);
     procedure QMImagenesDESCRIPCION_REPOSITORIOGetText(Sender: TField; var Text: string; DisplayText: boolean);
  private
     { Private declarations }
     RepositorioOld: integer;
     // procedure CambiaRepositorio;
     procedure BorraImagen(Codigo: integer);
  public
     { Public declarations }
     DescripcionRepositorio: array[0..2] of string[30];
     procedure BusquedaCompleja;
     procedure CargarImagen(const FileName: string);
     procedure FiltraImagen(Imagen: integer);
     procedure ExportarImagenesFiltradas(CarpetaExportacion: string);
     procedure ImportarImagenes(SincTipo, CarpetaImportacion: string);
     procedure CambiaDestinoImagen(Codigo, RepositorioDestino: integer);
  end;

var
  DMImagenes : TDMImagenes;

implementation

uses UDMMain, uFBusca, UFMain, UEntorno, UUtiles, UDameDato, UParam, UFSendCorreo, UImagenes;

{$R *.dfm}

procedure TDMImagenes.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  DescripcionRepositorio[0] := _('En carpeta compartida');
  DescripcionRepositorio[1] := _('En base de datos');
  DescripcionRepositorio[2] := _('En base secundaria');

  QMImagenesIMAGE_SIZE.DisplayFormat := MascaraI;
  QMImagenes.Open;
end;

procedure TDMImagenes.QMImagenesNewRecord(DataSet: TDataSet);
begin
  QMImagenesCODIGO.AsInteger := 0;
  QMImagenesREPOSITORIO.AsInteger := StrToIntDef(LeeParametro('IMGUBIC001', ''), 1);
  QMImagenesRUTA_WEB.AsString := '';
  QMImagenesSINC_TIPO.AsString := '';
  QMImagenesSINC_REFERENCIA.AsString := '';
end;

procedure TDMImagenes.BusquedaCompleja;
var
  s : string;
  Resultado : integer;
begin
  with QMImagenes do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT SYS_IMAGENES.*, CAST(OCTET_LENGTH(SYS_IMAGENES.IMAGEN) AS INTEGER) IMAGE_SIZE FROM SYS_IMAGENES ');
     SelectSQL.Add(' ORDER BY SYS_IMAGENES.CODIGO ');
     Open;
  end;

  Resultado := TFBusca.Create(Self).SeleccionaBusqueda(QMImagenes, '00000', False);

  with QMImagenes do
  begin
     Close;

     s := SelectSQL.Text;
     SelectSQL.Clear;
     SelectSQL.Add('SELECT SYS_IMAGENES.*, CAST(OCTET_LENGTH(SYS_IMAGENES.IMAGEN) AS INTEGER) IMAGE_SIZE FROM SYS_IMAGENES ');
     if ((Resultado = mrAll) or (Resultado = mrCancel)) then
        SelectSQL.Add(' ORDER BY SYS_IMAGENES.CODIGO ')
     else
        SelectSQL.Add(Copy(s, Pos('SYS_IMAGENES', s) + 12, Length(s)));

     Open;
  end;
end;

procedure TDMImagenes.QMImagenesBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_GEN(DataSet, 'CONTA_IMAGENES', 'CODIGO', True);

  // El logo de inicio siempre estara en un fichero.
  if (QMImagenesCODIGO.AsInteger = -1) then
     QMImagenesREPOSITORIO.AsInteger := 0;

  if (DataSet.State = dsInsert) then
  begin
     RepositorioOld := QMImagenesREPOSITORIO.AsInteger;
     CargarImagen(QMImagenesRUTA.AsString);
  end;
end;

procedure TDMImagenes.QMImagenesBeforeEdit(DataSet: TDataSet);
begin
  RepositorioOld := QMImagenesREPOSITORIO.AsInteger;
end;

procedure TDMImagenes.QMImagenesAfterPost(DataSet: TDataSet);
begin
  if (QMImagenesCODIGO.AsInteger = -2) then
     FMain.ImagenFondo;

  if (QMImagenesCODIGO.AsInteger = -1) then
  begin
     REntorno.Logo := QMImagenesRUTA.AsString;
     EscribeIni;
  end;
end;

{
procedure TDMImagenes.CambiaRepositorio;
begin
  if (QMImagenesREPOSITORIO.AsInteger = 0) then // Pasa a cargarse desde un archivo.
     BorraImagen(QMImagenesCODIGO.AsInteger)
  else
  begin // Pasa a cargarse desde la base de datos
     if QMImagenesIMAGEN.IsNull then
     begin
        QMImagenes.Edit;
        CargarImagen(QMImagenesRUTA.AsString);
        QMImagenes.Post;
     end;
  end;
end;
}

procedure TDMImagenes.BorraImagen(Codigo: integer);
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE SYS_IMAGENES SET IMAGEN = NULL WHERE CODIGO = :CODIGO';
        Params.ByName['CODIGO'].AsInteger := Codigo;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure TDMImagenes.CargarImagen(const FileName: string);
var
  m, f : TStream;
begin
  if (QMImagenesREPOSITORIO.AsInteger = 2) then
     DMMain.ConectaImagenes;

  if (QMImagenesREPOSITORIO.AsInteger = 0) then
     BorraImagen(QMImagenesCODIGO.AsInteger)
  else
  if (QMImagenesREPOSITORIO.AsInteger = 1) then
  begin
     m := DMImagenes.QMImagenes.CreateBlobStream(DMImagenes.QMImagenesIMAGEN, bmWrite);
     try
        f := TFileStream.Create(FileName, fmOpenRead);
        try
           m.CopyFrom(f, f.Size);
        finally
           f.Free;
        end;
     finally
        m.Free;
     end;
  end
  else
  if ((QMImagenesREPOSITORIO.AsInteger = 2) and (DMMain.DataBaseImagenes.Connected)) then
  begin
     with TFIBDataSet.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBaseImagenes;
           Transaction := DameTransactionRW(DMMain.DataBaseImagenes);
           try
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;

              SelectSQL.Text := 'SELECT CODIGO, NOMBRE, IMAGEN, FORMATO, REPOSITORIO, RUTA FROM SYS_IMAGENES WHERE CODIGO = :CODIGO';
              // RefreshSQL.Text := 'SELECT CODIGO, NOMBRE, IMAGEN, FORMATO, REPOSITORIO, RUTA FROM SYS_IMAGENES WHERE CODIGO = ?CODIGO';
              InsertSQL.Clear;
              InsertSQL.Add(' INSERT INTO SYS_IMAGENES ');
              InsertSQL.Add(' (CODIGO, NOMBRE, IMAGEN, FORMATO, REPOSITORIO, RUTA ) ');
              InsertSQL.Add(' VALUES ');
              InsertSQL.Add(' (:CODIGO, :NOMBRE, :IMAGEN, :FORMATO, :REPOSITORIO, :RUTA) ');
              UpdateSQL.Clear;
              UpdateSQL.Add(' UPDATE SYS_IMAGENES ');
              UpdateSQL.Add(' SET ');
              UpdateSQL.Add('   IMAGEN = :IMAGEN ');
              UpdateSQL.Add('   ,REPOSITORIO = :REPOSITORIO ');
              UpdateSQL.Add('   ,RUTA = :RUTA ');
              UpdateSQL.Add('   ,NOMBRE = :NOMBRE ');
              UpdateSQL.Add('   ,FORMATO = :FORMATO ');
              UpdateSQL.Add(' WHERE ');
              UpdateSQL.Add('   CODIGO = :CODIGO ');

              Params.ByName['CODIGO'].AsInteger := QMImagenesCODIGO.AsInteger;

              // Abro Dataset
              Open;

              // Se pone en modo Insert/Edit
              if QMImagenes.State = dsInsert then
                 Insert
              else
                 Edit;

              FieldByName('CODIGO').AsInteger := QMImagenesCODIGO.AsInteger;
              FieldByName('NOMBRE').AsString := QMImagenesNOMBRE.AsString;
              FieldByName('FORMATO').AsString := QMImagenesFORMATO.AsString;
              FieldByName('RUTA').AsString := QMImagenesRUTA.AsString;
              FieldByName('REPOSITORIO').AsInteger := QMImagenesREPOSITORIO.AsInteger;

              m := CreateBlobStream(FieldByName('IMAGEN'), bmWrite);
              f := TFileStream.Create(FileName, fmOpenRead);
              try
                 m.CopyFrom(f, f.Size);
              finally
                 f.Free;
              end;

              Post;

              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        finally
           Free;
        end;
     end;

     BorraImagen(QMImagenesCODIGO.AsInteger);
  end;
end;

procedure TDMImagenes.FiltraImagen(Imagen: integer);
begin
  with QMImagenes do
  begin
     Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * FROM SYS_IMAGENES ');
     SelectSQL.Add(' WHERE CODIGO = :CODIGO ');
     SelectSQL.Add(' ORDER BY CODIGO ');
     Params.ByName['CODIGO'].AsInteger := Imagen;
     Open;
  end;
end;

procedure TDMImagenes.ExportarImagenesFiltradas(CarpetaExportacion: string);
var
  Seguir : boolean;
begin
  // Me aseguro de que termine con separador
  CarpetaExportacion := IncludeTrailingPathDelimiter(CarpetaExportacion);

  if ConfirmaMensajeCaption(Format(_('Exportar las imagenes a ' + #13#10 + '%s'), [CarpetaExportacion]), '') then
  begin
     // Recorro imagenes filtradas
     with QMImagenes do
     begin
        First;
        Seguir := True;
        while not EOF and Seguir do
        begin
           // Guardo con nombre CARPETA\N.FORMATO (C:\Imagenes\123.JPG)
           try
              GuardarImagen(QMImagenesCODIGO.AsInteger, Format('%s%d.%s', [CarpetaExportacion, QMImagenesCODIGO.AsInteger, LowerCase(QMImagenesFORMATO.AsString)]));
           except
              on E: Exception do
                 Seguir := ConfirmaMensajeCaption(Format(_('Imagen %d'), [QMImagenesCODIGO.AsInteger]) + #13#10 + E.Message + #13#10 + _('Desea continuar?'), '');
           end;

           Next;
        end;
     end;

     ShowMessage(_('Proceso finalizado'));
  end;
end;

procedure TDMImagenes.ImportarImagenes(SincTipo, CarpetaImportacion: string);
var
  Archivo : string;
  Repositorio : integer;
  SincReferencia : string;
  dummy : integer;
  i : integer;
  SL : TStrings;
  Log : TStrings;
  FicheroLog : string;
  Continuar : boolean;

  procedure CargaFicheros(SL: TStrings; Carpeta, Extension: string);
  var
     sr : TSearchRec;
     i : integer;
  begin
     Log.Add(format('   ' + _('Leyendo ficheros %s'), [Extension]));
     FSendCorreo.Titulo(format(_('Leyendo ficheros %s'), [Extension]));
     i := 0;
     if FindFirst(CarpetaImportacion + '\*.' + Extension, SysUtils.faAnyFile, sr) = 0 then
     begin
        repeat
           Inc(i);
           SL.Add(sr.Name);
           FSendCorreo.Texto(format(_('%d x %s)'), [i, sr.Name]));
        until FindNext(sr) <> 0;
        FindClose(sr);
     end;
     Log.Add(format('   ' + _('%d ficheros leidos'), [i]));
  end;

begin
  Repositorio := StrToIntDef(LeeParametro('IMGUBIC001', ''), 1);
  CarpetaImportacion := IncludeTrailingPathDelimiter(CarpetaImportacion);

  FSendCorreo := TFSendCorreo.Create(Self);
  FSendCorreo.CambiarSizeFont(10);
  FSendCorreo.AlineamientoFont(taLeftJustify);
  FSendCorreo.Show;

  try
     SL := TStringList.Create;
     Log := TStringList.Create;
     try
        Log.Add(_('Leyendo ficheros'));
        Log.Add(format(_('Carpeta: %s'), [CarpetaImportacion]));
        Log.Add(format(_('Tipo sincronizacion: %s'), [SincTipo]));

        CargaFicheros(SL, CarpetaImportacion, 'JPG');
        Log.Add(format(_('Leyendo ficheros (%d)'), [SL.Count]));
        CargaFicheros(SL, CarpetaImportacion, 'JPEG');
        Log.Add(format(_('Leyendo ficheros (%d)'), [SL.Count]));
        CargaFicheros(SL, CarpetaImportacion, 'PNG');
        Log.Add(format(_('Leyendo ficheros (%d)'), [SL.Count]));
        CargaFicheros(SL, CarpetaImportacion, 'GIF');

        TStringList(SL).Sort;

        Log.Add(format(_('Importando ficheros (%d)'), [SL.Count]));
        i := 0;
        Continuar := True;
        while Continuar and (i <= SL.Count - 1) do
        begin
           FSendCorreo.Titulo(format(_('Importando ficheros (%d/%d)'), [i, SL.Count]));
           Archivo := CarpetaImportacion + SL[i];

           // La referencia es el nombre del archivo sin extension.
           SincReferencia := Copy(ExtractFileName(SL[i]), 1, Length(ExtractFileName(SL[i])) - Length((ExtractFileExt(SL[i]))));
           SincReferencia := Copy(SincReferencia, 1, 15);
           SincReferencia := Trim(SincReferencia);

           if SincTipo = 'ART' then
           begin
              // Se sincronizará con un articulo con ese código (VARCHAR(15), SOLO UPPERCASE)
              SincReferencia := UpperCase(SincReferencia);
              if (DameTituloArticulo(SincReferencia) = '') then
              begin
                 Log.Add(format(_('No existe articulo para imagen. Referencia %s'), [SincReferencia]));
                 SincReferencia := '';
              end;
           end
           else
           if SincTipo = 'MOD' then
           begin
              // Se sincronizará con un modelo de tallas y colores con esa BASE_CREACION con ese código (VARCHAR(15))
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Text := 'SELECT ID_A_M FROM ART_ARTICULOS_MODELOS WHERE EMPRESA= :EMPRESA AND BASE_CREACION = :SINC_REFERENCIA';
                    Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                    Params.ByName['SINC_REFERENCIA'].AsString := SincReferencia;
                    ExecQuery;
                    if (FieldByName['ID_A_M'].AsInteger = 0) then
                    begin
                       Log.Add(format(_('No existe modelo para imagen. Referencia %s'), [SincReferencia]));
                       SincReferencia := '';
                    end;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;
           end;

           if (SincReferencia > '') then
           begin
              FSendCorreo.Texto(format(_('Sincronizando fichero %s con %s)'), [ExtractFileName(SL[i]), SincReferencia]));
              try
                 dummy := ImportarImagen(Archivo, Repositorio, SincTipo, SincReferencia);
              except
                 on E: Exception do
                 begin
                    Log.Add(format(_('Error importando fichero %s'), [ExtractFileName(SL[i])]));
                    Log.Add(format(_('Sincronizando con %s'), [SincReferencia]));
                    Log.Add(E.Message);
                    Log.Add('----------');
                    Continuar := ConfirmaMensaje(_('Error importando fichero. Desea continuar?') + #13#10 + E.Message);
                 end;
              end;
           end;

           Inc(i);
        end;
     finally
        SL.Free;
        FicheroLog := DameTempPath + 'ImportacionImagenes_' + FormatDateTime('yyyymmdd_hhnnss', Now) + '.Log';
        Log.SaveToFile(FicheroLog);
        Log.Free;
        DMMain.AbrirArchivo(FicheroLog);
     end;
  finally
     FreeAndNil(FSendCorreo);
  end;

  // Trato de posicionarme en la primera imagen importada.
  QMImagenes.Last;
  Refrescar(QMImagenes, 'CODIGO', QMImagenesCODIGO.AsInteger);
  QMImagenes.Next;
end;

procedure TDMImagenes.QMImagenesDESCRIPCION_REPOSITORIOGetText(Sender: TField; var Text: string; DisplayText: boolean);
begin
  Text := DescripcionRepositorio[QMImagenesREPOSITORIO.AsInteger];
end;

procedure TDMImagenes.CambiaDestinoImagen(Codigo, RepositorioDestino: integer);
var
  Fichero, Formato, Nombre, Ruta : string;
  RepositorioOrigen : integer;
  StreamDestino, StreamOrigen : TStream;
begin
  if (Codigo <> 0) then
  begin
     // Obtengo datos de la imagen
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' SELECT NOMBRE, FORMATO, RUTA, REPOSITORIO FROM SYS_IMAGENES ');
           SQL.Add(' WHERE ');
           SQL.Add(' CODIGO = :CODIGO ');
           Params.ByName['CODIGO'].AsInteger := Codigo;
           ExecQuery;
           Nombre := FieldByName['NOMBRE'].AsString;
           Formato := FieldByName['FORMATO'].AsString;
           Ruta := FieldByName['RUTA'].AsString;
           RepositorioOrigen := FieldByName['REPOSITORIO'].AsInteger;
           FreeHandle;
        finally
           Free;
        end;
     end;

     if ((RepositorioOrigen = 2) or (RepositorioDestino = 2)) then
        DMMain.ConectaImagenes;

     if ((RepositorioDestino = 2) and (not DMMain.DataBaseImagenes.Connected)) then
        raise Exception.Create(_('No hay base de datos de imagenes conectada.'));

     if ((RepositorioDestino = 0) and ((REntorno.RutaFicheros = '') or (not DirectoryExists(REntorno.RutaFicheros)))) then
        raise Exception.Create(_('No existe la ruta a la carpeta compartida.'));

     if (RepositorioOrigen <> RepositorioDestino) then
     begin
        // Obtengo el fichero en la carpeta temporal
        Fichero := ChangeFileExt(IncludeTrailingPathDelimiter(DameTempPath) + 'IMG-' + IntToStr(Codigo), '.' + Formato);
        GuardarImagen(Codigo, Fichero);

        // Si es traspaso a una base aparte
        if (RepositorioDestino = 2) then
        begin
           with TFIBDataSet.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBaseImagenes;
                 Transaction := DameTransactionRW(DMMain.DataBaseImagenes);
                 try
                    if (not Transaction.InTransaction) then
                       Transaction.StartTransaction;

                    SelectSQL.Text := 'SELECT CODIGO, NOMBRE, IMAGEN, FORMATO, REPOSITORIO, RUTA FROM SYS_IMAGENES WHERE CODIGO = 0';
                    // RefreshSQL.Text := 'SELECT CODIGO, NOMBRE, IMAGEN, FORMATO, REPOSITORIO, RUTA FROM SYS_IMAGENES WHERE CODIGO = ?CODIGO';
                    InsertSQL.Text := 'INSERT INTO SYS_IMAGENES (CODIGO, NOMBRE, IMAGEN, FORMATO, REPOSITORIO, RUTA ) VALUES (?CODIGO, ?NOMBRE, ?IMAGEN, ?FORMATO, ?REPOSITORIO, ?RUTA)';

                    // Abro Dataset
                    Open;

                    // Se pone en modo Insert
                    Insert;

                    FieldByName('CODIGO').AsInteger := Codigo;
                    FieldByName('NOMBRE').AsString := Nombre;
                    FieldByName('FORMATO').AsString := Formato;
                    FieldByName('RUTA').AsString := Ruta;
                    FieldByName('REPOSITORIO').AsInteger := RepositorioDestino;

                    StreamDestino := CreateBlobStream(FieldByName('IMAGEN'), bmRead);
                    try
                       try
                          StreamOrigen := TFileStream.Create(Fichero, fmOpenRead);
                          try
                             StreamDestino.CopyFrom(StreamOrigen, StreamOrigen.Size);
                          finally
                             StreamOrigen.Free;
                          end;
                       finally
                          StreamDestino.Free;
                       end;

                       // Si no se pudo copiar el fichero al repositorio de imagenes devuelvo un error
                    except
                       Cancel;
                    end;

                    Post;

                    Close;
                    Transaction.Commit;
                 finally
                    Transaction.Free;
                 end;
              finally
                 Free;
              end;
           end;
        end;

        // Si es traspaso a la base de datos
        if (RepositorioDestino = 1) then
        begin
           with TFIBDataSet.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 Transaction := DameTransactionRW(DMMain.DataBase);
                 try
                    if (not Transaction.InTransaction) then
                       Transaction.StartTransaction;

                    SelectSQL.Text := 'SELECT CODIGO, NOMBRE, IMAGEN, FORMATO, REPOSITORIO, RUTA FROM SYS_IMAGENES WHERE CODIGO = :CODIGO';
                    // RefreshSQL.Text := 'SELECT CODIGO, NOMBRE, IMAGEN, FORMATO, REPOSITORIO, RUTA FROM SYS_IMAGENES WHERE CODIGO = :CODIGO';
                    UpdateSQL.Text := 'UPDATE SYS_IMAGENES SET IMAGEN = :IMAGEN WHERE CODIGO = :CODIGO';

                    // Abro Dataset
                    Params.ByName['CODIGO'].AsInteger := Codigo;
                    Open;

                    // Se pone en modo Edicion
                    Edit;

                    StreamDestino := CreateBlobStream(FieldByName('IMAGEN'), bmWrite);
                    try
                       try
                          StreamOrigen := TFileStream.Create(Fichero, fmOpenRead);
                          try
                             StreamDestino.CopyFrom(StreamOrigen, StreamOrigen.Size);
                          finally
                             StreamOrigen.Free;
                          end;
                       finally
                          StreamDestino.Free;
                       end;

                       // Si no se pudo copiar el fichero al repositorio de imagenes devuelvo un error
                    except
                       Cancel;
                    end;

                    Post;

                    Close;
                    Transaction.Commit;
                 finally
                    Transaction.Free;
                 end;
              finally
                 Free;
              end;
           end;
        end;

        {
        // Si es traspaso a carpeta compartida
        if (RepositorioDestino = 0) then
        begin
           if (not CopyFileTo(Fichero, REntorno.RutaFicheros + 'ADJ-' + IntToStr(IdAdjunto) + ExtractFileExt(Nombre))) then
              raise Exception.Create(_('No se pudo copiar el archivo'));
        end;
        }

        // Actualizo repositorio de la imagen
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' UPDATE SYS_IMAGENES ');
              SQL.Add(' SET ');
              SQL.Add(' REPOSITORIO = :REPOSITORIO ');
              // Borro la imagen si estaba en la base de datos.
              if (RepositorioOrigen = 1) then
                 SQL.Add(' ,IMAGEN = NULL ');
              SQL.Add(' WHERE CODIGO = :CODIGO ');
              Params.ByName['REPOSITORIO'].AsInteger := RepositorioDestino;
              Params.ByName['CODIGO'].AsInteger := Codigo;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;

        // Si viene de la base de datos aparte, borro la imagen
        if ((RepositorioOrigen = 2) and (DMMain.DataBaseImagenes.Connected)) then
        begin
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBaseImagenes;
                 SQL.Add(' DELETE FROM SYS_IMAGENES ');
                 SQL.Add(' WHERE CODIGO = :CODIGO ');
                 Params.ByName['CODIGO'].AsInteger := Codigo;
                 ExecQuery;
                 FreeHandle;
              finally
                 Free;
              end;
           end;
        end;

        {
        // Si viene de carpeta compartida, borro el fichero
        if (RepositorioOrigen = 0) then
        begin
           DeleteFile(REntorno.RutaFicheros + 'ADJ-' + IntToStr(IdAdjunto) + ExtractFileExt(Nombre));
        end;
        }

        // Borro el fichero temporal
        DeleteFile(Fichero);
     end;
  end;
end;

end.
