unit ZUFMFichaTecArt;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls,
  UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls,
  DBCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada, Mask,
  UHYDescription, ExtDlgs, Buttons, rxPlacemnt, NsDBGrid, ULFFormStorage,
  ActnList, ULFActionList, ULFPageControl, ULFToolBar, ULFPanel, ULFDBMemo,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, ULFDBEditFind2000,
  ULFDBEdit, ULFEdit, rxToolEdit, RXDBCtrl, ULFDBDateEdit, UG2kTBLoc,
  ULFLabel, OleCtnrs, ShellApi, ULFHYDBDescription, ULFFIBDBEditFind;

type
  TZFMFichaTecArt = class(TFPEdit)
     LAvance: TLFLabel;
     LblEtiquetas_por_rollo: TLFLabel;
     LblDiametroInterior: TLFLabel;
     LblDiametro_Exterior: TLFLabel;
     LblEtiquetas_al_ancho: TLFLabel;
     LAncho: TLFLabel;
     LblTroquel: TLFLabel;
     DBEEtiquetas_por_rollo: TLFDbedit;
     DBEDiametro_Exterior: TLFDbedit;
     DBEEtiquetas_al_ancho: TLFDbedit;
     DBEFTroqueles: TLFDBEditFind2000;
     DBEDiametro_Interior: TLFDbedit;
     LFDBPUBLICACION_WEB: TLFDBCheckBox;
     LArticulo: TLFLabel;
     DBEArticulo: TLFDbedit;
     LDescripcionArticulo: TLFLabel;
     TSDibujo: TTabSheet;
     TBArticuloTextos: TLFToolBar;
     NavArticulosTextos: THYMNavigator;
     DBGFArticuloTextos: TDBGridFind2000;
     LFotograbado: TLFLabel;
     DBEFotograbado: TLFDbedit;
     LObservacionesEtiqueta: TLFLabel;
     LEtiqxCaja: TLFLabel;
     DBEEtiqetasPorCaja: TLFDbedit;
     DBCBReimpresion: TLFDBCheckBox;
     DBMNotas: TLFDBMemo;
     OPPathImagen: TOpenPictureDialog;
     TSNotas: TTabSheet;
     TBNotas: TLFToolBar;
     NavNotas: THYMNavigator;
     PInfo: TLFPanel;
     ToolButton1: TToolButton;
     DBENotasArticulo: TLFDbedit;
     LNotasArticulo: TLFLabel;
     PNLDibujoArticulo: TLFPanel;
     LDibujoArticulo: TLFLabel;
     DBEDibujoArticulo: TLFDbedit;
     ToolButton2: TToolButton;
     PNotas: TLFPanel;
     DBMMNotas: TLFDBMemo;
     CENotas: TControlEdit;
     CENotasPMEdit: TPopUpTeclas;
     CEDibujo: TControlEdit;
     CEDibujoPMEdit: TPopUpTeclas;
     DBEAnchoFilmVerif: TLFDbedit;
     LFotograbadoEst: TLFLabel;
     TBDuplicar: TToolButton;
     PDuplicar: TLFPanel;
     SBDuplicar: TSpeedButton;
     EArtNuevo: TLFEdit;
     LCodNuevoArticulo: TLFLabel;
     DBDEFechaImagenWeb: TLFDBDateEdit;
     TbuttArticulo: TToolButton;
     TBAbrirPDF: TToolButton;
     LFechaWeb: TLFLabel;
     CEImagen: TControlEdit;
     LSHAncho: TLFLabel;
     LSVAvance: TLFLabel;
     LFLabel6: TLFLabel;
     DBEFTroqueles2: TLFDBEditFind2000;
     LFLabel1: TLFLabel;
     DBEFModeloCaja: TLFDBEditFind2000;
     EDescripcionModeloCaja: TLFEdit;
     EDescripcionBobinado: TLFEdit;
     LFLabel7: TLFLabel;
     DBEFBobinado: TLFDBEditFind2000;
     DBCBRELIEVE_EN_SECO: TLFDBCheckBox;
     DBEBandaEstamp: TLFDbedit;
     LFBandaEstamp: TLFLabel;
     LFAvanceEstamp: TLFLabel;
     DBEAvanceEstamp: TLFDbedit;
     DBEAncho: TLFDbedit;
     DBESHAncho: TLFDbedit;
     DBEAvance: TLFDbedit;
     DBESVAvance: TLFDbedit;
     LAncho2: TLFLabel;
     DBEAncho_2: TLFDbedit;
     LSHAncho2: TLFLabel;
     DBESHAncho_2: TLFDbedit;
     LAvance2: TLFLabel;
     DBEAvance_2: TLFDbedit;
     LSVAvance2: TLFLabel;
     DBESVAvance_2: TLFDbedit;
     LEscandallo: TLFLabel;
     DBEEscandallo: TLFDbedit;
     DBETituloArticulo: TLFDbedit;
     LForma: TLFLabel;
     DBESVAvanceFORMA: TLFDbedit;
     LZ: TLFLabel;
     DBESVAvancePOS_Z: TLFDbedit;
     LForma2: TLFLabel;
     DBESVAvanceFORMA_2: TLFDbedit;
     LZ2: TLFLabel;
     DBESVAvancePOS_Z_2: TLFDbedit;
     SBAFiltraArticulo: TSpeedButton;
     SBAFiltraEscandallo: TSpeedButton;
     DBGFMateriales: TDBGridFind2000;
     DBGFTareas: TDBGridFind2000;
     DBGFColores: TDBGridFind2000;
     CEImagenPMEdit: TPopUpTeclas;
     CEImagenMifirst: TMenuItem;
     CEImagenMiprior: TMenuItem;
     CEImagenMinext: TMenuItem;
     CEImagenMilast: TMenuItem;
     CEImagenMiinsert: TMenuItem;
     CEImagenMidelete: TMenuItem;
     CEImagenMiedit: TMenuItem;
     CEImagenMipost: TMenuItem;
     CEImagenMicancel: TMenuItem;
     CEImagenMirefresh: TMenuItem;
     NavFichaTecColores: THYMNavigator;
     PNLDetalle: TLFPanel;
     TBDetalle: TLFToolBar;
     PNLEscandallo: TLFPanel;
     procedure FormCreate(Sender: TObject);
     procedure DBGFArticuloTextosBusqueda(Sender: TObject);
     procedure TbuttCompClick(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure TBDuplicarClick(Sender: TObject);
     procedure SBDuplicarClick(Sender: TObject);
     procedure TbuttArticuloClick(Sender: TObject);
     procedure TBAbrirPDFClick(Sender: TObject);
     procedure DBEFModeloCajaChange(Sender: TObject);
     procedure DBEFBobinadoChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure SBAFiltraArticuloDblClick(Sender: TObject);
     procedure SBAFiltraEscandalloDblClick(Sender: TObject);
     procedure DBGFColoresDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure FiltraArticulos(Filtro: string);
  end;

var
  ZFMFichaTecArt : TZFMFichaTecArt;

implementation

uses ZUDMFichaTecArt, UFormGest, UDMMain, UFMain, UEntorno, UUtiles;

{$R *.dfm}

procedure TZFMFichaTecArt.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TZDMFichaTecArt, ZDMFichaTecArt);

  NavMain.DataSource := ZDMFichaTecArt.DSQMFichaTecArt;
  EPMain.DataSource := ZDMFichaTecArt.DSQMFichaTecArt;
  DBGMain.DataSource := ZDMFichaTecArt.DSQMFichaTecArt;
  G2kTableLoc.DataSource := ZDMFichaTecArt.DSQMFichaTecArt;

  NavArticulosTextos.DataSource := ZDMFichaTecArt.DSQMArticuloTextos;
  DBGFArticuloTextos.DataSource := ZDMFichaTecArt.DSQMArticuloTextos;

  SolapaControles(SBAFiltraArticulo, DBEArticulo);
  DBEArticulo.Color := REntorno.ColorEnlaceActivo;

  SolapaControles(SBAFiltraEscandallo, DBEEscandallo);
  DBEEscandallo.Color := REntorno.ColorEnlaceActivo;

  // Asigno Imagenes a Botones
  GetBitmapFromImageList(SBDuplicar, 1, DMMain.ILMain_Ac, 37);
