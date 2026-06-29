object DMOfertaProd: TDMOfertaProd
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 301
  Top = 116
  Height = 366
  Width = 328
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 240
    Top = 8
  end
  object QMOfertaProd: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM EMP_OFERTA'
      'WHERE'
      '  RIG_OF=?old_RIG_OF AND '
      '  EMPRESA=?old_EMPRESA ')
    InsertSQL.Strings = (
      'INSERT INTO EMP_OFERTA'
      
        '  (EMPRESA,RIG_OF,FECHA,CLIENTE,COMPUESTO,PESO_PIEZA,PESO_COLADA' +
        ','
      'COMPONENTE1,PRECIO_COMPONENTE1,UNI_COMPONENTE1,'
      'COMPONENTE2,PRECIO_COMPONENTE2,UNI_COMPONENTE2,'
      'COMPONENTE3,PRECIO_COMPONENTE3,UNI_COMPONENTE3,'
      'COMPONENTE4,PRECIO_COMPONENTE4,UNI_COMPONENTE4,'
      'TIPO_CAJA,UNI_CAJA,TIPO_MAQUINA,TIEMPO_CICLO,UNI_CAVIDADES,'
      'TIEMPO_MANIPUACION,HORAS_PREP_MOLDE,PUESTA_MARCHA,'
      'MARGEN_MAQ,MARGEN_MAT_PRIMA,MARGEN_OPE,MARGEN_VAR,MARGEN_TRAB,'
      'PEDIDO1,PEDIDO2,PEDIDO3,PEDIDO4,PEDIDO5,PEDIDO6,'
      'ID_ESCANDALLO,MOLDE,PRECIO_CAJA,TITULO_ART, '
      'USAR_EQUIVAL1, ID_EQUIVAL1, USAR_EQUIVAL2, ID_EQUIVAL2, '
      'USAR_EQUIVAL3, ID_EQUIVAL3, USAR_EQUIVAL4, ID_EQUIVAL4)'
      'VALUES'
      
        '  (?EMPRESA,?RIG_OF,?FECHA,?CLIENTE,?COMPUESTO,?PESO_PIEZA,?PESO' +
        '_COLADA,'
      '?COMPONENTE1,?PRECIO_COMPONENTE1,?UNI_COMPONENTE1,'
      '?COMPONENTE2,?PRECIO_COMPONENTE2,?UNI_COMPONENTE2,'
      '?COMPONENTE3,?PRECIO_COMPONENTE3,?UNI_COMPONENTE3,'
      '?COMPONENTE4,?PRECIO_COMPONENTE4,?UNI_COMPONENTE4,'
      '?TIPO_CAJA,?UNI_CAJA,?TIPO_MAQUINA,?TIEMPO_CICLO,?UNI_CAVIDADES,'
      '?TIEMPO_MANIPUACION,?HORAS_PREP_MOLDE,?PUESTA_MARCHA,'
      
        '?MARGEN_MAQ,?MARGEN_MAT_PRIMA,?MARGEN_OPE,?MARGEN_VAR,?MARGEN_TR' +
        'AB,'
      '?PEDIDO1,?PEDIDO2,?PEDIDO3,?PEDIDO4,?PEDIDO5,?PEDIDO6,'
      '?ID_ESCANDALLO,?MOLDE,?PRECIO_CAJA,?TITULO_ART,'
      '?USAR_EQUIVAL1, ?ID_EQUIVAL1, ?USAR_EQUIVAL2, ?ID_EQUIVAL2, '
      '?USAR_EQUIVAL3, ?ID_EQUIVAL3, ?USAR_EQUIVAL4, ?ID_EQUIVAL4)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM EMP_OFERTA'
      'WHERE'
      '  RIG_OF=?RIG_OF AND '
      '  EMPRESA=?EMPRESA ')
    SelectSQL.Strings = (
      'SELECT * FROM EMP_OFERTA'
      'where empresa=?empresa'
      'order by rig_of')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE EMP_OFERTA'
      'SET'
      '  FECHA=?FECHA '
      '  ,CLIENTE=?CLIENTE '
      '  ,COMPUESTO=?COMPUESTO '
      '  ,PESO_PIEZA=?PESO_PIEZA '
      '  ,PESO_COLADA=?PESO_COLADA '
      '  ,COMPONENTE1=?COMPONENTE1 '
      '  ,PRECIO_COMPONENTE1=?PRECIO_COMPONENTE1 '
      '  ,UNI_COMPONENTE1=?UNI_COMPONENTE1 '
      '  ,COMPONENTE2=?COMPONENTE2 '
      '  ,PRECIO_COMPONENTE2=?PRECIO_COMPONENTE2 '
      '  ,UNI_COMPONENTE2=?UNI_COMPONENTE2 '
      '  ,COMPONENTE3=?COMPONENTE3 '
      '  ,PRECIO_COMPONENTE3=?PRECIO_COMPONENTE3 '
      '  ,UNI_COMPONENTE3=?UNI_COMPONENTE3 '
      '  ,COMPONENTE4=?COMPONENTE4 '
      '  ,PRECIO_COMPONENTE4=?PRECIO_COMPONENTE4 '
      '  ,UNI_COMPONENTE4=?UNI_COMPONENTE4 '
      '  ,TIPO_CAJA=?TIPO_CAJA '
      '  ,UNI_CAJA=?UNI_CAJA '
      '  ,TIPO_MAQUINA=?TIPO_MAQUINA '
      '  ,TIEMPO_CICLO=?TIEMPO_CICLO '
      '  ,UNI_CAVIDADES=?UNI_CAVIDADES '
      '  ,TIEMPO_MANIPUACION=?TIEMPO_MANIPUACION '
      '  ,HORAS_PREP_MOLDE=?HORAS_PREP_MOLDE '
      '  ,PUESTA_MARCHA=?PUESTA_MARCHA '
      '  ,MARGEN_MAQ=?MARGEN_MAQ '
      '  ,MARGEN_MAT_PRIMA=?MARGEN_MAT_PRIMA'
      '  ,MARGEN_OPE=?MARGEN_OPE'
      '  ,MARGEN_VAR=?MARGEN_VAR'
      '  ,MARGEN_TRAB=?MARGEN_TRAB'
      '  ,PEDIDO1=?PEDIDO1 '
      '  ,PEDIDO2=?PEDIDO2 '
      '  ,PEDIDO3=?PEDIDO3 '
      '  ,PEDIDO4=?PEDIDO4 '
      '  ,PEDIDO5=?PEDIDO5 '
      '  ,PEDIDO6=?PEDIDO6 '
      '  ,ID_ESCANDALLO=?ID_ESCANDALLO '
      '  ,MOLDE=?MOLDE'
      '  ,PRECIO_CAJA=?PRECIO_CAJA'
      '  ,TITULO_ART=?TITULO_ART'
      '  ,USAR_EQUIVAL1=?USAR_EQUIVAL1'
      '  ,ID_EQUIVAL1=?ID_EQUIVAL1'
      '  ,USAR_EQUIVAL2=?USAR_EQUIVAL2'
      '  ,ID_EQUIVAL2=?ID_EQUIVAL2'
      '  ,USAR_EQUIVAL3=?USAR_EQUIVAL3'
      '  ,ID_EQUIVAL3=?ID_EQUIVAL3'
      '  ,USAR_EQUIVAL4=?USAR_EQUIVAL4'
      '  ,ID_EQUIVAL4=?ID_EQUIVAL4'
      'WHERE'
      '  RIG_OF=?RIG_OF AND '
      '  EMPRESA=?EMPRESA ')
    AfterDelete = Graba
    AfterOpen = QMOfertaProdAfterOpen
    AfterPost = Graba
    AfterScroll = QMOfertaProdAfterScroll
    BeforePost = QMOfertaProdBeforePost
    OnNewRecord = QMOfertaProdNewRecord
    ClavesPrimarias.Strings = (
      'RIG_OF '
      'EMPRESA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'EMP_OFERTA'
    UpdateTransaction = TLocal
    Left = 32
    Top = 8
    object QMOfertaProdEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMOfertaProdRIG_OF: TIntegerField
      DisplayLabel = 'Oferta'
      FieldName = 'RIG_OF'
    end
    object QMOfertaProdFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMOfertaProdCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMOfertaProdCOMPUESTO: TFIBStringField
      DisplayLabel = 'Compuesto'
      FieldName = 'COMPUESTO'
      OnChange = QMOfertaProdCOMPUESTOChange
      Size = 15
    end
    object QMOfertaProdPESO_PIEZA: TFloatField
      DisplayLabel = 'Peso Pieza'
      FieldName = 'PESO_PIEZA'
    end
    object QMOfertaProdPESO_COLADA: TFloatField
      DisplayLabel = 'Peso Colada'
      FieldName = 'PESO_COLADA'
    end
    object QMOfertaProdCOMPONENTE1: TFIBStringField
      DisplayLabel = 'Materia Prima'
      FieldName = 'COMPONENTE1'
      OnChange = QMOfertaProdCOMPONENTE1Change
      Size = 15
    end
    object QMOfertaProdPRECIO_COMPONENTE1: TFloatField
      DisplayLabel = 'Precio MP'
      FieldName = 'PRECIO_COMPONENTE1'
    end
    object QMOfertaProdUNI_COMPONENTE1: TFloatField
      DisplayLabel = '% MP'
      FieldName = 'UNI_COMPONENTE1'
    end
    object QMOfertaProdCOMPONENTE2: TFIBStringField
      DisplayLabel = 'Colorante'
      FieldName = 'COMPONENTE2'
      OnChange = QMOfertaProdCOMPONENTE2Change
      Size = 15
    end
    object QMOfertaProdPRECIO_COMPONENTE2: TFloatField
      DisplayLabel = 'Precio Colorante'
      FieldName = 'PRECIO_COMPONENTE2'
    end
    object QMOfertaProdUNI_COMPONENTE2: TFloatField
      DisplayLabel = '% Colorante'
      FieldName = 'UNI_COMPONENTE2'
      OnChange = QMOfertaProdUNI_COMPONENTE2Change
    end
    object QMOfertaProdCOMPONENTE3: TFIBStringField
      DisplayLabel = 'MP 3'
      FieldName = 'COMPONENTE3'
      OnChange = QMOfertaProdCOMPONENTE3Change
      Size = 15
    end
    object QMOfertaProdPRECIO_COMPONENTE3: TFloatField
      DisplayLabel = 'Precio MP 3'
      FieldName = 'PRECIO_COMPONENTE3'
    end
    object QMOfertaProdUNI_COMPONENTE3: TFloatField
      DisplayLabel = '% MP 3'
      FieldName = 'UNI_COMPONENTE3'
      OnChange = QMOfertaProdUNI_COMPONENTE3Change
    end
    object QMOfertaProdCOMPONENTE4: TFIBStringField
      DisplayLabel = 'MP 4'
      FieldName = 'COMPONENTE4'
      OnChange = QMOfertaProdCOMPONENTE4Change
      Size = 15
    end
    object QMOfertaProdPRECIO_COMPONENTE4: TFloatField
      DisplayLabel = 'Precio MP 4'
      FieldName = 'PRECIO_COMPONENTE4'
    end
    object QMOfertaProdUNI_COMPONENTE4: TFloatField
      DisplayLabel = '% MP 4'
      FieldName = 'UNI_COMPONENTE4'
      OnChange = QMOfertaProdUNI_COMPONENTE4Change
    end
    object QMOfertaProdTIPO_CAJA: TFIBStringField
      DisplayLabel = 'Tipo Caja'
      FieldName = 'TIPO_CAJA'
      Size = 15
    end
    object QMOfertaProdPRECIO_CAJA: TFloatField
      DisplayLabel = 'Precio Caja'
      FieldName = 'PRECIO_CAJA'
    end
    object QMOfertaProdUNI_CAJA: TFloatField
      DisplayLabel = 'Uds. Caja'
      FieldName = 'UNI_CAJA'
    end
    object QMOfertaProdTIPO_MAQUINA: TIntegerField
      DisplayLabel = 'Tipo Maquina'
      FieldName = 'TIPO_MAQUINA'
    end
    object QMOfertaProdTIEMPO_CICLO: TFloatField
      DisplayLabel = 'Tiempo Ciclo'
      FieldName = 'TIEMPO_CICLO'
    end
    object QMOfertaProdMOLDE: TFIBStringField
      DisplayLabel = 'Molde'
      FieldName = 'MOLDE'
      OnChange = QMOfertaProdMOLDEChange
      Size = 10
    end
    object QMOfertaProdUNI_CAVIDADES: TFloatField
      DisplayLabel = 'Uds. Cavidades'
      FieldName = 'UNI_CAVIDADES'
    end
    object QMOfertaProdTIEMPO_MANIPUACION: TFloatField
      DisplayLabel = 'Tiempo Manipulacion'
      FieldName = 'TIEMPO_MANIPUACION'
    end
    object QMOfertaProdHORAS_PREP_MOLDE: TFloatField
      DisplayLabel = 'Horas Prep. Molde'
      FieldName = 'HORAS_PREP_MOLDE'
    end
    object QMOfertaProdPUESTA_MARCHA: TFloatField
      DisplayLabel = 'Puesta Marcha'
      FieldName = 'PUESTA_MARCHA'
    end
    object QMOfertaProdMARGEN_MAQ: TFloatField
      DisplayLabel = 'Margen Maq.'
      FieldName = 'MARGEN_MAQ'
    end
    object QMOfertaProdMARGEN_MAT_PRIMA: TFloatField
      DisplayLabel = 'Margen MP'
      FieldName = 'MARGEN_MAT_PRIMA'
    end
    object QMOfertaProdPEDIDO1: TIntegerField
      DisplayLabel = 'Pedido 1'
      FieldName = 'PEDIDO1'
    end
    object QMOfertaProdPEDIDO2: TIntegerField
      DisplayLabel = 'Pedido 2'
      FieldName = 'PEDIDO2'
    end
    object QMOfertaProdPEDIDO3: TIntegerField
      DisplayLabel = 'Pedido 3'
      FieldName = 'PEDIDO3'
    end
    object QMOfertaProdPEDIDO4: TIntegerField
      DisplayLabel = 'Pedido 4'
      FieldName = 'PEDIDO4'
    end
    object QMOfertaProdPEDIDO5: TIntegerField
      DisplayLabel = 'Pedido 5'
      FieldName = 'PEDIDO5'
    end
    object QMOfertaProdPEDIDO6: TIntegerField
      DisplayLabel = 'Pedido 6'
      FieldName = 'PEDIDO6'
    end
    object QMOfertaProdID_ESCANDALLO: TIntegerField
      DisplayLabel = 'Id. Escandallo'
      FieldName = 'ID_ESCANDALLO'
    end
    object QMOfertaProdID_DETALLES_OFERTAS_V: TIntegerField
      FieldName = 'ID_DETALLES_OFERTAS_V'
    end
    object QMOfertaProdTITULO_ART: TFIBStringField
      FieldName = 'TITULO_ART'
      Size = 256
    end
    object QMOfertaProdUSAR_EQUIVAL1: TIntegerField
      FieldName = 'USAR_EQUIVAL1'
      OnChange = QMOfertaProdUSAR_EQUIVAL1Change
    end
    object QMOfertaProdID_EQUIVAL1: TIntegerField
      FieldName = 'ID_EQUIVAL1'
    end
    object QMOfertaProdUSAR_EQUIVAL2: TIntegerField
      FieldName = 'USAR_EQUIVAL2'
      OnChange = QMOfertaProdUSAR_EQUIVAL2Change
    end
    object QMOfertaProdID_EQUIVAL2: TIntegerField
      FieldName = 'ID_EQUIVAL2'
    end
    object QMOfertaProdUSAR_EQUIVAL3: TIntegerField
      FieldName = 'USAR_EQUIVAL3'
      OnChange = QMOfertaProdUSAR_EQUIVAL3Change
    end
    object QMOfertaProdID_EQUIVAL3: TIntegerField
      FieldName = 'ID_EQUIVAL3'
    end
    object QMOfertaProdUSAR_EQUIVAL4: TIntegerField
      FieldName = 'USAR_EQUIVAL4'
      OnChange = QMOfertaProdUSAR_EQUIVAL4Change
    end
    object QMOfertaProdID_EQUIVAL4: TIntegerField
      FieldName = 'ID_EQUIVAL4'
    end
    object QMOfertaProdMARGEN_OPE: TFloatField
      FieldName = 'MARGEN_OPE'
    end
    object QMOfertaProdMARGEN_VAR: TFloatField
      FieldName = 'MARGEN_VAR'
    end
    object QMOfertaProdMARGEN_TRAB: TFloatField
      FieldName = 'MARGEN_TRAB'
    end
  end
  object DSQMOfertaProd: TDataSource
    DataSet = QMOfertaProd
    Left = 120
    Top = 8
  end
  object QPreuArticle: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select p_coste from art_articulos'
      'where empresa=?empresa and articulo=?articulo')
    UniDirectional = False
    Left = 32
    Top = 56
    object QPreuArticleP_COSTE: TFloatField
      FieldName = 'P_COSTE'
    end
  end
  object DSQArticle: TDataSource
    DataSet = QPreuArticle
    Left = 120
    Top = 56
  end
  object QNumCavitats: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select num_cavidades from emp_moldes'
      'where empresa=?empresa and num_molde=?num_molde')
    UniDirectional = False
    Left = 32
    Top = 104
    object QNumCavitatsNUM_CAVIDADES: TIntegerField
      FieldName = 'NUM_CAVIDADES'
    end
  end
  object DSNumCavitats: TDataSource
    DataSet = QNumCavitats
    Left = 120
    Top = 104
  end
  object xDestino: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select empresa, tipo, escandallo from pro_escandallo'
      'where id_esc=?id_escandallo')
    UniDirectional = False
    DataSource = DSQMOfertaProd
    Left = 32
    Top = 152
    object xDestinoEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object xDestinoTIPO: TFIBStringField
      FieldName = 'TIPO'
      Size = 3
    end
    object xDestinoESCANDALLO: TIntegerField
      FieldName = 'ESCANDALLO'
    end
  end
  object DSxDestino: TDataSource
    DataSet = xDestino
    Left = 120
    Top = 152
  end
  object xArtEquival: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select articulo from pro_sys_cab_equival'
      'where empresa=?empresa and id_equival=?id_equival')
    UniDirectional = False
    Left = 32
    Top = 200
    object xArtEquivalARTICULO: TFIBStringField
      FieldName = 'ARTICULO'
      Size = 15
    end
  end
end
