object DMVerTercerosArticulo: TDMVerTercerosArticulo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 559
  Top = 253
  Height = 240
  Width = 388
  object Tlocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 248
    Top = 8
  end
  object DSQMArticulos: TDataSource
    DataSet = QMArticulos
    Left = 136
    Top = 8
  end
  object QMArticulos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = Tlocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_ARTICULOS'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ARTICULO=?old_ARTICULO ')
    InsertSQL.Strings = (
      'INSERT INTO ART_ARTICULOS'
      
        '  (P_COSTE,NOTAS,CONTROLA_MEDIDAS,ENTRADA,UNIDADES,LOTES,PVP_POR' +
        '_UD_SECUNDARIA,DESCUENTO_3,DESCUENTO_2,DESCUENTO,PRODUCCION,GARA' +
        'NTIA,VIRTUAL,EMPRESA,TITULO,ABIERTO,CONTROL_STOCK,TITULO_CORTO,S' +
        'ERIALIZADO,ARTICULO,FAMILIA)'
      'VALUES'
      
        '  (?P_COSTE,?NOTAS,?CONTROLA_MEDIDAS,?ENTRADA,?UNIDADES,?LOTES,?' +
        'PVP_POR_UD_SECUNDARIA,?DESCUENTO_3,?DESCUENTO_2,?DESCUENTO,?PROD' +
        'UCCION,?GARANTIA,?VIRTUAL,?EMPRESA,?TITULO,?ABIERTO,?CONTROL_STO' +
        'CK,?TITULO_CORTO,?SERIALIZADO,?ARTICULO,?FAMILIA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO ')
    SelectSQL.Strings = (
      'SELECT EMPRESA,ARTICULO,TITULO '
      'FROM ART_ARTICULOS'
      'WHERE '
      'EMPRESA=?EMPRESA AND '
      'ARTICULO=?ARTICULO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_ARTICULOS'
      'SET'
      '  P_COSTE=?P_COSTE '
      '  ,NOTAS=?NOTAS '
      '  ,CONTROLA_MEDIDAS=?CONTROLA_MEDIDAS '
      '  ,ENTRADA=?ENTRADA '
      '  ,UNIDADES=?UNIDADES '
      '  ,LOTES=?LOTES '
      '  ,PVP_POR_UD_SECUNDARIA=?PVP_POR_UD_SECUNDARIA '
      '  ,DESCUENTO_3=?DESCUENTO_3 '
      '  ,DESCUENTO_2=?DESCUENTO_2 '
      '  ,DESCUENTO=?DESCUENTO '
      '  ,PRODUCCION=?PRODUCCION '
      '  ,GARANTIA=?GARANTIA '
      '  ,VIRTUAL=?VIRTUAL '
      '  ,TITULO=?TITULO '
      '  ,ABIERTO=?ABIERTO '
      '  ,CONTROL_STOCK=?CONTROL_STOCK '
      '  ,TITULO_CORTO=?TITULO_CORTO '
      '  ,SERIALIZADO=?SERIALIZADO '
      '  ,FAMILIA=?FAMILIA '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO ')
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ARTICULO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_ARTICULOS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 8
    object QMArticulosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMArticulosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMArticulosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxClientes: TDataSource
    DataSet = xClientes
    Left = 136
    Top = 56
  end
  object xClientes: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = Tlocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT CLIENTE, TITULO, PV, TITULO_MODELO, UNIDADES'
      'FROM TMP_VENTAS_CLI_ART'
      'WHERE'
      'ENTRADA=?ENTRADA'
      'ORDER BY CLIENTE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 40
    Top = 56
    object xClientesCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object xClientesTITULO: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldName = 'TITULO'
      Size = 60
    end
    object xClientesPV: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PV'
    end
    object xClientesTITULO_MODELO: TFIBStringField
      DisplayLabel = 'Modelo'
      FieldName = 'TITULO_MODELO'
      Size = 60
    end
    object xClientesUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
  end
  object xProveedores: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = Tlocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT * FROM TMP_ULTIMOS_PROVEEDORES'
      'WHERE'
      'EMPRESA=?EMPRESA AND '
      'EJERCICIO=?EJERCICIO AND'
      'CANAL=?CANAL AND'
      'ARTICULO=?ARTICULO AND'
      'ENTRADA=?ENTRADA'
      'ORDER BY FECHA DESC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    Left = 40
    Top = 104
    object xProveedoresPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xProveedoresTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xProveedoresPRECIO_COMPRA: TFloatField
      DisplayLabel = 'Precio Compra'
      FieldName = 'PRECIO_COMPRA'
    end
    object xProveedoresPRECIO_COSTE: TFloatField
      DisplayLabel = 'Precio Coste'
      FieldName = 'PRECIO_COSTE'
    end
    object xProveedoresCOSTE: TFloatField
      DisplayLabel = 'Coste'
      FieldName = 'COSTE'
    end
    object xProveedoresRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xProveedoresFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xProveedoresSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xProveedoresTITULO_MODELO: TFIBStringField
      DisplayLabel = 'Modelo'
      FieldName = 'TITULO_MODELO'
      Size = 60
    end
    object xProveedoresARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xProveedoresUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
  end
  object DSxProveedores: TDataSource
    DataSet = xProveedores
    Left = 136
    Top = 104
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 248
    Top = 56
  end
end
