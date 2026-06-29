unit UDameDato;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE};

function DameLicencia: string;
function DameEmailLicencia: string;

function DameTituloEquivalenciaPrevired(IdClasificacion: integer; Codigo: string): string;
function DameTituloArticulo(Articulo: string; Empresa: integer = 0): string; overload;
function DameTituloArticulo(id_a: integer): string; overload;
function DameCodigoProveedor(Proveedor: integer; Articulo: string): string;
function DameCodigoArancelario(Articulo: string; Empresa: integer = 0): string;
function DameRedSocial(IdRedSocial: integer): string;
function DameEmpleadoTercero(Tercero: integer): integer;
function DameNombreTercerosVarios(Tipo: string; IdDoc: integer): string;
function DameOrdenDeTrabajo(Id_Orden: integer): integer;
function DameTituloServConfCorreo(Id: integer): string;
function DameTituloTipoPresencia(Tipo: string): string;
function DameTituloIncidencia(Id: integer): string;
function DameIdIncidenciaDefecto: integer;
function DameTituloDispositivo(Id: integer): string;
function DameTituloRetencionDOM(Id: integer): string;
function DameTituloTipoOrigen(Tipo: string): string;
function DameTituloModeoTyC(Modelo: string; Empresa: integer = 0): string;
function DameTituloTipoLona(Tipo: string): string;
function DameTituloIEPNRClaveProducto(Codigo: string): string;
function DameTituloTipoCuenta(Codigo: integer): string;
function DameTipoIva(PorcentajeIva: double; Pais: string = ''): integer;
function DameTipoIVAArticulo(Articulo: string; Empresa: integer = 0; Ejercicio: integer = 0; Canal: integer = 0): integer; overload;
function DameTipoIVAArticulo(Id_c_a: integer): integer; overload;
function DameTipoIVACanal: integer;
function DameTituloTipoArticulo(TipoArticulo: string): string;
function DameTituloIdiomaArticulo(id_a: integer; Idioma: string = ''): string;
function DameTituloFamilia(Familia: string): string;
function DameTituloSubFamilia(SubFamilia, Familia: string): string;
function DameTituloCuenta(Cuenta: string; Ejercicio: integer = 0): string;
function DameTituloGrupoCuentas(GrupoCuentas: integer): string;
function DameTituloAlmacen(Almacen: string; Empresa: integer = 0): string;
function DameTituloProveedor(Proveedor: integer; Empresa: integer = 0; Ejercicio: integer = 0; Canal: integer = 0): string;
function DameTituloAcreedor(Acreedor: integer; Empresa: integer = 0; Ejercicio: integer = 0; Canal: integer = 0): string;
function DameTituloCliente(Cliente: integer; Empresa: integer = 0; Ejercicio: integer = 0; Canal: integer = 0): string;
function DameTituloClientePotencial(Cliente: integer): string;
function DameTituloBalance(Balance: integer; Pais: string = ''): string;
function DameTituloAgente(Agente: integer; Empresa: integer = 0): string;
function DameTituloSerie(Serie: string): string;
function DameTituloCampanya(Campanya: integer): string;
function DameTituloContacto(Tercero, Contacto: integer): string;
function DameTituloContactoCRM(ID: integer): string;
function DameTituloAccionCRM(ID: integer): string;
function DameTituloTipoAccionCRM(Accion: string): string;
function DameTituloTipoLinea(Tipo: integer): string;
function DameTituloCanal(Canal: integer): string;
function DameTituloProyecto(Proyecto: integer): string;
function DameTituloIdProyecto(IdProyecto: integer): string;
function DameTituloImagen(Codigo: integer): string;
function DameTituloGaleria(Id: integer): string;
function DameTituloArticuloProveedor(Proveedor: integer; Articulo: string): string;
function DameTituloTercero(Tercero: integer): string;
function DameTituloEmpresa(Empresa: integer): string;
function DameTituloUsuario(Usuario: integer): string;
function DameTituloPerfilUsuario(Perfil: integer): string;
function DameTituloTipoCRM(tipo: string): string;
function DameTituloEntidad(Pais, Entidad: string): string;
function DameTituloBanco(Banco: integer): string;
function DameTituloListado(Listado: integer): string;
function DameTituloListadoDefectoGrupo(Grupo: integer): string;
function DameTituloModeloHacienda(Modelo: string): string;
function DameTituloTipoIncidencia(tipo: string): string;
function DameTituloTipoIncidenciaMaq(tipo: string): string;
function DameTituloZona(Zona: string): string;
function DameTituloEfecto(Tipo: string): string;
function DameTituloAgrupacion(Tipo, Agrupacion: string): string;
function DameTituloProtocolo(Protocolo: string): string;
function DameTituloDepartamento(Departamento: string): string;
function DameTituloPais(Pais: string): string;
function DameTituloProvincia(Pais, Provincia: string): string;
function DameTituloUbicacion(id_ubicacion: integer): string;
function DameTituloCodigoIncoterm(Codigo: string): string;
function DameTituloGrupoIncoterm(Grupo: string): string;
function DameTituloCentroCoste(Digito: integer; Letra: string): string;
function DameTituloFase(TipoFase: string): string;
function DameTituloTarea(TipoTarea: string): string;
function DameTituloTurno(Turno: string): string;
function DameTituloRecurso(Recurso: string): string;
function DameTituloFormula(IdFormula: integer): string;
function DameTituloModoIVA(Modo: integer): string;
function DameTituloNormativa(Normativa: string): string;
function DameTituloTipoEnsayo(Ensayo: string): string;
function DameTituloEmpleado(Empleado: integer): string;
function DameTituloIdEmpleado(Id: integer): string;
function DameTituloMoneda(Moneda: string): string;
function DameTituloFormaPago(FormaPago: string; Idioma: string = ''): string;
function DameTituloLargoFormaPago(FormaPago: string; Idioma: string = ''): string;
function DameTituloMaquina(Maquina: integer): string;
function DameTituloCentroTrabajo(CentroTrabajo: string): string;
function DameTituloTarifa(Tarifa: string; Empresa: integer = 0): string;
function DameTituloCalculo(Calculo: integer): string;
function DameTituloSeccion(Seccion: string): string;
function DameTituloCilindro(Cilindro: integer): string;
function DameTituloSituacionProduccion(Situacion: integer): string;
function DameTituloIdioma(Idioma: string): string;
function DameTituloTipoUnidad(TipoUnidad: string): string;
function DameTituloUtillaje(Codigo: string): string;
function DameTituloPorte(Tipo: integer; Idioma: string = ''): string;
function DameTituloEscandalloProduccion(Escandallo: integer; Tipo: string = 'EPR'): string;
function DameTituloIdEscandalloProduccion(IdEsc: integer): string;
function DameTituloDireccionTercero(Tercero, Direccion: integer): string;
function DameDireccionEDI(CodigoEDI: string): string;
function DameDireccionTercero(Tercero, Direccion: integer): string;
function DameTituloEstado(Estado: integer): string;
function DameTituloCalendario(Calendario: integer): string;
function DameTituloGrupoTalla(IdGrupoTalla: integer): string;
function DameTituloMarca(IdMarca: integer): string;
function DameTituloMarcaModelo(IdMarca: integer): string; overload;
function DameTituloMarcaModelo(Marca: string): string; overload;
function DameTituloModelo(IdModelo: integer): string;
function DameTituloClaseDireccion(Clase: integer): string;
function DameTituloPeriodo(Periodo: string): string;
function DameTituloNIF(NIF: string): string;
function DameTituloIBAE(Tipo: integer; Pais: string = ''): string;
function DameTituloUbicacionSimple(IdUbicacionSimple: integer): string;
function DameTituloBancoTercero(Tercero, Banco: integer): string;
function DameTituloTipoVenta(Tipo: integer): string;
function DameTituloCodigoGiro(Codigo: integer): string;
function DameTituloComuna(ID_Comuna: integer): string;
function DameTituloRegion(Pais, Region: string): string;
function DameTituloCodigoPostal(Pais, CodigoPostal: string): string;
function DameTituloTipoDocIdentidad(Pais, TipoDocIdent: string): string;
function DameTituloPoblacion(Pais, Poblacion: string): string;
function DameTituloTipoDocTributario(Codigo: string): string;
function DameTituloParametrosFE(Codigo: integer; Parametro: string): string;
function DameTituloCategoria(Codigo: string): string;
function DameTituloImpuestoAdicional(Tipo: integer; Pais: string = ''): string;
function DameTituloArtModGenero(Codigo: string): string;
function DameTituloArtModTemporada(Codigo: string): string;
function DameTituloGiroEmpresa(Empresa: integer): string;
function DameTituloPerfilCliente(Perfil: string): string;
function DameTituloNCF(Tipo: integer): string;
function DameTituloFichaTecnica(IdFichaTecnica: integer): string;
function DameTituloEstrategiaCompra(Estrategia: integer): string;
function DameLote(IdLote: integer): string;
function DameClasificacionLote(IdLote: integer): string;
function DamePais(PaisC2: string): string;
function DamePaisC2(Pais: string): string;
function Notas(Tipo: string; CliPro: integer): boolean;
function DameNombreComercialProveedor(Proveedor: integer; Empresa: integer = 0; Ejercicio: integer = 0; Canal: integer = 0): string;
function DameNombreComercialCliente(Cliente: integer; Empresa: integer = 0; Ejercicio: integer = 0; Canal: integer = 0): string;
function DameEAN8Articulo(Articulo: string): string;
function DameEAN13Articulo(Articulo: string): string;
function DameDUN14Articulo(Articulo: string): string;
function DameUPCArticulo(Articulo: string): string;
function DameISBNArticulo(Articulo: string): string;
function DameCodigoBarras(Articulo: string): string;
function DameArticuloBarras(Barras: string): string;
function DameNombreComercialTercero(Tercero: integer): string;
function DamePerfilUsuario(Usuario: integer = 0): integer;
function DameBancoDefecto(Empresa: integer = 0; Ejercicio: integer = 0; Canal: integer = 0): integer;
function DameEntidadBanco(Banco: integer): string;
function DamePgc(Empresa, Ejercicio, Canal: integer): integer;
function DameEjercicio(Empresa: integer; Fecha: TDateTime): integer;
function DameUsuarioSegunEntrada(Entrada: integer): integer;
function DameNombreCorreoUsuario(Usuario: integer): string;
function DameTercero(Tipo: string; Codigo: integer; Empresa: integer = 0): integer;
function EntradaAbierta: boolean;
function DameIDCliente(Cliente: integer; Empresa: integer = 0): integer;
function DameIDEmpleado(Empleado: integer; Empresa: integer = 0): integer;
function DameEmpleadoTarjeta(CodigoTarjeta: string): integer;
function DameIdEmpleadoTarjeta(CodigoTarjeta: string): integer;
function DameIDAgente(Agente: integer): integer;
function DameIDProveedor(Proveedor: integer): integer;
function DameIDAcreedor(Acreedor: integer): integer;
function DameAgenteUsuario(Usuario: integer): integer;
function DameRestriccionAgenteUsuario(Usuario: integer): boolean;
function ArticuloSerializado(Articulo: string): boolean; overload;
function ArticuloSerializado(id_a: integer): boolean; overload;
function ArticuloLoteable(Articulo: string): boolean; overload;
function ArticuloLoteable(id_a: integer): boolean; overload;
function ArticuloUbicable(Articulo: string): boolean; overload;
function ArticuloUbicable(id_a: integer): boolean; overload;
function DameComposicionUbicacion(id_ubicacion: integer): string;
function DameIDArticulo(Articulo: string; Empresa: integer = 0): integer;
function DameIDCArticulo(Articulo: string; Empresa: integer = 0; Ejercicio: integer = 0; Canal: integer = 0): integer;
function DameIDLote(Articulo, Lote: string): integer;
function DameFamilia(IdFamilia: integer): string;
function DameArticulo(id_a: integer): string;
function DameIDFamilia(Familia: string; Empresa: integer = 0): integer;
function DameIDSubFamilia(IdFamilia: integer; SubFamilia: string; Empresa: integer = 0): integer;
function DameSubFamilia(IdSubFamilia: integer): string;
function DameIDUbicacionGeneral(Almacen: string): integer;
function TarifaEsIvaIncluido(Tarifa: string; Empresa: integer = 0): boolean;

