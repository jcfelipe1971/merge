unit UFMImagenes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPedit, rxPlacemnt, Menus, UTeclas, UControlEdit, UEditPanel,
  ComCtrls, UNavigator, ToolWin, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ExtCtrls, DBCtrls, Buttons, StdCtrls, Mask, rxPicClip, jpeg, ExtDlgs, DB,
  ULFDBCheckBox, ULFDBEdit, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, TFlatCheckBoxUnit, ULFCheckBox,
  ULFLabel, UG2kTBLoc, DbComboBoxValue, ULFDBComboBoxValue, URecibeFicheros, ShellAPI;

type
  TFMImagenes = class(TFPEdit)
     SBImagen: TSpeedButton;
     LblImagen: TLFLabel;
     DBECodigo: TLFDbedit;
     DBETitulo: TLFDbedit;
     OPDImagen: TOpenPictureDialog;
     ScrBImagen: TScrollBox;
     Imagen: TImage;
     AImagenCompleta: TAction;
     PnlDatos: TLFPanel;
     DBERuta: TLFDbedit;
     LFCategoryAction1: TLFCategoryAction;
     AExportarImagenes: TAction;
     AImportarImagenesArticulo: TAction;
     AImportarImagenesModelo: TAction;
     DBCBRepositorio: TLFDBComboBoxValue;
     AMoverABD: TAction;
     AMoverAFichero: TAction;
     AMoverABDImagenes: TAction;
     procedure SBImagenClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure TSFichaShow(Sender: TObject);
     procedure AImagenCompletaExecute(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure AExportarImagenesExecute(Sender: TObject);
     procedure AImportarImagenesArticuloExecute(Sender: TObject);
     procedure AImportarImagenesModeloExecute(Sender: TObject);
     procedure AMoverABDExecute(Sender: TObject);
     procedure AMoverAFicheroExecute(Sender: TObject);
     procedure AMoverABDImagenesExecute(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure DBECodigoChange(Sender: TObject);
     procedure WMDropFiles(var Msg: TWMDropFiles); message WM_DROPFILES;
  private
     { Private declarations }
     procedure AjustaBotones;
  public
     { Public declarations }
     procedure AbrirArchivo(const Filename: string);
     procedure FiltraImagen(Imagen: integer);
  end;

var
  FMImagenes : TFMImagenes;

implementation

uses UDMImagenes, UFormGest, UFMostrarImagen, UDMMain, UUtiles, FileCtrl, UImagenes;

{$R *.dfm}

procedure TFMImagenes.FormCreate(Sender: TObject);
begin
  inherited;
  DragAcceptFiles(Self.Handle, True);

  AbreData(TDMImagenes, DMImagenes);

  NavMain.DataSource := DMImagenes.DSQMImagenes;
  EPMain.DataSource := DMImagenes.DSQMImagenes;
  DBGMain.DataSource := DMImagenes.DSQMImagenes;
  G2kTableLoc.DataSource := DMImagenes.DSQMImagenes;
  CEMainPMEdit.Teclas := DMMain.teclas;

  DBCBRepositorio.Items.Clear;
  DBCBRepositorio.Values.Clear;
  DBCBRepositorio.Items.Add(DMImagenes.DescripcionRepositorio[0]);
  DBCBRepositorio.Values.Add('0');
  DBCBRepositorio.Items.Add(DMImagenes.DescripcionRepositorio[1]);
  DBCBRepositorio.Values.Add('1');
  DBCBRepositorio.Items.Add(DMImagenes.DescripcionRepositorio[2]);
  DBCBRepositorio.Values.Add('2');

  // Asigno Imagenes a SpeedButton
  GetBitmapFromImageList(SBImagen, 1, DMMain.ILMain_Ac, 49);
  GetBitmapFromImageList(SBImagen, 2, DMMain.ILMain_In, 49);
end;

procedure TFMImagenes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMImagenes);
end;

procedure TFMImagenes.SBImagenClick(Sender: TObject);
var
  s : string;
begin
  OPDImagen.InitialDir := LeeDatoIni('FMImagenes_CargarImagen', 'UltimaRuta', GetSpecialFolderPath(CSIDL_MYPICTURES, True));
  if OPDImagen.Execute then
  begin
     EscribeDatoIni('FMImagenes_CargarImagen', 'UltimaRuta', ExtractFilePath(OPDImagen.FileName));

     s := AnsiUpperCase(ExtractFileExt(OPDImagen.FileName)); // Siempre en mayúsculas
     if s = '.JPEG' then
        s := '.JPG'; // Un caso especial
     DMImagenes.QMImagenesFORMATO.AsString := Copy(s, 2, 3); // Elimino el punto

     DMImagenes.QMImagenesRUTA.AsString := OPDImagen.FileName;
     if (Trim(DMImagenes.QMImagenesNOMBRE.AsString) = '') then
        DMImagenes.QMImagenesNOMBRE.AsString := Copy(ExtractFileName(OPDImagen.FileName), 1, Length(ExtractFileName(OPDImagen.FileName)) - Length(ExtractFileExt(OPDImagen.FileName)));

     AbrirArchivo(OPDImagen.Filename);
     if DMImagenes.QMImagenes.State = dsEdit then
        DMImagenes.CargarImagen(OPDImagen.Filename);
  end;
end;

procedure TFMImagenes.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMImagenes.BusquedaCompleja;
end;

procedure TFMImagenes.AbrirArchivo(const Filename: string);
begin
  try
     Imagen.Picture.LoadFromFile(Filename);
  except
     on EInvalidGraphic do
     begin
        Imagen.Picture.Graphic := nil;
        MessageDlg(_('Formato de imagen no aceptado'), mtError, [mbOK], 0);
     end;
     on EFOpenError do
     begin
        Imagen.Picture.Graphic := nil;
     end;
  end;
end;

procedure TFMImagenes.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  RefrescarImagen(Imagen, DMImagenes.QMImagenesCODIGO.AsInteger);
end;

procedure TFMImagenes.NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  DBCBRepositorio.Enabled := True;
  NavMain.EditaControl := DBETitulo;
  DBETitulo.ReadOnly := False;
  DBETitulo.Enabled := True;
  DBETitulo.Color := clWindow;
  DBETitulo.Font.Color := clWindowText;

  if (Button = nbEdit) then
  begin
     // No se permite modificar el repositorio mientras se edita el registro.
     DBCBRepositorio.Enabled := False;

     // No permitimos modificar descripcion de imagenes de sistema.
     if ((StrToInt(DBECodigo.Text)) <= 0) then
     begin
        DBETitulo.ReadOnly := True;
        DBETitulo.Enabled := False;
        DBETitulo.Color := clInfoBk;
        DBETitulo.Font.Color := clGrayText;
        NavMain.EditaControl := nil;
     end;
  end;

  inherited;
end;

procedure TFMImagenes.TSFichaShow(Sender: TObject);
begin
  inherited;
  RefrescarImagen(Imagen, DMImagenes.QMImagenesCODIGO.AsInteger);
end;

procedure TFMImagenes.AImagenCompletaExecute(Sender: TObject);
begin
  inherited;
  MuestraImagen(DMImagenes.QMImagenesCODIGO.AsInteger);
end;

procedure TFMImagenes.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
  RefrescarImagen(Imagen, DMImagenes.QMImagenesCODIGO.AsInteger);
end;

procedure TFMImagenes.FiltraImagen(Imagen: integer);
begin
  DMImagenes.FiltraImagen(Imagen);
end;

procedure TFMImagenes.AExportarImagenesExecute(Sender: TObject);
var
  Directorio : string;
begin
  inherited;

  Directorio := GetSpecialFolderPath(CSIDL_MYPICTURES, False);

  if MySelectDirectory(Directorio, 'FMImagenes-ExportarImagenes') then
     DMImagenes.ExportarImagenesFiltradas(Directorio);
end;

procedure TFMImagenes.AImportarImagenesArticuloExecute(Sender: TObject);
var
  Directorio : string;
begin
  inherited;

  Directorio := GetSpecialFolderPath(CSIDL_MYPICTURES, False);
  if MySelectDirectory(Directorio, 'FMImagenes-ImportarImagenes') then
     DMImagenes.ImportarImagenes('ART', Directorio);
end;

procedure TFMImagenes.AImportarImagenesModeloExecute(Sender: TObject);
var
  Directorio : string;
begin
  inherited;

  Directorio := GetSpecialFolderPath(CSIDL_MYPICTURES, False);
  if MySelectDirectory(Directorio, 'FMImagenes-ImportarImagenesModelo') then
     DMImagenes.ImportarImagenes('MOD', Directorio);
end;

procedure TFMImagenes.AMoverABDExecute(Sender: TObject);
begin
  inherited;
  DMImagenes.CambiaDestinoImagen(DMImagenes.QMImagenesCODIGO.AsInteger, 1);
  DMImagenes.QMImagenes.Refresh;
  AjustaBotones;
end;

procedure TFMImagenes.AMoverAFicheroExecute(Sender: TObject);
begin
  inherited;
  DMImagenes.CambiaDestinoImagen(DMImagenes.QMImagenesCODIGO.AsInteger, 0);
  DMImagenes.QMImagenes.Refresh;
  AjustaBotones;
end;

procedure TFMImagenes.AMoverABDImagenesExecute(Sender: TObject);
begin
  inherited;
  DMImagenes.CambiaDestinoImagen(DMImagenes.QMImagenesCODIGO.AsInteger, 2);
  DMImagenes.QMImagenes.Refresh;
  AjustaBotones;
end;

procedure TFMImagenes.AjustaBotones;
begin
  AMoverABD.Enabled := (DMImagenes.QMImagenesREPOSITORIO.AsInteger <> 1);
  AMoverABDImagenes.Enabled := (DMImagenes.QMImagenesREPOSITORIO.AsInteger <> 2);
  AMoverAFichero.Enabled := (DMImagenes.QMImagenesREPOSITORIO.AsInteger <> 0);
end;

procedure TFMImagenes.FormShow(Sender: TObject);
begin
  inherited;
  AjustaBotones;
end;

procedure TFMImagenes.DBECodigoChange(Sender: TObject);
begin
  inherited;
  AjustaBotones;
end;

procedure TFMImagenes.WMDropFiles(var Msg: TWMDropFiles);
var
  i, id, PrimeraImagenImportada : integer;
  DropPoint : TPoint;
  RecibeFicheros : TRecibeFicheros;
  Ficheros : TStrings;
begin
  inherited;
  PrimeraImagenImportada := 0;
  Ficheros := TStringList.Create;
  RecibeFicheros := TRecibeFicheros.Create(Msg.Drop);
  try
     for i := 0 to Pred(RecibeFicheros.FileCount) do
        Ficheros.Add(RecibeFicheros.Files[i]);

     DropPoint := RecibeFicheros.DropPoint;

     if ConfirmaMensaje(_('Esta seguro de importar los archivos?' + #13#10 + Ficheros.Text)) then
     begin
        for i := 0 to Ficheros.Count - 1 do
        begin
           id := ImportarImagen(Ficheros[i]);
           if (PrimeraImagenImportada = 0) then
              PrimeraImagenImportada := id;
        end;

        Refrescar(DMImagenes.QMImagenes, 'CODIGO', PrimeraImagenImportada);
        RefrescarImagen(Imagen, DMImagenes.QMImagenesCODIGO.AsInteger);
     end;
  finally
     RecibeFicheros.Free;
     Ficheros.Free;
  end;
  Msg.Result := 0;
end;

end.
