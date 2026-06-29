unit UFMBuscaRecxImp;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ActnList, ULFActionList, rxPlacemnt, ULFFormStorage, ToolWin,
  ComCtrls, ULFToolBar, ExtCtrls, UNavigator, Grids, DBGrids, NsDBGrid,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, StdCtrls, UFormGest,
  ULFEditFind2000, Menus, UTeclas, UControlEdit, ULFPanel, ULFLabel,
  ULFEdit, TFlatCheckBoxUnit, ULFCheckBox, UEditPanel, UFPEditSimple;

type
  TFMBuscaRecxImp = class(TFPEditSimple)
     TButtSeparador: TToolButton;
     PNLImporte: TLFPanel;
     EDTImporte: TLFEdit;
     EDTMasMenos: TLFEdit;
     UpDown: TUpDown;
     TButtBuscar: TToolButton;
     CBPagados: TLFCheckBox;
     LBImporte: TLFLabel;
     LBMasMenos: TLFLabel;
     DBGFMain: TDBGridFind2000;
     CBInvisibles: TLFCheckBox;
     procedure EDTImporteKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure FormActivate(Sender: TObject);
     procedure DBGFMainDblClick(Sender: TObject);
     procedure TButtBuscarClick(Sender: TObject);
     procedure DBGFMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
  private
     Signo: string;
     procedure BuscaImporte;
  public
     procedure SetSigno(aSigno: string);
  end;

var
  FMBuscaRecxImp : TFMBuscaRecxImp;

implementation

uses UDMMain, UDMCartera, UUtiles;

{$R *.dfm}

procedure TFMBuscaRecxImp.FormCreate(Sender: TObject);
begin
  inherited;
  EDTImporte.Text := '';
  EDTMasMenos.Text := '0';
  ControlEdit := CEMain;
end;

procedure TFMBuscaRecxImp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  DMCartera.xCarteraDet.Close;
end;

procedure TFMBuscaRecxImp.EDTImporteKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if (EDTImporte.Text <> '') then
     if (Key = VK_RETURN) then
        BuscaImporte;
end;

procedure TFMBuscaRecxImp.BuscaImporte;
begin
  DMCartera.AbrexCarteraDet(Signo, StrToFloatDef(EDTImporte.Text, 0),
     StrToFloatDef(EDTMasMenos.Text, 0), CBPagados.Checked, CBInvisibles.Checked);
end;

procedure TFMBuscaRecxImp.FormActivate(Sender: TObject);
begin
  inherited;
  EDTImporte.SetFocus;
end;

procedure TFMBuscaRecxImp.DBGFMainDblClick(Sender: TObject);
begin
  DMCartera.AbreRegistroBuscado;
  Close;
end;

procedure TFMBuscaRecxImp.SetSigno(aSigno: string);
begin
  Signo := aSigno;
  case Signo[1] of
     'C': Caption := _('Cartera COBROS: Buscar recibos por importes.');
     'P': Caption := _('Cartera PAGOS: Buscar recibos por importes.');
  end;
end;

procedure TFMBuscaRecxImp.TButtBuscarClick(Sender: TObject);
begin
  if (EDTImporte.Text <> '') then
     BuscaImporte;
end;

procedure TFMBuscaRecxImp.DBGFMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if DMCartera.HayDatosBusqueda then
     if (UpperCase(Column.FieldName) = 'REGISTRO') then
        CeldaEnlace(DBGFMain, Rect);
end;

end.
