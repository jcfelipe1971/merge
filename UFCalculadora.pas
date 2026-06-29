(******************************************)
(*            CalcGest 2000               *)
(*      Calculadora para Gest-2000        *)
(*              v 1.0 Beta                *)
(*       (c) 1999 Helio Yago, S.L         *)
(*      Coding : Armando Pérez Abad       *)
(******************************************)

unit UFCalculadora;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, Menus, ToolWin, ComCtrls, DB, UControlEdit,
  ULFToolBar, ULFPanel, ULFMemo;

const
  MLenCifras = 16;
  Ninguna = 0;
  Suma = 1;
  Resta = 2;
  Multiplicacion = 3;
  Division = 4;
  Raiz = 5;
  Inverso = 6;
  P100 = 7;

type
  TFCalculadora = class(THYForm)
     Timer1: TTimer;
     PNLBotones: TLFPanel;
     PNLResult: TLFPanel;
     MMPantalla: TLFMemo;
     MMPantallaVisible: TLFMemo;
     PNL1: TLFPanel;
     TBCalc: TLFToolBar;
     BBMStore: TBitBtn;
     BBMResult: TBitBtn;
     BBMCero: TBitBtn;
     BBDiv: TBitBtn;
     BB6: TBitBtn;
     BBBorradoParcial: TBitBtn;
     BB8: TBitBtn;
     BB9: TBitBtn;
     BBPor: TBitBtn;
     BBMMas: TBitBtn;
     BBBorradoTotal: TBitBtn;
     BBBackSpace: TBitBtn;
     BBSqr: TBitBtn;
     BB3: TBitBtn;
     BB2: TBitBtn;
     BB5: TBitBtn;
     BB7: TBitBtn;
     BB4: TBitBtn;
     BB1: TBitBtn;
     BBPCien: TBitBtn;
     BBInv: TBitBtn;
     BBResta: TBitBtn;
     BBDec: TBitBtn;
     BBMm: TBitBtn;
     BB0: TBitBtn;
     BBigual: TBitBtn;
     BBSuma: TBitBtn;
     BBOK: TBitBtn;
     TButt1: TToolButton;
     BBCancel: TBitBtn;

     function CheckDecimal(Valor: extended): boolean;
     procedure FlipOperator;
     procedure ShowTotal;
     procedure InitVariables;
     procedure ShowPantalla(ExtendedTemp: extended);
     procedure FormCreate(Sender: TObject);
     procedure Salida(Sender: TObject; var Action: TCloseAction);
     procedure PulsaNumero(Sender: TObject);
     procedure BBDecClick(Sender: TObject);
     procedure BBBorradoTotalClick(Sender: TObject);
     procedure BBSumaClick(Sender: TObject);
     procedure BBRestaClick(Sender: TObject);
     procedure BBMmClick(Sender: TObject);
     procedure BBPorClick(Sender: TObject);
     procedure BBDivClick(Sender: TObject);
     procedure BBigualClick(Sender: TObject);
     procedure B(Sender: TObject);
     procedure BBSqrClick(Sender: TObject);
     procedure BBInvClick(Sender: TObject);
     procedure PSuma;
     procedure PResta;
     procedure PMultiplicacion;
     procedure PDivision;
     procedure ExecuteOperator;
     procedure PBorradoParcial;
     procedure BBBackSpaceClick(Sender: TObject);
     procedure PNumero(Numero: string);
     procedure PIgual;
     procedure FormKeyPress(Sender: TObject; var Key: char);
     procedure BBPCienClick(Sender: TObject);
     procedure PPCien;
     function QuitaCeros(Cadena: string): string;
     function CuentaCeros(Cadena: string): byte;
     procedure Timer1Timer(Sender: TObject);
     procedure BBMMasClick(Sender: TObject);
     procedure BBMResultClick(Sender: TObject);
     procedure BBMCeroClick(Sender: TObject);
     procedure BBMStoreClick(Sender: TObject);
     procedure BBOKClick(Sender: TObject);
     procedure FormKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
     procedure BBCancelClick(Sender: TObject);
  private
     { Private declarations }
     Total: extended;
     Operator2: extended;
     MemoryStore: extended;
     FOpActivo: boolean; // 0 : 1 / 1 : 2
     Decimal: boolean;
     Igual: boolean;
     Cambio: boolean;
     Interrupcion: boolean;
     Cifras: byte;
     Operacion: byte;
     NUndo: byte;
     StrTemp: string;  // Resultado Temporal
     AUndo: array [0..34] of string;
     function QuitaPuntosFormato(Cadena: string): string;
  public
     { Public declarations }
     procedure Muestra(Campo: TField);
  end;

