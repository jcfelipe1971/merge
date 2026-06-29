object ZDMLSTVentasFamilia: TZDMLSTVentasFamilia
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 836
  Top = 470
  Height = 284
  Width = 413
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
    Top = 24
  end
  object xLstDiarioVenta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select art.familia, fam.titulo,det.articulo, cab.rig,'
      
        'cab.fecha, det.titulo as descripcion, sum(det.unidades) as unida' +
        'des,'
      'sum(det.precio) as precio'
      ' from ges_cabeceras_s cab'
      'join ges_detalles_s det on (cab.id_s=det.id_s)'
      'join art_articulos art on (det.id_a=art.id_a)'
      'join art_familias fam on (art.familia=fam.familia)'
      'where cab.empresa=?empresa and cab.ejercicio=?ejercicio and'
      'cab.canal=?canal and cab.serie=?serie and'
      
        '      cab.tipo='#39'FAC'#39' and cab.fecha>=?fecha_d and cab.fecha<=?fec' +
        'ha_h'
      'group by art.familia,fam.titulo, det.articulo,cab.rig,'
      'cab.fecha,det.titulo'
      '')
    UniDirectional = False
    Left = 40
    Top = 72
    object xLstDiarioVentaFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object xLstDiarioVentaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object xLstDiarioVentaARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xLstDiarioVentaRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xLstDiarioVentaFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xLstDiarioVentaDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object xLstDiarioVentaUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object xLstDiarioVentaPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
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
    Top = 24
    ReportForm = {19000000}
  end
  object DSxLstDiarioVenta: TDataSource
    DataSet = xLstDiarioVenta
    Left = 144
    Top = 72
  end
  object frDBLstDiarioVenta: TfrDBDataSet
    DataSource = DSxLstDiarioVenta
    Left = 248
    Top = 72
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
    Top = 168
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
    Top = 120
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
    Top = 120
  end
  object frDBLstCaja: TfrDBDataSet
    DataSource = DSxCaja
    Left = 248
    Top = 120
  end
end
