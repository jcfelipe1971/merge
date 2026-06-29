unit ZUFMLstTiempoMarc;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEdit, ExtCtrls, UFIBDBEditfind, UComponentesBusquedaFiltrada,
  StdCtrls, DBCtrls, ComCtrls, UDBDateTimePicker, Mask, Menus, UTeclas,
  UControlEdit, UEditPanel, UNavigator, ToolWin, Grids, DBGrids, UHYDBGrid, UFormGest,
  ExtDlgs, DB, Buttons, NsDBGrid, rxPlacemnt, rxToolEdit, RXDBCtrl,
  ULFFormStorage, ActnList, ULFActionList, ULFPageControl, ULFToolBar,
  ULFPanel, ULFDBEditFind2000, ULFDBEdit, ULFDBCheckBox, ULFDBMemo,
  TFlatCheckBoxUnit, ULFCheckBox, ULFDBDateEdit, ULFFIBDBEditFind,
  UHYDescription, ULFHYDBDescription, UG2kTBLoc, UFPregTiempo, ULFLabel,
  ULFEdit, ImgList, Math, ULFEditFind2000, ULFDateEdit, UOrderComboBox, Dateutils, UEntorno,
  ULFComboBox;

type
  TZFMLstTiempoMarc = class(TForm)
     PArriba: TLFPanel;
     LFPanel2: TLFPanel;
     LFToolBar1: TLFToolBar;
     BtSalir: TToolButton;
     LFFechaDesde: TLFDateEdit;
     LFFechaHasta: TLFDateEdit;
     LFClienteDEsde: TLFEditFind2000;
     LFClienteHasta: TLFEditFind2000;
     LFFDesde: TLFLabel;
     LFFHasta: TLFLabel;
     LFCliDesde: TLFLabel;
     LFCliHasta: TLFLabel;
     DBGFLstMarcaje: TDBGridFind2000;
     BtEjecuta: TToolButton;
     PCMain: TLFPanel;
     LFDescDesde: TLFEdit;
     LFDescHasta: TLFEdit;
     LFLabel5: TLFLabel;
     LFSerie: TLFEditFind2000;
     LFOrden: TLFLabel;
     BtRecargar: TToolButton;
     CBOrder: TLFComboBox;
     LbTransporte: TLFLabel;
     CBTransporte: TLFComboBox;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EjecutaListado(Sender: TObject);
     procedure LFClienteHastaChange(Sender: TObject);
     procedure LFClienteDEsdeChange(Sender: TObject);
     procedure BtSalirClick(Sender: TObject);
     procedure BtRecargarClick(Sender: TObject);
     procedure DBGFLstMarcajeDblClick(Sender: TObject);
     procedure DBGFLstMarcajeCellClick(Column: TColumn);
     procedure DBGFLstMarcajeDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
  private
     { Private declarations }
     ColActual: TColumn;
     procedure DameFechas;
     procedure RecargarDatosListado;
  public
     { Public declarations }
  end;

var
  ZFMLstTiempoMarc : TZFMLstTiempoMarc;

implementation

uses ZUDMLstTiempoMarc, UDMMain, UFMAin, UFMPedidos, UDMPedidos, UUtiles;

{$R *.dfm}

procedure TZFMLstTiempoMarc.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TzDMLstTiempoMarc, zDMLstTiempoMarc);
  RecargarDatosListado;
end;

procedure TZFMLstTiempoMarc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  CierraData(zDMLstTiempoMarc);
end;

procedure TZFMLstTiempoMarc.EjecutaListado(Sender: TObject);
begin
  zDMLstTiempoMarc.EjecutaListado(LFFechaDesde.Date, LFFechaHasta.Date,
     StrToInt(LFClienteDesde.Text),
     StrToInt(LFClienteHasta.Text),
     LFSerie.Text, CBOrder.ItemIndex,
     CBTransporte.ItemIndex);
end;

procedure TZFMLstTiempoMarc.LFClienteHastaChange(Sender: TObject);
begin
  LFDescHasta.Text := zDMLstTiempoMarc.DameDescCliente(StrToInt(LFClienteHasta.Text));
end;

procedure TZFMLstTiempoMarc.LFClienteDEsdeChange(Sender: TObject);
begin
  LFDescDesde.Text := zDMLstTiempoMarc.DameDescCliente(StrToInt(LFClienteDEsde.Text));
end;

procedure TZFMLstTiempoMarc.BtSalirClick(Sender: TObject);
begin
  Close;
end;

procedure TZFMLstTiempoMarc.BtRecargarClick(Sender: TObject);
begin
  RecargarDatosListado;
end;

procedure TZFMLstTiempoMarc.RecargarDatosListado;
var
  Cdesde, Chasta : string;
begin
  DameFechas;
  zDMLstTiempoMarc.DameClientes(Cdesde, Chasta);
  LFClienteDesde.Text := Cdesde;
  LFClienteHasta.Text := Chasta;
end;

procedure TZFMLstTiempoMarc.DameFechas;
var
  Year, Month, Day : word;
begin
  DecodeDate(Date, Year, Month, Day);
  Year := REntorno.Ejercicio;
  LFFechaDesde.Date := EncodeDate(Year, Month, StrToInt('01'));
  LFFechaHasta.Date := EncodeDate(Year, Month, DaysInAMonth(Year, Month));
end;

procedure TZFMLstTiempoMarc.DBGFLstMarcajeDblClick(Sender: TObject);
var
  ejercicio, rig : integer;
  serie : string;
begin
  if zDMLstTiempoMarc.HayDetalle then
  begin
     if (UpperCase(ColActual.FieldName) = 'Z_COD_BARRAS') then
     begin
        AbreForm(TFMPedidos, FMPedidos, Sender);
        zDMLstTiempoMarc.DamePedido(ejercicio, rig, serie);
        DMPedidos.FiltraCabecera(ejercicio, serie, rig);
     end;
  end;
end;

procedure TZFMLstTiempoMarc.DBGFLstMarcajeCellClick(Column: TColumn);
begin
  ColActual := Column;
end;

procedure TZFMLstTiempoMarc.DBGFLstMarcajeDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  if zDMLstTiempoMarc.HayDetalle then
  begin
     if (UpperCase(Column.FieldName) = 'Z_COD_BARRAS') then
        CeldaEnlace(DBGFLstMarcaje, Rect);
  end;
end;

end.
