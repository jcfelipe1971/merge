unit UDMExportarDatosPonys;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes;

type
  TDMExportarDatosPonys = class(TDataModule)
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure Exportar;
     procedure ExportarPrestaShop;
  end;

var
  DMExportarDatosPonys : TDMExportarDatosPonys;

implementation

{$R *.dfm}

uses UUtiles, UEntorno, DateUtils, IdFTP, UDMMain, FIBDataSet, FIBDatabase, UImagenes;

{ TDMExportarDatosPonys }

procedure TDMExportarDatosPonys.Exportar;
var
  s : TStrings;
  TempPath : string;
  DS : TFIBDataSet;
  sr : TSearchRec;
  // IdFTP : TIdFTP;
  FTP_Host : string;
  FTP_Port : integer;
  FTP_User : string;
  FTP_Password : string;
begin
  /// Exporta Familias, Articulos y sus imágenes
  ///    Crea una carpeta temporal
  ///    Crea los ficheros dentro de la carpeta
  ///    Envia por FTP los ficheros de esa carpeta
  ///       Familias y Articulos a ftp/datos
  ///       Imagenes a ftp
  ///    Borra los ficheros

  TempPath := DameTempPath + 'ExportacionPonys';
  if not (DirectoryExists(TempPath)) then
  begin
     if not CreateDir(TempPath) then
        raise Exception.Create(Format(_('No se pudo crear la carpeta %s'), [TempPath]));
  end;

  TempPath := IncludeTrailingPathDelimiter(TempPath);
  DMMain.Log('TempPath ' + TempPath);
  s := TStringList.Create;
  try
     DMMain.Log('Exportacion de familias');
     // Exportacion de familias
     s.Add(' SELECT ID_FAMILIA, FAMILIA, TITULO FROM ART_FAMILIAS ');
     s.Add(' WHERE ');
     s.Add(' EMPRESA = ' + REntorno.EmpresaStr);
     s.Add(' AND WEB = 1 ');
     // s.Add(' AND ULT_MODIFICACION > ''' + FormatDateTime('yyyy.mm.dd', Yesterday) + '''');
     s.Add(' ORDER BY ID_FAMILIA ');

     ExportarCSV(TempPath + 'Familia.csv', s.Text);

     DMMain.Log('Exportacion de modelos Tallas y Colores');
     // Exportacion de modelos Tallas y Colores
     s.Clear;
     s.Add(' SELECT M.ID_A_M, M.ID_G_T, M.REF_PROVEEDOR AS MODELO, M.TITULO, F.ID_FAMILIA, M.FAMILIA, CAST(M.IMAGEN || ''.JPG'' AS VARCHAR(250)) AS IMAGEN ');
     s.Add(' ,(SELECT FIRST 1 T.PRECIO_VENTA ');
     s.Add(' FROM ART_ARTICULOS_MOD_COLOR AAMC ');
     s.Add(' LEFT JOIN ART_ARTICULOS_M_C_TALLAS AAMCT ');
     s.Add(' ON AAMC.ID_A_M_C = AAMCT.ID_A_M_C ');
     s.Add(' LEFT JOIN ART_TARIFAS_PRECIOS T ');
     s.Add(' ON M.EMPRESA = T.EMPRESA AND ''NOR'' = T.TARIFA AND AAMCT.ARTICULO = T.ARTICULO AND 1 = T.LINEA ');
     s.Add(' WHERE AAMC.ID_A_M = M.ID_A_M) AS PRECIO ');
     s.Add(' ,(SELECT SUM (EXISTENCIAS) FROM A_ART_DAME_STOCK_MOD_ART_ED(M.EMPRESA, 0, M.ID_A_M, '''', 1 /*SOLO_STOCKS*/, 0 /*STOCK_MIN_MAX*/, 0 /*PEDIDOS_PRO*/, 0 /*PEDIDOS_CLI*/, 0 /*PEDIDOS_TMP*/, 0 /*RESER*/, 0 /*EN_PROC_PROD*/, null)) AS STOCK ');
     s.Add(' FROM ART_ARTICULOS_MODELOS M ');
     s.Add(' JOIN ART_FAMILIAS F ');
     s.Add(' ON M.EMPRESA = F.EMPRESA AND M.FAMILIA = F.FAMILIA ');
     s.Add(' WHERE ');
     s.Add(' M.EMPRESA = ' + REntorno.EmpresaStr);
     s.Add(' AND M.WEB = 1 ');
     s.Add(' AND F.WEB = 1 ');
     s.Add(' ORDER BY M.ID_A_M ');

     { Esto devolvería articulos, pero queremos modelos
     s.Add(' (SELECT SUM(EXISTENCIAS) FROM A_ART_DAME_STOCK_ART_ED(A.EMPRESA, 1 /*CANAL*/, A.ARTICULO, '''', 1, 0, 0, 0, 0, 0, 0, NULL)) AS STOCK ');
     s.Add(' FROM ART_ARTICULOS A ');
     s.Add(' JOIN ART_FAMILIAS F ');
     s.Add(' ON A.EMPRESA = F.EMPRESA AND A.FAMILIA = F.FAMILIA ');
     s.Add(' JOIN ART_TARIFAS_PRECIOS T ');
     s.Add(' ON A.EMPRESA = T.EMPRESA AND A.ARTICULO = T.ARTICULO AND T.TARIFA = ''NOR'' AND T.LINEA = 1 ');
     s.Add(' WHERE ');
     s.Add(' A.EMPRESA = ' + REntorno.EmpresaStr);
     s.Add(' AND A.WEB = 1 ');
     s.Add(' AND A.ULT_MODIFICACION > ''' + FormatDateTime('yyyy.mm.dd', Yesterday) + '''');
     s.Add(' ORDER BY A.ID_A ');
     }
     ExportarCSV(TempPath + 'Modelo.csv', s.Text);

     DMMain.Log('Exportacion de Relacion Modelo Color');
     // Exportacion de Relacion Modelo Color
     s.Clear;
     s.Add(' SELECT M.ID_A_M, MC.ID_A_C ');
     s.Add(' FROM ART_ARTICULOS_MODELOS M ');
     s.Add(' JOIN ART_ARTICULOS_MOD_COLOR MC ');
     s.Add(' ON M.ID_A_M = MC.ID_A_M ');
     s.Add(' ORDER BY M.ID_A_M, MC.ID_A_C ');

     ExportarCSV(TempPath + 'RelacionModeloColor.csv', s.Text);

     DMMain.Log('Exportacion de Colores');
     // Exportacion de Colores
     s.Clear;
     s.Add(' SELECT ID_A_C, TITULO ');
     s.Add(' FROM ART_COLORES ');
     s.Add(' ORDER BY ID_A_C ');

     ExportarCSV(TempPath + 'Color.csv', s.Text);

     DMMain.Log('Exportacion de Grupo de Tallas');
     // Exportacion de Grupo de Tallas
     s.Clear;
     s.Add(' SELECT ID_G_T, TITULO ');
     s.Add(' FROM ART_GRUPOS_TALLAS ');
     s.Add(' ORDER BY ID_G_T ');

     ExportarCSV(TempPath + 'GrupoTalla.csv', s.Text);

     DMMain.Log('Exportacion de Tallas');
     // Exportacion de Tallas
     s.Clear;
     s.Add(' SELECT ID_G_T, ID_A_T, TITULO ');
     s.Add(' FROM ART_TALLAS ');
     s.Add(' ORDER BY ID_G_T, ID_A_T, TITULO ');

     ExportarCSV(TempPath + 'Talla.csv', s.Text);

     DMMain.Log('Exportacion de Articulos');
     // Exportacion de Articulos
     s.Clear;
     s.Add(' SELECT M.ID_A_M, M.ID_G_T, C.ID_A_C, T.ID_A_T, A.ID_A, A.TITULO ');
     s.Add(' FROM ART_ARTICULOS_MODELOS M ');
     s.Add(' JOIN ART_FAMILIAS F ');
     s.Add(' ON M.EMPRESA = F.EMPRESA AND M.FAMILIA = F.FAMILIA ');
     s.Add(' JOIN ART_ARTICULOS_MOD_COLOR C ');
     s.Add(' ON M.ID_A_M = C.ID_A_M ');
     s.Add(' JOIN ART_ARTICULOS_M_C_TALLAS T ');
     s.Add(' ON C.ID_A_M_C = T.ID_A_M_C ');
     s.Add(' JOIN ART_TALLAS TT ');
     s.Add(' ON T.ID_A_T = TT.ID_A_T ');
     s.Add(' JOIN ART_ARTICULOS A ');
     s.Add(' ON T.ID_A_M_C_T = A.ID_A_M_C_T ');
     s.Add(' WHERE ');
     s.Add(' M.EMPRESA = ' + REntorno.EmpresaStr);
     s.Add(' AND M.WEB = 1 ');
     s.Add(' AND F.WEB = 1 ');
     s.Add(' ORDER BY M.ID_A_M ');

     ExportarCSV(TempPath + 'Articulo.csv', s.Text);

     DMMain.Log('Exportacion de imagenes');
     DMMain.Log('Imagen por defecto para los artículos ''0.jpg''');
     // Exportacion de imagenes
     // Imagen por defecto para los artículos '0.jpg'
     try
        GuardarImagen(0, TempPath + '0.JPG');
     except
        on E: Exception do
           DMMain.Log('No se pudo guardar la imagen por defecto para los artículos ''0.jpg''' + #13#10 + E.Message);
     end;

     DMMain.Log('Imagenes modificadas ultimamente de modelos de artículo');
     // Imagenes modificadas ultimamente de modelos de artículo
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
              SelectSQL.Add(' SELECT I.CODIGO ');
              SelectSQL.Add(' FROM ART_ARTICULOS_MODELOS M ');
              SelectSQL.Add(' JOIN SYS_IMAGENES I ');
              SelectSQL.Add(' ON M.IMAGEN = I.CODIGO ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' M.EMPRESA = ' + REntorno.EmpresaStr);
              SelectSQL.Add(' AND M.WEB = 1 ');
              SelectSQL.Add(' AND M.IMAGEN <> 0 ');
              SelectSQL.Add(' AND I.ULT_MODIFICACION > ''' + FormatDateTime('yyyy.mm.dd', Yesterday) + '''');
              SelectSQL.Add(' ORDER BY M.ID_A_M ');

              { Esto devolvería las imágenes de los articulos, pero queremos la de los modelos
              SelectSQL.Add(' SELECT DISTINCT I.CODIGO, A.ID_A ');
              SelectSQL.Add(' FROM ART_ARTICULOS A ');
              SelectSQL.Add(' JOIN SYS_IMAGENES I ');
              SelectSQL.Add(' ON A.IMAGEN = I.CODIGO ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' A.EMPRESA = ' + REntorno.EmpresaStr);
              SelectSQL.Add(' AND A.WEB = 1 ');
              SelectSQL.Add(' AND A.IMAGEN <> 0 ');
              SelectSQL.Add(' AND I.ULT_MODIFICACION > ''' + FormatDateTime('yyyy.mm.dd', Yesterday) + '''');
              SelectSQL.Add(' ORDER BY A.ID_A ');
              }
              Open;

              while not EOF do
              begin
                 DMMain.Log('Imagen ' + TempPath + FieldByName('CODIGO').AsString + '.JPG');
                 try
                    GuardarImagen(FieldByName('CODIGO').AsInteger, TempPath + FieldByName('CODIGO').AsString + '.JPG');
                 except
                    on E: Exception do
                       DMMain.Log('No se pudo guardar la imagen ' + FieldByName('CODIGO').AsString + #13#10 + E.Message);
                 end;
                 Next;
              end;
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;
  finally
     s.Free;
  end;

  DMMain.Log('Obtengo datos de usuario y clave para FTP');

  FTP_Host := LeeDatoIni('ExportacionPonys', 'Host', '');
  if (FTP_Host = '') then
     EscribeDatoIni('ExportacionPonys', 'Host', 'ftp.sabateriesponys.com');
  FTP_Port := LeeDatoIni('ExportacionPonys', 'Port', 0);
  if (FTP_Port = 0) then
     EscribeDatoIni('ExportacionPonys', 'Port', 21);
  FTP_User := LeeDatoIni('ExportacionPonys', 'User', '');
  if (FTP_User = '') then
     EscribeDatoIni('ExportacionPonys', 'User', 'programaponys');
  FTP_Password := LeeDatoIni('ExportacionPonys', 'Password', '-'); // ;;8U}{^Z*-T-4ep7
  // Si no existe identificador, creo uno vacio
  if (FTP_Password = '-') then
     EscribeDatoIni('ExportacionPonys', 'Password', '')
  else
  // Si existe lo encripto
  // La divido en dos mitades para poder guardar claves de mas de 12 digitos
  if (FTP_Password <> '') then
  begin
     // Si esta la clave, la encripto y la borro
     EscribeDatoIni('ExportacionPonys', 'PasswordEnc1', CodificaClave(Copy(FTP_Password, 1, 12)));
     EscribeDatoIni('ExportacionPonys', 'PasswordEnc2', CodificaClave(Copy(FTP_Password, 13, 24)));
     EscribeDatoIni('ExportacionPonys', 'Password', '');
  end;
  FTP_Password := DescodificaClave(LeeDatoIni('ExportacionPonys', 'PasswordEnc2', ''));
  if (FTP_Password = 'masterkey') then
     FTP_Password := '';
  FTP_Password := DescodificaClave(LeeDatoIni('ExportacionPonys', 'PasswordEnc1', '')) + FTP_Password;

  DMMain.Log('Envio por FTP');
  // Envio por FTP
  { TODO -cINDY-10 : Revisrar nuevas INDY 10 }
  (*
  IdFTP := TIdFTP.Create(nil);
  try
     try
        with IdFTP do
        begin
           Passive := True;
           Host := FTP_Host;
           DMMain.Log('Host: ' + FTP_Host);
           User := FTP_User;
           DMMain.Log('User: ' + FTP_User);
           Password := FTP_Password;
           DMMain.Log('Password: xxxxxxxxxxxx');
           Port := FTP_Port;
           DMMain.Log('Port: ' + IntToStr(FTP_Port));
           Connect(True);
           DMMain.Log('Connect');
           if (Connected) then
           begin
              DMMain.Log('Connected');
              DMMain.Log('Descripcion del Servidor: ' + SystemDesc);

              ChangeDir('datos');
              DMMain.Log('ChangeDir: ' + 'datos');

              DMMain.Log('Put: ' + TempPath + 'Familia.csv' + ' --> ' + 'Familia.csv');
              Put(TempPath + 'Familia.csv', 'Familia.csv');

              DMMain.Log('Put: ' + TempPath + 'Modelo.csv' + ' --> ' + 'Modelo.csv');
              Put(TempPath + 'Modelo.csv', 'Modelo.csv');

              DMMain.Log('Put: ' + TempPath + 'RelacionModeloColor.csv' + ' --> ' + 'RelacionModeloColor.csv');
              Put(TempPath + 'RelacionModeloColor.csv', 'RelacionModeloColor.csv');

              DMMain.Log('Put: ' + TempPath + 'Color.csv' + ' --> ' + 'Color.csv');
              Put(TempPath + 'Color.csv', 'Color.csv');

              DMMain.Log('Put: ' + TempPath + 'GrupoTalla.csv' + ' --> ' + 'GrupoTalla.csv');
              Put(TempPath + 'GrupoTalla.csv', 'GrupoTalla.csv');

              DMMain.Log('Put: ' + TempPath + 'Talla.csv' + ' --> ' + 'Talla.csv');
              Put(TempPath + 'Talla.csv', 'Talla.csv');

              DMMain.Log('Put: ' + TempPath + 'Articulo.csv' + ' --> ' + 'Articulo.csv');
              Put(TempPath + 'Articulo.csv', 'Articulo.csv');

              // Borro el ficheros
              DeleteFile(TempPath + 'Familia.csv');
              DeleteFile(TempPath + 'Modelo.csv');
              DeleteFile(TempPath + 'RelacionModeloColor.csv');
              DeleteFile(TempPath + 'Color.csv');
              DeleteFile(TempPath + 'GrupoTalla.csv');
              DeleteFile(TempPath + 'Talla.csv');
              DeleteFile(TempPath + 'Articulo.csv');

              ChangeDir('..');
              DMMain.Log('ChangeDir: ' + '..');

              // Recorro la carpeta enviando lo que queda. (imagenes)
              if FindFirst(TempPath + '*.JPG', faAnyFile - faDirectory, sr) = 0 then
              begin
                 repeat
                    Put(TempPath + sr.Name, sr.Name);
                    DMMain.Log('Put: ' + TempPath + sr.Name + ' --> ' + sr.Name);
                 until FindNext(sr) <> 0;
                 FindClose(sr);
              end;

              DMMain.Log('Disconnect');
              Disconnect;
              DMMain.Log('Disconnected');
           end;
        end;
     except
        on E: Exception do
        begin
           DMMain.Log('ERROR');
           DMMain.Log(E.Message);
        end
     end;
  finally
     IdFTP.Free;
  end;
*)
  DMMain.Log('Recorro la carpeta borrando archivos');
  // Recorro la carpeta borrando archivos
  if FindFirst(TempPath + '*.*', faAnyFile - faDirectory, sr) = 0 then
  begin
     repeat
        DeleteFile(TempPath + sr.Name);
     until FindNext(sr) <> 0;
     FindClose(sr);
  end;

  DMMain.Log('Finalmente elimino la carpeta');
  // Finalmente elimino la carpeta
  RemoveDir(TempPath);
end;

procedure TDMExportarDatosPonys.ExportarPrestaShop;
var
  s : TStrings;
  TempPath : string;
  {
  DS : TFIBDataSet;
  IdFTP : TIdFTP;
  sr : TSearchRec;
  FTP_Host : string;
  FTP_Port : integer;
  FTP_User : string;
  FTP_Password : string;
  }
begin
  /// ******************************************
  /// EN PRUEBAS
  /// ******************************************
  /// Exporta Familias, Articulos y sus imágenes
  ///    Crea una carpeta temporal
  ///    Crea los ficheros dentro de la carpeta
  ///    Envia por FTP los ficheros de esa carpeta
  ///       Familias y Articulos a ftp/datos
  ///       Imagenes a ftp
  ///    Borra los ficheros

  TempPath := DameTempPath + 'ExportacionPonys';
  if not (DirectoryExists(TempPath)) then
  begin
     if not CreateDir(TempPath) then
        raise Exception.Create(Format(_('No se pudo crear la carpeta %s'), [TempPath]));
  end;

  TempPath := IncludeTrailingPathDelimiter(TempPath);
  DMMain.Log('TempPath ' + TempPath);
  s := TStringList.Create;
  try
     DMMain.Log('Exportacion de Categorias');
     // Exportacion de Familias
     s.Add(' SELECT ID_FAMILIA AS ID, WEB AS ACTIVE, FAMILIA AS NAME, ''Home'' AS PARENT_CATEGORY, 1 AS ROOT_CATEGORY, ');
     s.Add('        TITULO AS DESCRIPTION, TITULO_WEB AS META_TITLE, FAMILIA AS META_KEYWORDS, FAMILIA AS META_DESCRIPTION, ');
     s.Add('        ''http://www.sabateriesponys.com/'' AS URL_REWRITTEN, ''http://www.sabateriesponys.com/0.jpg'' AS IMAGE_URL ');
     s.Add(' FROM ART_FAMILIAS ');
     s.Add(' WHERE ');
     s.Add(' EMPRESA = ' + REntorno.EmpresaStr);
     s.Add(' AND FAMILIA <> ''' + REntorno.FamSistema + '''');
     s.Add(' ORDER BY ID_FAMILIA ');
     DMMain.Log(s.Text);

     ExportarCSV(TempPath + 'Categorias.csv', s.Text, ';', False);

     DMMain.Log('Exportacion de Productos');
     // Exportacion de Modelos
     s.Clear;
     s.Add(' SELECT M.ID_A_M AS ID, ');
     s.Add('        CASE(M.WEB) ');
     s.Add('          WHEN 1 THEN CASE(F.WEB) ');
     s.Add('                        WHEN 1 THEN 1 ');
     s.Add('                        ELSE 0 ');
     s.Add('                      END ');
     s.Add('          ELSE 0 ');
     s.Add('        END AS ACTIVE, ');
     s.Add('        M.TITULO AS NAME, M.FAMILIA CATEGORIES, 0 AS PRICE_TAX_EXCLUDED_OR_INCLUDED, 0 AS TAX_RULES_ID, ');
     s.Add('        0 AS WHOLESALE_PRICE, /*Precio_mayorista*/ ');
     s.Add('        0 AS ON_SALE, /*En_rebaja*/ ');
     s.Add('        0 AS DISCOUNT_AMOUNT, 0 AS DISCOUNT_PERCENT, ''2000/01/01'' AS DISCOUNT_FROM, ''3000/01/01'' AS DISCOUNT_TO, ');
     s.Add('        M.COD_MOD AS REFERENCE, '' '' AS SUPPLIER_REFERENCE, 0 AS SUPPLIER, 0 AS MANUFACTURER, '' '' AS EAN13, '' '' AS UPC, ');
     s.Add('        0 AS ECOTAX, 0 AS WIDTH, 0 AS HEIGHT, 0 AS DEPTH, 0 AS WEIGHT, 0 AS QUANTITY, 0 AS MINIMAL_QUANTITY, ');
     s.Add('        '' '' AS VISIBILITY, 0 AS ADDITIONAL_SHIPPING_COST, '' '' AS UNITY, ');
     s.Add('        COALESCE((SELECT FIRST 1 T.PRECIO_VENTA ');
     s.Add('        FROM ART_ARTICULOS_MOD_COLOR AAMC ');
     s.Add('        LEFT JOIN ART_ARTICULOS_M_C_TALLAS AAMCT ON AAMC.ID_A_M_C = AAMCT.ID_A_M_C ');
     s.Add('        LEFT JOIN ART_TARIFAS_PRECIOS T ON M.EMPRESA = T.EMPRESA AND ''NOR'' = T.TARIFA AND AAMCT.ARTICULO = T.ARTICULO AND 1 = T.LINEA ');
     s.Add('        WHERE ');
     s.Add('        AAMC.ID_A_M = M.ID_A_M), 0) AS UNIT_PRICE, ');
     s.Add('        M.TITULO AS SHORT_DESCRIPTION, M.TITULO AS DESCRIPTION, M.COD_MOD AS TAGS, M.TITULO AS META_TITLE, ');
     s.Add('        M.COD_MOD AS META_KEYWORDS, M.TITULO AS META_DESCRIPTION, ''http://www.sabateriesponys.com/'' AS URL_REWRITTEN, ');
     s.Add('        ''Disponible'' AS TEXT_WHEN_IN_STOCK, ''Pendiente Recibir'' AS TEXT_WHEN_BACKORDER_ALLOWED, 0 AVAILABLE_FOR_ORDER, ');
     s.Add('        ''2000/01/01'' AS PRODUCT_AVAILABLE_DATE, ''2000/01/01'' PRODUCT_CREATION_DATE, 1 AS SHOW_PRICE, ');
     s.Add('        ''http://www.sabateriesponys.com/0.jpg'' AS IMAGE_URLS, 0 AS DELETE_EXISTING_IMAGES, '' '' AS FEATURE, /*name:value:position*/ ');
     s.Add('        0 AS AVAILABLE_ONLINE_ONLY, '' '' AS CONDITION, 0 AS CUSTOMIZABLE, 0 AS UPLOADABLE_FILES, '' '' AS TEXT_FIELDS, ');
     s.Add('        0 AS OUT_OF_STOCK, 0 AS ID_NAME_OF_SHOP, 0 AS ADVANCED_STOCK_MANAGEMENT, 0 AS DEPENDS_ON_STOCK, 0 AS WAREHOUSE ');
     s.Add(' FROM ART_ARTICULOS_MODELOS M ');
     s.Add(' JOIN ART_FAMILIAS F ON M.EMPRESA = F.EMPRESA AND M.FAMILIA = F.FAMILIA ');
     s.Add(' WHERE ');
     s.Add(' M.EMPRESA = ' + REntorno.EmpresaStr);
     s.Add(' AND M.FAMILIA <> ''' + REntorno.FamSistema + '''');
     s.Add(' ORDER BY M.ID_A_M ');
     DMMain.Log(s.Text);

     ExportarCSV(TempPath + 'Productos.csv', s.Text, ';', False);

     DMMain.Log('Exportacion de Combinaciones');
     // Exportacion de Relacion Modelo-Talla-Color
     s.Clear;
     s.Add(' SELECT ');
     s.Add(' M.ID_A_M AS PRODUCT_ID, ');
     s.Add(' CAST(''Color:color:0, Talla:select:1'' AS VARCHAR(60)) AS ATTRIBUTE ');
     s.Add(' /*Name:Type:Position*/ , ');
     s.Add(' CAST(AC.TITULO || '':0, '' || T.TITULO || '':1'' AS VARCHAR(60)) AS VALUE_ /*Value:Position*/ , CAST('''' AS VARCHAR(1)) AS SUPPLIER_REFERENCE, ');
     s.Add(' M.COD_MOD AS REFERENCE, CAST('''' AS VARCHAR(1)) AS EAN13, CAST('''' AS VARCHAR(1)) AS UPC, 0 AS WHOLESALE_PRICE, 0 AS IMPACT_ON_PRICE, 0 AS ECOTAX, ');
     s.Add(' 0 AS QUANTITY, 0 AS MINIMAL_QUANTITY, 0 AS IMPACT_ON_WEIGHT, 0 AS DEFAULT_, 0 AS IMAGE_POSITION, ');
     s.Add(' ''http://www.sabateriesponys.com/0.jpg'' AS IMAGE_URL, 0 AS DELETE_EXISTING_IMAGES, 0 AS ID_NAME_OF_SHOP, ');
     s.Add(' 0 AS ADVANCED_STOCK_MANAGMENT, 0 AS DEPENDS_ON_STOCK, 0 AS WAREHOUSE ');
     s.Add(' FROM ART_ARTICULOS_MODELOS M ');
     s.Add(' JOIN ART_ARTICULOS_MOD_COLOR MC ON M.ID_A_M = MC.ID_A_M ');
     s.Add(' JOIN ART_COLORES AC ON AC.ID_A_C = MC.ID_A_C ');
     s.Add(' JOIN ART_GRUPOS_TALLAS GT ON M.ID_G_T = GT.ID_G_T ');
     s.Add(' JOIN ART_TALLAS T ON GT.ID_G_T = T.ID_G_T ');
     s.Add(' WHERE ');
     s.Add(' EMPRESA = ' + REntorno.EmpresaStr);
     s.Add(' AND FAMILIA <> ''' + REntorno.FamSistema + '''');
     s.Add(' ORDER BY M.ID_A_M ');
     DMMain.Log(s.Text);

     ExportarCSV(TempPath + 'Combinaciones.csv', s.Text, ';', False);

     (*
     DMMain.Log('Exportacion de imagenes');
     DMMain.Log('Imagen por defecto para los artículos ''0.jpg''');
     // Exportacion de imagenes
     // Imagen por defecto para los artículos '0.jpg'
     try
        DMMain.GuardarImagen(0, TempPath + '0.JPG');
     except
        on E: Exception do
           DMMain.Log('No se pudo guardar la imagen por defecto para los artículos ''0.jpg''' + #13#10 + E.Message);
     end;

     DMMain.Log('Imagenes modificadas ultimamente de modelos de artículo');
     // Imagenes modificadas ultimamente de modelos de artículo
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
              SelectSQL.Add(' SELECT I.CODIGO ');
              SelectSQL.Add(' FROM ART_ARTICULOS_MODELOS M ');
              SelectSQL.Add(' JOIN SYS_IMAGENES I ');
              SelectSQL.Add(' ON M.IMAGEN = I.CODIGO ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' M.EMPRESA = ' + REntorno.EmpresaStr);
              SelectSQL.Add(' AND M.WEB = 1 ');
              SelectSQL.Add(' AND M.IMAGEN <> 0 ');
              SelectSQL.Add(' AND I.ULT_MODIFICACION > ''' + FormatDateTime('yyyy.mm.dd', Yesterday) + '''');
              SelectSQL.Add(' ORDER BY M.ID_A_M ');

              { Esto devolvería las imágenes de los articulos, pero queremos la de los modelos
              SelectSQL.Add(' SELECT DISTINCT I.CODIGO, A.ID_A ');
              SelectSQL.Add(' FROM ART_ARTICULOS A ');
              SelectSQL.Add(' JOIN SYS_IMAGENES I ');
              SelectSQL.Add(' ON A.IMAGEN = I.CODIGO ');
              SelectSQL.Add(' WHERE ');
              SelectSQL.Add(' A.EMPRESA = ' + REntorno.EmpresaStr);
              SelectSQL.Add(' AND A.WEB = 1 ');
              SelectSQL.Add(' AND A.IMAGEN <> 0 ');
              SelectSQL.Add(' AND I.ULT_MODIFICACION > ''' + FormatDateTime('yyyy.mm.dd', Yesterday) + '''');
              SelectSQL.Add(' ORDER BY A.ID_A ');
              }
              Open;

              while not EOF do
              begin
                 DMMain.Log('Imagen ' + TempPath + FieldByName('CODIGO').AsString + '.JPG');
                 try
                    DMMain.GuardarImagen(FieldByName('CODIGO').AsInteger, TempPath + FieldByName('CODIGO').AsString + '.JPG');
                 except
                    on E: Exception do
                       DMMain.Log('No se pudo guardar la imagen ' + FieldByName('CODIGO').AsString + #13#10 + E.Message);
                 end;
                 Next;
              end;
              Close;
              Transaction.Commit;
           finally
              Transaction.Free;
           end;
        end;
     finally
        FreeAndNil(DS);
     end;
*)
  finally
     s.Free;
  end;
end;

procedure TDMExportarDatosPonys.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
end;

end.
