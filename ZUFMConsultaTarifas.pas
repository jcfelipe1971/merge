unit ZUFMConsultaTarifas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, UFPEditSinNavegador, Mask, DBCtrls, ULFDBEdit, StdCtrls,
  UFIBDBEditfind, UComponentesBusquedaFiltrada, ULFEditFind2000, ULFLabel,
  rxPlacemnt, ULFFormStorage, ActnList, ULFActionList, Menus, UTeclas,
  UControlEdit, UEditPanel, ToolWin, ComCtrls, ULFToolBar, ExtCtrls,
  ULFPanel, ULFEdit, Grids, HYFIBQuery, ComObj, TFlatCheckBoxUnit,
  ULFCheckBox;

type
  TZFMConsultaTarifas = class(TFPEditSinNavegador)
     LModelo: TLFLabel;
     LFModelos: TLFEditFind2000;
     LFTipoLona: TLFEditFind2000;
     LTipoLona: TLFLabel;
     LTarifa: TLFLabel;
     LFTarifas: TLFEditFind2000;
     DescTipoLona: TLFEdit;
     DescTarifa: TLFEdit;
     TSep1: TToolButton;
     TButtCargarDatos: TToolButton;
     PNLPrecios: TLFPanel;
     StringGridTarifas: TStringGrid;
     ACargarDatos: TAction;
     LFCategoryAction1: TLFCategoryAction;
     DescModelo: TLFEdit;
     AExportar: TAction;
     LFCBColor: TLFCheckBox;
     RGPrecio: TRadioGroup;
     AExportarExcelLineal: TAction;
     procedure FormCreate(Sender: TObject);
     procedure LFTipoLonaChange(Sender: TObject);
     procedure LFTarifasChange(Sender: TObject);
     procedure ACargarDatosExecute(Sender: TObject);
     procedure LFModelosChange(Sender: TObject);
     procedure StringGridTarifasDrawCell(Sender: TObject; ACol, ARow: integer; Rect: TRect; State: TGridDrawState);
     procedure AExportarExecute(Sender: TObject);
     procedure AExportarExcelLinealExecute(Sender: TObject);
     procedure FormClose(Sender: TObject; var Action: TCloseAction);
     procedure RGPrecioClick(Sender: TObject);
     procedure LFCBColorClick(Sender: TObject);
  private
     { Private declarations }
     procedure CrearGridPrecios;
     function SaveAsExcelFile(AGrid: TStringGrid; AFileName: string): boolean;
     function SaveAsExcelFile_Lineal(AGrid: TStringGrid; AFileName: string): boolean;
     procedure XlsWriteCellLabel(XlsStream: TStream; const ACol, ARow: word; const AValue: string);
  public
     { Public declarations }
  end;

var
  ZFMConsultaTarifas : TZFMConsultaTarifas;

implementation

uses UDMMain, UUtiles, UDameDato, UEntorno, UFormGest, ZUDMConsultaTarifas, DB, FIBDataSetRO, FIBQuery;

{$R *.dfm}

procedure TZFMConsultaTarifas.FormCreate(Sender: TObject);
begin
  inherited;
  AbreData(TZDMConsultaTarifas, ZDMConsultaTarifas);
end;

procedure TZFMConsultaTarifas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  CierraData(ZDMConsultaTarifas);
end;

procedure TZFMConsultaTarifas.LFTipoLonaChange(Sender: TObject);
begin
  inherited;
  DescTipoLona.Text := DameTituloTipoLona(LFTipoLona.Text);
  ACargarDatos.Execute;
end;

procedure TZFMConsultaTarifas.LFTarifasChange(Sender: TObject);
begin
  inherited;
  DescTarifa.Text := DameTituloTarifa(LFTarifas.Text);
  ACargarDatos.Execute;
end;

procedure TZFMConsultaTarifas.ACargarDatosExecute(Sender: TObject);
begin
  inherited;
  ZDMConsultaTarifas.FiltrarTabla(LFModelos.Text, LFTipoLona.Text, LFTarifas.Text, LFCBColor.Checked);
  CrearGridPrecios;
end;

procedure TZFMConsultaTarifas.CrearGridPrecios;
var
  i, j, linea, salida : integer;
  precio : double;
  tipo_linea_salida : integer;
