object OpeDMLstEtiquetasEmpleados: TOpeDMLstEtiquetasEmpleados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 303
  Top = 141
  Height = 405
  Width = 461
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait'
      'read')
    Left = 376
    Top = 16
  end
  object frListado: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de etiquetas empleados'
    RebuildPrinter = False
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 232
    Top = 16
    ReportForm = {19000000}
  end
  object xLstEtiquetasEmpleados: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1024
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_EMPLEADOS_CUENTAS'
      'WHERE'
      '  EMPRESA = :EMPRESA AND '
      '  EJERCICIO = :EJERCICIO AND '
      '  CANAL = :CANAL AND'
      '  EMPLEADO BETWEEN :EMPLEADO_DESDE AND :EMPLEADO_HASTA'
      'ORDER BY EMPLEADO')
    UniDirectional = False
    Left = 64
    Top = 16
  end
  object DSxLstEtiquetasEmpleados: TDataSource
    DataSet = xLstEtiquetasEmpleados
    Left = 64
    Top = 64
  end
  object frDBLstEtiquetasEmpleados: TfrDBDataSet
    DataSource = DSxLstEtiquetasEmpleados
    Left = 232
    Top = 64
  end
end
