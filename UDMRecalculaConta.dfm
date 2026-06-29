object DMRecalculaConta: TDMRecalculaConta
  OldCreateOrder = False
  Left = 195
  Top = 107
  Height = 245
  Width = 323
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 248
    Top = 16
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 248
    Top = 64
  end
  object xAsientos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT RIC FROM CON_CUENTAS_ASIENTOS'
      
        'WHERE EMPRESA = ?EMPRESA AND EJERCICIO = ?EJERCICIO AND CANAL = ' +
        '?CANAL'
      'ORDER BY RIC')
    UniDirectional = True
    Left = 40
    Top = 16
    object xAsientosRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
  end
  object DSxAsientos: TDataSource
    DataSet = xAsientos
    Left = 144
    Top = 16
  end
end
