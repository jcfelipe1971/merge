object DMVerCodigoProveedorKri: TDMVerCodigoProveedorKri
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 316
  Top = 251
  Height = 150
  Width = 267
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 32
    Top = 64
  end
  object xVerCodigoProveedor: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM ver_articulos_cod_prov'
      'WHERE '
      '((EMPRESA = ?EMPRESA) AND'
      ' (ARTICULO starting with ?ARTICULO))'
      'ORDER BY ARTICULO,PROVEEDOR,CODIGO_PROVEEDOR')
    UniDirectional = False
    Left = 40
    Top = 16
    object xVerCodigoProveedorEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xVerCodigoProveedorARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xVerCodigoProveedorPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xVerCodigoProveedorCODIGO_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Cod. Proveedor'
      FieldName = 'CODIGO_PROVEEDOR'
      Size = 40
    end
    object xVerCodigoProveedorNOMBRE_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Titulo Proveedor'
      FieldName = 'NOMBRE_PROVEEDOR'
      Size = 60
    end
  end
  object DSxVerCodigoProveedor: TDataSource
    DataSet = xVerCodigoProveedor
    Left = 168
    Top = 16
  end
end
