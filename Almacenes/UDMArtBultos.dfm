object DMArtBultos: TDMArtBultos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 350
  Top = 191
  Height = 256
  Width = 304
  object DSQMArtBultos: TDataSource
    DataSet = QMArtBultos
    Left = 104
    Top = 64
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 24
    Top = 8
  end
  object QMArtBultos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_BULTOS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  BULTO=?old_BULTO ')
    InsertSQL.Strings = (
      'INSERT INTO ART_BULTOS'
      
        '  (PESO,VOLUMEN,BULTO,EMPRESA,TITULO,NO_UNIDADES,TIPO_BULTO,ALTO' +
        ',ANCHO,FONDO,DIAMETRO)'
      'VALUES'
      
        '  (?PESO,?VOLUMEN,?BULTO,?EMPRESA,?TITULO,?NO_UNIDADES,?TIPO_BUL' +
        'TO,?ALTO,?ANCHO,?FONDO,?DIAMETRO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_BULTOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  BULTO=?BULTO ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_BULTOS'
      'WHERE EMPRESA=?EMPRESA'
      'ORDER BY BULTO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_BULTOS'
      'SET'
      '  PESO=?PESO '
      '  ,VOLUMEN=?VOLUMEN '
      '  ,TITULO=?TITULO '
      '  ,NO_UNIDADES=?NO_UNIDADES '
      '  ,TIPO_BULTO=?TIPO_BULTO '
      '  ,ALTO=?ALTO '
      '  ,ANCHO=?ANCHO '
      '  ,FONDO=?FONDO '
      '  ,DIAMETRO=?DIAMETRO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  BULTO=?BULTO ')
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMArtBultosNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'BULTO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_BULTOS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 24
    Top = 64
    object QMArtBultosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMArtBultosBULTO: TIntegerField
      DisplayLabel = 'Bulto'
      FieldName = 'BULTO'
    end
    object QMArtBultosTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMArtBultosPESO: TFloatField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
    end
    object QMArtBultosVOLUMEN: TFloatField
      DisplayLabel = 'Volumen'
      FieldName = 'VOLUMEN'
    end
    object QMArtBultosDIAMETRO: TFloatField
      DisplayLabel = 'Diametro'
      FieldName = 'DIAMETRO'
    end
    object QMArtBultosTIPO_BULTO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_BULTO'
      Size = 3
    end
    object QMArtBultosNO_UNIDADES: TIntegerField
      DisplayLabel = 'No admite Unidades'
      FieldName = 'NO_UNIDADES'
    end
    object QMArtBultosALTO: TFloatField
      DisplayLabel = 'Alto'
      FieldName = 'ALTO'
    end
    object QMArtBultosANCHO: TFloatField
      DisplayLabel = 'Ancho'
      FieldName = 'ANCHO'
    end
    object QMArtBultosFONDO: TFloatField
      DisplayLabel = 'fondo'
      FieldName = 'FONDO'
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
    Left = 104
    Top = 8
  end
end
