object DMTareasExternas: TDMTareasExternas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 840
  Top = 273
  Height = 309
  Width = 618
  object QMPro_Ord_Tarea_Tex: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_PRO_ORD_TAREA_TEX'
      'WHERE'
      '  ID_TEX=?old_ID_TEX ')
    InsertSQL.Strings = (
      'INSERT INTO VER_PRO_ORD_TAREA_TEX'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,SERIE,RIG_OF,SUBORDEN,LINEA_FASE,LI' +
        'NEA_TAREA,ID_ORDEN,ID_E_PEDIDO,ID_TEX,'#13#10'COMPUESTO,UNI_TOTAL,FECH' +
        'A_ORD,CLIENTE,PEDIDO,LINEA_PED,SITUACION,TITULO_COMPUESTO_ORDEN,' +
        'NOMBRE_R_SOCIAL,PROVEEDOR,'#13#10'TITULO_PROVEEDOR,ALMACEN_PREPARACION' +
        ',ALMACEN_TEX,ALMACEN_ENTRADA,ARTICULO,TITULO_ARTICULO,COMPUESTO_' +
        'COMPONENTE,TITULO_COMPUESTO_COMPONENTE)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?SERIE,?RIG_OF,?SUBORDEN,?LINEA_' +
        'FASE,?LINEA_TAREA,?ID_ORDEN,?ID_E_PEDIDO,?ID_TEX,'#13#10'?COMPUESTO,?U' +
        'NI_TOTAL,?FECHA_ORD,?CLIENTE,?PEDIDO,?LINEA_PED,?SITUACION,?TITU' +
        'LO_COMPUESTO_ORDEN,?NOMBRE_R_SOCIAL,?PROVEEDOR,'#13#10'?TITULO_PROVEED' +
        'OR,?ALMACEN_PREPARACION,?ALMACEN_TEX,?ALMACEN_ENTRADA,?ARTICULO,' +
        '?TITULO_ARTICULO,?COMPUESTO_COMPONENTE,?TITULO_COMPUESTO_COMPONE' +
        'NTE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PRO_ORD_TAREA_TEX'
      'WHERE'
      '  ID_TEX=?ID_TEX ')
    SelectSQL.Strings = (
      '/* Se define dinamicamente */'
      'SELECT * FROM VER_PRO_ORD_TAREA_TEX'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL'
      
        ' ORDER BY EMPRESA, EJERCICIO, CANAL, SERIE, RIG_OF, LINEA_FASE, ' +
        'LINEA_TAREA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_PRO_ORD_TAREA_TEX'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,SERIE=?SERIE '
      '  ,RIG_OF=?RIG_OF '
      '  ,SUBORDEN=?SUBORDEN '
      '  ,LINEA_FASE=?LINEA_FASE '
      '  ,LINEA_TAREA=?LINEA_TAREA '
      '  ,ID_ORDEN=?ID_ORDEN '
      '  ,ID_E_PEDIDO=?ID_E_PEDIDO '
      '  ,COMPUESTO=?COMPUESTO '
      '  ,UNI_TOTAL=?UNI_TOTAL '
      '  ,FECHA_ORD=?FECHA_ORD '
      '  ,CLIENTE=?CLIENTE '
      '  ,PEDIDO=?PEDIDO '
      '  ,LINEA_PED=?LINEA_PED '
      '  ,SITUACION=?SITUACION '
      '  ,TITULO_COMPUESTO_ORDEN=?TITULO_COMPUESTO_ORDEN '
      '  ,NOMBRE_R_SOCIAL=?NOMBRE_R_SOCIAL '
      '  ,PROVEEDOR=?PROVEEDOR '
      '  ,TITULO_PROVEEDOR=?TITULO_PROVEEDOR '
      '  ,ALMACEN_PREPARACION=?ALMACEN_PREPARACION '
      '  ,ALMACEN_TEX=?ALMACEN_TEX '
      '  ,ALMACEN_ENTRADA=?ALMACEN_ENTRADA '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO_ARTICULO=?TITULO_ARTICULO '
      '  ,COMPUESTO_COMPONENTE=?COMPUESTO_COMPONENTE '
      '  ,TITULO_COMPUESTO_COMPONENTE=?TITULO_COMPUESTO_COMPONENTE '
      'WHERE'
      '  ID_TEX=?ID_TEX ')
    AfterOpen = QMPro_Ord_Tarea_TexAfterOpen
    OnCalcFields = QMPro_Ord_Tarea_TexCalcFields
    ClavesPrimarias.Strings = (
      'ID_TEX ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_PRO_ORD_TAREA_TEX'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 88
    Top = 16
    object QMPro_Ord_Tarea_TexEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPro_Ord_Tarea_TexEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMPro_Ord_Tarea_TexCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMPro_Ord_Tarea_TexSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMPro_Ord_Tarea_TexRIG_OF: TIntegerField
      DisplayLabel = 'Rig'
      FieldName = 'RIG_OF'
    end
    object QMPro_Ord_Tarea_TexSUBORDEN: TIntegerField
      DisplayLabel = 'SubOrden'
      FieldName = 'SUBORDEN'
    end
    object QMPro_Ord_Tarea_TexLINEA_FASE: TIntegerField
      DisplayLabel = 'L. Fase'
      FieldName = 'LINEA_FASE'
    end
    object QMPro_Ord_Tarea_TexLINEA_TAREA: TIntegerField
      DisplayLabel = 'L. Tarea'
      FieldName = 'LINEA_TAREA'
    end
    object QMPro_Ord_Tarea_TexID_ORDEN: TIntegerField
      DisplayLabel = 'Id Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMPro_Ord_Tarea_TexID_E_PEDIDO: TIntegerField
      DisplayLabel = 'Id Pedido'
      FieldName = 'ID_E_PEDIDO'
    end
    object QMPro_Ord_Tarea_TexID_TEX: TIntegerField
      DisplayLabel = 'Id.'
      FieldName = 'ID_TEX'
    end
    object QMPro_Ord_Tarea_TexCOMPUESTO: TFIBStringField
      DisplayLabel = 'Compuesto Orden'
      FieldName = 'COMPUESTO'
      Size = 15
    end
    object QMPro_Ord_Tarea_TexTITULO_COMPUESTO_ORDEN: TFIBStringField
      DisplayLabel = 'Titulo Comp. Orden'
      FieldName = 'TITULO_COMPUESTO_ORDEN'
      Size = 256
    end
    object QMPro_Ord_Tarea_TexUNI_TOTAL: TFloatField
      DisplayLabel = 'Total Unidades'
      FieldName = 'UNI_TOTAL'
    end
    object QMPro_Ord_Tarea_TexFECHA_ORD: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA_ORD'
    end
    object QMPro_Ord_Tarea_TexCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMPro_Ord_Tarea_TexPEDIDO: TIntegerField
      DisplayLabel = 'Pedido'
      FieldName = 'PEDIDO'
    end
    object QMPro_Ord_Tarea_TexLINEA_PED: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA_PED'
    end
    object QMPro_Ord_Tarea_TexSITUACION: TSmallintField
      DisplayLabel = 'Situacion'
      FieldName = 'SITUACION'
    end
    object QMPro_Ord_Tarea_TexTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'Titulo Articulo'
      FieldName = 'TITULO_ARTICULO'
      Size = 256
    end
    object QMPro_Ord_Tarea_TexNOMBRE_R_SOCIAL: TStringField
      DisplayLabel = 'Raz'#243'n Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMPro_Ord_Tarea_TexTITULO_SITUACION: TStringField
      DisplayLabel = 'Situacion'
      FieldKind = fkCalculated
      FieldName = 'TITULO_SITUACION'
      Size = 30
      Calculated = True
    end
    object QMPro_Ord_Tarea_TexPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMPro_Ord_Tarea_TexTITULO_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Titulo Prov.'
      FieldName = 'TITULO_PROVEEDOR'
      Size = 60
    end
    object QMPro_Ord_Tarea_TexALMACEN_PREPARACION: TFIBStringField
      DisplayLabel = 'Alm. Preparacion'
      FieldName = 'ALMACEN_PREPARACION'
      Size = 3
    end
    object QMPro_Ord_Tarea_TexALMACEN_TEX: TFIBStringField
      DisplayLabel = 'Alm. T.E.'
      FieldName = 'ALMACEN_TEX'
      Size = 3
    end
    object QMPro_Ord_Tarea_TexALMACEN_ENTRADA: TFIBStringField
      DisplayLabel = 'Alm. Entrada'
      FieldName = 'ALMACEN_ENTRADA'
      Size = 3
    end
    object QMPro_Ord_Tarea_TexSTOCK_ALM_PREPARACION: TFloatField
      DisplayLabel = 'Stock Prerp.'
      FieldKind = fkCalculated
      FieldName = 'STOCK_ALM_PREPARACION'
      Calculated = True
    end
    object QMPro_Ord_Tarea_TexSTOCK_ALM_TEX: TFloatField
      DisplayLabel = 'Stock T.E.'
      FieldKind = fkCalculated
      FieldName = 'STOCK_ALM_TEX'
      Calculated = True
    end
    object QMPro_Ord_Tarea_TexSTOCK_ALM_ENTRADA: TFloatField
      DisplayLabel = 'Stock Entrada'
      FieldKind = fkCalculated
      FieldName = 'STOCK_ALM_ENTRADA'
      Calculated = True
    end
    object QMPro_Ord_Tarea_TexARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMPro_Ord_Tarea_TexCOMPUESTO_COMPONENTE: TFIBStringField
      DisplayLabel = 'Compuesto/Componente'
      FieldName = 'COMPUESTO_COMPONENTE'
      Size = 15
    end
    object QMPro_Ord_Tarea_TexTITULO_COMPUESTO_COMPONENTE: TFIBStringField
      DisplayLabel = 'Titulo Compuesto/Componente'
      FieldName = 'TITULO_COMPUESTO_COMPONENTE'
      Size = 256
    end
    object QMPro_Ord_Tarea_TexTAREA: TFIBStringField
      DisplayLabel = 'Tarea'
      FieldName = 'TAREA'
      Size = 60
    end
    object QMPro_Ord_Tarea_TexCOMENTARIO_TAREA: TMemoField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO_TAREA'
      BlobType = ftMemo
      Size = 8
    end
    object QMPro_Ord_Tarea_TexIMAGEN_COMPUESTO: TIntegerField
      DisplayLabel = 'Imagen'
      FieldName = 'IMAGEN_COMPUESTO'
    end
    object QMPro_Ord_Tarea_TexID_LOTE: TIntegerField
      DisplayLabel = 'Id Lote'
      FieldName = 'ID_LOTE'
    end
    object QMPro_Ord_Tarea_TexDESC_LOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'DESC_LOTE'
    end
  end
  object QMPro_Ord_Tarea_Tex_Movs: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_PRO_ORD_TAREA_TEX_MOVS'
      'WHERE'
      '  ID_TEX_MOV=?old_ID_TEX_MOV ')
    InsertSQL.Strings = (
      'INSERT INTO VER_PRO_ORD_TAREA_TEX_MOVS ('
      
        ' ID_TEX_MOV, ID_TEX, FECHA, ID_A, EMPRESA, ARTICULO, TITULO_ARTI' +
        'CULO, PROVEEDOR, ALMACEN_PERPARACION, ALMACEN_TEX,'
      
        ' UNIDADES, TIPO_OPERACION, TIPO_DOC, ID_DOC, ID_ST, NOMBRE_R_SOC' +
        'IAL, COMPUESTO_COMPONENTE, TITULO_COMPUESTO_COMPONENTE,'
      ' UNIDADES_COMPUESTO_COMPONENTE, CAJAS, ALBARAN_PROVEEDOR, KILOS)'
      'VALUES ('
      
        ' ?ID_TEX_MOV, ?ID_TEX, ?FECHA, ?ID_A, ?EMPRESA, ?ARTICULO, ?TITU' +
        'LO_ARTICULO, ?PROVEEDOR, ?ALMACEN_PERPARACION,'
      
        ' ?ALMACEN_TEX, ?UNIDADES, ?TIPO_OPERACION, ?TIPO_DOC, ?ID_DOC, ?' +
        'ID_ST, ?NOMBRE_R_SOCIAL, ?COMPUESTO_COMPONENTE,'
      
        ' ?TITULO_COMPUESTO_COMPONENTE, ?UNIDADES_COMPUESTO_COMPONENTE, ?' +
        'CAJAS, ?ALBARAN_PROVEEDOR, ?KILOS)'
      ' ')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PRO_ORD_TAREA_TEX_MOVS'
      'WHERE'
      '  ID_TEX_MOV=?ID_TEX_MOV ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_PRO_ORD_TAREA_TEX_MOVS'
      'WHERE'
      'ID_TEX=?ID_TEX '
      'ORDER BY FECHA, ID_TEX_MOV')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_PRO_ORD_TAREA_TEX_MOVS'
      'SET'
      '  ID_TEX=?ID_TEX '
      '  ,FECHA=?FECHA '
      '  ,ID_A=?ID_A '
      '  ,EMPRESA=?EMPRESA '
      '  ,ARTICULO=?ARTICULO '
      '  ,TITULO_ARTICULO=?TITULO_ARTICULO '
      '  ,PROVEEDOR=?PROVEEDOR '
      '  ,ALMACEN_PERPARACION=?ALMACEN_PERPARACION '
      '  ,ALMACEN_TEX=?ALMACEN_TEX '
      '  ,UNIDADES=?UNIDADES '
      '  ,TIPO_OPERACION=?TIPO_OPERACION '
      '  ,TIPO_DOC=?TIPO_DOC '
      '  ,ID_DOC=?ID_DOC '
      '  ,ID_ST=?ID_ST '
      '  ,NOMBRE_R_SOCIAL=?NOMBRE_R_SOCIAL '
      '  ,COMPUESTO_COMPONENTE=?COMPUESTO_COMPONENTE '
      '  ,TITULO_COMPUESTO_COMPONENTE=?TITULO_COMPUESTO_COMPONENTE '
      '  ,UNIDADES_COMPUESTO_COMPONENTE=?UNIDADES_COMPUESTO_COMPONENTE '
      '  ,CAJAS=?CAJAS'
      '  ,ALBARAN_PROVEEDOR=?ALBARAN_PROVEEDOR'
      '  ,KILOS=?KILOS'
      'WHERE'
      '  ID_TEX_MOV=?ID_TEX_MOV ')
    DataSource = DSQMPro_Ord_Tarea_Tex
    AfterPost = QMPro_Ord_Tarea_Tex_MovsAfterPost
    BeforePost = QMPro_Ord_Tarea_Tex_MovsBeforePost
    OnCalcFields = QMPro_Ord_Tarea_Tex_MovsCalcFields
    OnNewRecord = QMPro_Ord_Tarea_Tex_MovsNewRecord
    ClavesPrimarias.Strings = (
      'ID_TEX_MOV ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_PRO_ORD_TAREA_TEX_MOVS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 88
    Top = 72
    object QMPro_Ord_Tarea_Tex_MovsID_TEX_MOV: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_TEX_MOV'
    end
    object QMPro_Ord_Tarea_Tex_MovsID_TEX: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_TEX'
    end
    object QMPro_Ord_Tarea_Tex_MovsFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMPro_Ord_Tarea_Tex_MovsID_A: TIntegerField
      DisplayLabel = 'Id. Art.'
      FieldName = 'ID_A'
    end
    object QMPro_Ord_Tarea_Tex_MovsPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMPro_Ord_Tarea_Tex_MovsALMACEN_PERPARACION: TFIBStringField
      DisplayLabel = 'Alm. Preparaci'#243'n'
      FieldName = 'ALMACEN_PERPARACION'
      Size = 3
    end
    object QMPro_Ord_Tarea_Tex_MovsALMACEN_TEX: TFIBStringField
      DisplayLabel = 'Alm. T.E.'
      FieldName = 'ALMACEN_TEX'
      Size = 3
    end
    object QMPro_Ord_Tarea_Tex_MovsUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object QMPro_Ord_Tarea_Tex_MovsTIPO_OPERACION: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_OPERACION'
      Size = 1
    end
    object QMPro_Ord_Tarea_Tex_MovsTIPO_DOC: TFIBStringField
      DisplayLabel = 'Tipo Doc.'
      FieldName = 'TIPO_DOC'
      Size = 3
    end
    object QMPro_Ord_Tarea_Tex_MovsID_DOC: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_DOC'
    end
    object QMPro_Ord_Tarea_Tex_MovsID_ST: TIntegerField
      DisplayLabel = 'Id Movimiento'
      FieldName = 'ID_ST'
    end
    object QMPro_Ord_Tarea_Tex_MovsEJERCICIO_DOC: TIntegerField
      DisplayLabel = 'Ejercicio Doc.'
      FieldName = 'EJERCICIO_DOC'
    end
    object QMPro_Ord_Tarea_Tex_MovsCANAL_DOC: TIntegerField
      DisplayLabel = 'Canal Doc.'
      FieldName = 'CANAL_DOC'
    end
    object QMPro_Ord_Tarea_Tex_MovsSERIE_DOC: TStringField
      DisplayLabel = 'Serie Doc.'
      FieldName = 'SERIE_DOC'
      Size = 10
    end
    object QMPro_Ord_Tarea_Tex_MovsRIG_DOC: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG_DOC'
    end
    object QMPro_Ord_Tarea_Tex_MovsEJERCICIO_ST: TIntegerField
      DisplayLabel = 'Ejercicio Mov.'
      FieldName = 'EJERCICIO_ST'
    end
    object QMPro_Ord_Tarea_Tex_MovsSERIE_ST: TStringField
      DisplayLabel = 'Serie Mov.'
      FieldName = 'SERIE_ST'
      Size = 10
    end
    object QMPro_Ord_Tarea_Tex_MovsRIG_ST: TIntegerField
      DisplayLabel = 'Nro. Mov.'
      FieldName = 'RIG_ST'
    end
    object QMPro_Ord_Tarea_Tex_MovsSTOCK_PERPARACION: TFloatField
      DisplayLabel = 'Stock Virt. Prep.'
      FieldKind = fkCalculated
      FieldName = 'STOCK_PERPARACION'
      Calculated = True
    end
    object QMPro_Ord_Tarea_Tex_MovsSTOCK_TEX: TFloatField
      DisplayLabel = 'Stock Virt. T.E.'
      FieldKind = fkCalculated
      FieldName = 'STOCK_TEX'
      Calculated = True
    end
    object QMPro_Ord_Tarea_Tex_MovsNOMBRE_R_SOCIAL: TStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMPro_Ord_Tarea_Tex_MovsARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMPro_Ord_Tarea_Tex_MovsTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'Titulo Articulo'
      FieldName = 'TITULO_ARTICULO'
      Size = 256
    end
    object QMPro_Ord_Tarea_Tex_MovsUNIDADES_COMPUESTO_COMPONENTE: TFloatField
      DisplayLabel = 'Uds. Compuesto'
      FieldName = 'UNIDADES_COMPUESTO_COMPONENTE'
    end
    object QMPro_Ord_Tarea_Tex_MovsEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPro_Ord_Tarea_Tex_MovsCOMPUESTO_COMPONENTE: TFIBStringField
      DisplayLabel = 'Compuesto'
      FieldName = 'COMPUESTO_COMPONENTE'
      Size = 15
    end
    object QMPro_Ord_Tarea_Tex_MovsTITULO_COMPUESTO_COMPONENTE: TFIBStringField
      DisplayLabel = 'Titulo Comp.'
      FieldName = 'TITULO_COMPUESTO_COMPONENTE'
      Size = 256
    end
    object QMPro_Ord_Tarea_Tex_MovsCAJAS: TFloatField
      DisplayLabel = 'Cajas'
      FieldName = 'CAJAS'
    end
    object QMPro_Ord_Tarea_Tex_MovsALBARAN_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Albar'#225'n Prov.'
      FieldName = 'ALBARAN_PROVEEDOR'
      Size = 40
    end
    object QMPro_Ord_Tarea_Tex_MovsKILOS: TFloatField
      DisplayLabel = 'Kilos'
      FieldName = 'KILOS'
    end
  end
  object DSQMPro_Ord_Tarea_Tex: TDataSource
    DataSet = QMPro_Ord_Tarea_Tex
    Left = 256
    Top = 8
  end
  object DSQMPro_Ord_Tarea_Tex_Movs: TDataSource
    DataSet = QMPro_Ord_Tarea_Tex_Movs
    Left = 256
    Top = 72
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 560
    Top = 16
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 560
    Top = 72
  end
  object xPedido: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from ver_cabeceras_pedido_prov'
      'where id_e=?id_doc')
    UniDirectional = False
    DataSource = DSQMPro_Ord_Tarea_Tex_Movs
    Left = 80
    Top = 152
    object xPedidoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xPedidoEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xPedidoCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xPedidoSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xPedidoTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xPedidoRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xPedidoALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xPedidoMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xPedidoFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xPedidoPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xPedidoTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xPedidoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xPedidoNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xPedidoESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xPedidoBULTOS: TIntegerField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object xPedidoLINEAS: TIntegerField
      DisplayLabel = 'Lineas'
      FieldName = 'LINEAS'
    end
    object xPedidoBRUTO: TFloatField
      DisplayLabel = 'Bruto'
      FieldName = 'BRUTO'
    end
    object xPedidoI_DTO_LINEAS: TFloatField
      DisplayLabel = 'Imp. Dto. Lineas'
      FieldName = 'I_DTO_LINEAS'
    end
    object xPedidoS_BASES: TFloatField
      DisplayLabel = 'S. Bases'
      FieldName = 'S_BASES'
    end
    object xPedidoS_CUOTA_IVA: TFloatField
      DisplayLabel = 'S. Cuota IVA'
      FieldName = 'S_CUOTA_IVA'
    end
    object xPedidoS_CUOTA_RE: TFloatField
      DisplayLabel = 'S. Couta Ret.'
      FieldName = 'S_CUOTA_RE'
    end
    object xPedidoB_DTO_LINEAS: TFloatField
      DisplayLabel = 'B. Dto. Lineas'
      FieldName = 'B_DTO_LINEAS'
    end
    object xPedidoDTO_PP: TFloatField
      DisplayLabel = 'Dto. P.P.'
      FieldName = 'DTO_PP'
    end
    object xPedidoDTO_CIAL: TFloatField
      DisplayLabel = 'Dto. Cial'
      FieldName = 'DTO_CIAL'
    end
    object xPedidoI_DTO_CIAL: TFloatField
      DisplayLabel = 'Imp. Dto. Cial.'
      FieldName = 'I_DTO_CIAL'
    end
    object xPedidoI_DTO_PP: TFloatField
      DisplayLabel = 'Imp. Dto. PP'
      FieldName = 'I_DTO_PP'
    end
    object xPedidoLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object xPedidoENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object xPedidoNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nomb. Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object xPedidoPOR_FINANCIACION: TFloatField
      DisplayLabel = '% Financ.'
      FieldName = 'POR_FINANCIACION'
    end
    object xPedidoI_FINANCIACION: TFloatField
      DisplayLabel = 'Imp. Financ.'
      FieldName = 'I_FINANCIACION'
    end
    object xPedidoFORMA_DE_PAGO: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA_DE_PAGO'
      Size = 3
    end
    object xPedidoSU_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Referencia'
      FieldName = 'SU_REFERENCIA'
      Size = 40
    end
    object xPedidoID_E: TIntegerField
      DisplayLabel = 'ID Doc.'
      FieldName = 'ID_E'
    end
    object xPedidoFECHA_PRE_CAB: TDateTimeField
      DisplayLabel = 'Fec. Prev.'
      FieldName = 'FECHA_PRE_CAB'
    end
    object xPedidoFECHA_REC_CAB: TDateTimeField
      DisplayLabel = 'Fec. Recep.'
      FieldName = 'FECHA_REC_CAB'
    end
  end
  object DSxPedido: TDataSource
    DataSet = xPedido
    Left = 184
    Top = 152
  end
  object xAlbaranes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select pro.id_e_albaran,alb.rig, alb.fecha from pro_ord_tarea_te' +
        'x_alb pro'
      
        'join ver_cabeceras_albaran_prov alb on (pro.id_e_albaran=alb.id_' +
        'e)'
      'where id_e_pedido=?id_doc'
      'order by alb.rig')
    UniDirectional = False
    DataSource = DSQMPro_Ord_Tarea_Tex_Movs
    Left = 80
    Top = 208
    object xAlbaranesRIG: TIntegerField
      DisplayLabel = 'N'#186' Albaran'
      FieldName = 'RIG'
    end
    object xAlbaranesFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xAlbaranesID_E_ALBARAN: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_E_ALBARAN'
    end
  end
  object DSxAlbaranes: TDataSource
    DataSet = xAlbaranes
    Left = 184
    Top = 200
  end
  object xFase: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from pro_ord_fases'
      'where id_orden=?id_orden'
      ' and linea_fase=?linea_fase')
    UniDirectional = False
    DataSource = DSQMPro_Ord_Tarea_Tex
    Left = 264
    Top = 152
    object xFaseEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xFaseEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xFaseCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xFaseSERIES: TFIBStringField
      DisplayLabel = 'Series'
      FieldName = 'SERIES'
      Size = 10
    end
    object xFaseRIG_OF: TIntegerField
      DisplayLabel = 'Ord. Prod.'
      FieldName = 'RIG_OF'
    end
    object xFaseSUBORDEN: TIntegerField
      DisplayLabel = 'Suborden'
      FieldName = 'SUBORDEN'
    end
    object xFaseLINEA_FASE: TIntegerField
      DisplayLabel = 'Linea Fase'
      FieldName = 'LINEA_FASE'
    end
    object xFaseFASE: TFIBStringField
      DisplayLabel = 'Fase'
      FieldName = 'FASE'
      Size = 60
    end
    object xFaseORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object xFaseTIPOFASE: TFIBStringField
      DisplayLabel = 'Tipo Fase'
      FieldName = 'TIPOFASE'
      Size = 3
    end
    object xFaseNOTAS: TMemoField
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object xFaseDIBUJO: TFIBStringField
      DisplayLabel = 'Dibujo'
      FieldName = 'DIBUJO'
      Size = 100
    end
    object xFaseESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xFaseVALORCALIDAD: TIntegerField
      DisplayLabel = 'Valor Calidad'
      FieldName = 'VALORCALIDAD'
    end
    object xFaseFECHA_FIN_FASE: TDateTimeField
      DisplayLabel = 'Fec. Fin Fase'
      FieldName = 'FECHA_FIN_FASE'
    end
    object xFaseENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object xFaseID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
  end
  object xTarea: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from pro_ord_tarea'
      'where id_orden=?id_orden '
      'and linea_fase=?linea_fase'
      'and linea_tarea=?linea_tarea')
    UniDirectional = False
    DataSource = DSQMPro_Ord_Tarea_Tex
    Left = 264
    Top = 200
    object xTareaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xTareaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xTareaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xTareaSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xTareaRIG_OF: TIntegerField
      DisplayLabel = 'Ord. Prod.'
      FieldName = 'RIG_OF'
    end
    object xTareaSUBORDEN: TIntegerField
      DisplayLabel = 'Suborden'
      FieldName = 'SUBORDEN'
    end
    object xTareaLINEA_FASE: TIntegerField
      DisplayLabel = 'Linea Fase'
      FieldName = 'LINEA_FASE'
    end
    object xTareaLINEA_TAREA: TIntegerField
      DisplayLabel = 'Linea Tarea'
      FieldName = 'LINEA_TAREA'
    end
    object xTareaTAREA: TFIBStringField
      DisplayLabel = 'Tarea'
      FieldName = 'TAREA'
      Size = 60
    end
    object xTareaORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object xTareaTIPOTAREA: TFIBStringField
      DisplayLabel = 'Tipo Tarea'
      FieldName = 'TIPOTAREA'
      Size = 3
    end
    object xTareaCOMENTARIO: TMemoField
      FieldName = 'COMENTARIO'
      BlobType = ftMemo
      Size = 8
    end
    object xTareaRECURSO: TFIBStringField
      DisplayLabel = 'Recurso'
      FieldName = 'RECURSO'
      Size = 5
    end
    object xTareaCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object xTareaARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xTareaPRE_COS_UNI_PRE: TFloatField
      DisplayLabel = 'Coste Unit. Previsto'
      FieldName = 'PRE_COS_UNI_PRE'
    end
    object xTareaTOTAL_VAR_PRE: TFloatField
      DisplayLabel = 'Total Var. Previsto'
      FieldName = 'TOTAL_VAR_PRE'
    end
    object xTareaPRECIO_FIJO_PRE: TFloatField
      DisplayLabel = 'Precio Fijo Previsto'
      FieldName = 'PRECIO_FIJO_PRE'
    end
    object xTareaTOTAL_PRE: TFloatField
      DisplayLabel = 'Total Previsto Horas'
      FieldName = 'TOTAL_PRE'
    end
    object xTareaPRE_COS_UNI_REAL: TFloatField
      DisplayLabel = 'Coste Unit. Real'
      FieldName = 'PRE_COS_UNI_REAL'
    end
    object xTareaTOTAL_VAR_REAL: TFloatField
      DisplayLabel = 'Total Var. Real'
      FieldName = 'TOTAL_VAR_REAL'
    end
    object xTareaPRECIO_FIJO_REAL: TFloatField
      DisplayLabel = 'Precio Fijo Real'
      FieldName = 'PRECIO_FIJO_REAL'
    end
    object xTareaTOTAL_REAL: TFloatField
      DisplayLabel = 'Total Real'
      FieldName = 'TOTAL_REAL'
    end
    object xTareaESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xTareaFECHA_FIN_TAREA: TDateTimeField
      DisplayLabel = 'Fec. Fin Tarea'
      FieldName = 'FECHA_FIN_TAREA'
    end
    object xTareaIDENTIFICADOR: TIntegerField
      DisplayLabel = 'Identificador'
      FieldName = 'IDENTIFICADOR'
    end
    object xTareaENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object xTareaID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object xTareaCANTIDAD_UTIL: TFloatField
      DisplayLabel = 'Cant. Horas'
      FieldName = 'CANTIDAD_UTIL'
    end
    object xTareaID_UTILLAJE: TFIBStringField
      DisplayLabel = 'ID'
      FieldName = 'ID_UTILLAJE'
      Size = 3
    end
  end
  object DSxFase: TDataSource
    DataSet = xFase
    Left = 352
    Top = 152
  end
  object DSxTarea: TDataSource
    DataSet = xTarea
    Left = 352
    Top = 200
  end
end
