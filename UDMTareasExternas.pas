unit UDMTareasExternas;

interface

uses {IDIOMA_CODE}gnugettext{IDIOMA_CODE},
  SysUtils, Classes, FIBDatabase, UFIBModificados, DB, FIBDataSet,
  FIBTableDataSet, FIBDataSetRO, Forms, Dialogs, HYFIBQuery;

type
  //Registro movimientos trabajos externos
  PRO_ORD_TAREA_TEX_MOVS = record
     ID_TEX_MOV: integer;
     ID_TEX: integer;
     FECHA: TDateTime;
     ID_A: integer;
     PROVEEDOR: integer;
     ALMACEN_PERPARACION: string;
     ALMACEN_TEX: string;
     UNIDADES: extended;
     TIPO_OPERACION: string;
     TIPO_DOC: string;
     ID_DOC: integer;
     ID_ST: integer;
  end;

  TDMTareasExternas = class(TDataModule)
     QMPro_Ord_Tarea_Tex: TFIBTableSet;
     QMPro_Ord_Tarea_Tex_Movs: TFIBTableSet;
     DSQMPro_Ord_Tarea_Tex: TDataSource;
     DSQMPro_Ord_Tarea_Tex_Movs: TDataSource;
     TLocal: THYTransaction;
     TUpdate: THYTransaction;
     QMPro_Ord_Tarea_TexEMPRESA: TIntegerField;
     QMPro_Ord_Tarea_TexEJERCICIO: TIntegerField;
     QMPro_Ord_Tarea_TexCANAL: TIntegerField;
     QMPro_Ord_Tarea_TexSERIE: TFIBStringField;
     QMPro_Ord_Tarea_TexRIG_OF: TIntegerField;
     QMPro_Ord_Tarea_TexSUBORDEN: TIntegerField;
     QMPro_Ord_Tarea_TexLINEA_FASE: TIntegerField;
     QMPro_Ord_Tarea_TexLINEA_TAREA: TIntegerField;
     QMPro_Ord_Tarea_TexID_ORDEN: TIntegerField;
     QMPro_Ord_Tarea_TexID_E_PEDIDO: TIntegerField;
     QMPro_Ord_Tarea_TexID_TEX: TIntegerField;
     QMPro_Ord_Tarea_TexCOMPUESTO: TFIBStringField;
     QMPro_Ord_Tarea_TexUNI_TOTAL: TFloatField;
     QMPro_Ord_Tarea_TexFECHA_ORD: TDateTimeField;
     QMPro_Ord_Tarea_TexCLIENTE: TIntegerField;
     QMPro_Ord_Tarea_TexPEDIDO: TIntegerField;
     QMPro_Ord_Tarea_TexLINEA_PED: TIntegerField;
     QMPro_Ord_Tarea_TexTITULO_ARTICULO: TFIBStringField;
     QMPro_Ord_Tarea_Tex_MovsID_TEX_MOV: TIntegerField;
     QMPro_Ord_Tarea_Tex_MovsID_TEX: TIntegerField;
     QMPro_Ord_Tarea_Tex_MovsFECHA: TDateTimeField;
     QMPro_Ord_Tarea_Tex_MovsID_A: TIntegerField;
     QMPro_Ord_Tarea_Tex_MovsPROVEEDOR: TIntegerField;
     QMPro_Ord_Tarea_Tex_MovsALMACEN_PERPARACION: TFIBStringField;
     QMPro_Ord_Tarea_Tex_MovsALMACEN_TEX: TFIBStringField;
     QMPro_Ord_Tarea_Tex_MovsUNIDADES: TFloatField;
     QMPro_Ord_Tarea_Tex_MovsTIPO_OPERACION: TFIBStringField;
     QMPro_Ord_Tarea_Tex_MovsTIPO_DOC: TFIBStringField;
     QMPro_Ord_Tarea_Tex_MovsID_DOC: TIntegerField;
     xPedido: TFIBDataSetRO;
     xPedidoEMPRESA: TIntegerField;
     xPedidoEJERCICIO: TIntegerField;
     xPedidoCANAL: TIntegerField;
     xPedidoSERIE: TFIBStringField;
     xPedidoTIPO: TFIBStringField;
     xPedidoRIG: TIntegerField;
     xPedidoALMACEN: TFIBStringField;
     xPedidoMONEDA: TFIBStringField;
     xPedidoFECHA: TDateTimeField;
     xPedidoPROVEEDOR: TIntegerField;
     xPedidoTERCERO: TIntegerField;
     xPedidoTITULO: TFIBStringField;
     xPedidoNOTAS: TBlobField;
     xPedidoESTADO: TIntegerField;
     xPedidoBULTOS: TIntegerField;
     xPedidoLINEAS: TIntegerField;
     xPedidoBRUTO: TFloatField;
     xPedidoI_DTO_LINEAS: TFloatField;
     xPedidoS_BASES: TFloatField;
     xPedidoS_CUOTA_IVA: TFloatField;
     xPedidoS_CUOTA_RE: TFloatField;
     xPedidoB_DTO_LINEAS: TFloatField;
     xPedidoDTO_PP: TFloatField;
     xPedidoDTO_CIAL: TFloatField;
     xPedidoI_DTO_CIAL: TFloatField;
     xPedidoI_DTO_PP: TFloatField;
     xPedidoLIQUIDO: TFloatField;
     xPedidoENTRADA: TIntegerField;
     xPedidoNOMBRE_COMERCIAL: TFIBStringField;
     xPedidoPOR_FINANCIACION: TFloatField;
     xPedidoI_FINANCIACION: TFloatField;
     xPedidoFORMA_DE_PAGO: TFIBStringField;
     xPedidoSU_REFERENCIA: TFIBStringField;
     xPedidoID_E: TIntegerField;
     xPedidoFECHA_PRE_CAB: TDateTimeField;
     xPedidoFECHA_REC_CAB: TDateTimeField;
     DSxPedido: TDataSource;
     xAlbaranes: TFIBDataSetRO;
     xAlbaranesRIG: TIntegerField;
     xAlbaranesFECHA: TDateTimeField;
     xAlbaranesID_E_ALBARAN: TIntegerField;
     DSxAlbaranes: TDataSource;
     xFase: TFIBDataSetRO;
     xFaseEMPRESA: TIntegerField;
     xFaseEJERCICIO: TIntegerField;
     xFaseCANAL: TIntegerField;
     xFaseSERIES: TFIBStringField;
     xFaseRIG_OF: TIntegerField;
     xFaseSUBORDEN: TIntegerField;
     xFaseLINEA_FASE: TIntegerField;
     xFaseFASE: TFIBStringField;
     xFaseORDEN: TIntegerField;
     xFaseTIPOFASE: TFIBStringField;
     xFaseNOTAS: TMemoField;
     xFaseDIBUJO: TFIBStringField;
     xFaseESTADO: TIntegerField;
     xFaseVALORCALIDAD: TIntegerField;
     xFaseFECHA_FIN_FASE: TDateTimeField;
     xFaseENTRADA: TIntegerField;
     xFaseID_ORDEN: TIntegerField;
     xTarea: TFIBDataSetRO;
     xTareaEMPRESA: TIntegerField;
     xTareaEJERCICIO: TIntegerField;
     xTareaCANAL: TIntegerField;
     xTareaSERIE: TFIBStringField;
     xTareaRIG_OF: TIntegerField;
     xTareaSUBORDEN: TIntegerField;
     xTareaLINEA_FASE: TIntegerField;
     xTareaLINEA_TAREA: TIntegerField;
     xTareaTAREA: TFIBStringField;
     xTareaORDEN: TIntegerField;
     xTareaTIPOTAREA: TFIBStringField;
     xTareaCOMENTARIO: TMemoField;
     xTareaRECURSO: TFIBStringField;
     xTareaCANTIDAD: TFloatField;
     xTareaARTICULO: TFIBStringField;
     xTareaPRE_COS_UNI_PRE: TFloatField;
     xTareaTOTAL_VAR_PRE: TFloatField;
     xTareaPRECIO_FIJO_PRE: TFloatField;
     xTareaTOTAL_PRE: TFloatField;
     xTareaPRE_COS_UNI_REAL: TFloatField;
     xTareaTOTAL_VAR_REAL: TFloatField;
     xTareaPRECIO_FIJO_REAL: TFloatField;
     xTareaTOTAL_REAL: TFloatField;
     xTareaESTADO: TIntegerField;
     xTareaFECHA_FIN_TAREA: TDateTimeField;
     xTareaIDENTIFICADOR: TIntegerField;
     xTareaENTRADA: TIntegerField;
     xTareaID_ORDEN: TIntegerField;
     xTareaCANTIDAD_UTIL: TFloatField;
     xTareaID_UTILLAJE: TFIBStringField;
     DSxFase: TDataSource;
     DSxTarea: TDataSource;
     QMPro_Ord_Tarea_TexSITUACION: TSmallintField;
     QMPro_Ord_Tarea_Tex_MovsSTOCK_PERPARACION: TFloatField;
     QMPro_Ord_Tarea_Tex_MovsSTOCK_TEX: TFloatField;
     QMPro_Ord_Tarea_Tex_MovsID_ST: TIntegerField;
     QMPro_Ord_Tarea_TexTITULO_SITUACION: TStringField;
     QMPro_Ord_Tarea_Tex_MovsNOMBRE_R_SOCIAL: TStringField;
     QMPro_Ord_Tarea_TexNOMBRE_R_SOCIAL: TStringField;
     QMPro_Ord_Tarea_Tex_MovsARTICULO: TFIBStringField;
     QMPro_Ord_Tarea_Tex_MovsSERIE_DOC: TStringField;
     QMPro_Ord_Tarea_Tex_MovsRIG_DOC: TIntegerField;
     QMPro_Ord_Tarea_Tex_MovsSERIE_ST: TStringField;
     QMPro_Ord_Tarea_Tex_MovsRIG_ST: TIntegerField;
     QMPro_Ord_Tarea_Tex_MovsEJERCICIO_DOC: TIntegerField;
     QMPro_Ord_Tarea_Tex_MovsEJERCICIO_ST: TIntegerField;
     QMPro_Ord_Tarea_Tex_MovsCANAL_DOC: TIntegerField;
     QMPro_Ord_Tarea_TexPROVEEDOR: TIntegerField;
     QMPro_Ord_Tarea_TexTITULO_PROVEEDOR: TFIBStringField;
     QMPro_Ord_Tarea_TexALMACEN_PREPARACION: TFIBStringField;
     QMPro_Ord_Tarea_TexALMACEN_TEX: TFIBStringField;
     QMPro_Ord_Tarea_TexALMACEN_ENTRADA: TFIBStringField;
     QMPro_Ord_Tarea_TexSTOCK_ALM_PREPARACION: TFloatField;
     QMPro_Ord_Tarea_TexSTOCK_ALM_TEX: TFloatField;
     QMPro_Ord_Tarea_TexSTOCK_ALM_ENTRADA: TFloatField;
     QMPro_Ord_Tarea_Tex_MovsUNIDADES_COMPUESTO_COMPONENTE: TFloatField;
     QMPro_Ord_Tarea_Tex_MovsEMPRESA: TIntegerField;
     QMPro_Ord_Tarea_Tex_MovsCOMPUESTO_COMPONENTE: TFIBStringField;
     QMPro_Ord_Tarea_Tex_MovsTITULO_COMPUESTO_COMPONENTE: TFIBStringField;
     QMPro_Ord_Tarea_TexARTICULO: TFIBStringField;
     QMPro_Ord_Tarea_TexCOMPUESTO_COMPONENTE: TFIBStringField;
     QMPro_Ord_Tarea_TexTITULO_COMPUESTO_COMPONENTE: TFIBStringField;
     QMPro_Ord_Tarea_TexTITULO_COMPUESTO_ORDEN: TFIBStringField;
     QMPro_Ord_Tarea_Tex_MovsTITULO_ARTICULO: TFIBStringField;
     QMPro_Ord_Tarea_TexTAREA: TFIBStringField;
     QMPro_Ord_Tarea_TexCOMENTARIO_TAREA: TMemoField;
     QMPro_Ord_Tarea_TexIMAGEN_COMPUESTO: TIntegerField;
     QMPro_Ord_Tarea_Tex_MovsCAJAS: TFloatField;
     QMPro_Ord_Tarea_Tex_MovsALBARAN_PROVEEDOR: TFIBStringField;
     QMPro_Ord_Tarea_Tex_MovsKILOS: TFloatField;
     QMPro_Ord_Tarea_TexID_LOTE: TIntegerField;
     QMPro_Ord_Tarea_TexDESC_LOTE: TFIBStringField;
     procedure DataModuleCreate(Sender: TObject);
     procedure DataModuleDestroy(Sender: TObject);
     procedure QMPro_Ord_Tarea_TexAfterOpen(DataSet: TDataSet);
     procedure QMPro_Ord_Tarea_Tex_MovsCalcFields(DataSet: TDataSet);
     procedure QMPro_Ord_Tarea_TexCalcFields(DataSet: TDataSet);
     procedure QMPro_Ord_Tarea_Tex_MovsNewRecord(DataSet: TDataSet);
     procedure QMPro_Ord_Tarea_Tex_MovsBeforePost(DataSet: TDataSet);
     procedure QMPro_Ord_Tarea_Tex_MovsAfterPost(DataSet: TDataSet);
  private
     { Private declarations }
  public
     { Public declarations }
     CalculaStockVirtual: boolean;
     procedure AbreTabla(Serie, Orden, Cliente, Articulo, Proveedor: string; DesdeFec, HastaFec: TDateTime; Situacion: integer; CampoOrden: integer = -1);
     function DameProveedorDeAlmacen(Empresa: integer; Almacen: string): integer;
     procedure SetCalculaStockVirtual(Valor: boolean);
     //Grabacion de movimientos
     function Borrar_PRO_ORD_TAREA_TEX_MOVS(R_Pro: PRO_ORD_TAREA_TEX_MOVS): boolean;
     function Cargar_PRO_ORD_TAREA_TEX_MOVS(Q_Carga: TDataSet): PRO_ORD_TAREA_TEX_MOVS;
     function Insertar_PRO_ORD_TAREA_TEX_MOVS(R_Pro: PRO_ORD_TAREA_TEX_MOVS): boolean;
     function Modificar_PRO_ORD_TAREA_TEX_MOVS(R_Pro: PRO_ORD_TAREA_TEX_MOVS): boolean;
     function Grabar_PRO_ORD_TAREA_TEX_MOVS(R_Pro: PRO_ORD_TAREA_TEX_MOVS; Accion: string): boolean;
     procedure RefrescaDatos;
     function DamePesoArticulo(CompuestoComponente: string): double;
     function DameTipoUnidadArticulo(CompuestoComponente: string): string;
     function DameUnidadesComponenteAsociado(Componente: string): double;
     function DameStockArticuloAlmacenLote(Articulo, Almacen: string; IdLote: integer): double;
  end;

