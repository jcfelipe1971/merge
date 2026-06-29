object ProDMHistoricoSerializacion: TProDMHistoricoSerializacion
  OldCreateOrder = False
  OnCreate = DMHistoricoSerializacionCreate
  OnDestroy = DataModuleDestroy
  Left = 489
  Top = 361
  Height = 239
  Width = 381
  object TLocal: THYTransaction
    Active = True
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 200
    Top = 16
  end
  object DSxHistorico: TDataSource
    DataSet = xHistorico
    Left = 116
    Top = 16
  end
  object xHistorico: TFIBTableSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT SERIE, TIPO, RIG, LINEA, FECHA, ARTICULO, SIGNO, CANAL, '
      '               ALMACEN '
      'FROM  a_art_serializacion_hist(?EMPRESA, ?NSERIE)')
    UniDirectional = False
    Opciones = []
    AutoSQLdeVistas = False
    Left = 42
    Top = 16
    object xHistoricoSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xHistoricoTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xHistoricoRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xHistoricoLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xHistoricoFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xHistoricoARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xHistoricoSIGNO: TIntegerField
      DisplayLabel = 'Signo'
      FieldName = 'SIGNO'
    end
    object xHistoricoCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xHistoricoALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
  end
  object frDBTrazaSeries: TfrDBDataSet
    DataSet = QMTrazaSeries
    Left = 128
    Top = 80
  end
  object QMTrazaSeries: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from pro_traza_series(?empresa,?nserie)'
      '')
    UniDirectional = False
    BeforeOpen = QMTrazaSeriesBeforeOpen
    Left = 40
    Top = 80
    object QMTrazaSeriesS_EMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'S_EMPRESA'
    end
    object QMTrazaSeriesS_EJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'S_EJERCICIO'
    end
    object QMTrazaSeriesS_CANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'S_CANAL'
    end
    object QMTrazaSeriesS_SERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'S_SERIE'
      Size = 10
    end
    object QMTrazaSeriesS_CODIGO: TIntegerField
      DisplayLabel = 'Codigo'
      FieldName = 'S_CODIGO'
    end
    object QMTrazaSeriesS_TIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'S_TIPO'
      Size = 3
    end
    object QMTrazaSeriesS_RIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'S_RIG'
    end
    object QMTrazaSeriesS_LINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'S_LINEA'
    end
    object QMTrazaSeriesS_FECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'S_FECHA'
    end
    object QMTrazaSeriesS_ALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'S_ALMACEN'
      Size = 3
    end
    object QMTrazaSeriesS_NSERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'S_NSERIE'
      Size = 25
    end
    object QMTrazaSeriesS_ARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'S_ARTICULO'
      Size = 15
    end
    object QMTrazaSeriesR_PROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'R_PROVEEDOR'
    end
    object QMTrazaSeriesR_NOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'R_NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMTrazaSeriesR_ARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'R_ARTICULO'
      Size = 15
    end
    object QMTrazaSeriesR_TITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'R_TITULO'
      Size = 60
    end
    object QMTrazaSeriesR_UNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'R_UNIDADES'
    end
    object QMTrazaSeriesR_PREU: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'R_PREU'
    end
    object QMTrazaSeriesR_TOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'R_TOTAL'
    end
    object QMTrazaSeriesR_LOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'R_LOTE'
    end
    object QMTrazaSeriesR_SERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'R_SERIE'
      Size = 10
    end
    object QMTrazaSeriesR_CLASIFICACION: TFIBStringField
      DisplayLabel = 'Clasificacion'
      FieldName = 'R_CLASIFICACION'
      Size = 100
    end
    object QMTrazaSeriesR_FECHA: TDateTimeField
      DisplayLabel = 'Fec. Ped.'
      FieldName = 'R_FECHA'
    end
    object QMTrazaSeriesR_TOTAL2: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'R_TOTAL2'
    end
    object QMTrazaSeriesS_TITULOAL: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'S_TITULOAL'
      Size = 40
    end
  end
  object frLstTrazaSeries: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de Traza de Series'
    RebuildPrinter = False
    OnGetValue = frLstTrazaSeriesGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 216
    Top = 80
    ReportForm = {19000000}
  end
  object QMComponentesTraza: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select mat.componente,lot.*, art.titulo from pro_ord_mat mat'
      
        'join pro_ord_mat_lotes lot on (lot.empresa=mat.empresa and lot.e' +
        'jercicio=mat.ejercicio and'
      
        '  lot.canal=mat.canal and lot.norden=mat.rig_of and lot.serie=ma' +
        't.series and lot.linea=mat.linea_mat)'
      
        'join art_articulos art on (art.empresa=mat.empresa and art.artic' +
        'ulo=mat.componente)'
      
        'where mat.empresa=?s_empresa and mat.ejercicio=?s_ejercicio and ' +
        'mat.canal=?s_canal '
      
        '  and mat.series=?s_serie and mat.rig_of=?s_rig and  lot.tipo='#39'M' +
        'AT'#39
      'order by mat.orden'
      ''
      '/*select mat.*,art.*,lot.* from pro_ord_mat mat '
      
        'left join art_articulos art on (art.empresa=mat.empresa and art.' +
        'articulo=mat.componente)'
      
        'left join pro_ord_mat_lotes lot on (lot.id_detalles_s=mat.id_ord' +
        'en_mat)'
      
        'where mat.empresa=?s_empresa and mat.ejercicio=?s_ejercicio and ' +
        'mat.canal=?s_canal '
      '  and mat.series=?s_serie and mat.rig_of=?s_rig'
      'order by mat.orden'
      '*/')
    UniDirectional = False
    DataSource = DSTrazaSeries
    Left = 40
    Top = 136
    object QMComponentesTrazaCOMPONENTE: TFIBStringField
      DisplayLabel = 'Componente'
      FieldName = 'COMPONENTE'
      Size = 15
    end
    object QMComponentesTrazaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMComponentesTrazaEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMComponentesTrazaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMComponentesTrazaTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMComponentesTrazaNORDEN: TIntegerField
      DisplayLabel = 'Nro. Orden'
      FieldName = 'NORDEN'
    end
    object QMComponentesTrazaLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
    end
    object QMComponentesTrazaN_SERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'N_SERIE'
      Size = 10
    end
    object QMComponentesTrazaCLASIFICACION: TFIBStringField
      DisplayLabel = 'Clasificacion'
      FieldName = 'CLASIFICACION'
      Size = 100
    end
    object QMComponentesTrazaF_FABRICACION: TDateTimeField
      DisplayLabel = 'Fec. Fab.'
      FieldName = 'F_FABRICACION'
    end
    object QMComponentesTrazaF_ENVASADO: TDateTimeField
      DisplayLabel = 'Fec. Envas.'
      FieldName = 'F_ENVASADO'
    end
    object QMComponentesTrazaF_CADUCIDAD: TDateTimeField
      DisplayLabel = 'Fec. Caduc.'
      FieldName = 'F_CADUCIDAD'
    end
    object QMComponentesTrazaCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMComponentesTrazaARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMComponentesTrazaALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMComponentesTrazaLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMComponentesTrazaID_DETALLES_S: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES_S'
    end
    object QMComponentesTrazaESTADO_LOTE: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO_LOTE'
    end
    object QMComponentesTrazaID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMComponentesTrazaSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMComponentesTrazaPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMComponentesTrazaID_LOTE: TIntegerField
      DisplayLabel = 'ID Lote'
      FieldName = 'ID_LOTE'
    end
    object QMComponentesTrazaID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMComponentesTrazaID_ORDEN_MAT: TIntegerField
      DisplayLabel = 'ID Ord. Mat.'
      FieldName = 'ID_ORDEN_MAT'
    end
    object QMComponentesTrazaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSTrazaSeries: TDataSource
    DataSet = QMTrazaSeries
    Left = 296
    Top = 80
  end
  object frDBComponentesTraza: TfrDBDataSet
    DataSet = QMComponentesTraza
    Left = 168
    Top = 136
  end
end
