object DMLstControlUbicaciones: TDMLstControlUbicaciones
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 329
  Top = 227
  Height = 285
  Width = 398
  object DSQMUbicacion: TDataSource
    DataSet = QMUbicacion
    Left = 160
    Top = 96
  end
  object QMUbicacion: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT COUNT(*) AS UNIDADES,EMPRESA,ARTICULO,LOTE,ALMACEN_ENT AS' +
        ' ALMACEN,ID_UBICACION,A.TITULO_LARGO AS TITULO  FROM NRO_SERIE_K' +
        'RI N'
      
        'JOIN ART_ARTICULOS A ON N.EMPRESA=A.EMPRESA AND N.ARTICULO=A.ART' +
        'ICULO WHERE EMPRESA = ?EMPRESA AND'
      
        'ARTICULO >= ?DESDE_ARTICULO AND ARTICULO <= ?ARTICULO_HASTA AND ' +
        'ALMACEN_ENT  >= ?DESDE_ALMACEN  AND'
      
        'ALMACEN_ENT  <= ?HASTA_ALMACEN AND RIG_MOS = 0 AND RIG_SAL = 0 A' +
        'ND RIG_MOV = 0 AND RIG_ENT <> 0'
      
        'GROUP BY EMPRESA,ARTICULO,LOTE,ALMACEN_ENT,ID_UBICACION,A.TITULO' +
        '_LARGO '
      'UNION'
      
        'SELECT COUNT(*)AS UNIDADES,EMPRESA,ARTICULO,LOTE,ALMACEN_MOE AS ' +
        'ALMACEN,ID_UBICACION,A.TITULO_LARGO AS TITULO  FROM NRO_SERIE_KR' +
        'I N'
      
        'JOIN ART_ARTICULOS A ON N.EMPRESA=A.EMPRESA AND N.ARTICULO=A.ART' +
        'ICULO WHERE EMPRESA = ?EMPRESA AND'
      
        'ARTICULO >= ?DESDE_ARTICULO AND ARTICULO <= ?HASTA_ARTICULO AND ' +
        'ALMACEN_MOE  >= ?DESDE_ALMACEN  AND'
      
        'ALMACEN_MOE <= ?HASTA_ALMACEN AND RIG_MOS = 0 AND RIG_SAL = 0 AN' +
        'D RIG_MOV = 0 AND RIG_MOE <> 0'
      
        'GROUP BY EMPRESA,ARTICULO,LOTE,ALMACEN_MOE,ID_UBICACION,A.TITULO' +
        '_LARGO')
    UniDirectional = False
    Left = 32
    Top = 96
    object QMUbicacionUNIDADES: TIntegerField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object QMUbicacionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMUbicacionARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMUbicacionLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      Size = 15
    end
    object QMUbicacionALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMUbicacionID_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubicacion'
      FieldName = 'ID_UBICACION'
    end
    object QMUbicacionTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object frListadoUbicaciones: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de contenido de ubicaciones'
    RebuildPrinter = False
    OnGetValue = frListadoUbicacionesGetValue
    OnBeforePrint = frListadoUbicacionesBeforePrint
    OnEnterRect = frListadoUbicacionesBeforePrint
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 32
    Top = 24
    ReportForm = {19000000}
  end
  object frxListadoUbicaciones: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 40231.3834646181
    ReportOptions.LastChange = 40231.3834646181
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnBeforePrint = frxListadoUbicacionesBeforePrint
    OnGetValue = frxListadoUbicacionesGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 160
    Top = 24
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 296
    Top = 24
  end
  object frDSQMUbicacion: TfrDBDataSet
    DataSource = DSQMUbicacion
    Left = 288
    Top = 96
  end
end