var
  DMTareasExternas : TDMTareasExternas;

implementation

uses UDMMain, UEntorno, UFMain, UUtiles, UDameDato;

{$R *.dfm}

procedure TDMTareasExternas.DataModuleCreate(Sender: TObject);
begin
  TranslateComponent(Self); //IDIOMA_CODE
  if not TLocal.InTransaction then
     TLocal.StartTransaction;

  QMPro_Ord_Tarea_TexUNI_TOTAL.DisplayFormat := MascaraN;
  QMPro_Ord_Tarea_TexSTOCK_ALM_PREPARACION.DisplayFormat := MascaraN;
  QMPro_Ord_Tarea_TexSTOCK_ALM_TEX.DisplayFormat := MascaraN;
  QMPro_Ord_Tarea_TexSTOCK_ALM_ENTRADA.DisplayFormat := MascaraN;
end;

procedure TDMTareasExternas.DataModuleDestroy(Sender: TObject);
begin
  TLocal.Commit;
end;

procedure TDMTareasExternas.QMPro_Ord_Tarea_TexAfterOpen(DataSet: TDataSet);
begin
  QMPro_Ord_Tarea_Tex_Movs.Open;
end;

procedure TDMTareasExternas.AbreTabla(Serie, Orden, Cliente, Articulo, Proveedor: string; DesdeFec, HastaFec: TDateTime; Situacion: integer; CampoOrden: integer = -1);
begin
  DMMain.LogIni('AbreTabla');

  with QMPro_Ord_Tarea_Tex do
  begin
     if Active then
        Close;
     SelectSQL.Clear;
     SelectSQL.Add(' SELECT * ');
     SelectSQL.Add(' FROM VER_PRO_ORD_TAREA_TEX A');
     if (Proveedor <> '') then
     begin
        SelectSQL.Add(' INNER JOIN PRO_ORD_TAREA_TEX_MOVS B ON ( ');
        SelectSQL.Add('  A.ID_TEX = B.ID_TEX ');
        SelectSQL.Add('  AND B.PROVEEDOR = :PROVEEDOR )');
     end;
     SelectSQL.Add(' WHERE ');
     SelectSQL.Add(' EMPRESA = :EMPRESA AND ');
     SelectSQL.Add(' EJERCICIO = :EJERCICIO AND ');
     SelectSQL.Add(' CANAL = :CANAL ');
     if (Serie <> '') then
        SelectSQL.Add(' AND SERIE = :SERIE ');
     if (Cliente <> '') then
        SelectSQL.Add(' AND CLIENTE = :CLIENTE ');
     if (Articulo <> '') then
        SelectSQL.Add(' AND COMPUESTO = :ARTICULO ');
     if (Orden <> '') then
        SelectSQL.Add(' AND ID_ORDEN = :ORDEN ');
     if (DesdeFec > 0) then
        SelectSQL.Add(' AND FECHA_ORD >= :FECHA_DESDE ');
     if (HastaFec > 0) then
        SelectSQL.Add(' AND FECHA_ORD <= :FECHA_HASTA ');

     if Situacion > 0 then
        SelectSQL.Add(' AND SITUACION = ' + IntToStr(Situacion));

     if (CampoOrden = -1) then
        SelectSQL.Add(' ORDER BY RIG_OF ')
     else
     begin
        SelectSQL.Add(' ORDER BY ' + IntToStr(Abs(CampoOrden)));
        if (CampoOrden < 0) then
           SelectSQL.Add(' DESC ');
     end;
     Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
     Params.ByName['EJERCICIO'].AsInteger := REntorno.Ejercicio;
     Params.ByName['CANAL'].AsInteger := REntorno.Canal;
     if (Serie <> '') then
        Params.ByName['SERIE'].AsString := Serie;
     if (Cliente <> '') then
        Params.ByName['CLIENTE'].AsInteger := StrToInt(Cliente);
     if (Proveedor <> '') then
        Params.ByName['PROVEEDOR'].AsInteger := StrToInt(Proveedor);
     if (Articulo <> '') then
        Params.ByName['ARTICULO'].AsString := Articulo;
     if (Orden <> '') then
        Params.ByName['ORDEN'].AsInteger := StrToInt(Orden);
     if (DesdeFec > 0) then
        Params.ByName['FECHA_DESDE'].AsDateTime := DesdeFec;
     if (HastaFec > 0) then
        Params.ByName['FECHA_HASTA'].AsDateTime := HastaFec;
     Open;
  end;
  DMMain.LogFin('AbreTabla');
