object ProDMDesDespiece: TProDMDesDespiece
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 395
  Top = 145
  Height = 397
  Width = 477
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 312
    Top = 16
  end
  object QMDetDespiece: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_DES_DET_DESPIECE'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  ID_CAB_DESPIECE=?old_ID_CAB_DESPIECE ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_DES_DET_DESPIECE'
      
        '  (COMPONENTE,PROFUNDIDAD,ID_TIPO_MATERIAL,FORMULA_CALC_ALTURA,F' +
        'ORMULA_CALC_ANCHURA,FORMULA_CALC_PROF,FORMULA_CALC_GRUESO,METROS' +
        '_DESCONTAR,GRUESO,ANCHO,ALTO,CANTIDAD,ID_TIPO_PIEZA,RIG,LINEA,EM' +
        'PRESA,FASE,EJERCICIO,CANAL,SERIE,ID_CAB_DESPIECE,ID_DET_DESPIECE' +
        ',FORMULA)'
      'VALUES'
      
        '  (?COMPONENTE,?PROFUNDIDAD,?ID_TIPO_MATERIAL,?FORMULA_CALC_ALTU' +
        'RA,?FORMULA_CALC_ANCHURA,?FORMULA_CALC_PROF,?FORMULA_CALC_GRUESO' +
        ',?METROS_DESCONTAR,?GRUESO,?ANCHO,?ALTO,?CANTIDAD,?ID_TIPO_PIEZA' +
        ',?RIG,?LINEA,?EMPRESA,?FASE,?EJERCICIO,?CANAL,?SERIE,?ID_CAB_DES' +
        'PIECE,?ID_DET_DESPIECE,?FORMULA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_DES_DET_DESPIECE'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  ID_CAB_DESPIECE=?ID_CAB_DESPIECE ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_DES_DET_DESPIECE'
      'where id_cab_despiece=?id_despiece'
      'order by id_cab_despiece,linea')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_DES_DET_DESPIECE'
      'SET'
      '  COMPONENTE=?COMPONENTE '
      '  ,PROFUNDIDAD=?PROFUNDIDAD '
      '  ,ID_TIPO_MATERIAL=?ID_TIPO_MATERIAL '
      '  ,FORMULA_CALC_ALTURA=?FORMULA_CALC_ALTURA '
      '  ,FORMULA_CALC_ANCHURA=?FORMULA_CALC_ANCHURA '
      '  ,FORMULA_CALC_PROF=?FORMULA_CALC_PROF '
      '  ,FORMULA_CALC_GRUESO=?FORMULA_CALC_GRUESO '
      '  ,METROS_DESCONTAR=?METROS_DESCONTAR '
      '  ,GRUESO=?GRUESO '
      '  ,ANCHO=?ANCHO '
      '  ,ALTO=?ALTO '
      '  ,CANTIDAD=?CANTIDAD '
      '  ,ID_TIPO_PIEZA=?ID_TIPO_PIEZA '
      '  ,RIG=?RIG '
      '  ,EMPRESA=?EMPRESA '
      '  ,FASE=?FASE '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,SERIE=?SERIE '
      '  ,ID_DET_DESPIECE=?ID_DET_DESPIECE '
      '  ,FORMULA=?FORMULA'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  ID_CAB_DESPIECE=?ID_CAB_DESPIECE ')
    DataSource = DSCabDespiece
    AfterDelete = Graba
    AfterPost = Graba
    OnNewRecord = QMDetDespieceNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'ID_CAB_DESPIECE ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_DES_DET_DESPIECE'
    UpdateTransaction = TLocal
    Left = 48
    Top = 96
    object QMDetDespieceEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetDespieceEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDetDespieceCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDetDespieceSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMDetDespieceRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMDetDespieceLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMDetDespieceFASE: TFIBStringField
      DisplayLabel = 'Fase'
      FieldName = 'FASE'
      Size = 3
    end
    object QMDetDespieceCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMDetDespieceALTO: TFloatField
      DisplayLabel = 'Alto'
      FieldName = 'ALTO'
    end
    object QMDetDespieceANCHO: TFloatField
      DisplayLabel = 'Ancho'
      FieldName = 'ANCHO'
    end
    object QMDetDespieceGRUESO: TFloatField
      DisplayLabel = 'Grueso'
      FieldName = 'GRUESO'
    end
    object QMDetDespieceMETROS_DESCONTAR: TFloatField
      DisplayLabel = 'Metros'
      FieldName = 'METROS_DESCONTAR'
    end
    object QMDetDespieceID_CAB_DESPIECE: TIntegerField
      DisplayLabel = 'ID Cab. Desp.'
      FieldName = 'ID_CAB_DESPIECE'
    end
    object QMDetDespieceID_DET_DESPIECE: TIntegerField
      DisplayLabel = 'ID Det. Desp.'
      FieldName = 'ID_DET_DESPIECE'
    end
    object QMDetDespieceDescFase: TStringField
      DisplayLabel = 'Desc. Fase'
      FieldKind = fkCalculated
      FieldName = 'DescFase'
      OnGetText = QMDetDespieceDescFaseGetText
      Size = 40
      Calculated = True
    end
    object QMDetDespieceDescTipoPieza: TStringField
      DisplayLabel = 'Desc. Tipo Pieza'
      FieldKind = fkCalculated
      FieldName = 'DescTipoPieza'
      OnGetText = QMDetDespieceDescTipoPiezaGetText
      Size = 60
      Calculated = True
    end
    object QMDetDespieceID_TIPO_PIEZA: TFIBStringField
      DisplayLabel = 'ID Tipo Pieza'
      FieldName = 'ID_TIPO_PIEZA'
      Size = 3
    end
    object QMDetDespieceCOMPONENTE: TFIBStringField
      DisplayLabel = 'Componente'
      FieldName = 'COMPONENTE'
      Size = 15
    end
    object QMDetDespiecePROFUNDIDAD: TFloatField
      DisplayLabel = 'Profundidad'
      FieldName = 'PROFUNDIDAD'
    end
    object QMDetDespieceID_TIPO_MATERIAL: TFIBStringField
      DisplayLabel = 'ID Tipo Mat.'
      FieldName = 'ID_TIPO_MATERIAL'
      Size = 3
    end
    object QMDetDespieceFORMULA_CALC_ALTURA: TFIBStringField
      DisplayLabel = 'F'#243'rm. Calc. Altura'
      FieldName = 'FORMULA_CALC_ALTURA'
      Size = 60
    end
    object QMDetDespieceFORMULA_CALC_ANCHURA: TFIBStringField
      DisplayLabel = 'F'#243'rm. Calc. Ancho'
      FieldName = 'FORMULA_CALC_ANCHURA'
      Size = 60
    end
    object QMDetDespieceFORMULA_CALC_PROF: TFIBStringField
      DisplayLabel = 'F'#243'rm. Calc. Prof.'
      FieldName = 'FORMULA_CALC_PROF'
      Size = 60
    end
    object QMDetDespieceFORMULA_CALC_GRUESO: TFIBStringField
      DisplayLabel = 'F'#243'rm. Calc. Grueso'
      FieldName = 'FORMULA_CALC_GRUESO'
      Size = 60
    end
    object QMDetDespieceDescComponente: TStringField
      DisplayLabel = 'Desc. Componente'
      FieldKind = fkCalculated
      FieldName = 'DescComponente'
      OnGetText = QMDetDespieceDescComponenteGetText
      Size = 60
      Calculated = True
    end
    object QMDetDespieceDescTMaterial: TStringField
      DisplayLabel = 'Desc. T. Material'
      FieldKind = fkCalculated
      FieldName = 'DescTMaterial'
      OnGetText = QMDetDespieceDescTMaterialGetText
      Size = 60
      Calculated = True
    end
    object QMDetDespieceFORMULA: TIntegerField
      DisplayLabel = 'F'#243'rmula'
      FieldName = 'FORMULA'
    end
  end
  object DSCabDespiece: TDataSource
    DataSet = QMCabDespiece
    Left = 144
    Top = 16
  end
  object DSDetDespiece: TDataSource
    DataSet = QMDetDespiece
    Left = 144
    Top = 96
  end
  object xLineaDet: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select max(linea) as nlinea from pro_des_det_despiece'
      'where (id_cab_despiece=?id_despiece)')
    Transaction = TLocal
    AutoTrans = True
    Left = 48
    Top = 160
  end
  object xDescFase: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from pro_sys_fases'
      'where fase=?fase')
    UniDirectional = False
    DataSource = DSDetDespiece
    Left = 136
    Top = 160
    object xDescFaseTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object xDescTPieza: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select descripcion from pro_des_tipo_pieza'
      'where codigo=?id_tipo_pieza')
    UniDirectional = False
    DataSource = DSDetDespiece
    Left = 240
    Top = 160
    object xDescTPiezaDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
  object xBuscarIDEsc: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select id_esc from pro_escandallo'
      'where empresa=?empresa and escandallo=?escandallo and tipo='#39'EPR'#39)
    UniDirectional = False
    Left = 240
    Top = 32
    object xBuscarIDEscID_ESC: TIntegerField
      DisplayLabel = 'ID Esc.'
      FieldName = 'ID_ESC'
    end
  end
  object xRecuperarEsc: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select escandallo from pro_escandallo'
      'where id_esc=?id_esc')
    UniDirectional = False
    Left = 240
    Top = 89
    object xRecuperarEscESCANDALLO: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'ESCANDALLO'
    end
  end
  object xDescComponente: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo from art_articulos'
      'where empresa=?empresa and articulo=?componente')
    UniDirectional = False
    DataSource = DSDetDespiece
    Left = 56
    Top = 208
    object xDescComponenteTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object xDescTMaterial: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select descripcion from pro_des_cab_material'
      'where tipo=?id_tipo_material')
    UniDirectional = False
    DataSource = DSDetDespiece
    Left = 152
    Top = 208
    object xDescTMaterialDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
  object xImportarEsc: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure pro_des_importar_esc(?empresa,?ejercicio,?cana' +
        'l,?serie,'
      '?escandallo_des,?despiece)')
    Transaction = TLocal
    AutoTrans = True
    Left = 240
    Top = 216
  end
  object xComprobarImportacionEsc: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select count(*) as linies from pro_des_det_despiece'
      'where id_cab_despiece=?id_despiece')
    UniDirectional = False
    DataSource = DSCabDespiece
    Left = 48
    Top = 264
    object xComprobarImportacionEscLINIES: TIntegerField
      DisplayLabel = 'Lineas'
      FieldName = 'LINIES'
    end
  end
  object xInsertOF: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'INSERT INTO PRO_ORD ('
      
        'EMPRESA, EJERCICIO, CANAL, SERIES, ALMACEN_SAL, ALMACEN_LAN, ALM' +
        'ACEN_ENT, FECHA_ORD, CLIENTE, COMPUESTO, ESCANDALLO,'
      
        ' PEDIDO, LINEA_PED, FECHA_PED, UNI_PEDID, UNI_MANUAL, SUBORDEN, ' +
        'ID_ORDEN)'
      'VALUES ('
      
        ':EMPRESA, :EJERCICIO, :CANAL, :SERIES, :ALMACEN_SAL, :ALMACEN_LA' +
        'N, :ALMACEN_ENT, :FECHA_ORD, :CLIENTE, :ARTICULO,'
      
        ' :ESCANDALLO, :PEDIDO, :LINEA_PED, :FECHA_PED, :UNI_PEDID, :UNI_' +
        'MANUAL, :SUBORDEN, :ID_ORDEN) ')
    Transaction = TLocal
    AutoTrans = True
    Left = 392
    Top = 16
  end
  object Pro_Traspaso_Tipo_Lanzamiento: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'update pro_ord set tipo_lanzamiento=?TIPO_LANZAMIENTO'
      'where id_orden=?id_orden')
    Transaction = TLocal
    AutoTrans = True
    Left = 200
    Top = 305
  end
  object Pro_Update_Situacion: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'update pro_ord set SITUACION=?SITUACION'
      'where id_orden=?id_orden')
    Transaction = TLocal
    AutoTrans = True
    Left = 360
    Top = 271
  end
  object QMCabDespiece: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_DES_CAB_DESPIECE'
      'WHERE'
      '  ID_DESPIECE=?old_ID_DESPIECE ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_DES_CAB_DESPIECE'
      
        '  (ID_ORDEN,ID_SUBORDEN,NOTAS,GRUESO_PRINCIPAL,PROFUNDIDAD,ANCHO' +
        ',ALTO,COMENTARIO,FECHA_CREACION,IMAGEN,ID_ESCANDALLO,RIG,EMPRESA' +
        ',LINEA_PEDIDO,PEDIDO,ARTICULO_MAT_PRIMA,TIPO_MATERIAL,CANTIDAD,E' +
        'JERCICIO,CANAL,SERIE,ID_DESPIECE)'
      'VALUES'
      
        '  (?ID_ORDEN,?ID_SUBORDEN,?NOTAS,?GRUESO_PRINCIPAL,?PROFUNDIDAD,' +
        '?ANCHO,?ALTO,?COMENTARIO,?FECHA_CREACION,?IMAGEN,?ID_ESCANDALLO,' +
        '?RIG,?EMPRESA,?LINEA_PEDIDO,?PEDIDO,?ARTICULO_MAT_PRIMA,?TIPO_MA' +
        'TERIAL,?CANTIDAD,?EJERCICIO,?CANAL,?SERIE,?ID_DESPIECE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_DES_CAB_DESPIECE'
      'WHERE'
      '  ID_DESPIECE=?ID_DESPIECE ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_DES_CAB_DESPIECE'
      'order by id_despiece')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_DES_CAB_DESPIECE'
      'SET'
      '  ID_ORDEN=?ID_ORDEN '
      '  ,ID_SUBORDEN=?ID_SUBORDEN '
      '  ,NOTAS=?NOTAS '
      '  ,GRUESO_PRINCIPAL=?GRUESO_PRINCIPAL '
      '  ,PROFUNDIDAD=?PROFUNDIDAD '
      '  ,ANCHO=?ANCHO '
      '  ,ALTO=?ALTO '
      '  ,COMENTARIO=?COMENTARIO '
      '  ,FECHA_CREACION=?FECHA_CREACION '
      '  ,IMAGEN=?IMAGEN '
      '  ,ID_ESCANDALLO=?ID_ESCANDALLO '
      '  ,RIG=?RIG '
      '  ,EMPRESA=?EMPRESA '
      '  ,LINEA_PEDIDO=?LINEA_PEDIDO '
      '  ,PEDIDO=?PEDIDO '
      '  ,ARTICULO_MAT_PRIMA=?ARTICULO_MAT_PRIMA '
      '  ,TIPO_MATERIAL=?TIPO_MATERIAL '
      '  ,CANTIDAD=?CANTIDAD '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,CANAL=?CANAL '
      '  ,SERIE=?SERIE '
      'WHERE'
      '  ID_DESPIECE=?ID_DESPIECE ')
    AfterOpen = QMCabDespieceAfterOpen
    AfterPost = Graba
    AfterScroll = QMCabDespieceAfterScroll
    OnNewRecord = QMCabDespieceNewRecord
    ClavesPrimarias.Strings = (
      'ID_DESPIECE ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_DES_CAB_DESPIECE'
    UpdateTransaction = TLocal
    Left = 40
    Top = 16
    object QMCabDespieceESCANDALLO: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldKind = fkCalculated
      FieldName = 'ESCANDALLO'
      OnChange = QMCabDespieceESCANDALLOChange
      OnGetText = QMCabDespieceESCANDALLOGetText
      Calculated = True
    end
    object QMCabDespieceEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCabDespieceEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCabDespieceCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCabDespieceSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMCabDespieceRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMCabDespiecePEDIDO: TIntegerField
      DisplayLabel = 'Pedido'
      FieldName = 'PEDIDO'
    end
    object QMCabDespieceLINEA_PEDIDO: TIntegerField
      DisplayLabel = 'L'#237'nea Ped.'
      FieldName = 'LINEA_PEDIDO'
    end
    object QMCabDespieceFECHA_CREACION: TDateTimeField
      DisplayLabel = 'Fec. Creaci'#243'n'
      FieldName = 'FECHA_CREACION'
    end
    object QMCabDespieceID_ESCANDALLO: TIntegerField
      DisplayLabel = 'ID Esc.'
      FieldName = 'ID_ESCANDALLO'
    end
    object QMCabDespieceTIPO_MATERIAL: TFIBStringField
      DisplayLabel = 'Tipo Mat.'
      FieldName = 'TIPO_MATERIAL'
      OnChange = QMCabDespieceTIPO_MATERIALChange
      Size = 3
    end
    object QMCabDespieceARTICULO_MAT_PRIMA: TFIBStringField
      DisplayLabel = 'Art. Mat. Prima'
      FieldName = 'ARTICULO_MAT_PRIMA'
      Size = 15
    end
    object QMCabDespieceCOMENTARIO: TFIBStringField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      Size = 100
    end
    object QMCabDespieceALTO: TFloatField
      DisplayLabel = 'Alto'
      FieldName = 'ALTO'
    end
    object QMCabDespieceANCHO: TFloatField
      DisplayLabel = 'Ancho'
      FieldName = 'ANCHO'
    end
    object QMCabDespiecePROFUNDIDAD: TFloatField
      DisplayLabel = 'Profundidad'
      FieldName = 'PROFUNDIDAD'
    end
    object QMCabDespieceGRUESO_PRINCIPAL: TFloatField
      DisplayLabel = 'Grueso Princ.'
      FieldName = 'GRUESO_PRINCIPAL'
    end
    object QMCabDespieceNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMCabDespieceIMAGEN: TIntegerField
      DisplayLabel = 'Imagen'
      FieldName = 'IMAGEN'
    end
    object QMCabDespieceCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMCabDespieceID_DESPIECE: TIntegerField
      DisplayLabel = 'ID Despiece'
      FieldName = 'ID_DESPIECE'
    end
    object QMCabDespieceID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMCabDespieceID_SUBORDEN: TIntegerField
      DisplayLabel = 'ID Suborden'
      FieldName = 'ID_SUBORDEN'
    end
  end
end
