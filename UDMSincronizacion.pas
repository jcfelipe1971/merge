unit UDMSincronizacion;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados;

type
  TArticulo = record
     Empresa: integer;
     Ejercicio: integer;
     Canal: integer;
     Articulo: string;
     Titulo: string;
     Familia: string;
     Subfamilia: string;
     p_coste: double;
     Abierto: integer;
     ArticuloVirtual: integer;
     control_stock: integer;
     Pais: string;
     TipoIva: integer;
     cta_compras: string;
     cta_ventas: string;
     cta_devolucion_compras: string;
     cta_devolucion_ventas: string;
     cta_abono_compras: string;
     cta_abono_ventas: string;
     unidades: string;
     titulo_corto: string;
     notas: string;
     Disponibilidad: integer;
     actualiza_venta: integer;
     pto_verde: double;
     controla_medidas: integer;
     serializado: integer;
     garantia: integer;
     produccion: integer;
     descuento: double;
     descuento_2: double;
     descuento_3: double;
     iva_escandallo: integer;
     pvp_por_ud_secundaria: integer;
     alfa_1: string;
     alfa_2: string;
     alfa_3: string;
     alfa_4: string;
     alfa_5: string;
     alfa_6: string;
     alfa_7: string;
     alfa_8: string;
     serializado_kri: integer;
     lotes_kri: integer;
     lotes: integer;
     multiplo_1: double;
     multiplo_2: double;
     multiplo_3: double;
     multiplo_4: double;
     factor_escala: double;
     ud_minimo_compra: double;
     ud_minimo_venta: double;
     id_a: integer;
     id_c_a: integer;
     imagen: integer;
     id_galeria: integer;
     codigo_intra: string;
     peso: double;
     ubicable: integer;
     volumen_unit: double;
     diametro_unit: double;
     defecto_ud_secundaria: integer;
     notas_compras: string;
     notas_ventas: string;
     no_calcula_stockminmax: integer;
     crc_notas: string;
     crc_notas_compras: string;
     crc_notas_ventas: string;
     anticipo: integer;
     anticipo_contado: integer;
     anticipo_preg_datos: integer;
     web: integer;
     fabricante: integer;
     baja: integer;
     fecha_baja: TDateTime;
     motivo_baja: string;
     PorcentajeIVA: double;
     InfluyeMargen: integer;
     {
    TIPO_CLAVE_ADR
    CANTIDAD_LIMITADA
    TIPO_ARTICULO_TYC
    Z_MODELO
    Z_LINEA
    Z_SALIDA
    Z_ARMAZON
    Z_LONA
    Z_LONA_TIPO
    Z_LONA_FORMA
    Z_LONA_MODELO
    Z_LONA_CONFECCION
    Z_LACADO
    Z_TIPO_LACADO
    Z_CORTE
    Z_QUITAR_SI_HAY_MOTOR
    Z_SUSTITUTO
    Z_KIT_TIPO
    Z_PREPARABLE
    Z_MERMA
    Z_FORZAR_LACADO_SN
    Z_TIPO_LACADO_FORZADO
    COMPONENTE_MOTOR
    Z_LAM_ANCHO
    Z_LAM_LARGO
    Z_LAM_COLOR
    SUBTIPO_ARTICULO_TYC
    EXPORTAR
    COSTE_ADICIONAL
    Z_QUITAR_SI_ES_MANUAL
    ID_MARCA : integer;
    MARCA
    TITULO_MARCA
    PMP
    PRECIO_MERCADO
    COD_COLOR_HILO
    }
  end;

  TDireccionTercero = record
     // Datos minimos de Direccion Tercero
     Tercero: integer;
     // Resto de datos
     Direccion: integer;
     DirDefecto: integer;
     DirTipo: string;
     DirNombre1: string;
     DirNombre2: string;
     DirNombre3: string;
     DirNumero: string;
     DirBloqueEscalera: string;
     DirPiso: string;
     DirPuerta: string;
     Localidad: string;
     DirLocalidad: string;
     Provincia: string;
     CodigoPostal: string;
     Colonia: string;
     DirClase: integer;
     DirTelefono1: string;
     DirTelefono2: string;
     DirTelefax: string;
     Activo: integer;
     DirTransportista: integer;
     IdLocal: integer;
     Pais: string;
     Notas: string;
  end;

  TTercero = record
     // Datos minimos de Tercero
     NombreRSocial: string;
     PaisTercero: string;
     Nif: string;
     // Resto de datos
     Tercero: integer;
     Direccion: TDireccionTercero;

     Telefono1: string;
     Telefono2: string;
     Telefax: string;
     email: string;
     Notas: string;
  end;

  TCliente = record
     Tercero: TTercero;
     // Datos minimos de Cliente
     Empresa: integer;
     Pais_c2: string;
     Tarifa: string;
     Agente: integer;
     // Datos minimos de Cliente-Cuentas
     Ejercicio: integer;
     Canal: integer;
     Pais: string;
     Tipo: integer; // 1 Normal, 3 Intracomunitario, 5 Extranjero, etc. (SYS_TIPOS_TERCERO)
     ModoIVA: integer;
     Cuenta: string; // Crearla con E_CUENTAS_ALTA_GEST (Empresa, Ejercicio, Canal, Cuenta, Gestion(3=Clientes), Tercero)
     FormaPago: string;
     CuentaDtoPP: string;
     // Resto de datos
     Cliente: integer;
     IdCliente: integer;
     usar_anticipos: integer;
     eval_feb: integer;
     eval_feb_si: integer;
     banco_pagos: integer;
     transportista: integer;
     tipo_portes: integer;
     facturar_serie: integer;
     serie_a_facturar: string;
     albaranar_serie: integer;
     serie_a_albaranar: string;
     no_agrupar_albaranes: integer;
  end;

type
  TDMSincronizacion = class(TDataModule)
     TUpdate: THYTransaction;
     TLocal: THYTransaction;
  private
     { Private declarations }
  public
     { Public declarations }
  end;

var
  DMSincronizacion : TDMSincronizacion;

procedure InicializaArticulo(var A: TArticulo);
procedure CreaArticulo(var A: TArticulo);
procedure ActualizaPrecio(Articulo: string; Precio: double; Tarifa: string = ''; Empresa: integer = 0);
procedure InicializaTercero(var T: TTercero);
procedure CreaTercero(var T: TTercero);
procedure InicializaDireccionTercero(var DT: TDireccionTercero);
procedure CreaDireccionTercero(var DT: TDireccionTercero);
procedure InicializaCliente(var C: TCliente);
procedure CreaCliente(var C: TCliente);

implementation

uses UDMMain, UUtiles, UDameDato, UEntorno, HYFIBQuery, UParam;

{$R *.dfm}

{ TDMSincronizacion }

procedure InicializaArticulo(var A: TArticulo);
begin
  with A do
  begin
     Empresa := 0;
     Ejercicio := 0;
     Canal := 0;
     Articulo := '';
     Titulo := '';
     Familia := '';
     Subfamilia := '';
     p_coste := -1;
     abierto := -1;
     ArticuloVirtual := -1;
     control_stock := -1;
     Pais := '';
     TipoIva := -1;
     cta_compras := '';
     cta_ventas := '';
     cta_devolucion_compras := '';
     cta_devolucion_ventas := '';
     cta_abono_compras := '';
     cta_abono_ventas := '';
     unidades := '';
     titulo_corto := '';
     notas := '';
     Disponibilidad := -1;
     actualiza_venta := -1;
     pto_verde := -1;
     controla_medidas := -1;
     serializado := -1;
     garantia := -1;
     produccion := -1;
     descuento := -1;
     descuento_2 := -1;
     descuento_3 := -1;
     iva_escandallo := -1;
     pvp_por_ud_secundaria := -1;
     alfa_1 := '';
     alfa_2 := '';
     alfa_3 := '';
     alfa_4 := '';
     alfa_5 := '';
     alfa_6 := '';
     alfa_7 := '';
     alfa_8 := '';
     serializado_kri := -1;
     lotes_kri := -1;
     lotes := -1;
     multiplo_1 := -1;
     multiplo_2 := -1;
     multiplo_3 := -1;
     multiplo_4 := -1;
     factor_escala := -1;
     ud_minimo_compra := -1;
     ud_minimo_venta := -1;
     id_a := 0;
     id_c_a := 0;
     imagen := 0;
     id_galeria := 0;
     codigo_intra := '';
     peso := -1;
     ubicable := -1;
     volumen_unit := -1;
     diametro_unit := -1;
     defecto_ud_secundaria := 0;
     notas_compras := '';
     notas_ventas := '';
     no_calcula_stockminmax := -1;
     crc_notas := '';
     crc_notas_compras := '';
     crc_notas_ventas := '';
     anticipo := -1;
     anticipo_contado := -1;
     anticipo_preg_datos := -1;
     web := -1;
     fabricante := 0;
     baja := -1;
     // fecha_baja : Now;
     motivo_baja := '';
     PorcentajeIVA := -1;
     InfluyeMargen := -1;
     {
    TIPO_CLAVE_ADR
    CANTIDAD_LIMITADA
    TIPO_ARTICULO_TYC
    Z_MODELO
    Z_LINEA
    Z_SALIDA
    Z_ARMAZON
    Z_LONA
    Z_LONA_TIPO
    Z_LONA_FORMA
    Z_LONA_MODELO
    Z_LONA_CONFECCION
    Z_LACADO
    Z_TIPO_LACADO
    Z_CORTE
    Z_QUITAR_SI_HAY_MOTOR
    Z_SUSTITUTO
    Z_KIT_TIPO
    Z_PREPARABLE
    Z_MERMA
    Z_FORZAR_LACADO_SN
    Z_TIPO_LACADO_FORZADO
    COMPONENTE_MOTOR
    Z_LAM_ANCHO
    Z_LAM_LARGO
    Z_LAM_COLOR
    SUBTIPO_ARTICULO_TYC
    EXPORTAR
    COSTE_ADICIONAL
    Z_QUITAR_SI_ES_MANUAL
    ID_MARCA : integer;
    MARCA
    TITULO_MARCA
    PMP
    PRECIO_MERCADO
    COD_COLOR_HILO
    }
  end;
