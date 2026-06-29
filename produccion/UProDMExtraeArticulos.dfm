object ProDMExtraeArticulos: TProDMExtraeArticulos
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 42
  Top = 92
  Height = 274
  Width = 395
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 32
    Top = 8
  end
  object xArticulos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from art_articulos'
      'where id_a = ?id_a')
    UniDirectional = False
    Left = 32
    Top = 64
    object xArticulosID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object xArticulosPESO: TFloatField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
    end
    object xArticulosUBICABLE: TIntegerField
      DisplayLabel = 'Ubicable'
      FieldName = 'UBICABLE'
    end
    object xArticulosVOLUMEN_UNIT: TFloatField
      DisplayLabel = 'Vol. Unit.'
      FieldName = 'VOLUMEN_UNIT'
    end
    object xArticulosDIAMETRO_UNIT: TFloatField
      DisplayLabel = 'Diam. Unit.'
      FieldName = 'DIAMETRO_UNIT'
    end
    object xArticulosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xArticulosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxArticulos: TDataSource
    DataSet = xArticulos
    Left = 135
    Top = 66
  end
  object QMDistribucion: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_TMP_ORDEN_UBICACIONES'
      'WHERE ID_D_UBICACION = ?ID_D_UBICACION')
    InsertSQL.Strings = (
      
        'insert into pro_tmp_orden_ubicaciones(entrada,empresa,ejercicio,' +
        'canal,serie,tipo,rig,linea,id_a,id_orden,id_ubicacion,linea_ubic' +
        'acion,'
      
        '   ubicacion,unidades,volumen,peso,diametro,id_d_ubicacion,id_a_' +
        'ubicacion,'
      
        '   general,almacen,calle,estanteria,repisa,posicion,articulo,tit' +
        'ulo)'
      
        'values(?entrada,?empresa,?ejercicio,?canal,?serie,?tipo,?rig,?li' +
        'nea,?id_a,?id_orden,?id_ubicacion,?linea_ubicacion,'
      
        '   ?ubicacion,?unidades,?volumen,?peso,?diametro,?id_d_ubicacion' +
        ',?id_a_ubicacion,'
      
        '   ?general,?almacen,?calle,?estanteria,?repisa,?posicion,?artic' +
        'ulo,?titulo)'
      ''
      '')
    RefreshSQL.Strings = (
      'SELECT * FROM PRO_TMP_ORDEN_UBICACIONES'
      'WHERE ENTRADA = ?ENTRADA AND'
      '              ID_D_UBICACION = ?ID_D_UBICACION')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_TMP_ORDEN_UBICACIONES'
      'WHERE ENTRADA = ?ENTRADA AND ID_ORDEN=?ID_ORDEN')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'update pro_tmp_orden_ubicaciones'
      ' set id_ubicacion = ?id_ubicacion'
      '      ,ubicacion   =  ?ubicacion'
      '      ,unidades    = ?unidades'
      '      ,volumen     = ?volumen'
      '      ,peso           = ?peso'
      '      ,diametro      = ?diametro'
      '       ,general      =  ?general'
      '       ,almacen    = ?almacen'
      '       ,calle          = ?calle'
      '       ,estanteria  = ?estanteria'
      '       ,repisa        = ?repisa'
      '       ,posicion     = ?posicion'
      '       ,id_a_ubicacion = ?id_a_ubicacion'
      '       ,titulo =?titulo'
      'where ENTRADA = ?ENTRADA  AND'
      '           ID_D_UBICACION = ?ID_D_UBICACION')
    DataSource = DSxArticulos
    AfterDelete = Graba
    AfterPost = Graba
    BeforePost = QMDistribucionBeforePost
    OnNewRecord = QMDistribucionNewRecord
    ClavesPrimarias.Strings = (
      'ENTRADA '
      'ID_D_UBICACION'#13)
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_TMP_ORDEN_UBICACIONES'
    UpdateTransaction = TLocal
    Left = 32
    Top = 120
    object QMDistribucionENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMDistribucionEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDistribucionEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDistribucionCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDistribucionSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMDistribucionTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMDistribucionRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMDistribucionLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDistribucionID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMDistribucionID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMDistribucionID_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubicacion'
      FieldName = 'ID_UBICACION'
    end
    object QMDistribucionLINEA_UBICACION: TIntegerField
      DisplayLabel = 'Linea Ubic.'
      FieldName = 'LINEA_UBICACION'
    end
    object QMDistribucionUBICACION: TFIBStringField
      DisplayLabel = 'Ubicacion'
      FieldName = 'UBICACION'
      OnChange = QMDistribucionUBICACIONChange
    end
    object QMDistribucionUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
      OnChange = QMDistribucionUNIDADESChange
    end
    object QMDistribucionVOLUMEN: TFloatField
      DisplayLabel = 'Volumen'
      FieldName = 'VOLUMEN'
    end
    object QMDistribucionPESO: TFloatField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
    end
    object QMDistribucionDIAMETRO: TFloatField
      DisplayLabel = 'Diametro'
      FieldName = 'DIAMETRO'
    end
    object QMDistribucionID_D_UBICACION: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_D_UBICACION'
    end
    object QMDistribucionID_A_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubic. Art.'
      FieldName = 'ID_A_UBICACION'
    end
    object QMDistribucionGENERAL: TIntegerField
      DisplayLabel = 'General'
      FieldName = 'GENERAL'
    end
    object QMDistribucionALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMDistribucionCALLE: TFIBStringField
      DisplayLabel = 'Calle'
      FieldName = 'CALLE'
      Size = 3
    end
    object QMDistribucionESTANTERIA: TFIBStringField
      DisplayLabel = 'Estanteria'
      FieldName = 'ESTANTERIA'
      Size = 3
    end
    object QMDistribucionREPISA: TFIBStringField
      DisplayLabel = 'Repisa'
      FieldName = 'REPISA'
      Size = 3
    end
    object QMDistribucionPOSICION: TFIBStringField
      DisplayLabel = 'Pos.'
      FieldName = 'POSICION'
      Size = 3
    end
    object QMDistribucionARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMDistribucionTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSQMDistribucion: TDataSource
    DataSet = QMDistribucion
    Left = 135
    Top = 122
  end
  object ZxAlmacenMat: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select almacen from pro_ord_mat'
      'where id_orden_mat=?id_orden_mat')
    UniDirectional = False
    Left = 244
    Top = 66
    object ZxAlmacenMatALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
  end
  object ZxAlmacenOrd: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select almacen_ent from pro_ord'
      'where id_orden=?id_orden')
    UniDirectional = False
    Left = 244
    Top = 118
    object ZxAlmacenOrdALMACEN_ENT: TFIBStringField
      DisplayLabel = 'Alm. Ent.'
      FieldName = 'ALMACEN_ENT'
      Size = 3
    end
  end
end
