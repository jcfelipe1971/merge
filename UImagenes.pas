unit UImagenes;

interface

uses
  Windows, Messages, Classes, SysUtils, Graphics, ExtCtrls, DB, FIBDataSet, FIBDatabase,
  FIBDataSetRO, FIBTableDataSet, JPEG, GIFImage, GraphicEx, Dialogs, ExtDlgs, Forms, Clipbrd,
ShellAPI, SyncObjs, UFIBModificados;

type
  TLoadImageThread = class(TThread)
  private
     FImage: TImage;
     FCodigo: integer;
     FDatabase: TFIBDatabase;
     FDatabaseImg: TFIBDatabase;
     //FTransaction: TFIBTransaction;
     FFormato: string;
     FImageStream: TStream;
     FRequestPending: boolean;
     FCritical: TCriticalSection;
     procedure UpdateImage;
  protected
     procedure Execute; override;
  public
     constructor Create;
     procedure ConectaBD(ADatabase: THYDatabase);
     procedure ConectaBDImg(ADatabaseImg: THYDatabase);
     procedure CargaImagen(AImage: TImage; ACodigo: integer);
     destructor Destroy; override;
  end;

var
  ThreadCargaImagen : TLoadImageThread;

procedure CargarImagenDeArchivo(Imagen: TImage; Archivo: string; Formato: string);
procedure CargarImagenDeStream(Imagen: TImage; Stream: TStream; Formato: string);
procedure RefrescarImagenFirma(Imagen: TImage; IdFirma: integer); overload;
procedure RefrescarImagen(Imagen: TImage; Codigo: integer); overload;
procedure RefrescarImagen(Imagen: TImage; xFuente: TFIBDataSetRO); overload;
procedure RefrescarImagen(Imagen: TImage; xFuente: TFIBTableSet); overload;
procedure RefrescarImagenTPV(Imagen: TImage; Codigo, Ancho, Alto: integer);
procedure RefrescarImagenTimbre(Imagen: TImage; IdDoc: integer);
procedure GuardarImagen(Id: integer; FileName: string);
function ImportarImagen(Archivo: string; Repositorio: integer = -1; SincTipo: string = ''; SincReferencia: string = ''): integer; overload;
function ImportarImagen(Stream: TStream; Repositorio: integer = -1; SincTipo: string = ''; SincReferencia: string = ''): integer; overload;
function ImportarImagenDesdeClipboard(Repositorio: integer = -1): integer;

implementation

uses
  UDMMain, UUtiles, UParam;

procedure CargarImagenDeArchivo(Imagen: TImage; Archivo: string; Formato: string);
var
  Stream : TStream;
begin
  Stream := TFileStream.Create(Archivo, fmOpenRead);
  try
     CargarImagenDeStream(Imagen, Stream, Formato);
  finally
     Stream.Free;
  end;
end;

procedure CargarImagenDeStream(Imagen: TImage; Stream: TStream; Formato: string);
var
  BMP : TBitMap;
  JPG : TJpegImage;
  GIF : TGIFImage;
  PNG : TPNGGraphic;