end;

procedure CreaArticulo(var A: TArticulo);
begin
  /// Crea un articulo con los datos del registro TArticulo.
  /// Si ya existe modifica el articulo existente

  // Datos por defecto para insertar articulos
  with A do
  begin
     if (Empresa = 0) then
        Empresa := REntorno.Empresa;
     if (Ejercicio = 0) then
        Ejercicio := REntorno.Ejercicio;
     if (Canal = 0) then
        Canal := REntorno.Canal;
  end;

  A.Id_A := DameIdArticulo(Copy(A.Articulo, 1, 15), A.Empresa);
  A.Id_C_A := DameIdCArticulo(Copy(A.Articulo, 1, 15), A.Empresa, A.Ejercicio, A.Canal);

  // Si voy a crear el articulo o la cuenta del articulo necesitaré estos datos
  if ((A.Id_A = 0) or (A.Id_C_A = 0)) then
  begin
     DMMain.Log(Format('CreaArticulo - ID_A %d, ID_C_A %d, Familia: %s', [A.Id_A, A.Id_C_A, A.Familia]));
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT * FROM VER_FAMILIAS_CUENTAS WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = ?CANAL AND FAMILIA = :FAMILIA';
           Params.ByName['EMPRESA'].AsInteger := A.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := A.Ejercicio;
           Params.ByName['CANAL'].AsInteger := A.Canal;
           if A.Familia = '' then
           begin
              Params.ByName['FAMILIA'].AsString := REntorno.FamDefecto;
              DMMain.Log(Format('Se utiliza Familia: %s para buscar cuentas', [REntorno.FamDefecto]));
           end
           else
              Params.ByName['FAMILIA'].AsString := A.Familia;
           ExecQuery;
           if (A.Cta_Compras = '') then
              A.Cta_Compras := FieldByName['CTA_COMPRAS'].AsString;
           if (A.Cta_Ventas = '') then
              A.Cta_Ventas := FieldByName['CTA_VENTAS'].AsString;
           if (A.Cta_Devolucion_Compras = '') then
              A.Cta_Devolucion_Compras := FieldByName['CTA_DEVOLUCION_COMPRAS'].AsString;
           if (A.Cta_Devolucion_Ventas = '') then
              A.Cta_Devolucion_Ventas := FieldByName['CTA_DEVOLUCION_VENTAS'].AsString;
           if (A.Cta_Abono_Compras = '') then
              A.Cta_Abono_Compras := FieldByName['CTA_ABONO_COMPRAS'].AsString;
           if (A.Cta_Abono_Ventas = '') then
              A.Cta_Abono_Ventas := FieldByName['CTA_ABONO_VENTAS'].AsString;
           if (A.Disponibilidad = -1) then
              A.Disponibilidad := FieldByName['VENTA'].AsInteger;
           if (A.Actualiza_Venta = -1) then
              A.Actualiza_Venta := FieldByName['ACTUALIZA_VENTA'].AsInteger;

           FreeHandle;
        finally
           Free;
        end;
     end;

     // DMMain.Log(Format('CC : %-15s - CV : %-15s', [A.Cta_Compras, A.Cta_Ventas]));
     // DMMain.Log(Format('CDC: %-15s - CDV: %-15s', [A.Cta_Devolucion_Compras, A.Cta_Devolucion_Ventas]));
     // DMMain.Log(Format('CAC: %-15s - CAV: %-15s', [A.Cta_Abono_Compras, A.Cta_Abono_Ventas]));

     if ((A.Id_A <> 0) and (A.Id_C_A = 0)) then
     begin
        // Existe el articulo pero no en este ejercicio

        if (A.Pais = '') then
           A.Pais := REntorno.Pais;
        if (A.TipoIVA = -1) then
           A.TipoIVA := DameTipoIVA(A.PorcentajeIVA, A.Pais);

        // DMMain.Log(format('Ins ConCuentasGesArt - EEC: %d %d %d CC: %s CV: %s', [A.Empresa,A.Ejercicio,A.Canal, A.Cta_Compras,A.Cta_Ventas]));
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' INSERT INTO CON_CUENTAS_GES_ART ( ');
              SQL.Add(' EMPRESA, EJERCICIO, CANAL, ARTICULO, CTA_COMPRAS, CTA_VENTAS, PAIS, TIPO_IVA, DISPONIBILIDAD, ACTUALIZA_VENTA, ');
              SQL.Add(' PTO_VERDE, IVA_ESCANDALLO, ID_A, ID_C_A, CTA_DEVOLUCION_COMPRAS, CTA_DEVOLUCION_VENTAS, CTA_ABONO_COMPRAS, ');
              SQL.Add(' CTA_ABONO_VENTAS) ');
              SQL.Add(' SELECT FIRST 1 EMPRESA, :EJERCICIO, CANAL, ARTICULO, :CTA_COMPRAS, :CTA_VENTAS, :PAIS, :TIPO_IVA, :DISPONIBILIDAD, ');
              SQL.Add('                ACTUALIZA_VENTA, PTO_VERDE, IVA_ESCANDALLO, ID_A, 0, :CTA_DEVOLUCION_COMPRAS, :CTA_DEVOLUCION_VENTAS, ');
              SQL.Add('                :CTA_ABONO_COMPRAS, :CTA_ABONO_VENTAS ');
              SQL.Add(' FROM CON_CUENTAS_GES_ART ');
              SQL.Add(' WHERE ');
              SQL.Add(' EMPRESA = :EMPRESA AND ');
              SQL.Add(' CANAL = :CANAL AND ');
              SQL.Add(' ARTICULO = :ARTICULO ');
              SQL.Add(' ORDER BY EJERCICIO DESC ');
              Params.ByName['EMPRESA'].AsInteger := A.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := A.Ejercicio;
              Params.ByName['CANAL'].AsInteger := A.Canal;
              Params.ByName['ARTICULO'].AsString := Copy(A.Articulo, 1, 15);
              Params.ByName['TIPO_IVA'].AsInteger := A.TipoIVA;
              Params.ByName['CTA_COMPRAS'].AsString := A.Cta_Compras;
              Params.ByName['CTA_VENTAS'].AsString := A.Cta_Ventas;
              Params.ByName['PAIS'].AsString := A.Pais;
              Params.ByName['DISPONIBILIDAD'].AsInteger := A.Disponibilidad;
              Params.ByName['CTA_DEVOLUCION_COMPRAS'].AsString := A.Cta_Devolucion_Compras;
              Params.ByName['CTA_DEVOLUCION_VENTAS'].AsString := A.Cta_Devolucion_Ventas;
              Params.ByName['CTA_ABONO_COMPRAS'].AsString := A.Cta_Abono_Compras;
              Params.ByName['CTA_ABONO_VENTAS'].AsString := A.Cta_Abono_Ventas;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;

        // IdCA := DameIdCArticulo(Copy(A.Articulo, 1, 15), A.Empresa, A.Ejercicio, A.Canal);
     end
     else
     if (A.Id_A = 0) then
     begin
        // Articulo nuevo
        A.Id_A := DMMain.ContadorGen('ID_ARTICULOS');

        if (A.Familia = '') then
           A.Familia := REntorno.FamDefecto;
        if (A.Pais = '') then
           A.Pais := REntorno.Pais;

        // DMMain.Log(format('Ins VerArticulosCuentas - EEC: %d %d %d CC: %s CV: %s', [A.Empresa,A.Ejercicio,A.Canal, A.Cta_Compras,A.Cta_Ventas]));
        // Insert minimo
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' INSERT INTO VER_ARTICULOS_CUENTAS ( ');
              SQL.Add(' EMPRESA, EJERCICIO, CANAL, ARTICULO, TITULO_LARGO, FAMILIA, CTA_COMPRAS, CTA_VENTAS, ENTRADA, PAIS,');
              SQL.Add('  CTA_DEVOLUCION_COMPRAS, CTA_DEVOLUCION_VENTAS, CTA_ABONO_COMPRAS, CTA_ABONO_VENTAS, ID_A, INFLUYE_MARGEN) ');
              SQL.Add(' VALUES ( ');
              SQL.Add(' :EMPRESA, :EJERCICIO, :CANAL, :ARTICULO, :TITULO, :FAMILIA, :CTA_COMPRAS, :CTA_VENTAS, :ENTRADA, :PAIS, ');
              SQL.Add(' :CTA_DEVOLUCION_COMPRAS, :CTA_DEVOLUCION_VENTAS, :CTA_ABONO_COMPRAS, :CTA_ABONO_VENTAS, :ID_A, :INFLUYE_MARGEN) ');

              Params.ByName['EMPRESA'].AsInteger := A.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := A.Ejercicio;
              Params.ByName['CANAL'].AsInteger := A.Canal;
              Params.ByName['ARTICULO'].AsString := Copy(A.Articulo, 1, 15);
              if (A.Titulo = '') then
                 Params.ByName['TITULO'].AsString := Copy(A.Articulo, 1, 256)
              else
                 Params.ByName['TITULO'].AsString := Copy(A.Titulo, 1, 256);
              Params.ByName['FAMILIA'].AsString := Copy(A.Familia, 1, 5);
              Params.ByName['CTA_COMPRAS'].AsString := A.Cta_Compras;
              Params.ByName['CTA_VENTAS'].AsString := A.Cta_Ventas;
              Params.ByName['ENTRADA'].AsInteger := REntorno.Entrada;
              Params.ByName['PAIS'].AsString := A.Pais;
              Params.ByName['CTA_DEVOLUCION_COMPRAS'].AsString := A.Cta_Devolucion_Compras;
              Params.ByName['CTA_DEVOLUCION_VENTAS'].AsString := A.Cta_Devolucion_Ventas;
              Params.ByName['CTA_ABONO_COMPRAS'].AsString := A.Cta_Abono_Compras;
              Params.ByName['CTA_ABONO_VENTAS'].AsString := A.Cta_Abono_Ventas;
              Params.ByName['ID_A'].AsInteger := A.Id_A;
              Params.ByName['INFLUYE_MARGEN'].AsInteger := 1 {A.InfluyeMargen};
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;

        A.Id_C_A := DameIdCArticulo(Copy(A.Articulo, 1, 15), A.Empresa, A.Ejercicio, A.Canal);
     end;
  end;

  // En este punto el articulo existe en esta Empresa-Ejercicio-Canal
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;

        SQL.Add(' UPDATE VER_ARTICULOS_CUENTAS ');
        SQL.Add(' SET ');
        SQL.Add(' EMPRESA = EMPRESA ');
        if (A.Titulo <> '') then
           SQL.Add(' ,TITULO_LARGO = :TITULO ');
        if (A.Familia <> '') then
           SQL.Add(' ,FAMILIA = :FAMILIA ');
        if (A.Subfamilia <> '') then
           SQL.Add(' ,Subfamilia = :Subfamilia ');
        if (A.p_coste >= 0) then
           SQL.Add(' ,p_coste = :p_coste ');
        if (A.abierto <> -1) then
           SQL.Add(' ,abierto = :abierto ');
        if (A.ArticuloVirtual <> -1) then
           SQL.Add(' ,Virtual = :Virtual ');
        if (A.control_stock <> -1) then
           SQL.Add(' ,control_stock = :control_stock ');
        if (A.Pais <> '') then
           SQL.Add(' ,Pais = :Pais ');
        if (A.TipoIva <> -1) then
           SQL.Add(' ,Tipo_Iva = :Tipo_Iva ');
        if (A.cta_compras <> '') then
           SQL.Add(' ,cta_compras = :cta_compras ');
        if (A.cta_ventas <> '') then
           SQL.Add(' ,cta_ventas = :cta_ventas ');
        if (A.cta_devolucion_compras <> '') then
           SQL.Add(' ,cta_devolucion_compras = :cta_devolucion_compras ');
        if (A.cta_devolucion_ventas <> '') then
           SQL.Add(' ,cta_devolucion_ventas = :cta_devolucion_ventas ');
        if (A.cta_abono_compras <> '') then
           SQL.Add(' ,cta_abono_compras = :cta_abono_compras ');
        if (A.cta_abono_ventas <> '') then
           SQL.Add(' ,cta_abono_ventas = :cta_abono_ventas ');
        if (A.unidades <> '') then
           SQL.Add(' ,unidades = :unidades ');
        if (A.titulo_corto <> '') then
           SQL.Add(' ,titulo_corto = :titulo_corto ');
        if (A.notas <> '') then
           SQL.Add(' ,notas = :notas ');
        if (A.Disponibilidad <> -1) then
           SQL.Add(' ,Disponibilidad = :Disponibilidad ');
        if (A.actualiza_venta <> -1) then
           SQL.Add(' ,actualiza_venta = :actualiza_venta ');
        if (A.pto_verde >= 0) then
           SQL.Add(' ,pto_verde = :pto_verde ');
        if (A.controla_medidas <> -1) then
           SQL.Add(' ,controla_medidas = :controla_medidas ');
        if (A.serializado <> -1) then
           SQL.Add(' ,serializado = :serializado ');
        if (A.garantia <> -1) then
           SQL.Add(' ,garantia = :garantia ');
        if (A.produccion <> -1) then
           SQL.Add(' ,produccion = :produccion ');
        if (A.descuento >= 0) then
           SQL.Add(' ,descuento = :descuento ');
        if (A.descuento_2 >= 0) then
           SQL.Add(' ,descuento_2 = :descuento_2 ');
        if (A.descuento_3 >= 0) then
           SQL.Add(' ,descuento_3 = :descuento_3 ');
        if (A.iva_escandallo <> -1) then
           SQL.Add(' ,iva_escandallo = :iva_escandallo ');
        if (A.pvp_por_ud_secundaria <> -1) then
           SQL.Add(' ,pvp_por_ud_secundaria = :pvp_por_ud_secundaria ');
        if (A.alfa_1 <> '') then
           SQL.Add(' ,alfa_1 = :alfa_1 ');
        if (A.alfa_2 <> '') then
           SQL.Add(' ,alfa_2 = :alfa_2 ');
        if (A.alfa_3 <> '') then
           SQL.Add(' ,alfa_3 = :alfa_3 ');
        if (A.alfa_4 <> '') then
           SQL.Add(' ,alfa_4 = :alfa_4 ');
        if (A.alfa_5 <> '') then
           SQL.Add(' ,alfa_5 = :alfa_5 ');
        if (A.alfa_6 <> '') then
           SQL.Add(' ,alfa_6 = :alfa_6 ');
        if (A.alfa_7 <> '') then
           SQL.Add(' ,alfa_7 = :alfa_7 ');
        if (A.alfa_8 <> '') then
           SQL.Add(' ,alfa_8 = :alfa_8 ');
        if (A.serializado_kri <> -1) then
           SQL.Add(' ,serializado_kri = :serializado_kri ');
        if (A.lotes_kri <> -1) then
           SQL.Add(' ,lotes_kri = :lotes_kri ');
        if (A.lotes <> -1) then
           SQL.Add(' ,lotes = :lotes ');
        if (A.multiplo_1 >= 0) then
           SQL.Add(' ,multiplo_1 = :multiplo_1 ');
        if (A.multiplo_2 >= 0) then
           SQL.Add(' ,multiplo_2 = :multiplo_2 ');
        if (A.multiplo_3 >= 0) then
           SQL.Add(' ,multiplo_3 = :multiplo_3 ');
        if (A.multiplo_4 >= 0) then
           SQL.Add(' ,multiplo_4 = :multiplo_4 ');
        if (A.factor_escala >= 0) then
           SQL.Add(' ,factor_escala = :factor_escala ');
        if (A.ud_minimo_compra >= 0) then
           SQL.Add(' ,ud_minimo_compra = :ud_minimo_compra ');
        if (A.ud_minimo_venta >= 0) then
           SQL.Add(' ,ud_minimo_venta = :ud_minimo_venta ');
        if (A.imagen <> 0) then
           SQL.Add(' ,imagen = :imagen ');
        if (A.id_galeria <> 0) then
           SQL.Add(' ,id_galeria = :id_galeria ');
        if (A.codigo_intra <> '') then
           SQL.Add(' ,codigo_intra = :codigo_intra ');
        if (A.peso >= 0) then
           SQL.Add(' ,peso = :peso ');
        if (A.ubicable <> -1) then
           SQL.Add(' ,ubicable = :ubicable ');
        if (A.volumen_unit >= 0) then
           SQL.Add(' ,volumen_unit = :volumen_unit ');
        if (A.diametro_unit >= 0) then
           SQL.Add(' ,diametro_unit = :diametro_unit ');
        if (A.defecto_ud_secundaria <> -1) then
           SQL.Add(' ,defecto_ud_secundaria = :defecto_ud_secundaria ');
        if (A.notas_compras <> '') then
           SQL.Add(' ,notas_compras = :notas_compras ');
        if (A.notas_ventas <> '') then
           SQL.Add(' ,notas_ventas = :notas_ventas ');
        if (A.no_calcula_stockminmax <> -1) then
           SQL.Add(' ,no_calcula_stockminmax = :no_calcula_stockminmax ');
        if (A.crc_notas <> '') then
           SQL.Add(' ,crc_notas = :crc_notas ');
        if (A.crc_notas_compras <> '') then
           SQL.Add(' ,crc_notas_compras = :crc_notas_compras ');
        if (A.crc_notas_ventas <> '') then
           SQL.Add(' ,crc_notas_ventas = :crc_notas_ventas ');
        if (A.anticipo <> -1) then
           SQL.Add(' ,anticipo = :anticipo ');
        if (A.anticipo_contado <> -1) then
           SQL.Add(' ,anticipo_contado = :anticipo_contado ');
        if (A.anticipo_preg_datos <> -1) then
           SQL.Add(' ,anticipo_preg_datos = :anticipo_preg_datos ');
        if (A.web <> -1) then
           SQL.Add(' ,web = :web ');
        if (A.fabricante <> 0) then
           SQL.Add(' ,fabricante = :fabricante ');
        if (A.baja <> -1) then
           SQL.Add(' ,baja = :baja ');
        // fecha_baja : Now;
        if (A.motivo_baja <> '') then
           SQL.Add(' ,motivo_baja = :motivo_baja ');
        if (A.InfluyeMargen <> -1) then
           SQL.Add(' ,INFLUYE_MARGEN = :INFLUYE_MARGEN ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' ARTICULO = :ARTICULO ');
        Params.ByName['EMPRESA'].AsInteger := A.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := A.Ejercicio;
        Params.ByName['CANAL'].AsInteger := A.Canal;
        Params.ByName['ARTICULO'].AsString := Copy(A.Articulo, 1, 15);

        if (A.Titulo <> '') then
           Params.ByName['TITULO'].AsString := Copy(A.Titulo, 1, 256);
        if (A.Familia <> '') then
           Params.ByName['Familia'].AsString := Copy(A.Familia, 1, 5);
        if (A.Subfamilia <> '') then
           Params.ByName['Subfamilia'].AsString := Copy(A.Subfamilia, 1, 5);
        if (A.p_coste >= 0) then
           Params.ByName['p_coste'].AsFloat := A.p_coste;
        if (A.abierto <> -1) then
           Params.ByName['abierto'].AsInteger := A.abierto;
        if (A.ArticuloVirtual <> -1) then
           Params.ByName['Virtual'].AsInteger := A.ArticuloVirtual;
        if (A.control_stock <> -1) then
           Params.ByName['control_stock'].AsInteger := A.control_stock;
        if (A.Pais <> '') then
           Params.ByName['Pais'].AsString := A.Pais;
        if (A.TipoIva <> -1) then
           Params.ByName['Tipo_Iva'].AsInteger := A.TipoIva;
        if (A.cta_compras <> '') then
           Params.ByName['cta_compras'].AsString := A.cta_compras;
        if (A.cta_ventas <> '') then
           Params.ByName['cta_ventas'].AsString := A.cta_ventas;
        if (A.cta_devolucion_compras <> '') then
           Params.ByName['cta_devolucion_compras'].AsString := A.cta_devolucion_compras;
        if (A.cta_devolucion_ventas <> '') then
           Params.ByName['cta_devolucion_ventas'].AsString := A.cta_devolucion_ventas;
        if (A.cta_abono_compras <> '') then
           Params.ByName['cta_abono_compras'].AsString := A.cta_abono_compras;
        if (A.cta_abono_ventas <> '') then
           Params.ByName['cta_abono_ventas'].AsString := A.cta_abono_ventas;
        if (A.unidades <> '') then
           Params.ByName['unidades'].AsString := A.unidades;
        if (A.titulo_corto <> '') then
           Params.ByName['titulo_corto'].AsString := Copy(A.titulo_corto, 1, 20);
        if (A.notas <> '') then
           Params.ByName['notas'].AsString := A.notas;
        if (A.Disponibilidad <> -1) then
           Params.ByName['Disponibilidad'].AsInteger := A.Disponibilidad;
        if (A.actualiza_venta <> -1) then
           Params.ByName['actualiza_venta'].AsInteger := A.actualiza_venta;
        if (A.pto_verde >= 0) then
           Params.ByName['pto_verde'].AsFloat := A.pto_verde;
        if (A.controla_medidas <> -1) then
           Params.ByName['controla_medidas'].AsInteger := A.controla_medidas;
        if (A.serializado <> -1) then
           Params.ByName['serializado'].AsInteger := A.serializado;
        if (A.garantia <> -1) then
           Params.ByName['garantia'].AsInteger := A.garantia;
        if (A.produccion <> -1) then
           Params.ByName['produccion'].AsInteger := A.produccion;
        if (A.descuento >= 0) then
           Params.ByName['descuento'].AsFloat := A.descuento;
        if (A.descuento_2 >= 0) then
           Params.ByName['descuento_2'].AsFloat := A.descuento_2;
        if (A.descuento_3 >= 0) then
           Params.ByName['descuento_3'].AsFloat := A.descuento_3;
        if (A.iva_escandallo <> -1) then
           Params.ByName['iva_escandallo'].AsInteger := A.iva_escandallo;
        if (A.pvp_por_ud_secundaria <> -1) then
           Params.ByName['pvp_por_ud_secundaria'].AsInteger := A.pvp_por_ud_secundaria;
        if (A.alfa_1 <> '') then
           Params.ByName['alfa_1'].AsString := Copy(A.alfa_1, 1, 40);
        if (A.alfa_2 <> '') then
           Params.ByName['alfa_2'].AsString := Copy(A.alfa_2, 1, 40);
        if (A.alfa_3 <> '') then
           Params.ByName['alfa_3'].AsString := Copy(A.alfa_3, 1, 40);
        if (A.alfa_4 <> '') then
           Params.ByName['alfa_4'].AsString := Copy(A.alfa_4, 1, 40);
        if (A.alfa_5 <> '') then
           Params.ByName['alfa_5'].AsString := Copy(A.alfa_5, 1, 40);
        if (A.alfa_6 <> '') then
           Params.ByName['alfa_6'].AsString := Copy(A.alfa_6, 1, 40);
        if (A.alfa_7 <> '') then
           Params.ByName['alfa_7'].AsString := Copy(A.alfa_7, 1, 40);
        if (A.alfa_8 <> '') then
           Params.ByName['alfa_8'].AsString := Copy(A.alfa_8, 1, 40);
        if (A.serializado_kri <> -1) then
           Params.ByName['serializado_kri'].AsInteger := A.serializado_kri;
        if (A.lotes_kri <> -1) then
           Params.ByName['lotes_kri'].AsInteger := A.lotes_kri;
        if (A.lotes <> -1) then
           Params.ByName['lotes'].AsInteger := A.lotes;
        if (A.multiplo_1 >= 0) then
           Params.ByName['multiplo_1'].AsFloat := A.multiplo_1;
        if (A.multiplo_2 >= 0) then
           Params.ByName['multiplo_2'].AsFloat := A.multiplo_2;
        if (A.multiplo_3 >= 0) then
           Params.ByName['multiplo_3'].AsFloat := A.multiplo_3;
        if (A.multiplo_4 >= 0) then
           Params.ByName['multiplo_4'].AsFloat := A.multiplo_4;
        if (A.factor_escala >= 0) then
           Params.ByName['factor_escala'].AsFloat := A.factor_escala;
        if (A.ud_minimo_compra >= 0) then
           Params.ByName['ud_minimo_compra'].AsFloat := A.ud_minimo_compra;
        if (A.ud_minimo_venta >= 0) then
           Params.ByName['ud_minimo_venta'].AsFloat := A.ud_minimo_venta;
        if (A.imagen <> 0) then
           Params.ByName['imagen'].AsInteger := A.imagen;
        if (A.id_galeria <> 0) then
           Params.ByName['id_galeria'].AsInteger := A.id_galeria;
        if (A.codigo_intra <> '') then
           Params.ByName['codigo_intra'].AsString := A.codigo_intra;
        if (A.peso >= 0) then
           Params.ByName['peso'].AsFloat := A.peso;
        if (A.ubicable <> -1) then
           Params.ByName['ubicable'].AsInteger := A.ubicable;
        if (A.volumen_unit >= 0) then
           Params.ByName['volumen_unit'].AsFloat := A.volumen_unit;
        if (A.diametro_unit >= 0) then
           Params.ByName['diametro_unit'].AsFloat := A.diametro_unit;
        if (A.defecto_ud_secundaria <> -1) then
           Params.ByName['defecto_ud_secundaria'].AsInteger := A.defecto_ud_secundaria;
        if (A.notas_compras <> '') then
           Params.ByName['notas_compras'].AsString := A.notas_compras;
        if (A.notas_ventas <> '') then
           Params.ByName['notas_ventas'].AsString := A.notas_ventas;
        if (A.no_calcula_stockminmax <> -1) then
           Params.ByName['no_calcula_stockminmax'].AsInteger := A.no_calcula_stockminmax;
        if (A.crc_notas <> '') then
           Params.ByName['crc_notas'].AsString := A.crc_notas;
        if (A.crc_notas_compras <> '') then
           Params.ByName['crc_notas_compras'].AsString := A.crc_notas_compras;
        if (A.crc_notas_ventas <> '') then
           Params.ByName['crc_notas_ventas'].AsString := A.crc_notas_ventas;
        if (A.anticipo <> -1) then
           Params.ByName['anticipo'].AsInteger := A.anticipo;
        if (A.anticipo_contado <> -1) then
           Params.ByName['anticipo_contado'].AsInteger := A.anticipo_contado;
        if (A.anticipo_preg_datos <> -1) then
           Params.ByName['anticipo_preg_datos'].AsInteger := A.anticipo_preg_datos;
        if (A.web <> -1) then
           Params.ByName['web'].AsInteger := A.web;
        if (A.fabricante <> 0) then
           Params.ByName['fabricante'].AsInteger := A.fabricante;
        if (A.baja <> -1) then
           Params.ByName['baja'].AsInteger := A.baja;
        // fecha_baja := Now;
        if (A.motivo_baja <> '') then
           Params.ByName['motivo_baja'].AsString := A.motivo_baja;
        if (A.InfluyeMargen <> -1) then
           Params.ByName['INFLUYE_MARGEN'].AsInteger := A.InfluyeMargen;

        // DMMain.Log(format('Upd VerArticulosCuentas - EEC: %d %d %d CC : %-15s CV : %-15s', [A.Empresa,A.Ejercicio,A.Canal, A.Cta_Compras,A.Cta_Ventas]));
        // DMMain.Log(format('Upd VerArticulosCuentas - EEC: %d %d %d CDC: %-15s CDV: %-15s', [A.Empresa,A.Ejercicio,A.Canal, A.cta_devolucion_Compras,A.cta_devolucion_Ventas]));
        // DMMain.Log(format('Upd VerArticulosCuentas - EEC: %d %d %d CAC: %-15s CAV: %-15s', [A.Empresa,A.Ejercicio,A.Canal, A.cta_abono_Compras,A.cta_abono_Ventas]));
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure ActualizaPrecio(Articulo: string; Precio: double; Tarifa: string = ''; Empresa: integer = 0);
begin
  /// Actualizo el precio de una tarifa de venta

  DMMain.Log(Format('ActualizaPrecio(%s, %f, %s, %d)', [Articulo, Precio, Tarifa, Empresa]));
  if (Empresa = 0) then
     Empresa := REntorno.Empresa;
  if (Tarifa = '') then
     Tarifa := REntorno.TarifaDefecto;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'UPDATE ART_TARIFAS_PRECIOS SET PRECIO_VENTA = :PRECIO_VENTA, BLOQUEADO = 1 WHERE EMPRESA = :EMPRESA AND ARTICULO = :ARTICULO AND TARIFA = :TARIFA AND LINEA = :LINEA';
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['ARTICULO'].AsString := Articulo;
        Params.ByName['TARIFA'].AsString := Tarifa;
        Params.ByName['LINEA'].AsInteger := 1;
        Params.ByName['PRECIO_VENTA'].AsFloat := Precio;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure InicializaTercero(var T: TTercero);
begin
  with T do
  begin
     NombreRSocial := '';
     PaisTercero := '';
     Nif := '';
     Tercero := 0;
     Notas := '';
     InicializaDireccionTercero(Direccion);
  end;
end;

procedure CreaTercero(var T: TTercero);
var
  //i : integer;
  NifOriginal : string;
begin
  /// Crea un tercero con los datos del registro TTercero.
  /// Si ya existe modifica el tercero existente.

  with T do
  begin
     if (PaisTercero = '') then
        PaisTercero := REntorno.Pais;

     // Limpio NIF. Solo letras y numeros
     NifOriginal := Nif;
     LimpiaNIF(PaisTercero, Nif);
     Nif := Trim(Copy(Nif, 1, 20));
  end;

  // Busco el tercero mediante el NIF
  if (T.Tercero = 0) then
  begin
     if (Trim(T.Nif) <> '') then
     begin
        DMMain.Log(Format('Busco Tercero con NIF %s', [T.Nif]));
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT TERCERO FROM SYS_TERCEROS WHERE PAIS_TERCERO = :PAIS_TERCERO AND NIF = :NIF';
              Params.ByName['PAIS_TERCERO'].AsString := T.PaisTercero;
              Params.ByName['NIF'].AsString := T.Nif;
              ExecQuery;
              T.Tercero := FieldByName['TERCERO'].AsInteger;
              FreeHandle;
           finally
              Free;
           end;
        end;
        DMMain.Log(Format('Tercero con NIF %s = %d', [T.Nif, T.Tercero]));
     end;
  end;

  // Si no existe tercero, debo crearlo
  if (T.Tercero = 0) then
  begin
     T.Tercero := DMMain.ContadorGen('CONTA_TERCEROS');

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'INSERT INTO SYS_TERCEROS (TERCERO, NOMBRE_R_SOCIAL, PAIS_TERCERO, NIF) VALUES (:TERCERO, :NOMBRE_R_SOCIAL, :PAIS_TERCERO, :NIF)';
           Params.ByName['TERCERO'].AsInteger := T.Tercero;
           Params.ByName['NOMBRE_R_SOCIAL'].AsString := Copy(T.NombreRSocial, 1, 60);
           Params.ByName['PAIS_TERCERO'].AsString := T.PaisTercero;
           Params.ByName['NIF'].AsString := T.Nif;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
     DMMain.Log(Format('Tercero creado %d', [T.Tercero]));
  end;

  // En este punto existe el tercero
  // Creo/Modifico la direccino por defecto
  T.Direccion.Tercero := T.Tercero;
  CreaDireccionTercero(T.Direccion);

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE SYS_TERCEROS ');
        SQL.Add(' SET ');
        SQL.Add(' TERCERO = :TERCERO ');
        if (T.NombreRSocial <> '') then
           SQL.Add(' ,NOMBRE_R_SOCIAL = :NOMBRE_R_SOCIAL ');
        if (T.PaisTercero <> '') then
           SQL.Add(' ,PAIS_TERCERO = :PAIS_TERCERO ');
        if (T.Nif <> '') then
           SQL.Add(' ,NIF = :NIF ');
        if (T.Email <> '') then
           SQL.Add(' ,EMAIL = :EMAIL ');
        if (T.Notas <> '') then
           SQL.Add(' ,NOTAS = :NOTAS ');
        SQL.Add(' WHERE ');
        SQL.Add(' TERCERO = :TERCERO ');

        Params.ByName['TERCERO'].AsInteger := T.Tercero;
        if (T.NombreRSocial <> '') then
           Params.ByName['NOMBRE_R_SOCIAL'].AsString := Copy(T.NombreRSocial, 1, 60);
        if (T.PaisTercero <> '') then
           Params.ByName['PAIS_TERCERO'].AsString := T.PaisTercero;
        if (T.Nif <> '') then
           Params.ByName['NIF'].AsString := T.Nif;
        if (T.Email <> '') then
           Params.ByName['EMAIL'].AsString := Copy(T.Email, 1, 100);
        if (T.Notas <> '') then
           Params.ByName['NOTAS'].AsString := T.Notas;
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

procedure InicializaDireccionTercero(var DT: TDireccionTercero);
begin
  with DT do
  begin
     Tercero := 0;
     Direccion := 0;
     DirDefecto := -1;
     DirTipo := '';
     DirNombre1 := '';
     DirNombre2 := '';
     DirNombre3 := '';
     DirNumero := '';
     DirBloqueEscalera := '';
     DirPiso := '';
     DirPuerta := '';
     DirLocalidad := '';
     Localidad := '';
     Provincia := '';
     CodigoPostal := '';
     Colonia := '';
     DirClase := -1;
     DirTelefono1 := '';
     DirTelefono2 := '';
     DirTelefax := '';
     Activo := -1;
     DirTransportista := -1;
     IdLocal := -1;
     Pais := 'ZZZ';
     Notas := '';
  end;
end;

procedure CreaDireccionTercero(var DT: TDireccionTercero);
begin
  /// Crea una direccion de tercero con los datos del registro TDireccionTercero.
  /// Si ya existe modifica la direccion de tercero existente.
  /// Solo crea/modifica si hay datos rellenados (DirNombre1 > '')

  if (Trim(DT.DirNombre1) > '') then
  begin
     if (DT.Tercero = 0) then
        raise Exception.Create(_('El tercero no puede ser 0'));

     {
     // Busco si ya existe la direccion
     if (DT.Direccion = 0) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT DIRECCION FROM SYS_TERCEROS_DIRECCIONES WHERE TERCERO = :TERCERO AND DIR_NOMBRE = :DIR_NOMBRE AND DIR_NOMBRE_2 = :DIR_NOMBRE_2';
              Params.ByName['TERCERO'].AsInteger := DT.Tercero;
              Params.ByName['DIR_NOMBRE'].AsString := Copy(DT.DirNombre1, 1, 40);
              Params.ByName['DIR_NOMBRE_2'].AsString := Copy(DT.dirNombre2, 1, 40);
              ExecQuery;
              DT.Direccion := FieldByName['DIRECCION'].AsInteger;
              FreeHandle;
           finally
              Free;
           end;
        end;
        DMMain.Log(Format('Se encontro direccion %d para Tecero %d, %s %s', [DT.Direccion, DT.Tercero, DT.DirNombre1, DT.DirNombre2]));
     end;
     }

     // Si no existe la creo
     if (DT.Direccion = 0) then
     begin
        // Nuevo numero de direccion
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT CONT FROM COD_TERCERO_AUX(:TERCERO, 3)';
              Params.ByName['TERCERO'].AsInteger := DT.Tercero;
              ExecQuery;
              DT.Direccion := FieldByName['CONT'].AsInteger;
              FreeHandle;
           finally
              Free;
           end;
        end;

        if (DT.Direccion = 1) then
           DT.DirDefecto := 1
        else
           DT.DirDefecto := 0;

        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'INSERT INTO SYS_TERCEROS_DIRECCIONES (TERCERO, DIRECCION, DIR_DEFECTO) VALUES (:TERCERO, :DIRECCION, :DIR_DEFECTO)';
              Params.ByName['TERCERO'].AsInteger := DT.Tercero;
              Params.ByName['DIRECCION'].AsInteger := DT.Direccion;
              Params.ByName['DIR_DEFECTO'].AsInteger := DT.DirDefecto;
              ExecQuery;
              FreeHandle;
           finally
              Free;
           end;
        end;
        DMMain.Log(Format('Se Creo direccion %d para Tecero %d', [DT.Direccion, DT.Tercero]));
     end;

     DMMain.Log('CreaDireccionTercero.Pais=' + DT.Pais + '.');
     DMMain.Log('CreaDireccionTercero.CodigoPostal=' + DT.CodigoPostal + '.');
     DMMain.Log('CreaDireccionTercero.Localidad=' + DT.Localidad + '.');
     DMMain.Log('CreaDireccionTercero.Provincia=' + DT.Provincia + '.');
     DMMain.Log('CreaDireccionTercero.DirLocalidad=' + DT.DirLocalidad + '.');
     // Trato de averiguar la localidad
     if (DT.DirLocalidad = '') then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT LOCALIDAD FROM SYS_LOCALIDADES ');
              SQL.Add(' WHERE ');
              SQL.Add(' PAIS = :PAIS AND ');
              SQL.Add(' CODIGO_POSTAL = :CODIGO_POSTAL AND ');
              SQL.Add(' UPPER(TITULO) = UPPER(:TITULO) ');
              Params.ByName['PAIS'].AsString := DT.Pais;
              Params.ByName['CODIGO_POSTAL'].AsString := Copy(Dt.CodigoPostal, 1, 10);
              Params.ByName['TITULO'].AsString := Copy(DT.Localidad, 1, 40);
              ExecQuery;
              DT.DirLocalidad := Trim(FieldByName['LOCALIDAD'].AsString);
              FreeHandle;
           finally
              Free;
           end;
        end;
        DMMain.Log('1-CreaDireccionTercero.DirLocalidad=' + DT.DirLocalidad + '.');
     end;

     // Trato de averiguar la localidad con solo codigo postal
     {
     if (DT.DirLocalidad = '') then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT LOCALIDAD FROM SYS_LOCALIDADES ');
              SQL.Add(' WHERE ');
              SQL.Add(' PAIS = :PAIS AND ');
              SQL.Add(' CODIGO_POSTAL = :CODIGO_POSTAL ');
              Params.ByName['PAIS'].AsString := DT.Pais;
              Params.ByName['CODIGO_POSTAL'].AsString := Copy(Dt.CodigoPostal, 1, 10);
              ExecQuery;
              DT.DirLocalidad := Trim(FieldByName['LOCALIDAD'].AsString);
              FreeHandle;
           finally
              Free;
           end;
        end;
     DMMain.Log('2-CreaDireccionTercero.DirLocalidad='+DT.DirLocalidad+'.');
     end;
     }

     // Si no encuentro, y es de España, tomo la primera localidad de la provincia.
     {
     if ((DT.DirLocalidad = '') and (DT.Pais = 'ESP')) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT LOCALIDAD FROM SYS_LOCALIDADES ');
              SQL.Add(' WHERE ');
              SQL.Add(' PAIS = :PAIS AND ');
              SQL.Add(' PROVINCIA = :PROVINCIA ');
              Params.ByName['PAIS'].AsString := DT.Pais;
              Params.ByName['PROVINCIA'].AsString := Copy(Dt.CodigoPostal, 1, 2);
              ExecQuery;
              DT.DirLocalidad := Trim(FieldByName['LOCALIDAD'].AsString);
              FreeHandle;
           finally
              Free;
           end;
        end;
     DMMain.Log('3-CreaDireccionTercero.DirLocalidad='+DT.DirLocalidad+'.');
     end;
     }
     // Si no encuentro, y *NO* es de España, tomo la primera localidad del pais.
     if (DT.DirLocalidad = '') then
     begin
        {
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Add(' SELECT LOCALIDAD FROM SYS_LOCALIDADES ');
              SQL.Add(' WHERE ');
              SQL.Add(' PAIS = :PAIS ');
              SQL.Add(' ORDER BY PROVINCIA ');
              Params.ByName['PAIS'].AsString := DT.Pais;
              ExecQuery;
              DT.DirLocalidad := Trim(FieldByName['LOCALIDAD'].AsString);
              FreeHandle;
           finally
              Free;
           end;
        end;
        }
        if ((DT.DirLocalidad = '') and (DT.Pais <> 'ZZZ')) then
        begin
           if (DT.Pais = 'ESP') then
              DT.Provincia := Copy(Dt.CodigoPostal, 1, 2);

           if (DT.Provincia = '') then
           begin
              DT.Provincia := '01';
              DT.DirLocalidad := DT.Pais + '00001';

              // Aseguro que exista provincia "01"
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' UPDATE OR INSERT INTO SYS_PROVINCIAS ( ');
                    SQL.Add(' PAIS, PROVINCIA, TITULO, CODIGO_TEL) ');
                    SQL.Add(' VALUES ( ');
                    SQL.Add(' :PAIS, :PROVINCIA, :TITULO, :CODIGO_TEL) ');
                    SQL.Add(' MATCHING (PAIS, PROVINCIA) ');
                    Params.ByName['PAIS'].AsString := DT.Pais;
                    Params.ByName['PROVINCIA'].AsString := '01';
                    Params.ByName['TITULO'].AsString := '.';
                    Params.ByName['CODIGO_TEL'].AsString := '0';
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;

              // Aseguro que exista localidad "PPP00001" (PPP = PAIS)
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' UPDATE OR INSERT INTO SYS_LOCALIDADES ( ');
                    SQL.Add(' LOCALIDAD, TITULO, CODIGO_POSTAL, PAIS, PROVINCIA) ');
                    SQL.Add(' VALUES ( ');
                    SQL.Add(' :LOCALIDAD, (SELECT TITULO ');
                    SQL.Add('                    FROM SYS_PAISES ');
                    SQL.Add('                    WHERE ');
                    SQL.Add('                    PAIS = :PAIS), ''.'', :PAIS, :PROVINCIA) ');
                    SQL.Add(' MATCHING (LOCALIDAD) ');
                    Params.ByName['PAIS'].AsString := DT.Pais;
                    Params.ByName['LOCALIDAD'].AsString := DT.DirLocalidad;
                    Params.ByName['PROVINCIA'].AsString := DT.Provincia;
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;

                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' SELECT MAX(LOCALIDAD) ');
                       SQL.Add(' FROM SYS_LOCALIDADES ');
                       SQL.Add(' WHERE ');
                       SQL.Add(' PAIS = :PAIS AND ');
                       SQL.Add(' LOCALIDAD STARTING WITH :PAIS ');
                       Params.ByName['PAIS'].AsString := DT.Pais;
                       ExecQuery;
                       DT.DirLocalidad := FieldByName['MAX'].AsString;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;

                 DT.DirLocalidad := DT.Pais + format('%.5d', [StrToIntDef(Copy(DT.DirLocalidad, 4, 5), 0) + 1]);
                 with THYFIBQuery.Create(nil) do
                 begin
                    try
                       Close;
                       DataBase := DMMain.DataBase;
                       SQL.Add(' UPDATE OR INSERT INTO SYS_LOCALIDADES ( ');
                       SQL.Add(' LOCALIDAD, TITULO, CODIGO_POSTAL, PAIS, PROVINCIA) ');
                       SQL.Add(' VALUES ( ');
                       SQL.Add(' :LOCALIDAD, :TITULO, :CODIGO_POSTAL, :PAIS, :PROVINCIA) ');
                       SQL.Add(' MATCHING (LOCALIDAD) ');
                       Params.ByName['PAIS'].AsString := DT.Pais;
                       Params.ByName['LOCALIDAD'].AsString := DT.DirLocalidad;
                       Params.ByName['TITULO'].AsString := Copy(DT.Localidad, 1, 40);
                       Params.ByName['CODIGO_POSTAL'].AsString := Copy(DT.CodigoPostal, 1, 10);
                       Params.ByName['PROVINCIA'].AsString := DT.Provincia;
                       ExecQuery;
                       FreeHandle;
                    finally
                       Free;
                    end;
                 end;
                 DMMain.Log('4-CreaDireccionTercero.DirLocalidad=' + DT.DirLocalidad + '.');
              end;
           end
           else
           begin
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' SELECT MAX(LOCALIDAD) ');
                    SQL.Add(' FROM SYS_LOCALIDADES ');
                    SQL.Add(' WHERE ');
                    SQL.Add(' PAIS = :PAIS AND ');
                    SQL.Add(' LOCALIDAD STARTING WITH :PAIS ');
                    Params.ByName['PAIS'].AsString := DT.Pais;
                    ExecQuery;
                    DT.DirLocalidad := FieldByName['MAX'].AsString;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;

              DT.DirLocalidad := DT.Pais + format('%.5d', [StrToIntDef(Copy(DT.DirLocalidad, 4, 5), 0) + 1]);
              with THYFIBQuery.Create(nil) do
              begin
                 try
                    Close;
                    DataBase := DMMain.DataBase;
                    SQL.Add(' UPDATE OR INSERT INTO SYS_LOCALIDADES ( ');
                    SQL.Add(' LOCALIDAD, TITULO, CODIGO_POSTAL, PAIS, PROVINCIA) ');
                    SQL.Add(' VALUES ( ');
                    SQL.Add(' :LOCALIDAD, :TITULO, :CODIGO_POSTAL, :PAIS, :PROVINCIA) ');
                    SQL.Add(' MATCHING (LOCALIDAD) ');
                    Params.ByName['PAIS'].AsString := DT.Pais;
                    Params.ByName['LOCALIDAD'].AsString := DT.DirLocalidad;
                    Params.ByName['TITULO'].AsString := Copy(DT.Localidad, 1, 40);
                    Params.ByName['CODIGO_POSTAL'].AsString := Copy(DT.CodigoPostal, 1, 10);
                    Params.ByName['PROVINCIA'].AsString := DT.Provincia;
                    ExecQuery;
                    FreeHandle;
                 finally
                    Free;
                 end;
              end;
              DMMain.Log('5-CreaDireccionTercero.DirLocalidad=' + DT.DirLocalidad + '.');
           end;
        end;
     end;

     // En este punto ya existe la direccion
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' UPDATE SYS_TERCEROS_DIRECCIONES ');
           SQL.Add(' SET ');
           SQL.Add(' TERCERO = :TERCERO ');
           if (DT.DirNombre1 <> '') then
              SQL.Add(' ,DIR_NOMBRE = :DIR_NOMBRE ');
           if (DT.DirNombre2 <> '') then
              SQL.Add(' ,DIR_NOMBRE_2 = :DIR_NOMBRE_2 ');
           if (DT.DirNombre3 <> '') then
              SQL.Add(' ,DIR_NOMBRE_3 = :DIR_NOMBRE_3 ');
           if (DT.DirDefecto <> -1) then
              SQL.Add(' ,DIR_DEFECTO = :DIR_DEFECTO ');
           if (DT.DirLocalidad <> '') then
              SQL.Add(' ,DIR_LOCALIDAD = :DIR_LOCALIDAD ');
           if (DT.DirClase <> -1) then
              SQL.Add(' ,DIR_CLASE = :DIR_CLASE ');
           if (DT.Notas <> '') then
              SQL.Add(' ,NOTAS = :NOTAS ');
           if (DT.DirTelefono1 <> '') then
              SQL.Add(' ,DIR_TELEFONO01 = :DIR_TELEFONO01 ');
           if (DT.DirTelefono2 <> '') then
              SQL.Add(' ,DIR_TELEFONO02 = :DIR_TELEFONO02 ');
           if (DT.DirTelefax <> '') then
              SQL.Add(' ,DIR_TELEFAX = :DIR_TELEFAX ');
           if (DT.Activo <> -1) then
              SQL.Add(' ,ACTIVO = :ACTIVO ');
           {
           DirTipo := '';
           DirNumero := '';
           DirBloqueEscalera := '';
           DirPiso := '';
           DirPuerta := '';
           DirLocalidad := '';
           Provincia
           CodigoPostal
           Colonia := '';
           DirTelefax := '';
           Activo := -1;
           DirTransportista := -1;
           IdLocal:= -1;
           }
           SQL.Add(' WHERE ');
           SQL.Add(' TERCERO = :TERCERO AND ');
           SQL.Add(' DIRECCION = :DIRECCION ');

           Params.ByName['TERCERO'].AsInteger := DT.Tercero;
           Params.ByName['DIRECCION'].AsInteger := DT.Direccion;
           if (DT.DirNombre1 <> '') then
              Params.ByName['DIR_NOMBRE'].AsString := DT.DirNombre1;
           if (DT.DirNombre2 <> '') then
              Params.ByName['DIR_NOMBRE_2'].AsString := DT.DirNombre2;
           if (DT.DirNombre3 <> '') then
              Params.ByName['DIR_NOMBRE_3'].AsString := DT.DirNombre3;
           if (DT.DirDefecto <> -1) then
              Params.ByName['DIR_DEFECTO'].AsInteger := DT.DirDefecto;
           if (DT.DirLocalidad <> '') then
              Params.ByName['DIR_LOCALIDAD'].AsString := DT.DirLocalidad;
           if (DT.DirClase <> -1) then
              Params.ByName['DIR_CLASE'].AsInteger := DT.DirClase;
           if (DT.Notas <> '') then
              Params.ByName['NOTAS'].AsString := DT.Notas;
           if (DT.DirTelefono1 <> '') then
              Params.ByName['DIR_TELEFONO01'].AsString := DT.DirTelefono1;
           if (DT.DirTelefono2 <> '') then
              Params.ByName['DIR_TELEFONO02'].AsString := DT.DirTelefono2;
           if (DT.DirTelefax <> '') then
              Params.ByName['DIR_TELEFAX'].AsString := DT.DirTelefax;
           if (DT.Activo <> -1) then
              Params.ByName['ACTIVO'].AsInteger := DT.Activo;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;