begin
  // Borro los datos que haya
  with StringGridTarifas do
  begin
     for i := 0 to ColCount - 1 do
        for j := 0 to RowCount - 1 do
           Cells[i, j] := '';
  end;

  // s'agafa lordre de presentar les tarifes
  tipo_linea_salida := ZDMConsultaTarifas.Dame_tipo_salida_linea(Trim(LFModelos.Text));

  // Recorro xLinea para poner titulos
  with ZDMConsultaTarifas.xLinea do
  begin
     Close;
     Params.ByName['MODELO'].AsString := LFModelos.Text;
     Params.ByName['TIPO_LONA'].AsString := LFTipoLona.Text;
     Params.ByName['TARIFA'].AsString := LFTarifas.Text;
     Params.ByName['COLOR'].AsInteger := integer(LFCBColor.Checked);
     Open;

     // Amplio el StringGrid para acomodar la información
     Last;
     case tipo_linea_salida of
        0: StringGridTarifas.ColCount := RecordCount + 1;
        1: StringGridTarifas.RowCount := RecordCount + 1;
     end;

     First;
     i := 1;
     while not (EOF) do
     begin
        case tipo_linea_salida of
           0: StringGridTarifas.Cells[i, 0] := FieldByName('LINEA').AsString;
           1: StringGridTarifas.Cells[0, i] := FieldByName('LINEA').AsString;
        end;

        Next;
        Inc(i);
     end;
  end;

  // Recorro xSalida para poner titulos
  with ZDMConsultaTarifas.xSalida do
  begin
     Close;
     Params.ByName['MODELO'].AsString := LFModelos.Text;
     Params.ByName['TIPO_LONA'].AsString := LFTipoLona.Text;
     Params.ByName['TARIFA'].AsString := LFTarifas.Text;
     Params.ByName['COLOR'].AsInteger := integer(LFCBColor.Checked);
     Open;

     // Amplio el StringGrid para acomodar la información
     Last;
     case tipo_linea_salida of
        0: StringGridTarifas.RowCount := RecordCount + 1;
        1: StringGridTarifas.ColCount := RecordCount + 1;
     end;

     First;
     i := 1;
     while not (EOF) do
     begin
        case tipo_linea_salida of
           0: StringGridTarifas.Cells[0, i] := FieldByName('SALIDA').AsString;
           1: StringGridTarifas.Cells[i, 0] := FieldByName('SALIDA').AsString;
        end;

        Next;
        Inc(i);
     end;
  end;

  // Rellena StringGrid
  with ZDMConsultaTarifas.QMPreciosTarifas do
  begin
     First;
     while not (EOF) do
     begin
        case tipo_linea_salida of
           0:
           begin
              linea := FieldByName('LINEA').AsInteger;
              salida := FieldByName('SALIDA').AsInteger;
           end;
           1:
           begin
              salida := FieldByName('LINEA').AsInteger;
              linea := FieldByName('SALIDA').AsInteger;
           end;
        end;
        // Precio según RadioButton...
        precio := 0;
        if (rgprecio.ItemIndex = 0) then
           precio := FieldByName('P_VENTA_MODIFICADO').AsFloat
        else
        if (rgprecio.ItemIndex = 1) then
           precio := FieldByName('P_VENTA_ARMAZON_MODIFICADO').AsFloat;

        // Busco la celda segun linea/salida
        i := 1;
        j := 1;
        while ((StringGridTarifas.Cells[i, 0] <> IntToStr(linea)) and (i < StringGridTarifas.ColCount)) do
           Inc(i);
        while ((StringGridTarifas.Cells[0, j] <> IntToStr(salida)) and (j < StringGridTarifas.RowCount)) do
           Inc(j);

        StringGridTarifas.Cells[i, j] := FormatFloat('#,##0.00', precio);

        Next;
     end;
  end;

  // La primera linea y la primera columna son titulos
  if (StringGridTarifas.ColCount > 1) then
     StringGridTarifas.FixedCols := 1;
  if (StringGridTarifas.RowCount > 1) then
     StringGridTarifas.FixedRows := 1;
end;

procedure TZFMConsultaTarifas.LFModelosChange(Sender: TObject);
begin
  inherited;
  DescModelo.Text := ZDMConsultaTarifas.DameTituloModelo(LFModelos.Text);
  ACargarDatos.Execute;
end;

procedure TZFMConsultaTarifas.StringGridTarifasDrawCell(Sender: TObject; ACol, ARow: integer; Rect: TRect; State: TGridDrawState);
var
  sCad : string;
  i : integer;
begin
  inherited;
  if ARow = 0 then
  begin
     if StringGridTarifas.Cells[ACol, ARow] <> '' then
     begin
        sCad := StringGridTarifas.Cells[ACol, ARow];
        with StringGridTarifas do
           with Canvas, Rect do
           begin
              i := Left + TextWidth(sCad + ' ');
              Canvas.FillRect(Rect);
              Canvas.TextOut(i, Top + 2, sCad);
           end;
     end;
  end
  else
  if StringGridTarifas.Cells[ACol, ARow] <> '' then
  begin
     sCad := StringGridTarifas.Cells[ACol, ARow];
     with StringGridTarifas do
        with Canvas, Rect do
        begin
           i := Right - TextWidth(sCad + ' ');
           Canvas.FillRect(Rect);
           Canvas.TextOut(i, Top + 2, sCad);
        end;
  end;
end;

procedure TZFMConsultaTarifas.AExportarExecute(Sender: TObject);
var
  Archivo : string;
begin
  inherited;
  Archivo := Format('Tarifa-%s-%s-%s_%s.xls', [LFModelos.Text, LFTipoLona.Text, LFTarifas.Text, FormatDateTime('yyyymmdd-hhnnss', Now)]);
  if MySaveDialog(Archivo, 'XLS', '', 'ZFMConsultaTarifas') then
  begin
     SaveAsExcelFile(StringGridTarifas, Archivo);
     ShowMessage(_('Exportación finalizada'));
  end;
