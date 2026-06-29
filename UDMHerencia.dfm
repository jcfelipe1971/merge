object DMHerencia: TDMHerencia
  OldCreateOrder = False
  OnCreate = DMHerenciaCreate
  Left = 913
  Top = 465
  Height = 184
  Width = 257
  object DSxOrigenes: TDataSource
    DataSet = xOrigenes
    Left = 104
    Top = 16
  end
  object DSxDestinos: TDataSource
    DataSet = xDestinos
    Left = 104
    Top = 72
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 176
    Top = 16
  end
  object xOrigenes: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT O.*,'
      '       CASE'
      '         WHEN O.RTIPO IN ('#39'OFC'#39', '#39'PEC'#39', '#39'ALB'#39', '#39'FAC'#39') THEN'
      '             (SELECT FECHA'
      '              FROM GES_CABECERAS_S'
      '              WHERE'
      '              EMPRESA = O.REMPRESA AND'
      '              EJERCICIO = O.REJERCICIO AND'
      '              CANAL = O.RCANAL AND'
      '              SERIE = O.RSERIE AND'
      '              TIPO = O.RTIPO AND'
      '              RIG = O.RRIG)'
      '         ELSE (SELECT FECHA'
      '               FROM GES_CABECERAS_E'
      '               WHERE'
      '               EMPRESA = O.REMPRESA AND'
      '               EJERCICIO = O.REJERCICIO AND'
      '               CANAL = O.RCANAL AND'
      '               SERIE = O.RSERIE AND'
      '               TIPO = O.RTIPO AND'
      '               RIG = O.RRIG)'
      '       END FECHA'
      
        'FROM G_RELACIONES_ORIGENES(:EMPRESA, :EJERCICIO, :CANAL, :SERIE,' +
        ' :TIPO, :RIG) O')
    UniDirectional = False
    Opciones = []
    AutoSQLdeVistas = False
    Left = 32
    Top = 16
  end
  object xDestinos: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT O.*,'
      '       CASE'
      '         WHEN O.RTIPO IN ('#39'OFC'#39', '#39'PEC'#39', '#39'ALB'#39', '#39'FAC'#39') THEN'
      '             (SELECT FECHA'
      '              FROM GES_CABECERAS_S'
      '              WHERE'
      '              EMPRESA = O.REMPRESA AND'
      '              EJERCICIO = O.REJERCICIO AND'
      '              CANAL = O.RCANAL AND'
      '              SERIE = O.RSERIE AND'
      '              TIPO = O.RTIPO AND'
      '              RIG = O.RRIG)'
      '         ELSE (SELECT FECHA'
      '               FROM GES_CABECERAS_E'
      '               WHERE'
      '               EMPRESA = O.REMPRESA AND'
      '               EJERCICIO = O.REJERCICIO AND'
      '               CANAL = O.RCANAL AND'
      '               SERIE = O.RSERIE AND'
      '               TIPO = O.RTIPO AND'
      '               RIG = O.RRIG)'
      '       END FECHA'
      
        'FROM G_RELACIONES_DESTINOS(:EMPRESA, :EJERCICIO, :CANAL, :SERIE,' +
        ' :TIPO, :RIG) O')
    UniDirectional = False
    Opciones = []
    AutoSQLdeVistas = False
    Left = 32
    Top = 72
  end
end
