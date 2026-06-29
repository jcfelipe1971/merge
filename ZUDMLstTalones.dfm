object ZDMLstTalones: TZDMLstTalones
  OldCreateOrder = False
  OnCreate = DMRTesoreriaCreate
  OnDestroy = DMRTesoreriaDestroy
  Left = 540
  Top = 217
  Height = 444
  Width = 431
  object frDBTesoreria: TfrDBDataSet
    DataSource = DSAsientos
    Left = 173
    Top = 16
  end
  object frHYTesoreria: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frHYTesoreriaGetValue
    OnBeforePrint = frHYTesoreriaEnterRect
    OnEnterRect = frHYTesoreriaEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 32
    Top = 13
    ReportForm = {19000000}
  end
  object xMonedas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM SYS_MONEDAS')
    UniDirectional = False
    Left = 28
    Top = 296
    object xMonedasMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xMonedasTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object xMonedasSIGNO_MONEDA: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO_MONEDA'
      Size = 3
    end
    object xMonedasDEC_VER: TIntegerField
      DisplayLabel = 'Dec. Ver'
      FieldName = 'DEC_VER'
    end
    object xMonedasDEC_CALCULOS: TIntegerField
      DisplayLabel = 'D. Calc.'
      FieldName = 'DEC_CALCULOS'
    end
    object xMonedasDEFECTO: TIntegerField
      DisplayLabel = 'Defecto'
      FieldName = 'DEFECTO'
    end
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 116
    Top = 296
  end
  object QMinFecha: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select min(vencimiento) as minimo'
      'from EMP_CARTERA_DETALLE'
      'where'
      '  ((empresa=?empresa) and'
      '  (ejercicio=?ejercicio) and'
      '  (canal=?canal) and'
      '  (pagado=?pagado))')
    Transaction = TLocal
    AutoTrans = True
    Left = 24
    Top = 196
  end
  object DSAsientos: TDataSource
    DataSet = QMAsientos
    Left = 104
    Top = 68
  end
  object QMAsientos: TFIBDataSetRO
    Database = DMMain.DataBase
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM'
      ' tmp_lst_tsoreria'
      'where entrada=?entrada')
    UniDirectional = False
    Active = True
    Left = 36
    Top = 64
    object QMAsientosID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID'
    end
    object QMAsientosVENCIMIENTO: TDateTimeField
      DisplayLabel = 'Venc.'
      FieldName = 'VENCIMIENTO'
    end
    object QMAsientosCOMENTARIO: TFIBStringField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      Size = 100
    end
    object QMAsientosLIQUIDO_ENTRADA: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO_ENTRADA'
    end
    object QMAsientosLIQUIDO_SALIDA: TFloatField
      DisplayLabel = 'Liquido Sal.'
      FieldName = 'LIQUIDO_SALIDA'
    end
    object QMAsientosACUMULADO: TFloatField
      DisplayLabel = 'Acumulado'
      FieldName = 'ACUMULADO'
    end
    object QMAsientosSUMA_ENTRADA: TFloatField
      DisplayLabel = 'Suma Ent.'
      FieldName = 'SUMA_ENTRADA'
    end
    object QMAsientosSUMA_SALIDA: TFloatField
      DisplayLabel = 'Suma Sal.'
      FieldName = 'SUMA_SALIDA'
    end
    object QMAsientosTOTAL_ENTRADA: TFloatField
      DisplayLabel = 'Total Entr.'
      FieldName = 'TOTAL_ENTRADA'
    end
    object QMAsientosTOTAL_SALIDA: TFloatField
      DisplayLabel = 'Total Salida'
      FieldName = 'TOTAL_SALIDA'
    end
    object QMAsientosLIQUIDO_ANTICIPO: TFloatField
      DisplayLabel = 'Liquido Ant.'
      FieldName = 'LIQUIDO_ANTICIPO'
    end
    object QMAsientosENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMAsientosTOTAL_ANTICIPO: TFloatField
      DisplayLabel = 'Total Ant.'
      FieldName = 'TOTAL_ANTICIPO'
    end
    object QMAsientosSUMA_ACUMULADO: TFloatField
      DisplayLabel = 'Suma Acum.'
      FieldName = 'SUMA_ACUMULADO'
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait'
      'read')
    Left = 100
    Top = 16
  end
  object QMaxFecha: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select max(vencimiento) as maximo'
      'from EMP_CARTERA_DETALLE'
      'where'
      '  ((empresa=?empresa) and'
      '  (ejercicio=?ejercicio) and'
      '  (canal=?canal) and'
      '  (pagado=?pagado)) ')
    Transaction = TLocal
    AutoTrans = True
    Left = 108
    Top = 192
  end
  object xTerceros: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT NOMBRE_R_SOCIAL FROM VER_TERCEROS'
      'where tercero=?tercero')
    UniDirectional = False
    Plan.Strings = (
      
        'PLAN JOIN (VER_TERCEROS DI INDEX (PK_SYS_TERCEROS_DIRECCIONES),V' +
        'ER_TERCEROS TE INDEX (PK_SYS_TERCEROS))')
    BeforeOpen = xTercerosBeforeOpen
    Left = 28
    Top = 237
    object xTercerosNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
  end
  object DSxTerceros: TDataSource
    DataSet = xTerceros
    Left = 112
    Top = 237
  end
  object QTemp: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 24
    Top = 132
  end
end
