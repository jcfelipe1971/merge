unit UFMEscCond;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls, StdCtrls, Mask, DBCtrls, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ExtCtrls, UEditPanel, Grids, DBGrids,
  UNavigator, Menus, UTeclas, UControlEdit, UFormGest, NsDBGrid, ULFDBEdit,
  ULFPanel, ULFToolBar, ULFLabel;

type
  TFMEscCond = class(TG2KForm)
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
     LBLPerfil: TLFLabel;
     DBEPerfil: TLFDbedit;
     DBETitPerfil: TLFDbedit;
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
  private
     { Private declarations }
     procedure HazVisible(lbl: TLFLabel; Campo: TDBEdit; Titulo: TDBEdit; compuesto: boolean);
  public
     { Public declarations }
     procedure Filtra(tipo: string; RIG: integer);
  end;

var
  FMEscCond : TFMEscCond;

implementation

uses UDMMain, UEntorno, UDMEscCond;

{$R *.DFM}

procedure TFMEscCond.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE  
  AbreData(TDMEscCond, DMEscCond);
  ControlEdit := CETarifasPArticulo;
end;

procedure TFMEscCond.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMEscCond);
  Action := caFree;
end;

procedure TFMEscCond.HazVisible(lbl: TLFLabel; Campo: TDBEdit; Titulo: TDBEdit; compuesto: boolean);
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

procedure TFMEscCond.Filtra(tipo: string; RIG: integer);
var
  x : integer;
begin
  DMEscCond.Filtra(tipo, RIG);
  for x := 0 to PMain.ControlCount - 1 do
     PMain.Controls[x].Visible := False;

  if ((tipo = 'CCA') or (tipo = 'CCF')) then
     HazVisible(LBLCliente, DBECliente, DBETitCliente, False)
  else if ((tipo = 'CPE') or (tipo = 'CPA') or (tipo = 'CPF')) then
     HazVisible(LBLPerfil, DBEPerfil, DBETitPerfil, False)
  else if ((tipo = 'CAA') or (tipo = 'CAF') or (tipo = 'CAG')) then
     HazVisible(LBLAgrupacion, DBEAgrupacion, DBETitAgrupacion, False);

  if ((tipo = 'CCA') or (tipo = 'CPA') or (tipo = 'CAA')) then
     HazVisible(LBLArticulo, DBEArticulo, DBETitArticulo, True)
  else if (tipo = 'CAR') then
     HazVisible(LBLArticulo, DBEArticulo, DBETitArticulo, False);

  if ((tipo = 'CCF') or (tipo = 'CPF') or (tipo = 'CAF')) then
     HazVisible(LBLFamilia, DBEFamilia, DBETitFamilia, True)
  else if (tipo = 'CFA') then
     HazVisible(LBLFamilia, DBEFamilia, DBETitFamilia, False);

  //  PMain.Height := 30;
end;

end.
