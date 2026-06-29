unit UFMGruposTextos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, Menus, UTeclas, UControlEdit, UEditPanel,
  ComCtrls, UNavigator, ToolWin, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ExtCtrls, UFormGest, StdCtrls, Mask, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFDBEdit, ULFLabel, UG2kTBLoc;

type
  TFMGruposTextos = class(TFPEdit)
     TSIdioma: TTabSheet;
     LBLGrupo: TLFLabel;
     LTitulo: TLFLabel;
     DBEGrupo: TLFDbedit;
     DBENota: TLFDbedit;
     PEditIdioma: TLFPanel;
     TBIdioma: TLFToolBar;
     NavIdioma: THYMNavigator;
     DBGFIdioma: TDBGridFind2000;
     CEIdioma: TControlEdit;
     CEIdiomaPMEdit: TPopUpTeclas;
     PInfoMaestro: TLFPanel;
     DBEInfoMaestro: TLFDbedit;
     LComentario: TLFLabel;
     DBETexto: TLFDbedit;
     ToolButton1: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TSIdiomaShow(Sender: TObject);
     procedure DBGFIdiomaBusqueda(Sender: TObject);
     procedure TSFichaShow(Sender: TObject);
     procedure DBGFIdiomaEnter(Sender: TObject);
     procedure NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMGruposTextos : TFMGruposTextos;

implementation

{$R *.dfm}

uses UDMGruposTextos, UDMMain;

procedure TFMGruposTextos.FormCreate(Sender: TObject);
begin
  inherited;

  AbreData(TDMGruposTextos, DMGruposTextos);
  NavMain.DataSource := DMGruposTextos.DSGrupos;
  DBGMain.DataSource := DMGruposTextos.DSGrupos;
  NavIdioma.DataSource := DMGruposTextos.DSQMGruposIdiomas;
  DBGFIdioma.DataSource := DMGruposTextos.DSQMGruposIdiomas;
  ControlEdit := CEMain;
  PCMain.ActivePage := TSFicha;
  NavMain.EditaControl := DBENota;
  DBEGrupo.Enabled := False;
  DBEGrupo.Color := clInfoBk;
  DBEGrupo.Font.Color := clGrayText;
end;

procedure TFMGruposTextos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMGruposTextos);
end;

procedure TFMGruposTextos.TSIdiomaShow(Sender: TObject);
begin
  DMGruposTextos.ActivaFichaIdioma;
  ControlEdit := CEIdioma;
end;

procedure TFMGruposTextos.DBGFIdiomaBusqueda(Sender: TObject);
begin
  if Pos('SYS_IDIOMAS', Trim(DBGFIdioma.TablaABuscar)) > 0 then
  begin
     DBGFIdioma.CondicionBusqueda := 'DEFECTO <> 1';
  end;
end;

procedure TFMGruposTextos.TSFichaShow(Sender: TObject);
begin
  inherited;
  ControlEdit := CEMain;
end;

procedure TFMGruposTextos.DBGFIdiomaEnter(Sender: TObject);
begin
  inherited;
  if (ControlEdit <> CEIdioma) then
     ControlEdit := CEIdioma;
end;

procedure TFMGruposTextos.NavMainClickBefore(Sender: TObject; Button: TNavigateBtn; var Continua: boolean);
begin
  inherited;
  if Button = nbInsert then
  begin
     NavMain.EditaControl := DBEGrupo;
     DBEGrupo.Enabled := True;
     DBEGrupo.Color := clWindow;
     DBEGrupo.Font.Color := clWindowText;
  end
  else
  begin
     NavMain.EditaControl := DBENota;
     DBEGrupo.Enabled := False;
     DBEGrupo.Color := clInfoBk;
     DBEGrupo.Font.Color := clGrayText;
  end;
end;

procedure TFMGruposTextos.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMGruposTextos.BusquedaCompleja;
  Continua := False;
end;

procedure TFMGruposTextos.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

end.
