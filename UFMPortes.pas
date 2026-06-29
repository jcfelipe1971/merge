unit UFMPortes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, DBCtrls, Mask,
  Spin, UDBSpin, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  DbComboBoxValue, rxPlacemnt, NsDBGrid, ULFDBEditFind2000, ULFDBCheckBox,
  ULFDBEdit, ULFFormStorage, ActnList, ULFActionList, ULFPageControl,
  ULFToolBar, ULFPanel, TFlatCheckBoxUnit, ULFCheckBox, ULFLabel, UG2kTBLoc;

type
  TFMPortes = class(TFPEdit)
     TSIdiomas: TTabSheet;
     TBIdiomas: TLFToolBar;
     NavIdiomas: THYMNavigator;
     PNIdiomas: TLFPanel;
     DBGFIdiomas: TDBGridFind2000;
     CEIdiomas: TControlEdit;
     CEIdiomasPMEdit: TPopUpTeclas;
     DBETipo: TLFDbedit;
     LBTipoPorte: TLFLabel;
     DBETituloPorte: TLFDbedit;
     LBIVA: TLFLabel;
     DBETitIva: TLFDbedit;
     DBERecIva: TLFDbedit;
     DBETipIva: TLFDbedit;
     DBEFIva: TLFDBEditFind2000;
     LBCtaCompras: TLFLabel;
     LBCtaVentas: TLFLabel;
     LBCtaDevCompras: TLFLabel;
     LBCtaDevVentas: TLFLabel;
     DBEFCompras: TLFDBEditFind2000;
     DBEFVENTAS: TLFDBEditFind2000;
     DBEFDEVCOMPRAS: TLFDBEditFind2000;
     DBEFDEVVENTAS: TLFDBEditFind2000;
     DBETitCompras: TLFDbedit;
     DBETitVentas: TLFDbedit;
     DBETitDevCompras: TLFDbedit;
     DBETitDevVentas: TLFDbedit;
     TSSeries: TTabSheet;
     PNSeries: TLFPanel;
     CESeries: TControlEdit;
     CESeriesPMEdit: TPopUpTeclas;
     PNTitulo: TLFPanel;
     DBETITPortes: TLFDbedit;
     PCSeries: TLFPageControl;
     TSFichaSerie: TTabSheet;
     TSSerieTabla: TTabSheet;
     PNSerie: TLFPanel;
     Label21: TLFLabel;
     Label22: TLFLabel;
     LBCtaDevlC: TLFLabel;
     LbCtaDvnV: TLFLabel;
     Label27: TLFLabel;
     DBEFCtaCompras: TLFDBEditFind2000;
     DBETitCtaCompras: TLFDbedit;
     DBETitCtaVentas: TLFDbedit;
     DBETitCtaDevCompras: TLFDbedit;
     DBETitCtaDevVentas: TLFDbedit;
     DBEFCtaDevVentas: TLFDBEditFind2000;
     DBEFCtaDevCompras: TLFDBEditFind2000;
     DBEFCtaVentas: TLFDBEditFind2000;
     DBETitSerie: TLFDbedit;
     DBEFSerie: TLFDBEditFind2000;
     TBTipoPortes: TLFToolBar;
     PNTipoPortes: TLFPanel;
     DBETitPorte: TLFDbedit;
     DBETipoPorte: TLFDbedit;
     DBGSeries: THYTDBGrid;
     TBSeries: TLFToolBar;
     NavSeries: THYMNavigator;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure TSIdiomasShow(Sender: TObject);
     procedure DBGFIdiomasBusqueda(Sender: TObject);
     procedure NavSeriesClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
     procedure TSSeriesShow(Sender: TObject);
     procedure PCMainChanging(Sender: TObject; var AllowChange: boolean);
     procedure TSFichaShow(Sender: TObject);
     procedure DBEFCuentasVerificacion(Sender: TObject);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
     procedure AjustaCampo(Modo: byte);
  public
     { Public declarations }
  end;

var
  FMPortes : TFMPortes;

implementation

uses UFormGest, UDMMain, UDMPortes, UUtiles;

{$R *.DFM}

procedure TFMPortes.FormCreate(Sender: TObject);
begin
  AbreData(TDMPortes, DMPortes);
  DBGMain.DataSource := DMPortes.DSQMPortes;
  NavMain.DataSource := DMPortes.DSQMPortes;
  PCMain.ActivePage := TSFicha;
  ControlEdit := CEMain;

  // Color campo ID
  ColorCampoID(DBETipo);
end;

procedure TFMPortes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPortes);
end;

procedure TFMPortes.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMPortes.BusquedaCompleja;
  Continua := False;
end;

procedure TFMPortes.TSIdiomasShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEIdiomas;
  DMPortes.AbrirIdioma;
  DBGFIdiomas.SetFocus;
end;

procedure TFMPortes.DBGFIdiomasBusqueda(Sender: TObject);
begin
  inherited;
  if Pos('SYS_IDIOMAS', Trim(DBGFIdiomas.TablaABuscar)) > 0 then
  begin
     DBGFIdiomas.CondicionBusqueda := 'DEFECTO <> 1';
  end;
end;

procedure TFMPortes.NavSeriesClickAfterAdjust(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if Button in [nbEdit] then
     AjustaCampo(1)
  else
     AjustaCampo(0);
end;

procedure TFMPortes.AjustaCampo(Modo: byte);
begin
  with DBEFSerie do
  begin
     if (Modo = 0) then
     begin
        Color := clWindow;
        Font.Color := clWindowText;
        Enabled := True;
        ReadOnly := False;
     end
     else
     begin
        Color := clInfoBk;
        Font.Color := clGrayText;
        Enabled := False;
        ReadOnly := True;
     end;
  end;
end;

procedure TFMPortes.TSSeriesShow(Sender: TObject);
begin
  inherited;
  DMPortes.AbrirSeries;
  ControlEdit := CESeries;
  AjustaCampo(0);
  PCSeries.ActivePage := TSFichaSerie;
end;

procedure TFMPortes.PCMainChanging(Sender: TObject; var AllowChange: boolean);
begin
  inherited;
  case (Sender as TPageControl).ActivePage.PageIndex of
     0: DMPortes.CerrarFicha;           // Ficha
     1: DMPortes.CerrarIdiomas;         // Idiomas
     2: DMPortes.CerrarSerie;          // Series
  end;
end;

procedure TFMPortes.TSFichaShow(Sender: TObject);
begin
  inherited;
  DMPortes.AbrirFicha;
  ControlEdit := CEMain;
end;

procedure TFMPortes.DBEFCuentasVerificacion(Sender: TObject);
begin
  inherited;
  ExpandirCadenaEdit(TLFDBEditFind2000(Sender));
end;

procedure TFMPortes.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

end.
