unit UFMEscCondCom;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ToolWin, ComCtrls, StdCtrls, Mask, DBCtrls, UFIBDBEditfind, strutils,
  UComponentesBusquedaFiltrada, ExtCtrls, UEditPanel, Grids, DBGrids,
  UNavigator, Menus, UTeclas, UControlEdit, UFormGest, NsDBGrid, ULFDBEdit,
  ULFLabel, ULFPanel, ULFToolBar;

type
  TFMEscCondCom = class(TG2KForm)
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
     LBLProveedor: TLFLabel;
     DBEProveedor: TLFDbedit;
     DBETitProveedor: TLFDbedit;
     LBLAgrupacion: TLFLabel;
     DBETitAgrupacion: TLFDbedit;
     ToolButton1: TToolButton;
     EPMain: THYMEditPanel;
     DBEAgrupacion: TLFDbedit;
     DBGFDetallePorPrecio: TDBGridFind2000;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
     procedure HazVisible(lbl: TLFLabel; Campo: TDBEdit; Titulo: TDBEdit; Top: integer; Height: integer);
  public
     { Public declarations }
     procedure Filtra(tipo: string; RIG: integer; PorPrecio: boolean);
  end;

var
  FMEscCondCom : TFMEscCondCom;

implementation

uses UDMMain, UEntorno, UDMEscCondCom;

{$R *.DFM}

procedure TFMEscCondCom.FormCreate(Sender: TObject);
begin
  inherited;
  TranslateComponent(Self); //IDIOMA_CODE  
  AbreData(TDMEscCondCom, DMEscCondCom);
  ControlEdit := CETarifasPArticulo;
end;

procedure TFMEscCondCom.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMEscCondCom);
  Action := caFree;
end;

procedure TFMEscCondCom.HazVisible(lbl: TLFLabel; Campo: TDBEdit; Titulo: TDBEdit; Top: integer; Height: integer);
begin
  LBLProveedor.Visible := True;
  DBEProveedor.Visible := True;
  DBETitProveedor.Visible := True;

  lbl.Visible := True;
  Campo.Visible := True;
  Titulo.Visible := True;
  lbl.Top := LBLProveedor.Top + Top;
  Campo.Top := DBEProveedor.Top + Top;
  Titulo.Top := DBETitProveedor.Top + Top;
  PMain.Height := Height;
end;

procedure TFMEscCondCom.Filtra(tipo: string; RIG: integer; PorPrecio: boolean);
var
  x : integer;
begin
  DMEscCondCom.Filtra(tipo, RIG);

  {Hace invisible los controles dentro de PMain}
  for x := 0 to PMain.ControlCount - 1 do
     PMain.Controls[x].Visible := False;

  if tipo = 'PRA' then
     HazVisible(LBLArticulo, DBEArticulo, DBETitArticulo, 22, 60);
  if tipo = 'PRF' then
     HazVisible(LBLFamilia, DBEFamilia, DBETitFamilia, 22, 60);
  if tipo = 'PRG' then
     HazVisible(LBLAgrupacion, DBEAgrupacion, DBETitAgrupacion, 22, 60);
  if tipo = 'PRU' then
     HazVisible(LBLAgrupacion, DBEAgrupacion, DBETitAgrupacion, 22, 60);

  {Para mostrar escalado por unidades o por precio}
  DBGFDetalle.Align := alClient;
  DBGFDetallePorPrecio.Align := alClient;
  DBGFDetalle.Visible := not PorPrecio;
  DBGFDetallePorPrecio.Visible := PorPrecio;
  if (not PorPrecio) then
  begin
     NavMain.DataSource := DMEscCondCom.DSQMDetalle;
     NavMain.EditaControl := DBGFDetalle;
     DBEProveedor.DataSource := DMEscCondCom.DSxCondProv;
     DBETitProveedor.DataSource := DMEscCondCom.DSxCondProv;
     DBEArticulo.DataSource := DMEscCondCom.DSxCondProv;
     DBETitArticulo.DataSource := DMEscCondCom.DSxCondProv;
     DBEFamilia.DataSource := DMEscCondCom.DSxCondProv;
     DBETitFamilia.DataSource := DMEscCondCom.DSxCondProv;
     DBEAgrupacion.DataSource := DMEscCondCom.DSxCondProv;
     DBETitAgrupacion.DataSource := DMEscCondCom.DSxCondProv;
  end
  else
  begin
     NavMain.DataSource := DMEscCondCom.DSQMDetallePorPrecio;
     NavMain.EditaControl := DBGFDetallePorPrecio;
     DBEProveedor.DataSource := DMEscCondCom.DSxCondProvPorPrecio;
     DBETitProveedor.DataSource := DMEscCondCom.DSxCondProvPorPrecio;
     DBEArticulo.DataSource := DMEscCondCom.DSxCondProvPorPrecio;
     DBETitArticulo.DataSource := DMEscCondCom.DSxCondProvPorPrecio;
     DBEFamilia.DataSource := DMEscCondCom.DSxCondProvPorPrecio;
     DBETitFamilia.DataSource := DMEscCondCom.DSxCondProvPorPrecio;
     DBEAgrupacion.DataSource := DMEscCondCom.DSxCondProvPorPrecio;
     DBETitAgrupacion.DataSource := DMEscCondCom.DSxCondProvPorPrecio;
  end;
end;

end.
