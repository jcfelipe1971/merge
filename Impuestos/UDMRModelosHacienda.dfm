object DMRModelosHacienda: TDMRModelosHacienda
  OldCreateOrder = False
  OnCreate = DMRModelosHaciendaCreate
  OnDestroy = DMRModelosHaciendaDestroy
  Left = 461
  Top = 124
  Height = 761
  Width = 951
  object QMModelo300: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM CON_MODELO_300'
      '  WHERE EMPRESA=?EMPRESA AND'
      '                 EJERCICIO=?EJERCICIO AND'
      '                 CANAL=?CANAL')
    UniDirectional = False
    Left = 328
    Top = 200
    object QMModelo300EMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMModelo300EJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMModelo300CANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMModelo300PERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object QMModelo300DESCRIPCION: TFIBStringField
      DisplayLabel = 'Trimestre'
      FieldName = 'DESCRIPCION'
    end
    object QMModelo300ACTIVIDAD: TIntegerField
      DisplayLabel = 'Actividad'
      FieldName = 'ACTIVIDAD'
    end
    object QMModelo300C01: TFloatField
      FieldName = 'C01'
    end
    object QMModelo300C02: TFloatField
      FieldName = 'C02'
    end
    object QMModelo300C03: TFloatField
      FieldName = 'C03'
    end
    object QMModelo300C04: TFloatField
      FieldName = 'C04'
    end
    object QMModelo300C05: TFloatField
      FieldName = 'C05'
    end
    object QMModelo300C06: TFloatField
      FieldName = 'C06'
    end
    object QMModelo300C07: TFloatField
      FieldName = 'C07'
    end
    object QMModelo300C08: TFloatField
      FieldName = 'C08'
    end
    object QMModelo300C09: TFloatField
      FieldName = 'C09'
    end
    object QMModelo300C10: TFloatField
      FieldName = 'C10'
    end
    object QMModelo300C11: TFloatField
      FieldName = 'C11'
    end
    object QMModelo300C12: TFloatField
      FieldName = 'C12'
    end
    object QMModelo300C13: TFloatField
      FieldName = 'C13'
    end
    object QMModelo300C14: TFloatField
      FieldName = 'C14'
    end
    object QMModelo300C15: TFloatField
      FieldName = 'C15'
    end
    object QMModelo300C16: TFloatField
      FieldName = 'C16'
    end
    object QMModelo300C17: TFloatField
      FieldName = 'C17'
    end
    object QMModelo300C18: TFloatField
      FieldName = 'C18'
    end
    object QMModelo300C19: TFloatField
      FieldName = 'C19'
    end
    object QMModelo300C20: TFloatField
      FieldName = 'C20'
    end
    object QMModelo300C21: TFloatField
      DisplayLabel = 'IVA Devengado'
      FieldName = 'C21'
    end
    object QMModelo300C22: TFloatField
      FieldName = 'C22'
    end
    object QMModelo300C23: TFloatField
      FieldName = 'C23'
    end
    object QMModelo300C24: TFloatField
      FieldName = 'C24'
    end
    object QMModelo300C25: TFloatField
      FieldName = 'C25'
    end
    object QMModelo300C26: TFloatField
      FieldName = 'C26'
    end
    object QMModelo300C27: TFloatField
      DisplayLabel = 'IVA Deducible'
      FieldName = 'C27'
    end
    object QMModelo300C28: TFloatField
      DisplayLabel = 'Diferencia'
      FieldName = 'C28'
    end
    object QMModelo300C29: TFloatField
      FieldName = 'C29'
    end
    object QMModelo300C30: TFloatField
      FieldName = 'C30'
    end
    object QMModelo300C31: TFloatField
      FieldName = 'C31'
    end
    object QMModelo300C32: TFloatField
      FieldName = 'C32'
    end
    object QMModelo300C33: TFloatField
      FieldName = 'C33'
    end
    object QMModelo300C34: TFloatField
      DisplayLabel = 'Resultado'
      FieldName = 'C34'
    end
    object QMModelo300C: TFloatField
      FieldName = 'C'
    end
  end
  object DSxModelo300: TDataSource
    DataSet = QMModelo300
    Left = 424
    Top = 200
  end
  object frDBxModelo300: TfrDBDataSet
    DataSource = DSxModelo300
    Left = 232
    Top = 200
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 40
    Top = 8
  end
  object SPRecalcular300: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure c_modelo_300(?empresa,?ejercicio,?canal)')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 520
    Top = 200
  end
  object frModelo300: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Modelo 300'
    RebuildPrinter = False
    OnGetValue = frModelo300GetValue
    OnBeforePrint = frModelo300EnterRect
    OnEnterRect = frModelo300EnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 40
    Top = 200
    ReportForm = {19000000}
  end
  object frModelo115: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Modelo 115'
    RebuildPrinter = False
    OnGetValue = frModelo115GetValue
    OnBeforePrint = frModelo300EnterRect
    OnEnterRect = frModelo300EnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 40
    Top = 104
    ReportForm = {19000000}
  end
  object frModelo110: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Modelo 110'
    RebuildPrinter = False
    OnGetValue = frModelo110GetValue
    OnBeforePrint = frModelo300EnterRect
    OnEnterRect = frModelo300EnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 40
    Top = 56
    ReportForm = {19000000}
  end
  object frModelo330: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Modelo 330'
    RebuildPrinter = False
    OnGetValue = frModelo330GetValue
    OnBeforePrint = frModelo300EnterRect
    OnEnterRect = frModelo300EnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 40
    Top = 296
    ReportForm = {19000000}
  end
  object DSxModelo330: TDataSource
    DataSet = xModelo330
    Left = 424
    Top = 296
  end
  object frDBxModelo330: TfrDBDataSet
    DataSource = DSxModelo330
    Left = 232
    Top = 296
  end
  object SPRecalcular330: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'execute procedure c_modelo_330(?empresa,?ejercicio,?canal)')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 520
    Top = 296
  end
  object SPModelo110: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure c_modelo_110(?empresa,?ejercicio,?canal,?perio' +
        'do)')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 328
    Top = 56
  end
  object SPModelo115: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'EXECUTE PROCEDURE C_MODELO_115(?EMPRESA, ?EJERCICIO, ?CANAL, ?PE' +
        'RIODO)')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 328
    Top = 104
  end
  object xModelo330: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM CON_MODELO_330'
      '  WHERE EMPRESA=?EMPRESA AND'
      '                 EJERCICIO=?EJERCICIO AND'
      '                 CANAL=?CANAL')
    UniDirectional = False
    Left = 328
    Top = 296
    object xModelo330EMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xModelo330EJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xModelo330CANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xModelo330PERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object xModelo330DESCRIPCION: TFIBStringField
      DisplayLabel = 'Trimestre'
      FieldName = 'DESCRIPCION'
    end
    object xModelo330ACTIVIDAD: TIntegerField
      DisplayLabel = 'Actividad'
      FieldName = 'ACTIVIDAD'
    end
    object xModelo330C01: TFloatField
      FieldName = 'C01'
    end
    object xModelo330C02: TFloatField
      FieldName = 'C02'
    end
    object xModelo330C03: TFloatField
      FieldName = 'C03'
    end
    object xModelo330C04: TFloatField
      FieldName = 'C04'
    end
    object xModelo330C05: TFloatField
      FieldName = 'C05'
    end
    object xModelo330C06: TFloatField
      FieldName = 'C06'
    end
    object xModelo330C07: TFloatField
      FieldName = 'C07'
    end
    object xModelo330C08: TFloatField
      FieldName = 'C08'
    end
    object xModelo330C09: TFloatField
      FieldName = 'C09'
    end
    object xModelo330C10: TFloatField
      FieldName = 'C10'
    end
    object xModelo330C11: TFloatField
      FieldName = 'C11'
    end
    object xModelo330C12: TFloatField
      FieldName = 'C12'
    end
    object xModelo330C13: TFloatField
      FieldName = 'C13'
    end
    object xModelo330C14: TFloatField
      FieldName = 'C14'
    end
    object xModelo330C15: TFloatField
      FieldName = 'C15'
    end
    object xModelo330C16: TFloatField
      FieldName = 'C16'
    end
    object xModelo330C17: TFloatField
      FieldName = 'C17'
    end
    object xModelo330C18: TFloatField
      FieldName = 'C18'
    end
    object xModelo330C19: TFloatField
      FieldName = 'C19'
    end
    object xModelo330C20: TFloatField
      FieldName = 'C20'
    end
    object xModelo330C21: TFloatField
      DisplayLabel = 'IVA Devengado'
      FieldName = 'C21'
    end
    object xModelo330C22: TFloatField
      FieldName = 'C22'
    end
    object xModelo330C23: TFloatField
      FieldName = 'C23'
    end
    object xModelo330C24: TFloatField
      FieldName = 'C24'
    end
    object xModelo330C25: TFloatField
      FieldName = 'C25'
    end
    object xModelo330C26: TFloatField
      FieldName = 'C26'
    end
    object xModelo330C27: TFloatField
      FieldName = 'C27'
    end
    object xModelo330C28: TFloatField
      FieldName = 'C28'
    end
    object xModelo330C29: TFloatField
      FieldName = 'C29'
    end
    object xModelo330C30: TFloatField
      DisplayLabel = 'IVA Deducible'
      FieldName = 'C30'
    end
    object xModelo330C31: TFloatField
      FieldName = 'C31'
    end
    object xModelo330C32: TFloatField
      FieldName = 'C32'
    end
    object xModelo330C33: TFloatField
      FieldName = 'C33'
    end
    object xModelo330C34: TFloatField
      FieldName = 'C34'
    end
    object xModelo330C35: TFloatField
      FieldName = 'C35'
    end
    object xModelo330C36: TFloatField
      FieldName = 'C36'
    end
    object xModelo330C37: TFloatField
      FieldName = 'C37'
    end
    object xModelo330C38: TFloatField
      FieldName = 'C38'
    end
    object xModelo330C39: TFloatField
      FieldName = 'C39'
    end
    object xModelo330C40: TFloatField
      FieldName = 'C40'
    end
    object xModelo330C41: TFloatField
      DisplayLabel = 'Resultado'
      FieldName = 'C41'
    end
    object xModelo330C42: TFloatField
      DisplayLabel = 'A Devolver'
      FieldName = 'C42'
    end
    object xModelo330C43: TFloatField
      DisplayLabel = 'A Compensar'
      FieldName = 'C43'
    end
    object xModelo330C: TFloatField
      FieldName = 'C'
    end
    object xModelo330D: TFloatField
      FieldName = 'D'
    end
  end
  object xModelo190: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM C_MODELO_190 (?EMPRESA, ?EJERCICIO, ?CANAL)')
    UniDirectional = False
    AfterScroll = xModelo190AfterScroll
    Left = 328
    Top = 152
    object xModelo190LINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xModelo190CLAVE: TFIBStringField
      DisplayLabel = 'Clave'
      FieldName = 'CLAVE'
      Size = 1
    end
    object xModelo190TERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xModelo190IMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object xModelo190RETENCION: TFloatField
      DisplayLabel = 'Retencion'
      FieldName = 'RETENCION'
    end
    object xModelo190IMPORTE_ESPECIE: TFloatField
      DisplayLabel = 'Imp. Especie'
      FieldName = 'IMPORTE_ESPECIE'
    end
    object xModelo190RETENCION_ESPECIE: TFloatField
      DisplayLabel = 'Rentencion Especia'
      FieldName = 'RETENCION_ESPECIE'
    end
    object xModelo190SUBCLAVE: TFIBStringField
      DisplayLabel = 'Subclave'
      FieldName = 'SUBCLAVE'
      Size = 2
    end
    object xModelo190ANYO_NACIMIENTO: TIntegerField
      DisplayLabel = 'A'#241'o Nacimiento'
      FieldName = 'ANYO_NACIMIENTO'
    end
  end
  object xTercero: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT TER.NIF, TER.NOMBRE_R_SOCIAL, LOC.PROVINCIA, LOC.PAIS, PA' +
        'IS.PAIS_C2'
      'FROM SYS_TERCEROS TER'
      
        'LEFT JOIN SYS_TERCEROS_CONTACTOS CON ON ((TER.TERCERO = CON.TERC' +
        'ERO) AND (CON.CONTACTO = 1))'
      
        'LEFT JOIN SYS_TERCEROS_DIRECCIONES DIR ON ((TER.TERCERO = DIR.TE' +
        'RCERO) AND (DIR.DIR_DEFECTO = 1))'
      
        'LEFT JOIN SYS_LOCALIDADES LOC ON (DIR.DIR_LOCALIDAD = LOC.LOCALI' +
        'DAD)'
      
        'LEFT JOIN SYS_PROVINCIAS PRO ON (LOC.PROVINCIA = PRO.PROVINCIA) ' +
        'AND (LOC.PAIS = PRO.PAIS)'
      'LEFT JOIN SYS_PAISES PAIS ON (PAIS.PAIS = LOC.PAIS)'
      'WHERE'
      'TER.TERCERO = :TERCERO'
      '/*'
      'SELECT * FROM SYS_TERCEROS TER'
      'LEFT JOIN SYS_TERCEROS_CONTACTOS CON'
      'ON ((TER.TERCERO = CON.TERCERO) AND (CON.CONTACTO = 1))'
      'LEFT JOIN SYS_TERCEROS_DIRECCIONES DIR'
      'ON ((TER.TERCERO = DIR.TERCERO) AND (DIR.DIR_DEFECTO = 1))'
      'LEFT JOIN SYS_LOCALIDADES LOC'
      'ON (DIR.DIR_LOCALIDAD = LOC.LOCALIDAD)'
      'LEFT JOIN SYS_PROVINCIAS PRO'
      'ON (LOC.PROVINCIA = PRO.PROVINCIA)  AND  (LOC.PAIS = PRO.PAIS)'
      'LEFT JOIN SYS_PAISES PAIS'
      'ON (PAIS.PAIS = LOC.PAIS)'
      'WHERE'
      'TER.TERCERO = :TERCERO'
      '*/')
    UniDirectional = False
    Left = 424
    Top = 8
  end
  object SPTotales190: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select count(*) from c_modelo190(?empresa,?ejercicio,?canal)')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 520
    Top = 152
  end
  object frModelo190: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Modelo 190'
    RebuildPrinter = False
    OnGetValue = frModelo190GetValue
    OnBeforePrint = frModelo300EnterRect
    OnEnterRect = frModelo300EnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 40
    Top = 152
    ReportForm = {19000000}
  end
  object DSxModelo190: TDataSource
    DataSet = xModelo190
    Left = 424
    Top = 152
  end
  object frDBxModelo190: TfrDBDataSet
    DataSource = DSxModelo190
    Left = 232
    Top = 152
  end
  object xModelo347: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      
        'SELECT NIF, TERCERO, SIGNO, IMPORTE_T1_PRESENTAR AS IMPORTE_T1, ' +
        'IMPORTE_T2_PRESENTAR AS IMPORTE_T2,'
      
        '       IMPORTE_T3_PRESENTAR AS IMPORTE_T3, IMPORTE_T4_PRESENTAR ' +
        'AS IMPORTE_T4, IMPORTE_TOTAL_PRESENTAR AS IMPORTE,'
      '       INVERSION_SUJETO_PASIVO, NOMBRE_R_SOCIAL, CODIGO_POSTAL'
      'FROM CON_MODELO_347'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL AND'
      
        '((IMPORTE_T1_PRESENTAR <> 0) OR (IMPORTE_T2_PRESENTAR <> 0) OR (' +
        'IMPORTE_T3_PRESENTAR <> 0) OR (IMPORTE_T4_PRESENTAR <> 0))'
      'ORDER BY SIGNO, NIF')
    UniDirectional = False
    Left = 328
    Top = 344
    object xModelo347NIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object xModelo347SIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object xModelo347IMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object xModelo347IMPORTE_T1: TFloatField
      DisplayLabel = 'Imp. T1'
      FieldName = 'IMPORTE_T1'
    end
    object xModelo347IMPORTE_T2: TFloatField
      DisplayLabel = 'Imp. T2'
      FieldName = 'IMPORTE_T2'
    end
    object xModelo347IMPORTE_T3: TFloatField
      DisplayLabel = 'Imp. T3'
      FieldName = 'IMPORTE_T3'
    end
    object xModelo347IMPORTE_T4: TFloatField
      DisplayLabel = 'Imp. T4'
      FieldName = 'IMPORTE_T4'
    end
    object xModelo347INVERSION_SUJETO_PASIVO: TIntegerField
      DisplayLabel = 'Inv. Sujeto Pasivo'
      FieldName = 'INVERSION_SUJETO_PASIVO'
    end
    object xModelo347TERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xModelo347NOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xModelo347CODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'CODIGO_POSTAL'
      Size = 10
    end
  end
  object DSxModelo347: TDataSource
    DataSet = xModelo347
    Left = 424
    Top = 344
  end
  object SPTotales349: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'select count(*) as num_declarados from c_modelo_349(?empresa,?ej' +
        'ercicio,?canal)')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 520
    Top = 584
  end
  object frModelo349: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Modelo 349'
    RebuildPrinter = False
    OnGetValue = frModelo349GetValue
    OnBeforePrint = frModelo349BeforePrint
    OnEnterRect = frModelo349BeforePrint
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 40
    Top = 584
    ReportForm = {19000000}
  end
  object xDatosModelosHacienda: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM EMP_MODELOS_HACIENDA'
      'where empresa=?empresa and ejercicio=?ejercicio and canal=?canal')
    UniDirectional = False
    Left = 328
    Top = 8
    object xDatosModelosHaciendaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xDatosModelosHaciendaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xDatosModelosHaciendaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xDatosModelosHaciendaDELEGACION: TFIBStringField
      DisplayLabel = 'Delegacion'
      FieldName = 'DELEGACION'
      Size = 40
    end
    object xDatosModelosHaciendaADMINISTRACION: TFIBStringField
      DisplayLabel = 'Administracion'
      FieldName = 'ADMINISTRACION'
      Size = 40
    end
    object xDatosModelosHaciendaCOD_ADMINISTRACION: TIntegerField
      DisplayLabel = 'Cod. Administracion'
      FieldName = 'COD_ADMINISTRACION'
    end
    object xDatosModelosHaciendaDECLARANTE_NIF: TFIBStringField
      DisplayLabel = 'NIF'
      FieldName = 'DECLARANTE_NIF'
      Size = 15
    end
    object xDatosModelosHaciendaDECLARANTE_NOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'DECLARANTE_NOMBRE'
      Size = 60
    end
    object xDatosModelosHaciendaDECLARANTE_TIPO_CALLE: TFIBStringField
      DisplayLabel = 'Tipo Calle'
      FieldName = 'DECLARANTE_TIPO_CALLE'
      Size = 15
    end
    object xDatosModelosHaciendaDECLARANTE_CALLE: TFIBStringField
      DisplayLabel = 'Calle'
      FieldName = 'DECLARANTE_CALLE'
      Size = 60
    end
    object xDatosModelosHaciendaDECLARANTE_NUMERO: TFIBStringField
      DisplayLabel = 'Numero'
      FieldName = 'DECLARANTE_NUMERO'
      Size = 15
    end
    object xDatosModelosHaciendaDECLARANTE_ESCALERA: TFIBStringField
      DisplayLabel = 'Escalera'
      FieldName = 'DECLARANTE_ESCALERA'
      Size = 15
    end
    object xDatosModelosHaciendaDECLARANTE_PISO: TFIBStringField
      DisplayLabel = 'Piso'
      FieldName = 'DECLARANTE_PISO'
      Size = 15
    end
    object xDatosModelosHaciendaDECLARANTE_PUERTA: TFIBStringField
      DisplayLabel = 'Puerta'
      FieldName = 'DECLARANTE_PUERTA'
      Size = 15
    end
    object xDatosModelosHaciendaDECLARANTE_CODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'DECLARANTE_CODIGO_POSTAL'
      Size = 15
    end
    object xDatosModelosHaciendaDECLARANTE_MUNICIPIO: TFIBStringField
      DisplayLabel = 'Municipio'
      FieldName = 'DECLARANTE_MUNICIPIO'
      Size = 40
    end
    object xDatosModelosHaciendaDECLARANTE_PROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'DECLARANTE_PROVINCIA'
      Size = 40
    end
    object xDatosModelosHaciendaDECLARANTE_TELEFONO: TFIBStringField
      DisplayLabel = 'Telefono'
      FieldName = 'DECLARANTE_TELEFONO'
    end
    object xDatosModelosHaciendaDECLARANTE_ENTIDAD: TFIBStringField
      DisplayLabel = 'Entidad'
      FieldName = 'DECLARANTE_ENTIDAD'
      Size = 4
    end
    object xDatosModelosHaciendaDECLARANTE_SUCURSAL: TFIBStringField
      DisplayLabel = 'Sucursal'
      FieldName = 'DECLARANTE_SUCURSAL'
      Size = 4
    end
    object xDatosModelosHaciendaDECLARANTE_DC: TFIBStringField
      DisplayLabel = 'D.C.'
      FieldName = 'DECLARANTE_DC'
      Size = 2
    end
    object xDatosModelosHaciendaM_110_EFECTIVO: TIntegerField
      DisplayLabel = 'Mod. 110 Efect.'
      FieldName = 'M_110_EFECTIVO'
    end
    object xDatosModelosHaciendaM_115_EFECTIVO: TIntegerField
      DisplayLabel = 'Mod. 114 Efect.'
      FieldName = 'M_115_EFECTIVO'
    end
    object xDatosModelosHaciendaM_300_EFECTIVO: TIntegerField
      DisplayLabel = 'Mod. 300 Efect.'
      FieldName = 'M_300_EFECTIVO'
    end
    object xDatosModelosHaciendaPRESENTADOR_NIF: TFIBStringField
      DisplayLabel = 'NIF'
      FieldName = 'PRESENTADOR_NIF'
      Size = 15
    end
    object xDatosModelosHaciendaPRESENTADOR_NOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'PRESENTADOR_NOMBRE'
      Size = 60
    end
    object xDatosModelosHaciendaPRESENTADOR_TIPO_CALLE: TFIBStringField
      DisplayLabel = 'Tipo Calle'
      FieldName = 'PRESENTADOR_TIPO_CALLE'
      Size = 15
    end
    object xDatosModelosHaciendaPRESENTADOR_CALLE: TFIBStringField
      DisplayLabel = 'Calle'
      FieldName = 'PRESENTADOR_CALLE'
      Size = 60
    end
    object xDatosModelosHaciendaPRESENTADOR_NUMERO: TFIBStringField
      DisplayLabel = 'Numero'
      FieldName = 'PRESENTADOR_NUMERO'
      Size = 15
    end
    object xDatosModelosHaciendaPRESENTADOR_ESCALERA: TFIBStringField
      DisplayLabel = 'Escalera'
      FieldName = 'PRESENTADOR_ESCALERA'
      Size = 15
    end
    object xDatosModelosHaciendaPRESENTADOR_PISO: TFIBStringField
      DisplayLabel = 'Piso'
      FieldName = 'PRESENTADOR_PISO'
      Size = 15
    end
    object xDatosModelosHaciendaPRESENTADOR_PUERTA: TFIBStringField
      DisplayLabel = 'Puerta'
      FieldName = 'PRESENTADOR_PUERTA'
      Size = 15
    end
    object xDatosModelosHaciendaPRESENTADOR_CODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'PRESENTADOR_CODIGO_POSTAL'
      Size = 15
    end
    object xDatosModelosHaciendaPRESENTADOR_MUNICIPIO: TFIBStringField
      DisplayLabel = 'Municipio'
      FieldName = 'PRESENTADOR_MUNICIPIO'
      Size = 40
    end
    object xDatosModelosHaciendaPRESENTADOR_PROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PRESENTADOR_PROVINCIA'
      Size = 40
    end
    object xDatosModelosHaciendaPRESENTADOR_TELEFONO: TFIBStringField
      DisplayLabel = 'Telefono'
      FieldName = 'PRESENTADOR_TELEFONO'
    end
    object xDatosModelosHaciendaDECLARANTE_CUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'DECLARANTE_CUENTA'
    end
    object xDatosModelosHaciendaM_303_EFECTIVO: TIntegerField
      DisplayLabel = 'Mod. 303 Efect.'
      FieldName = 'M_303_EFECTIVO'
    end
    object xDatosModelosHaciendaDECLARANTE_IBAN: TFIBStringField
      DisplayLabel = 'I.B.A.N.'
      FieldName = 'DECLARANTE_IBAN'
      Size = 34
    end
    object xDatosModelosHaciendaDECLARANTE_BIC: TFIBStringField
      DisplayLabel = 'B.I.C.'
      FieldName = 'DECLARANTE_BIC'
      Size = 30
    end
    object xDatosModelosHaciendaDEVOLUCION_MENSUAL_M303: TIntegerField
      DisplayLabel = 'Devolucion Mensual M-303'
      FieldName = 'DEVOLUCION_MENSUAL_M303'
    end
    object xDatosModelosHaciendaDEVOLUCION_MENSUAL_M349: TIntegerField
      DisplayLabel = 'Devolucion Mensual M-349'
      FieldName = 'DEVOLUCION_MENSUAL_M349'
    end
  end
  object xMod300Liquidar: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select liquidar_iva_modelo_300'
      'from emp_canales'
      
        'where ((empresa=?empresa)and(ejercicio=?ejercicio)and(canal=?can' +
        'al))')
    UniDirectional = False
    Left = 616
    Top = 152
    object xMod300LiquidarLIQUIDAR_IVA_MODELO_300: TIntegerField
      DisplayLabel = 'Liquidar IVA Moneda'
      FieldName = 'LIQUIDAR_IVA_MODELO_300'
    end
  end
  object frxModelo110: TfrxHYReport
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
    OnBeforePrint = frxModelo110BeforePrint
    OnGetValue = frxModelo110GetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 136
    Top = 56
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxModelo115: TfrxHYReport
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
    OnBeforePrint = frxModelo110BeforePrint
    OnGetValue = frxModelo115GetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 136
    Top = 104
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxModelo190: TfrxHYReport
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
    OnBeforePrint = frxModelo110BeforePrint
    OnGetValue = frxModelo190GetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 136
    Top = 152
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxModelo300: TfrxHYReport
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
    OnBeforePrint = frxModelo110BeforePrint
    OnGetValue = frxModelo300GetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 136
    Top = 200
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxModelo330: TfrxHYReport
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
    OnBeforePrint = frxModelo110BeforePrint
    OnGetValue = frxModelo330GetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 136
    Top = 296
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frxModelo349: TfrxHYReport
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
    OnBeforePrint = frxModelo110BeforePrint
    OnGetValue = frxModelo349GetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 136
    Top = 584
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object xModelo349_rect: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = DMMain.TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT COD_PAIS, NIF, NOMBRE_R_SOCIAL, CLAVEOP, SUM(IMPORTE) AS ' +
        'IMPORTE, SUM(I_PORTES) AS I_PORTES'
      'FROM C_MODELO_349_LST(:EMPRESA, :EJERCICIO, :CANAL, :PERIODO)'
      'WHERE'
      'TIPO = 1'
      'GROUP BY CLAVEOP, COD_PAIS, NIF, NOMBRE_R_SOCIAL')
    UniDirectional = False
    Left = 328
    Top = 584
    object xModelo349_rectCOD_PAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'COD_PAIS'
      Size = 2
    end
    object xModelo349_rectNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object xModelo349_rectNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xModelo349_rectCLAVEOP: TFIBStringField
      DisplayLabel = 'Clave'
      FieldName = 'CLAVEOP'
      Size = 1
    end
    object xModelo349_rectIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object xModelo349_rectI_PORTES: TFloatField
      DisplayLabel = 'Imp. Portes'
      FieldName = 'I_PORTES'
    end
  end
  object DSxModelo349_rect: TDataSource
    DataSet = xModelo349_rect
    Left = 424
    Top = 584
  end
  object xModelo349_Dec: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = DMMain.TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT COD_PAIS, NIF, NOMBRE_R_SOCIAL, CLAVEOP, SUM(IMPORTE) AS ' +
        'IMPORTE, SUM(I_PORTES) AS I_PORTES'
      'FROM C_MODELO_349_LST(:EMPRESA, :EJERCICIO, :CANAL, :PERIODO)'
      'WHERE'
      'TIPO = 0'
      'GROUP BY CLAVEOP, COD_PAIS, NIF, NOMBRE_R_SOCIAL')
    UniDirectional = False
    Left = 328
    Top = 632
    object xModelo349_DecCOD_PAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'COD_PAIS'
      Size = 2
    end
    object xModelo349_DecNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object xModelo349_DecNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xModelo349_DecCLAVEOP: TFIBStringField
      DisplayLabel = 'Clave'
      FieldName = 'CLAVEOP'
      Size = 1
    end
    object xModelo349_DecIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object xModelo349_DecI_PORTES: TFloatField
      DisplayLabel = 'Imp. Portes'
      FieldName = 'I_PORTES'
    end
  end
  object DSxModelo349_Dec: TDataSource
    DataSet = xModelo349_Dec
    Left = 424
    Top = 632
  end
  object frDSxModelo349_Dec: TfrDBDataSet
    DataSource = DSxModelo349_Dec
    Left = 232
    Top = 632
  end
  object frDSxModelo349_rect: TfrDBDataSet
    DataSource = DSxModelo349_rect
    Left = 232
    Top = 584
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'nowait'
      'rec_version')
    Left = 136
    Top = 8
  end
  object xModelo340_expedidas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      '/* OJO SE REDEFINE POR CODIGO */'
      '/* xModelo340_expedidas */ '
      '/* Facutras Normales */'
      'select '
      
        'c.EMPRESA,c.EJERCICIO,c.CANAL,c.REGISTRO,d.LINEA,c.SIGNO,c.FECHA' +
        '_REGISTRO,c.CUENTA,c.DOC_NUMERO,c.DOC_SERIE,c.DOC_FECHA,c.DOC_TI' +
        'PO,'
      
        'c.MODO,c.DESCRIPCION_CTA,c.ACTIVO,c.ENLACE_ASIENTO,c.LIQUIDO,c.S' +
        '_RECARGOS,c.S_BASES,c.S_IVAS,c.RIG_VISIBLE,c.ANYO_NATURAL,c.TERC' +
        'ERO,c.RETENCION, '
      
        'c.LIQUIDO_TOTAL,c.NIF,c.ADQUISICION,c.ID_I,c.NOMBRE,c.DIRECCION,' +
        'c.C_POSTAL,c.PROVINCIA,c.PAIS,c.CUENTA_PGC, '
      
        'd.EMPRESA,d.EJERCICIO,d.CANAL,d.SIGNO,d.REGISTRO,d.TIPO_IVA,d.DE' +
        'DUCIBLE,d.B_IMPONIBLE,d.P_IVA,d.P_REC,d.I_IVA,d.I_REC,d.ID_I,d.I' +
        'D_DETALLES_I, '
      
        'p.PAIS,p.TITULO,p.PAIS_C2,p.PAIS_N3,p.CODIGO_TEL,p.IDIOMA,p.PERT' +
        'ENECE_CEE'
      'from emp_registro_iva c'
      'join emp_registro_iva_detalle d '
      'on c.id_i=d.id_i '
      'join sys_paises p '
      'on c.pais=p.pais '
      'where '
      'c.adquisicion=0 and'
      'c.empresa=:empresa and '
      'c.ejercicio=:ejercicio and '
      'c.canal=:canal and '
      'c.signo='#39'R'#39' and'
      'c.fecha_registro between ?DESDE and ?HASTA '
      ''
      'union'
      ''
      '/* Facutras Intracomunitarias FAP */'
      'select '
      
        'c.EMPRESA,c.EJERCICIO,c.CANAL,c.REGISTRO,d.LINEA,c.SIGNO,c.FECHA' +
        '_REGISTRO,c.CUENTA,f.RIG,f.SERIE,c.DOC_FECHA,c.DOC_TIPO,'
      
        'c.MODO,c.DESCRIPCION_CTA,c.ACTIVO,c.ENLACE_ASIENTO,c.LIQUIDO,c.S' +
        '_RECARGOS,c.S_BASES,c.S_IVAS,c.RIG_VISIBLE,c.ANYO_NATURAL,c.TERC' +
        'ERO,c.RETENCION, '
      
        'c.LIQUIDO_TOTAL,c.NIF,c.ADQUISICION,c.ID_I,c.NOMBRE,c.DIRECCION,' +
        'c.C_POSTAL,c.PROVINCIA,c.PAIS,c.CUENTA_PGC, '
      
        'd.EMPRESA,d.EJERCICIO,d.CANAL,d.SIGNO,d.REGISTRO,d.TIPO_IVA,d.DE' +
        'DUCIBLE,d.B_IMPONIBLE,d.P_IVA,d.P_REC,d.I_IVA,d.I_REC,d.ID_I,d.I' +
        'D_DETALLES_I, '
      
        'p.PAIS,p.TITULO,p.PAIS_C2,p.PAIS_N3,p.CODIGO_TEL,p.IDIOMA,p.PERT' +
        'ENECE_CEE'
      'from emp_registro_iva c'
      'join emp_registro_iva_detalle d '
      'on c.id_i=d.id_i '
      'join sys_paises p '
      'on c.pais=p.pais '
      'join ges_cabeceras_e_fac f'
      
        'on c.empresa=f.empresa and c.ejercicio=f.ejercicio and c.canal=f' +
        '.canal and c.doc_serie=f.serie_autofactura and c.doc_numero=f.au' +
        'tofactura'
      'where '
      'c.adquisicion=1 and'
      'c.enlace_asiento=0 and'
      'c.empresa=:empresa and '
      'c.ejercicio=:ejercicio and '
      'c.canal=:canal and '
      'c.signo='#39'R'#39' and'
      'c.fecha_registro between ?DESDE and ?HASTA '
      ''
      'union'
      ''
      '/* Facutras Intracomunitarias FCR */'
      'select '
      
        'c.EMPRESA,c.EJERCICIO,c.CANAL,c.REGISTRO,d.LINEA,c.SIGNO,c.FECHA' +
        '_REGISTRO,c.CUENTA,f.RIG,f.SERIE,c.DOC_FECHA,c.DOC_TIPO,'
      
        'c.MODO,c.DESCRIPCION_CTA,c.ACTIVO,c.ENLACE_ASIENTO,c.LIQUIDO,c.S' +
        '_RECARGOS,c.S_BASES,c.S_IVAS,c.RIG_VISIBLE,c.ANYO_NATURAL,c.TERC' +
        'ERO,c.RETENCION, '
      
        'c.LIQUIDO_TOTAL,c.NIF,c.ADQUISICION,c.ID_I,c.NOMBRE,c.DIRECCION,' +
        'c.C_POSTAL,c.PROVINCIA,c.PAIS,c.CUENTA_PGC, '
      
        'd.EMPRESA,d.EJERCICIO,d.CANAL,d.SIGNO,d.REGISTRO,d.TIPO_IVA,d.DE' +
        'DUCIBLE,d.B_IMPONIBLE,d.P_IVA,d.P_REC,d.I_IVA,d.I_REC,d.ID_I,d.I' +
        'D_DETALLES_I, '
      
        'p.PAIS,p.TITULO,p.PAIS_C2,p.PAIS_N3,p.CODIGO_TEL,p.IDIOMA,p.PERT' +
        'ENECE_CEE'
      'from emp_registro_iva c'
      'join emp_registro_iva_detalle d '
      'on c.id_i=d.id_i '
      'join sys_paises p '
      'on c.pais=p.pais '
      'join ges_cabeceras_e_fcr f'
      
        'on c.empresa=f.empresa and c.ejercicio=f.ejercicio and c.canal=f' +
        '.canal and c.doc_serie=f.serie_autofactura and c.doc_numero=f.au' +
        'tofactura'
      'where '
      'c.adquisicion=1 and'
      'c.enlace_asiento=0 and'
      'c.empresa=:empresa and '
      'c.ejercicio=:ejercicio and '
      'c.canal=:canal and '
      'c.signo='#39'R'#39' and'
      'c.fecha_registro between ?DESDE and ?HASTA '
      ''
      'union'
      ''
      '/* Facutras Intracomunitarias desde asientos */'
      'select'
      
        'c.EMPRESA,c.EJERCICIO,c.CANAL,c.REGISTRO,d.LINEA,c.SIGNO,c.FECHA' +
        '_REGISTRO,c.CUENTA,ap.DOC_NUMERO,ap.DOC_SERIE,c.DOC_FECHA,c.DOC_' +
        'TIPO,'
      
        'c.MODO,c.DESCRIPCION_CTA,c.ACTIVO,c.ENLACE_ASIENTO,c.LIQUIDO,c.S' +
        '_RECARGOS,c.S_BASES,c.S_IVAS,c.RIG_VISIBLE,c.ANYO_NATURAL,c.TERC' +
        'ERO,c.RETENCION, '
      
        'c.LIQUIDO_TOTAL,c.NIF,c.ADQUISICION,c.ID_I,c.NOMBRE,c.DIRECCION,' +
        'c.C_POSTAL,c.PROVINCIA,c.PAIS,c.CUENTA_PGC, '
      
        'd.EMPRESA,d.EJERCICIO,d.CANAL,d.SIGNO,d.REGISTRO,d.TIPO_IVA,d.DE' +
        'DUCIBLE,d.B_IMPONIBLE,d.P_IVA,d.P_REC,d.I_IVA,d.I_REC,d.ID_I,d.I' +
        'D_DETALLES_I, '
      
        'p.PAIS,p.TITULO,p.PAIS_C2,p.PAIS_N3,p.CODIGO_TEL,p.IDIOMA,p.PERT' +
        'ENECE_CEE '
      'from emp_registro_iva c'
      'join emp_registro_iva_detalle d '
      'on c.id_i=d.id_i '
      'join sys_paises p '
      'on c.pais=p.pais '
      'join con_cuentas_asientos a'
      
        'on a.empresa=c.empresa and a.ejercicio=c.ejercicio and a.canal=c' +
        '.canal and a.ric=c.enlace_asiento'
      'left join con_cuentas_apuntes ap'
      
        'on a.empresa=ap.empresa and a.ejercicio=ap.ejercicio and a.canal' +
        '=ap.canal and a.ric=ap.ric'
      'where'
      'c.adquisicion=1 and'
      'ap.linea=1 and'
      'c.enlace_asiento>0 and'
      'c.empresa=:empresa and '
      'c.ejercicio=:ejercicio and '
      'c.canal=:canal and '
      'c.signo='#39'R'#39' and'
      'c.fecha_registro between ?DESDE and ?HASTA ')
    UniDirectional = False
    Left = 328
    Top = 392
    object xModelo340_expedidasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xModelo340_expedidasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xModelo340_expedidasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xModelo340_expedidasSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object xModelo340_expedidasREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object xModelo340_expedidasFECHA_REGISTRO: TDateTimeField
      DisplayLabel = 'Fec. Registro'
      FieldName = 'FECHA_REGISTRO'
    end
    object xModelo340_expedidasCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object xModelo340_expedidasDOC_NUMERO: TIntegerField
      DisplayLabel = 'Doc. Nro.'
      FieldName = 'DOC_NUMERO'
    end
    object xModelo340_expedidasDOC_SERIE: TFIBStringField
      DisplayLabel = 'Doc Serie'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object xModelo340_expedidasDOC_FECHA: TDateTimeField
      DisplayLabel = 'Fecha Doc.'
      FieldName = 'DOC_FECHA'
    end
    object xModelo340_expedidasDOC_TIPO: TFIBStringField
      DisplayLabel = 'Doc. Tipo'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object xModelo340_expedidasMODO: TIntegerField
      DisplayLabel = 'Modo'
      FieldName = 'MODO'
    end
    object xModelo340_expedidasDESCRIPCION_CTA: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION_CTA'
      Size = 150
    end
    object xModelo340_expedidasACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object xModelo340_expedidasENLACE_ASIENTO: TIntegerField
      DisplayLabel = 'Enlace Ato.'
      FieldName = 'ENLACE_ASIENTO'
    end
    object xModelo340_expedidasLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object xModelo340_expedidasS_RECARGOS: TFloatField
      DisplayLabel = 'Total Recargos'
      FieldName = 'S_RECARGOS'
    end
    object xModelo340_expedidasS_BASES: TFloatField
      DisplayLabel = 'S. Bases'
      FieldName = 'S_BASES'
    end
    object xModelo340_expedidasS_IVAS: TFloatField
      DisplayLabel = 'S. IVAs'
      FieldName = 'S_IVAS'
    end
    object xModelo340_expedidasRIG_VISIBLE: TIntegerField
      DisplayLabel = 'Reg. IVA'
      FieldName = 'RIG_VISIBLE'
    end
    object xModelo340_expedidasANYO_NATURAL: TIntegerField
      DisplayLabel = 'A'#241'o nat.'
      FieldName = 'ANYO_NATURAL'
    end
    object xModelo340_expedidasTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xModelo340_expedidasRETENCION: TFloatField
      DisplayLabel = 'Retencion'
      FieldName = 'RETENCION'
    end
    object xModelo340_expedidasLIQUIDO_TOTAL: TFloatField
      DisplayLabel = 'Liquido Total'
      FieldName = 'LIQUIDO_TOTAL'
    end
    object xModelo340_expedidasNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object xModelo340_expedidasADQUISICION: TIntegerField
      DisplayLabel = 'Adquisicion'
      FieldName = 'ADQUISICION'
    end
    object xModelo340_expedidasID_I: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_I'
    end
    object xModelo340_expedidasNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 60
    end
    object xModelo340_expedidasDIRECCION: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
      Size = 100
    end
    object xModelo340_expedidasC_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'C_POSTAL'
      Size = 10
    end
    object xModelo340_expedidasPROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PROVINCIA'
      Size = 40
    end
    object xModelo340_expedidasPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object xModelo340_expedidasCUENTA_PGC: TIntegerField
      DisplayLabel = 'PGC Cuenta'
      FieldName = 'CUENTA_PGC'
    end
    object xModelo340_expedidasLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xModelo340_expedidasTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object xModelo340_expedidasDEDUCIBLE: TIntegerField
      DisplayLabel = 'Deducible'
      FieldName = 'DEDUCIBLE'
    end
    object xModelo340_expedidasB_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object xModelo340_expedidasP_IVA: TFloatField
      DisplayLabel = '% IVA'
      FieldName = 'P_IVA'
    end
    object xModelo340_expedidasP_REC: TFloatField
      DisplayLabel = '% Rec.'
      FieldName = 'P_REC'
    end
    object xModelo340_expedidasI_IVA: TFloatField
      DisplayLabel = 'Imp. IVA'
      FieldName = 'I_IVA'
    end
    object xModelo340_expedidasI_REC: TFloatField
      DisplayLabel = 'Imp. Rec.'
      FieldName = 'I_REC'
    end
    object xModelo340_expedidasID_DETALLES_I: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_DETALLES_I'
    end
    object xModelo340_expedidasTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xModelo340_expedidasPAIS_C2: TFIBStringField
      DisplayLabel = 'Pais C2'
      FieldName = 'PAIS_C2'
      Size = 2
    end
    object xModelo340_expedidasPERTENECE_CEE: TIntegerField
      DisplayLabel = 'Pertenece C.E.E.'
      FieldName = 'PERTENECE_CEE'
    end
  end
  object DSxModelo340_expedidas: TDataSource
    DataSet = xModelo340_expedidas
    Left = 424
    Top = 392
  end
  object xModelo340_recibidas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      '/* OJO SE REDEFINE POR CODIGO */'
      'select * from emp_registro_iva c'
      'join emp_registro_iva_detalle d'
      'on c.id_i=d.id_i'
      'join sys_paises p'
      'on c.pais=p.pais'
      'where'
      'c.empresa=?empresa and'
      'c.ejercicio=?ejercicio and'
      'c.canal=?canal and'
      'c.signo='#39'S'#39' and'
      '((c.modo<>3) or'
      
        ' (c.modo =3 and c.doc_serie<>'#39'CI'#39' and c.signo='#39'S'#39' and c.doc_tipo' +
        ' ='#39'AFP'#39' and d.linea=2) or'
      
        ' (c.modo =3 and c.doc_serie<>'#39'CI'#39' and c.signo='#39'S'#39' and c.doc_tipo' +
        '<>'#39'AFP'#39')) and'
      'c.fecha_registro between ?DESDE and ?HASTA'
      'order by c.registro, d.linea')
    UniDirectional = False
    Left = 328
    Top = 488
    object xModelo340_recibidasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xModelo340_recibidasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xModelo340_recibidasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xModelo340_recibidasSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object xModelo340_recibidasREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object xModelo340_recibidasFECHA_REGISTRO: TDateTimeField
      DisplayLabel = 'Fec. Registro'
      FieldName = 'FECHA_REGISTRO'
    end
    object xModelo340_recibidasCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object xModelo340_recibidasDOC_NUMERO: TIntegerField
      DisplayLabel = 'Doc. Nro.'
      FieldName = 'DOC_NUMERO'
    end
    object xModelo340_recibidasDOC_SERIE: TFIBStringField
      DisplayLabel = 'Doc Serie'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object xModelo340_recibidasDOC_FECHA: TDateTimeField
      DisplayLabel = 'Fecha Doc.'
      FieldName = 'DOC_FECHA'
    end
    object xModelo340_recibidasDOC_TIPO: TFIBStringField
      DisplayLabel = 'Doc. Tipo'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object xModelo340_recibidasMODO: TIntegerField
      DisplayLabel = 'Modo'
      FieldName = 'MODO'
    end
    object xModelo340_recibidasDESCRIPCION_CTA: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION_CTA'
      Size = 150
    end
    object xModelo340_recibidasACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object xModelo340_recibidasENLACE_ASIENTO: TIntegerField
      DisplayLabel = 'Enlace Ato.'
      FieldName = 'ENLACE_ASIENTO'
    end
    object xModelo340_recibidasLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object xModelo340_recibidasS_RECARGOS: TFloatField
      DisplayLabel = 'Total Recargos'
      FieldName = 'S_RECARGOS'
    end
    object xModelo340_recibidasS_BASES: TFloatField
      DisplayLabel = 'S. Bases'
      FieldName = 'S_BASES'
    end
    object xModelo340_recibidasS_IVAS: TFloatField
      DisplayLabel = 'S. IVAs'
      FieldName = 'S_IVAS'
    end
    object xModelo340_recibidasRIG_VISIBLE: TIntegerField
      DisplayLabel = 'Reg. IVA'
      FieldName = 'RIG_VISIBLE'
    end
    object xModelo340_recibidasANYO_NATURAL: TIntegerField
      DisplayLabel = 'A'#241'o nat.'
      FieldName = 'ANYO_NATURAL'
    end
    object xModelo340_recibidasTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xModelo340_recibidasRETENCION: TFloatField
      DisplayLabel = 'Retencion'
      FieldName = 'RETENCION'
    end
    object xModelo340_recibidasLIQUIDO_TOTAL: TFloatField
      DisplayLabel = 'Liquido Total'
      FieldName = 'LIQUIDO_TOTAL'
    end
    object xModelo340_recibidasNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object xModelo340_recibidasADQUISICION: TIntegerField
      DisplayLabel = 'Adquisicion'
      FieldName = 'ADQUISICION'
    end
    object xModelo340_recibidasID_I: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_I'
    end
    object xModelo340_recibidasNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 60
    end
    object xModelo340_recibidasDIRECCION: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
      Size = 100
    end
    object xModelo340_recibidasC_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'C_POSTAL'
      Size = 10
    end
    object xModelo340_recibidasPROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PROVINCIA'
      Size = 40
    end
    object xModelo340_recibidasPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object xModelo340_recibidasCUENTA_PGC: TIntegerField
      DisplayLabel = 'PGC Cuenta'
      FieldName = 'CUENTA_PGC'
    end
    object xModelo340_recibidasLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xModelo340_recibidasTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object xModelo340_recibidasDEDUCIBLE: TIntegerField
      DisplayLabel = 'Deducible'
      FieldName = 'DEDUCIBLE'
    end
    object xModelo340_recibidasB_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object xModelo340_recibidasP_IVA: TFloatField
      DisplayLabel = '% IVA'
      FieldName = 'P_IVA'
    end
    object xModelo340_recibidasP_REC: TFloatField
      DisplayLabel = '% Rec.'
      FieldName = 'P_REC'
    end
    object xModelo340_recibidasI_IVA: TFloatField
      DisplayLabel = 'Imp. IVA'
      FieldName = 'I_IVA'
    end
    object xModelo340_recibidasI_REC: TFloatField
      DisplayLabel = 'Imp. Rec.'
      FieldName = 'I_REC'
    end
    object xModelo340_recibidasID_DETALLES_I: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_DETALLES_I'
    end
    object xModelo340_recibidasTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xModelo340_recibidasPAIS_C2: TFIBStringField
      DisplayLabel = 'Pais C2'
      FieldName = 'PAIS_C2'
      Size = 2
    end
    object xModelo340_recibidasPERTENECE_CEE: TIntegerField
      DisplayLabel = 'Pertenece C.E.E.'
      FieldName = 'PERTENECE_CEE'
    end
  end
  object DSxModelo340_recibidas: TDataSource
    DataSet = xModelo340_recibidas
    Left = 424
    Top = 488
  end
  object xModelo340_Op_Intracomunitarias: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      '/* OJO SE REDEFINE POR CODIGO */'
      'select * from emp_registro_iva c '
      'join emp_registro_iva_detalle d'
      'on c.id_i=d.id_i'
      'join sys_paises p'
      'on c.pais=p.pais '
      'where'
      '1=0 and'
      'c.empresa=?empresa and'
      'c.ejercicio=?ejercicio and'
      'c.canal=?canal and'
      'c.signo=?signo  '
      'order by c.registro,d.linea')
    UniDirectional = False
    Left = 328
    Top = 536
    object xModelo340_Op_IntracomunitariasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xModelo340_Op_IntracomunitariasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xModelo340_Op_IntracomunitariasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xModelo340_Op_IntracomunitariasSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object xModelo340_Op_IntracomunitariasREGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object xModelo340_Op_IntracomunitariasFECHA_REGISTRO: TDateTimeField
      DisplayLabel = 'Fec. Registro'
      FieldName = 'FECHA_REGISTRO'
    end
    object xModelo340_Op_IntracomunitariasCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object xModelo340_Op_IntracomunitariasDOC_NUMERO: TIntegerField
      DisplayLabel = 'Doc. Nro.'
      FieldName = 'DOC_NUMERO'
    end
    object xModelo340_Op_IntracomunitariasDOC_SERIE: TFIBStringField
      DisplayLabel = 'Doc Serie'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object xModelo340_Op_IntracomunitariasDOC_FECHA: TDateTimeField
      DisplayLabel = 'Fecha Doc.'
      FieldName = 'DOC_FECHA'
    end
    object xModelo340_Op_IntracomunitariasDOC_TIPO: TFIBStringField
      DisplayLabel = 'Doc. Tipo'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object xModelo340_Op_IntracomunitariasMODO: TIntegerField
      DisplayLabel = 'Modo'
      FieldName = 'MODO'
    end
    object xModelo340_Op_IntracomunitariasDESCRIPCION_CTA: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION_CTA'
      Size = 150
    end
    object xModelo340_Op_IntracomunitariasACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object xModelo340_Op_IntracomunitariasENLACE_ASIENTO: TIntegerField
      DisplayLabel = 'Enlace Ato.'
      FieldName = 'ENLACE_ASIENTO'
    end
    object xModelo340_Op_IntracomunitariasLIQUIDO: TFloatField
      DisplayLabel = 'Liquido'
      FieldName = 'LIQUIDO'
    end
    object xModelo340_Op_IntracomunitariasS_RECARGOS: TFloatField
      DisplayLabel = 'Total Recargos'
      FieldName = 'S_RECARGOS'
    end
    object xModelo340_Op_IntracomunitariasS_BASES: TFloatField
      DisplayLabel = 'S. Bases'
      FieldName = 'S_BASES'
    end
    object xModelo340_Op_IntracomunitariasS_IVAS: TFloatField
      DisplayLabel = 'S. IVAs'
      FieldName = 'S_IVAS'
    end
    object xModelo340_Op_IntracomunitariasRIG_VISIBLE: TIntegerField
      DisplayLabel = 'Reg. IVA'
      FieldName = 'RIG_VISIBLE'
    end
    object xModelo340_Op_IntracomunitariasANYO_NATURAL: TIntegerField
      DisplayLabel = 'A'#241'o nat.'
      FieldName = 'ANYO_NATURAL'
    end
    object xModelo340_Op_IntracomunitariasTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xModelo340_Op_IntracomunitariasRETENCION: TFloatField
      DisplayLabel = 'Retencion'
      FieldName = 'RETENCION'
    end
    object xModelo340_Op_IntracomunitariasLIQUIDO_TOTAL: TFloatField
      DisplayLabel = 'Liquido Total'
      FieldName = 'LIQUIDO_TOTAL'
    end
    object xModelo340_Op_IntracomunitariasNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object xModelo340_Op_IntracomunitariasADQUISICION: TIntegerField
      DisplayLabel = 'Adquisicion'
      FieldName = 'ADQUISICION'
    end
    object xModelo340_Op_IntracomunitariasID_I: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_I'
    end
    object xModelo340_Op_IntracomunitariasNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 60
    end
    object xModelo340_Op_IntracomunitariasDIRECCION: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIRECCION'
      Size = 100
    end
    object xModelo340_Op_IntracomunitariasC_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'C_POSTAL'
      Size = 10
    end
    object xModelo340_Op_IntracomunitariasPROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PROVINCIA'
      Size = 40
    end
    object xModelo340_Op_IntracomunitariasPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object xModelo340_Op_IntracomunitariasCUENTA_PGC: TIntegerField
      DisplayLabel = 'PGC Cuenta'
      FieldName = 'CUENTA_PGC'
    end
    object xModelo340_Op_IntracomunitariasLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xModelo340_Op_IntracomunitariasTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object xModelo340_Op_IntracomunitariasDEDUCIBLE: TIntegerField
      DisplayLabel = 'Deducible'
      FieldName = 'DEDUCIBLE'
    end
    object xModelo340_Op_IntracomunitariasB_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object xModelo340_Op_IntracomunitariasP_IVA: TFloatField
      DisplayLabel = '% IVA'
      FieldName = 'P_IVA'
    end
    object xModelo340_Op_IntracomunitariasP_REC: TFloatField
      DisplayLabel = '% Rec.'
      FieldName = 'P_REC'
    end
    object xModelo340_Op_IntracomunitariasI_IVA: TFloatField
      DisplayLabel = 'Imp. IVA'
      FieldName = 'I_IVA'
    end
    object xModelo340_Op_IntracomunitariasI_REC: TFloatField
      DisplayLabel = 'Imp. Rec.'
      FieldName = 'I_REC'
    end
    object xModelo340_Op_IntracomunitariasID_DETALLES_I: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_DETALLES_I'
    end
    object xModelo340_Op_IntracomunitariasTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xModelo340_Op_IntracomunitariasPAIS_C2: TFIBStringField
      DisplayLabel = 'Pais C2'
      FieldName = 'PAIS_C2'
      Size = 2
    end
    object xModelo340_Op_IntracomunitariasPERTENECE_CEE: TIntegerField
      DisplayLabel = 'Pertenece C.E.E.'
      FieldName = 'PERTENECE_CEE'
    end
  end
  object DSxModelo340_Op_Intracomunitarias: TDataSource
    DataSet = xModelo340_Op_Intracomunitarias
    Left = 424
    Top = 536
  end
  object frModelo340: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Modelo 340'
    RebuildPrinter = False
    OnGetValue = frModelo340GetValue
    OnBeforePrint = frModelo300EnterRect
    OnEnterRect = frModelo300EnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 40
    Top = 392
    ReportForm = {19000000}
  end
  object frxModelo340: TfrxHYReport
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
    OnBeforePrint = frxModelo110BeforePrint
    OnGetValue = frxModelo340GetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 136
    Top = 392
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object QMModelo303: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT * FROM CON_MODELO_303'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND '
      'PERIODO=?PERIODO')
    SelectSQL.Strings = (
      'SELECT * FROM CON_MODELO_303'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL'
      'ORDER BY PERIODO')
    UniDirectional = False
    Left = 328
    Top = 248
    object QMModelo303EMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMModelo303EJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMModelo303CANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMModelo303PERIODO: TFIBStringField
      DisplayLabel = 'Per'#237'odo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object QMModelo303DESCRIPCION: TFIBStringField
      DisplayLabel = 'Per'#237'odo'
      FieldName = 'DESCRIPCION'
    end
    object QMModelo303ACTIVIDAD: TIntegerField
      DisplayLabel = 'Actividad'
      FieldName = 'ACTIVIDAD'
    end
    object QMModelo303C01: TFloatField
      FieldName = 'C01'
    end
    object QMModelo303C02: TFloatField
      FieldName = 'C02'
    end
    object QMModelo303C03: TFloatField
      FieldName = 'C03'
    end
    object QMModelo303C04: TFloatField
      FieldName = 'C04'
    end
    object QMModelo303C05: TFloatField
      FieldName = 'C05'
    end
    object QMModelo303C06: TFloatField
      FieldName = 'C06'
    end
    object QMModelo303C07: TFloatField
      FieldName = 'C07'
    end
    object QMModelo303C08: TFloatField
      FieldName = 'C08'
    end
    object QMModelo303C09: TFloatField
      FieldName = 'C09'
    end
    object QMModelo303C10: TFloatField
      FieldName = 'C10'
    end
    object QMModelo303C11: TFloatField
      FieldName = 'C11'
    end
    object QMModelo303C12: TFloatField
      FieldName = 'C12'
    end
    object QMModelo303C13: TFloatField
      FieldName = 'C13'
    end
    object QMModelo303C14: TFloatField
      FieldName = 'C14'
    end
    object QMModelo303C15: TFloatField
      FieldName = 'C15'
    end
    object QMModelo303C16: TFloatField
      FieldName = 'C16'
    end
    object QMModelo303C17: TFloatField
      FieldName = 'C17'
    end
    object QMModelo303C18: TFloatField
      FieldName = 'C18'
    end
    object QMModelo303C19: TFloatField
      FieldName = 'C19'
    end
    object QMModelo303C20: TFloatField
      FieldName = 'C20'
    end
    object QMModelo303C21: TFloatField
      DisplayLabel = 'IVA Devengado'
      FieldName = 'C21'
    end
    object QMModelo303C22: TFloatField
      FieldName = 'C22'
    end
    object QMModelo303C23: TFloatField
      FieldName = 'C23'
    end
    object QMModelo303C24: TFloatField
      FieldName = 'C24'
    end
    object QMModelo303C25: TFloatField
      FieldName = 'C25'
    end
    object QMModelo303C26: TFloatField
      FieldName = 'C26'
    end
    object QMModelo303C27: TFloatField
      FieldName = 'C27'
    end
    object QMModelo303C28: TFloatField
      FieldName = 'C28'
    end
    object QMModelo303C29: TFloatField
      FieldName = 'C29'
    end
    object QMModelo303C30: TFloatField
      FieldName = 'C30'
    end
    object QMModelo303C31: TFloatField
      FieldName = 'C31'
    end
    object QMModelo303C32: TFloatField
      FieldName = 'C32'
    end
    object QMModelo303C33: TFloatField
      FieldName = 'C33'
    end
    object QMModelo303C34: TFloatField
      FieldName = 'C34'
    end
    object QMModelo303C35: TFloatField
      FieldName = 'C35'
    end
    object QMModelo303C36: TFloatField
      FieldName = 'C36'
    end
    object QMModelo303C37: TFloatField
      DisplayLabel = 'IVA Deducible'
      FieldName = 'C37'
    end
    object QMModelo303C38: TFloatField
      DisplayLabel = 'Diferencia'
      FieldName = 'C38'
    end
    object QMModelo303C39: TFloatField
      FieldName = 'C39'
    end
    object QMModelo303C40: TFloatField
      FieldName = 'C40'
    end
    object QMModelo303C41: TFloatField
      FieldName = 'C41'
    end
    object QMModelo303C42: TFloatField
      FieldName = 'C42'
    end
    object QMModelo303C43: TFloatField
      FieldName = 'C43'
    end
    object QMModelo303C44: TFloatField
      FieldName = 'C44'
    end
    object QMModelo303C45: TFloatField
      FieldName = 'C45'
    end
    object QMModelo303C46: TFloatField
      FieldName = 'C46'
    end
    object QMModelo303C47: TFloatField
      FieldName = 'C47'
    end
    object QMModelo303C48: TFloatField
      FieldName = 'C48'
    end
    object QMModelo303C49: TFloatField
      FieldName = 'C49'
    end
    object QMModelo303C50: TFloatField
      FieldName = 'C50'
    end
    object QMModelo303C51: TFloatField
      FieldName = 'C51'
    end
    object QMModelo303C52: TFloatField
      FieldName = 'C52'
    end
    object QMModelo303C53: TFloatField
      FieldName = 'C53'
    end
    object QMModelo303C54: TFloatField
      FieldName = 'C54'
    end
    object QMModelo303C55: TFloatField
      FieldName = 'C55'
    end
    object QMModelo303C56: TFloatField
      FieldName = 'C56'
    end
    object QMModelo303C57: TFloatField
      FieldName = 'C57'
    end
    object QMModelo303C58: TFloatField
      FieldName = 'C58'
    end
    object QMModelo303C59: TFloatField
      FieldName = 'C59'
    end
    object QMModelo303C60: TFloatField
      FieldName = 'C60'
    end
    object QMModelo303C61: TFloatField
      FieldName = 'C61'
    end
    object QMModelo303C62: TFloatField
      FieldName = 'C62'
    end
    object QMModelo303C63: TFloatField
      FieldName = 'C63'
    end
    object QMModelo303C64: TFloatField
      DisplayLabel = 'Diferencia'
      FieldName = 'C64'
    end
    object QMModelo303C65: TFloatField
      FieldName = 'C65'
    end
    object QMModelo303C66: TFloatField
      DisplayLabel = 'Suma de resultados atribuible a Adm. Publica'
      FieldName = 'C66'
    end
    object QMModelo303C67: TFloatField
      FieldName = 'C67'
    end
    object QMModelo303C68: TFloatField
      FieldName = 'C68'
    end
    object QMModelo303C69: TFloatField
      FieldName = 'C69'
    end
    object QMModelo303C70: TFloatField
      FieldName = 'C70'
    end
    object QMModelo303C71: TFloatField
      DisplayLabel = 'Resultado'
      FieldName = 'C71'
    end
    object QMModelo303C72: TFloatField
      FieldName = 'C72'
    end
    object QMModelo303C73: TFloatField
      FieldName = 'C73'
    end
    object QMModelo303C74: TFloatField
      FieldName = 'C74'
    end
    object QMModelo303C75: TFloatField
      FieldName = 'C75'
    end
    object QMModelo303C: TFloatField
      FieldName = 'C'
    end
    object QMModelo303C28_1: TFloatField
      FieldName = 'C28_1'
    end
    object QMModelo303C28_2: TFloatField
      FieldName = 'C28_2'
    end
    object QMModelo303C28_3: TFloatField
      FieldName = 'C28_3'
    end
    object QMModelo303C28_4: TFloatField
      FieldName = 'C28_4'
    end
    object QMModelo303C29_1: TFloatField
      FieldName = 'C29_1'
    end
    object QMModelo303C29_2: TFloatField
      FieldName = 'C29_2'
    end
    object QMModelo303C29_3: TFloatField
      FieldName = 'C29_3'
    end
    object QMModelo303C29_4: TFloatField
      FieldName = 'C29_4'
    end
    object QMModelo303C30_1: TFloatField
      FieldName = 'C30_1'
    end
    object QMModelo303C30_2: TFloatField
      FieldName = 'C30_2'
    end
    object QMModelo303C30_3: TFloatField
      FieldName = 'C30_3'
    end
    object QMModelo303C30_4: TFloatField
      FieldName = 'C30_4'
    end
    object QMModelo303C31_1: TFloatField
      FieldName = 'C31_1'
    end
    object QMModelo303C31_2: TFloatField
      FieldName = 'C31_2'
    end
    object QMModelo303C31_3: TFloatField
      FieldName = 'C31_3'
    end
    object QMModelo303C31_4: TFloatField
      FieldName = 'C31_4'
    end
    object QMModelo303C32_1: TFloatField
      FieldName = 'C32_1'
    end
    object QMModelo303C32_2: TFloatField
      FieldName = 'C32_2'
    end
    object QMModelo303C32_3: TFloatField
      FieldName = 'C32_3'
    end
    object QMModelo303C32_4: TFloatField
      FieldName = 'C32_4'
    end
    object QMModelo303C33_1: TFloatField
      FieldName = 'C33_1'
    end
    object QMModelo303C33_2: TFloatField
      FieldName = 'C33_2'
    end
    object QMModelo303C33_3: TFloatField
      FieldName = 'C33_3'
    end
    object QMModelo303C33_4: TFloatField
      FieldName = 'C33_4'
    end
    object QMModelo303C28_5: TFloatField
      FieldName = 'C28_5'
    end
    object QMModelo303C29_5: TFloatField
      FieldName = 'C29_5'
    end
    object QMModelo303C30_5: TFloatField
      FieldName = 'C30_5'
    end
    object QMModelo303C31_5: TFloatField
      FieldName = 'C31_5'
    end
    object QMModelo303C32_5: TFloatField
      FieldName = 'C32_5'
    end
    object QMModelo303C33_5: TFloatField
      FieldName = 'C33_5'
    end
    object QMModelo303C150: TFloatField
      FieldName = 'C150'
    end
    object QMModelo303C151: TFloatField
      FieldName = 'C151'
    end
    object QMModelo303C152: TFloatField
      FieldName = 'C152'
    end
    object QMModelo303C153: TFloatField
      FieldName = 'C153'
    end
    object QMModelo303C154: TFloatField
      FieldName = 'C154'
    end
    object QMModelo303C155: TFloatField
      FieldName = 'C155'
    end
    object QMModelo303C156: TFloatField
      FieldName = 'C156'
    end
    object QMModelo303C157: TFloatField
      FieldName = 'C157'
    end
    object QMModelo303C158: TFloatField
      FieldName = 'C158'
    end
    object QMModelo303C109: TFloatField
      FieldName = 'C109'
    end
    object QMModelo303C110: TFloatField
      DisplayLabel = 'Pend. Per. Ant.'
      FieldName = 'C110'
    end
    object QMModelo303C78: TFloatField
      DisplayLabel = 'A Compensar'
      FieldName = 'C78'
    end
    object QMModelo303C87: TFloatField
      DisplayLabel = 'A Compensar Pend.'
      FieldName = 'C87'
    end
    object QMModelo303C165: TFloatField
      FieldName = 'C165'
    end
    object QMModelo303C166: TFloatField
      FieldName = 'C166'
    end
    object QMModelo303C167: TFloatField
      FieldName = 'C167'
    end
    object QMModelo303C168: TFloatField
      FieldName = 'C168'
    end
    object QMModelo303C169: TFloatField
      FieldName = 'C169'
    end
    object QMModelo303C170: TFloatField
      FieldName = 'C170'
    end
    object QMModelo303C108: TFloatField
      FieldName = 'C108'
    end
    object QMModelo303C111: TFloatField
      FieldName = 'C111'
    end
    object QMModelo303C120: TFloatField
      FieldName = 'C120'
    end
    object QMModelo303C122: TFloatField
      FieldName = 'C122'
    end
    object QMModelo303C123: TFloatField
      FieldName = 'C123'
    end
    object QMModelo303C124: TFloatField
      FieldName = 'C124'
    end
  end
  object frDBxModelo303: TfrDBDataSet
    DataSource = DSxModelo303
    Left = 232
    Top = 248
  end
  object DSxModelo303: TDataSource
    DataSet = QMModelo303
    Left = 424
    Top = 248
  end
  object frModelo303: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Modelo 303'
    RebuildPrinter = False
    OnGetValue = frModelo303GetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 40
    Top = 248
    ReportForm = {19000000}
  end
  object frxModelo303: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 40192.6058694907
    ReportOptions.LastChange = 40192.6058694907
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 136
    Top = 248
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object xMod303Liquidar: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select liquidar_iva_modelo_303'
      'from emp_canales'
      
        'where ((empresa=?empresa)and(ejercicio=?ejercicio)and(canal=?can' +
        'al))')
    UniDirectional = False
    Left = 520
    Top = 248
    object xMod303LiquidarLIQUIDAR_IVA_MODELO_303: TIntegerField
      DisplayLabel = 'Liquidar IVA Moneda'
      FieldName = 'LIQUIDAR_IVA_MODELO_303'
    end
  end
  object xModelo340_expedidas_Ticket: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      '/* OJO SE REDEFINE POR CODIGO */'
      '/* xModelo340_expedidas */ '
      '/* Facutras Normales */'
      'select '
      
        'c.EMPRESA,c.EJERCICIO,c.CANAL,c.REGISTRO,d.LINEA,c.SIGNO,c.FECHA' +
        '_REGISTRO,c.CUENTA,c.DOC_NUMERO,c.DOC_SERIE,c.DOC_FECHA,c.DOC_TI' +
        'PO,'
      
        'c.MODO,c.DESCRIPCION_CTA,c.ACTIVO,c.ENLACE_ASIENTO,c.LIQUIDO,c.S' +
        '_RECARGOS,c.S_BASES,c.S_IVAS,c.RIG_VISIBLE,c.ANYO_NATURAL,c.TERC' +
        'ERO,c.RETENCION, '
      
        'c.LIQUIDO_TOTAL,c.NIF,c.ADQUISICION,c.ID_I,c.NOMBRE,c.DIRECCION,' +
        'c.C_POSTAL,c.PROVINCIA,c.PAIS,c.CUENTA_PGC, '
      
        'd.EMPRESA,d.EJERCICIO,d.CANAL,d.SIGNO,d.REGISTRO,d.TIPO_IVA,d.DE' +
        'DUCIBLE,d.B_IMPONIBLE,d.P_IVA,d.P_REC,d.I_IVA,d.I_REC,d.ID_I,d.I' +
        'D_DETALLES_I, '
      
        'p.PAIS,p.TITULO,p.PAIS_C2,p.PAIS_N3,p.CODIGO_TEL,p.IDIOMA,p.PERT' +
        'ENECE_CEE'
      'from emp_registro_iva c'
      'join emp_registro_iva_detalle d '
      'on c.id_i=d.id_i '
      'join sys_paises p '
      'on c.pais=p.pais '
      'where '
      'c.adquisicion=0 and'
      'c.empresa=:empresa and '
      'c.ejercicio=:ejercicio and '
      'c.canal=:canal and '
      'c.signo='#39'R'#39' and'
      'c.fecha_registro between ?DESDE and ?HASTA '
      ''
      'union'
      ''
      '/* Facutras Intracomunitarias FAP */'
      'select '
      
        'c.EMPRESA,c.EJERCICIO,c.CANAL,c.REGISTRO,d.LINEA,c.SIGNO,c.FECHA' +
        '_REGISTRO,c.CUENTA,f.RIG,f.SERIE,c.DOC_FECHA,c.DOC_TIPO,'
      
        'c.MODO,c.DESCRIPCION_CTA,c.ACTIVO,c.ENLACE_ASIENTO,c.LIQUIDO,c.S' +
        '_RECARGOS,c.S_BASES,c.S_IVAS,c.RIG_VISIBLE,c.ANYO_NATURAL,c.TERC' +
        'ERO,c.RETENCION, '
      
        'c.LIQUIDO_TOTAL,c.NIF,c.ADQUISICION,c.ID_I,c.NOMBRE,c.DIRECCION,' +
        'c.C_POSTAL,c.PROVINCIA,c.PAIS,c.CUENTA_PGC, '
      
        'd.EMPRESA,d.EJERCICIO,d.CANAL,d.SIGNO,d.REGISTRO,d.TIPO_IVA,d.DE' +
        'DUCIBLE,d.B_IMPONIBLE,d.P_IVA,d.P_REC,d.I_IVA,d.I_REC,d.ID_I,d.I' +
        'D_DETALLES_I, '
      
        'p.PAIS,p.TITULO,p.PAIS_C2,p.PAIS_N3,p.CODIGO_TEL,p.IDIOMA,p.PERT' +
        'ENECE_CEE'
      'from emp_registro_iva c'
      'join emp_registro_iva_detalle d '
      'on c.id_i=d.id_i '
      'join sys_paises p '
      'on c.pais=p.pais '
      'join ges_cabeceras_e_fac f'
      
        'on c.empresa=f.empresa and c.ejercicio=f.ejercicio and c.canal=f' +
        '.canal and c.doc_serie=f.serie_autofactura and c.doc_numero=f.au' +
        'tofactura'
      'where '
      'c.adquisicion=1 and'
      'c.enlace_asiento=0 and'
      'c.empresa=:empresa and '
      'c.ejercicio=:ejercicio and '
      'c.canal=:canal and '
      'c.signo='#39'R'#39' and'
      'c.fecha_registro between ?DESDE and ?HASTA '
      ''
      'union'
      ''
      '/* Facutras Intracomunitarias FCR */'
      'select '
      
        'c.EMPRESA,c.EJERCICIO,c.CANAL,c.REGISTRO,d.LINEA,c.SIGNO,c.FECHA' +
        '_REGISTRO,c.CUENTA,f.RIG,f.SERIE,c.DOC_FECHA,c.DOC_TIPO,'
      
        'c.MODO,c.DESCRIPCION_CTA,c.ACTIVO,c.ENLACE_ASIENTO,c.LIQUIDO,c.S' +
        '_RECARGOS,c.S_BASES,c.S_IVAS,c.RIG_VISIBLE,c.ANYO_NATURAL,c.TERC' +
        'ERO,c.RETENCION, '
      
        'c.LIQUIDO_TOTAL,c.NIF,c.ADQUISICION,c.ID_I,c.NOMBRE,c.DIRECCION,' +
        'c.C_POSTAL,c.PROVINCIA,c.PAIS,c.CUENTA_PGC, '
      
        'd.EMPRESA,d.EJERCICIO,d.CANAL,d.SIGNO,d.REGISTRO,d.TIPO_IVA,d.DE' +
        'DUCIBLE,d.B_IMPONIBLE,d.P_IVA,d.P_REC,d.I_IVA,d.I_REC,d.ID_I,d.I' +
        'D_DETALLES_I, '
      
        'p.PAIS,p.TITULO,p.PAIS_C2,p.PAIS_N3,p.CODIGO_TEL,p.IDIOMA,p.PERT' +
        'ENECE_CEE'
      'from emp_registro_iva c'
      'join emp_registro_iva_detalle d '
      'on c.id_i=d.id_i '
      'join sys_paises p '
      'on c.pais=p.pais '
      'join ges_cabeceras_e_fcr f'
      
        'on c.empresa=f.empresa and c.ejercicio=f.ejercicio and c.canal=f' +
        '.canal and c.doc_serie=f.serie_autofactura and c.doc_numero=f.au' +
        'tofactura'
      'where '
      'c.adquisicion=1 and'
      'c.enlace_asiento=0 and'
      'c.empresa=:empresa and '
      'c.ejercicio=:ejercicio and '
      'c.canal=:canal and '
      'c.signo='#39'R'#39' and'
      'c.fecha_registro between ?DESDE and ?HASTA '
      ''
      'union'
      ''
      '/* Facutras Intracomunitarias desde asientos */'
      'select'
      
        'c.EMPRESA,c.EJERCICIO,c.CANAL,c.REGISTRO,d.LINEA,c.SIGNO,c.FECHA' +
        '_REGISTRO,c.CUENTA,ap.DOC_NUMERO,ap.DOC_SERIE,c.DOC_FECHA,c.DOC_' +
        'TIPO,'
      
        'c.MODO,c.DESCRIPCION_CTA,c.ACTIVO,c.ENLACE_ASIENTO,c.LIQUIDO,c.S' +
        '_RECARGOS,c.S_BASES,c.S_IVAS,c.RIG_VISIBLE,c.ANYO_NATURAL,c.TERC' +
        'ERO,c.RETENCION, '
      
        'c.LIQUIDO_TOTAL,c.NIF,c.ADQUISICION,c.ID_I,c.NOMBRE,c.DIRECCION,' +
        'c.C_POSTAL,c.PROVINCIA,c.PAIS,c.CUENTA_PGC, '
      
        'd.EMPRESA,d.EJERCICIO,d.CANAL,d.SIGNO,d.REGISTRO,d.TIPO_IVA,d.DE' +
        'DUCIBLE,d.B_IMPONIBLE,d.P_IVA,d.P_REC,d.I_IVA,d.I_REC,d.ID_I,d.I' +
        'D_DETALLES_I, '
      
        'p.PAIS,p.TITULO,p.PAIS_C2,p.PAIS_N3,p.CODIGO_TEL,p.IDIOMA,p.PERT' +
        'ENECE_CEE '
      'from emp_registro_iva c'
      'join emp_registro_iva_detalle d '
      'on c.id_i=d.id_i '
      'join sys_paises p '
      'on c.pais=p.pais '
      'join con_cuentas_asientos a'
      
        'on a.empresa=c.empresa and a.ejercicio=c.ejercicio and a.canal=c' +
        '.canal and a.ric=c.enlace_asiento'
      'left join con_cuentas_apuntes ap'
      
        'on a.empresa=ap.empresa and a.ejercicio=ap.ejercicio and a.canal' +
        '=ap.canal and a.ric=ap.ric'
      'where'
      'c.adquisicion=1 and'
      'ap.linea=1 and'
      'c.enlace_asiento>0 and'
      'c.empresa=:empresa and '
      'c.ejercicio=:ejercicio and '
      'c.canal=:canal and '
      'c.signo='#39'R'#39' and'
      'c.fecha_registro between ?DESDE and ?HASTA ')
    UniDirectional = False
    Left = 328
    Top = 440
    object xModelo340_expedidas_TicketEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object xModelo340_expedidas_TicketEJERCICIO: TIntegerField
      FieldName = 'EJERCICIO'
    end
    object xModelo340_expedidas_TicketCANAL: TIntegerField
      FieldName = 'CANAL'
    end
    object xModelo340_expedidas_TicketREGISTRO: TIntegerField
      FieldName = 'REGISTRO'
    end
    object xModelo340_expedidas_TicketLINEA: TIntegerField
      FieldName = 'LINEA'
    end
    object xModelo340_expedidas_TicketSIGNO: TFIBStringField
      FieldName = 'SIGNO'
      Size = 1
    end
    object xModelo340_expedidas_TicketFECHA_REGISTRO: TDateTimeField
      FieldName = 'FECHA_REGISTRO'
    end
    object xModelo340_expedidas_TicketCUENTA: TFIBStringField
      FieldName = 'CUENTA'
      Size = 15
    end
    object xModelo340_expedidas_TicketDOC_NUMERO: TIntegerField
      FieldName = 'DOC_NUMERO'
    end
    object xModelo340_expedidas_TicketDOC_SERIE: TFIBStringField
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object xModelo340_expedidas_TicketDOC_FECHA: TDateTimeField
      FieldName = 'DOC_FECHA'
    end
    object xModelo340_expedidas_TicketDOC_TIPO: TFIBStringField
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object xModelo340_expedidas_TicketMODO: TIntegerField
      FieldName = 'MODO'
    end
    object xModelo340_expedidas_TicketDESCRIPCION_CTA: TFIBStringField
      FieldName = 'DESCRIPCION_CTA'
      Size = 150
    end
    object xModelo340_expedidas_TicketACTIVO: TIntegerField
      FieldName = 'ACTIVO'
    end
    object xModelo340_expedidas_TicketENLACE_ASIENTO: TIntegerField
      FieldName = 'ENLACE_ASIENTO'
    end
    object xModelo340_expedidas_TicketLIQUIDO: TFloatField
      FieldName = 'LIQUIDO'
    end
    object xModelo340_expedidas_TicketS_RECARGOS: TFloatField
      FieldName = 'S_RECARGOS'
    end
    object xModelo340_expedidas_TicketS_BASES: TFloatField
      FieldName = 'S_BASES'
    end
    object xModelo340_expedidas_TicketS_IVAS: TFloatField
      FieldName = 'S_IVAS'
    end
    object xModelo340_expedidas_TicketRIG_VISIBLE: TIntegerField
      FieldName = 'RIG_VISIBLE'
    end
    object xModelo340_expedidas_TicketANYO_NATURAL: TIntegerField
      FieldName = 'ANYO_NATURAL'
    end
    object xModelo340_expedidas_TicketTERCERO: TIntegerField
      FieldName = 'TERCERO'
    end
    object xModelo340_expedidas_TicketRETENCION: TFloatField
      FieldName = 'RETENCION'
    end
    object xModelo340_expedidas_TicketLIQUIDO_TOTAL: TFloatField
      FieldName = 'LIQUIDO_TOTAL'
    end
    object xModelo340_expedidas_TicketNIF: TFIBStringField
      FieldName = 'NIF'
    end
    object xModelo340_expedidas_TicketADQUISICION: TIntegerField
      FieldName = 'ADQUISICION'
    end
    object xModelo340_expedidas_TicketID_I: TIntegerField
      FieldName = 'ID_I'
    end
    object xModelo340_expedidas_TicketNOMBRE: TFIBStringField
      FieldName = 'NOMBRE'
      Size = 60
    end
    object xModelo340_expedidas_TicketDIRECCION: TFIBStringField
      FieldName = 'DIRECCION'
      Size = 100
    end
    object xModelo340_expedidas_TicketC_POSTAL: TFIBStringField
      FieldName = 'C_POSTAL'
      Size = 10
    end
    object xModelo340_expedidas_TicketPROVINCIA: TFIBStringField
      FieldName = 'PROVINCIA'
      Size = 40
    end
    object xModelo340_expedidas_TicketPAIS: TFIBStringField
      FieldName = 'PAIS'
      Size = 3
    end
    object xModelo340_expedidas_TicketCUENTA_PGC: TIntegerField
      FieldName = 'CUENTA_PGC'
    end
    object xModelo340_expedidas_TicketEMPRESA1: TIntegerField
      FieldName = 'EMPRESA1'
    end
    object xModelo340_expedidas_TicketEJERCICIO1: TIntegerField
      FieldName = 'EJERCICIO1'
    end
    object xModelo340_expedidas_TicketCANAL1: TIntegerField
      FieldName = 'CANAL1'
    end
    object xModelo340_expedidas_TicketSIGNO1: TFIBStringField
      FieldName = 'SIGNO1'
      Size = 1
    end
    object xModelo340_expedidas_TicketREGISTRO1: TIntegerField
      FieldName = 'REGISTRO1'
    end
    object xModelo340_expedidas_TicketTIPO_IVA: TIntegerField
      FieldName = 'TIPO_IVA'
    end
    object xModelo340_expedidas_TicketDEDUCIBLE: TIntegerField
      FieldName = 'DEDUCIBLE'
    end
    object xModelo340_expedidas_TicketB_IMPONIBLE: TFloatField
      FieldName = 'B_IMPONIBLE'
    end
    object xModelo340_expedidas_TicketP_IVA: TFloatField
      FieldName = 'P_IVA'
    end
    object xModelo340_expedidas_TicketP_REC: TFloatField
      FieldName = 'P_REC'
    end
    object xModelo340_expedidas_TicketI_IVA: TFloatField
      FieldName = 'I_IVA'
    end
    object xModelo340_expedidas_TicketI_REC: TFloatField
      FieldName = 'I_REC'
    end
    object xModelo340_expedidas_TicketID_I1: TIntegerField
      FieldName = 'ID_I1'
    end
    object xModelo340_expedidas_TicketID_DETALLES_I: TIntegerField
      FieldName = 'ID_DETALLES_I'
    end
    object xModelo340_expedidas_TicketPAIS1: TFIBStringField
      FieldName = 'PAIS1'
      Size = 3
    end
    object xModelo340_expedidas_TicketTITULO: TFIBStringField
      FieldName = 'TITULO'
      Size = 60
    end
    object xModelo340_expedidas_TicketPAIS_C2: TFIBStringField
      FieldName = 'PAIS_C2'
      Size = 2
    end
    object xModelo340_expedidas_TicketPAIS_N3: TFIBStringField
      FieldName = 'PAIS_N3'
      Size = 3
    end
    object xModelo340_expedidas_TicketCODIGO_TEL: TFIBStringField
      FieldName = 'CODIGO_TEL'
      Size = 4
    end
    object xModelo340_expedidas_TicketIDIOMA: TFIBStringField
      FieldName = 'IDIOMA'
      Size = 3
    end
    object xModelo340_expedidas_TicketPERTENECE_CEE: TIntegerField
      FieldName = 'PERTENECE_CEE'
    end
  end
  object DSxModelo340_expedidas_Ticket: TDataSource
    DataSet = xModelo340_expedidas_Ticket
    Left = 424
    Top = 440
  end
  object QMModelo303_C0103: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      '/*'
      'Casilla 01 y 03'
      'IVA DEVENGADO 4%'
      'Calculamos el IVA DEVENGADO, Regimen General'
      'Excluyendo los registros por Inversion de Sujeto Pasivo'
      '*/'
      
        'select i.registro, i.rig_visible, c.moneda, d.tipo_iva, d.b_impo' +
        'nible, d.i_iva, i.doc_tipo, i.doc_serie, i.doc_numero,'
      
        '       i.doc_serie || '#39'/'#39' || i.doc_numero num_factura, tt.nombre' +
        '_r_social, d.b_imponible casilla_01,'
      '       d.i_iva casilla_03'
      'from emp_registro_iva_detalle d'
      'left join emp_registro_iva i on (d.id_i = i.id_i)'
      'left join sys_modo_iva m on (i.modo = m.modo)'
      
        'left join sys_tipo_iva t on (d.tipo_iva = t.tipo and t.pais = '#39'E' +
        'SP'#39')'
      
        'left join emp_canales c on (d.empresa = c.empresa and d.ejercici' +
        'o = c.ejercicio and d.canal = c.canal)'
      
        'join ges_cabeceras_s cc on (cc.empresa = i.empresa and cc.ejerci' +
        'cio = i.ejercicio and cc.canal = i.canal and cc.serie = i.doc_se' +
        'rie and cc.tipo = i.doc_tipo and cc.rig = i.doc_numero)'
      'join ges_cabeceras_s_fac ccf on cc.id_s = ccf.id_s'
      
        'join emp_clientes a on ccf.empresa = a.empresa and cc.cliente = ' +
        'a.cliente'
      'join sys_terceros tt on a.tercero = tt.tercero'
      'where'
      'd.empresa = :empresa and'
      'd.canal = :canal and'
      'd.signo = '#39'R'#39' and'
      'm.tipo_transaccion = 0 /*transaccion_nacional*/ and'
      'm.deducible = 1 and'
      'i.fecha_registro >= :ini_periodo and'
      'i.fecha_registro <= :fin_periodo and'
      'd.inversion_sujeto_pasivo = 0 and'
      'i.doc_tipo = '#39'FAC'#39' and'
      'd.p_iva = 4 and'
      'd.b_imponible >= 0'
      'union'
      
        '-- Calculmos el IVA Devengado, Regimen General para las facturas' +
        ' de rectificacion unicamente'
      
        'select i.registro, i.rig_visible, c.moneda, d.tipo_iva, d.b_impo' +
        'nible, d.i_iva, i.doc_tipo, i.doc_serie, i.doc_numero,'
      
        '       i.doc_serie || '#39'/'#39' || i.doc_numero num_factura, tt.nombre' +
        '_r_social,'
      '       (-1) * d.b_imponible casilla_07,'
      '       (-1) * d.i_iva casilla_09'
      'from emp_registro_iva_detalle d'
      'left join emp_registro_iva i on (d.id_i = i.id_i)'
      'left join sys_modo_iva m on (i.modo = m.modo)'
      
        'left join sys_tipo_iva t on (d.tipo_iva = t.tipo and t.pais = '#39'E' +
        'SP'#39')'
      
        'left join emp_canales c on (d.empresa = c.empresa and d.ejercici' +
        'o = c.ejercicio and d.canal = c.canal)'
      
        'join ges_cabeceras_s cc on (cc.empresa = i.empresa and cc.ejerci' +
        'cio = i.ejercicio and cc.canal = i.canal and cc.serie = i.doc_se' +
        'rie and cc.tipo = i.doc_tipo and cc.rig = i.doc_numero)'
      'join ges_cabeceras_s_fac ccf on cc.id_s = ccf.id_s'
      
        'join emp_clientes a on ccf.empresa = a.empresa and cc.cliente = ' +
        'a.cliente'
      'join sys_terceros tt on a.tercero = tt.tercero'
      'where'
      'd.empresa = :empresa and'
      'd.canal = :canal and'
      'd.signo = '#39'R'#39' and'
      'm.tipo_transaccion = 0 /*transaccion_nacional*/ and'
      'm.deducible = 1 and'
      'i.fecha_registro >= :ini_periodo and'
      'i.fecha_registro <= :fin_periodo and'
      'i.doc_serie in (select s.serie'
      '                from gen_series s'
      '                where'
      '                s.empresa = :empresa and'
      '                s.rect = 1) and'
      'd.inversion_sujeto_pasivo = 0 and'
      'i.doc_tipo = '#39'FAC'#39' and'
      'd.p_iva = 4 and'
      'd.b_imponible >= 0')
    UniDirectional = False
    Left = 728
    Top = 8
    object QMModelo303_C0103REGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object QMModelo303_C0103RIG_VISIBLE: TIntegerField
      DisplayLabel = 'Reg. Visible'
      FieldName = 'RIG_VISIBLE'
    end
    object QMModelo303_C0103MONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMModelo303_C0103TIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object QMModelo303_C0103B_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object QMModelo303_C0103I_IVA: TFloatField
      DisplayLabel = 'Imp. IVA'
      FieldName = 'I_IVA'
    end
    object QMModelo303_C0103DOC_TIPO: TFIBStringField
      DisplayLabel = 'Doc. Tipo'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object QMModelo303_C0103DOC_SERIE: TFIBStringField
      DisplayLabel = 'Doc. Serie'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object QMModelo303_C0103DOC_NUMERO: TIntegerField
      DisplayLabel = 'Doc. Numero'
      FieldName = 'DOC_NUMERO'
    end
    object QMModelo303_C0103NUM_FACTURA: TFIBStringField
      DisplayLabel = 'Nro. Factura'
      FieldName = 'NUM_FACTURA'
      Size = 21
    end
    object QMModelo303_C0103NOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMModelo303_C0103CASILLA_01: TFloatField
      DisplayLabel = 'Casilla 01'
      FieldName = 'CASILLA_01'
    end
    object QMModelo303_C0103CASILLA_03: TFloatField
      DisplayLabel = 'Casilla 03'
      FieldName = 'CASILLA_03'
    end
  end
  object DSQMModelo303_C0103: TDataSource
    DataSet = QMModelo303_C0103
    Left = 856
    Top = 8
  end
  object QMModelo303_C0406: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      '/*'
      'Casilla 04 y 06'
      'IVA DEVENGADO 10%'
      'Calculamos el IVA DEVENGADO, Regimen General'
      'Excluyendo los registros por Inversion de Sujeto Pasivo'
      '*/'
      
        'select i.registro, i.rig_visible, c.moneda, d.tipo_iva, d.b_impo' +
        'nible, d.i_iva, i.doc_tipo, i.doc_serie, i.doc_numero,'
      
        '       i.doc_serie || '#39'/'#39' || i.doc_numero num_factura, tt.nombre' +
        '_r_social, d.b_imponible casilla_04,'
      '       d.i_iva casilla_06'
      'from emp_registro_iva_detalle d'
      'left join emp_registro_iva i on (d.id_i = i.id_i)'
      'left join sys_modo_iva m on (i.modo = m.modo)'
      
        'left join sys_tipo_iva t on (d.tipo_iva = t.tipo and t.pais = '#39'E' +
        'SP'#39')'
      
        'left join emp_canales c on (d.empresa = c.empresa and d.ejercici' +
        'o = c.ejercicio and d.canal = c.canal)'
      
        'join ges_cabeceras_s cc on (cc.empresa = i.empresa and cc.ejerci' +
        'cio = i.ejercicio and cc.canal = i.canal and cc.serie = i.doc_se' +
        'rie and cc.tipo = i.doc_tipo and cc.rig = i.doc_numero)'
      'join ges_cabeceras_s_fac ccf on cc.id_s = ccf.id_s'
      
        'join emp_clientes a on ccf.empresa = a.empresa and cc.cliente = ' +
        'a.cliente'
      'join sys_terceros tt on a.tercero = tt.tercero'
      'where'
      'd.empresa = :empresa and'
      'd.canal = :canal and'
      'd.signo = '#39'R'#39' and'
      'm.tipo_transaccion = 0 /*transaccion_nacional*/ and'
      'm.deducible = 1 and'
      'i.fecha_registro >= :ini_periodo and'
      'i.fecha_registro <= :fin_periodo and'
      'd.inversion_sujeto_pasivo = 0 and'
      'i.doc_tipo = '#39'FAC'#39' and'
      'd.p_iva = 10 and'
      'd.b_imponible >= 0'
      'union'
      
        '-- Calculmos el IVA Devengado, Regimen General para las facturas' +
        ' de rectificacion unicamente'
      
        'select i.registro, i.rig_visible, c.moneda, d.tipo_iva, d.b_impo' +
        'nible, d.i_iva, i.doc_tipo, i.doc_serie, i.doc_numero,'
      
        '       i.doc_serie || '#39'/'#39' || i.doc_numero num_factura, tt.nombre' +
        '_r_social,'
      '       (-1) * d.b_imponible casilla_07,'
      '       (-1) * d.i_iva casilla_09'
      'from emp_registro_iva_detalle d'
      'left join emp_registro_iva i on (d.id_i = i.id_i)'
      'left join sys_modo_iva m on (i.modo = m.modo)'
      
        'left join sys_tipo_iva t on (d.tipo_iva = t.tipo and t.pais = '#39'E' +
        'SP'#39')'
      
        'left join emp_canales c on (d.empresa = c.empresa and d.ejercici' +
        'o = c.ejercicio and d.canal = c.canal)'
      
        'join ges_cabeceras_s cc on (cc.empresa = i.empresa and cc.ejerci' +
        'cio = i.ejercicio and cc.canal = i.canal and cc.serie = i.doc_se' +
        'rie and cc.tipo = i.doc_tipo and cc.rig = i.doc_numero)'
      'join ges_cabeceras_s_fac ccf on cc.id_s = ccf.id_s'
      
        'join emp_clientes a on ccf.empresa = a.empresa and cc.cliente = ' +
        'a.cliente'
      'join sys_terceros tt on a.tercero = tt.tercero'
      'where'
      'd.empresa = :empresa and'
      'd.canal = :canal and'
      'd.signo = '#39'R'#39' and'
      'm.tipo_transaccion = 0 /*transaccion_nacional*/ and'
      'm.deducible = 1 and'
      'i.fecha_registro >= :ini_periodo and'
      'i.fecha_registro <= :fin_periodo and'
      'i.doc_serie in (select s.serie'
      '                from gen_series s'
      '                where'
      '                s.empresa = :empresa and'
      '                s.rect = 1) and'
      'd.inversion_sujeto_pasivo = 0 and'
      'i.doc_tipo = '#39'FAC'#39' and'
      'd.p_iva = 10 and'
      'd.b_imponible >= 0')
    UniDirectional = False
    Left = 728
    Top = 56
    object QMModelo303_C0406REGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object QMModelo303_C0406RIG_VISIBLE: TIntegerField
      DisplayLabel = 'Reg. Visible'
      FieldName = 'RIG_VISIBLE'
    end
    object QMModelo303_C0406MONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMModelo303_C0406TIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object QMModelo303_C0406B_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object QMModelo303_C0406I_IVA: TFloatField
      DisplayLabel = 'Imp. IVA'
      FieldName = 'I_IVA'
    end
    object QMModelo303_C0406DOC_TIPO: TFIBStringField
      DisplayLabel = 'Doc. Tipo'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object QMModelo303_C0406DOC_SERIE: TFIBStringField
      DisplayLabel = 'Doc. Serie'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object QMModelo303_C0406DOC_NUMERO: TIntegerField
      DisplayLabel = 'Doc. Numero'
      FieldName = 'DOC_NUMERO'
    end
    object QMModelo303_C0406NUM_FACTURA: TFIBStringField
      DisplayLabel = 'Nro. Factura'
      FieldName = 'NUM_FACTURA'
      Size = 22
    end
    object QMModelo303_C0406NOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMModelo303_C0406CASILLA_04: TFloatField
      DisplayLabel = 'Casilla 04'
      FieldName = 'CASILLA_04'
    end
    object QMModelo303_C0406CASILLA_06: TFloatField
      DisplayLabel = 'Casilla 06'
      FieldName = 'CASILLA_06'
    end
  end
  object DSQMModelo303_C0406: TDataSource
    DataSet = QMModelo303_C0406
    Left = 856
    Top = 56
  end
  object QMModelo303_C0709: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      '/*'
      'Casilla 07 y 09'
      'IVA DEVENGADO 21%'
      'Calculamos el IVA DEVENGADO, Regimen General'
      'Excluyendo los registros por Inversion de Sujeto Pasivo'
      '*/'
      
        'select i.registro, i.rig_visible, c.moneda, d.tipo_iva, d.b_impo' +
        'nible, d.i_iva, i.doc_tipo, i.doc_serie, i.doc_numero,'
      
        '       i.doc_serie || '#39'/'#39' || i.doc_numero num_factura, tt.nombre' +
        '_r_social, d.b_imponible casilla_07,'
      '       d.i_iva casilla_09'
      'from emp_registro_iva_detalle d'
      'left join emp_registro_iva i on (d.id_i = i.id_i)'
      'left join sys_modo_iva m on (i.modo = m.modo)'
      
        'left join sys_tipo_iva t on (d.tipo_iva = t.tipo and t.pais = '#39'E' +
        'SP'#39')'
      
        'left join emp_canales c on (d.empresa = c.empresa and d.ejercici' +
        'o = c.ejercicio and d.canal = c.canal)'
      
        'join ges_cabeceras_s cc on (cc.empresa = i.empresa and cc.ejerci' +
        'cio = i.ejercicio and cc.canal = i.canal and cc.serie = i.doc_se' +
        'rie and cc.tipo = i.doc_tipo and cc.rig = i.doc_numero)'
      'join ges_cabeceras_s_fac ccf on cc.id_s = ccf.id_s'
      
        'join emp_clientes a on ccf.empresa = a.empresa and cc.cliente = ' +
        'a.cliente'
      'join sys_terceros tt on a.tercero = tt.tercero'
      'where'
      'd.empresa = :empresa and'
      'd.canal = :canal and'
      'd.signo = '#39'R'#39' and'
      'm.tipo_transaccion = 0 /*transaccion_nacional*/ and'
      'm.deducible = 1 and'
      'i.fecha_registro >= :ini_periodo and'
      'i.fecha_registro <= :fin_periodo and'
      'd.inversion_sujeto_pasivo = 0 and'
      'i.doc_tipo = '#39'FAC'#39' and'
      'd.p_iva = 21 and'
      'd.b_imponible >= 0'
      'union'
      
        '-- Calculmos el IVA Devengado, Regimen General para las facturas' +
        ' de rectificacion unicamente'
      
        'select i.registro, i.rig_visible, c.moneda, d.tipo_iva, d.b_impo' +
        'nible, d.i_iva, i.doc_tipo, i.doc_serie, i.doc_numero,'
      
        '       i.doc_serie || '#39'/'#39' || i.doc_numero num_factura, tt.nombre' +
        '_r_social,'
      '       (-1) * d.b_imponible casilla_07,'
      '       (-1) * d.i_iva casilla_09'
      'from emp_registro_iva_detalle d'
      'left join emp_registro_iva i on (d.id_i = i.id_i)'
      'left join sys_modo_iva m on (i.modo = m.modo)'
      
        'left join sys_tipo_iva t on (d.tipo_iva = t.tipo and t.pais = '#39'E' +
        'SP'#39')'
      
        'left join emp_canales c on (d.empresa = c.empresa and d.ejercici' +
        'o = c.ejercicio and d.canal = c.canal)'
      
        'join ges_cabeceras_s cc on (cc.empresa = i.empresa and cc.ejerci' +
        'cio = i.ejercicio and cc.canal = i.canal and cc.serie = i.doc_se' +
        'rie and cc.tipo = i.doc_tipo and cc.rig = i.doc_numero)'
      'join ges_cabeceras_s_fac ccf on cc.id_s = ccf.id_s'
      
        'join emp_clientes a on ccf.empresa = a.empresa and cc.cliente = ' +
        'a.cliente'
      'join sys_terceros tt on a.tercero = tt.tercero'
      'where'
      'd.empresa = :empresa and'
      'd.canal = :canal and'
      'd.signo = '#39'R'#39' and'
      'm.tipo_transaccion = 0 /*transaccion_nacional*/ and'
      'm.deducible = 1 and'
      'i.fecha_registro >= :ini_periodo and'
      'i.fecha_registro <= :fin_periodo and'
      'i.doc_serie in (select s.serie'
      '                from gen_series s'
      '                where'
      '                s.empresa = :empresa and'
      '                s.rect = 1) and'
      'd.inversion_sujeto_pasivo = 0 and'
      'i.doc_tipo = '#39'FAC'#39' and'
      'd.p_iva = 21 and'
      'd.b_imponible >= 0')
    UniDirectional = False
    Left = 728
    Top = 104
    object QMModelo303_C0709REGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object QMModelo303_C0709RIG_VISIBLE: TIntegerField
      DisplayLabel = 'Reg. Visible'
      FieldName = 'RIG_VISIBLE'
    end
    object QMModelo303_C0709MONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMModelo303_C0709TIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object QMModelo303_C0709B_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object QMModelo303_C0709I_IVA: TFloatField
      DisplayLabel = 'Imp. IVA'
      FieldName = 'I_IVA'
    end
    object QMModelo303_C0709DOC_TIPO: TFIBStringField
      DisplayLabel = 'Doc. Tipo'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object QMModelo303_C0709DOC_SERIE: TFIBStringField
      DisplayLabel = 'Doc. Serie'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object QMModelo303_C0709DOC_NUMERO: TIntegerField
      DisplayLabel = 'Doc. Numero'
      FieldName = 'DOC_NUMERO'
    end
    object QMModelo303_C0709NUM_FACTURA: TFIBStringField
      DisplayLabel = 'Nro. Factura'
      FieldName = 'NUM_FACTURA'
      Size = 22
    end
    object QMModelo303_C0709NOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMModelo303_C0709CASILLA_07: TFloatField
      DisplayLabel = 'Casilla 07'
      FieldName = 'CASILLA_07'
    end
    object QMModelo303_C0709CASILLA_09: TFloatField
      DisplayLabel = 'Casilla 09'
      FieldName = 'CASILLA_09'
    end
  end
  object DSQMModelo303_C0709: TDataSource
    DataSet = QMModelo303_C0709
    Left = 856
    Top = 104
  end
  object QMModelo303_C1011: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      '/*'
      'Casilla 10 y 11'
      'IVA DEVENGADO'
      'Adquisiciones Intracomunitarias'
      '*/'
      
        'select i.registro, i.rig_visible, c.moneda, d.tipo_iva, d.b_impo' +
        'nible, d.i_iva, i.doc_tipo, i.doc_serie, i.doc_numero,'
      
        '       ccf.num_factura, tt.nombre_r_social, d.b_imponible casill' +
        'a_10, d.i_iva casilla_11'
      'from emp_registro_iva_detalle d'
      'left join emp_registro_iva i on (d.id_i = i.id_i)'
      'left join sys_modo_iva m on (i.modo = m.modo)'
      
        'left join sys_tipo_iva t on (d.tipo_iva = t.tipo and t.pais = '#39'E' +
        'SP'#39')'
      
        'left join emp_canales c on (d.empresa = c.empresa and d.ejercici' +
        'o = c.ejercicio and d.canal = c.canal)'
      
        'join ges_cabeceras_e cc on (cc.empresa = i.empresa and cc.ejerci' +
        'cio = i.ejercicio and cc.canal = i.canal and cc.serie = i.doc_se' +
        'rie and cc.tipo = i.doc_tipo and cc.rig = i.doc_numero)'
      'join ges_cabeceras_e_fcr ccf on cc.id_e = ccf.id_e'
      
        'join emp_acreedores a on ccf.empresa = a.empresa and ccf.acreedo' +
        'r = a.acreedor'
      'join sys_terceros tt on a.tercero = tt.tercero'
      'where'
      'd.empresa = :empresa and'
      'd.canal = :canal and'
      'd.signo = '#39'S'#39' and'
      'm.tipo_transaccion = 1 /*transaccion_intracom*/ and'
      '-- (d.i_iva > 0) and'
      'i.fecha_registro >= :ini_periodo and'
      'i.fecha_registro <= :fin_periodo and'
      'i.doc_tipo = '#39'FCR'#39
      'union'
      
        'select i.registro, i.rig_visible, c.moneda, d.tipo_iva, d.b_impo' +
        'nible, d.i_iva, i.doc_tipo, i.doc_serie, i.doc_numero,'
      
        '       ccf.num_factura, tt.nombre_r_social, d.b_imponible casill' +
        'a_10, d.i_iva casilla_11'
      'from emp_registro_iva_detalle d'
      'left join emp_registro_iva i on (d.id_i = i.id_i)'
      'left join sys_modo_iva m on (i.modo = m.modo)'
      
        'left join sys_tipo_iva t on (d.tipo_iva = t.tipo and t.pais = '#39'E' +
        'SP'#39')'
      
        'left join emp_canales c on (d.empresa = c.empresa and d.ejercici' +
        'o = c.ejercicio and d.canal = c.canal)'
      
        'join ges_cabeceras_e cc on (cc.empresa = i.empresa and cc.ejerci' +
        'cio = i.ejercicio and cc.canal = i.canal and cc.serie = i.doc_se' +
        'rie and cc.tipo = i.doc_tipo and cc.rig = i.doc_numero)'
      'join ges_cabeceras_e_fac ccf on cc.id_e = ccf.id_e'
      
        'join emp_proveedores a on ccf.empresa = a.empresa and ccf.provee' +
        'dor = a.proveedor'
      'join sys_terceros tt on a.tercero = tt.tercero'
      'where'
      'd.empresa = :empresa and'
      'd.canal = :canal and'
      'd.signo = '#39'S'#39' and'
      'm.tipo_transaccion = 1 /*transaccion_intracom*/ and'
      '-- (d.i_iva > 0) and'
      'i.fecha_registro >= :ini_periodo and'
      'i.fecha_registro <= :fin_periodo and'
      'i.doc_tipo = '#39'FAP'#39)
    UniDirectional = False
    Left = 728
    Top = 152
    object QMModelo303_C1011REGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object QMModelo303_C1011RIG_VISIBLE: TIntegerField
      DisplayLabel = 'Reg. Visible'
      FieldName = 'RIG_VISIBLE'
    end
    object QMModelo303_C1011MONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMModelo303_C1011TIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object QMModelo303_C1011B_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object QMModelo303_C1011I_IVA: TFloatField
      DisplayLabel = 'Imp. IVA'
      FieldName = 'I_IVA'
    end
    object QMModelo303_C1011DOC_TIPO: TFIBStringField
      DisplayLabel = 'Doc. Tipo'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object QMModelo303_C1011DOC_SERIE: TFIBStringField
      DisplayLabel = 'Doc. Serie'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object QMModelo303_C1011DOC_NUMERO: TIntegerField
      DisplayLabel = 'Doc. Numero'
      FieldName = 'DOC_NUMERO'
    end
    object QMModelo303_C1011NUM_FACTURA: TFIBStringField
      DisplayLabel = 'Nro. Factura'
      FieldName = 'NUM_FACTURA'
      Size = 40
    end
    object QMModelo303_C1011NOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMModelo303_C1011CASILLA_10: TFloatField
      DisplayLabel = 'Casilla 10'
      FieldName = 'CASILLA_10'
    end
    object QMModelo303_C1011CASILLA_11: TFloatField
      DisplayLabel = 'Casilla 11'
      FieldName = 'CASILLA_11'
    end
  end
  object DSQMModelo303_C1011: TDataSource
    DataSet = QMModelo303_C1011
    Left = 856
    Top = 152
  end
  object QMModelo303_C1415: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      '/*'
      'Casilla 14 y 15'
      'IVA DEVENGADO - ABONOS'
      'Calculamos el IVA DEVENGADO, Regimen General'
      'Excluyendo los registros por Inversion de Sujeto Pasivo'
      '*/'
      
        'select i.registro, i.rig_visible, c.moneda, d.tipo_iva, d.b_impo' +
        'nible, d.i_iva, i.doc_tipo, i.doc_serie, i.doc_numero,'
      
        '       i.doc_serie || '#39'/'#39' || i.doc_numero num_factura, tt.nombre' +
        '_r_social, d.b_imponible casilla_14,'
      '       d.i_iva casilla_15'
      'from emp_registro_iva_detalle d'
      'left join emp_registro_iva i on (d.id_i = i.id_i)'
      'left join sys_modo_iva m on (i.modo = m.modo)'
      
        'left join sys_tipo_iva t on (d.tipo_iva = t.tipo and t.pais = '#39'E' +
        'SP'#39')'
      
        'left join emp_canales c on (d.empresa = c.empresa and d.ejercici' +
        'o = c.ejercicio and d.canal = c.canal)'
      
        'join ges_cabeceras_s cc on (cc.empresa = i.empresa and cc.ejerci' +
        'cio = i.ejercicio and cc.canal = i.canal and cc.serie = i.doc_se' +
        'rie and cc.tipo = i.doc_tipo and cc.rig = i.doc_numero)'
      'join ges_cabeceras_s_fac ccf on cc.id_s = ccf.id_s'
      
        'join emp_clientes a on ccf.empresa = a.empresa and cc.cliente = ' +
        'a.cliente'
      'join sys_terceros tt on a.tercero = tt.tercero'
      'where'
      'd.empresa = :empresa and'
      'd.canal = :canal and'
      'd.signo = '#39'R'#39' and'
      'm.tipo_transaccion = 0 /*transaccion_nacional*/ and'
      'm.deducible = 1 and'
      'i.fecha_registro >= :ini_periodo and'
      'i.fecha_registro <= :fin_periodo and'
      'd.inversion_sujeto_pasivo = 0 and'
      'i.doc_tipo = '#39'FAC'#39' and'
      '-- d.p_iva = 21 and'
      'd.b_imponible < 0')
    UniDirectional = False
    Left = 728
    Top = 248
    object QMModelo303_C1415REGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object QMModelo303_C1415RIG_VISIBLE: TIntegerField
      DisplayLabel = 'Reg. Visible'
      FieldName = 'RIG_VISIBLE'
    end
    object QMModelo303_C1415MONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMModelo303_C1415TIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object QMModelo303_C1415B_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object QMModelo303_C1415I_IVA: TFloatField
      DisplayLabel = 'Imp. IVA'
      FieldName = 'I_IVA'
    end
    object QMModelo303_C1415DOC_TIPO: TFIBStringField
      DisplayLabel = 'Doc. Tipo'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object QMModelo303_C1415DOC_SERIE: TFIBStringField
      DisplayLabel = 'Doc. Serie'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object QMModelo303_C1415DOC_NUMERO: TIntegerField
      DisplayLabel = 'Doc. Numero'
      FieldName = 'DOC_NUMERO'
    end
    object QMModelo303_C1415NUM_FACTURA: TFIBStringField
      DisplayLabel = 'Nro. Factura'
      FieldName = 'NUM_FACTURA'
      Size = 22
    end
    object QMModelo303_C1415NOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMModelo303_C1415CASILLA_14: TFloatField
      DisplayLabel = 'Casilla 14'
      FieldName = 'CASILLA_14'
    end
    object QMModelo303_C1415CASILLA_15: TFloatField
      DisplayLabel = 'Casilla 15'
      FieldName = 'CASILLA_15'
    end
  end
  object DSQMModelo303_C1415: TDataSource
    DataSet = QMModelo303_C1415
    Left = 856
    Top = 248
  end
  object QMModelo303_C2829: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      '/*'
      'Casilla 28 y 29'
      'IVA DEDUCIBLE'
      'Operaciones Interiores Corrientes'
      '*/'
      ''
      
        'select i.registro, i.rig_visible, c.moneda, i.modo, d.tipo_iva, ' +
        'd.b_imponible, d.i_iva, i.doc_tipo, i.doc_serie,'
      '       i.doc_numero, ccf.num_factura, tt.nombre_r_social,'
      
        '       dd.b_imponible - (dd.b_imponible * dd.dto_pp / 100) casil' +
        'la_28,'
      
        '       dd.c_iva - (dd.c_iva * dd.dto_pp / 100) casilla_29, f.cue' +
        'nta_gastos, dd.articulo'
      'from emp_registro_iva_detalle d'
      'left join emp_registro_iva i on (d.id_i = i.id_i)'
      'left join sys_modo_iva m on (i.modo = m.modo)'
      
        'left join sys_tipo_iva t on (d.tipo_iva = t.tipo and t.pais = '#39'E' +
        'SP'#39')'
      
        'left join emp_canales c on (d.empresa = c.empresa and d.ejercici' +
        'o = c.ejercicio and d.canal = c.canal)'
      
        'join ges_detalles_e_fcr f on (f.empresa = i.empresa and f.ejerci' +
        'cio = i.ejercicio and f.canal = i.canal and f.serie = i.doc_seri' +
        'e and f.tipo = i.doc_tipo and f.rig = i.doc_numero)'
      'join ges_detalles_e dd on (dd.id_detalles_e = f.id_detalles_e)'
      'join ges_cabeceras_e cc on dd.id_e = cc.id_e'
      'join ges_cabeceras_e_fcr ccf on cc.id_e = ccf.id_e'
      
        'join emp_acreedores a on ccf.empresa = a.empresa and ccf.acreedo' +
        'r = a.acreedor'
      'join sys_terceros tt on a.tercero = tt.tercero'
      'where'
      'd.empresa = :empresa and'
      'd.canal = :canal and'
      'd.signo = '#39'S'#39' and'
      'm.tipo_transaccion = 0 /*transaccion_nacional*/ and'
      't.regimen = 0 and'
      'i.fecha_registro >= :ini_periodo and'
      'i.fecha_registro <= :fin_periodo and'
      'd.inversion_sujeto_pasivo = 0 and'
      't.p_iva > 0 and'
      'i.doc_tipo = '#39'FCR'#39' and'
      'f.suplido = 0 and'
      'dd.articulo = '#39'ARTIVA'#39' || d.tipo_iva and'
      '(not((f.cuenta_gastos starting with '#39'2'#39') and'
      '(f.cuenta_gastos not starting with '#39'24'#39') and'
      '(f.cuenta_gastos not starting with '#39'25'#39') and'
      '(f.cuenta_gastos not starting with '#39'26'#39'))) and'
      '((dd.b_imponible > 0) or (dd.c_iva > 0))'
      ''
      'union all'
      ''
      
        'select i.registro, i.rig_visible, c.moneda, i.modo, d.tipo_iva, ' +
        'd.b_imponible, d.i_iva, i.doc_tipo, i.doc_serie,'
      '       i.doc_numero, ccf.num_factura, tt.nombre_r_social,'
      '       -- Importes menos las lineas de bienes de inversion'
      '       (d.b_imponible - coalesce((select sum(dcf.b_dto_linea)'
      '                                  from ges_detalles_e dcf'
      '                                  where'
      '                                  i.empresa = dcf.empresa and'
      
        '                                  i.ejercicio = dcf.ejercicio an' +
        'd'
      '                                  i.canal = dcf.canal and'
      '                                  i.doc_serie = dcf.serie and'
      '                                  i.doc_tipo = dcf.tipo and'
      '                                  i.doc_numero = dcf.rig and'
      
        '                                  ((dcf.cuenta starting with '#39'2'#39 +
        ') and'
      
        '                                  (dcf.cuenta not starting with ' +
        #39'24'#39') and'
      
        '                                  (dcf.cuenta not starting with ' +
        #39'25'#39') and'
      
        '                                  (dcf.cuenta not starting with ' +
        #39'26'#39'))), 0)) casilla_28,'
      '       (d.i_iva - coalesce((select sum(dcf.c_iva)'
      '                            from ges_detalles_e dcf'
      '                            where'
      '                            i.empresa = dcf.empresa and'
      '                            i.ejercicio = dcf.ejercicio and'
      '                            i.canal = dcf.canal and'
      '                            i.doc_serie = dcf.serie and'
      '                            i.doc_tipo = dcf.tipo and'
      '                            i.doc_numero = dcf.rig and'
      '                            ((dcf.cuenta starting with '#39'2'#39') and'
      
        '                            (dcf.cuenta not starting with '#39'24'#39') ' +
        'and'
      
        '                            (dcf.cuenta not starting with '#39'25'#39') ' +
        'and'
      
        '                            (dcf.cuenta not starting with '#39'26'#39'))' +
        '), 0)) casilla_29, cast('#39#39' as varchar(15)) cuenta_gastos,'
      '       cast('#39#39' as varchar(15)) articulo'
      'from emp_registro_iva_detalle d'
      'left join emp_registro_iva i on (d.id_i = i.id_i)'
      'left join sys_modo_iva m on (i.modo = m.modo)'
      
        'left join sys_tipo_iva t on (d.tipo_iva = t.tipo and t.pais = '#39'E' +
        'SP'#39')'
      
        'left join emp_canales c on (d.empresa = c.empresa and d.ejercici' +
        'o = c.ejercicio and d.canal = c.canal)'
      
        'left join ges_cabeceras_e_fac ccf on i.empresa = ccf.empresa and' +
        ' i.ejercicio = ccf.ejercicio and i.canal = ccf.canal and i.doc_s' +
        'erie = ccf.serie and i.doc_tipo = ccf.tipo and i.doc_numero = cc' +
        'f.rig'
      'join sys_terceros tt on i.tercero = tt.tercero'
      'where'
      'd.empresa = :empresa and'
      'd.canal = :canal and'
      'd.signo = '#39'S'#39' and'
      'm.tipo_transaccion = 0 /*transaccion_nacional*/ and'
      't.regimen = 0 and'
      'i.fecha_registro >= :ini_periodo and'
      'i.fecha_registro <= :fin_periodo and'
      'd.inversion_sujeto_pasivo = 0 and'
      't.p_iva > 0 and'
      'i.doc_tipo <> '#39'FCR'#39' and'
      '((d.b_imponible > 0) or (d.i_iva > 0))'
      ''
      'union all'
      ''
      
        'select i.registro, i.rig_visible, c.moneda, i.modo, d.tipo_iva, ' +
        'd.b_imponible, d.i_iva, i.doc_tipo, i.doc_serie,'
      
        '       i.doc_numero, ccf.tipo || '#39'-'#39' || ccf.serie || '#39'/'#39' || ccf.' +
        'rig, tt.nombre_r_social,'
      '       -- Importes menos las lineas de bienes de inversion'
      '       (d.b_imponible - coalesce((select sum(b_dto_linea)'
      '                                  from ges_detalles_s dcf'
      '                                  where'
      '                                  i.empresa = dcf.empresa and'
      
        '                                  i.ejercicio = dcf.ejercicio an' +
        'd'
      '                                  i.canal = dcf.canal and'
      '                                  i.doc_serie = dcf.serie and'
      '                                  i.doc_tipo = dcf.tipo and'
      '                                  i.doc_numero = dcf.rig and'
      
        '                                  ((cuenta starting with '#39'2'#39') an' +
        'd'
      
        '                                  (cuenta not starting with '#39'24'#39 +
        ') and'
      
        '                                  (cuenta not starting with '#39'25'#39 +
        ') and'
      
        '                                  (cuenta not starting with '#39'26'#39 +
        '))), 0)) casilla_28,'
      '       (d.i_iva - coalesce((select sum(c_iva)'
      '                            from ges_detalles_s dcf'
      '                            where'
      '                            i.empresa = dcf.empresa and'
      '                            i.ejercicio = dcf.ejercicio and'
      '                            i.canal = dcf.canal and'
      '                            i.doc_serie = dcf.serie and'
      '                            i.doc_tipo = dcf.tipo and'
      '                            i.doc_numero = dcf.rig and'
      '                            ((cuenta starting with '#39'2'#39') and'
      '                            (cuenta not starting with '#39'24'#39') and'
      '                            (cuenta not starting with '#39'25'#39') and'
      
        '                            (cuenta not starting with '#39'26'#39'))), 0' +
        ')) casilla_29, cast('#39#39' as varchar(15)) cuenta_gastos,'
      '       cast('#39#39' as varchar(15)) articulo'
      'from emp_registro_iva_detalle d'
      'left join emp_registro_iva i on (d.id_i = i.id_i)'
      'left join sys_modo_iva m on (i.modo = m.modo)'
      
        'left join sys_tipo_iva t on (d.tipo_iva = t.tipo and t.pais = '#39'E' +
        'SP'#39')'
      
        'left join emp_canales c on (d.empresa = c.empresa and d.ejercici' +
        'o = c.ejercicio and d.canal = c.canal)'
      
        'left join ges_cabeceras_s ccf on i.empresa = ccf.empresa and i.e' +
        'jercicio = ccf.ejercicio and i.canal = ccf.canal and i.doc_serie' +
        ' = ccf.serie and i.doc_tipo = ccf.tipo and i.doc_numero = ccf.ri' +
        'g'
      'join sys_terceros tt on i.tercero = tt.tercero'
      'where'
      'd.empresa = :empresa and'
      'd.canal = :canal and'
      'd.signo = '#39'R'#39' and'
      'm.tipo_transaccion = 0 /*transaccion_nacional*/ and'
      'm.deducible = 1 and'
      'i.fecha_registro >= :ini_periodo and'
      'i.fecha_registro <= :fin_periodo and'
      'd.inversion_sujeto_pasivo = 1 and'
      't.p_iva > 0 and'
      'i.adquisicion = 1'
      ''
      'order by 8, 9, 10')
    UniDirectional = False
    Left = 728
    Top = 296
    object QMModelo303_C2829REGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object QMModelo303_C2829RIG_VISIBLE: TIntegerField
      DisplayLabel = 'Reg. Visible'
      FieldName = 'RIG_VISIBLE'
    end
    object QMModelo303_C2829MONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMModelo303_C2829TIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object QMModelo303_C2829B_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object QMModelo303_C2829I_IVA: TFloatField
      DisplayLabel = 'Imp. IVA'
      FieldName = 'I_IVA'
    end
    object QMModelo303_C2829DOC_TIPO: TFIBStringField
      DisplayLabel = 'Doc. Tipo'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object QMModelo303_C2829DOC_SERIE: TFIBStringField
      DisplayLabel = 'Doc. Serie'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object QMModelo303_C2829DOC_NUMERO: TIntegerField
      DisplayLabel = 'Doc. Numero'
      FieldName = 'DOC_NUMERO'
    end
    object QMModelo303_C2829NUM_FACTURA: TFIBStringField
      DisplayLabel = 'Nro. Factura'
      FieldName = 'NUM_FACTURA'
      Size = 40
    end
    object QMModelo303_C2829NOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMModelo303_C2829CASILLA_28: TFloatField
      DisplayLabel = 'Casilla 28'
      FieldName = 'CASILLA_28'
    end
    object QMModelo303_C2829CASILLA_29: TFloatField
      DisplayLabel = 'Casilla 29'
      FieldName = 'CASILLA_29'
    end
    object QMModelo303_C2829CUENTA_GASTOS: TFIBStringField
      DisplayLabel = 'Cta. Gastos'
      FieldName = 'CUENTA_GASTOS'
      Size = 15
    end
    object QMModelo303_C2829ARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMModelo303_C2829MODO: TIntegerField
      DisplayLabel = 'Modo IVA'
      FieldName = 'MODO'
    end
  end
  object DSQMModelo303_C2829: TDataSource
    DataSet = QMModelo303_C2829
    Left = 856
    Top = 296
  end
  object QMModelo303_C3031: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      '/*'
      'Casilla 30 y 31'
      'IVA DEDUCIBLE'
      'Operaciones Interiores Corrientes'
      '*/'
      
        'select i.registro, i.rig_visible, c.moneda, i.modo, d.tipo_iva, ' +
        'd.b_imponible, d.i_iva, i.doc_tipo, i.doc_serie, i.doc_numero, c' +
        'cf.num_factura,'
      
        '       tt.nombre_r_social, dd.b_imponible casilla_30, dd.c_iva c' +
        'asilla_31, f.cuenta_gastos, dd.articulo'
      'from emp_registro_iva_detalle d'
      'left join emp_registro_iva i on (d.id_i = i.id_i)'
      'left join sys_modo_iva m on (i.modo = m.modo)'
      
        'left join sys_tipo_iva t on (d.tipo_iva = t.tipo and t.pais = '#39'E' +
        'SP'#39')'
      
        'left join emp_canales c on (d.empresa = c.empresa and d.ejercici' +
        'o = c.ejercicio and d.canal = c.canal)'
      
        'join ges_detalles_e_fcr f on (f.empresa = i.empresa and f.ejerci' +
        'cio = i.ejercicio and f.canal = i.canal and f.serie = i.doc_seri' +
        'e and f.tipo = i.doc_tipo and f.rig = i.doc_numero)'
      'join ges_detalles_e dd on (dd.id_detalles_e = f.id_detalles_e)'
      'join ges_cabeceras_e cc on dd.id_e = cc.id_e'
      'join ges_cabeceras_e_fcr ccf on cc.id_e = ccf.id_e'
      
        'join emp_acreedores a on ccf.empresa = a.empresa and ccf.acreedo' +
        'r = a.acreedor'
      'join sys_terceros tt on a.tercero = tt.tercero'
      'where'
      'd.empresa = :empresa and'
      'd.canal = :canal and'
      'd.signo = '#39'S'#39' and'
      'm.tipo_transaccion = 0 /*transaccion_nacional*/ and'
      't.regimen = 0 and'
      'i.fecha_registro >= :ini_periodo and'
      'i.fecha_registro <= :fin_periodo  and'
      '-- d.inversion_sujeto_pasivo = 1 and'
      'i.doc_tipo = '#39'FCR'#39' and'
      'f.suplido = 0 and'
      'dd.articulo = '#39'ARTIVA'#39' || d.tipo_iva and'
      '('
      '    ('
      '    (f.cuenta_gastos starting with '#39'2'#39') and'
      '    (f.cuenta_gastos not starting with '#39'24'#39') and'
      '    (f.cuenta_gastos not starting with '#39'25'#39') and'
      '    (f.cuenta_gastos not starting with '#39'26'#39')'
      '    )'
      ') and'
      '((dd.b_imponible > 0) or (dd.c_iva > 0))')
    UniDirectional = False
    Left = 728
    Top = 344
    object QMModelo303_C3031REGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object QMModelo303_C3031RIG_VISIBLE: TIntegerField
      DisplayLabel = 'Reg. Visible'
      FieldName = 'RIG_VISIBLE'
    end
    object QMModelo303_C3031MONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMModelo303_C3031TIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object QMModelo303_C3031B_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object QMModelo303_C3031I_IVA: TFloatField
      DisplayLabel = 'Imp. IVA'
      FieldName = 'I_IVA'
    end
    object QMModelo303_C3031DOC_TIPO: TFIBStringField
      DisplayLabel = 'Doc. Tipo'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object QMModelo303_C3031DOC_SERIE: TFIBStringField
      DisplayLabel = 'Doc. Serie'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object QMModelo303_C3031DOC_NUMERO: TIntegerField
      DisplayLabel = 'Doc. Numero'
      FieldName = 'DOC_NUMERO'
    end
    object QMModelo303_C3031NUM_FACTURA: TFIBStringField
      DisplayLabel = 'Nro. Factura'
      FieldName = 'NUM_FACTURA'
      Size = 40
    end
    object QMModelo303_C3031NOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMModelo303_C3031CASILLA_30: TFloatField
      DisplayLabel = 'Casilla 30'
      FieldName = 'CASILLA_30'
    end
    object QMModelo303_C3031CASILLA_31: TFloatField
      DisplayLabel = 'Casilla 31'
      FieldName = 'CASILLA_31'
    end
    object QMModelo303_C3031CUENTA_GASTOS: TFIBStringField
      DisplayLabel = 'Cta. Gastos'
      FieldName = 'CUENTA_GASTOS'
      Size = 15
    end
    object QMModelo303_C3031ARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMModelo303_C3031MODO: TIntegerField
      DisplayLabel = 'Modo IVA'
      FieldName = 'MODO'
    end
  end
  object DSQMModelo303_C3031: TDataSource
    DataSet = QMModelo303_C3031
    Left = 856
    Top = 344
  end
  object QMModelo303_C3233: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      '/*'
      'Casilla 32 y 33'
      'IVA DEDUCIBLE'
      'Operaciones Interiores Corrientes'
      '*/'
      
        'select i.registro, i.rig_visible, c.moneda, i.modo, d.tipo_iva, ' +
        'd.b_imponible, d.i_iva, i.doc_tipo, i.doc_serie,'
      '       i.doc_numero, ccf.num_factura, tt.nombre_r_social,'
      '       case'
      '         when t.regimen = 1 then'
      '             case'
      '               when t.p_iva = 0 then'
      '                   0'
      '               else (dd.b_imponible * 100) / t.p_iva'
      '             end'
      '         else case'
      
        '              /* La base de importaciones ya esta contabilizada ' +
        'en la FCR (C29) y esto duplicaria el importe */'
      
        '                when m.tipo_transaccion = 2 /*transaccion_extran' +
        'je*/ then'
      '                    0'
      '                else dd.b_imponible'
      '              end'
      '       end casilla_32,'
      '       case'
      '         when t.regimen = 1 then'
      '             dd.b_imponible'
      '         else 0'
      '       end casilla_33,'
      '       f.cuenta_gastos, dd.articulo'
      'from emp_registro_iva_detalle d'
      'left join emp_registro_iva i on (d.id_i = i.id_i)'
      'left join sys_modo_iva m on (i.modo = m.modo)'
      
        'left join sys_tipo_iva t on (d.tipo_iva = t.tipo and t.pais = '#39'E' +
        'SP'#39')'
      
        'left join emp_canales c on (d.empresa = c.empresa and d.ejercici' +
        'o = c.ejercicio and d.canal = c.canal)'
      
        'join ges_detalles_e_fcr f on (f.empresa = i.empresa and f.ejerci' +
        'cio = i.ejercicio and f.canal = i.canal and f.serie = i.doc_seri' +
        'e and f.tipo = i.doc_tipo and f.rig = i.doc_numero)'
      'join ges_detalles_e dd on (dd.id_detalles_e = f.id_detalles_e)'
      'join ges_cabeceras_e cc on dd.id_e = cc.id_e'
      'join ges_cabeceras_e_fcr ccf on cc.id_e = ccf.id_e'
      
        'join emp_acreedores a on ccf.empresa = a.empresa and ccf.acreedo' +
        'r = a.acreedor'
      'join sys_terceros tt on a.tercero = tt.tercero'
      'where'
      'd.empresa = :empresa and'
      'd.canal = :canal and'
      'd.signo = '#39'S'#39' and'
      
        '((m.tipo_transaccion = 2 /*transaccion_extranje*/ ) or ((m.tipo_' +
        'transaccion = 0 /*transaccion_nacional*/ ) and'
      '(t.regimen = 1))) and'
      'i.fecha_registro >= :ini_periodo and'
      'i.fecha_registro <= :fin_periodo and'
      'd.inversion_sujeto_pasivo = 0 and'
      'i.doc_tipo = '#39'FCR'#39' and'
      'dd.articulo = '#39'ARTIVA'#39' || d.tipo_iva and'
      '(not((cuenta_gastos starting with '#39'2'#39') and'
      '(cuenta_gastos not starting with '#39'24'#39') and'
      '(cuenta_gastos not starting with '#39'25'#39') and'
      '(cuenta_gastos not starting with '#39'26'#39'))) and'
      '((dd.b_imponible > 0) or (dd.c_iva > 0))'
      'union all'
      
        'select i.registro, i.rig_visible, c.moneda, i.modo, d.tipo_iva, ' +
        'd.b_imponible, d.i_iva, i.doc_tipo, i.doc_serie,'
      '       i.doc_numero, ccf.num_factura, tt.nombre_r_social,'
      
        '       /* La base de importaciones ya esta contabilizada en la F' +
        'AP (C29) y esto duplicaria el importe */'
      
        '       cast(0 as double precision) casilla_32, d.i_iva casilla_3' +
        '3, cast('#39#39' as varchar(15)), cast('#39#39' as varchar(15))'
      'from emp_registro_iva_detalle d'
      'left join emp_registro_iva i on (d.id_i = i.id_i)'
      'left join sys_modo_iva m on (i.modo = m.modo)'
      
        'left join sys_tipo_iva t on (d.tipo_iva = t.tipo and t.pais = '#39'E' +
        'SP'#39')'
      
        'left join emp_canales c on (d.empresa = c.empresa and d.ejercici' +
        'o = c.ejercicio and d.canal = c.canal)'
      
        'left join ges_cabeceras_e_fac ccf on i.empresa = ccf.empresa and' +
        ' i.ejercicio = ccf.ejercicio and i.canal = ccf.canal and i.doc_s' +
        'erie = ccf.serie and i.doc_tipo = ccf.tipo and i.doc_numero = cc' +
        'f.rig'
      'join sys_terceros tt on i.tercero = tt.tercero'
      'where'
      'd.empresa = :empresa and'
      'd.canal = :canal and'
      'd.signo = '#39'S'#39' and'
      
        '((m.tipo_transaccion = 2 /*transaccion_extranje*/ ) or ((m.tipo_' +
        'transaccion = 0 /*transaccion_nacional*/ ) and'
      '(t.regimen = 1))) and'
      'i.fecha_registro >= :ini_periodo and'
      'i.fecha_registro <= :fin_periodo and'
      'd.inversion_sujeto_pasivo = 0 and'
      'i.doc_tipo <> '#39'FCR'#39' and'
      '((d.b_imponible > 0) or (d.i_iva > 0))')
    UniDirectional = False
    Left = 728
    Top = 392
    object QMModelo303_C3233REGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object QMModelo303_C3233RIG_VISIBLE: TIntegerField
      DisplayLabel = 'Reg. Visible'
      FieldName = 'RIG_VISIBLE'
    end
    object QMModelo303_C3233MONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMModelo303_C3233TIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object QMModelo303_C3233B_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object QMModelo303_C3233I_IVA: TFloatField
      DisplayLabel = 'Imp. IVA'
      FieldName = 'I_IVA'
    end
    object QMModelo303_C3233DOC_TIPO: TFIBStringField
      DisplayLabel = 'Doc. Tipo'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object QMModelo303_C3233DOC_SERIE: TFIBStringField
      DisplayLabel = 'Doc. Serie'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object QMModelo303_C3233DOC_NUMERO: TIntegerField
      DisplayLabel = 'Doc. Numero'
      FieldName = 'DOC_NUMERO'
    end
    object QMModelo303_C3233NUM_FACTURA: TFIBStringField
      DisplayLabel = 'Nro. Factura'
      FieldName = 'NUM_FACTURA'
      Size = 40
    end
    object QMModelo303_C3233NOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMModelo303_C3233CASILLA_32: TFloatField
      DisplayLabel = 'Casilla 32'
      FieldName = 'CASILLA_32'
    end
    object QMModelo303_C3233CASILLA_33: TFloatField
      DisplayLabel = 'Casilla 33'
      FieldName = 'CASILLA_33'
    end
    object QMModelo303_C3233CUENTA_GASTOS: TFIBStringField
      DisplayLabel = 'Cta. Gastos'
      FieldName = 'CUENTA_GASTOS'
      Size = 15
    end
    object QMModelo303_C3233ARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMModelo303_C3233MODO: TIntegerField
      DisplayLabel = 'Modo IVA'
      FieldName = 'MODO'
    end
  end
  object DSQMModelo303_C3233: TDataSource
    DataSet = QMModelo303_C3233
    Left = 856
    Top = 392
  end
  object QMModelo303_C3637: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      '/*'
      'Casilla 36 y 37'
      'IVA DEDUCIBLE'
      'Adquisiciones Intracomunitarias'
      '*/'
      
        'select i.registro, i.rig_visible, c.moneda, i.modo, d.tipo_iva, ' +
        'd.b_imponible, d.i_iva, i.doc_tipo, i.doc_serie,'
      
        '       i.doc_numero, ccf.num_factura, tt.nombre_r_social, dd.b_i' +
        'mponible casilla_36, dd.c_iva casilla_37,'
      '       f.cuenta_gastos, dd.articulo'
      'from emp_registro_iva_detalle d'
      'left join emp_registro_iva i on (d.id_i = i.id_i)'
      'left join sys_modo_iva m on (i.modo = m.modo)'
      
        'left join sys_tipo_iva t on (d.tipo_iva = t.tipo and t.pais = '#39'E' +
        'SP'#39')'
      
        'left join emp_canales c on (d.empresa = c.empresa and d.ejercici' +
        'o = c.ejercicio and d.canal = c.canal)'
      
        'join ges_detalles_e_fcr f on (f.empresa = i.empresa and f.ejerci' +
        'cio = i.ejercicio and f.canal = i.canal and f.serie = i.doc_seri' +
        'e and f.tipo = i.doc_tipo and f.rig = i.doc_numero)'
      'join ges_detalles_e dd on (dd.id_detalles_e = f.id_detalles_e)'
      'join ges_cabeceras_e cc on dd.id_e = cc.id_e'
      'join ges_cabeceras_e_fcr ccf on cc.id_e = ccf.id_e'
      
        'join emp_acreedores a on ccf.empresa = a.empresa and ccf.acreedo' +
        'r = a.acreedor'
      'join sys_terceros tt on a.tercero = tt.tercero'
      'where'
      'd.empresa = :empresa and'
      'd.canal = :canal and'
      'd.signo = '#39'S'#39' and'
      'm.tipo_transaccion = 1 /*transaccion_intracom*/ and'
      'i.fecha_registro >= :ini_periodo and'
      'i.fecha_registro <= :fin_periodo and'
      'i.doc_tipo = '#39'FCR'#39' and'
      'dd.articulo = '#39'ARTIVA'#39' || d.tipo_iva and'
      '(not((cuenta_gastos starting with '#39'2'#39') and'
      '(cuenta_gastos not starting with '#39'24'#39') and'
      '(cuenta_gastos not starting with '#39'25'#39') and'
      '(cuenta_gastos not starting with '#39'26'#39')))'
      '-- KRI_CONF59=1 deshabilita esta ultima linea'
      'and'
      '((dd.b_imponible > 0) or (dd.c_iva > 0) or (exists(select id'
      
        '                                                   from kri_conf' +
        'iguracion'
      '                                                   where'
      '                                                   id = 59 and'
      '                                                   estado = 1)))'
      'union all'
      
        'select i.registro, i.rig_visible, c.moneda, i.modo, d.tipo_iva, ' +
        'd.b_imponible, d.i_iva, i.doc_tipo, i.doc_serie,'
      
        '       i.doc_numero, ccf.num_factura, tt.nombre_r_social, d.b_im' +
        'ponible casilla_36, d.i_iva casilla_37,'
      '       cast('#39#39' as varchar(15)), cast('#39#39' as varchar(15))'
      'from emp_registro_iva_detalle d'
      'left join emp_registro_iva i on (d.id_i = i.id_i)'
      'left join sys_modo_iva m on (i.modo = m.modo)'
      
        'left join sys_tipo_iva t on (d.tipo_iva = t.tipo and t.pais = '#39'E' +
        'SP'#39')'
      
        'left join emp_canales c on (d.empresa = c.empresa and d.ejercici' +
        'o = c.ejercicio and d.canal = c.canal)'
      
        'left join ges_cabeceras_e_fac ccf on i.empresa = ccf.empresa and' +
        ' i.ejercicio = ccf.ejercicio and i.canal = ccf.canal and i.doc_s' +
        'erie = ccf.serie and i.doc_tipo = ccf.tipo and i.doc_numero = cc' +
        'f.rig'
      'join sys_terceros tt on i.tercero = tt.tercero'
      'where'
      'd.empresa = :empresa and'
      'd.canal = :canal and'
      'd.signo = '#39'S'#39' and'
      'm.tipo_transaccion = 1 /*transaccion_intracom*/ and'
      'i.fecha_registro >= :ini_periodo and'
      'i.fecha_registro <= :fin_periodo and'
      'i.doc_tipo <> '#39'FCR'#39
      '-- KRI_CONF59=1 deshabilita esta ultima linea'
      'and'
      '((d.b_imponible > 0) or (d.i_iva > 0) or (exists(select id'
      
        '                                                 from kri_config' +
        'uracion'
      '                                                 where'
      '                                                 id = 59 and'
      '                                                 estado = 1)))')
    UniDirectional = False
    Left = 728
    Top = 440
    object QMModelo303_C3637REGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object QMModelo303_C3637RIG_VISIBLE: TIntegerField
      DisplayLabel = 'Reg. Visible'
      FieldName = 'RIG_VISIBLE'
    end
    object QMModelo303_C3637MONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMModelo303_C3637TIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object QMModelo303_C3637B_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object QMModelo303_C3637I_IVA: TFloatField
      DisplayLabel = 'Imp. IVA'
      FieldName = 'I_IVA'
    end
    object QMModelo303_C3637DOC_TIPO: TFIBStringField
      DisplayLabel = 'Doc. Tipo'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object QMModelo303_C3637DOC_SERIE: TFIBStringField
      DisplayLabel = 'Doc. Serie'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object QMModelo303_C3637DOC_NUMERO: TIntegerField
      DisplayLabel = 'Doc. Numero'
      FieldName = 'DOC_NUMERO'
    end
    object QMModelo303_C3637NUM_FACTURA: TFIBStringField
      DisplayLabel = 'Nro. Factura'
      FieldName = 'NUM_FACTURA'
      Size = 40
    end
    object QMModelo303_C3637NOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMModelo303_C3637CASILLA_36: TFloatField
      DisplayLabel = 'Casilla 36'
      FieldName = 'CASILLA_36'
    end
    object QMModelo303_C3637CASILLA_37: TFloatField
      DisplayLabel = 'Casilla 37'
      FieldName = 'CASILLA_37'
    end
    object QMModelo303_C3637CUENTA_GASTOS: TFIBStringField
      DisplayLabel = 'Cta. Gastos'
      FieldName = 'CUENTA_GASTOS'
      Size = 15
    end
    object QMModelo303_C3637ARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
  end
  object DSQMModelo303_C3637: TDataSource
    DataSet = QMModelo303_C3637
    Left = 856
    Top = 440
  end
  object QMModelo303_C4041: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      '/*'
      'Casilla 40 y 41'
      'IVA DEDUCIBLE'
      '+ Operaciones Interiores Corrientes'
      '+ Importaciones'
      '+ Adquisiciones Intracomunitarias'
      '**************************'
      'VER NOTAS DE IMPORTACIONES'
      '**************************'
      '*/'
      ''
      
        '-- Calculamos el IVA DEDUCIBLE, Operaciones Interiores Corriente' +
        's'
      
        'select i.registro, i.rig_visible, c.moneda, i.modo, d.tipo_iva, ' +
        'd.b_imponible, d.i_iva, i.doc_tipo, i.doc_serie,'
      
        '       i.doc_numero, ccf.num_factura, tt.nombre_r_social, dd.b_i' +
        'mponible casilla_40, dd.c_iva casilla_41,'
      '       f.cuenta_gastos'
      'from emp_registro_iva_detalle d'
      'left join emp_registro_iva i on (d.id_i = i.id_i)'
      'left join sys_modo_iva m on (i.modo = m.modo)'
      
        'left join sys_tipo_iva t on (d.tipo_iva = t.tipo and t.pais = '#39'E' +
        'SP'#39')'
      
        'left join emp_canales c on (d.empresa = c.empresa and d.ejercici' +
        'o = c.ejercicio and d.canal = c.canal)'
      
        'join ges_detalles_e_fcr f on (f.empresa = i.empresa and f.ejerci' +
        'cio = i.ejercicio and f.canal = i.canal and f.serie = i.doc_seri' +
        'e and f.tipo = i.doc_tipo and f.rig = i.doc_numero)'
      'join ges_detalles_e dd on (dd.id_detalles_e = f.id_detalles_e)'
      'join ges_cabeceras_e cc on dd.id_e = cc.id_e'
      'join ges_cabeceras_e_fcr ccf on cc.id_e = ccf.id_e'
      
        'join emp_acreedores a on ccf.empresa = a.empresa and ccf.acreedo' +
        'r = a.acreedor'
      'join sys_terceros tt on a.tercero = tt.tercero'
      'where'
      'd.empresa = :empresa and'
      'd.canal = :canal and'
      'd.signo = '#39'S'#39' and'
      'm.tipo_transaccion = 0 /*transaccion_nacional*/ and'
      't.regimen = 0 and'
      'i.fecha_registro >= :ini_periodo and'
      'i.fecha_registro <= :fin_periodo and'
      'd.inversion_sujeto_pasivo = 0 and'
      't.p_iva > 0 and'
      'i.doc_tipo = '#39'FCR'#39' and'
      'f.suplido = 0 and'
      'dd.articulo = '#39'ARTIVA'#39' || d.tipo_iva and'
      '--f.cuenta_gastos like '#39'2%'#39' and'
      '((d.i_iva < 0) and'
      '(d.b_imponible < 0))'
      'union'
      
        'select i.registro, i.rig_visible, c.moneda, i.modo, d.tipo_iva, ' +
        'd.b_imponible, d.i_iva, i.doc_tipo, i.doc_serie,'
      
        '       i.doc_numero, cast('#39#39' as varchar(20)) num_factura, i.nomb' +
        're nombre_r_social, d.b_imponible casilla_40,'
      '       d.i_iva casilla_41, cast('#39#39' as varchar(15)) cuenta_gastos'
      'from emp_registro_iva_detalle d'
      'left join emp_registro_iva i on (d.id_i = i.id_i)'
      'left join sys_modo_iva m on (i.modo = m.modo)'
      
        'left join sys_tipo_iva t on (d.tipo_iva = t.tipo and t.pais = '#39'E' +
        'SP'#39')'
      
        'left join emp_canales c on (d.empresa = c.empresa and d.ejercici' +
        'o = c.ejercicio and d.canal = c.canal)'
      'where'
      'd.empresa = :empresa and'
      'd.canal = :canal and'
      'd.signo = '#39'S'#39' and'
      'm.tipo_transaccion = 0 /*transaccion_nacional*/ and'
      't.regimen = 0 and'
      'i.fecha_registro >= :ini_periodo and'
      'i.fecha_registro <= :fin_periodo and'
      'd.inversion_sujeto_pasivo = 0 and'
      't.p_iva > 0 and'
      'i.doc_tipo <> '#39'FCR'#39' and'
      '((d.i_iva <= 0) and'
      '(d.b_imponible <= 0))'
      'union'
      '-- Calculamos el IVA DEDUCIBLE, Importaciones'
      
        '/* *************************************************************' +
        '*****'
      
        'Aqui creo que cuando es tipo IVA aduana, las bases y los IVAS ca' +
        'mbian'
      
        '****************************************************************' +
        '** */'
      
        'select i.registro, i.rig_visible, c.moneda, i.modo, d.tipo_iva, ' +
        'd.b_imponible, d.i_iva, i.doc_tipo, i.doc_serie,'
      
        '       i.doc_numero, ccf.num_factura, tt.nombre_r_social, dd.b_i' +
        'mponible casilla_40, dd.c_iva casilla_41,'
      '       f.cuenta_gastos'
      'from emp_registro_iva_detalle d'
      'left join emp_registro_iva i on (d.id_i = i.id_i)'
      'left join sys_modo_iva m on (i.modo = m.modo)'
      
        'left join sys_tipo_iva t on (d.tipo_iva = t.tipo and t.pais = '#39'E' +
        'SP'#39')'
      
        'left join emp_canales c on (d.empresa = c.empresa and d.ejercici' +
        'o = c.ejercicio and d.canal = c.canal)'
      
        'join ges_detalles_e_fcr f on (f.empresa = i.empresa and f.ejerci' +
        'cio = i.ejercicio and f.canal = i.canal and f.serie = i.doc_seri' +
        'e and f.tipo = i.doc_tipo and f.rig = i.doc_numero)'
      'join ges_detalles_e dd on (dd.id_detalles_e = f.id_detalles_e)'
      'join ges_cabeceras_e cc on dd.id_e = cc.id_e'
      'join ges_cabeceras_e_fcr ccf on cc.id_e = ccf.id_e'
      
        'join emp_acreedores a on ccf.empresa = a.empresa and ccf.acreedo' +
        'r = a.acreedor'
      'join sys_terceros tt on a.tercero = tt.tercero'
      'where'
      'd.empresa = :empresa and'
      'd.canal = :canal and'
      'd.signo = '#39'S'#39' and'
      
        '((m.tipo_transaccion = 2 /*transaccion_extranje*/ ) or ((m.tipo_' +
        'transaccion = 0 /*transaccion_nacional*/ ) and'
      '(t.regimen = 1))) and'
      'i.fecha_registro >= :ini_periodo and'
      'i.fecha_registro <= :fin_periodo and'
      'd.inversion_sujeto_pasivo = 0 and'
      'i.doc_tipo = '#39'FCR'#39' and'
      'f.suplido = 0 and'
      'dd.articulo = '#39'ARTIVA'#39' || d.tipo_iva and'
      '--f.cuenta_gastos like '#39'2%'#39' and'
      '((d.i_iva <= 0) and'
      '(d.b_imponible <= 0))'
      'union'
      
        'select i.registro, i.rig_visible, c.moneda, i.modo, d.tipo_iva, ' +
        'd.b_imponible, d.i_iva, i.doc_tipo, i.doc_serie,'
      
        '       i.doc_numero, cast('#39#39' as varchar(20)) num_factura, i.nomb' +
        're nombre_r_social, d.b_imponible casilla_40,'
      '       d.i_iva casilla_41, cast('#39#39' as varchar(15)) cuenta_gastos'
      'from emp_registro_iva_detalle d'
      'left join emp_registro_iva i on (d.id_i = i.id_i)'
      'left join sys_modo_iva m on (i.modo = m.modo)'
      
        'left join sys_tipo_iva t on (d.tipo_iva = t.tipo and t.pais = '#39'E' +
        'SP'#39')'
      
        'left join emp_canales c on (d.empresa = c.empresa and d.ejercici' +
        'o = c.ejercicio and d.canal = c.canal)'
      'where'
      'd.empresa = :empresa and'
      'd.canal = :canal and'
      'd.signo = '#39'S'#39' and'
      '('
      '--(m.tipo_transaccion = 2 /*transaccion_extranje*/) or'
      '((m.tipo_transaccion = 0 /*transaccion_nacional*/ ) and'
      '(t.regimen = 1))) and'
      'i.fecha_registro >= :ini_periodo and'
      'i.fecha_registro <= :fin_periodo and'
      'd.inversion_sujeto_pasivo = 0 and'
      'i.doc_tipo <> '#39'FCR'#39' and'
      '((d.i_iva <= 0) and'
      
        '(d.b_imponible <= 0)) -- (not ((d.c_iva > 0) or (d.b_imponible >' +
        ' 0)))'
      'union'
      '-- Calculamos el IVA DEDUCIBLE, Adquisiciones Intracomunitarias'
      
        'select i.registro, i.rig_visible, c.moneda, i.modo, d.tipo_iva, ' +
        'd.b_imponible, d.i_iva, i.doc_tipo, i.doc_serie,'
      
        '       i.doc_numero, cast('#39#39' as varchar(20)) num_factura, i.nomb' +
        're nombre_r_social, 0 /*b_imponible*/ casilla_40,'
      '       d.i_iva casilla_41, f.cuenta_gastos'
      'from emp_registro_iva_detalle d'
      'left join emp_registro_iva i on (d.id_i = i.id_i)'
      'left join sys_modo_iva m on (i.modo = m.modo)'
      
        'left join sys_tipo_iva t on (d.tipo_iva = t.tipo and t.pais = '#39'E' +
        'SP'#39')'
      
        'left join emp_canales c on (d.empresa = c.empresa and d.ejercici' +
        'o = c.ejercicio and d.canal = c.canal)'
      
        'join ges_detalles_e_fcr f on (f.empresa = i.empresa and f.ejerci' +
        'cio = i.ejercicio and f.canal = i.canal and f.serie = i.doc_seri' +
        'e and f.tipo = i.doc_tipo and f.rig = i.doc_numero)'
      'join ges_detalles_e dd on (dd.id_detalles_e = f.id_detalles_e)'
      'join ges_cabeceras_e cc on dd.id_e = cc.id_e'
      'join ges_cabeceras_e_fcr ccf on cc.id_e = ccf.id_e'
      
        'join emp_acreedores a on ccf.empresa = a.empresa and ccf.acreedo' +
        'r = a.acreedor'
      'join sys_terceros tt on a.tercero = tt.tercero'
      'where'
      'd.empresa = :empresa and'
      'd.canal = :canal and'
      'd.signo = '#39'S'#39' and'
      'm.tipo_transaccion = 1 /*transaccion_intracom*/ and'
      'i.fecha_registro >= :ini_periodo and'
      'i.fecha_registro <= :fin_periodo and'
      'i.doc_tipo = '#39'FCR'#39' and'
      'f.suplido = 0 and'
      '((d.i_iva <= 0) and'
      '(d.b_imponible <= 0) and'
      '(exists(select id'
      '        from kri_configuracion'
      '        where'
      '        id = 59 and'
      '        estado = 0)))'
      '/* KRI_CONF59=0 agregaria registros de facturas de proveedor.'
      'union'
      
        'select i.registro, i.rig_visible, c.moneda, i.modo_iva, d.tipo_i' +
        'va, d.b_imponible, d.i_iva, i.doc_tipo, i.doc_serie, i.doc_numer' +
        'o,  cast('#39#39' as varchar(20)) num_factura,'
      
        '       i.nombre nombre_r_social, d.b_imponible casilla_40, d.i_i' +
        'va casilla_41, cast(varchar(15)) as cuenta_gastos'
      'from emp_registro_iva_detalle d'
      'left join emp_registro_iva i on (d.id_i = i.id_i)'
      'left join sys_modo_iva m on (i.modo = m.modo)'
      
        'left join sys_tipo_iva t on (d.tipo_iva = t.tipo and t.pais = '#39'E' +
        'SP'#39')'
      
        'left join emp_canales c on (d.empresa = c.empresa and d.ejercici' +
        'o = c.ejercicio and d.canal = c.canal)'
      'where'
      'd.empresa = :empresa and'
      'd.canal = :canal and'
      'd.signo = '#39'S'#39' and'
      'm.tipo_transaccion = 1 /-transaccion_intracom-/ and'
      'i.fecha_registro >= :ini_periodo and'
      'i.fecha_registro <= :fin_periodo and'
      'i.doc_tipo <> '#39'FCR'#39' and'
      '((dd.c_iva <= 0) and (dd.b_imponible <= 0))'
      '*/')
    UniDirectional = False
    Left = 728
    Top = 488
    object QMModelo303_C4041REGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object QMModelo303_C4041RIG_VISIBLE: TIntegerField
      DisplayLabel = 'Reg. Visible'
      FieldName = 'RIG_VISIBLE'
    end
    object QMModelo303_C4041MONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMModelo303_C4041TIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object QMModelo303_C4041B_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object QMModelo303_C4041I_IVA: TFloatField
      DisplayLabel = 'Imp. IVA'
      FieldName = 'I_IVA'
    end
    object QMModelo303_C4041DOC_TIPO: TFIBStringField
      DisplayLabel = 'Doc. Tipo'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object QMModelo303_C4041DOC_SERIE: TFIBStringField
      DisplayLabel = 'Doc. Serie'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object QMModelo303_C4041DOC_NUMERO: TIntegerField
      DisplayLabel = 'Doc. Numero'
      FieldName = 'DOC_NUMERO'
    end
    object QMModelo303_C4041NUM_FACTURA: TFIBStringField
      DisplayLabel = 'Nro. Factura'
      FieldName = 'NUM_FACTURA'
      Size = 40
    end
    object QMModelo303_C4041NOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMModelo303_C4041CASILLA_40: TFloatField
      DisplayLabel = 'Casilla 40'
      FieldName = 'CASILLA_40'
    end
    object QMModelo303_C4041CASILLA_41: TFloatField
      DisplayLabel = 'Casilla 41'
      FieldName = 'CASILLA_41'
    end
    object QMModelo303_C4041MODO: TIntegerField
      DisplayLabel = 'Modo IVA'
      FieldName = 'MODO'
    end
    object QMModelo303_C4041CUENTA_GASTOS: TFIBStringField
      DisplayLabel = 'Cta. Gastos'
      FieldName = 'CUENTA_GASTOS'
      Size = 15
    end
  end
  object DSQMModelo303_C4041: TDataSource
    DataSet = QMModelo303_C4041
    Left = 856
    Top = 488
  end
  object QMModelo303_C59: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      '/*'
      'Casilla 59'
      'IVA DEDUCIBLE, Entregas Comunitarias'
      '*/'
      
        'select i.registro, i.rig_visible, c.moneda, d.tipo_iva, d.b_impo' +
        'nible, d.i_iva, i.doc_tipo, i.doc_serie, i.doc_numero,'
      
        '       i.doc_serie || '#39'/'#39' || i.doc_numero num_factura, tt.nombre' +
        '_r_social, d.b_imponible casilla_59'
      'from emp_registro_iva_detalle d'
      'left join emp_registro_iva i on (d.id_i = i.id_i)'
      'left join sys_modo_iva m on (i.modo = m.modo)'
      
        'left join emp_canales c on (d.empresa = c.empresa and d.ejercici' +
        'o = c.ejercicio and d.canal = c.canal)'
      'left join sys_terceros tt on i.tercero = tt.tercero'
      'where'
      'd.empresa = :empresa and'
      'd.canal = :canal and'
      'd.signo = '#39'R'#39' and'
      'm.tipo_transaccion = 1 /*transaccion_intracom*/ and'
      'd.i_iva = 0 and'
      'i.fecha_registro >= :ini_periodo and'
      'i.fecha_registro <= :fin_periodo'
      'union'
      
        'select ir.registro, ir.rig_visible, cr.moneda, d.tipo_iva, dr.b_' +
        'imponible, dr.i_iva, ir.doc_tipo, ir.doc_serie,'
      
        '       ir.doc_numero, ir.doc_serie || '#39'/'#39' || ir.doc_numero num_f' +
        'actura, tt.nombre_r_social,'
      '       (-1) * dr.b_imponible casilla_59'
      'from emp_registro_iva_detalle d'
      'left join emp_registro_iva i on (d.id_i = i.id_i)'
      'left join sys_modo_iva m on (i.modo = m.modo)'
      
        'left join emp_canales c on (d.empresa = c.empresa and d.ejercici' +
        'o = c.ejercicio and d.canal = c.canal)'
      
        'join ges_cabeceras_s_fac f on i.empresa = f.empresa and i.ejerci' +
        'cio = f.ejercicio and i.canal = f.canal and i.doc_serie = f.seri' +
        'e and i.doc_numero = f.rig and f.tipo = '#39'FAC'#39
      'join ges_cabeceras_s_fac r on (f.id_s = r.id_rect)'
      
        'join emp_registro_iva ir on (f.empresa = ir.empresa and f.ejerci' +
        'cio = ir.ejercicio and f.canal = ir.canal and f.rir = ir.registr' +
        'o and ir.signo = '#39'R'#39')'
      'join emp_registro_iva_detalle dr on (ir.id_i = dr.id_i)'
      
        'left join emp_canales cr on (dr.empresa = cr.empresa and dr.ejer' +
        'cicio = cr.ejercicio and dr.canal = cr.canal)'
      'left join sys_terceros tt on ir.tercero = tt.tercero'
      'where'
      'd.empresa = :empresa and'
      'd.canal = :canal and'
      'd.signo = '#39'R'#39' and'
      'm.tipo_transaccion = 1 /*transaccion_intracom*/ and'
      'd.i_iva = 0 and'
      'i.fecha_registro >= :ini_periodo and'
      'i.fecha_registro <= :fin_periodo')
    UniDirectional = False
    Left = 728
    Top = 536
    object QMModelo303_C59REGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object QMModelo303_C59RIG_VISIBLE: TIntegerField
      DisplayLabel = 'Reg. Visible'
      FieldName = 'RIG_VISIBLE'
    end
    object QMModelo303_C59MONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMModelo303_C59TIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object QMModelo303_C59B_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object QMModelo303_C59I_IVA: TFloatField
      DisplayLabel = 'Imp. IVA'
      FieldName = 'I_IVA'
    end
    object QMModelo303_C59DOC_TIPO: TFIBStringField
      DisplayLabel = 'Doc. Tipo'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object QMModelo303_C59DOC_SERIE: TFIBStringField
      DisplayLabel = 'Doc. Serie'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object QMModelo303_C59DOC_NUMERO: TIntegerField
      DisplayLabel = 'Doc. Numero'
      FieldName = 'DOC_NUMERO'
    end
    object QMModelo303_C59NUM_FACTURA: TFIBStringField
      DisplayLabel = 'Nro. Factura'
      FieldName = 'NUM_FACTURA'
      Size = 22
    end
    object QMModelo303_C59NOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMModelo303_C59CASILLA_59: TFloatField
      DisplayLabel = 'Casilla 59'
      FieldName = 'CASILLA_59'
    end
  end
  object DSQMModelo303_C59: TDataSource
    DataSet = QMModelo303_C59
    Left = 856
    Top = 536
  end
  object QMModelo303_C60: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      '/*'
      'Casilla 60'
      'Exportaciones y operaciones asimiladas'
      '*/'
      
        'select i.registro, i.rig_visible, c.moneda, d.tipo_iva, d.b_impo' +
        'nible, d.i_iva, i.doc_tipo, i.doc_serie, i.doc_numero,'
      
        '       i.doc_serie || '#39'/'#39' || i.doc_numero num_factura, tt.nombre' +
        '_r_social, d.b_imponible casilla_60'
      'from emp_registro_iva_detalle d'
      'left join emp_registro_iva i on (d.id_i = i.id_i)'
      'left join sys_modo_iva m on (i.modo = m.modo)'
      
        'left join emp_canales c on (d.empresa = c.empresa and d.ejercici' +
        'o = c.ejercicio and d.canal = c.canal)'
      'left join sys_terceros tt on i.tercero = tt.tercero'
      'where'
      'd.empresa = :empresa and'
      'd.canal = :canal and'
      'd.signo = '#39'R'#39' and'
      'm.tipo_transaccion = 2 /*transaccion_extranjero*/ and'
      'i.fecha_registro >= :ini_periodo and'
      'i.fecha_registro <= :fin_periodo')
    UniDirectional = False
    Left = 728
    Top = 584
    object QMModelo303_C60REGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object QMModelo303_C60RIG_VISIBLE: TIntegerField
      DisplayLabel = 'Reg. Visible'
      FieldName = 'RIG_VISIBLE'
    end
    object QMModelo303_C60MONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMModelo303_C60TIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object QMModelo303_C60B_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object QMModelo303_C60I_IVA: TFloatField
      DisplayLabel = 'Imp. IVA'
      FieldName = 'I_IVA'
    end
    object QMModelo303_C60DOC_TIPO: TFIBStringField
      DisplayLabel = 'Doc. Tipo'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object QMModelo303_C60DOC_SERIE: TFIBStringField
      DisplayLabel = 'Doc. Serie'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object QMModelo303_C60DOC_NUMERO: TIntegerField
      DisplayLabel = 'Doc. Numero'
      FieldName = 'DOC_NUMERO'
    end
    object QMModelo303_C60NUM_FACTURA: TFIBStringField
      DisplayLabel = 'Nro. Factura'
      FieldName = 'NUM_FACTURA'
      Size = 22
    end
    object QMModelo303_C60NOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMModelo303_C60CASILLA_60: TFloatField
      DisplayLabel = 'Casilla 60'
      FieldName = 'CASILLA_60'
    end
  end
  object DSQMModelo303_C60: TDataSource
    DataSet = QMModelo303_C60
    Left = 856
    Top = 584
  end
  object QMModelo303_C61: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      '/*'
      'Casilla 61'
      
        'Operaciones no sujetas o con inv. del sujeto pasivo que originan' +
        ' el derecho a deduccion'
      '*/'
      
        'select i.registro, i.rig_visible, c.moneda, d.tipo_iva, d.b_impo' +
        'nible, d.i_iva, i.doc_tipo, i.doc_serie, i.doc_numero,'
      
        '       i.doc_serie || '#39'/'#39' || i.doc_numero num_factura, tt.nombre' +
        '_r_social, d.b_imponible casilla_61'
      'from emp_registro_iva_detalle d'
      'left join emp_registro_iva i on (d.id_i = i.id_i)'
      'left join sys_modo_iva m on (i.modo = m.modo)'
      
        'left join emp_canales c on (d.empresa = c.empresa and d.ejercici' +
        'o = c.ejercicio and d.canal = c.canal)'
      'left join sys_terceros tt on i.tercero = tt.tercero'
      'where'
      'd.empresa = :empresa and'
      'd.canal = :canal and'
      'd.signo = '#39'R'#39' and'
      'm.tipo_transaccion = 0 /*transaccion_nacinal*/ and'
      '-- Solo tengo en cuenta BASE IMPONIBLE NO DEDUCIBLE'
      'm.deducible = 0 and'
      '-- -----------------------------------------------------'
      '-- Ambos IVAS. Excento con Inv. Suj. Pasivo (chatarrero)'
      '-- m.iva = 1 and'
      '-- -----------------------------------------------------'
      'i.fecha_registro >= :ini_periodo and'
      'i.fecha_registro <= :fin_periodo and'
      'd.inversion_sujeto_pasivo = 0 and'
      'i.adquisicion = 0'
      'union'
      
        'select i.registro, i.rig_visible, c.moneda, d.tipo_iva, d.b_impo' +
        'nible, d.i_iva, i.doc_tipo, i.doc_serie, i.doc_numero,'
      
        '       i.doc_serie || '#39'/'#39' || i.doc_numero num_factura, tt.nombre' +
        '_r_social, d.b_imponible casilla_61'
      'from emp_registro_iva_detalle d'
      'left join emp_registro_iva i on (d.id_i = i.id_i)'
      'left join sys_modo_iva m on (i.modo = m.modo)'
      
        'left join emp_canales c on (d.empresa = c.empresa and d.ejercici' +
        'o = c.ejercicio and d.canal = c.canal)'
      'left join sys_terceros tt on i.tercero = tt.tercero'
      'where'
      'd.empresa = :empresa and'
      'd.canal = :canal and'
      'd.signo = '#39'R'#39' and'
      'm.tipo_transaccion = 0 /*transaccion_nacinal*/ and'
      '-- Solo tengo en cuenta BASE IMPONIBLE NO DEDUCIBLE'
      'm.deducible = 1 and'
      '-- -----------------------------------------------------'
      '-- Ambos IVAS. Excento con Inv. Suj. Pasivo (chatarrero)'
      '-- m.iva = 1 and'
      '-- -----------------------------------------------------'
      'i.fecha_registro >= :ini_periodo and'
      'i.fecha_registro <= :fin_periodo and'
      'd.inversion_sujeto_pasivo = 1 and'
      'i.adquisicion = 0')
    UniDirectional = False
    Left = 728
    Top = 632
    object QMModelo303_C61REGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object QMModelo303_C61RIG_VISIBLE: TIntegerField
      DisplayLabel = 'Reg. Visible'
      FieldName = 'RIG_VISIBLE'
    end
    object QMModelo303_C61MONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMModelo303_C61TIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object QMModelo303_C61B_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object QMModelo303_C61I_IVA: TFloatField
      DisplayLabel = 'Imp. IVA'
      FieldName = 'I_IVA'
    end
    object QMModelo303_C61DOC_TIPO: TFIBStringField
      DisplayLabel = 'Doc. Tipo'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object QMModelo303_C61DOC_SERIE: TFIBStringField
      DisplayLabel = 'Doc. Serie'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object QMModelo303_C61DOC_NUMERO: TIntegerField
      DisplayLabel = 'Doc. Numero'
      FieldName = 'DOC_NUMERO'
    end
    object QMModelo303_C61NUM_FACTURA: TFIBStringField
      DisplayLabel = 'Nro. Factura'
      FieldName = 'NUM_FACTURA'
      Size = 22
    end
    object QMModelo303_C61NOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMModelo303_C61CASILLA_61: TFloatField
      DisplayLabel = 'Casilla 61'
      FieldName = 'CASILLA_61'
    end
  end
  object DSQMModelo303_C61: TDataSource
    DataSet = QMModelo303_C61
    Left = 856
    Top = 632
  end
  object QMModelo303_C1213: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      '/*'
      'Casilla 12'
      
        'Calculamos el IVA DEVENGADO, Otras operaciones con inversion del' +
        ' sujeto pasivo'
      '*/'
      
        'select i.registro, i.rig_visible, c.moneda, d.tipo_iva, d.b_impo' +
        'nible, d.i_iva, i.doc_tipo, i.doc_serie, i.doc_numero,'
      
        '       i.doc_serie || '#39'/'#39' || i.doc_numero num_factura, tt.nombre' +
        '_r_social, d.b_imponible casilla_12,'
      '       d.i_iva casilla_13'
      'from emp_registro_iva_detalle d'
      'left join emp_registro_iva i on (d.id_i = i.id_i)'
      'left join sys_modo_iva m on (i.modo = m.modo)'
      
        'left join emp_canales c on (d.empresa = c.empresa and d.ejercici' +
        'o = c.ejercicio and d.canal = c.canal)'
      'left join sys_terceros tt on i.tercero = tt.tercero'
      'where'
      'd.empresa = :empresa and'
      'd.canal = :canal and'
      'd.signo = '#39'R'#39' and'
      'm.tipo_transaccion = 0 /*transaccion_nacional*/ and'
      '-- Solo tengo en cuenta IVA deducible'
      'm.deducible = 1 and'
      'm.iva = 1 and'
      'i.fecha_registro >= :ini_periodo and'
      'i.fecha_registro <= :fin_periodo and'
      'd.inversion_sujeto_pasivo = 1 and'
      'i.adquisicion = 1')
    UniDirectional = False
    Left = 728
    Top = 200
    object QMModelo303_C1213REGISTRO: TIntegerField
      DisplayLabel = 'Registro'
      FieldName = 'REGISTRO'
    end
    object QMModelo303_C1213RIG_VISIBLE: TIntegerField
      DisplayLabel = 'Reg. Visible'
      FieldName = 'RIG_VISIBLE'
    end
    object QMModelo303_C1213MONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMModelo303_C1213TIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object QMModelo303_C1213B_IMPONIBLE: TFloatField
      DisplayLabel = 'B. Imponible'
      FieldName = 'B_IMPONIBLE'
    end
    object QMModelo303_C1213I_IVA: TFloatField
      DisplayLabel = 'Imp. IVA'
      FieldName = 'I_IVA'
    end
    object QMModelo303_C1213DOC_TIPO: TFIBStringField
      DisplayLabel = 'Doc. Tipo'
      FieldName = 'DOC_TIPO'
      Size = 3
    end
    object QMModelo303_C1213DOC_SERIE: TFIBStringField
      DisplayLabel = 'Doc. Serie'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object QMModelo303_C1213DOC_NUMERO: TIntegerField
      DisplayLabel = 'Doc. Numero'
      FieldName = 'DOC_NUMERO'
    end
    object QMModelo303_C1213NUM_FACTURA: TFIBStringField
      DisplayLabel = 'Nro. Factura'
      FieldName = 'NUM_FACTURA'
      Size = 22
    end
    object QMModelo303_C1213NOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMModelo303_C1213CASILLA_12: TFloatField
      DisplayLabel = 'Casilla 12'
      FieldName = 'CASILLA_12'
    end
    object QMModelo303_C1213CASILLA_13: TFloatField
      DisplayLabel = 'Casilla 13'
      FieldName = 'CASILLA_13'
    end
  end
  object DSQMModelo303_C1213: TDataSource
    DataSet = QMModelo303_C1213
    Left = 856
    Top = 200
  end
  object QMModelo390: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CON_MODELO_390'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  PERIODO=?old_PERIODO ')
    InsertSQL.Strings = (
      'INSERT INTO CON_MODELO_390'
      
        '  (C01,C02,C03,C04,C05,C06,C07,C08,C09,C10,C11,C12,C13,C14,C15,C' +
        '16,C17,C18,C19,C20,C21,C22,C23,C24,C25,C26,C27,C28,C29,C30,C31,C' +
        '32,C33,C34,C35,C36,C37,C38,C39,C40,C41,C42,C43,C44,C45,C46,C47,C' +
        '48,C,C49,C50,C51,C52,C53,C54,C55,C56,C57,C58,C59,C60,C61,C62,C63' +
        ',C64,C65,C66,C67,C68,C69,C70,C71,C72,C73,C74,C75,C76,C77,C78,C79' +
        ',C80,C81,C82,C83,C84,C85,C86,C87,C88,C89,C90,C91,C92,C93,C94,C95' +
        ',C96,C97,C98,C99,C100,C101,C102,C103,C104,C105,C106,C107,C108,C1' +
        '09,C110,C111,C112,C113,C115,C116,C117,C118,C139,C140,C141,C142,C' +
        '143,C144,C145,C146,C147,C148,C149,C150,C151,C152,C153,C154,C155,' +
        'C156,C157,C158,C159,C160,C161,C162,C163,C164,C165,C166,C167,C168' +
        ',C169,C170,C171,C172,C173,C174,C175,C176,C177,C178,C179,C180,C18' +
        '1,C182,C183,C184,C185,C186,C187,C188,C189,C190,C191,C196,C197,C2' +
        '02,C203,C208,C209,C214,C215,C220,C221,C227,C228,C230,C231,C232,C' +
        '500,C501,C502,C503,C504,C505,C506,C507,C512,C513,C514,C515,C520,' +
        'C521,C522,C523,C524,C525,C526,C545,C546,C547,C548,C551,C552,C587' +
        ',C588,C597,C598,C599,C600,C601,C602,C603,C604,C605,C606,C607,C60' +
        '8,C609,C610,C611,C612,C613,C614,C615,C616,C617,C618,C619,C620,C6' +
        '21,C622,C623,C624,C625,C626,C627,C628,C629,C630,C631,C632,C633,C' +
        '634,C635,C636,C637,C638,C639,C640,C641,C642,C643,C644,C645,C646,' +
        'C647,C648,C649,C650,C651,C652,C653,C654,C655,C656,C657,C658,C659' +
        ',C660,C661,C662,EMPRESA,EJERCICIO,CANAL,PERIODO,DESCRIPCION,ACTI' +
        'VIDAD,C114,C125,C126,C127,C128)'
      'VALUES'
      
        '  (?C01,?C02,?C03,?C04,?C05,?C06,?C07,?C08,?C09,?C10,?C11,?C12,?' +
        'C13,?C14,?C15,?C16,?C17,?C18,?C19,?C20,?C21,?C22,?C23,?C24,?C25,' +
        '?C26,?C27,?C28,?C29,?C30,?C31,?C32,?C33,?C34,?C35,?C36,?C37,?C38' +
        ',?C39,?C40,?C41,?C42,?C43,?C44,?C45,?C46,?C47,?C48,?C,?C49,?C50,' +
        '?C51,?C52,?C53,?C54,?C55,?C56,?C57,?C58,?C59,?C60,?C61,?C62,?C63' +
        ',?C64,?C65,?C66,?C67,?C68,?C69,?C70,?C71,?C72,?C73,?C74,?C75,?C7' +
        '6,?C77,?C78,?C79,?C80,?C81,?C82,?C83,?C84,?C85,?C86,?C87,?C88,?C' +
        '89,?C90,?C91,?C92,?C93,?C94,?C95,?C96,?C97,?C98,?C99,?C100,?C101' +
        ',?C102,?C103,?C104,?C105,?C106,?C107,?C108,?C109,?C110,?C111,?C1' +
        '12,?C113,?C115,?C116,?C117,?C118,?C139,?C140,?C141,?C142,?C143,?' +
        'C144,?C145,?C146,?C147,?C148,?C149,?C150,?C151,?C152,?C153,?C154' +
        ',?C155,?C156,?C157,?C158,?C159,?C160,?C161,?C162,?C163,?C164,?C1' +
        '65,?C166,?C167,?C168,?C169,?C170,?C171,?C172,?C173,?C174,?C175,?' +
        'C176,?C177,?C178,?C179,?C180,?C181,?C182,?C183,?C184,?C185,?C186' +
        ',?C187,?C188,?C189,?C190,?C191,?C196,?C197,?C202,?C203,?C208,?C2' +
        '09,?C214,?C215,?C220,?C221,?C227,?C228,?C230,?C231,?C232,?C500,?' +
        'C501,?C502,?C503,?C504,?C505,?C506,?C507,?C512,?C513,?C514,?C515' +
        ',?C520,?C521,?C522,?C523,?C524,?C525,?C526,?C545,?C546,?C547,?C5' +
        '48,?C551,?C552,?C587,?C588,?C597,?C598,?C599,?C600,?C601,?C602,?' +
        'C603,?C604,?C605,?C606,?C607,?C608,?C609,?C610,?C611,?C612,?C613' +
        ',?C614,?C615,?C616,?C617,?C618,?C619,?C620,?C621,?C622,?C623,?C6' +
        '24,?C625,?C626,?C627,?C628,?C629,?C630,?C631,?C632,?C633,?C634,?' +
        'C635,?C636,?C637,?C638,?C639,?C640,?C641,?C642,?C643,?C644,?C645' +
        ',?C646,?C647,?C648,?C649,?C650,?C651,?C652,?C653,?C654,?C655,?C6' +
        '56,?C657,?C658,?C659,?C660,?C661,?C662,?EMPRESA,?EJERCICIO,?CANA' +
        'L,?PERIODO,?DESCRIPCION,?ACTIVIDAD,?C114,?C125,?C126,?C127,?C128' +
        ')')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM CON_MODELO_390'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  PERIODO=?PERIODO ')
    SelectSQL.Strings = (
      'SELECT * FROM CON_MODELO_390'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL'
      'ORDER BY PERIODO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CON_MODELO_390'
      'SET'
      '  C01=?C01 '
      '  ,C02=?C02 '
      '  ,C03=?C03 '
      '  ,C04=?C04 '
      '  ,C05=?C05 '
      '  ,C06=?C06 '
      '  ,C07=?C07 '
      '  ,C08=?C08 '
      '  ,C09=?C09 '
      '  ,C10=?C10 '
      '  ,C11=?C11 '
      '  ,C12=?C12 '
      '  ,C13=?C13 '
      '  ,C14=?C14 '
      '  ,C15=?C15 '
      '  ,C16=?C16 '
      '  ,C17=?C17 '
      '  ,C18=?C18 '
      '  ,C19=?C19 '
      '  ,C20=?C20 '
      '  ,C21=?C21 '
      '  ,C22=?C22 '
      '  ,C23=?C23 '
      '  ,C24=?C24 '
      '  ,C25=?C25 '
      '  ,C26=?C26 '
      '  ,C27=?C27 '
      '  ,C28=?C28 '
      '  ,C29=?C29 '
      '  ,C30=?C30 '
      '  ,C31=?C31 '
      '  ,C32=?C32 '
      '  ,C33=?C33 '
      '  ,C34=?C34 '
      '  ,C35=?C35 '
      '  ,C36=?C36 '
      '  ,C37=?C37 '
      '  ,C38=?C38 '
      '  ,C39=?C39 '
      '  ,C40=?C40 '
      '  ,C41=?C41 '
      '  ,C42=?C42 '
      '  ,C43=?C43 '
      '  ,C44=?C44 '
      '  ,C45=?C45 '
      '  ,C46=?C46 '
      '  ,C47=?C47 '
      '  ,C48=?C48 '
      '  ,C=?C '
      '  ,C49=?C49 '
      '  ,C50=?C50 '
      '  ,C51=?C51 '
      '  ,C52=?C52 '
      '  ,C53=?C53 '
      '  ,C54=?C54 '
      '  ,C55=?C55 '
      '  ,C56=?C56 '
      '  ,C57=?C57 '
      '  ,C58=?C58 '
      '  ,C59=?C59 '
      '  ,C60=?C60 '
      '  ,C61=?C61 '
      '  ,C62=?C62 '
      '  ,C63=?C63 '
      '  ,C64=?C64 '
      '  ,C65=?C65 '
      '  ,C66=?C66 '
      '  ,C67=?C67 '
      '  ,C68=?C68 '
      '  ,C69=?C69 '
      '  ,C70=?C70 '
      '  ,C71=?C71 '
      '  ,C72=?C72 '
      '  ,C73=?C73 '
      '  ,C74=?C74 '
      '  ,C75=?C75 '
      '  ,C76=?C76 '
      '  ,C77=?C77 '
      '  ,C78=?C78 '
      '  ,C79=?C79 '
      '  ,C80=?C80 '
      '  ,C81=?C81 '
      '  ,C82=?C82 '
      '  ,C83=?C83 '
      '  ,C84=?C84 '
      '  ,C85=?C85 '
      '  ,C86=?C86 '
      '  ,C87=?C87 '
      '  ,C88=?C88 '
      '  ,C89=?C89 '
      '  ,C90=?C90 '
      '  ,C91=?C91 '
      '  ,C92=?C92 '
      '  ,C93=?C93 '
      '  ,C94=?C94 '
      '  ,C95=?C95 '
      '  ,C96=?C96 '
      '  ,C97=?C97 '
      '  ,C98=?C98 '
      '  ,C99=?C99 '
      '  ,C100=?C100 '
      '  ,C101=?C101 '
      '  ,C102=?C102 '
      '  ,C103=?C103 '
      '  ,C104=?C104 '
      '  ,C105=?C105 '
      '  ,C106=?C106 '
      '  ,C107=?C107 '
      '  ,C108=?C108 '
      '  ,C109=?C109 '
      '  ,C110=?C110 '
      '  ,C111=?C111 '
      '  ,C112=?C112 '
      '  ,C113=?C113 '
      '  ,C115=?C115 '
      '  ,C116=?C116 '
      '  ,C117=?C117 '
      '  ,C118=?C118 '
      '  ,C139=?C139 '
      '  ,C140=?C140 '
      '  ,C141=?C141 '
      '  ,C142=?C142 '
      '  ,C143=?C143 '
      '  ,C144=?C144 '
      '  ,C145=?C145 '
      '  ,C146=?C146 '
      '  ,C147=?C147 '
      '  ,C148=?C148 '
      '  ,C149=?C149 '
      '  ,C150=?C150 '
      '  ,C151=?C151 '
      '  ,C152=?C152 '
      '  ,C153=?C153 '
      '  ,C154=?C154 '
      '  ,C155=?C155 '
      '  ,C156=?C156 '
      '  ,C157=?C157 '
      '  ,C158=?C158 '
      '  ,C159=?C159 '
      '  ,C160=?C160 '
      '  ,C161=?C161 '
      '  ,C162=?C162 '
      '  ,C163=?C163 '
      '  ,C164=?C164 '
      '  ,C165=?C165 '
      '  ,C166=?C166 '
      '  ,C167=?C167 '
      '  ,C168=?C168 '
      '  ,C169=?C169 '
      '  ,C170=?C170 '
      '  ,C171=?C171 '
      '  ,C172=?C172 '
      '  ,C173=?C173 '
      '  ,C174=?C174 '
      '  ,C175=?C175 '
      '  ,C176=?C176 '
      '  ,C177=?C177 '
      '  ,C178=?C178 '
      '  ,C179=?C179 '
      '  ,C180=?C180 '
      '  ,C181=?C181 '
      '  ,C182=?C182 '
      '  ,C183=?C183 '
      '  ,C184=?C184 '
      '  ,C185=?C185 '
      '  ,C186=?C186 '
      '  ,C187=?C187 '
      '  ,C188=?C188 '
      '  ,C189=?C189 '
      '  ,C190=?C190 '
      '  ,C191=?C191 '
      '  ,C196=?C196 '
      '  ,C197=?C197 '
      '  ,C202=?C202 '
      '  ,C203=?C203 '
      '  ,C208=?C208 '
      '  ,C209=?C209 '
      '  ,C214=?C214 '
      '  ,C215=?C215 '
      '  ,C220=?C220 '
      '  ,C221=?C221 '
      '  ,C227=?C227 '
      '  ,C228=?C228 '
      '  ,C230=?C230 '
      '  ,C231=?C231 '
      '  ,C232=?C232 '
      '  ,C500=?C500 '
      '  ,C501=?C501 '
      '  ,C502=?C502 '
      '  ,C503=?C503 '
      '  ,C504=?C504 '
      '  ,C505=?C505 '
      '  ,C506=?C506 '
      '  ,C507=?C507 '
      '  ,C512=?C512 '
      '  ,C513=?C513 '
      '  ,C514=?C514 '
      '  ,C515=?C515 '
      '  ,C520=?C520 '
      '  ,C521=?C521 '
      '  ,C522=?C522 '
      '  ,C523=?C523 '
      '  ,C524=?C524 '
      '  ,C525=?C525 '
      '  ,C526=?C526 '
      '  ,C545=?C545 '
      '  ,C546=?C546 '
      '  ,C547=?C547 '
      '  ,C548=?C548 '
      '  ,C551=?C551 '
      '  ,C552=?C552 '
      '  ,C587=?C587 '
      '  ,C588=?C588 '
      '  ,C597=?C597 '
      '  ,C598=?C598 '
      '  ,C599=?C599 '
      '  ,C600=?C600 '
      '  ,C601=?C601 '
      '  ,C602=?C602 '
      '  ,C603=?C603 '
      '  ,C604=?C604 '
      '  ,C605=?C605 '
      '  ,C606=?C606 '
      '  ,C607=?C607 '
      '  ,C608=?C608 '
      '  ,C609=?C609 '
      '  ,C610=?C610 '
      '  ,C611=?C611 '
      '  ,C612=?C612 '
      '  ,C613=?C613 '
      '  ,C614=?C614 '
      '  ,C615=?C615 '
      '  ,C616=?C616 '
      '  ,C617=?C617 '
      '  ,C618=?C618 '
      '  ,C619=?C619 '
      '  ,C620=?C620 '
      '  ,C621=?C621 '
      '  ,C622=?C622 '
      '  ,C623=?C623 '
      '  ,C624=?C624 '
      '  ,C625=?C625 '
      '  ,C626=?C626 '
      '  ,C627=?C627 '
      '  ,C628=?C628 '
      '  ,C629=?C629 '
      '  ,C630=?C630 '
      '  ,C631=?C631 '
      '  ,C632=?C632 '
      '  ,C633=?C633 '
      '  ,C634=?C634 '
      '  ,C635=?C635 '
      '  ,C636=?C636 '
      '  ,C637=?C637 '
      '  ,C638=?C638 '
      '  ,C639=?C639 '
      '  ,C640=?C640 '
      '  ,C641=?C641 '
      '  ,C642=?C642 '
      '  ,C643=?C643 '
      '  ,C644=?C644 '
      '  ,C645=?C645 '
      '  ,C646=?C646 '
      '  ,C647=?C647 '
      '  ,C648=?C648 '
      '  ,C649=?C649 '
      '  ,C650=?C650 '
      '  ,C651=?C651 '
      '  ,C652=?C652 '
      '  ,C653=?C653 '
      '  ,C654=?C654 '
      '  ,C655=?C655 '
      '  ,C656=?C656 '
      '  ,C657=?C657 '
      '  ,C658=?C658 '
      '  ,C659=?C659 '
      '  ,C660=?C660 '
      '  ,C661=?C661 '
      '  ,C662=?C662 '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,ACTIVIDAD=?ACTIVIDAD '
      '  ,C114=?C114 '
      '  ,C125=?C125 '
      '  ,C126=?C126 '
      '  ,C127=?C127 '
      '  ,C128=?C128 '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  PERIODO=?PERIODO ')
    AfterOpen = QMModelo390AfterOpen
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'PERIODO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CON_MODELO_390'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 328
    Top = 680
    object QMModelo390EMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object QMModelo390EJERCICIO: TIntegerField
      FieldName = 'EJERCICIO'
    end
    object QMModelo390CANAL: TIntegerField
      FieldName = 'CANAL'
    end
    object QMModelo390PERIODO: TFIBStringField
      FieldName = 'PERIODO'
      Size = 2
    end
    object QMModelo390DESCRIPCION: TFIBStringField
      FieldName = 'DESCRIPCION'
    end
    object QMModelo390ACTIVIDAD: TIntegerField
      FieldName = 'ACTIVIDAD'
    end
    object QMModelo390C01: TFloatField
      FieldName = 'C01'
    end
    object QMModelo390C02: TFloatField
      FieldName = 'C02'
    end
    object QMModelo390C03: TFloatField
      FieldName = 'C03'
    end
    object QMModelo390C04: TFloatField
      FieldName = 'C04'
    end
    object QMModelo390C05: TFloatField
      FieldName = 'C05'
    end
    object QMModelo390C06: TFloatField
      FieldName = 'C06'
    end
    object QMModelo390C07: TFloatField
      FieldName = 'C07'
    end
    object QMModelo390C08: TFloatField
      FieldName = 'C08'
    end
    object QMModelo390C09: TFloatField
      FieldName = 'C09'
    end
    object QMModelo390C10: TFloatField
      FieldName = 'C10'
    end
    object QMModelo390C11: TFloatField
      FieldName = 'C11'
    end
    object QMModelo390C12: TFloatField
      FieldName = 'C12'
    end
    object QMModelo390C13: TFloatField
      FieldName = 'C13'
    end
    object QMModelo390C14: TFloatField
      FieldName = 'C14'
    end
    object QMModelo390C15: TFloatField
      FieldName = 'C15'
    end
    object QMModelo390C16: TFloatField
      FieldName = 'C16'
    end
    object QMModelo390C17: TFloatField
      FieldName = 'C17'
    end
    object QMModelo390C18: TFloatField
      FieldName = 'C18'
    end
    object QMModelo390C19: TFloatField
      FieldName = 'C19'
    end
    object QMModelo390C20: TFloatField
      FieldName = 'C20'
    end
    object QMModelo390C21: TFloatField
      FieldName = 'C21'
    end
    object QMModelo390C22: TFloatField
      FieldName = 'C22'
    end
    object QMModelo390C23: TFloatField
      FieldName = 'C23'
    end
    object QMModelo390C24: TFloatField
      FieldName = 'C24'
    end
    object QMModelo390C25: TFloatField
      FieldName = 'C25'
    end
    object QMModelo390C26: TFloatField
      FieldName = 'C26'
    end
    object QMModelo390C27: TFloatField
      FieldName = 'C27'
    end
    object QMModelo390C28: TFloatField
      FieldName = 'C28'
    end
    object QMModelo390C29: TFloatField
      FieldName = 'C29'
    end
    object QMModelo390C30: TFloatField
      FieldName = 'C30'
    end
    object QMModelo390C31: TFloatField
      FieldName = 'C31'
    end
    object QMModelo390C32: TFloatField
      FieldName = 'C32'
    end
    object QMModelo390C33: TFloatField
      FieldName = 'C33'
    end
    object QMModelo390C34: TFloatField
      FieldName = 'C34'
    end
    object QMModelo390C35: TFloatField
      FieldName = 'C35'
    end
    object QMModelo390C36: TFloatField
      FieldName = 'C36'
    end
    object QMModelo390C37: TFloatField
      FieldName = 'C37'
    end
    object QMModelo390C38: TFloatField
      FieldName = 'C38'
    end
    object QMModelo390C39: TFloatField
      FieldName = 'C39'
    end
    object QMModelo390C40: TFloatField
      FieldName = 'C40'
    end
    object QMModelo390C41: TFloatField
      FieldName = 'C41'
    end
    object QMModelo390C42: TFloatField
      FieldName = 'C42'
    end
    object QMModelo390C43: TFloatField
      FieldName = 'C43'
    end
    object QMModelo390C44: TFloatField
      FieldName = 'C44'
    end
    object QMModelo390C45: TFloatField
      FieldName = 'C45'
    end
    object QMModelo390C46: TFloatField
      FieldName = 'C46'
    end
    object QMModelo390C47: TFloatField
      FieldName = 'C47'
    end
    object QMModelo390C48: TFloatField
      FieldName = 'C48'
    end
    object QMModelo390C: TFloatField
      FieldName = 'C'
    end
    object QMModelo390C49: TFloatField
      FieldName = 'C49'
    end
    object QMModelo390C50: TFloatField
      FieldName = 'C50'
    end
    object QMModelo390C51: TFloatField
      FieldName = 'C51'
    end
    object QMModelo390C52: TFloatField
      FieldName = 'C52'
    end
    object QMModelo390C53: TFloatField
      FieldName = 'C53'
    end
    object QMModelo390C54: TFloatField
      FieldName = 'C54'
    end
    object QMModelo390C55: TFloatField
      FieldName = 'C55'
    end
    object QMModelo390C56: TFloatField
      FieldName = 'C56'
    end
    object QMModelo390C57: TFloatField
      FieldName = 'C57'
    end
    object QMModelo390C58: TFloatField
      FieldName = 'C58'
    end
    object QMModelo390C59: TFloatField
      FieldName = 'C59'
    end
    object QMModelo390C60: TFloatField
      FieldName = 'C60'
    end
    object QMModelo390C61: TFloatField
      FieldName = 'C61'
    end
    object QMModelo390C62: TFloatField
      FieldName = 'C62'
    end
    object QMModelo390C63: TFloatField
      FieldName = 'C63'
    end
    object QMModelo390C64: TFloatField
      FieldName = 'C64'
    end
    object QMModelo390C65: TFloatField
      FieldName = 'C65'
    end
    object QMModelo390C66: TFloatField
      FieldName = 'C66'
    end
    object QMModelo390C67: TFloatField
      FieldName = 'C67'
    end
    object QMModelo390C68: TFloatField
      FieldName = 'C68'
    end
    object QMModelo390C69: TFloatField
      FieldName = 'C69'
    end
    object QMModelo390C70: TFloatField
      FieldName = 'C70'
    end
    object QMModelo390C71: TFloatField
      FieldName = 'C71'
    end
    object QMModelo390C72: TFloatField
      FieldName = 'C72'
    end
    object QMModelo390C73: TFloatField
      FieldName = 'C73'
    end
    object QMModelo390C74: TFloatField
      FieldName = 'C74'
    end
    object QMModelo390C75: TFloatField
      FieldName = 'C75'
    end
    object QMModelo390C76: TFloatField
      FieldName = 'C76'
    end
    object QMModelo390C77: TFloatField
      FieldName = 'C77'
    end
    object QMModelo390C78: TFloatField
      FieldName = 'C78'
    end
    object QMModelo390C79: TFloatField
      FieldName = 'C79'
    end
    object QMModelo390C80: TFloatField
      FieldName = 'C80'
    end
    object QMModelo390C81: TFloatField
      FieldName = 'C81'
    end
    object QMModelo390C82: TFloatField
      FieldName = 'C82'
    end
    object QMModelo390C83: TFloatField
      FieldName = 'C83'
    end
    object QMModelo390C84: TFloatField
      FieldName = 'C84'
    end
    object QMModelo390C85: TFloatField
      FieldName = 'C85'
    end
    object QMModelo390C86: TFloatField
      FieldName = 'C86'
    end
    object QMModelo390C87: TFloatField
      FieldName = 'C87'
    end
    object QMModelo390C88: TFloatField
      FieldName = 'C88'
    end
    object QMModelo390C89: TFloatField
      FieldName = 'C89'
    end
    object QMModelo390C90: TFloatField
      FieldName = 'C90'
    end
    object QMModelo390C91: TFloatField
      FieldName = 'C91'
    end
    object QMModelo390C92: TFloatField
      FieldName = 'C92'
    end
    object QMModelo390C93: TFloatField
      FieldName = 'C93'
    end
    object QMModelo390C94: TFloatField
      FieldName = 'C94'
    end
    object QMModelo390C95: TFloatField
      FieldName = 'C95'
    end
    object QMModelo390C96: TFloatField
      FieldName = 'C96'
    end
    object QMModelo390C97: TFloatField
      FieldName = 'C97'
    end
    object QMModelo390C98: TFloatField
      FieldName = 'C98'
    end
    object QMModelo390C99: TFloatField
      FieldName = 'C99'
    end
    object QMModelo390C100: TFloatField
      FieldName = 'C100'
    end
    object QMModelo390C101: TFloatField
      FieldName = 'C101'
    end
    object QMModelo390C102: TFloatField
      FieldName = 'C102'
    end
    object QMModelo390C103: TFloatField
      FieldName = 'C103'
    end
    object QMModelo390C104: TFloatField
      FieldName = 'C104'
    end
    object QMModelo390C105: TFloatField
      FieldName = 'C105'
    end
    object QMModelo390C106: TFloatField
      FieldName = 'C106'
    end
    object QMModelo390C107: TFloatField
      FieldName = 'C107'
    end
    object QMModelo390C108: TFloatField
      FieldName = 'C108'
    end
    object QMModelo390C109: TFloatField
      FieldName = 'C109'
    end
    object QMModelo390C110: TFloatField
      FieldName = 'C110'
    end
    object QMModelo390C111: TFloatField
      FieldName = 'C111'
    end
    object QMModelo390C112: TFloatField
      FieldName = 'C112'
    end
    object QMModelo390C113: TFloatField
      FieldName = 'C113'
    end
    object QMModelo390C114: TFIBStringField
      FieldName = 'C114'
      Size = 3
    end
    object QMModelo390C115: TFloatField
      FieldName = 'C115'
    end
    object QMModelo390C116: TFloatField
      FieldName = 'C116'
    end
    object QMModelo390C117: TFIBStringField
      FieldName = 'C117'
      Size = 2
    end
    object QMModelo390C118: TFloatField
      FieldName = 'C118'
    end
    object QMModelo390C139: TFloatField
      FieldName = 'C139'
    end
    object QMModelo390C140: TFloatField
      FieldName = 'C140'
    end
    object QMModelo390C141: TFloatField
      FieldName = 'C141'
    end
    object QMModelo390C142: TFloatField
      FieldName = 'C142'
    end
    object QMModelo390C143: TFloatField
      FieldName = 'C143'
    end
    object QMModelo390C144: TFloatField
      FieldName = 'C144'
    end
    object QMModelo390C145: TFloatField
      FieldName = 'C145'
    end
    object QMModelo390C146: TFloatField
      FieldName = 'C146'
    end
    object QMModelo390C147: TFloatField
      FieldName = 'C147'
    end
    object QMModelo390C148: TFloatField
      FieldName = 'C148'
    end
    object QMModelo390C149: TFloatField
      FieldName = 'C149'
    end
    object QMModelo390C150: TFloatField
      FieldName = 'C150'
    end
    object QMModelo390C151: TFloatField
      FieldName = 'C151'
    end
    object QMModelo390C152: TFloatField
      FieldName = 'C152'
    end
    object QMModelo390C153: TFloatField
      FieldName = 'C153'
    end
    object QMModelo390C154: TFloatField
      FieldName = 'C154'
    end
    object QMModelo390C155: TFloatField
      FieldName = 'C155'
    end
    object QMModelo390C156: TFloatField
      FieldName = 'C156'
    end
    object QMModelo390C157: TFloatField
      FieldName = 'C157'
    end
    object QMModelo390C158: TFloatField
      FieldName = 'C158'
    end
    object QMModelo390C159: TFloatField
      FieldName = 'C159'
    end
    object QMModelo390C160: TFloatField
      FieldName = 'C160'
    end
    object QMModelo390C161: TFloatField
      FieldName = 'C161'
    end
    object QMModelo390C162: TFloatField
      FieldName = 'C162'
    end
    object QMModelo390C163: TFloatField
      FieldName = 'C163'
    end
    object QMModelo390C164: TFloatField
      FieldName = 'C164'
    end
    object QMModelo390C165: TFloatField
      FieldName = 'C165'
    end
    object QMModelo390C166: TFloatField
      FieldName = 'C166'
    end
    object QMModelo390C167: TFloatField
      FieldName = 'C167'
    end
    object QMModelo390C168: TFloatField
      FieldName = 'C168'
    end
    object QMModelo390C169: TFloatField
      FieldName = 'C169'
    end
    object QMModelo390C170: TFloatField
      FieldName = 'C170'
    end
    object QMModelo390C171: TFloatField
      FieldName = 'C171'
    end
    object QMModelo390C172: TFloatField
      FieldName = 'C172'
    end
    object QMModelo390C173: TFloatField
      FieldName = 'C173'
    end
    object QMModelo390C174: TFloatField
      FieldName = 'C174'
    end
    object QMModelo390C175: TFloatField
      FieldName = 'C175'
    end
    object QMModelo390C176: TFloatField
      FieldName = 'C176'
    end
    object QMModelo390C177: TFloatField
      FieldName = 'C177'
    end
    object QMModelo390C178: TFloatField
      FieldName = 'C178'
    end
    object QMModelo390C179: TFloatField
      FieldName = 'C179'
    end
    object QMModelo390C180: TFloatField
      FieldName = 'C180'
    end
    object QMModelo390C181: TFloatField
      FieldName = 'C181'
    end
    object QMModelo390C182: TFloatField
      FieldName = 'C182'
    end
    object QMModelo390C183: TFloatField
      FieldName = 'C183'
    end
    object QMModelo390C184: TFloatField
      FieldName = 'C184'
    end
    object QMModelo390C185: TFloatField
      FieldName = 'C185'
    end
    object QMModelo390C186: TFloatField
      FieldName = 'C186'
    end
    object QMModelo390C187: TFloatField
      FieldName = 'C187'
    end
    object QMModelo390C188: TFloatField
      FieldName = 'C188'
    end
    object QMModelo390C189: TFloatField
      FieldName = 'C189'
    end
    object QMModelo390C190: TFloatField
      FieldName = 'C190'
    end
    object QMModelo390C191: TFloatField
      FieldName = 'C191'
    end
    object QMModelo390C196: TFloatField
      FieldName = 'C196'
    end
    object QMModelo390C197: TFloatField
      FieldName = 'C197'
    end
    object QMModelo390C202: TFloatField
      FieldName = 'C202'
    end
    object QMModelo390C203: TFloatField
      FieldName = 'C203'
    end
    object QMModelo390C208: TFloatField
      FieldName = 'C208'
    end
    object QMModelo390C209: TFloatField
      FieldName = 'C209'
    end
    object QMModelo390C214: TFloatField
      FieldName = 'C214'
    end
    object QMModelo390C215: TFloatField
      FieldName = 'C215'
    end
    object QMModelo390C220: TFloatField
      FieldName = 'C220'
    end
    object QMModelo390C221: TFloatField
      FieldName = 'C221'
    end
    object QMModelo390C227: TFloatField
      FieldName = 'C227'
    end
    object QMModelo390C228: TFloatField
      FieldName = 'C228'
    end
    object QMModelo390C230: TFloatField
      FieldName = 'C230'
    end
    object QMModelo390C231: TFloatField
      FieldName = 'C231'
    end
    object QMModelo390C232: TFloatField
      FieldName = 'C232'
    end
    object QMModelo390C500: TFloatField
      FieldName = 'C500'
    end
    object QMModelo390C501: TFloatField
      FieldName = 'C501'
    end
    object QMModelo390C502: TFloatField
      FieldName = 'C502'
    end
    object QMModelo390C503: TFloatField
      FieldName = 'C503'
    end
    object QMModelo390C504: TFloatField
      FieldName = 'C504'
    end
    object QMModelo390C505: TFloatField
      FieldName = 'C505'
    end
    object QMModelo390C506: TFloatField
      FieldName = 'C506'
    end
    object QMModelo390C507: TFloatField
      FieldName = 'C507'
    end
    object QMModelo390C512: TFloatField
      FieldName = 'C512'
    end
    object QMModelo390C513: TFloatField
      FieldName = 'C513'
    end
    object QMModelo390C514: TFloatField
      FieldName = 'C514'
    end
    object QMModelo390C515: TFloatField
      FieldName = 'C515'
    end
    object QMModelo390C520: TFloatField
      FieldName = 'C520'
    end
    object QMModelo390C521: TFloatField
      FieldName = 'C521'
    end
    object QMModelo390C522: TFloatField
      FieldName = 'C522'
    end
    object QMModelo390C523: TFloatField
      FieldName = 'C523'
    end
    object QMModelo390C524: TFloatField
      FieldName = 'C524'
    end
    object QMModelo390C525: TFloatField
      FieldName = 'C525'
    end
    object QMModelo390C526: TFloatField
      FieldName = 'C526'
    end
    object QMModelo390C545: TFloatField
      FieldName = 'C545'
    end
    object QMModelo390C546: TFloatField
      FieldName = 'C546'
    end
    object QMModelo390C547: TFloatField
      FieldName = 'C547'
    end
    object QMModelo390C548: TFloatField
      FieldName = 'C548'
    end
    object QMModelo390C551: TFloatField
      FieldName = 'C551'
    end
    object QMModelo390C552: TFloatField
      FieldName = 'C552'
    end
    object QMModelo390C587: TFloatField
      FieldName = 'C587'
    end
    object QMModelo390C588: TFloatField
      FieldName = 'C588'
    end
    object QMModelo390C597: TFloatField
      FieldName = 'C597'
    end
    object QMModelo390C598: TFloatField
      FieldName = 'C598'
    end
    object QMModelo390C599: TFloatField
      FieldName = 'C599'
    end
    object QMModelo390C600: TFloatField
      FieldName = 'C600'
    end
    object QMModelo390C601: TFloatField
      FieldName = 'C601'
    end
    object QMModelo390C602: TFloatField
      FieldName = 'C602'
    end
    object QMModelo390C603: TFloatField
      FieldName = 'C603'
    end
    object QMModelo390C604: TFloatField
      FieldName = 'C604'
    end
    object QMModelo390C605: TFloatField
      FieldName = 'C605'
    end
    object QMModelo390C606: TFloatField
      FieldName = 'C606'
    end
    object QMModelo390C607: TFloatField
      FieldName = 'C607'
    end
    object QMModelo390C608: TFloatField
      FieldName = 'C608'
    end
    object QMModelo390C609: TFloatField
      FieldName = 'C609'
    end
    object QMModelo390C610: TFloatField
      FieldName = 'C610'
    end
    object QMModelo390C611: TFloatField
      FieldName = 'C611'
    end
    object QMModelo390C612: TFloatField
      FieldName = 'C612'
    end
    object QMModelo390C613: TFloatField
      FieldName = 'C613'
    end
    object QMModelo390C614: TFloatField
      FieldName = 'C614'
    end
    object QMModelo390C615: TFloatField
      FieldName = 'C615'
    end
    object QMModelo390C616: TFloatField
      FieldName = 'C616'
    end
    object QMModelo390C617: TFloatField
      FieldName = 'C617'
    end
    object QMModelo390C618: TFloatField
      FieldName = 'C618'
    end
    object QMModelo390C619: TFloatField
      FieldName = 'C619'
    end
    object QMModelo390C620: TFloatField
      FieldName = 'C620'
    end
    object QMModelo390C621: TFloatField
      FieldName = 'C621'
    end
    object QMModelo390C622: TFloatField
      FieldName = 'C622'
    end
    object QMModelo390C623: TFloatField
      FieldName = 'C623'
    end
    object QMModelo390C624: TFloatField
      FieldName = 'C624'
    end
    object QMModelo390C625: TFloatField
      FieldName = 'C625'
    end
    object QMModelo390C626: TFloatField
      FieldName = 'C626'
    end
    object QMModelo390C627: TFloatField
      FieldName = 'C627'
    end
    object QMModelo390C628: TFloatField
      FieldName = 'C628'
    end
    object QMModelo390C629: TFloatField
      FieldName = 'C629'
    end
    object QMModelo390C630: TFloatField
      FieldName = 'C630'
    end
    object QMModelo390C631: TFloatField
      FieldName = 'C631'
    end
    object QMModelo390C632: TFloatField
      FieldName = 'C632'
    end
    object QMModelo390C633: TFloatField
      FieldName = 'C633'
    end
    object QMModelo390C634: TFloatField
      FieldName = 'C634'
    end
    object QMModelo390C635: TFloatField
      FieldName = 'C635'
    end
    object QMModelo390C636: TFloatField
      FieldName = 'C636'
    end
    object QMModelo390C637: TFloatField
      FieldName = 'C637'
    end
    object QMModelo390C638: TFloatField
      FieldName = 'C638'
    end
    object QMModelo390C639: TFloatField
      FieldName = 'C639'
    end
    object QMModelo390C640: TFloatField
      FieldName = 'C640'
    end
    object QMModelo390C641: TFloatField
      FieldName = 'C641'
    end
    object QMModelo390C642: TFloatField
      FieldName = 'C642'
    end
    object QMModelo390C643: TFloatField
      FieldName = 'C643'
    end
    object QMModelo390C644: TFloatField
      FieldName = 'C644'
    end
    object QMModelo390C645: TFloatField
      FieldName = 'C645'
    end
    object QMModelo390C646: TFloatField
      FieldName = 'C646'
    end
    object QMModelo390C647: TFloatField
      FieldName = 'C647'
    end
    object QMModelo390C648: TFloatField
      FieldName = 'C648'
    end
    object QMModelo390C649: TFloatField
      FieldName = 'C649'
    end
    object QMModelo390C650: TFloatField
      FieldName = 'C650'
    end
    object QMModelo390C651: TFloatField
      FieldName = 'C651'
    end
    object QMModelo390C652: TFloatField
      FieldName = 'C652'
    end
    object QMModelo390C653: TFloatField
      FieldName = 'C653'
    end
    object QMModelo390C654: TFloatField
      FieldName = 'C654'
    end
    object QMModelo390C655: TFloatField
      FieldName = 'C655'
    end
    object QMModelo390C656: TFloatField
      FieldName = 'C656'
    end
    object QMModelo390C657: TFloatField
      FieldName = 'C657'
    end
    object QMModelo390C658: TFloatField
      FieldName = 'C658'
    end
    object QMModelo390C659: TFloatField
      FieldName = 'C659'
    end
    object QMModelo390C660: TFloatField
      FieldName = 'C660'
    end
    object QMModelo390C661: TFloatField
      FieldName = 'C661'
    end
    object QMModelo390C662: TFloatField
      FieldName = 'C662'
    end
    object QMModelo390C125: TFloatField
      FieldName = 'C125'
    end
    object QMModelo390C126: TFloatField
      FieldName = 'C126'
    end
    object QMModelo390C127: TFloatField
      FieldName = 'C127'
    end
    object QMModelo390C128: TFloatField
      FieldName = 'C128'
    end
    object QMModelo390C700: TFloatField
      FieldName = 'C700'
    end
    object QMModelo390C701: TFloatField
      FieldName = 'C701'
    end
    object QMModelo390C702: TFloatField
      FieldName = 'C702'
    end
    object QMModelo390C703: TFloatField
      FieldName = 'C703'
    end
    object QMModelo390C704: TFloatField
      FieldName = 'C704'
    end
    object QMModelo390C705: TFloatField
      FieldName = 'C705'
    end
    object QMModelo390C706: TFloatField
      FieldName = 'C706'
    end
    object QMModelo390C707: TFloatField
      FieldName = 'C707'
    end
    object QMModelo390C708: TFloatField
      FieldName = 'C708'
    end
    object QMModelo390C709: TFloatField
      FieldName = 'C709'
    end
    object QMModelo390C710: TFloatField
      FieldName = 'C710'
    end
    object QMModelo390C711: TFloatField
      FieldName = 'C711'
    end
    object QMModelo390C712: TFloatField
      FieldName = 'C712'
    end
    object QMModelo390C713: TFloatField
      FieldName = 'C713'
    end
    object QMModelo390C714: TFloatField
      FieldName = 'C714'
    end
    object QMModelo390C715: TFloatField
      FieldName = 'C715'
    end
    object QMModelo390C716: TFloatField
      FieldName = 'C716'
    end
    object QMModelo390C717: TFloatField
      FieldName = 'C717'
    end
    object QMModelo390C718: TFloatField
      FieldName = 'C718'
    end
    object QMModelo390C719: TFloatField
      FieldName = 'C719'
    end
    object QMModelo390C720: TFloatField
      FieldName = 'C720'
    end
    object QMModelo390C721: TFloatField
      FieldName = 'C721'
    end
    object QMModelo390C722: TFloatField
      FieldName = 'C722'
    end
    object QMModelo390C723: TFloatField
      FieldName = 'C723'
    end
    object QMModelo390C724: TFloatField
      FieldName = 'C724'
    end
    object QMModelo390C725: TFloatField
      FieldName = 'C725'
    end
    object QMModelo390C726: TFloatField
      FieldName = 'C726'
    end
    object QMModelo390C727: TFloatField
      FieldName = 'C727'
    end
    object QMModelo390C728: TFloatField
      FieldName = 'C728'
    end
    object QMModelo390C729: TFloatField
      FieldName = 'C729'
    end
    object QMModelo390C730: TFloatField
      FieldName = 'C730'
    end
    object QMModelo390C731: TFloatField
      FieldName = 'C731'
    end
    object QMModelo390C732: TFloatField
      FieldName = 'C732'
    end
    object QMModelo390C733: TFloatField
      FieldName = 'C733'
    end
    object QMModelo390C734: TFloatField
      FieldName = 'C734'
    end
    object QMModelo390C735: TFloatField
      FieldName = 'C735'
    end
    object QMModelo390C736: TFloatField
      FieldName = 'C736'
    end
    object QMModelo390C737: TFloatField
      FieldName = 'C737'
    end
    object QMModelo390C738: TFloatField
      FieldName = 'C738'
    end
    object QMModelo390C739: TFloatField
      FieldName = 'C739'
    end
    object QMModelo390C740: TFloatField
      FieldName = 'C740'
    end
    object QMModelo390C741: TFloatField
      FieldName = 'C741'
    end
    object QMModelo390C663: TFloatField
      FieldKind = fkCalculated
      FieldName = 'C663'
      Calculated = True
    end
    object QMModelo390C664: TFloatField
      FieldKind = fkCalculated
      FieldName = 'C664'
      Calculated = True
    end
    object QMModelo390C665: TFloatField
      FieldKind = fkCalculated
      FieldName = 'C665'
      Calculated = True
    end
    object QMModelo390C666: TFloatField
      FieldKind = fkCalculated
      FieldName = 'C666'
      Calculated = True
    end
  end
  object DSxModelo390: TDataSource
    DataSet = QMModelo390
    Left = 424
    Top = 680
  end
  object xModelo390Liquidar: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select liquidar_iva_modelo_300'
      'from emp_canales'
      
        'where ((empresa=?empresa)and(ejercicio=?ejercicio)and(canal=?can' +
        'al))')
    UniDirectional = False
    Left = 520
    Top = 680
    object xModelo390LiquidarLIQUIDAR_IVA_MODELO_300: TIntegerField
      FieldName = 'LIQUIDAR_IVA_MODELO_300'
    end
  end
  object xMod110_Detalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = DMMain.TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      '/*'
      'Detalle de documentos para el Modelo 110 de Hacienda'
      '*/'
      ''
      
        '-- Obtenemos la base imponible y retenciones de profesionales in' +
        'dependientes'
      
        'select f.tipo, f.ejercicio, f.serie, f.rig, f.num_factura, f.bas' +
        'e_irpf, ir.titulo titulo_irpf, f.p_irpf, f.i_irpf,'
      
        '       c.moneda, f.fecha_con, t.nombre_r_social, t.nif, ir.tipo_' +
        'ganadero'
      'from ges_cabeceras_e_fcr f'
      'join ges_cabeceras_e c on (c.id_e = f.id_e)'
      'join sys_terceros t on f.tercero = t.tercero'
      'join sys_tipo_irpf ir on (f.tipo_irpf = ir.tipo)'
      'where'
      'f.empresa = :empresa and'
      'f.canal = :canal and'
      'f.tipo = '#39'FCR'#39' and'
      'f.fecha_con >= :fecha_ini and'
      'f.fecha_con <= :fecha_fin and'
      'f.arrendamiento = 0 and'
      'f.i_irpf <> 0 and'
      'ir.incluir_enmodelo = 1 and'
      'ir.pais = :pais and'
      'c.estado = 5'
      'union'
      
        '-- Obtenemos la base imponible y retenciones de otros proveedore' +
        's'
      
        'select f.tipo, f.ejercicio, f.serie, f.rig, f.num_factura, f.bas' +
        'e_irpf, ir.titulo titulo_irpf, f.p_irpf, f.i_irpf,'
      
        '       c.moneda, f.fecha_con, t.nombre_r_social, t.nif, ir.tipo_' +
        'ganadero'
      'from ges_cabeceras_e_fac f'
      'join ges_cabeceras_e c on (c.id_e = f.id_e)'
      'join sys_terceros t on f.tercero = t.tercero'
      'join sys_tipo_irpf ir on (f.tipo_irpf = ir.tipo)'
      'where'
      'f.empresa = :empresa and'
      'f.canal = :canal and'
      'f.fecha_con >= :fecha_ini and'
      'f.fecha_con <= :fecha_fin and'
      'f.i_irpf <> 0 and'
      'ir.incluir_enmodelo = 1 and'
      'ir.pais = :pais and'
      'c.estado = 5'
      'order by 11, 1, 2, 3, 4, 5, 6')
    UniDirectional = False
    Left = 528
    Top = 8
    object xMod110_DetalleTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xMod110_DetalleEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xMod110_DetalleSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xMod110_DetalleRIG: TIntegerField
      DisplayLabel = 'R.I.G'
      FieldName = 'RIG'
    end
    object xMod110_DetalleNUM_FACTURA: TFIBStringField
      DisplayLabel = 'N'#250'mero de Factura'
      FieldName = 'NUM_FACTURA'
      Size = 40
    end
    object xMod110_DetalleBASE_IRPF: TFloatField
      DisplayLabel = 'Base IRPF'
      FieldName = 'BASE_IRPF'
    end
    object xMod110_DetalleTITULO_IRPF: TFIBStringField
      DisplayLabel = 'T'#237'tulo IRPF'
      FieldName = 'TITULO_IRPF'
      Size = 15
    end
    object xMod110_DetalleP_IRPF: TFloatField
      DisplayLabel = '% IRPF'
      FieldName = 'P_IRPF'
    end
    object xMod110_DetalleI_IRPF: TFloatField
      DisplayLabel = 'Importe IRPF'
      FieldName = 'I_IRPF'
    end
    object xMod110_DetalleMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object xMod110_DetalleFECHA_CON: TDateTimeField
      DisplayLabel = 'Fecha Con'
      FieldName = 'FECHA_CON'
    end
    object xMod110_DetalleNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xMod110_DetalleNIF: TFIBStringField
      FieldName = 'NIF'
    end
    object xMod110_DetalleTIPO_GANADERO: TIntegerField
      DisplayLabel = 'Ganadero'
      FieldName = 'TIPO_GANADERO'
    end
  end
  object DSxMod110_Detalle: TDataSource
    DataSet = xMod110_Detalle
    Left = 624
    Top = 8
  end
  object frModelo390: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Modelo 303'
    RebuildPrinter = False
    OnGetValue = frModelo390GetValue
    OnBeforePrint = frModelo300EnterRect
    OnEnterRect = frModelo300EnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 40
    Top = 680
    ReportForm = {19000000}
  end
  object frxModelo390: TfrxHYReport
    Version = '3.19'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick]
    PreviewOptions.Zoom = 1
    PrintOptions.Printer = 'Por defecto'
    ReportOptions.CreateDate = 40192.6058694907
    ReportOptions.LastChange = 40192.6058694907
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    StoreInDFM = False
    OnBeforePrint = frxModelo390BeforePrint
    OnGetValue = frModelo390GetValue
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 128
    Top = 680
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object frDBModelo390: TfrDBDataSet
    DataSource = DSxModelo390
    Left = 232
    Top = 680
  end
  object xLstMod110Detalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = DMMain.TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      '/*'
      'Detalle de documentos para el Modelo 110 de Hacienda'
      '*/'
      ''
      
        '-- Obtenemos la base imponible y retenciones de profesionales in' +
        'dependientes'
      
        'select f.tipo, f.ejercicio, f.serie, f.rig, f.num_factura, f.bas' +
        'e_irpf, ir.titulo titulo_irpf, f.p_irpf, f.i_irpf,'
      
        '       c.moneda, f.fecha_con, t.nombre_r_social, t.nif, ir.tipo_' +
        'ganadero'
      'from ges_cabeceras_e_fcr f'
      'join ges_cabeceras_e c on (c.id_e = f.id_e)'
      'join sys_terceros t on f.tercero = t.tercero'
      'join sys_tipo_irpf ir on (f.tipo_irpf = ir.tipo)'
      'where'
      'f.empresa = :empresa and'
      'f.canal = :canal and'
      'f.tipo = '#39'FCR'#39' and'
      'f.fecha_con >= :fecha_ini and'
      'f.fecha_con <= :fecha_fin and'
      'f.arrendamiento = 0 and'
      'f.i_irpf <> 0 and'
      'ir.incluir_enmodelo = 1 and'
      'ir.pais = :pais and'
      'c.estado = 5'
      'union'
      
        '-- Obtenemos la base imponible y retenciones de otros proveedore' +
        's'
      
        'select f.tipo, f.ejercicio, f.serie, f.rig, f.num_factura, f.bas' +
        'e_irpf, ir.titulo titulo_irpf, f.p_irpf, f.i_irpf,'
      
        '       c.moneda, f.fecha_con, t.nombre_r_social, t.nif, ir.tipo_' +
        'ganadero'
      'from ges_cabeceras_e_fac f'
      'join ges_cabeceras_e c on (c.id_e = f.id_e)'
      'join sys_terceros t on f.tercero = t.tercero'
      'join sys_tipo_irpf ir on (f.tipo_irpf = ir.tipo)'
      'where'
      'f.empresa = :empresa and'
      'f.canal = :canal and'
      'f.fecha_con >= :fecha_ini and'
      'f.fecha_con <= :fecha_fin and'
      'f.i_irpf <> 0 and'
      'ir.incluir_enmodelo = 1 and'
      'ir.pais = :pais and'
      'c.estado = 5'
      'order by 11, 1, 2, 3, 4, 5, 6')
    UniDirectional = False
    Left = 424
    Top = 56
  end
  object frxLstMod110Detalle: TfrDBDataSet
    DataSet = xLstMod110Detalle
    Left = 512
    Top = 56
  end
end
