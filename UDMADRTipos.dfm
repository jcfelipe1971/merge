object DMADRTipos: TDMADRTipos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 410
  Top = 305
  Height = 174
  Width = 246
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 174
    Top = 18
  end
  object QMADRTipos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ADR_TIPOS'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO ADR_TIPOS'
      
        '  (ID,ACTIVO,UN_NUMBER,NAME,CLASS,CLASIFICATION,PACKING_GROUP,LA' +
        'BELS,DANGER_NUMBER,TRANSPORT_CATEGORY,TUNEL_CODE,SPECIAL_PROVISI' +
        'ONS,LIMITED_QUANTITY,EXCEPTED_QUANTITY,PACKING_INSTRUCTIONS,SPEC' +
        'IAL_PACKING_PROVISIONS,MIXED_PACKING_PROVISIONS,PORTABLE_TANK_IN' +
        'STRUCTIONS,PORTABLE_TANK_SPECIAL_PROV,ADR_TANK_CODE,ADR_TANK_SPE' +
        'CIAL_PROV,VEHICLE,PACKAGES_SPECIAL_PROV,BULK_SPECIAL_PROV,LOADIN' +
        'G_SPECIAL_PROV,OPERATION_SPECIAL_PROV,CRITERIO_SELECCION,IDENTIF' +
        'ICACION_RIESGOS,APARTADO,LETRA,COD_NATURALEZA_PELIGRO,COD_MEDIDA' +
        'S_PROTECCION)'
      'VALUES'
      
        '  (?ID,?ACTIVO,?UN_NUMBER,?NAME,?CLASS,?CLASIFICATION,?PACKING_G' +
        'ROUP,?LABELS,?DANGER_NUMBER,?TRANSPORT_CATEGORY,?TUNEL_CODE,?SPE' +
        'CIAL_PROVISIONS,?LIMITED_QUANTITY,?EXCEPTED_QUANTITY,?PACKING_IN' +
        'STRUCTIONS,?SPECIAL_PACKING_PROVISIONS,?MIXED_PACKING_PROVISIONS' +
        ',?PORTABLE_TANK_INSTRUCTIONS,?PORTABLE_TANK_SPECIAL_PROV,?ADR_TA' +
        'NK_CODE,?ADR_TANK_SPECIAL_PROV,?VEHICLE,?PACKAGES_SPECIAL_PROV,?' +
        'BULK_SPECIAL_PROV,?LOADING_SPECIAL_PROV,?OPERATION_SPECIAL_PROV,' +
        '?CRITERIO_SELECCION,?IDENTIFICACION_RIESGOS,?APARTADO,?LETRA,?CO' +
        'D_NATURALEZA_PELIGRO,?COD_MEDIDAS_PROTECCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ADR_TIPOS'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM ADR_TIPOS'
      'ORDER BY LOADING_SPECIAL_PROV')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ADR_TIPOS'
      'SET'
      '  ACTIVO=?ACTIVO '
      '  ,UN_NUMBER=?UN_NUMBER '
      '  ,NAME=?NAME '
      '  ,CLASS=?CLASS '
      '  ,CLASIFICATION=?CLASIFICATION '
      '  ,PACKING_GROUP=?PACKING_GROUP '
      '  ,LABELS=?LABELS '
      '  ,DANGER_NUMBER=?DANGER_NUMBER '
      '  ,TRANSPORT_CATEGORY=?TRANSPORT_CATEGORY '
      '  ,TUNEL_CODE=?TUNEL_CODE '
      '  ,SPECIAL_PROVISIONS=?SPECIAL_PROVISIONS '
      '  ,LIMITED_QUANTITY=?LIMITED_QUANTITY '
      '  ,EXCEPTED_QUANTITY=?EXCEPTED_QUANTITY '
      '  ,PACKING_INSTRUCTIONS=?PACKING_INSTRUCTIONS '
      '  ,SPECIAL_PACKING_PROVISIONS=?SPECIAL_PACKING_PROVISIONS '
      '  ,MIXED_PACKING_PROVISIONS=?MIXED_PACKING_PROVISIONS '
      '  ,PORTABLE_TANK_INSTRUCTIONS=?PORTABLE_TANK_INSTRUCTIONS '
      '  ,PORTABLE_TANK_SPECIAL_PROV=?PORTABLE_TANK_SPECIAL_PROV '
      '  ,ADR_TANK_CODE=?ADR_TANK_CODE '
      '  ,ADR_TANK_SPECIAL_PROV=?ADR_TANK_SPECIAL_PROV '
      '  ,VEHICLE=?VEHICLE '
      '  ,PACKAGES_SPECIAL_PROV=?PACKAGES_SPECIAL_PROV '
      '  ,BULK_SPECIAL_PROV=?BULK_SPECIAL_PROV '
      '  ,LOADING_SPECIAL_PROV=?LOADING_SPECIAL_PROV '
      '  ,OPERATION_SPECIAL_PROV=?OPERATION_SPECIAL_PROV '
      '  ,CRITERIO_SELECCION=?CRITERIO_SELECCION '
      '  ,IDENTIFICACION_RIESGOS=?IDENTIFICACION_RIESGOS '
      '  ,APARTADO=?APARTADO '
      '  ,LETRA=?LETRA '
      '  ,COD_NATURALEZA_PELIGRO=?COD_NATURALEZA_PELIGRO '
      '  ,COD_MEDIDAS_PROTECCION=?COD_MEDIDAS_PROTECCION '
      'WHERE'
      '  ID=?ID ')
    BeforePost = QMADRTiposBeforePost
    OnNewRecord = QMADRTiposNewRecord
    ClavesPrimarias.Strings = (
      'ID ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ADR_TIPOS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 44
    Top = 16
    object QMADRTiposID: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID'
    end
    object QMADRTiposACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object QMADRTiposUN_NUMBER: TFIBStringField
      DisplayLabel = 'Numero UN'
      FieldName = 'UN_NUMBER'
      OnChange = QMADRTiposUN_NUMBERChange
      Size = 15
    end
    object QMADRTiposNAME: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'NAME'
      Size = 256
    end
    object QMADRTiposCLASS: TFIBStringField
      DisplayLabel = 'Clase'
      FieldName = 'CLASS'
      Size = 15
    end
    object QMADRTiposCLASIFICATION: TFIBStringField
      DisplayLabel = 'Clasificacion'
      FieldName = 'CLASIFICATION'
      Size = 15
    end
    object QMADRTiposPACKING_GROUP: TFIBStringField
      DisplayLabel = 'Grupo Embalaje'
      FieldName = 'PACKING_GROUP'
      Size = 15
    end
    object QMADRTiposLABELS: TFIBStringField
      DisplayLabel = 'Etiquetas'
      FieldName = 'LABELS'
    end
    object QMADRTiposDANGER_NUMBER: TFIBStringField
      DisplayLabel = 'Ident. Riesgo'
      FieldName = 'DANGER_NUMBER'
      Size = 15
    end
    object QMADRTiposTRANSPORT_CATEGORY: TFIBStringField
      DisplayLabel = 'Cat. Transporte'
      FieldName = 'TRANSPORT_CATEGORY'
      Size = 15
    end
    object QMADRTiposTUNEL_CODE: TFIBStringField
      DisplayLabel = 'Codigo Tunel'
      FieldName = 'TUNEL_CODE'
      Size = 15
    end
    object QMADRTiposSPECIAL_PROVISIONS: TFIBStringField
      DisplayLabel = 'Disposiciones Esp.'
      DisplayWidth = 100
      FieldName = 'SPECIAL_PROVISIONS'
      Size = 100
    end
    object QMADRTiposLIMITED_QUANTITY: TFIBStringField
      DisplayLabel = 'Cantidad Limitada'
      FieldName = 'LIMITED_QUANTITY'
    end
    object QMADRTiposEXCEPTED_QUANTITY: TFIBStringField
      DisplayLabel = 'Cantidad Exceptuada'
      FieldName = 'EXCEPTED_QUANTITY'
    end
    object QMADRTiposPACKING_INSTRUCTIONS: TFIBStringField
      DisplayLabel = 'Instrucciones Embalaje'
      FieldName = 'PACKING_INSTRUCTIONS'
      Size = 40
    end
    object QMADRTiposSPECIAL_PACKING_PROVISIONS: TFIBStringField
      DisplayLabel = 'Disp. Esp. de Embalaje'
      FieldName = 'SPECIAL_PACKING_PROVISIONS'
      Size = 100
    end
    object QMADRTiposMIXED_PACKING_PROVISIONS: TFIBStringField
      DisplayLabel = 'Disp. Esp. Embalaje Comun'
      FieldName = 'MIXED_PACKING_PROVISIONS'
      Size = 40
    end
    object QMADRTiposPORTABLE_TANK_INSTRUCTIONS: TFIBStringField
      DisplayLabel = 'Intrucciones Transporte'
      FieldName = 'PORTABLE_TANK_INSTRUCTIONS'
      Size = 40
    end
    object QMADRTiposPORTABLE_TANK_SPECIAL_PROV: TFIBStringField
      DisplayLabel = 'Disp. Especiales Transporte'
      FieldName = 'PORTABLE_TANK_SPECIAL_PROV'
      Size = 40
    end
    object QMADRTiposADR_TANK_CODE: TFIBStringField
      DisplayLabel = 'Cod. Tanque ADR'
      FieldName = 'ADR_TANK_CODE'
    end
    object QMADRTiposADR_TANK_SPECIAL_PROV: TFIBStringField
      DisplayLabel = 'Disp. Esp. Tanque ADR'
      FieldName = 'ADR_TANK_SPECIAL_PROV'
      Size = 100
    end
    object QMADRTiposVEHICLE: TFIBStringField
      DisplayLabel = 'Vehiculo'
      FieldName = 'VEHICLE'
    end
    object QMADRTiposPACKAGES_SPECIAL_PROV: TFIBStringField
      DisplayLabel = 'Disp. Esp. Bulto'
      FieldName = 'PACKAGES_SPECIAL_PROV'
      Size = 100
    end
    object QMADRTiposBULK_SPECIAL_PROV: TFIBStringField
      DisplayLabel = 'Disp. Esp. Granel'
      FieldName = 'BULK_SPECIAL_PROV'
      Size = 100
    end
    object QMADRTiposLOADING_SPECIAL_PROV: TFIBStringField
      DisplayLabel = 'Disp. Esp. Carga/Descarga.'
      FieldName = 'LOADING_SPECIAL_PROV'
      Size = 100
    end
    object QMADRTiposOPERATION_SPECIAL_PROV: TFIBStringField
      DisplayLabel = 'Disp. Esp. Manipulado'
      FieldName = 'OPERATION_SPECIAL_PROV'
      Size = 100
    end
    object QMADRTiposCRITERIO_SELECCION: TFIBStringField
      DisplayLabel = 'Criterio Seleccion'
      FieldName = 'CRITERIO_SELECCION'
      Size = 100
    end
    object QMADRTiposIDENTIFICACION_RIESGOS: TFIBStringField
      DisplayLabel = 'Identif. Riesgos'
      FieldName = 'IDENTIFICACION_RIESGOS'
      Size = 40
    end
    object QMADRTiposAPARTADO: TFIBStringField
      DisplayLabel = 'Apartado'
      FieldName = 'APARTADO'
      Size = 5
    end
    object QMADRTiposLETRA: TFIBStringField
      DisplayLabel = 'Letra'
      FieldName = 'LETRA'
      Size = 5
    end
    object QMADRTiposCOD_NATURALEZA_PELIGRO: TIntegerField
      DisplayLabel = 'Cod. Naturaleza'
      FieldName = 'COD_NATURALEZA_PELIGRO'
    end
    object QMADRTiposCOD_MEDIDAS_PROTECCION: TIntegerField
      DisplayLabel = 'Cod. Medidas Proteccion'
      FieldName = 'COD_MEDIDAS_PROTECCION'
    end
  end
  object DSQMADRTipos: TDataSource
    DataSet = QMADRTipos
    Left = 44
    Top = 76
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 172
    Top = 72
  end
end
