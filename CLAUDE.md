# CLAUDE.md — Delfos ERP

## Descripción del proyecto

Sistema ERP multiproducto desarrollado en **Delphi 6** con base de datos **Firebird 5.0**.
Los ejecutables principales son:

| Proyecto | Archivo DPR | Descripción |
|----------|-------------|-------------|
| Merge    | Merge.dpr   | ERP principal |
| MaxFactu | MaxFactu.dpr | MaxFactu |
| G2k2Plus | G2k2Plus.dpr | Gestión 2K |
| AdmXXI   | AdmXXI.dpr  | Administra XXI |

## Stack tecnológico

- **Lenguaje**: Object Pascal — Delphi 6
- **Base de datos**: Firebird 5.0
- **Componentes BD**: FIB+ (FIBDatabase, FIBQuery, FIBTableDataSet) y HY Components
- **Reporting**: FastReport (archivos .FRF / .FR3)
- **Internacionalización**: GnuGetText (archivos .po en `/lang` y `/locale`)
- **Firma digital**: PortableSigner (Java, en `/PortableSigner`)
- **QR / Códigos de barras**: DelphiZXingQRCode
- **Obligaciones fiscales**: módulo SII y VeriFactu

## Estructura de módulos

```
Compras/        Gestión de compras y proveedores
Contabilidad/   Contabilidad, PGC, asientos
crm/            CRM y gestión de clientes
estadisticas/   Informes estadísticos
inis/           Ficheros de configuración de ejemplo (.ini)
lang/ locale/   Traducciones y localización
Listados/       Listados e informes FastReport
Parches/        Parches SQL numerados de migración de BD
PortableSigner/ Componente Java de firma digital
produccion/     Módulo de producción
quimicas/       Módulo sector químico
recursos/       Imágenes, iconos y recursos
SII/            Suministro Inmediato de Información (Hacienda)
Tesoreria/      Tesorería, cobros, pagos, remesas
TPV/            Punto de venta
Ventas/         Gestión de ventas y facturación
```

## Convenciones de código Delphi

Las convenciones son implícitas en el código existente. Seguir siempre el estilo del fichero que se está modificando:

- **Clases**: prefijo `T` (ej. `TFormVentas`, `TModuloContabilidad`)
- **Campos privados**: prefijo `F` (ej. `FImporte`, `FCliente`)
- **Interfaces**: prefijo `I`
- **Variables locales**: sin prefijo, nombres descriptivos en español camelcase
- **Constantes**: `C` o todo mayúsculas
- **Formularios**: prefijo `FM` en el nombre de clase
- **Modulos de Datos**: prefijo `DM` en el nombre de clase
- Los identificadores y comentarios están en **español**

## Sistema de parches de base de datos

Las migraciones de BD se gestionan mediante parches SQL numerados en `/Parches/`:

```
Parches/
  00001-00500/   parche__NNNN[_descripcion].sql
  00501-00600/
  ...
  01101-01200/
  Utils/         Scripts de utilidad no versionados
```

- Cada parche tiene número correlativo (ej. `parche__1138.sql`)
- Los parches son **irreversibles** — nunca modificar un parche ya aplicado
- Para cualquier cambio de esquema, crear un **nuevo** parche con el siguiente número
- Los archivos `.sql.txt` son parches pendientes de revisión/aplicación

## Arquitectura Delphi — puntos de entrada principales

### Módulo de datos principal: `UDMMain.pas` — clase `TDMMain`

Instancia global: `DMMain` (accesible desde cualquier formulario).

Contiene las conexiones a base de datos:
- `DataBase: THYDatabase` — conexión principal a `DELFOS.FDB`
- `DataBaseAdjuntos: THYDatabase` — BD de adjuntos (opcional, si está configurada)
- `DataBaseImagenes: THYDatabase` — BD de imágenes (opcional)

