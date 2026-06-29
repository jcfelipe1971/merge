unit UFMPropagaEstructura;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, Grids, DBGrids, NsDBGrid, UHYDBGrid,
  ULFToolBar, UG2kTBLoc, ComCtrls, ULFPageControl, UEditPanel, UNavigator,
  ToolWin, ExtCtrls, ULFPanel, StdCtrls, ULFLabel, Mask, DBCtrls, ULFDBEdit,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBCheckBox, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ULFDBEditFind2000;

type
  TFMPropagaEstructura = class(TFPEdit)
     CBOrigen: TGroupBox;
     LBLEmpresaO: TLFLabel;
     LBLEjercicioO: TLFLabel;
     LBLCanalO: TLFLabel;
     LBLPlan: TLFLabel;
     DBEEmpresaO: TLFDbedit;
     DBEEjercicioO: TLFDbedit;
     DBECanalO: TLFDbedit;
     DBETitEmpresa0: TLFDbedit;
     DBETitCanalO: TLFDbedit;
     DBETitPlan: TLFDbedit;
     GBDestino: TGroupBox;
     LFLabel1: TLFLabel;
     LFLabel2: TLFLabel;
     LFLabel3: TLFLabel;
     DBEEmpresaD: TLFDbedit;
     DBETitEmpresaD: TLFDbedit;
     DBETitCanalD: TLFDbedit;
     CHKPlantillas: TLFDBCheckBox;
     CHKPlantillasCuentas: TLFDBCheckBox;
     EFPlan: TLFDBEditFind2000;
     EFEjercicioD: TLFDBEditFind2000;
     EFCanalD: TLFDBEditFind2000;
     APropActualConserva: TAction;
     LFCategoryAction1: TLFCategoryAction;
     APropActualNoConserva: TAction;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EFCanalDBusqueda(Sender: TObject);
     procedure APropActualConservaExecute(Sender: TObject);
     procedure APropActualNoConservaExecute(Sender: TObject);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
     procedure CHKPlantillasClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMPropagaEstructura : TFMPropagaEstructura;

implementation

{$R *.dfm}

uses
  UDMMain, UDMPropagaEstructura, UFormGest;

procedure TFMPropagaEstructura.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMPropagaEstructura, DMPropagaEstructura);
  NavMain.DataSource := DMPropagaEstructura.DSQMPropagacion;
  DBGMain.DataSource := DMPropagaEstructura.DSQMPropagacion;
end;

procedure TFMPropagaEstructura.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMPropagaEstructura);
end;

procedure TFMPropagaEstructura.EFCanalDBusqueda(Sender: TObject);
begin
  inherited;
  EFCanalD.CondicionBusqueda := 'EJERCICIO=' + EFEjercicioD.Text;
end;

procedure TFMPropagaEstructura.APropActualConservaExecute(Sender: TObject);
begin
  inherited;
  DMPropagaEstructura.Propagar(0);
end;

procedure TFMPropagaEstructura.APropActualNoConservaExecute(Sender: TObject);
begin
  inherited;
  DMPropagaEstructura.Propagar(1);
end;

procedure TFMPropagaEstructura.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  // Bloqueamos los campos cuando se updatea, ya que pertenecen a la clave Primaria
  if Button = nbEdit then
  begin
     EFPlan.Enabled := False;
     EFPlan.Color := clInfoBk;
     EFEjercicioD.Enabled := False;
     EFEjercicioD.Color := clInfoBk;
     EFCanalD.Enabled := False;
     EFCanalD.Color := clInfoBk;
  end
  else
  begin
     EFPlan.Enabled := True;
     EFPlan.Color := clWindow;
     EFEjercicioD.Enabled := True;
     EFEjercicioD.Color := clWindow;
     EFCanalD.Enabled := True;
     EFCanalD.Color := clWindow;
  end;
end;

procedure TFMPropagaEstructura.CHKPlantillasClick(Sender: TObject);
begin
  if (CHKPlantillas.Checked) then
  begin
     CHKPlantillasCuentas.Enabled := True;
     CHKPlantillasCuentas.Checked := True;
  end
  else
  begin
     CHKPlantillasCuentas.Enabled := False;
     CHKPlantillasCuentas.Checked := False;
  end;
end;

end.