var
  FCalculadora : TFCalculadora;
  resulreal : extended;
  resulentero : integer;

implementation

uses UDMMain, UUtiles;

{$R *.DFM}

(* Inicializacion general de variables *)

procedure TFCalculadora.InitVariables;
begin
  MMPantalla.Text := '0' + DecimalSeparator;
  Total := 0;
  Operator2 := 0;
  Cifras := 0;
  NUndo := 0;
  FOpActivo := False;
  Decimal := False;
  Igual := False;
  Cambio := False;
  StrTemp := '';
  Operacion := Ninguna;
  AUndo[NUndo] := '0';
end;

(* FormCreate : Inicializa *)

procedure TFCalculadora.FormCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  InitVariables;
  Interrupcion := True;
  MemoryStore := 0;

  // Asigno Imagenes a Botones
  GetBitmapFromImageList(BBOK, 1, DMMain.ILMain_Ac, 19);
  GetBitmapFromImageList(BBCancel, 1, DMMain.ILMain_Ac, 0);
end;

(* Check Decimal*)
(* Chequea si el valor pasado tiene parte decimal *)

function TFCalculadora.CheckDecimal(Valor: extended): boolean;
var
  IntTemp : integer;
begin
  IntTemp := Trunc(Valor);
  if (Valor - IntTemp) = 0 then
     Result := False
  else
     Result := True;
end;

(* Devuelve la cadena parámetro sin ceros después de los decimales *)

function TFCalculadora.QuitaCeros(Cadena: string): string;
var
  Lo, I, H : integer;
  Coma : boolean;
begin
  Lo := Length(Cadena);
  Coma := False;
  for I := Lo downto 1 do
  begin
     if Cadena[I] = DecimalSeparator then
        Coma := True;
     if Coma = False then
        if Cadena[I] = '0' then
        begin
           Result := '';
           for H := 1 to I - 1 do
           begin
              Result := Result + Cadena[H];
           end;
        end
        else
           Coma := True;
  end;
end;

(* Cuenta los Ceros decimales por la derecha *)

function TFCalculadora.CuentaCeros(Cadena: string): byte;
var
  Lo, I : integer;
  Coma : boolean;
begin
  Result := 0;
  Lo := Length(Cadena);
  Coma := False;
  if Coma = False then
     Cadena := Cadena + DecimalSeparator;
  Coma := False;
  for I := Lo downto 1 do
  begin
     if Cadena[I] = DecimalSeparator then
        Coma := True;
     if Coma = False then
        if Cadena[I] = '0' then
           Inc(Result)
        else
           Coma := True;
  end;
end;

(* Intercambia Operador activo*)

procedure TFCalculadora.FlipOperator;
begin
  if FOpActivo then
  begin
     Operator2 := StrToFloat(StrTemp);
  end
  else
  begin
     Total := StrToFloat(StrTemp);
     FOpActivo := True;
  end;
end;

(* Muestra el valor total segun decimal *)

procedure TFCalculadora.ShowTotal;
begin
  MMPantalla.Text := FloatToStr(Total);
  Decimal := False;
  Cifras := 0;
end;

(* Muestra en la pantalla el valor pasado en ExtendedTemp *)

procedure TFCalculadora.ShowPantalla(ExtendedTemp: extended);
begin
  Decimal := False;
  MMPantalla.Text := FloatToStr(ExtendedTemp);
  Cifras := 0;
end;

(* Salida del programa *)