implementation

uses UDMMain, UUtiles, UEntorno, DateUtils, UParam, Classes, SysUtils, HYFIBQuery;

var
  UltimoArticuloLoteable : string = '';
  UltimoArticuloLoteableLoteable : boolean = False;
  UltimoIDALoteable : integer = 0;
  UltimoIDALoteableLoteable : boolean = False;

function FloatToStringFB(Value: double): string;
var
  OldSep : char;
begin
  OldSep := DecimalSeparator;
  try
     DecimalSeparator := '.';
     Result := FloatToStrF(Value, ffGeneral, 15, 0);
  finally
     DecimalSeparator := OldSep;
  end;
end;

function DameDato(aSQL: string): string;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := aSQL;
        ExecQuery;
        Result := Fields[0].AsString;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function DameDatoI(aSQL: string): integer;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := aSQL;
        ExecQuery;
        Result := Fields[0].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function DameLicencia: string;
begin
  Result := DameDato('SELECT LICENCIA FROM SYS_CONSTANTES');
end;

function DameEmailLicencia: string;
begin
  Result := DameDato('SELECT EMAIL_LICENCIA FROM SYS_CONSTANTES');
end;

function DameTituloEquivalenciaPrevired(IdClasificacion: integer; Codigo: string): string;
begin
  Codigo := Copy(Codigo, 1, 15);

  Result := DameDato('SELECT GLOSA FROM SYS_EQUIVALENCIAS_PREVIRED WHERE ID_CLASIFICACION = ' + IntToStr(IdClasificacion) + ' AND CODIGO = ' + QuotedStr(Codigo));
end;

function DameTituloArticulo(Articulo: string; Empresa: integer = 0): string;
begin
  Result := '';
  Articulo := Copy(Trim(Articulo), 1, 15);
  if (Empresa = 0) then
     Empresa := REntorno.Empresa;

  if (Articulo > '') then
     Result := DameDato('SELECT TITULO_LARGO FROM ART_ARTICULOS WHERE EMPRESA = ' + IntToStr(Empresa) + ' AND ARTICULO = ' + QuotedStr(Articulo));
end;

function DameTituloArticulo(id_a: integer): string;
begin
  Result := DameDato('SELECT TITULO_LARGO FROM ART_ARTICULOS WHERE ID_A = ' + IntToStr(id_a));
end;

function DameCodigoProveedor(Proveedor: integer; Articulo: string): string;
begin
  Result := '';
  Articulo := Copy(Trim(Articulo), 1, 15);
  if ((Trim(Articulo) > '') and (Proveedor <> 0)) then
     Result := DameDato('SELECT CODIGO_PROVEEDOR FROM ART_ARTICULOS_CODPROV WHERE EMPRESA = ' + REntorno.EmpresaStr + ' AND ARTICULO = ' + QuotedStr(Articulo) + ' AND PROVEEDOR = ' + IntToStr(Proveedor));
end;

function DameCodigoArancelario(Articulo: string; Empresa: integer = 0): string;
begin
  Result := '';
  Articulo := Copy(Trim(Articulo), 1, 15);
  if (Empresa = 0) then
     Empresa := REntorno.Empresa;

  if (Articulo > '') then
     Result := DameDato('SELECT CODIGO_INTRA FROM ART_ARTICULOS WHERE EMPRESA = ' + IntToStr(Empresa) + ' AND ARTICULO = ' + QuotedStr(Articulo));
end;

function DameRedSocial(IdRedSocial: integer): string;
begin
  Result := DameDato('SELECT NOMBRE FROM SYS_REDES_SOCIALES WHERE ID_RED_SOCIAL = ' + IntToStr(IdRedSocial));
end;

function DameEmpleadoTercero(Tercero: integer): integer;
begin
  Result := DameDatoI('SELECT EMPLEADO FROM OPE_EMPLEADO WHERE EMPRESA = ' + IntToStr(REntorno.Empresa) + ' AND TERCERO = ' + IntToStr(Tercero));
end;

function DameNombreTercerosVarios(Tipo: string; IdDoc: integer): string;
begin
  if ((Tipo = 'OFC') or (Tipo = 'PEC') or (Tipo = 'ALB') or (Tipo = 'FAC') or (Tipo = 'TIC')) then
     Result := DameDato('SELECT NOMBRE FROM GES_CABECERAS_S_FAC_NIF WHERE TIPO = ' + QuotedStr(Tipo) + ' AND ID_S = ' + IntToStr(IdDoc))
  else
     Result := DameDato('SELECT NOMBRE FROM GES_CABECERAS_E_FAC_NIF WHERE TIPO = ' + QuotedStr(Tipo) + ' AND ID_E = ' + IntToStr(IdDoc));
end;

function DameOrdenDeTrabajo(Id_Orden: integer): integer;
begin
  Result := DameDatoI('SELECT RIG_OF FROM PRO_ORD WHERE ID_ORDEN = ' + IntToStr(Id_Orden));
end;

function DameTituloServConfCorreo(Id: integer): string;
begin
  Result := '';
  if (id <> 0) then
     Result := DameDato('SELECT DESCRIPCION FROM EMP_CONFIG_SERVIDOR_CORREO WHERE ID = ' + IntToStr(Id));
end;

function DameTituloTipoPresencia(Tipo: string): string;
begin
  Result := '';
  Tipo := Trim(Copy(Tipo, 1, 3));
  if (Tipo <> '') then
     Result := DameDato('SELECT DESCRIPCION FROM PRO_SYS_TIPO_PRESENCIA WHERE TIPO = ' + QuotedStr(Tipo));
end;

function DameTituloIncidencia(Id: integer): string;
begin
  Result := '';
  if (id <> 0) then
     Result := DameDato('SELECT DESCRIPCION FROM PRO_SYS_TIPO_INCIDENCIA WHERE ID_INCIDENCIA = ' + IntToStr(Id));
end;

function DameIdIncidenciaDefecto: integer;
begin
  Result := DameDatoI('SELECT ID_INCIDENCIA FROM PRO_SYS_TIPO_INCIDENCIA WHERE DEFECTO = 1');
end;

function DameTituloDispositivo(Id: integer): string;
begin
  Result := '';
  if (id <> 0) then
     Result := DameDato('SELECT DESCRIPCION FROM PRO_SYS_DISP_PRESENCIA WHERE ID = ' + IntToStr(Id));
end;

function DameTituloRetencionDOM(Id: integer): string;
begin
  Result := '';
  if (id <> 0) then
     Result := DameDato('SELECT DESCRIPCION FROM DOM_TIPO_RETENCION WHERE ID = ' + IntToStr(Id));
end;

