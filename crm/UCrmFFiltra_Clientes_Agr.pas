unit UCrmFFiltra_Clientes_Agr;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, UControlEdit, UNavigator, ToolWin, ComCtrls, Grids,
  UEditPanel, StdCtrls, UFIBDBEditfind, Buttons, UFormGest, Mask, DBCtrls,
  UComponentesBusquedaFiltrada, ufmclientes, ULFDBEdit, ULFToolBar, ULFPanel,
  ULFCheckBox, ULFEditFind2000, TFlatCheckBoxUnit, ULFLabel;

type
  TCrmFFiltra_clientes_agr = class(TG2KForm)
     PMain: TLFPanel;
     TBFiltrado: TLFToolBar;
     HYMEditPanel1: THYMEditPanel;
     SGCondiciones: TStringGrid;
     GBCondicion: TGroupBox;
     LBLAgrupacion: TLFLabel;
     EFAgrupacion: TLFEditFind2000;
     DBETitulo: TLFDbedit;
     CHKAnd: TLFCheckBox;
     CHKor: TLFCheckBox;
     SBAnade: TSpeedButton;
     SBBorraCond: TSpeedButton;
     PNLFiltros: TLFPanel;
     PNLBotones: TLFPanel;
     SBAceptar: TSpeedButton;
     procedure CHKAndClick(Sender: TObject);
     procedure CHKorClick(Sender: TObject);
     procedure EFAgrupacionChange(Sender: TObject);
     procedure SBAnadeClick(Sender: TObject);
     procedure SBBorraCondClick(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure BBAceptarClick(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure SBAceptarClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
     linea: integer;
     cadena: string;
  end;

var
  CrmFFiltra_clientes_agr : TCrmFFiltra_clientes_agr;

implementation

uses UDMMain, UCrmDMContactos, UUtiles;

{$R *.dfm}

procedure TCrmFFiltra_clientes_agr.CHKAndClick(Sender: TObject);
begin
  if (CHKAnd.Checked = True) then
  begin
     CHKOr.Checked := False;
  end;
end;

procedure TCrmFFiltra_clientes_agr.CHKorClick(Sender: TObject);
begin
  if (CHKOr.Checked = True) then
  begin
     CHKAnd.Checked := False;
  end;
end;

procedure TCrmFFiltra_clientes_agr.EFAgrupacionChange(Sender: TObject);
begin
  CrmDMContactos.TituloFiltraAgrupacion(EFAgrupacion.Text);
end;

procedure TCrmFFiltra_clientes_agr.SBAnadeClick(Sender: TObject);
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
     'AGRUPACION = ' + chr(39) + Efagrupacion.Text + chr(39);
  SGCondiciones.RowCount := SGCondiciones.RowCount + 1;
end;

procedure TCrmFFiltra_clientes_agr.SBBorraCondClick(Sender: TObject);
begin
  SGCondiciones.Cells[SGCondiciones.col, SGcondiciones.row] := '';
  SGCondiciones.Cells[SGCondiciones.col + 1, SGcondiciones.row] := '';
  if (SGCondiciones.RowCount > 2) then
     SGCondiciones.RowCount := SGCondiciones.RowCount - 1;
end;

procedure TCrmFFiltra_clientes_agr.FormShow(Sender: TObject);
begin
  SGCondiciones.Cols[0].DelimitedText := _('Condición');
  SGCondiciones.Cols[1].DelimitedText := _('Agrupación');
  CHKOr.Checked := True;
  EFAgrupacion.Text := '';
  DBEtitulo.Text := '';
end;

procedure TCrmFFiltra_clientes_agr.BBAceptarClick(Sender: TObject);
var
  i : integer;
  condicion, agrupacion : string;
begin
  i := 1;
  while (i <> SGCondiciones.RowCount - 1) do
  begin
     condicion := SGCondiciones.Cells[0, i];
     agrupacion := SGcondiciones.Cells[1, i];//trim(copy(SGcondiciones.Cells[1,i], 14,3));
     if (i = 1) then
        cadena := agrupacion
     else
        cadena := cadena + ' ' + condicion + ' ' + agrupacion;
     i := i + 1;
  end;
  CRMDMContactos.FiltraSeleccion(cadena, 1);
end;

procedure TCrmFFiltra_clientes_agr.FormCreate(Sender: TObject);
begin
  // Asigno Imagenes a SpeedButton
  GetBitmapFromImageList(SBAnade, 1, DMMain.ILMain_Ac, 23);
  GetBitmapFromImageList(SBBorraCond, 1, DMMain.ILMain_Ac, 22);
  GetBitmapFromImageList(SBAceptar, 1, DMMain.ILMain_Ac, 19);
  GetBitmapFromImageList(SBAceptar, 2, DMMain.ILMain_In, 19);
end;

procedure TCrmFFiltra_clientes_agr.SBAceptarClick(Sender: TObject);
var
  i : integer;
  condicion, agrupacion : string;
begin
  i := 1;
  while (i <> SGCondiciones.RowCount - 1) do
  begin
     condicion := SGCondiciones.Cells[0, i];
     agrupacion := SGcondiciones.Cells[1, i];//trim(copy(SGcondiciones.Cells[1,i], 14,3));
     if (i = 1) then
        cadena := agrupacion
     else
        cadena := cadena + ' ' + condicion + ' ' + agrupacion;
     i := i + 1;
  end;
  CRMDMContactos.FiltraSeleccion(cadena, 1);
end;

end.
