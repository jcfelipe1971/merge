object ProDMLstPresencia: TProDMLstPresencia
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 366
  Top = 248
  Height = 480
  Width = 643
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 568
    Top = 16
  end
  object frPresencia: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    Title = 'Listado de Presencia'
    RebuildPrinter = False
    OnGetValue = frPresenciaGetValue
    OnBeforePrint = frPresenciaEnterRect
    OnEnterRect = frPresenciaEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 568
    Top = 64
    ReportForm = {
      190000005E00000019000000001D004D6963726F736F66742058505320446F63
      756D656E742057726974657200FEFEFF000000000000000000000000FDFF0100
      000000FC00000000000000000000000000000000580024412E3D1758E3401B4D
      7D8ABA4EE640}
  end
  object QMLstCabPre: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT PRE.*'
      'FROM PRO_CAB_PRESENCIA PRE'
      
        'LEFT JOIN OPE_EMPLEADO OPE ON (OPE.EMPRESA = PRE.EMPRESA AND OPE' +
        '.EMPLEADO = PRE.OPERARIO)'
      'WHERE'
      'PRE.EMPRESA = :EMPRESA AND'
      'PRE.EJERCICIO = :EJERCICIO AND'
      'PRE.CANAL = :CANAL AND'
      'PRE.SERIE = :SERIE AND'
      'PRE.TIPO = :TIPO AND'
      'PRE.FECHA >= :FECHAD AND'
      'PRE.FECHA <= :FECHAH AND'
      'PRE.OPERARIO >= :OPERARIOD AND'
      'PRE.OPERARIO <= :OPERARIOH AND'
      'OPE.CALENDARIO >= :CALENDARIOD AND'
      'OPE.CALENDARIO <= :CALENDARIOH'
      'ORDER BY PRE.OPERARIO, PRE.FECHA')
    UniDirectional = False
    AfterOpen = QMLstCabPreAfterOpen
    BeforeClose = QMLstCabPreBeforeClose
    Left = 32
    Top = 16
  end
  object QMLstDetPre: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM PRO_DET_PRESENCIA'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'SERIE = :SERIE AND'
      'TIPO = :TIPO AND'
      'RIG = :RIG AND'
      'ID_INCIDENCIA >= :ID_INCIDENCIA_D AND'
      'ID_INCIDENCIA <= :ID_INCIDENCIA_H'
      'ORDER BY LINEA')
    UniDirectional = False
    DataSource = DSQMLstCabPre
    AfterOpen = QMLstDetPreAfterOpen
    BeforeClose = QMLstDetPreBeforeClose
    Left = 32
    Top = 64
  end
  object DSQMLstCabPre: TDataSource
    DataSet = QMLstCabPre
    Left = 128
    Top = 16
  end
  object DSQMLstDetPre: TDataSource
    DataSet = QMLstDetPre
    Left = 128
    Top = 64
  end
  object frDBCabPresencia: TfrDBDataSet
    DataSource = DSQMLstCabPre
    Left = 240
    Top = 16
  end
  object frDBDetPresencia: TfrDBDataSet
    DataSource = DSQMLstDetPre
    Left = 240
    Top = 64
  end
  object DSxCalendarioD: TDataSource
    DataSet = xCalendarioD
    Left = 456
    Top = 208
  end
  object xCalendarioD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT calendario,descripcion FROM ope_calendario_c'
      'WHERE empresa=?empresa and calendario=?calendario')
    UniDirectional = False
    Left = 360
    Top = 208
    object xCalendarioDDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object xCalendarioDCALENDARIO: TIntegerField
      DisplayLabel = 'Calendario'
      FieldName = 'CALENDARIO'
    end
  end
  object xCalendarioH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT calendario,descripcion FROM ope_calendario_c'
      'WHERE empresa=?empresa and calendario=?calendario')
    UniDirectional = False
    Left = 360
    Top = 256
    object xCalendarioHDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object xCalendarioHCALENDARIO: TIntegerField
      DisplayLabel = 'Calendario'
      FieldName = 'CALENDARIO'
    end
  end
  object DSxCalendariH: TDataSource
    DataSet = xCalendarioH
    Left = 456
    Top = 256
  end
  object DSxHorarioD: TDataSource
    DataSet = xHorarioD
    Left = 456
    Top = 112
  end
  object xHorarioD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT horario,descripcion FROM ope_horarios'
      'WHERE empresa=?empresa and horario=?horario')
    UniDirectional = False
    Left = 360
    Top = 112
    object xHorarioDDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
    object xHorarioDHORARIO: TFIBStringField
      DisplayLabel = 'Horario'
      FieldName = 'HORARIO'
      Size = 3
    end
  end
  object xHorarioH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT horario,descripcion FROM ope_horarios'
      'WHERE empresa=?empresa and horario=?horario')
    UniDirectional = False
    Left = 360
    Top = 160
    object xHorarioHDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
    object xHorarioHHORARIO: TFIBStringField
      DisplayLabel = 'Horario'
      FieldName = 'HORARIO'
      Size = 3
    end
  end
  object DSxHorarioH: TDataSource
    DataSet = xHorarioH
    Left = 456
    Top = 160
  end
  object DSxIncidenciaD: TDataSource
    DataSet = xIncidenciaD
    Left = 456
    Top = 16
  end
  object xIncidenciaD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT id_incidencia,descripcion FROM pro_sys_tipo_incidencia'
      'WHERE id_incidencia=?id_incidencia')
    UniDirectional = False
    Left = 360
    Top = 16
    object xIncidenciaDDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object xIncidenciaDID_INCIDENCIA: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_INCIDENCIA'
    end
  end
  object xIncidenciaH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT id_incidencia,descripcion FROM pro_sys_tipo_incidencia'
      'WHERE id_incidencia=?id_incidencia')
    UniDirectional = False
    Left = 360
    Top = 64
    object xIncidenciaHDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object xIncidenciaHID_INCIDENCIA: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_INCIDENCIA'
    end
  end
  object DSxIncidenciaH: TDataSource
    DataSet = xIncidenciaH
    Left = 456
    Top = 64
  end
  object DSQMLstOperario: TDataSource
    DataSet = QMLstOperario
    Left = 128
    Top = 112
  end
  object QMLstOperario: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM OPE_EMPLEADO'
      'WHERE '
      'EMPRESA = :EMPRESA AND'
      'EMPLEADO = :OPERARIO')
    UniDirectional = False
    DataSource = DSQMLstCabPre
    AfterOpen = QMLstOperarioAfterOpen
    BeforeClose = QMLstOperarioBeforeClose
    Left = 32
    Top = 112
  end
  object frDBDDSOperario: TfrDBDataSet
    DataSource = DSQMLstOperario
    Left = 240
    Top = 112
  end
  object DSQMLstTercero: TDataSource
    DataSet = QMLstTercero
    Left = 128
    Top = 160
  end
  object QMLstTercero: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * FROM VER_TERCEROS_EDICION'
      'WHERE '
      'TERCERO=:TERCERO')
    UniDirectional = False
    DataSource = DSQMLstOperario
    Left = 32
    Top = 160
  end
  object frDBDTercero: TfrDBDataSet
    DataSource = DSQMLstTercero
    Left = 240
    Top = 160
  end
  object DSQMLstIncidencia: TDataSource
    DataSet = QMLstIncidencia
    Left = 128
    Top = 208
  end
  object QMLstIncidencia: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT ID_INCIDENCIA, DESCRIPCION'
      'FROM PRO_SYS_TIPO_INCIDENCIA'
      'WHERE'
      'ID_INCIDENCIA = :ID_INCIDENCIA')
    UniDirectional = False
    DataSource = DSQMLstDetPre
    Left = 32
    Top = 208
  end
  object frDBDIncidencia: TfrDBDataSet
    DataSource = DSQMLstIncidencia
    Left = 240
    Top = 208
  end
end
