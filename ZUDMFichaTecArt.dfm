object ZDMFichaTecArt: TZDMFichaTecArt
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 472
  Top = 268
  Height = 478
  Width = 599
  object QMFichaTecArt: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ART_ARTICULOS_FICHA_TECNICA'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ARTICULO=?old_ARTICULO ')
    InsertSQL.Strings = (
      'INSERT INTO VER_ART_ARTICULOS_FICHA_TECNICA'
      
        '  (EMPRESA,ARTICULO,TITULO_ARTICULO,REIMPRESION,OBSERVACIONES_ET' +
        'IQ,'
      
        'ETIQUETA_X_CAJA,ANCHO_FILM_ESTAMP,NOTAS,FOTOGRABADO,FECHA_IMAGEN' +
        '_WEB,'
      'ID_A,ID_IMAGEN,CODIGO_BARNIZ,CODIGO_BARNIZ_2,BANDA_ESTAMPACION,'
      
        'AVANCE_ESTAMPACION,RELIEVE_EN_SECO,CODIGO_ESTAMPACION,TIPO_ETIQU' +
        'ETA,'
      'BOBINADO,MATERIAL_1,IMPRESION_ADHESIVO_1,IMPRESION_CARA_1,'
      
        'IMPRESION_DORSO_1,MATERIAL_2,IMPRESION_ADHESIVO_2,IMPRESION_CARA' +
        '_2,'
      
        'IMPRESION_DORSO_2,MATERIAL_3,IMPRESION_ADHESIVO_3,IMPRESION_CARA' +
        '_3,'
      
        'IMPRESION_DORSO_3,CODIGO_MODELOCAJA,DIAMETRO_EXTERIOR,DIAMETRO_I' +
        'NTERIOR,ETIQUETAS_AL_ANCHO,'
      
        'ETIQUETAS_X_ROLLO,PATH_IMAGEN,PUBLICACION_WEB,TROQUELES,TROQUELE' +
        'S_2)'
      'VALUES'
      
        '  (?EMPRESA,?ARTICULO,?TITULO_ARTICULO,?REIMPRESION,?OBSERVACION' +
        'ES_ETIQ,'
      
        '?ETIQUETA_X_CAJA,?ANCHO_FILM_ESTAMP,?NOTAS,?FOTOGRABADO,?FECHA_I' +
        'MAGEN_WEB,'
      
        '?ID_A,?ID_IMAGEN,?CODIGO_BARNIZ,?CODIGO_BARNIZ_2,?BANDA_ESTAMPAC' +
        'ION,'
      
        '?AVANCE_ESTAMPACION,?RELIEVE_EN_SECO,?CODIGO_ESTAMPACION,?TIPO_E' +
        'TIQUETA,'
      '?BOBINADO,?MATERIAL_1,?IMPRESION_ADHESIVO_1,?IMPRESION_CARA_1,'
      
        '?IMPRESION_DORSO_1,?MATERIAL_2,?IMPRESION_ADHESIVO_2,?IMPRESION_' +
        'CARA_2,'
      
        '?IMPRESION_DORSO_2,?MATERIAL_3,?IMPRESION_ADHESIVO_3,?IMPRESION_' +
        'CARA_3,'
      
        '?IMPRESION_DORSO_3,?CODIGO_MODELOCAJA,?DIAMETRO_EXTERIOR,?DIAMET' +
        'RO_INTERIOR,?ETIQUETAS_AL_ANCHO,'
      
        '?ETIQUETAS_X_ROLLO,?PATH_IMAGEN,?PUBLICACION_WEB,?TROQUELES,?TRO' +
        'QUELES_2)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ART_ARTICULOS_FICHA_TECNICA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO ')
    SelectSQL.Strings = (
      '/* Se modifica en el codigo */'
      'SELECT * FROM VER_ART_ARTICULOS_FICHA_TECNICA'
      'WHERE '
      'EMPRESA=?EMPRESA'
      'ORDER BY EMPRESA, ARTICULO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ART_ARTICULOS_FICHA_TECNICA'
      'SET'
      '  TITULO_ARTICULO=?TITULO_ARTICULO '
      '  ,REIMPRESION=?REIMPRESION '
      '  ,OBSERVACIONES_ETIQ=?OBSERVACIONES_ETIQ '
      '  ,ETIQUETA_X_CAJA=?ETIQUETA_X_CAJA '
      '  ,ANCHO_FILM_ESTAMP=?ANCHO_FILM_ESTAMP '
      '  ,NOTAS=?NOTAS '
      '  ,FOTOGRABADO=?FOTOGRABADO '
      '  ,FECHA_IMAGEN_WEB=?FECHA_IMAGEN_WEB '
      '  ,ID_A=?ID_A '
      '  ,ID_IMAGEN=?ID_IMAGEN '
      '  ,CODIGO_BARNIZ=?CODIGO_BARNIZ '
      '  ,CODIGO_BARNIZ_2=?CODIGO_BARNIZ_2 '
      '  ,BANDA_ESTAMPACION=?BANDA_ESTAMPACION '
      '  ,AVANCE_ESTAMPACION=?AVANCE_ESTAMPACION '
      '  ,RELIEVE_EN_SECO=?RELIEVE_EN_SECO '
      '  ,CODIGO_ESTAMPACION=?CODIGO_ESTAMPACION '
      '  ,TIPO_ETIQUETA=?TIPO_ETIQUETA '
      '  ,BOBINADO=?BOBINADO '
      '  ,MATERIAL_1=?MATERIAL_1 '
      '  ,IMPRESION_ADHESIVO_1=?IMPRESION_ADHESIVO_1 '
      '  ,IMPRESION_CARA_1=?IMPRESION_CARA_1 '
      '  ,IMPRESION_DORSO_1=?IMPRESION_DORSO_1 '
      '  ,MATERIAL_2=?MATERIAL_2 '
      '  ,IMPRESION_ADHESIVO_2=?IMPRESION_ADHESIVO_2 '
      '  ,IMPRESION_CARA_2=?IMPRESION_CARA_2 '
      '  ,IMPRESION_DORSO_2=?IMPRESION_DORSO_2 '
      '  ,MATERIAL_3=?MATERIAL_3 '
      '  ,IMPRESION_ADHESIVO_3=?IMPRESION_ADHESIVO_3 '
      '  ,IMPRESION_CARA_3=?IMPRESION_CARA_3 '
      '  ,IMPRESION_DORSO_3=?IMPRESION_DORSO_3 '
      '  ,CODIGO_MODELOCAJA=?CODIGO_MODELOCAJA '
      '  ,DIAMETRO_EXTERIOR=?DIAMETRO_EXTERIOR '
      '  ,DIAMETRO_INTERIOR=?DIAMETRO_INTERIOR '
      '  ,ETIQUETAS_AL_ANCHO=?ETIQUETAS_AL_ANCHO '
      '  ,ETIQUETAS_X_ROLLO=?ETIQUETAS_X_ROLLO '
      '  ,PATH_IMAGEN=?PATH_IMAGEN '
      '  ,PUBLICACION_WEB=?PUBLICACION_WEB '
      '  ,TROQUELES=?TROQUELES '
      '  ,TROQUELES_2=?TROQUELES_2 '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO ')
    AfterOpen = QMFichaTecArtAfterOpen
    BeforeClose = QMFichaTecArtBeforeClose
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ARTICULO ')
    AccionesInhibidas = []
    Opciones = [OrdenarPorPk, NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ART_ARTICULOS_FICHA_TECNICA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 24
    object QMFichaTecArtEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMFichaTecArtARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMFichaTecArtTITULO_ARTICULO: TFIBStringField
      DisplayLabel = 'Titulo Art.'
      DisplayWidth = 256
      FieldName = 'TITULO_ARTICULO'
      Size = 256
    end
    object QMFichaTecArtREIMPRESION: TIntegerField
      DisplayLabel = 'Reimpresion'
      FieldName = 'REIMPRESION'
    end
    object QMFichaTecArtOBSERVACIONES_ETIQ: TMemoField
      DisplayLabel = 'Observaciones'
      FieldName = 'OBSERVACIONES_ETIQ'
      BlobType = ftMemo
      Size = 8
    end
    object QMFichaTecArtETIQUETA_X_CAJA: TIntegerField
      DisplayLabel = 'Etq. x caja'
      FieldName = 'ETIQUETA_X_CAJA'
    end
    object QMFichaTecArtANCHO_FILM_ESTAMP: TIntegerField
      DisplayLabel = 'Ancho Film Estamp.'
      FieldName = 'ANCHO_FILM_ESTAMP'
    end
    object QMFichaTecArtNOTAS: TMemoField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object QMFichaTecArtFOTOGRABADO: TFIBStringField
      DisplayLabel = 'Fotograbado'
      FieldName = 'FOTOGRABADO'
      Size = 15
    end
    object QMFichaTecArtFECHA_IMAGEN_WEB: TDateTimeField
      DisplayLabel = 'F. Imagen Web'
      FieldName = 'FECHA_IMAGEN_WEB'
    end
    object QMFichaTecArtID_A: TIntegerField
      DisplayLabel = 'Id A'
      FieldName = 'ID_A'
    end
    object QMFichaTecArtID_IMAGEN: TIntegerField
      DisplayLabel = 'Id Imagen'
      FieldName = 'ID_IMAGEN'
    end
    object QMFichaTecArtCODIGO_BARNIZ: TFIBStringField
      DisplayLabel = 'Cod. Barniz'
      FieldName = 'CODIGO_BARNIZ'
      Size = 15
    end
    object QMFichaTecArtCODIGO_BARNIZ_2: TFIBStringField
      DisplayLabel = 'Cod. Barniz 2'
      FieldName = 'CODIGO_BARNIZ_2'
      Size = 15
    end
    object QMFichaTecArtBANDA_ESTAMPACION: TFloatField
      DisplayLabel = 'Banda Estamp.'
      FieldName = 'BANDA_ESTAMPACION'
    end
    object QMFichaTecArtAVANCE_ESTAMPACION: TFloatField
      DisplayLabel = 'Avance Estamp.'
      FieldName = 'AVANCE_ESTAMPACION'
    end
    object QMFichaTecArtRELIEVE_EN_SECO: TIntegerField
      DisplayLabel = 'Relieve en seco'
      FieldName = 'RELIEVE_EN_SECO'
    end
    object QMFichaTecArtCODIGO_ESTAMPACION: TFIBStringField
      DisplayLabel = 'Cod. Estamp.'
      FieldName = 'CODIGO_ESTAMPACION'
      Size = 15
    end
    object QMFichaTecArtTIPO_ETIQUETA: TFIBStringField
      DisplayLabel = 'Tipo Etiqueta'
      FieldName = 'TIPO_ETIQUETA'
      Size = 3
    end
    object QMFichaTecArtBOBINADO: TFIBStringField
      DisplayLabel = 'Bobinado'
      FieldName = 'BOBINADO'
      Size = 3
    end
    object QMFichaTecArtMATERIAL_1: TFIBStringField
      DisplayLabel = 'Material 1'
      FieldName = 'MATERIAL_1'
      Size = 15
    end
    object QMFichaTecArtIMPRESION_ADHESIVO_1: TIntegerField
      DisplayLabel = 'Impr. Adhesivo 1'
      FieldName = 'IMPRESION_ADHESIVO_1'
    end
    object QMFichaTecArtIMPRESION_CARA_1: TIntegerField
      DisplayLabel = 'Impr. Cara 1'
      FieldName = 'IMPRESION_CARA_1'
    end
    object QMFichaTecArtIMPRESION_DORSO_1: TIntegerField
      DisplayLabel = 'Impr. Dorso 1'
      FieldName = 'IMPRESION_DORSO_1'
    end
    object QMFichaTecArtMATERIAL_2: TFIBStringField
      DisplayLabel = 'Material 2'
      FieldName = 'MATERIAL_2'
      Size = 15
    end
    object QMFichaTecArtIMPRESION_ADHESIVO_2: TIntegerField
      DisplayLabel = 'Impr. Adhesivo 2'
      FieldName = 'IMPRESION_ADHESIVO_2'
    end
    object QMFichaTecArtIMPRESION_CARA_2: TIntegerField
      DisplayLabel = 'Impr. Cara 2'
      FieldName = 'IMPRESION_CARA_2'
    end
    object QMFichaTecArtIMPRESION_DORSO_2: TIntegerField
      DisplayLabel = 'Impr. Dorso 2'
      FieldName = 'IMPRESION_DORSO_2'
    end
    object QMFichaTecArtMATERIAL_3: TFIBStringField
      DisplayLabel = 'Material 3'
      FieldName = 'MATERIAL_3'
      Size = 15
    end
    object QMFichaTecArtIMPRESION_ADHESIVO_3: TIntegerField
      DisplayLabel = 'Impr. Adhesivo 3'
      FieldName = 'IMPRESION_ADHESIVO_3'
    end
    object QMFichaTecArtIMPRESION_CARA_3: TIntegerField
      DisplayLabel = 'Impr. Cara 3'
      FieldName = 'IMPRESION_CARA_3'
    end
    object QMFichaTecArtIMPRESION_DORSO_3: TIntegerField
      DisplayLabel = 'Impr. Dorso 3'
      FieldName = 'IMPRESION_DORSO_3'
    end
    object QMFichaTecArtCODIGO_MODELOCAJA: TFIBStringField
      DisplayLabel = 'Cod. Modelocaja'
      FieldName = 'CODIGO_MODELOCAJA'
      Size = 3
    end
    object QMFichaTecArtDIAMETRO_EXTERIOR: TFloatField
      DisplayLabel = 'Diametro Exterior'
      FieldName = 'DIAMETRO_EXTERIOR'
    end
    object QMFichaTecArtDIAMETRO_INTERIOR: TFloatField
      DisplayLabel = 'Diametro Interior'
      FieldName = 'DIAMETRO_INTERIOR'
    end
    object QMFichaTecArtETIQUETAS_AL_ANCHO: TFloatField
      DisplayLabel = 'Etqs. al Ancho'
      FieldName = 'ETIQUETAS_AL_ANCHO'
    end
    object QMFichaTecArtETIQUETAS_X_ROLLO: TFloatField
      DisplayLabel = 'Etqs. x Rollo'
      FieldName = 'ETIQUETAS_X_ROLLO'
    end
    object QMFichaTecArtPATH_IMAGEN: TFIBStringField
      DisplayLabel = 'Path Img.'
      FieldName = 'PATH_IMAGEN'
      Size = 200
    end
    object QMFichaTecArtPUBLICACION_WEB: TIntegerField
      DisplayLabel = 'Publicacion Web'
      FieldName = 'PUBLICACION_WEB'
    end
    object QMFichaTecArtTROQUELES: TIntegerField
      DisplayLabel = 'Troquel'
      FieldName = 'TROQUELES'
    end
    object QMFichaTecArtTROQUELES_2: TIntegerField
      DisplayLabel = 'Troquel 2'
      FieldName = 'TROQUELES_2'
    end
    object QMFichaTecArtESCANDALLO: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'ESCANDALLO'
    end
    object QMFichaTecArtANCHO: TFloatField
      DisplayLabel = 'Ancho'
      FieldName = 'ANCHO'
    end
    object QMFichaTecArtSH_ANCHO: TFloatField
      DisplayLabel = 'S. Ancho'
      FieldName = 'SH_ANCHO'
    end
    object QMFichaTecArtAVANCE: TFloatField
      DisplayLabel = 'Avance'
      FieldName = 'AVANCE'
    end
    object QMFichaTecArtSV_AVANCE: TFloatField
      DisplayLabel = 'S. Avance'
      FieldName = 'SV_AVANCE'
    end
    object QMFichaTecArtPOS_Z: TIntegerField
      DisplayLabel = 'Pos Z'
      FieldName = 'POS_Z'
    end
    object QMFichaTecArtFORMA: TFIBStringField
      DisplayLabel = 'Forma'
      FieldName = 'FORMA'
      Size = 11
    end
    object QMFichaTecArtANCHO_2: TFloatField
      DisplayLabel = 'Ancho 2'
      FieldName = 'ANCHO_2'
    end
    object QMFichaTecArtSH_ANCHO_2: TFloatField
      DisplayLabel = 'S. Ancho 2'
      FieldName = 'SH_ANCHO_2'
    end
    object QMFichaTecArtAVANCE_2: TFloatField
      DisplayLabel = 'Avance 2'
      FieldName = 'AVANCE_2'
    end
    object QMFichaTecArtSV_AVANCE_2: TFloatField
      DisplayLabel = 'S. Avance 2'
      FieldName = 'SV_AVANCE_2'
    end
    object QMFichaTecArtPOS_Z_2: TIntegerField
      DisplayLabel = 'Pos Z 2'
      FieldName = 'POS_Z_2'
    end
    object QMFichaTecArtFORMA_2: TFIBStringField
      DisplayLabel = 'Forma 2'
      FieldName = 'FORMA_2'
      Size = 11
    end
  end
  object DSQMFichaTecArt: TDataSource
    DataSet = QMFichaTecArt
    Left = 144
    Top = 24
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 456
    Top = 24
  end
  object QMArticuloTextos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_ART_ARTICULOS_TEXTOS_ETIQ'
      'WHERE'
      '  COD_ART_TEXTO=?old_COD_ART_TEXTO AND '
      '  ARTICULO=?old_ARTICULO AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO Z_ART_ARTICULOS_TEXTOS_ETIQ'
      
        '  (EMPRESA,ARTICULO,COD_ART_TEXTO,TEXTO,TIPO_AUX_COLOR,CODIGO_CO' +
        'LOR,PANTONE,CUERPO_IMPRESION,COMP_PANTONE,TIPO_AUX_ANILOX,CODIGO' +
        '_ANILOX)'
      'VALUES'
      
        '  (?EMPRESA,?ARTICULO,?COD_ART_TEXTO,?TEXTO,?TIPO_AUX_COLOR,?COD' +
        'IGO_COLOR,?PANTONE,?CUERPO_IMPRESION,?COMP_PANTONE,?TIPO_AUX_ANI' +
        'LOX,?CODIGO_ANILOX)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_ART_ARTICULOS_TEXTOS_ETIQ'
      'WHERE'
      '  COD_ART_TEXTO=?COD_ART_TEXTO AND '
      '  ARTICULO=?ARTICULO AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM Z_ART_ARTICULOS_TEXTOS_ETIQ'
      'WHERE'
      '  ARTICULO=?ARTICULO AND '
      '  EMPRESA=?EMPRESA ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_ART_ARTICULOS_TEXTOS_ETIQ'
      'SET'
      '  TEXTO=?TEXTO '
      '  ,TIPO_AUX_COLOR=?TIPO_AUX_COLOR '
      '  ,CODIGO_COLOR=?CODIGO_COLOR '
      '  ,PANTONE=?PANTONE '
      '  ,CUERPO_IMPRESION=?CUERPO_IMPRESION '
      '  ,COMP_PANTONE=?COMP_PANTONE '
      '  ,TIPO_AUX_ANILOX=?TIPO_AUX_ANILOX '
      '  ,CODIGO_ANILOX=?CODIGO_ANILOX '
      'WHERE'
      '  COD_ART_TEXTO=?COD_ART_TEXTO AND '
      '  ARTICULO=?ARTICULO AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMFichaTecArt
    BeforePost = QMArticuloTextosBeforePost
    OnNewRecord = QMArticuloTextosNewRecord
    ClavesPrimarias.Strings = (
      'COD_ART_TEXTO '
      'ARTICULO '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_ART_ARTICULOS_TEXTOS_ETIQ'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 72
    object QMArticuloTextosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMArticuloTextosARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMArticuloTextosCOD_ART_TEXTO: TIntegerField
      DisplayLabel = 'N'#250'm.'
      FieldName = 'COD_ART_TEXTO'
    end
    object QMArticuloTextosTEXTO: TFIBStringField
      DisplayLabel = 'Texto'
      FieldName = 'TEXTO'
      Size = 40
    end
    object QMArticuloTextosTIPO_AUX_COLOR: TFIBStringField
      DisplayLabel = 'Tipo Aux. Color'
      FieldName = 'TIPO_AUX_COLOR'
      Size = 3
    end
    object QMArticuloTextosCODIGO_COLOR: TFIBStringField
      DisplayLabel = 'Color'
      FieldName = 'CODIGO_COLOR'
      OnChange = QMArticuloTextosCODIGO_COLORChange
      Size = 8
    end
    object QMArticuloTextosCodigo_color_descripcion: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldKind = fkCalculated
      FieldName = 'Codigo_color_descripcion'
      OnGetText = QMArticuloTextosCodigo_color_descripcionGetText
      Size = 40
      Calculated = True
    end
    object QMArticuloTextosTIPO_AUX_ANILOX: TFIBStringField
      DisplayLabel = 'Tipo Aux. Anilox'
      FieldName = 'TIPO_AUX_ANILOX'
      Size = 3
    end
    object QMArticuloTextosCODIGO_ANILOX: TFIBStringField
      DisplayLabel = 'Anilox'
      FieldName = 'CODIGO_ANILOX'
      Size = 8
    end
    object QMArticuloTextosDescAnilox: TStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldKind = fkCalculated
      FieldName = 'DescAnilox'
      Size = 40
      Calculated = True
    end
    object QMArticuloTextosPANTONE: TIntegerField
      DisplayLabel = 'Pantone'
      FieldName = 'PANTONE'
    end
    object QMArticuloTextosCUERPO_IMPRESION: TIntegerField
      DisplayLabel = 'Cuerpo Imp.'
      FieldName = 'CUERPO_IMPRESION'
    end
    object QMArticuloTextosCOMP_PANTONE: TFIBStringField
      DisplayLabel = 'Comp. Pantone'
      FieldName = 'COMP_PANTONE'
      Size = 200
    end
  end
  object DSQMArticuloTextos: TDataSource
    DataSet = QMArticuloTextos
    Left = 144
    Top = 72
  end
  object xMaquinas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from z_emp_maquinas'
      'where ((empresa=?empresa)and(maquina=?maquina))'
      '')
    UniDirectional = False
    Left = 248
    Top = 24
    object xMaquinasMAQUINA: TFIBStringField
      DisplayLabel = 'Maquina'
      FieldName = 'MAQUINA'
      Size = 4
    end
    object xMaquinasDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
    object xMaquinasACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
  end
  object xClientes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select *'
      'from VER_clientes'
      
        'where ((empresa=?empresa)and(ejercicio=?ejercicio)and(canal=?can' +
        'al)and(cliente=?cliente))'
      '')
    UniDirectional = False
    Left = 248
    Top = 168
    object xClientesTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xClientesNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nomb. Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object xClientesTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
  end
  object xMaestros: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM Z_SYS_TABLAS_AUXILIARES'
      'where tipo_aux = ?tipo_aux and codigo=?codigo')
    UniDirectional = False
    Left = 248
    Top = 216
    object xMaestrosDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 40
    end
  end
  object xArticulo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select * from art_articulos where empresa =?empresa and articulo' +
        '=?articulo')
    UniDirectional = False
    DataSource = DSQMFichaTecArt
    Left = 248
    Top = 72
    object xArticuloEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xArticuloARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xArticuloTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object xProvPapel: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select *'
      'from VER_proveedores'
      
        'where ((empresa=?empresa)and(ejercicio=?ejercicio)and(canal=?can' +
        'al)and(proveedor=?proveedor))'
      '')
    UniDirectional = False
    Left = 248
    Top = 120
    object xProvPapelEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xProvPapelEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xProvPapelCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xProvPapelPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xProvPapelTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xProvPapelTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object QMConstantes: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM Z_ETI_CONSTANTES'
      'WHERE'
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO Z_ETI_CONSTANTES'
      
        '  (LONGITUD_BOBINA,ML_CAMBIO_BOBINA,ID,EMPRESA,HORAS_CAMBIO_BOBI' +
        'NA,TAREA_PREPARACION,TAREA_IMPRESION,TAREA_POLIMEROS,TAREA_BOBIN' +
        'AS,PATH_DOCUMENTOS)'
      'VALUES'
      
        '  (?LONGITUD_BOBINA,?ML_CAMBIO_BOBINA,?ID,?EMPRESA,?HORAS_CAMBIO' +
        '_BOBINA,?TAREA_PREPARACION,?TAREA_IMPRESION,?TAREA_POLIMEROS,?TA' +
        'REA_BOBINAS,?PATH_DOCUMENTOS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM Z_ETI_CONSTANTES'
      'WHERE'
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      
        'SELECT PATH_DOCUMENTOS FROM Z_ETI_CONSTANTES WHERE EMPRESA=?EMPR' +
        'ESA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE Z_ETI_CONSTANTES'
      'SET'
      '  LONGITUD_BOBINA=?LONGITUD_BOBINA '
      '  ,ML_CAMBIO_BOBINA=?ML_CAMBIO_BOBINA '
      '  ,ID=?ID '
      '  ,HORAS_CAMBIO_BOBINA=?HORAS_CAMBIO_BOBINA'
      '  ,TAREA_PREPARACION=?TAREA_PREPARACON'
      '  ,TAREA_IMPRESION=?TAREA_IMPRESION'
      '  ,TAREA_POLIMEROS=?TAREA_POLIMEROS'
      '  ,TAREA_BOBINAS=?TAREA_BOBINAS'
      '  ,PATH_DOCUMENTOS=?PATH_DOCUMENTOS'
      'WHERE'
      '  EMPRESA=?EMPRESA ')
    DataSource = DSQMFichaTecArt
    ClavesPrimarias.Strings = (
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'Z_ETI_CONSTANTES'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 120
    object QMConstantesPATH_DOCUMENTOS: TFIBStringField
      DisplayLabel = 'Carpeta Docs.'
      FieldName = 'PATH_DOCUMENTOS'
      Size = 200
    end
  end
  object DSConstantes: TDataSource
    DataSet = QMConstantes
    Left = 144
    Top = 120
  end
  object QMProMatEsc: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_MAT_ESC'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ESCANDALLO=?old_ESCANDALLO AND '
      '  LINEA_COMP=?old_LINEA_COMP AND '
      '  TIPO=?old_TIPO ')
    SelectSQL.Strings = (
      'SELECT M.COMPONENTE, AR.TITULO_LARGO DESC_ARTICULO'
      'FROM PRO_MAT_ESC M'
      
        'JOIN ART_ARTICULOS AR ON M.EMPRESA = AR.EMPRESA AND M.COMPONENTE' +
        ' = AR.ARTICULO'
      'WHERE'
      'M.ESCANDALLO = :ESCANDALLO AND'
      'M.EMPRESA = :EMPRESA '
      'GROUP BY M.COMPONENTE, AR.TITULO_LARGO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSQMFichaTecArt
    Plan.Strings = (
      ' ')
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ESCANDALLO '
      'LINEA_COMP '
      'TIPO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_MAT_ESC'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 168
    object QMProMatEscCOMPONENTE: TFIBStringField
      FieldName = 'COMPONENTE'
      Size = 15
    end
    object QMProMatEscDESC_ARTICULO: TFIBStringField
      FieldName = 'DESC_ARTICULO'
      Size = 256
    end
  end
  object DSQMProMatEsc: TDataSource
    DataSet = QMProMatEsc
    Left = 144
    Top = 168
  end
  object QMProTareaEsc: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_TAREA_ESC'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ESCANDALLO=?old_ESCANDALLO AND '
      '  LINEA_FASE=?old_LINEA_FASE AND '
      '  LINEA_TAREA=?old_LINEA_TAREA AND '
      '  TIPO=?old_TIPO ')
    SelectSQL.Strings = (
      'SELECT TIPOTAREA, TAREA FROM PRO_TAREA_ESC T'
      'WHERE '
      'T.ESCANDALLO = :ESCANDALLO AND'
      'T.EMPRESA = :EMPRESA'
      'GROUP BY  TIPOTAREA, TAREA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSQMFichaTecArt
    Plan.Strings = (
      ' ')
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ESCANDALLO '
      'LINEA_FASE '
      'LINEA_TAREA '
      'TIPO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_TAREA_ESC'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 216
    object QMProTareaEscTIPOTAREA: TFIBStringField
      DisplayLabel = 'Tarea'
      FieldName = 'TIPOTAREA'
      Size = 3
    end
    object QMProTareaEscTAREA: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'TAREA'
      Size = 60
    end
  end
  object DSQMProTareaEsc: TDataSource
    DataSet = QMProTareaEsc
    Left = 144
    Top = 216
  end
  object QMFichaTecColores: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ETI_FICHA_TECNICA_COLOR'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ARTICULO=?old_ARTICULO AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO VER_ETI_FICHA_TECNICA_COLOR'
      
        '  (EMPRESA,ARTICULO,LINEA,COLOR,TITULO_COLOR,ID_ANILOX,TITULO_AN' +
        'ILOX,MAQUINA,OBSERVACIONES,COLOR_DECIMAL)'
      'VALUES'
      
        '  (?EMPRESA,?ARTICULO,?LINEA,?COLOR,?TITULO_COLOR,?ID_ANILOX,?TI' +
        'TULO_ANILOX,?MAQUINA,?OBSERVACIONES,?COLOR_DECIMAL)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ETI_FICHA_TECNICA_COLOR'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_ETI_FICHA_TECNICA_COLOR'
      'WHERE'
      'EMPRESA=?EMPRESA AND'
      'ARTICULO=?ARTICULO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ETI_FICHA_TECNICA_COLOR'
      'SET'
      '  COLOR=?COLOR '
      '  ,TITULO_COLOR=?TITULO_COLOR '
      '  ,ID_ANILOX=?ID_ANILOX '
      '  ,TITULO_ANILOX=?TITULO_ANILOX '
      '  ,MAQUINA=?MAQUINA '
      '  ,OBSERVACIONES=?OBSERVACIONES '
      '  ,COLOR_DECIMAL=?COLOR_DECIMAL '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO AND '
      '  LINEA=?LINEA ')
    DataSource = DSQMFichaTecArt
    Plan.Strings = (
      ' ')
    BeforePost = QMFichaTecColoresBeforePost
    OnNewRecord = QMFichaTecColoresNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ARTICULO '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ETI_FICHA_TECNICA_COLOR'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 264
    object QMFichaTecColoresEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object QMFichaTecColoresARTICULO: TFIBStringField
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMFichaTecColoresLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMFichaTecColoresCOLOR: TFIBStringField
      DisplayLabel = 'Color'
      FieldName = 'COLOR'
      Size = 5
    end
    object QMFichaTecColoresTITULO_COLOR: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'TITULO_COLOR'
      Size = 25
    end
    object QMFichaTecColoresCOLOR_DECIMAL: TFloatField
      DisplayLabel = 'Muestra'
      FieldName = 'COLOR_DECIMAL'
    end
    object QMFichaTecColoresANILOX: TIntegerField
      DisplayLabel = 'Anilox'
      FieldName = 'ID_ANILOX'
    end
    object QMFichaTecColoresTITULO_ANILOX: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_ANILOX'
      Size = 60
    end
    object QMFichaTecColoresMAQUINA: TIntegerField
      DisplayLabel = 'M'#225'quina'
      FieldName = 'MAQUINA'
    end
    object QMFichaTecColoresOBSERVACIONES: TMemoField
      FieldName = 'OBSERVACIONES'
      BlobType = ftMemo
      Size = 8
    end
  end
  object DSQMFichaTecColores: TDataSource
    DataSet = QMFichaTecColores
    Left = 144
    Top = 264
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 528
    Top = 24
  end
end
