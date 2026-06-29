unit UFMRelacionaAnticipo;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, ToolWin, ComCtrls, ULFToolBar, ExtCtrls, ULFPanel,
  StdCtrls, ULFLabel, Mask, DBCtrls, ULFDBEdit, ULFEdit, dbcgrids,
  ULFDBCtrlGrid, UNavigator, Menus, UTeclas, UControlEdit, DB;

type
  TFMRelacionaAnticipo = class(TG2kForm)
     PMain: TLFPanel;
     TBMain: TLFToolBar;
     PAnticipo: TLFPanel;
     LBLSaldoCtaAnt: TLFLabel;
     EDSaldoCtaAnt: TLFEdit;
     LBLUsar: TLFLabel;
     DBEUsar: TLFDbedit;
     PRelacionada: TLFPanel;
     DBCGAnticiposDisp: TLFDBCtrlGrid;
     PDisponibles: TLFPanel;
     DBCGAnticiposRel: TLFDBCtrlGrid;
     DBERigRel: TLFDbedit;
     DBELineaRel: TLFDbedit;
     DBEImporteRel: TLFDbedit;
     LBLFacturaRel: TLFLabel;
     LBLineaRel: TLFLabel;
     LBLImporteRel: TLFLabel;
     LBLRigDisp: TLFLabel;
     LBLLineaDisp: TLFLabel;
     LBLImporteDisp: TLFLabel;
     DBERigDisp: TLFDbedit;
     DBELineaDisp: TLFDbedit;
     DBEImporteDisp: TLFDbedit;
     LBLAnticiposRel: TLFLabel;
     LBLAnticiposDisp: TLFLabel;
     NavMain: THYMNavigator;
     TButtSep1: TToolButton;
     CEAnticipo: TControlEdit;
     CEAnticipoPMEdit: TPopUpTeclas;
     PArticulo: TLFPanel;
     DBEArticulo: TLFDbedit;
     DBETituloArticulo: TLFDbedit;
     DBEImporteREstoDisp: TLFDbedit;
     TBValida: TLFToolBar;
     TButtValida: TToolButton;
     TButtSalir: TToolButton;
     LFLabel1: TLFLabel;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBCGAnticiposRelDblClick(Sender: TObject);
     procedure DBCGAnticiposDispDblClick(Sender: TObject);
     procedure TButtSalirClick(Sender: TObject);
     procedure TButtValidaClick(Sender: TObject);
  private
     { Private declarations }
     EsCorrecto: boolean;
  public
     { Public declarations }
     procedure AbrirDatos(Cliente, IdDetallesS: integer);
  end;

var
  FMRelacionaAnticipo : TFMRelacionaAnticipo;

procedure RelacionaAnticipo(Owner: TComponent; DataSource: TDataSource; Field: TField; Cliente, IdDetallesS: integer);

implementation

{$R *.dfm}

uses
  UDMMain, UDMRelacionaAnticipo, UEntorno;

procedure RelacionaAnticipo(Owner: TComponent; DataSource: TDataSource; Field: TField; Cliente, IdDetallesS: integer);
var
  FMRelAnt : TFMRelacionaAnticipo;
begin
  FMRelAnt := TFMRelacionaAnticipo.Create(Owner);
  try
     FMRelAnt.NavMain.DataSource := DataSource;
     FMRelAnt.DBEUsar.DataSource := DataSource;
     FMRelAnt.DBEUsar.DataField := Field.FieldName;
     FMRelAnt.AbrirDatos(Cliente, IdDetallesS);
     FMRelAnt.ShowModal;
  finally
     FMRelAnt.Free;
  end;
end;

procedure TFMRelacionaAnticipo.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE  

  AbreData(TDMRelacionaAnticipo, DMRelacionaAnticipo);
  ControlEdit := CEAnticipo;
  EsCorrecto := False;
end;

procedure TFMRelacionaAnticipo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if not (EsCorrecto) then
     DMRelacionaAnticipo.BorraAnticipos;
  CierraData(DMRelacionaAnticipo);
end;

procedure TFMRelacionaAnticipo.AbrirDatos(Cliente, IdDetallesS: integer);
begin
  DMRelacionaAnticipo.Cliente := Cliente;
  DMRelacionaAnticipo.AbreDatos(IdDetallesS);
  EDSaldoCtaAnt.Text := FormatFloat(MascaraN, DMRelacionaAnticipo.DameSaldoCtaAnticipo(Cliente) * (-1));
end;

procedure TFMRelacionaAnticipo.DBCGAnticiposRelDblClick(Sender: TObject);
begin
  DMRelacionaAnticipo.EliminaRelacion;
  DMRelacionaAnticipo.RefrescaDatos;
end;

procedure TFMRelacionaAnticipo.DBCGAnticiposDispDblClick(Sender: TObject);
begin
  DMRelacionaAnticipo.Relaciona(Self.DBEUsar.Field.Value);
  DMRelacionaAnticipo.RefrescaDatos;
end;

procedure TFMRelacionaAnticipo.TButtSalirClick(Sender: TObject);
begin
  EsCorrecto := False;
  Close;
end;

procedure TFMRelacionaAnticipo.TButtValidaClick(Sender: TObject);
begin
  if (DMRelacionaAnticipo.ValidaTotalAnticipos(Self.DBEUsar.Field.Value)) then
  begin
     EsCorrecto := True;
     Close;
  end
  else
  begin
     EsCorrecto := False;
     raise Exception.Create(_('Los Importes de anticipos y el total de anticipos no coinciden'));
  end;
end;

end.
