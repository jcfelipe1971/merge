unit UDMCreaClienteRapido;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados;

type
  TDMCreaClienteRapido = class(TDataModule)
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     procedure DataModuleCreate(Sender: TObject);
  private
     { Private declarations }
     Agente: integer;
     function DameModoIva: integer;
  public
     { Public declarations }
     function ExisteTerceroNIF(NIF: string): boolean;
     function DameLocalidadEmpresa: string;
     function CrearTercero(Nombre, Nif, Direccion, Direccion2, Localidad, Telefono01, Telefono02, Telefax, Email: string; Notas: TStrings): integer;
     function CrearCliente(Tercero: integer): integer;
  end;

var
  DMCreaClienteRapido : TDMCreaClienteRapido;

implementation

uses UDMMain, UEntorno, UUtiles, UDameDato, HYFIBQuery;

{$R *.dfm}

procedure TDMCreaClienteRapido.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  Agente := DameAgenteUsuario(REntorno.Usuario);
  if (Agente = 0) then
     Agente := 1;
end;

function TDMCreaClienteRapido.ExisteTerceroNIF(NIF: string): boolean;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT TERCERO FROM SYS_TERCEROS WHERE NIF = :NIF';
        Params.ByName['NIF'].AsString := NIF;
        ExecQuery;
        Result := (FieldByName['TERCERO'].AsInteger <> 0);
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

function TDMCreaClienteRapido.DameLocalidadEmpresa: string;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT D.DIR_LOCALIDAD ');
        SQL.Add(' FROM SYS_EMPRESAS E ');
        SQL.Add(' JOIN SYS_TERCEROS_DIRECCIONES D ON E.TERCERO = D.TERCERO ');
        SQL.Add(' WHERE ');
        SQL.Add(' E.EMPRESA = :EMPRESA AND ');
        SQL.Add(' D.DIR_DEFECTO = 1 ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        ExecQuery;
        Result := FieldByName['DIR_LOCALIDAD'].AsString;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

function TDMCreaClienteRapido.DameModoIva: integer;
var
  Q : THYFIBQuery;
begin
  /// Consulta para obtener el modo de iva del canal

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MODO_IVA FROM EMP_CANALES WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        ExecQuery;
        Result := FieldByName['MODO_IVA'].AsInteger;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

function TDMCreaClienteRapido.CrearCliente(Tercero: integer): integer;
var
  Cliente : integer;
  Cuenta : string;
  Q : THYFIBQuery;
begin
  Cliente := DMMain.Contador_E('XCL');
  Cuenta := ExpandirCadena(DMMain.DameSemillaCuentaGestion(SemClientes, 1) + IntToStr(Cliente), REntorno.DigitosSub);
  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add('INSERT INTO VER_CLIENTES_CUENTAS ');
        SQL.Add('(EMPRESA, EJERCICIO, CANAL, CLIENTE, TERCERO, PAIS, PAIS_C2, TARIFA, AGENTE, CUENTA, FORMA_PAGO, CUENTA_DTOPP, PERFIL, CODIGO_INCOTERM, MODO_IVA, TIPO, NOTAS) ');
        SQL.Add('VALUES ');
        SQL.Add('(:EMPRESA, :EJERCICIO, :CANAL, :CLIENTE, :TERCERO, :PAIS, :PAIS_C2, :TARIFA, :AGENTE, :CUENTA, :FORMA_PAGO, :CUENTA_DTOPP, :PERFIL, :CODIGO_INCOTERM, :MODO_IVA, :TIPO, :NOTAS) ');
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
        Params.ByName['CANAL'].AsInteger := REntorno.Canal;
        Params.ByName['CLIENTE'].AsInteger := Cliente;
        Params.ByName['TERCERO'].AsInteger := Tercero;
        Params.ByName['PAIS'].AsString := REntorno.Pais;
        Params.ByName['PAIS_C2'].AsString := DamePaisC2(REntorno.Pais);
        Params.ByName['TARIFA'].AsString := REntorno.TarifaDefecto;
        Params.ByName['AGENTE'].AsInteger := Agente;
        Params.ByName['CUENTA'].AsString := Cuenta;
        Params.ByName['FORMA_PAGO'].AsString := 'CON';
        Params.ByName['CUENTA_DTOPP'].AsString := DMMain.DameCuentaGestion(15, 1, REntorno.Empresa);
        Params.ByName['PERFIL'].AsString := REntorno.Perfil;
        Params.ByName['CODIGO_INCOTERM'].AsString := 'EXW';
        Params.ByName['MODO_IVA'].AsInteger := DameModoIva;
        Params.ByName['TIPO'].AsInteger := 1;
        Params.ByName['NOTAS'].AsString := '';
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  Result := Cliente;
end;

function TDMCreaClienteRapido.CrearTercero(Nombre, Nif, Direccion, Direccion2, Localidad, Telefono01, Telefono02, Telefax, Email: string; Notas: TStrings): integer;
var
  Tercero : integer;
  Q : THYFIBQuery;
begin
  Tercero := DMMain.ContadorGen('CONTA_TERCEROS');

  Q := THYFIBQuery.Create(nil);
  try
     with Q do
     begin
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add('INSERT INTO VER_TERCEROS_EDICION ');
        SQL.Add('(TERCERO, NOMBRE_R_SOCIAL, NIF, EMAIL, TIPO_RAZON, DIR_DEFECTO, NOTAS, DIR_LOCALIDAD, TELEFONO01, TELEFONO02, TELEFAX, DIR_NOMBRE, DIR_NOMBRE_2) ');
        SQL.Add('VALUES ');
        SQL.Add('(:TERCERO, :NOMBRE_R_SOCIAL, :NIF, :EMAIL, :TIPO_RAZON, :DIR_DEFECTO, :NOTAS, :DIR_LOCALIDAD, :TELEFONO01, :TELEFONO02, :TELEFAX, :DIR_NOMBRE, :DIR_NOMBRE_2) ');
        Params.ByName['TERCERO'].AsInteger := Tercero;
        Params.ByName['NOMBRE_R_SOCIAL'].AsString := Trim(Nombre);
        Params.ByName['NIF'].AsString := Trim(Nif);
        Params.ByName['TIPO_RAZON'].AsString := 'DE';
        Params.ByName['EMAIL'].AsString := Trim(Email);
        Params.ByName['DIR_DEFECTO'].AsInteger := 1;
        Params.ByName['NOTAS'].AsString := Notas.Text;
        Params.ByName['DIR_LOCALIDAD'].AsString := Trim(Localidad);
        Params.ByName['TELEFONO01'].AsString := Trim(Telefono01);
        Params.ByName['TELEFONO02'].AsString := Trim(Telefono02);
        Params.ByName['TELEFAX'].AsString := Trim(Telefax);
        Params.ByName['DIR_NOMBRE'].AsString := Trim(Direccion);
        Params.ByName['DIR_NOMBRE_2'].AsString := Trim(Direccion2);
        ExecQuery;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;

  Result := Tercero;
end;

end.