Métodos clave:
- `Conecta` / `DesConecta` — abre/cierra la conexión usando los parámetros de `REntorno`
- `DatosVersion` — lee versión de BD, empresa, copyright y nombre de producto
- `Busca` / `BuscaRO` — búsqueda estándar sobre `TFIBTableSet` / `TFIBTableSetRO`

La configuración de conexión (ruta de BD, usuario, rol) viene de `REntorno` (registro de entorno).

### Formulario principal: `UFMain.pas` — clase `TFMain` (hereda de `THYForm`)

Es la ventana principal de la aplicación. Contiene el menú desde el que se abren todos los demás formularios **bajo demanda** (no se precargan). Cada opción de menú tiene una `TAction` con el patrón `A<NombreModulo>Execute` que instancia y muestra el formulario correspondiente.

### Jerarquía de formularios base

Todos los formularios heredan de `TG2KForm` (base del framework HY). Hay dos ramas:

**Rama de edición de maestros** — formularios con ficha y tabla:

```
TG2KForm
 └── TFPEditSinNavegador   (UFPEditSinNavegador)
       PMain: TLFPanel
       EPMain: THYMEditPanel
       Gestión de grids y teclas. Sin navegador de registros.
      └── TFPEditSimple    (UFPEditSimple)
            NavMain: THYMNavigator  ← añade navegador y barra de botones
           └── TFPEdit     (UFPEdit)
                 DBGMain: THYTDBGrid  ← añade grid principal
                 PEdit: TLFPanel
                 Pestañas Tabla / Ficha. Coloreado de celdas por condición.
                └── TFPEditDetalle   (UFPEditDetalle)
                      PDetalle: TLFPanel     ← añade panel de líneas/detalle
                      NavDetalle: THYMNavigator
                      DBGFDetalle: TDBGridFind2000
                      Botón maximizar tabla.
```

**Rama de listados / informes** — formularios de impresión y previsualización:

```
TG2KForm
 └── TFPEditListadoSimple  (UFPEditListadoSimple)
       Toolbar: Imprimir, Previsualizar, Exportar, Salir, Recargar
       Componentes FastReport: TfrHYReport, THYReport, TfrxHYReport, THYReportMail
      └── TFPEditListado   (UFPEditListado)
            └── TFPEditListadoSfg  (UFPEditListadoSfg)
                  PNLOrden: TLFPanel  ← añade panel de filtros y orden
                  TButtConfigurar     ← botón de configuración del listado
```

**Cuándo usar cada base:**
- Mantenimiento de un maestro simple → `TFPEdit`
- Maestro con líneas (cabecera + detalle) → `TFPEditDetalle`
- Formulario sin navegador (selector, búsqueda) → `TFPEditSinNavegador`
- Informe / listado imprimible → `TFPEditListadoSfg` (o `TFPEditListado` si no necesita panel de filtros)

### Convenciones de nombrado en el código Delphi

| Prefijo | Tipo de unidad |
|---------|---------------|
| `UF` | Formulario (`TForm` / `THYForm`) |
| `UFM` | Formulario modal |
| `UDM` | Módulo de datos (`TDataModule`) |
| `U` | Unidad de código sin formulario |

## Pruebas

No hay tests automáticos. Las pruebas son **manuales** antes de cada release.
Al proponer cambios, indicar explícitamente qué hay que probar y cómo.

## Carpeta de componentes

Los componentes y librerías de terceros usados por el proyecto están en el fichero CLAUDE_local.md
Si no encuentras este fichero pregunta y rellena este dato en ese fichero.

