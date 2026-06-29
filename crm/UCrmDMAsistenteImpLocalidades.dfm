object CrmDMAsistenteImpLocalidades: TCrmDMAsistenteImpLocalidades
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 208
  Top = 152
  Height = 435
  Width = 663
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 40
    Top = 16
  end
  object XLApp: TExcelApplication
    AutoConnect = False
    ConnectKind = ckRunningOrNew
    AutoQuit = False
    Left = 176
    Top = 16
  end
  object QLlenarTemporal: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'insert into crm_tmp_importar_localidades (entrada,linea,titulo,c' +
        'odigo_postal,pais,provincia,codigo_provincia,colonia,tipo_coloni' +
        'a,ciudad)'
      
        'values (?entrada,?linea,?titulo,?codigo_postal,?pais,?provincia,' +
        '?codigo_provincia,?colonia,?tipo_colonia,?ciudad)')
    Transaction = TLocal
    AutoTrans = True
    Left = 320
    Top = 64
  end
  object QMLocalidadesImp: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CRM_TMP_IMPORTAR_LOCALIDADES'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  ENTRADA=?old_ENTRADA')
    InsertSQL.Strings = (
      'INSERT INTO CRM_TMP_IMPORTAR_LOCALIDADES'
      
        '  (ENTRADA,LINEA,TITULO,PAIS,PROVINCIA,CODIGO_POSTAL,CODIGO_PROV' +
        'INCIA,COLONIA,TIPO_COLONIA,CIUDAD)'
      'VALUES'
      
        '  (?ENTRADA,?LINEA,?TITULO,?PAIS,?PROVINCIA,?CODIGO_POSTAL,?CODI' +
        'GO_PROVINCIA,?COLONIA,?TIPO_COLONIA,?CIUDAD)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CRM_TMP_IMPORTAR_LOCALIDADES'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  ENTRADA=?ENTRADA ')
    SelectSQL.Strings = (
      'SELECT * FROM CRM_TMP_IMPORTAR_LOCALIDADES'
      'WHERE ENTRADA=?ENTRADA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CRM_TMP_IMPORTAR_LOCALIDADES'
      'SET'
      '  TITULO=?TITULO'
      '  ,PAIS=?PAIS'
      '  ,CODIGO_POSTAL=?CODIGO_POSTAL '
      ' ,PROVINCIA=?PROVINCIA'
      ' ,IMPORTAR=?IMPORTAR'
      ',CODIGO_PROVINCIA=?CODIGO_PROVINCIA'
      ',COLONIA=?COLONIA'
      ',TIPO_COLONIA=?TIPO_COLONIA'
      ',CIUDAD=?CIUDAD'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  ENTRADA=?ENTRADA ')
    AfterPost = QMLocalidadesImpAfterPost
    OnNewRecord = QMLocalidadesImpNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'ENTRADA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CRM_TMP_IMPORTAR_LOCALIDADES'
    UpdateTransaction = TLocal
    Left = 40
    Top = 64
    object QMLocalidadesImpTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object QMLocalidadesImpPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object QMLocalidadesImpPROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      DisplayWidth = 20
      FieldName = 'PROVINCIA'
    end
    object QMLocalidadesImpCODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'CODIGO_POSTAL'
      Size = 10
    end
    object QMLocalidadesImpENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMLocalidadesImpLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMLocalidadesImpIMPORTAR: TIntegerField
      DisplayLabel = 'Importar'
      FieldName = 'IMPORTAR'
    end
    object QMLocalidadesImpCOLONIA: TFIBStringField
      DisplayLabel = 'Colonia'
      FieldName = 'COLONIA'
      Size = 40
    end
    object QMLocalidadesImpTIPO_COLONIA: TFIBStringField
      DisplayLabel = 'Tipo Colonia'
      FieldName = 'TIPO_COLONIA'
      Size = 40
    end
    object QMLocalidadesImpCIUDAD: TFIBStringField
      DisplayLabel = 'Ciudad'
      FieldName = 'CIUDAD'
      Size = 40
    end
    object QMLocalidadesImpCODIGO_PROVINCIA: TFIBStringField
      DisplayLabel = 'Cod. Provincia'
      FieldName = 'CODIGO_PROVINCIA'
      Size = 2
    end
  end
  object DSQMLocalidadesImp: TDataSource
    DataSet = QMLocalidadesImp
    Left = 176
    Top = 64
  end
  object QInsertarLocalidad: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'INSERT INTO SYS_LOCALIDADES'
      
        '  (LOCALIDAD,TITULO,CODIGO_POSTAL,PAIS,PROVINCIA,ID_LOCAL,CIUDAD' +
        ',COLONIA,TIPO_COLONIA)'
      'VALUES'
      
        '(?LOCALIDAD,?TITULO,?CODIGO_POSTAL,?PAIS,?PROVINCIA,?ID_LOCAL,?C' +
        'IUDAD,?COLONIA,?TIPO_COLONIA)')
    Transaction = TLocal
    AutoTrans = True
    Left = 320
    Top = 16
  end
  object QInsertarProvincia: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'INSERT INTO SYS_PROVINCIAS'
      '  (PAIS,PROVINCIA,TITULO)'
      'VALUES'
      '(?PAIS,?CODIGO_PROVINCIA,?TITULO)')
    Transaction = TLocal
    AutoTrans = True
    Left = 320
    Top = 112
  end
end
