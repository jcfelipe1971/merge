object DMTPVSincronizacion: TDMTPVSincronizacion
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 292
  Top = 197
  Height = 401
  Width = 356
  object DBDestino: THYDatabase
    DBParams.Strings = (
      'user_name=SYSDBA'
      'password=masterkey'
      'lc_ctype=WIN1252')
    DefaultTransaction = TDestino
    Timeout = 0
    Left = 32
    Top = 168
  end
  object TOrigen: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 192
    Top = 32
  end
  object TDestino: THYTransaction
    Active = False
    DefaultDatabase = DBDestino
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 112
    Top = 168
  end
  object QDestino: THYFIBQuery
    Database = DBDestino
    ParamCheck = True
    Transaction = TDestino
    AutoTrans = True
    Left = 200
    Top = 168
  end
  object QOrigen: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TOrigen
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT CAB.EMPRESA,CAB.EJERCICIO,CAB.CANAL,CAB.SERIE,NIF.TERCERO' +
        ', NIF.NIF AS NIF,NIF.nombre AS NOMBRE FROM GES_TICKET_CABECERA C' +
        'AB'
      
        ' JOIN GES_CABECERAS_S_FAC_NIF NIF ON( CAB.EMPRESA = NIF.EMPRESA ' +
        'AND'
      'CAB.EJERCICIO = NIF.EJERCICIO AND CAB.CANAL = NIF.CANAL AND'
      
        'CAB.SERIE = NIF.SERIE AND CAB.TIPO = NIF.TIPO AND CAB.RIT = NIF.' +
        'RIG )'
      'WHERE'
      'CAB.EMPRESA=:EMPRESA AND'
      'CAB.EJERCICIO=:EJERCICIO AND'
      'CAB.CANAL=:CANAL AND'
      'CAB.SERIE=:SERIE AND'
      'CAB.TIPO=:TIPO AND'
      'CAB.SESION=:SESION')
    UniDirectional = False
    Left = 32
    Top = 32
  end
  object DSQOrigen: TDataSource
    DataSet = QOrigen
    Left = 112
    Top = 32
  end
end