| Carpeta | Contenido |
|---------|-----------|
| `CompG2k` | Componentes propios del framework G2K (base de `TG2KForm`, `THYForm`, `THYDatabase`, `THYMNavigator`, etc.) |
| `FastReport319` | Motor de informes FastReport (versión principal en uso) |
| `FastReport251` / `FastReport245` | Versiones anteriores de FastReport |
| `RxLib` | Librería de controles UI y base de datos |
| `Abbrevia` | Compresión ZIP |
| `GraphicEx` | Formatos de imagen adicionales |
| `Matricial` | Impresión matricial |
| `Indy10` | Protocolos de red (TCP/IP, email…) |
| `LF` | Componentes de estilo y layout (prefijo `TLF*`) |
| `FlatStyle` | Estilo visual flat para controles |
| `NormaCSB` | Normativa bancaria CSB (remesas) |

Al buscar la implementación de un componente `THY*`, `TG2K*`, `TLF*` o `TNs*`, buscar en esta carpeta, no en el proyecto principal.

## Ficheros a ignorar

Al explorar o buscar en el proyecto, ignorar siempre:
- `*.~*` — copias de seguridad automáticas de Delphi
- `*.ddp` — dependencias de proyecto Delphi (generadas automáticamente)
- `*.bak` — backups
- `*.txt` — notas sueltas, no forman parte del código

Estos patrones ya están en `.gitignore`. El código relevante está en `*.pas`, `*.dfm`, `*.dpr` y `*.sql`.

Los ficheros `*.fr3` / `*.frf` son plantillas base de listados FastReport en formato binario — ignorar para cualquier tarea de programación.

El proyecto principal es **`Merge.dpr`**.

## Cómo ayuda Claude en este proyecto

1. **Explicación del enfoque primero** — antes de mostrar código, razonar el cambio
2. **Código después** — mostrar solo el fragmento relevante (método o bloque), no el fichero entero salvo que sea corto
3. **Respetar el estilo del fichero existente** — no introducir convenciones nuevas
4. **No añadir comentarios innecesarios** — solo cuando el "por qué" no es obvio
5. **No crear tests** — el proyecto no usa tests automáticos
6. **Para cambios de BD**: siempre proponer el número de parche siguiente y el SQL correspondiente

## Base de datos multi-dimensión — CRÍTICO

La base de datos es **multi-empresa, multi-ejercicio, multi-canal, multi-serie y multi-almacén**. Estos campos forman parte de la **clave primaria** de todas las tablas que les aplican:

| Campo | Tipo | Descripción |
|-------|------|-------------|
| `EMPRESA` | SMALLINT | Empresa (siempre presente) |
| `EJERCICIO` | SMALLINT | Año contable/fiscal |
| `CANAL` | SMALLINT | Canal de venta/compra (tienda, web, mayorista…) |
| `SERIE` | VARCHAR | Serie de numeración de documentos |
| `ALMACEN` | VARCHAR | Almacén físico |

**Valores habituales en todas las instalaciones:**
- `EMPRESA = 1` — empresa principal (siempre existe)
- `CANAL = 1` — canal principal (siempre existe)
- `EJERCICIO` — coincide con el año en curso, salvo en empresas con ejercicio partido (ej. julio–junio)

**Implicaciones para cualquier query o código:**
- Nunca filtrar o cruzar tablas sin incluir **todos** los campos de la PK que correspondan
- Un mismo artículo, cliente o documento existe de forma independiente por empresa/ejercicio/canal
- Los JOINs entre tablas deben incluir siempre `EMPRESA` (y `EJERCICIO`, `CANAL`… según la tabla)
- Al insertar registros, siempre propagar estos campos desde el contexto del documento/sesión

## Arquitectura de maestros: patrón TERCEROS

El diseño de maestros de empresa usa herencia por composición. La entidad base es **TERCEROS** (una empresa o persona física, identificada principalmente por NIF):

