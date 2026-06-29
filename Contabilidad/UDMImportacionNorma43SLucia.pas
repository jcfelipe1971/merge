unit UDMImportacionNorma43SLucia;

{Todo -cTraduccion : Verificar que los strings sean traducidos con _(string)}
{Todo -cTraduccion : Verificar alineación de labes (alRight normalmente)}

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, HYFIBQuery, Forms;

type
  TDMImportacionNorma43SLucia = class(TDataModule)
  private
     { Private declarations }
  public
     { Public declarations }
     FicheroImportacion: string;
     function Leer(s: string; i, f: integer): string;
     procedure Importar(Fichero: string);
     procedure Error(s: string);
     procedure Log(s: string);
     procedure Proceso1(s: string);
     procedure Proceso2(s: string);
  end;

var
  DMImportacionNorma43SLucia : TDMImportacionNorma43SLucia;

implementation

uses UFMImportacionNorma43SLucia, UDMMain, UEntorno;

{$R *.dfm}

procedure TDMImportacionNorma43SLucia.Error(s: string);
begin
  FMImportacionNorma43SLucia.MErrores.Lines.Add(s);
end;

procedure TDMImportacionNorma43SLucia.Log(s: string);
var
  F : TextFile;
begin
  FMImportacionNorma43SLucia.MLog.Lines.Add(s);
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
           Error('Error al abrir fichero : ' + FicheroImportacion + '.log');
           Error(e.Message);
        end;
     end;
  end;
  CloseFile(F);
end;

function TDMImportacionNorma43SLucia.Leer(s: string; i, f: integer): string;
begin
  Result := Trim(Copy(s, i, f));
end;

procedure TDMImportacionNorma43SLucia.Proceso1(s: string);
begin
  FMImportacionNorma43SLucia.LProceso1.Caption := s;
  Application.ProcessMessages;
end;

procedure TDMImportacionNorma43SLucia.Proceso2(s: string);
begin
  FMImportacionNorma43SLucia.LProceso2.Caption := s;
  Application.ProcessMessages;
end;

procedure TDMImportacionNorma43SLucia.Importar(Fichero: string);
var
  F : TextFile;
  S : string;
  Q : THYFIBQuery;
  ric : integer;
  asiento : integer;
  banco : integer;
  cuenta_banco : string;
  cuenta_confirming : string;
  linea : integer;
  lineas_importadas : integer;
  texto : string;
