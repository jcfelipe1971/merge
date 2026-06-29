object IsoDMConfiguracion: TIsoDMConfiguracion
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 622
  Top = 185
  Height = 180
  Width = 231
  object TLocal: TFIBTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    Left = 160
    Top = 16
  end
  object QMConfig: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ISO_CONFIGURACION'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO ISO_CONFIGURACION'
      
        '  (ID,VALORACION_MANUAL,VALORACION_INC_PED,VALOR_COSTE_B,VALOR_C' +
        'OSTE_C,VALOR_ENTREGAS_A,VALOR_ENTREGAS_B,VALOR_ENTREGAS_C,VALORA' +
        'CION_COSTE,VALORACION_ENTREGAS,VALOR_INC_PED_A,VALOR_INC_PED_B,V' +
        'ALOR_INC_PED_C,VALOR_COSTE_A,VALOR_MANUAL_A,VALOR_MANUAL_B,VALOR' +
        '_MANUAL_C)'
      'VALUES'
      
        '  (?ID,?VALORACION_MANUAL,?VALORACION_INC_PED,?VALOR_COSTE_B,?VA' +
        'LOR_COSTE_C,?VALOR_ENTREGAS_A,?VALOR_ENTREGAS_B,?VALOR_ENTREGAS_' +
        'C,?VALORACION_COSTE,?VALORACION_ENTREGAS,?VALOR_INC_PED_A,?VALOR' +
        '_INC_PED_B,?VALOR_INC_PED_C,?VALOR_COSTE_A,?VALOR_MANUAL_A,?VALO' +
        'R_MANUAL_B,?VALOR_MANUAL_C)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ISO_CONFIGURACION'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM ISO_CONFIGURACION')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ISO_CONFIGURACION'
      'SET'
      '  VALORACION_MANUAL=?VALORACION_MANUAL '
      '  ,VALORACION_INC_PED=?VALORACION_INC_PED '
      '  ,VALOR_ENTREGAS_A=?VALOR_ENTREGAS_A '
      '  ,VALOR_ENTREGAS_B=?VALOR_ENTREGAS_B '
      '  ,VALOR_ENTREGAS_C=?VALOR_ENTREGAS_C '
      '  ,VALORACION_COSTE=?VALORACION_COSTE '
      '  ,VALORACION_ENTREGAS=?VALORACION_ENTREGAS '
      '  ,VALOR_INC_PED_A=?VALOR_INC_PED_A '
      '  ,VALOR_INC_PED_B=?VALOR_INC_PED_B '
      '  ,VALOR_INC_PED_C=?VALOR_INC_PED_C '
      '  ,VALOR_COSTE_A=?VALOR_COSTE_A '
      '  ,VALOR_COSTE_B=?VALOR_COSTE_B'
      '  ,VALOR_COSTE_C=?VALOR_COSTE_C'
      '  ,VALOR_MANUAL_A=?VALOR_MANUAL_A'
      '  ,VALOR_MANUAL_B=?VALOR_MANUAL_B'
      '  ,VALOR_MANUAL_C=?VALOR_MANUAL_C'
      'WHERE'
      '  ID=?ID ')
    AfterDelete = Graba
    AfterOpen = QMConfigAfterOpen
    AfterPost = Graba
    ClavesPrimarias.Strings = (
      'ID')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ISO_CONFIGURACION'
    UpdateTransaction = TLocal
    Left = 20
    Top = 12
    object QMConfigID: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID'
    end
    object QMConfigVALORACION_MANUAL: TIntegerField
      DisplayLabel = 'Valoracion Manual'
      FieldName = 'VALORACION_MANUAL'
    end
    object QMConfigVALORACION_INC_PED: TIntegerField
      DisplayLabel = 'Valoracion Inc. Ped.'
      FieldName = 'VALORACION_INC_PED'
    end
    object QMConfigVALORACION_COSTE: TIntegerField
      DisplayLabel = 'Valoracion Coste'
      FieldName = 'VALORACION_COSTE'
    end
    object QMConfigVALORACION_ENTREGAS: TIntegerField
      DisplayLabel = 'Valoracion Entregas'
      FieldName = 'VALORACION_ENTREGAS'
    end
    object QMConfigVALOR_INC_PED_A: TIntegerField
      DisplayLabel = 'Valor Inc. Ped. A'
      FieldName = 'VALOR_INC_PED_A'
    end
    object QMConfigVALOR_INC_PED_B: TIntegerField
      DisplayLabel = 'Valor Inc. Ped. B'
      FieldName = 'VALOR_INC_PED_B'
    end
    object QMConfigVALOR_INC_PED_C: TIntegerField
      DisplayLabel = 'Valor Inc. Ped. C'
      FieldName = 'VALOR_INC_PED_C'
    end
    object QMConfigVALOR_COSTE_A: TIntegerField
      DisplayLabel = 'Valor Coste A'
      FieldName = 'VALOR_COSTE_A'
    end
    object QMConfigVALOR_COSTE_B: TIntegerField
      DisplayLabel = 'Valor Coste B'
      FieldName = 'VALOR_COSTE_B'
    end
    object QMConfigVALOR_COSTE_C: TIntegerField
      DisplayLabel = 'Valor Coste C'
      FieldName = 'VALOR_COSTE_C'
    end
    object QMConfigVALOR_ENTREGAS_A: TIntegerField
      DisplayLabel = 'Valor Entregas A'
      FieldName = 'VALOR_ENTREGAS_A'
    end
    object QMConfigVALOR_ENTREGAS_B: TIntegerField
      DisplayLabel = 'Valor Entregas B'
      FieldName = 'VALOR_ENTREGAS_B'
    end
    object QMConfigVALOR_ENTREGAS_C: TIntegerField
      DisplayLabel = 'Valor Entregas C'
      FieldName = 'VALOR_ENTREGAS_C'
    end
    object QMConfigVALOR_MANUAL_A: TIntegerField
      DisplayLabel = 'Valor Manual A'
      FieldName = 'VALOR_MANUAL_A'
    end
    object QMConfigVALOR_MANUAL_B: TIntegerField
      DisplayLabel = 'Valor Manual B'
      FieldName = 'VALOR_MANUAL_B'
    end
    object QMConfigVALOR_MANUAL_C: TIntegerField
      DisplayLabel = 'Valor Manual C'
      FieldName = 'VALOR_MANUAL_C'
    end
  end
  object DSConfig: TDataSource
    DataSet = QMConfig
    Left = 84
    Top = 12
  end
end
