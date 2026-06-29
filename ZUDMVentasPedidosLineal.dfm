object ZDMVentasPedidosLineal: TZDMVentasPedidosLineal
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 526
  Top = 182
  Height = 249
  Width = 305
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 212
    Top = 16
  end
  object frDBPedidosLineal: TfrDBDataSet
    DataSource = DSxListado
    Left = 132
    Top = 84
  end
  object frPedidosLineal: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de Pedidos de Ventas por Lineal'
    RebuildPrinter = False
    OnGetValue = frPedidosLinealGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 32
    Top = 83
    ReportForm = {19000000}
  end
  object DSxListado: TDataSource
    DataSet = xListado
    Left = 131
    Top = 17
  end
  object xListado: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT Z_ARM_LINEA, SUM(DET.UNIDADES)'
      'FROM VER_DETALLE_PEDIDO DET'
      
        'JOIN ART_ARTICULOS ART ON (ART.EMPRESA = DET.EMPRESA AND ART.ART' +
        'ICULO = DET.ARTICULO)'
      'JOIN Z_LINEALES LIN ON (LIN.LINEA = ART.Z_ARM_LINEA)'
      'JOIN VER_CABECERAS_PEDIDO CAB ON (DET.ID_S = CAB.ID_S)'
      'WHERE'
      'FECHA >= :FECHA_DESDE AND'
      'FECHA <= :FECHA_HASTA'
      'GROUP BY Z_ARM_LINEA')
    UniDirectional = False
    Left = 35
    Top = 17
    object xListadoZ_ARM_LINEA: TFloatField
      DisplayLabel = 'Arm. Linea'
      FieldName = 'Z_ARM_LINEA'
    end
    object xListadoSUM: TFloatField
      DisplayLabel = 'Suma'
      FieldName = 'SUM'
    end
  end
end
