object DMSIITipoDTE: TDMSIITipoDTE
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 365
  Top = 258
  Height = 391
  Width = 408
  object QTipoDTE: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'SELECT * FROM SII_TIPO_DOCUMENTO_TRIBUTARIO'
      'WHERE CODIGO=:CODIGO')
    SelectSQL.Strings = (
      'SELECT * FROM SII_TIPO_DOCUMENTO_TRIBUTARIO'
      'ORDER BY CODIGO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SII_TIPO_DOCUMENTO_TRIBUTARIO'
      'SET'
      'VISIBLE_ALB = :VISIBLE_ALB,'
      'VISIBLE_FAC = :VISIBLE_FAC'
      'WHERE CODIGO=:CODIGO')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 32
    Top = 24
    object QTipoDTECODIGO: TFIBStringField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'CODIGO'
      ReadOnly = True
      Size = 3
    end
    object QTipoDTETITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      ReadOnly = True
      Size = 60
    end
    object QTipoDTEVISIBLE_ALB: TIntegerField
      DisplayLabel = 'Gu'#237'a de despacho'
      FieldName = 'VISIBLE_ALB'
    end
    object QTipoDTEVISIBLE_FAC: TIntegerField
      DisplayLabel = 'Factura Docs.'
      FieldName = 'VISIBLE_FAC'
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
    Left = 280
    Top = 16
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 344
    Top = 16
  end
  object DSQTipoDTE: TDataSource
    DataSet = QTipoDTE
    Left = 120
    Top = 24
  end
end