procedure TFCalculadora.Salida(Sender: TObject; var Action: TCloseAction);
begin
  action := caFree;
end;

(* Evento : Se pulsa un numero de la calculadora *)

procedure TFCalculadora.PulsaNumero(Sender: TObject);
begin
  PNumero(TBitBtn(Sender).Caption);
  ActiveControl := BBIgual;
end;

(* Procesa el Numero pasado *)

procedure TFCalculadora.PNumero(Numero: string);
begin
  if (Decimal = False) and (StrToFloat(MMPantalla.Text) = 0) and (Numero = '0') then
     Exit;

  Interrupcion := True;
  if Igual = True then
  begin
     FOpActivo := False;
  end;

  if cambio = True then
  begin
     StrTemp := '';
     Cambio := False;
  end;

  if (Cifras < MLenCifras) then
  begin
     Inc(Cifras);
     Inc(NUndo);
     StrTemp := StrTemp + Numero;
  end
  else
     beep;

  MMPantalla.Text := StrTemp;
  AUndo[NUndo] := StrTemp;
end;

(* Pulsado del botón de decimal *)

procedure TFCalculadora.BBDecClick(Sender: TObject);
begin
  if (Decimal = False) then
  begin
     Cifras := 0;
     Decimal := True;
     StrTemp := StrTemp + DecimalSeparator;
  end
  else
     beep;
end;

(* Borrado total de Datos *)

procedure TFCalculadora.BBBorradoTotalClick(Sender: TObject);
begin
  InitVariables;
  ActiveControl := BBIgual;
  Interrupcion := True;
end;

(* Pulsa botón borrado parcial *)

procedure TFCalculadora.B(Sender: TObject);
begin
  PBorradoParcial;
  ActiveControl := BBIgual;
end;

(* Borrado parcial de Datos *)

procedure TFCalculadora.PBorradoParcial;
begin
  if FOpActivo then
     Operator2 := 0
  else
     Total := 0;
  StrTemp := '';
  MMPantalla.Text := '0';
  Operacion := Ninguna;
  Cambio := False;
end;

(* Pulsado de boton suma *)

procedure TFCalculadora.BBSumaClick(Sender: TObject);
begin
  ActiveControl := BBIgual;
  if Igual = True then
  begin
     Igual := False;
     StrTemp := MMPantalla.Text;
     FlipOperator;
     Cambio := True;
     Operacion := Suma;
     Exit;
  end;

  if (Operacion = Suma) or (Operacion = Ninguna) then
     PSuma
  else
  begin
     ExecuteOperator;
     Operacion := Suma;
  end;
end;

(* Suma *)

procedure TFCalculadora.PSuma;
begin
  if (StrTemp <> '') or (Igual = True) then
  begin
     if Igual = False then
        FlipOperator;
     Total := Total + Operator2;
     ShowTotal;
     StrTemp := '';
     Operacion := Suma;
     NUndo := 0;
     Cifras := 0;
  end;
end;

(* Pulsado de botón Resta *)

procedure TFCalculadora.BBRestaClick(Sender: TObject);
begin
  ActiveControl := BBIgual;
  if Igual = True then
  begin
     Igual := False;
     StrTemp := MMPantalla.Text;
     FlipOperator;
     Cambio := True;
     Operacion := Resta;
     Exit;
  end;
  if (Operacion = Resta) or (Operacion = Ninguna) then
     PResta
  else
  begin
     ExecuteOperator;
     Operacion := Resta;
  end;
end;

(* Resta *)

procedure TFCalculadora.PResta;
begin
  if (StrTemp <> '') or (Igual = True) then
  begin
     if Igual = False then
        FlipOperator;
     Total := Total - Operator2;
     ShowTotal;
     StrTemp := '';
     Operacion := Resta;
     NUndo := 0;
     Cifras := 0;
  end;
end;

(* Pulsado de Boton Multiplicacion *)