end;

function TDMTareasExternas.DameProveedorDeAlmacen(Empresa: integer; Almacen: string): integer;
var
  Q : THYFIBQuery;
begin
  Q := THYFIBQuery.Create(Self);
  try
     with Q do
     begin
        Database := DMMain.DataBase;
        Close;
        SQL.Add(' SELECT PRO.PROVEEDOR FROM ART_ALMACENES ALM ');
        SQL.Add(' JOIN SYS_TERCEROS TER ON ALM.TERCERO = TER.TERCERO ');
        SQL.Add(' JOIN EMP_PROVEEDORES PRO ON PRO.EMPRESA = ALM.EMPRESA AND PRO.TERCERO = TER.TERCERO ');
        SQL.Add(' WHERE ');
        SQL.Add(' ALM.EMPRESA = :EMPRESA AND ');
        SQL.Add(' ALM.ALMACEN = :ALMACEN ');
        Params.ByName['EMPRESA'].AsInteger := Empresa;
        Params.ByName['ALMACEN'].AsString := Almacen;
        ExecQuery;
        Result := FieldByName['PROVEEDOR'].AsInteger;
        Close;
        FreeHandle;
     end;
  finally
     FreeAndNil(Q);
  end;
end;

//------------------------------------------------------------------------------
function TDMTareasExternas.Insertar_PRO_ORD_TAREA_TEX_MOVS(R_Pro: PRO_ORD_TAREA_TEX_MOVS): boolean;
begin
  Result := True;
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' INSERT INTO PRO_ORD_TAREA_TEX_MOVS');
        SQL.Add(' (ID_TEX_MOV,ID_TEX,FECHA,ID_A,PROVEEDOR,ALMACEN_PERPARACION,ALMACEN_TEX,UNIDADES,TIPO_OPERACION,TIPO_DOC,ID_DOC,ID_ST)');
        SQL.Add(' VALUES (:ID_TEX_MOV,:ID_TEX,:FECHA,:ID_A,:PROVEEDOR,:ALMACEN_PERPARACION,:ALMACEN_TEX,:UNIDADES,:TIPO_OPERACION,:TIPO_DOC,:ID_DOC,:ID_ST)');
        Params.ByName['ID_TEX_MOV'].AsInteger := R_Pro.ID_TEX_MOV;
        Params.ByName['ID_TEX'].AsInteger := R_Pro.ID_TEX;
        Params.ByName['FECHA'].AsDateTime := R_Pro.FECHA;
        Params.ByName['ID_A'].AsInteger := R_Pro.ID_A;
        Params.ByName['PROVEEDOR'].AsInteger := R_Pro.PROVEEDOR;
        Params.ByName['ALMACEN_PERPARACION'].AsString := R_Pro.ALMACEN_PERPARACION;
        Params.ByName['ALMACEN_TEX'].AsString := R_Pro.ALMACEN_TEX;
        Params.ByName['UNIDADES'].AsFloat := R_Pro.UNIDADES;
        Params.ByName['TIPO_OPERACION'].AsString := R_Pro.TIPO_OPERACION;
        Params.ByName['TIPO_DOC'].AsString := R_Pro.TIPO_DOC;
        Params.ByName['ID_DOC'].AsInteger := R_Pro.ID_DOC;
        Params.ByName['ID_ST'].AsInteger := R_Pro.ID_ST;
        try
           ExecQuery;
        except
           on E: Exception do
           begin
              Result := False;
              ShowMessage(E.message);
           end;
        end;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMTareasExternas.Modificar_PRO_ORD_TAREA_TEX_MOVS(R_Pro: PRO_ORD_TAREA_TEX_MOVS): boolean;
