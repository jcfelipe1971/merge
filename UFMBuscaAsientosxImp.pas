unit UFMBuscaAsientosxImp;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ULFActionList, rxPlacemnt, ULFFormStorage, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, UNavigator, Grids, DBGrids, NsDBGrid,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, StdCtrls, UFormGest,
  ULFEditFind2000, Menus, UTeclas, UControlEdit, ULFPanel, ULFLabel,
  ULFEdit, TFlatCheckBoxUnit, ULFCheckBox, ULFComboBox, UFPEditSimple,
  UEditPanel;

type
  TFMBuscaAsientosxImp = class(TFPEditSimple)
     TButtSeparador: TToolButton;
     PNLImporte: TLFPanel;
     EDTImporte: TLFEdit;
     EDTMasMenos: TLFEdit;
     UpDown: TUpDown;
     TButtBuscar: TToolButton;
     LBImporte: TLFLabel;
     LBMasMenos: TLFLabel;
     DBGFMain: TDBGridFind2000;
     LTipo: TLFLabel;
     CBAsiento: TLFComboBox;
     procedure EDTImporteKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormActivate(Sender: TObject);
     procedure DBGFMainDblClick(Sender: TObject);
     procedure TButtBuscarClick(Sender: TObject);
     procedure DBGFMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
  private
     procedure BuscaImporte;
  public
  end;

var
  FMBuscaAsientosxImp : TFMBuscaAsientosxImp;

implementation

uses UDMMain, UFMain, UDMBuscaAsientosxImp, UUtiles;

{$R *.dfm}

procedure TFMBuscaAsientosxImp.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  AbreData(TDMBuscaAsientosxImp, DMBuscaAsientosxImp);

  EDTImporte.Text := '';
  EDTMasMenos.Text := '0';
  CBAsiento.ItemIndex := 0;
  ControlEdit := CEMain;
end;

procedure TFMBuscaAsientosxImp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  CierraData(DMBuscaAsientosxImp);
  Action := caFree;
end;

procedure TFMBuscaAsientosxImp.EDTImporteKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (EDTImporte.Text <> '') then
     if (Key = VK_RETURN) then
        BuscaImporte;
end;

procedure TFMBuscaAsientosxImp.BuscaImporte;
begin
  DMBuscaAsientosxImp.AbrexAsientoDet(StrToFloatDef(EDTImporte.Text, 0), StrToFloatDef(EDTMasMenos.Text, 0), CBAsiento.ItemIndex);
end;

procedure TFMBuscaAsientosxImp.FormActivate(Sender: TObject);
begin
  inherited;
  EDTImporte.SetFocus;
end;

procedure TFMBuscaAsientosxImp.DBGFMainDblClick(Sender: TObject);
begin
  with DMBuscaAsientosxImp do
  begin
     if (xAsientosDet.Active) or (not xAsientosDet.IsEmpty) then
        FMain.MuestraMovConta(' RIC= ' + DMBuscaAsientosxImp.xAsientosDet.FieldByName('RIC').AsString +
           ' AND EJERCICIO=' + IntToStr(DMBuscaAsientosxImp.xAsientosDet.FieldByName('EJERCICIO').AsInteger));
  end;

  Close;
end;

procedure TFMBuscaAsientosxImp.TButtBuscarClick(Sender: TObject);
begin
  if (EDTImporte.Text <> '') then
     BuscaImporte;
end;

procedure TFMBuscaAsientosxImp.DBGFMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if DMBuscaAsientosxImp.HayDatosBusqueda then
  begin
     if (UpperCase(Column.FieldName) = 'ASIENTO') then
        CeldaEnlace(DBGFMain, Rect);
  end;
end;

end.
