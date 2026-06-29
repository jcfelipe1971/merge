unit UDMImportacionNorma43Kri;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, HYFIBQuery, Forms;

type
  TDMImportacionNorma43Kri = class(TDataModule)
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
     FicheroImportacion: string;
     function Leer(s: string; i, f: integer): string;
     procedure Error(s: string);
     procedure Log(s: string);
     procedure Proceso(Nro: integer; s: string);
     function TxtToDate6(s: string): TDateTime;
     function TxtToDate8(s: string): TDateTime;
     procedure ImportarNorma43(Fichero: string; Banco: integer; BancoAutomatico: boolean);
     procedure ImportarCartola(Fichero: string; Banco: integer; BancoAutomatico: boolean);
  public
     { Public declarations }
     procedure Importar(Fichero: string; Banco: integer; BancoAutomatico: boolean);
  end;

var
  DMImportacionNorma43Kri : TDMImportacionNorma43Kri;

implementation

uses UFMImportacionNorma43Kri, UDMMain, UEntorno, Dialogs, DateUtils;

{$R *.dfm}

procedure TDMImportacionNorma43Kri.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
end;

procedure TDMImportacionNorma43Kri.Error(s: string);
begin
  FMImportacionNorma43Kri.MErrores.Lines.Add(s);
end;

procedure TDMImportacionNorma43Kri.Log(s: string);
var
  F : TextFile;
begin
  FMImportacionNorma43Kri.MLog.Lines.Add(s);
  AssignFile(F, FicheroImportacion + '.log');
  try
     Append(F);
     WriteLn(F, s);
  except
     try
        Rewrite(F);
        WriteLn(F, s);
     except
        on e: Exception do
        begin
           Error(Format(_('Error al abrir fichero : %s'), [FicheroImportacion + '.log']));
           Error(e.Message);
        end;
     end;
  end;
  CloseFile(F);
end;

function TDMImportacionNorma43Kri.Leer(s: string; i, f: integer): string;
begin
  Result := Trim(Copy(s, i, f));
end;

procedure TDMImportacionNorma43Kri.Proceso(Nro: integer; s: string);
begin
  case Nro of
     1: FMImportacionNorma43Kri.LProceso1.Caption := s;
     2: FMImportacionNorma43Kri.LProceso2.Caption := s;
  end;
  Application.ProcessMessages;
end;

function TDMImportacionNorma43Kri.TxtToDate6(s: string): TDateTime;
begin                                    { 123456 }
  Result := EncodeDate(1900, 01, 01);    { YYMMDD }
  if ((Length(s) = 6) and (s <> '      ')) then
     Result := EncodeDate(2000 + StrToIntDef(Copy(s, 1, 2), 0), StrToIntDef(Copy(s, 3, 2), 1), StrToIntDef(Copy(s, 5, 2), 1));
end;

function TDMImportacionNorma43Kri.TxtToDate8(s: string): TDateTime;
begin                                    { 12345678 }
  Result := EncodeDate(1900, 01, 01);    { YYYYMMDD }
  if ((Length(s) = 8) and (s <> '        ')) then
     Result := EncodeDate(StrToIntDef(Copy(s, 1, 4), 1900), StrToIntDef(Copy(s, 5, 2), 1), StrToIntDef(Copy(s, 7, 2), 1));
end;

procedure TDMImportacionNorma43Kri.Importar(Fichero: string; Banco: integer; BancoAutomatico: boolean);
begin
  if (REntorno.Pais = 'ESP') then
     ImportarNorma43(Fichero, Banco, BancoAutomatico)
  else
  if (REntorno.Pais = 'CHL') then
     ImportarCartola(Fichero, Banco, BancoAutomatico)
  else
     ShowMessage(_('No implementado para este pais'));
end;

procedure TDMImportacionNorma43Kri.ImportarNorma43(Fichero: string; Banco: integer; BancoAutomatico: boolean);
var
  F : TextFile;
  S : string;
  cuenta_banco : string;
  cuenta_confirming : string;
  id_cab : integer;
  id_det : integer;
  linea : integer;
  ImportarNorma43 : boolean;
  FechaUltimaOperacion : TDateTime;
  Signo : string;