begin
  Result := True;
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' UPDATE PRO_ORD_TAREA_TEX_MOVS SET ');
        SQL.Add(' ID_TEX=:ID_TEX,');
        SQL.Add(' FECHA=:FECHA,');
        SQL.Add(' ID_A=:ID_A,');
        SQL.Add(' PROVEEDOR=:PROVEEDOR,');
        SQL.Add(' ALMACEN_PERPARACION=:ALMACEN_PERPARACION,');
        SQL.Add(' ALMACEN_TEX=:ALMACEN_TEX,');
        SQL.Add(' UNIDADES=:UNIDADES,');
        SQL.Add(' TIPO_OPERACION=:TIPO_OPERACION,');
        SQL.Add(' TIPO_DOC=:TIPO_DOC,');
        SQL.Add(' ID_DOC=:ID_DOC,');
        SQL.Add(' ID_ST=:ID_ST');
        SQL.Add(' WHERE ID_TEX_MOV=:ID_TEX_MOV');
        Params.ByName['ID_TEX_MOV'].AsInteger := R_Pro.ID_TEX_MOV;
        Params.ByName['ID_TEX'].AsInteger := R_Pro.ID_TEX;
        Params.ByName['FECHA'].AsDateTime := R_Pro.FECHA;
        Params.ByName['ID_A'].AsInteger := R_Pro.ID_A;
        Params.ByName['PROVEEDOR'].AsInteger := R_Pro.PROVEEDOR;
        Params.ByName['ALMACEN_PERPARACION'].AsString := R_Pro.ALMACEN_PERPARACION;
        Params.ByName['ALMACEN_TEX'].AsString := R_Pro.ALMACEN_TEX;
        Params.ByName['UNIDADES'].AsFloat := R_Pro.UNIDADES;
        Params.ByName['TIPO_OPERACION'].AsString := R_Pro.TIPO_OPERACION;
        Params.ByName['TIPO_DOC'].AsString := R_Pro.TIPO_DOC;
        Params.ByName['ID_DOC'].AsInteger := R_Pro.ID_DOC;
        Params.ByName['ID_ST'].AsInteger := R_Pro.ID_ST;
        try
           ExecQuery;
        except
           on E: Exception do
           begin
              Result := False;
              ShowMessage(E.message);
           end;
        end;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMTareasExternas.Borrar_PRO_ORD_TAREA_TEX_MOVS(R_Pro: PRO_ORD_TAREA_TEX_MOVS): boolean;
