object DMLstComisionesKri: TDMLstComisionesKri
  OldCreateOrder = False
  OnCreate = DMLstComisionesKriCreate
  OnDestroy = DMLstComisionesKriDestroy
  Left = 673
  Top = 114
  Height = 445
  Width = 354
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 272
    Top = 8
  end
  object xLiqRepresentantes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM LIQUIDACION_REPRESENTANTES'
      'WHERE'
      '  FECHA>=?FECHA_DESDE AND '
      '  FECHA<=?FECHA_HASTA AND '
      '  AGENTE=?AGENTE AND '
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '/*  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      ' */ TIPO=?TIPO '
      'ORDER BY FECHA, RIG, LINEA, SUB_LINEA')
    UniDirectional = False
    DataSource = DSxAgente
    Left = 48
    Top = 104
  end
  object frLiqRepresentantes: TfrDBDataSet
    DataSource = DSLiqRepresentantes
    Left = 272
    Top = 104
  end
  object DSLiqRepresentantes: TDataSource
    DataSet = xLiqRepresentantes
    Left = 160
    Top = 104
  end
  object frLstComisiones: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frLstComisionesGetValue
    OnBeforePrint = frLstComisionesEnterRect
    OnEnterRect = frLstComisionesEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 160
    Top = 8
    ReportForm = {19000000}
  end
  object xAgente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT'
      '  AGENTE,TITULO, TERCERO'
      'FROM VER_AGENTES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  AGENTE>=?AGENTE_DESDE AND'
      '  AGENTE<=?AGENTE_HASTA')
    UniDirectional = False
    AfterScroll = xAgenteAfterScroll
    Left = 48
    Top = 56
  end
  object frxAgente: TfrDBDataSet
    DataSource = DSxAgente
    Left = 272
    Top = 56
  end
  object DSxAgente: TDataSource
    DataSet = xAgente
    Left = 160
    Top = 56
  end
end
