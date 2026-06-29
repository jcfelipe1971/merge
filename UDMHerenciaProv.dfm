object DMHerenciaProv: TDMHerenciaProv
  OldCreateOrder = False
  OnCreate = DMHerenciaCreate
  Left = 501
  Top = 323
  Height = 195
  Width = 287
  object DSxOrigenes: TDataSource
    DataSet = xOrigenes
    Left = 104
    Top = 16
  end
  object DSxDestinos: TDataSource
    DataSet = xDestinos
    Left = 104
    Top = 84
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 192
    Top = 17
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
      
        'FROM G_RELACIONES_ORIGENES_E(:EMPRESA, :EJERCICIO, :CANAL, :SERI' +
        'E, :TIPO, :RIG) O')
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
      
        'FROM G_RELACIONES_DESTINOS_E(:EMPRESA, :EJERCICIO, :CANAL, :SERI' +
        'E, :TIPO, :RIG) O')
    UniDirectional = False
    Opciones = []
    AutoSQLdeVistas = False
    Left = 32
    Top = 80
  end
end
