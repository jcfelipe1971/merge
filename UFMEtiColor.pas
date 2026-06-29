unit UFMEtiColor;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  UFPEdit, Menus, UTeclas, UControlEdit, UEditPanel, ComCtrls, UNavigator,
  ToolWin, Grids, DBGrids, UHYDBGrid, ExtCtrls, StdCtrls, Mask, DBCtrls,
  UHYEdits, rxPlacemnt, NsDBGrid, ULFFormStorage, ActnList, ULFActionList,
  ULFPageControl, ULFToolBar, ULFPanel, ULFLabel, UG2kTBLoc, ULFDBEdit,
  ULFEdit;

type
  TFMEtiColor = class(TFPEdit)
     DBECodigo: TLFDbedit;
     DBETitulo: TLFDbedit;
     LCodigo: TLFLabel;
     LTitulo: TLFLabel;
     LColor: TLFLabel;
     EColor: TLFEdit;
     procedure FormCreate(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure EPMainClickRango(Sender: TObject; var Continua: boolean);
     procedure EPMainClickBuscar(Sender: TObject; var Continua: boolean);
     procedure EColorClick(Sender: TObject);
     procedure DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure RefrescaColores;
  end;

var
  FMEtiColor : TFMEtiColor;

implementation

uses UDMEtiColor, UFormGest, UDMMain, UUtiles;

{$R *.DFM}

procedure TFMEtiColor.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMEtiColor, DMEtiColor);
  NavMain.DataSource := DMEtiColor.DSQMEtiColor;
  EPMain.DataSource := DMEtiColor.DSQMEtiColor;
  DBGMain.DataSource := DMEtiColor.DSQMEtiColor;

  // Color campo ID
  ColorCampoID(DBECodigo);
end;

procedure TFMEtiColor.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMEtiColor);
end;

procedure TFMEtiColor.EPMainClickRango(Sender: TObject; var Continua: boolean);
begin
  inherited;
  DMEtiColor.BusquedaCompleja;
end;

procedure TFMEtiColor.EPMainClickBuscar(Sender: TObject; var Continua: boolean);
begin
  inherited;
  G2KTableLoc.Click;
end;

procedure TFMEtiColor.RefrescaColores;
var
  aColor : TColor;
begin
  aColor := DMEtiColor.QMEtiColorCOLOR_DECIMAL.AsInteger;
  EColor.Color := aColor;
end;

procedure TFMEtiColor.EColorClick(Sender: TObject);
begin
  inherited;
  EColor.Color := DameColor(EColor.Color);
  DMEtiColor.QMEtiColorCOLOR_DECIMAL.AsInteger := EColor.Color;
end;

procedure TFMEtiColor.DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
begin
  inherited;
  with THYTDBGrid(Sender) do
  begin
     if (gdFocused in State) then
     begin
        ColorFocused(Canvas);
     end
     else
     begin
        if (UpperCase(Column.FieldName) = 'COLOR_DECIMAL') then
        begin
           with Canvas do
           begin
              Brush.Color := DMEtiColor.QMEtiColorCOLOR_DECIMAL.AsInteger;
              Font.Color := DMEtiColor.QMEtiColorCOLOR_DECIMAL.AsInteger;
           end;
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end; {with DBGridFind2000}
end;

end.
