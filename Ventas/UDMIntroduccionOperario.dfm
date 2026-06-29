object DMIntroduccionOperario: TDMIntroduccionOperario
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 767
  Top = 215
  Height = 283
  Width = 220
  object DSQMCabecera: TDataSource
    DataSet = QMCabecera
    Left = 144
    Top = 88
  end
  object QMCabecera: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    InsertSQL.Strings = (
      'INSERT INTO VER_CABECERAS_S_PRE'
      
        '  (ID,EMPRESA,HOJA,CLIENTE,NOMBRE_R_SOCIAL,RESPONSABLE,TITUTLO_R' +
        'ESPONSABLE,FECHA_INICIO,FECHA_FIN,COMENTARIO,TOTAL_UNIDADES,TOTA' +
        'L_UNIDADES_LOGISTICAS,DIRECCION,DIR_COMPLETA_N,ID_EMPLEADO,ESTAD' +
        'O,GENERAR_ALBARAN)'
      'VALUES'
      
        '  (?ID,?EMPRESA,?HOJA,?CLIENTE,?NOMBRE_R_SOCIAL,?RESPONSABLE,?TI' +
        'TUTLO_RESPONSABLE,?FECHA_INICIO,?FECHA_FIN,?COMENTARIO,?TOTAL_UN' +
        'IDADES,?TOTAL_UNIDADES_LOGISTICAS,?DIRECCION,?DIR_COMPLETA_N,?ID' +
        '_EMPLEADO,?ESTADO,?GENERAR_ALBARAN)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CABECERAS_S_PRE'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CABECERAS_S_PRE'
      'WHERE EMPRESA=?EMPRESA '
      'ORDER BY HOJA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CABECERAS_S_PRE'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,HOJA=?HOJA '
      '  ,CLIENTE=?CLIENTE '
      '  ,NOMBRE_R_SOCIAL=?NOMBRE_R_SOCIAL '
      '  ,RESPONSABLE=?RESPONSABLE '
      '  ,TITUTLO_RESPONSABLE=?TITUTLO_RESPONSABLE '
      '  ,FECHA_INICIO=?FECHA_INICIO '
      '  ,FECHA_FIN=?FECHA_FIN '
      '  ,COMENTARIO=?COMENTARIO '
      '  ,TOTAL_UNIDADES=?TOTAL_UNIDADES '
      '  ,TOTAL_UNIDADES_LOGISTICAS=?TOTAL_UNIDADES_LOGISTICAS '
      '  ,DIRECCION=?DIRECCION '
      '  ,DIR_COMPLETA_N=?DIR_COMPLETA_N '
      '  ,ID_EMPLEADO=?ID_EMPLEADO '
      '  ,ESTADO=?ESTADO '
      '  ,GENERAR_ALBARAN=?GENERAR_ALBARAN '
      'WHERE'
      '  ID=?ID '
      '')
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 88
    object QMCabeceraID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMCabeceraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCabeceraHOJA: TIntegerField
      DisplayLabel = 'Hoja'
      FieldName = 'HOJA'
    end
    object QMCabeceraCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMCabeceraNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMCabeceraRESPONSABLE: TIntegerField
      DisplayLabel = 'Responsable'
      FieldName = 'RESPONSABLE'
    end
    object QMCabeceraTITUTLO_RESPONSABLE: TFIBStringField
      DisplayLabel = 'Nombre Resp.'
      FieldName = 'TITUTLO_RESPONSABLE'
      Size = 60
    end
    object QMCabeceraFECHA_INICIO: TDateTimeField
      DisplayLabel = 'Fec. Ini.'
      FieldName = 'FECHA_INICIO'
    end
    object QMCabeceraFECHA_FIN: TDateTimeField
      DisplayLabel = 'Fec. Fin'
      FieldName = 'FECHA_FIN'
    end
    object QMCabeceraCOMENTARIO: TFIBStringField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      Size = 100
    end
    object QMCabeceraTOTAL_UNIDADES: TFloatField
      DisplayLabel = 'Total Uds.'
      FieldName = 'TOTAL_UNIDADES'
    end
    object QMCabeceraTOTAL_UNIDADES_LOGISTICAS: TFloatField
      DisplayLabel = 'Total Uds. Log.'
      FieldName = 'TOTAL_UNIDADES_LOGISTICAS'
    end
    object QMCabeceraDIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
    end
    object QMCabeceraDIR_COMPLETA_N: TFIBStringField
      DisplayLabel = 'Direccion Completa'
      FieldName = 'DIR_COMPLETA_N'
      Size = 76
    end
    object QMCabeceraID_EMPLEADO: TIntegerField
      DisplayLabel = 'ID Empleado'
      FieldName = 'ID_EMPLEADO'
    end
    object QMCabeceraESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMCabeceraGENERAR_ALBARAN: TIntegerField
      DisplayLabel = 'Generar Alb.'
      FieldName = 'GENERAR_ALBARAN'
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 48
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 152
    Top = 8
  end
end
