object DMLstMatPeligrosas: TDMLstMatPeligrosas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 571
  Top = 80
  Height = 203
  Width = 302
  object frLstMatPeligrosas: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado Materias Peligrosas'
    RebuildPrinter = False
    OnGetValue = frLstMatPeligrosasGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 43
    Top = 24
    ReportForm = {19000000}
  end
  object frDBMatPeligrosas: TfrDBDataSet
    DataSource = DSMatPeligrosas
    Left = 141
    Top = 24
  end
  object QMLstMatPeligrosas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select transportista, nombre_transportista, cp, poblacion, '
      '       clase, sum(suma) as suma '
      ' from lst_mat_peligrosas (?empresa,?fechad,?fechah,?todos)'
      
        ' group by transportista, nombre_transportista, cp, poblacion, cl' +
        'ase')
    UniDirectional = False
    Left = 43
    Top = 92
  end
  object TLocal: TFIBTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 239
    Top = 24
  end
  object DSMatPeligrosas: TDataSource
    DataSet = QMLstMatPeligrosas
    Left = 141
    Top = 92
  end
end
