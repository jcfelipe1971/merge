unit UFMAsientosPorImputar;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ULFPanel, ToolWin, ComCtrls, ULFToolBar, StdCtrls,
  ULFLabel, ULFComboBox, Mask, rxToolEdit, ULFDateEdit, UNavigator, Grids,
  DBGrids, NsDBGrid, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  UControlEdit, Menus, UTeclas, UFormGest, UHYDBGrid, DBCtrls, ULFDBEdit,
  ULFEditFind2000;

type
  TFMAsientosPorImputar = class(TG2kForm)
     PMain: TLFPanel;
     TBMain: TLFToolBar;
     TSep2: TToolButton;
     TButtConfirmar: TToolButton;
     TButtSalir: TToolButton;
     PTipoAsientos: TLFPanel;
     CBTipoAsiento: TLFComboBox;
     PFechas: TLFPanel;
     LBLDesde: TLFLabel;
     DEDesde: TLFDateEdit;
     LBLHasta: TLFLabel;
     DEHasta: TLFDateEdit;
     LBLTipoAsiento: TLFLabel;
     TBAsientos: TLFToolBar;
     NavAsientos: THYMNavigator;
     PDetalle: TLFPanel;
     TBApuntes: TLFToolBar;
     NavApuntes: THYMNavigator;
     CEAsientos: TControlEdit;
     CEAsientosPMEdit: TPopUpTeclas;
     CEApuntes: TControlEdit;
     CEApuntesPMEdit: TPopUpTeclas;
     DBGAsientos: THYTDBGrid;
     DBGApuntes: THYTDBGrid;
     TButtRefrescar: TToolButton;
     LFPFiltroProyectos: TLFPanel;
     LProyecto: TLFLabel;
     DBEProyecto: TLFEditFind2000;
     DBETitProyecto: TLFDbedit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure TButtConfirmarClick(Sender: TObject);
     procedure TButtSalirClick(Sender: TObject);
     procedure TButtRefrescarClick(Sender: TObject);
     procedure DBGAsientosColEnter(Sender: TObject);
     procedure DBGApuntesColEnter(Sender: TObject);
     procedure DBGAsientosDblClick(Sender: TObject);
     procedure DBEProyectoChange(Sender: TObject);
     procedure DBEProyectoBusqueda(Sender: TObject);
  private
     { Private declarations }
     function DameTipoAsiento: string;
  public
     { Public declarations }
     RIC: integer;
     PLAN_CONTABLE: string;
     procedure Inicializa(Plan: string);
  end;

var
  FMAsientosPorImputar : TFMAsientosPorImputar;

implementation

{$R *.dfm}

uses
  UDMMain, UDMAsientosPorImputar, StrUtils, UEntorno, URellenaLista;

procedure TFMAsientosPorImputar.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TDMAsientosPorImputar, DMAsientosPorImputar);

  NavAsientos.DataSource := DMAsientosPorImputar.DSxAsientos;
  DBGAsientos.DataSource := DMAsientosPorImputar.DSxAsientos;
  NavApuntes.DataSource := DMAsientosPorImputar.DSxApuntes;
  DBGApuntes.DataSource := DMAsientosPorImputar.DSxApuntes;

  RellenaTiposAsientos(CBTipoAsiento.Items, True {IncluyeTipo_ANA});
  ControlEdit := CEAsientos;
  CBTipoAsiento.ItemIndex := 0;
end;

procedure TFMAsientosPorImputar.Inicializa(Plan: string);
var
  FechaD, FechaH : TDateTime;
  proyecto : integer;
begin
  plan_contable := plan;
  DMAsientosPorImputar.PLAN_CONTABLE := plan;
  DMAsientosPorImputar.DameDatosIniciales(FechaD, FechaH, proyecto);
  DEDesde.Date := FechaD;
  DEHasta.Date := FechaH;
  DBEProyecto.Text := IntToStr(proyecto);
  DMAsientosPorImputar.AbrirAsientos(
     DameTipoAsiento, DEDesde.Date, DEHasta.Date, plan, StrToInt(DBEProyecto.Text));
end;

procedure TFMAsientosPorImputar.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(DMAsientosPorImputar);
end;

function TFMAsientosPorImputar.DameTipoAsiento: string;
begin
  if CBTipoAsiento.Text = _('Todos los tipos') then
     Result := ''
  else
     Result := Trim(LeftStr(CBTipoAsiento.Text, Pos(' ', CBTipoAsiento.Text) - 1));
end;

procedure TFMAsientosPorImputar.TButtConfirmarClick(Sender: TObject);
begin
  RIC := DMAsientosPorImputar.RIC;
  ModalResult := mrOk;
end;

procedure TFMAsientosPorImputar.TButtSalirClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TFMAsientosPorImputar.TButtRefrescarClick(Sender: TObject);
var
  proyecto : integer;
begin
  if ((DBEProyecto.Text <= '') or (DBEProyecto.Text = Trim('0'))) then
     proyecto := 0
  else
     proyecto := StrToInt(DBEProyecto.Text);

  DMAsientosPorImputar.AbrirAsientos(DameTipoAsiento, DEDesde.Date, DEHasta.Date,
     Plan_contable, proyecto);
end;

procedure TFMAsientosPorImputar.DBGAsientosColEnter(Sender: TObject);
begin
  ControlEdit := CEAsientos;
end;

procedure TFMAsientosPorImputar.DBGApuntesColEnter(Sender: TObject);
begin
  ControlEdit := CEApuntes;
end;

procedure TFMAsientosPorImputar.DBGAsientosDblClick(Sender: TObject);
begin
  RIC := DMAsientosPorImputar.RIC;
  ModalResult := mrOk;
end;

procedure TFMAsientosPorImputar.DBEProyectoChange(Sender: TObject);
begin
  if (DBEProyecto.Text = '') then
     DBETitProyecto.Text := ''
  else
  begin
     with DMAsientosPorImputar.xProyectos do
     begin
        Close;
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['PROYECTO'].AsInteger := StrToInt(DBEProyecto.Text);
        Open;
     end;
  end;
end;

procedure TFMAsientosPorImputar.DBEProyectoBusqueda(Sender: TObject);
begin
  DBEProyecto.CondicionBusqueda :=
     '(CANAL_NULL = ' + IntToStr(REntorno.Canal) + ' or CANAL_NULL is null)';
end;

end.
