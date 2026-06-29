object ZDMLstPunteoAsientos: TZDMLstPunteoAsientos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 502
  Top = 236
  Height = 248
  Width = 399
  object frPunteos: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de precios'
    RebuildPrinter = False
    OnGetValue = frPunteosGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 24
    Top = 8
    ReportForm = {19000000}
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 120
    Top = 8
  end
  object DSQMPunteos: TDataSource
    DataSet = QMPunteos
    Left = 120
    Top = 56
  end
  object QMPunteos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT'
      'p.*'
      'FROM VER_CUENTAS_PUNTEOS p'
      'WHERE'
      'p.EMPRESA=?EMPRESA AND'
      'p.CANAL=?CANAL AND'
      'p.CUENTA=?CUENTA AND'
      
        ' (  (p.fecha <= ?hfecha) AND (  (p.punteo=0) OR (p.fecha_punteo ' +
        '> ?hfecha AND p.punteo=1)  )  )'
      'ORDER BY p.FECHA')
    UniDirectional = False
    Left = 24
    Top = 56
    object QMPunteosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMPunteosEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMPunteosCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMPunteosRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object QMPunteosLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMPunteosCUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QMPunteosSIGNO: TFIBStringField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
      Size = 1
    end
    object QMPunteosTEXTO: TFIBStringField
      DisplayLabel = 'Texto'
      FieldName = 'TEXTO'
      Size = 100
    end
    object QMPunteosIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMPunteosDOC_NUMERO: TIntegerField
      DisplayLabel = 'Doc. Nro.'
      FieldName = 'DOC_NUMERO'
    end
    object QMPunteosDOC_SERIE: TFIBStringField
      DisplayLabel = 'Doc Serie'
      FieldName = 'DOC_SERIE'
      Size = 10
    end
    object QMPunteosDOC_FECHA: TDateTimeField
      DisplayLabel = 'Fecha Doc.'
      FieldName = 'DOC_FECHA'
    end
    object QMPunteosFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMPunteosASIENTO: TIntegerField
      DisplayLabel = 'Asiento'
      FieldName = 'ASIENTO'
    end
    object QMPunteosPUNTEO: TIntegerField
      DisplayLabel = 'Punteo'
      FieldName = 'PUNTEO'
    end
    object QMPunteosFECHA_PUNTEO: TDateTimeField
      DisplayLabel = 'Fec. Punteo'
      FieldName = 'FECHA_PUNTEO'
    end
  end
  object frQMPunteos: TfrDBDataSet
    DataSet = QMPunteos
    Left = 216
    Top = 56
  end
end
