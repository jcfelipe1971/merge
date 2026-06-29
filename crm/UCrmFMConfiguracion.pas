unit UCrmFMConfiguracion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, DBGrids, {UHYDBGrid,} ComCtrls, UEditPanel, UNavigator,
  ToolWin, {UControlEdit,} Menus, {UTeclas,} StdCtrls, DB, UFormGest, {NsDBGrid,}
  rxPlacemnt, URecursos, ULFFormStorage, ActnList, ULFActionList, ULFToolBar,
  ULFPanel, ULFPageControl, Math, UG2kTBLoc, {TFlatCheckBoxUnit,} ULFCheckBox,
  ULFDBCheckBox, ULFLabel, TFlatCheckBoxUnit, DBCtrls, Mask, ULFDBEdit,
  ULFDBMemo, ExtDlgs;

type
  TCrmFMConfiguracion = class(TG2KForm)
     TBConf: TLFToolBar;
     PCMain: TLFPanel;
     TButtSalir: TToolButton;
     LFPCMain: TLFPageControl;
     TSCrm: TTabSheet;
     LTipoLetra: TLFLabel;
     LTamanoLetra: TLFLabel;
     FontSize: TLFDbedit;
     FontName: TDBComboBox;
     LFCBAccion: TLFDBCheckBox;
     LTipoAccionPorDefecto: TLFLabel;
     CBTAccion: TDBComboBox;
     NavMain: THYMNavigator;
     ToolButton1: TToolButton;
     CBAvisos: TLFDBCheckBox;
     TSHTMLCliente: TTabSheet;
     LFDBHTMLCliente: TLFDBMemo;
     TBAsignarImagen: TToolButton;
     OPImagen: TOpenPictureDialog;
     TSHTMLContacto: TTabSheet;
     TSHTMLContactos: TTabSheet;
     TSHTMLEmpresa: TTabSheet;
     LFDBHTMLContacto: TLFDBMemo;
     LFDBHTMLContactos: TLFDBMemo;
     LFDBHTMLEmpresa: TLFDBMemo;
     TSTPV: TTabSheet;
     TSConfiguracion: TTabSheet;
     GBImpresora: TGroupBox;
     LFDIPImpresora: TLFDbedit;
     LFDNombreImpresora: TLFDbedit;
     LFNombreImpresora: TLFLabel;
     LFIP: TLFLabel;
     LNombre: TLFLabel;
     LDireccion: TLFLabel;
     LCodigoPostal: TLFLabel;
     LCiudad: TLFLabel;
     LProvincia: TLFLabel;
     LPais: TLFLabel;
     LTelefono: TLFLabel;
     LEmail: TLFLabel;
     LWeb: TLFLabel;
     LFDBNombre: TLFDbedit;
     LFDDireccion: TLFDbedit;
     LFDbCP: TLFDbedit;
     LFDbCiudad: TLFDbedit;
     LFDbProvincia: TLFDbedit;
     LFDbPais: TLFDbedit;
     LFDbTelefono: TLFDbedit;
     LFDbEmail: TLFDbedit;
     LFDbWeb: TLFDbedit;
     LFDbFax: TLFDbedit;
     LFax: TLFLabel;
     LFImatge: TLFPanel;
     CRMImatge: TImage;
     LFDBDireccionAm: TLFDBMemo;
     procedure TButtSalirClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TBAsignarImagenClick(Sender: TObject);
     procedure TSConfiguracionShow(Sender: TObject);
     procedure LFPCMainChange(Sender: TObject);
  private
     { Private declarations }
     procedure GetFontNames;
     procedure CargarTipoAcciones;
     procedure CargarImagenDeStream(Imagen: TImage; Stream: TStream; Formato: string);
  public
     { Public declarations }
     procedure AbrirArchivo(const Filename: string);
  end;

var
  CrmFMConfiguracion : TCrmFMConfiguracion;

implementation

uses UCrmDMConfiguracion, UDMMain, jpeg, GIFImage, GraphicEx;

{$R *.dfm}

procedure TCrmFMConfiguracion.TButtSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TCrmFMConfiguracion.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TCrmDMConfiguracion, CrmDMConfiguracion);
  LFPCMain.ActivePage := TSConfiguracion;

  GetFontNames;
  CargarTipoAcciones;
end;

procedure TCrmFMConfiguracion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  // sfg.albert - Configuro les conversions de booleà a string
  SetLength(TrueBoolStrs, 1);
  SetLength(FalseBoolStrs, 1);
  TrueBoolStrs[0] := '1';
  FalseBoolStrs[0] := '0';

  Action := caFree;
  CierraData(CrmDMConfiguracion);
