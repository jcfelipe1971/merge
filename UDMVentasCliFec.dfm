object DMVentasCliFec: TDMVentasCliFec
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 1226
  Top = 171
  Height = 261
  Width = 434
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 32
    Top = 8
  end
  object DSxClienteFec: TDataSource
    DataSet = xClienteFec
    Left = 112
    Top = 56
  end
  object xClienteFec: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT F.SERIE, MAX(RIG) RIG, F.CLIENTE, F.TERCERO, T.NOMBRE_R_S' +
        'OCIAL, T.TELEFONO01, MAX(F.FECHA) FECHA, '#39'NOW'#39' - MAX(F.FECHA) DI' +
        'AS, COUNT(F.RIG) CANTIDAD'
      'FROM GES_CABECERAS_S F'
      'INNER JOIN SYS_TERCEROS T'
      'ON F.TERCERO = T.TERCERO'
      'WHERE'
      'F.EMPRESA = ?EMPRESA AND'
      'F.CANAL = ?CANAL AND'
      'F.TIPO = '#39'FAC'#39
      'GROUP BY 1, 3, 4, 5, 6'
      'ORDER BY 1, 7 DESC')
    UniDirectional = False
    Left = 32
    Top = 56
    object xClienteFecSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xClienteFecCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xClienteFecTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xClienteFecNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xClienteFecTELEFONO01: TFIBStringField
      DisplayLabel = 'Tel'#233'fono'
      FieldName = 'TELEFONO01'
    end
    object xClienteFecRIG: TIntegerField
      DisplayLabel = 'Factura'
      FieldName = 'RIG'
    end
    object xClienteFecFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object xClienteFecDIAS: TFloatField
      DisplayLabel = 'D'#237'as'
      FieldName = 'DIAS'
      DisplayFormat = '0'
    end
    object xClienteFecCANTIDAD: TIntegerField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
  end
  object frDBDSxVentasCliente: TfrDBDataSet
    DataSource = DSxClienteFec
    Left = 208
    Top = 56
  end
  object frHYVentasClientes: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Ventas por Cliente Uds. Secundarias'
    RebuildPrinter = False
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'FRF'
    Left = 208
    Top = 8
    ReportForm = {19000000}
  end
end