end;

procedure InicializaCliente(var C: TCliente);
begin
  with C do
  begin
     Empresa := 0;
     Pais_c2 := '';
     Tarifa := '';
     Agente := 0;
     Ejercicio := 0;
     Canal := 0;
     Pais := '';
     Tipo := -1;
     Cuenta := '';
     FormaPago := '';
     CuentaDtoPP := '';
     Cliente := 0;
     Tipo := -1;
     ModoIVA := -1;
     IdCliente := 0;
     usar_anticipos := 0;
     eval_feb := 1;
     eval_feb_si := 1;
     banco_pagos := 0;
     transportista := -1;
     tipo_portes := 0;
     facturar_serie := 0;
     serie_a_facturar := '';
     albaranar_serie := 0;
     serie_a_albaranar := '';
     no_agrupar_albaranes := -1;

     InicializaTercero(Tercero);
  end;
end;

procedure CreaCliente(var C: TCliente);
var
  MaxEjercicio : integer;
  Existe : boolean;
begin
  /// Crea un Cliente con los datos del registro TCliente.
  /// Si ya existe modifica el cliente existente.

  with C do
  begin
     if (Empresa = 0) then
        Empresa := REntorno.Empresa;
     if (Ejercicio = 0) then
        Ejercicio := REntorno.Ejercicio;
     if (Canal = 0) then
        Canal := REntorno.Canal;
     if (Pais = '') then
        Pais := REntorno.Pais;
  end;

  // Si no me dan tercero, lo busco/creo.
  CreaTercero(C.Tercero);

  // Busco si existe un cliente
  Existe := False;
  if (C.Cliente = 0) then
  begin
     if (C.Tercero.Tercero <> 0) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT CLIENTE FROM EMP_CLIENTES WHERE EMPRESA = :EMPRESA AND TERCERO = :TERCERO';
              Params.ByName['EMPRESA'].AsInteger := C.Empresa;
              Params.ByName['TERCERO'].AsInteger := C.Tercero.Tercero;
              ExecQuery;
              C.Cliente := FieldByName['CLIENTE'].AsInteger;
              Existe := (C.Cliente <> 0);
              FreeHandle;
           finally
              Free;
           end;
        end;
        DMMain.Log(Format('Cliente para Tercero %d = %d', [C.Tercero.Tercero, C.Cliente]));
     end;
  end;

  if (C.Cliente <> 0) then
  begin
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'SELECT CLIENTE FROM EMP_CLIENTES WHERE EMPRESA = :EMPRESA AND CLIENTE = :CLIENTE';
           Params.ByName['EMPRESA'].AsInteger := C.Empresa;
           Params.ByName['CLIENTE'].AsInteger := C.Cliente;
           ExecQuery;
           Existe := (FieldByName['CLIENTE'].AsInteger <> 0);
           DMMain.Log(Format('Cliente existe (%d = %d)', [C.Cliente, FieldByName['CLIENTE'].AsInteger]));
           FreeHandle;
        finally
           Free;
        end;
     end;
  end;

  if (not Existe) then
  begin
     if (C.Tarifa = '') then
        C.Tarifa := REntorno.TarifaDefecto;
     if (C.Pais = '') then
        C.Pais := REntorno.Pais;
     if (C.Agente = 0) then
        C.Agente := 1;

     if (C.Cliente = 0) then
        C.Cliente := DMMain.Contador_E('XCL', C.Empresa);

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Text := 'INSERT INTO EMP_CLIENTES (EMPRESA, CLIENTE, TERCERO, PAIS_C2, TARIFA, AGENTE) VALUES (:EMPRESA, :CLIENTE, :TERCERO, :PAIS_C2, :TARIFA, :AGENTE)';
           Params.ByName['EMPRESA'].AsInteger := C.Empresa;
           Params.ByName['CLIENTE'].AsInteger := C.Cliente;
           Params.ByName['TERCERO'].AsInteger := C.Tercero.Tercero;
           Params.ByName['PAIS_C2'].AsString := DamePaisC2(C.Pais);
           Params.ByName['TARIFA'].AsString := C.Tarifa;
           Params.ByName['AGENTE'].AsInteger := C.Agente;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
     DMMain.Log(Format('Creado cliente %d', [C.Cliente]));
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := 'SELECT MAX(EJERCICIO) FROM CON_CUENTAS_GES_CLI WHERE EMPRESA = ?EMPRESA AND CANAL = ?CANAL AND CLIENTE = ?CLIENTE';
        Params.ByName['EMPRESA'].AsInteger := C.Empresa;
        Params.ByName['CANAL'].AsInteger := C.Canal;
        Params.ByName['CLIENTE'].AsInteger := C.Cliente;
        ExecQuery;
        MaxEjercicio := FieldByName['MAX'].AsInteger;
        FreeHandle;
     finally
        Free;
     end;
  end;

  DMMain.Log(Format('Cliente  %d, Existe en Ejercicio %d', [C.Cliente, MaxEjercicio]));

  // Si no existe lo creo.
  // Si existe en otro ejercicio, lo traigo a este.
  if (MaxEjercicio = 0) then
  begin
     // Creo una cuenta para el cliente
     if (C.Cuenta = '') then
     begin
        if (C.Tipo = -1) then
           C.Tipo := 1;
        C.Cuenta := ExpandirCadena(DMMain.DameSemillaCuentaGestion(SemClientes, C.Tipo) + IntToStr(C.Cliente), REntorno.DigitosSub);
     end;

     // Creo la cuenta si no existe
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' EXECUTE PROCEDURE E_CUENTAS_ALTA_GEST (:EMPRESA, :EJERCICIO, :CANAL, :CUENTA, :GESTION, :TERCERO)');
           Params.ByName['EMPRESA'].AsInteger := C.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := C.Ejercicio;
           Params.ByName['CANAL'].AsInteger := C.Canal;
           Params.ByName['CUENTA'].AsString := C.Cuenta;
           Params.ByName['GESTION'].AsInteger := 3;
           Params.ByName['TERCERO'].AsInteger := C.Tercero.Tercero;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     if (C.Pais = '') then
        C.Pais := REntorno.Pais;
     if (C.FormaPago = '') then
        C.FormaPago := LeeParametro('CLIFPAG001');
     if (C.CuentaDtoPP = '') then
        C.CuentaDtoPP := DMMain.DameCuentaGestion(15, 1);
     if (C.ModoIVA = -1) then
     begin
        with THYFIBQuery.Create(nil) do
        begin
           try
              Close;
              DataBase := DMMain.DataBase;
              SQL.Text := 'SELECT MODO_IVA FROM EMP_CANALES WHERE EMPRESA = :EMPRESA AND EJERCICIO = :EJERCICIO AND CANAL = :CANAL';
              Params.ByName['EMPRESA'].AsInteger := C.Empresa;
              Params.ByName['EJERCICIO'].AsInteger := C.Ejercicio;
              Params.ByName['CANAL'].AsInteger := C.Canal;
              ExecQuery;
              C.ModoIVA := FieldByName['MODO_IVA'].AsInteger;
              FreeHandle;
           finally
              Free;
           end;
        end;
     end;

     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' INSERT INTO CON_CUENTAS_GES_CLI ( ');
           SQL.Add('  EMPRESA, EJERCICIO, CANAL, CLIENTE, PAIS, CUENTA, FORMA_PAGO, CUENTA_DTOPP, MODO_IVA) ');
           SQL.Add(' VALUES ( ');
           SQL.Add(' :EMPRESA, :EJERCICIO, :CANAL, :CLIENTE, :PAIS, :CUENTA, :FORMA_PAGO, :CUENTA_DTOPP, :MODO_IVA) ');
           Params.ByName['EMPRESA'].AsInteger := C.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := C.Ejercicio;
           Params.ByName['CANAL'].AsInteger := C.Canal;
           Params.ByName['CLIENTE'].AsInteger := C.Cliente;
           Params.ByName['PAIS'].AsString := C.Pais;
           Params.ByName['CUENTA'].AsString := C.Cuenta;
           Params.ByName['FORMA_PAGO'].AsString := C.FormaPago;
           Params.ByName['CUENTA_DTOPP'].AsString := C.CuentaDtoPP;
           Params.ByName['MODO_IVA'].AsInteger := C.ModoIVA;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
     DMMain.Log(Format('Creado Cliente  %d', [C.Cliente]));
  end
  else
  if (MaxEjercicio <> C.Ejercicio) then
  begin
     // Copio la cuenta del ejercicio anterior
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' INSERT INTO CON_CUENTAS ( ');
           SQL.Add(' EMPRESA, EJERCICIO, CANAL, CUENTA, TITULO, SUPERIOR, NIVEL) ');
           SQL.Add(' SELECT C.EMPRESA, :EJERCICIO_DES, C.CANAL, C.CUENTA, C.TITULO, C.SUPERIOR, C.NIVEL ');
           SQL.Add(' FROM CON_CUENTAS_GES_CLI CL ');
           SQL.Add(' JOIN CON_CUENTAS C ON CL.EMPRESA = C.EMPRESA AND C.EJERCICIO = C.EJERCICIO AND CL.CANAL = C.CANAL AND CL.CUENTA = C.CUENTA ');
           SQL.Add(' WHERE ');
           SQL.Add(' CL.EMPRESA = :EMPRESA AND ');
           SQL.Add(' CL.EJERCICIO = :EJERCICIO_ORI AND ');
           SQL.Add(' CL.CANAL = :CANAL AND ');
           SQL.Add(' CL.CLIENTE = :CLIENTE AND ');
           SQL.Add(' NOT EXISTS(SELECT CUENTA ');
           SQL.Add('            FROM CON_CUENTAS ');
           SQL.Add('            WHERE ');
           SQL.Add('            EMPRESA = CL.EMPRESA AND ');
           SQL.Add('            EJERCICIO = :EJERCICIO_DES AND ');
           SQL.Add('            CANAL = CL.CANAL AND ');
           SQL.Add('            CUENTA = CL.CUENTA) ');
           Params.ByName['EMPRESA'].AsInteger := C.Empresa;
           Params.ByName['EJERCICIO_ORI'].AsInteger := MaxEjercicio;
           Params.ByName['EJERCICIO_DES'].AsInteger := C.Ejercicio;
           Params.ByName['CANAL'].AsInteger := C.Canal;
           Params.ByName['CLIENTE'].AsInteger := C.Cliente;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;

     // Copio el registro CON_CUENTAS_GES_CLI a este ejercicio
     with THYFIBQuery.Create(nil) do
     begin
        try
           Close;
           DataBase := DMMain.DataBase;
           SQL.Add(' INSERT INTO CON_CUENTAS_GES_CLI ( ');
           SQL.Add(' EMPRESA, EJERCICIO, CANAL, CLIENTE, PAIS, CUENTA, FORMA_PAGO, CUENTA_DTOPP, MODO_IVA) ');
           SQL.Add(' SELECT EMPRESA, :EJERCICIO, CANAL, CLIENTE, PAIS, CUENTA, FORMA_PAGO, CUENTA_DTOPP, MODO_IVA ');
           SQL.Add(' FROM CON_CUENTAS_GES_CLI ');
           SQL.Add(' WHERE ');
           SQL.Add(' EMPRESA = :EMPRESA AND ');
           SQL.Add(' CANAL = :CANAL AND ');
           SQL.Add(' CLIENTE = :CLIENTE ');
           SQL.Add(' ORDER BY EJERCICIO DESC ');
           Params.ByName['EMPRESA'].AsInteger := C.Empresa;
           Params.ByName['EJERCICIO'].AsInteger := C.Ejercicio;
           Params.ByName['CANAL'].AsInteger := C.Canal;
           Params.ByName['CLIENTE'].AsInteger := C.Cliente;
           ExecQuery;
           FreeHandle;
        finally
           Free;
        end;
     end;
     DMMain.Log(Format('Traspasado Cliente %d de %d', [C.Cliente, MaxEjercicio]));
  end;

  // En este punto ya existe el cliente en el ejercicio.
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE EMP_CLIENTES ');
        SQL.Add(' SET ');
        SQL.Add(' CLIENTE = :CLIENTE ');
        if (C.Tarifa <> '') then
           SQL.Add(' ,TARIFA = :TARIFA ');
        if (C.Agente <> 0) then
           SQL.Add(' ,AGENTE = :AGENTE ');
        if (C.Tipo <> -1) then
           SQL.Add(' ,TIPO = :TIPO ');
        if (C.usar_anticipos <> -1) then
           SQL.Add(' ,USAR_ANTICIPOS = :USAR_ANTICIPOS ');
        if (C.eval_feb <> -1) then
           SQL.Add(' ,EVAL_FEB = :EVAL_FEB ');
        if (C.eval_feb_si <> -1) then
           SQL.Add(' ,EVAL_FEB_SI = :EVAL_FEB_SI ');
        if (C.transportista <> -1) then
           SQL.Add(' ,TRANSPORTISTA = :TRANSPORTISTA ');
        if (C.facturar_serie <> -1) then
           SQL.Add(' ,FACTURAR_SERIE = :FACTURAR_SERIE ');
        if (C.serie_a_facturar <> '') then
           SQL.Add(' ,SERIE_A_FACTURAR = :SERIE_A_FACTURAR ');
        if (C.albaranar_serie <> -1) then
           SQL.Add(' ,ALBARANAR_SERIE = :ALBARANAR_SERIE ');
        if (C.serie_a_albaranar <> '') then
           SQL.Add(' ,SERIE_A_ALBARANAR = :SERIE_A_ALBARANAR ');
        if (C.no_agrupar_albaranes <> -1) then
           SQL.Add(' ,NO_AGRUPAR_ALBARANES = :NO_AGRUPAR_ALBARANES ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' CLIENTE = :CLIENTE ');

        Params.ByName['EMPRESA'].AsInteger := C.Empresa;
        Params.ByName['CLIENTE'].AsInteger := C.Cliente;
        if (C.Tarifa <> '') then
           Params.ByName['TARIFA'].AsString := C.Tarifa;
        if (C.Agente <> 0) then
           Params.ByName['AGENTE'].AsInteger := C.Agente;
        if (C.Tipo <> -1) then
           Params.ByName['TIPO'].AsInteger := C.Tipo;
        if (C.usar_anticipos <> -1) then
           Params.ByName['USAR_ANTICIPOS'].AsInteger := C.usar_anticipos;
        if (C.eval_feb <> -1) then
           Params.ByName['EVAL_FEB'].AsInteger := C.eval_feb;
        if (C.eval_feb_si <> -1) then
           Params.ByName['EVAL_FEB_SI'].AsInteger := C.eval_feb_si;
        if (C.transportista <> -1) then
           Params.ByName['TRANSPORTISTA'].AsInteger := C.transportista;
        if (C.facturar_serie <> -1) then
           Params.ByName['FACTURAR_SERIE'].AsInteger := C.facturar_serie;
        if (C.serie_a_facturar <> '') then
           Params.ByName['SERIE_A_FACTURAR'].AsString := C.serie_a_facturar;
        if (C.albaranar_serie <> -1) then
           Params.ByName['ALBARANAR_SERIE'].AsInteger := C.albaranar_serie;
        if (C.serie_a_albaranar <> '') then
           Params.ByName['SERIE_A_ALBARANAR'].AsString := C.serie_a_albaranar;
        if (C.no_agrupar_albaranes <> -1) then
           Params.ByName['NO_AGRUPAR_ALBARANES'].AsInteger := C.no_agrupar_albaranes;

        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE CON_CUENTAS_GES_CLI ');
        SQL.Add(' SET ');
        SQL.Add(' CLIENTE = :CLIENTE ');
        if (C.FormaPago <> '') then
           SQL.Add(' ,FORMA_PAGO = :FORMA_PAGO ');
        if (C.ModoIVA <> -1) then
           SQL.Add(' ,MODO_IVA = :MODO_IVA ');
        if (C.banco_pagos <> -1) then
           SQL.Add(' ,BANCO_PAGOS = :BANCO_PAGOS ');
        if (C.tipo_portes <> -1) then
           SQL.Add(' ,TIPO_PORTES = :TIPO_PORTES ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA AND ');
        SQL.Add(' EJERCICIO = :EJERCICIO AND ');
        SQL.Add(' CANAL = :CANAL AND ');
        SQL.Add(' CLIENTE = :CLIENTE ');

        Params.ByName['EMPRESA'].AsInteger := C.Empresa;
        Params.ByName['EJERCICIO'].AsInteger := C.Ejercicio;
        Params.ByName['CANAL'].AsInteger := C.Canal;
        Params.ByName['CLIENTE'].AsInteger := C.Cliente;
        if (C.FormaPago <> '') then
           Params.ByName['FORMA_PAGO'].AsString := C.FormaPago;
        if (C.ModoIVA <> -1) then
           Params.ByName['MODO_IVA'].AsInteger := C.ModoIVA;
        if (C.banco_pagos <> -1) then
           Params.ByName['BANCO_PAGOS'].AsInteger := C.banco_pagos;
        if (C.tipo_portes <> -1) then
           Params.ByName['TIPO_PORTES'].AsInteger := C.tipo_portes;

        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
