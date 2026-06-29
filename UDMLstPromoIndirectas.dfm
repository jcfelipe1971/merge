object DMLstPromoIndirectas: TDMLstPromoIndirectas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 304
  Top = 180
  Height = 319
  Width = 324
  object frPromocionesIndirectas: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado Carga de Transportista'
    RebuildPrinter = False
    OnGetValue = frPromocionesIndirectasGetValue
    OnBeforePrint = frPromocionesIndirectasEnterRect
    OnEnterRect = frPromocionesIndirectasEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 56
    Top = 8
    ReportForm = {19000000}
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
    Left = 142
    Top = 8
  end
  object QMPromociones: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select * from lst_promociones_indirectas(?entrada,?articulo,?tit' +
        'ulo)')
    UniDirectional = False
    DataSource = DSArticulos
    Left = 32
    Top = 120
    object QMPromocionesPROMOCION: TFIBStringField
      DisplayLabel = 'Promocion'
      FieldName = 'PROMOCION'
      Size = 15
    end
    object QMPromocionesUDS_PROMOCION: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UDS_PROMOCION'
    end
    object QMPromocionesPRECIO_PROMO: TFloatField
      DisplayLabel = 'Precio Prom.'
      FieldName = 'PRECIO_PROMO'
    end
    object QMPromocionesTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
  end
  object DSPromociones: TDataSource
    DataSet = QMPromociones
    Left = 112
    Top = 120
  end
  object frDBPromociones: TfrDBDataSet
    DataSource = DSPromociones
    Left = 200
    Top = 120
  end
  object xMonedas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO, SIGNO_MONEDA FROM SYS_MONEDAS'
      'WHERE MONEDA=?MONEDA')
    UniDirectional = False
    Left = 32
    Top = 168
  end
  object DSMonedas: TDataSource
    DataSet = xMonedas
    Left = 112
    Top = 168
  end
  object QMArticulos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select distinct articulo, titulo from tmp_promociones '
      '  where entrada=?entrada and marcado=1')
    UniDirectional = False
    Left = 32
    Top = 72
    object QMArticulosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMArticulosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSArticulos: TDataSource
    DataSet = QMArticulos
    Left = 112
    Top = 72
  end
  object frDBArticulos: TfrDBDataSet
    DataSource = DSArticulos
    Left = 200
    Top = 72
  end
end
