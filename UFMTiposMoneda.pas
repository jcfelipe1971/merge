unit UFMTiposMoneda;

{Todo: Modificar para que filtre por moneda y luego muestro los detalles de esa moneda}

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPedit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  rxPlacemnt, NsDBGrid, ULFDBEdit, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc,
  DbComboBoxValue, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  ULFDBEditFind2000, ULFEdit;

type
  TFMTiposMoneda = class(TFPEdit)
     LBLMoneda: TLFLabel;
     LFValor: TLFDbedit;
     LFDCodigo: TLFDbedit;
     LFCodigo: TLFLabel;
     LBLValor: TLFLabel;
     LBLTipo: TLFLabel;
     LBLNombre: TLFLabel;
     DBETipo: TDBComboBoxValue;
     DBETitulo: TLFDbedit;
     DBEFMoneda: TLFDBEditFind2000;
     ETituloMoneda: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure NavMainClick(Sender: TObject; Button: TNavigateBtn);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure DBEFMonedaChange(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FMTiposMoneda : TFMTiposMoneda;

implementation

uses
  UDMTiposMoneda, UFormGest, UDMMain, UDameDato;

{$R *.DFM}

procedure TFMTiposMoneda.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMTiposMoneda, DMTiposMoneda);
  NavMain.DataSource := DMTiposMoneda.DSQMTiposMoneda;
  EPMain.DataSource := DMTiposMoneda.DSQMTiposMoneda;
  DBGMain.DataSource := DMTiposMoneda.DSQMTiposMoneda;
  G2kTableLoc.DataSource := DMTiposMoneda.DSQMTiposMoneda;
end;

procedure TFMTiposMoneda.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMTiposMoneda);
end;

procedure TFMTiposMoneda.NavMainClick(Sender: TObject; Button: TNavigateBtn);
begin
  inherited;
  if (Button = nbEdit) then
  begin
     DBETipo.Color := clInfoBk;
     DBETipo.Font.Color := clGrayText;
     DBETipo.Enabled := False;
  end
  else
  begin
     DBETipo.Color := clWindow;
     DBETipo.Font.Color := clWindowText;
     DBETipo.Enabled := True;
  end;
end;

procedure TFMTiposMoneda.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMTiposMoneda.BusquedaCompleja;
  Continua := False;
end;

procedure TFMTiposMoneda.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2kTableLoc.Click;
end;

procedure TFMTiposMoneda.DBEFMonedaChange(Sender: TObject);
begin
  inherited;
  ETituloMoneda.Text := DameTituloMoneda(DBEFMoneda.Text);
end;

end.
