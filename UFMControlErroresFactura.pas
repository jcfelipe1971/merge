unit UFMControlErroresFactura;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFormGest, Grids, DBGrids, NsDBGrid, UFIBDBEditfind,
  UComponentesBusquedaFiltrada, ToolWin, ComCtrls, ExtCtrls, rxPlacemnt,
  UNavigator, Menus, UTeclas, UControlEdit, ULFFormStorage, ULFToolBar,
  ULFPanel, UFPEditSimple, ActnList, ULFActionList, UEditPanel;

type
  TFMControlErroresFactura = class(TFPEditSimple)
     DBGMain: TDBGridFind2000;
     procedure FormCreate(Sender: TObject);
     procedure DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
     TabladeColor: array [0..20] of TColor;
     procedure RellenaTablaColor;
     function DameSiguienteColor(Color: integer): TColor;
  public
     { Public declarations }
  end;

var
  FMControlErroresFactura : TFMControlErroresFactura;

implementation

uses UDMMain, UDMControlErroresFactura;

{$R *.dfm}

procedure TFMControlErroresFactura.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TDMControlErroresFactura, DMControlErroresFactura);
  ControlEdit := CEMain;
  RellenaTablaColor;
end;

procedure TFMControlErroresFactura.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(DMControlErroresFactura);
  Action := caFree;
end;

procedure TFMControlErroresFactura.DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
var
  agrupado : integer;
begin
  with DBGMain do
  begin
     if (Column.Field.FieldName <> 'TEXTO_ERROR') then
        if ((DMControlErroresFactura.QMErrores['EMPRESA'] <> null) or
           (DMControlErroresFactura.QMErrores['EMPRESA'] <> 0)) then
        begin
           with Canvas do
           begin
              agrupado := DMControlErroresFactura.QMErrores.FieldByName('AGRUPACION').AsInteger;
              if (agrupado <> 0) then
                 Brush.Color := DameSiguienteColor(agrupado);
              FillRect(Rect);
           end;
        end;
     DBGMain.DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFMControlErroresFactura.RellenaTablaColor;
begin
  TabladeColor[0] := clAqua;
  TabladeColor[1] := clBlue;
  TabladeColor[2] := clCream;
  TabladeColor[3] := clDkGray;
  TabladeColor[4] := clFuchsia;
  TabladeColor[5] := clGreen;

  TabladeColor[6] := clLime;
  TabladeColor[7] := clLtGray;
  TabladeColor[8] := clMaroon;
  TabladeColor[9] := clMedGray;
  TabladeColor[10] := clMoneyGreen;
  TabladeColor[11] := clNavy;

  TabladeColor[12] := clOlive;
  TabladeColor[13] := clPurple;
  TabladeColor[14] := clRed;
  TabladeColor[15] := clSilver;
  TabladeColor[16] := clSkyBlue;
  TabladeColor[17] := clTeal;

  TabladeColor[18] := clInfoText;
  TabladeColor[19] := clGradientActiveCaption;
  TabladeColor[20] := clGradientInactiveCaption;
end;

function TFMControlErroresFactura.DameSiguienteColor(Color: integer): TColor;
var
  maxcolor : integer;
begin
  maxcolor := Color;

  maxcolor := maxcolor mod 20;

  Result := TabladeColor[maxcolor];
end;

end.