```
SYS_TERCEROS                  ← entidad base (NIF, razón social, …)
  ├── SYS_TERCEROS_DIRECCIONES
  ├── SYS_TERCEROS_BANCOS
  ├── SYS_TERCEROS_CONTACTOS
  ├── SYS_TERCEROS_RAZONES      ← razones sociales alternativas
  └── SYS_TERCEROS_REDES_SOCIALES

EMP_CLIENTES                  ← datos específicos de cliente  (FK → SYS_TERCEROS)
EMP_PROVEEDORES               ← datos específicos de proveedor
EMP_ACREEDORES                ← datos específicos de acreedor
EMP_AGENTES                   ← datos específicos de agente
OPE_EMPLEADO                  ← datos específicos de empleado
SYS_EMPRESAS                  ← datos específicos de la propia empresa
```

Un mismo tercero puede ser a la vez cliente y proveedor.

**Clientes/proveedores varios (ID negativo):** Los IDs negativos (-1, -2, -3…) son clientes o proveedores genéricos ("varios"). No tienen registro en `EMP_CLIENTES` / `EMP_PROVEEDORES` / `EMP_ACREEDORES` ni en `SYS_TERCEROS`. Sus datos fiscales (NIF, razón social) se capturan en el momento del documento y se almacenan en `GES_CABECERAS_S_FAC_NIF` / `GES_CABECERAS_E_FAC_NIF`. Los JOINs con tablas de maestros sobre estos documentos deben hacerse con `LEFT JOIN` o excluir los IDs negativos. Las tablas `EMP_*` amplían `SYS_TERCEROS` pero no lo duplican: razón social, NIF, direcciones y bancos siempre viven en `SYS_TERCEROS*`.

### Cuentas contables de maestros

Los elementos que tienen cuentas contables asociadas las tienen en una tabla `CON_CUENTAS_*` separada:

| Maestro | Tabla específica | Tabla contable |
|---------|-----------------|----------------|
| Artículos | `ART_ARTICULOS` | `CON_CUENTAS_GES_ART` |
| Clientes | `EMP_CLIENTES` | `CON_CUENTAS_GES_CLI` |
| Proveedores | `EMP_PROVEEDORES` | `CON_CUENTAS_GES_PRO` |
| Acreedores | `EMP_ACREEDORES` | `CON_CUENTAS_GES_ACR` |
| Agentes | `EMP_AGENTES` | `CON_CUENTAS_GES_AGE` |
| Formas de pago | `SYS_FORMAS_PAGO` | `CON_CUENTAS_GES_FP` |

**En el código y en queries se trabaja habitualmente con las vistas `VER_*` que ya unen el maestro con sus cuentas contables**, evitando hacer el JOIN manualmente:

- `VER_ARTICULOS_CUENTAS` = `ART_ARTICULOS` + `CON_CUENTAS_GES_ART` + familia + subfamilia + …
- `VER_CLIENTES_CUENTAS` = `EMP_CLIENTES` + `CON_CUENTAS_GES_CLI` + `SYS_TERCEROS` + …
- `VER_PROVEEDORES_CUENTAS` = `EMP_PROVEEDORES` + `CON_CUENTAS_GES_PRO` + `SYS_TERCEROS` + …
- … y equivalentes para el resto de maestros

**Regla práctica**: ante cualquier consulta sobre un maestro, usar primero la vista `VER_*` correspondiente. Bajar a las tablas base solo cuando se necesite escribir (INSERT/UPDATE) o cuando la vista no cubra el campo necesario.

## Contabilidad, tesorería e IVA

### Plan contable y asientos

| Tabla | Contenido |
|-------|-----------|
| `CON_CUENTAS` | Plan contable (estructura de cuentas) |
| `CON_CUENTAS_ASIENTOS` | Cabeceras de asientos contables |
| `CON_CUENTAS_APUNTES` | Apuntes (líneas) de asientos contables |
| `CON_BORRADOR_ASIENTO` | Borrador de asiento (no contabilizado) |
| `CON_BORRADOR_APUNTE` | Líneas del borrador de asiento |

### Tesorería / cartera de vencimientos

| Tabla | Contenido |
|-------|-----------|
| `EMP_CARTERA` | Vencimientos asociados a documentos de compra/venta |
| `EMP_CARTERA_DETALLE` | Detalle de cada vencimiento |