begin
  Result := True;
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' DELETE FROM PRO_ORD_TAREA_TEX_MOVS SET ');
        SQL.Add(' WHERE ID_TEX_MOV=:ID_TEX_MOV');
        Params.ByName['ID_TEX_MOV'].AsInteger := R_Pro.ID_TEX_MOV;
        try
           ExecQuery;
        except
           on E: Exception do
           begin
              Result := False;
              ShowMessage(E.message);
           end;
        end;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMTareasExternas.Cargar_PRO_ORD_TAREA_TEX_MOVS(Q_Carga: TDataSet): PRO_ORD_TAREA_TEX_MOVS;
var
  R_Pro : PRO_ORD_TAREA_TEX_MOVS;
begin
  R_Pro.ID_TEX_MOV := Q_Carga.FieldByName('ID_TEX_MOV').AsInteger;
  R_Pro.ID_TEX := Q_Carga.FieldByName('ID_TEX').AsInteger;
  R_Pro.FECHA := Q_Carga.FieldByName('FECHA').AsDateTime;
  R_Pro.ID_A := Q_Carga.FieldByName('ID_A').AsInteger;
  R_Pro.PROVEEDOR := Q_Carga.FieldByName('PROVEEDOR').AsInteger;
  R_Pro.ALMACEN_PERPARACION := Q_Carga.FieldByName('ALMACEN_PERPARACION').AsString;
  R_Pro.ALMACEN_TEX := Q_Carga.FieldByName('ALMACEN_TEX').AsString;
  R_Pro.UNIDADES := Q_Carga.FieldByName('UNIDADES').AsFloat;
  R_Pro.TIPO_OPERACION := Q_Carga.FieldByName('TIPO_OPERACION').AsString;
  R_Pro.TIPO_DOC := Q_Carga.FieldByName('TIPO_DOC').AsString;
  R_Pro.ID_DOC := Q_Carga.FieldByName('ID_DOC').AsInteger;
  R_Pro.ID_ST := Q_Carga.FieldByName('ID_ST').AsInteger;
  Result := R_Pro;
