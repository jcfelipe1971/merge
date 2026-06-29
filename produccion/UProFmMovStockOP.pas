unit UProFMMovStockOP;

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
  ULFEdit, ImgList, Math, UProDMEscandallo, DbComboBoxValue;

type
  TProFMMovStockOP = class(TG2KForm)
     PNLMain: TLFPanel;
     LFDescCompuesto: TLFEdit;
     PNLCabecera: TLFPanel;
     DBEIdOrden: TLFDbedit;
     DBECompuesto: TLFDbedit;
     PCMain: TLFPageControl;
     TSArtMovStock: TTabSheet;
     TSMovStock: TTabSheet;
     DBGListado: TFIBHYGGridFind;
     DBGMovStock: TFIBHYGGridFind;
     TBMain: TLFToolBar;
     EPMain: THYMEditPanel;
     ToolButton1: TToolButton;
     FSMain: TLFFibFormStorage;
     TButtRefrescar: TToolButton;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure DBECompuestoChange(Sender: TObject);
     procedure DBGFMovStockDblClick(Sender: TObject);
     procedure TButtRefrescarClick(Sender: TObject);
     procedure DBGMovStockDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure AbreIdOrden(IdOrden: integer);
  end;

var
  ProFMMovStockOP : TProFMMovStockOP;

implementation

uses UDMMain, UEntorno, UUtiles, UDameDato, UProDMMovStockOP;

{$R *.dfm}

procedure TProFMMovStockOP.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  AbreData(TProDMMovStockOP, ProDMMovStockOP);
  DBGListado.DataSource := ProDMMovStockOP.DSxQMovStocks;
end;

procedure TProFMMovStockOP.AbreIdOrden(IdOrden: integer);
begin
  ProDmMovStockOP.AbreIdOrden(IdOrden);
end;

procedure TProFMMovStockOP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  CierraData(ProDMMovStockOp);
end;

procedure TProFMMovStockOP.DBECompuestoChange(Sender: TObject);
begin
  LFDescCompuesto.Text := DameTituloArticulo(DBECompuesto.Text);
end;

procedure TProFMMovStockOP.DBGFMovStockDblClick(Sender: TObject);
begin
  inherited;
  ProDMMovStockOP.MuestraDocumento;
end;

procedure TProFMMovStockOP.TButtRefrescarClick(Sender: TObject);
begin
  ProDMMovStockOP.Refrescar;
end;

procedure TProFMMovStockOP.DBGMovStockDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
var
  TipoOperacion : string;
begin
  with TFIBHYGGridFind(Sender) do
  begin
     if (gdFocused in State) then //If the cell has the focus
        ColorFocused(Canvas)
     else
     begin
        TipoOperacion := ProDMMovStockOP.QGesDetallesStTIPO_OPERACION.AsString;
        with TFIBHYGGridFind(Sender).Canvas do
        begin
           if (TipoOperacion = 'T') then
           begin
              Brush.Color := clInfoBk;
              Font.Color := clWindowText;
           end;
           if (TipoOperacion = 'E') then
           begin
              Brush.Color := clMoneyGreen;
              Font.Color := clWindowText;
              if (UpperCase(Column.FieldName) = 'ALMACEN_ORI') then
                 Font.Color := Brush.Color;
           end;
           if (TipoOperacion = 'S') then
           begin
              // Fuchsia un poco mas claro
              Brush.Color := clFuchsia + $8000;
              Font.Color := clWindowText;
              if (UpperCase(Column.FieldName) = 'ALMACEN_DST') then
                 Font.Color := Brush.Color;
           end;

           if (ProDMMovStockOP.QGesDetallesStLOTES.AsInteger = 0) then
           begin
              if ((UpperCase(Column.FieldName) = 'ID_LOTE') or (UpperCase(Column.FieldName) = 'LOTE') or (UpperCase(Column.FieldName) = 'CANTIDAD')) then
                 Font.Color := Brush.Color;
           end;
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end; {With DBGFDetalle}

  if (UpperCase(Column.FieldName) = 'ORIGEN') then
     CeldaEnlace(TFIBHYGGridFind(Sender), Rect);
end;

end.