Campo discriminador: **`SIGNO`**
- `C` → Cartera de **cobros** (ventas)
- `P` → Cartera de **pagos** (compras)

### Registro de IVA

| Tabla | Contenido |
|-------|-----------|
| `EMP_REGISTRO_IVA` | Registro de IVA asociado a facturas |
| `EMP_REGISTRO_IVA_DETALLE` | Desglose de tipos de IVA por factura |

Campo discriminador: **`SIGNO`**
- `S` → IVA **Soportado** (facturas de compra/acreedor)
- `R` → IVA **Repercutido** (facturas de venta)

## Arquitectura de documentos de compra/venta (GES_)

Patrón de **herencia de tabla única con satélites por tipo de documento**.

### Tablas principales

| | Ventas (S = Salida) | Compras (E = Entrada) |
|-|--------------------|-----------------------|
| Cabeceras | `GES_CABECERAS_S` | `GES_CABECERAS_E` |
| Detalles | `GES_DETALLES_S` | `GES_DETALLES_E` |

El campo **`TIPO`** discrimina el tipo de documento dentro de cada tabla:

| TIPO | Descripción | Flujo |
|------|-------------|-------|
| `OFC` | Oferta a cliente | Ventas |
| `PEC` | Pedido de cliente | Ventas |
| `ALB` | Albarán a cliente | Ventas |
| `FAC` | Factura a cliente | Ventas |
| `OFP` | Propuesta a proveedor | Compras |
| `OCP` | Propuesta confirmada | Compras |
| `PEP` | Pedido a proveedor | Compras |
| `ALP` | Albarán de proveedor | Compras |
| `FAP` | Factura de proveedor | Compras |
| `FCR` | Factura de acreedor | Compras |

### Tablas satélite (campos específicos por tipo)

Cada tipo de documento tiene tablas satélite con los campos que solo aplican a ese tipo:

**Ventas:**
- `GES_CABECERAS_S_OFC` / `GES_DETALLES_S_OFC` — campos específicos de oferta
- `GES_CABECERAS_S_PED` / `GES_DETALLES_S_PED` — campos específicos de pedido
- `GES_CABECERAS_S_ALB` / `GES_DETALLES_S_ALB` — campos específicos de albarán
- `GES_CABECERAS_S_FAC` / `GES_DETALLES_S_FAC` — campos específicos de factura

**Compras:**
- `GES_CABECERAS_E_OFP` / `GES_DETALLES_E_OFP` — propuesta
- `GES_CABECERAS_E_OCP` / `GES_DETALLES_E_OCP` — propuesta confirmada
- `GES_CABECERAS_E_PED` / `GES_DETALLES_E_PED` — pedido a proveedor
- `GES_CABECERAS_E_ALB` / `GES_DETALLES_E_ALB` — albarán de proveedor
- `GES_CABECERAS_E_FAC` / `GES_DETALLES_E_FAC` — factura de proveedor
- `GES_CABECERAS_E_FCR` / `GES_DETALLES_E_FCR` — factura de acreedor

**Otras tablas relacionadas:**
- `GES_CABECERAS_S_FAC_NIF` / `GES_CABECERAS_E_FAC_NIF` — NIF y datos fiscales cuando el documento usa un **cliente varios** (cliente con ID negativo: -1, -2, -3…). Solo existe registro aquí en ese caso.
- `GES_DETALLES_S_LOTES` / `GES_DETALLES_E_LOTES` — trazabilidad de lotes
- `GES_DETALLES_S_UBICACIONES` / `GES_DETALLES_E_UBICACIONES` — ubicaciones de almacén
- `GES_DETALLES_RELACIONES` — relaciones entre documentos (ej. albarán originado de pedido)
- `GES_CABECERAS_E_PROR` / `GES_DETALLES_E_PROR` — prorrateo de costes de compras
- `GES_CABECERAS_E_PROR_ALB` / `GES_DETALLES_E_PROR_ALB` — prorrateo de costes sobre albaranes de compra
- `GES_CABECERAS_M` / `GES_DETALLES_M` — movimientos de inventario
- `GES_TICKET_CABECERA` / `GES_TICKET_DETALLE` — tickets de TPV (estructura paralela independiente)

