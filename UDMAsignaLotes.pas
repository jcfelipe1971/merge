unit UDMAsignaLotes;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, DB, FIBDataSetRO, FIBDatabase, UFIBModificados,
  FIBDataSet, HYFIBQuery, FIBTableDataSet;

type
  TDMAsignaLotes = class(TDataModule)
     TUpdate: THYTransaction;
     TLocal: THYTransaction;
     xDocumento: TFIBDataSetRO;
     DSxDocumento: TDataSource;
     xLoteAsignado: TFIBDataSetRO;
     DSxLoteAsignado: TDataSource;
     xLoteDisponible: TFIBTableSet;
     DSxLoteDisponible: TDataSource;
     xLoteAsignadoEMPRESA: TIntegerField;
     xLoteAsignadoEJERCICIO: TIntegerField;
     xLoteAsignadoCANAL: TIntegerField;
     xLoteAsignadoSERIE: TFIBStringField;
     xLoteAsignadoTIPO: TFIBStringField;
     xLoteAsignadoRIG: TIntegerField;
     xLoteAsignadoLINEA: TIntegerField;
     xLoteAsignadoLOTE: TFIBStringField;
     xLoteAsignadoN_SERIE: TFIBStringField;
     xLoteAsignadoCLASIFICACION: TFIBStringField;
     xLoteAsignadoF_FABRICACION: TDateTimeField;
     xLoteAsignadoF_ENVASADO: TDateTimeField;
     xLoteAsignadoF_CADUCIDAD: TDateTimeField;
     xLoteAsignadoCANTIDAD: TFloatField;
     xLoteAsignadoARTICULO: TFIBStringField;
     xLoteAsignadoALMACEN: TFIBStringField;
     xLoteAsignadoID_A: TIntegerField;
     xLoteAsignadoPROVEEDOR: TIntegerField;
     xLoteAsignadoID_LOTE: TIntegerField;
     xLoteAsignadoID_A_UBICACION: TIntegerField;
     xLoteAsignadoSUBLINEA: TIntegerField;
     xLoteDisponibleARTICULO: TFIBStringField;
     xLoteDisponiblePROVEEDOR: TIntegerField;
     xLoteDisponibleID_LOTE: TIntegerField;
     xLoteDisponibleLOTE: TFIBStringField;
     xLoteDisponibleSTOCK: TFloatField;
     xLoteDisponibleID_UBICACION: TIntegerField;
     xLoteDisponibleMEDIDA1: TFloatField;
     xLoteDisponibleMEDIDA2: TFloatField;
     xLoteDisponibleMEDIDA3: TFloatField;
     xLoteDisponibleMEDIDA4: TFloatField;
     xLoteDisponibleF_ENVASADO: TDateTimeField;
     xLoteDisponibleF_CADUCIDAD: TDateTimeField;
     xLoteDisponibleF_FABRICACION: TDateTimeField;
     xLoteDisponibleCLASIFICACION: TFIBStringField;
     xLoteDisponibleALMACEN: TFIBStringField;
     xLoteAsignadoID_DETALLES: TIntegerField;
     xLoteDisponibleSTOCK_VIRTUAL: TFloatField;
     xLoteDisponibleCANAL: TIntegerField;
     procedure DataModuleCreate(Sender: TObject);
     procedure xDocumentoAfterScroll(DataSet: TDataSet);
  private
     { Private declarations }
     Tipo: string;
     IdDoc: integer;
     Editable, Kriconf492, KriConf497: boolean;
     Clasificacion: string;
     procedure RefrescaLotes;
  public
     { Public declarations }
     procedure AsignaDocumento(aTipo: string; aIdDoc: integer; aEditable: boolean);
     procedure AsignaLote(Unidades: double);
     procedure QuitaLote;
     function DameLoteSiguiente(id_a: integer): string;
     function GrabaLote(Empresa, Ejercicio, Canal: smallint; Articulo, Lote, Almacen, Clasificacion: string; FFabricacion, FEnvasado, FCaducidad: TDateTime; id_a, Proveedor: integer; Notas: TStrings; Medida1, Medida2, Medida3, Medida4: double): integer;
     procedure Posiciona(id_lote: integer);
     procedure FiltraClasificacion(AClasificacion: string);
  end;

var
  DMAsignaLotes : TDMAsignaLotes;

implementation

uses UDMMain;

{$R *.dfm}

{ TDMAsignaLotes }

