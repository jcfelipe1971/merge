object DMImportarDocumentos: TDMImportarDocumentos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 192
  Top = 107
  Height = 219
  Width = 264
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 208
    Top = 21
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 208
    Top = 69
  end
  object QPrecios: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'EXECUTE PROCEDURE G_PRECIO_VENTA_MONEDA'
      '(?EMPRESA, ?CLIENTE, ?ARTICULO, ?TARIFA, ?FECHA, ?EJERCICIO,'
      '?CANAL, ?UNIDADES_EXT, ?PRECIOP, ?UNIDADES, ?MONEDA, ?ID_A,'
      '?UNIDADES_OLD, ?IDIOMA, ?TIPO_LINEA, ?ID_P_OLD, ?FACTOR)')
    Transaction = TLocal
    AutoTrans = True
    Left = 40
    Top = 16
  end
end
