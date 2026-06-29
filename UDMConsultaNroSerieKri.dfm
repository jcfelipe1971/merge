object DMConsultaNroSerieKri: TDMConsultaNroSerieKri
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 365
  Top = 512
  Height = 281
  Width = 449
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 376
    Top = 16
  end
  object xNroSerieKri: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM NRO_SERIE_KRI')
    UniDirectional = False
    Left = 32
    Top = 8
    object xNroSerieKriEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xNroSerieKriARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xNroSerieKriNRO_SERIE: TFIBStringField
      DisplayLabel = 'Nro de Serie'
      FieldName = 'NRO_SERIE'
      Size = 25
    end
    object xNroSerieKriDEVOLUCION: TIntegerField
      DisplayLabel = 'Devolucion'
      FieldName = 'DEVOLUCION'
    end
    object xNroSerieKriEJERCICIO_ENT: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO_ENT'
    end
    object xNroSerieKriCANAL_ENT: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL_ENT'
    end
    object xNroSerieKriSERIE_ENT: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE_ENT'
      Size = 10
    end
    object xNroSerieKriRIG_ENT: TIntegerField
      DisplayLabel = 'Albaran'
      FieldName = 'RIG_ENT'
    end
    object xNroSerieKriLINEA_ENT: TIntegerField
      DisplayLabel = 'Linea '
      FieldName = 'LINEA_ENT'
    end
    object xNroSerieKriALMACEN_ENT: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN_ENT'
      Size = 3
    end
    object xNroSerieKriFECHA_ENT: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA_ENT'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object xNroSerieKriPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xNroSerieKriEJERCICIO_SAL: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO_SAL'
    end
    object xNroSerieKriCANAL_SAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL_SAL'
    end
    object xNroSerieKriSERIE_SAL: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE_SAL'
      Size = 10
    end
    object xNroSerieKriRIG_SAL: TIntegerField
      DisplayLabel = 'Albaran'
      FieldName = 'RIG_SAL'
    end
    object xNroSerieKriLINEA_SAL: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA_SAL'
    end
    object xNroSerieKriALMACEN_SAL: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN_SAL'
      Size = 3
    end
    object xNroSerieKriCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xNroSerieKriFECHA_SAL: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA_SAL'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object xNroSerieKriEJERCICIO_MOV: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO_MOV'
    end
    object xNroSerieKriCANAL_MOV: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL_MOV'
    end
    object xNroSerieKriSERIE_MOV: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE_MOV'
      Size = 10
    end
    object xNroSerieKriRIG_MOV: TIntegerField
      DisplayLabel = 'Movimiento'
      FieldName = 'RIG_MOV'
    end
    object xNroSerieKriLINEA_MOV: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA_MOV'
    end
    object xNroSerieKriALMACEN_ORI_MOV: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN_ORI_MOV'
      Size = 3
    end
    object xNroSerieKriFECHA_MOV: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA_MOV'
    end
    object xNroSerieKriALMACEN_DEST_MOV: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN_DEST_MOV'
      Size = 3
    end
    object xNroSerieKriEJERCICIO_GAR: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO_GAR'
    end
    object xNroSerieKriCANAL_GAR: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL_GAR'
    end
    object xNroSerieKriSERIE_GAR: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE_GAR'
      Size = 10
    end
    object xNroSerieKriRIG_GAR: TIntegerField
      DisplayLabel = 'Albaran'
      FieldName = 'RIG_GAR'
    end
    object xNroSerieKriLINEA_GAR: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA_GAR'
    end
    object xNroSerieKriALMACEN_GAR: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN_GAR'
      Size = 3
    end
    object xNroSerieKriFECHA_GAR: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA_GAR'
    end
    object xNroSerieKriTITULO_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Proveedor'
      FieldName = 'TITULO_PROVEEDOR'
      Size = 60
    end
    object xNroSerieKriTITULO_CLIENTE: TFIBStringField
      DisplayLabel = 'Cliente'
      FieldName = 'TITULO_CLIENTE'
      Size = 60
    end
    object xNroSerieKriTITULO_ALMACEN_ENT: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'TITULO_ALMACEN_ENT'
      Size = 40
    end
    object xNroSerieKriTITULO_ALMACEN_SAL: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'TITULO_ALMACEN_SAL'
      Size = 40
    end
    object xNroSerieKriTITULO_ALMACEN_ORI_MOV: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'TITULO_ALMACEN_ORI_MOV'
      Size = 40
    end
    object xNroSerieKriTITULO_ALMACEN_DEST_MOV: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'TITULO_ALMACEN_DEST_MOV'
      Size = 40
    end
    object xNroSerieKriTITULO_ALMACEN_GAR: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'TITULO_ALMACEN_GAR'
      Size = 40
    end
    object xNroSerieKriTRASPASADO: TIntegerField
      DisplayLabel = 'Trasp.'
      FieldName = 'TRASPASADO'
    end
    object xNroSerieKriID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID'
    end
    object xNroSerieKriLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      Size = 15
    end
    object xNroSerieKriCADUCIDAD: TDateTimeField
      DisplayLabel = 'Caducidad'
      FieldName = 'CADUCIDAD'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object xNroSerieKriDEVOLUCION_VENTA: TIntegerField
      DisplayLabel = 'Dev.'
      FieldName = 'DEVOLUCION_VENTA'
    end
    object xNroSerieKriEJERCICIO_DEV: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO_DEV'
    end
    object xNroSerieKriCANAL_DEV: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL_DEV'
    end
    object xNroSerieKriSERIE_DEV: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE_DEV'
      Size = 10
    end
    object xNroSerieKriRIG_DEV: TIntegerField
      DisplayLabel = 'Albaran'
      FieldName = 'RIG_DEV'
    end
    object xNroSerieKriLINEA_DEV: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA_DEV'
    end
    object xNroSerieKriALMACEN_DEV: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN_DEV'
      Size = 3
    end
    object xNroSerieKriFECHA_DEV: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA_DEV'
    end
    object xNroSerieKriTITULO_ALMACEN_DEV: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'TITULO_ALMACEN_DEV'
      Size = 40
    end
    object xNroSerieKriEJERCICIO_MOE: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO_MOE'
    end
    object xNroSerieKriCANAL_MOE: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL_MOE'
    end
    object xNroSerieKriSERIE_MOE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE_MOE'
      Size = 10
    end
    object xNroSerieKriRIG_MOE: TIntegerField
      DisplayLabel = 'Albaran'
      FieldName = 'RIG_MOE'
    end
    object xNroSerieKriLINEA_MOE: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA_MOE'
    end
    object xNroSerieKriALMACEN_MOE: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN_MOE'
      Size = 3
    end
    object xNroSerieKriFECHA_MOE: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA_MOE'
    end
    object xNroSerieKriTITULO_ALMACEN_MOE: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'TITULO_ALMACEN_MOE'
      Size = 40
    end
    object xNroSerieKriEJERCICIO_MOS: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO_MOS'
    end
    object xNroSerieKriCANAL_MOS: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL_MOS'
    end
    object xNroSerieKriSERIE_MOS: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE_MOS'
      Size = 10
    end
    object xNroSerieKriRIG_MOS: TIntegerField
      DisplayLabel = 'Albaran'
      FieldName = 'RIG_MOS'
    end
    object xNroSerieKriLINEA_MOS: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA_MOS'
    end
    object xNroSerieKriALMACEN_MOS: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN_MOS'
      Size = 3
    end
    object xNroSerieKriFECHA_MOS: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA_MOS'
    end
    object xNroSerieKriTITULO_ALMACEN_MOS: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'TITULO_ALMACEN_MOS'
      Size = 40
    end
  end
  object DSxNroSerieKri: TDataSource
    DataSet = xNroSerieKri
    Left = 112
    Top = 8
  end
  object xLotesEntradas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select count(*),empresa,articulo,lote,caducidad,ejercicio_ent,ca' +
        'nal_ent,serie_ent,rig_ent,linea_ent,fecha_ent,almacen_ent,titulo' +
        '_almacen_ent,proveedor,titulo_proveedor from nro_serie_kri'
      'where '
      'empresa = ?empresa and'
      'articulo = ?articulo'
      'and lote = ?lote'
      'and devolucion_venta = 0'
      
        'group by empresa,articulo,lote,caducidad,ejercicio_ent,canal_ent' +
        ',serie_ent,rig_ent,linea_ent,fecha_ent,almacen_ent,titulo_almace' +
        'n_ent,proveedor,titulo_proveedor')
    UniDirectional = False
    DataSource = DSxNroDeLote
    Left = 32
    Top = 104
    object xLotesEntradasCOUNT: TIntegerField
      DisplayLabel = 'Cantidad'
      FieldName = 'COUNT'
    end
    object xLotesEntradasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xLotesEntradasARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xLotesEntradasLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      Size = 15
    end
    object xLotesEntradasCADUCIDAD: TDateTimeField
      DisplayLabel = 'Caducidad'
      FieldName = 'CADUCIDAD'
    end
    object xLotesEntradasEJERCICIO_ENT: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO_ENT'
    end
    object xLotesEntradasCANAL_ENT: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL_ENT'
    end
    object xLotesEntradasSERIE_ENT: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE_ENT'
      Size = 10
    end
    object xLotesEntradasRIG_ENT: TIntegerField
      DisplayLabel = 'Albaran'
      FieldName = 'RIG_ENT'
    end
    object xLotesEntradasLINEA_ENT: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA_ENT'
    end
    object xLotesEntradasFECHA_ENT: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA_ENT'
    end
    object xLotesEntradasALMACEN_ENT: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN_ENT'
      Size = 3
    end
    object xLotesEntradasTITULO_ALMACEN_ENT: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'TITULO_ALMACEN_ENT'
      Size = 40
    end
    object xLotesEntradasPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xLotesEntradasTITULO_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Proveedor'
      FieldName = 'TITULO_PROVEEDOR'
      Size = 60
    end
  end
  object xLotesSalidas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select count(*),empresa,articulo,lote,caducidad,ejercicio_sal,ca' +
        'nal_sal,serie_sal,rig_sal,linea_sal,fecha_sal,almacen_sal,titulo' +
        '_almacen_sal,cliente,titulo_cliente,devolucion_venta from nro_se' +
        'rie_kri'
      'where '
      'empresa = ?empresa and'
      'articulo = ?articulo  '
      'and lote = ?lote'
      
        'group by empresa,articulo,lote,caducidad,ejercicio_sal,canal_sal' +
        ',serie_sal,rig_sal,linea_sal,fecha_sal,almacen_sal,titulo_almace' +
        'n_sal,cliente,titulo_cliente,devolucion_venta'
      '')
    UniDirectional = False
    DataSource = DSxNroDeLote
    Left = 32
    Top = 152
    object xLotesSalidasCOUNT: TIntegerField
      DisplayLabel = 'Cantidad'
      FieldName = 'COUNT'
    end
    object xLotesSalidasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xLotesSalidasARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xLotesSalidasLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      Size = 15
    end
    object xLotesSalidasCADUCIDAD: TDateTimeField
      DisplayLabel = 'Caducidad'
      FieldName = 'CADUCIDAD'
    end
    object xLotesSalidasEJERCICIO_SAL: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO_SAL'
    end
    object xLotesSalidasCANAL_SAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL_SAL'
    end
    object xLotesSalidasSERIE_SAL: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE_SAL'
      Size = 10
    end
    object xLotesSalidasRIG_SAL: TIntegerField
      DisplayLabel = 'Albaran'
      FieldName = 'RIG_SAL'
    end
    object xLotesSalidasLINEA_SAL: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA_SAL'
    end
    object xLotesSalidasFECHA_SAL: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA_SAL'
    end
    object xLotesSalidasALMACEN_SAL: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN_SAL'
      Size = 3
    end
    object xLotesSalidasTITULO_ALMACEN_SAL: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'TITULO_ALMACEN_SAL'
      Size = 40
    end
    object xLotesSalidasCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xLotesSalidasTITULO_CLIENTE: TFIBStringField
      DisplayLabel = 'Cliente'
      FieldName = 'TITULO_CLIENTE'
      Size = 60
    end
    object xLotesSalidasDEVOLUCION_VENTA: TIntegerField
      DisplayLabel = 'Dev.'
      FieldName = 'DEVOLUCION_VENTA'
    end
  end
  object DSxLotesEntradas: TDataSource
    DataSet = xLotesEntradas
    Left = 112
    Top = 104
  end
  object DSxLotesSalidas: TDataSource
    DataSet = xLotesSalidas
    Left = 112
    Top = 152
  end
  object xNroDeLote: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select count(*),empresa,articulo,lote,caducidad from nro_serie_k' +
        'ri'
      'group by empresa,articulo,lote,caducidad')
    UniDirectional = False
    AfterScroll = xNroDeLoteAfterScroll
    Left = 32
    Top = 56
    object xNroDeLoteCOUNT: TIntegerField
      DisplayLabel = 'Cantidad'
      FieldName = 'COUNT'
    end
    object xNroDeLoteEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xNroDeLoteARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xNroDeLoteLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      Size = 15
    end
    object xNroDeLoteCADUCIDAD: TDateTimeField
      DisplayLabel = 'Caducidad'
      FieldName = 'CADUCIDAD'
    end
  end
  object DSxNroDeLote: TDataSource
    DataSet = xNroDeLote
    Left = 112
    Top = 56
  end
  object xLotesMovEnt: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select count(*),empresa,articulo,lote,caducidad,ejercicio_moe,ca' +
        'nal_moe,serie_moe,rig_moe,linea_moe,fecha_moe,almacen_moe,titulo' +
        '_almacen_moe from nro_serie_kri'
      'where'
      'empresa = ?empresa and'
      'articulo = ?articulo and '
      'lote = ?lote and '
      'ejercicio_moe <> 0 and'
      'canal_moe <> 0 and'
      'serie_moe <> '#39#39' and'
      'rig_moe <> 0 and'
      'linea_moe <> 0'
      
        'group by empresa,articulo,lote,caducidad,ejercicio_moe,canal_moe' +
        ',serie_moe,rig_moe,linea_moe,fecha_moe,almacen_moe,titulo_almace' +
        'n_moe'
      '')
    UniDirectional = False
    DataSource = DSxNroDeLote
    AfterScroll = xLotesMovEntAfterScroll
    Left = 216
    Top = 104
    object xLotesMovEntCOUNT: TIntegerField
      DisplayLabel = 'Cantidad'
      FieldName = 'COUNT'
    end
    object xLotesMovEntEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xLotesMovEntARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xLotesMovEntLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      Size = 15
    end
    object xLotesMovEntCADUCIDAD: TDateTimeField
      DisplayLabel = 'Caducidad'
      FieldName = 'CADUCIDAD'
    end
    object xLotesMovEntEJERCICIO_MOE: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO_MOE'
    end
    object xLotesMovEntCANAL_MOE: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL_MOE'
    end
    object xLotesMovEntSERIE_MOE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE_MOE'
      Size = 10
    end
    object xLotesMovEntRIG_MOE: TIntegerField
      DisplayLabel = 'Albaran'
      FieldName = 'RIG_MOE'
    end
    object xLotesMovEntLINEA_MOE: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA_MOE'
    end
    object xLotesMovEntFECHA_MOE: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA_MOE'
    end
    object xLotesMovEntALMACEN_MOE: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN_MOE'
      Size = 3
    end
    object xLotesMovEntTITULO_ALMACEN_MOE: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'TITULO_ALMACEN_MOE'
      Size = 40
    end
  end
  object xLotesMovSal: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select count(*),empresa,articulo,lote,caducidad,ejercicio_mos,ca' +
        'nal_mos,serie_mos,rig_mos,linea_mos,fecha_mos,almacen_mos,titulo' +
        '_almacen_mos from nro_serie_kri'
      'where'
      'empresa = ?empresa and'
      'articulo = ?articulo and '
      'lote = ?lote and'
      'ejercicio_mos <> 0 and'
      'canal_mos <> 0 and'
      'serie_mos <> '#39#39' and'
      'rig_mos <> 0 and'
      'linea_mos <> 0'
      
        'group by empresa,articulo,lote,caducidad,ejercicio_mos,canal_mos' +
        ',serie_mos,rig_mos,linea_mos,fecha_mos,almacen_mos,titulo_almace' +
        'n_mos')
    UniDirectional = False
    DataSource = DSxNroDeLote
    Left = 216
    Top = 152
    object xLotesMovSalCOUNT: TIntegerField
      DisplayLabel = 'Cantidad'
      FieldName = 'COUNT'
    end
    object xLotesMovSalEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xLotesMovSalARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xLotesMovSalLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      Size = 15
    end
    object xLotesMovSalCADUCIDAD: TDateTimeField
      DisplayLabel = 'Caducidad'
      FieldName = 'CADUCIDAD'
    end
    object xLotesMovSalEJERCICIO_MOS: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO_MOS'
    end
    object xLotesMovSalCANAL_MOS: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL_MOS'
    end
    object xLotesMovSalSERIE_MOS: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE_MOS'
      Size = 10
    end
    object xLotesMovSalRIG_MOS: TIntegerField
      DisplayLabel = 'Albaran'
      FieldName = 'RIG_MOS'
    end
    object xLotesMovSalLINEA_MOS: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA_MOS'
    end
    object xLotesMovSalFECHA_MOS: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA_MOS'
    end
    object xLotesMovSalALMACEN_MOS: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN_MOS'
      Size = 3
    end
    object xLotesMovSalTITULO_ALMACEN_MOS: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'TITULO_ALMACEN_MOS'
      Size = 40
    end
  end
  object DSxLotesMovEnt: TDataSource
    DataSet = xLotesMovEnt
    Left = 304
    Top = 104
  end
  object DSxLotesMovSal: TDataSource
    DataSet = xLotesMovSal
    Left = 304
    Top = 152
  end
end