end;

function EnumFontsProc(var LogFont: TLogFont; var TextMetric: TTextMetric; FontType: integer; Data: Pointer): integer; stdcall;
begin
  TStrings(Data).Add(LogFont.lfFaceName);
  Result := 1;
end;

procedure TCrmFMConfiguracion.GetFontNames;
var
  DC : HDC;
begin
  DC := GetDC(0);
  EnumFonts(DC, nil, @EnumFontsProc, Pointer(FontName.Items));
  ReleaseDC(0, DC);
  FontName.Sorted := True;
end;

// sfg.albert - Càrrega dels tipus d'accions al combo
procedure TCrmFMConfiguracion.CargarTipoAcciones;
begin
  with CrmDMConfiguracion.xTAcciones do
  begin
     Open;
     First;
     while not (EOF) do
     begin
        CBTAccion.Items.Add(CrmDMConfiguracion.xTAcciones.FieldByName('ACCION').AsString);
        Next;
     end;
  end;
end;

procedure TCrmFMConfiguracion.TBAsignarImagenClick(Sender: TObject);
var
  s : string;
begin
  inherited;
  with OPImagen do
  begin
     Execute;
     if (FileName <> '') then
     begin
        s := AnsiUpperCase(ExtractFileExt(FileName)); // Siempre en mayúsculas
        if s = '.JPEG' then
           s := '.JPG'; // Un caso especial

        AbrirArchivo(FileName);
        CRMDMConfiguracion.CargarImagen(FileName, Copy(s, 2, 3));
     end;
  end;
end;

procedure TCrmFMConfiguracion.AbrirArchivo(const Filename: string);
begin
  try
     CRMImatge.Picture.LoadFromFile(Filename);
  except
     on EInvalidGraphic do
     begin
        CRMImatge.Picture.Graphic := nil;
        MessageDlg(_('Formato de imagen no aceptado'), mtError, [mbOK], 0);
     end;
     on EFOpenError do
     begin
        CRMImatge.Picture.Graphic := nil;
     end;
  end;
end;

procedure TCrmFMConfiguracion.CargarImagenDeStream(Imagen: TImage; Stream: TStream; Formato: string);
var
  BMP : TBitMap;
  JPG : TJpegImage;
  GIF : TGIFImage;
  PNG : TPNGGraphic;
begin
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
  end;
  if Formato = 'PNG' then
  begin
     PNG := TPNGGraphic.Create;
     try
        PNG.LoadFromStream(Stream);
        Imagen.Picture.Assign(PNG);
     finally
        PNG.Free;
     end;
  end;
end;

procedure TCrmFMConfiguracion.TSConfiguracionShow(Sender: TObject);
var
  Stream : TStream;
begin
  { TODO : Hacer que esta imagen sea parte de SYS_IMAGENES }

  // DMMain.RefrescarImagen(CRMImatge, CRMDMConfiguracion.QMCrmConfig);

  with CrmDMConfiguracion.QMCRMConfig do
  begin
     if (FieldByName('FORMATO').AsString = 'JPG') then
     begin
        Stream := CreateBlobStream(FieldByName('IMAGEN'), bmRead);
        try
           CargarImagenDeStream(CRMImatge, Stream, FieldByName('FORMATO').AsString);
        finally
           Stream.Free;
        end;
     end;
  end;
end;

procedure TCrmFMConfiguracion.LFPCMainChange(Sender: TObject);
begin
  if (LFPCMain.ActivePage = TSTPV) then
     Navmain.EditaControl := LFDIPImpresora
  else if (LFPCMain.ActivePage = TSConfiguracion) then
     Navmain.EditaControl := LFDBNombre
  else if (LFPCMain.ActivePage = TSCrm) then
     Navmain.EditaControl := FontName
  else if (LFPCMain.ActivePage = TSHTMLCliente) then
     Navmain.EditaControl := LFDBHTMLCliente
  else if (LFPCMain.ActivePage = TSHTMLContacto) then
     Navmain.EditaControl := LFDBHTMLContacto
  else if (LFPCMain.ActivePage = TSHTMLContactos) then
     Navmain.EditaControl := LFDBHTMLContactos
  else if (LFPCMain.ActivePage = TSHTMLEmpresa) then
     Navmain.EditaControl := LFDBHTMLEmpresa;
end;

end.
