object DMRangosPortes: TDMRangosPortes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 408
  Top = 208
  Height = 377
  Width = 517
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 256
    Top = 24
  end
  object QMCabecera: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_RANGOS'
      'WHERE'
      '  ID_RANGO=?ID_RANGO')
    InsertSQL.Strings = (
      'INSERT INTO EMP_RANGOS'
      '  (EMPRESA,RANGO,TITULO,TIPO,ID_RANGO)'
      'VALUES'
      '  (?EMPRESA,?RANGO,?TITULO,?TIPO,?ID_RANGO)')
    RefreshSQL.Strings = (
      'SELECT EMPRESA,RANGO,TITULO,TIPO,ID_RANGO'
      'FROM EMP_RANGOS'
      'WHERE'
      '   ID_RANGO=?ID_RANGO')
    SelectSQL.Strings = (
      'SELECT EMPRESA,RANGO,TITULO,TIPO,ID_RANGO'
      'FROM EMP_RANGOS'
      'WHERE EMPRESA=?EMPRESA '
      'ORDER BY RANGO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_RANGOS'
      'SET'
      '  TITULO=?TITULO '
      '  ,TIPO=?TIPO '
      'WHERE'
      '  ID_RANGO=?ID_RANGO')
    AfterOpen = QMCabeceraAfterOpen
    BeforeClose = QMCabeceraBeforeClose
    BeforePost = QMCabeceraBeforePost
    OnNewRecord = QMCabeceraNewRecord
    ClavesPrimarias.Strings = (
      'ID_RANGO'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_RANGOS'
    BloqOpt = True
    TablasBloqueo.Strings = (
      'EMP_RANGOS')
    CamposBloqueo.Strings = (
      'ID_RANGO')
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 16
    object QMCabeceraTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMCabeceraTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMCabeceraID_RANGO: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_RANGO'
    end
    object QMCabeceraRANGO: TIntegerField
      DisplayLabel = 'Rango'
      FieldName = 'RANGO'
    end
    object QMCabeceraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
  end
  object DSQMCabecera: TDataSource
    DataSet = QMCabecera
    Left = 128
    Top = 16
  end
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_RANGOS_INDICES'
      'WHERE'
      '  INDICE=?old_INDICE AND '
      '  RANGO=?old_RANGO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_RANGOS_INDICES'
      
        '  (EMPRESA,RANGO,INDICE,TITULO,VALOR_1,VALOR_2,VALOR_3,VALOR_4,V' +
        'ALOR_5,VALOR_6,VALOR_7,VALOR_8,VALOR_9,VALOR_10,VALOR_11,VALOR_1' +
        '2,VALOR_13,VALOR_14,VALOR_15,VALOR_16,VALOR_17,VALOR_18,VALOR_19' +
        ',VALOR_20,VALOR_21,VALOR_22,VALOR_23,VALOR_24,VALOR_25,ID_RANGO,' +
        'ID_INDICE)'
      'VALUES'
      
        '  (?EMPRESA,?RANGO,?INDICE,?TITULO,?VALOR_1,?VALOR_2,?VALOR_3,?V' +
        'ALOR_4,?VALOR_5,?VALOR_6,?VALOR_7,?VALOR_8,?VALOR_9,?VALOR_10,?V' +
        'ALOR_11,?VALOR_12,?VALOR_13,?VALOR_14,?VALOR_15,?VALOR_16,?VALOR' +
        '_17,?VALOR_18,?VALOR_19,?VALOR_20,?VALOR_21,?VALOR_22,?VALOR_23,' +
        '?VALOR_24,?VALOR_25,?ID_RANGO,?ID_INDICE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_RANGOS_INDICES'
      'WHERE'
      '  ID_INDICE=?ID_INDICE')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_RANGOS_INDICES'
      'WHERE ID_RANGO=?ID_RANGO'
      'ORDER BY INDICE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_RANGOS_INDICES'
      'SET'
      '  TITULO=?TITULO '
      '  ,VALOR_1=?VALOR_1 '
      '  ,VALOR_2=?VALOR_2 '
      '  ,VALOR_3=?VALOR_3 '
      '  ,VALOR_4=?VALOR_4 '
      '  ,VALOR_5=?VALOR_5 '
      '  ,VALOR_6=?VALOR_6 '
      '  ,VALOR_7=?VALOR_7 '
      '  ,VALOR_8=?VALOR_8 '
      '  ,VALOR_9=?VALOR_9 '
      '  ,VALOR_10=?VALOR_10 '
      '  ,VALOR_11=?VALOR_11 '
      '  ,VALOR_12=?VALOR_12 '
      '  ,VALOR_13=?VALOR_13 '
      '  ,VALOR_14=?VALOR_14 '
      '  ,VALOR_15=?VALOR_15 '
      '  ,VALOR_16=?VALOR_16 '
      '  ,VALOR_17=?VALOR_17 '
      '  ,VALOR_18=?VALOR_18 '
      '  ,VALOR_19=?VALOR_19 '
      '  ,VALOR_20=?VALOR_20 '
      '  ,VALOR_21=?VALOR_21 '
      '  ,VALOR_22=?VALOR_22 '
      '  ,VALOR_23=?VALOR_23 '
      '  ,VALOR_24=?VALOR_24 '
      '  ,VALOR_25=?VALOR_25 '
      '  ,ID_RANGO=?ID_RANGO '
      '  ,ID_INDICE=?ID_INDICE '
      'WHERE'
      '  ID_INDICE=?ID_INDICE')
    DataSource = DSQMCabecera
    BeforePost = QMDetalleBeforePost
    OnNewRecord = QMDetalleNewRecord
    ClavesPrimarias.Strings = (
      'ID_INDICE'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_RANGOS_INDICES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 64
    object QMDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetalleRANGO: TIntegerField
      DisplayLabel = 'Rango'
      FieldName = 'RANGO'
    end
    object QMDetalleINDICE: TIntegerField
      DisplayLabel = 'Indice'
      FieldName = 'INDICE'
    end
    object QMDetalleTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMDetalleVALOR_1: TFloatField
      DisplayLabel = 'Valor 1'
      FieldName = 'VALOR_1'
    end
    object QMDetalleVALOR_2: TFloatField
      DisplayLabel = 'Valor 2'
      FieldName = 'VALOR_2'
    end
    object QMDetalleVALOR_3: TFloatField
      DisplayLabel = 'Valor 3'
      FieldName = 'VALOR_3'
    end
    object QMDetalleVALOR_4: TFloatField
      DisplayLabel = 'Valor 4'
      FieldName = 'VALOR_4'
    end
    object QMDetalleVALOR_5: TFloatField
      DisplayLabel = 'Valor 5'
      FieldName = 'VALOR_5'
    end
    object QMDetalleVALOR_6: TFloatField
      DisplayLabel = 'Valor 6'
      FieldName = 'VALOR_6'
    end
    object QMDetalleVALOR_7: TFloatField
      DisplayLabel = 'Valor 7'
      FieldName = 'VALOR_7'
    end
    object QMDetalleVALOR_8: TFloatField
      DisplayLabel = 'Valor 8'
      FieldName = 'VALOR_8'
    end
    object QMDetalleVALOR_9: TFloatField
      DisplayLabel = 'Valor 9'
      FieldName = 'VALOR_9'
    end
    object QMDetalleVALOR_10: TFloatField
      DisplayLabel = 'Valor 10'
      FieldName = 'VALOR_10'
    end
    object QMDetalleVALOR_11: TFloatField
      DisplayLabel = 'Valor 11'
      FieldName = 'VALOR_11'
    end
    object QMDetalleVALOR_12: TFloatField
      DisplayLabel = 'Valor 12'
      FieldName = 'VALOR_12'
    end
    object QMDetalleVALOR_13: TFloatField
      DisplayLabel = 'Valor 13'
      FieldName = 'VALOR_13'
    end
    object QMDetalleVALOR_14: TFloatField
      DisplayLabel = 'Valor 14'
      FieldName = 'VALOR_14'
    end
    object QMDetalleVALOR_15: TFloatField
      DisplayLabel = 'Valor 15'
      FieldName = 'VALOR_15'
    end
    object QMDetalleVALOR_16: TFloatField
      DisplayLabel = 'Valor 16'
      FieldName = 'VALOR_16'
    end
    object QMDetalleVALOR_17: TFloatField
      DisplayLabel = 'Valor 17'
      FieldName = 'VALOR_17'
    end
    object QMDetalleVALOR_18: TFloatField
      DisplayLabel = 'Valor 18'
      FieldName = 'VALOR_18'
    end
    object QMDetalleVALOR_19: TFloatField
      DisplayLabel = 'Valor 19'
      FieldName = 'VALOR_19'
    end
    object QMDetalleVALOR_20: TFloatField
      DisplayLabel = 'Valor 20'
      FieldName = 'VALOR_20'
    end
    object QMDetalleVALOR_21: TFloatField
      DisplayLabel = 'Valor 21'
      FieldName = 'VALOR_21'
    end
    object QMDetalleVALOR_22: TFloatField
      DisplayLabel = 'Valor 22'
      FieldName = 'VALOR_22'
    end
    object QMDetalleVALOR_23: TFloatField
      DisplayLabel = 'Valor 23'
      FieldName = 'VALOR_23'
    end
    object QMDetalleVALOR_24: TFloatField
      DisplayLabel = 'Valor 24'
      FieldName = 'VALOR_24'
    end
    object QMDetalleVALOR_25: TFloatField
      DisplayLabel = 'Valor 25'
      FieldName = 'VALOR_25'
    end
    object QMDetalleID_RANGO: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_RANGO'
    end
    object QMDetalleID_INDICE: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_INDICE'
    end
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 128
    Top = 64
  end
  object xRangos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from emp_rangos'
      'where id_rango=?id_rango')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 48
    Top = 112
    object xRangosRANGO_1: TFloatField
      DisplayLabel = 'Rango 1'
      FieldName = 'RANGO_1'
    end
    object xRangosRANGO_2: TFloatField
      DisplayLabel = 'Rango 2'
      FieldName = 'RANGO_2'
    end
    object xRangosRANGO_3: TFloatField
      DisplayLabel = 'Rango 3'
      FieldName = 'RANGO_3'
    end
    object xRangosRANGO_4: TFloatField
      DisplayLabel = 'Rango 4'
      FieldName = 'RANGO_4'
    end
    object xRangosRANGO_5: TFloatField
      DisplayLabel = 'Rango 5'
      FieldName = 'RANGO_5'
    end
    object xRangosRANGO_6: TFloatField
      DisplayLabel = 'Rango 6'
      FieldName = 'RANGO_6'
    end
    object xRangosRANGO_7: TFloatField
      DisplayLabel = 'Rango 7'
      FieldName = 'RANGO_7'
    end
    object xRangosRANGO_8: TFloatField
      DisplayLabel = 'Rango 8'
      FieldName = 'RANGO_8'
    end
    object xRangosRANGO_9: TFloatField
      DisplayLabel = 'Rango 9'
      FieldName = 'RANGO_9'
    end
    object xRangosRANGO_10: TFloatField
      DisplayLabel = 'Rango 10'
      FieldName = 'RANGO_10'
    end
    object xRangosRANGO_11: TFloatField
      DisplayLabel = 'Rango 11'
      FieldName = 'RANGO_11'
    end
    object xRangosRANGO_12: TFloatField
      DisplayLabel = 'Rango 12'
      FieldName = 'RANGO_12'
    end
    object xRangosRANGO_13: TFloatField
      DisplayLabel = 'Rango 13'
      FieldName = 'RANGO_13'
    end
    object xRangosRANGO_14: TFloatField
      DisplayLabel = 'Rango 14'
      FieldName = 'RANGO_14'
    end
    object xRangosRANGO_15: TFloatField
      DisplayLabel = 'Rango 15'
      FieldName = 'RANGO_15'
    end
    object xRangosRANGO_16: TFloatField
      DisplayLabel = 'Rango 16'
      FieldName = 'RANGO_16'
    end
    object xRangosRANGO_17: TFloatField
      DisplayLabel = 'Rango 17'
      FieldName = 'RANGO_17'
    end
    object xRangosRANGO_18: TFloatField
      DisplayLabel = 'Rango 18'
      FieldName = 'RANGO_18'
    end
    object xRangosRANGO_19: TFloatField
      DisplayLabel = 'Rango 19'
      FieldName = 'RANGO_19'
    end
    object xRangosRANGO_20: TFloatField
      DisplayLabel = 'Rango 20'
      FieldName = 'RANGO_20'
    end
    object xRangosRANGO_21: TFloatField
      DisplayLabel = 'Rango 21'
      FieldName = 'RANGO_21'
    end
    object xRangosRANGO_22: TFloatField
      DisplayLabel = 'Rango 22'
      FieldName = 'RANGO_22'
    end
    object xRangosRANGO_23: TFloatField
      DisplayLabel = 'Rango 23'
      FieldName = 'RANGO_23'
    end
    object xRangosRANGO_24: TFloatField
      DisplayLabel = 'Rango 24'
      FieldName = 'RANGO_24'
    end
    object xRangosRANGO_25: TFloatField
      DisplayLabel = 'Rango 25'
      FieldName = 'RANGO_25'
    end
  end
  object DSxRangosTMP: TDataSource
    DataSet = xRangosTMP
    Left = 128
    Top = 160
  end
  object xRangosTMP: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM TMP_EMP_RANGO'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  RANGO=?old_RANGO AND '
      '  EMPRESA=?old_EMPRESA AND '
      '  ENTRADA=?old_ENTRADA ')
    InsertSQL.Strings = (
      'INSERT INTO TMP_EMP_RANGO'
      '  (ENTRADA,EMPRESA,RANGO,LINEA,VALOR,ID_RANGO)'
      'VALUES'
      '  (?ENTRADA,?EMPRESA,?RANGO,?LINEA,?VALOR,?ID_RANGO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_EMP_RANGO'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RANGO=?RANGO AND '
      '  EMPRESA=?EMPRESA AND '
      '  ENTRADA=?ENTRADA ')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_EMP_RANGO'
      'WHERE ID_RANGO=?ID_RANGO AND ENTRADA=?ENTRADA'
      'ORDER BY LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE TMP_EMP_RANGO'
      'SET'
      '  VALOR=?VALOR '
      'WHERE'
      '  LINEA=?LINEA AND '
      '  RANGO=?RANGO AND '
      '  EMPRESA=?EMPRESA AND '
      '  ENTRADA=?ENTRADA ')
    OnNewRecord = xRangosTMPNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'RANGO '
      'EMPRESA '
      'ENTRADA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_EMP_RANGO'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 160
    object xRangosTMPENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object xRangosTMPEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xRangosTMPRANGO: TIntegerField
      DisplayLabel = 'Rango'
      FieldName = 'RANGO'
    end
    object xRangosTMPLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xRangosTMPID_RANGO: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_RANGO'
    end
    object xRangosTMPVALOR: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
    end
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 320
    Top = 24
  end
end
