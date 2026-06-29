unit URellenaLista;

interface

uses
  {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  Classes, SysUtils, FIBDataSet;

function RellenaPaises(Lista: TStrings; Todas: boolean = True): integer;
procedure RellenaEjercicios(Lista: TStrings);
procedure RellenaCanales(Lista: TStrings);
procedure RellenaAlmacenes(Lista: TStrings; Todos: boolean = True);
procedure RellenaSeries(Lista: TStrings; Todas: boolean = True);
procedure RellenaAgentes(Lista: TStrings);
procedure RellenaRutasAgentes(Agente: integer; Lista: TStrings; Todas: boolean = False; SinRuta: boolean = False);
procedure RellenaTiposAsientos(Lista: TStrings; IncluyeTipo_ANA: boolean = False);
procedure RellenaTarifas(Lista: TStrings);
procedure RellenaUsuarios(Lista: TStrings);
procedure RellenaSecciones(Lista: TStrings; MostrarSoloMaquinas: boolean = False);
procedure RellenaPeriodoFacturacion(Lista: TStrings);
procedure RellenaPeriodos(Lista: TStrings; Tipo: integer = 1);
procedure RellenaListadosGrupo(Lista: TStrings; Grupo: integer);
procedure RellenaCajas(Lista: TStrings; Serie: string);
function RellenaMonedas(Lista: TStrings): integer;
procedure RellenaTelefonosTercero(Tercero: integer; Lista: TStrings);
procedure RellenaListaTelefonosTercero(Tercero: integer; Lista: TStrings);

implementation

uses
  UDMMain, UEntorno, UDameDato, UUtiles;

function RellenaPaises(Lista: TStrings; Todas: boolean): integer;
var
  Pais : string;
begin
  /// Rellena la lista con paises.
  /// Devuelve el ItemIndex asociado al pais del entorno.

  Result := -1;

  Lista.Clear;
  if (Todas) then
     Lista.AddObject(_('Todos los Paises'), Pointer(0));

  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT PAIS, TITULO FROM SYS_PAISES ');
           SelectSQL.Add(' ORDER BY PAIS ');
           Open;
           while not EOF do
           begin
              Pais := FieldByName('PAIS').AsString + ' - ' + FieldByName('TITULO').AsString;
              Lista.AddObject(Pais, Pointer(0));

              if (FieldByName('PAIS').AsString = REntorno.Pais) then
                 Result := Lista.Count - 1;

              Next;
           end;
           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;
end;

procedure RellenaEjercicios(Lista: TStrings);
var
  Ejercicio : integer;
begin
  Lista.Clear;
  Lista.AddObject(_('Todos los Ejercicios'), Pointer(0));
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Clear;
           SelectSQL.Add('SELECT EJERCICIO FROM EMP_EJERCICIOS ');
           SelectSQL.Add('WHERE EMPRESA = ?EMPRESA AND ACTIVO = 1');
           SelectSQL.Add('ORDER BY EJERCICIO DESC');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Open;
           while not EOF do
           begin
              Ejercicio := FieldByName('EJERCICIO').AsInteger;
              Lista.AddObject(IntToStr(Ejercicio), Pointer(Ejercicio));
              Next;
           end;
           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;
end;

procedure RellenaCanales(Lista: TStrings);
var
  Canal : integer;
begin
  Lista.Clear;
  Lista.AddObject(_('Todos los Canales'), Pointer(0));
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Clear;
           SelectSQL.Add('SELECT CANAL FROM EMP_CANALES ');
           SelectSQL.Add('WHERE EMPRESA = ?EMPRESA AND EJERCICIO = ?EJERCICIO AND ACTIVO = 1');
           SelectSQL.Add('ORDER BY CANAL');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Open;
           while not EOF do
           begin
              Canal := FieldByName('CANAL').AsInteger;
              Lista.AddObject(_('Canal') + ' ' + IntToStr(Canal), Pointer(Canal));
              Next;
           end;
           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;
end;

procedure RellenaAlmacenes(Lista: TStrings; Todos: boolean = True);
var
  Almacen : string;
begin
  Lista.Clear;
  if (Todos and (REntorno.AlmacenRestringido = '')) then
     Lista.AddObject(_('Todos los Almacenes'), Pointer(0));

  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Clear;
           SelectSQL.Add('SELECT ALMACEN, TITULO FROM ART_ALMACENES ');
           SelectSQL.Add('WHERE EMPRESA = :EMPRESA ');
           SelectSQL.Add('ORDER BY DEFECTO DESC, ALMACEN ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Open;
           while not EOF do
           begin
              Almacen := FieldByName('ALMACEN').AsString + ' ' + FieldByName('TITULO').AsString;
              if ((REntorno.AlmacenRestringido = '') or
                 (REntorno.AlmacenRestringido = FieldByName('ALMACEN').AsString)) then
                 Lista.AddObject(Almacen, Pointer(0));
              Next;
           end;
           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;
end;

procedure RellenaSeries(Lista: TStrings; Todas: boolean = True);
var
  Serie : string;
begin
  Lista.Clear;
  if (Todas) then
     Lista.AddObject(_('Todas las Series'), Pointer(0));

  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT E.SERIE, S.TITULO FROM EMP_SERIES E ');
           SelectSQL.Add(' JOIN SYS_SERIES S ON E.SERIE = S.SERIE ');
           SelectSQL.Add(' WHERE  ');
           SelectSQL.Add(' E.EMPRESA = :EMPRESA AND  ');
           SelectSQL.Add(' E.EJERCICIO = :EJERCICIO AND ');
           SelectSQL.Add(' E.CANAL = :CANAL AND ');
           SelectSQL.Add(' E.ACTIVO = 1 AND ');
           SelectSQL.Add(' E.SERIE NOT IN (SELECT SERIE FROM SYS_USUARIOS_PERFIL_EEC ');
           SelectSQL.Add('                 WHERE ');
           SelectSQL.Add('                 PERFIL = :PERFIL AND ');
           SelectSQL.Add('                 EMPRESA = E.EMPRESA AND ');
           SelectSQL.Add('                 EJERCICIO = E.EJERCICIO AND ');
           SelectSQL.Add('                 CANAL = E.CANAL) ');
           SelectSQL.Add(' ORDER BY E.SERIE ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Params.ByName['PERFIL'].AsInteger := REntorno.Restriccion;
           Open;
           while not EOF do
           begin
              Serie := FieldByName('SERIE').AsString + ' ' + FieldByName('TITULO').AsString;
              Lista.AddObject(Serie, Pointer(0));
              Next;
           end;
           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;
end;

procedure RellenaAgentes(Lista: TStrings);
var
  Agente : string;
begin
  Lista.Clear;
  Lista.AddObject(_('Todos los Agente'), Pointer(0));
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT AGENTE, TITULO FROM VER_AGENTES_CUENTAS ');
           SelectSQL.Add(' WHERE  ');
           SelectSQL.Add(' EMPRESA = ?EMPRESA AND ');
           SelectSQL.Add(' EJERCICIO = ?EJERCICIO AND ');
           SelectSQL.Add(' CANAL = ?CANAL ');
           SelectSQL.Add(' ORDER BY AGENTE ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Open;
           while not EOF do
           begin
              Agente := FieldByName('AGENTE').AsString + ' ' + FieldByName('TITULO').AsString;
              Lista.AddObject(Agente, Pointer(FieldByName('AGENTE').AsInteger));
              Next;
           end;
           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;
end;

procedure RellenaRutasAgentes(Agente: integer; Lista: TStrings; Todas: boolean = False; SinRuta: boolean = False);
begin
  Lista.Clear;
  if Todas then
     Lista.AddObject(_('Todas las Rutas'), Pointer(0));

  if SinRuta then
     Lista.AddObject(_('Sin Ruta'), Pointer(0));

  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Clear;
           SelectSQL.Add('SELECT ID_RUTA, TITULO FROM CRM_CONTACTOS_RUTAS ');
           SelectSQL.Add('WHERE EMPRESA = :EMPRESA AND AGENTE = :AGENTE');
           SelectSQL.Add('ORDER BY TITULO');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['AGENTE'].AsInteger := Agente;
           Open;
           while not EOF do
           begin
              Lista.AddObject(FieldByName('TITULO').AsString, Pointer(FieldByName('ID_RUTA').AsInteger));
              Next;
           end;
           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;
end;

procedure RellenaTiposAsientos(Lista: TStrings; IncluyeTipo_ANA: boolean = False);
var
  Tipo : string;
begin
  Lista.Clear;
  Lista.AddObject(_('Todos los tipos'), Pointer(0));
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Clear;
           SelectSQL.Add('SELECT TIPO, TITULO FROM SYS_TIPO_ASIENTO ');
           if (not IncluyeTipo_ANA) then
              SelectSQL.Add('WHERE TIPO <> ''ANA'' ');
           SelectSQL.Add('ORDER BY TIPO ');
           Open;
           while not EOF do
           begin
              Tipo := FieldByName('TIPO').AsString + ' ' + FieldByName('TITULO').AsString;
              Lista.AddObject(Tipo, Pointer(0));
              Next;
           end;
           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;
end;

procedure RellenaTarifas(Lista: TStrings);
var
  Tarifa : string;
begin
  Lista.Clear;
  Lista.AddObject(_('Todas las Tarifas'), Pointer(0));
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Clear;
           SelectSQL.Add('SELECT TARIFA, TITULO FROM ART_TARIFAS_C ');
           SelectSQL.Add('WHERE ');
           SelectSQL.Add('EMPRESA = :EMPRESA ');
           SelectSQL.Add('AND ACTIVA = 1');
           SelectSQL.Add('ORDER BY TARIFA ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Open;
           while not EOF do
           begin
              Tarifa := FieldByName('TARIFA').AsString + ' ' + FieldByName('TITULO').AsString;
              Lista.AddObject(Tarifa, Pointer(0));
              Next;
           end;
           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;
end;

procedure RellenaUsuarios(Lista: TStrings);
var
  Usuario : string;
begin
  Lista.Clear;
  Lista.AddObject(_('Todos los Usuarios'), Pointer(0));
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT USUARIO, NOMBRE FROM SYS_USUARIOS ');
           SelectSQL.Add(' WHERE ACTIVO = 1 ');
           SelectSQL.Add(' ORDER BY NOMBRE ');
           Open;
           while not EOF do
           begin
              Usuario := FieldByName('USUARIO').AsString + ' ' + FieldByName('NOMBRE').AsString;
              Lista.AddObject(Usuario, Pointer(FieldByName('USUARIO').AsInteger));
              Next;
           end;
           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;
end;

procedure RellenaSecciones(Lista: TStrings; MostrarSoloMaquinas: boolean = False);
var
  Seccion : string;
  i : integer;
begin
  Lista.Clear;
  Lista.AddObject(_('Todas las Secciones'), Pointer(0));
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT SECCION, DESCRIPCION FROM OPE_SECCIONES ');
           SelectSQL.Add(' WHERE EMPRESA = :EMPRESA ');
           if MostrarSoloMaquinas then
              SelectSQL.Add(' AND MOSTRAR_EN_MAQUINAS = 1 ');
           SelectSQL.Add(' ORDER BY SECCION ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Open;
           i := 1;
           while not EOF do
           begin
              Seccion := FieldByName('SECCION').AsString + ' ' + FieldByName('DESCRIPCION').AsString;
              Lista.AddObject(Seccion, Pointer(i));
              Inc(i);
              Next;
           end;
           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;
end;

procedure RellenaPeriodoFacturacion(Lista: TStrings);
var
  Periodo : string;
  i : integer;
begin
  Lista.Clear;
  Lista.AddObject(_('Todos los Periodos'), Pointer(0));
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT PERIODO, TITULO FROM EMP_PERIODOS_FACTURACION ');
           SelectSQL.Add(' WHERE EMPRESA = :EMPRESA ');
           SelectSQL.Add(' ORDER BY PERIODO ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Open;
           i := 1;
           while not EOF do
           begin
              Periodo := FieldByName('PERIODO').AsString + ' ' + FieldByName('TITULO').AsString;
              Lista.AddObject(Periodo, Pointer(i));
              Inc(i);
              Next;
           end;
           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;
end;

procedure RellenaPeriodos(Lista: TStrings; Tipo: integer = 1);
var
  Periodo : string;
  i : integer;
begin
  /// Tipo = 1:Mensual; 2:Trimestral; 3:Semestral; 4:Anual; 5:Apertura

  Lista.Clear;
  Lista.AddObject(_('Todos los Periodos'), Pointer(0));
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT PERIODO, TITULO FROM EMP_PERIODOS ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
           SelectSQL.Add(' EJERCICIO = :EJERCICIO AND ');
           SelectSQL.Add(' TIPO = :TIPO ');
           SelectSQL.Add(' ORDER BY PERIODO ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['TIPO'].AsInteger := Tipo;
           Open;
           i := 1;
           while not EOF do
           begin
              Periodo := FieldByName('PERIODO').AsString + ' ' + FieldByName('TITULO').AsString;
              Lista.AddObject(Periodo, Pointer(i));
              Inc(i);
              Next;
           end;
           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;
end;

procedure RellenaListadosGrupo(Lista: TStrings; Grupo: integer);
var
  Listado : string;
  i : integer;
begin
  Lista.Clear;
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT LISTADO, TITULO FROM DIC_LISTADOS ');
           SelectSQL.Add(' WHERE GRUPO = :GRUPO ');
           SelectSQL.Add(' ORDER BY LISTADO ');
           Params.ByName['GRUPO'].AsInteger := Grupo;
           Open;
           while not EOF do
           begin
              Listado := FieldByName('LISTADO').AsString + ' ' + FieldByName('TITULO').AsString;
              i := FieldByName('LISTADO').AsInteger;
              Lista.AddObject(Listado, Pointer(i));
              Next;
           end;
           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;
end;

procedure RellenaCajas(Lista: TStrings; Serie: string);
var
  Caja : string;
  i : integer;
begin
  Lista.Clear;
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT CAJA, TITULO FROM EMP_CAJAS ');
           SelectSQL.Add(' WHERE  ');
           SelectSQL.Add(' EMPRESA = ?EMPRESA AND  ');
           SelectSQL.Add(' EJERCICIO = ?EJERCICIO AND ');
           SelectSQL.Add(' CANAL = ?CANAL ');
           SelectSQL.Add(' ORDER BY CAJA ');
           Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
           Params.ByName['CANAL'].AsInteger := REntorno.Canal;
           Open;
           while not EOF do
           begin
              Caja := FieldByName('CAJA').AsString + ' ' + FieldByName('TITULO').AsString;
              i := FieldByName('CAJA').AsInteger;
              Lista.AddObject(Caja, Pointer(i));
              Next;
           end;
           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;
end;

function RellenaMonedas(Lista: TStrings): integer;
var
  Moneda : string;
begin
  /// Rellena la lista de monedas
  /// Devuelve el ItemIndex asociado la moneda del entorno.

  Result := -1;
  Lista.Clear;
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Clear;
           SelectSQL.Add(' SELECT MONEDA, TITULO ');
           SelectSQL.Add(' FROM SYS_MONEDAS ');
           SelectSQL.Add(' ORDER BY DEFECTO DESC, MONEDA ');
           Open;
           while not EOF do
           begin
              Moneda := FieldByName('MONEDA').AsString + ' ' + FieldByName('TITULO').AsString;
              Lista.AddObject(Moneda, Pointer(0));

              if (FieldByName('MONEDA').AsString = REntorno.Moneda) then
                 Result := Lista.Count - 1;

              Next;
           end;
           Close;
           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;
end;

procedure RellenaTelefonosTercero(Tercero: integer; Lista: TStrings);
begin
  Lista.Clear;
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           // Telefono principal
           {
           Close;
           DataBase := Self.DataBase;
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Clear;
           SelectSQL.Add('select dir_telefono01 from sys_terceros_direcciones where tercero=?tercero and dir_defecto=1');
           Params.ByName['TERCERO'].AsInteger := Tercero;
           Open;
           if (Trim(FieldByName('DIR_TELEFONO01').AsString) > '') then
              Lista.Add(FieldByName('DIR_TELEFONO01').AsString);
           Close;
           }

           // Telefonos de la direccion principal
           SelectSQL.Clear;
           SelectSQL.Add('SELECT DIRECCION, DIR_TELEFONO02, DIR_TELEFAX, DIR_COMPLETA_N FROM SYS_TERCEROS_DIRECCIONES WHERE TERCERO = ?TERCERO AND DIR_DEFECTO = 1 ORDER BY DIRECCION');
           Params.ByName['TERCERO'].AsInteger := Tercero;
           Open;
           if (Trim(FieldByName('DIR_TELEFONO02').AsString) > '') then
              Lista.Add(Format(_('Dir. %d - Tel. 2: %s - %s'), [FieldByName('DIRECCION').AsInteger, FieldByName('DIR_TELEFONO02').AsString, FieldByName('DIR_COMPLETA_N').AsString]));
           if (Trim(FieldByName('DIR_TELEFAX').AsString) > '') then
              Lista.Add(Format(_('Dir. %d - Fax: %s - %s'), [FieldByName('DIRECCION').AsInteger, FieldByName('DIR_TELEFAX').AsString, FieldByName('DIR_COMPLETA_N').AsString]));
           Close;

           // Telefonos de las otras direcciones
           DataBase := DMMain.DataBase;
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Clear;
           SelectSQL.Add('SELECT DIRECCION, DIR_TELEFONO01, DIR_TELEFONO02, DIR_TELEFAX, DIR_COMPLETA_N FROM SYS_TERCEROS_DIRECCIONES WHERE TERCERO = ?TERCERO AND DIR_DEFECTO = 0 ORDER BY DIRECCION');
           Params.ByName['TERCERO'].AsInteger := Tercero;
           Open;
           while not EOF do
           begin
              if (Trim(FieldByName('DIR_TELEFONO01').AsString) > '') then
                 Lista.Add(Format(_('Dir. %d - Tel. 1: %s - %s'), [FieldByName('DIRECCION').AsInteger, FieldByName('DIR_TELEFONO01').AsString, FieldByName('DIR_COMPLETA_N').AsString]));
              if (Trim(FieldByName('DIR_TELEFONO02').AsString) > '') then
                 Lista.Add(Format(_('Dir. %d - Tel. 2: %s - %s'), [FieldByName('DIRECCION').AsInteger, FieldByName('DIR_TELEFONO02').AsString, FieldByName('DIR_COMPLETA_N').AsString]));
              if (Trim(FieldByName('DIR_TELEFAX').AsString) > '') then
                 Lista.Add(Format(_('Dir. %d - Fax: %s - %s'), [FieldByName('DIRECCION').AsInteger, FieldByName('DIR_TELEFAX').AsString, FieldByName('DIR_COMPLETA_N').AsString]));
              Next;
           end;
           Close;

           // Telefonos de contactos
           DataBase := DMMain.DataBase;
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;
           SelectSQL.Clear;
           SelectSQL.Add('SELECT CONTACTO, APELLIDOS || '' '' || NOMBRE AS NOMBRE, MOVIL, TELEFONO, FAX FROM SYS_TERCEROS_CONTACTOS WHERE TERCERO = ?TERCERO ORDER BY CONTACTO');
           Params.ByName['TERCERO'].AsInteger := Tercero;
           Open;
           while not EOF do
           begin
              if (Trim(FieldByName('MOVIL').AsString) > '') then
                 Lista.Add(Format(_('Con. %d - Movil: %s - %s'), [FieldByName('CONTACTO').AsInteger, FieldByName('MOVIL').AsString, FieldByName('NOMBRE').AsString]));
              if (Trim(FieldByName('TELEFONO').AsString) > '') then
                 Lista.Add(Format(_('Con. %d - Tel. 1: %s - %s'), [FieldByName('CONTACTO').AsInteger, FieldByName('TELEFONO').AsString, FieldByName('NOMBRE').AsString]));
              if (Trim(FieldByName('FAX').AsString) > '') then
                 Lista.Add(Format(_('Con. %d - Fax: %s - %s'), [FieldByName('CONTACTO').AsInteger, FieldByName('FAX').AsString, FieldByName('NOMBRE').AsString]));
              Next;
           end;
           Close;

           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;
end;

procedure RellenaListaTelefonosTercero(Tercero: integer; Lista: TStrings);

  function SoloNumeros(s: string): string;
  var
     i : integer;
  begin
     Result := '';
     for i := 1 to Length(s) do
        if (s[i] in ['0'..'9']) then
           Result := Result + UpperCase(s[i]);
  end;

begin
  Lista.Clear;
  with TFIBDataSet.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        Transaction := DameTransactionRO(DMMain.DataBase);
        try
           if (not Transaction.InTransaction) then
              Transaction.StartTransaction;

           SelectSQL.Clear;
           SelectSQL.Add(' select dir_telefono01 telefono, ''Telefono 1'' descripcion, cast(1 as integer) orden ');
           SelectSQL.Add(' from sys_terceros_direcciones ');
           SelectSQL.Add(' where ');
           SelectSQL.Add(' tercero = :tercero and ');
           SelectSQL.Add(' dir_defecto = 1 and ');
           SelectSQL.Add(' dir_telefono01 > '''' ');
           SelectSQL.Add(' union ');
           SelectSQL.Add(' select dir_telefono02 telefono, ''Telefono 2'' descripcion, cast(2 as integer)  orden ');
           SelectSQL.Add(' from sys_terceros_direcciones ');
           SelectSQL.Add(' where ');
           SelectSQL.Add(' tercero = :tercero and ');
           SelectSQL.Add(' dir_defecto = 1 and ');
           SelectSQL.Add(' dir_telefono02 > '''' ');
           SelectSQL.Add(' union ');
           SelectSQL.Add(' select dir_telefax telefono, ''Telefax'' descripcion, cast(3 as integer) orden ');
           SelectSQL.Add(' from sys_terceros_direcciones ');
           SelectSQL.Add(' where ');
           SelectSQL.Add(' tercero = :tercero and ');
           SelectSQL.Add(' dir_defecto = 1 and ');
           SelectSQL.Add(' dir_telefax > '''' ');
           SelectSQL.Add(' ');
           SelectSQL.Add(' union ');
           SelectSQL.Add(' select telefono telefono, ''Telefono '' || nombre || '' '' || apellidos descripcion, cast(1 + (contacto * 100) as integer) orden ');
           SelectSQL.Add(' from sys_terceros_contactos ');
           SelectSQL.Add(' where ');
           SelectSQL.Add(' tercero = :tercero and ');
           SelectSQL.Add(' telefono > '''' ');
           SelectSQL.Add(' union ');
           SelectSQL.Add(' select movil telefono, ''Movil '' || nombre || '' '' || apellidos descripcion, cast(2 + (contacto * 100) as integer) orden ');
           SelectSQL.Add(' from sys_terceros_contactos ');
           SelectSQL.Add(' where ');
           SelectSQL.Add(' tercero = :tercero and ');
           SelectSQL.Add(' movil > '''' ');
           SelectSQL.Add(' union ');
           SelectSQL.Add(' select fax telefono, ''Fax '' || nombre || '' '' || apellidos descripcion, cast(3 + (contacto * 100) as integer) orden ');
           SelectSQL.Add(' from sys_terceros_contactos ');
           SelectSQL.Add(' where ');
           SelectSQL.Add(' tercero = :tercero and ');
           SelectSQL.Add(' fax > '''' ');
           SelectSQL.Add(' ');
           SelectSQL.Add(' union ');
           SelectSQL.Add(' select dir_telefono01 telefono, ''Telefono 1 '' || dir_completa descripcion, cast(1 + (direccion * 1000) as integer) orden ');
           SelectSQL.Add(' from sys_terceros_direcciones ');
           SelectSQL.Add(' where ');
           SelectSQL.Add(' tercero = :tercero and ');
           SelectSQL.Add(' dir_defecto <> 1 and ');
           SelectSQL.Add(' dir_telefono01 > '''' ');
           SelectSQL.Add(' union ');
           SelectSQL.Add(' select dir_telefono02 telefono, ''Telefono 2 '' || dir_completa descripcion, cast(2 + (direccion * 1000) as integer) orden ');
           SelectSQL.Add(' from sys_terceros_direcciones ');
           SelectSQL.Add(' where ');
           SelectSQL.Add(' tercero = :tercero and ');
           SelectSQL.Add(' dir_defecto <> 1 and ');
           SelectSQL.Add(' dir_telefono02 > '''' ');
           SelectSQL.Add(' union ');
           SelectSQL.Add(' select dir_telefax telefono, ''Telefax '' || dir_completa descripcion, cast(3 + (direccion * 1000) as integer) orden ');
           SelectSQL.Add(' from sys_terceros_direcciones ');
           SelectSQL.Add(' where ');
           SelectSQL.Add(' tercero = :tercero and ');
           SelectSQL.Add(' dir_defecto <> 1 and ');
           SelectSQL.Add(' dir_telefax > '''' ');
           SelectSQL.Add(' ');
           SelectSQL.Add(' order by 3 ');
           Params.ByName['TERCERO'].AsInteger := Tercero;
           Open;

           while not EOF do
           begin
              if (Trim(FieldByName('TELEFONO').AsString) > '') then
                 Lista.Add(Format(_('%s - %s'), [SoloNumeros(FieldByName('TELEFONO').AsString), FieldByName('DESCRIPCION').AsString]));
              Next;
           end;

           Close;

           Transaction.Commit;
        finally
           Transaction.Free;
        end;
     finally
        Free;
     end;
  end;
end;

end.
