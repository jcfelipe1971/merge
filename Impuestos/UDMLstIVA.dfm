object DMLstIva: TDMLstIva
  OldCreateOrder = False
  OnCreate = DMLSTIvaCreate
  OnDestroy = DMLSTIvaDestroy
  Left = 791
  Top = 184
  Height = 510
  Width = 589
  object frIVARepercutido: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    OnGetValue = frIVARepercutidoGetValue
    OnBeforePrint = frIVARepercutidoEnterRect
    OnEnterRect = frIVARepercutidoEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 496
    Top = 104
    ReportForm = {19000000}
  end
  object DSSPListaIVA: TDataSource
    DataSet = SPListadoIVA
    Left = 160
    Top = 8
  end
  object frDSSPListaIVA: TfrDBDataSet
    DataSource = DSSPListaIVA
    OpenDataSource = False
    Left = 288
    Top = 8
  end
  object QMTotales: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT SUM(B_IMPONIBLE), SUM(I_IVA), SUM(I_REC), SUM(RETENCION),' +
        ' P_IVA, P_REC, MODO, TIPO_IVA, INVERSION_SUJETO_PASIVO, ADQUISIC' +
        'ION'
      
        'FROM CREA_LISTADO_IVA(:EMPRESA, :EJERCICIO, :CANAL, :SIGNO, :FEC' +
        'HA_INI, :FECHA_FIN, :RIG_INI, :RIG_FIN, :FILTRO)'
      
        'GROUP BY TIPO_IVA, MODO, P_IVA, P_REC, INVERSION_SUJETO_PASIVO, ' +
        'ADQUISICION')
    UniDirectional = False
    AutoCalcFields = False
    Left = 48
    Top = 104
  end
  object DSTotales: TDataSource
    DataSet = QMTotales
    Left = 160
    Top = 104
  end
  object frDSQTotales: TfrDBDataSet
    DataSource = DSTotales
    OpenDataSource = False
    Left = 288
    Top = 104
  end
  object xTipoIva: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      '')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TIPO_IVA'
      'WHERE '
      'TIPO=?TIPO_IVA AND '
      'PAIS=?PAIS')
    UniDirectional = False
    AutoCalcFields = False
    DataSource = DSTotales
    Left = 400
    Top = 152
  end
  object xModoIva: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_MODO_IVA'
      'WHERE'
      '  MODO=?MODO ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_MODO_IVA'
      'WHERE '
      'MODO=?MODO')
    UniDirectional = False
    AutoCalcFields = False
    DataSource = DSTotales
    Left = 400
    Top = 200
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 496
    Top = 8
  end
  object xCompruebaIvaRep: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT * FROM c_comprueba_iva_repercutido(?empresa,?canal,?fecha' +
        '_i,?fecha_f)')
    UniDirectional = False
    AutoCalcFields = False
    Left = 48
    Top = 344
  end
  object DSxCompruebaIvaRep: TDataSource
    DataSet = xCompruebaIvaRep
    Left = 160
    Top = 344
  end
  object frDBxCompruebaIvaRep: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSxCompruebaIvaRep
    Left = 288
    Top = 344
  end
  object frCompruebaIva: TfrHYReport
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    StoreInDFM = True
    RebuildPrinter = False
    OnGetValue = frCompruebaIvaGetValue
    OnBeforePrint = frCompruebaIvaBeforePrint
    OnEnterRect = frCompruebaIvaBeforePrint
    Left = 496
    Top = 200
    ReportForm = {
      1900000007090000190000000001000100FFFFFFFFFF09000000340800009A0B
      00000000000000000000000000000000000000FFFF00000000FFFF0100000000
      000000000500506167653100030400466F726D000F000080DC00000078000000
      7C0100002C010000040000000200C9000000050042616E643100020100000000
      52010000F6020000110000003000030001000000000000000000FFFFFF1F0000
      0000000000000000000000FFFF00000000000200000001000000000000000100
      0000C80000001400000001000000000000020042010000050042616E64320002
      0100000000B5000000F6020000100000003000050001000000000000000000FF
      FFFF1F0000000014006672444278436F6D707275656261497661526570000000
      00000000FFFF000000000002000000010000000000000001000000C800000014
      000000010000000000000200A7010000050042616E6433000201000000003B00
      0000F60200004A0000003000020001000000000000000000FFFFFF1F00000000
      000000000000000000FFFF000000000002000000010000000000000001000000
      C8000000140000000100000000000000002F02000006004D656D6F3131000200
      14000000B6000000C3020000100000000200000001000000000000000000FFFF
      FF1F2C020000000000000000000000FFFF000000000002000000010000000005
      00417269616C000A000000000000000000000000000100020000000000C0C0C0
      000B006C696E6561206D6F6420320002000000000000000000D402000005004D
      656D6F3100020018000000420000007B01000017000000020000000100000000
      0000000000FFFFFF1F2C0200000000000100270044657465636369F36E206465
      206572726F7265732064656C204C69737461646F2064652049564100000000FF
      FF00000000000200000001000000000500417269616C000E0000000000000000
      00000000000100020000000000FFFFFF00000000020000000000000004002303
      000005004C696E6531000200180000005F000000610100000000000000000800
      02000000000000000000FFFFFF1F2C020000000000000000000000FFFF000000
      000002000000010000000004007203000005004C696E65320002001800000066
      0000007A010000000000000000080002000000000000000000FFFFFF1F2C0200
      00000000000000000000FFFF00000000000200000001000000000000F6030000
      05004D656D6F32000200140000006E000000F000000010000000020002000100
      0000000000000000FFFFFF1F2C020000000000010006004D6F7469766F000000
      00FFFF00000000000200000001000000000500417269616C000A000000020000
      000000000000000100020000000000FFFFFF0000000002000000000000000000
      8F04000005004D656D6F3300020014000000B5000000F0000000100000000200
      000001000000000000000000FFFFFF1F2C02000000000001001B005B78436F6D
      7072756562614976615265702E224D4F5449564F225D00000000FFFF00000000
      000200000001000000000500417269616C000A00000000000000000000000000
      0100020000000000FFFFFF00000000020000000000000000001405000005004D
      656D6F34000200080100006E0000004800000010000000020002000100000000
      0000000000FFFFFF1F2C020000000000010007004661637475726100000000FF
      FF00000000000200000001000000000500417269616C000A0000000200000000
      00000000000100020000000000FFFFFF0000000002000000000000000000C905
      000005004D656D6F3500020008010000B5000000470000001000000002000000
      01000000000000000000FFFFFF1F2C020000000000010037005B78436F6D7072
      756562614976615265702E2246414354555241225D2F5B78436F6D7072756562
      614976615265702E225345524945225D00000000FFFF00000000000200000001
      000000000500417269616C000A00000000000000000001000000010002000000
      0000FFFFFF00000000020000000000000000004C06000005004D656D6F360002
      00540100006E00000043000000100000000200020001000000000000000000FF
      FFFF1F2C02000000000001000500466563686100000000FFFF00000000000200
      000001000000000500417269616C000A00000002000000000000000000010002
      0000000000FFFFFF0000000002000000000000000000EE06000005004D656D6F
      3700020053010000B50000004400000010000000020000000100000000000000
      0000FFFFFF1F2C0204020A0064642F6D6D2F797979790001001A005B78436F6D
      7072756562614976615265702E224645434841225D00000000FFFF0000000000
      0200000001000000000500417269616C000A0000000000000000000000000001
      00020000000000FFFFFF00000000020000000000000000007D07000005004D65
      6D6F380002009B0100006E0000003D0100001000000002000200010000000000
      00000000FFFFFF1F2C020000000000010011004461746F732061646963696F6E
      616C657300000000FFFF00000000000200000001000000000500417269616C00
      0A000000020000000000000000000100020000000000FFFFFF00000000020000
      000000000000001508000005004D656D6F390002009A010000B50000003D0100
      00100000000200000001000000000000000000FFFFFF1F2C0200000000000100
      1A005B78436F6D7072756562614976615265702E224441544F53225D00000000
      FFFF00000000000200000001000000000500417269616C000A00000000000000
      0000000000000100020000000000FFFFFF0000000002000000000000000000A3
      08000006004D656D6F313000020002020000520100006C000000110000000200
      000001000000000000000000FFFFFF1F2C02000000000001000F0050E167696E
      61205B706167696E615D00000000FFFF00000000000200000001000000000500
      417269616C000A000000000000000000010000000100020000000000FFFFFF00
      0000000200000000000000FEFEFF030000000400205069650000000006007061
      67696E6100050050414745230005006C696E65610005004C494E452300000000
      0000000000FDFF0100000000FC00000000000000000000000000000000580016
      97BDBFF7A4E2400DE3A911D74FE640}
  end
  object DSSPListadoIVARec: TDataSource
    DataSet = SPListadoIVARec
    Left = 160
    Top = 392
  end
  object frDBDSDSSPListadoIVARec: TfrDBDataSet
    CloseDataSource = True
    DataSource = DSSPListadoIVARec
    Left = 288
    Top = 392
  end
  object frxIVARepercutido: TfrxHYReport
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
    OnBeforePrint = frxIVARepercutidoBeforePrint
    OnGetValue = frxIVARepercutidoGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 496
    Top = 152
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 496
    Top = 56
  end
  object SPListadoIVA: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1024
    SelectSQL.Strings = (
      
        'select * from crea_listado_IVA (?empresa,?ejercicio,?canal, ?sig' +
        'no,'
      '?fecha_ini, ?fecha_fin, ?rig_ini, ?rig_fin, ?filtro)'
      'order by rig_visible')
    UniDirectional = False
    AutoCalcFields = False
    Left = 48
    Top = 8
  end
  object SPListadoIVARec: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1024
    SelectSQL.Strings = (
      
        'select * from crea_listado_IVA_rec (?empresa,?ejercicio,?canal, ' +
        '?signo,'
      '?fecha_ini, ?fecha_fin, ?rig_ini, ?rig_fin, ?filtro)'
      'order by rig_visible')
    UniDirectional = False
    AutoCalcFields = False
    Left = 48
    Top = 392
  end
  object xDatosDUA: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT U.*'
      'FROM EMP_REGISTRO_IVA_DETALLE_DUA U'
      '/*'
      'JOIN EMP_REGISTRO_IVA C ON U.ID_I = C.ID_I'
      
        'JOIN EMP_REGISTRO_IVA_DETALLE D ON U.ID_DETALLES_I = D.ID_DETALL' +
        'ES_I'
      'JOIN SYS_TIPO_IVA T ON C.PAIS = T.PAIS AND D.TIPO_IVA = T.TIPO'
      '*/'
      'WHERE'
      'U.ID_DETALLES_I = :ID_DETALLES_I'
      '/*'
      'U.EMPRESA = :EMPRESA AND'
      'U.EJERCICIO = :EJERCICIO AND'
      'U.CANAL = :CANAL AND'
      'U.SIGNO = :SIGNO AND'
      'U.REGISTRO = :REGISTRO AND'
      'T.REGIMEN = 1 AND'
      'C.MODO = :MODO AND'
      'D.TIPO_IVA = :TIPO_IVA'
      '*/'
      'ORDER BY U.LINEA'
      ' ')
    UniDirectional = False
    AutoCalcFields = False
    DataSource = DSSPListaIVA
    AfterScroll = xDatosDUAAfterScroll
    Left = 48
    Top = 200
  end
  object DSxDatosDUA: TDataSource
    DataSet = xDatosDUA
    Left = 160
    Top = 200
  end
  object frDBDxDatosDUA: TfrDBDataSet
    DataSource = DSxDatosDUA
    OpenDataSource = False
    Left = 288
    Top = 200
  end
  object xProveedorDUA: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_PROVEEDORES_CUENTAS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      'PROVEEDOR = :PROVEEDOR')
    UniDirectional = False
    AutoCalcFields = False
    DataSource = DSxDatosDUA
    Left = 48
    Top = 296
  end
  object DSxProveedorDUA: TDataSource
    DataSet = xProveedorDUA
    Left = 160
    Top = 296
  end
  object xDatosFacturaProvDUA: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT * '
      'FROM VER_CABECERAS_FACTURA_PROV'
      'WHERE'
      'ID_E = :ID_E_FAP')
    UniDirectional = False
    AutoCalcFields = False
    DataSource = DSxDatosDUA
    Left = 48
    Top = 248
  end
  object DSxDatosFacturaProvDUA: TDataSource
    DataSet = xDatosFacturaProvDUA
    Left = 160
    Top = 248
  end
  object DSSPListadoIVANeg: TDataSource
    DataSet = SPListadoIVANeg
    Left = 160
    Top = 56
  end
  object frDSSPListaIVANeg: TfrDBDataSet
    DataSource = DSSPListadoIVANeg
    OpenDataSource = False
    Left = 288
    Top = 56
  end
  object SPListadoIVANeg: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1024
    SelectSQL.Strings = (
      
        'select * from crea_listado_IVA (?empresa,?ejercicio,?canal, ?sig' +
        'no,'
      '?fecha_ini, ?fecha_fin, ?rig_ini, ?rig_fin, ?filtro)'
      'order by rig_visible')
    UniDirectional = False
    AutoCalcFields = False
    Left = 48
    Top = 56
  end
  object QMTotalesNeg: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT SUM(B_IMPONIBLE), SUM(I_IVA), SUM(I_REC), SUM(RETENCION),' +
        ' P_IVA, P_REC, MODO, TIPO_IVA, INVERSION_SUJETO_PASIVO, ADQUISIC' +
        'ION'
      
        'FROM CREA_LISTADO_IVA(:EMPRESA, :EJERCICIO, :CANAL, :SIGNO, :FEC' +
        'HA_INI, :FECHA_FIN, :RIG_INI, :RIG_FIN, :FILTRO)'
      'WHERE LIQUIDO_TOTAL < 0'
      
        'GROUP BY TIPO_IVA, MODO, P_IVA, P_REC, INVERSION_SUJETO_PASIVO, ' +
        'ADQUISICION')
    UniDirectional = False
    AutoCalcFields = False
    Left = 48
    Top = 152
  end
  object DSTotalesNeg: TDataSource
    DataSet = QMTotalesNeg
    Left = 160
    Top = 152
  end
  object frDSTotalesNeg: TfrDBDataSet
    DataSource = DSTotalesNeg
    OpenDataSource = False
    Left = 288
    Top = 152
  end
end
