object ProDMLstRevisiones: TProDMLstRevisiones
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 192
  Top = 114
  Height = 447
  Width = 564
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait'
      'read')
    Left = 396
    Top = 43
  end
  object frRevisiones: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de etiquetas empleados'
    RebuildPrinter = False
    OnGetValue = frRevisionesGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 232
    Top = 27
    ReportForm = {19000000}
  end
  object xLstRevisiones: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select cab.codmaq,cab.tipo,cab.tipo,det.*,rev.* from pro_maquina' +
        's_c cab'
      
        'left join pro_maquinas_d det on (cab.empresa=det.empresa and cab' +
        '.codmaq=det.codmaq)'
      
        'left join pro_tipo_maquinas_revisiones rev on (cab.empresa=rev.e' +
        'mpresa and det.id_revision=rev.id)'
      
        'where empresa=?empresa and det.fecha_revision>=?fechad and det.f' +
        'echa_revision<=?fechah and'
      
        'cab.tipo>=?tipod and cab.tipo<=?tipoh and cab.codmaq>=?codmaqd a' +
        'nd cab.codmaq<=?codmaqh'
      'and ((revisado = 0) or (?revisados = 1))'
      'order by empresa,fecha_revision,tipo,codmaq')
    UniDirectional = False
    Left = 64
    Top = 19
    object xLstRevisionesCODMAQ: TIntegerField
      DisplayLabel = 'Cod. Maquina'
      FieldName = 'CODMAQ'
    end
    object xLstRevisionesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xLstRevisionesCODMAQ1: TIntegerField
      DisplayLabel = 'Cod. Maquina'
      FieldName = 'CODMAQ1'
    end
    object xLstRevisionesLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xLstRevisionesFECHA_REVISION: TDateTimeField
      DisplayLabel = 'Fec. Prevision'
      FieldName = 'FECHA_REVISION'
    end
    object xLstRevisionesFECHA_PROXIMA: TDateTimeField
      DisplayLabel = 'Fec. Prox.'
      FieldName = 'FECHA_PROXIMA'
    end
    object xLstRevisionesRESULTADO: TFIBStringField
      DisplayLabel = 'Resultado'
      FieldName = 'RESULTADO'
      Size = 25
    end
    object xLstRevisionesLABORATORIO: TFIBStringField
      DisplayLabel = 'Laboratorio'
      FieldName = 'LABORATORIO'
      Size = 25
    end
    object xLstRevisionesREVISADO: TIntegerField
      DisplayLabel = 'Revisado'
      FieldName = 'REVISADO'
    end
    object xLstRevisionesDENOMINACION: TFIBStringField
      DisplayLabel = 'Denominacion'
      FieldName = 'DENOMINACION'
    end
    object xLstRevisionesFRECUENCIA: TIntegerField
      DisplayLabel = 'Frecuencia'
      FieldName = 'FRECUENCIA'
    end
    object xLstRevisionesNOTAS: TMemoField
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object xLstRevisionesFECHA_PREVISTA_REVISION: TDateTimeField
      DisplayLabel = 'Fec. Prev. Revision'
      FieldName = 'FECHA_PREVISTA_REVISION'
    end
    object xLstRevisionesID_REVISION: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_REVISION'
    end
    object xLstRevisionesEMPRESA1: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA1'
    end
    object xLstRevisionesID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object xLstRevisionesDENOMINACION1: TFIBStringField
      DisplayLabel = 'Denominacion'
      FieldName = 'DENOMINACION1'
      Size = 60
    end
    object xLstRevisionesFRECUENCIA1: TIntegerField
      DisplayLabel = 'Frecuencia'
      FieldName = 'FRECUENCIA1'
    end
    object xLstRevisionesNOTAS1: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS1'
      Size = 8
    end
    object xLstRevisionesRESPONSABLE: TIntegerField
      DisplayLabel = 'Responsable'
      FieldName = 'RESPONSABLE'
    end
    object xLstRevisionesTIPO_REVISION: TFIBStringField
      DisplayLabel = 'Tipo Rev.'
      FieldName = 'TIPO_REVISION'
      Size = 3
    end
    object xLstRevisionesTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 5
    end
    object xLstRevisionesTIPO1: TFIBStringField
      DisplayLabel = 'Tipo 1'
      FieldName = 'TIPO1'
      Size = 5
    end
  end
  object DSxLstRevisiones: TDataSource
    DataSet = xLstRevisiones
    Left = 64
    Top = 75
  end
  object frDBLstRevisiones: TfrDBDataSet
    DataSource = DSxLstRevisiones
    Left = 232
    Top = 83
  end
  object xMinTipo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select min(tipo) as tipo from pro_tipo_maquinas'
      'where empresa=?empresa')
    UniDirectional = False
    Left = 224
    Top = 176
    object xMinTipoTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 5
    end
  end
  object xMaxTipo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select max(tipo) as tipo from pro_tipo_maquinas'
      'where empresa=?empresa')
    UniDirectional = False
    Left = 224
    Top = 232
    object xMaxTipoTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 5
    end
  end
  object DSxMinTipo: TDataSource
    DataSet = xMinTipo
    Left = 304
    Top = 176
  end
  object DSMaxTipo: TDataSource
    DataSet = xMaxTipo
    Left = 304
    Top = 232
  end
  object xMinMaquina: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select min(codmaq) as codmaq from pro_maquinas_c'
      'where empresa=?empresa')
    UniDirectional = False
    Left = 228
    Top = 288
    object xMinMaquinaCODMAQ: TIntegerField
      DisplayLabel = 'Cod. Maquina'
      FieldName = 'CODMAQ'
    end
  end
  object xMaxMaquina: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select max(codmaq) as codmaq from pro_maquinas_c'
      'where empresa=?empresa')
    UniDirectional = False
    Left = 228
    Top = 344
    object xMaxMaquinaCODMAQ: TIntegerField
      DisplayLabel = 'Cod. Maquina'
      FieldName = 'CODMAQ'
    end
  end
  object DSxMinMaquina: TDataSource
    DataSet = xMinMaquina
    Left = 308
    Top = 288
  end
  object DataDSxMaxMaquina: TDataSource
    DataSet = xMaxMaquina
    Left = 308
    Top = 344
  end
  object xTipoD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select descripcion from pro_tipo_maquinas  where'
      'empresa=?empresa and tipo=?tipod')
    UniDirectional = False
    Left = 68
    Top = 280
    object xTipoDDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
  end
  object xTipoH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select descripcion from pro_tipo_maquinas where empresa=?empresa'
      'and tipo=?tipoh'
      '')
    UniDirectional = False
    Left = 68
    Top = 336
    object FIBStringField2: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
  end
  object DSxTipoD: TDataSource
    DataSet = xTipoD
    Left = 148
    Top = 280
  end
  object DSxTipoH: TDataSource
    DataSet = xTipoH
    Left = 148
    Top = 336
  end
end
