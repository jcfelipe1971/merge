object DMOrdenProduccionTallas: TDMOrdenProduccionTallas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 502
  Top = 226
  Height = 237
  Width = 332
  object QMDetalle: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from ver_tmp_art_ordenes_prod_kri'
      'where '
      'empresa= ?empresa and '
      'ejercicio = ?ejercicio and '
      'canal = ?canal and '
      'serie = ?serie and '
      'norden = ?norden and '
      's_color = ?s_color and '
      'ref_proveedor = ?ref_proveedor')
    InsertSQL.Strings = (
      'insert into ver_tmp_art_ordenes_prod_kri'
      
        '(empresa,ejercicio,canal,serie,norden,ref_proveedor,s_color,esca' +
        'ndallo,id_a_m_c_t,t01,t02,t03,t04,t05,t06,t07,t08,t09,t10,t11,t1' +
        '2,t13,t14,t15,t16,t17,t18,t19,t20,t21,t22)'
      'values'
      
        '(?empresa,?ejercicio,?canal,?serie,?norden,?ref_proveedor,?s_col' +
        'or,?escandallo,0,?t01,?t02,?t03,?t04,?t05,?t06,?t07,?t08,?t09,?t' +
        '10,?t11,?t12,?t13,?t14,?t15,?t16,?t17,?t18,?t19,?t20,?t21,?t22)')
    RefreshSQL.Strings = (
      
        'Select * FROM xver_tmp_art_ordenes_prod_kri(?empresa,?ejercicio,' +
        '?canal,?serie,?norden)'
      'where '
      'empresa= ?empresa and '
      'ejercicio = ?ejercicio and '
      'canal = ?canal and '
      'serie = ?serie and '
      'norden = ?norden and '
      's_color = ?s_color and '
      'ref_proveedor = ?ref_proveedor')
    SelectSQL.Strings = (
      
        'Select * FROM xver_tmp_art_ordenes_prod_kri(?empresa,?ejercicio,' +
        '?canal,?serie,?norden)'
      'order by titmc,s_color')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'update ver_tmp_art_ordenes_prod_kri'
      'set '
      'escandallo = ?escandallo,'
      't01 = ?t01,'
      't02 = ?t02,'
      't03 = ?t03,'
      't04 = ?t04,'
      't05 = ?t05,'
      't06 = ?t06,'
      't07 = ?t07,'
      't08 = ?t08,'
      't09 = ?t09,'
      't10 = ?t10,'
      't11 = ?t11,'
      't12 = ?t12,'
      't13 = ?t13,'
      't14 = ?t14,'
      't15 = ?t15,'
      't16 = ?t16,'
      't17 = ?t17,'
      't18 = ?t18,'
      't19 = ?t19,'
      't10 = ?t10,'
      't21 = ?t21,'
      't22 = ?t22'
      'where '
      'empresa= ?empresa and '
      'ejercicio = ?ejercicio and '
      'canal = ?canal and '
      'serie = ?serie and '
      'norden = ?norden and '
      's_color = ?s_color and '
      'ref_proveedor = ?ref_proveedor')
    DataSource = DSQMCabecera
    AfterPost = QMDetalleAfterPost
    AfterScroll = QMDetalleAfterScroll
    BeforeInsert = QMDetalleBeforeInsert
    OnNewRecord = QMDetalleNewRecord
    Left = 72
    Top = 56
    object QMDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetalleEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDetalleCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDetalleSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMDetalleNORDEN: TIntegerField
      DisplayLabel = 'Nro. Orden'
      FieldName = 'NORDEN'
    end
    object QMDetalleREF_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Ref. Proveedor'
      FieldName = 'REF_PROVEEDOR'
      OnChange = QMDetalleREF_PROVEEDORChange
      Size = 25
    end
    object QMDetalleESCANDALLO: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'ESCANDALLO'
    end
    object QMDetalleS_COLOR: TFIBStringField
      DisplayLabel = 'Color'
      FieldName = 'S_COLOR'
      Size = 10
    end
    object QMDetalleID_A_M_C: TIntegerField
      DisplayLabel = 'ID Mod.'
      FieldName = 'ID_A_M_C'
    end
    object QMDetalleID_G_T: TIntegerField
      DisplayLabel = 'ID Grupo Tallas'
      FieldName = 'ID_G_T'
    end
    object QMDetalleTITM: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITM'
      Size = 60
    end
    object QMDetalleTITMC: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITMC'
      Size = 60
    end
    object QMDetalleT01: TFloatField
      DisplayLabel = ''
      FieldName = 'T01'
    end
    object QMDetalleT02: TFloatField
      DisplayLabel = ''
      FieldName = 'T02'
    end
    object QMDetalleT03: TFloatField
      DisplayLabel = ''
      FieldName = 'T03'
    end
    object QMDetalleT04: TFloatField
      DisplayLabel = ''
      FieldName = 'T04'
    end
    object QMDetalleT05: TFloatField
      DisplayLabel = ''
      FieldName = 'T05'
    end
    object QMDetalleT06: TFloatField
      DisplayLabel = ''
      FieldName = 'T06'
    end
    object QMDetalleT07: TFloatField
      DisplayLabel = ''
      FieldName = 'T07'
    end
    object QMDetalleT08: TFloatField
      DisplayLabel = ''
      FieldName = 'T08'
    end
    object QMDetalleT09: TFloatField
      DisplayLabel = ''
      FieldName = 'T09'
    end
    object QMDetalleT10: TFloatField
      DisplayLabel = ''
      FieldName = 'T10'
    end
    object QMDetalleT11: TFloatField
      DisplayLabel = ''
      FieldName = 'T11'
    end
    object QMDetalleT12: TFloatField
      DisplayLabel = ''
      FieldName = 'T12'
    end
    object QMDetalleT13: TFloatField
      DisplayLabel = ''
      FieldName = 'T13'
    end
    object QMDetalleT14: TFloatField
      DisplayLabel = ''
      FieldName = 'T14'
    end
    object QMDetalleT15: TFloatField
      DisplayLabel = ''
      FieldName = 'T15'
    end
    object QMDetalleT16: TFloatField
      DisplayLabel = ''
      FieldName = 'T16'
    end
    object QMDetalleT17: TFloatField
      DisplayLabel = ''
      FieldName = 'T17'
    end
    object QMDetalleT18: TFloatField
      DisplayLabel = ''
      FieldName = 'T18'
    end
    object QMDetalleT19: TFloatField
      DisplayLabel = ''
      FieldName = 'T19'
    end
    object QMDetalleT20: TFloatField
      DisplayLabel = ''
      FieldName = 'T20'
    end
    object QMDetalleT21: TFloatField
      DisplayLabel = ''
      FieldName = 'T21'
    end
    object QMDetalleT22: TFloatField
      DisplayLabel = ''
      FieldName = 'T22'
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 248
    Top = 8
  end
  object QMCabecera: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM tmp_art_ordenes_prod_cab_kri'
      'where'
      'empresa = ?empresa and'
      'ejercicio = ?ejercicio and'
      'canal = ?canal and'
      'serie = ?serie and'
      'norden = ?norden')
    InsertSQL.Strings = (
      'insert into tmp_art_ordenes_prod_cab_kri'
      
        '(EMPRESA,EJERCICIO,CANAL,SERIE,NORDEN,PEDIDO,LINEA,ALMACEN,PRIOR' +
        'IDAD,P_MERMA,FECHA_ORDEN,FECHA_ENTREGA,MATERIAL,TERCERO_OPERARIO' +
        ')'
      'values'
      
        '(?EMPRESA,?EJERCICIO,?CANAL,?SERIE,?NORDEN,?PEDIDO,?LINEA,?ALMAC' +
        'EN,?PRIORIDAD,?P_MERMA,?FECHA_ORDEN,?FECHA_ENTREGA,?MATERIAL,?TE' +
        'RCERO_OPERARIO)')
    RefreshSQL.Strings = (
      'SELECT * FROM tmp_art_ordenes_prod_cab_kri'
      'where'
      'empresa = ?empresa and'
      'ejercicio = ?ejercicio and'
      'canal = ?canal and'
      'serie = ?serie and'
      'norden = ?norden')
    SelectSQL.Strings = (
      'SELECT * FROM tmp_art_ordenes_prod_cab_kri'
      'where'
      'empresa = ?empresa ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE tmp_art_ordenes_prod_cab_kri'
      'SET'
      'PEDIDO=?PEDIDO,'
      'LINEA=?LINEA,'
      'ALMACEN=?ALMACEN,'
      'PRIORIDAD=?PRIORIDAD,'
      'P_MERMA=?P_MERMA,'
      'FECHA_ORDEN=?FECHA_ORDEN,'
      'FECHA_ENTREGA=?FECHA_ENTREGA,'
      'MATERIAL=?MATERIAL,'
      'TERCERO_OPERARIO=?TERCERO_OPERARIO'
      'WHERE'
      'empresa = ?empresa and'
      'ejercicio = ?ejercicio and'
      'canal = ?canal and'
      'serie = ?serie and'
      'norden = ?norden')
    AfterPost = QMCabeceraAfterPost
    AfterScroll = QMCabeceraAfterScroll
    BeforePost = QMCabeceraBeforePost
    OnNewRecord = QMCabeceraNewRecord
    Left = 72
    Top = 8
    object QMCabeceraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCabeceraEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCabeceraCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCabeceraSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMCabeceraNORDEN: TIntegerField
      DisplayLabel = 'N. Orden'
      FieldName = 'NORDEN'
    end
    object QMCabeceraPEDIDO: TIntegerField
      DisplayLabel = 'Pedido'
      FieldName = 'PEDIDO'
    end
    object QMCabeceraLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMCabeceraALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMCabeceraPRIORIDAD: TIntegerField
      DisplayLabel = 'Prioridad'
      FieldName = 'PRIORIDAD'
    end
    object QMCabeceraP_MERMA: TFloatField
      DisplayLabel = 'P. Merma'
      FieldName = 'P_MERMA'
    end
    object QMCabeceraFECHA_ENTREGA: TDateTimeField
      DisplayLabel = 'Fec. Entrega'
      FieldName = 'FECHA_ENTREGA'
    end
    object QMCabeceraMATERIAL: TIntegerField
      DisplayLabel = 'Material'
      FieldName = 'MATERIAL'
    end
    object QMCabeceraTERCERO_OPERARIO: TIntegerField
      DisplayLabel = 'Terc. Operario'
      FieldName = 'TERCERO_OPERARIO'
    end
    object QMCabeceraFECHA_ORDEN: TDateTimeField
      DisplayLabel = 'Fec. Orden'
      FieldName = 'FECHA_ORDEN'
    end
  end
  object DSQMCabecera: TDataSource
    DataSet = QMCabecera
    Left = 168
    Top = 8
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 168
    Top = 56
  end
  object QMaxNOrden: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select max(norden) from tmp_art_ordenes_prod_cab_kri'
      'where '
      'empresa = ?empresa and'
      'ejercicio = ?ejercicio and'
      'canal = ?canal and'
      'serie = ?serie')
    Left = 248
    Top = 56
  end
  object QID_G_T: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select ID_G_T from art_articulos_modelos'
      'where '
      'empresa = ?empresa and'
      'ref_proveedor = ?ref_proveedor')
    Left = 248
    Top = 104
  end
  object QTituloTalla: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select TALLA from art_tallas'
      'where '
      'id_g_t = ?id_g_t and'
      'cod_talla = ?cod_talla')
    Left = 248
    Top = 152
  end
  object QTraspasaOrden: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure traspasa_tmp_orden_prod_kri (?empresa,?ejercic' +
        'io,?canal,?serie,?norden)')
    Left = 168
    Top = 152
  end
  object xget_tallas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from xget_tallas')
    UniDirectional = False
    Left = 72
    Top = 104
    object xget_tallasNVISIBLE: TIntegerField
      DisplayLabel = 'Nro. Visible'
      FieldName = 'NVISIBLE'
    end
    object xget_tallasGRUPO: TFIBStringField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
      Size = 3
    end
    object xget_tallasT01: TFIBStringField
      DisplayLabel = ''
      FieldName = 'T01'
      Size = 8
    end
    object xget_tallasT02: TFIBStringField
      DisplayLabel = ''
      FieldName = 'T02'
      Size = 8
    end
    object xget_tallasT03: TFIBStringField
      DisplayLabel = ''
      FieldName = 'T03'
      Size = 8
    end
    object xget_tallasT04: TFIBStringField
      DisplayLabel = ''
      FieldName = 'T04'
      Size = 8
    end
    object xget_tallasT05: TFIBStringField
      DisplayLabel = ''
      FieldName = 'T05'
      Size = 8
    end
    object xget_tallasT06: TFIBStringField
      DisplayLabel = ''
      FieldName = 'T06'
      Size = 8
    end
    object xget_tallasT07: TFIBStringField
      DisplayLabel = ''
      FieldName = 'T07'
      Size = 8
    end
    object xget_tallasT08: TFIBStringField
      DisplayLabel = ''
      FieldName = 'T08'
      Size = 8
    end
    object xget_tallasT09: TFIBStringField
      DisplayLabel = ''
      FieldName = 'T09'
      Size = 8
    end
    object xget_tallasT10: TFIBStringField
      DisplayLabel = ''
      FieldName = 'T10'
      Size = 8
    end
    object xget_tallasT11: TFIBStringField
      DisplayLabel = ''
      FieldName = 'T11'
      Size = 8
    end
    object xget_tallasT12: TFIBStringField
      DisplayLabel = ''
      FieldName = 'T12'
      Size = 8
    end
    object xget_tallasT13: TFIBStringField
      DisplayLabel = ''
      FieldName = 'T13'
      Size = 8
    end
    object xget_tallasT14: TFIBStringField
      DisplayLabel = ''
      FieldName = 'T14'
      Size = 8
    end
    object xget_tallasT15: TFIBStringField
      DisplayLabel = ''
      FieldName = 'T15'
      Size = 8
    end
    object xget_tallasT16: TFIBStringField
      DisplayLabel = ''
      FieldName = 'T16'
      Size = 8
    end
    object xget_tallasT17: TFIBStringField
      DisplayLabel = ''
      FieldName = 'T17'
      Size = 8
    end
    object xget_tallasT18: TFIBStringField
      DisplayLabel = ''
      FieldName = 'T18'
      Size = 8
    end
    object xget_tallasT19: TFIBStringField
      DisplayLabel = ''
      FieldName = 'T19'
      Size = 8
    end
    object xget_tallasT20: TFIBStringField
      DisplayLabel = ''
      FieldName = 'T20'
      Size = 8
    end
    object xget_tallasT21: TFIBStringField
      DisplayLabel = ''
      FieldName = 'T21'
      Size = 8
    end
    object xget_tallasT22: TFIBStringField
      FieldName = 'T22'
      Size = 8
    end
    object xget_tallasID_G_T: TIntegerField
      DisplayLabel = 'Id Grupo Tallas'
      FieldName = 'ID_G_T'
    end
  end
end
