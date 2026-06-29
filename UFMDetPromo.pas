unit UFMDetPromo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls, StdCtrls, Mask, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ExtCtrls, UEditPanel, Grids, DBGrids,
  UNavigator, Menus, UTeclas, UControlEdit, UFormGest, NsDBGrid, ULFDBEdit,
  ULFPanel, ULFToolBar, ULFLabel;

type
  TFMDetPromo = class(TG2KForm)
     TBMain: TLFToolBar;
     DBETitArticulo: TLFDbedit;
     CETarifasPArticulo: TControlEdit;
     PopupTarifasPArticulo: TPopUpTeclas;
     NavMain: THYMNavigator;
     DBEArticulo: TLFDbedit;
     PMain: TLFPanel;
     LBLArticulo: TLFLabel;
     DBGFDetalle: TDBGridFind2000;
     LBLFamilia: TLFLabel;
     DBEFamilia: TLFDbedit;
     DBETitFamilia: TLFDbedit;
     LBLCliente: TLFLabel;
     DBECliente: TLFDbedit;
     DBETitCliente: TLFDbedit;
     LBLAgrupacion: TLFLabel;
     DBEAgrupacion: TLFDbedit;
     DBETitAgrupacion: TLFDbedit;
     ToolButton1: TToolButton;
     EPMain: THYMEditPanel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBGFDetalleBusqueda(Sender: TObject);
  private
     { Private declarations }
     procedure HazVisible(lbl: TLFLabel; Campo: TDBEdit; Titulo: TDBEdit; compuesto: boolean);
  public
     { Public declarations }
     procedure Filtra(tipo: string; RIG: integer);
  end;

var
  FMDetPromo : TFMDetPromo;

implementation

uses UDMMain, UEntorno, UDMDetPromo;

{$R *.DFM}

procedure TFMDetPromo.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE  
  AbreData(TDMDetPromo, DMDetPromo);
  ControlEdit := CETarifasPArticulo;
end;

procedure TFMDetPromo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMDetPromo);
  Action := caFree;
end;

procedure TFMDetPromo.HazVisible(lbl: TLFLabel; Campo: TDBEdit; Titulo: TDBEdit; compuesto: boolean);
begin
  if not (compuesto) then
  begin
     lbl.Visible := True;
     Campo.Visible := True;
     Titulo.Visible := True;
     lbl.Top := LBLArticulo.Top;
     Campo.Top := DBEArticulo.Top;
     Titulo.Top := DBETitArticulo.Top;
     PMain.Height := 30;
  end
  else
  begin
     lbl.Visible := True;
     Campo.Visible := True;
     Titulo.Visible := True;
     lbl.Top := LBLArticulo.Top + 22;
     Campo.Top := DBEArticulo.Top + 22;
     Titulo.Top := DBETitArticulo.Top + 22;
     PMain.Height := 60;
  end;
end;

procedure TFMDetPromo.Filtra(tipo: string; RIG: integer);
var
  x : integer;
begin
  DMDetPromo.Filtra(tipo, RIG);
  for x := 0 to PMain.ControlCount - 1 do
     PMain.Controls[x].Visible := False;

  if ((tipo = 'PCF') or (tipo = 'PCA')) then
     HazVisible(LBLCliente, DBECliente, DBETitCliente, False)
  else if ((tipo = 'PAF') or (tipo = 'PAA')) then
     HazVisible(LBLAgrupacion, DBEAgrupacion, DBETitAgrupacion, False);

  if ((tipo = 'PCA') or (tipo = 'PAA')) then
     HazVisible(LBLArticulo, DBEArticulo, DBETitArticulo, True)
  else if (tipo = 'PAR') then
     HazVisible(LBLArticulo, DBEArticulo, DBETitArticulo, False);

  if ((tipo = 'PCF') or (tipo = 'PCF') or (tipo = 'PAF')) then
     HazVisible(LBLFamilia, DBEFamilia, DBETitFamilia, True)
  else if (tipo = 'PFA') then
     HazVisible(LBLFamilia, DBEFamilia, DBETitFamilia, False);
end;

procedure TFMDetPromo.DBGFDetalleBusqueda(Sender: TObject);
begin
  DBGFDetalle.CondicionBusqueda := 'FAMILIA<>''' + REntorno.FamSistema + '''';
end;

end.
