object DMLstColadas: TDMLstColadas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 561
  Top = 181
  Height = 237
  Width = 409
  object frColadas: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    RebuildPrinter = False
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 180
    Top = 17
    ReportForm = {19000000}
  end
  object frDBCabecera: TfrDBDataSet
    DataSource = DSCabecera
    Left = 180
    Top = 64
  end
  object frDBdetalle: TfrDBDataSet
    DataSource = DSDetalle
    Left = 181
    Top = 119
  end
  object QMCabecera: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM EMP_COLADA_CABECERA'
      'WHERE ID_COLADA = ?ID_COLADA'
      'order by id_colada')
    UniDirectional = False
    Plan.Strings = (
      
        'PLAN JOIN (VER_CABECERAS_OFERTA_C CAB INDEX (GES_CABECERAS_S_ID)' +
        ','
      
        '           VER_CABECERAS_OFERTA_C OFC INDEX (GES_CABECERAS_S_OFC' +
        '_ID),'
      '           VER_CABECERAS_OFERTA_C TER INDEX (PK_SYS_TERCEROS))')
    AfterOpen = QMCabeceraAfterOpen
    BeforeClose = QMCabeceraBeforeClose
    Left = 24
    Top = 66
    object QMCabeceraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCabeceraEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCabeceraCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCabeceraSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMCabeceraID_COLADA: TIntegerField
      DisplayLabel = 'ID Colada'
      FieldName = 'ID_COLADA'
    end
    object QMCabeceraFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMCabeceraORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMCabeceraMATERIAL: TFIBStringField
      DisplayLabel = 'Material'
      FieldName = 'MATERIAL'
      Size = 10
    end
    object QMCabeceraNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMCabeceraPESO_LINGOTES: TFloatField
      DisplayLabel = 'Peso Lingotes'
      FieldName = 'PESO_LINGOTES'
    end
    object QMCabeceraPESO_BEBEDEROS: TFloatField
      DisplayLabel = 'Peso Bebederos'
      FieldName = 'PESO_BEBEDEROS'
    end
    object QMCabeceraENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
  end
  object DSCabecera: TDataSource
    DataSet = QMCabecera
    Left = 96
    Top = 66
  end
  object QMDetalle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM EMP_COLADA_DETALLE'
      'WHERE ID_COLADA=?ID_COLADA'
      'order by posicion')
    UniDirectional = False
    DataSource = DSCabecera
    Plan.Strings = (
      
        'PLAN SORT (JOIN (VER_DETALLE_OFERTA_C DET INDEX (GES_DETALLES_S_' +
        'CAB_ID),'
      
        '                VER_DETALLE_OFERTA_C OFC INDEX (GES_DETALLES_S_O' +
        'FC_ID)))  '
      '')
    Left = 24
    Top = 117
    object QMDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetalleEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDetalleCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDetalleSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMDetalleID_COLADA: TIntegerField
      DisplayLabel = 'ID Colada'
      FieldName = 'ID_COLADA'
    end
    object QMDetalleLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetallePOSICION: TIntegerField
      DisplayLabel = 'Pos.'
      FieldName = 'POSICION'
    end
    object QMDetalleID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMDetalleARTICULO_CAJA: TFIBStringField
      DisplayLabel = 'Art. Caja'
      FieldName = 'ARTICULO_CAJA'
      Size = 15
    end
    object QMDetalleDEFECTUOSO: TIntegerField
      DisplayLabel = 'Defectuoso'
      FieldName = 'DEFECTUOSO'
    end
    object QMDetalleENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
  end
  object DSDetalle: TDataSource
    DataSet = QMDetalle
    Left = 95
    Top = 117
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 98
    Top = 14
  end
  object HYReport: THYReport
    CampoCodigo = 'LISTADO'
    CampoGrupo = 'GRUPO'
    CampoListado = 'DEF_LISTADO'
    CampoTipo = 'TIPO'
    CampoTitulo = 'TITULO'
    Impresora = DMMain.HYPrinterOptions
    ValorCodigo = 1991
    ValorGrupo = 38
    DataSet = DMMain.QListados
    Opciones.Pagina.Margenes.Abajo = 0
    Opciones.Pagina.Margenes.Izquierda = 0
    Opciones.Pagina.Margenes.Derecha = 0
    Opciones.Pagina.Margenes.Arriba = 0
    Opciones.Pagina.Alto = 66
    Opciones.Pagina.Ancho = 80
    Opciones.Pagina.Tamanyo = 66
    Opciones.Pagina.SaltoPagina = True
    Opciones.Pagina.ImprimePrimeraCabecera = True
    Opciones.Pagina.ImprimeUltimoPie = True
    Titulo = 'Oferta Matricial'
    ControlaLongitud = True
    Left = 312
    Top = 12
  end
  object HYRSCabecera: THYReportSource
    DataSet = QMCabecera
    CloseDataset = True
    Left = 306
    Top = 66
  end
  object HYRSDetalle: THYReportSource
    DataSet = QMDetalle
    CloseDataset = True
    Left = 304
    Top = 114
  end
end