end;

function TDMTareasExternas.Grabar_PRO_ORD_TAREA_TEX_MOVS(R_Pro: PRO_ORD_TAREA_TEX_MOVS; Accion: string): boolean;
begin
  Result := True;
  if Accion = 'G' then
     Result := Insertar_PRO_ORD_TAREA_TEX_MOVS(R_Pro)
  else if Accion = 'M' then
     Result := Modificar_PRO_ORD_TAREA_TEX_MOVS(R_Pro)
  else if Accion = 'A' then
     Result := Borrar_PRO_ORD_TAREA_TEX_MOVS(R_Pro);
end;

procedure TDMTareasExternas.QMPro_Ord_Tarea_Tex_MovsCalcFields(DataSet: TDataSet);
var
  StockP, StockE : currency;
begin
  StockP := 0;
  StockE := 0;
  if CalculaStockVirtual then
  begin
     StockP := DMMain.DameStockVirtualArticulo(REntorno.Empresa, REntorno.Canal, QMPro_Ord_Tarea_TexCOMPUESTO.AsString, DataSet.FieldByName('ALMACEN_PERPARACION').AsString);
     StockE := DMMain.DameStockVirtualArticulo(REntorno.Empresa, REntorno.Canal, QMPro_Ord_Tarea_TexCOMPUESTO.AsString, DataSet.FieldByName('ALMACEN_TEX').AsString);
  end;
  DataSet.FieldByName('STOCK_PERPARACION').AsFloat := StockP;
  DataSet.FieldByName('STOCK_TEX').AsFloat := StockE;