end;

procedure TZFMFichaTecArt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMFichaTecArt);
end;

procedure TZFMFichaTecArt.DBGFArticuloTextosBusqueda(Sender: TObject);
begin
  inherited;
  if DBGFArticuloTextos.SelectedField.FieldName = 'CODIGO_COLOR' then
     DBGFArticuloTextos.CondicionBusqueda := 'Tipo_Aux = ''COL''';
  if DBGFArticuloTextos.SelectedField.FieldName = 'CODIGO_ANILOX' then
     DBGFArticuloTextos.CondicionBusqueda := 'Tipo_Aux = ''ANI''';
end;

procedure TZFMFichaTecArt.TbuttCompClick(Sender: TObject);
begin
  inherited;
  FMain.MuestraInfoTercero(ZDMFichaTecArt.xClientesTERCERO.AsInteger);
end;

procedure TZFMFichaTecArt.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ZDMFichaTecArt.BusquedaCompleja;
end;

procedure TZFMFichaTecArt.TBDuplicarClick(Sender: TObject);
begin
  inherited;
  TToolButton(Sender).Down := not TToolButton(Sender).Down;
  PDuplicar.Visible := TToolButton(Sender).Down;
end;

procedure TZFMFichaTecArt.SBDuplicarClick(Sender: TObject);
begin
  inherited;
  ZDMFichaTecArt.DuplicarArticulo(EArtNuevo.Text);
  TBDuplicar.Down := False;
  PDuplicar.Visible := False;
