unit UFFiltra_Articulos_Agr;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, UControlEdit, UNavigator, ToolWin, ComCtrls, Grids,
  UEditPanel, StdCtrls, UFIBDBEditfind, Buttons, UFormGest, Mask, DBCtrls,
  UComponentesBusquedaFiltrada, ufmArticulos, ULFDBEdit, ULFToolBar, ULFPanel,
  ULFCheckBox, ULFEditFind2000, TFlatCheckBoxUnit, ULFLabel,
  UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, ULFEdit;

type
  TFFiltra_Articulos_Agr = class(TFPEditSinNavegador)
     SGCondiciones: TStringGrid;
     GBAgrupacion: TGroupBox;
     LBLAgrupacion: TLFLabel;
     EFAgrupacion: TLFEditFind2000;
     ETitulo: TLFEdit;
     CHKAnd: TLFCheckBox;
     CHKor: TLFCheckBox;
     CHKNOT: TLFCheckBox;
     SBAnade: TSpeedButton;
     SBBorraCond: TSpeedButton;
     SBAceptar: TSpeedButton;
     procedure CHKAndClick(Sender: TObject);
     procedure CHKorClick(Sender: TObject);
     procedure CHKNOTClick(Sender: TObject);
     procedure EFAgrupacionChange(Sender: TObject);
     procedure SBAnadeClick(Sender: TObject);
     procedure SBBorraCondClick(Sender: TObject);
     procedure FormShow(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure SBAceptarClick(Sender: TObject);
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  FFiltra_Articulos_Agr : TFFiltra_Articulos_Agr;

implementation

uses UDMMain, UDMArticulos, UUtiles, UDameDato;

{$R *.dfm}

procedure TFFiltra_Articulos_Agr.CHKAndClick(Sender: TObject);
begin
  if (CHKAnd.Checked = True) then
  begin
     CHKOr.Checked := False;
     CHKNot.Checked := False;
  end;

  EFAgrupacion.SetFocus;
end;

procedure TFFiltra_Articulos_Agr.CHKorClick(Sender: TObject);
begin
  if (CHKOr.Checked = True) then
  begin
     CHKAnd.Checked := False;
     CHKNot.Checked := False;
  end;

  EFAgrupacion.SetFocus;
end;

procedure TFFiltra_Articulos_Agr.CHKNOTClick(Sender: TObject);
begin
  if (CHKNot.Checked = True) then
  begin
     CHKAnd.Checked := False;
     CHKOr.Checked := False;
  end;

  EFAgrupacion.SetFocus;
end;

procedure TFFiltra_Articulos_Agr.EFAgrupacionChange(Sender: TObject);
begin
  ETitulo.Text := DameTituloAgrupacion('T', EFAgrupacion.Text);
end;

procedure TFFiltra_Articulos_Agr.SBAnadeClick(Sender: TObject);
var
  Condicion : string;
begin
  if (CHKAnd.Checked = True) then
     Condicion := 'AND';
  if (CHKOr.Checked = True) then
     Condicion := 'OR';
  if (CHKNot.Checked = True) then
     Condicion := 'AND NOT';
  if (SGcondiciones.RowCount = 2) then
     Condicion := '';
  SGCondiciones.Cells[0, SGCondiciones.RowCount - 1] := Condicion;
  SGCondiciones.Cells[1, SGCondiciones.RowCount - 1] :=
     'AGRUPACION = ' + EFAgrupacion.Text;
  SGCondiciones.RowCount := SGCondiciones.RowCount + 1;

  EFAgrupacion.Text := '';
  EFAgrupacion.SetFocus;
end;

procedure TFFiltra_Articulos_Agr.SBBorraCondClick(Sender: TObject);
begin
  SGCondiciones.Cells[SGCondiciones.col, SGcondiciones.row] := '';
  SGCondiciones.Cells[SGCondiciones.col + 1, SGcondiciones.row] := '';
  if (SGCondiciones.RowCount > 2) then
     SGCondiciones.RowCount := SGCondiciones.RowCount - 1;

  EFAgrupacion.Text := '';
  EFAgrupacion.SetFocus;
end;

procedure TFFiltra_Articulos_Agr.FormShow(Sender: TObject);
begin
  SGCondiciones.Cols[0].DelimitedText := _('Condición');
  SGCondiciones.Cols[1].DelimitedText := _('Agrupación');
  CHKor.Checked := True;
  EFAgrupacion.Text := '';
  Etitulo.Text := '';
end;

procedure TFFiltra_Articulos_Agr.FormCreate(Sender: TObject);
begin
  // Asigno Imagenes a SpeedButton
  GetBitmapFromImageList(SBAnade, 1, DMMain.ILMain_Ac, 23);
  GetBitmapFromImageList(SBBorraCond, 1, DMMain.ILMain_Ac, 22);
  GetBitmapFromImageList(SBAceptar, 1, DMMain.ILMain_Ac, 19);
  GetBitmapFromImageList(SBAceptar, 2, DMMain.ILMain_In, 19);
end;

procedure TFFiltra_Articulos_Agr.SBAceptarClick(Sender: TObject);
var
  i : integer;
  Condicion, Agrupacion : string;
begin
  FMArticulos.DM.Borra_TMP_agrupaciones;
  i := 1;
  while (i <> SGCondiciones.RowCount - 1) do
  begin
     Condicion := SGCondiciones.Cells[0, i];
     Agrupacion := Trim(Copy(SGcondiciones.Cells[1, i], 14, 3));

     if (i = 1) then
     begin
        Condicion := '';
        FMArticulos.DM.Carga_agrupaciones(Agrupacion);
     end;

     if (Condicion = 'AND') then
        FMArticulos.DM.Filtra_agrupaciones(Agrupacion, 0);

     if (Condicion = 'OR') then
     begin
        FMArticulos.DM.Traspasa_agrupaciones;
        FMArticulos.DM.Carga_agrupaciones(Agrupacion);
     end;

     if (Condicion = 'AND NOT') then
        FMArticulos.DM.Filtra_agrupaciones(Agrupacion, 1);

     i := i + 1;
  end;

  ModalResult := mrOk;
end;

end.
