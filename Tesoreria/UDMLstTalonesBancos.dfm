object DMLstTalonesBancos: TDMLstTalonesBancos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 375
  Top = 124
  Height = 346
  Width = 460
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait'
      'read')
    Left = 48
    Top = 16
  end
  object xLstTalonesBancos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select * from G_LISTADO_TALONES(?empresa,?ejercicio,?canal,?fech' +
        'a_d,?fecha_h,?banco_d,?banco_h) order by talon')
    UniDirectional = False
    Left = 48
    Top = 64
    object xLstTalonesBancosTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xLstTalonesBancosTALON: TFIBStringField
      DisplayLabel = 'Talon'
      FieldName = 'TALON'
      Size = 35
    end
    object xLstTalonesBancosDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object xLstTalonesBancosBANCO: TIntegerField
      DisplayLabel = 'Banco'
      FieldName = 'BANCO'
    end
    object xLstTalonesBancosFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xLstTalonesBancosIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object xLstTalonesBancosCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object xLstTalonesBancosCUENTA_COBRO: TFIBStringField
      DisplayLabel = 'Cta. Cobro'
      FieldName = 'CUENTA_COBRO'
      Size = 15
    end
    object xLstTalonesBancosCONTADOR: TIntegerField
      DisplayLabel = 'Contador'
      FieldName = 'CONTADOR'
    end
    object xLstTalonesBancosTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 10
    end
    object xLstTalonesBancosLUGAR: TFIBStringField
      DisplayLabel = 'Lugar'
      FieldName = 'LUGAR'
      Size = 200
    end
  end
  object frTalonesBancos: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de diario de ventas'
    RebuildPrinter = False
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 160
    Top = 16
    ReportForm = {19000000}
  end
  object DSxLstTalonesBancos: TDataSource
    DataSet = xLstTalonesBancos
    Left = 160
    Top = 64
  end
  object frDBLstTalonesBancos: TfrDBDataSet
    DataSource = DSxLstTalonesBancos
    Left = 280
    Top = 64
  end
  object xBancoD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM EMP_BANCOS'
      'WHERE EMPRESA=?EMPRESA AND BANCO=?BANCO')
    UniDirectional = False
    Left = 48
    Top = 112
  end
  object DSxBancoD: TDataSource
    DataSet = xBancoD
    Left = 160
    Top = 112
  end
  object xBancoH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM EMP_BANCOS'
      'WHERE EMPRESA=?EMPRESA AND BANCO=?BANCO')
    UniDirectional = False
    Left = 48
    Top = 160
  end
  object DSxBancoH: TDataSource
    DataSet = xBancoH
    Left = 160
    Top = 160
  end
  object QMaxBanco: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select max(banco) as MAXIMO'
      '  from emp_bancos'
      '    where empresa = ?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 160
    Top = 208
  end
  object QMinBanco: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select min(banco) as MINIMO'
      '  from emp_bancos'
      '    where empresa = ?EMPRESA')
    Transaction = TLocal
    AutoTrans = True
    Left = 48
    Top = 208
  end
end
