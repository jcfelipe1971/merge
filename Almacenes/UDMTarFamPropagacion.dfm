object DMTarFamPropagacion: TDMTarFamPropagacion
  OldCreateOrder = False
  OnCreate = DMTarFamPropagacionCreate
  OnDestroy = DataModuleDestroy
  Left = 595
  Top = 293
  Height = 212
  Width = 466
  object xIzqu: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select Tarifa as codigo,titulo_tar as titulo '
      
        'from ver_tarifas_propaga_edicion where(propaga=0) order by tarif' +
        'a')
    UniDirectional = False
    DataSource = DSxBusc
    Left = 32
    Top = 8
    object xIzquCODIGO: TFIBStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 3
    end
    object xIzquTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxIzqu: TDataSource
    DataSet = xIzqu
    Left = 104
    Top = 8
  end
  object xDere: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select Tarifa as codigo,titulo_tar as titulo '
      
        'from ver_tarifas_propaga_edicion where(propaga=1) order by tarif' +
        'a')
    UniDirectional = False
    DataSource = DSxBusc
    Left = 32
    Top = 56
    object xDereCODIGO: TFIBStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 3
    end
    object xDereTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxDere: TDataSource
    DataSet = xDere
    Left = 104
    Top = 56
  end
  object xBusc: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select distinct tarifa as codigo,titulo_tar as titulo'
      'from ver_tarifas_propaga_edicion where(propaga=1)')
    UniDirectional = False
    Left = 32
    Top = 104
    object xBuscCODIGO: TFIBStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      Size = 3
    end
    object xBuscTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxBusc: TDataSource
    DataSet = xBusc
    Left = 104
    Top = 104
  end
  object QCambios: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'update art_tarifas_propaga'
      'set propaga=?propaga '
      
        'where((empresa=?empresa)and(tarifa=?tarifa)and(familia=?familia)' +
        ') ')
    Transaction = TLocal
    AutoTrans = True
    Left = 208
    Top = 56
  end
  object QTodos: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'update art_tarifas_propaga set propaga=1 '
      'where(empresa=?empresa) ')
    Transaction = TLocal
    AutoTrans = True
    Left = 208
    Top = 8
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 304
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 304
    Top = 56
  end
end
