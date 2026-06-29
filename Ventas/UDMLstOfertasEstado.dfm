object DMLstOfertasEstado: TDMLstOfertasEstado
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 299
  Top = 257
  Height = 197
  Width = 394
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait'
      'read')
    Left = 160
    Top = 8
  end
  object frOfertas: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de stocks por almacen'
    RebuildPrinter = False
    OnGetValue = frOfertasGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 40
    Top = 8
    ReportForm = {19000000}
  end
  object xLstOfertas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM GES_CABECERAS_S GES'
      
        'JOIN EMP_CLIENTES CLI ON (CLI.EMPRESA = GES.EMPRESA AND CLI.CLIE' +
        'NTE = GES.CLIENTE)'
      'JOIN SYS_TERCEROS TER ON (TER.TERCERO = CLI.TERCERO)'
      'WHERE'
      'GES.EMPRESA = :EMPRESA AND'
      'GES.CANAL = :CANAL AND'
      'GES.TIPO = '#39'OFC'#39' AND'
      'GES.SERIE >= :SERIE_DESDE AND'
      'GES.SERIE <= :SERIE_HASTA AND'
      'GES.FECHA >= :FECHA_DESDE AND'
      'GES.FECHA <= :FECHA_HASTA AND'
      
        '(GES.ESTADO = :ESTADO OR GES.ESTADO = :ESTADO1 OR GES.ESTADO = :' +
        'ESTADO2 OR GES.ESTADO = :ESTADO3) AND'
      '(EXISTS(SELECT EMPRESA'
      '        FROM EMP_AGRUPACIONES_CLI AGR'
      
        '        JOIN SYS_AGRUPACIONES SYS ON (SYS.AGRUPACION = AGR.AGRUP' +
        'ACION)'
      '        WHERE'
      '        AGR.EMPRESA = GES.EMPRESA AND'
      '        AGR.CLIENTE = GES.CLIENTE AND'
      '        AGR.AGRUPACION >= :AGR_DESDE AND'
      '        AGR.AGRUPACION <= :AGR_HASTA AND'
      '        SYS.TIPO = '#39'C'#39'))'
      'ORDER BY GES.SERIE, GES.RIG, GES.FECHA'
      ''
      ' ')
    UniDirectional = False
    AutoCalcFields = False
    Left = 40
    Top = 56
  end
  object DSxLstOfertas: TDataSource
    DataSet = xLstOfertas
    Left = 160
    Top = 56
  end
  object frDBLstOfertas: TfrDBDataSet
    DataSource = DSxLstOfertas
    Left = 280
    Top = 56
  end
end
