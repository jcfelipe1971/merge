unit UFPEdit;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, Grids, DBGrids, UHYDBGrid, ComCtrls, UEditPanel, UNavigator,
  ToolWin, UControlEdit, Menus, UTeclas, StdCtrls, DB, UFormGest, NsDBGrid,
  rxPlacemnt, URecursos, ULFFormStorage, ActnList, ULFActionList, ULFToolBar,
  ULFPanel, ULFPageControl, Math, UG2kTBLoc, UFPEditSimple;

type
  TCondicion = record
     Campo: string;
     Comparacion: string;
     TipoValor: char;
     Valor: string;
     ColorFondo: TColor;
     ColorFuente: TColor;
  end;

  TACondicion = array of TCondicion;

type
  TFPEdit = class(TFPEditSimple)
     PCMain: TLFPageControl;
     TSFicha: TTabSheet;
     PEdit: TLFPanel;
     TSTabla: TTabSheet;
     DBGMain: THYTDBGrid;
     G2KTableLoc: TG2KTBLoc;
     procedure TSTablaShow(Sender: TObject);
     procedure TSFichaShow(Sender: TObject);
     procedure FormCreate(Sender: TObject);
     procedure DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
  private
     CondicionTabla: TACondicion;
     function ComparaValor(v1: integer; Comparacion: string; v2: integer): boolean; overload;
     function ComparaValor(v1: double; Comparacion: string; v2: double): boolean; overload;
     function ComparaValor(v1: string; Comparacion: string; v2: string): boolean; overload;
     // la de Float se utiliza para esta function ComparaValor(v1 : TDatetime; Comparacion : string; v2: TDatetime) : boolean; overload;
     function CumpleCondicion(DS: TDataSet; Condicion: TCondicion): boolean;
  public
     procedure CargaCondicion(ACampo: string; AComparacion: string; ATipoValor: char; AValor: string; AColorFondo, AColorFuente: TColor);
  end;

var
  FPEdit : TFPEdit;

implementation

uses UDMMain, UFMain, UEntorno, UUtiles;

{$R *.DFM}

{published}

procedure TFPEdit.FormCreate(Sender: TObject);
begin
  inherited;
  PCMain.ActivePage := TSFicha;
  {$IFDEF Debug}
  // CargaCondicion('LIQUIDO', '>', 'F', FloatToStr(1000), clFuchsia, clWhite);
  // CargaCondicion('ESTADO', '=', 'I', IntToStr(5), clLime, clBlack);
  CargaCondicion('CLIENTE', '<', 'I', IntToStr(0), $005B6AFF, clBlack);
  {$ENDIF}
end;

procedure TFPEdit.TSTablaShow(Sender: TObject);
begin
  DBGMain.SetFocus;
  PopUpMenu := CEMainPMEdit;
end;

procedure TFPEdit.TSFichaShow(Sender: TObject);
begin
  inherited;
  PopUpMenu := CEMainPMEdit;
end;

procedure TFPEdit.DBGMainDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: integer; Column: TColumn; State: TGridDrawState);
var
  i : integer;
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
        // Recorro condiciones
        for i := 0 to Length(CondicionTabla) - 1 do
        begin
           // Me aseguro de que el campo exista
           if Assigned(THYTDBGrid(Sender).DataSource.DataSet.FindField(CondicionTabla[i].Campo)) then
           begin
              // Me aseguro de que el campo contra el que se va a comparar exista o que se compare contra un valor
              if ((CondicionTabla[i].TipoValor <> 'C') or Assigned(THYTDBGrid(Sender).DataSource.DataSet.FindField(CondicionTabla[i].Valor))) then
              begin
                 if (CumpleCondicion(THYTDBGrid(Sender).DataSource.DataSet, CondicionTabla[i])) then
                 begin
                    with Canvas do
                    begin
                       Brush.Color := CondicionTabla[i].ColorFondo;
                       Font.Color := CondicionTabla[i].ColorFuente;
                    end;
                 end;
              end;
           end;
        end;
     end;

     DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;
end;

procedure TFPEdit.CargaCondicion(ACampo: string; AComparacion: string; ATipoValor: char; AValor: string; AColorFondo, AColorFuente: TColor);
var
  i : integer;