begin
  FicheroImportacion := Fichero;
  Proceso1('Importando Datos ...');
  Log('------------------------------------------------------------');
  Log('Importando desde archivo:');
  Log(Fichero);
  Log('------------------------------------------------------------');
  Log('Fecha y Hora : ' + DateTimeToStr(Now));
  Log('------------------------------------------------------------');
  linea := 0;
  ric := 0;
  lineas_importadas := 0;
  AssignFile(F, Fichero);
  try
     Reset(F);
     while (not EOF(F)) do
     begin
        Readln(F, S);
        if (leer(s, 1, 2) = '11') then {Registro de Cabecera de Cuenta}
        begin
           Proceso1('Importando Datos. (11)');
           Proceso2('');
           Log('Registro  : ' + Leer(s, 1, 2));
           Log('Entidad : ' + Leer(s, 3, 4));
           Log('Oficina : ' + Leer(s, 7, 4));
           Log('Cuenta : ' + Leer(s, 11, 10));
           Log('Fecha Inicial : ' + Leer(s, 21, 6));
           Log('Fecha final : ' + Leer(s, 27, 6));
           Log('D/H : ' + Leer(s, 33, 1));
           Log('Importe Saldo Inicial : ' + Leer(s, 34, 14));
           Log('Divisa : ' + Leer(s, 48, 3));
           Log('Modalidad : ' + Leer(s, 51, 1));
           Log('Nombre Abreviado : ' + Leer(s, 52, 26));
           Log('Libre : ' + Leer(s, 78, 3));
           Log(' ');

           Q := THYFIBQuery.Create(nil);
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT BANCO,CUENTA_CONTABLE,CUENTA_CONFIRMING FROM VER_BANCOS_CUENTAS WHERE EMPRESA=?EMPRESA AND ' +
                 'EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND ENTIDAD=?ENTIDAD AND ' +
                 'SUCURSAL=?SUCURSAL /*AND CONTROL=?CONTROL*/ AND CUENTA_CORRIENTE=?CUENTA_CORRIENTE';
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['ENTIDAD'].AsString := leer(s, 3, 4);
              Params.ByName['SUCURSAL'].AsString := leer(s, 7, 4);
              {Params.ByName['CONTROL'].AsString := leer(s,,);}
              Params.ByName['CUENTA_CORRIENTE'].AsString := leer(s, 11, 10);
              ExecQuery;
              Banco := FieldByName['BANCO'].AsInteger;
              Cuenta_Banco := FieldByName['CUENTA_CONTABLE'].AsString;
              Cuenta_Confirming := FieldByName['CUENTA_CONFIRMING'].AsString;

              if (Banco = 0) then
              begin
                 Error('Error el banco no existe.');
                 Log('Error el banco no existe.');
                 Log('------------------------------------------------------------');
                 Log('FIN CON ERRORES!!! : ' + DateTimeToStr(Now));
                 Log('------------------------------------------------------------');
                 CloseFile(F);
                 Exit;
              end;
              {if Banco = 1 then
                 Banco := 1;}
              if Cuenta_Banco = '' then
                 Cuenta_Banco := '5720000000';
              if Cuenta_Confirming = '' then
                 Cuenta_Confirming := '5208000000';

              FreeHandle;
           end;
           FreeAndNil(Q);

           ric := DMMain.Contador_EEC('RIC');
           asiento := DMMain.Contador_EEC('RVC');
           linea := 0;

           Proceso2('Banco :' + Cuenta_Banco + ' - Asiento: ' + IntToStr(Asiento));
           Q := THYFIBQuery.Create(nil);
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'insert into con_cuentas_asientos (empresa,ejercicio,canal,ric,tipo,fecha,titulo,entrada,asiento,agrupacion_general) ' +
                 'values(?empresa,?ejercicio,?canal,?ric,?tipo,?fecha,?titulo,?entrada,?asiento,?agrupacion_general) ';
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['RIC'].AsInteger := ric;
              Params.ByName['TIPO'].AsString := 'NOR';
              Params.ByName['FECHA'].AsDateTime := REntorno.FechaTrab;
              Params.ByName['TITULO'].AsString := 'IMPORTACION NORMA 43';
              Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
              Params.ByName['ASIENTO'].AsInteger := asiento;
              Params.ByName['AGRUPACION_GENERAL'].AsInteger := 0;
              ExecQuery;
              FreeHandle;
           end;
           FreeAndNil(Q);

           lineas_importadas := 0;
        end;

        if (leer(s, 1, 2) = '22') then {Registro principal de movimientos - obligatorio}
        begin
           Proceso1('Importando Datos. (22)');
           Proceso2(IntToStr(linea) + ' - ' + 'Signo: ' + leer(s, 28, 1) + ' - Ref2: ' + leer(s, 65, 16) + ' Importe: ' + leer(s, 29, 14));
           Log('Registro  : ' + Leer(s, 1, 2));
           Log('Oficina : ' + Leer(s, 7, 4));
           Log('Fecha Operacion : ' + Leer(s, 11, 6));
           Log('Fecha Valor : ' + Leer(s, 17, 6));
           Log('Concepto comun : ' + Leer(s, 23, 2));
           Log('Concepto propio : ' + Leer(s, 25, 3));
           Log('D/H : ' + Leer(s, 28, 1));
           Log('Importe : ' + Leer(s, 29, 14));
           Log('Nro. Documento : ' + Leer(s, 43, 10));
           Log('Referencia 1 : ' + Leer(s, 53, 12));
           Log('Referencia 2 : ' + Leer(s, 65, 16));
           Log(' ');
           Inc(lineas_importadas);

           {
            Q := THYFIBQuery.Create(nil);
            with Q do
            begin
              Close;
              DataBase := DMMain.DataBase ;
              SQL.Text := 'select c.cuenta from sys_terceros_bancos t '+
                          'left join emp_proveedores p on p.tercero=t.tercero '+
                          'left join con_cuentas_ges_pro c on p.empresa=c.empresa and p.proveedor=c.proveedor '+
                          'where '+
                          't.entidad=?ENTIDAD and t.sucursal=?SUCURSAL and t.cuenta=?CUENTA and p.empresa=?EMPRESA and '+
                          'c.ejercicio=?EJERCICIO and c.canal=?CANAL '+
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['ENTIDAD'].AsString := leer(s,,);
              Params.ByName['SUCURSAL'].AsString := leer(s,,);
              Params.ByName['CUENTA'].AsString := leer(s,,);
              ExecQuery;
              cuenta_proveedor := FieldByName['CUENTA'].AsString
              FreeHandle ;
            end;
            FreeAndNil(Q);
}
           {Cuenta Banco}
           Inc(linea);
           Q := THYFIBQuery.Create(nil);
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'insert into con_cuentas_apuntes (empresa,ejercicio,canal,ric,cuenta,signo,texto, ' +
                 'importe,entrada,doc_numero,doc_serie,doc_fecha,centro_coste) ' +
                 'values(?empresa,?ejercicio,?canal,?ric,?cuenta,?signo,?texto,?importe,?entrada, ' +
                 '?doc_numero,?doc_serie,?doc_fecha,?centro_coste)';
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['RIC'].AsInteger := ric;
              Params.ByName['CUENTA'].AsString := Cuenta_Banco;
              if (leer(s, 28, 1) = '1') then
                 Params.ByName['SIGNO'].AsString := 'H'
              else
                 Params.ByName['SIGNO'].AsString := 'D';
              Params.ByName['TEXTO'].AsString := leer(s, 65, 16);
              Params.ByName['IMPORTE'].AsFloat := StrToFloat(leer(s, 29, 14)) / 100;
              Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
              Params.ByName['DOC_NUMERO'].AsInteger := StrToIntDef(Copy(Leer(s, 65, 16), 10, 3), 0);
              Params.ByName['DOC_SERIE'].AsString := '';
              Params.ByName['DOC_FECHA'].AsDateTime := StrToDate(leer(s, 15, 2) + '/' + leer(s, 13, 2) + '/20' + leer(s, 11, 2));
              Params.ByName['CENTRO_COSTE'].AsInteger := 0;
              ExecQuery;
              FreeHandle;
           end;
           FreeAndNil(Q);

           {Cuenta Puente}
           Inc(linea);
           Q := THYFIBQuery.Create(nil);
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'insert into con_cuentas_apuntes (empresa,ejercicio,canal,ric,cuenta,signo,texto, ' +
                 'importe,entrada,doc_numero,doc_serie,doc_fecha,centro_coste) ' +
                 'values(?empresa,?ejercicio,?canal,?ric,?cuenta,?signo,?texto,?importe,?entrada, ' +
                 '?doc_numero,?doc_serie,?doc_fecha,?centro_coste)';
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['RIC'].AsInteger := ric;
              Params.ByName['CUENTA'].AsString := Cuenta_Confirming;
              if (leer(s, 28, 1) = '2') then
                 Params.ByName['SIGNO'].AsString := 'H'
              else
                 Params.ByName['SIGNO'].AsString := 'D';
              Params.ByName['TEXTO'].AsString := leer(s, 65, 16);
              Params.ByName['IMPORTE'].AsFloat := StrToFloat(leer(s, 29, 14)) / 100;
              Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
              Params.ByName['DOC_NUMERO'].AsInteger := StrToIntDef(Copy(Leer(s, 65, 16), 10, 3), 0);
              Params.ByName['DOC_SERIE'].AsString := '';
              Params.ByName['DOC_FECHA'].AsDateTime := StrToDate(leer(s, 15, 2) + '/' + leer(s, 13, 2) + '/20' + leer(s, 11, 2));
              Params.ByName['CENTRO_COSTE'].AsInteger := 0;
              ExecQuery;
              FreeHandle;
           end;
           FreeAndNil(Q);
        end;

        if (leer(s, 1, 2) = '23') then {Registros complementarios de concepto. 1ro a 5to opcionales}
        begin
           Proceso1('Importando Datos. (23)');
           Proceso2(IntToStr(linea) + ' - ' + Leer(s, 5, 38) + '/' + Leer(s, 43, 38));
           Log('Registro  : ' + Leer(s, 1, 2));
           Log('Cod. Dato : ' + Leer(s, 3, 2));
           Log('Concepto : ' + Leer(s, 5, 38));
           Log('Concepto : ' + Leer(s, 43, 38));
           Log(' ');

           Q := THYFIBQuery.Create(nil);
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT TEXTO FROM CON_CUENTAS_APUNTES WHERE EMPRESA=?EMPRESA AND ' +
                 'EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND RIC=?RIC AND LINEA=?LINEA';
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['RIC'].AsInteger := ric;
              Params.ByName['LINEA'].AsInteger := linea;
              ExecQuery;
              texto := FieldByName['TEXTO'].AsString;
              FreeHandle;
           end;
           FreeAndNil(Q);

           if (Leer(s, 5, 38) > '') then
              texto := texto + '/' + Leer(s, 5, 38);
           if (Leer(s, 43, 38) > '') then
              texto := texto + '/' + Leer(s, 43, 38);
           texto := Copy(texto, 1, 100);

           {Para la linea anterior}
           Q := THYFIBQuery.Create(nil);
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'UPDATE CON_CUENTAS_APUNTES SET TEXTO=?TEXTO ' +
                 'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND RIC=?RIC AND LINEA=?LINEA';
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['RIC'].AsInteger := ric;
              Params.ByName['LINEA'].AsInteger := linea - 1;
              Params.ByName['TEXTO'].AsString := texto;
              ExecQuery;
              FreeHandle;
           end;
           {Para la linea actual}
           Q := THYFIBQuery.Create(nil);
           with Q do
           begin
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'UPDATE CON_CUENTAS_APUNTES SET TEXTO=?TEXTO ' +
                 'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO AND CANAL=?CANAL AND RIC=?RIC AND LINEA=?LINEA';
              Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
              Params.ByName['CANAL'].AsInteger := REntorno.Canal;
              Params.ByName['RIC'].AsInteger := ric;
              Params.ByName['LINEA'].AsInteger := linea;
              Params.ByName['TEXTO'].AsString := texto;
              ExecQuery;
              FreeHandle;
           end;
           FreeAndNil(Q);
        end;

        if (leer(s, 1, 2) = '24') then {Registro complementario de infomracion de equivalencia de importe del apunte - opcional}
        begin
           Proceso1('Importando Datos. (24)');
           Proceso2(IntToStr(linea));
           Log('Registro  : ' + Leer(s, 1, 2));
           Log('Cod. Dato : ' + Leer(s, 3, 2));
           Log('Divisa : ' + Leer(s, 5, 3));
           Log('Importe : ' + Leer(s, 8, 14));
           Log('Libre : ' + Leer(s, 22, 59));
           Log(' ');
        end;

        if (leer(s, 1, 2) = '33') then {Registro final de la cuenta}
        begin
           Proceso1('Importando Datos. (33)');
           Proceso2('');
           Log('Registro  : ' + Leer(s, 1, 2));
           Log('Entidad  : ' + Leer(s, 3, 4));
           Log('Oficina  : ' + Leer(s, 7, 4));
           Log('Cuenta  : ' + Leer(s, 11, 10));
           Log('Lineas Debe  : ' + Leer(s, 21, 5));
           Log('Total Debe   : ' + leer(s, 26, 14));
           Log('Lineas Haber : ' + Leer(s, 40, 5));
           Log('Total Haber  : ' + leer(s, 45, 14));
           Log('Cod. saldo final  : ' + Leer(s, 59, 1));
           Log('Saldo final  : ' + Leer(s, 60, 14));
           Log('Divisa  : ' + Leer(s, 74, 3));
           Log('Libre : ' + Leer(s, 77, 4));
           Log(' ');

           if (lineas_importadas <> StrToIntDef(Leer(s, 21, 5), 0) + StrToIntDef(Leer(s, 40, 5), 0)) then
              Error('Error en cantidad de lineas. Lineas: ' + IntToStr(linea) + ' - Debe: ' + Leer(s, 21, 5) + ' - Haber: ' + Leer(s, 40, 5));
        end;

        if (leer(s, 1, 2) = '88') then{Registro de fin de fichero}
        begin
           Proceso1('Importando Datos. (88)');
           Proceso2('');
           Log('Registro  : ' + Leer(s, 1, 2));
           Log('Nueves  : ' + Leer(s, 3, 18));
           Log('Nro. de Registros : ' + Leer(s, 21, 6));
           Log('Libre : ' + Leer(s, 27, 54));
           Log(' ');
        end;
     end;
     Log('------------------------------------------------------------');
     Log('Fin Importacion : ' + DateTimeToStr(Now));
     Log('------------------------------------------------------------');
  except
     on e: Exception do
     begin
        Log('Error al abrir fichero : ' + Fichero);
        Log(e.Message);
        Log('------------------------------------------------------------');
        Log('FIN CON ERRORES!!! : ' + DateTimeToStr(Now));
        Log('------------------------------------------------------------');
        Error('Error al abrir fichero : ' + Fichero);
        Error(e.Message);
     end;
  end;
  Proceso1('Finalizada la Importacion');
  Proceso2('');
  CloseFile(F);
end;

end.
