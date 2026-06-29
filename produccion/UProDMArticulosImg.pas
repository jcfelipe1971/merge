unit UProDMArticulosImg;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBDataSetRO, RxMemDS, FIBTableDataSet;

type
  TProDMArticulosImg = class(TDataModule)
     LstArticulos: TRxMemoryData;
     DSLstArticulos: TDataSource;
     TLocal: THYTransaction;
     QMVerArticulos: TFIBTableSet;
     QMVerArticulosEMPRESA: TIntegerField;
     QMVerArticulosEJERCICIO: TIntegerField;
     QMVerArticulosCANAL: TIntegerField;
     QMVerArticulosARTICULO: TFIBStringField;
     QMVerArticulosTITULO: TFIBStringField;
     QMVerArticulosFAMILIA: TFIBStringField;
     QMVerArticulosP_COSTE: TFloatField;
     QMVerArticulosABIERTO: TIntegerField;
     QMVerArticulosVIRTUAL: TIntegerField;
     QMVerArticulosCONTROL_STOCK: TIntegerField;
     QMVerArticulosPAIS: TFIBStringField;
     QMVerArticulosTIPO_IVA: TIntegerField;
     QMVerArticulosCTA_COMPRAS: TFIBStringField;
     QMVerArticulosCTA_VENTAS: TFIBStringField;
     QMVerArticulosCTA_DEVOLUCION_COMPRAS: TFIBStringField;
     QMVerArticulosCTA_DEVOLUCION_VENTAS: TFIBStringField;
     QMVerArticulosCTA_ABONO_COMPRAS: TFIBStringField;
     QMVerArticulosCTA_ABONO_VENTAS: TFIBStringField;
     QMVerArticulosENTRADA: TIntegerField;
     QMVerArticulosUNIDADES: TFIBStringField;
     QMVerArticulosTITULO_CORTO: TFIBStringField;
     QMVerArticulosNOTAS: TBlobField;
     QMVerArticulosDISPONIBILIDAD: TIntegerField;
     QMVerArticulosACTUALIZA_VENTA: TIntegerField;
     QMVerArticulosPTO_VERDE: TFloatField;
     QMVerArticulosCONTROLA_MEDIDAS: TIntegerField;
     QMVerArticulosSERIALIZADO: TIntegerField;
     QMVerArticulosGARANTIA: TIntegerField;
     QMVerArticulosPRODUCCION: TIntegerField;
     QMVerArticulosDESCUENTO: TFloatField;
     QMVerArticulosDESCUENTO_2: TFloatField;
     QMVerArticulosDESCUENTO_3: TFloatField;
     QMVerArticulosIVA_ESCANDALLO: TIntegerField;
     QMVerArticulosPVP_POR_UD_SECUNDARIA: TIntegerField;
     QMVerArticulosLOTES: TIntegerField;
     QMVerArticulosMULTIPLO_1: TFloatField;
     QMVerArticulosMULTIPLO_2: TFloatField;
     QMVerArticulosMULTIPLO_3: TFloatField;
     QMVerArticulosMULTIPLO_4: TFloatField;
     QMVerArticulosFACTOR_ESCALA: TFloatField;
     QMVerArticulosUD_MINIMO_COMPRA: TFloatField;
     QMVerArticulosUD_MINIMO_VENTA: TFloatField;
     QMVerArticulosID_A: TIntegerField;
     QMVerArticulosID_C_A: TIntegerField;
     QMVerArticulosIMAGEN: TIntegerField;
     QMVerArticulosCODIGO_INTRA: TFIBStringField;
     QMVerArticulosPESO: TFloatField;
     QMVerArticulosUBICABLE: TIntegerField;
     QMVerArticulosVOLUMEN_UNIT: TFloatField;
     QMVerArticulosDIAMETRO_UNIT: TFloatField;
     QMVerArticulosDEFECTO_UD_SECUNDARIA: TFloatField;
     QMVerArticulosANTICIPO: TIntegerField;
     QMVerArticulosANTICIPO_CONTADO: TIntegerField;
     QMVerArticulosANTICIPO_PREG_DATOS: TIntegerField;
     QMVerArticulosWEB: TIntegerField;
     QMVerArticulosFABRICANTE: TIntegerField;
     DSQMVerArticulos: TDataSource;
     xVerArticulosProv: TFIBDataSetRO;
     DSxVerArticulosProv: TDataSource;
     xVerArticulosProvEMPRESA: TIntegerField;
     xVerArticulosProvARTICULO: TFIBStringField;
     xVerArticulosProvPROVEEDOR: TIntegerField;
     xVerArticulosProvCODIGO_PROVEEDOR: TFIBStringField;
     xVerArticulosProvID_A: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMVerArticulosAfterOpen(DataSet: TDataSet);
     procedure QMVerArticulosAfterScroll(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     Path: string;
     BuscarCodProv: integer;
     function BusquedaCompleja: integer;
     procedure RastreaDir;
     procedure RastreaDirProv(Dir: string);
     procedure LeerIni;
     procedure FiltrarArticulo(const Articulo: string);
  end;

var
  ProDMArticulosImg : TProDMArticulosImg;

implementation

uses Forms, UDMMain, UProFMArticulosImg, uFBusca, UEntorno, UUtiles;

{$R *.dfm}

procedure TProDMArticulosImg.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  LeerIni;

  with QMVerArticulos.SelectSQL do
  begin
     Clear;
     Add('SELECT * FROM VER_ARTICULOS_CUENTAS ');
     Add('WHERE ');
     Add('  EMPRESA=?EMPRESA AND ');
     Add('  EJERCICIO=?EJERCICIO AND ');
     Add('  CANAL=?CANAL AND ');
     Add('  ARTICULO=?ARTICULO AND ');
     Add('  FAMILIA<>''' + REntorno.FamSistema + ''' ');
     Add('ORDER BY ARTICULO ');
  end;
  DMMain.FiltraTabla(QMVerArticulos, '11100');
end;

procedure TProDMArticulosImg.QMVerArticulosAfterOpen(DataSet: TDataSet);
begin
  xVerArticulosProv.Open;

  LstArticulos.Close;
  LstArticulos.Open;
  LstArticulos.EmptyTable;
end;

procedure TProDMArticulosImg.QMVerArticulosAfterScroll(DataSet: TDataSet);
begin
  ProFMArticulosImg.DBCtrlGridArtImg.DataSource := nil;
  RastreaDir;
  ProFMArticulosImg.DBCtrlGridArtImg.DataSource := ProDMArticulosImg.DSLstArticulos;
end;

function TProDMArticulosImg.BusquedaCompleja: integer;
begin
  Result := TFBusca.Create(Self).SeleccionaBusqueda(QMVerArticulos, '11100');
end;

procedure TProDMArticulosImg.RastreaDir;
var
  FileSearch : TSearchRec;
  Dir, Articulo : string;
begin
  LstArticulos.Close;
  LstArticulos.Open;
  LstArticulos.EmptyTable;

  if (QMVerArticulosARTICULO.AsString <> '.') and (QMVerArticulosARTICULO.AsString <> '*') then
  begin
     Dir := Path + '\';
     // Buscamos todas las imagenes que tengan el codigo del articulo actual
     if FindFirst(Dir + QMVerArticulosARTICULO.AsString + '*.*', 0, FileSearch) = 0 then
     begin
        repeat
           Articulo := Copy(ExtractFileName(FileSearch.Name), 0, Length(ExtractFileName(FileSearch.Name)) - Length(ExtractFileExt(FileSearch.Name)));
           LstArticulos.Insert;
           LstArticulos.FieldByName('Imagen').AsString := Dir + FileSearch.Name;
           LstArticulos.FieldByName('Articulo').AsString := Articulo; //ExtractFileName(FileSearch.Name);
           LstArticulos.Post;
        until FindNext(FileSearch) <> 0;
        FindClose(FileSearch);
     end;

     // Buscamos todas las imagenes que tengan el codigo de articulos de proveedor del articulo actual
     // Para hacer esto, buscamos en la carpeta y subcarpetas del codigo del proveedor
     if (BuscarCodProv = 1) then
     begin
        xVerArticulosProv.First;
        while (not xVerArticulosProv.EOF) do
        begin
           Dir := Path + '\' + xVerArticulosProvPROVEEDOR.AsString + '\';
           // Buscamos en carpeta del proveedor
           if FindFirst(Dir + xVerArticulosProvCODIGO_PROVEEDOR.AsString + '*.*', 0, FileSearch) = 0 then
           begin
              repeat
                 Articulo := Copy(ExtractFileName(FileSearch.Name), 0, Length(ExtractFileName(FileSearch.Name)) - Length(ExtractFileExt(FileSearch.Name)));
                 LstArticulos.Insert;
                 LstArticulos.FieldByName('Imagen').AsString := Dir + FileSearch.Name;
                 LstArticulos.FieldByName('Articulo').AsString := Articulo; //ExtractFileName(FileSearch.Name);
                 LstArticulos.Post;
              until FindNext(FileSearch) <> 0;
              FindClose(FileSearch);
           end;

           // Buscamos en subcarpetas del proveedor
           if FindFirst(Dir + '*.*', faDirectory, FileSearch) = 0 then
           begin
              repeat
                 if ((FileSearch.Attr and fadirectory) = fadirectory) then
                 begin // Tambien buscamos imagenes en las subcarpetas del proveedor
                    if (FileSearch.Name <> '.') and (FileSearch.Name <> '..') then
                       RastreaDirProv(Dir + FileSearch.Name + '\');
                 end
              until FindNext(FileSearch) <> 0;
              FindClose(FileSearch);
           end;
           xVerArticulosProv.Next;
        end;
     end;
  end; // END if (xVerArticulosARTICULO.AsString<>'.') and (xVerArticulosARTICULO.AsString<>'*') then
end;

procedure TProDMArticulosImg.RastreaDirProv(Dir: string);
var
  FileSearch : TSearchRec;
  Articulo : string;
begin
  if FindFirst(Dir + xVerArticulosProvCODIGO_PROVEEDOR.AsString + '*.*', 0, FileSearch) = 0 then
  begin
     repeat
        Articulo := Copy(ExtractFileName(FileSearch.Name), 0, Length(ExtractFileName(FileSearch.Name)) - Length(ExtractFileExt(FileSearch.Name)));
        LstArticulos.Insert;
        LstArticulos.FieldByName('Imagen').AsString := Dir + FileSearch.Name;
        LstArticulos.FieldByName('Articulo').AsString := Articulo; // ExtractFileName(FileSearch.Name);
        LstArticulos.Post;
     until FindNext(FileSearch) <> 0;
     FindClose(FileSearch);
  end;
end;

procedure TProDMArticulosImg.LeerIni;
begin
  Path := LeeDatoIni('Articulos', 'Path', ExtractFilePath(Application.Exename));
  BuscarCodProv := LeeDatoIni('Articulos', 'BuscarCodProv', 0);
  ProFMArticulosImg.EFilas.Text := LeeDatoIni('Articulos', 'Filas', '2');
  ProFMArticulosImg.EColumnas.Text := LeeDatoIni('Articulos', 'Columnas', '3');
end;

procedure TProDMArticulosImg.FiltrarArticulo(const Articulo: string);
begin
  QMVerArticulos.Close;
  QMVerArticulos.Params.ByName['ARTICULO'].AsString := Articulo;
  DMMain.FiltraTabla(QMVerArticulos, '11100');
end;

end.
