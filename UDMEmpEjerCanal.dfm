object DMEmpEjerCanal: TDMEmpEjerCanal
  OldCreateOrder = False
  OnCreate = DMEmpEjerCanalCreate
  OnDestroy = DMEmpEjerCanalDestroy
  Left = 793
  Top = 273
  Height = 338
  Width = 420
  object xEjercicios: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT DISTINCT * FROM VER_EMPRESAS_EJERCICIOS       '
      'WHERE EMPRESA=?EMPRESA '
      'ORDER BY EJERCICIO DESC')
    UniDirectional = False
    Left = 40
    Top = 168
  end
  object xCanales: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_CANALES_ACTIVOS'
      'WHERE EMPRESA=?EMPRESA AND EJERCICIO=?EJERCICIO'
      'ORDER BY CANAL')
    UniDirectional = False
    Left = 40
    Top = 120
  end
  object xEmpresas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT E.*'
      'FROM SYS_EMPRESAS E'
      'WHERE'
      'E.ABIERTA = 1 AND'
      'NOT EXISTS(SELECT EMPRESA'
      '           FROM SYS_USUARIOS_PERFIL_EEC'
      '           WHERE'
      '           PERFIL = :PERFIL AND'
      '           EMPRESA = E.EMPRESA AND'
      '           EJERCICIO = 0 AND'
      '           CANAL = 0 AND'
      '           SERIE = '#39#39')'
      'ORDER BY E.EMPRESA ')
    UniDirectional = False
    AfterOpen = xEmpresasAfterOpen
    Left = 40
    Top = 24
  end
  object ILEmpresas: TImageList
    Height = 75
    Masked = False
    Width = 80
    Left = 248
    Top = 24
  end
  object DSxEmpresas: TDataSource
    DataSet = xEmpresas
    Left = 144
    Top = 24
  end
  object DSxTerceroEmpresa: TDataSource
    DataSet = xTerceroEmpresa
    Left = 144
    Top = 72
  end
  object xTerceroEmpresa: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      
        'SELECT TERCERO, NIF, TELEFONO01, TELEFONO02, TELEFAX, EMAIL, WEB' +
        ', TIPO_RAZON'
      'FROM VER_TERCEROS_EDICION'
      'WHERE'
      'TERCERO = ?TERCERO')
    UniDirectional = False
    DataSource = DSxEmpresas
    Left = 40
    Top = 72
    object xTerceroEmpresaTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xTerceroEmpresaNIF: TFIBStringField
      DisplayLabel = 'N.I.F.'
      FieldName = 'NIF'
    end
    object xTerceroEmpresaTELEFONO01: TFIBStringField
      DisplayLabel = 'Tel. 1'
      FieldName = 'TELEFONO01'
    end
    object xTerceroEmpresaTELEFONO02: TFIBStringField
      DisplayLabel = 'Tel. 2'
      FieldName = 'TELEFONO02'
    end
    object xTerceroEmpresaTELEFAX: TFIBStringField
      DisplayLabel = 'Fax'
      FieldName = 'TELEFAX'
    end
    object xTerceroEmpresaEMAIL: TFIBStringField
      DisplayLabel = 'Email'
      FieldName = 'EMAIL'
      Size = 100
    end
    object xTerceroEmpresaWEB: TFIBStringField
      DisplayLabel = 'Web'
      FieldName = 'WEB'
      Size = 60
    end
    object xTerceroEmpresaTIPO_RAZON: TFIBStringField
      DisplayLabel = 'Tipo Razon'
      FieldName = 'TIPO_RAZON'
      Size = 4
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 352
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
    Left = 352
    Top = 72
  end
end