function DameTituloTipoOrigen(Tipo: string): string;
begin
  Result := '';
  Tipo := Copy(Trim(Tipo), 1, 3);
  if (Tipo > '') then
     Result := DameDato('SELECT TITULO FROM SYS_ORIGENES_DOCUMENTOS WHERE UPPER(TIPO) = UPPER(''' + Tipo + ''') ');
end;

function DameTituloModeoTyC(Modelo: string; Empresa: integer = 0): string;
begin
  if (Empresa = 0) then
     Empresa := REntorno.Empresa;

  Result := '';
  Modelo := Copy(Trim(Modelo), 1, 5);
  if (Modelo > '') then
     Result := DameDato('SELECT DESCRIPCION FROM Z_SYS_MODELOS WHERE EMPRESA = ' + IntToStr(Empresa) + ' AND CODIGO = ''' + Modelo + ''' ');
end;

function DameTituloTipoLona(Tipo: string): string;
begin
  Result := '';
  Tipo := Copy(Trim(Tipo), 1, 3);
  if (Tipo > '') then
     Result := DameDato('SELECT DESCRIPCION FROM Z_SYS_LONAS WHERE CODIGO = ''' + Tipo + ''' ');
end;

function DameTituloIEPNRClaveProducto(Codigo: string): string;
begin
  Result := '';
  Codigo := Copy(Trim(Codigo), 1, 1);
  if (Codigo >= ' ') then
     Result := DameDato('SELECT TITULO FROM SYS_IEPNR_CLAVE_PRODUCTO WHERE CODIGO = ''' + Codigo + ''' ');
end;

function DameTituloTipoCuenta(Codigo: integer): string;
begin
  Result := '';
  Result := DameDato('SELECT DESCRIPCION FROM SYS_TIPO_CUENTA_BANCO WHERE CODIGO = ' + IntToStr(Codigo));
end;

function DameTipoIva(PorcentajeIva: double; Pais: string = ''): integer;
begin
  Pais := Copy(Trim(Pais), 1, 3);
  if (Pais = '') then
     Pais := REntorno.Pais;
  Result := DameDatoI('SELECT FIRST 1 TIPO FROM SYS_TIPO_IVA WHERE PAIS = ''' + Pais + ''' AND P_IVA = ' + FloatToStringFB(PorcentajeIva));
end;

function DameTipoIVAArticulo(Articulo: string; Empresa: integer = 0; Ejercicio: integer = 0; Canal: integer = 0): integer;
begin
  Result := 0;
  if (Trim(Articulo) > '') then
  begin
     if (Empresa = 0) then
        Empresa := REntorno.Empresa;
     if (Ejercicio = 0) then
        Ejercicio := REntorno.Ejercicio;
     if (Canal = 0) then
        Canal := REntorno.Canal;

     Result := DameDatoI('SELECT TIPO_IVA FROM CON_CUENTAS_GES_ART WHERE EMPRESA = ' + IntToStr(Empresa) + ' AND EJERCICIO = ' + IntToStr(Ejercicio) + ' AND CANAL = ' + IntToStr(Canal) + ' AND ARTICULO = ''' + Articulo + ''' ');
  end;
end;

function DameTipoIVAArticulo(Id_c_a: integer): integer;
begin
  Result := 0;
  if (Id_c_a > 0) then
     Result := DameDatoI('SELECT TIPO_IVA FROM CON_CUENTAS_GES_ART WHERE ID_C_A = ' + IntToStr(Id_c_a));
end;

function DameTipoIVACanal: integer;
begin
  Result := DameDatoI('SELECT TIPO_IVA FROM EMP_CANALES WHERE EMPRESA = ' + IntToStr(REntorno.Empresa) + ' AND EJERCICIO = ' + IntToStr(REntorno.Ejercicio) + ' AND CANAL = ' + IntToStr(REntorno.Canal));
end;

function DameTituloTipoArticulo(TipoArticulo: string): string;
begin
  Result := '';
  if (Trim(TipoArticulo) > '') then
  begin
     Result := DameDato('SELECT TITULO FROM SYS_TIPO_ARTICULO WHERE TIPO = ''' + TipoArticulo + ''' ');
  end;
end;

function DameTituloIdiomaArticulo(id_a: integer; Idioma: string = ''): string;
var
  Resultado : string;
begin
  Resultado := '';
  if (Idioma = '') then
     Idioma := REntorno.IdiomaCanal;
  if (id_a > 0) then
  begin
     Resultado := DameDato('SELECT TITULO FROM ART_ARTICULOS_IDIOMAS WHERE ID_A = ' + IntToStr(id_a) + ' AND IDIOMA = ''' + Copy(Idioma, 1, 3) + '''');
  end;
  if (Resultado = '') then
     Resultado := DameTituloArticulo(id_a);
  Result := Resultado;
end;

function DameTituloFamilia(Familia: string): string;
begin
  Result := '';
  if (Trim(Familia) > '') then
  begin
     Result := DameDato('SELECT TITULO FROM ART_FAMILIAS WHERE EMPRESA = ' + IntToStr(REntorno.Empresa) + ' AND FAMILIA = ''' + Familia + '''');
  end;
end;

function DameTituloSubFamilia(SubFamilia, Familia: string): string;
begin
  Result := '';
  if (Trim(SubFamilia) > '') then
  begin
     Result := DameDato('SELECT TITULO FROM ART_SUBFAMILIAS WHERE SUBFAMILIA = ''' + SubFamilia + ''' AND ID_FAMILIA = (SELECT ID_FAMILIA FROM ART_FAMILIAS WHERE EMPRESA = ' + IntToStr(REntorno.Empresa) + ' AND FAMILIA = ''' + Familia + ''')');
  end;
end;

function DameTituloCuenta(Cuenta: string; Ejercicio: integer = 0): string;
begin
  Result := '';
  Cuenta := Copy(Trim(Cuenta), 1, 15);
  if (Cuenta > '') then
  begin
     if (Ejercicio = 0) then
        Ejercicio := REntorno.Ejercicio;
     Result := DameDato('SELECT TITULO FROM CON_CUENTAS WHERE EMPRESA = ' + IntToStr(REntorno.Empresa) + ' AND EJERCICIO = ' + IntToStr(Ejercicio) + ' AND CANAL = ' + IntToStr(REntorno.Canal) + ' AND CUENTA = ''' + Cuenta + '''');
  end;
end;

function DameTituloGrupoCuentas(GrupoCuentas: integer): string;
begin
  Result := '';
  if (GrupoCuentas > 0) then
  begin
     Result := DameDato('SELECT TITULO FROM CON_CUENTAS_GRUPO_CUENTAS WHERE EMPRESA = ' + IntToStr(REntorno.Empresa) + ' AND EJERCICIO = ' + IntToStr(REntorno.Ejercicio) + ' AND CANAL = ' + IntToStr(REntorno.Canal) + ' AND GRUPO_CUENTAS = ' + IntToStr(GrupoCuentas) + ' AND PGC = ' + IntToStr(REntorno.PGC));
  end;
end;

function DameTituloAlmacen(Almacen: string; Empresa: integer = 0): string;
begin
  Result := '';
  Almacen := Copy(Trim(Almacen), 1, 3);
  if (Trim(Almacen) > '') then
  begin
     if (Empresa = 0) then
        Empresa := REntorno.Empresa;
     Result := DameDato('SELECT TITULO FROM ART_ALMACENES WHERE EMPRESA = ' + IntToStr(Empresa) + ' AND ALMACEN = ''' + Almacen + '''');
  end;
end;

function DameTituloProveedor(Proveedor: integer; Empresa: integer = 0; Ejercicio: integer = 0; Canal: integer = 0): string;
begin
  Result := '';
  if (Proveedor <> 0) then
  begin
     if (Empresa = 0) then
        Empresa := REntorno.Empresa;
     if (Ejercicio = 0) then
        Ejercicio := REntorno.Ejercicio;
     if (Canal = 0) then
        Canal := REntorno.Canal;
     Result := DameDato('SELECT TITULO FROM VER_PROVEEDORES WHERE EMPRESA = ' + IntToStr(Empresa) + ' AND EJERCICIO = ' + IntToStr(Ejercicio) + ' AND CANAL = ' + IntToStr(Canal) + ' AND PROVEEDOR = ' + IntToStr(Proveedor));
  end;
end;

function DameTituloAcreedor(Acreedor: integer; Empresa: integer = 0; Ejercicio: integer = 0; Canal: integer = 0): string;
begin
  Result := '';
  if (Acreedor <> 0) then
  begin
     if (Empresa = 0) then
        Empresa := REntorno.Empresa;
     if (Ejercicio = 0) then
        Ejercicio := REntorno.Ejercicio;
     if (Canal = 0) then
        Canal := REntorno.Canal;
     Result := DameDato('SELECT TITULO FROM VER_ACREEDORES WHERE EMPRESA = ' + IntToStr(Empresa) + ' AND EJERCICIO = ' + IntToStr(Ejercicio) + ' AND CANAL = ' + IntToStr(Canal) + ' AND ACREEDOR = ' + IntToStr(Acreedor));
  end;
end;

function DameTituloCliente(Cliente: integer; Empresa: integer = 0; Ejercicio: integer = 0; Canal: integer = 0): string;
begin
  Result := '';
  if (Cliente <> 0) then
  begin
     if (Empresa = 0) then
        Empresa := REntorno.Empresa;
     if (Ejercicio = 0) then
        Ejercicio := REntorno.Ejercicio;
     if (Canal = 0) then
        Canal := REntorno.Canal;
     Result := DameDato('SELECT NOMBRE_R_SOCIAL FROM CON_CUENTAS_GES_CLI WHERE EMPRESA = ' + IntToStr(Empresa) + ' AND EJERCICIO = ' + IntToStr(Ejercicio) + ' AND CANAL = ' + IntToStr(Canal) + ' AND CLIENTE = ' + IntToStr(Cliente));
  end;
end;

function DameTituloClientePotencial(Cliente: integer): string;
begin
  Result := '';
  if (Cliente <> 0) then
  begin
     Result := DameDato('SELECT TITULO FROM VER_CLIENTES_POTENCIALES WHERE EMPRESA = ' + IntToStr(REntorno.Empresa) + ' AND CLIENTE = ' + IntToStr(Cliente));
  end;
end;

function DameTituloBalance(Balance: integer; Pais: string): string;
begin
  Result := '';

  if (Balance <> 0) then
  begin
     if (Pais = '') then
        Pais := REntorno.Pais;
     Result := DameDato('SELECT TITULO FROM SYS_BALANCES WHERE PAIS = ''' + Pais + ''' AND BALANCE = ' + IntToStr(Balance));
  end;
end;

function DameTituloAgente(Agente: integer; Empresa: integer = 0): string;
begin
  Result := '';
  if (Empresa = 0) then
     Empresa := REntorno.Empresa;
  if (Agente <> 0) then
  begin
     Result := DameDato('SELECT TITULO FROM VER_AGENTES WHERE EMPRESA = ' + IntToStr(Empresa) + ' AND AGENTE = ' + IntToStr(Agente));
  end;
end;

function DameTituloSerie(Serie: string): string;
begin
  Result := '';
  if (Trim(Serie) > '') then
  begin
     Result := DameDato('SELECT TITULO FROM GEN_SERIES WHERE EMPRESA = ' + REntorno.EmpresaStr + ' AND SERIE = ''' + Serie + ''' AND ACTIVO = 1');
  end;
end;

function DameTituloCampanya(Campanya: integer): string;
begin
  Result := '';
  if (Campanya >= 0) then
  begin
     Result := DameDato('SELECT TITULO FROM EMP_CAMPANYAS WHERE EMPRESA=' + REntorno.EmpresaStr + ' AND EJERCICIO=' + REntorno.EjercicioStr + ' AND CAMPANYA=' + IntToStr(Campanya));
  end;
end;

function DameTituloContacto(Tercero, Contacto: integer): string;
begin
  Result := '';
  if ((Tercero <> 0) and (Contacto <> 0)) then
  begin
     Result := DameDato('SELECT TRIM(NOMBRE) || '' '' || TRIM(APELLIDOS) FROM SYS_TERCEROS_CONTACTOS WHERE TERCERO = ' + IntToStr(Tercero) + ' AND CONTACTO = ' + IntToStr(Contacto));
  end;
end;

function DameTituloContactoCRM(ID: integer): string;
begin
  Result := '';
  if (ID <> 0) then
  begin
     Result := Trim(DameDato('SELECT NOMBRE_R_SOCIAL FROM CRM_CONTACTOS WHERE ID_CONTACTO = ' + IntToStr(ID)));
  end;
end;

function DameTituloAccionCRM(ID: integer): string;
begin
  Result := '';
  if (ID <> 0) then
  begin
     Result := Trim(DameDato('SELECT DESCRIPCION_ACCION FROM CRM_ACCIONES WHERE ID=' + IntToStr(ID)));
  end;
end;

function DameTituloTipoAccionCRM(Accion: string): string;
begin
  Result := '';
  if (Trim(Accion) <> '') then
  begin
     Result := DameDato('SELECT DESCRIPCION FROM CRM_SYS_ACCIONES WHERE ACCION = ''' + Accion + '''');
  end;
end;

function DameTituloTipoLinea(Tipo: integer): string;
begin
  Result := '';
  if (Tipo >= 0) then
  begin
     Result := DameDato('SELECT TITULO FROM SYS_TIPO_LINEA_VENTA_KRI WHERE ID = ' + IntToStr(Tipo));
  end;
end;

function DameTituloCanal(Canal: integer): string;
begin
  Result := '';
  if (Canal <> 0) then
  begin
     Result := DameDato('SELECT TITULO FROM GEN_CANALES WHERE EMPRESA = ' + IntToStr(REntorno.Empresa) + ' AND CANAL = ' + IntToStr(Canal));
  end;
end;

function DameTituloProyecto(Proyecto: integer): string;
begin
  Result := '';
  if (Proyecto <> 0) then
  begin
     Result := DameDato('SELECT TITULO FROM EMP_PROYECTOS WHERE EMPRESA = ' + IntToStr(REntorno.Empresa) + ' AND PROYECTO = ' + IntToStr(Proyecto));
  end;
end;

function DameTituloIdProyecto(IdProyecto: integer): string;
begin
  Result := '';
  if (IdProyecto <> 0) then
  begin
     Result := DameDato('SELECT TITULO FROM EMP_PROYECTOS WHERE ID_P = ' + IntToStr(IdProyecto));
  end;
end;

function DameTituloImagen(Codigo: integer): string;
begin
  Result := '';
  if (Codigo <> 0) then
  begin
     Result := DameDato('SELECT NOMBRE FROM SYS_IMAGENES WHERE CODIGO = ' + IntToStr(Codigo));
  end
  else
  begin
     Result := _('Sin imagen');
  end;
end;

function DameTituloGaleria(Id: integer): string;
begin
  Result := '';
  if (Id <> 0) then
  begin
     Result := DameDato('SELECT TITULO FROM SYS_GALERIA WHERE ID = ' + IntToStr(Id));
  end;
end;

function DameTituloArticuloProveedor(Proveedor: integer; Articulo: string): string;
begin
  Result := '';
  if ((Trim(Articulo) > '') and (Proveedor <> 0)) then
  begin
     Result := DameDato('SELECT TITULO_ART FROM ART_ARTICULOS_CODPROV WHERE EMPRESA = ' + REntorno.EmpresaStr + ' AND ARTICULO = ''' + Articulo + ''' AND PROVEEDOR = ' + IntToStr(Proveedor));
  end;
end;

function DameTituloTercero(Tercero: integer): string;
begin
  Result := '';
  if (Tercero <> 0) then
  begin
     Result := DameDato('SELECT NOMBRE_R_SOCIAL FROM SYS_TERCEROS WHERE TERCERO = ' + IntToStr(Tercero));
  end;
end;

function DameTituloEmpresa(Empresa: integer): string;
begin
  Result := '';
  if (Empresa > 0) then
  begin
     Result := DameDato('SELECT TITULO FROM VER_EMPRESAS_EJERCICIOS WHERE EMPRESA = ' + IntToStr(Empresa) + ' AND EJERCICIO=' + REntorno.EjercicioStr);
  end;
end;

function DameTituloUsuario(Usuario: integer): string;
begin
  Result := '';
  if (Usuario <> 0) then
  begin
     Result := DameDato('SELECT NOMBRE FROM SYS_USUARIOS WHERE USUARIO = ' + IntToStr(Usuario));
  end;
end;

function DameTituloPerfilUsuario(Perfil: integer): string;
begin
  Result := '';
  if (Perfil <> 0) then
  begin
     Result := DameDato('SELECT TITULO FROM SYS_USUARIOS_PERFIL WHERE PERFIL = ' + IntToStr(Perfil));
  end;
end;

function DameTituloTipoCRM(tipo: string): string;
begin
  Result := '';
  if (tipo > '') then
  begin
     Result := DameDato('SELECT TITULO FROM SYS_TIPO_CRM WHERE TIPO = ''' + tipo + '''');
  end;
end;

function DameTituloEntidad(Pais, Entidad: string): string;
begin
  Result := '';
  Entidad := Copy(Trim(Entidad), 1, 4);
  if (Entidad > '') then
  begin
     Result := DameDato('SELECT TITULO FROM SYS_BANCOS WHERE PAIS = ''' + Pais + ''' AND ENTIDAD = ''' + Entidad + '''');
  end;
end;

function DameTituloBanco(Banco: integer): string;
begin
  Result := '';
  if (Banco > 0) then
  begin
     Result := DameDato('SELECT TITULO FROM EMP_BANCOS WHERE EMPRESA = ' + REntorno.EmpresaStr + ' AND BANCO = ' + IntToStr(Banco));
  end;
end;

function DameTituloListado(Listado: integer): string;
begin
  Result := '';
  if (Listado > 0) then
  begin
     Result := DameDato('SELECT TITULO FROM DIC_LISTADOS WHERE LISTADO=' + IntToStr(Listado));
  end;
end;

function DameTituloListadoDefectoGrupo(Grupo: integer): string;
begin
  Result := '';
  if (Grupo > 0) then
  begin
     Result := DameTituloListado(StrToIntDef(DameDato('SELECT LISTADODEF FROM DIC_LISTADOS_GRUPOS WHERE GRUPO=' + IntToStr(Grupo)), 0));
  end;
end;

function DameTituloModeloHacienda(Modelo: string): string;
begin
  Result := '';
  Modelo := Copy(Trim(Modelo), 1, 15);
  if (Modelo > '') then
     Result := DameDato('SELECT TITULO FROM SYS_MODELOS_HACIENDA WHERE MODELO = ''' + Modelo + ''' AND PAIS = ''' + REntorno.Pais + '''');
end;

function DameTituloTipoIncidencia(tipo: string): string;
begin
  Result := '';

  if (tipo > '') then
  begin
     Result := DameDato('SELECT TITULO FROM SYS_TIPO_INCIDENCIA_KRI WHERE TIPO = ''' + tipo + '''');
  end;
end;

function DameTituloTipoIncidenciaMaq(tipo: string): string;
begin
  Result := '';
  if (tipo > '') then
  begin
     Result := DameDato('SELECT DESCRIPCION FROM SYS_TIPO_INCIDENCIAS_MAQ WHERE TIPO = ''' + tipo + '''');
  end;
end;

function DameTituloZona(Zona: string): string;
begin
  Result := '';
  if (Trim(Zona) > '') then
  begin
     Result := DameDato('SELECT TITULO FROM SYS_ZONAS WHERE ZONA=''' + Zona + '''');
  end;
end;

function DameTituloEfecto(Tipo: string): string;
begin
  Result := '';
  Result := DameDato('SELECT TITULO FROM SYS_TIPO_EFECTO WHERE TIPO = ''' + Copy(Tipo, 1, 3) + '''');
end;

function DameTituloAgrupacion(Tipo, Agrupacion: string): string;
begin
  Result := '';
  Agrupacion := Trim(Agrupacion);
  if ((Agrupacion > '') and (Length(Agrupacion) <= 3)) then
  begin
     Result := DameDato('SELECT TITULO FROM SYS_AGRUPACIONES WHERE AGRUPACION = ''' + Agrupacion + ''' AND TIPO = ''' + Tipo + '''');
  end;
end;

function DameTituloProtocolo(Protocolo: string): string;
begin
  Result := '';
  if (Protocolo > '') then
  begin
     Result := DameDato('SELECT TITULO FROM SYS_PROTOCOLO WHERE PROTOCOLO = ''' + Protocolo + '''');
  end;
end;

function DameTituloDepartamento(Departamento: string): string;
begin
  Result := '';
  if (Departamento > '') then
  begin
     Result := DameDato('SELECT TITULO FROM SYS_DEPARTAMENTOS WHERE DEPARTAMENTO = ''' + Departamento + '''');
  end;
end;

function DameTituloPais(Pais: string): string;
begin
  Result := '';
  if (Trim(Pais) > '') then
  begin
     Result := DameDato('SELECT TITULO FROM SYS_PAISES WHERE PAIS = ''' + Pais + '''');
  end;
end;

function DameTituloProvincia(Pais, Provincia: string): string;
begin
  Result := '';
  if (Trim(Provincia) > '') then
  begin
     Result := DameDato('SELECT TITULO FROM SYS_PROVINCIAS WHERE PAIS = ''' + Pais + ''' AND PROVINCIA = ''' + Provincia + '''');
  end;
end;

function DameTituloUbicacion(id_ubicacion: integer): string;
begin
  Result := '';
  if (id_ubicacion > 0) then
  begin
     Result := DameDato('SELECT TITULO FROM ART_ALMACENES_UBICACIONES WHERE ID_UBICACION=' + IntToStr(id_ubicacion));
  end;
end;

function DameTituloCodigoIncoterm(Codigo: string): string;
begin
  Result := '';
  if (Trim(Codigo) > '') then
  begin
     Result := DameDato('SELECT TITULO FROM SYS_CODIGO_INCOTERM WHERE CODIGO=''' + Codigo + '''');
  end;
end;

function DameTituloGrupoIncoterm(Grupo: string): string;
begin
  Result := '';
  if (Length(Grupo) = 1) then
  begin
     Result := DameDato('SELECT TITULO FROM SYS_GRUPO_INCOTERM WHERE GRUPO=''' + Grupo + '''');
  end;
end;

function DameTituloCentroCoste(Digito: integer; Letra: string): string;
begin
  Result := DameDato('SELECT TITULO FROM CON_CENTROS_COSTE WHERE EMPRESA=' + IntToStr(REntorno.Empresa) + ' AND EJERCICIO=' + IntToStr(REntorno.Ejercicio) + ' AND CANAL=' + IntToStr(REntorno.Canal) + ' AND NUM_DIGITO=' + IntToStr(Digito) + ' AND LET_DIGITO=''' + Letra + '''');
end;

function DameTituloFase(TipoFase: string): string;
begin
  Result := '';
  if (Trim(TipoFase) > '') then
  begin
     Result := DameDato('SELECT TITULO FROM PRO_SYS_FASES WHERE FASE = ''' + Copy(TipoFase, 1, 3) + '''');
  end;
end;

function DameTituloTarea(TipoTarea: string): string;
begin
  Result := '';
  if (Trim(TipoTarea) > '') then
  begin
     Result := DameDato('SELECT TITULO FROM PRO_SYS_TAREAS WHERE TAREA = ''' + TipoTarea + ''' AND EMPRESA = ' + REntorno.EmpresaStr);
  end;
end;

function DameTituloTurno(Turno: string): string;
begin
  Result := '';

  if (Trim(Turno) > '') then
  begin
     Result := DameDato('SELECT DESCRIPCION FROM PRO_TURNOS WHERE EMPRESA = ' + REntorno.EmpresaStr + ' AND TURNO = ''' + Turno + '''');
  end;
end;

function DameTituloRecurso(Recurso: string): string;
begin
  Result := '';
  if (Trim(Recurso) > '') then
  begin
     Result := DameDato('SELECT TITULO FROM PRO_RECURSOS WHERE RECURSO = ''' + Recurso + ''' AND EMPRESA = ' + REntorno.EmpresaStr);
  end;
end;

function DameTituloFormula(IdFormula: integer): string;
begin
  Result := '';
  if (IdFormula <> 0) then
  begin
     Result := DameDato('SELECT NOMBRE FROM PRO_FORMULAS WHERE ID_FORMULA = ' + IntToStr(IdFormula));
  end;
end;

function DameTituloModoIVA(Modo: integer): string;
begin
  Result := DameDato('SELECT TITULO FROM SYS_MODO_IVA WHERE MODO = ' + IntToStr(Modo));
end;

function DameTituloNormativa(Normativa: string): string;
var
  TextoLey, TextoFecha : string;
begin
  Result := '';
  if (Trim(Normativa) > '') then
  begin
     TextoLey := DameDato('SELECT LEY || '' ('' || FECHA_VIGOR || '')'' FROM ISO_NORMATIVAS WHERE CODIGO = ''' + Normativa + '''');
     // TextoFecha := DameDato('SELECT FECHA_VIGOR FROM ISO_NORMATIVAS WHERE CODIGO = ''' + Normativa + '''');
     if (TextoLey > '') then
        Result := TextoLey + ' (' + TextoFecha + ')';
  end;
end;

function DameTituloTipoEnsayo(Ensayo: string): string;
begin
  Result := '';
  if (Trim(Ensayo) > '') then
  begin
     Result := DameDato('SELECT DESCRIPCION FROM ISO_TIPO_ENSAYO WHERE CODIGO = ''' + Ensayo + '''');
  end;
end;

function DameTituloEmpleado(Empleado: integer): string;
begin
  Result := '';
  if (Empleado <> 0) then
  begin
     Result := DameDato('SELECT TITULO FROM VER_EMPLEADOS_EF WHERE EMPRESA = ' + IntToStr(REntorno.Empresa) + ' AND EMPLEADO = ' + IntToStr(Empleado));
  end;
end;

function DameTituloIdEmpleado(Id: integer): string;
begin
  Result := DameDato('SELECT TITULO FROM VER_EMPLEADOS_EF WHERE ID_EMPLEADO = ' + IntToStr(Id));
end;

function DameTituloMoneda(Moneda: string): string;
begin
  Result := '';
  Moneda := Copy(Trim(Moneda), 1, 3);
  if (Moneda > '') then
  begin
     Result := DameDato('SELECT TITULO FROM SYS_MONEDAS WHERE MONEDA = ''' + Moneda + '''');
  end;
end;

function DameTituloFormaPago(FormaPago: string; Idioma: string = ''): string;
var
  UtilizarIdioma : boolean;
begin
  Result := '';
  UtilizarIdioma := ((Idioma <> '') and (Idioma <> REntorno.IdiomaCanal));
  if (Trim(FormaPago) > '') then
  begin
     if UtilizarIdioma then
     begin
        Result := DameDato('SELECT TITULO FROM SYS_FORMAS_PAGO_IDIOMAS ' + 'WHERE FORMA_PAGO = ''' + FormaPago + ''' AND IDIOMA = ''' + Idioma + '''');
     end;
     if (Result = '') then
     begin
        Result := DameDato('SELECT TITULO FROM CON_CUENTAS_GES_FP ' + 'WHERE EMPRESA = ' + IntToStr(REntorno.Empresa) + ' AND EJERCICIO = ' + IntToStr(REntorno.Ejercicio) + ' AND CANAL = ' + IntToStr(REntorno.Canal) + ' AND FORMA_PAGO = ''' + FormaPago + '''');
     end;
  end;
end;

function DameTituloLargoFormaPago(FormaPago: string; Idioma: string = ''): string;
var
  UtilizarIdioma : boolean;
begin
  Result := '';
  UtilizarIdioma := ((Idioma <> '') and (Idioma <> REntorno.IdiomaCanal));
  if (Trim(FormaPago) > '') then
  begin
     if UtilizarIdioma then
     begin
        Result := DameDato('SELECT TITULO_LARGO FROM SYS_FORMAS_PAGO_IDIOMAS ' + 'WHERE FORMA_PAGO = ''' + FormaPago + ''' AND IDIOMA = ''' + Idioma + '''');
     end;
     if (Result = '') then
     begin
        Result := DameDato('SELECT TITULO_LARGO FROM CON_CUENTAS_GES_FP ' + 'WHERE EMPRESA = ' + IntToStr(REntorno.Empresa) + ' AND EJERCICIO = ' + IntToStr(REntorno.Ejercicio) + ' AND CANAL = ' + IntToStr(REntorno.Canal) + ' AND FORMA_PAGO = ''' + FormaPago + '''');
     end;
  end;
end;

function DameTituloMaquina(Maquina: integer): string;
begin
  Result := DameDato('SELECT DESCRIPCION FROM PRO_MAQUINAS_C WHERE EMPRESA = ' + IntToStr(REntorno.Empresa) + ' AND CODMAQ = ' + IntToStr(Maquina));
end;

function DameTituloCentroTrabajo(CentroTrabajo: string): string;
begin
  Result := DameDato('SELECT DESCRIPCION FROM OPE_CENT_TRABAJO WHERE EMPRESA = ' + IntToStr(REntorno.Empresa) + ' AND CENTRO = ''' + CentroTrabajo + '''');
end;

function DameTituloTarifa(Tarifa: string; Empresa: integer): string;
begin
  Result := '';
  if (Empresa = 0) then
     Empresa := REntorno.Empresa;
  Tarifa := Copy(Trim(Tarifa), 1, 3);
  if (Tarifa > '') then
  begin
     Result := DameDato('SELECT TITULO FROM ART_TARIFAS_C WHERE EMPRESA = ' + IntToStr(Empresa) + ' AND TARIFA = ''' + Tarifa + '''');
  end;
end;

function DameTituloCalculo(Calculo: integer): string;
begin
  Result := DameDato('SELECT TITULO FROM ART_TARIFAS_CALCULOS WHERE EMPRESA = ' + IntToStr(REntorno.Empresa) + ' AND CALCULO = ' + IntToStr(Calculo));
end;

function DameTituloSeccion(Seccion: string): string;
begin
  Result := '';
  if (Trim(Seccion) > '') then
  begin
     Result := DameDato('SELECT DESCRIPCION FROM OPE_SECCIONES WHERE EMPRESA = ' + IntToStr(REntorno.Empresa) + ' AND SECCION = ''' + Seccion + '''');
  end;
end;

function DameTituloCilindro(Cilindro: integer): string;
begin
  Result := DameDato('SELECT DESCRIPCION FROM EMP_CILINDROS WHERE EMPRESA = ' + IntToStr(REntorno.Empresa) + ' AND CILINDRO = ' + IntToStr(Cilindro));
end;

function DameTituloSituacionProduccion(Situacion: integer): string;
begin
  if (Situacion in [0..4]) then
     Result := DMMain.TituloSituacionProduccion[Situacion]
  else
     Result := '';
end;

function DameTituloIdioma(Idioma: string): string;
begin
  Result := '';
  if (Trim(Idioma) > '') then
  begin
     Result := DameDato('SELECT TITULO FROM SYS_IDIOMAS WHERE IDIOMA = ''' + Copy(Idioma, 1, 3) + '''');
  end;
end;

function DameTituloTipoUnidad(TipoUnidad: string): string;
begin
  Result := DMMain.TituloUnidadMedida.Values[TipoUnidad];
end;

function DameTituloUtillaje(Codigo: string): string;
begin
  Result := '';
  if (Codigo > '') then
  begin
     Result := DameDato('SELECT DESCRIPCION FROM PRO_SYS_UTILLAJES WHERE EMPRESA = ' + IntToStr(REntorno.Empresa) + ' AND CODIGO = ''' + Codigo + '''');
  end;
end;

function DameTituloPorte(Tipo: integer; Idioma: string): string;
var
  UtilizarIdioma : boolean;
  SqlText : string;
begin
  Result := '';
  if (Tipo >= 0) then
  begin
     UtilizarIdioma := (Idioma <> '') and (Idioma <> REntorno.IdiomaCanal);
     if UtilizarIdioma then
        SqlText := 'SELECT TITULO FROM CON_CUENTAS_GES_PORTES_IDIOMAS '
     else
        SqlText := 'SELECT TITULO FROM CON_CUENTAS_GES_PORTES ';
     SqlText := SqlText + 'WHERE EMPRESA = ' + IntToStr(REntorno.Empresa) + ' AND EJERCICIO = ' + IntToStr(REntorno.Ejercicio) + ' AND CANAL = ' + IntToStr(REntorno.Canal) + ' AND TIPO = ' + IntToStr(Tipo);
     if UtilizarIdioma then
        SqlText := SqlText + ' AND IDIOMA = ''' + Idioma + '''';
     Result := DameDato(SqlText);
     if (Result = '') and (Idioma <> '') then
        Result := DameTituloPorte(Tipo);
  end;
end;

function DameTituloEscandalloProduccion(Escandallo: integer; Tipo: string): string;
begin
  Result := DameDato('SELECT DESCRIPCION FROM PRO_ESCANDALLO WHERE EMPRESA = ' + IntToStr(REntorno.Empresa) + ' AND ESCANDALLO = ' + IntToStr(Escandallo) + ' AND TIPO = ''' + Tipo + '''');
end;

function DameTituloIdEscandalloProduccion(IdEsc: integer): string;
begin
  Result := DameDato('SELECT DESCRIPCION FROM PRO_ESCANDALLO WHERE ID_ESC = ' + IntToStr(IdEsc));
end;

function DameTituloDireccionTercero(Tercero, Direccion: integer): string;
begin
  {TODO : Funcion casi igual que DameDireccionTercero.
          TITULO = DIR_NOMBRE_2 || ' ' || DIR_COMPLETA
          Tratar de unificar.}
  Result := '';
  if ((Tercero <> 0) and (Direccion <> 0)) then
  begin
     Result := DameDato('SELECT TITULO FROM VER_DIRECCIONES WHERE TERCERO = ' + IntToStr(Tercero) + ' AND DIRECCION = ' + IntToStr(Direccion));
  end;
end;

function DameDireccionTercero(Tercero, Direccion: integer): string;
begin
  {TODO : Funcion casi igual que DameTituloDireccionTercero. Tratar de unificar}
  Result := '';
  if ((Tercero > 0) and (Direccion > 0)) then
  begin
     Result := DameDato('SELECT D.DIR_COMPLETA || '' - ('' || L.CODIGO_POSTAL || '') '' || P.TITULO ' + 'FROM SYS_TERCEROS_DIRECCIONES D ' + 'JOIN SYS_LOCALIDADES L ON D.DIR_LOCALIDAD = L.LOCALIDAD ' + 'JOIN SYS_PROVINCIAS P ON L.PAIS = P.PAIS AND L.PROVINCIA = P.PROVINCIA ' + 'WHERE D.TERCERO = ' + IntToStr(Tercero) + ' AND D.DIRECCION = ' + IntToStr(Direccion));
  end;
end;

function DameDireccionEDI(CodigoEDI: string): string;
begin
  {TODO : Despues de unificar DameTituloDireccionTercero y DameTituloDireccionTercero ver como debe quedar DameDireccionEDI.}
  Result := '';
  if (Trim(CodigoEDI) > '') then
  begin
     Result := DameDato('SELECT D.DIR_COMPLETA || '' - ('' || L.CODIGO_POSTAL || '') '' || P.TITULO ' + 'FROM SYS_TERCEROS_DIRECCIONES D ' + 'JOIN SYS_LOCALIDADES L ON D.DIR_LOCALIDAD = L.LOCALIDAD ' + 'JOIN SYS_PROVINCIAS P ON L.PAIS = P.PAIS AND L.PROVINCIA = P.PROVINCIA ' + 'WHERE D.CODIGO_EDI = ''' + CodigoEDI + '''');
  end;
end;

function DameTituloEstado(Estado: integer): string;
begin
  if (Estado in [0..6]) then
     Result := DMMain.TituloEstado[Estado]
  else
     Result := '';
end;

function DameTituloCalendario(Calendario: integer): string;
begin
  Result := DameDato('SELECT DESCRIPCION FROM OPE_CALENDARIO_C WHERE EMPRESA = ' + IntToStr(REntorno.Empresa) + ' AND CALENDARIO = ' + IntToStr(Calendario));
end;

function DameTituloGrupoTalla(IdGrupoTalla: integer): string;
begin
  Result := DameDato('SELECT TITULO FROM ART_GRUPOS_TALLAS WHERE ID_G_T = ' + IntToStr(IdGrupoTalla));
end;

function DameTituloMarca(IdMarca: integer): string;
begin
  Result := DameDato('SELECT TITULO FROM SYS_MARCA WHERE ID_MARCA = ' + IntToStr(IdMarca));
end;

function DameTituloMarcaModelo(IdMarca: integer): string;
begin
  Result := DameDato('SELECT TITULO FROM ART_ARTICULOS_MOD_MARCAS WHERE ID_MARCA = ' + IntToStr(IdMarca));
end;

function DameTituloMarcaModelo(Marca: string): string;
begin
  Result := DameDato('SELECT TITULO FROM ART_ARTICULOS_MOD_MARCAS WHERE EMPRESA = ' + IntToStr(REntorno.Empresa) + ' AND MARCA = ''' + Marca + '''');
end;

function DameTituloModelo(IdModelo: integer): string;
begin
  Result := DameDato('SELECT TITULO FROM SYS_MODELO WHERE ID_MODELO = ' + IntToStr(IdModelo));
end;

function DameTituloClaseDireccion(Clase: integer): string;
begin
  Result := DameDato('SELECT TITULO FROM SYS_CLASE_DIRECCION WHERE CLASE = ' + IntToStr(Clase));
end;

function DameTituloPeriodo(Periodo: string): string;
begin
  Result := DameDato('SELECT TITULO FROM SYS_PERIODOS WHERE PERIODO = ''' + Copy(Periodo, 1, 2) + '''');
end;

function DameTituloNIF(NIF: string): string;
begin
  Result := '';
  if (NIF <> '') then
  begin
     Result := DameDato('SELECT FIRST 1 NOMBRE_R_SOCIAL FROM SYS_TERCEROS WHERE NIF = ''' + NIF + ''' ORDER BY TERCERO');
  end;
end;

function DameTituloIBAE(Tipo: integer; Pais: string): string;
begin
  if (Pais = '') then
     Pais := REntorno.Pais;
  Result := DameDato('SELECT TITULO FROM SYS_TIPO_IBAE WHERE PAIS = ''' + Pais + ''' AND TIPO = ' + IntToStr(Tipo));
end;

function DameTituloUbicacionSimple(IdUbicacionSimple: integer): string;
begin
  Result := DameDato('SELECT TITULO FROM EMP_UBICACION_SIMPLE WHERE ID_UBICACION_SIMPLE = ' + IntToStr(IdUbicacionSimple));
end;

function DameTituloBancoTercero(Tercero, Banco: integer): string;
begin
  Result := '';
  if ((Tercero <> 0) and (Banco <> 0)) then
  begin
     Result := DameDato('SELECT TITULO FROM SYS_TERCEROS_BANCOS WHERE TERCERO = ' + IntToStr(Tercero) + ' AND BANCO = ' + IntToStr(Banco));
  end;
end;

function DameTituloTipoVenta(Tipo: integer): string;
begin
  Result := DameDato('SELECT TITULO FROM SYS_TIPO_COMPRA_VENTA WHERE TIPO = ' + IntToStr(Tipo));
end;

function DameTituloCodigoGiro(Codigo: integer): string;
begin
  Result := DameDato('SELECT TITULO FROM SYS_TIPO_GIRO WHERE CODIGO = ' + IntToStr(Codigo));
end;

function DameTituloComuna(ID_Comuna: integer): string;
begin
  Result := '';
  if (ID_Comuna > 0) then
  begin
     Result := DameDato('SELECT FIRST 1 TITULO FROM SYS_COMUNAS WHERE ID_COMUNA = ' + IntToStr(ID_Comuna));
  end;
end;

function DameTituloRegion(Pais, Region: string): string;
begin
  Result := DameDato('SELECT FIRST 1 TITULO FROM SYS_REGIONES WHERE PAIS = ''' + Pais + ''' AND REGION = ''' + Region + '''');
end;

function DameTituloCodigoPostal(Pais, CodigoPostal: string): string;
begin
  Result := DameDato('SELECT FIRST 1 TITULO || '' '' || CODIGO_POSTAL AS TITULO FROM SYS_CODIGOS_POSTALES ' + 'WHERE PAIS = ''' + Pais + ''' AND CODIGO_POSTAL = ''' + CodigoPostal + '''');
end;

function DameTituloTipoDocIdentidad(Pais, TipoDocIdent: string): string;
begin
  Result := '';
  if ((Pais > '') and (TipoDocIdent > '')) then
  begin
     Result := DameDato('SELECT TITULO FROM SYS_TIPO_DOC_IDENT_PAIS WHERE PAIS = ''' + Pais + ''' AND TIPO_DOC_IDENT = ''' + TipoDocIdent + '''');
  end;
end;

function DameTituloPoblacion(Pais, Poblacion: string): string;
begin
  Result := '';
  if ((Pais > '') and (Poblacion > '')) then
  begin
     Result := DameDato('SELECT TITULO FROM SYS_POBLACION WHERE PAIS = ''' + Pais + ''' AND POBLACION = ''' + Poblacion + '''');
  end;
end;

function DameTituloTipoDocTributario(Codigo: string): string;
begin
  Result := DameDato('SELECT TITULO FROM SII_TIPO_DOCUMENTO_TRIBUTARIO WHERE CODIGO = ''' + Codigo + '''');
end;

function DameTituloParametrosFE(Codigo: integer; Parametro: string): string;
begin
  Result := DameDato('SELECT TITULO FROM SII_PARAMETROS_FACTURA_ELEC WHERE CODIGO = ' + IntToStr(Codigo) + ' AND PARAMETRO = ''' + Parametro + '''');
end;

function DameTituloCategoria(Codigo: string): string;
begin
  Result := DameDato('SELECT TITULO FROM SYS_CATEGORIA_CLIENTE WHERE CODIGO = ''' + Codigo + '''');
end;

function DameTituloImpuestoAdicional(Tipo: integer; Pais: string): string;
begin
  if (Pais = '') then
     Pais := REntorno.Pais;
  Result := DameDato('SELECT TITULO FROM SYS_TIPO_IMPUESTO_ADICIONAL WHERE PAIS = ''' + Pais + ''' AND TIPO = ' + IntToStr(Tipo));
end;

function DameTituloArtModGenero(Codigo: string): string;
begin
  Result := DameDato('SELECT TITULO FROM ART_ARTICULOS_MOD_GENERO WHERE CODIGO = ''' + Codigo + '''');
end;

function DameTituloArtModTemporada(Codigo: string): string;
begin
  Result := DameDato('SELECT TITULO FROM ART_ARTICULOS_MOD_TEMPORADA WHERE CODIGO = ''' + Codigo + '''');
end;

function DameTituloGiroEmpresa(Empresa: integer): string;
begin
  Result := DameDato('SELECT FIRST 1 TITULO FROM VER_SYS_EMPRESAS_GIROS_EF WHERE EMPRESA = ' + IntToStr(Empresa) + ' ORDER BY DEFECTO DESC, CODIGO_GIRO');
end;

function DameTituloPerfilCliente(Perfil: string): string;
begin
  Result := DameDato('SELECT TITULO FROM SYS_PERFILES WHERE PERFIL = ''' + Perfil + '''');
end;

function DameTituloNCF(Tipo: integer): string;
begin
  Result := DameDato('SELECT TITULO FROM Z_SYS_TIPO_NCF WHERE TIPO_NCF = ' + IntToStr(Tipo));
end;

function DameTituloFichaTecnica(IdFichaTecnica: integer): string;
begin
  Result := '';

  if (IdFichaTecnica <> 0) then
  begin
     Result := DameDato('SELECT TRIM(COALESCE(R.MATRICULA, '''')) || ' + 'CASE WHEN COALESCE(TRIM(R.BASTIDOR), '''') <> '''' THEN '' ('' || TRIM(R.BASTIDOR) || '')'' ELSE '''' END || ' + ''' - '' || TRIM(COALESCE(R.TITULO, '''')) ' + 'FROM REP_FICHA_TECNICA R ' + 'JOIN SYS_MARCA M ON M.ID_MARCA = R.ID_MARCA ' + 'WHERE R.ID_FICHA_TECNICA = ' + IntToStr(IdFichaTecnica)
        );
  end;
end;

function DameTituloEstrategiaCompra(Estrategia: integer): string;
begin
  Result := '';
  if (Estrategia > 0) then
  begin
     Result := DameDato('SELECT TITULO FROM SYS_ESTRATEGIA_COMPRA WHERE ESTRATEGIA = ' + IntToStr(Estrategia));
  end;
end;

function DameLote(IdLote: integer): string;
begin
  Result := '';
  if (IdLote > 0) then
  begin
     Result := DameDato('SELECT LOTE FROM ART_ARTICULOS_LOTES WHERE ID_LOTE = ' + IntToStr(IdLote));
  end;
end;

function DameClasificacionLote(IdLote: integer): string;
begin
  Result := '';
  if (IdLote <> 0) then
  begin
     Result := DameDato('SELECT CLASIFICACION FROM ART_ARTICULOS_LOTES WHERE ID_LOTE = ' + IntToStr(IdLote));
  end;
end;

function DamePais(PaisC2: string): string;
begin
  Result := '';
  if (Trim(PaisC2) > '') then
  begin
     Result := DameDato('SELECT PAIS FROM SYS_PAISES WHERE PAIS_C2 = ''' + PaisC2 + '''');
  end;
end;

function DamePaisC2(Pais: string): string;
begin
  Result := '';
  if (Trim(Pais) > '') then
  begin
     Result := DameDato('SELECT PAIS_C2 FROM SYS_PAISES WHERE PAIS = ''' + Pais + '''');
  end;
end;

function Notas(Tipo: string; CliPro: integer): boolean;
begin
  Result := False;
  if Tipo = 'CLI' then
     Result := Trim(DameDato('SELECT NOTAS FROM EMP_CLIENTES WHERE EMPRESA = ' + IntToStr(REntorno.Empresa) + ' AND CLIENTE = ' + IntToStr(CliPro))) > ''
  else if Tipo = 'PRO' then
     Result := Trim(DameDato('SELECT NOTAS FROM EMP_PROVEEDORES WHERE EMPRESA = ' + IntToStr(REntorno.Empresa) + ' AND PROVEEDOR = ' + IntToStr(CliPro))) > ''
  else if Tipo = 'ACR' then
     Result := Trim(DameDato('SELECT NOTAS FROM EMP_ACREEDORES WHERE EMPRESA = ' + IntToStr(REntorno.Empresa) + ' AND ACREEDOR = ' + IntToStr(CliPro))) > '';
end;

function DameNombreComercialProveedor(Proveedor: integer; Empresa: integer; Ejercicio: integer; Canal: integer): string;
begin
  Result := '';
  if (Proveedor <> 0) then
  begin
     if (Empresa = 0) then
        Empresa := REntorno.Empresa;
     if (Ejercicio = 0) then
        Ejercicio := REntorno.Ejercicio;
     if (Canal = 0) then
        Canal := REntorno.Canal;
     Result := DameDato('SELECT NOMBRE_COMERCIAL FROM VER_PROVEEDORES ' + 'WHERE EMPRESA = ' + IntToStr(Empresa) + ' AND EJERCICIO = ' + IntToStr(Ejercicio) + ' AND CANAL = ' + IntToStr(Canal) + ' AND PROVEEDOR = ' + IntToStr(Proveedor));
  end;
end;

function DameNombreComercialCliente(Cliente: integer; Empresa: integer; Ejercicio: integer; Canal: integer): string;
begin
  Result := '';
  if (Cliente <> 0) then
  begin
     if (Empresa = 0) then
        Empresa := REntorno.Empresa;
     if (Ejercicio = 0) then
        Ejercicio := REntorno.Ejercicio;
     if (Canal = 0) then
        Canal := REntorno.Canal;
     Result := DameDato('SELECT NOMBRE_COMERCIAL FROM CON_CUENTAS_GES_CLI ' + 'WHERE EMPRESA = ' + IntToStr(Empresa) + ' AND EJERCICIO = ' + IntToStr(Ejercicio) + ' AND CANAL = ' + IntToStr(Canal) + ' AND CLIENTE = ' + IntToStr(Cliente));
  end;
end;

function DameEAN8Articulo(Articulo: string): string;
begin
  Result := '';
  if (Trim(Articulo) > '') then
  begin
     Result := DameDato('SELECT BARRAS FROM ART_ARTICULOS_BARRAS WHERE EMPRESA = ' + REntorno.EmpresaStr + ' AND ARTICULO = ''' + Articulo + ''' AND TIPO = 2');
  end;
end;

function DameEAN13Articulo(Articulo: string): string;
begin
  Result := '';
  if (Trim(Articulo) > '') then
  begin
     Result := DameDato('SELECT BARRAS FROM ART_ARTICULOS_BARRAS WHERE EMPRESA = ' + REntorno.EmpresaStr + ' AND ARTICULO = ''' + Articulo + ''' AND TIPO = 3');
  end;
end;

function DameDUN14Articulo(Articulo: string): string;
begin
  Result := '';
  if (Trim(Articulo) > '') then
  begin
     Result := DameDato('SELECT BARRAS FROM ART_ARTICULOS_BARRAS WHERE EMPRESA = ' + REntorno.EmpresaStr + ' AND ARTICULO = ''' + Articulo + ''' AND TIPO = 6');
  end;
end;

function DameUPCArticulo(Articulo: string): string;
begin
  Result := '';
  if (Trim(Articulo) > '') then
  begin
     Result := DameDato('SELECT BARRAS FROM ART_ARTICULOS_BARRAS WHERE EMPRESA = ' + REntorno.EmpresaStr + ' AND ARTICULO = ''' + Articulo + ''' AND TIPO = 4');
  end;
end;

function DameISBNArticulo(Articulo: string): string;
begin
  Result := '';
  if (Trim(Articulo) > '') then
  begin
     Result := DameDato('SELECT BARRAS FROM ART_ARTICULOS_BARRAS WHERE EMPRESA = ' + REntorno.EmpresaStr + ' AND ARTICULO = ''' + Articulo + ''' AND TIPO = 5');
  end;
end;

function DameCodigoBarras(Articulo: string): string;
begin
  Result := '';
  Articulo := Trim(Articulo);
  if (Articulo > '') then
  begin
     Result := DameDato('SELECT BARRAS FROM ART_ARTICULOS_BARRAS WHERE EMPRESA = ' + IntToStr(REntorno.Empresa) + ' AND ARTICULO = ''' + Articulo + ''' ORDER BY TIPO DESC, BARRAS');
  end;
end;

function DameArticuloBarras(Barras: string): string;
begin
  Result := '';
  Barras := Trim(Barras);
  if (Barras > '') then
  begin
     Result := DameDato('SELECT B.ARTICULO FROM ART_ARTICULOS_BARRAS B ' + 'JOIN ART_ARTICULOS A ON B.ID_A = A.ID_A ' + 'WHERE B.EMPRESA = ' + IntToStr(REntorno.Empresa) + ' ' + 'AND B.BARRAS = ''' + Barras + ''' ' + 'ORDER BY A.BAJA, B.ARTICULO');
  end;
end;

function DameNombreComercialTercero(Tercero: integer): string;
begin
  Result := '';
  if (Tercero <> 0) then
  begin
     Result := DameDato('SELECT NOMBRE_COMERCIAL FROM SYS_TERCEROS WHERE TERCERO = ' + IntToStr(Tercero));
  end;
end;

function DamePerfilUsuario(Usuario: integer): integer;
begin
  if (Usuario = 0) then
     Usuario := REntorno.Usuario;
  Result := StrToIntDef(DameDato('SELECT PERFIL FROM SYS_USUARIOS WHERE USUARIO = ' + IntToStr(Usuario)), 0);
end;

function DameBancoDefecto(Empresa: integer; Ejercicio: integer; Canal: integer): integer;
var
  BancoDefecto, dummy : integer;
begin
  if (Empresa = 0) then
     Empresa := REntorno.Empresa;
  if (Ejercicio = 0) then
     Ejercicio := REntorno.Ejercicio;
  if (Canal = 0) then
     Canal := REntorno.Canal;

  DameMinMax('BAN', BancoDefecto, dummy, Empresa, Ejercicio, Canal);
  Result := BancoDefecto;
end;

function DameEntidadBanco(Banco: integer): string;
begin
  Result := '';
  if (Banco > 0) then
  begin
     Result := DameDato('SELECT ENTIDAD FROM EMP_BANCOS WHERE EMPRESA = ' + IntToStr(REntorno.Empresa) + ' AND BANCO = ' + IntToStr(Banco));
  end;
end;

function DamePgc(Empresa, Ejercicio, Canal: integer): integer;
begin
  Result := StrToIntDef(DameDato('SELECT PGC FROM EMP_CANALES ' + 'WHERE EMPRESA = ' + IntToStr(Empresa) + ' AND EJERCICIO = ' + IntToStr(Ejercicio) + ' AND CANAL = ' + IntToStr(Canal)), 0);
end;

function DameEjercicio(Empresa: integer; Fecha: TDateTime): integer;
begin
  Result := StrToIntDef(DameDato('EXECUTE PROCEDURE E_PRONOSTICA_EJERCICIO(' + IntToStr(Empresa) + ', ''' + FormatDateTime('yyyy-mm-dd hh:nn:ss', Fecha) + ''')'), 0);
end;

function DameUsuarioSegunEntrada(Entrada: integer): integer;
begin
  Result := 0;
  if (Entrada > 0) then
  begin
     Result := StrToIntDef(DameDato('SELECT USUARIO FROM SYS_ENTRADAS WHERE ENTRADA = ' + IntToStr(Entrada)), 0);
  end;
end;

function DameNombreCorreoUsuario(Usuario: integer): string;
begin
  Result := '';
  if (Usuario <> 0) then
  begin
     Result := DameDato('SELECT NOMBRE_CORREO FROM SYS_USUARIOS WHERE USUARIO = ' + IntToStr(Usuario));
  end;
end;

function DameTercero(Tipo: string; Codigo: integer; Empresa: integer): integer;
var
  sTabla, sCampo : string;
begin
  Result := 0;
  if (Codigo <> 0) and (Trim(Tipo) > '') then
  begin
     if (Empresa = 0) then
        Empresa := REntorno.Empresa;
     sTabla := '';
     sCampo := '';
     if Tipo = 'CLI' then
     begin
        sTabla := 'EMP_CLIENTES';
        sCampo := 'CLIENTE';
     end
     else if Tipo = 'PRO' then
     begin
        sTabla := 'EMP_PROVEEDORES';
        sCampo := 'PROVEEDOR';
     end
     else if Tipo = 'ACR' then
     begin
        sTabla := 'EMP_ACREEDORES';
        sCampo := 'ACREEDOR';
     end
     else if Tipo = 'AGE' then
     begin
        sTabla := 'EMP_AGENTES';
        sCampo := 'AGENTE';
     end
     else if Tipo = 'POT' then
     begin
        sTabla := 'EMP_CLIENTES_POTENCIALES';
        sCampo := 'CLIENTE';
     end;
     if (sTabla <> '') then
     begin
        Result := StrToIntDef(DameDato('SELECT TERCERO FROM ' + sTabla + ' WHERE EMPRESA = ' + IntToStr(Empresa) + ' AND ' + sCampo + ' = ' + IntToStr(Codigo)), 0);
     end;
  end;
end;

function EntradaAbierta: boolean;
begin
  Result := DameDato('SELECT 1 FROM SYS_ENTRADAS WHERE ENTRADA = ' + REntorno.EntradaStr + ' AND (FEC_SALIDA IS NULL OR FEC_SALIDA < ''2000-01-01'')') = '1';
end;

function DameIDCliente(Cliente: integer; Empresa: integer): integer;
begin
  Result := 0;
  if (Cliente <> 0) then
  begin
     if (Empresa = 0) then
        Empresa := REntorno.Empresa;
     Result := StrToIntDef(DameDato('SELECT ID_CLIENTE FROM EMP_CLIENTES ' + 'WHERE EMPRESA = ' + IntToStr(Empresa) + ' AND CLIENTE = ' + IntToStr(Cliente)), 0);
  end;
end;

function DameIDEmpleado(Empleado: integer; Empresa: integer): integer;
begin
  Result := 0;
  if (Empleado <> 0) then
  begin
     if (Empresa = 0) then
        Empresa := REntorno.Empresa;
     Result := StrToIntDef(DameDato('SELECT ID_EMPLEADO FROM OPE_EMPLEADO ' + 'WHERE EMPRESA = ' + IntToStr(Empresa) + ' AND EMPLEADO = ' + IntToStr(Empleado)), 0);
  end;
end;

function DameEmpleadoTarjeta(CodigoTarjeta: string): integer;
begin
  Result := 0;
  if (Trim(CodigoTarjeta) > '') then
  begin
     Result := StrToIntDef(DameDato('SELECT EMPLEADO FROM OPE_EMPLEADO WHERE EMPRESA = ' + IntToStr(REntorno.Empresa) + ' AND CODIGO_TARJETA = ''' + CodigoTarjeta + ''''), 0);
  end;
end;

function DameIdEmpleadoTarjeta(CodigoTarjeta: string): integer;
begin
  Result := 0;
  if (Trim(CodigoTarjeta) > '') then
  begin
     Result := StrToIntDef(DameDato('SELECT ID_EMPLEADO FROM OPE_EMPLEADO WHERE EMPRESA = ' + IntToStr(REntorno.Empresa) + ' AND CODIGO_TARJETA = ''' + CodigoTarjeta + ''''), 0);
  end;
end;

function DameIDAgente(Agente: integer): integer;
begin
  Result := 0;
  if (Agente <> 0) then
  begin
     Result := StrToIntDef(DameDato('SELECT ID_AGENTE FROM EMP_AGENTES WHERE EMPRESA = ' + REntorno.EmpresaStr + ' AND AGENTE = ' + IntToStr(Agente)), 0);
  end;
end;

function DameIDProveedor(Proveedor: integer): integer;
begin
  Result := 0;
  if (Proveedor <> 0) then
  begin
     Result := StrToIntDef(DameDato('SELECT ID_PROVEEDOR FROM EMP_PROVEEDORES WHERE EMPRESA = ' + REntorno.EmpresaStr + ' AND PROVEEDOR = ' + IntToStr(Proveedor)), 0);
  end;
end;

function DameIDAcreedor(Acreedor: integer): integer;
begin
  Result := 0;
  if (Acreedor <> 0) then
  begin
     Result := StrToIntDef(DameDato('SELECT ID_A_CREEDOR FROM EMP_ACREEDORES WHERE EMPRESA = ' + REntorno.EmpresaStr + ' AND ACREEDOR = ' + IntToStr(Acreedor)), 0);
  end;
end;

function DameAgenteUsuario(Usuario: integer): integer;
begin
  Result := 0;
  if (Usuario <> 0) then
  begin
     Result := StrToIntDef(DameDato('SELECT AGENTE FROM SYS_USUARIOS WHERE USUARIO = ' + IntToStr(Usuario)), 0);
  end;
end;

function DameRestriccionAgenteUsuario(Usuario: integer): boolean;
begin
  {TODO : RESTRINGIR_AGENTE es smallint}
  Result := False;
  if (Usuario <> 0) then
  begin
     Result := (DameDato('SELECT RESTRINGIR_AGENTE FROM SYS_USUARIOS WHERE USUARIO = ' + IntToStr(Usuario)) = '1');
  end;
end;

function ArticuloSerializado(Articulo: string): boolean;
var
  sCampo : string;
begin
  {TODO : SERIALIZADO_KRI / SERIALIZADO es smallint}
  Result := False;
  Articulo := Trim(Articulo);
  if (Articulo > '') then
  begin
     if (DMMain.EstadoKri(372) = 1) then
        sCampo := 'SERIALIZADO_KRI'
     else
        sCampo := 'SERIALIZADO';
     Result := (DameDato('SELECT ' + sCampo + ' FROM ART_ARTICULOS ' + 'WHERE EMPRESA = ' + IntToStr(REntorno.Empresa) + ' AND ARTICULO = ''' + Articulo + '''') = '1');
  end;
end;

function ArticuloSerializado(id_a: integer): boolean;
var
  sCampo : string;
begin
  {TODO : SERIALIZADO_KRI / SERIALIZADO es smallint}
  Result := False;
  if (id_a > 0) then
  begin
     if (DMMain.EstadoKri(372) = 1) then
        sCampo := 'SERIALIZADO_KRI'
     else
        sCampo := 'SERIALIZADO';
     Result := (DameDato('SELECT ' + sCampo + ' FROM ART_ARTICULOS WHERE ID_A = ' + IntToStr(id_a)) = '1');
  end;
end;

function ArticuloLoteable(Articulo: string): boolean;
begin
  {TODO : LOTES es smallint}
  Result := False;
  Articulo := Trim(Articulo);
  if (Articulo > '') then
  begin
     if (UltimoArticuloLoteable <> Articulo) then
     begin
        UltimoArticuloLoteable := Articulo;
        UltimoArticuloLoteableLoteable := (DameDato('SELECT LOTES FROM ART_ARTICULOS WHERE EMPRESA = ' + IntToStr(REntorno.Empresa) + ' AND ARTICULO = ''' + Articulo + '''') = '1');
     end;
     Result := UltimoArticuloLoteableLoteable;
  end;
end;

function ArticuloLoteable(id_a: integer): boolean;
begin
  {TODO : LOTES es smallint}
  Result := False;
  if (id_a > 0) then
  begin
     if (UltimoIDALoteable <> id_a) then
     begin
        UltimoIDALoteable := id_a;
        UltimoIDALoteableLoteable := (DameDato('SELECT LOTES FROM ART_ARTICULOS WHERE ID_A = ' + IntToStr(id_a)) = '1');
     end;
     Result := UltimoIDALoteableLoteable;
  end;
end;

function ArticuloUbicable(Articulo: string): boolean;
begin
  Result := False;
  Articulo := Trim(Articulo);
  if (Articulo > '') then
  begin
     Result := (DameDato('SELECT UBICABLE FROM ART_ARTICULOS WHERE EMPRESA = ' + IntToStr(REntorno.Empresa) + ' AND ARTICULO = ''' + Articulo + '''') = '1');
  end;
end;

function ArticuloUbicable(id_a: integer): boolean;
begin
  {TODO : UBICABLE es smallint}
  Result := False;
  if (id_a > 0) then
  begin
     Result := (DameDato('SELECT UBICABLE FROM ART_ARTICULOS WHERE ID_A = ' + IntToStr(id_a)) = '1');
  end;
end;

function DameComposicionUbicacion(id_ubicacion: integer): string;
begin
  Result := '';
  if (id_ubicacion <> 0) then
  begin
     Result := DameDato('SELECT COMPOSICION FROM ART_ALMACENES_UBICACIONES WHERE ID_UBICACION = ' + IntToStr(id_ubicacion));
  end;
end;

function DameIDArticulo(Articulo: string; Empresa: integer): integer;
begin
  Result := 0;
  Articulo := Trim(Articulo);
  if (Articulo > '') then
  begin
     if (Empresa = 0) then
        Empresa := REntorno.Empresa;
     Result := StrToIntDef(DameDato('SELECT ID_A FROM ART_ARTICULOS WHERE EMPRESA = ' + IntToStr(Empresa) + ' AND ARTICULO = ''' + Copy(Articulo, 1, 15) + ''''), 0);
  end;
end;

function DameIDCArticulo(Articulo: string; Empresa: integer; Ejercicio: integer; Canal: integer): integer;
begin
  Result := 0;
  Articulo := Trim(Articulo);
  if (Articulo > '') then
  begin
     if (Empresa = 0) then
        Empresa := REntorno.Empresa;
     if (Ejercicio = 0) then
        Ejercicio := REntorno.Ejercicio;
     if (Canal = 0) then
        Canal := REntorno.Canal;
     Result := StrToIntDef(DameDato('SELECT ID_C_A FROM CON_CUENTAS_GES_ART ' + 'WHERE EMPRESA = ' + IntToStr(Empresa) + ' AND EJERCICIO = ' + IntToStr(Ejercicio) + ' AND CANAL = ' + IntToStr(Canal) + ' AND ARTICULO = ''' + Articulo + ''''), 0);
  end;
end;

function DameIDLote(Articulo, Lote: string): integer;
begin
  Result := 0;
  Articulo := Trim(Articulo);
  Lote := Trim(Lote);
  if (Articulo > '') and (Lote > '') then
  begin
     Result := StrToIntDef(DameDato('SELECT ID_LOTE FROM ART_ARTICULOS_LOTES ' + 'WHERE EMPRESA = ' + IntToStr(REntorno.Empresa) + ' AND ARTICULO = ''' + Articulo + ''' ' + ' AND LOTE = ''' + Lote + ''''), 0);
  end;
end;

function DameFamilia(IdFamilia: integer): string;
begin
  Result := '';
  if (IdFamilia <> 0) then
  begin
     Result := DameDato('SELECT FAMILIA FROM ART_FAMILIAS WHERE ID_FAMILIA = ' + IntToStr(IdFamilia));
  end;
end;

function DameArticulo(id_a: integer): string;
begin
  Result := '';
  if (id_a > 0) then
  begin
     Result := DameDato('SELECT ARTICULO FROM ART_ARTICULOS WHERE ID_A = ' + IntToStr(id_a));
  end;
end;

function DameIDFamilia(Familia: string; Empresa: integer): integer;
begin
  Result := 0;
  Familia := Trim(Copy(Familia, 1, 5));
  if (Familia > '') then
  begin
     if (Empresa = 0) then
        Empresa := REntorno.Empresa;
     Result := StrToIntDef(DameDato('SELECT ID_FAMILIA FROM ART_FAMILIAS WHERE EMPRESA = ' + IntToStr(Empresa) + ' AND FAMILIA = ''' + Familia + ''''), 0);
  end;
end;

function DameIDSubFamilia(IdFamilia: integer; SubFamilia: string; Empresa: integer): integer;
begin
  Result := 0;
  SubFamilia := Trim(Copy(SubFamilia, 1, 5));
  if (IdFamilia <> 0) and (SubFamilia > '') then
  begin
     if (Empresa = 0) then
        Empresa := REntorno.Empresa;
     Result := StrToIntDef(DameDato('SELECT ID_SUBFAMILIA FROM ART_SUBFAMILIAS ' + 'WHERE EMPRESA = ' + IntToStr(Empresa) + ' AND ID_FAMILIA = ' + IntToStr(IdFamilia) + ' AND SUBFAMILIA = ''' + SubFamilia + ''''), 0);
  end;
end;

function DameSubFamilia(IdSubFamilia: integer): string;
begin
  Result := '';
  if (IdSubFamilia <> 0) then
  begin
     Result := DameDato('SELECT SUBFAMILIA FROM ART_SUBFAMILIAS WHERE ID_SUBFAMILIA = ' + IntToStr(IdSubFamilia));
  end;
end;

function DameIDUbicacionGeneral(Almacen: string): integer;
begin
  Result := 0;
  Almacen := Trim(Almacen);
  Almacen := Copy(Almacen, 1, 3);

  if (Almacen > '') then
  begin
     Result := StrToIntDef(DameDato('SELECT ID_UBICACION FROM ART_ALMACENES_UBICACIONES ' + 'WHERE EMPRESA = ' + IntToStr(REntorno.Empresa) + ' AND ALMACEN = ''' + Almacen + ''' ' + 'AND GENERAL = 1'), 0);
  end;
end;

function TarifaEsIvaIncluido(Tarifa: string; Empresa: integer): boolean;
begin
  Result := False;

  Tarifa := Trim(Tarifa);
  Tarifa := Copy(Tarifa, 1, 3);

  if (Tarifa > '') then
  begin
     if (Empresa = 0) then
        Empresa := REntorno.Empresa;
     Result := (DameDato('SELECT IVA_INCLUIDO FROM ART_TARIFAS_C WHERE EMPRESA = ' + IntToStr(Empresa) + ' AND TARIFA = ''' + Tarifa + '''') = '1');
  end;
end;


end.