procedure TDMAsignaLotes.AsignaDocumento(aTipo: string; aIdDoc: integer; aEditable: boolean);
begin
  Tipo := aTipo;
  IdDoc := aIdDoc;
  Editable := aEditable;

  with xDocumento do
  begin
     Close;
     SelectSQL.Clear;
     RefreshSQL.Clear;

     // Albaranes y facturas de proveedor
     if ((Tipo = 'PEP') or (Tipo = 'ALP') or (Tipo = 'FAP')) then
     begin
        SelectSQL.Add(' /* ARTICULOS */ ');
        SelectSQL.Add(' SELECT CAST(0 AS INTEGER) ORDEN, C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG, C.ESTADO, ');
        SelectSQL.Add(' C.FECHA, P.PROVEEDOR AS COD_CLI_PRO, D.LINEA, D.ALMACEN, D.ARTICULO, D.TITULO, D.ID_A, D.UNIDADES, ');
        SelectSQL.Add(' (SELECT SUM(CANTIDAD) FROM GES_DETALLES_E_LOTES WHERE ID_DETALLES_E = D.ID_DETALLES_E AND ID_A = A.ID_A) UNIDADES_ASIGNADAS, ');
        SelectSQL.Add(' D.ID_DETALLES_E ID_DETALLES ');
        SelectSQL.Add(' FROM GES_CABECERAS_E C ');
        if (Tipo = 'PEP') then
           SelectSQL.Add(' JOIN GES_CABECERAS_E_PED P ON C.ID_E = P.ID_E ')
        else
        if (Tipo = 'ALP') then
           SelectSQL.Add(' JOIN GES_CABECERAS_E_ALB P ON C.ID_E = P.ID_E ')
        else
           SelectSQL.Add(' JOIN GES_CABECERAS_E_FAC P ON C.ID_E = P.ID_E ');
        SelectSQL.Add(' JOIN GES_DETALLES_E D ON C.ID_E = D.ID_E ');
        SelectSQL.Add(' JOIN ART_ARTICULOS A ON D.ID_A = A.ID_A ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' D.ID_DETALLES_E = :ID_DETALLES AND ');
        SelectSQL.Add(' A.LOTES = 1 ');
        SelectSQL.Add(' UNION ');
        SelectSQL.Add(' /* DETALLE DE ESCANDALLO */ ');
        SelectSQL.Add(' SELECT CAST(1 AS INTEGER) ORDEN, C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG, C.ESTADO, ');
        SelectSQL.Add(' C.FECHA, P.PROVEEDOR AS COD_CLI_PRO, D.LINEA, D.ALMACEN, E.DETALLE, A.TITULO_LARGO AS TITULO, E.ID_A_DET ID_A, (D.UNIDADES * E.CANTIDAD) UNIDADES, ');
        SelectSQL.Add(' (SELECT SUM(CANTIDAD) FROM GES_DETALLES_E_LOTES WHERE ID_DETALLES_E = D.ID_DETALLES_E AND ID_A = E.ID_A_DET) UNIDADES_ASIGNADAS, ');
        SelectSQL.Add(' D.ID_DETALLES_E ID_DETALLES ');
        SelectSQL.Add(' FROM GES_CABECERAS_E C ');
        if (Tipo = 'PEP') then
           SelectSQL.Add(' JOIN GES_CABECERAS_E_PED P ON C.ID_E = P.ID_E ')
        else
        if (Tipo = 'ALP') then
           SelectSQL.Add(' JOIN GES_CABECERAS_E_ALB P ON C.ID_E = P.ID_E ')
        else
           SelectSQL.Add(' JOIN GES_CABECERAS_E_FAC P ON C.ID_E = P.ID_E ');
        SelectSQL.Add(' JOIN GES_DETALLES_E D ON C.ID_E = D.ID_E ');
        SelectSQL.Add(' JOIN ART_ARTICULOS_ESCANDALLO E ON D.ID_A = E.ID_A ');
        SelectSQL.Add(' JOIN ART_ARTICULOS A ON E.ID_A_DET = A.ID_A ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' D.ID_DETALLES_E = :ID_DETALLES AND ');
        SelectSQL.Add(' A.LOTES = 1 ');
        SelectSQL.Add(' ORDER BY 1, 13 ');

        RefreshSQL.Add(' /* ARTICULOS */ ');
        RefreshSQL.Add(' SELECT CAST(0 AS INTEGER) ORDEN, C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG, C.ESTADO, ');
        RefreshSQL.Add(' C.FECHA, P.PROVEEDOR AS COD_CLI_PRO, D.LINEA, D.ALMACEN, D.ARTICULO, D.TITULO, D.ID_A, D.UNIDADES, ');
        RefreshSQL.Add(' (SELECT SUM(CANTIDAD) FROM GES_DETALLES_E_LOTES WHERE ID_DETALLES_E = D.ID_DETALLES_E AND ID_A = A.ID_A) UNIDADES_ASIGNADAS, ');
        RefreshSQL.Add(' D.ID_DETALLES_E ID_DETALLES ');
        RefreshSQL.Add(' FROM GES_CABECERAS_E C ');
        if (Tipo = 'PEP') then
           RefreshSQL.Add(' JOIN GES_CABECERAS_E_PED P ON C.ID_E = P.ID_E ')
        else
        if (Tipo = 'ALP') then
           RefreshSQL.Add(' JOIN GES_CABECERAS_E_ALB P ON C.ID_E = P.ID_E ')
        else
           RefreshSQL.Add(' JOIN GES_CABECERAS_E_FAC P ON C.ID_E = P.ID_E ');
        RefreshSQL.Add(' JOIN GES_DETALLES_E D ON C.ID_E = D.ID_E ');
        RefreshSQL.Add(' JOIN ART_ARTICULOS A ON D.ID_A = A.ID_A ');
        RefreshSQL.Add(' WHERE ');
        RefreshSQL.Add(' D.ID_DETALLES_E = :ID_DETALLES AND ');
        RefreshSQL.Add(' D.ID_A = :ID_A AND ');
        RefreshSQL.Add(' A.LOTES = 1 ');
        RefreshSQL.Add(' UNION ');
        RefreshSQL.Add(' /* DETALLE DE ESCANDALLO */ ');
        RefreshSQL.Add(' SELECT CAST(1 AS INTEGER) ORDEN, C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG, C.ESTADO, ');
        RefreshSQL.Add(' C.FECHA, P.PROVEEDOR AS COD_CLI_PRO, D.LINEA, D.ALMACEN, E.DETALLE, A.TITULO_LARGO AS TITULO, E.ID_A_DET ID_A, (D.UNIDADES * E.CANTIDAD) UNIDADES, ');
        RefreshSQL.Add(' (SELECT SUM(CANTIDAD) FROM GES_DETALLES_E_LOTES WHERE ID_DETALLES_E = D.ID_DETALLES_E AND ID_A = E.ID_A_DET) UNIDADES_ASIGNADAS, ');
        RefreshSQL.Add(' D.ID_DETALLES_E ID_DETALLES ');
        RefreshSQL.Add(' FROM GES_CABECERAS_E C ');
        if (Tipo = 'PEP') then
           RefreshSQL.Add(' JOIN GES_CABECERAS_E_PED P ON C.ID_E = P.ID_E ')
        else
        if (Tipo = 'ALP') then
           RefreshSQL.Add(' JOIN GES_CABECERAS_E_ALB P ON C.ID_E = P.ID_E ')
        else
           RefreshSQL.Add(' JOIN GES_CABECERAS_E_FAC P ON C.ID_E = P.ID_E ');
        RefreshSQL.Add(' JOIN GES_DETALLES_E D ON C.ID_E = D.ID_E ');
        RefreshSQL.Add(' JOIN ART_ARTICULOS_ESCANDALLO E ON D.ID_A = E.ID_A ');
        RefreshSQL.Add(' JOIN ART_ARTICULOS A ON E.ID_A_DET = A.ID_A ');
        RefreshSQL.Add(' WHERE ');
        RefreshSQL.Add(' D.ID_DETALLES_E = :ID_DETALLES AND ');
        RefreshSQL.Add(' E.ID_A_DET = :ID_A AND ');
        RefreshSQL.Add(' A.LOTES = 1 ');
        RefreshSQL.Add(' ORDER BY 1, 13 ');
     end;

     // Albaranes y facturas de cliente
     if ((Tipo = 'PEC') or (Tipo = 'ALB') or (Tipo = 'FAC')) then
     begin
        SelectSQL.Add(' SELECT CAST(0 AS INTEGER) ORDEN, C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG, C.ESTADO, ');
        SelectSQL.Add(' C.FECHA, C.CLIENTE AS COD_CLI_PRO, D.LINEA, D.ALMACEN, D.ARTICULO, D.TITULO, D.ID_A, ');
        if (Tipo = 'PEC') then
           SelectSQL.Add(' P.U_RESERVADAS UNIDADES, ')
        else
           SelectSQL.Add(' D.UNIDADES, ');
        SelectSQL.Add(' (SELECT SUM(CANTIDAD) FROM GES_DETALLES_S_LOTES WHERE ID_DETALLES_S = D.ID_DETALLES_S AND ID_A = A.ID_A) UNIDADES_ASIGNADAS, ');
        SelectSQL.Add(' D.ID_DETALLES_S ID_DETALLES ');
        SelectSQL.Add(' FROM GES_CABECERAS_S C ');
        SelectSQL.Add(' JOIN GES_DETALLES_S D ON C.ID_S = D.ID_S ');
        if (Tipo = 'PEC') then
           SelectSQL.Add(' JOIN GES_DETALLES_S_PED P ON D.ID_DETALLES_S = P.ID_DETALLES_S ');
        SelectSQL.Add(' JOIN ART_ARTICULOS A ON D.ID_A = A.ID_A ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' D.ID_DETALLES_S = :ID_DETALLES AND ');
        SelectSQL.Add(' A.LOTES = 1 ');
        SelectSQL.Add(' UNION ');
        SelectSQL.Add(' SELECT CAST(0 AS INTEGER) ORDEN, C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG, C.ESTADO, ');
        SelectSQL.Add(' C.FECHA, C.CLIENTE AS COD_CLI_PRO, D.LINEA, D.ALMACEN, E.DETALLE, A.TITULO_LARGO AS TITULO, E.ID_A_DET ID_A, ');
        if (Tipo = 'PEC') then
           SelectSQL.Add(' (P.U_RESERVADAS * E.CANTIDAD) UNIDADES, ')
        else
           SelectSQL.Add(' (D.UNIDADES * E.CANTIDAD) UNIDADES, ');
        SelectSQL.Add(' (SELECT SUM(CANTIDAD) FROM GES_DETALLES_S_LOTES WHERE ID_DETALLES_S = D.ID_DETALLES_S AND ID_A = E.ID_A_DET) UNIDADES_ASIGNADAS, ');
        SelectSQL.Add(' D.ID_DETALLES_S ID_DETALLES ');
        SelectSQL.Add(' FROM GES_CABECERAS_S C ');
        SelectSQL.Add(' JOIN GES_DETALLES_S D ON C.ID_S = D.ID_S ');
        if (Tipo = 'PEC') then
           SelectSQL.Add(' JOIN GES_DETALLES_S_PED P ON D.ID_DETALLES_S = P.ID_DETALLES_S ');
        SelectSQL.Add(' JOIN ART_ARTICULOS_ESCANDALLO E ON D.ID_A = E.ID_A ');
        SelectSQL.Add(' JOIN ART_ARTICULOS A ON E.ID_A_DET = A.ID_A ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' D.ID_DETALLES_S = :ID_DETALLES AND ');
        SelectSQL.Add(' A.LOTES = 1 ');
        SelectSQL.Add(' ORDER BY 1, 13 ');

        RefreshSQL.Add(' SELECT CAST(0 AS INTEGER) ORDEN, C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG, C.ESTADO, ');
        RefreshSQL.Add(' C.FECHA, C.CLIENTE AS COD_CLI_PRO, D.LINEA, D.ALMACEN, D.ARTICULO, D.TITULO, D.ID_A, ');
        if (Tipo = 'PEC') then
           RefreshSQL.Add(' P.U_RESERVADAS UNIDADES, ')
        else
           RefreshSQL.Add(' D.UNIDADES, ');
        RefreshSQL.Add(' (SELECT SUM(CANTIDAD) FROM GES_DETALLES_S_LOTES WHERE ID_DETALLES_S = D.ID_DETALLES_S AND ID_A = A.ID_A) UNIDADES_ASIGNADAS, ');
        RefreshSQL.Add(' D.ID_DETALLES_S ID_DETALLES ');
        RefreshSQL.Add(' FROM GES_CABECERAS_S C ');
        RefreshSQL.Add(' JOIN GES_DETALLES_S D ON C.ID_S = D.ID_S ');
        if (Tipo = 'PEC') then
           RefreshSQL.Add(' JOIN GES_DETALLES_S_PED P ON D.ID_DETALLES_S = P.ID_DETALLES_S ');
        RefreshSQL.Add(' JOIN ART_ARTICULOS A ON D.ID_A = A.ID_A ');
        RefreshSQL.Add(' WHERE ');
        RefreshSQL.Add(' D.ID_DETALLES_S = :ID_DETALLES AND ');
        RefreshSQL.Add(' D.ID_A = :ID_A AND ');
        RefreshSQL.Add(' A.LOTES = 1 ');
        RefreshSQL.Add(' UNION ');
        RefreshSQL.Add(' SELECT CAST(0 AS INTEGER) ORDEN, C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE, C.TIPO, C.RIG, C.ESTADO, ');
        RefreshSQL.Add(' C.FECHA, C.CLIENTE AS COD_CLI_PRO, D.LINEA, D.ALMACEN, E.DETALLE, A.TITULO_LARGO AS TITULO, E.ID_A_DET ID_A, ');
        if (Tipo = 'PEC') then
           RefreshSQL.Add(' (P.U_RESERVADAS * E.CANTIDAD) UNIDADES, ')
        else
           RefreshSQL.Add(' (D.UNIDADES * E.CANTIDAD) UNIDADES, ');
        RefreshSQL.Add(' (SELECT SUM(CANTIDAD) FROM GES_DETALLES_S_LOTES WHERE ID_DETALLES_S = D.ID_DETALLES_S AND ID_A = E.ID_A_DET) UNIDADES_ASIGNADAS, ');
        RefreshSQL.Add(' D.ID_DETALLES_S ID_DETALLES ');
        RefreshSQL.Add(' FROM GES_CABECERAS_S C ');
        RefreshSQL.Add(' JOIN GES_DETALLES_S D ON C.ID_S = D.ID_S ');
        if (Tipo = 'PEC') then
           RefreshSQL.Add(' JOIN GES_DETALLES_S_PED P ON D.ID_DETALLES_S = P.ID_DETALLES_S ');
        RefreshSQL.Add(' JOIN ART_ARTICULOS_ESCANDALLO E ON D.ID_A = E.ID_A ');
        RefreshSQL.Add(' JOIN ART_ARTICULOS A ON E.ID_A_DET = A.ID_A ');
        RefreshSQL.Add(' WHERE ');
        RefreshSQL.Add(' D.ID_DETALLES_S = :ID_DETALLES AND ');
        RefreshSQL.Add(' E.ID_A_DET = :ID_A AND ');
        RefreshSQL.Add(' A.LOTES = 1 ');
        RefreshSQL.Add(' ORDER BY 1, 13 ');

        DMMain.Log(SelectSQL.Text);
        DMMain.Log(RefreshSQL.Text);
     end;

     // Movimientos manuales de stock de entrada, salida y traspaso
     if ((Tipo = 'MOE') or (Tipo = 'MOS') or (Tipo = 'MOT')) then
     begin
        SelectSQL.Add(' SELECT CAST(0 AS INTEGER) ORDEN, C.EMPRESA, C.EJERCICIO, C.CANAL_ORI AS CANAL, C.SERIE, C.TIPO_OPERACION AS TIPO, C.RIG, C.ESTADO, ');
        SelectSQL.Add(' C.FECHA, CAST(-1 AS INTEGER) AS COD_CLI_PRO, D.LINEA, C.ALMACEN_ORI AS ALMACEN, D.ARTICULO, D.TITULO, D.ID_A, D.UNIDADES, ');
        SelectSQL.Add(' (SELECT SUM(CANTIDAD) FROM GES_DETALLES_ST_LOTES WHERE ID_DETALLES_ST = D.ID_DETALLES_ST AND ID_A = A.ID_A) UNIDADES_ASIGNADAS, ');
        SelectSQL.Add(' D.ID_DETALLES_ST ID_DETALLES ');
        SelectSQL.Add(' FROM GES_CABECERAS_ST C ');
        SelectSQL.Add(' JOIN GES_DETALLES_ST D ON C.ID_ST = D.ID_ST ');
        SelectSQL.Add(' JOIN ART_ARTICULOS A ON D.ID_A = A.ID_A ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' D.ID_DETALLES_ST = :ID_DETALLES AND ');
        SelectSQL.Add(' A.LOTES = 1 ');
        SelectSQL.Add(' UNION ');
        SelectSQL.Add(' SELECT CAST(1 AS INTEGER) ORDEN, C.EMPRESA, C.EJERCICIO, C.CANAL_ORI AS CANAL, C.SERIE, C.TIPO_OPERACION AS TIPO, C.RIG, C.ESTADO, ');
        SelectSQL.Add(' C.FECHA, CAST(-1 AS INTEGER) AS COD_CLI_PRO, D.LINEA, C.ALMACEN_ORI AS ALMACEN,  E.DETALLE, A.TITULO_LARGO AS TITULO, E.ID_A_DET ID_A, (D.UNIDADES * E.CANTIDAD) UNIDADES, ');
        SelectSQL.Add(' (SELECT SUM(CANTIDAD) FROM GES_DETALLES_ST_LOTES WHERE ID_DETALLES_ST = D.ID_DETALLES_ST AND ID_A = E.ID_A_DET) UNIDADES_ASIGNADAS, ');
        SelectSQL.Add(' D.ID_DETALLES_ST ID_DETALLES ');
        SelectSQL.Add(' FROM GES_CABECERAS_ST C ');
        SelectSQL.Add(' JOIN GES_DETALLES_ST D ON C.ID_ST = D.ID_ST ');
        SelectSQL.Add(' JOIN ART_ARTICULOS_ESCANDALLO E ON D.ID_A = E.ID_A ');
        SelectSQL.Add(' JOIN ART_ARTICULOS A ON E.ID_A_DET = A.ID_A ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' D.ID_DETALLES_ST = :ID_DETALLES AND ');
        SelectSQL.Add(' A.LOTES = 1 ');
        SelectSQL.Add(' ORDER BY 1, 13 ');

        RefreshSQL.Add(' SELECT CAST(0 AS INTEGER) ORDEN, C.EMPRESA, C.EJERCICIO, C.CANAL_ORI AS CANAL, C.SERIE, TIPO_OPERACION AS TIPO, C.RIG, C.ESTADO, ');
        RefreshSQL.Add(' C.FECHA, CAST(-1 AS INTEGER) AS COD_CLI_PRO, D.LINEA, C.ALMACEN_ORI AS ALMACEN, D.ARTICULO, D.TITULO, D.ID_A, D.UNIDADES, ');
        RefreshSQL.Add(' (SELECT SUM(CANTIDAD) FROM GES_DETALLES_ST_LOTES WHERE ID_DETALLES_ST = D.ID_DETALLES_ST AND ID_A = A.ID_A) UNIDADES_ASIGNADAS, ');
        RefreshSQL.Add(' D.ID_DETALLES_ST ID_DETALLES ');
        RefreshSQL.Add(' FROM GES_CABECERAS_ST C ');
        RefreshSQL.Add(' JOIN GES_DETALLES_ST D ON C.ID_ST = D.ID_ST ');
        RefreshSQL.Add(' JOIN ART_ARTICULOS A ON D.ID_A = A.ID_A ');
        RefreshSQL.Add(' WHERE ');
        RefreshSQL.Add(' D.ID_DETALLES_ST = :ID_DETALLES AND ');
        RefreshSQL.Add(' D.ID_A = :ID_A AND ');
        RefreshSQL.Add(' A.LOTES = 1 ');
        RefreshSQL.Add(' UNION ');
        RefreshSQL.Add(' SELECT CAST(1 AS INTEGER) ORDEN, C.EMPRESA, C.EJERCICIO, C.CANAL_ORI AS CANAL, C.SERIE, TIPO_OPERACION AS TIPO, C.RIG, C.ESTADO, ');
        RefreshSQL.Add(' C.FECHA, CAST(-1 AS INTEGER) AS COD_CLI_PRO, D.LINEA, C.ALMACEN_ORI AS ALMACEN,  E.DETALLE, A.TITULO_LARGO AS TITULO, E.ID_A_DET ID_A, (D.UNIDADES * E.CANTIDAD) UNIDADES, ');
        RefreshSQL.Add(' (SELECT SUM(CANTIDAD) FROM GES_DETALLES_ST_LOTES WHERE ID_DETALLES_ST = D.ID_DETALLES_ST AND ID_A = E.ID_A_DET) UNIDADES_ASIGNADAS, ');
        RefreshSQL.Add(' D.ID_DETALLES_ST ID_DETALLES ');
        RefreshSQL.Add(' FROM GES_CABECERAS_ST C ');
        RefreshSQL.Add(' JOIN GES_DETALLES_ST D ON C.ID_ST = D.ID_ST ');
        RefreshSQL.Add(' JOIN ART_ARTICULOS_ESCANDALLO E ON D.ID_A = E.ID_A ');
        RefreshSQL.Add(' JOIN ART_ARTICULOS A ON E.ID_A_DET = A.ID_A ');
        RefreshSQL.Add(' WHERE ');
        RefreshSQL.Add(' D.ID_DETALLES_ST = :ID_DETALLES AND ');
        RefreshSQL.Add(' E.ID_A_DET = :ID_A AND ');
        RefreshSQL.Add(' A.LOTES = 1 ');
        RefreshSQL.Add(' ORDER BY 1, 13 ');
     end;

     // Ordenes de produccion - Materiales
     if (Tipo = 'MAT') then
     begin
        SelectSQL.Add(' SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIES SERIE, CAST(''MAT'' AS CHAR(3)) TIPO, C.RIG_OF RIG, O.SITUACION ESTADO, ');
        SelectSQL.Add('        O.FECHA_ORD FECHA, CAST(-1 AS INTEGER) AS COD_CLI_PRO, C.LINEA_MAT LINEA, R.ALMACEN_SAL ALMACEN, ');
        SelectSQL.Add('        R.COMPONENTE ARTICULO, CAST('''' AS VARCHAR(60)) TITULO, C.ID_A, R.UNIDADES_ENVIAR UNIDADES, ');
        SelectSQL.Add('        (SELECT SUM(CANTIDAD) ');
        SelectSQL.Add('         FROM PRO_ORD_MAT_RESERVA_LOTES ');
        SelectSQL.Add('         WHERE ');
        SelectSQL.Add('         ID_ORDEN_MAT = C.ID_ORDEN_MAT AND ');
        SelectSQL.Add('         ID_RESERVA_MAT = R.ID_RESERVA_MAT) UNIDADES_ASIGNADAS, R.ID_RESERVA_MAT ID_DETALLES ');
        SelectSQL.Add(' FROM PRO_ORD_MAT C ');
        SelectSQL.Add(' JOIN PRO_ORD_MAT_RESERVA R ON C.ID_ORDEN_MAT = R.ID_ORDEN_MAT ');
        SelectSQL.Add(' /* JOIN PRO_ORD_MAT_RESERVA_LOTES L ON C.ID_ORDEN_MAT = L.ID_ORDEN_MAT */ ');
        SelectSQL.Add(' JOIN PRO_ORD O ON C.ID_ORDEN = O.ID_ORDEN ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' R.ID_RESERVA_MAT = :ID_DETALLES ');

        RefreshSQL.Text := SelectSQL.Text;
     end;

     // Ordenes de produccion - Compuesto (Lanzamiento)
     if (Tipo = 'ORD') then
     begin
        SelectSQL.Add(' SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIES SERIE, CAST(''ORD'' AS CHAR(3)) TIPO, C.RIG_OF RIG, C.SITUACION ESTADO, ');
        SelectSQL.Add('        C.FECHA_ORD FECHA, CAST(-1 AS INTEGER) AS COD_CLI_PRO, CAST(1 AS INTEGER) LINEA, C.ALMACEN_ENT ALMACEN, ');
        SelectSQL.Add('        C.COMPUESTO ARTICULO, CAST('''' AS VARCHAR(60)) TITULO, C.ID_A, C.UNI_TOTAL UNIDADES, ');
        SelectSQL.Add('        (SELECT SUM(CANTIDAD) ');
        SelectSQL.Add('         FROM PRO_ORD_LOTE ');
        SelectSQL.Add('         WHERE ');
        SelectSQL.Add('         ID_ORDEN = C.ID_ORDEN) UNIDADES_ASIGNADAS, C.ID_ORDEN ID_DETALLES ');
        SelectSQL.Add(' FROM PRO_ORD C ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' C.ID_ORDEN = :ID_DETALLES ');

        RefreshSQL.Text := SelectSQL.Text;
     end;

     // Ordenes de produccion - Compuesto (Reserva)
     if (Tipo = 'COM') then
     begin
        SelectSQL.Add(' SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIES SERIE, CAST(''COM'' AS CHAR(3)) TIPO, C.RIG_OF RIG, C.SITUACION ESTADO, ');
        SelectSQL.Add('        C.FECHA_ORD FECHA, CAST(-1 AS INTEGER) AS COD_CLI_PRO, 0 LINEA, R.ALMACEN_SAL ALMACEN, ');
        SelectSQL.Add('        R.COMPUESTO ARTICULO, CAST('''' AS VARCHAR(60)) TITULO, C.ID_A, R.UNIDADES, ');
        SelectSQL.Add('        (SELECT SUM(CANTIDAD) ');
        SelectSQL.Add('         FROM PRO_ORD_RESERVA_LOTE ');
        SelectSQL.Add('         WHERE ');
        SelectSQL.Add('         ID_ORDEN = C.ID_ORDEN AND ');
        SelectSQL.Add('         ID_RESERVA = R.ID_RESERVA) UNIDADES_ASIGNADAS, R.ID_RESERVA ID_DETALLES ');
        SelectSQL.Add(' FROM PRO_ORD C ');
        SelectSQL.Add(' JOIN PRO_ORD_RESERVA R ON C.ID_ORDEN = R.ID_ORDEN ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' R.ID_RESERVA = :ID_DETALLES ');

        RefreshSQL.Text := SelectSQL.Text;
     end;

     // Ordenes de produccion - Cierres parciales Componentes
     if (Tipo = 'PCP') then
     begin
        SelectSQL.Add(' SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE SERIE, CAST(''PCP'' AS CHAR(3)) TIPO, C.CIERRE RIG, C.ESTADO, ');
        SelectSQL.Add('        O.FECHA_CREACION FECHA, CAST(-1 AS INTEGER) AS COD_CLI_PRO, C.SUB_LINEA_COMPONENTE LINEA, C.ALM_DEST ALMACEN, ');
        SelectSQL.Add('        C.ARTICULO, CAST('''' AS VARCHAR(60)) TITULO, ');
        SelectSQL.Add('        (SELECT ID_A ');
        SelectSQL.Add('         FROM ART_ARTICULOS ');
        SelectSQL.Add('         WHERE ');
        SelectSQL.Add('         EMPRESA = C.EMPRESA AND ');
        SelectSQL.Add('         ARTICULO = C.ARTICULO) ID_A, C.UNIDADES_REALES AS UNIDADES, ');
        SelectSQL.Add('        (SELECT SUM(CANTIDAD) ');
        SelectSQL.Add('         FROM PRO_ORD_CIE_PAR_DET_C_LOT ');
        SelectSQL.Add('         WHERE ');
        SelectSQL.Add('         ID_CIERRE_PAR_DET_COM = C.ID) UNIDADES_ASIGNADAS, ');
        SelectSQL.Add(' C.ID ID_DETALLES ');
        SelectSQL.Add(' FROM PRO_ORD_CIERRE_PARCIAL_DET_COM C ');
        SelectSQL.Add(' JOIN PRO_ORD_CIERRE_PARCIAL O ON C.ID_CIERRE = O.ID ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' C.ID = :ID_DETALLES ');

        RefreshSQL.Add(' SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE SERIE, CAST(''PCP'' AS CHAR(3)) TIPO, C.CIERRE RIG, C.ESTADO, ');
        RefreshSQL.Add('        O.FECHA_CREACION FECHA, CAST(-1 AS INTEGER) AS COD_CLI_PRO, C.SUB_LINEA_COMPONENTE LINEA, C.ALM_DEST ALMACEN, ');
        RefreshSQL.Add('        C.ARTICULO, CAST('''' AS VARCHAR(60)) TITULO, ');
        RefreshSQL.Add('        (SELECT ID_A ');
        RefreshSQL.Add('         FROM ART_ARTICULOS ');
        RefreshSQL.Add('         WHERE ');
        RefreshSQL.Add('         EMPRESA = C.EMPRESA AND ');
        RefreshSQL.Add('         ARTICULO = C.ARTICULO) ID_A, C.UNIDADES_REALES AS UNIDADES, ');
        RefreshSQL.Add('        (SELECT SUM(CANTIDAD) ');
        RefreshSQL.Add('         FROM PRO_ORD_CIE_PAR_DET_C_LOT ');
        RefreshSQL.Add('         WHERE ');
        RefreshSQL.Add('         ID_CIERRE_PAR_DET_COM = C.ID) UNIDADES_ASIGNADAS, ');
        RefreshSQL.Add(' C.ID ID_DETALLES ');
        RefreshSQL.Add(' FROM PRO_ORD_CIERRE_PARCIAL_DET_COM C ');
        RefreshSQL.Add(' JOIN PRO_ORD_CIERRE_PARCIAL O ON C.ID_CIERRE = O.ID ');
        RefreshSQL.Add(' WHERE ');
        RefreshSQL.Add(' C.ID = :ID_DETALLES ');
     end;

     if (Tipo = 'PCD') then
     begin
        SelectSQL.Add(' SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE SERIE, CAST(''PCP'' AS CHAR(3)) TIPO, C.CIERRE RIG, C.ESTADO, ');
        SelectSQL.Add('        O.FECHA_CREACION FECHA, CAST(-1 AS INTEGER) AS COD_CLI_PRO, C.SUB_LINEA_COMPONENTE LINEA, C.ALM_DEST ALMACEN, C.ID_CIERRE, ');
        SelectSQL.Add('        C.ARTICULO, CAST('''' AS VARCHAR(60)) TITULO, ');
        SelectSQL.Add('        (SELECT ID_A ');
        SelectSQL.Add('         FROM ART_ARTICULOS ');
        SelectSQL.Add('         WHERE ');
        SelectSQL.Add('         EMPRESA = C.EMPRESA AND ');
        SelectSQL.Add('         ARTICULO = C.ARTICULO) ID_A, C.UNIDADES_DEVOLVER UNIDADES, ');
        SelectSQL.Add('        (SELECT SUM(CANTIDAD) ');
        SelectSQL.Add('         FROM PRO_ORD_CIE_PAR_DET_C_LOT_DEV ');
        SelectSQL.Add('         WHERE ');
        SelectSQL.Add('         ID_CIERRE_PAR_DET_COM = C.ID) UNIDADES_ASIGNADAS, ');
        SelectSQL.Add(' C.ID ID_DETALLES ');
        SelectSQL.Add(' FROM PRO_ORD_CIERRE_PARCIAL_DET_COM C ');
        SelectSQL.Add(' JOIN PRO_ORD_CIERRE_PARCIAL O ON C.ID_CIERRE = O.ID ');
        SelectSQL.Add(' WHERE ');
        SelectSQL.Add(' C.ID = :ID_DETALLES ');

        RefreshSQL.Add(' SELECT C.EMPRESA, C.EJERCICIO, C.CANAL, C.SERIE SERIE, CAST(''PCP'' AS CHAR(3)) TIPO, C.CIERRE RIG, C.ESTADO, ');
        RefreshSQL.Add('        O.FECHA_CREACION FECHA, CAST(-1 AS INTEGER) AS COD_CLI_PRO, C.SUB_LINEA_COMPONENTE LINEA, C.ALM_DEST ALMACEN, C.ID_CIERRE, ');
        RefreshSQL.Add('        C.ARTICULO, CAST('''' AS VARCHAR(60)) TITULO, ');
        RefreshSQL.Add('        (SELECT ID_A ');
        RefreshSQL.Add('         FROM ART_ARTICULOS ');
        RefreshSQL.Add('         WHERE ');
        RefreshSQL.Add('         EMPRESA = C.EMPRESA AND ');
        RefreshSQL.Add('         ARTICULO = C.ARTICULO) ID_A, C.UNIDADES_DEVOLVER UNIDADES, ');
        RefreshSQL.Add('        (SELECT SUM(CANTIDAD) ');
        RefreshSQL.Add('         FROM PRO_ORD_CIE_PAR_DET_C_LOT_DEV ');
        RefreshSQL.Add('         WHERE ');
        RefreshSQL.Add('         ID_CIERRE_PAR_DET_COM = C.ID) UNIDADES_ASIGNADAS, ');
        RefreshSQL.Add(' C.ID ID_DETALLES ');
        RefreshSQL.Add(' FROM PRO_ORD_CIERRE_PARCIAL_DET_COM C ');
        RefreshSQL.Add(' JOIN PRO_ORD_CIERRE_PARCIAL O ON C.ID_CIERRE = O.ID ');
        RefreshSQL.Add(' WHERE ');
        RefreshSQL.Add(' C.ID = :ID_DETALLES ');
     end;

     Params.ByName['ID_DETALLES'].AsInteger := IdDoc;
     Open;
  end;

  RefrescaLotes;
end;

procedure TDMAsignaLotes.RefrescaLotes;
begin
  with xLoteAsignado do
  begin
     DisableControls;
     try
        Close;
        SelectSQL.Clear;
        if ((Tipo = 'PEP') or (Tipo = 'ALP') or (Tipo = 'FAP')) then
        begin
           SelectSQL.Add(' SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, LOTE, N_SERIE, CLASIFICACION, F_FABRICACION, F_ENVASADO, ');
           SelectSQL.Add('        F_CADUCIDAD, CANTIDAD, ARTICULO, ALMACEN, ID_DETALLES_E AS ID_DETALLES, ID_A, PROVEEDOR, ID_LOTE, ID_A_UBICACION, SUBLINEA ');
           SelectSQL.Add(' FROM GES_DETALLES_E_LOTES ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' ID_DETALLES_E = :ID_DETALLES AND ');
           SelectSQL.Add(' ID_A = :ID_A ');
           SelectSQL.Add(' ORDER BY SUBLINEA ');
        end;

        if ((Tipo = 'PEC') or (Tipo = 'ALB') or (Tipo = 'FAC')) then
        begin
           SelectSQL.Add(' SELECT EMPRESA, EJERCICIO, CANAL, SERIE, TIPO, RIG, LINEA, LOTE, N_SERIE, CLASIFICACION, F_FABRICACION, F_ENVASADO, ');
           SelectSQL.Add('        F_CADUCIDAD, CANTIDAD, ARTICULO, ALMACEN, ID_DETALLES_S AS ID_DETALLES, ID_A, PROVEEDOR, ID_LOTE, ID_A_UBICACION, SUBLINEA ');
           SelectSQL.Add(' FROM GES_DETALLES_S_LOTES ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' ID_DETALLES_S = :ID_DETALLES AND ');
           SelectSQL.Add(' ID_A = :ID_A ');
           SelectSQL.Add(' ORDER BY SUBLINEA ');
        end;

        if ((Tipo = 'MOE') or (Tipo = 'MOS') or (Tipo = 'MOT')) then
        begin
           SelectSQL.Add(' SELECT EMPRESA, EJERCICIO, CANAL_ORI AS CANAL, SERIE, CAST('''' AS VARCHAR(3)) AS TIPO, RIG, LINEA, LOTE, N_SERIE, CLASIFICACION, F_FABRICACION, F_ENVASADO, ');
           SelectSQL.Add('        F_CADUCIDAD, CANTIDAD, ARTICULO, ALMACEN_ORI AS ALMACEN, ID_DETALLES_ST AS ID_DETALLES, ID_A, PROVEEDOR, ID_LOTE, ID_A_UBICACION_E AS ID_A_UBICACION, SUBLINEA ');
           SelectSQL.Add(' FROM GES_DETALLES_ST_LOTES ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' ID_DETALLES_ST = :ID_DETALLES AND ');
           SelectSQL.Add(' ID_A = :ID_A ');
           SelectSQL.Add(' ORDER BY SUBLINEA ');
        end;

        if (Tipo = 'MAT') then
        begin
           SelectSQL.Add(' SELECT EMPRESA, EJERCICIO, CANAL, SERIE, CAST(''MAT'' AS VARCHAR(3)) AS TIPO, RIG_OF RIG, LINEA_MAT LINEA, LOTE, N_SERIE, CLASIFICACION, F_FABRICACION, F_ENVASADO, ');
           SelectSQL.Add('        F_CADUCIDAD, CANTIDAD, ARTICULO, ALMACEN, ID_RESERVA_MAT AS ID_DETALLES, ID_A, PROVEEDOR, ID_LOTE, CAST(-1 as integer) AS ID_A_UBICACION, SUBLINEA ');
           SelectSQL.Add(' FROM PRO_ORD_MAT_RESERVA_LOTES ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' ID_RESERVA_MAT = :ID_DETALLES AND ');
           SelectSQL.Add(' ID_A = :ID_A ');
           SelectSQL.Add(' ORDER BY SUBLINEA ');
        end;

        if (Tipo = 'ORD') then
        begin
           SelectSQL.Add(' SELECT L.EMPRESA, L.EJERCICIO, L.CANAL, L.SERIE, CAST(''ORD'' AS VARCHAR(3)) AS TIPO, L.RIG_OF RIG, ');
           SelectSQL.Add('        CAST(1 AS INTEGER) LINEA, LL.LOTE, CAST('''' AS VARCHAR(10)) N_SERIE, LL.CLASIFICACION, LL.F_FABRICACION, ');
           SelectSQL.Add('        LL.F_ENVASADO, LL.F_CADUCIDAD, L.CANTIDAD, A.ARTICULO, O.ALMACEN_ENT ALMACEN, L.ID_ORDEN AS ID_DETALLES, A.ID_A, ');
           SelectSQL.Add('        CAST(-1 AS INTEGER) PROVEEDOR, L.ID_LOTE, CAST(-1 AS INTEGER) AS ID_A_UBICACION, L.SUBLINEA ');
           SelectSQL.Add(' FROM PRO_ORD_LOTE L ');
           SelectSQL.Add(' JOIN PRO_ORD O ON L.ID_ORDEN = O.ID_ORDEN ');
           SelectSQL.Add(' JOIN ART_ARTICULOS A ON L.EMPRESA = O.EMPRESA AND O.COMPUESTO = A.ARTICULO ');
           SelectSQL.Add(' JOIN ART_ARTICULOS_LOTES LL ON L.ID_LOTE = LL.ID_LOTE ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' L.ID_ORDEN = :ID_DETALLES AND ');
           SelectSQL.Add(' A.ID_A = :ID_A ');
           SelectSQL.Add(' ORDER BY L.SUBLINEA ');

           RefreshSQL.Text := SelectSQL.Text;
        end;
        if (Tipo = 'COM') then
        begin
           SelectSQL.Add(' SELECT L.EMPRESA, L.EJERCICIO, L.CANAL, L.SERIE, CAST(''COM'' AS VARCHAR(3)) AS TIPO, L.RIG_OF RIG, L.LINEA_RES LINEA, ');
           SelectSQL.Add('        LL.LOTE, CAST('''' AS VARCHAR(10)) N_SERIE, LL.CLASIFICACION, LL.F_FABRICACION, LL.F_ENVASADO, LL.F_CADUCIDAD, ');
           SelectSQL.Add('        L.CANTIDAD, R.COMPUESTO ARTICULO, R.ALMACEN_SAL ALMACEN, ID_RESERVA AS ID_DETALLES, A.ID_A, LL.PROVEEDOR, ');
           SelectSQL.Add('        L.ID_LOTE, CAST(-1 AS INTEGER) AS ID_A_UBICACION, L.SUBLINEA ');
           SelectSQL.Add(' FROM PRO_ORD_RESERVA_LOTE L ');
           SelectSQL.Add(' JOIN PRO_ORD_RESERVA R ON L.ID_RESERVA = R.ID_RESERVA ');
           SelectSQL.Add(' JOIN ART_ARTICULOS A ON R.EMPRESA = A.EMPRESA AND R.COMPUESTO = A.ARTICULO ');
           SelectSQL.Add(' JOIN ART_ARTICULOS_LOTES LL ON L.ID_LOTE = LL.ID_LOTE ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' L.ID_RESERVA = :ID_DETALLES AND ');
           SelectSQL.Add(' A.ID_A = :ID_A ');
           SelectSQL.Add(' ORDER BY L.SUBLINEA ');
        end;

        if (Tipo = 'PCP') then
        begin
           SelectSQL.Add(' SELECT EMPRESA, EJERCICIO, CANAL, SERIE, CAST(''PCP'' AS VARCHAR(3)) AS TIPO, CIERRE RIG, SUB_LINEA_COMPONENTE LINEA, ');
           SelectSQL.Add('        LOTE, N_SERIE, CLASIFICACION, F_FABRICACION, F_ENVASADO, F_CADUCIDAD, CANTIDAD, ARTICULO, ALMACEN, ');
           SelectSQL.Add('        ID_CIERRE_PAR_DET_COM AS ID_DETALLES, ID_A, PROVEEDOR, ID_LOTE, CAST(-1 AS INTEGER) AS ID_A_UBICACION, SUBLINEA ');
           SelectSQL.Add(' FROM PRO_ORD_CIE_PAR_DET_C_LOT ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' ID_CIERRE_PAR_DET_COM = :ID_DETALLES AND ');
           SelectSQL.Add(' ID_A = :ID_A ');
           SelectSQL.Add(' ORDER BY SUBLINEA ');
        end;

        if (Tipo = 'PCD') then
        begin
           SelectSQL.Add(' SELECT EMPRESA, EJERCICIO, CANAL, SERIE, CAST(''PCP'' AS VARCHAR(3)) AS TIPO, CIERRE RIG, SUB_LINEA_COMPONENTE LINEA, ');
           SelectSQL.Add('        LOTE, N_SERIE, CLASIFICACION, F_FABRICACION, F_ENVASADO, F_CADUCIDAD, CANTIDAD, ARTICULO, ALMACEN, ');
           SelectSQL.Add('        ID_CIERRE_PAR_DET_COM AS ID_DETALLES, ID_A, PROVEEDOR, ID_LOTE, CAST(-1 AS INTEGER) AS ID_A_UBICACION, SUBLINEA ');
           SelectSQL.Add(' FROM PRO_ORD_CIE_PAR_DET_C_LOT_DEV ');
           SelectSQL.Add(' WHERE ');
           SelectSQL.Add(' ID_CIERRE_PAR_DET_COM = :ID_DETALLES AND ');
           SelectSQL.Add(' ID_A = :ID_A ');
           SelectSQL.Add(' ORDER BY SUBLINEA ');
        end;

        // Por DataSource
        // Params.ByName['ID_DETALLES'].AsInteger := IdDoc;
        Open;
     finally
        EnableControls;
     end;
  end;

  with xLoteDisponible do
  begin
     DisableControls;
     try
        Close;
        SelectSQL.Clear;
        // Entradas
        // STOCK_VIRTUAL es STOCK - UDS EN RESERVA - UDS EN AGRUPACION DE PEDIDOS DE VENTA
        SelectSQL.Add(' SELECT AASL.ARTICULO, AASL.PROVEEDOR, AASL.ID_LOTE, AASL.LOTE, AASL.STOCK, AASL.CANAL, ');
        SelectSQL.Add(' STOCK ');
        SelectSQL.Add(' - COALESCE((SELECT SUM(MRL.CANTIDAD) ');
        SelectSQL.Add('                   FROM PRO_ORD_MAT_RESERVA_LOTES MRL ');
        SelectSQL.Add('                   JOIN PRO_ORD_RESERVA POR ON (MRL.ID_RESERVA = POR.ID_RESERVA) ');
        SelectSQL.Add('                   WHERE ');
        SelectSQL.Add('                   POR.ESTADO = 0 AND ');
        SelectSQL.Add('                   MRL.ID_RESERVA = POR.ID_RESERVA AND ');
        SelectSQL.Add('                   MRL.ID_A = AASL.ID_A AND ');
        SelectSQL.Add('                   MRL.ID_LOTE = AASL.ID_LOTE), 0) ');
        SelectSQL.Add(' - COALESCE((SELECT SUM(CANTIDAD) ');
        SelectSQL.Add('             FROM GES_DETALLES_S_LOTES ');
        SelectSQL.Add('             WHERE ');
        SelectSQL.Add('             TIPO = ''PEC'' AND ');
        SelectSQL.Add('             ID_A = AASL.ID_A AND ');
        SelectSQL.Add('             ID_LOTE = AASL.ID_LOTE), 0) AS STOCK_VIRTUAL, ');
        SelectSQL.Add(' AASL.ID_UBICACION, AASL.MEDIDA1, AASL.MEDIDA2, AASL.MEDIDA3, AASL.MEDIDA4, AASL.F_ENVASADO, ');
        SelectSQL.Add(' AASL.F_CADUCIDAD, AASL.F_FABRICACION, AASL.CLASIFICACION, AASL.ALMACEN ');
        SelectSQL.Add(' FROM A_ART_STOCK_LOTE(:EMPRESA, :ARTICULO, :CANAL, :ALMACEN, :ID_A_UBICACION) AASL ');

        {
     SelectSQL.Add(' SELECT ARTICULO, PROVEEDOR, ID_LOTE, LOTE, STOCK, ID_UBICACION, MEDIDA1, MEDIDA2, MEDIDA3, MEDIDA4, F_ENVASADO, ');
     SelectSQL.Add(' F_CADUCIDAD, F_FABRICACION, CLASIFICACION, ALMACEN ');
     SelectSQL.Add(' FROM A_ART_STOCK_LOTE(:EMPRESA, :ARTICULO, :CANAL, :ALMACEN, :ID_A_UBICACION) ');
     }

        // Salidas - Solo los que tienen stock
        if ((Tipo = 'PEC') or (Tipo = 'ALB') or (Tipo = 'FAC') or (Tipo = 'MOS') or (Tipo = 'MOT') or (Tipo = 'MAT') or (Tipo = 'PCP')) then
        begin
           if (xDocumento.FieldByName('UNIDADES').AsFloat > 0) then
           begin
              SelectSQL.Add(' WHERE STOCK > 0 ');
              if (Clasificacion > '') then
                 SelectSQL.Add(' AND UPPER(CLASIFICACION) LIKE ''%' + Clasificacion + '%'' ');
           end
           else
           if (Clasificacion > '') then
              SelectSQL.Add(' WHERE UPPER(CLASIFICACION) LIKE ''%' + Clasificacion + '%'' ');
        end;

        if (Tipo = 'PCD') then
        begin
           if (xDocumento.FieldByName('UNIDADES').AsFloat > 0) then
           begin
              SelectSQL.Add(' WHERE STOCK > 0 ');
              SelectSQL.Add(' AND ID_LOTE IN (SELECT ID_LOTE ');
              SelectSQL.Add('                 FROM PRO_ORD_MAT_RESERVA_LOTES ');
              SelectSQL.Add('                 WHERE ');
              SelectSQL.Add('                 ID_RESERVA = (SELECT FIRST 1 ID_RESERVA ');
              SelectSQL.Add('                               FROM PRO_ORD_CIERRE_PARCIAL_DET_LOTE ');
              SelectSQL.Add('                               WHERE ');
              SelectSQL.Add('                               ID_CIERRE = :ID_CIERRE) AND ');
              SelectSQL.Add('                 ARTICULO = :ARTICULO) ');
              if (Clasificacion > '') then
                 SelectSQL.Add(' AND UPPER(CLASIFICACION) LIKE ''%' + Clasificacion + '%'' ');
           end
           else
           if (Clasificacion > '') then
              SelectSQL.Add(' WHERE UPPER(CLASIFICACION) LIKE ''%' + Clasificacion + '%'' ');
        end
        else
        begin
           if (Clasificacion > '') then
              SelectSQL.Add(' WHERE UPPER(CLASIFICACION) LIKE ''%' + Clasificacion + '%'' ');
        end;

        SelectSQL.Add(' ORDER BY F_CADUCIDAD DESC, ID_LOTE ');

        Params.ByName['EMPRESA'].AsInteger := xDocumento.FieldByName('EMPRESA').AsInteger;
        Params.ByName['ARTICULO'].AsString := xDocumento.FieldByName('ARTICULO').AsString;
        Params.ByName['CANAL'].AsInteger := xDocumento.FieldByName('CANAL').AsInteger;

        // Muestra los lotes de todos los almacenes para asignar a documentos
        if ((KriConf492 or (KriConf497 and (xDocumento.FieldByName('SERIE').AsString = 'A'))) and (Tipo <> 'MOE') and (Tipo <> 'MOS') and (Tipo <> 'MOT')) then
           Params.ByName['ALMACEN'].AsString := '   '
        else
        begin
           Params.ByName['ALMACEN'].AsString := xDocumento.FieldByName('ALMACEN').AsString;
        end;
        Params.ByName['ID_A_UBICACION'].AsInteger := -1;
        if (Tipo = 'PCD') then
        begin
           Params.ByName['ID_CIERRE'].AsInteger := xDocumento.FieldByName('ID_CIERRE').AsInteger;
        end;
        Open;
     finally
        EnableControls;
     end;
  end;

  if (xDocumento.Active) and (xDocumento.FieldByName('ID_A').AsInteger <> 0) then
     xDocumento.Refresh;
end;

procedure TDMAsignaLotes.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE

  if (not TLocal.InTransaction) then
     TLocal.StartTransaction;

  // Mostrar los lotes de todos los almacenes
  Kriconf492 := (DMMain.EstadoKri(492) = 1);
  KriConf497 := (DMMain.EstadoKri(497) = 1);
  Clasificacion := '';
end;

procedure TDMAsignaLotes.AsignaLote(Unidades: double);
begin
  /// Asigna el lote del registro actual a la linea de documento

  // Si estamos vendiendo no puedo asignar mas unidades de las que hay en stock
  if ((Tipo = 'PEC') or (Tipo = 'ALB') or (Tipo = 'FAC') or (Tipo = 'MOS') or (Tipo = 'MOT') or (Tipo = 'MAT') or (Tipo = 'PCP') or (Tipo = 'PCD')) then
  begin
     if (xDocumento.FieldByName('UNIDADES').AsFloat > 0) then
        if (Unidades > xLoteDisponibleSTOCK.AsFloat) then
           Unidades := xLoteDisponibleSTOCK.AsFloat;
  end;

  with THYFIBQuery.Create(Self) do
  begin
     try
        Database := DMMain.DataBase;
        Close;
        SQL.Text := 'EXECUTE PROCEDURE G_ASIGNA_LOTE(:TIPO, :ID_DOC, :ID_LOTE, :CANTIDAD, :ALMACEN)';
        Params.ByName['TIPO'].AsString := Tipo;
        Params.ByName['ID_DOC'].AsInteger := IdDoc;
        Params.ByName['ID_LOTE'].AsInteger := xLoteDisponibleID_LOTE.AsInteger;
        Params.ByName['CANTIDAD'].AsFloat := Unidades;
        if (KriConf492 or (KriConf497 and (xDocumento.FieldByName('SERIE').AsString = 'A'))) then
           Params.ByName['ALMACEN'].AsString := xLoteDisponibleALMACEN.AsString
        else
           Params.ByName['ALMACEN'].AsString := '   ';
        ExecQuery;
        Close;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescaLotes;
end;

procedure TDMAsignaLotes.QuitaLote;
begin
  /// Quita el lote del registro actual de la linea de documento

  with THYFIBQuery.Create(Self) do
  begin
     try
        Database := DMMain.DataBase;
        Close;
        if ((Tipo = 'PEP') or (Tipo = 'ALP') or (Tipo = 'FAP')) then
           SQL.Text := ' DELETE FROM GES_DETALLES_E_LOTES WHERE ID_DETALLES_E = :ID_DETALLES AND SUBLINEA = :SUBLINEA ';
        if ((Tipo = 'PEC') or (Tipo = 'ALB') or (Tipo = 'FAC')) then
           SQL.Text := ' DELETE FROM GES_DETALLES_S_LOTES WHERE ID_DETALLES_S = :ID_DETALLES AND SUBLINEA = :SUBLINEA ';
        if ((Tipo = 'MOE') or (Tipo = 'MOS') or (Tipo = 'MOT')) then
           SQL.Text := ' DELETE FROM GES_DETALLES_ST_LOTES WHERE ID_DETALLES_ST = :ID_DETALLES AND SUBLINEA = :SUBLINEA ';
        if (Tipo = 'MAT') then
           SQL.Text := ' DELETE FROM PRO_ORD_MAT_RESERVA_LOTES WHERE ID_RESERVA_MAT = :ID_DETALLES AND SUBLINEA = :SUBLINEA ';
        if (Tipo = 'ORD') then
           SQL.Text := ' DELETE FROM PRO_ORD_LOTE WHERE ID_ORDEN = :ID_DETALLES AND SUBLINEA = :SUBLINEA ';
        if (Tipo = 'COM') then
           SQL.Text := ' DELETE FROM PRO_ORD_RESERVA_LOTE WHERE ID_RESERVA = :ID_DETALLES AND SUBLINEA = :SUBLINEA ';
        if (Tipo = 'PCP') then
           SQL.Text := ' DELETE FROM PRO_ORD_CIE_PAR_DET_C_LOT WHERE ID_CIERRE_PAR_DET_COM = :ID_DETALLES AND SUBLINEA = :SUBLINEA ';
        if (Tipo = 'PCD') then
           SQL.Text := ' DELETE FROM PRO_ORD_CIE_PAR_DET_C_LOT_DEV WHERE ID_CIERRE_PAR_DET_COM = :ID_DETALLES AND SUBLINEA = :SUBLINEA ';
        Params.ByName['ID_DETALLES'].AsInteger := xLoteAsignadoID_DETALLES.AsInteger;
        Params.ByName['SUBLINEA'].AsInteger := xLoteAsignadoSUBLINEA.AsInteger;
        ExecQuery;
        Close;
        FreeHandle;
     finally
        Free;
     end;
  end;

  RefrescaLotes;
end;

function TDMAsignaLotes.DameLoteSiguiente(id_a: integer): string;
begin
  Result := DMMain.DameLoteSiguiente(id_a, xDocumento.FieldByName('RIG').AsInteger, Tipo);
end;

function TDMAsignaLotes.GrabaLote(Empresa, Ejercicio, Canal: smallint; Articulo, Lote, Almacen, Clasificacion: string; FFabricacion, FEnvasado, FCaducidad: TDateTime; id_a, Proveedor: integer; Notas: TStrings; Medida1, Medida2, Medida3, Medida4: double): integer;
var
  id_lote : integer;
begin
  // Generar el id_lote
  id_lote := DMMain.ContadorGen('ID_LOTES');

  // Insertar el lote
  with THYFIBQuery.Create(nil) do
  begin
     try
        Database := DMMain.DataBase;
        SQL.Add(' INSERT INTO ART_ARTICULOS_LOTES ( ');
        SQL.Add(' EMPRESA, CANAL, ALMACEN, ARTICULO, LOTE, CLASIFICACION, F_ENVASADO, F_CADUCIDAD, F_FABRICACION, ID_A, PROVEEDOR, ');
        SQL.Add(' ID_LOTE, NOTAS, MEDIDA_1, MEDIDA_2, MEDIDA_3, MEDIDA_4, CODIGO) ');
        SQL.Add(' VALUES ( ');
        SQL.Add(' :EMPRESA, :CANAL, :ALMACEN, :ARTICULO, :LOTE, :CLASIFICACION, :F_ENVASADO, :F_CADUCIDAD, :F_FABRICACION, :ID_A, ');
        SQL.Add(' :PROVEEDOR, :ID_LOTE, :NOTAS, :MEDIDA_1, :MEDIDA_2, :MEDIDA_3, :MEDIDA_4, :CODIGO) ');
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['CANAL'].AsInteger := Canal;
        Params.ByName['ALMACEN'].AsString := Almacen;
        Params.ByName['ARTICULO'].AsString := Articulo;
        Params.ByName['LOTE'].AsString := Lote;
        Params.ByName['CLASIFICACION'].AsString := Clasificacion;
        Params.ByName['F_ENVASADO'].AsDateTime := FEnvasado;
        Params.ByName['F_CADUCIDAD'].AsDateTime := FCaducidad;
        Params.ByName['F_FABRICACION'].AsDateTime := FFabricacion;
        Params.ByName['ID_A'].AsInteger := id_a;
        Params.ByName['PROVEEDOR'].AsInteger := Proveedor;
        Params.ByName['ID_LOTE'].AsInteger := id_lote;
        Params.ByName['MEDIDA_1'].AsFloat := Medida1;
        Params.ByName['MEDIDA_2'].AsFloat := Medida2;
        Params.ByName['MEDIDA_3'].AsFloat := Medida3;
        Params.ByName['MEDIDA_4'].AsFloat := Medida4;
        Params.ByName['CODIGO'].AsInteger := StrToIntDef(Lote, 0);
        ExecQuery;
        FreeHandle;
     finally
        Free;
     end;
  end;

  Result := id_lote;
end;

procedure TDMAsignaLotes.Posiciona(id_lote: integer);
begin
  with xLoteDisponible do
  begin
     try
        DisableControls;
        Close;

        Params.ByName['EMPRESA'].AsInteger := xDocumento.FieldByName('EMPRESA').AsInteger;
        Params.ByName['ARTICULO'].AsString := xDocumento.FieldByName('ARTICULO').AsString;
        Params.ByName['CANAL'].AsInteger := xDocumento.FieldByName('CANAL').AsInteger;

        // Muestra los lotes de todos los almacenes para asignar a documentos
        if ((KriConf492 or (KriConf497 and (xDocumento.FieldByName('SERIE').AsString = 'A'))) and (Tipo <> 'MOE') and (Tipo <> 'MOS') and (Tipo <> 'MOT')) then
           Params.ByName['ALMACEN'].AsString := '   '
        else
           Params.ByName['ALMACEN'].AsString := xDocumento.FieldByName('ALMACEN').AsString;

        Params.ByName['ID_A_UBICACION'].AsInteger := -1;

        Open;
        while ((not EOF) and (FieldByName('ID_LOTE').AsInteger <> id_lote)) do
           Next;
     finally
        EnableControls;
     end;
  end;
end;

procedure TDMAsignaLotes.xDocumentoAfterScroll(DataSet: TDataSet);
var
  MascaraUnidades : string;
begin
  // Mascara segun unidades del articulo
  MascaraUnidades := DMMain.DameMascaraUnidades(xDocumento.FieldByName('ARTICULO').AsString);
  TFloatField(xDocumento.FieldByName('UNIDADES')).DisplayFormat := MascaraUnidades;
  TFloatField(xDocumento.FieldByName('UNIDADES_ASIGNADAS')).DisplayFormat := MascaraUnidades;
  xLoteAsignadoCANTIDAD.DisplayFormat := MascaraUnidades;
  xLoteDisponibleSTOCK.DisplayFormat := MascaraUnidades;
  xLoteDisponibleSTOCK_VIRTUAL.DisplayFormat := MascaraUnidades;
end;

procedure TDMAsignaLotes.FiltraClasificacion(AClasificacion: string);
begin
  Clasificacion := UpperCase(AClasificacion);
  RefrescaLotes;
end;

end.
