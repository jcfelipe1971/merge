object DMCierreApertura: TDMCierreApertura
  OldCreateOrder = False
  OnCreate = DMCierreAperturaCreate
  Left = 466
  Top = 281
  Height = 178
  Width = 413
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 272
    Top = 8
  end
  object xEjercicioActivo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT EJERCICIO, ACTIVO '
      'FROM EMP_EJERCICIOS '
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO')
    UniDirectional = False
    Left = 160
    Top = 8
  end
  object xCompNivel: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT DIGITOS, TOTAL_DIGITOS '
      'FROM CON_CUENTAS_NIVELES '
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'EJERCICIO = ?EJERCICIO AND'
      'CANAL = ?CANAL AND'
      'NIVEL = ?NIVEL')
    UniDirectional = False
    Left = 48
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 272
    Top = 56
  end
end
