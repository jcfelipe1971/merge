object ProDMConfiguracion: TProDMConfiguracion
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 187
  Top = 114
  Height = 311
  Width = 297
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 224
    Top = 16
  end
  object QMConfiguracion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_CONSTANTES'
      'WHERE'
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_CONSTANTES'
      
        '  (ID,'#13#10'EMPRESA,PREVALECE_ALM_ORDEN,CERRAR_SUBORDENES,ACTIVAR_QU' +
        'IMICAS,QUIM_TIPOCONTROL,QUIM_FILTRO_ARTICULO_FASES,ESC_GENERA_OF' +
        ',ESC_MODIFICAR_COSTE,ESC_MATERIALES,ESC_AUTO_CALCULAR,'#13#10'ESC_RECU' +
        'RSOS,QUIM_DENSIDAD,ESC_PORCENT,IMPORTAR_OP,CASO_OP,RESERVA_STOCK' +
        '_OP,ESC_ACTIVO,GEST_OFERTAS_ESC,GEST_ESC_PORDEFECTO,GEST_FILTRO_' +
        'ESC_PED,'#13#10'ESC_TRASPASAR_MEDIDAS_OF,GEST_PRECIO_VENTA_PEDIDO,GEST' +
        '_OF_PED_PROV,COMPUESTOS_VIRTUALES,OF_UDS_PENDIENTES,GEST_PED_AUT' +
        'O,GEST_OF_CIERRA,OF_NO_DTO_COMPRAS,OF_MODIF_COMPRAS,MARCAJE_TIPO' +
        ','#13#10'OF_BORRADO_COMPRAS,GEST_OFE_ESC,CONTADOR_SER_PROD,Z_UN_PED_N_' +
        'OP,PRES_ULT_FEC_IMP,PRES_CONNECTIONSTRING_IMESD,OF_MOV_STOCK_CER' +
        'RAR_OP,OF_MOV_STOCK_CERRAR_COMPUESTO,OF_MOV_STOCK_CERRAR_COMPONE' +
        'NTE,OF_CREAR_LOTE_LANZAR_OP,'#13#10'ESC_PRECIO_MAT,OF_DATOS_CIERRE,CON' +
        'TADOR_CREACION_AUTO,OF_CIERRE_PARCIAL_SECUENCIAL,OF_USAR_PRECIO_' +
        'LOTE,OF_UN_FABRICADES_MOV_COMPONENTE,GEST_OFE_TRABAJAR_ESC_OFE,A' +
        'LMACEN_ENT,ALMACEN_LAN,ALMACEN_SAL,'#13#10'OF_CIERRE_PARCIAL_NO_MOV_CO' +
        'MPON,ALMACEN_RET,CANT_MIN_ALM_RET,ALMACEN_REC,NO_EXCEDER_UNIDADE' +
        'S_RESERVADAS,GEST_ESC_MODELO,ALM_PREPARACION_TE,ALM_TEX,ALM_ENTR' +
        'ADA_TEX)'
      'VALUES'
      
        '  (?ID,'#13#10'?EMPRESA,?PREVALECE_ALM_ORDEN,?CERRAR_SUBORDENES,?ACTIV' +
        'AR_QUIMICAS,?QUIM_TIPOCONTROL,?QUIM_FILTRO_ARTICULO_FASES,?ESC_G' +
        'ENERA_OF,?ESC_MODIFICAR_COSTE,?ESC_MATERIALES,?ESC_AUTO_CALCULAR' +
        ','#13#10'?ESC_RECURSOS,?QUIM_DENSIDAD,?ESC_PORCENT,?IMPORTAR_OP,?CASO_' +
        'OP,?RESERVA_STOCK_OP,?ESC_ACTIVO,?GEST_OFERTAS_ESC,?GEST_ESC_POR' +
        'DEFECTO,?GEST_FILTRO_ESC_PED,'#13#10'?ESC_TRASPASAR_MEDIDAS_OF,?GEST_P' +
        'RECIO_VENTA_PEDIDO,?GEST_OF_PED_PROV,?COMPUESTOS_VIRTUALES,?OF_U' +
        'DS_PENDIENTES,?GEST_PED_AUTO,?GEST_OF_CIERRA,?OF_NO_DTO_COMPRAS,' +
        '?OF_MODIF_COMPRAS,?MARCAJE_TIPO,'#13#10'?OF_BORRADO_COMPRAS,?GEST_OFE_' +
        'ESC,?CONTADOR_SER_PROD,?Z_UN_PED_N_OP,?PRES_ULT_FEC_IMP,?PRES_CO' +
        'NNECTIONSTRING_IMESD,?OF_MOV_STOCK_CERRAR_OP,?OF_MOV_STOCK_CERRA' +
        'R_COMPUESTO,?OF_MOV_STOCK_CERRAR_COMPONENTE,?OF_CREAR_LOTE_LANZA' +
        'R_OP,'#13#10'?ESC_PRECIO_MAT,?OF_DATOS_CIERRE,?CONTADOR_CREACION_AUTO,' +
        '?OF_CIERRE_PARCIAL_SECUENCIAL,?OF_USAR_PRECIO_LOTE,?OF_UN_FABRIC' +
        'ADES_MOV_COMPONENTE,?GEST_OFE_TRABAJAR_ESC_OFE,?ALMACEN_ENT,?ALM' +
        'ACEN_LAN,?ALMACEN_SAL,'#13#10'?OF_CIERRE_PARCIAL_NO_MOV_COMPON,?ALMACE' +
        'N_RET,?CANT_MIN_ALM_RET,?ALMACEN_REC,?NO_EXCEDER_UNIDADES_RESERV' +
        'ADAS,?GEST_ESC_MODELO,?ALM_PREPARACION_TE,?ALM_TEX,?ALM_ENTRADA_' +
        'TEX)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_CONSTANTES'
      'WHERE'
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_CONSTANTES'
      'WHERE'
      'EMPRESA=?EMPRESA ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_CONSTANTES'
      'SET'
      '  ID=?ID '
      '  ,PREVALECE_ALM_ORDEN=?PREVALECE_ALM_ORDEN '
      '  ,CERRAR_SUBORDENES=?CERRAR_SUBORDENES '
      '  ,ACTIVAR_QUIMICAS=?ACTIVAR_QUIMICAS '
      '  ,QUIM_TIPOCONTROL=?QUIM_TIPOCONTROL '
      '  ,QUIM_FILTRO_ARTICULO_FASES=?QUIM_FILTRO_ARTICULO_FASES '
      '  ,ESC_GENERA_OF=?ESC_GENERA_OF '
      '  ,ESC_MODIFICAR_COSTE=?ESC_MODIFICAR_COSTE '
      '  ,ESC_MATERIALES=?ESC_MATERIALES '
      '  ,ESC_AUTO_CALCULAR=?ESC_AUTO_CALCULAR '
      '  ,ESC_RECURSOS=?ESC_RECURSOS '
      '  ,QUIM_DENSIDAD=?QUIM_DENSIDAD '
      '  ,ESC_PORCENT=?ESC_PORCENT '
      '  ,IMPORTAR_OP=?IMPORTAR_OP '
      '  ,CASO_OP=?CASO_OP '
      '  ,RESERVA_STOCK_OP=?RESERVA_STOCK_OP '
      '  ,ESC_ACTIVO=?ESC_ACTIVO '
      '  ,GEST_OFERTAS_ESC=?GEST_OFERTAS_ESC '
      '  ,GEST_ESC_PORDEFECTO=?GEST_ESC_PORDEFECTO '
      '  ,GEST_FILTRO_ESC_PED=?GEST_FILTRO_ESC_PED '
      '  ,ESC_TRASPASAR_MEDIDAS_OF=?ESC_TRASPASAR_MEDIDAS_OF '
      '  ,GEST_PRECIO_VENTA_PEDIDO=?GEST_PRECIO_VENTA_PEDIDO '
      '  ,GEST_OF_PED_PROV=?GEST_OF_PED_PROV '
      '  ,COMPUESTOS_VIRTUALES=?COMPUESTOS_VIRTUALES '
      '  ,OF_UDS_PENDIENTES=?OF_UDS_PENDIENTES '
      '  ,GEST_PED_AUTO=?GEST_PED_AUTO '
      '  ,GEST_OF_CIERRA=?GEST_OF_CIERRA '
      '  ,OF_NO_DTO_COMPRAS=?OF_NO_DTO_COMPRAS '
      '  ,OF_MODIF_COMPRAS=?OF_MODIF_COMPRAS '
      '  ,MARCAJE_TIPO=?MARCAJE_TIPO '
      '  ,OF_BORRADO_COMPRAS=?OF_BORRADO_COMPRAS '
      '  ,GEST_OFE_ESC=?GEST_OFE_ESC '
      '  ,CONTADOR_SER_PROD=?CONTADOR_SER_PROD '
      '  ,Z_UN_PED_N_OP=?Z_UN_PED_N_OP '
      '  ,PRES_ULT_FEC_IMP=?PRES_ULT_FEC_IMP '
      '  ,PRES_CONNECTIONSTRING_IMESD=?PRES_CONNECTIONSTRING_IMESD '
      '  ,OF_MOV_STOCK_CERRAR_OP=?OF_MOV_STOCK_CERRAR_OP '
      '  ,OF_MOV_STOCK_CERRAR_COMPUESTO=?OF_MOV_STOCK_CERRAR_COMPUESTO '
      
        '  ,OF_MOV_STOCK_CERRAR_COMPONENTE=?OF_MOV_STOCK_CERRAR_COMPONENT' +
        'E '
      '  ,OF_CREAR_LOTE_LANZAR_OP=?OF_CREAR_LOTE_LANZAR_OP '
      '  ,ESC_PRECIO_MAT=?ESC_PRECIO_MAT '
      '  ,OF_DATOS_CIERRE=?OF_DATOS_CIERRE '
      '  ,CONTADOR_CREACION_AUTO=?CONTADOR_CREACION_AUTO '
      '  ,OF_CIERRE_PARCIAL_SECUENCIAL=?OF_CIERRE_PARCIAL_SECUENCIAL '
      '  ,OF_USAR_PRECIO_LOTE=?OF_USAR_PRECIO_LOTE '
      
        '  ,OF_UN_FABRICADES_MOV_COMPONENTE=?OF_UN_FABRICADES_MOV_COMPONE' +
        'NTE '
      '  ,GEST_OFE_TRABAJAR_ESC_OFE=?GEST_OFE_TRABAJAR_ESC_OFE '
      '  ,ALMACEN_ENT=?ALMACEN_ENT '
      '  ,ALMACEN_LAN=?ALMACEN_LAN '
      '  ,ALMACEN_SAL=?ALMACEN_SAL '
      
        '  ,OF_CIERRE_PARCIAL_NO_MOV_COMPON=?OF_CIERRE_PARCIAL_NO_MOV_COM' +
        'PON '
      '  ,ALMACEN_RET=?ALMACEN_RET '
      '  ,CANT_MIN_ALM_RET=?CANT_MIN_ALM_RET '
      '  ,ALMACEN_REC=?ALMACEN_REC '
      
        '  ,NO_EXCEDER_UNIDADES_RESERVADAS=?NO_EXCEDER_UNIDADES_RESERVADA' +
        'S '
      '  ,GEST_ESC_MODELO=?GEST_ESC_MODELO '
      '  ,ALM_PREPARACION_TE=?ALM_PREPARACION_TE '
      '  ,ALM_TEX=?ALM_TEX '
      '  ,ALM_ENTRADA_TEX=?ALM_ENTRADA_TEX '
      'WHERE'
      '  EMPRESA=?EMPRESA ')
    AfterOpen = QMConfiguracionAfterOpen
    AfterPost = Graba
    ClavesPrimarias.Strings = (
      'EMPRESA')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_CONSTANTES'
    UpdateTransaction = TLocal
    Left = 32
    Top = 16
    object QMConfiguracionID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMConfiguracionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMConfiguracionPREVALECE_ALM_ORDEN: TIntegerField
      DisplayLabel = 'Prevalece Alm. Ord.'
      FieldName = 'PREVALECE_ALM_ORDEN'
    end
    object QMConfiguracionCERRAR_SUBORDENES: TIntegerField
      DisplayLabel = 'Cerrar Subord.'
      FieldName = 'CERRAR_SUBORDENES'
    end
    object QMConfiguracionACTIVAR_QUIMICAS: TIntegerField
      DisplayLabel = 'Activar Quimicas'
      FieldName = 'ACTIVAR_QUIMICAS'
    end
    object QMConfiguracionQUIM_TIPOCONTROL: TIntegerField
      DisplayLabel = 'Tipo Control'
      FieldName = 'QUIM_TIPOCONTROL'
    end
    object QMConfiguracionQUIM_FILTRO_ARTICULO_FASES: TIntegerField
      DisplayLabel = 'Filtro Art. Fases.'
      FieldName = 'QUIM_FILTRO_ARTICULO_FASES'
    end
    object QMConfiguracionESC_GENERA_OF: TIntegerField
      DisplayLabel = 'Genera O.P.'
      FieldName = 'ESC_GENERA_OF'
    end
    object QMConfiguracionESC_MODIFICAR_COSTE: TIntegerField
      DisplayLabel = 'Modificar Coste'
      FieldName = 'ESC_MODIFICAR_COSTE'
    end
    object QMConfiguracionESC_MATERIALES: TIntegerField
      DisplayLabel = 'Materiales'
      FieldName = 'ESC_MATERIALES'
    end
    object QMConfiguracionESC_AUTO_CALCULAR: TIntegerField
      DisplayLabel = 'Auto Calcular'
      FieldName = 'ESC_AUTO_CALCULAR'
    end
    object QMConfiguracionESC_RECURSOS: TIntegerField
      DisplayLabel = 'Recursos'
      FieldName = 'ESC_RECURSOS'
    end
    object QMConfiguracionQUIM_DENSIDAD: TIntegerField
      DisplayLabel = 'Densidad'
      FieldName = 'QUIM_DENSIDAD'
    end
    object QMConfiguracionESC_PORCENT: TIntegerField
      DisplayLabel = 'Porcentaje'
      FieldName = 'ESC_PORCENT'
    end
    object QMConfiguracionESC_ACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ESC_ACTIVO'
    end
    object QMConfiguracionGEST_OFERTAS_ESC: TIntegerField
      DisplayLabel = 'Ofertas Esc.'
      FieldName = 'GEST_OFERTAS_ESC'
    end
    object QMConfiguracionIMPORTAR_OP: TIntegerField
      DisplayLabel = 'Importar OP'
      FieldName = 'IMPORTAR_OP'
    end
    object QMConfiguracionGEST_ESC_PORDEFECTO: TIntegerField
      DisplayLabel = 'Esc. x Defecto'
      FieldName = 'GEST_ESC_PORDEFECTO'
    end
    object QMConfiguracionCASO_OP: TIntegerField
      DisplayLabel = 'Caso OP'
      FieldName = 'CASO_OP'
    end
    object QMConfiguracionRESERVA_STOCK_OP: TIntegerField
      DisplayLabel = 'Reserva Stock OP'
      FieldName = 'RESERVA_STOCK_OP'
    end
    object QMConfiguracionGEST_FILTRO_ESC_PED: TIntegerField
      DisplayLabel = 'Filtro Esc. Ped.'
      FieldName = 'GEST_FILTRO_ESC_PED'
    end
    object QMConfiguracionESC_TRASPASAR_MEDIDAS_OF: TIntegerField
      DisplayLabel = 'Trasp. Medidas O.P.'
      FieldName = 'ESC_TRASPASAR_MEDIDAS_OF'
    end
    object QMConfiguracionGEST_PRECIO_VENTA_PEDIDO: TIntegerField
      DisplayLabel = 'Precio Venta Ped.'
      FieldName = 'GEST_PRECIO_VENTA_PEDIDO'
    end
    object QMConfiguracionGEST_OF_PED_PROV: TIntegerField
      DisplayLabel = 'O.P. Ped. Prov.'
      FieldName = 'GEST_OF_PED_PROV'
    end
    object QMConfiguracionCOMPUESTOS_VIRTUALES: TIntegerField
      DisplayLabel = 'Comp. Virt.'
      FieldName = 'COMPUESTOS_VIRTUALES'
    end
    object QMConfiguracionOF_UDS_PENDIENTES: TIntegerField
      DisplayLabel = 'Uds. Pend.'
      FieldName = 'OF_UDS_PENDIENTES'
    end
    object QMConfiguracionGEST_PED_AUTO: TIntegerField
      DisplayLabel = 'Ped. Auto'
      FieldName = 'GEST_PED_AUTO'
    end
    object QMConfiguracionGEST_OF_CIERRA: TIntegerField
      DisplayLabel = 'O.P. Cierra'
      FieldName = 'GEST_OF_CIERRA'
    end
    object QMConfiguracionOF_NO_DTO_COMPRAS: TIntegerField
      DisplayLabel = 'No Dto. compras'
      FieldName = 'OF_NO_DTO_COMPRAS'
    end
    object QMConfiguracionOF_MODIF_COMPRAS: TIntegerField
      DisplayLabel = 'Modif. Compras'
      FieldName = 'OF_MODIF_COMPRAS'
    end
    object QMConfiguracionMARCAJE_TIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'MARCAJE_TIPO'
    end
    object QMConfiguracionOF_BORRADO_COMPRAS: TIntegerField
      DisplayLabel = 'Borrado Compras'
      FieldName = 'OF_BORRADO_COMPRAS'
    end
    object QMConfiguracionGEST_OFE_ESC: TIntegerField
      DisplayLabel = 'Ofer. Esc.'
      FieldName = 'GEST_OFE_ESC'
    end
    object QMConfiguracionZ_UN_PED_N_OP: TIntegerField
      DisplayLabel = 'Ud. Ped. N. O.P.'
      FieldName = 'Z_UN_PED_N_OP'
    end
    object QMConfiguracionPRES_ULT_FEC_IMP: TDateTimeField
      DisplayLabel = 'Ult. Fec. Imp.'
      FieldName = 'PRES_ULT_FEC_IMP'
    end
    object QMConfiguracionPRES_CONNECTIONSTRING_IMESD: TBlobField
      DisplayLabel = 'Connectionstring IMESD'
      FieldName = 'PRES_CONNECTIONSTRING_IMESD'
      Size = 8
    end
    object QMConfiguracionOF_MOV_STOCK_CERRAR_OP: TIntegerField
      DisplayLabel = 'Mov. Stock Cerrar O.P.'
      FieldName = 'OF_MOV_STOCK_CERRAR_OP'
    end
    object QMConfiguracionOF_MOV_STOCK_CERRAR_COMPUESTO: TIntegerField
      DisplayLabel = 'Mov. Stock Cerrar Compuesto'
      FieldName = 'OF_MOV_STOCK_CERRAR_COMPUESTO'
    end
    object QMConfiguracionOF_MOV_STOCK_CERRAR_COMPONENTE: TIntegerField
      DisplayLabel = 'Mov. Stock Cerrar Componente'
      FieldName = 'OF_MOV_STOCK_CERRAR_COMPONENTE'
    end
    object QMConfiguracionOF_CREAR_LOTE_LANZAR_OP: TIntegerField
      DisplayLabel = 'Cerra Lote Lanzar O.P.'
      FieldName = 'OF_CREAR_LOTE_LANZAR_OP'
    end
    object QMConfiguracionESC_PRECIO_MAT: TIntegerField
      DisplayLabel = 'Precio Mat.'
      FieldName = 'ESC_PRECIO_MAT'
    end
    object QMConfiguracionOF_DATOS_CIERRE: TIntegerField
      DisplayLabel = 'Datos Cierre'
      FieldName = 'OF_DATOS_CIERRE'
    end
    object QMConfiguracionCONTADOR_CREACION_AUTO: TIntegerField
      DisplayLabel = 'Creacion Auto'
      FieldName = 'CONTADOR_CREACION_AUTO'
    end
    object QMConfiguracionCONTADOR_SER_PROD: TIntegerField
      DisplayLabel = 'Ser. Prod.'
      FieldName = 'CONTADOR_SER_PROD'
    end
    object QMConfiguracionOF_CIERRE_PARCIAL_SECUENCIAL: TIntegerField
      DisplayLabel = 'Cierre Parc. Secuencial'
      FieldName = 'OF_CIERRE_PARCIAL_SECUENCIAL'
    end
    object QMConfiguracionOF_USAR_PRECIO_LOTE: TIntegerField
      DisplayLabel = 'Usar Precio Lote'
      FieldName = 'OF_USAR_PRECIO_LOTE'
    end
    object QMConfiguracionOF_UN_FABRICADES_MOV_COMPONENTE: TIntegerField
      DisplayLabel = 'Uds. Fabric. Mov. Componente'
      FieldName = 'OF_UN_FABRICADES_MOV_COMPONENTE'
    end
    object QMConfiguracionGEST_OFE_TRABAJAR_ESC_OFE: TIntegerField
      DisplayLabel = 'Trab. Esc. Ofer.'
      FieldName = 'GEST_OFE_TRABAJAR_ESC_OFE'
    end
    object QMConfiguracionALMACEN_ENT: TFIBStringField
      DisplayLabel = 'Almacen Ent.'
      FieldName = 'ALMACEN_ENT'
      Size = 3
    end
    object QMConfiguracionALMACEN_LAN: TFIBStringField
      DisplayLabel = 'Almacen Lan.'
      FieldName = 'ALMACEN_LAN'
      Size = 3
    end
    object QMConfiguracionALMACEN_SAL: TFIBStringField
      DisplayLabel = 'Almacen Sal.'
      FieldName = 'ALMACEN_SAL'
      Size = 3
    end
    object QMConfiguracionOF_CIERRE_PARCIAL_NO_MOV_COMPON: TIntegerField
      DisplayLabel = 'Cierre Parcial - No Realizar Mov. Stock de Componentes'
      FieldName = 'OF_CIERRE_PARCIAL_NO_MOV_COMPON'
    end
    object QMConfiguracionALMACEN_RET: TFIBStringField
      DisplayLabel = 'Almac'#233'n retales'
      FieldName = 'ALMACEN_RET'
      Size = 3
    end
    object QMConfiguracionCANT_MIN_ALM_RET: TFloatField
      DisplayLabel = 'Cant. min. alm. retal'
      FieldName = 'CANT_MIN_ALM_RET'
    end
    object QMConfiguracionALMACEN_REC: TFIBStringField
      DisplayLabel = 'Alm. Rec.'
      FieldName = 'ALMACEN_REC'
      Size = 3
    end
    object QMConfiguracionNO_EXCEDER_UNIDADES_RESERVADAS: TIntegerField
      DisplayLabel = 'No exceder unidades reservadas'
      FieldName = 'NO_EXCEDER_UNIDADES_RESERVADAS'
    end
    object QMConfiguracionALM_PREPARACION_TE: TStringField
      DisplayLabel = 'Alm. Prep. T.E.'
      FieldName = 'ALM_PREPARACION_TE'
      Size = 3
    end
    object QMConfiguracionALM_TEX: TStringField
      DisplayLabel = 'Alm. T.E.'
      FieldName = 'ALM_TEX'
      Size = 3
    end
    object QMConfiguracionALM_ENTRADA_TEX: TFIBStringField
      DisplayLabel = 'Alm. Entrada T.E.'
      FieldName = 'ALM_ENTRADA_TEX'
      Size = 3
    end
  end
  object DSConfiguracion: TDataSource
    DataSet = QMConfiguracion
    Left = 128
    Top = 16
  end
  object DSTipo_Precio: TDataSource
    DataSet = xTipoPrecio
    Left = 128
    Top = 64
  end
  object xTipoPrecio: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select TIPO_PRECIO_BASE,TITULO  from sys_tipo_precio_base'
      'where TIPO_PRECIO_BASE >= 0'
      'union all'
      
        'select cast(10 as smallint), cast('#39'Sub-escandallo'#39' as varchar(25' +
        '))'
      'from rdb$database'
      'union '
      
        'select cast(-1 as smallint), cast('#39'Fijado en detalle'#39' as varchar' +
        '(25))'
      'from rdb$database')
    UniDirectional = False
    Left = 32
    Top = 64
    object xTipoPrecioTIPO_PRECIO_BASE: TIntegerField
      DisplayLabel = 'Tipo Precio Base'
      FieldName = 'TIPO_PRECIO_BASE'
    end
    object xTipoPrecioTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 25
    end
  end
end