procedure TFCalculadora.BBPorClick(Sender: TObject);
begin
  ActiveControl := BBIgual;
  if Igual = True then
  begin
     Igual := False;
     StrTemp := MMPantalla.Text;
     FlipOperator;
     Cambio := True;
     Operacion := Multiplicacion;
     Exit;
  end;

  if (Operacion = Multiplicacion) or (Operacion = Ninguna) then
     PMultiplicacion
  else
  begin
     ExecuteOperator;
     Operacion := Multiplicacion;
  end;
end;

(* Multiplicacion *)

procedure TFCalculadora.PMultiplicacion;
begin
  if (StrTemp <> '') or (Igual = True) then
  begin
     if Igual = False then
     begin
        Operator2 := 1;   // Inicializo para no tener errores.
        FlipOperator;
     end;
     Total := Total * Operator2;
     ShowTotal;
     StrTemp := '';
     Operacion := Multiplicacion;
     NUndo := 0;
     Cifras := 0;
  end;
end;

(* Pulsado de botón División *)

procedure TFCalculadora.BBDivClick(Sender: TObject);
begin
  ActiveControl := BBIgual;
  if Igual = True then
  begin
     Igual := False;
     StrTemp := MMPantalla.Text;
     FlipOperator;
     Cambio := True;
     Operacion := Division;
     Exit;
  end;
  if (Operacion = Division) or (Operacion = Ninguna) then
     PDivision
  else
  begin
     ExecuteOperator;
     Operacion := Division;
  end;
end;

(* Division *)

procedure TFCalculadora.PDivision;
begin
  if (StrTemp <> '') or (Igual = True) then
  begin
     if Igual = False then
     begin
        Operator2 := 1;   // Inicializo para no tener errores.
        FlipOperator;
     end;

     if (Total = 0) or (Operator2 = 0) then
     begin
        Interrupcion := False;
        InitVariables;
        MMPantallaVisible.Text := _('Division por 0!!!');
        Beep;
        Beep;
     end
     else
     begin
        Total := Total / Operator2;
        ShowTotal;
        StrTemp := '';
        Operacion := Division;
        NUndo := 0;
        Cifras := 0;
     end;
  end;
end;

(* Raiz cuadrada *)

procedure TFCalculadora.BBSqrClick(Sender: TObject);
var
  ExtendedTemp : extended;
begin
  ActiveControl := BBIgual;
  if MMPantalla.Text = '' then
     Exit;
  ExtendedTemp := StrToFloat(MMPantalla.Text);
  if (ExtendedTemp >= 0) then
  begin
     ExtendedTemp := sqrt(ExtendedTemp);
     ShowPantalla(ExtendedTemp);
     StrTemp := MMPantalla.Text;
     Cambio := True;
     NUndo := 0;
     Cifras := 0;
  end
  else
  begin
     Interrupcion := False;
     InitVariables;
     MMPantallaVisible.Text := _('Raiz Negativa!!!');
     Beep;
     Beep;
  end;
end;

(* 1 / X *)

procedure TFCalculadora.BBInvClick(Sender: TObject);
var
  ExtendedTemp : extended;
begin
  ActiveControl := BBIgual;
  if MMPantalla.Text = '' then
     Exit;

  ExtendedTemp := StrToFloat(MMPantalla.Text);
  if (ExtendedTemp <> 0) then
  begin
     ExtendedTemp := (1 / ExtendedTemp);
     ShowPantalla(ExtendedTemp);
     StrTemp := MMPantalla.Text;
     Cambio := True;
     NUndo := 0;
     Cifras := 0;
  end
  else
  begin
     Interrupcion := False;
     InitVariables;
     MMPantallaVisible.Text := _('Division por 0!!!');
     Beep;
     Beep;
  end;
end;

(* Ejecuta operacion segun el flag Operacion *)

procedure TFCalculadora.ExecuteOperator;
begin
  case Operacion of
     Suma: PSuma;
     Resta: PResta;
     Multiplicacion: PMultiplicacion;
     Division: PDivision;
  end;
end;

(* Pulsado de negacion *)

