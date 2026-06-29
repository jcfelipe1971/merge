unit UProFMTareas;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls,
  UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask,
  DBCtrls, NsDBGrid, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFDBEdit, TFlatCheckBoxUnit,
  ULFCheckBox, ULFDBCheckBox, UG2kTBLoc, UHYDescription,
  ULFHYDBDescription, UFIBDBEditfind, ULFFIBDBEditFind, ULFLabel, ULFEdit,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000;

type
  TProFMTareas = class(TFPEdit)
     LTarea: TLFLabel;
     DBETarea: TLFDbedit;
     LTitulo: TLFLabel;
     DBETitulo: TLFDbedit;
     LFDBCBAbsoluto: TLFDBCheckBox;
     LFCategoryAction1: TLFCategoryAction;
     AlstTareasCodBar: TAction;
     LFase: TLFLabel;
     LFDBEFase: TLFFibDBEditFind;
     DescFase: TLFHYDBDescription;
     LCentroTrabajo: TLFLabel;
     EFCentroTrab: TLFDBEditFind2000;
     ECentroTrabTitulo: TLFEdit;
     TSReparacion: TTabSheet;
     TBReparacion: TLFToolBar;
     PNLReparacionCab: TLFPanel;
     LFLabel1: TLFLabel;
     DBERepTarea: TLFDbedit;
     DBERepTitulo: TLFDbedit;
     DBGTareas: TDBGridFind2000;
     NavTareas: THYMNavigator;
     TBSep1: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure ALstCfgTareadCodBarrasExecute(Sender: TObject);
     procedure LFCategoryAction2Execute(Sender: TObject);
     procedure AlstTareasCodBarExecute(Sender: TObject);
     procedure LFDBEFaseChange(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure EFCentroTrabChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  ProFMTareas : TProFMTareas;

implementation

uses UProDMTareas, UFormGest, UDMMain, UFMListconfig, UDMListados, UProFMLstCodBarras;

{$R *.dfm}

procedure TProFMTareas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TProDMTareas, ProDMTareas);
  NavMain.DataSource := ProDMTareas.DSQMProSysTareas;
  DBGMain.DataSource := ProDMTareas.DSQMProSysTareas;
  G2KTableLoc.DataSource := ProDMTareas.DSQMProSysTareas;
end;

procedure TProFMTareas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ProDMTareas);
end;

procedure TProFMTareas.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  ProDMTareas.BusquedaCompleja;
end;

procedure TProFMTareas.ALstCfgTareadCodBarrasExecute(Sender: TObject);
var
  Formato, Cabecera, Copias, Pijama : integer;
begin
  inherited;
  TFMListConfig.Create(Self).Muestra(8039, Formato, Cabecera, Copias, Pijama, '', ProDMTareas.frProTareas);
end;

procedure TProFMTareas.LFCategoryAction2Execute(Sender: TObject);
var
  str : string;
begin
  inherited;
  AbreData(TDMListados, DMListados);
  str := '';
  DMListados.Imprimir(8039, 0, '', str, ProDMTareas.frProTareas, nil);
  CierraData(DMListados);
end;

procedure TProFMTareas.AlstTareasCodBarExecute(Sender: TObject);
begin
  inherited;
  AbreForm(TProFMLstCodBarras, ProFMLstCodBarras, Sender);
  ProFMLstCodBarras.PCMain.ActivePage := ProFMLstCodBarras.TSTarea;
end;

procedure TProFMTareas.LFDBEFaseChange(Sender: TObject);
begin
  inherited;
  DescFase.ActualizaDatos('FASE', LFDBEFase.Text);
end;

procedure TProFMTareas.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TProFMTareas.EFCentroTrabChange(Sender: TObject);
begin
  inherited;
  ECentroTrabTitulo.Text := ProDMTareas.DameCenTrabTitulo(EFCentroTrab.Text);
end;

end.
