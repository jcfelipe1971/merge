object DMReciboNuevo: TDMReciboNuevo
  OldCreateOrder = False
  OnCreate = DMReciboNuevoCreate
  OnDestroy = DataModuleDestroy
  Left = 807
  Top = 276
  Height = 346
  Width = 315
  object xClientes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO, FORMA_PAGO, MONEDA FROM VER_CLIENTES'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND'
      'CLIENTE=?CLIENTE'
      '')
    UniDirectional = False
    Left = 46
    Top = 18
  end
  object xProveedores: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO, FORMA_PAGO, MONEDA FROM VER_PROVEEDORES'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND'
      'PROVEEDOR=?PROVEEDOR'
      '')
    UniDirectional = False
    Left = 142
    Top = 18
  end
  object xAcreedores: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO, FORMA_PAGO, MONEDA FROM VER_ACREEDORES'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND'
      'ACREEDOR=?ACREEDOR'
      '')
    UniDirectional = False
    Left = 46
    Top = 72
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 238
    Top = 18
  end
end
