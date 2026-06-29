object DMMaestrosTallas: TDMMaestrosTallas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 634
  Top = 240
  Height = 479
  Width = 579
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 328
    Top = 8
  end
  object QMart_colores: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ART_COLORES'
      'WHERE'
      '  ID_A_C=?old_ID_A_C ')
    InsertSQL.Strings = (
      'INSERT INTO VER_ART_COLORES'
      '  (ID_A_C,COD_COLOR,TITULO,ID_T_C,TIPO,TITULO_TIPO,IMAGEN)'
      'VALUES'
      
        '  (?ID_A_C,?COD_COLOR,?TITULO,?ID_T_C,?TIPO,?TITULO_TIPO,?IMAGEN' +
        ')')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ART_COLORES'
      'WHERE'
      '  ID_A_C=?ID_A_C')
    SelectSQL.Strings = (
      'SELECT * FROM VER_ART_COLORES'
      'ORDER BY COD_COLOR')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ART_COLORES'
      'SET'
      '  COD_COLOR=?COD_COLOR '
      '  ,TITULO=?TITULO '
      '  ,ID_T_C=?ID_T_C '
      '  ,TIPO=?TIPO '
      '  ,TITULO_TIPO=?TITULO_TIPO '
      ' ,IMAGEN=?IMAGEN'
      'WHERE'
      '  ID_A_C=?ID_A_C ')
    AfterOpen = QMart_coloresAfterOpen
    BeforeClose = QMart_coloresBeforeClose
    BeforePost = QMart_coloresBeforePost
    ClavesPrimarias.Strings = (
      'ID_A_C'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ART_COLORES'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 64
    Top = 8
    object QMart_coloresID_A_C: TIntegerField
      DisplayLabel = 'ID Art. Color'
      FieldName = 'ID_A_C'
    end
    object QMart_coloresCOD_COLOR: TFIBStringField
      DisplayLabel = 'Cod. Color'
      FieldName = 'COD_COLOR'
      Size = 5
    end
    object QMart_coloresTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      DisplayWidth = 25
      FieldName = 'TITULO'
      Size = 25
    end
    object QMart_coloresID_T_C: TIntegerField
      DisplayLabel = 'ID Tipo Color'
      FieldName = 'ID_T_C'
    end
    object QMart_coloresTIPO: TFIBStringField
      DisplayLabel = 'Tipo Color'
      FieldName = 'TIPO'
      Size = 5
    end
    object QMart_coloresTITULO_TIPO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO_TIPO'
      Size = 25
    end
    object QMart_coloresIMAGEN: TIntegerField
      DisplayLabel = 'Imagen'
      FieldName = 'IMAGEN'
    end
  end
  object QMart_grupos_tallas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_GRUPOS_TALLAS'
      'WHERE'
      '  ID_G_T=?old_ID_G_T ')
    InsertSQL.Strings = (
      'INSERT INTO ART_GRUPOS_TALLAS'
      '  (ID_G_T,TITULO,GRUPO,PREFIJO,SUFIJO)'
      'VALUES'
      '  (?ID_G_T,?TITULO,?GRUPO,?PREFIJO,?SUFIJO)')
    RefreshSQL.Strings = (
      'SELECT  * FROM ART_GRUPOS_TALLAS'
      'WHERE  ID_G_T=?ID_G_T ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_GRUPOS_TALLAS'
      'ORDER BY GRUPO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_GRUPOS_TALLAS'
      'SET'
      '  TITULO=?TITULO '
      '  ,GRUPO=?GRUPO '
      '  ,PREFIJO=?PREFIJO'
      '  ,SUFIJO=?SUFIJO'
      'WHERE'
      '  ID_G_T=?ID_G_T ')
    AfterOpen = QMart_grupos_tallasAfterOpen
    AfterPost = QMart_grupos_tallasAfterPost
    BeforePost = QMart_grupos_tallasBeforePost
    OnNewRecord = QMart_grupos_tallasNewRecord
    ClavesPrimarias.Strings = (
      'ID_G_T ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_GRUPOS_TALLAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 64
    Top = 56
    object QMart_grupos_tallasID_G_T: TIntegerField
      DisplayLabel = 'ID Grupo Tallas'
      FieldName = 'ID_G_T'
    end
    object QMart_grupos_tallasGRUPO: TFIBStringField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
      Size = 3
    end
    object QMart_grupos_tallasTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMart_grupos_tallasPREFIJO: TFIBStringField
      DisplayLabel = 'Prefijo'
      FieldName = 'PREFIJO'
      Size = 10
    end
    object QMart_grupos_tallasSUFIJO: TFIBStringField
      DisplayLabel = 'Sufijo'
      FieldName = 'SUFIJO'
      Size = 10
    end
  end
  object QMart_tallas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_TALLAS'
      'WHERE'
      '  ID_A_T=?old_ID_A_T ')
    InsertSQL.Strings = (
      'INSERT INTO ART_TALLAS'
      '  (COD_TALLA,ID_G_T,ID_A_T,TALLA,TITULO)'
      'VALUES'
      '  (?COD_TALLA,?ID_G_T,?ID_A_T,?TALLA,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_TALLAS'
      'WHERE'
      '  ID_A_T=?ID_A_T ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_TALLAS'
      'WHERE ID_G_T=:ID_G_T')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_TALLAS'
      'SET'
      '  COD_TALLA=?COD_TALLA '
      '  ,ID_G_T=?ID_G_T '
      '  ,TALLA=?TALLA '
      '  ,TITULO=?TITULO'
      'WHERE'
      '  ID_A_T=?ID_A_T ')
    DataSource = DSart_grupos_tallas
    AfterPost = QMart_grupos_tallasAfterPost
    BeforePost = QMart_tallasBeforePost
    OnNewRecord = QMart_tallasNewRecord
    ClavesPrimarias.Strings = (
      'ID_A_T ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_TALLAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 64
    Top = 152
    object QMart_tallasID_A_T: TIntegerField
      DisplayLabel = 'ID Art. Talla'
      FieldName = 'ID_A_T'
    end
    object QMart_tallasID_G_T: TIntegerField
      DisplayLabel = 'ID Grupo Tallas'
      FieldName = 'ID_G_T'
    end
    object QMart_tallasCOD_TALLA: TFIBStringField
      DisplayLabel = 'Cod. Talla'
      FieldName = 'COD_TALLA'
      Size = 2
    end
    object QMart_tallasTALLA: TFIBStringField
      DisplayLabel = 'Talla'
      FieldName = 'TALLA'
      OnChange = QMart_tallasTALLAChange
      Size = 5
    end
    object QMart_tallasTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 15
    end
  end
  object DSart_grupos_tallas: TDataSource
    DataSet = QMart_grupos_tallas
    Left = 200
    Top = 56
  end
  object QMart_articulos_modelos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_ARTICULOS_MODELOS'
      'WHERE'
      '  ID_A_M=?old_ID_A_M ')
    InsertSQL.Strings = (
      'INSERT INTO ART_ARTICULOS_MODELOS'
      
        '  (NOTAS,IMAGEN_WEB,FECHA_BAJA,AGNO,P_COMPRA,P_VENTA,MAXIMO_DES,' +
        'DBLNULO,VCHARNULL,P_MERCADO,ID_A_M,ID_G_T,IMAGEN,CLIENTE,ID_MARC' +
        'A,ID_GALERIA,DESCUENTO_COMPRA,PROVEEDOR,EMPRESA,TITULO,CONTROL_S' +
        'TOCK,IVA_INC,BORRAR,WEB,ALFA_1,ALFA_2,ALFA_3,ALFA_4,ALFA_5,ALFA_' +
        '6,ALFA_7,ALFA_8,BAJA,TEMPORADA,SECCION,PVPORTALLA,TIPO_IVA,PACK,' +
        'COD_ESTRUCTURA,REF_CLIENTE,TARIFA_DEFECTO,SUBFAMILIA,COD_MOD,FAM' +
        'ILIA,REF_PROVEEDOR,BASE_CREACION,CODIGO_GENERO,CODIGO_TEMPORADA,' +
        'FAMILIA_TEJIDO,ARTICULO_ESTRUCTURA,ARTICULO_CONFECCION,CREA_FALD' +
        'ON,CREA_CONFECCION)'
      'VALUES'
      
        '  (?NOTAS,?IMAGEN_WEB,?FECHA_BAJA,?AGNO,?P_COMPRA,?P_VENTA,?MAXI' +
        'MO_DES,?DBLNULO,?VCHARNULL,?P_MERCADO,?ID_A_M,?ID_G_T,?IMAGEN,?C' +
        'LIENTE,?ID_MARCA,?ID_GALERIA,?DESCUENTO_COMPRA,?PROVEEDOR,?EMPRE' +
        'SA,?TITULO,?CONTROL_STOCK,?IVA_INC,?BORRAR,?WEB,?ALFA_1,?ALFA_2,' +
        '?ALFA_3,?ALFA_4,?ALFA_5,?ALFA_6,?ALFA_7,?ALFA_8,?BAJA,?TEMPORADA' +
        ',?SECCION,?PVPORTALLA,?TIPO_IVA,?PACK,?COD_ESTRUCTURA,?REF_CLIEN' +
        'TE,?TARIFA_DEFECTO,?SUBFAMILIA,?COD_MOD,?FAMILIA,?REF_PROVEEDOR,' +
        '?BASE_CREACION,?CODIGO_GENERO,?CODIGO_TEMPORADA,?FAMILIA_TEJIDO,' +
        '?ARTICULO_ESTRUCTURA,?ARTICULO_CONFECCION,?CREA_FALDON,?CREA_CON' +
        'FECCION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS_MODELOS'
      'WHERE'
      '  ID_A_M=?ID_A_M ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_ARTICULOS_MODELOS'
      'WHERE EMPRESA = ?EMPRESA'
      'ORDER BY REF_PROVEEDOR')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_ARTICULOS_MODELOS'
      'SET'
      '  NOTAS=?NOTAS '
      '  ,IMAGEN_WEB=?IMAGEN_WEB '
      '  ,FECHA_BAJA=?FECHA_BAJA '
      '  ,AGNO=?AGNO '
      '  ,P_COMPRA=?P_COMPRA '
      '  ,P_VENTA=?P_VENTA '
      '  ,MAXIMO_DES=?MAXIMO_DES '
      '  ,DBLNULO=?DBLNULO '
      '  ,VCHARNULL=?VCHARNULL '
      '  ,P_MERCADO=?P_MERCADO '
      '  ,ID_G_T=?ID_G_T '
      '  ,IMAGEN=?IMAGEN '
      '  ,CLIENTE=?CLIENTE '
      '  ,ID_MARCA=?ID_MARCA '
      '  ,ID_GALERIA=?ID_GALERIA '
      '  ,DESCUENTO_COMPRA=?DESCUENTO_COMPRA '
      '  ,PROVEEDOR=?PROVEEDOR '
      '  ,EMPRESA=?EMPRESA '
      '  ,TITULO=?TITULO '
      '  ,CONTROL_STOCK=?CONTROL_STOCK '
      '  ,IVA_INC=?IVA_INC '
      '  ,BORRAR=?BORRAR '
      '  ,WEB=?WEB '
      '  ,ALFA_1=?ALFA_1 '
      '  ,ALFA_2=?ALFA_2 '
      '  ,ALFA_3=?ALFA_3 '
      '  ,ALFA_4=?ALFA_4 '
      '  ,ALFA_5=?ALFA_5 '
      '  ,ALFA_6=?ALFA_6 '
      '  ,ALFA_7=?ALFA_7 '
      '  ,ALFA_8=?ALFA_8 '
      '  ,BAJA=?BAJA '
      '  ,TEMPORADA=?TEMPORADA '
      '  ,SECCION=?SECCION '
      '  ,PVPORTALLA=?PVPORTALLA '
      '  ,TIPO_IVA=?TIPO_IVA '
      '  ,PACK=?PACK '
      '  ,COD_ESTRUCTURA=?COD_ESTRUCTURA '
      '  ,REF_CLIENTE=?REF_CLIENTE '
      '  ,TARIFA_DEFECTO=?TARIFA_DEFECTO '
      '  ,SUBFAMILIA=?SUBFAMILIA '
      '  ,COD_MOD=?COD_MOD '
      '  ,FAMILIA=?FAMILIA '
      '  ,REF_PROVEEDOR=?REF_PROVEEDOR '
      '  ,BASE_CREACION=?BASE_CREACION '
      '  ,CODIGO_GENERO=?CODIGO_GENERO '
      '  ,CODIGO_TEMPORADA=?CODIGO_TEMPORADA '
      '  ,FAMILIA_TEJIDO=?FAMILIA_TEJIDO '
      '  ,ARTICULO_ESTRUCTURA=?ARTICULO_ESTRUCTURA '
      '  ,ARTICULO_CONFECCION=?ARTICULO_CONFECCION '
      '  ,CREA_FALDON=?CREA_FALDON '
      '  ,CREA_CONFECCION=?CREA_CONFECCION '
      'WHERE'
      '  ID_A_M=?ID_A_M ')
    AfterOpen = QMart_articulos_modelosAfterOpen
    AfterPost = QMart_articulos_modelosAfterPost
    BeforeClose = QMart_articulos_modelosBeforeClose
    BeforeOpen = QMart_articulos_modelosBeforeOpen
    BeforePost = QMart_articulos_modelosBeforePost
    OnCalcFields = QMart_articulos_modelosCalcFields
    OnNewRecord = QMart_articulos_modelosNewRecord
    ClavesPrimarias.Strings = (
      'ID_A_M ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_ARTICULOS_MODELOS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 64
    Top = 104
    object QMart_articulos_modelosID_A_M: TIntegerField
      DisplayLabel = 'ID Mod.'
      FieldName = 'ID_A_M'
    end
    object QMart_articulos_modelosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMart_articulos_modelosCOD_MOD: TFIBStringField
      DisplayLabel = 'Cod. Modelo'
      FieldName = 'COD_MOD'
      Size = 7
    end
    object QMart_articulos_modelosPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMart_articulos_modelosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMart_articulos_modelosID_G_T: TIntegerField
      DisplayLabel = 'ID Grupo Tallas'
      FieldName = 'ID_G_T'
    end
    object QMart_articulos_modelosFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMart_articulos_modelosAGNO: TFIBStringField
      DisplayLabel = 'Ano'
      FieldName = 'AGNO'
      Size = 2
    end
    object QMart_articulos_modelosTEMPORADA: TIntegerField
      DisplayLabel = 'Temporada'
      FieldName = 'TEMPORADA'
    end
    object QMart_articulos_modelosSECCION: TIntegerField
      DisplayLabel = 'Seccion'
      FieldName = 'SECCION'
    end
    object QMart_articulos_modelosPVPORTALLA: TIntegerField
      DisplayLabel = 'P.V.P. x Talla'
      FieldName = 'PVPORTALLA'
    end
    object QMart_articulos_modelosCONTROL_STOCK: TIntegerField
      DisplayLabel = 'Ctrol. Stock'
      FieldName = 'CONTROL_STOCK'
    end
    object QMart_articulos_modelosP_COMPRA: TFloatField
      DisplayLabel = 'P. Compra'
      FieldName = 'P_COMPRA'
      OnChange = QMart_articulos_modelosP_COMPRAChange
    end
    object QMart_articulos_modelosP_MERCADO: TFloatField
      DisplayLabel = 'P. Mercado'
      FieldName = 'P_MERCADO'
    end
    object QMart_articulos_modelosP_VENTA: TFloatField
      DisplayLabel = 'P. Venta'
      FieldName = 'P_VENTA'
    end
    object QMart_articulos_modelosIVA_INC: TIntegerField
      DisplayLabel = 'IVA Inc.'
      FieldName = 'IVA_INC'
    end
    object QMart_articulos_modelosTIPO_IVA: TIntegerField
      DisplayLabel = 'Tipo IVA'
      FieldName = 'TIPO_IVA'
    end
    object QMart_articulos_modelosMAXIMO_DES: TFloatField
      DisplayLabel = 'Max.'
      FieldName = 'MAXIMO_DES'
    end
    object QMart_articulos_modelosREF_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Ref. Proveedor'
      FieldName = 'REF_PROVEEDOR'
      Size = 25
    end
    object QMart_articulos_modelosDBLNULO: TFloatField
      DisplayLabel = 'DB Nulo'
      FieldName = 'DBLNULO'
    end
    object QMart_articulos_modelosVCHARNULL: TFIBStringField
      DisplayLabel = 'VChar Null'
      FieldName = 'VCHARNULL'
      Size = 10
    end
    object QMart_articulos_modelosBASE_CREACION: TFIBStringField
      DisplayLabel = 'Base Creac.'
      FieldName = 'BASE_CREACION'
      Size = 15
    end
    object QMart_articulos_modelosCOD_ESTRUCTURA: TFIBStringField
      DisplayLabel = 'Cod. Estructura'
      FieldName = 'COD_ESTRUCTURA'
      Size = 15
    end
    object QMart_articulos_modelosBORRAR: TIntegerField
      DisplayLabel = 'Eliminar Dinam.'
      FieldName = 'BORRAR'
    end
    object QMart_articulos_modelosNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMart_articulos_modelosIMAGEN: TIntegerField
      DisplayLabel = 'Imagen'
      FieldName = 'IMAGEN'
    end
    object QMart_articulos_modelosWEB: TIntegerField
      DisplayLabel = 'Web'
      FieldName = 'WEB'
    end
    object QMart_articulos_modelosIMAGEN_WEB: TBlobField
      DisplayLabel = 'Img. Web'
      FieldName = 'IMAGEN_WEB'
      Size = 8
    end
    object QMart_articulos_modelosCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMart_articulos_modelosREF_CLIENTE: TFIBStringField
      DisplayLabel = 'Ref. Cliente'
      FieldName = 'REF_CLIENTE'
      Size = 15
    end
    object QMart_articulos_modelosTARIFA_DEFECTO: TFIBStringField
      DisplayLabel = 'Tar. Defecto'
      FieldName = 'TARIFA_DEFECTO'
      Size = 3
    end
    object QMart_articulos_modelosID_MARCA: TIntegerField
      DisplayLabel = 'Id. Marca'
      FieldName = 'ID_MARCA'
    end
    object QMart_articulos_modelosID_GALERIA: TIntegerField
      DisplayLabel = 'Id Galeria'
      FieldName = 'ID_GALERIA'
    end
    object QMart_articulos_modelosSUBFAMILIA: TFIBStringField
      DisplayLabel = 'Sub Familia'
      FieldName = 'SUBFAMILIA'
      Size = 5
    end
    object QMart_articulos_modelosDESCUENTO_COMPRA: TFloatField
      DisplayLabel = 'Dto. Compra'
      FieldName = 'DESCUENTO_COMPRA'
      OnChange = QMart_articulos_modelosDESCUENTO_COMPRAChange
    end
    object QMart_articulos_modelosP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object QMart_articulos_modelosALFA_1: TFIBStringField
      DisplayLabel = 'Alfa 1'
      FieldName = 'ALFA_1'
      Size = 40
    end
    object QMart_articulos_modelosALFA_2: TFIBStringField
      DisplayLabel = 'Alfa 2'
      FieldName = 'ALFA_2'
      Size = 40
    end
    object QMart_articulos_modelosALFA_3: TFIBStringField
      DisplayLabel = 'Alfa 3'
      FieldName = 'ALFA_3'
      Size = 40
    end
    object QMart_articulos_modelosALFA_4: TFIBStringField
      DisplayLabel = 'Alfa 4'
      FieldName = 'ALFA_4'
      Size = 40
    end
    object QMart_articulos_modelosALFA_5: TFIBStringField
      DisplayLabel = 'Alfa 5'
      FieldName = 'ALFA_5'
      Size = 40
    end
    object QMart_articulos_modelosALFA_6: TFIBStringField
      DisplayLabel = 'Alfa 6'
      FieldName = 'ALFA_6'
      Size = 40
    end
    object QMart_articulos_modelosALFA_7: TFIBStringField
      DisplayLabel = 'Alfa 7'
      FieldName = 'ALFA_7'
      Size = 40
    end
    object QMart_articulos_modelosALFA_8: TFIBStringField
      DisplayLabel = 'Alfa 8'
      FieldName = 'ALFA_8'
      Size = 40
    end
    object QMart_articulos_modelosBAJA: TIntegerField
      DisplayLabel = 'Baja'
      FieldName = 'BAJA'
    end
    object QMart_articulos_modelosFECHA_BAJA: TDateTimeField
      DisplayLabel = 'Fecha Baja'
      FieldName = 'FECHA_BAJA'
    end
    object QMart_articulos_modelosCODIGO_GENERO: TFIBStringField
      DisplayLabel = 'C'#243'digo G'#233'nero'
      FieldName = 'CODIGO_GENERO'
      Size = 3
    end
    object QMart_articulos_modelosCODIGO_TEMPORADA: TFIBStringField
      DisplayLabel = 'C'#243'digo Temporada'
      FieldName = 'CODIGO_TEMPORADA'
      Size = 3
    end
    object QMart_articulos_modelosPACK: TFIBStringField
      DisplayLabel = 'Pack'
      FieldName = 'PACK'
      Size = 256
    end
    object QMart_articulos_modelosCANTIDAD_COMBINACIONES: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'CANTIDAD_COMBINACIONES'
      Calculated = True
    end
    object QMart_articulos_modelosFAMILIA_TEJIDO: TFIBStringField
      DisplayLabel = 'Fam. Tejido'
      FieldName = 'FAMILIA_TEJIDO'
      Size = 5
    end
    object QMart_articulos_modelosARTICULO_ESTRUCTURA: TFIBStringField
      DisplayLabel = 'Art. Estructura'
      FieldName = 'ARTICULO_ESTRUCTURA'
      Size = 15
    end
    object QMart_articulos_modelosARTICULO_CONFECCION: TFIBStringField
      DisplayLabel = 'Art. Confeccion'
      FieldName = 'ARTICULO_CONFECCION'
      Size = 15
    end
    object QMart_articulos_modelosCREA_FALDON: TIntegerField
      DisplayLabel = 'Crea Faldon'
      FieldName = 'CREA_FALDON'
    end
    object QMart_articulos_modelosCREA_CONFECCION: TIntegerField
      DisplayLabel = 'Crea Confeccion'
      FieldName = 'CREA_CONFECCION'
    end
  end
  object DSart_articulos_modelos: TDataSource
    DataSet = QMart_articulos_modelos
    Left = 200
    Top = 104
  end
  object QMver_art_mod_color_edit: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ART_MOD_COLOR_EDIT'
      'WHERE'
      '  ID_A_M_C=?old_ID_A_M_C ')
    InsertSQL.Strings = (
      'INSERT INTO VER_ART_MOD_COLOR_EDIT'
      
        '  (ID_A_M_C,ID_A_M,ID_A_C,HORMA,S_COLOR,TITULO,COD_COLOR,N_COLOR' +
        ',CODIGO_PROVEEDOR,IMAGEN,ALFA_1,ALFA_2,ALFA_3,ALFA_4,ALFA_5,ALFA' +
        '_6,ALFA_7,ALFA_8)'
      'VALUES'
      
        '  (?ID_A_M_C,?ID_A_M,?ID_A_C,?HORMA,?S_COLOR,?TITULO,?COD_COLOR,' +
        '?N_COLOR,?CODIGO_PROVEEDOR,?IMAGEN,?ALFA_1,?ALFA_2,?ALFA_3,?ALFA' +
        '_4,?ALFA_5,?ALFA_6,?ALFA_7,?ALFA_8)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ART_MOD_COLOR_EDIT'
      'WHERE'
      '  ID_A_M_C=?ID_A_M_C ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ART_MOD_COLOR_EDIT'
      'WHERE'
      '  ID_A_M=?ID_A_M')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ART_MOD_COLOR_EDIT'
      'SET'
      '  ID_A_M=?ID_A_M '
      '  ,ID_A_C=?ID_A_C '
      '  ,HORMA=?HORMA '
      '  ,S_COLOR=?S_COLOR '
      '  ,TITULO=?TITULO '
      '  ,COD_COLOR=?COD_COLOR '
      '  ,N_COLOR=?N_COLOR '
      '  ,CODIGO_PROVEEDOR=?CODIGO_PROVEEDOR'
      '  ,IMAGEN=?IMAGEN'
      '  ,ALFA_1=?ALFA_1'
      '  ,ALFA_2=?ALFA_2'
      '  ,ALFA_3=?ALFA_3'
      '  ,ALFA_4=?ALFA_4'
      '  ,ALFA_5=?ALFA_5'
      '  ,ALFA_6=?ALFA_6'
      '  ,ALFA_7=?ALFA_7'
      '  ,ALFA_8=?ALFA_8'
      'WHERE'
      '  ID_A_M_C=?ID_A_M_C ')
    DataSource = DSart_articulos_modelos
    BeforeOpen = QMver_art_mod_color_editBeforeOpen
    BeforePost = QMart_articulos_mod_colorBeforePost
    OnNewRecord = QMart_articulos_mod_colorNewRecord
    ClavesPrimarias.Strings = (
      'ID_A_M_C ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ART_MOD_COLOR_EDIT'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 64
    Top = 200
    object QMver_art_mod_color_editID_A_M_C: TIntegerField
      DisplayLabel = 'ID Mod.'
      FieldName = 'ID_A_M_C'
    end
    object QMver_art_mod_color_editID_A_M: TIntegerField
      DisplayLabel = 'ID Mod.'
      FieldName = 'ID_A_M'
    end
    object QMver_art_mod_color_editID_A_C: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A_C'
    end
    object QMver_art_mod_color_editHORMA: TIntegerField
      DisplayLabel = 'Horma'
      FieldName = 'HORMA'
    end
    object QMver_art_mod_color_editS_COLOR: TFIBStringField
      DisplayLabel = 'Cod color'
      FieldName = 'S_COLOR'
      Size = 10
    end
    object QMver_art_mod_color_editTITULO: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMver_art_mod_color_editCOD_COLOR: TFIBStringField
      DisplayLabel = 'Cod. Color'
      FieldName = 'COD_COLOR'
      Size = 11
    end
    object QMver_art_mod_color_editN_COLOR: TFIBStringField
      DisplayLabel = 'Color'
      FieldName = 'N_COLOR'
      OnChange = QMver_art_mod_color_editN_COLORChange
      Size = 5
    end
    object QMver_art_mod_color_editCODIGO_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Cod. Prov.'
      FieldName = 'CODIGO_PROVEEDOR'
      Size = 40
    end
    object QMver_art_mod_color_editIMAGEN: TIntegerField
      DisplayLabel = 'Imagen'
      FieldName = 'IMAGEN'
    end
    object QMver_art_mod_color_editALFA_1: TFIBStringField
      DisplayLabel = 'Alfa 1'
      FieldName = 'ALFA_1'
      Size = 40
    end
    object QMver_art_mod_color_editALFA_2: TFIBStringField
      DisplayLabel = 'Alfa 2'
      FieldName = 'ALFA_2'
      Size = 40
    end
    object QMver_art_mod_color_editALFA_3: TFIBStringField
      DisplayLabel = 'Alfa 3'
      FieldName = 'ALFA_3'
      Size = 40
    end
    object QMver_art_mod_color_editALFA_4: TFIBStringField
      DisplayLabel = 'Alfa 4'
      FieldName = 'ALFA_4'
      Size = 40
    end
    object QMver_art_mod_color_editALFA_5: TFIBStringField
      DisplayLabel = 'Alfa 5'
      FieldName = 'ALFA_5'
      Size = 40
    end
    object QMver_art_mod_color_editALFA_6: TFIBStringField
      DisplayLabel = 'Alfa 6'
      FieldName = 'ALFA_6'
      Size = 40
    end
    object QMver_art_mod_color_editALFA_7: TFIBStringField
      DisplayLabel = 'Alfa 7'
      FieldName = 'ALFA_7'
      Size = 40
    end
    object QMver_art_mod_color_editALFA_8: TFIBStringField
      DisplayLabel = 'Alfa 8'
      FieldName = 'ALFA_8'
      Size = 40
    end
  end
  object QMxver_precio_am: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      
        'SELECT * FROM XVER_PRECIO_AMC(:EMPRESA, :ID_A_M_C, :MODO, :TARIF' +
        'A)')
    SelectSQL.Strings = (
      'SELECT * FROM XVER_PRECIO_AM(:EMPRESA, :ID_A_M, :MODO, :TARIFA)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_PRECIO_AM'
      'SET'
      'MODO = :MODO,'
      'TARIFA = :TARIFA,'
      'P01 = :P01,'
      'P02 = :P02,'
      'P03 = :P03,'
      'P04 = :P04,'
      'P05 = :P05,'
      'P06 = :P06,'
      'P07 = :P07,'
      'P08 = :P08,'
      'P09 = :P09,'
      'P10 = :P10,'
      'P11 = :P11,'
      'P12 = :P12,'
      'P13 = :P13,'
      'P14 = :P14,'
      'P15 = :P15,'
      'P16 = :P16,'
      'P17 = :P17,'
      'P18 = :P18,'
      'P19 = :P19,'
      'P20 = :P20,'
      'P21 = :P21,'
      'P22 = :P22'
      'WHERE'
      'ID_A_M_C = :ID_A_M_C')
    DataSource = DSart_articulos_modelos
    ClavesPrimarias.Strings = (
      'EMPRESA,'
      'ID_A_M_C '
      'MODO '
      'TARIFA)'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 64
    Top = 248
    object QMxver_precio_amEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMxver_precio_amMODO: TIntegerField
      DisplayLabel = 'Modo'
      FieldName = 'MODO'
    end
    object QMxver_precio_amTARIFA: TFIBStringField
      DisplayLabel = 'Tarifa'
      FieldName = 'TARIFA'
      Size = 3
    end
    object QMxver_precio_amID_A_M: TIntegerField
      DisplayLabel = 'ID Mod.'
      FieldName = 'ID_A_M'
    end
    object QMxver_precio_amID_A_M_C: TIntegerField
      DisplayLabel = 'ID Mod.'
      FieldName = 'ID_A_M_C'
    end
    object QMxver_precio_amPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMxver_precio_amFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object QMxver_precio_amAGNO: TFIBStringField
      DisplayLabel = 'Ano'
      FieldName = 'AGNO'
      Size = 2
    end
    object QMxver_precio_amTEMPORADA: TIntegerField
      DisplayLabel = 'Temporada'
      FieldName = 'TEMPORADA'
    end
    object QMxver_precio_amSECCION: TIntegerField
      DisplayLabel = 'Seccion'
      FieldName = 'SECCION'
    end
    object QMxver_precio_amP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object QMxver_precio_amP_VENTA: TFloatField
      DisplayLabel = 'P. Venta'
      FieldName = 'P_VENTA'
    end
    object QMxver_precio_amHORMA: TIntegerField
      DisplayLabel = 'Horma'
      FieldName = 'HORMA'
    end
    object QMxver_precio_amS_COLOR: TFIBStringField
      DisplayLabel = 'Color'
      FieldName = 'S_COLOR'
      Size = 10
    end
    object QMxver_precio_amID_A_C: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A_C'
    end
    object QMxver_precio_amP01: TFloatField
      FieldName = 'P01'
      OnChange = QMxver_precio_amPXXChange
    end
    object QMxver_precio_amP02: TFloatField
      FieldName = 'P02'
      OnChange = QMxver_precio_amPXXChange
    end
    object QMxver_precio_amP03: TFloatField
      FieldName = 'P03'
      OnChange = QMxver_precio_amPXXChange
    end
    object QMxver_precio_amP04: TFloatField
      FieldName = 'P04'
      OnChange = QMxver_precio_amPXXChange
    end
    object QMxver_precio_amP05: TFloatField
      FieldName = 'P05'
      OnChange = QMxver_precio_amPXXChange
    end
    object QMxver_precio_amP06: TFloatField
      FieldName = 'P06'
      OnChange = QMxver_precio_amPXXChange
    end
    object QMxver_precio_amP07: TFloatField
      FieldName = 'P07'
      OnChange = QMxver_precio_amPXXChange
    end
    object QMxver_precio_amP08: TFloatField
      FieldName = 'P08'
      OnChange = QMxver_precio_amPXXChange
    end
    object QMxver_precio_amP09: TFloatField
      FieldName = 'P09'
      OnChange = QMxver_precio_amPXXChange
    end
    object QMxver_precio_amP10: TFloatField
      FieldName = 'P10'
      OnChange = QMxver_precio_amPXXChange
    end
    object QMxver_precio_amP11: TFloatField
      FieldName = 'P11'
      OnChange = QMxver_precio_amPXXChange
    end
    object QMxver_precio_amP12: TFloatField
      FieldName = 'P12'
      OnChange = QMxver_precio_amPXXChange
    end
    object QMxver_precio_amP13: TFloatField
      FieldName = 'P13'
      OnChange = QMxver_precio_amPXXChange
    end
    object QMxver_precio_amP14: TFloatField
      FieldName = 'P14'
      OnChange = QMxver_precio_amPXXChange
    end
    object QMxver_precio_amP15: TFloatField
      FieldName = 'P15'
      OnChange = QMxver_precio_amPXXChange
    end
    object QMxver_precio_amP16: TFloatField
      FieldName = 'P16'
      OnChange = QMxver_precio_amPXXChange
    end
    object QMxver_precio_amP17: TFloatField
      FieldName = 'P17'
      OnChange = QMxver_precio_amPXXChange
    end
    object QMxver_precio_amP18: TFloatField
      FieldName = 'P18'
      OnChange = QMxver_precio_amPXXChange
    end
    object QMxver_precio_amP19: TFloatField
      FieldName = 'P19'
      OnChange = QMxver_precio_amPXXChange
    end
    object QMxver_precio_amP20: TFloatField
      FieldName = 'P20'
      OnChange = QMxver_precio_amPXXChange
    end
    object QMxver_precio_amP21: TFloatField
      FieldName = 'P21'
      OnChange = QMxver_precio_amPXXChange
    end
    object QMxver_precio_amP22: TFloatField
      FieldName = 'P22'
      OnChange = QMxver_precio_amPXXChange
    end
  end
  object QMArt_mod_estructura: TFIBDataSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT * FROM ART_MOD_ESTRUCTURA_CAB'
      'where empresa=:empresa'
      'order by cod_modelo')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    DataSource = DSart_articulos_modelos
    Left = 64
    Top = 296
    object QMArt_mod_estructuraEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMArt_mod_estructuraCOD_MODELO: TFIBStringField
      DisplayLabel = 'Cod. Modelo'
      FieldName = 'COD_MODELO'
      Size = 15
    end
    object QMArt_mod_estructuraTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 25
    end
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 464
    Top = 8
  end
  object DSart_colores: TDataSource
    DataSet = QMart_colores
    Left = 200
    Top = 8
  end
  object DSart_tallas: TDataSource
    DataSet = QMart_tallas
    Left = 200
    Top = 152
  end
  object DSart_articulos_mod_color: TDataSource
    DataSet = QMver_art_mod_color_edit
    Left = 200
    Top = 200
  end
  object DSQMxver_precio_am: TDataSource
    DataSet = QMxver_precio_am
    Left = 200
    Top = 248
  end
  object DSModelo_estructura: TDataSource
    DataSet = QMArt_mod_estructura
    Left = 200
    Top = 296
  end
  object QMart_tipo_color: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_TIPO_COLOR'
      'WHERE'
      '  ID_T_C=?old_ID_T_C ')
    InsertSQL.Strings = (
      'INSERT INTO ART_TIPO_COLOR'
      '  (ID_T_C,TIPO,TITULO)'
      'VALUES'
      '  (?ID_T_C,?TIPO,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_TIPO_COLOR'
      'WHERE'
      '  ID_T_C=?ID_T_C ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_TIPO_COLOR')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_TIPO_COLOR'
      'SET'
      '  TIPO=?TIPO '
      '  ,TITULO=?TITULO '
      'WHERE'
      '  ID_T_C=?ID_T_C ')
    BeforePost = QMart_tipo_colorBeforePost
    ClavesPrimarias.Strings = (
      'ID_T_C ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_TIPO_COLOR'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 64
    Top = 344
    object QMart_tipo_colorID_T_C: TIntegerField
      DisplayLabel = 'ID Tipo Color'
      FieldName = 'ID_T_C'
    end
    object QMart_tipo_colorTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 5
    end
    object QMart_tipo_colorTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 25
    end
  end
  object DSart_tipo_color: TDataSource
    DataSet = QMart_tipo_color
    Left = 200
    Top = 344
  end
  object xMarcas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      'SELECT TITULO FROM ART_ARTICULOS_MOD_MARCAS'
      'WHERE ID_MARCA = ?ID_MARCA')
    SelectSQL.Strings = (
      'SELECT TITULO FROM ART_ARTICULOS_MOD_MARCAS'
      'WHERE ID_MARCA = ?ID_MARCA')
    UniDirectional = False
    DataSource = DSart_articulos_modelos
    Left = 64
    Top = 392
    object xMarcasTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxMarcas: TDataSource
    DataSet = xMarcas
    Left = 200
    Top = 392
  end
  object QMArtKit: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_KIT'
      'WHERE'
      '  KIT=?old_KIT AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO ART_KIT'
      '  (ID_A_K,EMPRESA,KIT,ID_G_T,TITULO)'
      'VALUES'
      '  (?ID_A_K,?EMPRESA,?KIT,?ID_G_T,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_KIT'
      'WHERE'
      '  KIT=?KIT AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_KIT'
      'WHERE'
      'EMPRESA = ?EMPRESA '
      'ORDER BY KIT')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_KIT'
      'SET'
      '  ID_A_K=?ID_A_K '
      '  ,ID_G_T=?ID_G_T '
      '  ,TITULO=?TITULO '
      'WHERE'
      '  KIT=?KIT AND '
      '  EMPRESA=?EMPRESA ')
    AfterOpen = QMArtKitAfterOpen
    AfterPost = QMArtKitAfterPost
    BeforeClose = QMArtKitBeforeClose
    BeforePost = QMArtKitBeforePost
    OnNewRecord = QMArtKitNewRecord
    ClavesPrimarias.Strings = (
      'KIT '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_KIT'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 328
    Top = 152
    object QMArtKitID_A_K: TIntegerField
      DisplayLabel = 'Id Art. Kit'
      FieldName = 'ID_A_K'
    end
    object QMArtKitEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMArtKitKIT: TFIBStringField
      DisplayLabel = 'Kit'
      FieldName = 'KIT'
      Size = 3
    end
    object QMArtKitID_G_T: TIntegerField
      DisplayLabel = 'Id Grupo Talla'
      FieldName = 'ID_G_T'
    end
    object QMArtKitTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSQMKitTallas: TDataSource
    DataSet = QMArtKit
    Left = 464
    Top = 152
  end
  object QMArtKitTallas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ART_KIT_TALLAS'
      'WHERE'
      '  ID_A_K=?old_ID_A_K AND '
      '  ID_A_T=?old_ID_A_T ')
    InsertSQL.Strings = (
      'INSERT INTO VER_ART_KIT_TALLAS'
      '  (ID_A_K,ID_A_T,UNIDADES,ID_G_T,COD_TALLA,TALLA,TITULO)'
      'VALUES'
      '  (?ID_A_K,?ID_A_T,?UNIDADES,?ID_G_T,?COD_TALLA,?TALLA,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ART_KIT_TALLAS'
      'WHERE'
      '  ID_A_K=?ID_A_K AND '
      '  ID_A_T=?ID_A_T ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_ART_KIT_TALLAS'
      'WHERE'
      '  ID_A_K=?ID_A_K '
      'ORDER BY COD_TALLA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ART_KIT_TALLAS'
      'SET'
      '  UNIDADES=?UNIDADES '
      '  ,ID_G_T=?ID_G_T '
      '  ,COD_TALLA=?COD_TALLA '
      '  ,TALLA=?TALLA '
      '  ,TITULO=?TITULO '
      'WHERE'
      '  ID_A_K=?ID_A_K AND '
      '  ID_A_T=?ID_A_T ')
    DataSource = DSQMKitTallas
    ClavesPrimarias.Strings = (
      'ID_A_K '
      'ID_A_T ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ART_KIT_TALLAS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 328
    Top = 200
    object QMArtKitTallasID_A_K: TIntegerField
      DisplayLabel = 'Id Art. Kit'
      FieldName = 'ID_A_K'
    end
    object QMArtKitTallasID_A_T: TIntegerField
      DisplayLabel = 'Id Art. Talla'
      FieldName = 'ID_A_T'
    end
    object QMArtKitTallasUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object QMArtKitTallasID_G_T: TIntegerField
      DisplayLabel = 'Id Grupo Talla'
      FieldName = 'ID_G_T'
    end
    object QMArtKitTallasCOD_TALLA: TFIBStringField
      DisplayLabel = 'Cod. Talla'
      FieldName = 'COD_TALLA'
      Size = 2
    end
    object QMArtKitTallasTALLA: TFIBStringField
      DisplayLabel = 'Talla'
      FieldName = 'TALLA'
      Size = 5
    end
    object QMArtKitTallasTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 15
    end
  end
  object DSQMArtKitTallas: TDataSource
    DataSet = QMArtKitTallas
    Left = 464
    Top = 200
  end
  object QMArtColorEmpresa: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ART_COLORES_EMPRESA'
      'WHERE'
      '  PROVEEDOR=?old_PROVEEDOR AND '
      '  ID_A_C=?old_ID_A_C AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO ART_COLORES_EMPRESA'
      '  (EMPRESA,ID_A_C,PROVEEDOR,CODIGO_PROVEEDOR)'
      'VALUES'
      '  (?EMPRESA,?ID_A_C,?PROVEEDOR,?CODIGO_PROVEEDOR)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_COLORES_EMPRESA'
      'WHERE'
      '  PROVEEDOR=?PROVEEDOR AND '
      '  ID_A_C=?ID_A_C AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM ART_COLORES_EMPRESA'
      'WHERE'
      '  ID_A_C=?ID_A_C AND '
      '  EMPRESA=?EMPRESA '
      'ORDER BY PROVEEDOR')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ART_COLORES_EMPRESA'
      'SET'
      '  CODIGO_PROVEEDOR=?CODIGO_PROVEEDOR '
      'WHERE'
      '  PROVEEDOR=?PROVEEDOR AND '
      '  ID_A_C=?ID_A_C AND '
      '  EMPRESA=?EMPRESA ')
    DataSource = DSart_colores
    BeforeOpen = QMArtColorEmpresaBeforeOpen
    OnCalcFields = QMArtColorEmpresaCalcFields
    OnNewRecord = QMArtColorEmpresaNewRecord
    ClavesPrimarias.Strings = (
      'PROVEEDOR '
      'ID_A_C '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ART_COLORES_EMPRESA'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 328
    Top = 104
    object QMArtColorEmpresaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMArtColorEmpresaID_A_C: TIntegerField
      DisplayLabel = 'ID Art. Color'
      FieldName = 'ID_A_C'
    end
    object QMArtColorEmpresaPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMArtColorEmpresaCODIGO_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Cod. Proveedor'
      FieldName = 'CODIGO_PROVEEDOR'
      Size = 40
    end
    object QMArtColorEmpresaTITULO: TStringField
      DisplayLabel = 'Titulo'
      DisplayWidth = 60
      FieldKind = fkCalculated
      FieldName = 'TITULO'
      Size = 40
      Calculated = True
    end
  end
  object DSArtColorEmpresa: TDataSource
    DataSet = QMArtColorEmpresa
    Left = 464
    Top = 104
  end
end