end;

procedure TDMTareasExternas.SetCalculaStockVirtual(Valor: boolean);
begin
  CalculaStockVirtual := Valor;
  QMPro_Ord_Tarea_Tex_Movs.Close;
  QMPro_Ord_Tarea_Tex_Movs.Open;
end;

procedure TDMTareasExternas.QMPro_Ord_Tarea_TexCalcFields(DataSet: TDataSet);
begin
  QMPro_Ord_Tarea_TexTITULO_SITUACION.AsString := DameTituloSituacionProduccion(QMPro_Ord_Tarea_TexSITUACION.AsInteger);
  QMPro_Ord_Tarea_TexSTOCK_ALM_PREPARACION.AsFloat := DameStockArticuloAlmacenLote(QMPro_Ord_Tarea_TexCOMPUESTO.AsString, QMPro_Ord_Tarea_TexALMACEN_PREPARACION.AsString, QMPro_Ord_Tarea_TexID_LOTE.AsInteger);
  QMPro_Ord_Tarea_TexSTOCK_ALM_TEX.AsFloat := DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, QMPro_Ord_Tarea_TexCOMPUESTO.AsString, QMPro_Ord_Tarea_TexALMACEN_TEX.AsString);
  QMPro_Ord_Tarea_TexSTOCK_ALM_ENTRADA.AsFloat := DMMain.DameStockArticulo(REntorno.Empresa, REntorno.Canal, QMPro_Ord_Tarea_TexCOMPUESTO.AsString, QMPro_Ord_Tarea_TexALMACEN_ENTRADA.AsString);
end;

procedure TDMTareasExternas.QMPro_Ord_Tarea_Tex_MovsNewRecord(DataSet: TDataSet);
begin
  QMPro_Ord_Tarea_Tex_MovsID_TEX.AsInteger := QMPro_Ord_Tarea_TexID_TEX.AsInteger;
  QMPro_Ord_Tarea_Tex_MovsFECHA.AsDateTime := Now;
  QMPro_Ord_Tarea_Tex_MovsPROVEEDOR.AsInteger := QMPro_Ord_Tarea_TexPROVEEDOR.AsInteger;
  QMPro_Ord_Tarea_Tex_MovsALMACEN_PERPARACION.AsString := QMPro_Ord_Tarea_TexALMACEN_PREPARACION.AsString;
  QMPro_Ord_Tarea_Tex_MovsALMACEN_TEX.AsString := QMPro_Ord_Tarea_TexALMACEN_TEX.AsString;
  QMPro_Ord_Tarea_Tex_MovsARTICULO.AsString := QMPro_Ord_Tarea_TexARTICULO.AsString;
  QMPro_Ord_Tarea_Tex_MovsEMPRESA.AsInteger := QMPro_Ord_Tarea_TexEMPRESA.AsInteger;
  QMPro_Ord_Tarea_Tex_MovsCOMPUESTO_COMPONENTE.AsString := QMPro_Ord_Tarea_TexCOMPUESTO.AsString;
  QMPro_Ord_Tarea_Tex_MovsUNIDADES.AsFloat := 0;
  QMPro_Ord_Tarea_Tex_MovsUNIDADES_COMPUESTO_COMPONENTE.AsFloat := 0;
  QMPro_Ord_Tarea_Tex_MovsCAJAS.AsFloat := 0;
  QMPro_Ord_Tarea_Tex_MovsKILOS.AsFloat := 0;
end;

procedure TDMTareasExternas.QMPro_Ord_Tarea_Tex_MovsBeforePost(DataSet: TDataSet);
begin
  // Verificar si las unidades son 0 y cancelar la operación si es así
  if ((QMPro_Ord_Tarea_Tex_MovsUNIDADES_COMPUESTO_COMPONENTE.AsFloat = 0) or
     ((QMPro_Ord_Tarea_Tex_MovsUNIDADES.AsFloat = 0) and (QMPro_Ord_Tarea_Tex_MovsTIPO_OPERACION.AsString = 'S'))) then
  begin
     ShowMessage('No puedes guardar si las unidades son 0.');
     Abort;
  end;

  DMMain.Contador_Gen(QMPro_Ord_Tarea_Tex_Movs, 'ID_TAREAS_EXTERNAS_MOVS', 'ID_TEX_MOV');
end;

procedure TDMTareasExternas.RefrescaDatos;
var
  IdTexMov : integer;
