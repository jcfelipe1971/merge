object DMPerfiles: TDMPerfiles
  OldCreateOrder = False
  OnCreate = DMPerfilesCreate
  Left = 529
  Top = 176
  Height = 372
  Width = 370
  object QMPerfiles: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_PERFILES'
      'WHERE'
      '  PERFIL=?old_PERFIL ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_PERFILES'
      
        '  (ULT_MODIFICACION,DEFECTO,PERFIL,TITULO,COPIAS_PEDIDO,COPIAS_A' +
        'LBARAN,COPIAS_FACTURA,COPIAS_OFERTA,MODELO_OFERTA,MODELO_PEDIDO,' +
        'MODELO_ALBARAN,MODELO_FACTURA,IMPONER_LISTADO_OFERTA,IMPONER_LIS' +
        'TADO_PEDIDO,IMPONER_LISTADO_ALBARAN,IMPONER_LISTADO_FACTURA,IMPO' +
        'NER_COPIAS_OFERTA,IMPONER_COPIAS_PEDIDO,IMPONER_COPIAS_ALBARAN,I' +
        'MPONER_COPIAS_FACTURA,IMPONER_LISTADO_OFERTA_MAIL,IMPONER_LISTAD' +
        'O_PEDIDO_MAIL,IMPONER_LISTADO_ALBARAN_MAIL,IMPONER_LISTADO_FACTU' +
        'RA_MAIL,MODELO_OFERTA_MAIL,MODELO_PEDIDO_MAIL,MODELO_ALBARAN_MAI' +
        'L,MODELO_FACTURA_MAIL)'
      'VALUES'
      
        '  (?ULT_MODIFICACION,?DEFECTO,?PERFIL,?TITULO,?COPIAS_PEDIDO,?CO' +
        'PIAS_ALBARAN,?COPIAS_FACTURA,?COPIAS_OFERTA,?MODELO_OFERTA,?MODE' +
        'LO_PEDIDO,?MODELO_ALBARAN,?MODELO_FACTURA,?IMPONER_LISTADO_OFERT' +
        'A,?IMPONER_LISTADO_PEDIDO,?IMPONER_LISTADO_ALBARAN,?IMPONER_LIST' +
        'ADO_FACTURA,?IMPONER_COPIAS_OFERTA,?IMPONER_COPIAS_PEDIDO,?IMPON' +
        'ER_COPIAS_ALBARAN,?IMPONER_COPIAS_FACTURA,?IMPONER_LISTADO_OFERT' +
        'A_MAIL,?IMPONER_LISTADO_PEDIDO_MAIL,?IMPONER_LISTADO_ALBARAN_MAI' +
        'L,?IMPONER_LISTADO_FACTURA_MAIL,?MODELO_OFERTA_MAIL,?MODELO_PEDI' +
        'DO_MAIL,?MODELO_ALBARAN_MAIL,?MODELO_FACTURA_MAIL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_PERFILES'
      'WHERE'
      '  PERFIL=?PERFIL ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_PERFILES'
      'ORDER BY PERFIL')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_PERFILES'
      'SET'
      '  ULT_MODIFICACION=?ULT_MODIFICACION '
      '  ,DEFECTO=?DEFECTO '
      '  ,TITULO=?TITULO '
      '  ,COPIAS_PEDIDO=?COPIAS_PEDIDO '
      '  ,COPIAS_ALBARAN=?COPIAS_ALBARAN '
      '  ,COPIAS_FACTURA=?COPIAS_FACTURA '
      '  ,COPIAS_OFERTA=?COPIAS_OFERTA '
      '  ,MODELO_OFERTA=?MODELO_OFERTA '
      '  ,MODELO_PEDIDO=?MODELO_PEDIDO '
      '  ,MODELO_ALBARAN=?MODELO_ALBARAN '
      '  ,MODELO_FACTURA=?MODELO_FACTURA '
      '  ,IMPONER_LISTADO_OFERTA=?IMPONER_LISTADO_OFERTA '
      '  ,IMPONER_LISTADO_PEDIDO=?IMPONER_LISTADO_PEDIDO '
      '  ,IMPONER_LISTADO_ALBARAN=?IMPONER_LISTADO_ALBARAN '
      '  ,IMPONER_LISTADO_FACTURA=?IMPONER_LISTADO_FACTURA '
      '  ,IMPONER_COPIAS_OFERTA=?IMPONER_COPIAS_OFERTA '
      '  ,IMPONER_COPIAS_PEDIDO=?IMPONER_COPIAS_PEDIDO '
      '  ,IMPONER_COPIAS_ALBARAN=?IMPONER_COPIAS_ALBARAN '
      '  ,IMPONER_COPIAS_FACTURA=?IMPONER_COPIAS_FACTURA '
      '  ,IMPONER_LISTADO_OFERTA_MAIL=?IMPONER_LISTADO_OFERTA_MAIL '
      '  ,IMPONER_LISTADO_PEDIDO_MAIL=?IMPONER_LISTADO_PEDIDO_MAIL '
      '  ,IMPONER_LISTADO_ALBARAN_MAIL=?IMPONER_LISTADO_ALBARAN_MAIL '
      '  ,IMPONER_LISTADO_FACTURA_MAIL=?IMPONER_LISTADO_FACTURA_MAIL '
      '  ,MODELO_OFERTA_MAIL=?MODELO_OFERTA_MAIL '
      '  ,MODELO_PEDIDO_MAIL=?MODELO_PEDIDO_MAIL '
      '  ,MODELO_ALBARAN_MAIL=?MODELO_ALBARAN_MAIL '
      '  ,MODELO_FACTURA_MAIL=?MODELO_FACTURA_MAIL '
      'WHERE'
      '  PERFIL=?PERFIL ')
    OnNewRecord = QMPerfilesNewRecord
    ClavesPrimarias.Strings = (
      'PERFIL ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_PERFILES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 24
    object QMPerfilesPERFIL: TFIBStringField
      DisplayLabel = 'Perfil'
      FieldName = 'PERFIL'
      Size = 4
    end
    object QMPerfilesTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMPerfilesCOPIAS_OFERTA: TIntegerField
      DisplayLabel = 'Copias Oferta'
      FieldName = 'COPIAS_OFERTA'
    end
    object QMPerfilesMODELO_OFERTA: TIntegerField
      DisplayLabel = 'Mod. Oferta'
      FieldName = 'MODELO_OFERTA'
    end
    object QMPerfilesCOPIAS_PEDIDO: TIntegerField
      DisplayLabel = 'Copias Pedido'
      FieldName = 'COPIAS_PEDIDO'
    end
    object QMPerfilesMODELO_PEDIDO: TIntegerField
      DisplayLabel = 'Mod. Pedido'
      FieldName = 'MODELO_PEDIDO'
    end
    object QMPerfilesCOPIAS_ALBARAN: TIntegerField
      DisplayLabel = 'Copias Albar'#225'n'
      FieldName = 'COPIAS_ALBARAN'
    end
    object QMPerfilesMODELO_ALBARAN: TIntegerField
      DisplayLabel = 'Mod. Albar'#225'n'
      FieldName = 'MODELO_ALBARAN'
    end
    object QMPerfilesCOPIAS_FACTURA: TIntegerField
      DisplayLabel = 'Copias Factura'
      FieldName = 'COPIAS_FACTURA'
    end
    object QMPerfilesMODELO_FACTURA: TIntegerField
      DisplayLabel = 'Mod. Factura'
      FieldName = 'MODELO_FACTURA'
    end
    object QMPerfilesDEFECTO: TIntegerField
      DisplayLabel = 'Defecto'
      FieldName = 'DEFECTO'
    end
    object QMPerfilesIMPONER_LISTADO_OFERTA: TIntegerField
      DisplayLabel = 'Imponer Lst. Oferta'
      FieldName = 'IMPONER_LISTADO_OFERTA'
    end
    object QMPerfilesIMPONER_LISTADO_PEDIDO: TIntegerField
      DisplayLabel = 'Imponer Lst. Pedido'
      FieldName = 'IMPONER_LISTADO_PEDIDO'
    end
    object QMPerfilesIMPONER_LISTADO_ALBARAN: TIntegerField
      DisplayLabel = 'Imponer Lst. Albaran'
      FieldName = 'IMPONER_LISTADO_ALBARAN'
    end
    object QMPerfilesIMPONER_LISTADO_FACTURA: TIntegerField
      DisplayLabel = 'Imponer Lst. Factura'
      FieldName = 'IMPONER_LISTADO_FACTURA'
    end
    object QMPerfilesIMPONER_COPIAS_OFERTA: TIntegerField
      DisplayLabel = 'Imponer Copias Oferta'
      FieldName = 'IMPONER_COPIAS_OFERTA'
    end
    object QMPerfilesIMPONER_COPIAS_PEDIDO: TIntegerField
      DisplayLabel = 'Imponer Copias Pedido'
      FieldName = 'IMPONER_COPIAS_PEDIDO'
    end
    object QMPerfilesIMPONER_COPIAS_ALBARAN: TIntegerField
      DisplayLabel = 'Imponer Copias Albaran'
      FieldName = 'IMPONER_COPIAS_ALBARAN'
    end
    object QMPerfilesIMPONER_COPIAS_FACTURA: TIntegerField
      DisplayLabel = 'Imponer Copias Factura'
      FieldName = 'IMPONER_COPIAS_FACTURA'
    end
    object QMPerfilesIMPONER_LISTADO_OFERTA_MAIL: TIntegerField
      DisplayLabel = 'Imponer Lst. Oferta Mail'
      FieldName = 'IMPONER_LISTADO_OFERTA_MAIL'
    end
    object QMPerfilesIMPONER_LISTADO_PEDIDO_MAIL: TIntegerField
      DisplayLabel = 'Imponer Lst. Pedido Mail'
      FieldName = 'IMPONER_LISTADO_PEDIDO_MAIL'
    end
    object QMPerfilesIMPONER_LISTADO_ALBARAN_MAIL: TIntegerField
      DisplayLabel = 'Imponer Lst. Albaran Mail'
      FieldName = 'IMPONER_LISTADO_ALBARAN_MAIL'
    end
    object QMPerfilesIMPONER_LISTADO_FACTURA_MAIL: TIntegerField
      DisplayLabel = 'Imponer Lst. Factura Mail'
      FieldName = 'IMPONER_LISTADO_FACTURA_MAIL'
    end
    object QMPerfilesMODELO_OFERTA_MAIL: TIntegerField
      DisplayLabel = 'Mod. Oferta Mail'
      FieldName = 'MODELO_OFERTA_MAIL'
    end
    object QMPerfilesMODELO_PEDIDO_MAIL: TIntegerField
      DisplayLabel = 'Mod. Pedido Mail'
      FieldName = 'MODELO_PEDIDO_MAIL'
    end
    object QMPerfilesMODELO_ALBARAN_MAIL: TIntegerField
      DisplayLabel = 'Mod. Albar'#225'n Mail'
      FieldName = 'MODELO_ALBARAN_MAIL'
    end
    object QMPerfilesMODELO_FACTURA_MAIL: TIntegerField
      DisplayLabel = 'Mod. Factura Mail'
      FieldName = 'MODELO_FACTURA_MAIL'
    end
  end
  object DSPerfiles: TDataSource
    DataSet = QMPerfiles
    Left = 136
    Top = 24
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 232
    Top = 24
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 232
    Top = 72
  end
end