procedure TFCalculadora.BBMmClick(Sender: TObject);
begin
  ActiveControl := BBIgual;
  if StrTemp = '' then
  begin
     PBorradoParcial;
     Exit;
  end;

  MMPantalla.Text := FloatToStr(StrToFloat(MMPantalla.Text) * -1);
  StrTemp := MMPantalla.Text;
end;

(* Pulsado del Botón Igual *)

procedure TFCalculadora.BBigualClick(Sender: TObject);
begin
  PIgual;
end;

(* Procesa Igual *)

procedure TFCalculadora.PIgual;
begin
  ExecuteOperator;
  Igual := True;

  //     NUndo := 0;
  //   Cifras := 0;
end;

(* Pulsado de Boton BackSpace*)

procedure TFCalculadora.BBBackSpaceClick(Sender: TObject);
begin
  ActiveControl := BBIgual;
  if (NUndo = 0) or (NUndo = 1) then
  begin
     NUndo := 0;
     Cifras := 0;
     StrTemp := '';
     MMPantalla.Text := '0' + DecimalSeparator;
     Exit;
  end
  else
  begin
     Dec(NUndo);
     Dec(Cifras);
     Decimal := CheckDecimal(StrToFloat(AUndo[NUndo]));
     StrTemp := AUndo[NUndo];
     MMPantalla.Text := AUndo[NUndo];
  end;
end;

(* Pulsado de Botón % *)

procedure TFCalculadora.BBPCienClick(Sender: TObject);
begin
  PPCien;
end;

(* Tanto por cien *)

procedure TFCalculadora.PPCien;
var
  CadenaTemp : string;
  ExtendedTemp : extended;
begin
  ActiveControl := BBIgual;

  if Operacion = Ninguna then
     Exit;

  CadenaTemp := MMPantalla.Text;
  Operator2 := StrToFloat(CadenaTemp);
  if (Operator2 = 0) or (Total = 0) then
     Exit;
  ExtendedTemp := (Total / 100) * Operator2;
  StrTemp := FloatToStr(ExtendedTemp);
  ShowPantalla(ExtendedTemp);
end;

(* Pulsado de Boton Memoria + *)

procedure TFCalculadora.BBMMasClick(Sender: TObject);
begin
  ActiveControl := BBIgual;
  MemoryStore := MemoryStore + (StrToFloat(MMPantalla.Text));
  NUndo := 0;
  Cifras := 0;
  Cambio := True;
end;

(* Pulsado de Memoria Resultante *)

procedure TFCalculadora.BBMResultClick(Sender: TObject);
begin
  ActiveControl := BBIgual;
  MMPantalla.Text := FloatToStr(MemoryStore);
  Cambio := True;
  StrTemp := MMPantalla.Text;
  NUndo := 0;
  Cifras := 0;
end;

(* Pulsado de Memoria Cero *)

procedure TFCalculadora.BBMCeroClick(Sender: TObject);
begin
  ActiveControl := BBIgual;
  MemoryStore := 0; // simplemente ...
  Cambio := True;
  StrTemp := MMPantalla.Text;
  NUndo := 0;
  Cifras := 0;
end;

(* Pulsado de Memori Store *)

procedure TFCalculadora.BBMStoreClick(Sender: TObject);
begin
  ActiveControl := BBIgual;
  MemoryStore := StrToFloat(MMPantalla.Text);
  Cambio := True;
  StrTemp := MMPantalla.Text;
  NUndo := 0;
  Cifras := 0;
end;

(* Pulsado de Teclas *)

procedure TFCalculadora.FormKeyPress(Sender: TObject; var Key: char);
begin
  if (Key = chr(13)) or (Key = '=') then
     PIgual;
  if (Key >= '0') and (Key <= '9') then
     PNumero(Key);
  if (Key = '+') then
     BBSumaClick(BBSuma);
  if (Key = '-') then
     BBRestaClick(BBResta);
  if (Key = '*') then
     BBPorClick(BBPor);
  if (Key = '/') then
     BBDivClick(BBDiv);
  if (Key = chr(8)) then
     BBBackSpaceClick(BBBackSpace);
  if (Key = '.') or (Key = ',') then
     BBDecClick(BBDec);
  if (Key = chr(27)) then
     BBBorradoTotalClick(BBBorradoTotal);