begin
  // Refresca datos manteniendo posiciones
  IdTexMov := QMPro_Ord_Tarea_Tex_MovsID_TEX_MOV.AsInteger;
  Refrescar(QMPro_Ord_Tarea_Tex, 'ID_TEX', QMPro_Ord_Tarea_TexID_TEX.AsInteger);
  Refrescar(QMPro_Ord_Tarea_Tex_Movs, 'ID_TEX_MOV', IdTexMov);
end;

procedure TDMTareasExternas.QMPro_Ord_Tarea_Tex_MovsAfterPost(DataSet: TDataSet);
begin
  RefrescaDatos;
end;

function TDMTareasExternas.DamePesoArticulo(CompuestoComponente: string): double;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := ' SELECT PESO FROM ART_ARTICULOS WHERE EMPRESA = :EMPRESA AND ARTICULO = :COMPUESTO_COMPONENTE ';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['COMPUESTO_COMPONENTE'].AsString := CompuestoComponente;
        ExecQuery;
        Result := FieldByName['PESO'].AsFloat;
        Close;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMTareasExternas.DameTipoUnidadArticulo(CompuestoComponente: string): string;
begin
  Result := '';
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Text := ' SELECT UNIDADES FROM ART_ARTICULOS WHERE EMPRESA = :EMPRESA AND ARTICULO = :COMPUESTO_COMPONENTE ';
        Params.ByName['EMPRESA'].AsInteger := REntorno.Empresa;
        Params.ByName['COMPUESTO_COMPONENTE'].AsString := CompuestoComponente;
        ExecQuery;
        Result := FieldByName['UNIDADES'].AsString;
        Close;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMTareasExternas.DameUnidadesComponenteAsociado(Componente: string): double;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT SUM(UNIDADES_STOCK) AS UNIDADES FROM PRO_ORD_MAT ');
        SQL.Add(' WHERE ');
        SQL.Add(' EMPRESA = :EMPRESA ');
        SQL.Add(' AND EJERCICIO = :EJERCICIO ');
        SQL.Add(' AND CANAL = :CANAL');
        SQL.Add(' AND SERIES = :SERIE ');
        SQL.Add(' AND RIG_OF = :RIG_OF ');
        SQL.Add(' AND LINEA_FASE = :LINEA_FASE ');
        SQL.Add(' AND LINEA_TAREA = :LINEA_TAREA ');
        SQL.Add(' AND COMPONENTE = :COMPONENTE ');
        Params.ByName['EMPRESA'].AsInteger := QMPro_Ord_Tarea_TexEMPRESA.AsInteger;
        Params.ByName['EJERCICIO'].AsInteger := QMPro_Ord_Tarea_TexEJERCICIO.AsInteger;
        Params.ByName['CANAL'].AsInteger := QMPro_Ord_Tarea_TexCANAL.AsInteger;
        Params.ByName['SERIE'].AsString := QMPro_Ord_Tarea_TexSERIE.AsString;
        Params.ByName['RIG_OF'].AsInteger := QMPro_Ord_Tarea_TexRIG_OF.AsInteger;
        Params.ByName['LINEA_FASE'].AsInteger := QMPro_Ord_Tarea_TexLINEA_FASE.AsInteger;
        Params.ByName['LINEA_TAREA'].AsInteger := QMPro_Ord_Tarea_TexLINEA_TAREA.AsInteger;
        Params.ByName['COMPONENTE'].AsString := Componente;
        ExecQuery;
        Result := FieldByName['UNIDADES'].AsFloat;
        Close;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

function TDMTareasExternas.DameStockArticuloAlmacenLote(Articulo, Almacen: string; IdLote: integer): double;
begin
  with THYFIBQuery.Create(nil) do
  begin
     try
        Close;
        DataBase := DMMain.DataBase;
        SQL.Add(' SELECT STOCK FROM A_ART_DAME_STOCK_LOTE_UBIC(:EMPRESA, :ARTICULO, :CANAL, :ALMACEN, :ID_UBICACION) ');
        SQL.Add(' WHERE ');
        SQL.Add(' ID_LOTE = :ID_LOTE ');
        Params.ByName['EMPRESA'].AsInteger := QMPro_Ord_Tarea_TexEMPRESA.AsInteger;
        Params.ByName['ARTICULO'].AsString := Articulo;
        Params.ByName['CANAL'].AsInteger := QMPro_Ord_Tarea_TexCANAL.AsInteger;
        Params.ByName['ALMACEN'].AsString := Almacen;
        Params.ByName['ID_UBICACION'].AsInteger := -1;
        Params.ByName['ID_LOTE'].AsInteger := IdLote;
        ExecQuery;
        Result := FieldByName['STOCK'].AsFloat;
        Close;
        FreeHandle;
     finally
        Free;
     end;
  end;
end;

end.