**Estructuras para movimientos entre almacenes (independientes del flujo compra/venta):**
- `GES_CABECERAS_PEA` / `GES_DETALLES_PEA` — pedidos entre almacenes: documenta la solicitud, entrega y recepción de stock de un almacén a otro
- `GES_CABECERAS_ST` / `GES_DETALLES_ST` — movimientos físicos entre almacenes; el campo `TIPO_OPERACION` define la operación: `E` (entrada), `S` (salida), `T` (traspaso)

## Nomenclatura de objetos de base de datos

Las vistas tienen siempre el prefijo `VER_`.

Las tablas siguen (mayoritariamente) estos prefijos por módulo — la nomenclatura no es totalmente consistente ya que ha intervenido mucha gente a lo largo del tiempo:

| Prefijo | Módulo / Contenido |
|---------|--------------------|
| `ART_` | Artículos, familias, tarifas, stocks, almacenes |
| `CON_CUENTAS_` | Datos contables de maestros (cuentas asociadas a clientes, artículos, proveedores…) |
| `GES_` | Gestión comercial: documentos de compra/venta (cabeceras y detalles de pedidos, albaranes, facturas) |
| `ANA_` | Contabilidad analítica (centros de coste, imputaciones, plan analítico) |
| `PRO_` | Producción y fabricación (órdenes, escandallos, fases) |
| `EMP_` | Maestros de empresa (clientes, proveedores, agentes, empleados, proyectos) |
| `SYS_` | Tablas de sistema y configuración global |
| `OPE_` | Operaciones / RRHH (presencia, jornadas, hojas de trabajo) |
| `SII_` | Suministro Inmediato de Información (Hacienda) |
| `VF_` | VeriFactu |
| `TPV_` / `GES_TICKET_` | Punto de venta |
| `CRM_` | CRM |
| `TMP_` | Tablas temporales de proceso |

## Consulta de esquema de base de datos

Usa el comando `/schema` para consultar la BD Delfos en tiempo real:

| Uso | Resultado |
|-----|-----------|
| `/schema` | Lista todas las tablas |
| `/schema CLIENTES` | Muestra columnas, tipos e índices de CLIENTES |
| `/schema VER_ARTICULOS_CUENTAS` | Muestra columnas y SQL fuente de una vista (prefijo `VER_` detectado automáticamente) |
| `/schema PROC: MI_PROCEDIMIENTO` | Muestra parámetros y código fuente de un SP |
| `/schema PROCEDURES` | Lista todos los procedimientos almacenados |
| `/schema DOMAIN: ARTICULOS` | Muestra la definición de un dominio |
| `/schema DOMAINS` | Lista todos los dominios de usuario |
| `/schema GEN: CONTA_EMPRESAS` | Muestra valor actual, inicial e incremento de un generador |
| `/schema GENERATORS` | Lista todos los generadores |
| `/schema EXC: ERR_BREAKPOINT` | Muestra mensaje de la excepción y objetos que la usan |
| `/schema EXCEPTIONS` | Lista todas las excepciones de usuario |
| `/schema SQL: SELECT ...` | Ejecuta SQL arbitrario contra la BD |

**Conexión**: `C:\Delfos\Datos\FB5\DELFOS.FDB` — SYSDBA vía ISQL (`C:\Program Files\Firebird\Firebird_5_0\isql.exe`)

## Gestión de versiones

La versión del producto se correlaciona con el número del último parche SQL aplicado.
El flujo Git usa ramas por version (ej. `Version-1167`).
