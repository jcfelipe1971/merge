object DMParamApuntes: TDMParamApuntes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 536
  Top = 303
  Height = 379
  Width = 457
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 280
    Top = 8
  end
  object xGrupoAsientos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from sys_texto_grupo_asientos'
      'where cod_grup_asiento = ?cod_grup_asiento')
    UniDirectional = False
    Left = 40
    Top = 152
    object xGrupoAsientosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
    end
    object xGrupoAsientosCOD_GRUP_ASIENTO: TIntegerField
      DisplayLabel = 'Grupo Asiento'
      FieldName = 'COD_GRUP_ASIENTO'
    end
  end
  object DSxGruposAsientos: TDataSource
    DataSet = xGrupoAsientos
    Left = 152
    Top = 152
  end
  object xAsientos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TEXTO_ASIENTO'
      'WHERE COD_GRUP_ASIENTO=?COD_GRUP_ASIENTO AND'
      '               COD_ASIENTO            =?COD_ASIENTO')
    UniDirectional = False
    Left = 40
    Top = 56
    object xAsientosCOD_GRUP_ASIENTO: TIntegerField
      DisplayLabel = 'Grupo Asiento'
      FieldName = 'COD_GRUP_ASIENTO'
    end
    object xAsientosCOD_ASIENTO: TIntegerField
      DisplayLabel = 'Cod. Asiento'
      FieldName = 'COD_ASIENTO'
    end
    object xAsientosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object xApuntes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TEXTO_ASIENTO_APUNTES'
      'WHERE COD_GRUP_ASIENTO=?COD_GRUP_ASIENTO AND'
      
        '               COD_ASIENTO            =?COD_ASIENTO             ' +
        'AND'
      '               COD_APUNTE             =?COD_APUNTE           '
      '')
    UniDirectional = False
    Left = 40
    Top = 104
    object xApuntesCOD_GRUP_ASIENTO: TIntegerField
      DisplayLabel = 'Grupo Asiento'
      FieldName = 'COD_GRUP_ASIENTO'
    end
    object xApuntesCOD_ASIENTO: TIntegerField
      DisplayLabel = 'Cod. Asiento'
      FieldName = 'COD_ASIENTO'
    end
    object xApuntesCOD_APUNTE: TIntegerField
      DisplayLabel = 'Cod. Apunte'
      FieldName = 'COD_APUNTE'
    end
    object xApuntesTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxAsientos: TDataSource
    DataSet = xAsientos
    Left = 152
    Top = 56
  end
  object DSxApuntes: TDataSource
    DataSet = xApuntes
    Left = 152
    Top = 104
  end
  object DSxInsertaVariables: TDataSource
    DataSet = xInsertaVariables
    Left = 152
    Top = 8
  end
  object xInsertaVariables: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TEXTO_ASIENTOS_ORIG'
      'WHERE'
      '  SK=?SK ')
    SelectSQL.Strings = (
      'select titulo from sys_texto_asientos_orig'
      'where cod_grup_asiento = ?Grupo'
      '    and cod_asiento          = ?Asiento'
      '    and cod_apunte           =?Apunte'
      '    and tipo = 1'
      '                                      ')
    UniDirectional = False
    ClavesPrimarias.Strings = (
      'SK ')
    Opciones = []
    AutoSQLdeVistas = False
    TableName = 'SYS_TEXTO_ASIENTOS_ORIG'
    Left = 40
    Top = 8
    object xInsertaVariablesTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object SPGrabaTexto: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure g_textofinal_graba (?empresa, ?Grupo, ?Asiento' +
        ', ?Apunte,'
      ' ?titulo_campo, ?orden)')
    Transaction = TLocal
    AutoTrans = True
    Left = 280
    Top = 56
  end
  object xInsertaFormatoF: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from sys_texto_asientos_final'
      'where cod_grup_asiento = ?Grupo'
      '    and cod_asiento          = ?Asiento'
      '    and cod_apunte           =?Apunte '
      '    and EMPRESA = ?EMPRESA'
      'order by orden')
    UniDirectional = False
    Opciones = []
    AutoSQLdeVistas = False
    Left = 40
    Top = 200
    object xInsertaFormatoFTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxInsertaFormatoF: TDataSource
    DataSet = xInsertaFormatoF
    Left = 152
    Top = 200
  end
  object xInsertaFormatoO: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from sys_texto_asientos_orig'
      'where cod_grup_asiento = ?Grupo'
      '    and cod_asiento          = ?Asiento'
      '    and cod_apunte           =?Apunte  '
      '    and defecto                  = 1'
      'order by orden')
    UniDirectional = False
    Opciones = []
    AutoSQLdeVistas = False
    Left = 40
    Top = 248
  end
  object DSInsertaFormatoO: TDataSource
    DataSet = xInsertaFormatoO
    Left = 152
    Top = 248
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 392
    Top = 8
  end
end
