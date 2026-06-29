object DMLstUbicacionesC: TDMLstUbicacionesC
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 433
  Top = 254
  Height = 349
  Width = 387
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 184
    Top = 16
  end
  object frUbicaciones: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frUbicacionesGetValue
    OnBeforePrint = frUbicacionesEnterRect
    OnEnterRect = frUbicacionesEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 35
    Top = 16
    ReportForm = {19000000}
  end
  object xListado: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select cab.empresa,cab.ejercicio,cab.canal,cab.serie,cab.tipo,ca' +
        'b.rig,'
      
        'cab.tercero,cab.proveedor,det.linea,det.articulo,det.titulo,det.' +
        'unidades as unidadeslinea,ub.linea_ubicacion,ub.ubicacion,ub.uni' +
        'dades,'
      
        'ub.peso,ub.volumen,ub.diametro,ub.general,alm.titulo,ter.nombre_' +
        'r_social'
      'from ges_cabeceras_e_alb cab'
      'join sys_terceros ter'
      'on (cab.tercero = ter.tercero)'
      'join ges_detalles_e det'
      'on (cab.id_e = det.id_e)'
      'join ges_detalles_e_ubicaciones ub'
      'on (det.id_detalles_e = ub.id_detalles_e)'
      'join art_almacenes_ubicaciones alm'
      'on ub.id_ubicacion = alm.id_ubicacion'
      'where det.id_e = ?id_e'
      
        'order by cab.empresa,cab.ejercicio,cab.canal,cab.serie,cab.tipo,' +
        'cab.rig,det.linea,ub.linea_ubicacion')
    UniDirectional = False
    Left = 40
    Top = 96
    object xListadoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xListadoEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xListadoCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xListadoSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xListadoTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xListadoRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xListadoTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xListadoPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xListadoLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xListadoARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xListadoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xListadoUNIDADESLINEA: TFloatField
      DisplayLabel = 'Uds. Linea'
      FieldName = 'UNIDADESLINEA'
    end
    object xListadoLINEA_UBICACION: TIntegerField
      DisplayLabel = 'Linea Ubic.'
      FieldName = 'LINEA_UBICACION'
    end
    object xListadoUBICACION: TFIBStringField
      DisplayLabel = 'Ubicacion'
      FieldName = 'UBICACION'
    end
    object xListadoUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object xListadoPESO: TFloatField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
    end
    object xListadoVOLUMEN: TFloatField
      DisplayLabel = 'Volumen'
      FieldName = 'VOLUMEN'
    end
    object xListadoDIAMETRO: TFloatField
      DisplayLabel = 'Diametro'
      FieldName = 'DIAMETRO'
    end
    object xListadoGENERAL: TIntegerField
      DisplayLabel = 'General'
      FieldName = 'GENERAL'
    end
    object xListadoTITULO1: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO1'
      Size = 60
    end
    object xListadoNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
  end
  object frDBxListado: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxListado
    Left = 188
    Top = 100
  end
  object DSxListado: TDataSource
    DataSet = xListado
    Left = 114
    Top = 100
  end
  object frxUbicaciones: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 38691.9705409491
    ReportOptions.LastChange = 38691.9705409491
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnBeforePrint = frxUbicacionesBeforePrint
    OnGetValue = frxUbicacionesGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 111
    Top = 16
    Datasets = <>
    Variables = <>
    Style = <>
  end
end