begin
  // Agrego elemento al array
  i := Length(CondicionTabla);
  SetLength(CondicionTabla, i + 1);

  with CondicionTabla[i] do
  begin
     Campo := ACampo;
     Comparacion := AComparacion;
     TipoValor := ATipoValor;
     Valor := AValor;
     ColorFondo := AColorFondo;
     ColorFuente := AColorFuente;
  end;
end;

function TFPEdit.CumpleCondicion(DS: TDataSet; Condicion: TCondicion): boolean;
begin
  with Condicion do
  begin
     case TipoValor of
        'I': Result := ComparaValor(DS.FieldByName(Campo).AsInteger, Comparacion, StrToInt(Valor));
        'F': Result := ComparaValor(DS.FieldByName(Campo).AsFloat, Comparacion, StrToFloat(Valor));
        'D': Result := ComparaValor(DS.FieldByName(Campo).AsDateTime, Comparacion, StrToDateTime(Valor));
        'S': Result := ComparaValor(DS.FieldByName(Campo).AsString, Comparacion, Valor);
        'C':
        begin
           if DS.FieldByName(Campo).DataType in [ftSmallint, ftInteger, ftWord] then
              Result := ComparaValor(DS.FieldByName(Campo).AsInteger, Comparacion, DS.FieldByName(Valor).AsInteger)
           else
           if DS.FieldByName(Campo).DataType in [ftFloat, ftCurrency] then
              Result := ComparaValor(DS.FieldByName(Campo).AsFloat, Comparacion, DS.FieldByName(Valor).AsFloat)
           else
           if DS.FieldByName(Campo).DataType in [ftDateTime, ftDate, ftTime] then
              Result := ComparaValor(DS.FieldByName(Campo).AsDateTime, Comparacion, DS.FieldByName(Valor).AsDateTime)
           else
              Result := ComparaValor(DS.FieldByName(Campo).AsString, Comparacion, DS.FieldByName(Valor).AsString);
        end;
        else
           Result := False;
     end;
  end;
end;

function TFPEdit.ComparaValor(v1: integer; Comparacion: string; v2: integer): boolean;
begin
  Result := False;
  if (Comparacion = '=') then
     Result := (v1 = v2)
  else
  if (Comparacion = '>=') then
     Result := (v1 >= v2)
  else
  if (Comparacion = '<=') then
     Result := (v1 <= v2)
  else
  if (Comparacion = '>') then
     Result := (v1 > v2)
  else
  if (Comparacion = '<') then
     Result := (v1 < v2)
  else
  if (Comparacion = '<>') then
     Result := (v1 <> v2);
end;

function TFPEdit.ComparaValor(v1: double; Comparacion: string; v2: double): boolean;
begin
  Result := False;
  if (Comparacion = '=') then
     Result := (v1 = v2)
  else
  if (Comparacion = '>=') then
     Result := (v1 >= v2)
  else
  if (Comparacion = '<=') then
     Result := (v1 <= v2)
  else
  if (Comparacion = '>') then
     Result := (v1 > v2)
  else
  if (Comparacion = '<') then
     Result := (v1 < v2)
  else
  if (Comparacion = '<>') then
     Result := (v1 <> v2);
end;

function TFPEdit.ComparaValor(v1, Comparacion, v2: string): boolean;
begin
  Result := False;
  if (Comparacion = '=') then
     Result := (v1 = v2)
  else
  if (Comparacion = '>=') then
     Result := (v1 >= v2)
  else
  if (Comparacion = '<=') then
     Result := (v1 <= v2)
  else
  if (Comparacion = '>') then
     Result := (v1 > v2)
  else
  if (Comparacion = '<') then
     Result := (v1 < v2)
  else
  if (Comparacion = '<>') then
     Result := (v1 <> v2);
end;

{ La de Float se utiliza para esta
function TFPEdit.ComparaValor(v1: TDatetime; Comparacion: string;
  v2: TDatetime): boolean;
begin
  if (Comparacion = '=') then
     Result := (v1 = v2)
  else
  if (Comparacion = '>=') then
     Result := (v1 >= v2)
  else
  if (Comparacion = '<=') then
     Result := (v1 <= v2)
  else
  if (Comparacion = '>') then
     Result := (v1 > v2)
  else
  if (Comparacion = '<') then
     Result := (v1 < v2)
  else
  if (Comparacion = '<>') then
     Result := (v1 <> v2);
end;
}
end.
