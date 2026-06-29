unit ZUFMLonas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, Mask, DBCtrls, ULFDBEdit, ULFLabel,
  UHYDescription, ULFHYDBDescription, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000, TFlatCheckBoxUnit,
  ULFCheckBox, ULFDBCheckBox, ULFEdit;

type
  TZFMLonas = class(TFPEdit)
     LblCodigo: TLFLabel;
     LblDescripcion: TLFLabel;
     DBECodigo: TLFDbedit;
     DBEDescripcion: TLFDbedit;
     LblImagen: TLFLabel;
     DBEFImagen: TLFDBEditFind2000;
     ETituloImagen: TLFEdit;
     ScrBImagen: TScrollBox;
     Imagen: TImage;
     LblMultiplo: TLFLabel;
     DBEMultiplo: TLFDbedit;
     LFLabel1: TLFLabel;
     DBEMultiploSalida: TLFDbedit;
     LFDBTipo: TLFDBCheckBox;
     BCargarImagen: TButton;
     TSLonasTareas: TTabSheet;
     TBLonaTareas: TLFToolBar;
     NavLonaTareas: THYMNavigator;
     DBGTareas: TDBGridFind2000;
     PnlLonaInfo: TLFPanel;
     DBLCodigo: TLFDbedit;
     DBLLonaDesc: TLFDbedit;
     LblSeccion: TLFLabel;
     DBEFSeccion: TLFDBEditFind2000;
     ETitSeccion: TLFEdit;
     BClipboard: TButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBEFImagenChange(Sender: TObject);
     procedure BCargarImagenClick(Sender: TObject);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
     procedure DBGTareasBusqueda(Sender: TObject);
     procedure DBEFSeccionChange(Sender: TObject);
     procedure BClipboardClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ZFMLonas : TZFMLonas;

implementation

uses ZUDMLonas, UFormGest, UDMMain, UEntorno, UDameDato, UImagenes;

{$R *.dfm}

procedure TZFMLonas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TZDMLonas, ZDMLonas);

  NavMain.DataSource := ZDMLonas.DSQMLonas;
  DBGMain.DataSource := ZDMLonas.DSQMLonas;
  RefrescarImagen(Imagen, ZDMLonas.QMLonasIMAGEN.AsInteger);
end;

procedure TZFMLonas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMLonas);
end;

procedure TZFMLonas.DBEFImagenChange(Sender: TObject);
begin
  inherited;
  RefrescarImagen(Imagen, StrToIntDef(DBEFImagen.Text, 0));
  ETituloImagen.Text := DameTituloImagen(StrToIntDef(DBEFImagen.Text, 0));
end;

procedure TZFMLonas.BCargarImagenClick(Sender: TObject);
begin
  inherited;
  ZDMLonas.QMLonasIMAGEN.AsInteger := ImportarImagen('');
end;

procedure TZFMLonas.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  BCargarImagen.Visible := (Button in [nbInsert, nbEdit]);
  BClipboard.Visible := (Button in [nbInsert, nbEdit]);
end;

procedure TZFMLonas.DBGTareasBusqueda(Sender: TObject);
var
  i : integer;
begin
  inherited;
  with TDBGridFind2000(Sender) do
  begin
     PlanBusquedaNum := '';
     PlanBusquedaStr := '';
     if Trim(TablaABuscar) = 'PRO_SYS_TAREAS' then
     begin
        CondicionBusqueda := 'EMPRESA =' + REntorno.EmpresaStr;
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'TAREA';
     end
     else
     if Trim(TablaABuscar) = 'OPE_SECCIONES' then
     begin
        CondicionBusqueda := 'EMPRESA =' + REntorno.EmpresaStr;
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'SECCION';
     end
     else
     if Trim(TablaABuscar) = 'PRO_RECURSOS' then
     begin
        CondicionBusqueda := 'EMPRESA =' + REntorno.EmpresaStr;
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := 'RECURSO';
     end
     else
     begin
        CondicionBusqueda := 'EMPRESA =' + REntorno.EmpresaStr;
        i := Tablas.IndexOf(TablaABuscar);
        if (i >= 0) then
           OrdenadosPor[i] := '';
     end;
  end;
end;

procedure TZFMLonas.DBEFSeccionChange(Sender: TObject);
begin
  inherited;
  ETitSeccion.Text := DameTituloSeccion(DBEFSeccion.Text);
end;

procedure TZFMLonas.BClipboardClick(Sender: TObject);
begin
  inherited;
  ZDMLonas.QMLonasIMAGEN.AsInteger := ImportarImagenDesdeClipboard;
end;

end.