begin
  DMMain.Log('CargarImagenDeStream() - Image.Name: ' + Imagen.Name + ' - Image.Format: ' + Formato + ' - Image.Size: ' + IntToStr(Stream.Size));
  try
     if Formato = 'BMP' then
     begin
        BMP := TBitmap.Create;
        try
           BMP.LoadFromStream(Stream);
           Imagen.Picture.Assign(BMP);
        finally
           BMP.Free;
        end;
     end
     else
     if Formato = 'JPG' then
     begin
        JPG := TJpegImage.Create;
        try
           JPG.LoadFromStream(Stream);

           BMP := TBitmap.Create;
           try
              BMP.Assign(JPG);
              Imagen.Picture.Assign(BMP);
           finally
              BMP.Free;
           end;
        finally
           JPG.Free;
        end;
     end
     else
     if Formato = 'GIF' then
     begin
        GIF := TGIFImage.Create;
        try
           GIF.LoadFromStream(Stream);
           Imagen.Picture.Assign(GIF);
        finally
           GIF.Free;
        end;
     end
     else
     if Formato = 'PNG' then
     begin
        PNG := TPNGGraphic.Create;
        try
           PNG.LoadFromStream(Stream);
           Imagen.Picture.Assign(PNG);
        finally
           PNG.Free;
        end;
     end
     else
     begin
        Imagen.Picture := nil;
     end;
  except
     on e: Exception do
     begin
        Imagen.Picture := nil;
        DMMain.Log('CargarImagenDeStream() - Error' + #13#10 + e.Message);
     end;
  end;
end;

procedure RefrescarImagenFirma(Imagen: TImage; IdFirma: integer);
var
  Stream : TStream;
begin
  Imagen.Picture := nil;
  if (IdFirma <> 0) then
  begin
     with TFIBDataSet.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           Transaction := DameTransactionRO(DMMain.DataBase);
           try
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Text := 'SELECT FIRMA, FORMATO FROM GES_FIRMAS WHERE ID_FIRMA = :ID_FIRMA';
              Params.ByName['ID_FIRMA'].AsInteger := IdFirma;
              Open;

              if not FieldByName('FIRMA').IsNull then
              begin
                 Stream := CreateBlobStream(FieldByName('FIRMA'), bmRead);
                 try
                    CargarImagenDeStream(Imagen, Stream, FieldByName('FORMATO').AsString);
                 finally
                    Stream.Free;
                 end;
              end;

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
end;

procedure RefrescarImagen(Imagen: TImage; Codigo: integer);
var
  Repositorio : integer;
  //f: TStream;
  Stream : TStream;
begin
  // Utilizar Thread oara refrescar imagen
  if (1 = 0) then
  begin
     DMMain.Log('DMMain.RefrescarImagen() Image.Code: ' + IntToStr(Codigo) + ' - Image.Name: ' + Imagen.Name);
     DMMain.EjecutarCargaImagen(Imagen, Codigo);
  end
  else
  begin
     Imagen.Picture := nil;
     if (Codigo <> 0) and Assigned(DMMain.DataBase) and DMMain.DataBase.Connected then
     begin
        with TFIBDataSet.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              Transaction := DMMain.AccesoSeguroATransaction(DMMain.DataBase);
              try
                 if (not Transaction.InTransaction) then
                    Transaction.StartTransaction;
                 SelectSQL.Text := 'SELECT REPOSITORIO, RUTA, IMAGEN, FORMATO FROM SYS_IMAGENES WHERE CODIGO = :CODIGO';
                 Params.ByName['CODIGO'].AsInteger := Codigo;
                 Open;

                 // Donde esta el fichero. 0: Carpeta compartida, 1: Base de Datos, 2: Base de Datos de Imagenes
                 Repositorio := FieldByName('REPOSITORIO').AsInteger;

                 if (Repositorio = 1) then
                 begin
                    if (not FieldByName('IMAGEN').IsNull) then
                    begin
                       Stream := CreateBlobStream(FieldByName('IMAGEN'), bmRead);
                       try
                          CargarImagenDeStream(Imagen, Stream, FieldByName('FORMATO').AsString);
                       finally
                          Stream.Free;
                       end;
                    end;
                 end;
                 Close;
                 Transaction.Commit;
              finally
                 Transaction.Free;
              end;
           finally
              Free;
           end;
        end;

        if (Repositorio = 2) then
        begin
           DMMain.ConectaImagenes;

           if (DMMain.DataBaseImagenes.Connected) then
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

                       SelectSQL.Add(' SELECT REPOSITORIO, RUTA, IMAGEN, NOMBRE, FORMATO FROM SYS_IMAGENES WHERE CODIGO = :CODIGO ');
                       Params.ByName['CODIGO'].AsInteger := Codigo;
                       Open;

                       if (not FieldByName('IMAGEN').IsNull) then
                       begin
                          Stream := CreateBlobStream(FieldByName('IMAGEN'), bmRead);
                          try
                             CargarImagenDeStream(Imagen, Stream, FieldByName('FORMATO').AsString);
                          finally
                             Stream.Free;
                          end;
                       end;

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
        end;
     end;
  end;
end;

procedure RefrescarImagen(Imagen: TImage; xFuente: TFIBDataSetRO);
begin
  RefrescarImagen(Imagen, xFuente.FieldByName('CODIGO').AsInteger);
end;

procedure RefrescarImagen(Imagen: TImage; xFuente: TFIBTableSet);
begin
  RefrescarImagen(Imagen, xFuente.FieldByName('CODIGO').AsInteger);
end;

procedure RefrescarImagenTPV(Imagen: TImage; Codigo, Ancho, Alto: integer);
var
  ArchivoCache, FormatoCache : string;
  JPG : TJpegImage;
begin
  Imagen.Picture := nil;

  if (Codigo <> 0) then
  begin
     FormatoCache := 'JPG';
     ArchivoCache := DMMain.GetRutaImagenTPV + format('TMPIMG_%d_%dx%d.%s', [Codigo, Ancho, Alto, FormatoCache]);

     if FileExists(ArchivoCache) then
     begin
        try
           CargarImagenDeArchivo(Imagen, ArchivoCache, FormatoCache)
        except
           Imagen.Picture := nil;
        end;
     end
     else
     begin
        RefrescarImagen(Imagen, Codigo);

        // Modifico tamaño de imagen
        Imagen.Canvas.StretchDraw(Rect(0, 0, Ancho, Alto), Imagen.Picture.Bitmap);
        Imagen.Picture.Bitmap.Width := Ancho;
        Imagen.Picture.Bitmap.Height := Alto;

        // Guardo una copia para cache
        JPG := TJpegImage.Create;
        try
           JPG.Assign(Imagen.Picture.Bitmap);
           JPG.SaveToFile(ArchivoCache);
        finally
           JPG.Free;
        end;
     end;
  end;
end;

procedure RefrescarImagenTimbre(Imagen: TImage; IdDoc: integer);
var
  Stream : TStream;
begin
  Imagen.Picture := nil;
  if (IdDoc <> 0) then
  begin
     with TFIBDataSet.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           Transaction := DameTransactionRO(DMMain.DataBase);
           try
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Text := 'SELECT TIMBRE_COD_BARRA FROM GES_CABECERAS_S_FE_CHL WHERE ID_S = :ID_S';
              Params.ByName['ID_S'].AsInteger := IdDoc;
              Open;

              if not FieldByName('TIMBRE_COD_BARRA').IsNull then
              begin
                 Stream := CreateBlobStream(FieldByName('TIMBRE_COD_BARRA'), bmRead);
                 try
                    CargarImagenDeStream(Imagen, Stream, 'PNG');
                 finally
                    Stream.Free;
                 end;
              end;

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
end;

procedure GuardarImagen(Id: integer; FileName: string);
var
  m, f : TStream;
  aFileName, aFilePath : string;
  Repositorio : integer;
begin
  if (Id <> 0) then
  begin
     with TFIBDataSet.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           Transaction := DameTransactionRO(DMMain.DataBase);
           try
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Text := 'SELECT REPOSITORIO, RUTA, IMAGEN, NOMBRE, FORMATO FROM SYS_IMAGENES WHERE CODIGO = :CODIGO';
              Params.ByName['CODIGO'].AsInteger := Id;
              Open;

              // Donde esta el fichero. 0: Carpeta compartida, 1: Base de Datos, 2: Base de Datos de Imagenes
              Repositorio := FieldByName('REPOSITORIO').AsInteger;

              if (Repositorio <> 2) then
              begin
                 // Si esta guardada en disco
                 if (Repositorio = 0) then
                    m := TFileStream.Create(FieldByName('RUTA').AsString, fmOpenRead)
                 else
                    m := CreateBlobStream(FieldByName('IMAGEN'), bmRead);

                 // Copio el stream a un archivo
                 try
                    // Si no especifico carpeta, lo guardo en TEMP
                    aFilePath := ExtractFilePath(FileName);
                    if (aFilePath = '') then
                       aFilePath := DameTempPath;

                    // Si no especifico el nombre, lo guardo con el nombre original
                    aFileName := ExtractFileName(FileName);
                    if (aFileName = '') then
                       aFileName := FieldByName('NOMBRE').AsString;

                    // Cambio la extensión
                    FileName := ChangeFileExt(IncludeTrailingPathDelimiter(aFilePath) + aFileName, '.' + FieldByName('FORMATO').AsString);

                    f := TFileStream.Create(FileName, fmCreate);
                    try
                       f.CopyFrom(m, m.Size);
                    finally
                       f.Free;
                    end;
                 finally
                    m.Free;
                 end;
              end;

              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        finally
           Free;
        end;
     end;

     if (Repositorio = 2) then
        DMMain.ConectaImagenes;

     if ((Repositorio = 2) and (DMMain.DataBaseImagenes.Connected)) then
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

                 SelectSQL.Add(' SELECT REPOSITORIO, RUTA, IMAGEN, NOMBRE, FORMATO FROM SYS_IMAGENES WHERE CODIGO = :CODIGO ');
                 Params.ByName['CODIGO'].AsInteger := Id;
                 Open;

                 m := CreateBlobStream(FieldByName('IMAGEN'), bmRead);
                 // Copio el stream a un archivo
                 try
                    // Si no especifico carpeta, lo guardo en TEMP
                    aFilePath := ExtractFilePath(FileName);
                    if (aFilePath = '') then
                       aFilePath := DameTempPath;

                    // Si no especifico el nombre, lo guardo con el nombre original
                    aFileName := ExtractFileName(FileName);
                    if (aFileName = '') then
                       aFileName := FieldByName('NOMBRE').AsString;

                    // Cambio la extensión
                    FileName := ChangeFileExt(IncludeTrailingPathDelimiter(aFilePath) + aFileName, '.' + FieldByName('FORMATO').AsString);

                    f := TFileStream.Create(FileName, fmCreate);
                    try
                       f.CopyFrom(m, m.Size);
                    finally
                       f.Free;
                    end;
                 finally
                    m.Free;
                 end;

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
  end;
end;

function ImportarImagen(Stream: TStream; Repositorio: integer = -1; SincTipo: string = ''; SincReferencia: string = ''): integer;
var
  val1, val2 : word;
  Formato : string;
  DS : TFIBDataSet;
  m : TStream;
begin
  Result := 0;
  // Determino formato
  Formato := '';

  Stream.Seek(0, soFromBeginning);
  Stream.Read(val1, 2);
  Stream.Position := 2;
  Stream.Read(val2, 2);

  if (val1 = $4D42) then
     Formato := 'BMP';
  if (val1 = $FF) and (val2 = $D8) then
     Formato := 'JPG';
  if (val1 = $47) and (val2 = $49) then
     // 47 49 46 38 37/39 61
     Formato := 'JPG';
  if (val1 = $D8FF) then
     // Copiado desde clipboard y convertido a jpg.
     Formato := 'JPG';
  if (val1 = $89) and (val2 = $50) then
     // 89 50 4E 47 0D 0A 1A 0A
     Formato := 'PNG';

  if Formato <> '' then
  begin
     Stream.Seek(0, soFromBeginning);

     if (Repositorio = -1) then
        Repositorio := StrToIntDef(LeeParametro('IMGUBIC001', ''), 1);
     // Si viene de un stream solo permitimos importar a base de datos o a base externa
     if (Repositorio = 0) then
        Repositorio := 1;

     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Close;
           DataBase := DMMain.DataBase;
           Transaction := DameTransactionRW(DMMain.DataBase);
           try
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Text := 'SELECT CODIGO, NOMBRE, IMAGEN, FORMATO, REPOSITORIO, RUTA, SINC_TIPO, SINC_REFERENCIA FROM SYS_IMAGENES WHERE CODIGO = 0';
              // RefreshSQL.Text := 'SELECT CODIGO, NOMBRE, IMAGEN, FORMATO, REPOSITORIO, RUTA FROM SYS_IMAGENES WHERE CODIGO = ?CODIGO';
              InsertSQL.Text := 'INSERT INTO SYS_IMAGENES (CODIGO, NOMBRE, IMAGEN, FORMATO, REPOSITORIO, RUTA, SINC_TIPO, SINC_REFERENCIA) VALUES (?CODIGO, ?NOMBRE, ?IMAGEN, ?FORMATO, ?REPOSITORIO, ?RUTA, ?SINC_TIPO, ?SINC_REFERENCIA)';
              Open;

              Insert;
              Result := DMMain.Contador_GEN(DS, 'CONTA_IMAGENES', 'CODIGO');
              FieldByName('NOMBRE').AsString := Format(('Imagen %d'), [Result]);
              FieldByName('FORMATO').AsString := Formato;
              FieldByName('RUTA').AsString := 'CLIPBOARD';
              FieldByName('SINC_TIPO').AsString := SincTipo;
              FieldByName('SINC_REFERENCIA').AsString := Copy(SincReferencia, 1, 15);
              FieldByName('REPOSITORIO').AsInteger := Repositorio;

              // Donde se debe copiar el fichero (0:Carpeta compartida, 1: Base de Datos, 2: Base de Datos de Imagenes.
              try
                 if (Repositorio = 2) then
                 begin
                    DMMain.ConectaImagenes;

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

                             FieldByName('CODIGO').AsInteger := Result;
                             FieldByName('NOMBRE').AsString := Format(('Imagen %d'), [Result]);
                             FieldByName('FORMATO').AsString := Formato;
                             FieldByName('RUTA').AsString := 'CLIPBOARD';
                             FieldByName('REPOSITORIO').AsInteger := Repositorio;

                             m := CreateBlobStream(FieldByName('IMAGEN'), bmWrite);
                             try
                                m.CopyFrom(Stream, Stream.Size);
                             finally
                                m.Free;
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
                 end
                 else
                 begin
                    if (Repositorio = 1) then
                    begin
                       m := DS.CreateBlobStream(FieldByName('IMAGEN'), bmWrite);
                       try
                          m.CopyFrom(Stream, Stream.Size);
                       finally
                          m.Free;
                       end;
                    end;
                 end;
                 // Si no se pudo copiar el fichero al repositorio de imagenes devuelvo un error
              except
                 DS.Cancel;
                 Result := 0;
              end;

              Post;
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
end;

function ImportarImagen(Archivo: string; Repositorio: integer = -1; SincTipo: string = ''; SincReferencia: string = ''): integer;
var
  DS, DSExterno : TFIBDataSet;
  m, f : TStream;
  aFileName, aFileExt : string;
  //Ruta : string
begin
  /// Carga una imagen en SYS_IMAGENES desde un archivo y devuelve su ID
  /// Si el archivo esta vacio, abre un dialogo.

  Result := 0;

  if (Archivo = '') then
  begin
     with TOpenPictureDialog.Create(nil) do
     begin
        try
           Filter := ('Todas las imágenes|*.bmp;*.jpg;*.gif;*.png|BitMap Images (*.bmp)|*.bmp|JPG Images (*.jpg)|*.jpg|GIF Images (*.gif)|*.gif|PNG Images (*.png)|*.png');
           FilterIndex := 1;
           // Posicion inicial en Mis Imagenes
           InitialDir := LeeDatoIni('ImportarImagen', 'UltimaRuta', GetSpecialFolderPath(CSIDL_MYPICTURES, True));
           Title := ('Carga de Imagen');
           if (Execute) then
              Archivo := FileName;
        finally
           Free;
        end;
     end;
  end;

  if (Archivo > '') then
  begin
     EscribeDatoIni('ImportarImagen', 'UltimaRuta', ExtractFilePath(Archivo));

     aFileExt := AnsiUpperCase(ExtractFileExt(Archivo));
     if aFileExt = '.JPEG' then
        aFileExt := '.JPG';
     aFileExt := Copy(aFileExt, 2, 3);
     aFileName := ExtractFileName(Archivo);

     if (Repositorio = -1) then
        Repositorio := StrToIntDef(LeeParametro('IMGUBIC001', ''), 1);

     DS := TFIBDataSet.Create(nil);
     try
        with DS do
        begin
           Close;
           DataBase := DMMain.DataBase;
           Transaction := DameTransactionRW(DMMain.DataBase);
           try
              if (not Transaction.InTransaction) then
                 Transaction.StartTransaction;
              SelectSQL.Text := 'SELECT CODIGO, NOMBRE, IMAGEN, FORMATO, REPOSITORIO, RUTA, SINC_TIPO, SINC_REFERENCIA FROM SYS_IMAGENES WHERE CODIGO = 0';
              // RefreshSQL.Text := 'SELECT CODIGO, NOMBRE, IMAGEN, FORMATO, REPOSITORIO, RUTA, SINC_TIPO, SINC_REFERENCIA FROM SYS_IMAGENES WHERE CODIGO = ?CODIGO';
              InsertSQL.Text := 'INSERT INTO SYS_IMAGENES (CODIGO, NOMBRE, IMAGEN, FORMATO, REPOSITORIO, RUTA, SINC_TIPO, SINC_REFERENCIA) VALUES (?CODIGO, ?NOMBRE, ?IMAGEN, ?FORMATO, ?REPOSITORIO, ?RUTA, ?SINC_TIPO, ?SINC_REFERENCIA)';
              Open;

              Insert;
              Result := DMMain.Contador_GEN(DS, 'CONTA_IMAGENES', 'CODIGO');
              FieldByName('NOMBRE').AsString := Copy(aFileName, 1, 35);
              FieldByName('FORMATO').AsString := aFileExt;
              FieldByName('RUTA').AsString := Copy(Archivo, 1, 200);
              FieldByName('SINC_TIPO').AsString := SincTipo;
              FieldByName('SINC_REFERENCIA').AsString := UpperCase(Copy(SincReferencia, 1, 15));
              FieldByName('REPOSITORIO').AsInteger := Repositorio;

              if (Repositorio = 1) then
              begin
                 m := DS.CreateBlobStream(FieldByName('IMAGEN'), bmWrite);
                 try
                    f := TFileStream.Create(Archivo, fmOpenRead);
                    try
                       m.CopyFrom(f, f.Size);
                    finally
                       f.Free;
                    end;
                 finally
                    m.Free;
                 end;
              end;

              Post;
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;

     if (Repositorio = 2) then
     begin
        DMMain.ConectaImagenes;

        DSExterno := TFIBDataSet.Create(nil);
        with DSExterno do
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

                 FieldByName('CODIGO').AsInteger := Result;
                 FieldByName('NOMBRE').AsString := Copy(aFileName, 1, 35);
                 FieldByName('FORMATO').AsString := aFileExt;
                 FieldByName('RUTA').AsString := Copy(Archivo, 1, 200);
                 FieldByName('REPOSITORIO').AsInteger := Repositorio;

                 m := CreateBlobStream(FieldByName('IMAGEN'), bmWrite);
                 try
                    f := TFileStream.Create(Archivo, fmOpenRead);
                    try
                       m.CopyFrom(f, f.Size);
                    finally
                       f.Free;
                    end;
                 finally
                    m.Free;
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
  end;
end;

function ImportarImagenDesdeClipboard(Repositorio: integer = -1): integer;
var
  i : integer;
  Imagen : TImage;
  JPG : TJpegImage;
  Stream : TStream;
  f : THandle;
  buffer : array [0..MAX_PATH] of char;
  {i,} c : integer;
  aSL : TStringList;
begin
  Result := 0;

  {
  CF_TEXT           Text with a CR-LF combination at the end of each line. A null character identifies the end of the text.
  CF_BITMAP         A Windows bitmap graphic.
  CF_METAFILEPICT   A Windows metafile graphic.
  CF_PICTURE        An object of type TPicture.
  CF_COMPONENT      Any persistent object.
  CF_HDROP          List of files/folders
  }

  if Clipboard.HasFormat(CF_TEXT) then
  begin
     DMMain.Log('DMMain.ImportarImagenDesdeClipboard - Clipboard is CF_TEXT');
     ShowMessage(Format(('No se puede importar %s'), [Clipboard.AsText]));
  end
  else
  if Clipboard.HasFormat(CF_BITMAP) then
  begin
     DMMain.Log('DMMain.ImportarImagenDesdeClipboard - Clipboard is CF_BITMAP');
     Imagen := TImage.Create(DMMain);
     JPG := TJpegImage.Create;
     try
        Imagen.Picture.Bitmap.Assign(Clipboard);

        // Convierto imagen a JPG
        JPG.Assign(Imagen.Picture.Bitmap);
        JPG.CompressionQuality := 80;
        JPG.Compress;
        Stream := TMemoryStream.Create;
        try
           JPG.SaveToStream(Stream);
           Result := ImportarImagen(Stream, Repositorio);
        finally
           Stream.Free;
        end;
     finally
        Imagen.Free;
        JPG.Free;
     end;
  end
  else
  if Clipboard.HasFormat(CF_METAFILEPICT) then
  begin
     DMMain.Log('DMMain.ImportarImagenDesdeClipboard - Clipboard is CF_METAFILEPICT');
     ShowMessage(('No se puede importar este tipo de portapapeles (CF_METAFILEPICT)'));
  end
  else
  if Clipboard.HasFormat(CF_PICTURE) then
  begin
     DMMain.Log('DMMain.ImportarImagenDesdeClipboard - Clipboard is CF_PICTURE');
     Imagen := TImage.Create(DMMain);
     JPG := TJpegImage.Create;
     try
        Imagen.Picture.Bitmap.Assign(Clipboard);

        // Convierto imagen a JPG
        JPG.Assign(Imagen.Picture.Bitmap);
        JPG.CompressionQuality := 80;
        JPG.Compress;
        Stream := TMemoryStream.Create;
        try
           JPG.SaveToStream(Stream);
           Result := ImportarImagen(Stream, Repositorio);
        finally
           Stream.Free;
        end;
     finally
        Imagen.Free;
        JPG.Free;
     end;
  end
  else
  if Clipboard.HasFormat(CF_COMPONENT) then
  begin
     DMMain.Log('DMMain.ImportarImagenDesdeClipboard - Clipboard is CF_COMPONENT');
     ShowMessage(('No se puede importar este tipo de portapapeles (CF_COMPONENT)'));
  end
  else
  if Clipboard.HasFormat(CF_HDROP) then
  begin
     DMMain.Log('DMMain.ImportarImagenDesdeClipboard - Clipboard is CF_HDROP');

     aSL := TStringList.Create;
     try
        c := 0;
        // Obtengo lista de ficheros
        Clipboard.Open;
        try
           f := Clipboard.GetAsHandle(CF_HDROP);
           if f <> 0 then
           begin
              c := DragQueryFile(f, $FFFFFFFF, nil, 0);
              for i := 0 to c - 1 do
              begin
                 buffer[0] := #0;
                 DragQueryFile(f, i, buffer, SizeOf(buffer));
                 aSL.Add(buffer);
              end;
           end;
        finally
           Clipboard.Close;
        end;

        if c <> 0 then
        begin
           if c = 1 then
              Result := ImportarImagen(aSL[0], Repositorio)
           else
           begin
              if ConfirmaMensaje(Format(('Hay %d ficheros seleccionados. Desea importarlos todos?'), [aSL.Count])) then
              begin
                 // Importo y devuelvo codigo de primera imagen
                 Result := ImportarImagen(aSL[0], Repositorio);

                 // Importo resto de imagenes
                 for i := 1 to aSL.Count - 1 do
                 begin
                    ImportarImagen(aSL[i], Repositorio);
                 end;
              end;
           end;
        end
        else
           ShowMessage(('No hay ficheros seleccionados'));
     finally
        aSL.Free;
     end;
  end;
end;

constructor TLoadImageThread.Create;
begin
  inherited Create(True); // Create suspended

  // Lo tendre que liberar al cerrar la aplicacion
  FreeOnTerminate := False;

  FCritical := TCriticalSection.Create;

  FDatabase := nil;
  FDatabaseImg := nil;
  FImage := nil;
  FCodigo := 0;

  FRequestPending := False;
  Resume; // Iniciar thread
end;

destructor TLoadImageThread.Destroy;
begin
  Terminate;
  WaitFor;

  if Assigned(FImageStream) then
     FImageStream.Free;
  FDatabase.Free;
  FCritical.Free;
  inherited;
end;

procedure TLoadImageThread.Execute;
var
  Repositorio : integer;
  BlobStream : TStream;
  Codigo : integer;
begin
  Repositorio := 0;
  Codigo := 0;
  while not Terminated do
  begin
     // Chequear si hay un pedido pendiente
     FCritical.Enter;
     try
        if FRequestPending then
        begin
           Codigo := FCodigo;
           FCodigo := 0;
           FFormato := '';
           FRequestPending := False;
        end
        else
           FImage := nil;
     finally
        FCritical.Leave;
     end;

     if Assigned(FImage) then
     begin
        if (Codigo = 0) then
           Synchronize(UpdateImage)
        else
        begin
           if Assigned(FDataBase) then
           begin
              if (not FDataBase.Connected) then
                 FDataBase.Open;

              with TFIBDataSet.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := FDataBase;
                    Transaction := DameTransactionRO(FDataBase);
                    try
                       if (not Transaction.InTransaction) then
                          Transaction.StartTransaction;
                       SelectSQL.Text := 'SELECT REPOSITORIO, RUTA, IMAGEN, FORMATO FROM SYS_IMAGENES WHERE CODIGO = :CODIGO';
                       Params.ByName['CODIGO'].AsInteger := Codigo;
                       Open;

                       // Donde esta el fichero. 0: Carpeta compartida, 1: Base de Datos, 2: Base de Datos de Imagenes
                       Repositorio := FieldByName('REPOSITORIO').AsInteger;

                       if (Repositorio = 1) then
                       begin
                          if (not FieldByName('IMAGEN').IsNull) then
                          begin
                             FFormato := FieldByName('FORMATO').AsString;

                          {
                          if Assigned(FImageStream) then
                             FImageStream.Free;
                          FImageStream := CreateBlobStream(FieldByName('IMAGEN'), bmRead);
                          Synchronize(UpdateImage);
                          }
                             BlobStream := CreateBlobStream(FieldByName('IMAGEN'), bmRead);
                             try
                                FImageStream.CopyFrom(BlobStream, BlobStream.Size);
                                Synchronize(UpdateImage);
                             finally
                                BlobStream.Free;
                             end;

                          end;
                       end;
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

           if (Repositorio = 2) then
           begin
              if Assigned(FDataBaseImg) then
              begin
                 if (not FDataBaseImg.Connected) then
                    FDataBaseImg.Open;

                 with TFIBDataSet.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := FDataBaseImg;
                       Transaction := DameTransactionRW(FDataBaseImg);
                       try
                          if (not Transaction.InTransaction) then
                             Transaction.StartTransaction;

                          SelectSQL.Add(' SELECT REPOSITORIO, RUTA, IMAGEN, NOMBRE, FORMATO FROM SYS_IMAGENES WHERE CODIGO = :CODIGO ');
                          Params.ByName['CODIGO'].AsInteger := Codigo;
                          Open;

                          if (not FieldByName('IMAGEN').IsNull) then
                          begin
                             FFormato := FieldByName('FORMATO').AsString;

                             BlobStream := CreateBlobStream(FieldByName('IMAGEN'), bmRead);
                             try
                                FImageStream.CopyFrom(BlobStream, BlobStream.Size);
                                Synchronize(UpdateImage);
                             finally
                                BlobStream.Free;
                             end;
                          end;

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
           end;
        end;
     end
     else
        Sleep(100); // Esperar un poco antes de volver a chequear
  end;
end;

procedure TLoadImageThread.CargaImagen(AImage: TImage; ACodigo: integer);
begin
  FCritical.Enter;
  try
     FImage := AImage;
     FCodigo := ACodigo;
     FRequestPending := True;
  finally
     FCritical.Leave;
  end;
end;

procedure TLoadImageThread.ConectaBD(ADatabase: THYDatabase);
begin
  FCritical.Enter;
  try
     if Assigned(FDatabase) then
        FDatabase.Free;

     FDatabase := TFIBDatabase.Create(nil);
     FDatabase.DBName := ADatabase.DBName;
     FDatabase.DBParams.Values['user_name'] := ADatabase.DBParams.Values['user_name'];
     FDatabase.DBParams.Values['password'] := ADatabase.DBParams.Values['password'];
     if (ADatabase.DBParams.Values['lc_ctype'] <> '') then
        FDatabase.DBParams.Values['lc_ctype'] := ADatabase.DBParams.Values['lc_ctype'];
     if (ADatabase.DBParams.Values['sql_role_name'] <> '') then
        FDatabase.DBParams.Values['sql_role_name'] := ADatabase.DBParams.Values['sql_role_name'];

     FDatabase.Connected := True;
  finally
     FCritical.Leave;
  end;
end;

procedure TLoadImageThread.ConectaBDImg(ADatabaseImg: THYDatabase);
begin
  FCritical.Enter;
  try
     if Assigned(ADatabaseImg) then
        ADatabaseImg.Free;

     FDatabaseImg := ADatabaseImg;
     FDatabaseImg := TFIBDatabase.Create(nil);
     FDatabaseImg.DBName := ADatabaseImg.DBName;
     FDatabaseImg.DBParams.Values['user_name'] := ADatabaseImg.DBParams.Values['user_name'];
     FDatabaseImg.DBParams.Values['password'] := ADatabaseImg.DBParams.Values['password'];
     if (ADatabaseImg.DBParams.Values['lc_ctype'] <> '') then
        FDatabaseImg.DBParams.Values['lc_ctype'] := ADatabaseImg.DBParams.Values['lc_ctype'];
     if (ADatabaseImg.DBParams.Values['sql_role_name'] <> '') then
        FDatabaseImg.DBParams.Values['sql_role_name'] := ADatabaseImg.DBParams.Values['sql_role_name'];

     try
        FDatabaseImg.Connected := True;
     except
     end;
  finally
     FCritical.Leave;
  end;
end;

procedure TLoadImageThread.UpdateImage;
begin
  DMMain.Log('Image.Code: ' + IntToStr(FCodigo) + ' - Image.Format: ' + FFormato + ' - Image.Size: ' + IntToStr(FImageStream.Size));
  CargarImagenDeStream(FImage, FImageStream, FFormato);
  FreeAndNil(FImageStream);
end;

end.
