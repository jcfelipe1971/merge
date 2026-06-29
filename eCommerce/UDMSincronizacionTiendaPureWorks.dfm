object DMSincronizacionTiendaPureWorks: TDMSincronizacionTiendaPureWorks
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 1247
  Top = 567
  Height = 304
  Width = 545
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 432
    Top = 56
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 432
    Top = 8
  end
  object xImportacionArticulos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_ARTICULOS_IMPORTADOS'
      'WHERE'
      'ID_ARTICULO = :ID_ARTICULO')
    InsertSQL.Strings = (
      'INSERT INTO ART_ARTICULOS_IMPORTADOS ('
      
        'ID_ARTICULO, ENTRADA, EMPRESA, ARTICULO, REF_PROVEEDOR, TITULO, ' +
        'PVENTA1, PVENTA2, P_VENTA_RECOMENDADO, PCOMPRA1,'
      
        ' PCOMPRA2, PCOSTE1, PCOSTE2, ALFA_1, ALFA_2, NOTAS, TRASPASADO, ' +
        'ID_ART_ARTICULOS, TITULO_PROVEEDOR)'
      'VALUES ('
      
        ':ID_ARTICULO, :ENTRADA, :EMPRESA, :ARTICULO, :REF_PROVEEDOR, :TI' +
        'TULO, :PVENTA1, :PVENTA2, :P_VENTA_RECOMENDADO, :PCOMPRA1,'
      
        ' :PCOMPRA2, :PCOSTE1, :PCOSTE2, :ALFA_1, :ALFA_2, :NOTAS, :TRASP' +
        'ASADO, :ID_ART_ARTICULOS, :TITULO_PROVEEDOR)')
    RefreshSQL.Strings = (
      
        'SELECT ID_ARTICULO, ENTRADA, EMPRESA, ARTICULO, REF_PROVEEDOR, T' +
        'ITULO, PVENTA1, PVENTA2, P_VENTA_RECOMENDADO, PCOMPRA1,'
      
        '       PCOMPRA2, PCOSTE1, PCOSTE2, ALFA_1, ALFA_2, NOTAS, TRASPA' +
        'SADO, ID_ART_ARTICULOS, TITULO_PROVEEDOR'
      'FROM ART_ARTICULOS_IMPORTADOS '
      'WHERE'
      'ID_ARTICULO = :ID_ARTICULO')
    SelectSQL.Strings = (
      
        'SELECT ID_ARTICULO, ENTRADA, EMPRESA, ARTICULO, REF_PROVEEDOR, T' +
        'ITULO, PVENTA1, PVENTA2, P_VENTA_RECOMENDADO, PCOMPRA1,'
      
        '       PCOMPRA2, PCOSTE1, PCOSTE2, ALFA_1, ALFA_2, NOTAS, TRASPA' +
        'SADO, ID_ART_ARTICULOS, TITULO_PROVEEDOR'
      'FROM ART_ARTICULOS_IMPORTADOS'
      'WHERE'
      'EMPRESA = :EMPRESA'
      'ORDER BY EMPRESA, REF_PROVEEDOR, ARTICULO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_ARTICULOS_IMPORTADOS'
      'SET'
      'ENTRADA = :ENTRADA,'
      'EMPRESA = :EMPRESA,'
      'ARTICULO = :ARTICULO,'
      'REF_PROVEEDOR = :REF_PROVEEDOR,'
      'TITULO = :TITULO,'
      'PVENTA1 = :PVENTA1,'
      'PVENTA2 = :PVENTA2,'
      'P_VENTA_RECOMENDADO = :P_VENTA_RECOMENDADO,'
      'PCOMPRA1 = :PCOMPRA1,'
      'PCOMPRA2 = :PCOMPRA2,'
      'PCOSTE1 = :PCOSTE1,'
      'PCOSTE2 = :PCOSTE2,'
      'ALFA_1 = :ALFA_1,'
      'ALFA_2 = :ALFA_2,'
      'NOTAS = :NOTAS,'
      'TRASPASADO = :TRASPASADO,'
      'ID_ART_ARTICULOS = :ID_ART_ARTICULOS,'
      'TITULO_PROVEEDOR = :TITULO_PROVEEDOR'
      'WHERE'
      'ID_ARTICULO = :ID_ARTICULO')
    OnNewRecord = xImportacionArticulosNewRecord
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_ARTICULOS_IMPORTADOS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 72
    Top = 8
    object xImportacionArticulosID_ARTICULO: TIntegerField
      DisplayLabel = 'Id Import.'
      FieldName = 'ID_ARTICULO'
    end
    object xImportacionArticulosENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object xImportacionArticulosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xImportacionArticulosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      OnChange = xImportacionArticulosARTICULOChange
      Size = 15
    end
    object xImportacionArticulosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
    object xImportacionArticulosREF_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Id Web'
      FieldName = 'REF_PROVEEDOR'
      Size = 40
    end
    object xImportacionArticulosTITULO_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Desc. Prov.'
      FieldName = 'TITULO_PROVEEDOR'
      Size = 60
    end
    object xImportacionArticulosPVENTA1: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PVENTA1'
    end
    object xImportacionArticulosPVENTA2: TFloatField
      DisplayLabel = 'Precio Venta'
      FieldName = 'PVENTA2'
    end
    object xImportacionArticulosP_VENTA_RECOMENDADO: TFloatField
      DisplayLabel = 'Precio Regular'
      FieldName = 'P_VENTA_RECOMENDADO'
    end
    object xImportacionArticulosPCOMPRA1: TFloatField
      DisplayLabel = 'Alto mm'
      FieldName = 'PCOMPRA1'
    end
    object xImportacionArticulosPCOMPRA2: TFloatField
      DisplayLabel = 'Ancho mm'
      FieldName = 'PCOMPRA2'
    end
    object xImportacionArticulosPCOSTE1: TFloatField
      DisplayLabel = 'Largo mm'
      FieldName = 'PCOSTE1'
    end
    object xImportacionArticulosPCOSTE2: TFloatField
      DisplayLabel = 'Peso Kg'
      FieldName = 'PCOSTE2'
    end
    object xImportacionArticulosALFA_1: TFIBStringField
      DisplayLabel = 'Referencia'
      FieldName = 'ALFA_1'
      Size = 40
    end
    object xImportacionArticulosALFA_2: TFIBStringField
      DisplayLabel = 'Id Web Padre'
      FieldName = 'ALFA_2'
      Size = 40
    end
    object xImportacionArticulosNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xImportacionArticulosTRASPASADO: TIntegerField
      DisplayLabel = 'Crear'
      FieldName = 'TRASPASADO'
      OnChange = xImportacionArticulosTRASPASADOChange
    end
    object xImportacionArticulosID_ART_ARTICULOS: TIntegerField
      DisplayLabel = 'Id Articulo'
      FieldName = 'ID_ART_ARTICULOS'
    end
  end
  object DSxImportacionArticulos: TDataSource
    DataSet = xImportacionArticulos
    Left = 224
    Top = 8
  end
end
