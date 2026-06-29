unit UCrmFMFiltra_Ambitos;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, UControlEdit, UNavigator, ToolWin, ComCtrls, Grids,
  UEditPanel, StdCtrls, UFIBDBEditfind, Buttons, UFormGest, Mask, DBCtrls,
  UComponentesBusquedaFiltrada, ufmclientes, ULFDBEdit, ULFToolBar, ULFPanel,
  ULFCheckBox, ULFEditFind2000, TFlatCheckBoxUnit, ULFLabel;

type
  TCrmFMFiltraAmbitos = class(TG2KForm)
     PMain: TLFPanel;
     TBFiltrado: TLFToolBar;
     HYMEditPanel1: THYMEditPanel;
     ToolButton1: TToolButton;
     SGCondiciones: TStringGrid;
     GBCondicion: TGroupBox;
     LBLAmbito: TLFLabel;
     EFAmbitos: TLFEditFind2000;
     DBETitulo: TLFDbedit;
     CHKAnd: TLFCheckBox;
     CHKor: TLFCheckBox;
     SBAnade: TSpeedButton;
     SBBorraCond: TSpeedButton;
     PNLBotones: TLFPanel;
     PNLCondicion: TLFPanel;
     SBAceptar: TSpeedButton;
     procedure CHKAndClick(Sender: TObject);
     procedure CHKorClick(Sender: TObject);
     procedure EFAmbitosChange(Sender: TObject);
     procedure SBAnadeClick(Sender: TObject);
     procedure SBBorraCondClick(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure SBAceptarClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     linea: integer;
     cadena: string;
  end;

var
  CrmFMFiltraAmbitos : TCrmFMFiltraAmbitos;

implementation

uses UDMMain, UCrmDMContactos, UUtiles;

{$R *.dfm}

procedure TCrmFMFiltraAmbitos.CHKAndClick(Sender: TObject);
begin
  if (CHKAnd.Checked = True) then
  begin
     CHKOr.Checked := False;
  end;
end;

procedure TCrmFMFiltraAmbitos.CHKorClick(Sender: TObject);
begin
  if (CHKOr.Checked = True) then
  begin
     CHKAnd.Checked := False;
  end;
end;

procedure TCrmFMFiltraAmbitos.EFAmbitosChange(Sender: TObject);
begin
  CrmDMContactos.TituloFiltraAmbito(EFAmbitos.Text);
end;

procedure TCrmFMFiltraAmbitos.SBAnadeClick(Sender: TObject);
var
  condicion : string;
begin
  if (CHKAnd.Checked = True) then
     condicion := 'AND';
  if (CHKOr.Checked = True) then
     condicion := 'OR';
  if (SGcondiciones.RowCount = 2) then
     condicion := '';
  SGCondiciones.Cells[0, SGCondiciones.RowCount - 1] := condicion;
  SGCondiciones.Cells[1, SGCondiciones.RowCount - 1] :=
     'AMBITO = ' + EFAmbitos.Text;
  SGCondiciones.RowCount := SGCondiciones.RowCount + 1;
end;

procedure TCrmFMFiltraAmbitos.SBBorraCondClick(Sender: TObject);
begin
  SGCondiciones.Cells[SGCondiciones.col, SGcondiciones.row] := '';
  SGCondiciones.Cells[SGCondiciones.col + 1, SGcondiciones.row] := '';
  if (SGCondiciones.RowCount > 2) then
     SGCondiciones.RowCount := SGCondiciones.RowCount - 1;
end;

procedure TCrmFMFiltraAmbitos.FormShow(Sender: TObject);
begin
  SGCondiciones.Cols[0].DelimitedText := _('Condición');
  SGCondiciones.Cols[1].DelimitedText := _('Ámbito');
  CHKOr.Checked := True;
  EFAmbitos.Text := '';
  DBEtitulo.Text := '';
end;

procedure TCrmFMFiltraAmbitos.SBAceptarClick(Sender: TObject);
var
  i : integer;
  condicion, ambito : string;
begin
  i := 1;
  while (i <> SGCondiciones.RowCount - 1) do
  begin
     condicion := SGCondiciones.Cells[0, i];
     ambito := Trim(Copy(SGcondiciones.Cells[1, i], 10, 3));
     if (i = 1) then
        cadena := 'id_crm_ambito=' + ambito
     else
        cadena := cadena + ' ' + condicion + ' ' + 'id_crm_ambito=' + ambito;
     i := i + 1;
  end;
  CRMDMContactos.FiltraSeleccion(cadena, 2);
end;

procedure TCrmFMFiltraAmbitos.FormCreate(Sender: TObject);
begin
  // Asigno Imagenes a Botones
  GetBitmapFromImageList(SBAceptar, 1, DMMain.ILMain_Ac, 19);
  GetBitmapFromImageList(SBAnade, 23, DMMain.ILMain_Ac, 0);
  GetBitmapFromImageList(SBBorraCond, 22, DMMain.ILMain_Ac, 0);
end;

end.
