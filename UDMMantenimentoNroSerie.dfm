object DMMantenimientoNroSerie: TDMMantenimientoNroSerie
  OldCreateOrder = False
  OnCreate = DMMantenimentoNroSerieCreate
  OnDestroy = DMMantenimentoNroSerieDestroy
  Left = 581
  Top = 421
  Height = 150
  Width = 215
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 144
    Top = 8
  end
  object xNroSerie: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM NRO_SERIE_KRI'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO NRO_SERIE_KRI'
      
        '  (FECHA_MOS,FECHA_MOE,FECHA_DEV,CADUCIDAD,FECHA_GAR,FECHA_MOV,F' +
        'ECHA_SAL,FECHA_ENT,RIG_MOS,SERIE_MOS,RIG_MOE,SERIE_MOE,RIG_DEV,S' +
        'ERIE_DEV,ID,RIG_GAR,SERIE_GAR,RIG_MOV,SERIE_MOV,CLIENTE,RIG_SAL,' +
        'SERIE_SAL,PROVEEDOR,RIG_ENT,SERIE_ENT,TITULO_ALMACEN_MOS,LINEA_M' +
        'OS,CANAL_MOS,EJERCICIO_MOS,TITULO_ALMACEN_MOE,LINEA_MOE,CANAL_MO' +
        'E,EJERCICIO_MOE,TITULO_ALMACEN_DEV,LINEA_DEV,CANAL_DEV,EJERCICIO' +
        '_DEV,DEVOLUCION_VENTA,TRASPASADO,TITULO_ALMACEN_GAR,TITULO_ALMAC' +
        'EN_DEST_MOV,TITULO_ALMACEN_ORI_MOV,TITULO_ALMACEN_SAL,TITULO_ALM' +
        'ACEN_ENT,TITULO_CLIENTE,TITULO_PROVEEDOR,LINEA_GAR,CANAL_GAR,EJE' +
        'RCICIO_GAR,LINEA_MOV,CANAL_MOV,EJERCICIO_MOV,LINEA_SAL,CANAL_SAL' +
        ',EJERCICIO_SAL,LINEA_ENT,CANAL_ENT,EJERCICIO_ENT,DEVOLUCION,EMPR' +
        'ESA,ALMACEN_MOS,ALMACEN_MOE,ALMACEN_DEV,LOTE,ALMACEN_GAR,ALMACEN' +
        '_DEST_MOV,ALMACEN_ORI_MOV,ALMACEN_SAL,ALMACEN_ENT,NRO_SERIE,ARTI' +
        'CULO,EJERCICIO_DEC,CANAL_DEC,SERIE_DEC,RIG_DEC,LINEA_DEC,ALMACEN' +
        '_DEC,FECHA_DEC,TITULO_ALMACEN_DEC,CANAL_DST_MOV,MOVIMIENTO)'
      'VALUES'
      
        '  (?FECHA_MOS,?FECHA_MOE,?FECHA_DEV,?CADUCIDAD,?FECHA_GAR,?FECHA' +
        '_MOV,?FECHA_SAL,?FECHA_ENT,?RIG_MOS,?SERIE_MOS,?RIG_MOE,?SERIE_M' +
        'OE,?RIG_DEV,?SERIE_DEV,?ID,?RIG_GAR,?SERIE_GAR,?RIG_MOV,?SERIE_M' +
        'OV,?CLIENTE,?RIG_SAL,?SERIE_SAL,?PROVEEDOR,?RIG_ENT,?SERIE_ENT,?' +
        'TITULO_ALMACEN_MOS,?LINEA_MOS,?CANAL_MOS,?EJERCICIO_MOS,?TITULO_' +
        'ALMACEN_MOE,?LINEA_MOE,?CANAL_MOE,?EJERCICIO_MOE,?TITULO_ALMACEN' +
        '_DEV,?LINEA_DEV,?CANAL_DEV,?EJERCICIO_DEV,?DEVOLUCION_VENTA,?TRA' +
        'SPASADO,?TITULO_ALMACEN_GAR,?TITULO_ALMACEN_DEST_MOV,?TITULO_ALM' +
        'ACEN_ORI_MOV,?TITULO_ALMACEN_SAL,?TITULO_ALMACEN_ENT,?TITULO_CLI' +
        'ENTE,?TITULO_PROVEEDOR,?LINEA_GAR,?CANAL_GAR,?EJERCICIO_GAR,?LIN' +
        'EA_MOV,?CANAL_MOV,?EJERCICIO_MOV,?LINEA_SAL,?CANAL_SAL,?EJERCICI' +
        'O_SAL,?LINEA_ENT,?CANAL_ENT,?EJERCICIO_ENT,?DEVOLUCION,?EMPRESA,' +
        '?ALMACEN_MOS,?ALMACEN_MOE,?ALMACEN_DEV,?LOTE,?ALMACEN_GAR,?ALMAC' +
        'EN_DEST_MOV,?ALMACEN_ORI_MOV,?ALMACEN_SAL,?ALMACEN_ENT,?NRO_SERI' +
        'E,?ARTICULO,?EJERCICIO_DEC,?CANAL_DEC,?SERIE_DEC,?RIG_DEC,?LINEA' +
        '_DEC,?ALMACEN_DEC,?FECHA_DEC,?TITULO_ALMACEN_DEC,?CANAL_DST_MOV,' +
        '?MOVIMIENTO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM NRO_SERIE_KRI'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM NRO_SERIE_KRI'
      'WHERE'
      '  EMPRESA  = ?EMPRESA AND'
      '  NRO_SERIE > '#39' '#39)
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE NRO_SERIE_KRI'
      'SET'
      '  FECHA_MOS=?FECHA_MOS '
      '  ,FECHA_MOE=?FECHA_MOE '
      '  ,FECHA_DEV=?FECHA_DEV '
      '  ,CADUCIDAD=?CADUCIDAD '
      '  ,FECHA_GAR=?FECHA_GAR '
      '  ,FECHA_MOV=?FECHA_MOV '
      '  ,FECHA_SAL=?FECHA_SAL '
      '  ,FECHA_ENT=?FECHA_ENT '
      '  ,RIG_MOS=?RIG_MOS '
      '  ,SERIE_MOS=?SERIE_MOS '
      '  ,RIG_MOE=?RIG_MOE '
      '  ,SERIE_MOE=?SERIE_MOE '
      '  ,RIG_DEV=?RIG_DEV '
      '  ,SERIE_DEV=?SERIE_DEV '
      '  ,RIG_GAR=?RIG_GAR '
      '  ,SERIE_GAR=?SERIE_GAR '
      '  ,RIG_MOV=?RIG_MOV '
      '  ,SERIE_MOV=?SERIE_MOV '
      '  ,CLIENTE=?CLIENTE '
      '  ,RIG_SAL=?RIG_SAL '
      '  ,SERIE_SAL=?SERIE_SAL '
      '  ,PROVEEDOR=?PROVEEDOR '
      '  ,RIG_ENT=?RIG_ENT '
      '  ,SERIE_ENT=?SERIE_ENT '
      '  ,TITULO_ALMACEN_MOS=?TITULO_ALMACEN_MOS '
      '  ,LINEA_MOS=?LINEA_MOS '
      '  ,CANAL_MOS=?CANAL_MOS '
      '  ,EJERCICIO_MOS=?EJERCICIO_MOS '
      '  ,TITULO_ALMACEN_MOE=?TITULO_ALMACEN_MOE '
      '  ,LINEA_MOE=?LINEA_MOE '
      '  ,CANAL_MOE=?CANAL_MOE '
      '  ,EJERCICIO_MOE=?EJERCICIO_MOE '
      '  ,TITULO_ALMACEN_DEV=?TITULO_ALMACEN_DEV '
      '  ,LINEA_DEV=?LINEA_DEV '
      '  ,CANAL_DEV=?CANAL_DEV '
      '  ,EJERCICIO_DEV=?EJERCICIO_DEV '
      '  ,DEVOLUCION_VENTA=?DEVOLUCION_VENTA '
      '  ,TRASPASADO=?TRASPASADO '
      '  ,TITULO_ALMACEN_GAR=?TITULO_ALMACEN_GAR '
      '  ,TITULO_ALMACEN_DEST_MOV=?TITULO_ALMACEN_DEST_MOV '
      '  ,TITULO_ALMACEN_ORI_MOV=?TITULO_ALMACEN_ORI_MOV '
      '  ,TITULO_ALMACEN_SAL=?TITULO_ALMACEN_SAL '
      '  ,TITULO_ALMACEN_ENT=?TITULO_ALMACEN_ENT '
      '  ,TITULO_CLIENTE=?TITULO_CLIENTE '
      '  ,TITULO_PROVEEDOR=?TITULO_PROVEEDOR '
      '  ,LINEA_GAR=?LINEA_GAR '
      '  ,CANAL_GAR=?CANAL_GAR '
      '  ,EJERCICIO_GAR=?EJERCICIO_GAR '
      '  ,LINEA_MOV=?LINEA_MOV '
      '  ,CANAL_MOV=?CANAL_MOV '
      '  ,EJERCICIO_MOV=?EJERCICIO_MOV '
      '  ,LINEA_SAL=?LINEA_SAL '
      '  ,CANAL_SAL=?CANAL_SAL '
      '  ,EJERCICIO_SAL=?EJERCICIO_SAL '
      '  ,LINEA_ENT=?LINEA_ENT '
      '  ,CANAL_ENT=?CANAL_ENT '
      '  ,EJERCICIO_ENT=?EJERCICIO_ENT '
      '  ,DEVOLUCION=?DEVOLUCION '
      '  ,EMPRESA=?EMPRESA '
      '  ,ALMACEN_MOS=?ALMACEN_MOS '
      '  ,ALMACEN_MOE=?ALMACEN_MOE '
      '  ,ALMACEN_DEV=?ALMACEN_DEV '
      '  ,LOTE=?LOTE '
      '  ,ALMACEN_GAR=?ALMACEN_GAR '
      '  ,ALMACEN_DEST_MOV=?ALMACEN_DEST_MOV '
      '  ,ALMACEN_ORI_MOV=?ALMACEN_ORI_MOV '
      '  ,ALMACEN_SAL=?ALMACEN_SAL '
      '  ,ALMACEN_ENT=?ALMACEN_ENT '
      '  ,NRO_SERIE=?NRO_SERIE '
      '  ,ARTICULO=?ARTICULO '
      '  ,EJERCICIO_DEC=?EJERCICIO_DEC '
      '  ,CANAL_DEC=?CANAL_DEC '
      '  ,SERIE_DEC=?SERIE_DEC '
      '  ,RIG_DEC=?RIG_DEC '
      '  ,LINEA_DEC=?LINEA_DEC '
      '  ,ALMACEN_DEC=?ALMACEN_DEC '
      '  ,FECHA_DEC=?FECHA_DEC '
      '  ,TITULO_ALMACEN_DEC=?TITULO_ALMACEN_DEC '
      '  ,CANAL_DST_MOV=?CANAL_DST_MOV '
      '  ,MOVIMIENTO=?MOVIMIENTO '
      'WHERE'
      '  ID=?ID ')
    AfterCancel = xNroSerieAfterCancel
    AfterPost = xNroSerieAfterPost
    AfterScroll = xNroSerieAfterScroll
    BeforeInsert = xNroSerieBeforeInsert
    BeforePost = xNroSerieBeforePost
    OnNewRecord = xNroSerieNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'NRO_SERIE_KRI'
    Left = 24
    Top = 8
    object xNroSerieEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xNroSerieARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xNroSerieNRO_SERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NRO_SERIE'
      Size = 25
    end
    object xNroSerieDEVOLUCION: TIntegerField
      DisplayLabel = 'Devolucion'
      FieldName = 'DEVOLUCION'
    end
    object xNroSerieEJERCICIO_ENT: TIntegerField
      DisplayLabel = 'Ejercicio E.'
      FieldName = 'EJERCICIO_ENT'
    end
    object xNroSerieCANAL_ENT: TIntegerField
      DisplayLabel = 'Canal E.'
      FieldName = 'CANAL_ENT'
    end
    object xNroSerieSERIE_ENT: TFIBStringField
      DisplayLabel = 'Serie E.'
      FieldName = 'SERIE_ENT'
      Size = 10
    end
    object xNroSerieRIG_ENT: TIntegerField
      DisplayLabel = 'Rig E.'
      FieldName = 'RIG_ENT'
    end
    object xNroSerieLINEA_ENT: TIntegerField
      DisplayLabel = 'Linea E.'
      FieldName = 'LINEA_ENT'
    end
    object xNroSerieALMACEN_ENT: TFIBStringField
      DisplayLabel = 'Almacen E.'
      FieldName = 'ALMACEN_ENT'
      Size = 3
    end
    object xNroSerieFECHA_ENT: TDateTimeField
      DisplayLabel = 'Fecha E.'
      FieldName = 'FECHA_ENT'
    end
    object xNroSeriePROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xNroSerieEJERCICIO_SAL: TIntegerField
      DisplayLabel = 'Ejercicio S.'
      FieldName = 'EJERCICIO_SAL'
    end
    object xNroSerieCANAL_SAL: TIntegerField
      DisplayLabel = 'Canal S.'
      FieldName = 'CANAL_SAL'
    end
    object xNroSerieSERIE_SAL: TFIBStringField
      DisplayLabel = 'Serie S.'
      FieldName = 'SERIE_SAL'
      Size = 10
    end
    object xNroSerieRIG_SAL: TIntegerField
      DisplayLabel = 'Rig S.'
      FieldName = 'RIG_SAL'
    end
    object xNroSerieLINEA_SAL: TIntegerField
      DisplayLabel = 'Linea S.'
      FieldName = 'LINEA_SAL'
    end
    object xNroSerieALMACEN_SAL: TFIBStringField
      DisplayLabel = 'Almacen S.'
      FieldName = 'ALMACEN_SAL'
      Size = 3
    end
    object xNroSerieCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xNroSerieFECHA_SAL: TDateTimeField
      DisplayLabel = 'Fecha S.'
      FieldName = 'FECHA_SAL'
    end
    object xNroSerieEJERCICIO_MOV: TIntegerField
      DisplayLabel = 'Ejercicio M.'
      FieldName = 'EJERCICIO_MOV'
    end
    object xNroSerieCANAL_MOV: TIntegerField
      DisplayLabel = 'Canal M.'
      FieldName = 'CANAL_MOV'
    end
    object xNroSerieSERIE_MOV: TFIBStringField
      DisplayLabel = 'Serie M.'
      FieldName = 'SERIE_MOV'
      Size = 10
    end
    object xNroSerieRIG_MOV: TIntegerField
      DisplayLabel = 'Rig M.'
      FieldName = 'RIG_MOV'
    end
    object xNroSerieLINEA_MOV: TIntegerField
      DisplayLabel = 'Linea M.'
      FieldName = 'LINEA_MOV'
    end
    object xNroSerieALMACEN_ORI_MOV: TFIBStringField
      DisplayLabel = 'Alm. Ori. M.'
      FieldName = 'ALMACEN_ORI_MOV'
      Size = 3
    end
    object xNroSerieFECHA_MOV: TDateTimeField
      DisplayLabel = 'Fecha M.'
      FieldName = 'FECHA_MOV'
    end
    object xNroSerieALMACEN_DEST_MOV: TFIBStringField
      DisplayLabel = 'Alm. Dst. M.'
      FieldName = 'ALMACEN_DEST_MOV'
      Size = 3
    end
    object xNroSerieTITULO_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Titulo Prov.'
      FieldName = 'TITULO_PROVEEDOR'
      Size = 60
    end
    object xNroSerieTITULO_CLIENTE: TFIBStringField
      DisplayLabel = 'Titulo Cli.'
      FieldName = 'TITULO_CLIENTE'
      Size = 60
    end
    object xNroSerieTITULO_ALMACEN_ENT: TFIBStringField
      DisplayLabel = 'Titulo Alm. E.'
      FieldName = 'TITULO_ALMACEN_ENT'
      Size = 40
    end
    object xNroSerieTITULO_ALMACEN_SAL: TFIBStringField
      DisplayLabel = 'Titulo Alm. S.'
      FieldName = 'TITULO_ALMACEN_SAL'
      Size = 40
    end
    object xNroSerieTITULO_ALMACEN_ORI_MOV: TFIBStringField
      DisplayLabel = 'Titulo Alm. Ori. M.'
      FieldName = 'TITULO_ALMACEN_ORI_MOV'
      Size = 40
    end
    object xNroSerieTITULO_ALMACEN_DEST_MOV: TFIBStringField
      DisplayLabel = 'Titulo Alm. Dst. M.'
      FieldName = 'TITULO_ALMACEN_DEST_MOV'
      Size = 40
    end
    object xNroSerieID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID'
    end
    object xNroSerieDEVOLUCION_VENTA: TIntegerField
      DisplayLabel = 'Devolucion Venta'
      FieldName = 'DEVOLUCION_VENTA'
    end
    object xNroSerieEJERCICIO_DEV: TIntegerField
      DisplayLabel = 'Ejercicio Dev.'
      FieldName = 'EJERCICIO_DEV'
    end
    object xNroSerieCANAL_DEV: TIntegerField
      DisplayLabel = 'Canal Dev.'
      FieldName = 'CANAL_DEV'
    end
    object xNroSerieSERIE_DEV: TFIBStringField
      DisplayLabel = 'Serie Dev.'
      FieldName = 'SERIE_DEV'
      Size = 10
    end
    object xNroSerieRIG_DEV: TIntegerField
      DisplayLabel = 'Rig Dev.'
      FieldName = 'RIG_DEV'
    end
    object xNroSerieLINEA_DEV: TIntegerField
      DisplayLabel = 'Linea Dev.'
      FieldName = 'LINEA_DEV'
    end
    object xNroSerieALMACEN_DEV: TFIBStringField
      DisplayLabel = 'Almacen Dev.'
      FieldName = 'ALMACEN_DEV'
      Size = 3
    end
    object xNroSerieFECHA_DEV: TDateTimeField
      DisplayLabel = 'Fecha Dev.'
      FieldName = 'FECHA_DEV'
    end
    object xNroSerieTITULO_ALMACEN_DEV: TFIBStringField
      DisplayLabel = 'Titulo Alm. Dev.'
      FieldName = 'TITULO_ALMACEN_DEV'
      Size = 40
    end
    object xNroSerieEJERCICIO_MOE: TIntegerField
      DisplayLabel = 'Ejercicio ME'
      FieldName = 'EJERCICIO_MOE'
    end
    object xNroSerieCANAL_MOE: TIntegerField
      DisplayLabel = 'Canal ME'
      FieldName = 'CANAL_MOE'
    end
    object xNroSerieSERIE_MOE: TFIBStringField
      DisplayLabel = 'Serie ME'
      FieldName = 'SERIE_MOE'
      Size = 10
    end
    object xNroSerieRIG_MOE: TIntegerField
      DisplayLabel = 'Rig ME'
      FieldName = 'RIG_MOE'
    end
    object xNroSerieLINEA_MOE: TIntegerField
      DisplayLabel = 'Linea ME'
      FieldName = 'LINEA_MOE'
    end
    object xNroSerieALMACEN_MOE: TFIBStringField
      DisplayLabel = 'Almacen ME'
      FieldName = 'ALMACEN_MOE'
      Size = 3
    end
    object xNroSerieFECHA_MOE: TDateTimeField
      DisplayLabel = 'Fecha ME'
      FieldName = 'FECHA_MOE'
    end
    object xNroSerieTITULO_ALMACEN_MOE: TFIBStringField
      DisplayLabel = 'Titulo Alm. ME'
      FieldName = 'TITULO_ALMACEN_MOE'
      Size = 40
    end
    object xNroSerieEJERCICIO_MOS: TIntegerField
      DisplayLabel = 'Ejercicio MS'
      FieldName = 'EJERCICIO_MOS'
    end
    object xNroSerieCANAL_MOS: TIntegerField
      DisplayLabel = 'Canal MS'
      FieldName = 'CANAL_MOS'
    end
    object xNroSerieSERIE_MOS: TFIBStringField
      DisplayLabel = 'Serie MS'
      FieldName = 'SERIE_MOS'
      Size = 10
    end
    object xNroSerieRIG_MOS: TIntegerField
      DisplayLabel = 'Rig MS'
      FieldName = 'RIG_MOS'
    end
    object xNroSerieLINEA_MOS: TIntegerField
      DisplayLabel = 'Linea MS'
      FieldName = 'LINEA_MOS'
    end
    object xNroSerieALMACEN_MOS: TFIBStringField
      DisplayLabel = 'Almacen MS'
      FieldName = 'ALMACEN_MOS'
      Size = 3
    end
    object xNroSerieFECHA_MOS: TDateTimeField
      DisplayLabel = 'Fecha MS'
      FieldName = 'FECHA_MOS'
    end
    object xNroSerieTITULO_ALMACEN_MOS: TFIBStringField
      DisplayLabel = 'Titulo Alm. MS'
      FieldName = 'TITULO_ALMACEN_MOS'
      Size = 40
    end
    object xNroSerieEJERCICIO_DEC: TIntegerField
      DisplayLabel = 'Ejercicio DC'
      FieldName = 'EJERCICIO_DEC'
    end
    object xNroSerieCANAL_DEC: TIntegerField
      DisplayLabel = 'Canal DC'
      FieldName = 'CANAL_DEC'
    end
    object xNroSerieSERIE_DEC: TFIBStringField
      DisplayLabel = 'Serie DC'
      FieldName = 'SERIE_DEC'
      Size = 10
    end
    object xNroSerieRIG_DEC: TIntegerField
      DisplayLabel = 'Rig DC'
      FieldName = 'RIG_DEC'
    end
    object xNroSerieLINEA_DEC: TIntegerField
      DisplayLabel = 'Linea DC'
      FieldName = 'LINEA_DEC'
    end
    object xNroSerieALMACEN_DEC: TFIBStringField
      DisplayLabel = 'Almacen DC'
      FieldName = 'ALMACEN_DEC'
      Size = 3
    end
    object xNroSerieFECHA_DEC: TDateTimeField
      DisplayLabel = 'Fecha DC'
      FieldName = 'FECHA_DEC'
    end
    object xNroSerieTITULO_ALMACEN_DEC: TFIBStringField
      DisplayLabel = 'Titulo Alm. DC'
      FieldName = 'TITULO_ALMACEN_DEC'
      Size = 40
    end
    object xNroSerieCANAL_DST_MOV: TIntegerField
      DisplayLabel = 'Canal Dst M.'
      FieldName = 'CANAL_DST_MOV'
    end
    object xNroSerieMOVIMIENTO: TIntegerField
      DisplayLabel = 'Movimiento E/Almacenes.'
      FieldName = 'MOVIMIENTO'
    end
  end
  object QGeneral: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 24
    Top = 56
  end
  object DSxNroSerie: TDataSource
    DataSet = xNroSerie
    Left = 88
    Top = 8
  end
  object xMovimientos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select '#39' DI'#39' as tipo,serie_ent,rig_ent,linea_ent,nro_serie from ' +
        'nro_serie_kri'
      'where'
      'empresa = ?empresa and'
      'articulo = ?articulo and'
      'devolucion = 0 and'
      'devolucion_venta = 0 and'
      'movimiento = 0'
      
        'and (((rig_sal = 0)or(rig_sal is null)) and ((rig_mos = 0)or(rig' +
        '_mos is null)))'
      'union'
      
        'select '#39'ENT'#39' as tipo,serie_ent,rig_ent,linea_ent,nro_serie from ' +
        'nro_serie_kri'
      'where'
      'empresa = ?empresa and'
      'articulo = ?articulo'
      'and devolucion_venta = 0'
      'and (rig_ent <> 0) and (rig_ent is not null)'
      'union'
      
        'select '#39'SAL'#39' as tipo,serie_sal,rig_sal,linea_sal,nro_serie from ' +
        'nro_serie_kri'
      'where'
      'empresa = ?empresa and'
      'articulo = ?articulo'
      'and (rig_sal <> 0) and (rig_sal is not null)'
      'union'
      
        'select '#39'MOE'#39' as tipo,serie_moe,rig_moe,linea_moe,nro_serie from ' +
        'nro_serie_kri'
      'where'
      'empresa = ?empresa and'
      'articulo = ?articulo and'
      'movimiento = 0 and'
      'devolucion_venta = 0'
      'and (rig_moe <> 0) and (rig_moe is not null)'
      'union'
      
        'select '#39'MOS'#39' as tipo,serie_mos,rig_mos,linea_mos,nro_serie from ' +
        'nro_serie_kri'
      'where'
      'empresa = ?empresa and'
      'articulo = ?articulo'
      'and (rig_mos <> 0) and (rig_mos is not null)'
      'union'
      
        'select '#39'MOV'#39' as tipo,serie_mov,rig_mov,linea_mov,nro_serie from ' +
        'nro_serie_kri'
      'where'
      'empresa = ?empresa and'
      'articulo = ?articulo and'
      'movimiento = 1'
      'and (rig_mov <> 0) and (rig_mov is not null)'
      'union'
      
        'select '#39'DEV'#39' as tipo,serie_dev,rig_dev,linea_dev,nro_serie from ' +
        'nro_serie_kri'
      'where'
      'empresa = ?empresa and'
      'articulo = ?articulo'
      'and devolucion_venta = 1'
      'and (rig_dev <> 0) and (rig_dev is not null)'
      'union'
      
        'select '#39'DEC'#39' as tipo,serie_dec,rig_dec,linea_dec,nro_serie from ' +
        'nro_serie_kri'
      'where'
      'empresa = ?empresa and'
      'articulo = ?articulo'
      'and devolucion = 1'
      'and (rig_dec <> 0) and (rig_dec is not null)'
      '')
    UniDirectional = False
    Left = 88
    Top = 56
    object xMovimientosTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      ReadOnly = True
      Size = 3
    end
    object xMovimientosSERIE_ENT: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE_ENT'
      ReadOnly = True
      Size = 10
    end
    object xMovimientosRIG_ENT: TIntegerField
      DisplayLabel = 'Rig'
      FieldName = 'RIG_ENT'
      ReadOnly = True
    end
    object xMovimientosLINEA_ENT: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA_ENT'
      ReadOnly = True
    end
    object xMovimientosNRO_SERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NRO_SERIE'
      ReadOnly = True
      Size = 25
    end
  end
  object DSxMovimientos: TDataSource
    DataSet = xMovimientos
    Left = 144
    Top = 56
  end
end
