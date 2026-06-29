unit UProFMCostesTEsc;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, ULFToolBar, ExtCtrls, ULFPanel, StdCtrls,
  Mask, DBCtrls, ULFDBEdit, URightMaskEdit, ULFEdit, ULFLabel, Grids, FIBQuery, HYFIBQuery,
  UFPEditSinNavegador, rxPlacemnt, ULFFormStorage, ActnList, ULFActionList,
  Menus, UTeclas, UControlEdit, UEditPanel;

type
  TProFMCostesTEsc = class(TFPEditSinNavegador)
     LCosteTotal: TLFLabel;
     LCosteTrabajoExterno: TLFLabel;
     LCosteMaquina: TLFLabel;
     LCosteManoObra: TLFLabel;
     LCosteMaterial: TLFLabel;
     LCosteVarios: TLFLabel;
     LCosteFijo: TLFLabel;
     DBECosteFijo: TLFDbedit;
     DBECosteVarios: TLFDbedit;
     DBECosteMO: TLFDbedit;
     DBECosteMaq: TLFDbedit;
     DBECosteTrabExt: TLFDbedit;
     ETituloCompuesto: TLFEdit;
     DBEEscandallo: TLFDbedit;
     LEscandallo: TLFLabel;
     LCompuesto: TLFLabel;
     DBECompuesto: TLFDbedit;
     DBECosteMat: TLFDbedit;
     DBECosteTotal: TLFDbedit;
     SGCostesEsc: TStringGrid;
     LUnidades: TLFLabel;
     DBEUnidad: TLFDbedit;
     LCosteUnitario: TLFLabel;
     DBECOSTE_UNITARIO: TLFDbedit;
     LCosteMaquinaAbs: TLFLabel;
     DBECosteMaqAbs: TLFDbedit;
     LCosteManoObraAbs: TLFLabel;
     DBECosteMOAbs: TLFDbedit;
     LCosteVariosAbs: TLFLabel;
     DBECosteVariosAbs: TLFDbedit;
     LCosteTrabajoExternoAbs: TLFLabel;
     DBECosteTrabExtAbs: TLFDbedit;
     procedure DBECompuestoChange(Sender: TObject);
     procedure SGCostesEscSetEditText(Sender: TObject; ACol, ARow: integer; const Value: string);
     procedure SGCostesEscDrawCell(Sender: TObject; ACol, ARow: integer; Rect: TRect; State: TGridDrawState);
     procedure SGCostesEscSelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
  private
     { Private declarations }
  public
     { Public declarations }
     procedure AbreDatos(Origen: string);
  end;

var
  ProFMCostesTEsc : TProFMCostesTEsc;

implementation

uses UDMMain, UProDMEscandallo, UEntorno, UFormGest, UUtiles, UDameDato;

{$R *.dfm}

procedure TProFMCostesTEsc.AbreDatos(Origen: string);
begin
  DBEUnidad.Text := '1';
  with ProDMEscandallo do
  begin
     xCostesTEsc.Close;
     xCostesTEsc.Open;
  end;
end;

procedure TProFMCostesTEsc.DBECompuestoChange(Sender: TObject);
begin
  ETituloCompuesto.Text := DameTituloArticulo(DBECompuesto.Text);
end;

