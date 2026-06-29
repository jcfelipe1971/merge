object DMLstEnvio: TDMLstEnvio
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 455
  Top = 223
  Height = 568
  Width = 534
  object frEnvio: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de Envio-Reparto'
    RebuildPrinter = False
    OnGetValue = frEnvioGetValue
    OnBeforePrint = frEnvioEnterRect
    OnEnterRect = frEnvioEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 32
    Top = 8
    ReportForm = {19000000}
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait'
      'read')
    Left = 344
    Top = 8
  end
  object frDBQMCabecera: TfrDBDataSet
    DataSource = DSQMCabecera
    Left = 208
    Top = 56
  end
  object DSQMCabecera: TDataSource
    DataSet = QMCabecera
    Left = 120
    Top = 56
  end
  object QMCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM GES_CABECERAS_S_ENVIO'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'ENVIO = :ENVIO')
    UniDirectional = False
    AfterOpen = QMCabeceraAfterOpen
    BeforeClose = QMCabeceraBeforeClose
    Left = 32
    Top = 56
  end
  object DSxRuta: TDataSource
    DataSet = xRuta
    Left = 432
    Top = 56
  end
  object xRuta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * '
      'FROM EMP_AGRUPACIONES_CLI AG'
      'JOIN VER_AGRUPACIONES_CLI VER '
      '  ON (VER.AGRUPACION=AG.AGRUPACION)'
      'WHERE VER.EMPRESA=?EMPRESA AND VER.AGRUPACION=?RUTA')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 344
    Top = 56
  end
  object DSxArticUnid: TDataSource
    DataSet = xArticUnid
    Left = 120
    Top = 152
  end
  object xArticUnid: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      
        'SELECT D.ARTICULO, D.TITULO, A.ALFA_1, A.ALFA_2, A.ALFA_3, A.ALF' +
        'A_4, A.ALFA_5, A.ALFA_6, A.ALFA_7, A.ALFA_8,'
      
        '       A.TIPO_CLAVE_ADR, A.CANTIDAD_LIMITADA, A.ADR_PACKAGE, A.P' +
        'ESO, A.VOLUMEN_UNIT, SUM(D.UNIDADES)'
      'FROM GES_DETALLES_S D'
      'JOIN GES_CABECERAS_S C ON D.ID_S = C.ID_S'
      'JOIN ART_ARTICULOS A ON D.ID_A = A.ID_A'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.ENVIO = :ENVIO'
      
        'GROUP BY D.ARTICULO, D.TITULO, A.ALFA_1, A.ALFA_2, A.ALFA_3, A.A' +
        'LFA_4, A.ALFA_5, A.ALFA_6, A.ALFA_7, A.ALFA_8,'
      
        '         A.TIPO_CLAVE_ADR, A.CANTIDAD_LIMITADA, A.ADR_PACKAGE, A' +
        '.PESO, A.VOLUMEN_UNIT ')
    UniDirectional = False
    DataSource = DSQMEnvio
    Left = 32
    Top = 152
  end
  object DSxNumFac: TDataSource
    DataSet = xNumFac
    Left = 432
    Top = 104
  end
  object xNumFac: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select serie, rig'
      'from ges_cabeceras_s'
      'where (tipo='#39'FAC'#39') and (empresa=?empresa) and (envio=?envio)')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 344
    Top = 104
  end
  object DSxNumAlb: TDataSource
    DataSet = xNumAlb
    Left = 432
    Top = 152
  end
  object xNumAlb: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select serie, rig, empresa, ejercicio, canal'
      'from ges_cabeceras_s'
      'where (tipo='#39'ALB'#39') and (empresa=?empresa) and (envio=?envio)')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 344
    Top = 152
  end
  object DSxTotalFac: TDataSource
    DataSet = xTotalFac
    Left = 432
    Top = 248
  end
  object xTotalFac: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select count(*) as total_fac'
      'from ges_cabeceras_s'
      'where (tipo='#39'FAC'#39') and (empresa=?empresa) and (envio=?envio)')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 344
    Top = 248
  end
  object DSxTotalAlb: TDataSource
    DataSet = xTotalAlb
    Left = 432
    Top = 200
  end
  object xTotalAlb: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select count(*) as total_alb'
      'from ges_cabeceras_s'
      'where (tipo='#39'ALB'#39') and (empresa=?empresa) and (envio=?envio)')
    UniDirectional = False
    DataSource = DSQMCabecera
    Left = 344
    Top = 200
  end
  object QMEnvio: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_DETALLE_ENVIO'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'ENVIO = :ENVIO'
      'ORDER BY TIPO, EJERCICIO, CANAL, SERIE, RIG')
    UniDirectional = False
    DataSource = DSQMCabecera
    AfterOpen = QMEnvioAfterOpen
    BeforeOpen = QMEnvioBeforeOpen
    Left = 32
    Top = 104
  end
  object DSQMEnvio: TDataSource
    DataSet = QMEnvio
    Left = 120
    Top = 104
  end
  object frDBQMEnvio: TfrDBDataSet
    DataSource = DSQMEnvio
    Left = 208
    Top = 104
  end
  object frDBxArticUnid: TfrDBDataSet
    DataSource = DSxArticUnid
    Left = 208
    Top = 152
  end
  object QNumPep: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM G_RELACIONES_ORIGENES'
      '               (?EMPRESA,'
      '                ?EJERCICIO,'
      '                ?CANAL,'
      '                ?SERIE,'
      '                ?TIPO,'
      '                ?RIG)')
    Transaction = TLocal
    AutoTrans = True
    Left = 344
    Top = 296
  end
  object xDirecciones: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM UT_JUSTIFICA_DOMICILIO_3(:TERCERO, :CLIENTE, :ID_S, 0)'
      'WHERE'
      'NUM = :DIRECCION OR NUM = 0')
    UniDirectional = False
    DataSource = DSQMEnvio
    Left = 32
    Top = 200
  end
  object DSxDirecciones: TDataSource
    DataSet = xDirecciones
    Left = 120
    Top = 200
  end
  object frDBDirecciones: TfrDBDataSet
    DataSource = DSxDirecciones
    Left = 208
    Top = 200
  end
  object frPeticion: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 32
    Top = 248
    ReportForm = {19000000}
  end
  object xLstPeticionCab: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM GES_CABECERAS_S_ENVIO'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'ENVIO = :ENVIO')
    UniDirectional = False
    Left = 32
    Top = 296
  end
  object xLstPeticionDet: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT CAB.RIG, CAB.CLIENTE, CAB.TERCERO, CAB.DIRECCION, TER.NOM' +
        'BRE_R_SOCIAL, TER.NOMBRE_COMERCIAL, DIR.DIR_COMPLETA,'
      
        '       DIR.DIR_NOMBRE_2, DIR.DIR_NOMBRE_3, DIR.DIR_TELEFONO01, D' +
        'IR.DIR_TELEFONO02, LOC.CODIGO_POSTAL,'
      
        '       LOC.TITULO AS TIT_LOCALIDAD, PRO.TITULO AS TIT_PROVINCIA,' +
        ' LOC.PAIS, CGA.PESO, CGA.BULTOS, CGA.PALETS,'
      
        '       CGA.PESO_BRUTO, SUM(DET.UNIDADES * DET.UNIDADES_EXT) AS S' +
        'UM_UDEXT, SUM(DET.UNIDADES) AS SUM_UD'
      'FROM GES_CABECERAS_S CAB'
      'JOIN GES_CABECERAS_S_ALB ALB ON (CAB.ID_S = ALB.ID_S)'
      'LEFT JOIN GES_CABECERAS_S_CGA CGA ON (ALB.ID_S = CGA.ID_S)'
      'JOIN GES_DETALLES_S DET ON (CAB.ID_S = DET.ID_S)'
      'JOIN SYS_TERCEROS TER ON (CAB.TERCERO = TER.TERCERO)'
      
        'JOIN SYS_TERCEROS_DIRECCIONES DIR ON (CAB.TERCERO = DIR.TERCERO ' +
        'AND CAB.DIRECCION = DIR.DIRECCION)'
      'JOIN SYS_LOCALIDADES LOC ON (DIR.ID_LOCAL = LOC.ID_LOCAL)'
      
        'JOIN SYS_PROVINCIAS PRO ON (LOC.PAIS = PRO.PAIS AND LOC.PROVINCI' +
        'A = PRO.PROVINCIA)'
      'WHERE'
      'CAB.EMPRESA = :EMPRESA AND'
      'CAB.ENVIO = :ENVIO'
      
        'GROUP BY CAB.RIG, CAB.CLIENTE, CAB.TERCERO, CAB.DIRECCION, TER.N' +
        'OMBRE_R_SOCIAL, TER.NOMBRE_COMERCIAL, DIR.DIR_COMPLETA, DIR.DIR_' +
        'NOMBRE_2, DIR.DIR_NOMBRE_3, DIR.DIR_TELEFONO01, DIR.DIR_TELEFONO' +
        '02, LOC.CODIGO_POSTAL, LOC.TITULO, PRO.TITULO, LOC.PAIS, CGA.PES' +
        'O, CGA.BULTOS, CGA.PALETS, CGA.PESO_BRUTO')
    UniDirectional = False
    Left = 32
    Top = 344
  end
  object DSxLstPeticionDet: TDataSource
    DataSet = xLstPeticionDet
    Left = 120
    Top = 344
  end
  object DSxLstPeticionCab: TDataSource
    DataSet = xLstPeticionCab
    Left = 120
    Top = 296
  end
  object frDBDSPeticionDet: TfrDBDataSet
    DataSource = DSxLstPeticionDet
    Left = 208
    Top = 344
  end
  object frDBDSPeticionCab: TfrDBDataSet
    DataSource = DSxLstPeticionCab
    Left = 208
    Top = 296
  end
  object frContenido: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 32
    Top = 392
    ReportForm = {19000000}
  end
  object xLstContenido: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT CAB.EMPRESA, CAB.RIG, CAB.CLIENTE, CAB.TERCERO, CAB.DIREC' +
        'CION, TER.NOMBRE_R_SOCIAL, TER.NOMBRE_COMERCIAL,'
      
        '       DIR.DIR_COMPLETA, DIR.DIR_NOMBRE_2, DIR.DIR_NOMBRE_3, DIR' +
        '.DIR_TELEFONO01, LOC.CODIGO_POSTAL,'
      
        '       LOC.TITULO AS TIT_LOCALIDAD, PRO.TITULO AS TIT_PROVINCIA,' +
        ' LOC.PAIS, CGA.PESO, CGA.BULTOS, DET.LINEA,'
      
        '       DET.ARTICULO, DET.TITULO, DET.ALMACEN, DET.CANAL, DET.UNI' +
        'DADES AS UD, DET.UNIDADES_EXT AS UE_UD,'
      '       DET.UNIDADES * DET.UNIDADES_EXT AS UE'
      'FROM GES_CABECERAS_S CAB'
      'JOIN GES_CABECERAS_S_ALB ALB ON (CAB.ID_S = ALB.ID_S)'
      'LEFT JOIN GES_CABECERAS_S_CGA CGA ON (CGA.ID_S = ALB.ID_S)'
      'JOIN GES_DETALLES_S DET ON (CAB.ID_S = DET.ID_S)'
      'JOIN ART_ARTICULOS ART ON (ART.ID_A = DET.ID_A)'
      'JOIN SYS_TERCEROS TER ON (CAB.TERCERO = TER.TERCERO)'
      
        'JOIN SYS_TERCEROS_DIRECCIONES DIR ON (CAB.TERCERO = DIR.TERCERO ' +
        'AND CAB.DIRECCION = DIR.DIRECCION)'
      'JOIN SYS_LOCALIDADES LOC ON (DIR.ID_LOCAL = LOC.ID_LOCAL)'
      
        'JOIN SYS_PROVINCIAS PRO ON (LOC.PAIS = PRO.PAIS AND LOC.PROVINCI' +
        'A = PRO.PROVINCIA)'
      'WHERE'
      'CAB.EMPRESA = :EMPRESA AND'
      'CAB.ENVIO = :ENVIO'
      'ORDER BY CAB.RIG, DET.LINEA')
    UniDirectional = False
    Left = 32
    Top = 440
    object xLstContenidoEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xLstContenidoRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xLstContenidoCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xLstContenidoTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xLstContenidoDIRECCION: TIntegerField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
    end
    object xLstContenidoNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xLstContenidoNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nomb. Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object xLstContenidoDIR_COMPLETA: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIR_COMPLETA'
      Size = 69
    end
    object xLstContenidoDIR_NOMBRE_2: TFIBStringField
      DisplayLabel = 'Direccion 2'
      FieldName = 'DIR_NOMBRE_2'
      Size = 40
    end
    object xLstContenidoDIR_NOMBRE_3: TFIBStringField
      DisplayLabel = 'Direccion 3'
      FieldName = 'DIR_NOMBRE_3'
      Size = 40
    end
    object xLstContenidoDIR_TELEFONO01: TFIBStringField
      DisplayLabel = 'Tel.'
      FieldName = 'DIR_TELEFONO01'
    end
    object xLstContenidoCODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'CODIGO_POSTAL'
      Size = 10
    end
    object xLstContenidoTIT_LOCALIDAD: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TIT_LOCALIDAD'
      Size = 40
    end
    object xLstContenidoTIT_PROVINCIA: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TIT_PROVINCIA'
      Size = 40
    end
    object xLstContenidoPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object xLstContenidoPESO: TFloatField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
    end
    object xLstContenidoBULTOS: TFloatField
      DisplayLabel = 'Bultos'
      FieldName = 'BULTOS'
    end
    object xLstContenidoLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xLstContenidoARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xLstContenidoTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xLstContenidoALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xLstContenidoCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xLstContenidoUD: TFloatField
      DisplayLabel = 'Ud.'
      FieldName = 'UD'
    end
    object xLstContenidoUE_UD: TFloatField
      DisplayLabel = 'Uds. Ext.'
      FieldName = 'UE_UD'
    end
    object xLstContenidoUE: TFloatField
      DisplayLabel = 'Uds. Ext.'
      FieldName = 'UE'
    end
    object xLstContenidostock_ue: TFloatField
      DisplayLabel = 'Stock U. Ext.'
      FieldKind = fkCalculated
      FieldName = 'stock_ue'
      OnGetText = xLstContenidostock_ueGetText
      Calculated = True
    end
    object xLstContenidostock_ud: TFloatField
      DisplayLabel = 'Stock Uds.'
      FieldKind = fkCalculated
      FieldName = 'stock_ud'
      OnGetText = xLstContenidostock_udGetText
      Calculated = True
    end
  end
  object DSxLstContenido: TDataSource
    DataSet = xLstContenido
    Left = 120
    Top = 440
  end
  object frDBDSContenido: TfrDBDataSet
    DataSource = DSxLstContenido
    Left = 208
    Top = 440
  end
  object xLstContenidoCab: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM GES_CABECERAS_S_ENVIO'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'ENVIO = :ENVIO')
    UniDirectional = False
    Left = 32
    Top = 488
  end
  object DSxTransportista: TDataSource
    DataSet = xTransportista
    Left = 432
    Top = 344
  end
  object xTransportista: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * '
      'FROM VER_ACREEDORES_CUENTAS'
      'WHERE '
      'EMPRESA = :EMPRESA AND '
      'ACREEDOR = :TRANSPORTISTA')
    UniDirectional = False
    DataSource = DSQMEnvio
    Left = 344
    Top = 344
  end
  object DSxCartaPorte: TDataSource
    DataSet = xCartaPorte
    Left = 432
    Top = 392
  end
  object xCartaPorte: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * '
      'FROM GES_CABECERAS_S_CGA'
      'WHERE '
      'ID_S = :ID_S')
    UniDirectional = False
    DataSource = DSQMEnvio
    Left = 344
    Top = 392
  end
end
