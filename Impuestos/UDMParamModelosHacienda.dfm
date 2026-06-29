object DMParamModelosHacienda: TDMParamModelosHacienda
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 505
  Top = 229
  Height = 249
  Width = 352
  object QMModelos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_MODELOS_HACIENDA'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_MODELOS_HACIENDA'
      
        '  (EMPRESA,'#13#10'EJERCICIO,CANAL,DELEGACION,ADMINISTRACION,COD_ADMIN' +
        'ISTRACION,DECLARANTE_NIF,DECLARANTE_NOMBRE,DECLARANTE_TIPO_CALLE' +
        ',DECLARANTE_CALLE,DECLARANTE_NUMERO,'#13#10'DECLARANTE_ESCALERA,DECLAR' +
        'ANTE_PISO,DECLARANTE_PUERTA,DECLARANTE_CODIGO_POSTAL,DECLARANTE_' +
        'MUNICIPIO,DECLARANTE_PROVINCIA,DECLARANTE_TELEFONO,DECLARANTE_EN' +
        'TIDAD,DECLARANTE_SUCURSAL,DECLARANTE_DC,'#13#10'DECLARANTE_CUENTA,M_11' +
        '0_EFECTIVO,M_115_EFECTIVO,M_300_EFECTIVO,PRESENTADOR_NIF,PRESENT' +
        'ADOR_NOMBRE,PRESENTADOR_TIPO_CALLE,PRESENTADOR_CALLE,PRESENTADOR' +
        '_NUMERO,PRESENTADOR_ESCALERA,'#13#10'PRESENTADOR_PISO,PRESENTADOR_PUER' +
        'TA,PRESENTADOR_CODIGO_POSTAL,PRESENTADOR_MUNICIPIO,PRESENTADOR_P' +
        'ROVINCIA,PRESENTADOR_TELEFONO,DECLARANTE_IBAN,DECLARANTE_BIC,M_3' +
        '03_EFECTIVO,DEVOLUCION_MENSUAL_M303,'#13#10'DEVOLUCION_MENSUAL_M349,CE' +
        'RTIFICADO,CERTIFICADO_LROE_FICHERO,CERTIFICADO_LROE_CLAVE,DEVOLU' +
        'CION_MENSUAL_M592,UTILIZA_SII,UTILIZA_TICKETBAI,UTILIZA_VERIFACT' +
        'U,VERIFACTU_MODO_PRUEBAS)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?EJERCICIO,?CANAL,?DELEGACION,?ADMINISTRACION,?COD' +
        '_ADMINISTRACION,?DECLARANTE_NIF,?DECLARANTE_NOMBRE,?DECLARANTE_T' +
        'IPO_CALLE,?DECLARANTE_CALLE,?DECLARANTE_NUMERO,'#13#10'?DECLARANTE_ESC' +
        'ALERA,?DECLARANTE_PISO,?DECLARANTE_PUERTA,?DECLARANTE_CODIGO_POS' +
        'TAL,?DECLARANTE_MUNICIPIO,?DECLARANTE_PROVINCIA,?DECLARANTE_TELE' +
        'FONO,?DECLARANTE_ENTIDAD,?DECLARANTE_SUCURSAL,?DECLARANTE_DC,'#13#10'?' +
        'DECLARANTE_CUENTA,?M_110_EFECTIVO,?M_115_EFECTIVO,?M_300_EFECTIV' +
        'O,?PRESENTADOR_NIF,?PRESENTADOR_NOMBRE,?PRESENTADOR_TIPO_CALLE,?' +
        'PRESENTADOR_CALLE,?PRESENTADOR_NUMERO,?PRESENTADOR_ESCALERA,'#13#10'?P' +
        'RESENTADOR_PISO,?PRESENTADOR_PUERTA,?PRESENTADOR_CODIGO_POSTAL,?' +
        'PRESENTADOR_MUNICIPIO,?PRESENTADOR_PROVINCIA,?PRESENTADOR_TELEFO' +
        'NO,?DECLARANTE_IBAN,?DECLARANTE_BIC,?M_303_EFECTIVO,?DEVOLUCION_' +
        'MENSUAL_M303,'#13#10'?DEVOLUCION_MENSUAL_M349,?CERTIFICADO,?CERTIFICAD' +
        'O_LROE_FICHERO,?CERTIFICADO_LROE_CLAVE,?DEVOLUCION_MENSUAL_M592,' +
        '?UTILIZA_SII,?UTILIZA_TICKETBAI,?UTILIZA_VERIFACTU,?VERIFACTU_MO' +
        'DO_PRUEBAS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_MODELOS_HACIENDA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM EMP_MODELOS_HACIENDA'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'EJERCICIO = :EJERCICIO AND'
      'CANAL = :CANAL')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_MODELOS_HACIENDA'
      'SET'
      '  DELEGACION=?DELEGACION '
      '  ,ADMINISTRACION=?ADMINISTRACION '
      '  ,COD_ADMINISTRACION=?COD_ADMINISTRACION '
      '  ,DECLARANTE_NIF=?DECLARANTE_NIF '
      '  ,DECLARANTE_NOMBRE=?DECLARANTE_NOMBRE '
      '  ,DECLARANTE_TIPO_CALLE=?DECLARANTE_TIPO_CALLE '
      '  ,DECLARANTE_CALLE=?DECLARANTE_CALLE '
      '  ,DECLARANTE_NUMERO=?DECLARANTE_NUMERO '
      '  ,DECLARANTE_ESCALERA=?DECLARANTE_ESCALERA '
      '  ,DECLARANTE_PISO=?DECLARANTE_PISO '
      '  ,DECLARANTE_PUERTA=?DECLARANTE_PUERTA '
      '  ,DECLARANTE_CODIGO_POSTAL=?DECLARANTE_CODIGO_POSTAL '
      '  ,DECLARANTE_MUNICIPIO=?DECLARANTE_MUNICIPIO '
      '  ,DECLARANTE_PROVINCIA=?DECLARANTE_PROVINCIA '
      '  ,DECLARANTE_TELEFONO=?DECLARANTE_TELEFONO '
      '  ,DECLARANTE_ENTIDAD=?DECLARANTE_ENTIDAD '
      '  ,DECLARANTE_SUCURSAL=?DECLARANTE_SUCURSAL '
      '  ,DECLARANTE_DC=?DECLARANTE_DC '
      '  ,DECLARANTE_CUENTA=?DECLARANTE_CUENTA '
      '  ,M_110_EFECTIVO=?M_110_EFECTIVO '
      '  ,M_115_EFECTIVO=?M_115_EFECTIVO '
      '  ,M_300_EFECTIVO=?M_300_EFECTIVO '
      '  ,PRESENTADOR_NIF=?PRESENTADOR_NIF '
      '  ,PRESENTADOR_NOMBRE=?PRESENTADOR_NOMBRE '
      '  ,PRESENTADOR_TIPO_CALLE=?PRESENTADOR_TIPO_CALLE '
      '  ,PRESENTADOR_CALLE=?PRESENTADOR_CALLE '
      '  ,PRESENTADOR_NUMERO=?PRESENTADOR_NUMERO '
      '  ,PRESENTADOR_ESCALERA=?PRESENTADOR_ESCALERA '
      '  ,PRESENTADOR_PISO=?PRESENTADOR_PISO '
      '  ,PRESENTADOR_PUERTA=?PRESENTADOR_PUERTA '
      '  ,PRESENTADOR_CODIGO_POSTAL=?PRESENTADOR_CODIGO_POSTAL '
      '  ,PRESENTADOR_MUNICIPIO=?PRESENTADOR_MUNICIPIO '
      '  ,PRESENTADOR_PROVINCIA=?PRESENTADOR_PROVINCIA '
      '  ,PRESENTADOR_TELEFONO=?PRESENTADOR_TELEFONO '
      '  ,DECLARANTE_IBAN=?DECLARANTE_IBAN '
      '  ,DECLARANTE_BIC=?DECLARANTE_BIC '
      '  ,M_303_EFECTIVO=?M_303_EFECTIVO '
      '  ,DEVOLUCION_MENSUAL_M303=?DEVOLUCION_MENSUAL_M303 '
      '  ,DEVOLUCION_MENSUAL_M349=?DEVOLUCION_MENSUAL_M349 '
      '  ,CERTIFICADO=?CERTIFICADO '
      '  ,CERTIFICADO_LROE_FICHERO=?CERTIFICADO_LROE_FICHERO '
      '  ,CERTIFICADO_LROE_CLAVE=?CERTIFICADO_LROE_CLAVE '
      '  ,DEVOLUCION_MENSUAL_M592=?DEVOLUCION_MENSUAL_M592 '
      '  ,UTILIZA_SII=?UTILIZA_SII '
      '  ,UTILIZA_TICKETBAI=?UTILIZA_TICKETBAI '
      '  ,UTILIZA_VERIFACTU=?UTILIZA_VERIFACTU '
      '  ,VERIFACTU_MODO_PRUEBAS=?VERIFACTU_MODO_PRUEBAS '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL ')
    AfterPost = Graba
    OnNewRecord = QMModelosNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA'
      'EJERCICIO'
      'CANAL')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_MODELOS_HACIENDA'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 42
    Top = 24
    object QMModelosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMModelosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMModelosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMModelosDELEGACION: TFIBStringField
      DisplayLabel = 'Delegacion'
      FieldName = 'DELEGACION'
      Size = 40
    end
    object QMModelosADMINISTRACION: TFIBStringField
      DisplayLabel = 'Administracion'
      FieldName = 'ADMINISTRACION'
      Size = 40
    end
    object QMModelosCOD_ADMINISTRACION: TIntegerField
      DisplayLabel = 'Cod. Administracion'
      FieldName = 'COD_ADMINISTRACION'
    end
    object QMModelosDECLARANTE_NIF: TFIBStringField
      DisplayLabel = 'NIF'
      FieldName = 'DECLARANTE_NIF'
      Size = 15
    end
    object QMModelosDECLARANTE_NOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'DECLARANTE_NOMBRE'
      Size = 60
    end
    object QMModelosDECLARANTE_TIPO_CALLE: TFIBStringField
      DisplayLabel = 'Tipo Calle'
      FieldName = 'DECLARANTE_TIPO_CALLE'
      Size = 15
    end
    object QMModelosDECLARANTE_CALLE: TFIBStringField
      DisplayLabel = 'Calle'
      FieldName = 'DECLARANTE_CALLE'
      Size = 60
    end
    object QMModelosDECLARANTE_NUMERO: TFIBStringField
      DisplayLabel = 'Numero'
      FieldName = 'DECLARANTE_NUMERO'
      Size = 15
    end
    object QMModelosDECLARANTE_ESCALERA: TFIBStringField
      DisplayLabel = 'Escalera'
      FieldName = 'DECLARANTE_ESCALERA'
      Size = 15
    end
    object QMModelosDECLARANTE_PISO: TFIBStringField
      DisplayLabel = 'Piso'
      FieldName = 'DECLARANTE_PISO'
      Size = 15
    end
    object QMModelosDECLARANTE_PUERTA: TFIBStringField
      DisplayLabel = 'Puerta'
      FieldName = 'DECLARANTE_PUERTA'
      Size = 15
    end
    object QMModelosDECLARANTE_CODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'DECLARANTE_CODIGO_POSTAL'
      Size = 15
    end
    object QMModelosDECLARANTE_MUNICIPIO: TFIBStringField
      DisplayLabel = 'Municipio'
      FieldName = 'DECLARANTE_MUNICIPIO'
      Size = 40
    end
    object QMModelosDECLARANTE_PROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'DECLARANTE_PROVINCIA'
      Size = 40
    end
    object QMModelosDECLARANTE_TELEFONO: TFIBStringField
      DisplayLabel = 'Telefono'
      FieldName = 'DECLARANTE_TELEFONO'
    end
    object QMModelosDECLARANTE_ENTIDAD: TFIBStringField
      DisplayLabel = 'Entidad'
      FieldName = 'DECLARANTE_ENTIDAD'
      Size = 4
    end
    object QMModelosDECLARANTE_SUCURSAL: TFIBStringField
      DisplayLabel = 'Sucursal'
      FieldName = 'DECLARANTE_SUCURSAL'
      Size = 4
    end
    object QMModelosDECLARANTE_DC: TFIBStringField
      DisplayLabel = 'D.C.'
      FieldName = 'DECLARANTE_DC'
      Size = 2
    end
    object QMModelosDECLARANTE_IBAN: TFIBStringField
      DisplayLabel = 'IBAN'
      FieldName = 'DECLARANTE_IBAN'
      Size = 34
    end
    object QMModelosDECLARANTE_BIC: TFIBStringField
      DisplayLabel = 'BIC'
      FieldName = 'DECLARANTE_BIC'
      Size = 30
    end
    object QMModelosM_110_EFECTIVO: TIntegerField
      DisplayLabel = 'Mod. 110 Efect.'
      FieldName = 'M_110_EFECTIVO'
    end
    object QMModelosM_115_EFECTIVO: TIntegerField
      DisplayLabel = 'Mod. 114 Efect.'
      FieldName = 'M_115_EFECTIVO'
    end
    object QMModelosM_300_EFECTIVO: TIntegerField
      DisplayLabel = 'Mod. 300 Efect.'
      FieldName = 'M_300_EFECTIVO'
    end
    object QMModelosPRESENTADOR_NIF: TFIBStringField
      DisplayLabel = 'NIF'
      FieldName = 'PRESENTADOR_NIF'
      Size = 15
    end
    object QMModelosPRESENTADOR_NOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'PRESENTADOR_NOMBRE'
      Size = 60
    end
    object QMModelosPRESENTADOR_TIPO_CALLE: TFIBStringField
      DisplayLabel = 'Tipo Calle'
      FieldName = 'PRESENTADOR_TIPO_CALLE'
      Size = 15
    end
    object QMModelosPRESENTADOR_CALLE: TFIBStringField
      DisplayLabel = 'Calle'
      FieldName = 'PRESENTADOR_CALLE'
      Size = 60
    end
    object QMModelosPRESENTADOR_NUMERO: TFIBStringField
      DisplayLabel = 'Numero'
      FieldName = 'PRESENTADOR_NUMERO'
      Size = 15
    end
    object QMModelosPRESENTADOR_ESCALERA: TFIBStringField
      DisplayLabel = 'Escalera'
      FieldName = 'PRESENTADOR_ESCALERA'
      Size = 15
    end
    object QMModelosPRESENTADOR_PISO: TFIBStringField
      DisplayLabel = 'Piso'
      FieldName = 'PRESENTADOR_PISO'
      Size = 15
    end
    object QMModelosPRESENTADOR_PUERTA: TFIBStringField
      DisplayLabel = 'Puerta'
      FieldName = 'PRESENTADOR_PUERTA'
      Size = 15
    end
    object QMModelosPRESENTADOR_CODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'PRESENTADOR_CODIGO_POSTAL'
      Size = 15
    end
    object QMModelosPRESENTADOR_MUNICIPIO: TFIBStringField
      DisplayLabel = 'Municipio'
      FieldName = 'PRESENTADOR_MUNICIPIO'
      Size = 40
    end
    object QMModelosPRESENTADOR_PROVINCIA: TFIBStringField
      DisplayLabel = 'Provincia'
      FieldName = 'PRESENTADOR_PROVINCIA'
      Size = 40
    end
    object QMModelosPRESENTADOR_TELEFONO: TFIBStringField
      DisplayLabel = 'Telefono'
      FieldName = 'PRESENTADOR_TELEFONO'
    end
    object QMModelosDECLARANTE_CUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'DECLARANTE_CUENTA'
    end
    object QMModelosM_303_EFECTIVO: TIntegerField
      DisplayLabel = 'Mod. 303 Efect.'
      FieldName = 'M_303_EFECTIVO'
    end
    object QMModelosDEVOLUCION_MENSUAL_M303: TIntegerField
      DisplayLabel = 'Devol. Mensual del Modelo 303'
      FieldName = 'DEVOLUCION_MENSUAL_M303'
    end
    object QMModelosDEVOLUCION_MENSUAL_M349: TIntegerField
      DisplayLabel = 'Devol. Mensual del Modelo 349'
      FieldName = 'DEVOLUCION_MENSUAL_M349'
    end
    object QMModelosCERTIFICADO: TFIBStringField
      DisplayLabel = 'Certificado'
      FieldName = 'CERTIFICADO'
      Size = 60
    end
    object QMModelosCERTIFICADO_LROE_FICHERO: TFIBStringField
      DisplayLabel = 'Fichero Certificado LROE'
      FieldName = 'CERTIFICADO_LROE_FICHERO'
      Size = 256
    end
    object QMModelosCERTIFICADO_LROE_CLAVE: TFIBStringField
      DisplayLabel = 'Clave Certificado LROE'
      FieldName = 'CERTIFICADO_LROE_CLAVE'
      Size = 256
    end
    object QMModelosDEVOLUCION_MENSUAL_M592: TIntegerField
      DisplayLabel = 'Devol. Mensual del Modelo 592'
      FieldName = 'DEVOLUCION_MENSUAL_M592'
    end
    object QMModelosUTILIZA_SII: TIntegerField
      DisplayLabel = 'Utiliza SII'
      FieldName = 'UTILIZA_SII'
    end
    object QMModelosUTILIZA_TICKETBAI: TIntegerField
      DisplayLabel = 'Utiliza TicketBAI'
      FieldName = 'UTILIZA_TICKETBAI'
    end
    object QMModelosUTILIZA_VERIFACTU: TIntegerField
      DisplayLabel = 'Utiliza Verifactu'
      FieldName = 'UTILIZA_VERIFACTU'
    end
    object QMModelosVERIFACTU_MODO_PRUEBAS: TIntegerField
      DisplayLabel = 'Verifactu en Pruebas'
      FieldName = 'VERIFACTU_MODO_PRUEBAS'
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 216
    Top = 22
  end
  object DSQMModelos: TDataSource
    DataSet = QMModelos
    Left = 124
    Top = 24
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 216
    Top = 86
  end
end