end;

procedure TZFMFichaTecArt.TbuttArticuloClick(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AArticulos, 'Articulo = ''' +
     DBEArticulo.Text + ''' and Empresa = ' +
     IntToStr(REntorno.EMPRESA) + ' and Ejercicio =' +
     IntToStr(REntorno.EJERCICIO) + ' and Canal=' +
     IntToStr(REntorno.CANAL));
end;

procedure TZFMFichaTecArt.FiltraArticulos(Filtro: string);
begin
  if (Filtro <> '') then
  begin
     with ZDMFichaTecArt.QMFichaTecArt do
     begin
        Close;
        SelectSQL.Clear;
        SelectSQL.Add(' SELECT * FROM VER_ART_ARTICULOS_FICHA_TECNICA ');
        SelectSQL.Add(' WHERE ' + Filtro);
        SelectSQL.Add(' ORDER BY ARTICULO, EMPRESA');
        Open;
     end;
  end;
end;

procedure TZFMFichaTecArt.TBAbrirPDFClick(Sender: TObject);
var
  Ruta : string;
begin
  inherited;
  Ruta := Trim(ZDMFichaTecArt.QMConstantesPATH_DOCUMENTOS.AsString);
  if (Ruta <> '') then
  begin
     // Creamos ruta completa con codigo de articulo
     Ruta := Ruta + '\' + ZDMFichaTecArt.QMFichaTecArtARTICULO.AsString + '.pdf';
     // ShellExecute(ZFMFichaTecArt.Handle, nil, PChar(ruta), '', '', SW_SHOWNORMAL);
     DMMain.AbrirArchivo(Ruta);
  end;
end;

procedure TZFMFichaTecArt.DBEFModeloCajaChange(Sender: TObject);
begin
  inherited;
  EDescripcionModeloCaja.Text := ZDMFichaTecArt.DameTituloModeloCaja(DBEFModeloCaja.Text);
end;

procedure TZFMFichaTecArt.DBEFBobinadoChange(Sender: TObject);
begin
  inherited;
  EDescripcionBobinado.Text := ZDMFichaTecArt.DameTituloBobinado(DBEFBobinado.Text);
end;

procedure TZFMFichaTecArt.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TZFMFichaTecArt.SBAFiltraArticuloDblClick(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AArticulos, format('ARTICULO = ''%s''', [ZDMFichaTecArt.QMFichaTecArtARTICULO.AsString]));
end;

procedure TZFMFichaTecArt.SBAFiltraEscandalloDblClick(Sender: TObject);
begin
  inherited;
  FMain.EjecutaAccion(FMain.AProEscandalloSF, format('ESCANDALLO = ''%s''', [ZDMFichaTecArt.QMFichaTecArtESCANDALLO.AsString]));
end;

procedure TZFMFichaTecArt.DBGFColoresDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     if (UpperCase(Column.FieldName) = 'COLOR_DECIMAL') then
     begin
        Canvas.Brush.Color := Column.Field.DataSet.FieldByName('COLOR_DECIMAL').AsInteger;
        Canvas.Font.Color := Column.Field.DataSet.FieldByName('COLOR_DECIMAL').AsInteger;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

end.