procedure TProFMCostesTEsc.SGCostesEscSetEditText(Sender: TObject; ACol, ARow: integer; const Value: string);
begin
  with TStringGrid(Sender) do
  begin
     // Si editamos las unidades
     if (aCol = 0) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Clear;
              SQL.Add('SELECT COSTE_FIJO, COSTE_MATER, COSTE_MAQUI_VAR, COSTE_MAQUI_ABS, COSTE_MOBRA_VAR, COSTE_MOBRA_ABS, ');
              SQL.Add('COSTE_VAR_VAR, COSTE_VAR_ABS, COSTE_TEXTE_VAR, COSTE_TEXTE_ABS, COSTE_UNITARIO, COSTE_TOTAL ');
              SQL.Add('FROM PRO_DAME_COSTES_ESCANDALLO(?EMPRESA, ?TIPO, ?ESCANDALLO, ?CANTIDAD)');
              Params.ByName['EMPRESA'].AsInteger := ProDMEscandallo.QMProEscandalloEMPRESA.AsInteger;
              Params.ByName['ESCANDALLO'].AsInteger := ProDMEscandallo.QMProEscandalloESCANDALLO.AsInteger;
              Params.ByName['TIPO'].AsString := ProDMEscandallo.QMProEscandalloTIPO.AsString;
              Params.ByName['CANTIDAD'].AsInteger := StrToIntDef(Value, 0);
              ExecQuery;

              Cells[1, Arow] := FormatFloat(',0.00', FieldByName['COSTE_FIJO'].AsFloat);
              Cells[2, Arow] := FormatFloat(',0.00', FieldByName['COSTE_MATER'].AsFloat);
              Cells[3, Arow] := FormatFloat(',0.00', FieldByName['COSTE_MAQUI_VAR'].AsFloat);
              Cells[4, Arow] := FormatFloat(',0.00', FieldByName['COSTE_MAQUI_ABS'].AsFloat);
              Cells[5, Arow] := FormatFloat(',0.00', FieldByName['COSTE_MOBRA_VAR'].AsFloat);
              Cells[6, Arow] := FormatFloat(',0.00', FieldByName['COSTE_MOBRA_ABS'].AsFloat);
              Cells[7, Arow] := FormatFloat(',0.00', FieldByName['COSTE_VAR_VAR'].AsFloat);
              Cells[8, Arow] := FormatFloat(',0.00', FieldByName['COSTE_VAR_ABS'].AsFloat);
              Cells[9, Arow] := FormatFloat(',0.00', FieldByName['COSTE_TEXTE_VAR'].AsFloat);
              Cells[10, Arow] := FormatFloat(',0.00', FieldByName['COSTE_TEXTE_ABS'].AsFloat);
              Cells[11, Arow] := FormatFloat(',0.00', FieldByName['COSTE_TOTAL'].AsFloat);
              Cells[12, Arow] := FormatFloat(',0.00', FieldByName['COSTE_UNITARIO'].AsFloat);

              FreeHandle;
           finally
              Free;
           end;
        end;

        // Una nueva fila
        if (aRow = RowCount - 1) then
           RowCount := RowCount + 1;
     end;
  end;
end;

procedure TProFMCostesTEsc.SGCostesEscDrawCell(Sender: TObject; ACol, ARow: integer; Rect: TRect; State: TGridDrawState);
begin
  inherited;

  with TStringGrid(Sender) do
  begin
     if gdFocused in State then
        ColorFocused(Canvas)
     else
     begin
        if (ACol = 0) then
           ColorEdicion(Canvas)
        else
        if (ACol > 0) and (ACol < 12) then
           ColorInfo(Canvas)
        else
           ColorResaltado(Canvas);
     end;

     // Justificar a la derecha
     Canvas.TextRect(Rect, Rect.Right - 2 - Canvas.TextWidth(Cells[ACol, ARow]), Rect.Top + 2, Cells[ACol, ARow]);
     // Justificar al centro
     // Canvas.TextRect(Rect,(Rect.Left + Rect.Right - Canvas.TextWidth(Cells[ACol, ARow])) div 2, Rect.Top + 2, Cells[ACol, ARow]);
     // Justificar a la izquierda
     // Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2, Cells[ACol, ARow]);
  end;
end;

procedure TProFMCostesTEsc.SGCostesEscSelectCell(Sender: TObject; ACol, ARow: integer; var CanSelect: boolean);
begin
  inherited;

  // Solo primera columna editable
  with TStringGrid(Sender) do
  begin
     if (ACol = 0) then
        Options := Options + [goEditing]
     else
        Options := Options - [goEditing];
  end;
end;

end.
