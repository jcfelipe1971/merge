object DMRMayoresCantidad: TDMRMayoresCantidad
  OldCreateOrder = False
  OnCreate = DMRMayoresCantidadCreate
  OnDestroy = DMRMayoresCantidadDestroy
  Left = 312
  Top = 128
  Height = 491
  Width = 613
  object QSPMayoresCantidad: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      
        'select * from c_mayores_cantidad (?empresa,?ejercicio,?canal,?ca' +
        'ntidad,?fecha_desde,?fecha_hasta,?tipo_orden)')
    UniDirectional = False
    AutoCalcFields = False
    Left = 40
    Top = 64
    object QSPMayoresCantidadCIF: TFIBStringField
      DisplayLabel = 'C.I.F.'
      FieldName = 'CIF'
    end
    object QSPMayoresCantidadCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QSPMayoresCantidadNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 60
    end
    object QSPMayoresCantidadDOMICILIO: TFIBStringField
      DisplayLabel = 'Domicilio'
      FieldName = 'DOMICILIO'
      Size = 76
    end
    object QSPMayoresCantidadCODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'CODIGO_POSTAL'
      Size = 10
    end
    object QSPMayoresCantidadPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object QSPMayoresCantidadSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object QSPMayoresCantidadIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QSPMayoresCantidadIMPORTE_T1: TFloatField
      DisplayLabel = 'Imp. T1'
      FieldName = 'IMPORTE_T1'
    end
    object QSPMayoresCantidadIMPORTE_T2: TFloatField
      DisplayLabel = 'Imp. T2'
      FieldName = 'IMPORTE_T2'
    end
    object QSPMayoresCantidadIMPORTE_T3: TFloatField
      DisplayLabel = 'Imp. T3'
      FieldName = 'IMPORTE_T3'
    end
    object QSPMayoresCantidadIMPORTE_T4: TFloatField
      DisplayLabel = 'Imp. T4'
      FieldName = 'IMPORTE_T4'
    end
  end
  object frMayoresCantidad: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Carta Cifra Anual Modelo 347'
    RebuildPrinter = False
    OnBeginDoc = frMayoresCantidadBeginDoc
    OnGetValue = frMayoresCantidadGetValue
    OnBeforePrint = frMayoresCantidadEnterRect
    OnEnterRect = frMayoresCantidadEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 40
    Top = 16
    ReportForm = {19000000}
  end
  object DSQSPMayoresCantidad: TDataSource
    DataSet = QSPMayoresCantidad
    Left = 160
    Top = 64
  end
  object frDSQSPMayoresCantidad: TfrDBDataSet
    DataSource = DSQSPMayoresCantidad
    Left = 296
    Top = 64
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 512
    Top = 16
  end
  object xTerceroD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select NOMBRE_R_SOCIAL from sys_terceros'
      'where tercero=?tercero')
    UniDirectional = False
    Left = 40
    Top = 304
  end
  object DSxTerceroD: TDataSource
    DataSet = xTerceroD
    Left = 160
    Top = 304
  end
  object xTerceroH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select NOMBRE_R_SOCIAL from sys_terceros'
      'where tercero=?tercero')
    UniDirectional = False
    Left = 40
    Top = 352
  end
  object DSxTerceroH: TDataSource
    DataSet = xTerceroH
    Left = 160
    Top = 352
  end
  object QMaxTercero: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT MAX(TERCERO) AS MAXIMO'
      'FROM SYS_TERCEROS')
    Transaction = TLocal
    Plan.Strings = (
      ' ')
    AutoTrans = True
    Left = 512
    Top = 112
  end
  object QSPCarta347: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      
        'SELECT * FROM C_MODELO_347_CARTA(:EMPRESA, :EJERCICIO, :CANAL, :' +
        'TIPO, :TERCEROINI, :TERCEROFIN)')
    UniDirectional = False
    AutoCalcFields = False
    Left = 40
    Top = 112
    object QSPCarta347TERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QSPCarta347CIF: TFIBStringField
      DisplayLabel = 'C.I.F.'
      FieldName = 'CIF'
    end
    object QSPCarta347NOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 60
    end
    object QSPCarta347DOMICILIO: TFIBStringField
      DisplayLabel = 'Domicilio'
      FieldName = 'DOMICILIO'
      Size = 76
    end
    object QSPCarta347CODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'CODIGO_POSTAL'
      Size = 10
    end
    object QSPCarta347IMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QSPCarta347SIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object QSPCarta347LOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'LOCALIDAD'
      Size = 40
    end
    object QSPCarta347FAX: TFIBStringField
      DisplayLabel = 'Fax'
      FieldName = 'FAX'
    end
    object QSPCarta347IMPORTE_T1: TFloatField
      DisplayLabel = 'Imp. T1'
      FieldName = 'IMPORTE_T1'
    end
    object QSPCarta347IMPORTE_T2: TFloatField
      DisplayLabel = 'Imp. T2'
      FieldName = 'IMPORTE_T2'
    end
    object QSPCarta347IMPORTE_T3: TFloatField
      DisplayLabel = 'Imp. T3'
      FieldName = 'IMPORTE_T3'
    end
    object QSPCarta347IMPORTE_T4: TFloatField
      DisplayLabel = 'Imp. T4'
      FieldName = 'IMPORTE_T4'
    end
    object QSPCarta347EMAIL: TFIBStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 100
    end
    object QSPCarta347CORREO_ENVIADO: TIntegerField
      DisplayLabel = 'Correo Enviado'
      FieldName = 'CORREO_ENVIADO'
    end
  end
  object DSQSPCarta347: TDataSource
    DataSet = QSPCarta347
    Left = 160
    Top = 112
  end
  object frDBDSQSPCarta347: TfrDBDataSet
    DataSource = DSQSPCarta347
    Left = 296
    Top = 112
  end
  object HYReportMail: THYReportMail
    CampoCodigo = 'LISTADO'
    CampoGrupo = 'GRUPO'
    CampoListado = 'DEF_LISTADO'
    CampoTipo = 'TIPO'
    CampoTitulo = 'TITULO'
    ValorCodigo = 1801
    ValorGrupo = 134
    DataSet = DMMain.QListados
    Opciones.Pagina.Margenes.Abajo = 0
    Opciones.Pagina.Margenes.Izquierda = 0
    Opciones.Pagina.Margenes.Derecha = 0
    Opciones.Pagina.Margenes.Arriba = 0
    Opciones.Pagina.Alto = 40
    Opciones.Pagina.Ancho = 80
    Opciones.Pagina.Tamanyo = 40
    Opciones.Pagina.SaltoPagina = True
    Opciones.Pagina.ImprimePrimeraCabecera = False
    Opciones.Pagina.ImprimeUltimoPie = False
    Titulo = 'Carta Cifra Anual Modelo 347 e-mail'
    ControlaLongitud = True
    OnEnterFields = HYReportMailEnterFields
    Left = 296
    Top = 16
  end
  object HYMSCarta347: THYReportMailSource
    DataSet = QSPCarta347
    CloseDataset = False
    Left = 416
    Top = 112
  end
  object xTerceroMail: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select NOMBRE_R_SOCIAL from sys_terceros'
      'where tercero=?tercero')
    UniDirectional = False
    Left = 40
    Top = 208
  end
  object DSxTerceroMail: TDataSource
    DataSet = xTerceroMail
    Left = 160
    Top = 208
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
    Left = 512
    Top = 160
    object xDatosModelosHaciendaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
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
    object xDatosModelosHaciendaDECLARANTE_CUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'DECLARANTE_CUENTA'
      Size = 10
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
  end
  object frxMayoresCantidad: TfrxHYReport
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
    OnBeforePrint = frxMayoresCantidadBeforePrint
    OnBeginDoc = frxMayoresCantidadBeginDoc
    OnGetValue = frxMayoresCantidadGetValue
    FIBOptions.DataSet = DMMain.QListados
    FIBOptions.KeyField = 'LISTADO'
    FIBOptions.BlobField = 'DEF_LISTADO'
    FIBOptions.NameField = 'TITULO'
    FIBOptions.GroupField = 'GRUPO'
    FIBOptions.TypeField = 'TIPO'
    Left = 160
    Top = 16
    Datasets = <>
    Variables = <>
    Style = <>
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 512
    Top = 64
  end
  object xCorreosElectronicos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM L_DAME_EMAIL_TERCERO(:TERCERO)'
      ' ')
    UniDirectional = False
    Left = 40
    Top = 256
    object xCorreosElectronicosEMAIL: TFIBStringField
      DisplayLabel = 'email'
      FieldName = 'EMAIL'
      Size = 100
    end
    object xCorreosElectronicosNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE'
      Size = 255
    end
    object xCorreosElectronicosEMAIL_OFC: TIntegerField
      DisplayLabel = 'Ofe.'
      FieldName = 'EMAIL_OFC'
    end
    object xCorreosElectronicosEMAIL_PEC: TIntegerField
      DisplayLabel = 'Ped.'
      FieldName = 'EMAIL_PEC'
    end
    object xCorreosElectronicosEMAIL_ALB: TIntegerField
      DisplayLabel = 'Alb.'
      FieldName = 'EMAIL_ALB'
    end
    object xCorreosElectronicosEMAIL_FAC: TIntegerField
      DisplayLabel = 'Fac.'
      FieldName = 'EMAIL_FAC'
    end
    object xCorreosElectronicosEMAIL_OFP: TIntegerField
      DisplayLabel = 'Prop.'
      FieldName = 'EMAIL_OFP'
    end
    object xCorreosElectronicosEMAIL_OCP: TIntegerField
      DisplayLabel = 'Prop. C.'
      FieldName = 'EMAIL_OCP'
    end
    object xCorreosElectronicosEMAIL_PEP: TIntegerField
      DisplayLabel = 'Ped. P.'
      FieldName = 'EMAIL_PEP'
    end
    object xCorreosElectronicosEMAIL_ALP: TIntegerField
      DisplayLabel = 'Alb. P.'
      FieldName = 'EMAIL_ALP'
    end
    object xCorreosElectronicosEMAIL_FAP: TIntegerField
      DisplayLabel = 'Fac. P.'
      FieldName = 'EMAIL_FAP'
    end
    object xCorreosElectronicosEMAIL_FCR: TIntegerField
      DisplayLabel = 'Fac. Acr.'
      FieldName = 'EMAIL_FCR'
    end
  end
  object DSCorreosElectronicos: TDataSource
    DataSet = xCorreosElectronicos
    Left = 160
    Top = 256
  end
  object xImportesDeclarar: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM CON_MODELO_347'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  NIF=?old_NIF AND '
      '  SIGNO=?old_SIGNO AND '
      '  INVERSION_SUJETO_PASIVO=?old_INVERSION_SUJETO_PASIVO ')
    InsertSQL.Strings = (
      'INSERT INTO CON_MODELO_347'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,NIF,SIGNO,TERCERO,NOMBRE_R_SOCIAL,I' +
        'MPORTE_T1,IMPORTE_T2,IMPORTE_T3,IMPORTE_T4,'#13#10'IMPORTE_TOTAL,IMPOR' +
        'TE_T1_PRESENTAR,IMPORTE_T2_PRESENTAR,IMPORTE_T3_PRESENTAR,IMPORT' +
        'E_T4_PRESENTAR,IMPORTE_TOTAL_PRESENTAR,MODIFICADO,INVERSION_SUJE' +
        'TO_PASIVO,CODIGO_POSTAL,CORREO_ENVIADO,'#13#10'ENTRADA_AGRUPACION)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?NIF,?SIGNO,?TERCERO,?NOMBRE_R_S' +
        'OCIAL,?IMPORTE_T1,?IMPORTE_T2,?IMPORTE_T3,?IMPORTE_T4,'#13#10'?IMPORTE' +
        '_TOTAL,?IMPORTE_T1_PRESENTAR,?IMPORTE_T2_PRESENTAR,?IMPORTE_T3_P' +
        'RESENTAR,?IMPORTE_T4_PRESENTAR,?IMPORTE_TOTAL_PRESENTAR,?MODIFIC' +
        'ADO,?INVERSION_SUJETO_PASIVO,?CODIGO_POSTAL,?CORREO_ENVIADO,'#13#10'?E' +
        'NTRADA_AGRUPACION)')
    RefreshSQL.Strings = (
      '/* Se modifica dinamicamente */'
      
        'SELECT C.*, D.DIR_COMPLETA_N, L.TITULO LOCALIDAD, T.TELEFONO01, ' +
        'T.TELEFONO02, T.TELEFAX, T.EMAIL'
      'FROM CON_MODELO_347 C'
      'LEFT JOIN SYS_TERCEROS T ON C.TERCERO = T.TERCERO'
      
        'LEFT JOIN SYS_TERCEROS_DIRECCIONES D ON T.TERCERO = D.TERCERO AN' +
        'D D.DIR_DEFECTO = 1'
      'LEFT JOIN SYS_LOCALIDADES L ON D.ID_LOCAL = L.ID_LOCAL'
      'WHERE'
      'C.EMPRESA=?EMPRESA AND '
      'C.EJERCICIO=?EJERCICIO AND '
      'C.CANAL=?CANAL AND '
      'C.NIF=?NIF AND '
      'C.SIGNO=?SIGNO AND '
      'C.INVERSION_SUJETO_PASIVO=?INVERSION_SUJETO_PASIVO ')
    SelectSQL.Strings = (
      '/* Se modifica dinamicamente */'
      
        'SELECT C.*, D.DIR_COMPLETA_N, L.TITULO LOCALIDAD, T.TELEFONO01, ' +
        'T.TELEFONO02, T.TELEFAX, T.EMAIL'
      'FROM CON_MODELO_347 C'
      'LEFT JOIN SYS_TERCEROS T ON C.TERCERO = T.TERCERO'
      
        'LEFT JOIN SYS_TERCEROS_DIRECCIONES D ON T.TERCERO = D.TERCERO AN' +
        'D D.DIR_DEFECTO = 1'
      'LEFT JOIN SYS_LOCALIDADES L ON D.ID_LOCAL = L.ID_LOCAL'
      'WHERE'
      'C.EMPRESA = :EMPRESA AND'
      'C.EJERCICIO = :EJERCICIO AND'
      'C.CANAL = :CANAL'
      'ORDER BY C.SIGNO, C.NIF, C.INVERSION_SUJETO_PASIVO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE CON_MODELO_347'
      'SET'
      '  TERCERO=?TERCERO '
      '  ,NOMBRE_R_SOCIAL=?NOMBRE_R_SOCIAL '
      '  ,IMPORTE_T1=?IMPORTE_T1 '
      '  ,IMPORTE_T2=?IMPORTE_T2 '
      '  ,IMPORTE_T3=?IMPORTE_T3 '
      '  ,IMPORTE_T4=?IMPORTE_T4 '
      '  ,IMPORTE_TOTAL=?IMPORTE_TOTAL '
      '  ,IMPORTE_T1_PRESENTAR=?IMPORTE_T1_PRESENTAR '
      '  ,IMPORTE_T2_PRESENTAR=?IMPORTE_T2_PRESENTAR '
      '  ,IMPORTE_T3_PRESENTAR=?IMPORTE_T3_PRESENTAR '
      '  ,IMPORTE_T4_PRESENTAR=?IMPORTE_T4_PRESENTAR '
      '  ,IMPORTE_TOTAL_PRESENTAR=?IMPORTE_TOTAL_PRESENTAR '
      '  ,MODIFICADO=?MODIFICADO '
      '  ,CODIGO_POSTAL=?CODIGO_POSTAL '
      '  ,CORREO_ENVIADO=?CORREO_ENVIADO '
      '  ,ENTRADA_AGRUPACION=?ENTRADA_AGRUPACION '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  NIF=?NIF AND '
      '  SIGNO=?SIGNO AND '
      '  INVERSION_SUJETO_PASIVO=?INVERSION_SUJETO_PASIVO ')
    BeforeEdit = xImportesDeclararBeforeEdit
    OnNewRecord = xImportesDeclararNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'NIF '
      'SIGNO '
      'INVERSION_SUJETO_PASIVO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'CON_MODELO_347'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 400
    object xImportesDeclararEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xImportesDeclararEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xImportesDeclararCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xImportesDeclararNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object xImportesDeclararSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object xImportesDeclararNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xImportesDeclararIMPORTE_T1: TFloatField
      DisplayLabel = 'Importe T1'
      FieldName = 'IMPORTE_T1'
    end
    object xImportesDeclararIMPORTE_T2: TFloatField
      DisplayLabel = 'Importe T2'
      FieldName = 'IMPORTE_T2'
    end
    object xImportesDeclararIMPORTE_T3: TFloatField
      DisplayLabel = 'Importe T3'
      FieldName = 'IMPORTE_T3'
    end
    object xImportesDeclararIMPORTE_T4: TFloatField
      DisplayLabel = 'Importe T4'
      FieldName = 'IMPORTE_T4'
    end
    object xImportesDeclararIMPORTE_TOTAL: TFloatField
      DisplayLabel = 'Importe Total'
      FieldName = 'IMPORTE_TOTAL'
    end
    object xImportesDeclararIMPORTE_T1_PRESENTAR: TFloatField
      DisplayLabel = 'Importe T1 Presentar'
      FieldName = 'IMPORTE_T1_PRESENTAR'
    end
    object xImportesDeclararIMPORTE_T2_PRESENTAR: TFloatField
      DisplayLabel = 'Importe T2 Presentar'
      FieldName = 'IMPORTE_T2_PRESENTAR'
    end
    object xImportesDeclararIMPORTE_T3_PRESENTAR: TFloatField
      DisplayLabel = 'Importe T3 Presentar'
      FieldName = 'IMPORTE_T3_PRESENTAR'
    end
    object xImportesDeclararIMPORTE_T4_PRESENTAR: TFloatField
      DisplayLabel = 'Importe T4 Presentar'
      FieldName = 'IMPORTE_T4_PRESENTAR'
    end
    object xImportesDeclararIMPORTE_TOTAL_PRESENTAR: TFloatField
      DisplayLabel = 'Importe Total Presentar'
      FieldName = 'IMPORTE_TOTAL_PRESENTAR'
    end
    object xImportesDeclararMODIFICADO: TIntegerField
      DisplayLabel = 'Modificado'
      FieldName = 'MODIFICADO'
    end
    object xImportesDeclararTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xImportesDeclararINVERSION_SUJETO_PASIVO: TIntegerField
      DisplayLabel = 'Inv. Sujeto Pasivo'
      FieldName = 'INVERSION_SUJETO_PASIVO'
    end
    object xImportesDeclararCODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'CODIGO_POSTAL'
      Size = 10
    end
    object xImportesDeclararDIR_COMPLETA_N: TFIBStringField
      DisplayLabel = 'Direccion'
      FieldName = 'DIR_COMPLETA_N'
      Size = 76
    end
    object xImportesDeclararLOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'LOCALIDAD'
      Size = 40
    end
    object xImportesDeclararEMAIL: TFIBStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 100
    end
    object xImportesDeclararTELEFONO01: TFIBStringField
      DisplayLabel = 'Tel. 1'
      FieldName = 'TELEFONO01'
    end
    object xImportesDeclararTELEFONO02: TFIBStringField
      DisplayLabel = 'Tel. 2'
      FieldName = 'TELEFONO02'
    end
    object xImportesDeclararTELEFAX: TFIBStringField
      DisplayLabel = 'Fax'
      FieldName = 'TELEFAX'
    end
    object xImportesDeclararCORREO_ENVIADO: TIntegerField
      DisplayLabel = 'Correo Enviado'
      FieldName = 'CORREO_ENVIADO'
    end
    object xImportesDeclararENTRADA_AGRUPACION: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA_AGRUPACION'
    end
  end
  object DSImportesDeclarar: TDataSource
    DataSet = xImportesDeclarar
    Left = 160
    Top = 400
  end
  object xFacturas347: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = DMMain.TLocal
    AutoTrans = True
    BufferChunks = 1024
    SelectSQL.Strings = (
      
        'SELECT F.FECHA_CON, F.NUM_FACTURA, C.TIPO, C.SERIE, C.RIG, C.FEC' +
        'HA, C.S_BASES, C.S_CUOTA_IVA, C.S_CUOTA_RE,'
      '       C.LIQUIDO, I_FINANCIACION, C.MONEDA, C.ID_E, F.TERCERO'
      'FROM GES_CABECERAS_E C'
      'JOIN GES_CABECERAS_E_FCR F ON C.ID_E = F.ID_E'
      'WHERE'
      'CAST(:SIGNO AS CHAR(1)) = '#39'A'#39' AND'
      'C.EMPRESA = :EMPRESA AND'
      'C.CANAL = :CANAL AND'
      'C.TIPO = '#39'FCR'#39' AND'
      'F.TERCERO = :TERCERO AND'
      'F.FECHA_CON BETWEEN :D_FECHA AND :H_FECHA'
      ''
      'UNION'
      ''
      
        'SELECT F.FECHA_CON, F.NUM_FACTURA, C.TIPO, C.SERIE, C.RIG, C.FEC' +
        'HA, C.S_BASES, C.S_CUOTA_IVA, C.S_CUOTA_RE,'
      '       C.LIQUIDO, I_FINANCIACION, C.MONEDA, C.ID_E, F.TERCERO'
      'FROM GES_CABECERAS_E C'
      'JOIN GES_CABECERAS_E_FAC F ON C.ID_E = F.ID_E'
      'WHERE'
      'CAST(:SIGNO AS CHAR(1)) = '#39'A'#39' AND'
      'C.EMPRESA = :EMPRESA AND'
      'C.CANAL = :CANAL AND'
      'C.TIPO = '#39'FAP'#39' AND'
      'F.TERCERO = :TERCERO AND'
      'F.FECHA_CON BETWEEN :D_FECHA AND :H_FECHA'
      ''
      'UNION'
      ''
      
        'SELECT F.FECHA_CON, C.SERIE || '#39'/'#39' || C.RIG NUM_FACTURA, C.TIPO,' +
        ' C.SERIE, C.RIG, C.FECHA, C.S_BASES, C.S_CUOTA_IVA, C.S_CUOTA_RE' +
        ','
      '       C.LIQUIDO, I_FINANCIACION, C.MONEDA, C.ID_S, C.TERCERO'
      'FROM GES_CABECERAS_S C'
      'JOIN GES_CABECERAS_S_FAC F ON C.ID_S = F.ID_S'
      'WHERE'
      'CAST(:SIGNO AS CHAR(1)) = '#39'B'#39' AND'
      'C.EMPRESA = :EMPRESA AND'
      'C.CANAL = :CANAL AND'
      'C.TIPO = '#39'FAC'#39' AND'
      'C.TERCERO = :TERCERO AND'
      'F.FECHA_CON BETWEEN :D_FECHA AND :H_FECHA')
    UniDirectional = False
    AutoCalcFields = False
    DataSource = DSQSPCarta347
    Left = 40
    Top = 160
  end
  object DSxFacturas347: TDataSource
    DataSet = xFacturas347
    Left = 160
    Top = 160
  end
  object frDBxFacturas347: TfrDBDataSet
    DataSource = DSxFacturas347
    Left = 296
    Top = 160
  end
  object frDBxImportesDeclarar: TfrDBDataSet
    DataSource = DSImportesDeclarar
    Left = 296
    Top = 400
  end
end