end;

procedure TZFMConsultaTarifas.XlsWriteCellLabel(XlsStream: TStream; const ACol, ARow: word; const AValue: string);
var
  L : word;
const
  {$J+}
  CXlsLabel: array[0..5] of word = ($204, 0, 0, 0, 0, 0);
  {$J-}
begin
  L := Length(AValue);
  CXlsLabel[1] := 8 + L;
  CXlsLabel[2] := ARow;
  CXlsLabel[3] := ACol;
  CXlsLabel[5] := L;
  XlsStream.WriteBuffer(CXlsLabel, SizeOf(CXlsLabel));
  XlsStream.WriteBuffer(Pointer(AValue)^, L);
end;

function TZFMConsultaTarifas.SaveAsExcelFile(AGrid: TStringGrid; AFileName: string): boolean;
const
  {$J+}
  CXlsBof: array[0..5] of word = ($809, 8, 00, $10, 0, 0);
{$J-}
  CXlsEof: array[0..1] of word = ($0A, 00);
var
  FStream : TFileStream;
  I, J : integer;
begin
  FStream := TFileStream.Create(PChar(AFileName), fmCreate or fmOpenWrite);
  try
     CXlsBof[4] := 0;
     FStream.WriteBuffer(CXlsBof, SizeOf(CXlsBof));
     for i := 0 to AGrid.ColCount - 1 do
        for j := 0 to AGrid.RowCount - 1 do
           XlsWriteCellLabel(FStream, I, J, AGrid.Cells[i, j]);
     FStream.WriteBuffer(CXlsEof, SizeOf(CXlsEof));
     Result := True;
  finally
     FStream.Free;
  end;
end;

procedure TZFMConsultaTarifas.AExportarExcelLinealExecute(Sender: TObject);
var
  Archivo : string;
begin
  inherited;
  Archivo := Format('Tarifa-%s-%s-%s_%s.xls', [LFModelos.Text, LFTipoLona.Text, LFTarifas.Text, FormatDateTime('yyyymmdd-hhnnss', Now)]);
  if MySaveDialog(Archivo, 'XLS', '', 'ZFMConsultaTarifas') then
  begin
     SaveAsExcelFile_Lineal(StringGridTarifas, Archivo);
     ShowMessage(_('Exportación finalizada'));
  end;
end;

function TZFMConsultaTarifas.SaveAsExcelFile_Lineal(AGrid: TStringGrid; AFileName: string): boolean;
const
  {$J+}
  CXlsBof: array[0..5] of word = ($809, 8, 00, $10, 0, 0);
  {$J-}
  CXlsEof: array[0..1] of word = ($0A, 00);
var
  FStream : TFileStream;
  I, J, k : integer;
begin
  inherited;
  FStream := TFileStream.Create(PChar(AFileName), fmCreate or fmOpenWrite);
  try
     CXlsBof[4] := 0;
     FStream.WriteBuffer(CXlsBof, SizeOf(CXlsBof));
     k := 1;
     // S'escriu la capçalera
     XlsWriteCellLabel(FStream, 0, 0, 'CODIGO');
     XlsWriteCellLabel(FStream, 1, 0, 'TITULO');
     XlsWriteCellLabel(FStream, 2, 0, 'PRECIO');
     XlsWriteCellLabel(FStream, 3, 0, 'FAMILIA');
     XlsWriteCellLabel(FStream, 4, 0, 'TITULO_FAMILIA');

     for i := 0 to AGrid.ColCount - 1 do
        for j := 0 to AGrid.RowCount - 1 do
        begin
           if ((i <> 0) and (j <> 0) and (AGrid.Cells[j, i] <> '')) then
           begin
              XlsWriteCellLabel(FStream, 0, k, Trim(LFModelos.Text) + AGrid.Cells[j, 0] + AGrid.Cells[0, i] + LFTipoLona.Text);
              XlsWriteCellLabel(FStream, 1, k, DescModelo.Text + ' ' + AGrid.Cells[j, 0] + 'x' + AGrid.Cells[0, i] + ' ' + DescTipoLona.Text);
              XlsWriteCellLabel(FStream, 2, k, AGrid.Cells[j, i]);
              XlsWriteCellLabel(FStream, 3, k, LFModelos.Text);
              XlsWriteCellLabel(FStream, 4, k, DescModelo.Text);
              Inc(k);
           end;
        end;
     FStream.WriteBuffer(CXlsEof, SizeOf(CXlsEof));
     Result := True;
  finally
     FStream.Free;
  end;
end;

procedure TZFMConsultaTarifas.RGPrecioClick(Sender: TObject);
begin
  inherited;
  ACargarDatos.Execute;
end;

procedure TZFMConsultaTarifas.LFCBColorClick(Sender: TObject);
begin
  inherited;
  ACargarDatos.Execute;
end;

end.
