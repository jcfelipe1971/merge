object DMPonderaEmpresa: TDMPonderaEmpresa
  OldCreateOrder = False
  Left = 318
  Top = 399
  Height = 190
  Width = 215
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 88
    Top = 8
  end
  object QPondera: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TPondera
    AutoTrans = True
    Left = 24
    Top = 56
  end
  object TPondera: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 88
    Top = 56
  end
  object QMain: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 300
    SelectSQL.Strings = (
      
        'select distinct empresa,canal,almacen,articulo,id_a from art_mov' +
        '_stocks '
      'where '
      ' empresa >= ?DESDE_EMPRESA and'
      ' empresa <= ?HASTA_EMPRESA and'
      ' canal >= ?DESDE_CANAL and'
      ' canal <= ?HASTA_CANAL and'
      ' articulo >= ?DESDE_ARTICULO and'
      ' articulo <= ?HASTA_ARTICULO and'
      ' almacen >= ?DESDE_ALMACEN and'
      ' almacen <= ?HASTA_ALMACEN')
    UniDirectional = True
    Left = 24
    Top = 8
  end
  object QGeneral: TFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    Left = 24
    Top = 104
  end
end
