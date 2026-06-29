object ZDMLstTroqueles: TZDMLstTroqueles
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 305
  Top = 300
  Height = 203
  Width = 511
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 24
    Top = 8
  end
  object xTroquel: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select *'
      'from emp_troqueles'
      'where empresa = ?empresa and troquel = ?troquel;')
    UniDirectional = False
    Left = 24
    Top = 56
    object xTroquelTROQUEL: TIntegerField
      DisplayLabel = 'Troquel'
      FieldName = 'TROQUEL'
    end
    object xTroquelANCHO: TIntegerField
      DisplayLabel = 'Ancho'
      FieldName = 'ANCHO'
    end
    object xTroquelAVANCE: TIntegerField
      DisplayLabel = 'Avance'
      FieldName = 'AVANCE'
    end
    object xTroquelCILINDRO: TFIBStringField
      DisplayLabel = 'Cilindro'
      FieldName = 'CILINDRO'
      Size = 8
    end
    object xTroquelOBSERVACIONES: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'OBSERVACIONES'
      Size = 8
    end
    object xTroquelTIPO_AUX: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_AUX'
      Size = 3
    end
    object xTroquelPOS_ANCHO: TIntegerField
      DisplayLabel = 'Pos. Ancho'
      FieldName = 'POS_ANCHO'
    end
    object xTroquelPOS_AVANCE: TIntegerField
      DisplayLabel = 'Pos. Avance'
      FieldName = 'POS_AVANCE'
    end
  end
  object DSxTroquel: TDataSource
    DataSet = xTroquel
    Left = 104
    Top = 56
  end
  object frListadoE: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado Troqueles'
    RebuildPrinter = False
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 208
    Top = 8
    ReportForm = {19000000}
  end
  object frDBListadoE: TfrDBDataSet
    DataSource = DSxTroquel
    Left = 208
    Top = 56
  end
end
