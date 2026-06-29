object CrmDMMarcajeVentas: TCrmDMMarcajeVentas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 270
  Top = 298
  Height = 359
  Width = 406
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 28
    Top = 22
  end
  object QMVentas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CRM_VENTAS'
      'WHERE'
      '  ID_ARTICULO=?old_ID_ARTICULO AND '
      '  ID_CONTACTO=?old_ID_CONTACTO ')
    InsertSQL.Strings = (
      'INSERT INTO CRM_VENTAS'
      '  (ID_CONTACTO,ID_ARTICULO,FECHA)'
      'VALUES'
      '  (?ID_CONTACTO,?ID_ARTICULO,?FECHA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CRM_VENTAS'
      'WHERE'
      '  ID_ARTICULO=?ID_ARTICULO AND '
      '  ID_CONTACTO=?ID_CONTACTO ')
    SelectSQL.Strings = (
      'SELECT * FROM CRM_VENTAS')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CRM_VENTAS'
      'SET'
      '  FECHA=?FECHA '
      'WHERE'
      '  ID_ARTICULO=?ID_ARTICULO AND '
      '  ID_CONTACTO=?ID_CONTACTO ')
    ClavesPrimarias.Strings = (
      'ID_ARTICULO '
      'ID_CONTACTO ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CRM_VENTAS'
    UpdateTransaction = TLocal
    Left = 40
    Top = 104
    object QMVentasID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMVentasID_CONTACTO: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_CONTACTO'
    end
    object QMVentasID_ARTICULO: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_ARTICULO'
    end
    object QMVentasFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
  end
  object DSVentas: TDataSource
    DataSet = QMVentas
    Left = 132
    Top = 108
  end
  object QInsertVentas: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'insert into crm_ventas (id_contacto,id_articulo,fecha)'
      'values (?id_contacto,?id_articulo,?fecha)')
    Transaction = TLocal
    AutoTrans = True
    Left = 140
    Top = 20
  end
  object xArticulo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select first(1) id_articulo from crm_articulo'
      'where codigo=?articulo')
    UniDirectional = False
    Left = 44
    Top = 188
    object xArticuloID_ARTICULO: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_ARTICULO'
    end
  end
  object DSArticulo: TDataSource
    DataSet = xArticulo
    Left = 132
    Top = 184
  end
end
