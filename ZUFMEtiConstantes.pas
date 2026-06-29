unit ZUFMEtiConstantes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, DBGrids, UHYDBGrid, ComCtrls, UEditPanel, UNavigator,
  ToolWin, UControlEdit, Menus, UTeclas, StdCtrls, DB, UFormGest, NsDBGrid,
  rxPlacemnt, URecursos, ULFFormStorage, ActnList, ULFActionList, ULFToolBar,
  ULFPanel, ULFPageControl, Math, UG2kTBLoc, TFlatCheckBoxUnit, ULFCheckBox,
  ULFDBCheckBox, ULFLabel, ULFEdit, Mask, DBCtrls, ULFDBEdit,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFDBEditFind2000,
  ULFDBMemo, UHYDirectoryDialog, UFPEditSimple;

type
  TZFMEtiConstantes = class(TFPEditSimple)
     PCMain: TLFPanel;
     LFPanelGen: TLFPanel;
     PNLMain: TLFPanel;
     LFLongitudBobina: TLFLabel;
     LFDLongitudBobina: TLFDbedit;
     LFMlCambioBobina: TLFLabel;
     LFDMLCambioBobina: TLFDbedit;
     LFDHoCambioBobina: TLFDbedit;
     LFLHOCambioBobinas: TLFLabel;
     LTareaImpresion: TLFLabel;
     LTareaPreparacion: TLFLabel;
     LTareaPolimeros: TLFLabel;
     LTareaBobinas: TLFLabel;
     LFDBETareaImp: TLFDBEditFind2000;
     LFDBETareaBob: TLFDBEditFind2000;
     LFDBETareaPol: TLFDBEditFind2000;
     LFDBETareaPreparacion: TLFDBEditFind2000;
     LFPageControl1: TLFPageControl;
     TSFicha: TTabSheet;
     TSPresupuesto: TTabSheet;
     LFPanel1: TLFPanel;
     LFPath_Documentos: TLFLabel;
     ButPathImagen: TButton;
     EdtNomDirec: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure ButPathImagenClick(Sender: TObject);
     procedure NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure EscribeNuevaRuta(ruta_nueva: string);
  end;

var
  ZFMEtiConstantes : TZFMEtiConstantes;

implementation

uses ZUDMEtiConstantes, UDMMain, UEntorno, UFMain, UUtiles;

{$R *.dfm}

procedure TZFMEtiConstantes.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TZDMEtiConstantes, ZDMEtiConstantes);
end;

procedure TZFMEtiConstantes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMEtiConstantes);
end;

procedure TZFMEtiConstantes.ButPathImagenClick(Sender: TObject);
var
  Directorio : string;
begin
  inherited;
  Directorio := ExcludeTrailingPathDelimiter(ZDMEtiConstantes.QMConstantesPATH_DOCUMENTOS.AsString);
  if MySelectDirectory(Directorio, 'ZFMEtiConstantes') then
     if (Directorio <> '') then
        EdtNomDirec.Text := IncludeTrailingPathDelimiter(Directorio);

  EscribeNuevaRuta(EdtNomDirec.Text);
  ZDMEtiConstantes.QMConstantesPATH_DOCUMENTOS.AsString := EdtNomDirec.Text;
end;

procedure TZFMEtiConstantes.EscribeNuevaRuta(ruta_nueva: string);
begin
  if (ruta_nueva <> '') then
     if not DirectoryExists(ruta_nueva) then
        if not CreateDir(ruta_nueva) then
           raise Exception.Create(Format(_('No puedo crear %s'), [ruta_nueva]));
end;

procedure TZFMEtiConstantes.NavMainClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  ButPathImagen.Enabled := (Button = nbEdit);
end;

end.