end;

(* Interrupción *)

procedure TFCalculadora.Timer1Timer(Sender: TObject);
var
  ExtendedTemp : extended;
  CadenaTemp : string;
  I, Lo : byte;
  Coma : boolean;
begin
  if MemoryStore <> 0 then
     PNL1.Caption := 'M'
  else
     PNL1.Caption := '';

  Coma := False;
  Lo := Length(MMPantalla.Text);
  for I := 1 to Lo do
  begin
     if MMPantalla.Text[I] = DecimalSeparator then
        Coma := True;
  end;
  if Coma = False then
     MMPantalla.Text := MMPantalla.Text + DecimalSeparator;

  if Interrupcion = False then
     Exit;
  ExtendedTemp := StrToFloat(MMPantalla.Text);
  CadenaTemp := FloatToStrF(ExtendedTemp, ffNumber, 20, 30);
  CadenaTemp := QuitaCeros(CadenaTemp);
  I := CuentaCeros(MMPantalla.Text);
  while (I <> 0) do
  begin
     CadenaTemp := CadenaTemp + '0';
     Dec(I);
  end;

  if (CadenaTemp = '') or (CadenaTemp = '0' + DecimalSeparator) then
  begin
     MMPantallaVisible.Text := MMPantalla.Text;
     Exit;
  end
  else
     MMPantallaVisible.Text := CadenaTemp;
end;

procedure TFCalculadora.Muestra(Campo: TField);
begin
  if Campo is TNumericField then
  begin
     MMPantalla.Text := FormatFloat(TNumericField(Campo).DisplayFormat, Campo.AsFloat);
     //+ DecimalSeparator;
     MMPantalla.Text := QuitaPuntosFormato(MMPantalla.Text);
  end

  else
     MMPantalla.Text := FloatToStr(Campo.AsFloat);

  Total := StrToFloat(MMPantalla.Text);
  StrTemp := MMPantalla.Text;

  // Comprobamos si el numero capturado tiene decimales
  if (Pos(DecimalSeparator, MMPantalla.Text) > 0) then
  begin
     Cifras := Length(Copy(MMPantalla.Text, Pos(DecimalSeparator, MMPantalla.Text) + 1, MLenCifras));
     Decimal := True;
  end;

  if (campo is TFloatfield) then
  begin
     if ShowModal = mrOk then
        Campo.Value := resulreal;
  end
  else if (campo is TIntegerfield) then
  begin
     if ShowModal = mrOk then
        Campo.Value := resulentero;
  end;
  resulreal := 0;
  resulentero := 0;
end;

procedure TFCalculadora.BBOKClick(Sender: TObject);
begin
  resulreal := StrToFloat(MMPantalla.Text);
  resulentero := Trunc(ResulReal);
end;

procedure TFCalculadora.FormKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if Key = VK_F12 then
  begin
     resulreal := StrToFloat(MMPantalla.Text);
     resulentero := Trunc(ResulReal);
     Close;
     ModalResult := mrOk;
  end;
end;

procedure TFCalculadora.BBCancelClick(Sender: TObject);
begin
  Close;
end;

function TFCalculadora.QuitaPuntosFormato(Cadena: string): string;
var
  i : integer;
  temp : integer;
begin
  Result := '';
  if (Pos('%', Cadena) <> 0) then
     Cadena := Copy(Cadena, 1, (Length(Cadena) - 1));
  for i := 1 to Pos(',', Cadena) do
  begin
     if (Cadena[i] <> '.') then
        Result := Result + Cadena[i];
  end;
  temp := Length(Copy(Cadena, Pos(',', Cadena) + 1, Length(Cadena)));
  Result := Result + Copy(Cadena, Pos(',', cadena) + 1, temp);

  // Ahora tenemos el problema de que se quede sin coma y con puntos
  Cadena := Result;
  Result := '';
  for i := 1 to Length(Cadena) do
     if Cadena[i] <> '.' then
        Result := Result + Cadena[i];
end;

end.
