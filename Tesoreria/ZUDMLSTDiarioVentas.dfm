object ZDMLSTDiarioVentas: TZDMLSTDiarioVentas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 431
  Top = 219
  Height = 303
  Width = 403
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait'
      'read')
    Left = 40
    Top = 16
  end
  object xLstDiarioVenta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select art.familia, det.articulo, det.titulo, sum(det.b_imponibl' +
        'e) as b_imponible,'
      '  sum(det.c_iva) as c_iva, sum(det.liquido) as liquido'
      ' from ges_cabeceras_s cab'
      'join ges_detalles_s det on (cab.id_s=det.id_s)'
      'join art_articulos art on (det.id_a=art.id_a)'
      'where cab.empresa=?empresa and cab.ejercicio=?ejercicio and '
      'cab.canal=?canal and cab.serie=?serie and '
      
        '      cab.tipo='#39'FAC'#39' and cab.fecha>=?fecha_d and cab.fecha<=?fec' +
        'ha_h'
      'group by art.familia, det.articulo, det.titulo')
    UniDirectional = False
    Left = 40
    Top = 64
    object xLstDiarioVentaFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object xLstDiarioVentaARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xLstDiarioVentaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xLstDiarioVentaB_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object xLstDiarioVentaC_IVA: TFloatField
      DisplayLabel = 'Cuota IVA'
      FieldName = 'C_IVA'
    end
    object xLstDiarioVentaLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
  end
  object frDiarioVenta: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de diario de ventas'
    RebuildPrinter = False
    OnGetValue = frDiarioVentaGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 144
    Top = 16
    ReportForm = {19000000}
  end
  object DSxLstDiarioVenta: TDataSource
    DataSet = xLstDiarioVenta
    Left = 144
    Top = 64
  end
  object frDBLstDiarioVenta: TfrDBDataSet
    DataSource = DSxLstDiarioVenta
    Left = 256
    Top = 64
  end
  object xSerie: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from sys_series'
      'where serie=?serie')
    UniDirectional = False
    Left = 40
    Top = 160
    object xSerieTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object xCaja: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select pag.forma,pag.titulo, sum(cab.liquido) as liquido'
      'from sys_formas_pago pag'
      'join ges_cabeceras_s cab on (pag.forma=cab.forma_pago)'
      'where cab.empresa=?empresa and cab.ejercicio=?ejercicio and '
      'cab.canal=?canal and cab.serie=?serie and '
      
        '      cab.tipo='#39'FAC'#39' and cab.fecha>=?fecha_d and cab.fecha<=?fec' +
        'ha_h'
      'group by pag.forma,pag.titulo')
    UniDirectional = False
    Left = 40
    Top = 112
    object xCajaFORMA: TFIBStringField
      DisplayLabel = 'F. Pago'
      FieldName = 'FORMA'
      Size = 3
    end
    object xCajaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object xCajaLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
  end
  object DSxCaja: TDataSource
    DataSet = xCaja
    Left = 144
    Top = 112
  end
  object frDBLstCaja: TfrDBDataSet
    DataSource = DSxCaja
    Left = 256
    Top = 112
  end
end
