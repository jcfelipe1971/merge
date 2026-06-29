object DMRCosteVentasMP: TDMRCosteVentasMP
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 192
  Top = 107
  Height = 400
  Width = 385
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait'
      'read')
    Left = 125
    Top = 22
  end
  object frListado: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frListadoGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 37
    Top = 20
    ReportForm = {19000000}
  end
  object QMinArticulo: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT min (articulo) as minimo'
      'FROM con_cuentas_ges_art'
      'WHERE'
      '  ((empresa=?empresa) and'
      '   (ejercicio=?ejercicio) and'
      '   (canal=?canal)) ')
    Transaction = TLocal
    AutoTrans = True
    Left = 38
    Top = 307
  end
  object QMaxArticulo: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT max (articulo) as maximo'
      'FROM con_cuentas_ges_art'
      'WHERE'
      '  ((empresa=?empresa) and'
      '   (ejercicio=?ejercicio) and'
      '   (canal=?canal)) ')
    Transaction = TLocal
    AutoTrans = True
    Left = 126
    Top = 307
  end
  object xArticuloD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA AND ARTICULO=?ARTICULO')
    UniDirectional = False
    Left = 218
    Top = 174
    object xArticuloDTITULO: TFIBStringField
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object xArticuloH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA AND ARTICULO=?ARTICULO')
    UniDirectional = False
    Left = 218
    Top = 222
    object xArticuloHTITULO: TFIBStringField
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSArticuloD: TDataSource
    DataSet = xArticuloD
    Left = 294
    Top = 170
  end
  object DSArticuloH: TDataSource
    DataSet = xArticuloH
    Left = 290
    Top = 222
  end
  object xFamiliaH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_FAMILIAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  FAMILIA=?FAMILIA ')
    SelectSQL.Strings = (
      'SELECT FAMILIA,TITULO TITULO FROM ART_FAMILIAS'
      'WHERE EMPRESA=?EMPRESA AND FAMILIA=?FAMILIA')
    UniDirectional = False
    Left = 217
    Top = 95
    object xFamiliaHFAMILIA: TFIBStringField
      FieldName = 'FAMILIA'
      Size = 5
    end
    object xFamiliaHTITULO: TFIBStringField
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxFamiliaH: TDataSource
    DataSet = xFamiliaH
    Left = 289
    Top = 90
  end
  object DSxFamiliaD: TDataSource
    DataSet = xFamiliaD
    Left = 291
    Top = 47
  end
  object xFamiliaD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_FAMILIAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  FAMILIA=?FAMILIA ')
    SelectSQL.Strings = (
      'SELECT FAMILIA,TITULO FROM ART_FAMILIAS'
      'WHERE EMPRESA=?EMPRESA AND FAMILIA=?FAMILIA')
    UniDirectional = False
    Left = 217
    Top = 45
    object xFamiliaDFAMILIA: TFIBStringField
      FieldName = 'FAMILIA'
      Size = 5
    end
    object xFamiliaDTITULO: TFIBStringField
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object xLstCosteMP_V: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select * from lst_coste_mercancia_vendida (?EMPRESA, ?EJERCICI' +
        'O,'
      '  ?CANAL, ?SERIE, ?FECHA_D, ?FECHA_H, ?ARTICULO_D, '
      '  ?ARTICULO_H, ?FAMILIA_D, ?FAMILIA_H, ?TIPO)')
    UniDirectional = False
    Left = 47
    Top = 76
    object xLstCosteMP_VFECHA_FACTURA: TDateTimeField
      FieldName = 'FECHA_FACTURA'
    end
    object xLstCosteMP_VRIG_FACTURA: TIntegerField
      FieldName = 'RIG_FACTURA'
    end
    object xLstCosteMP_VID_S_FAC: TIntegerField
      FieldName = 'ID_S_FAC'
    end
    object xLstCosteMP_VLINEA_FAC: TIntegerField
      FieldName = 'LINEA_FAC'
    end
    object xLstCosteMP_VARTICULO: TFIBStringField
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xLstCosteMP_VTITULO: TFIBStringField
      FieldName = 'TITULO'
      Size = 60
    end
    object xLstCosteMP_VUNIDADES: TFloatField
      FieldName = 'UNIDADES'
    end
    object xLstCosteMP_VPRECIO: TFloatField
      FieldName = 'PRECIO'
    end
    object xLstCosteMP_VTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
    object xLstCosteMP_VCOSTE_MERCANCIA: TFloatField
      FieldName = 'COSTE_MERCANCIA'
    end
  end
  object frDBDSxLstCosteMP_V: TfrDBDataSet
    DataSet = xLstCosteMP_V
    Left = 47
    Top = 180
  end
  object DSxLstCosteMP_V: TDataSource
    Left = 47
    Top = 128
  end
end
