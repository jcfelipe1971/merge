object DMPreciosArticuloDoc: TDMPreciosArticuloDoc
  OldCreateOrder = False
  OnCreate = DMPreciosArticuloDocCreate
  Left = 971
  Top = 220
  Height = 237
  Width = 321
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 34
    Top = 14
  end
  object SPDevuelvePrecio: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure a_art_devuelve_precio(?EMPRESA,?TARIFA,?ARTICU' +
        'LO,?LINEA,?BLOQUEADO,?PVP,?MONEDA,?FECHA,?MARGEN)')
    Transaction = TLocal
    AutoTrans = True
    Left = 224
    Top = 68
  end
  object xMonedas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT MONEDA, TITULO FROM SYS_MONEDAS'
      'WHERE MONEDA=?MONEDA')
    UniDirectional = False
    Left = 36
    Top = 128
  end
  object DSxMonedas: TDataSource
    DataSet = xMonedas
    Left = 108
    Top = 128
  end
  object DSQMTarifas: TDataSource
    DataSet = QMTarifas
    Left = 108
    Top = 70
  end
  object QMTarifas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    InsertSQL.Strings = (
      'SELECT *'
      
        'FROM A_ART_PRECIOS_TARIFA(:EMPRESA, :CANAL, :ARTICULO, :ALMACEN,' +
        ' :MONEDA, :FECHA, :ID_A)'
      'WHERE'
      'TARIFA = :TARIFA AND'
      'LINEA = :LINEA')
    RefreshSQL.Strings = (
      'SELECT *'
      
        'FROM A_ART_PRECIOS_TARIFA(:EMPRESA, :CANAL, :ARTICULO, :ALMACEN,' +
        ' :MONEDA, :FECHA, :ID_A)'
      'WHERE'
      'TARIFA = :TARIFA AND'
      'LINEA = :LINEA')
    SelectSQL.Strings = (
      'SELECT *'
      
        'FROM A_ART_PRECIOS_TARIFA(:EMPRESA, :CANAL, :ARTICULO, :ALMACEN,' +
        ' :MONEDA, :FECHA, :ID_A)'
      'ORDER BY TARIFA, LINEA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      
        'EXECUTE PROCEDURE A_ART_DEVUELVE_PRECIO(:EMPRESA, :TARIFA, :ARTI' +
        'CULO, :LINEA, :BLOQUEADO, :PVP, :MONEDA, :FECHA, :MARGEN)')
    AfterPost = Graba
    OnNewRecord = QMTarifasNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA,'
      'CANAL,'
      'ARTICULO,'
      'ALMACEN,'
      'MONEDA,'
      'FECHA,'
      'ID_A)'#13
      'tarifa'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 36
    Top = 68
    object QMTarifasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMTarifasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMTarifasTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object QMTarifasFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMTarifasARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMTarifasALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMTarifasTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMTarifasP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object QMTarifasCOMISION: TFloatField
      DisplayLabel = 'Comision'
      FieldName = 'COMISION'
    end
    object QMTarifasPVP: TFloatField
      DisplayLabel = 'P.V.P.'
      FieldName = 'PVP'
    end
    object QMTarifasBLOQUEADO: TIntegerField
      DisplayLabel = 'Bloqueado'
      FieldName = 'BLOQUEADO'
    end
    object QMTarifasPRECIO_PONDERADO: TFloatField
      DisplayLabel = 'Precio Pond.'
      FieldName = 'PRECIO_PONDERADO'
    end
    object QMTarifasMONEDA: TFIBStringField
      DisplayLabel = 'Moneda'
      FieldName = 'MONEDA'
      Size = 3
    end
    object QMTarifasFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMTarifasUNID_MINIMAS: TFloatField
      DisplayLabel = 'Uds. Min.'
      FieldName = 'UNID_MINIMAS'
    end
    object QMTarifasUNID_MAXIMAS: TFloatField
      DisplayLabel = 'Uds. Max.'
      FieldName = 'UNID_MAXIMAS'
    end
    object QMTarifasLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMTarifasMARGEN: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGEN'
    end
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 105
    Top = 14
  end
end
