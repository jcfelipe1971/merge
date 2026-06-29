object DMImportacionArticulosExcel: TDMImportacionArticulosExcel
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 246
  Top = 169
  Height = 327
  Width = 553
  object QMArtImportados: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_ARTICULOS_IMPORTADOS'
      'WHERE'
      '  ID_ARTICULO=?old_ID_ARTICULO ')
    InsertSQL.Strings = (
      'INSERT INTO ART_ARTICULOS_IMPORTADOS'
      
        '  (ID_ARTICULO,EMPRESA,ARTICULO,TITULO,PVENTA1,PIEZAS,PVENTA2,PC' +
        'OMPRA1,DESCUENTO1,PCOSTE1,PCOMPRA2,DESCUENTO2,PCOSTE2,TITULO_PRO' +
        'VEEDOR,PROVEEDOR,REF_PROVEEDOR,FAMILIA,NOTAS,TRASPASADO,FECHA_IM' +
        'PORTACION,ENTRADA,TARIFA,ID_ART_ARTICULOS,ART_PRINCIPAL, P_VENTA' +
        '_RECOMENDADO)'
      'VALUES'
      
        '  (?ID_ARTICULO,?EMPRESA,?ARTICULO,?TITULO,?PVENTA1,?PIEZAS,?PVE' +
        'NTA2,?PCOMPRA1,?DESCUENTO1,?PCOSTE1,?PCOMPRA2,?DESCUENTO2,?PCOST' +
        'E2,?TITULO_PROVEEDOR,?PROVEEDOR,?REF_PROVEEDOR,?FAMILIA,?NOTAS,?' +
        'TRASPASADO,?FECHA_IMPORTACION,?ENTRADA,?TARIFA,?ID_ART_ARTICULOS' +
        ',?ART_PRINCIPAL, ?P_VENTA_RECOMENDADO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS_IMPORTADOS'
      'WHERE'
      '  ID_ARTICULO=?ID_ARTICULO ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_ARTICULOS_IMPORTADOS'
      'WHERE empresa=?empresa  and ART_PRINCIPAL=1'
      'ORDER BY ARTICULO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_ARTICULOS_IMPORTADOS'
      'SET'
      '  TITULO=?TITULO '
      '  ,PVENTA1=?PVENTA1 '
      '  ,PIEZAS=?PIEZAS '
      '  ,PVENTA2=?PVENTA2 '
      '  ,PCOMPRA1=?PCOMPRA1 '
      '  ,DESCUENTO1=?DESCUENTO1 '
      '  ,PCOSTE1=?PCOSTE1 '
      '  ,PCOMPRA2=?PCOMPRA2 '
      '  ,DESCUENTO2=?DESCUENTO2 '
      '  ,PCOSTE2=?PCOSTE2 '
      '  ,TITULO_PROVEEDOR=?TITULO_PROVEEDOR '
      '  ,PROVEEDOR=?PROVEEDOR '
      '  ,REF_PROVEEDOR=?REF_PROVEEDOR '
      '  ,FAMILIA=?FAMILIA '
      '  ,NOTAS=?NOTAS '
      '  ,TRASPASADO=?TRASPASADO '
      '  ,FECHA_IMPORTACION=?FECHA_IMPORTACION '
      '  ,TARIFA=?TARIFA '
      '  ,P_VENTA_RECOMENDADO=?P_VENTA_RECOMENDADO'
      'WHERE'
      '  ID_ARTICULO=?ID_ARTICULO ')
    AfterDelete = Graba
    AfterOpen = QMArtImportadosAfterOpen
    AfterPost = Graba
    BeforeClose = QMArtImportadosBeforeClose
    BeforeEdit = QMArtImportadosBeforeEdit
    OnNewRecord = QMArtImportadosNewRecord
    ClavesPrimarias.Strings = (
      'ID_ARTICULO ')
    AccionesInhibidas = []
    Opciones = [DesactivarControlesAlOrdenar, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_ARTICULOS_IMPORTADOS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 16
    object QMArtImportadosID_ARTICULO: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_ARTICULO'
    end
    object QMArtImportadosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMArtImportadosARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMArtImportadosTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMArtImportadosPVENTA1: TFloatField
      DisplayLabel = 'P. Venta 1'
      FieldName = 'PVENTA1'
    end
    object QMArtImportadosPIEZAS: TFloatField
      DisplayLabel = 'Piezas'
      FieldName = 'PIEZAS'
    end
    object QMArtImportadosPVENTA2: TFloatField
      DisplayLabel = 'P. Venta 2'
      FieldName = 'PVENTA2'
    end
    object QMArtImportadosPCOMPRA1: TFloatField
      DisplayLabel = 'P. Compra 1'
      FieldName = 'PCOMPRA1'
    end
    object QMArtImportadosDESCUENTO1: TFloatField
      DisplayLabel = 'Desc. 1'
      FieldName = 'DESCUENTO1'
    end
    object QMArtImportadosPCOSTE1: TFloatField
      DisplayLabel = 'P. Coste 1'
      FieldName = 'PCOSTE1'
    end
    object QMArtImportadosPCOMPRA2: TFloatField
      DisplayLabel = 'P. Compra 2'
      FieldName = 'PCOMPRA2'
    end
    object QMArtImportadosDESCUENTO2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DESCUENTO2'
    end
    object QMArtImportadosPCOSTE2: TFloatField
      DisplayLabel = 'P. Coste 2'
      FieldName = 'PCOSTE2'
    end
    object QMArtImportadosTITULO_PROVEEDOR: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_PROVEEDOR'
      OnGetText = QMArtImportadosTITULO_PROVEEDORGetText
      Size = 60
    end
    object QMArtImportadosPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMArtImportadosREF_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Ref. Prov.'
      FieldName = 'REF_PROVEEDOR'
      Size = 40
    end
    object QMArtImportadosFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMArtImportadosNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMArtImportadosTRASPASADO: TIntegerField
      DisplayLabel = 'Trasp.'
      FieldName = 'TRASPASADO'
    end
    object QMArtImportadosFECHA_IMPORTACION: TDateTimeField
      DisplayLabel = 'Fec. Importaci'#243'n'
      FieldName = 'FECHA_IMPORTACION'
    end
    object QMArtImportadosENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QMArtImportadosTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object QMArtImportadosID_ART_ARTICULOS: TIntegerField
      DisplayLabel = 'ID Art. Art.'
      FieldName = 'ID_ART_ARTICULOS'
    end
    object QMArtImportadosART_PRINCIPAL: TIntegerField
      DisplayLabel = 'Art. Principal'
      FieldName = 'ART_PRINCIPAL'
    end
    object QMArtImportadosALFA_1: TFIBStringField
      DisplayLabel = 'Alfa 1'
      FieldName = 'ALFA_1'
      Size = 40
    end
    object QMArtImportadosALFA_2: TFIBStringField
      DisplayLabel = 'Alfa 2'
      FieldName = 'ALFA_2'
      Size = 40
    end
    object QMArtImportadosALFA_3: TFIBStringField
      DisplayLabel = 'Alfa 3'
      FieldName = 'ALFA_3'
      Size = 40
    end
    object QMArtImportadosALFA_4: TFIBStringField
      DisplayLabel = 'Alfa 4'
      FieldName = 'ALFA_4'
      Size = 40
    end
    object QMArtImportadosALFA_5: TFIBStringField
      DisplayLabel = 'Alfa 5'
      FieldName = 'ALFA_5'
      Size = 40
    end
    object QMArtImportadosALFA_6: TFIBStringField
      DisplayLabel = 'Alfa 6'
      FieldName = 'ALFA_6'
      Size = 40
    end
    object QMArtImportadosEAN13: TFIBStringField
      DisplayLabel = 'EAN 13'
      FieldName = 'EAN13'
      Size = 40
    end
    object QMArtImportadosP_VENTA_RECOMENDADO: TFloatField
      DisplayLabel = 'P. Venta Recomendado'
      FieldName = 'P_VENTA_RECOMENDADO'
    end
  end
  object DSArtImportados: TDataSource
    DataSet = QMArtImportados
    Left = 152
    Top = 16
  end
  object DSxFamilias: TDataSource
    DataSet = xFamilias
    Left = 152
    Top = 64
  end
  object xFamilias: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_FAMILIAS_CUENTAS                   '
      
        'where((empresa=?empresa)and(ejercicio=?ejercicio)and(canal=?cana' +
        'l)'
      'and(familia=?familia))')
    UniDirectional = False
    Left = 40
    Top = 64
    object xFamiliasTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object xFamiliasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xFamiliasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xFamiliasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xFamiliasFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object xFamiliasPAIS: TFIBStringField
      DisplayLabel = 'Pais'
      FieldName = 'PAIS'
      Size = 3
    end
    object xFamiliasTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object xFamiliasCTA_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Comrpas'
      FieldName = 'CTA_COMPRAS'
      Size = 15
    end
    object xFamiliasCTA_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Ventas'
      FieldName = 'CTA_VENTAS'
      Size = 15
    end
    object xFamiliasCTA_DEVOLUCION_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Dev. Compras'
      FieldName = 'CTA_DEVOLUCION_COMPRAS'
      Size = 15
    end
    object xFamiliasCTA_DEVOLUCION_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Dev. Ventas'
      FieldName = 'CTA_DEVOLUCION_VENTAS'
      Size = 15
    end
    object xFamiliasCTA_ABONO_COMPRAS: TFIBStringField
      DisplayLabel = 'Cta. Abono Compras'
      FieldName = 'CTA_ABONO_COMPRAS'
      Size = 15
    end
    object xFamiliasCTA_ABONO_VENTAS: TFIBStringField
      DisplayLabel = 'Cta. Abono Ventas'
      FieldName = 'CTA_ABONO_VENTAS'
      Size = 15
    end
    object xFamiliasVENTA: TIntegerField
      DisplayLabel = 'Venta'
      FieldName = 'VENTA'
    end
    object xFamiliasPTO_VERDE: TFloatField
      DisplayLabel = 'Pto. Verde'
      FieldName = 'PTO_VERDE'
    end
    object xFamiliasMARGEN: TFloatField
      DisplayLabel = 'Margen'
      FieldName = 'MARGEN'
    end
    object xFamiliasTIPO_REDONDEO: TIntegerField
      DisplayLabel = 'Tipo Redondeo'
      FieldName = 'TIPO_REDONDEO'
    end
    object xFamiliasACT_TAR_AUTOM: TIntegerField
      DisplayLabel = 'Act. Tar. Aut.'
      FieldName = 'ACT_TAR_AUTOM'
    end
    object xFamiliasTITULO_WEB: TFIBStringField
      DisplayLabel = 'Descripcion Web'
      FieldName = 'TITULO_WEB'
      Size = 15
    end
    object xFamiliasWEB: TIntegerField
      DisplayLabel = 'Web'
      FieldName = 'WEB'
    end
  end
  object xEquivalencias: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM ver_ARTICULOS_IMPORTADOS '
      'where empresa=?empresa and articulo=?articulo'
      'and id_articulo<>?id_articulo')
    UniDirectional = False
    DataSource = DSArtImportados
    Left = 40
    Top = 208
    object xEquivalenciasID_ARTICULO: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_ARTICULO'
    end
    object xEquivalenciasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xEquivalenciasARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xEquivalenciasTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object xEquivalenciasPVENTA1: TFloatField
      DisplayLabel = 'P. Venta 1'
      FieldName = 'PVENTA1'
    end
    object xEquivalenciasPIEZAS: TFloatField
      DisplayLabel = 'Piezas'
      FieldName = 'PIEZAS'
    end
    object xEquivalenciasPVENTA2: TFloatField
      DisplayLabel = 'P. Venta 2'
      FieldName = 'PVENTA2'
    end
    object xEquivalenciasPCOMPRA1: TFloatField
      DisplayLabel = 'P. Compra 1'
      FieldName = 'PCOMPRA1'
    end
    object xEquivalenciasDESCUENTO1: TFloatField
      DisplayLabel = 'Desc. 1'
      FieldName = 'DESCUENTO1'
    end
    object xEquivalenciasPCOSTE1: TFloatField
      DisplayLabel = 'P. Coste 1'
      FieldName = 'PCOSTE1'
    end
    object xEquivalenciasPCOMPRA2: TFloatField
      DisplayLabel = 'P. Compra 2'
      FieldName = 'PCOMPRA2'
    end
    object xEquivalenciasDESCUENTO2: TFloatField
      DisplayLabel = 'Desc. 2'
      FieldName = 'DESCUENTO2'
    end
    object xEquivalenciasPCOSTE2: TFloatField
      DisplayLabel = 'P. Coste 2'
      FieldName = 'PCOSTE2'
    end
    object xEquivalenciasTITULO_PROVEEDOR: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_PROVEEDOR'
      Size = 60
    end
    object xEquivalenciasPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xEquivalenciasREF_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Ref. Prov.'
      FieldName = 'REF_PROVEEDOR'
      Size = 40
    end
    object xEquivalenciasFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object xEquivalenciasNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xEquivalenciasTRASPASADO: TIntegerField
      DisplayLabel = 'Trasp.'
      FieldName = 'TRASPASADO'
    end
    object xEquivalenciasFECHA_IMPORTACION: TDateTimeField
      DisplayLabel = 'Fec. Importaci'#243'n'
      FieldName = 'FECHA_IMPORTACION'
    end
    object xEquivalenciasENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object xEquivalenciasTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object xEquivalenciasID_ART_ARTICULOS: TIntegerField
      DisplayLabel = 'ID Art. Art.'
      FieldName = 'ID_ART_ARTICULOS'
    end
    object xEquivalenciasART_PRINCIPAL: TIntegerField
      DisplayLabel = 'Art. Principal'
      FieldName = 'ART_PRINCIPAL'
    end
    object xEquivalenciasP_VENTA_RECOMENDADO: TFloatField
      DisplayLabel = 'P. Venta Recomendado'
      FieldName = 'P_VENTA_RECOMENDADO'
    end
  end
  object DSxEquivalencias: TDataSource
    DataSet = xEquivalencias
    Left = 152
    Top = 208
  end
  object xArtImportados: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from art_articulos_importados '
      'where id_articulo=?id_articulo')
    UniDirectional = False
    Left = 40
    Top = 160
  end
  object xInfoPrincipal: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select art_principal from art_articulos_importados'
      'where id_articulo=?id_articulo')
    UniDirectional = False
    DataSource = DSArtImportados
    Left = 40
    Top = 112
    object xInfoPrincipalART_PRINCIPAL: TIntegerField
      DisplayLabel = 'Art. Principal'
      FieldName = 'ART_PRINCIPAL'
    end
  end
  object DSxInfoPrincipal: TDataSource
    DataSet = xInfoPrincipal
    Left = 152
    Top = 112
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 488
    Top = 16
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 408
    Top = 16
  end
end
