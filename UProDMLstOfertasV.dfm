object ProDMLstOfertasV: TProDMLstOfertasV
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 432
  Top = 233
  Height = 414
  Width = 548
  object frListadoRelOfe: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado costes (oferta/escandallo)'
    RebuildPrinter = False
    OnGetValue = frListadoRelOfeGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 352
    Top = 16
    ReportForm = {19000000}
  end
  object frDBListadoE: TfrDBDataSet
    DataSource = DSLstEscandallo
    Left = 232
    Top = 64
  end
  object QMLstFase: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select empresa,escandallo,linea_fase,fase,orden,tipofase,notas,t' +
        'ipo'
      'from pro_fases_esc'
      'where empresa=?empresa and escandallo=?escandallo and tipo=?tipo'
      'order by orden, linea_fase')
    UniDirectional = False
    DataSource = DSLstEscandallo
    AfterOpen = QMLstFaseAfterOpen
    Left = 32
    Top = 112
  end
  object DSLstFase: TDataSource
    DataSet = QMLstFase
    Left = 120
    Top = 112
  end
  object DSLstMateriales: TDataSource
    DataSet = QMLstMateriales
    Left = 120
    Top = 160
  end
  object DSLstTareas: TDataSource
    DataSet = QMLstTareas
    Left = 120
    Top = 208
  end
  object QMLstMateriales: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select  mat.empresa,mat.escandallo,mat.linea_fase,mat.componente' +
        ',mat.almacen,mat.unidades,mat.pre_cos_uni,mat.total_var,mat.prec' +
        'io_fijo,mat.total, art.titulo_largo as tituloart, al.titulo as tituloa' +
        'l,'
      'mat.notas,mat.tipo'
      'from pro_mat_esc mat '
      'join art_articulos art on (mat.empresa=art.empresa and '
      '                           mat.componente=art.articulo)'
      'join art_almacenes al on (mat.empresa=al.empresa and'
      '                          mat.almacen=al.almacen)'
      
        'where mat.empresa=?empresa and mat.escandallo=?escandallo and ma' +
        't.linea_fase=?linea_fase'
      ''
      'and mat.tipo=?tipo'
      'order by mat.orden, mat.linea_fase')
    UniDirectional = False
    DataSource = DSLstFase
    Left = 32
    Top = 160
  end
  object QMLstTareas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select tar.empresa,tar.escandallo,tar.linea_fase,tar.linea_tarea' +
        ',tar.tarea,tar.tipotarea,tar.recurso,tar.cantidad,tar.pre_cos_un' +
        'i, tar.total_var,tar.precio_fijo,total,tar.comentario,rec.titulo' +
        ','
      'tar.id_utillajes, uti.descripcion,tar.tipo'
      'from pro_tarea_esc tar '
      'left join pro_recursos rec on (tar.empresa=rec.empresa and '
      '                          tar.recurso=rec.recurso)'
      'left join pro_sys_utillajes uti on (tar.empresa=uti.empresa and'
      
        '                                                 tar.id_utillaje' +
        's=uti.codigo)'
      ''
      
        'where  tar.empresa=?empresa and tar.escandallo=?escandallo and t' +
        'ar.linea_fase=?linea_fase'
      'and tar.tipo=?tipo'
      'order by tar.orden')
    UniDirectional = False
    DataSource = DSLstFase
    Left = 32
    Top = 208
  end
  object DSLstEscandallo: TDataSource
    DataSet = QMLstEscandallo
    Left = 120
    Top = 64
  end
  object frDBListadoFase: TfrDBDataSet
    DataSource = DSLstFase
    Left = 232
    Top = 112
  end
  object frDBListadoMate: TfrDBDataSet
    DataSource = DSLstMateriales
    Left = 232
    Top = 160
  end
  object frDBListadoTareas: TfrDBDataSet
    DataSource = DSLstTareas
    Left = 232
    Top = 208
  end
  object xEscandallo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT COMPUESTO,UNIDADES,ESCANDALLO,EMPRESA FROM PRO_ESCANDALLO'
      'WHERE EMPRESA=?EMPRESA AND TIPO=?TIPO '
      'and id_detalles_ofertas_v=?id'
      '')
    UniDirectional = False
    Left = 32
    Top = 256
  end
  object DSEscandallo: TDataSource
    DataSet = xEscandallo
    Left = 120
    Top = 256
  end
  object TLocal: TFIBTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_commited')
    Left = 448
    Top = 16
  end
  object QMLstOfertaV: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_DETALLE_OFERTA_C'
      'WHERE'
      '  ID_S = ?ID_S'
      'ORDER BY LINEA')
    UniDirectional = False
    AfterOpen = QMLstOfertaVAfterOpen
    Left = 32
    Top = 16
  end
  object DSLstOfertaV: TDataSource
    DataSet = QMLstOfertaV
    Left = 120
    Top = 16
  end
  object QMLstEscandallo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select esc.empresa,esc.escandallo,esc.compuesto,esc.unidad,esc.u' +
        'nidades,esc.medida_1,esc.medida_2,esc.medida_3,'
      
        ' esc.coste_fijo,esc.coste_mobra,esc.coste_mater,esc.coste_maqui,' +
        'esc.coste_texte,esc.coste_var,esc.coste_total,'
      
        ' esc.estado,esc.notas,esc.dibujo,esc.fecha_creac,art.titulo_largo as titulo,esc.' +
        'tipo, esc.id_detalles_ofertas_v'
      'from pro_escandallo esc '
      
        'join art_articulos art on (esc.empresa=art.empresa and esc.compu' +
        'esto=art.articulo)'
      
        'where esc.empresa=?empresa and  id_detalles_ofertas_v=?id_detall' +
        'es_s')
    UniDirectional = False
    DataSource = DSLstOfertaV
    AfterOpen = QMLstEscandalloAfterOpen
    Left = 32
    Top = 64
  end
  object frDBListadoOfertaV: TfrDBDataSet
    DataSource = DSLstOfertaV
    Left = 232
    Top = 16
  end
  object frListadoRelOfeCli: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado oferta (cliente/escandallo)'
    RebuildPrinter = False
    OnGetValue = frListadoRelOfeGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 352
    Top = 64
    ReportForm = {19000000}
  end
end