begin
  id_cab := 0;
  id_det := 0;
  linea := 0;
  ImportarNorma43 := False;
  FechaUltimaOperacion := Now;
  FicheroImportacion := Fichero;
  Proceso(1, _('Importando Datos ...'));
  FMImportacionNorma43Kri.MLog.Lines.BeginUpdate;
  Log('------------------------------------------------------------');
  Log(_('Importando desde archivo:'));
  Log(Fichero);
  Log('------------------------------------------------------------');
  Log(Format(_('Fecha y Hora : %s'), [DateTimeToStr(Now)]));
  Log('------------------------------------------------------------');
  FMImportacionNorma43Kri.MLog.Lines.EndUpdate;
  AssignFile(F, Fichero);
  try
     Reset(F);
     while (not EOF(F)) do
     begin
        Readln(F, S);
        // Registro de Cabecera de Cuenta
        if (leer(s, 1, 2) = '11') then
        begin
           Proceso(1, _('Importando Datos. (11)'));
           Proceso(2, '');
           FMImportacionNorma43Kri.MLog.Lines.BeginUpdate;
           Log(_('Registro') + ': ' + Leer(s, 1, 2));
           Log(_('Entidad') + ': ' + Leer(s, 3, 4));
           Log(_('Oficina') + ': ' + Leer(s, 7, 4));
           Log(_('Cuenta') + ': ' + Leer(s, 11, 10));
           Log(_('Fecha Inicial') + ': ' + Leer(s, 21, 6) + ' (' + DateToStr(TxtToDate6(Leer(s, 21, 6))) + ')');
           Log(_('Fecha final') + ': ' + Leer(s, 27, 6) + ' (' + DateToStr(TxtToDate6(Leer(s, 27, 6))) + ')');
           Log(_('D/H') + ': ' + Leer(s, 33, 1));
           Log(_('Importe Saldo Inicial') + ': ' + Leer(s, 34, 14));
           Log(_('Divisa') + ': ' + Leer(s, 48, 3));
           Log(_('Modalidad') + ': ' + Leer(s, 51, 1));
           Log(_('Nombre Abreviado') + ': ' + Leer(s, 52, 26));
           Log(_('Libre') + ': ' + Leer(s, 78, 3));
           Log(' ');
           FMImportacionNorma43Kri.MLog.Lines.EndUpdate;

           if (BancoAutomatico) then
           begin
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Clear;
                    SQL.Add(' SELECT BANCO, CUENTA_CONTABLE, CUENTA_CONFIRMING ');
                    SQL.Add(' FROM VER_BANCOS_CUENTAS ');
                    SQL.Add(' WHERE ');
                    SQL.Add(' EMPRESA = :EMPRESA AND ');
                    SQL.Add(' EJERCICIO = :EJERCICIO AND ');
                    SQL.Add(' CANAL = :CANAL AND ');
                    SQL.Add(' ENTIDAD = :ENTIDAD AND ');
                    SQL.Add(' SUCURSAL = :SUCURSAL AND ');
                    SQL.Add(' CUENTA_CORRIENTE = :CUENTA_CORRIENTE ');
                    Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                    Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                    Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                    Params.ByName['ENTIDAD'].AsString := leer(s, 3, 4);
                    Params.ByName['SUCURSAL'].AsString := leer(s, 7, 4);
                    Params.ByName['CUENTA_CORRIENTE'].AsString := leer(s, 11, 10);
                    ExecQuery;
                    Banco := FieldByName['BANCO'].AsInteger;
                    Cuenta_Banco := FieldByName['CUENTA_CONTABLE'].AsString;
                    Cuenta_Confirming := FieldByName['CUENTA_CONFIRMING'].AsString;
                    FreeHandle;
                    FMImportacionNorma43Kri.MLog.Lines.BeginUpdate;
                    Log(_('Banco Automatico'));
                    Log(_('Banco') + ': ' + IntToStr(Banco));
                    Log(_('Cuenta Contable') + ': ' + Cuenta_Banco);
                    Log(_('Cuenta Confirming') + ': ' + Cuenta_Confirming);
                    Log(' ');
                    FMImportacionNorma43Kri.MLog.Lines.EndUpdate;
                 finally
                    Free;
                 end;
              end;
           end
           else
           begin
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Clear;
                    SQL.Add(' SELECT BANCO, CUENTA_CONTABLE, CUENTA_CONFIRMING ');
                    SQL.Add(' FROM VER_BANCOS_CUENTAS ');
                    SQL.Add(' WHERE ');
                    SQL.Add(' EMPRESA = :EMPRESA AND ');
                    SQL.Add(' EJERCICIO = :EJERCICIO AND ');
                    SQL.Add(' CANAL = :CANAL AND ');
                    SQL.Add(' BANCO = :BANCO ');
                    Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                    Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                    Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                    Params.ByName['BANCO'].AsInteger := Banco;
                    ExecQuery;
                    Banco := FieldByName['BANCO'].AsInteger;
                    Cuenta_Banco := FieldByName['CUENTA_CONTABLE'].AsString;
                    Cuenta_Confirming := FieldByName['CUENTA_CONFIRMING'].AsString;
                    FreeHandle;
                    FMImportacionNorma43Kri.MLog.Lines.BeginUpdate;
                    Log(_('Banco Manual'));
                    Log(_('Banco') + ': ' + IntToStr(Banco));
                    Log(_('Cuenta Contable') + ': ' + Cuenta_Banco);
                    Log(_('Cuenta Confirming') + ': ' + Cuenta_Confirming);
                    Log(' ');
                    FMImportacionNorma43Kri.MLog.Lines.EndUpdate;
                 finally
                    Free;
                 end;
              end;
           end;

           if ((Banco = 0) and (Trim(Cuenta_Banco) = '')) then
           begin
              Error(_('Error el banco no existe.'));
              Log(_('Error el banco no existe.'));
              Log('------------------------------------------------------------');
              Log(_('FIN CON ERRORES!!!') + ' : ' + DateTimeToStr(Now));
              Log('------------------------------------------------------------');
              CloseFile(F);
              Exit;
           end;

           if (Cuenta_Banco = '') then
           begin
              Error(_('Error el banco no tiene cuenta contable.'));
              Log(_('Error el banco no tiene cuenta contable.'));
              Log('------------------------------------------------------------');
              Log(_('FIN CON ERRORES!!!') + ' : ' + DateTimeToStr(Now));
              Log('------------------------------------------------------------');
              CloseFile(F);
              Exit;
           end;

           if (Cuenta_Confirming = '') then
           begin
              Error(_('*** ATENCION. El banco no tiene cuenta confirming.'));
              Log(_('*** ATENCION. El banco no tiene cuenta confirming.'));
              // Log('------------------------------------------------------------');
              // Log(_('FIN CON ERRORES!!!') + ' : ' + DateTimeToStr(Now));
              // Log('------------------------------------------------------------');
              // CloseFile(F);
              // Exit;
           end;

           // Selecciono la última fecha e importo a partir de esta.
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT MAX(FECHA_OPERACION) FROM CON_NORMA_43_CAB_KRI WHERE EMPRESA = :EMPRESA AND BANCO = :BANCO';
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['BANCO'].AsInteger := Banco;
                 ExecQuery;
                 FechaUltimaOperacion := FieldByName['MAX'].AsDateTime;
                 FreeHandle;
                 Log(Format(_('Fecha de Ultima Importación: %s'), [DateToStr(FechaUltimaOperacion)]));
                 Log(' ');
              finally
                 Free;
              end;
           end;

           linea := 0;
        end;

        // Registro principal de movimientos - obligatorio
        if (leer(s, 1, 2) = '22') then
        begin
           Proceso(1, _('Importando Datos. (22)'));

           // Se importa invertido para que coincida con la contabilidad de la empresa
           if (Leer(s, 28, 1) = '1') then
              Signo := 'H'
           else
              Signo := 'D';

           FMImportacionNorma43Kri.MLog.Lines.BeginUpdate;
           {$IFDEF Debug}
           Log('/*');
           {$ENDIF}
           Log(_('Registro') + ': ' + Leer(s, 1, 2));
           Log(_('Oficina') + ': ' + Leer(s, 7, 4));
           Log(_('Fecha Operacion') + ': ' + Leer(s, 11, 6) + ' (' + DateToStr(TxtToDate6(Leer(s, 11, 6))) + ')');
           Log(_('Fecha Valor') + ': ' + Leer(s, 17, 6) + ' (' + DateToStr(TxtToDate6(Leer(s, 17, 6))) + ')');
           Log(_('Concepto comun') + ': ' + Leer(s, 23, 2));
           Log(_('Concepto propio') + ': ' + Leer(s, 25, 3));
           Log(_('D(0) / H(1)') + ': ' + Leer(s, 28, 1) + ' --> ' + Signo);
           Log(_('Importe') + ': ' + Leer(s, 29, 14));
           Log(_('Nro. Documento') + ': ' + Leer(s, 43, 10));
           Log(_('Referencia 1') + ': ' + Leer(s, 53, 12));
           Log(_('Referencia 2') + ': ' + Leer(s, 65, 16));
           FMImportacionNorma43Kri.MLog.Lines.EndUpdate;

           Inc(linea);

           // Verifico si debe importar
           ImportarNorma43 := True;

           // Solo importo a partir de FechaUltimaOperacion
           if (FechaUltimaOperacion >= TxtToDate6(Leer(s, 11, 6))) then
           begin
              ImportarNorma43 := False;
              Log(Format(_('NO SE IMPORTA. FECHA OPERACION ANTERIOR A %s (%s)'), [DateToStr(FechaUltimaOperacion), DateToStr(TxtToDate6(Leer(s, 11, 6)))]));
              Error(Format(_('Fecha Operacion anterior: %s - Signo: %s - Ref2: %s Importe: %s Fecha Operacion: %s'), [IntToStr(linea), leer(s, 28, 1), leer(s, 65, 16), leer(s, 29, 14), DateToStr(TxtToDate6(Leer(s, 11, 6)))]));
           end;

           // Solo importo fechas anteriores a hoy (hoy el banco puede estar agregando mas asientos)
           if (Today <= TxtToDate6(Leer(s, 11, 6))) then
           begin
              ImportarNorma43 := False;
              Log(Format(_('NO SE IMPORTA. FECHA OPERACION MAYOR O IGUAL A LA FECHA ACTUAL A %s (%s)'), [Leer(s, 11, 6), DateToStr(TxtToDate6(Leer(s, 11, 6)))]));
              Error(Format(_('Fecha Operacion mayor o igual a la fecha actual: %s - Signo: %s - Ref2: %s Importe: %s Fecha Operacion: %s'), [IntToStr(linea), leer(s, 28, 1), leer(s, 65, 16), leer(s, 29, 14), DateToStr(TxtToDate6(Leer(s, 11, 6)))]));
           end;

           if (ImportarNorma43) then
           begin
              // Aviso si los conceptos vienen vacios
              if (Trim(Leer(s, 23, 2)) = '') then
                 Log(_('*** ATENCION. El campo Concepto comun está vacio'));

              if (Trim(Leer(s, 25, 3)) = '') then
                 Log(_('*** ATENCION. El campo Concepto propio está vacio'));

              id_cab := DMMain.ContadorGen('CONTA_NORMA43_CAB');
              Proceso(2, 'ID_Cab :' + IntToStr(id_cab) + ' - ID_Det :' + IntToStr(id_det));
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' INSERT INTO CON_NORMA_43_CAB_KRI( ');
                    SQL.Add(' EMPRESA, ID, OFICINA, FECHA_OPERACION, FECHA_VALOR, CONCEPTO_COMUN, CONCEPTO_PROPIO, ');
                    SQL.Add(' SIGNO, IMPORTE, DOC_NUMERO, REFERENCIA1, REFERENCIA2, BANCO, LINEA_IMPORTADA) ');
                    SQL.Add(' VALUES( ');
                    SQL.Add(' :EMPRESA, :ID, :OFICINA, :FECHA_OPERACION, :FECHA_VALOR, :CONCEPTO_COMUN, :CONCEPTO_PROPIO, ');
                    SQL.Add(' :SIGNO, :IMPORTE, :DOC_NUMERO, :REFERENCIA1, :REFERENCIA2, :BANCO, :LINEA_IMPORTADA) ');
                    Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                    Params.ByName['ID'].AsInteger := id_cab;
                    Params.ByName['OFICINA'].AsString := Leer(s, 7, 4);
                    Params.ByName['FECHA_OPERACION'].AsDateTime := TxtToDate6(Leer(s, 11, 6));
                    Params.ByName['FECHA_VALOR'].AsDateTime := TxtToDate6(Leer(s, 17, 6));
                    Params.ByName['CONCEPTO_COMUN'].AsInteger := StrToIntDef(Leer(s, 23, 2), 0);
                    Params.ByName['CONCEPTO_PROPIO'].AsInteger := StrToIntDef(Leer(s, 25, 3), 0);
                    Params.ByName['SIGNO'].AsString := Signo;
                    Params.ByName['IMPORTE'].AsFloat := StrToFloat(leer(s, 29, 14)) / 100;
                    Params.ByName['DOC_NUMERO'].AsInteger := StrToIntDef(Copy(Leer(s, 43, 10), 10, 3), 0);
                    Params.ByName['REFERENCIA1'].AsString := Leer(s, 53, 12);
                    Params.ByName['REFERENCIA2'].AsString := Leer(s, 65, 16);
                    Params.ByName['BANCO'].AsInteger := Banco;
                    Params.ByName['LINEA_IMPORTADA'].AsString := s;
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;
           end;
           {$IFDEF Debug}
           FMImportacionNorma43Kri.MLog.Lines.BeginUpdate;
           Log(_('*/'));
           Log(' INSERT INTO CON_NORMA_43_CAB_KRI( ');
           Log(' EMPRESA, ID, OFICINA, FECHA_OPERACION, FECHA_VALOR, CONCEPTO_COMUN, CONCEPTO_PROPIO, ');
           Log(' SIGNO, IMPORTE, DOC_NUMERO, REFERENCIA1, REFERENCIA2, BANCO, LINEA_IMPORTADA) ');
           Log(' VALUES( ');
           Log(' '+REntorno.EmpresaStr+', 0, '''+ Leer(s, 7, 4) + ''', '''+FormatDateTime('yyyy.mm.dd', TxtToDate6(Leer(s, 11, 6)))+''', '''+FormatDateTime('yyyy.mm.dd', TxtToDate6(Leer(s, 17, 6)))+''', '+IntToStr(StrToIntDef(Leer(s, 23, 2), 0))+', '+IntToStr(StrToIntDef(Leer(s, 25, 3), 0))+', ');
           Log(' '''+Signo+''', '+leer(s, 29, 14) + ' / 100 , '+IntToStr(StrToIntDef(Copy(Leer(s, 43, 10), 10, 3), 0))+', '''+Leer(s, 53, 12)+''', '''+ Leer(s, 65, 16)+''', '+IntToStr(Banco)+', '''+s+'''); ');
           Log('--');
           FMImportacionNorma43Kri.MLog.Lines.EndUpdate;
           {$ENDIF}

           Log(' ');
        end;

        // Registros complementarios de concepto. 1ro a 5to opcionales
        if (leer(s, 1, 2) = '23') then
        begin
           if (ImportarNorma43) then
           begin
              Proceso(1, _('Importando Datos. (23)'));
              Proceso(2, IntToStr(linea) + ' - ' + Leer(s, 5, 38) + '/' + Leer(s, 43, 38));
              FMImportacionNorma43Kri.MLog.Lines.BeginUpdate;
              {$IFDEF Debug}
              Log('/*');
              {$ENDIF}
              Log(_('Registro') + ': ' + Leer(s, 1, 2));
              Log(_('Cod. Dato') + ': ' + Leer(s, 3, 2));
              Log(_('Concepto') + ': ' + Leer(s, 5, 38));
              Log(_('Concepto') + ': ' + Leer(s, 43, 38));
              // Aviso si los campos vienen vacios
              if (Trim(Leer(s, 3, 2)) = '') then
                 Log(_('*** ATENCION. El campo Cod. Dato está vacio'));
              Log(' ');
              FMImportacionNorma43Kri.MLog.Lines.EndUpdate;

              id_det := DMMain.ContadorGen('CONTA_NORMA43_DET');
              Proceso(2, 'ID_Cab :' + IntToStr(id_cab) + ' - ID_Det :' + IntToStr(id_det));
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' INSERT INTO  CON_NORMA_43_DET_KRI( ');
                    SQL.Add(' ID, ID_CAB, COD_DATO, CONCEPTO1, CONCEPTO2, LINEA_IMPORTADA) ');
                    SQL.Add(' VALUES ( ');
                    SQL.Add(' :ID, :ID_CAB, :COD_DATO, :CONCEPTO1, :CONCEPTO2, :LINEA_IMPORTADA) ');
                    Params.ByName['ID'].AsInteger := id_det;
                    Params.ByName['ID_CAB'].AsInteger := id_cab;
                    Params.ByName['COD_DATO'].AsInteger := StrToIntDef(Leer(s, 3, 2), 0);
                    Params.ByName['CONCEPTO1'].AsString := Leer(s, 5, 38);
                    Params.ByName['CONCEPTO2'].AsString := Leer(s, 43, 38);
                    Params.ByName['LINEA_IMPORTADA'].AsString := s;
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;
           end;
           {$IFDEF Debug}
           FMImportacionNorma43Kri.MLog.Lines.BeginUpdate;
           if (ImportarNorma43) then
              Log(_('*/'));
           Log(' INSERT INTO CON_NORMA_43_DET_KRI( ');
           Log(' ID, ID_CAB, COD_DATO, CONCEPTO1, CONCEPTO2, LINEA_IMPORTADA) ');
           Log(' VALUES( ');
           Log(' '+IntToStr(id_det)+', '+IntToStr(id_cab)+', '+IntToStr(StrToIntDef(Leer(s, 3, 2), 0))+', '''+Leer(s, 5, 38)+''', ''' +Leer(s, 43, 38)+''', '''+s+''');');
           Log('--');
           FMImportacionNorma43Kri.MLog.Lines.EndUpdate;
           {$ENDIF}
        end;

        // Registro complementario de infomracion de equivalencia de importe del apunte - opcional
        if (leer(s, 1, 2) = '24') then
        begin
           if (ImportarNorma43) then
           begin
              Proceso(1, 'Importando Datos. (24)');
              Proceso(2, IntToStr(linea));
              FMImportacionNorma43Kri.MLog.Lines.BeginUpdate;
              {$IFDEF Debug}
              Log('/*');
              {$ENDIF}
              Log(_('Registro') + ': ' + Leer(s, 1, 2));
              Log(_('Cod. Dato') + ': ' + Leer(s, 3, 2));
              Log(_('Divisa') + ': ' + Leer(s, 5, 3));
              Log(_('Importe') + ': ' + Leer(s, 8, 14));
              Log(_('Libre') + ': ' + Leer(s, 22, 59));
              Log(' ');
              {$IFDEF Debug}
              Log('*/');
              {$ENDIF}
              FMImportacionNorma43Kri.MLog.Lines.EndUpdate;
           end;
        end;

        // Registro final de la cuenta
        if (leer(s, 1, 2) = '33') then
        begin
           Proceso(1, 'Importando Datos. (33)');
           Proceso(2, '');
           FMImportacionNorma43Kri.MLog.Lines.BeginUpdate;
              {$IFDEF Debug}
              Log('/*');
              {$ENDIF}
           Log(_('Registro') + ': ' + Leer(s, 1, 2));
           Log(_('Entidad') + ': ' + Leer(s, 3, 4));
           Log(_('Oficina') + ': ' + Leer(s, 7, 4));
           Log(_('Cuenta') + ': ' + Leer(s, 11, 10));
           Log(_('Lineas Debe') + ': ' + Leer(s, 21, 5));
           Log(_('Total Debe') + ': ' + leer(s, 26, 14));
           Log(_('Lineas Haber') + ': ' + Leer(s, 40, 5));
           Log(_('Total Haber') + ': ' + leer(s, 45, 14));
           Log(_('Cod. saldo final') + ': ' + Leer(s, 59, 1));
           Log(_('Saldo final') + ': ' + Leer(s, 60, 14));
           Log(_('Divisa') + ': ' + Leer(s, 74, 3));
           Log(_('Libre') + ': ' + Leer(s, 77, 4));
           Log(' ');
              {$IFDEF Debug}
              Log('*/');
              {$ENDIF}
           FMImportacionNorma43Kri.MLog.Lines.EndUpdate;

           if (linea <> StrToIntDef(Leer(s, 21, 5), 0) + StrToIntDef(Leer(s, 40, 5), 0)) then
              Error(Format(_('Error en cantidad de lineas. Lineas: %s - Debe: %s - Haber: %s'), [IntToStr(linea), Leer(s, 21, 5), Leer(s, 40, 5)]));
        end;

        // Registro de fin de fichero
        if (leer(s, 1, 2) = '88') then
        begin
           Proceso(1, _('Importando Datos. (88)'));
           Proceso(2, '');
           FMImportacionNorma43Kri.MLog.Lines.BeginUpdate;
              {$IFDEF Debug}
              Log('/*');
              {$ENDIF}
           Log(_('Registro') + ': ' + Leer(s, 1, 2));
           Log(_('Nuevos') + ': ' + Leer(s, 3, 18));
           Log(_('Nro. de Registros') + ': ' + Leer(s, 21, 6));
           Log(_('Libre') + ': ' + Leer(s, 27, 54));
           Log(' ');
              {$IFDEF Debug}
              Log('*/');
              {$ENDIF}
           FMImportacionNorma43Kri.MLog.Lines.EndUpdate;
        end;
     end;
     Log('------------------------------------------------------------');
     Log('Fin Importacion : ' + DateTimeToStr(Now));
     Log('------------------------------------------------------------');
  except
     on e: Exception do
     begin
        Log(Format(_('Error al leer fichero : %s'), [Fichero]));
        Log(e.Message);
        Log('------------------------------------------------------------');
        Log(_('FIN CON ERRORES!!!') + ' : ' + DateTimeToStr(Now));
        Log('------------------------------------------------------------');
        Error(Format(_('Error al leer fichero : %s'), [Fichero]));
        Error(e.Message);
     end;
  end;
  Proceso(1, _('Finalizada la Importacion'));
  Proceso(2, '');
  CloseFile(F);
end;

procedure TDMImportacionNorma43Kri.ImportarCartola(Fichero: string; Banco: integer; BancoAutomatico: boolean);
var
  F : TextFile;
  S : string;
  cuenta_banco : string;
  cuenta_confirming : string;
  id_cab : integer;
  id_det : integer;
  linea : integer;
  ImportarCartola : boolean;
  FechaUltimaOperacion : TDateTime;
  Oficina, Entidad, TituloBanco : string;
  HastaCuentaCorriente, HastaFechaMovimiento, HastaCodigoTransaccion, HastaSerial, HastaMontoMovimiento, HastaSigno : integer;
  HastaCodigoSucursal, HastaDescripcionMovimiento, HastaTipoTransaccion, HastaFechaEmision, HastaNumeroFolio : integer;
  DesdeCuentaCorriente, DesdeFechaMovimiento, DesdeCodigoTransaccion, DesdeSerial, DesdeMontoMovimiento, DesdeSigno : integer;
  DesdeCodigoSucursal, DesdeDescripcionMovimiento, DesdeTipoTransaccion, DesdeFechaEmision, DesdeNumeroFolio : integer;

  procedure ObtieneFechaUltimaModificacion;
  begin
     // Selecciono la última fecha e importo a partir de esta.
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT MAX(FECHA_OPERACION) FROM CON_NORMA_43_CAB_KRI WHERE EMPRESA = :EMPRESA AND BANCO = :BANCO';
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['BANCO'].AsInteger := Banco;
           ExecQuery;
           FechaUltimaOperacion := FieldByName['MAX'].AsDateTime;
           FreeHandle;
           Log(Format(_('Fecha de Ultima Importación: %s'), [DateToStr(FechaUltimaOperacion)]));
           Log(' ');
        finally
           Free;
        end;
     end;
  end;

  procedure ObtieneDatosBanco;
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Clear;
           SQL.Add(' SELECT BANCO, ENTIDAD, TITULO, CUENTA_CONTABLE, CUENTA_CONFIRMING ');
           SQL.Add(' FROM VER_BANCOS_CUENTAS ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' EJERCICIO = :EJERCICIO AND ');
           SQL.Add(' CANAL = :CANAL AND ');
           SQL.Add(' BANCO = :BANCO ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['BANCO'].AsInteger := Banco;
           ExecQuery;
           Banco := FieldByName['BANCO'].AsInteger;
           Entidad := FieldByName['ENTIDAD'].AsString;
           TituloBanco := FieldByName['TITULO'].AsString;
           Cuenta_Banco := FieldByName['CUENTA_CONTABLE'].AsString;
           Cuenta_Confirming := FieldByName['CUENTA_CONFIRMING'].AsString;
           Oficina := FieldByName['ENTIDAD'].AsString;
           FreeHandle;
           FMImportacionNorma43Kri.MLog.Lines.BeginUpdate;
           Log(_('Banco Manual'));
           Log(_('Banco') + ': ' + IntToStr(Banco));
           Log(_('Cuenta Contable') + ': ' + Cuenta_Banco);
           Log(_('Cuenta Confirming') + ': ' + Cuenta_Confirming);
           Log(_('Oficina') + ': ' + Oficina);
           Log(' ');
           FMImportacionNorma43Kri.MLog.Lines.EndUpdate;
        finally
           Free;
        end;
     end;

     if ((Banco = 0) and (Trim(Cuenta_Banco) = '')) then
     begin
        Error(_('Error el banco no existe.'));
        Log(_('Error el banco no existe.'));
        Log('------------------------------------------------------------');
        Log(_('FIN CON ERRORES!!!') + ' : ' + DateTimeToStr(Now));
        Log('------------------------------------------------------------');
        CloseFile(F);
        Exit;
     end;

     if (Cuenta_Banco = '') then
     begin
        Error(_('Error el banco no tiene cuenta contable.'));
        Log(_('Error el banco no tiene cuenta contable.'));
        Log('------------------------------------------------------------');
        Log(_('FIN CON ERRORES!!!') + ' : ' + DateTimeToStr(Now));
        Log('------------------------------------------------------------');
        CloseFile(F);
        Exit;
     end;

     if (Cuenta_Confirming = '') then
     begin
        Error(_('*** ATENCION. El banco no tiene cuenta confirming.'));
        Log(_('*** ATENCION. El banco no tiene cuenta confirming.'));
        // Log('------------------------------------------------------------');
        // Log(_('FIN CON ERRORES!!!') + ' : ' + DateTimeToStr(Now));
        // Log('------------------------------------------------------------');
        // CloseFile(F);
        // Exit;
     end;
  end;

  procedure ImportaBancoDeChile;
  begin
     // CuentaCorriente / FechaMovimiento / CodigoTransaccion / Serial  / MontoMovimiento / Signo / CodigoSucursal / DescripcionMovimiento / TipoTransaccion / FechaEmision / NumeroFolio
     // 8810451208     / 20240125       / 520000000           / 2698399 / 121030          / +     / 138            / DEPOSITO EN EFECTIVO  / A               / 20240131     /   1

     BancoAutomatico := False;

     //Inicializamos variables para la longitud de datos
     DesdeCuentaCorriente := 1;
     HastaCuentaCorriente := 11;
     DesdeFechaMovimiento := 12;
     HastaFechaMovimiento := 8;
     DesdeCodigoTransaccion := 20;
     HastaCodigoTransaccion := 9;
     DesdeSerial := 29;
     HastaSerial := 8;
     DesdeMontoMovimiento := 37;
     HastaMontoMovimiento := 11;
     DesdeSigno := 48;
     HastaSigno := 1;
     DesdeCodigoSucursal := 49;
     HastaCodigoSucursal := 3;
     DesdeDescripcionMovimiento := 52;
     HastaDescripcionMovimiento := 45;
     DesdeTipoTransaccion := 97;
     HastaTipoTransaccion := 1;
     DesdeFechaEmision := 98;
     HastaFechaEmision := 8;
     DesdeNumeroFolio := 106;
     HastaNumeroFolio := 5;

     // id_cab := 0;
     id_det := 0;
     linea := 0;
     FechaUltimaOperacion := Now;
     ObtieneFechaUltimaModificacion;
     FicheroImportacion := Fichero;
     Proceso(1, _('Importando Datos ...'));
     Log('------------------------------------------------------------');
     Log(_('Importando desde archivo:'));
     Log(Fichero);
     Log('------------------------------------------------------------');
     Log(Format(_('Fecha y Hora : %s'), [DateTimeToStr(Now)]));
     Log('------------------------------------------------------------');
     AssignFile(F, Fichero);
     try
        Reset(F);
        while (not EOF(F)) do
        begin
           Readln(F, S);
           // Registro de movimientos (C/A)
           Proceso(1, _('Importando Datos.'));
           FMImportacionNorma43Kri.MLog.Lines.BeginUpdate;
           Log(_('Cuenta Corriente') + ': ' + Leer(s, DesdeCuentaCorriente, HastaCuentaCorriente));
           Log(_('Fecha Movimiento') + ': ' + Leer(s, DesdeFechaMovimiento, HastaFechaMovimiento) + ' (' + DateToStr(TxtToDate8(Leer(s, DesdeFechaMovimiento, HastaFechaMovimiento))) + ')');
           Log(_('Codigo Transaccion') + ': ' + Leer(s, DesdeCodigoTransaccion, HastaCodigoTransaccion));
           Log(_('Serial') + ': ' + Leer(s, DesdeSerial, HastaSerial));
           Log(_('Monto Movimiento') + ': ' + Leer(s, DesdeMontoMovimiento, HastaMontoMovimiento));
           Log(_('Signo') + ': ' + Leer(s, DesdeSigno, HastaSigno));
           Log(_('Codigo Sucursal') + ': ' + Leer(s, DesdeCodigoSucursal, HastaCodigoSucursal));
           Log(_('Descripcion Movimiento') + ': ' + Leer(s, DesdeDescripcionMovimiento, HastaDescripcionMovimiento));
           Log(_('TipoTransaccion) S=Retencion - C=Cargo(Haber) - A=Abono(Debe)') + ': ' + Leer(s, DesdeTipoTransaccion, HastaTipoTransaccion));
           Log(_('Fecha Emision') + ': ' + Leer(s, DesdeFechaEmision, HastaFechaEmision) + ' (' + DateToStr(TxtToDate8(Leer(s, DesdeFechaEmision, HastaFechaEmision))) + ')');
           Log(_('Numero Folio ') + ': ' + Leer(s, DesdeNumeroFolio, HastaNumeroFolio));
           Log(' ');
           FMImportacionNorma43Kri.MLog.Lines.EndUpdate;
           Inc(linea);

           // Verifico si debe importar
           // Solo importo a partir de FechaUltimaOperacion
           if (FechaUltimaOperacion < TxtToDate8(Leer(s, DesdeFechaMovimiento, HastaFechaMovimiento))) then
              ImportarCartola := True
           else
              ImportarCartola := False;

           if (not ImportarCartola) then
           begin
              Log(Format(_('NO SE IMPORTA. FECHA OPERACION ANTERIOR A %s (%s)'), [DateToStr(FechaUltimaOperacion), DateToStr(TxtToDate8(Leer(s, DesdeFechaMovimiento, HastaFechaMovimiento)))]));
              Error(Format(_('Fecha Operacion anterior: %s - Signo: %s - Ref2: %s Importe: %s Fecha Operacion: %s'), [IntToStr(linea), Leer(s, 108, 1), Leer(s, DesdeDescripcionMovimiento, HastaDescripcionMovimiento), leer(s, DesdeMontoMovimiento, HastaMontoMovimiento), DateToStr(TxtToDate8(Leer(s, DesdeFechaMovimiento, HastaFechaMovimiento)))]));
           end
           else
           begin
              if (Leer(s, DesdeTipoTransaccion, HastaTipoTransaccion) <> 'S') then
              begin
                 id_cab := DMMain.ContadorGen('CONTA_NORMA43_CAB');
                 Proceso(2, 'ID_Cab :' + IntToStr(id_cab) + ' - ID_Det :' + IntToStr(id_det));

                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' INSERT INTO CON_NORMA_43_CAB_KRI( ');
                       SQL.Add(' EMPRESA, ID, OFICINA, FECHA_OPERACION, FECHA_VALOR, CONCEPTO_COMUN, CONCEPTO_PROPIO, ');
                       SQL.Add(' SIGNO, IMPORTE, DOC_NUMERO, REFERENCIA1, /*REFERENCIA2,*/ BANCO, LINEA_IMPORTADA) ');
                       SQL.Add(' VALUES( ');
                       SQL.Add(' :EMPRESA, :ID, :OFICINA, :FECHA_OPERACION, :FECHA_VALOR, :CONCEPTO_COMUN, :CONCEPTO_PROPIO, ');
                       SQL.Add(' :SIGNO, :IMPORTE, :DOC_NUMERO, :REFERENCIA1, /*:REFERENCIA2,*/ :BANCO, :LINEA_IMPORTADA) ');
                       Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                       Params.ByName['ID'].AsInteger := id_cab;
                       Params.ByName['OFICINA'].AsString := Oficina;
                       Params.ByName['FECHA_OPERACION'].AsDateTime := TxtToDate8(Leer(s, DesdeFechaMovimiento, HastaFechaMovimiento));
                       Params.ByName['FECHA_VALOR'].AsDateTime := TxtToDate8(Leer(s, DesdeFechaMovimiento, HastaFechaMovimiento));
                       Params.ByName['CONCEPTO_COMUN'].AsInteger := 0;
                       Params.ByName['CONCEPTO_PROPIO'].AsInteger := 0;
                       // Segun el tipo de transaccion se define si va al debe o al haber
                       if (Leer(s, DesdeTipoTransaccion, HastaTipoTransaccion) = 'A') then
                          Params.ByName['SIGNO'].AsString := 'D'
                       else if (Leer(s, DesdeTipoTransaccion, HastaTipoTransaccion) = 'C') then
                          Params.ByName['SIGNO'].AsString := 'H';
                       Params.ByName['IMPORTE'].AsFloat := StrToFloat(Leer(s, DesdeMontoMovimiento, HastaMontoMovimiento));
                       Params.ByName['DOC_NUMERO'].AsInteger := StrToIntDef(Leer(s, DesdeNumeroFolio, HastaNumeroFolio), 0);
                       Params.ByName['REFERENCIA1'].AsString := Trim(Copy(Leer(s, DesdeDescripcionMovimiento, HastaDescripcionMovimiento), 1, 45));
                       //Params.ByName['REFERENCIA2'].AsString := Trim(Copy(Leer(s, DesdeDescripcionMovimiento, HastaDescripcionMovimiento), 257, 256));
                       Params.ByName['BANCO'].AsInteger := Banco;
                       Params.ByName['LINEA_IMPORTADA'].AsString := Copy(s, 1, 256);
                       ExecQuery;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;
              end;
           end;
           Log(' ');

        end;
        Log('------------------------------------------------------------');
        Log('Fin Importacion : ' + DateTimeToStr(Now));
        Log('------------------------------------------------------------');
     except
        on e: Exception do
        begin
           Log(Format(_('Error al leer fichero : %s'), [Fichero]));
           Log(e.Message);
           Log('------------------------------------------------------------');
           Log(_('FIN CON ERRORES!!!') + ' : ' + DateTimeToStr(Now));
           Log('------------------------------------------------------------');
           Error(Format(_('Error al leer fichero : %s'), [Fichero]));
           Error(e.Message);
        end;
     end;
     Proceso(1, _('Finalizada la Importacion'));
     Proceso(2, '');
     CloseFile(F);
  end;

begin
  //Obtenemos datos del Banco
  ObtieneDatosBanco;
  if (Entidad = '0001') then
     ImportaBancoDeChile
  else
     raise Exception.Create(_('No implementado para el banco: ' + IntToStr(Banco) + ' - ' + Entidad + ' - ' + TituloBanco));

     (*
  // Por ahora no sabemos exactamente cual es la estructura del fichero, por lo que no podemos detectar el banco
  BancoAutomatico := False;

  // id_cab := 0;
  id_det := 0;
  linea := 0;
  FechaUltimaOperacion := Now;
  FicheroImportacion := Fichero;
  Proceso(1, _('Importando Datos ...'));
  Log('------------------------------------------------------------');
  Log(_('Importando desde archivo:'));
  Log(Fichero);
  Log('------------------------------------------------------------');
  Log(Format(_('Fecha y Hora : %s'), [DateTimeToStr(Now)]));
  Log('------------------------------------------------------------');
  AssignFile(F, Fichero);
  try
     Reset(F);
     while (not EOF(F)) do
     begin
        Readln(F, S);
        // Registro de Cabecera de Cuenta
        if (Leer(s, 108, 1) = 'S') then
        begin
           Proceso(1, _('Importando Datos Cabecera. (Tipo "S")'));
           Proceso(2, '');
{
                                                                                                   1
         1         2         3         4         5         6         7         8         9         0         1         2
123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789 123456789 1
         11       8        9       8                    22   4                                           451       8    5
|||||||||||--------|||||||||--------||||||||||||||||||||||----|||||||||||||||||||||||||||||||||||||||||||||-||||||||-----
0881045120820201111980000000        0000000000000000000000+000RETENCIONES + 1 DIA                          S2020111100000
0881045120820201111970000000        0000000000000000000000+000RETENCIONES 1 DIA                            S2020111100000
0881045120820201111990000000        0000000000000019082709+000SALDO CONTABLE                               S2020111100000
0881045120820200131000000000000000000000000000000000278238+000Amortizacion A Linea De Credito              C2020013100000
}

           FMImportacionNorma43Kri.MLog.Lines.BeginUpdate;
           Log(_('Campo 1') + ': ' + Leer(s, 1, 11));
           Log(_('Fecha Operacion') + ': ' + Leer(s, 12, 8) + ' (' + DateToStr(TxtToDate8(Leer(s, 12, 8))) + ')');
           Log(_('Campo 3') + ': ' + Leer(s, 20, 9));
           Log(_('Campo 4') + ': ' + Leer(s, 29, 8));
           Log(_('Importe') + ': ' + Leer(s, 37, 22));
           Log(_('Campo 6') + ': ' + Leer(s, 59, 4));
           Log(_('Concepto') + ': ' + Leer(s, 63, 45));
           Log(_('Tipo (S/C/A)') + ': ' + Leer(s, 108, 1));
           Log(_('Fecha Valor') + ': ' + Leer(s, 109, 8) + ' (' + DateToStr(TxtToDate8(Leer(s, 12, 8))) + ')');
           Log(_('Campo 10') + ': ' + Leer(s, 117, 5));
           Log(' ');
           FMImportacionNorma43Kri.MLog.Lines.EndUpdate;

           if (BancoAutomatico) then
           begin
              {
              with THYFIBQuery.Create(nil) do
              begin
                try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Clear;
                 SQL.Add(' SELECT BANCO, ENTIDAD, CUENTA_CONTABLE, CUENTA_CONFIRMING ');
                 SQL.Add(' FROM VER_BANCOS_CUENTAS ');
                 SQL.Add(' WHERE ');
                 SQL.Add(' EMPRESA = :EMPRESA AND ');
                 SQL.Add(' EJERCICIO = :EJERCICIO AND ');
                 SQL.Add(' CANAL = :CANAL AND ');
                 SQL.Add(' ENTIDAD = :ENTIDAD AND ');
                 SQL.Add(' SUCURSAL = :SUCURSAL AND ');
                 SQL.Add(' CUENTA_CORRIENTE = :CUENTA_CORRIENTE ');
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                 Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                 Params.ByName['ENTIDAD'].AsString := leer(s, 3, 4);
                 Params.ByName['SUCURSAL'].AsString := leer(s, 7, 4);
                 Params.ByName['CUENTA_CORRIENTE'].AsString := leer(s, 11, 10);
                 ExecQuery;
                 Banco := FieldByName['BANCO'].AsInteger;
                 Cuenta_Banco := FieldByName['CUENTA_CONTABLE'].AsString;
                 Cuenta_Confirming := FieldByName['CUENTA_CONFIRMING'].AsString;
                 Oficina := FieldByName['ENTIDAD'].AsString;
                 FreeHandle;
                 FMImportacionNorma43Kri.MLog.Lines.BeginUpdate;
                 Log(_('Banco Automatico'));
                 Log(_('Banco') + ': ' + IntToStr(Banco));
                 Log(_('Cuenta Contable') + ': ' + Cuenta_Banco);
                 Log(_('Cuenta Confirming') + ': ' + Cuenta_Confirming);
                 Log(_('Oficina') + ': ' + Oficina);
                 Log(' ');
                 FMImportacionNorma43Kri.MLog.Lines.EndUpdate;
                finally
                 Free;
                end;
              end;
              }
              Error(_('Seleccion de banco automatico no implementada para importacion de cartola'));
           end
           else
           begin
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Clear;
                    SQL.Add(' SELECT BANCO, ENTIDAD, CUENTA_CONTABLE, CUENTA_CONFIRMING ');
                    SQL.Add(' FROM VER_BANCOS_CUENTAS ');
                    SQL.Add(' WHERE ');
                    SQL.Add(' EMPRESA = :EMPRESA AND ');
                    SQL.Add(' EJERCICIO = :EJERCICIO AND ');
                    SQL.Add(' CANAL = :CANAL AND ');
                    SQL.Add(' BANCO = :BANCO ');
                    Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                    Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
                    Params.ByName['CANAL'].AsInteger := REntorno.Canal;
                    Params.ByName['BANCO'].AsInteger := Banco;
                    ExecQuery;
                    Banco := FieldByName['BANCO'].AsInteger;
                    Cuenta_Banco := FieldByName['CUENTA_CONTABLE'].AsString;
                    Cuenta_Confirming := FieldByName['CUENTA_CONFIRMING'].AsString;
                    Oficina := FieldByName['ENTIDAD'].AsString;
                    FreeHandle;
                    FMImportacionNorma43Kri.MLog.Lines.BeginUpdate;
                    Log(_('Banco Manual'));
                    Log(_('Banco') + ': ' + IntToStr(Banco));
                    Log(_('Cuenta Contable') + ': ' + Cuenta_Banco);
                    Log(_('Cuenta Confirming') + ': ' + Cuenta_Confirming);
                    Log(_('Oficina') + ': ' + Oficina);
                    Log(' ');
                    FMImportacionNorma43Kri.MLog.Lines.EndUpdate;
                 finally
                    Free;
                 end;
              end;
           end;

           if ((Banco = 0) and (Trim(Cuenta_Banco) = '')) then
           begin
              Error(_('Error el banco no existe.'));
              Log(_('Error el banco no existe.'));
              Log('------------------------------------------------------------');
              Log(_('FIN CON ERRORES!!!') + ' : ' + DateTimeToStr(Now));
              Log('------------------------------------------------------------');
              CloseFile(F);
              Exit;
           end;

           if (Cuenta_Banco = '') then
           begin
              Error(_('Error el banco no tiene cuenta contable.'));
              Log(_('Error el banco no tiene cuenta contable.'));
              Log('------------------------------------------------------------');
              Log(_('FIN CON ERRORES!!!') + ' : ' + DateTimeToStr(Now));
              Log('------------------------------------------------------------');
              CloseFile(F);
              Exit;
           end;

           if (Cuenta_Confirming = '') then
           begin
              Error(_('*** ATENCION. El banco no tiene cuenta confirming.'));
              Log(_('*** ATENCION. El banco no tiene cuenta confirming.'));
              // Log('------------------------------------------------------------');
              // Log(_('FIN CON ERRORES!!!') + ' : ' + DateTimeToStr(Now));
              // Log('------------------------------------------------------------');
              // CloseFile(F);
              // Exit;
           end;

           // Selecciono la última fecha e importo a partir de esta.
           with THYFIBQuery.Create(nil) do
           begin
              try
                 Close;
                 DataBase := DMMain.DataBase;
                 SQL.Text := 'SELECT MAX(FECHA_OPERACION) FROM CON_NORMA_43_CAB_KRI WHERE EMPRESA = :EMPRESA AND BANCO = :BANCO';
                 Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                 Params.ByName['BANCO'].AsInteger := Banco;
                 ExecQuery;
                 FechaUltimaOperacion := FieldByName['MAX'].AsDateTime;
                 FreeHandle;
                 Log(Format(_('Fecha de Ultima Importación: %s'), [DateToStr(FechaUltimaOperacion)]));
                 Log(' ');
              finally
                 Free;
              end;
           end;

           linea := 0;
        end
        else
        begin
           // Registro de movimientos (C/A)
           Proceso(1, _('Importando Datos.'));
           FMImportacionNorma43Kri.MLog.Lines.BeginUpdate;
           Log(_('Campo 1') + ': ' + Leer(s, 1, 11));
           Log(_('Fecha Operacion') + ': ' + Leer(s, 12, 8) + ' (' + DateToStr(TxtToDate8(Leer(s, 12, 8))) + ')');
           Log(_('Campo 3') + ': ' + Leer(s, 20, 9));
           Log(_('Campo 4') + ': ' + Leer(s, 29, 8));
           Log(_('Importe') + ': ' + Leer(s, 37, 22));
           Log(_('Campo 6') + ': ' + Leer(s, 59, 4));
           Log(_('Concepto') + ': ' + Leer(s, 63, 45));
           Log(_('Tipo (S/C/A)') + ': ' + Leer(s, 108, 1));
           Log(_('Fecha Valor') + ': ' + Leer(s, 109, 8) + ' (' + DateToStr(TxtToDate8(Leer(s, 12, 8))) + ')');
           Log(_('Campo 10') + ': ' + Leer(s, 117, 5));
           Log(' ');
           FMImportacionNorma43Kri.MLog.Lines.EndUpdate;

           Inc(linea);

           // Verifico si debe importar
           // Solo importo a partir de FechaUltimaOperacion
           if (FechaUltimaOperacion < TxtToDate8(Leer(s, 12, 8))) then
              ImportarCartola := True
           else
              ImportarCartola := False;

           if (not ImportarCartola) then
           begin
              Log(Format(_('NO SE IMPORTA. FECHA OPERACION ANTERIOR A %s (%s)'), [DateToStr(FechaUltimaOperacion), DateToStr(TxtToDate8(Leer(s, 12, 8)))]));
              Error(Format(_('Fecha Operacion anterior: %s - Signo: %s - Ref2: %s Importe: %s Fecha Operacion: %s'), [IntToStr(linea), Leer(s, 108, 1), Leer(s, 63, 45), leer(s, 37, 22), DateToStr(TxtToDate8(Leer(s, 12, 8)))]));
           end
           else
           begin
              {
              // Aviso si los conceptos vienen vacios
              if (Trim(Leer(s, 23, 2)) = '') then
                 Log(_('*** ATENCION. El campo Concepto comun está vacio'));

              if (Trim(Leer(s, 25, 3)) = '') then
                 Log(_('*** ATENCION. El campo Concepto propio está vacio'));
              }
              id_cab := DMMain.ContadorGen('CONTA_NORMA43_CAB');
              Proceso(2, 'ID_Cab :' + IntToStr(id_cab) + ' - ID_Det :' + IntToStr(id_det));
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' INSERT INTO CON_NORMA_43_CAB_KRI( ');
                    SQL.Add(' EMPRESA, ID, OFICINA, FECHA_OPERACION, FECHA_VALOR, CONCEPTO_COMUN, CONCEPTO_PROPIO, ');
                    SQL.Add(' SIGNO, IMPORTE, DOC_NUMERO, REFERENCIA1, REFERENCIA2, BANCO, LINEA_IMPORTADA) ');
                    SQL.Add(' VALUES( ');
                    SQL.Add(' :EMPRESA, :ID, :OFICINA, :FECHA_OPERACION, :FECHA_VALOR, :CONCEPTO_COMUN, :CONCEPTO_PROPIO, ');
                    SQL.Add(' :SIGNO, :IMPORTE, :DOC_NUMERO, :REFERENCIA1, :REFERENCIA2, :BANCO, :LINEA_IMPORTADA) ');
                    Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
                    Params.ByName['ID'].AsInteger := id_cab;
                    Params.ByName['OFICINA'].AsString := Oficina;
                    Params.ByName['FECHA_OPERACION'].AsDateTime := TxtToDate8(Leer(s, 12, 8));
                    Params.ByName['FECHA_VALOR'].AsDateTime := TxtToDate8(Leer(s, 12, 8));
                    Params.ByName['CONCEPTO_COMUN'].AsInteger := 0;
                    Params.ByName['CONCEPTO_PROPIO'].AsInteger := 0;
                    // Se importa invertido para que coincida con la contabilidad de la empresa
                    if (Leer(s, 108, 1) = 'C') then
                       Params.ByName['SIGNO'].AsString := 'H'
                    else
                       Params.ByName['SIGNO'].AsString := 'D';
                    Params.ByName['IMPORTE'].AsFloat := StrToFloat(Leer(s, 37, 22));
                    Params.ByName['DOC_NUMERO'].AsInteger := 0;
                    Params.ByName['REFERENCIA1'].AsString := Trim(Copy(Leer(s, 63, 45), 1, 256));
                    Params.ByName['REFERENCIA2'].AsString := Trim(Copy(Leer(s, 63, 45), 257, 256));
                    Params.ByName['BANCO'].AsInteger := Banco;
                    Params.ByName['LINEA_IMPORTADA'].AsString := Copy(s, 1, 256);
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;
           end;
           Log(' ');
        end;
     end;
     Log('------------------------------------------------------------');
     Log('Fin Importacion : ' + DateTimeToStr(Now));
     Log('------------------------------------------------------------');
  except
     on e: Exception do
     begin
        Log(Format(_('Error al leer fichero : %s'), [Fichero]));
        Log(e.Message);
        Log('------------------------------------------------------------');
        Log(_('FIN CON ERRORES!!!') + ' : ' + DateTimeToStr(Now));
        Log('------------------------------------------------------------');
        Error(Format(_('Error al leer fichero : %s'), [Fichero]));
        Error(e.Message);
     end;
  end;
  Proceso(1, _('Finalizada la Importacion'));
  Proceso(2, '');
  CloseFile(F);  *)
end;

end.
