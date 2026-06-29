object OpeDMEstadoMarcajePedido: TOpeDMEstadoMarcajePedido
  OldCreateOrder = False
  OnCreate = DMOpeEstadoMarcajePedidoCreate
  Left = 423
  Top = 288
  Height = 150
  Width = 455
  object QMEstadoMarcajePedido: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM OPE_ESTADO_MARCAJE_PEDIDO'
      'WHERE'
      '  ID_ESTADO_MARCAJE_PEDIDO=?old_ID_ESTADO_MARCAJE_PEDIDO ')
    InsertSQL.Strings = (
      'INSERT INTO OPE_ESTADO_MARCAJE_PEDIDO'
      
        '  (EMPRESA,ID_ESTADO_MARCAJE_PEDIDO,TITULO,ORDEN_EJECUCION,STOCK_AFECTA,ASOCIAR_FE' +
        'CHA_MARCAJE)'
      'VALUES'
      
        '  (?EMPRESA,?ID_ESTADO_MARCAJE_PEDIDO,?TITULO,?ORDEN_EJECUCION,?STOCK_AFECTA,?ASOC' +
        'IAR_FECHA_MARCAJE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM OPE_ESTADO_MARCAJE_PEDIDO'
      'WHERE'
      '  ID_ESTADO_MARCAJE_PEDIDO=?ID_ESTADO_MARCAJE_PEDIDO ')
    SelectSQL.Strings = (
      'SELECT * FROM OPE_ESTADO_MARCAJE_PEDIDO'
      'WHERE'
      'EMPRESA=?EMPRESA'
      'ORDER BY ID_ESTADO_MARCAJE_PEDIDO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OPE_ESTADO_MARCAJE_PEDIDO'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,TITULO=?TITULO '
      '  ,ORDEN_EJECUCION=?ORDEN_EJECUCION '
      '  ,STOCK_AFECTA=?STOCK_AFECTA '
      '  ,ASOCIAR_FECHA_MARCAJE=?ASOCIAR_FECHA_MARCAJE '
      'WHERE'
      '  ID_ESTADO_MARCAJE_PEDIDO=?ID_ESTADO_MARCAJE_PEDIDO ')
    BeforePost = QMEstadoMarcajePedidoBeforePost
    OnNewRecord = QMEstadoMarcajePedidoNewRecord
    ClavesPrimarias.Strings = (
      'ID_ESTADO_MARCAJE_PEDIDO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'OPE_ESTADO_MARCAJE_PEDIDO'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 64
    Top = 20
    object QMEstadoMarcajePedidoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMEstadoMarcajePedidoID_ESTADO_MARCAJE_PEDIDO: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_ESTADO_MARCAJE_PEDIDO'
    end
    object QMEstadoMarcajePedidoTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 35
    end
    object QMEstadoMarcajePedidoORDEN_EJECUCION: TIntegerField
      DisplayLabel = 'Orden Ejecuci'#243'n'
      FieldName = 'ORDEN_EJECUCION'
    end
    object QMEstadoMarcajePedidoSTOCK_AFECTA: TIntegerField
      DisplayLabel = 'Afecta Stock'
      FieldName = 'STOCK_AFECTA'
    end
    object QMEstadoMarcajePedidoASOCIAR_FECHA_MARCAJE: TIntegerField
      DisplayLabel = 'Fec. Marc. Asociada'
      FieldName = 'ASOCIAR_FECHA_MARCAJE'
    end
  end
  object DSEstadoMarcajePedido: TDataSource
    DataSet = QMEstadoMarcajePedido
    Left = 200
    Top = 20
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 313
    Top = 20
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 377
    Top = 20
  end
end
