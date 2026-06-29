unit UDMGaleriaImagen;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSet, FIBDatabase, UFIBModificados,
  FIBTableDataSet, Controls, ImgList, ComCtrls, jpeg, HYFIBQuery;

type
  TDMGaleriaImagen = class(TDataModule)
     QMGaleria: TFIBTableSet;
     DSQMGaleria: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMGaleriaID: TIntegerField;
     QMGaleriaTITULO: TFIBStringField;
     QMGaleriaImagen: TFIBTableSet;
     DSQMGaleriaImagen: TDataSource;
     QMGaleriaImagenID: TIntegerField;
     QMGaleriaImagenID_GALERIA: TIntegerField;
     QMGaleriaImagenCODIGO: TIntegerField;
     QMGaleriaImagenIMAGEN: TBlobField;
     QMGaleriaImagenNOMBRE: TFIBStringField;
     QMGaleriaImagenFORMATO: TFIBStringField;
     QMGaleriaImagenREPOSITORIO: TIntegerField;
     QMGaleriaImagenRUTA: TFIBStringField;
     QMGaleriaImagenORDEN: TIntegerField;
     ILGaleria: TImageList;
     procedure DataModuleCreate(Sender: TObject);
     procedure QMGaleriaBeforePost(DataSet: TDataSet);
  private
     { Private declarations }
     Tamano: integer;
     // SQLFind: string;
  public
     { Public declarations }
     procedure CargaImageList(Lista: TListView);
     procedure CambiarTamano(Aumentar: boolean);
     procedure AgregarImagen;
     procedure BorraImagen(Codigo: integer);
     procedure PosicionaGaleria(id: integer);
     procedure FiltraGaleria(Filtro: string);
  end;

var
  DMGaleriaImagen : TDMGaleriaImagen;

implementation

uses UDMMain, ExtCtrls, Types, UImagenes;

{$R *.dfm}

procedure TDMGaleriaImagen.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;
  Tamano := 100;

  FiltraGaleria('');
end;

procedure TDMGaleriaImagen.AgregarImagen;
var
  Codigo : integer;
  Q : THYFIBQuery;
begin
  Codigo := ImportarImagen('');

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'INSERT INTO SYS_GALERIA_IMAGEN (ID_GALERIA, ID_IMAGEN) VALUES (?ID_GALERIA, ?ID_IMAGEN)';
        Params.ByName['ID_GALERIA'].AsInteger := QMGaleriaID.AsInteger;
        Params.ByName['ID_IMAGEN'].AsInteger := Codigo;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMGaleriaImagen.BorraImagen(Codigo: integer);
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'DELETE FROM SYS_GALERIA_IMAGEN WHERE ID_GALERIA = ?ID_GALERIA AND ID_IMAGEN = ?ID_IMAGEN';
        Params.ByName['ID_GALERIA'].AsInteger := QMGaleriaID.AsInteger;
        Params.ByName['ID_IMAGEN'].AsInteger := Codigo;
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

procedure TDMGaleriaImagen.CambiarTamano(Aumentar: boolean);
begin
  if (Aumentar) then
     Tamano := Tamano + 50
  else
     Tamano := Tamano - 50;

  if (Tamano < 50) then
     Tamano := 50;

  if (Tamano > 1000) then
     Tamano := 1000;
end;

procedure TDMGaleriaImagen.CargaImageList(Lista: TListView);
var
  Imagen : TImage;
  Item : TListItem;
  RDim : TRect;
begin
  Lista.Clear;
  ILGaleria.Clear;
  ILGaleria.Height := Tamano;
  ILGaleria.Width := Tamano;

  RDim.Left := 0;
  RDim.Top := 0;
  RDim.Right := ILGaleria.Height;
  RDim.Bottom := ILGaleria.Width;

  Imagen := TImage.Create(Self);
  try
     with QMGaleriaImagen do
     begin
        Close;
        Open;
        First;
        while not EOF do
        begin
           Item := Lista.Items.Add;
           Item.Caption := QMGaleriaImagen.FieldByName('NOMBRE').AsString;
           Item.Data := Pointer(QMGaleriaImagen.FieldByName('CODIGO').AsInteger);

           Imagen.Picture := nil;
           RefrescarImagen(Imagen, QMGaleriaImagenCODIGO.AsInteger);
           Imagen.Picture.Bitmap.Canvas.StretchDraw(RDim, Imagen.Picture.Graphic);
           Imagen.Picture.Bitmap.Height := ILGaleria.Height;
           Imagen.Picture.Bitmap.Width := ILGaleria.Width;
           Item.ImageIndex := ILGaleria.Add(Imagen.Picture.Bitmap, nil);

           Next;
        end;
        Close;
     end;
  finally
     Imagen.Free;
  end;
end;

procedure TDMGaleriaImagen.FiltraGaleria(Filtro: string);
begin
  with QMGaleria do
  begin
     Close;
     if (Filtro <> '') then
        SelectSQL.Text := 'SELECT * FROM SYS_GALERIA WHERE ' + Filtro + ' ORDER BY ID'
     else
        SelectSQL.Text := 'SELECT * FROM SYS_GALERIA WHERE ID <> 0 ORDER BY ID';
     Open;
  end;
end;

procedure TDMGaleriaImagen.PosicionaGaleria(id: integer);
begin
  with QMGaleria do
  begin
     DisableControls;
     try
        while ((not EOF) and (QMGaleriaID.AsInteger <> id)) do
           Next;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMGaleriaImagen.QMGaleriaBeforePost(DataSet: TDataSet);
begin
  DMMain.Contador_Gen(QMGaleria, 'CONTA_GALERIA', 'ID');
end;

end.
