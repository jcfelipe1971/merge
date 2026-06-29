object ProDMEscandallo: TProDMEscandallo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 342
  Top = 185
  Height = 599
  Width = 669
  object QMProEscandallo: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_VER_ESCANDALLO'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ESCANDALLO=?old_ESCANDALLO AND '
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_VER_ESCANDALLO'
      
        '  (EMPRESA,'#13#10'ESCANDALLO,COMPUESTO,UNIDAD,UNIDADES,MEDIDA_1,MEDID' +
        'A_2,MEDIDA_3,MEDIDA_4,COSTE_FIJO,COSTE_MATER,'#13#10'COSTE_MOBRA,COSTE' +
        '_MAQUI,COSTE_TEXTE,COSTE_VAR,COSTE_TOTAL,FECHA_CREAC,ESTADO,NOTA' +
        'S,DIBUJO,ACTUALIZA_REC,'#13#10'ACTUALIZA_MAT,DEFECTO,ALMACEN_ENT,ALMAC' +
        'EN_LAN,ENTRADA,AUTO_CALC,TIPO_PRECIO,AUTO_ENTRADA,GENERA_OF,TIPO' +
        '_CONTROL,'#13#10'ISO_APROBADO,ISO_VERIFICADO,ISO_VALIDADO,ALMACEN_SAL,' +
        'TIPO,SUBTIPO,ID_DETALLES_OFERTAS_V,ID_ESC,DESCRIPCION,MARGEN_MAQ' +
        'UI,'#13#10'MARGEN_MATER,MARGEN_OPE,MARGEN_VAR,MARGEN_TRAB,CLIENTE,USA_' +
        'P_OPTIMO,TOTAL_COMPONENTES,TOTAL_COMPONENTES_UNIDADES,TITULO,TIT' +
        'ULO_ALMACEN_E,'#13#10'TITULO_ALMACEN_L,TITULO_ALMACEN_S,RESPONSABLE,PL' +
        'AZO_FABRICACION,COSTE_HMAQUINA,COSTE_HOPERARIO,COSTE_HEXTERNOS,C' +
        'OSTE_HVARIOS,MERMA,LOTE_OPTIMO,'#13#10'UNIDADES_POR_CAJA,CAJAS_POR_BUL' +
        'TO,TOTAL_PESO,VERSION_ESCANDALLO,TIEMPO_ESTIMADO_FABRICACION)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?ESCANDALLO,?COMPUESTO,?UNIDAD,?UNIDADES,?MEDIDA_1' +
        ',?MEDIDA_2,?MEDIDA_3,?MEDIDA_4,?COSTE_FIJO,?COSTE_MATER,'#13#10'?COSTE' +
        '_MOBRA,?COSTE_MAQUI,?COSTE_TEXTE,?COSTE_VAR,?COSTE_TOTAL,?FECHA_' +
        'CREAC,?ESTADO,?NOTAS,?DIBUJO,?ACTUALIZA_REC,'#13#10'?ACTUALIZA_MAT,?DE' +
        'FECTO,?ALMACEN_ENT,?ALMACEN_LAN,?ENTRADA,?AUTO_CALC,?TIPO_PRECIO' +
        ',?AUTO_ENTRADA,?GENERA_OF,?TIPO_CONTROL,'#13#10'?ISO_APROBADO,?ISO_VER' +
        'IFICADO,?ISO_VALIDADO,?ALMACEN_SAL,?TIPO,?SUBTIPO,?ID_DETALLES_O' +
        'FERTAS_V,?ID_ESC,?DESCRIPCION,?MARGEN_MAQUI,'#13#10'?MARGEN_MATER,?MAR' +
        'GEN_OPE,?MARGEN_VAR,?MARGEN_TRAB,?CLIENTE,?USA_P_OPTIMO,?TOTAL_C' +
        'OMPONENTES,?TOTAL_COMPONENTES_UNIDADES,?TITULO,?TITULO_ALMACEN_E' +
        ','#13#10'?TITULO_ALMACEN_L,?TITULO_ALMACEN_S,?RESPONSABLE,?PLAZO_FABRI' +
        'CACION,?COSTE_HMAQUINA,?COSTE_HOPERARIO,?COSTE_HEXTERNOS,?COSTE_' +
        'HVARIOS,?MERMA,?LOTE_OPTIMO,'#13#10'?UNIDADES_POR_CAJA,?CAJAS_POR_BULT' +
        'O,?TOTAL_PESO,?VERSION_ESCANDALLO,?TIEMPO_ESTIMADO_FABRICACION)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_VER_ESCANDALLO'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ESCANDALLO=?ESCANDALLO AND '
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      '/* Se modifica dinamicamente */'
      'SELECT'
      '  *'
      'FROM PRO_VER_ESCANDALLO'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ESCANDALLO > 0 AND'
      '  TIPO=?TIPO'
      'ORDER BY ESCANDALLO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_VER_ESCANDALLO'
      'SET'
      '  COMPUESTO=?COMPUESTO '
      '  ,UNIDAD=?UNIDAD '
      '  ,UNIDADES=?UNIDADES '
      '  ,MEDIDA_1=?MEDIDA_1 '
      '  ,MEDIDA_2=?MEDIDA_2 '
      '  ,MEDIDA_3=?MEDIDA_3 '
      '  ,MEDIDA_4=?MEDIDA_4 '
      '  ,COSTE_FIJO=?COSTE_FIJO '
      '  ,COSTE_MATER=?COSTE_MATER '
      '  ,COSTE_MOBRA=?COSTE_MOBRA '
      '  ,COSTE_MAQUI=?COSTE_MAQUI '
      '  ,COSTE_TEXTE=?COSTE_TEXTE '
      '  ,COSTE_VAR=?COSTE_VAR '
      '  ,COSTE_TOTAL=?COSTE_TOTAL '
      '  ,FECHA_CREAC=?FECHA_CREAC '
      '  ,ESTADO=?ESTADO '
      '  ,NOTAS=?NOTAS '
      '  ,DIBUJO=?DIBUJO '
      '  ,ACTUALIZA_REC=?ACTUALIZA_REC '
      '  ,ACTUALIZA_MAT=?ACTUALIZA_MAT '
      '  ,DEFECTO=?DEFECTO '
      '  ,ALMACEN_ENT=?ALMACEN_ENT '
      '  ,ALMACEN_LAN=?ALMACEN_LAN '
      '  ,ENTRADA=?ENTRADA '
      '  ,AUTO_CALC=?AUTO_CALC '
      '  ,TIPO_PRECIO=?TIPO_PRECIO '
      '  ,AUTO_ENTRADA=?AUTO_ENTRADA '
      '  ,GENERA_OF=?GENERA_OF '
      '  ,TIPO_CONTROL=?TIPO_CONTROL '
      '  ,ISO_APROBADO=?ISO_APROBADO '
      '  ,ISO_VERIFICADO=?ISO_VERIFICADO '
      '  ,ISO_VALIDADO=?ISO_VALIDADO '
      '  ,ALMACEN_SAL=?ALMACEN_SAL '
      '  ,SUBTIPO=?SUBTIPO '
      '  ,ID_DETALLES_OFERTAS_V=?ID_DETALLES_OFERTAS_V '
      '  ,ID_ESC=?ID_ESC '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,MARGEN_MAQUI=?MARGEN_MAQUI '
      '  ,MARGEN_MATER=?MARGEN_MATER '
      '  ,MARGEN_OPE=?MARGEN_OPE '
      '  ,MARGEN_VAR=?MARGEN_VAR '
      '  ,MARGEN_TRAB=?MARGEN_TRAB '
      '  ,CLIENTE=?CLIENTE '
      '  ,USA_P_OPTIMO=?USA_P_OPTIMO '
      '  ,TOTAL_COMPONENTES=?TOTAL_COMPONENTES '
      '  ,TOTAL_COMPONENTES_UNIDADES=?TOTAL_COMPONENTES_UNIDADES '
      '  ,TITULO=?TITULO '
      '  ,TITULO_ALMACEN_E=?TITULO_ALMACEN_E '
      '  ,TITULO_ALMACEN_L=?TITULO_ALMACEN_L '
      '  ,TITULO_ALMACEN_S=?TITULO_ALMACEN_S '
      '  ,RESPONSABLE=?RESPONSABLE '
      '  ,PLAZO_FABRICACION=?PLAZO_FABRICACION '
      '  ,COSTE_HMAQUINA=?COSTE_HMAQUINA '
      '  ,COSTE_HOPERARIO=?COSTE_HOPERARIO '
      '  ,COSTE_HEXTERNOS=?COSTE_HEXTERNOS '
      '  ,COSTE_HVARIOS=?COSTE_HVARIOS '
      '  ,MERMA=?MERMA '
      '  ,LOTE_OPTIMO=?LOTE_OPTIMO '
      '  ,UNIDADES_POR_CAJA=?UNIDADES_POR_CAJA'
      '  ,CAJAS_POR_BULTO=?CAJAS_POR_BULTO'
      '  ,TOTAL_PESO=?TOTAL_PESO '
      '  ,VERSION_ESCANDALLO=?VERSION_ESCANDALLO '
      '  ,TIEMPO_ESTIMADO_FABRICACION=?TIEMPO_ESTIMADO_FABRICACION '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ESCANDALLO=?ESCANDALLO AND '
      '  TIPO=?TIPO '
      ' ')
    AfterDelete = Graba
    AfterPost = QMProEscandalloAfterPost
    AfterScroll = QMProEscandalloAfterScroll
    BeforeClose = QMProEscandalloBeforeClose
    BeforePost = QMProEscandalloBeforePost
    OnCalcFields = QMProEscandalloCalcFields
    OnNewRecord = QMProEscandalloNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ESCANDALLO '
      'TIPO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_VER_ESCANDALLO'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 16
    object QMProEscandalloEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProEscandalloESCANDALLO: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'ESCANDALLO'
    end
    object QMProEscandalloCOMPUESTO: TFIBStringField
      DisplayLabel = 'Compuesto'
      FieldName = 'COMPUESTO'
      OnChange = QMProEscandalloCOMPUESTOChange
      Size = 15
    end
    object QMProEscandalloUNIDAD: TFIBStringField
      DisplayLabel = 'Unidad'
      FieldName = 'UNIDAD'
      Size = 2
    end
    object QMProEscandalloUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
      OnChange = RecalculaPrecios
      OnGetText = QMProEscandalloUNIDADESGetText
    end
    object QMProEscandalloMEDIDA_1: TFloatField
      DisplayLabel = 'Medida 1'
      FieldName = 'MEDIDA_1'
    end
    object QMProEscandalloMEDIDA_2: TFloatField
      DisplayLabel = 'Medida 2'
      FieldName = 'MEDIDA_2'
    end
    object QMProEscandalloMEDIDA_3: TFloatField
      DisplayLabel = 'Medida 3'
      FieldName = 'MEDIDA_3'
    end
    object QMProEscandalloCOSTE_FIJO: TFloatField
      DisplayLabel = 'Coste Fijo'
      FieldName = 'COSTE_FIJO'
      OnChange = QMProEscandalloCOSTE_FIJOChange
    end
    object QMProEscandalloCOSTE_MATER: TFloatField
      DisplayLabel = 'Coste Mat.'
      FieldName = 'COSTE_MATER'
    end
    object QMProEscandalloCOSTE_MOBRA: TFloatField
      DisplayLabel = 'Coste M. Obra'
      FieldName = 'COSTE_MOBRA'
    end
    object QMProEscandalloCOSTE_MAQUI: TFloatField
      DisplayLabel = 'Coste Maq.'
      FieldName = 'COSTE_MAQUI'
    end
    object QMProEscandalloCOSTE_TEXTE: TFloatField
      DisplayLabel = 'Coste Texte'
      FieldName = 'COSTE_TEXTE'
    end
    object QMProEscandalloCOSTE_TOTAL: TFloatField
      DisplayLabel = 'Coste Total'
      FieldName = 'COSTE_TOTAL'
    end
    object QMProEscandalloFECHA_CREAC: TDateTimeField
      DisplayLabel = 'Fecha Crea.'
      FieldName = 'FECHA_CREAC'
    end
    object QMProEscandalloNOTAS: TMemoField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object QMProEscandalloDIBUJO: TMemoField
      DisplayLabel = 'Dibujo'
      FieldName = 'DIBUJO'
      BlobType = ftMemo
      Size = 8
    end
    object QMProEscandalloACTUALIZA_REC: TIntegerField
      DisplayLabel = 'Actualiza Rec.'
      FieldName = 'ACTUALIZA_REC'
    end
    object QMProEscandalloACTUALIZA_MAT: TIntegerField
      DisplayLabel = 'Actualiza Mat.'
      FieldName = 'ACTUALIZA_MAT'
    end
    object QMProEscandalloCOSTE_VAR: TFloatField
      DisplayLabel = 'Coste Varios'
      FieldName = 'COSTE_VAR'
    end
    object QMProEscandalloDEFECTO: TIntegerField
      DisplayLabel = 'Defecto'
      FieldName = 'DEFECTO'
    end
    object QMProEscandalloDESCUNIDAD: TStringField
      DisplayLabel = 'Desc. Unidad'
      FieldKind = fkCalculated
      FieldName = 'DESCUNIDAD'
      Size = 25
      Calculated = True
    end
    object QMProEscandalloALMACEN_ENT: TFIBStringField
      DisplayLabel = 'Alm. Ent.'
      FieldName = 'ALMACEN_ENT'
      Size = 3
    end
    object QMProEscandalloALMACEN_LAN: TFIBStringField
      DisplayLabel = 'Alm. Lan.'
      FieldName = 'ALMACEN_LAN'
      Size = 3
    end
    object QMProEscandalloALMACEN_SAL: TFIBStringField
      DisplayLabel = 'Alm. Sal.'
      FieldName = 'ALMACEN_SAL'
      Size = 3
    end
    object QMProEscandalloENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMProEscandalloAUTO_CALC: TIntegerField
      DisplayLabel = 'Auto Calc.'
      FieldName = 'AUTO_CALC'
    end
    object QMProEscandalloTIPO_PRECIO: TIntegerField
      DisplayLabel = 'Tipo Precio'
      FieldName = 'TIPO_PRECIO'
      LookupKeyFields = 'VALOR'
      LookupResultField = 'VALOR'
      KeyFields = 'TIPO_PRECIO'
    end
    object QMProEscandalloAUTO_ENTRADA: TIntegerField
      DisplayLabel = 'Auto Entrada'
      FieldName = 'AUTO_ENTRADA'
    end
    object QMProEscandalloGENERA_OF: TIntegerField
      DisplayLabel = 'Genera O.F.'
      FieldName = 'GENERA_OF'
    end
    object QMProEscandalloISO_APROBADO: TIntegerField
      DisplayLabel = 'ISO Aprob.'
      FieldName = 'ISO_APROBADO'
    end
    object QMProEscandalloISO_VERIFICADO: TIntegerField
      DisplayLabel = 'ISO Verif.'
      FieldName = 'ISO_VERIFICADO'
    end
    object QMProEscandalloISO_VALIDADO: TIntegerField
      DisplayLabel = 'ISO Validado'
      FieldName = 'ISO_VALIDADO'
    end
    object QMProEscandalloCOSTE_UNITARIO: TFloatField
      DisplayLabel = 'Coste Unit.'
      FieldKind = fkCalculated
      FieldName = 'COSTE_UNITARIO'
      Calculated = True
    end
    object QMProEscandalloTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMProEscandalloID_DETALLES_OFERTAS_V: TIntegerField
      DisplayLabel = 'ID Det. Ofe. V.'
      FieldName = 'ID_DETALLES_OFERTAS_V'
    end
    object QMProEscandalloID_ESC: TIntegerField
      DisplayLabel = 'ID Esc.'
      FieldName = 'ID_ESC'
    end
    object QMProEscandalloTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMProEscandalloTITULO_ALMACEN_E: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_ALMACEN_E'
      Size = 40
    end
    object QMProEscandalloTITULO_ALMACEN_L: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_ALMACEN_L'
      Size = 40
    end
    object QMProEscandalloTITULO_ALMACEN_S: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_ALMACEN_S'
      Size = 40
    end
    object QMProEscandalloMEDIDA_4: TFloatField
      DisplayLabel = 'Medida 4'
      FieldName = 'MEDIDA_4'
    end
    object QMProEscandalloDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
    object QMProEscandalloMARGEN_MAQUI: TFloatField
      DisplayLabel = 'Margen Maq.'
      FieldName = 'MARGEN_MAQUI'
      OnChange = RecalculaPrecios
    end
    object QMProEscandalloMARGEN_MATER: TFloatField
      DisplayLabel = 'Margen Mat.'
      FieldName = 'MARGEN_MATER'
      OnChange = RecalculaPrecios
    end
    object QMProEscandalloMARGEN_OPE: TFloatField
      DisplayLabel = 'Margen Oper.'
      FieldName = 'MARGEN_OPE'
      OnChange = RecalculaPrecios
    end
    object QMProEscandalloMARGEN_VAR: TFloatField
      DisplayLabel = 'Margen Var.'
      FieldName = 'MARGEN_VAR'
      OnChange = RecalculaPrecios
    end
    object QMProEscandalloMARGEN_TRAB: TFloatField
      DisplayLabel = 'Margen Trab.'
      FieldName = 'MARGEN_TRAB'
      OnChange = RecalculaPrecios
    end
    object QMProEscandalloCLIENTE: TIntegerField
      Alignment = taLeftJustify
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
      OnChange = QMProEscandalloCLIENTEChange
    end
    object QMProEscandalloUSA_P_OPTIMO: TIntegerField
      DisplayLabel = 'Usa P. Optimo'
      FieldName = 'USA_P_OPTIMO'
    end
    object QMProEscandalloTIPO_CONTROL: TIntegerField
      DisplayLabel = 'Tipo Control'
      FieldName = 'TIPO_CONTROL'
    end
    object QMProEscandalloDescEstado: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescEstado'
      Size = 60
      Calculated = True
    end
    object QMProEscandalloPOptUni: TStringField
      Alignment = taRightJustify
      FieldKind = fkCalculated
      FieldName = 'POptUni'
      Size = 10
      Calculated = True
    end
    object QMProEscandalloPOptTotal: TStringField
      Alignment = taRightJustify
      FieldKind = fkCalculated
      FieldName = 'POptTotal'
      Calculated = True
    end
    object QMProEscandalloBen_tot_opt: TStringField
      Alignment = taRightJustify
      FieldKind = fkCalculated
      FieldName = 'Ben_tot_opt'
      Size = 10
      Calculated = True
    end
    object QMProEscandalloBen_tot: TStringField
      Alignment = taRightJustify
      FieldKind = fkCalculated
      FieldName = 'Ben_tot'
      Calculated = True
    end
    object QMProEscandalloBen_opt_uni_por: TStringField
      Alignment = taRightJustify
      FieldKind = fkCalculated
      FieldName = 'Ben_opt_uni_por'
      Calculated = True
    end
    object QMProEscandalloBen_opt_uni: TStringField
      Alignment = taRightJustify
      FieldKind = fkCalculated
      FieldName = 'Ben_opt_uni'
      Calculated = True
    end
    object QMProEscandalloBen_uni_por: TStringField
      Alignment = taRightJustify
      FieldKind = fkCalculated
      FieldName = 'Ben_uni_por'
      Calculated = True
    end
    object QMProEscandalloBen_uni: TStringField
      Alignment = taRightJustify
      FieldKind = fkCalculated
      FieldName = 'Ben_uni'
      Calculated = True
    end
    object QMProEscandalloPrecio_total: TStringField
      Alignment = taRightJustify
      FieldKind = fkCalculated
      FieldName = 'Precio_total'
      Calculated = True
    end
    object QMProEscandalloPrecio_uni: TStringField
      Alignment = taRightJustify
      FieldKind = fkCalculated
      FieldName = 'Precio_uni'
      Calculated = True
    end
    object QMProEscandalloESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMProEscandalloRESPONSABLE: TIntegerField
      DisplayLabel = 'Responsable'
      FieldName = 'RESPONSABLE'
    end
    object QMProEscandalloPLAZO_FABRICACION: TIntegerField
      DisplayLabel = 'Plazo Fab.'
      FieldName = 'PLAZO_FABRICACION'
    end
    object QMProEscandalloCOSTE_HMAQUINA: TFloatField
      DisplayLabel = 'Coste H. Maq.'
      FieldName = 'COSTE_HMAQUINA'
    end
    object QMProEscandalloCOSTE_HOPERARIO: TFloatField
      DisplayLabel = 'Coste H. Operario'
      FieldName = 'COSTE_HOPERARIO'
    end
    object QMProEscandalloCOSTE_HEXTERNOS: TFloatField
      DisplayLabel = 'Coste H. Extern.'
      FieldName = 'COSTE_HEXTERNOS'
    end
    object QMProEscandalloCOSTE_HVARIOS: TFloatField
      DisplayLabel = 'Coste H. Varios'
      FieldName = 'COSTE_HVARIOS'
    end
    object QMProEscandalloMERMA: TFloatField
      DisplayLabel = 'Merma'
      FieldName = 'MERMA'
    end
    object QMProEscandalloLOTE_OPTIMO: TFloatField
      DisplayLabel = 'Lote '
      FieldName = 'LOTE_OPTIMO'
    end
    object QMProEscandalloUNIDADES_POR_CAJA: TFloatField
      DisplayLabel = 'Uds. x Caja'
      FieldName = 'UNIDADES_POR_CAJA'
    end
    object QMProEscandalloTOTAL_COMPONENTES: TIntegerField
      DisplayLabel = 'Total Comp.'
      FieldName = 'TOTAL_COMPONENTES'
    end
    object QMProEscandalloTOTAL_COMPONENTES_UNIDADES: TFloatField
      DisplayLabel = 'Total Componentes Unit.'
      FieldName = 'TOTAL_COMPONENTES_UNIDADES'
    end
    object QMProEscandalloTOTAL_PESO: TFloatField
      DisplayLabel = 'Peso Total'
      FieldName = 'TOTAL_PESO'
    end
    object QMProEscandalloVERSION_ESCANDALLO: TFIBStringField
      DisplayLabel = 'Version'
      FieldName = 'VERSION_ESCANDALLO'
      Size = 15
    end
    object QMProEscandalloTIEMPO_ESTIMADO_FABRICACION: TFloatField
      DisplayLabel = 'T. Estimado'
      FieldName = 'TIEMPO_ESTIMADO_FABRICACION'
    end
    object QMProEscandalloSUBTIPO: TFIBStringField
      DisplayLabel = 'Subtipo'
      FieldName = 'SUBTIPO'
      Size = 3
    end
    object QMProEscandalloCAJAS_POR_BULTO: TFloatField
      DisplayLabel = 'Cajas x Bulto'
      FieldName = 'CAJAS_POR_BULTO'
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read'
      'read_committed')
    Left = 408
    Top = 16
  end
  object DSQMProEscandallo: TDataSource
    DataSet = QMProEscandallo
    Left = 144
    Top = 16
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
      '  LINEA_COMP=?old_LINEA_COMP AND '
      '  ESCANDALLO=?old_ESCANDALLO AND '
      '  EMPRESA=?old_EMPRESA AND'
      '  TIPO=?old_TIPO')
    InsertSQL.Strings = (
      'INSERT INTO PRO_MAT_ESC'
      
        '  (EMPRESA,ESCANDALLO,LINEA_COMP,ALMACEN,COMPONENTE,ORDEN,UNIDAD' +
        'ES,PORCENTAJE,LINEA_FASE,PRE_COS_UNI,TOTAL_VAR,PRECIO_FIJO,TOTAL' +
        ',MATESC,ENTRADA,TIPO_PRECIO,ACTUALIZA_MAT,NOTAS,MEDIDAS,TIPO_PIE' +
        'ZA,NUM_PIEZAS,UNIDAD_ART,UNIDAD_FAB,TIPO,ID_ESC,ID_EQUIVAL,DES_T' +
        'IPO_PIEZA,DES_CANTIDAD_TPIEZA,DES_ALTO,DES_ANCHO,DES_GRUESO,DES_' +
        'METROS_DESCONTAR,DES_TIPO_MATERIAL,PORCENT_SN,DENSIDAD,UNIDADES_' +
        'DENSIDAD,FORMULA,LINEA_TAREA,MERMA,MINI_NOTA,ALMACEN_SAL,UNIDADE' +
        'S_FIJAS)'
      'VALUES'
      
        '  (?EMPRESA,?ESCANDALLO,?LINEA_COMP,?ALMACEN,?COMPONENTE,?ORDEN,' +
        '?UNIDADES,?PORCENTAJE,?LINEA_FASE,?PRE_COS_UNI,?TOTAL_VAR,?PRECI' +
        'O_FIJO,?TOTAL,?MATESC,?ENTRADA,?TIPO_PRECIO,?ACTUALIZA_MAT,?NOTA' +
        'S,?MEDIDAS,?TIPO_PIEZA,?NUM_PIEZAS,?UNIDAD_ART,?UNIDAD_FAB,?TIPO' +
        ',?ID_ESC,?ID_EQUIVAL,?DES_TIPO_PIEZA,?DES_CANTIDAD_TPIEZA,?DES_A' +
        'LTO,?DES_ANCHO,?DES_GRUESO,?DES_METROS_DESCONTAR,?DES_TIPO_MATER' +
        'IAL,?PORCENT_SN,?DENSIDAD,?UNIDADES_DENSIDAD,?FORMULA,?LINEA_TAR' +
        'EA,?MERMA,?MINI_NOTA,?ALMACEN_SAL,?UNIDADES_FIJAS)')
    RefreshSQL.Strings = (
      
        'SELECT M.*, AL.TITULO DESC_ALMACEN, AR.TITULO_LARGO DESC_ARTICUL' +
        'O, U.DECIMALES DECIMALES_UNIDAD_FAB, AR.P_COSTE,'
      
        '       UAR.DECIMALES DECIMALES_UNIDAD_ART, TP.DESCRIPCION DESC_T' +
        'IPO_PIEZA, TM.DESCRIPCION DESC_TIPO_MATERIAL,'
      
        '       AR.CONTROL_STOCK, ST_ALM_SAL.STOCK, ST_ALM_LAN.STOCK STOC' +
        'K_ALM_LAN,'
      '       CASE'
      '         WHEN EXISTS(SELECT *'
      '                     FROM EMP_ADJUNTOS_RELACION'
      '                     WHERE'
      '                     TIPO = '#39'ART'#39' AND'
      '                     ID = AR.ID_A) THEN'
      '             1'
      '         ELSE 0'
      '       END TIENE_ADJUNTO,'
      '       CASE'
      '         WHEN EXISTS(SELECT *'
      '                     FROM PRO_ESCANDALLO'
      '                     WHERE'
      '                     EMPRESA = M.EMPRESA AND'
      '                     COMPUESTO = M.COMPONENTE AND'
      '                     TIPO = '#39'EPR'#39') THEN'
      '             1'
      '         ELSE 0'
      '       END TIENE_SUBESCANDALLO'
      'FROM PRO_MAT_ESC M'
      
        'JOIN ART_ALMACENES AL ON M.EMPRESA = AL.EMPRESA AND M.ALMACEN = ' +
        'AL.ALMACEN'
      
        'JOIN ART_ARTICULOS AR ON M.EMPRESA = AR.EMPRESA AND M.COMPONENTE' +
        ' = AR.ARTICULO'
      'JOIN SYS_UNIDADES_ARTICULOS U ON M.UNIDAD_FAB = U.TIPO'
      'JOIN SYS_UNIDADES_ARTICULOS UAR ON AR.UNIDADES = UAR.TIPO'
      'JOIN PRO_DES_TIPO_PIEZA TP ON TP.CODIGO = M.DES_TIPO_PIEZA'
      'JOIN PRO_DES_CAB_MATERIAL TM ON TM.TIPO = M.DES_TIPO_MATERIAL'
      
        'LEFT JOIN A_ART_DAME_STOCK3(M.EMPRESA, 1 /*CANAL*/, M.ALMACEN_SA' +
        'L, M.COMPONENTE, '#39'NOW'#39') ST_ALM_SAL ON 1 = 1'
      
        'LEFT JOIN A_ART_DAME_STOCK3(M.EMPRESA, 1 /*CANAL*/, M.ALMACEN, M' +
        '.COMPONENTE, '#39'NOW'#39') ST_ALM_LAN ON 1 = 1'
      'WHERE'
      'M.ESCANDALLO = :ESCANDALLO AND'
      'M.EMPRESA = :EMPRESA AND'
      'M.LINEA_FASE = :LINEA_FASE AND'
      'M.TIPO = :TIPO AND'
      'M.LINEA_COMP = :LINEA_COMP')
    SelectSQL.Strings = (
      '/* Se modifica dinamicamente */'
      
        'SELECT M.*, AL.TITULO DESC_ALMACEN, AR.TITULO_LARGO DESC_ARTICUL' +
        'O, U.DECIMALES DECIMALES_UNIDAD_FAB, AR.P_COSTE,'
      
        '       UAR.DECIMALES DECIMALES_UNIDAD_ART, TP.DESCRIPCION DESC_T' +
        'IPO_PIEZA, TM.DESCRIPCION DESC_TIPO_MATERIAL,'
      
        '       AR.CONTROL_STOCK, ST_ALM_SAL.STOCK, ST_ALM_LAN.STOCK STOC' +
        'K_ALM_LAN,'
      '       CASE'
      '         WHEN EXISTS(SELECT *'
      '                     FROM EMP_ADJUNTOS_RELACION'
      '                     WHERE'
      '                     TIPO = '#39'ART'#39' AND'
      '                     ID = AR.ID_A) THEN'
      '             1'
      '         ELSE 0'
      '       END TIENE_ADJUNTO,'
      '       CASE'
      '         WHEN EXISTS(SELECT *'
      '                     FROM PRO_ESCANDALLO'
      '                     WHERE'
      '                     EMPRESA = M.EMPRESA AND'
      '                     COMPUESTO = M.COMPONENTE AND'
      '                     TIPO = '#39'EPR'#39') THEN'
      '             1'
      '         ELSE 0'
      '       END TIENE_SUBESCANDALLO'
      'FROM PRO_MAT_ESC M'
      
        'JOIN ART_ALMACENES AL ON M.EMPRESA = AL.EMPRESA AND M.ALMACEN = ' +
        'AL.ALMACEN'
      
        'JOIN ART_ARTICULOS AR ON M.EMPRESA = AR.EMPRESA AND M.COMPONENTE' +
        ' = AR.ARTICULO'
      'JOIN SYS_UNIDADES_ARTICULOS U ON M.UNIDAD_FAB = U.TIPO'
      'JOIN SYS_UNIDADES_ARTICULOS UAR ON AR.UNIDADES = UAR.TIPO'
      'JOIN PRO_DES_TIPO_PIEZA TP ON TP.CODIGO = M.DES_TIPO_PIEZA'
      'JOIN PRO_DES_CAB_MATERIAL TM ON TM.TIPO = M.DES_TIPO_MATERIAL'
      
        'LEFT JOIN A_ART_DAME_STOCK3(M.EMPRESA, 1 /*CANAL*/, M.ALMACEN_SA' +
        'L, M.COMPONENTE, '#39'NOW'#39') ST_ALM_SAL ON 1 = 1'
      
        'LEFT JOIN A_ART_DAME_STOCK3(M.EMPRESA, 1 /*CANAL*/, M.ALMACEN, M' +
        '.COMPONENTE, '#39'NOW'#39') ST_ALM_LAN ON 1 = 1'
      'WHERE'
      'M.ESCANDALLO = :ESCANDALLO AND'
      'M.EMPRESA = :EMPRESA AND'
      'M.LINEA_FASE = :LINEA_FASE AND'
      'M.TIPO = :TIPO'
      'ORDER BY M.ORDEN, M.LINEA_COMP')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_MAT_ESC'
      'SET'
      '  ALMACEN=?ALMACEN '
      '  ,COMPONENTE=?COMPONENTE '
      '  ,ORDEN=?ORDEN '
      '  ,UNIDADES=?UNIDADES '
      '  ,PORCENTAJE=?PORCENTAJE '
      '  ,LINEA_FASE=?LINEA_FASE '
      '  ,PRE_COS_UNI=?PRE_COS_UNI '
      '  ,TOTAL_VAR=?TOTAL_VAR '
      '  ,PRECIO_FIJO=?PRECIO_FIJO '
      '  ,TOTAL=?TOTAL '
      '  ,MATESC=?MATESC'
      '  ,ENTRADA=?ENTRADA'
      '  ,TIPO_PRECIO=?TIPO_PRECIO'
      '  ,ACTUALIZA_MAT=?ACTUALIZA_MAT'
      '  /*,NOTAS=?NOTAS*/'
      '  ,MEDIDAS=?MEDIDAS'
      '  ,TIPO_PIEZA=?TIPO_PIEZA'
      '  ,NUM_PIEZAS=?NUM_PIEZAS'
      '  ,UNIDAD_ART=?UNIDAD_ART'
      '  ,UNIDAD_FAB=?UNIDAD_FAB'
      '  ,ID_EQUIVAL=?ID_EQUIVAL'
      '  ,DES_TIPO_PIEZA=?DES_TIPO_PIEZA'
      '  ,DES_CANTIDAD_TPIEZA=?DES_CANTIDAD_TPIEZA'
      '  ,DES_ALTO=?DES_ALTO'
      '  ,DES_ANCHO=?DES_ANCHO'
      '  ,DES_GRUESO=?DES_GRUESO'
      '  ,DES_METROS_DESCONTAR=?DES_METROS_DESCONTAR'
      '  ,DES_TIPO_MATERIAL=?DES_TIPO_MATERIAL'
      '  ,PORCENT_SN=?PORCENT_SN'
      '  ,DENSIDAD=?DENSIDAD'
      '  ,UNIDADES_DENSIDAD=?UNIDADES_DENSIDAD'
      ' ,FORMULA=?FORMULA'
      ' ,LINEA_TAREA=?LINEA_TAREA'
      ' ,MERMA=?MERMA'
      ' ,MINI_NOTA=?MINI_NOTA'
      ' ,ALMACEN_SAL=?ALMACEN_SAL'
      ',UNIDADES_FIJAS=?UNIDADES_FIJAS'
      'WHERE'
      '  LINEA_COMP=?LINEA_COMP AND '
      '  ESCANDALLO=?ESCANDALLO AND '
      '  EMPRESA=?EMPRESA AND'
      '  TIPO=?TIPO')
    DataSource = DSQMProFasesEsc
    Plan.Strings = (
      ' ')
    AfterDelete = Graba
    AfterEdit = QMProMatEscAfterEdit
    AfterOpen = QMProMatEscAfterOpen
    AfterPost = Graba
    BeforeClose = QMProMatEscBeforeClose
    BeforePost = QMProMatEscBeforePost
    OnCalcFields = QMProMatEscCalcFields
    OnNewRecord = QMProMatEscNewRecord
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 208
    object QMProMatEscEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProMatEscESCANDALLO: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'ESCANDALLO'
    end
    object QMProMatEscLINEA_COMP: TIntegerField
      DisplayLabel = 'Linea Componente'
      FieldName = 'LINEA_COMP'
    end
    object QMProMatEscALMACEN: TFIBStringField
      DisplayLabel = 'Alm. Lan'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMProMatEscCOMPONENTE: TFIBStringField
      DisplayLabel = 'Componente'
      FieldName = 'COMPONENTE'
      OnChange = QMProMatEscCOMPONENTEChange
      Size = 15
    end
    object QMProMatEscORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMProMatEscUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
      OnChange = QMProMatEscUNIDADESChange
      OnGetText = QMProMatEscUNIDADESGetText
    end
    object QMProMatEscPORCENTAJE: TFloatField
      DisplayLabel = 'Porcentaje'
      FieldName = 'PORCENTAJE'
    end
    object QMProMatEscLINEA_FASE: TIntegerField
      DisplayLabel = 'Linea Fase'
      FieldName = 'LINEA_FASE'
    end
    object QMProMatEscPRE_COS_UNI: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRE_COS_UNI'
      OnChange = QMProMatEscPRE_COS_UNIChange
    end
    object QMProMatEscTOTAL_VAR: TFloatField
      DisplayLabel = 'Total var.'
      FieldName = 'TOTAL_VAR'
    end
    object QMProMatEscPRECIO_FIJO: TFloatField
      DisplayLabel = 'Precio Fijo'
      FieldName = 'PRECIO_FIJO'
      OnChange = QMProMatEscPRECIO_FIJOChange
    end
    object QMProMatEscTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
    object QMProMatEscMATESC: TIntegerField
      DisplayLabel = 'Mat. Esc.'
      FieldName = 'MATESC'
    end
    object QMProMatEscPRECIOMAT: TFloatField
      DisplayLabel = 'Precio Mat.'
      FieldKind = fkCalculated
      FieldName = 'PRECIOMAT'
      Calculated = True
    end
    object QMProMatEscENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMProMatEscTIPO_PRECIO: TIntegerField
      DisplayLabel = 'Tipo Precio'
      FieldName = 'TIPO_PRECIO'
    end
    object QMProMatEsclkTIPO_PRECIO: TStringField
      DisplayLabel = 'Tipo Precio'
      DisplayWidth = 25
      FieldKind = fkLookup
      FieldName = 'lkTIPO_PRECIO'
      LookupDataSet = xTipoPrecio
      LookupKeyFields = 'TIPO_PRECIO_BASE'
      LookupResultField = 'TITULO'
      KeyFields = 'TIPO_PRECIO'
      LookupCache = True
      Size = 25
      Lookup = True
    end
    object QMProMatEscACTUALIZA_MAT: TIntegerField
      DisplayLabel = 'Actualiza Mat.'
      FieldName = 'ACTUALIZA_MAT'
    end
    object QMProMatEscNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMProMatEscMEDIDAS: TFIBStringField
      DisplayLabel = 'Medidas'
      FieldName = 'MEDIDAS'
      Size = 60
    end
    object QMProMatEscTIPO_PIEZA: TFIBStringField
      DisplayLabel = 'Tipo Pieza'
      FieldName = 'TIPO_PIEZA'
      Size = 60
    end
    object QMProMatEscNUM_PIEZAS: TFIBStringField
      DisplayLabel = 'N'#250'm. Piezas'
      FieldName = 'NUM_PIEZAS'
      Size = 60
    end
    object QMProMatEscUNIDAD_ART: TFIBStringField
      DisplayLabel = 'Ud. Art.'
      FieldName = 'UNIDAD_ART'
      Size = 2
    end
    object QMProMatEscUNIDAD_FAB: TFIBStringField
      DisplayLabel = 'Ud. Fab.'
      FieldName = 'UNIDAD_FAB'
      Size = 2
    end
    object QMProMatEscTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMProMatEscID_ESC: TIntegerField
      DisplayLabel = 'ID Esc.'
      FieldName = 'ID_ESC'
    end
    object QMProMatEscID_EQUIVAL: TIntegerField
      DisplayLabel = 'Equivalencia'
      FieldName = 'ID_EQUIVAL'
    end
    object QMProMatEscunidades_por_compuesto: TFloatField
      DisplayLabel = 'Unidades x Comp.'
      FieldKind = fkCalculated
      FieldName = 'unidades_por_compuesto'
      OnGetText = QMProMatEscunidades_por_compuestoGetText
      Calculated = True
    end
    object QMProMatEscDES_TIPO_PIEZA: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DES_TIPO_PIEZA'
      OnChange = QMProMatEscDES_TIPO_PIEZAChange
      Size = 3
    end
    object QMProMatEscDescDesTPieza: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescDesTPieza'
      Size = 60
      Calculated = True
    end
    object QMProMatEscDES_CANTIDAD_TPIEZA: TFloatField
      DisplayLabel = 'Descripcion'
      FieldName = 'DES_CANTIDAD_TPIEZA'
    end
    object QMProMatEscDES_ALTO: TFloatField
      DisplayLabel = 'Alto'
      FieldName = 'DES_ALTO'
    end
    object QMProMatEscDES_ANCHO: TFloatField
      DisplayLabel = 'Ancho'
      FieldName = 'DES_ANCHO'
    end
    object QMProMatEscDES_GRUESO: TFloatField
      DisplayLabel = 'Grueso'
      FieldName = 'DES_GRUESO'
    end
    object QMProMatEscDES_METROS_DESCONTAR: TFloatField
      DisplayLabel = 'Descripcion'
      FieldName = 'DES_METROS_DESCONTAR'
    end
    object QMProMatEscDES_TIPO_MATERIAL: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DES_TIPO_MATERIAL'
      OnChange = QMProMatEscDES_TIPO_MATERIALChange
      Size = 3
    end
    object QMProMatEscDescDesTMaterial: TStringField
      DisplayLabel = 'Desc. Tipo Mat.'
      FieldKind = fkCalculated
      FieldName = 'DescDesTMaterial'
      Size = 60
      Calculated = True
    end
    object QMProMatEscLINEA_TAREA: TIntegerField
      DisplayLabel = 'Linea Tarea'
      FieldName = 'LINEA_TAREA'
    end
    object QMProMatEscMINI_NOTA: TFIBStringField
      DisplayLabel = 'Nota'
      FieldName = 'MINI_NOTA'
      Size = 60
    end
    object QMProMatEscPORCENT_SN: TIntegerField
      DisplayLabel = 'Porcent S.N.'
      FieldName = 'PORCENT_SN'
    end
    object QMProMatEscDENSIDAD: TFloatField
      DisplayLabel = 'Densidad'
      FieldName = 'DENSIDAD'
      OnChange = QMProMatEscUNIDADES_DENSIDADChange
    end
    object QMProMatEscUNIDADES_DENSIDAD: TFloatField
      DisplayLabel = 'Uds. Densidad'
      FieldName = 'UNIDADES_DENSIDAD'
      OnChange = QMProMatEscUNIDADES_DENSIDADChange
    end
    object QMProMatEscRESULTADO_FORMULA: TFloatField
      DisplayLabel = 'Resultado Form.'
      FieldName = 'RESULTADO_FORMULA'
    end
    object QMProMatEscFORMULA: TIntegerField
      DisplayLabel = 'F'#243'rmula'
      FieldName = 'FORMULA'
    end
    object QMProMatEscMERMA: TFloatField
      DisplayLabel = 'Merma'
      FieldName = 'MERMA'
    end
    object QMProMatEscDESACTIVA_TRIGGER: TIntegerField
      DisplayLabel = 'Desac. Trigger'
      FieldName = 'DESACTIVA_TRIGGER'
    end
    object QMProMatEscID_MATERIAL: TIntegerField
      DisplayLabel = 'Id Mat.'
      FieldName = 'ID_MATERIAL'
    end
    object QMProMatEscALMACEN_SAL: TFIBStringField
      DisplayLabel = 'Alm. Sal.'
      FieldName = 'ALMACEN_SAL'
      Size = 3
    end
    object QMProMatEscDESC_ALMACEN: TFIBStringField
      DisplayLabel = 'Desc. Alm.'
      FieldName = 'DESC_ALMACEN'
      Size = 40
    end
    object QMProMatEscDESC_ARTICULO: TFIBStringField
      DisplayLabel = 'Desc. Articulo'
      FieldName = 'DESC_ARTICULO'
      Size = 256
    end
    object QMProMatEscDECIMALES_UNIDAD_FAB: TIntegerField
      DisplayLabel = 'Dec. Unid. Fab.'
      FieldName = 'DECIMALES_UNIDAD_FAB'
    end
    object QMProMatEscP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object QMProMatEscDECIMALES_UNIDAD_ART: TIntegerField
      DisplayLabel = 'Dec. Unid. Art.'
      FieldName = 'DECIMALES_UNIDAD_ART'
    end
    object QMProMatEscDESC_TIPO_PIEZA: TFIBStringField
      DisplayLabel = 'Desc. Tipo Pieza'
      FieldName = 'DESC_TIPO_PIEZA'
      Size = 60
    end
    object QMProMatEscDESC_TIPO_MATERIAL: TFIBStringField
      DisplayLabel = 'Desc. Tipo Mat.'
      FieldName = 'DESC_TIPO_MATERIAL'
      Size = 60
    end
    object QMProMatEscTIENE_ADJUNTO: TIntegerField
      DisplayLabel = 'Adjunto'
      FieldName = 'TIENE_ADJUNTO'
      ReadOnly = True
    end
    object QMProMatEscUNIDADES_FIJAS: TSmallintField
      DisplayLabel = 'Uds. Fijas'
      FieldName = 'UNIDADES_FIJAS'
    end
    object QMProMatEscTIENE_SUBESCANDALLO: TIntegerField
      DisplayLabel = 'Subescandallo'
      FieldName = 'TIENE_SUBESCANDALLO'
    end
    object QMProMatEscULT_MODIFICACION: TDateTimeField
      DisplayLabel = 'Ult. Modificacion'
      FieldName = 'ULT_MODIFICACION'
    end
    object QMProMatEscSTOCK: TFloatField
      DisplayLabel = 'Stock (SAL)'
      FieldName = 'STOCK'
      OnGetText = QMProMatEscSTOCKGetText
    end
    object QMProMatEscSTOCK_ALM_LAN: TFloatField
      DisplayLabel = 'Stock (LAN)'
      FieldName = 'STOCK_ALM_LAN'
      OnGetText = QMProMatEscSTOCK_ALM_LANGetText
    end
    object QMProMatEscCONTROL_STOCK: TIntegerField
      DisplayLabel = 'Ctrol Stock'
      FieldName = 'CONTROL_STOCK'
    end
  end
  object DSQMProMatEsc: TDataSource
    DataSet = QMProMatEsc
    Left = 144
    Top = 208
  end
  object QMProFasesEsc: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_FASES_ESC'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ESCANDALLO=?old_ESCANDALLO AND '
      '  LINEA_FASE=?old_LINEA_FASE AND'
      '  TIPO=?old_TIPO')
    InsertSQL.Strings = (
      'INSERT INTO PRO_FASES_ESC'
      
        '  (DIBUJO,NOTAS,ORDEN,FASE,LINEA_FASE,ESCANDALLO,EMPRESA,TIPOFAS' +
        'E,ENTRADA , ACTUALIZA_MAT, ACTUALIZA_REC,ID_IMAGEN,TIPO,REBAJE, ' +
        'MERMA_FASE, PIEZAS_HORA)'
      'VALUES'
      
        '  (?DIBUJO,?NOTAS,?ORDEN,?FASE,?LINEA_FASE,?ESCANDALLO,?EMPRESA,' +
        '?TIPOFASE,?ENTRADA ,?ACTUALIZA_MAT,?ACTUALIZA_REC,?ID_IMAGEN,?TI' +
        'PO,?REBAJE,?MERMA_FASE,?PIEZAS_HORA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_FASES_ESC'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ESCANDALLO=?ESCANDALLO AND '
      '  LINEA_FASE=?LINEA_FASE AND'
      '  TIPO=?TIPO')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM PRO_FASES_ESC'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'ESCANDALLO = ?ESCANDALLO AND'
      'TIPO = ?TIPO'
      'ORDER BY ORDEN, LINEA_FASE')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_FASES_ESC'
      'SET'
      '  DIBUJO=?DIBUJO '
      '  ,NOTAS=?NOTAS '
      '  ,ORDEN=?ORDEN '
      '  ,FASE=?FASE '
      '  ,TIPOFASE=?TIPOFASE '
      '   ,ENTRADA=?ENTRADA'
      '   ,ACTUALIZA_MAT=?ACTUALIZA_MAT'
      '   ,ACTUALIZA_REC=?ACTUALIZA_REC'
      '   ,ID_IMAGEN=?ID_IMAGEN'
      '  ,REBAJE=?REBAJE'
      '  ,MERMA_FASE=?MERMA_FASE'
      '  ,PIEZAS_HORA=?PIEZAS_HORA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ESCANDALLO=?ESCANDALLO AND '
      '  LINEA_FASE=?LINEA_FASE AND'
      '  TIPO=?TIPO')
    DataSource = DSQMProEscandallo
    Plan.Strings = (
      ' ')
    AfterDelete = Graba
    AfterEdit = QMProFasesEscAfterEdit
    AfterOpen = QMProFasesEscAfterOpen
    AfterPost = Graba
    AfterScroll = QMProFasesEscAfterScroll
    BeforeClose = QMProFasesEscBeforeClose
    BeforePost = QMProFasesEscBeforePost
    OnNewRecord = QMProFasesEscNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ESCANDALLO '
      'LINEA_FASE '
      'TIPO'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_FASES_ESC'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 112
    object QMProFasesEscEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProFasesEscESCANDALLO: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'ESCANDALLO'
    end
    object QMProFasesEscLINEA_FASE: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA_FASE'
    end
    object QMProFasesEscFASE: TFIBStringField
      DisplayLabel = 'Fase'
      FieldName = 'FASE'
      Size = 60
    end
    object QMProFasesEscORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMProFasesEscTIPOFASE: TFIBStringField
      DisplayLabel = 'Tipo Fase'
      FieldName = 'TIPOFASE'
      OnChange = QMProFasesEscTIPOFASEChange
      Size = 3
    end
    object QMProFasesEscNOTAS: TMemoField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object QMProFasesEscDescFase: TStringField
      FieldKind = fkCalculated
      FieldName = 'DescFase'
      Size = 40
      Calculated = True
    end
    object QMProFasesEscDIBUJO: TFIBStringField
      DisplayLabel = 'Dibujo'
      FieldName = 'DIBUJO'
      Size = 100
    end
    object QMProFasesEscENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMProFasesEscACTUALIZA_REC: TIntegerField
      DisplayLabel = 'Actualiza Rec.'
      FieldName = 'ACTUALIZA_REC'
    end
    object QMProFasesEscACTUALIZA_MAT: TIntegerField
      DisplayLabel = 'Actualiza Mat.'
      FieldName = 'ACTUALIZA_MAT'
    end
    object QMProFasesEscID_IMAGEN: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_IMAGEN'
    end
    object QMProFasesEscTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMProFasesEscID_ESC: TIntegerField
      DisplayLabel = 'ID Esc.'
      FieldName = 'ID_ESC'
    end
    object QMProFasesEscREBAJE: TIntegerField
      DisplayLabel = 'Rebaje'
      FieldName = 'REBAJE'
    end
    object QMProFasesEscMERMA_FASE: TFloatField
      DisplayLabel = '% merma'
      FieldName = 'MERMA_FASE'
    end
    object QMProFasesEscPIEZAS_HORA: TFloatField
      DisplayLabel = 'Piezas/hora'
      FieldName = 'PIEZAS_HORA'
    end
    object QMProFasesEscID_FASE: TIntegerField
      DisplayLabel = 'Id Fase'
      FieldName = 'ID_FASE'
    end
  end
  object DSQMProFasesEsc: TDataSource
    DataSet = QMProFasesEsc
    Left = 144
    Top = 112
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
      '  EMPRESA=?old_EMPRESA AND'
      '  ESCANDALLO=?old_ESCANDALLO AND '
      '  TIPO=?old_TIPO AND'
      '  LINEA_TAREA=?old_LINEA_TAREA AND '
      '  LINEA_FASE=?old_LINEA_FASE ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_TAREA_ESC'
      
        '  (EMPRESA,ESCANDALLO,LINEA_FASE,LINEA_TAREA,TAREA,ORDEN,TIPOTAR' +
        'EA,COMENTARIO,RECURSO,CANTIDAD,PRE_COS_UNI,TOTAL_VAR,PRECIO_FIJO' +
        ',TOTAL,ENTRADA,ACTUALIZA_REC,ID_UTILLAJES,DESC_UTILLAJE,TIEMPO,T' +
        'IPO,ID_ESC,OPERACIONES_NUM,OPERACIONES_TIEMPO,FORMULA,UNIDADES,T' +
        'IEMPO_UNITARIO,CAMPO_1,CAMPO_2,MAQUINA,SECCION,ORDEN_OF,NO_PRODU' +
        'CTIVA)'
      'VALUES'
      
        '  (?EMPRESA,?ESCANDALLO,?LINEA_FASE,?LINEA_TAREA,?TAREA,?ORDEN,?' +
        'TIPOTAREA,?COMENTARIO,?RECURSO,?CANTIDAD,?PRE_COS_UNI,?TOTAL_VAR' +
        ',?PRECIO_FIJO,?TOTAL,?ENTRADA,?ACTUALIZA_REC,?ID_UTILLAJES,?DESC' +
        '_UTILLAJE,?TIEMPO,?TIPO,?ID_ESC,?OPERACIONES_NUM,?OPERACIONES_TI' +
        'EMPO,?FORMULA,?UNIDADES,?TIEMPO_UNITARIO,?CAMPO_1,?CAMPO_2,?MAQU' +
        'INA,?SECCION,?ORDEN_OF,?NO_PRODUCTIVA)')
    RefreshSQL.Strings = (
      'SELECT  *'
      'FROM PRO_TAREA_ESC'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  ESCANDALLO=?ESCANDALLO AND '
      '  TIPO=?TIPO AND'
      '  LINEA_TAREA=?LINEA_TAREA AND '
      '  LINEA_FASE=?LINEA_FASE ')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM PRO_TAREA_ESC'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'ESCANDALLO = ?ESCANDALLO AND'
      'TIPO = ?TIPO AND'
      'LINEA_FASE = ?LINEA_FASE'
      'ORDER BY ORDEN, LINEA_TAREA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_TAREA_ESC'
      'SET'
      '  TAREA=?TAREA '
      '  ,ORDEN=?ORDEN '
      '  ,TIPOTAREA=?TIPOTAREA '
      '  /*,COMENTARIO=?COMENTARIO*/ '
      '  ,RECURSO=?RECURSO '
      '  ,CANTIDAD=?CANTIDAD '
      '  ,PRE_COS_UNI=?PRE_COS_UNI '
      '  ,TOTAL_VAR=?TOTAL_VAR '
      '  ,PRECIO_FIJO=?PRECIO_FIJO '
      '  ,TOTAL=?TOTAL '
      '  ,ENTRADA=?ENTRADA'
      '  ,ACTUALIZA_REC=?ACTUALIZA_REC'
      '  ,ID_UTILLAJES=?ID_UTILLAJES'
      '  ,DESC_UTILLAJE=?DESC_UTILLAJE'
      '  ,TIEMPO=?TIEMPO'
      '  ,OPERACIONES_NUM=?OPERACIONES_NUM'
      '  ,OPERACIONES_TIEMPO=?OPERACIONES_TIEMPO'
      '  ,FORMULA=?FORMULA'
      '  ,UNIDADES=?UNIDADES'
      '  ,TIEMPO_UNITARIO=?TIEMPO_UNITARIO'
      '  ,CAMPO_1=?CAMPO_1'
      '  ,CAMPO_2=?CAMPO_2'
      '  ,MAQUINA=?MAQUINA'
      '  ,SECCION=?SECCION'
      '  ,ORDEN_OF=?ORDEN_OF'
      '  ,NO_PRODUCTIVA=?NO_PRODUCTIVA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  ESCANDALLO=?ESCANDALLO AND '
      '  TIPO=?TIPO AND'
      '  LINEA_TAREA=?LINEA_TAREA AND '
      '  LINEA_FASE=?LINEA_FASE ')
    DataSource = DSQMProFasesEsc
    Plan.Strings = (
      ' ')
    AfterDelete = Graba
    AfterEdit = QMProTareaEscAfterEdit
    AfterOpen = QMProTareaEscAfterOpen
    AfterPost = Graba
    AfterScroll = QMProTareaEscAfterScroll
    BeforeClose = QMProTareaEscBeforeClose
    BeforePost = QMProTareaEscBeforePost
    OnCalcFields = QMProTareaEscCalcFields
    OnNewRecord = QMProTareaEscNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ESCANDALLO '
      'TIPO '
      'LINEA_TAREA '
      'LINEA_FASE ')
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
    Top = 160
    object QMProTareaEscEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProTareaEscESCANDALLO: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'ESCANDALLO'
    end
    object QMProTareaEscLINEA_FASE: TIntegerField
      DisplayLabel = 'Linea Fase'
      FieldName = 'LINEA_FASE'
    end
    object QMProTareaEscLINEA_TAREA: TIntegerField
      DisplayLabel = 'Linea Tarea'
      FieldName = 'LINEA_TAREA'
    end
    object QMProTareaEscTAREA: TFIBStringField
      DisplayLabel = 'Tarea'
      FieldName = 'TAREA'
      Size = 60
    end
    object QMProTareaEscORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object QMProTareaEscTIPOTAREA: TFIBStringField
      DisplayLabel = 'Tipo Tarea'
      FieldName = 'TIPOTAREA'
      OnChange = QMProTareaEscTIPOTAREAChange
      Size = 3
    end
    object QMProTareaEscCOMENTARIO: TMemoField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      BlobType = ftMemo
      GraphicHeader = False
      Size = 8
    end
    object QMProTareaEscRECURSO: TFIBStringField
      DisplayLabel = 'Recurso'
      FieldName = 'RECURSO'
      OnChange = QMProTareaEscRECURSOChange
      Size = 5
    end
    object QMProTareaEscTIME: TStringField
      Alignment = taCenter
      DisplayLabel = 'Time'
      DisplayWidth = 13
      FieldKind = fkCalculated
      FieldName = 'TIME'
      OnGetText = QMProTareaEscTIMEGetText
      EditMask = '00:00:00;1;_'
      Size = 13
      Calculated = True
    end
    object QMProTareaEscTIEMPO: TFloatField
      DisplayLabel = 'Tiempo (Seg)'
      FieldName = 'TIEMPO'
      OnChange = QMProTareaEscTIEMPOChange
    end
    object QMProTareaEscCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
      OnChange = QMProTareaEscCANTIDADChange
    end
    object QMProTareaEscPRE_COS_UNI: TFloatField
      DisplayLabel = 'Precio (H)'
      FieldName = 'PRE_COS_UNI'
      OnChange = QMProTareaEscPRE_COS_UNIChange
    end
    object QMProTareaEscTOTAL_VAR: TFloatField
      DisplayLabel = 'Total var.'
      FieldName = 'TOTAL_VAR'
    end
    object QMProTareaEscPRECIO_FIJO: TFloatField
      DisplayLabel = 'Precio Fijo'
      FieldName = 'PRECIO_FIJO'
      OnChange = QMProTareaEscPRECIO_FIJOChange
    end
    object QMProTareaEscTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
    object QMProTareaEscDescrTarea: TStringField
      DisplayLabel = 'Desc. Tarea'
      FieldKind = fkCalculated
      FieldName = 'DescrTarea'
      Size = 40
      Calculated = True
    end
    object QMProTareaEscDescrRecurso: TStringField
      DisplayLabel = 'Desc. Recurso'
      FieldKind = fkCalculated
      FieldName = 'DescrRecurso'
      Size = 40
      Calculated = True
    end
    object QMProTareaEscENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMProTareaEscACTUALIZA_REC: TIntegerField
      DisplayLabel = 'Actualiza Rec.'
      FieldName = 'ACTUALIZA_REC'
    end
    object QMProTareaEscID_UTILLAJES: TFIBStringField
      DisplayLabel = 'Utillaje'
      DisplayWidth = 10
      FieldName = 'ID_UTILLAJES'
      OnChange = QMProTareaEscID_UTILLAJESChange
      Size = 10
    end
    object QMProTareaEscDESC_UTILLAJE: TFIBStringField
      DisplayLabel = 'Desc. Utillaje'
      FieldName = 'DESC_UTILLAJE'
      Size = 40
    end
    object QMProTareaEscTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMProTareaEscID_ESC: TIntegerField
      DisplayLabel = 'ID Esc.'
      FieldName = 'ID_ESC'
    end
    object QMProTareaEscOPERACIONES_NUM: TIntegerField
      DisplayLabel = 'Num. Op.'
      FieldName = 'OPERACIONES_NUM'
      OnChange = QMProTareaEscOPERACIONES_NUMChange
    end
    object QMProTareaEscOPERACIONES_TIEMPO: TIntegerField
      DisplayLabel = 'Tiempo Op.'
      FieldName = 'OPERACIONES_TIEMPO'
      OnChange = QMProTareaEscOPERACIONES_TIEMPOChange
    end
    object QMProTareaEscCOSTE_OPERACIONES: TFloatField
      DisplayLabel = 'Coste Op.'
      FieldKind = fkCalculated
      FieldName = 'COSTE_OPERACIONES'
      OnGetText = QMProTareaEscCOSTE_OPERACIONESGetText
      Calculated = True
    end
    object QMProTareaEsccantidad_por_compuesto: TFloatField
      DisplayLabel = 'Cant. x Comp.'
      FieldKind = fkCalculated
      FieldName = 'cantidad_por_compuesto'
      OnGetText = QMProTareaEsccantidad_por_compuestoGetText
      Calculated = True
    end
    object QMProTareaEsctiempo_por_compuesto: TFloatField
      DisplayLabel = 'Tiempo x Comp.'
      FieldKind = fkCalculated
      FieldName = 'tiempo_por_compuesto'
      OnGetText = QMProTareaEsctiempo_por_compuestoGetText
      Calculated = True
    end
    object QMProTareaEscFORMULA: TIntegerField
      DisplayLabel = 'Formula'
      FieldName = 'FORMULA'
    end
    object QMProTareaEscID_TAREA: TIntegerField
      DisplayLabel = 'ID Tarea'
      FieldName = 'ID_TAREA'
    end
    object QMProTareaEscRESULTADO_FORMULA: TFloatField
      DisplayLabel = 'Result. Formula'
      FieldName = 'RESULTADO_FORMULA'
    end
    object QMProTareaEscUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object QMProTareaEscTIEMPO_UNITARIO: TFloatField
      DisplayLabel = 'Tiempo Unit. (min.)'
      FieldName = 'TIEMPO_UNITARIO'
    end
    object QMProTareaEscCAMPO_1: TFloatField
      DisplayLabel = 'Campo 1'
      FieldName = 'CAMPO_1'
    end
    object QMProTareaEscCAMPO_2: TFloatField
      DisplayLabel = 'Campo 2'
      FieldName = 'CAMPO_2'
    end
    object QMProTareaEscMAQUINA: TIntegerField
      DisplayLabel = 'M'#225'quina'
      FieldName = 'MAQUINA'
    end
    object QMProTareaEscSECCION: TFIBStringField
      DisplayLabel = 'Secci'#243'n'
      FieldName = 'SECCION'
      Size = 3
    end
    object QMProTareaEscORDEN_OF: TIntegerField
      DisplayLabel = 'Orden General'
      FieldName = 'ORDEN_OF'
    end
    object QMProTareaEscNO_PRODUCTIVA: TIntegerField
      DisplayLabel = 'No productiva'
      FieldName = 'NO_PRODUCTIVA'
    end
  end
  object DSQMProTareaEsc: TDataSource
    DataSet = QMProTareaEsc
    Left = 144
    Top = 160
  end
  object QMProDibEsc: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_DIB_ESC'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ESCANDALLO=?old_ESCANDALLO AND '
      '  LINEA=?old_LINEA AND '
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_DIB_ESC'
      '  (ESCANDALLO,RUTA,ID_IMAGEN,ID_ESC,EMPRESA,LINEA,TIPO)'
      'VALUES'
      '  (?ESCANDALLO,?RUTA,?ID_IMAGEN,?ID_ESC,?EMPRESA,?LINEA,?TIPO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_DIB_ESC'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ESCANDALLO=?ESCANDALLO AND '
      '  LINEA=?LINEA AND '
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_DIB_ESC'
      'WHERE'
      'ID_ESC = :ID_ESC')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_DIB_ESC'
      'SET'
      '  RUTA=?RUTA '
      '  ,ID_IMAGEN=?ID_IMAGEN '
      '  ,ID_ESC=?ID_ESC '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ESCANDALLO=?ESCANDALLO AND '
      '  LINEA=?LINEA AND '
      '  TIPO=?TIPO ')
    DataSource = DSQMProEscandallo
    Plan.Strings = (
      ' ')
    AfterDelete = Graba
    AfterEdit = QMProDibEscAfterEdit
    AfterPost = Graba
    AfterScroll = QMProDibEscAfterScroll
    OnNewRecord = QMProDibEscNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ESCANDALLO '
      'LINEA '
      'TIPO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_DIB_ESC'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 64
    object QMProDibEscEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMProDibEscESCANDALLO: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'ESCANDALLO'
    end
    object QMProDibEscRUTA: TFIBStringField
      DisplayLabel = 'Carpeta'
      FieldName = 'RUTA'
      Size = 100
    end
    object QMProDibEscLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMProDibEscID_IMAGEN: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_IMAGEN'
    end
    object QMProDibEscTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMProDibEscID_ESC: TIntegerField
      DisplayLabel = 'ID Esc.'
      FieldName = 'ID_ESC'
    end
    object QMProDibEscNOMBRE: TFIBStringField
      DisplayLabel = 'Nombre'
      FieldKind = fkCalculated
      FieldName = 'NOMBRE'
      OnGetText = QMProDibEscNOMBREGetText
      Size = 35
      Calculated = True
    end
  end
  object DSQMProDibEsc: TDataSource
    DataSet = QMProDibEsc
    Left = 144
    Top = 64
  end
  object xTituloArtMat: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    RefreshSQL.Strings = (
      'Select Titulo, P_Coste, Unidades'
      'From Art_Articulos'
      'Where Articulo=?Componente and Empresa=?Empresa')
    SelectSQL.Strings = (
      'SELECT TITULO, P_COSTE, UNIDADES'
      'FROM ART_ARTICULOS'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'ARTICULO = :COMPONENTE')
    UniDirectional = False
    DataSource = DSQMProMatEsc
    Left = 288
    Top = 64
    object xTituloArtMatTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xTituloArtMatP_COSTE: TFloatField
      DisplayLabel = 'P. Coste'
      FieldName = 'P_COSTE'
    end
    object xTituloArtMatUNIDADES: TFIBStringField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
      Size = 2
    end
  end
  object DSTipo_Precio: TDataSource
    DataSet = xTipoPrecio
    Left = 144
    Top = 256
  end
  object xTipoPrecio: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TIPO_PRECIO_BASE, TITULO'
      'FROM SYS_TIPO_PRECIO_BASE'
      'WHERE'
      'TIPO_PRECIO_BASE >= 0'
      'UNION ALL'
      
        'SELECT CAST(10 AS SMALLINT), CAST('#39'Sub-escandallo'#39' AS VARCHAR(25' +
        '))'
      'FROM RDB$DATABASE'
      'UNION'
      
        'SELECT CAST(-1 AS SMALLINT), CAST('#39'Fijado en detalle'#39' AS VARCHAR' +
        '(25))'
      'FROM RDB$DATABASE ')
    UniDirectional = False
    Left = 40
    Top = 256
    object xTipoPrecioTIPO_PRECIO_BASE: TIntegerField
      DisplayLabel = 'Tipo Precio Base'
      FieldName = 'TIPO_PRECIO_BASE'
    end
    object xTipoPrecioTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 25
    end
  end
  object xCostesTEsc: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM PRO_DAME_COSTES_ESCANDALLO'
      '(:EMPRESA, :TIPO, :ESCANDALLO, 1)')
    UniDirectional = False
    DataSource = DSQMProEscandallo
    Left = 40
    Top = 304
    object xCostesTEscCOSTE_FIJO: TFloatField
      DisplayLabel = 'Coste Fijo'
      FieldName = 'COSTE_FIJO'
    end
    object xCostesTEscCOSTE_MATER: TFloatField
      DisplayLabel = 'Coste Mat.'
      FieldName = 'COSTE_MATER'
    end
    object xCostesTEscCOSTE_MAQUI_VAR: TFloatField
      DisplayLabel = 'Coste Maq. Var.'
      FieldName = 'COSTE_MAQUI_VAR'
    end
    object xCostesTEscCOSTE_MAQUI_ABS: TFloatField
      DisplayLabel = 'Coste Maq. Abs.'
      FieldName = 'COSTE_MAQUI_ABS'
    end
    object xCostesTEscCOSTE_MOBRA_VAR: TFloatField
      DisplayLabel = 'Coste Mo. Var.'
      FieldName = 'COSTE_MOBRA_VAR'
    end
    object xCostesTEscCOSTE_MOBRA_ABS: TFloatField
      DisplayLabel = 'Coste Mo. Abs.'
      FieldName = 'COSTE_MOBRA_ABS'
    end
    object xCostesTEscCOSTE_VAR_VAR: TFloatField
      DisplayLabel = 'Coste Var. Var.'
      FieldName = 'COSTE_VAR_VAR'
    end
    object xCostesTEscCOSTE_VAR_ABS: TFloatField
      DisplayLabel = 'Coste Var. Abs.'
      FieldName = 'COSTE_VAR_ABS'
    end
    object xCostesTEscCOSTE_TEXTE_VAR: TFloatField
      DisplayLabel = 'Coste Tex. Var.'
      FieldName = 'COSTE_TEXTE_VAR'
    end
    object xCostesTEscCOSTE_TEXTE_ABS: TFloatField
      DisplayLabel = 'Coste Tex. Abs.'
      FieldName = 'COSTE_TEXTE_ABS'
    end
    object xCostesTEscCOSTE_UNITARIO: TFloatField
      FieldName = 'COSTE_UNITARIO'
    end
    object xCostesTEscCOSTE_TOTAL: TFloatField
      DisplayLabel = 'Coste Total'
      FieldName = 'COSTE_TOTAL'
    end
  end
  object DSxCostesTEsc: TDataSource
    DataSet = xCostesTEsc
    Left = 144
    Top = 304
  end
  object xDesTPieza: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT DESCRIPCION'
      'FROM PRO_DES_TIPO_PIEZA'
      'WHERE'
      'CODIGO = :DES_TIPO_PIEZA')
    UniDirectional = False
    DataSource = DSQMProMatEsc
    Left = 288
    Top = 112
    object xDesTPiezaDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
  object xDesTMaterial: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 1
    SelectSQL.Strings = (
      'SELECT DESCRIPCION'
      'FROM PRO_DES_CAB_MATERIAL'
      'WHERE'
      'TIPO = :DES_TIPO_MATERIAL')
    UniDirectional = False
    DataSource = DSQMProMatEsc
    Left = 288
    Top = 16
    object xDesTMaterialDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 408
    Top = 64
  end
  object xTareaEscNotas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_TAREA_ESC'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND'
      '  ESCANDALLO=?old_ESCANDALLO AND '
      '  TIPO=?old_TIPO AND'
      '  LINEA_TAREA=?old_LINEA_TAREA AND '
      '  LINEA_FASE=?old_LINEA_FASE ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_TAREA_ESC'
      
        '  (EMPRESA,ESCANDALLO,LINEA_FASE,LINEA_TAREA,TAREA,ORDEN,TIPOTAR' +
        'EA,COMENTARIO,RECURSO,CANTIDAD,PRE_COS_UNI,TOTAL_VAR,PRECIO_FIJO' +
        ',TOTAL,ENTRADA,ACTUALIZA_REC,ID_UTILLAJES,DESC_UTILLAJE,TIEMPO,T' +
        'IPO,ID_ESC,OPERACIONES_NUM,OPERACIONES_TIEMPO,FORMULA,UNIDADES,T' +
        'IEMPO_UNITARIO,CAMPO_1,CAMPO_2,MAQUINA,SECCION,ORDEN_OF)'
      'VALUES'
      
        '  (?EMPRESA,?ESCANDALLO,?LINEA_FASE,?LINEA_TAREA,?TAREA,?ORDEN,?' +
        'TIPOTAREA,?COMENTARIO,?RECURSO,?CANTIDAD,?PRE_COS_UNI,?TOTAL_VAR' +
        ',?PRECIO_FIJO,?TOTAL,?ENTRADA,?ACTUALIZA_REC,?ID_UTILLAJES,?DESC' +
        '_UTILLAJE,?TIEMPO,?TIPO,?ID_ESC,?OPERACIONES_NUM,?OPERACIONES_TI' +
        'EMPO,?FORMULA,?UNIDADES,?TIEMPO_UNITARIO,?CAMPO_1,?CAMPO_2,?MAQU' +
        'INA,?SECCION,?ORDEN_OF)')
    RefreshSQL.Strings = (
      
        'SELECT EMPRESA, ESCANDALLO, TIPO, LINEA_FASE, LINEA_TAREA, COMEN' +
        'TARIO'
      'FROM PRO_TAREA_ESC'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  ESCANDALLO=?ESCANDALLO AND '
      '  TIPO=?TIPO AND'
      '  LINEA_TAREA=?LINEA_TAREA AND '
      '  LINEA_FASE=?LINEA_FASE ')
    SelectSQL.Strings = (
      
        'SELECT EMPRESA, ESCANDALLO, TIPO, LINEA_FASE, LINEA_TAREA, COMEN' +
        'TARIO'
      'FROM PRO_TAREA_ESC'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'ESCANDALLO = ?ESCANDALLO AND'
      'TIPO = ?TIPO AND'
      'LINEA_FASE = ?LINEA_FASE AND'
      'LINEA_TAREA = ?LINEA_TAREA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_TAREA_ESC'
      'SET'
      '  COMENTARIO=?COMENTARIO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  ESCANDALLO=?ESCANDALLO AND '
      '  TIPO=?TIPO AND'
      '  LINEA_TAREA=?LINEA_TAREA AND '
      '  LINEA_FASE=?LINEA_FASE ')
    DataSource = DSQMProTareaEsc
    Plan.Strings = (
      ' ')
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ESCANDALLO '
      'TIPO '
      'LINEA_TAREA '
      'LINEA_FASE ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_TAREA_ESC'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 288
    Top = 160
    object xTareaEscNotasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xTareaEscNotasESCANDALLO: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'ESCANDALLO'
    end
    object xTareaEscNotasTIPO: TFIBStringField
      DisplayLabel = 'tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xTareaEscNotasLINEA_FASE: TIntegerField
      DisplayLabel = 'Linea Fase'
      FieldName = 'LINEA_FASE'
    end
    object xTareaEscNotasLINEA_TAREA: TIntegerField
      DisplayLabel = 'Linea Tarea'
      FieldName = 'LINEA_TAREA'
    end
    object xTareaEscNotasCOMENTARIO: TMemoField
      DisplayLabel = 'Comentario'
      FieldName = 'COMENTARIO'
      BlobType = ftMemo
      Size = 8
    end
  end
  object DSxTareaEscNotas: TDataSource
    DataSet = xTareaEscNotas
    Left = 392
    Top = 160
  end
  object xMaterialesEscNotas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_MAT_ESC'
      'WHERE'
      '  LINEA_COMP=?old_LINEA_COMP AND '
      '  ESCANDALLO=?old_ESCANDALLO AND '
      '  EMPRESA=?old_EMPRESA AND'
      '  TIPO=?old_TIPO')
    InsertSQL.Strings = (
      'INSERT INTO PRO_MAT_ESC'
      
        '  (EMPRESA,ESCANDALLO,LINEA_COMP,ALMACEN,COMPONENTE,ORDEN,UNIDAD' +
        'ES,PORCENTAJE,LINEA_FASE,PRE_COS_UNI,TOTAL_VAR,PRECIO_FIJO,TOTAL' +
        ',MATESC,ENTRADA,TIPO_PRECIO,ACTUALIZA_MAT,NOTAS,MEDIDAS,TIPO_PIE' +
        'ZA,NUM_PIEZAS,UNIDAD_ART,UNIDAD_FAB,TIPO,ID_ESC,ID_EQUIVAL,DES_T' +
        'IPO_PIEZA,DES_CANTIDAD_TPIEZA,DES_ALTO,DES_ANCHO,DES_GRUESO,DES_' +
        'METROS_DESCONTAR,DES_TIPO_MATERIAL,PORCENT_SN,DENSIDAD,UNIDADES_' +
        'DENSIDAD,FORMULA,LINEA_TAREA,MERMA,MINI_NOTA,ALMACEN_SAL)'
      'VALUES'
      
        '  (?EMPRESA,?ESCANDALLO,?LINEA_COMP,?ALMACEN,?COMPONENTE,?ORDEN,' +
        '?UNIDADES,?PORCENTAJE,?LINEA_FASE,?PRE_COS_UNI,?TOTAL_VAR,?PRECI' +
        'O_FIJO,?TOTAL,?MATESC,?ENTRADA,?TIPO_PRECIO,?ACTUALIZA_MAT,?NOTA' +
        'S,?MEDIDAS,?TIPO_PIEZA,?NUM_PIEZAS,?UNIDAD_ART,?UNIDAD_FAB,?TIPO' +
        ',?ID_ESC,?ID_EQUIVAL,?DES_TIPO_PIEZA,?DES_CANTIDAD_TPIEZA,?DES_A' +
        'LTO,?DES_ANCHO,?DES_GRUESO,?DES_METROS_DESCONTAR,?DES_TIPO_MATER' +
        'IAL,?PORCENT_SN,?DENSIDAD,?UNIDADES_DENSIDAD,?FORMULA,?LINEA_TAR' +
        'EA,?MERMA,?MINI_NOTA,?ALMACEN_SAL)')
    RefreshSQL.Strings = (
      
        'SELECT EMPRESA, ESCANDALLO, TIPO, LINEA_COMP, NOTAS FROM PRO_MAT' +
        '_ESC'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  ESCANDALLO=?ESCANDALLO AND '
      '  TIPO=?TIPO AND '
      '  LINEA_COMP=?LINEA_COMP ')
    SelectSQL.Strings = (
      
        'SELECT EMPRESA, ESCANDALLO, TIPO, LINEA_COMP, NOTAS FROM PRO_MAT' +
        '_ESC'
      'WHERE'
      '  EMPRESA=?EMPRESA AND'
      '  ESCANDALLO=?ESCANDALLO AND '
      '  TIPO=?TIPO AND '
      '  LINEA_COMP=?LINEA_COMP ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_MAT_ESC'
      'SET'
      '  NOTAS=?NOTAS'
      'WHERE'
      '  LINEA_COMP=?LINEA_COMP AND '
      '  ESCANDALLO=?ESCANDALLO AND '
      '  EMPRESA=?EMPRESA AND'
      '  TIPO=?TIPO')
    DataSource = DSQMProMatEsc
    Plan.Strings = (
      ' ')
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ESCANDALLO '
      'TIPO '
      'LINEA_COMP ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_MAT_ESC'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 288
    Top = 208
    object xMaterialesEscNotasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xMaterialesEscNotasESCANDALLO: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'ESCANDALLO'
    end
    object xMaterialesEscNotasTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xMaterialesEscNotasLINEA_COMP: TIntegerField
      DisplayLabel = 'Linea Comp.'
      FieldName = 'LINEA_COMP'
    end
    object xMaterialesEscNotasNOTAS: TMemoField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
  end
  object DSxMaterialesEscNotas: TDataSource
    DataSet = xMaterialesEscNotas
    Left = 392
    Top = 208
  end
  object QMTmpCostesEscandallos: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM TMP_COSTES_ESCANDALLOS'
      'WHERE'
      '  UNIDADES=?old_UNIDADES AND '
      '  ID_ESC=?old_ID_ESC ')
    InsertSQL.Strings = (
      'INSERT INTO TMP_COSTES_ESCANDALLOS'
      '  (ID_ESC,UNIDADES,MARGEN,MARGEN_2,MARGEN_3)'
      'VALUES'
      '  (?ID_ESC,?UNIDADES,?MARGEN,?MARGEN_2,?MARGEN_3)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_COSTES_ESCANDALLOS'
      'WHERE'
      '  UNIDADES=?UNIDADES AND '
      '  ID_ESC=?ID_ESC ')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_COSTES_ESCANDALLOS'
      'WHERE'
      'ID_ESC = :ID_ESC'
      'ORDER BY UNIDADES')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE TMP_COSTES_ESCANDALLOS'
      'SET'
      '  MARGEN=?MARGEN '
      '  ,MARGEN_2=?MARGEN_2'
      '  ,MARGEN_3=?MARGEN_3'
      'WHERE'
      '  UNIDADES=?UNIDADES AND '
      '  ID_ESC=?ID_ESC ')
    DataSource = DSQMProEscandallo
    Plan.Strings = (
      ' ')
    OnNewRecord = QMTmpCostesEscandallosNewRecord
    ClavesPrimarias.Strings = (
      'UNIDADES '
      'ID_ESC ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_COSTES_ESCANDALLOS'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 41
    Top = 352
    object QMTmpCostesEscandallosID_ESC: TIntegerField
      FieldName = 'ID_ESC'
    end
    object QMTmpCostesEscandallosUNIDADES: TFloatField
      FieldName = 'UNIDADES'
    end
    object QMTmpCostesEscandallosCOSTE_MATERIAL: TFloatField
      FieldName = 'COSTE_MATERIAL'
    end
    object QMTmpCostesEscandallosCOSTE_TAREA: TFloatField
      FieldName = 'COSTE_TAREA'
    end
    object QMTmpCostesEscandallosCOSTE_TOTAL: TFloatField
      FieldName = 'COSTE_TOTAL'
    end
    object QMTmpCostesEscandallosPRECIO_UNITARIO: TFloatField
      FieldName = 'PRECIO_UNITARIO'
    end
    object QMTmpCostesEscandallosMARGEN: TFloatField
      FieldName = 'MARGEN'
    end
    object QMTmpCostesEscandallosMARGEN_2: TFloatField
      DisplayLabel = 'Margen 2'
      FieldName = 'MARGEN_2'
    end
    object QMTmpCostesEscandallosMARGEN_3: TFloatField
      DisplayLabel = 'Margen 3'
      FieldName = 'MARGEN_3'
    end
    object QMTmpCostesEscandallosPRECIO_MARGEN: TFloatField
      DisplayLabel = 'P. Margen'
      FieldName = 'PRECIO_MARGEN'
    end
    object QMTmpCostesEscandallosPRECIO_MARGEN_2: TFloatField
      DisplayLabel = 'P. Margen 2'
      FieldName = 'PRECIO_MARGEN_2'
    end
    object QMTmpCostesEscandallosPRECIO_MARGEN_3: TFloatField
      DisplayLabel = 'P. Margen 3'
      FieldName = 'PRECIO_MARGEN_3'
    end
    object QMTmpCostesEscandallosPRECIO_VENTA: TFloatField
      FieldName = 'PRECIO_VENTA'
    end
  end
  object DSTmpCostesEscandallos: TDataSource
    DataSet = QMTmpCostesEscandallos
    Left = 144
    Top = 352
  end
  object QMCalculoMetros: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_ETI_ESCANDALLO_CALC'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  ESCANDALLO=?old_ESCANDALLO AND '
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO VER_ETI_ESCANDALLO_CALC'
      
        '  (ANCHO,LARGO,SH_ANCHO_TROQUEL,FIGURAS_ANCHO_TROQUEL,SV_AVANCE_' +
        'TROQUEL,FIGURAS_AVANCE_TROQUEL,ANCHO_ARTICULO,VELOCIDAD_MAQUINA,' +
        'CALCULO_1,CALCULO_2,CALCULO_3,ESCANDALLO,COLORES,TROQUEL,EMPRESA' +
        ',MAQUINA,TIPO,ARTICULO,CILINDRO)'
      'VALUES'
      
        '  (?ANCHO,?LARGO,?SH_ANCHO_TROQUEL,?FIGURAS_ANCHO_TROQUEL,?SV_AV' +
        'ANCE_TROQUEL,?FIGURAS_AVANCE_TROQUEL,?ANCHO_ARTICULO,?VELOCIDAD_' +
        'MAQUINA,?CALCULO_1,?CALCULO_2,?CALCULO_3,?ESCANDALLO,?COLORES,?T' +
        'ROQUEL,?EMPRESA,?MAQUINA,?TIPO,?ARTICULO,?CILINDRO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ETI_ESCANDALLO_CALC'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ESCANDALLO=?ESCANDALLO AND '
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_ETI_ESCANDALLO_CALC'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ESCANDALLO=?ESCANDALLO AND '
      '  TIPO=?TIPO ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_ETI_ESCANDALLO_CALC'
      'SET'
      '  ANCHO=?ANCHO '
      '  ,LARGO=?LARGO '
      '  ,SH_ANCHO_TROQUEL=?SH_ANCHO_TROQUEL '
      '  ,FIGURAS_ANCHO_TROQUEL=?FIGURAS_ANCHO_TROQUEL '
      '  ,SV_AVANCE_TROQUEL=?SV_AVANCE_TROQUEL '
      '  ,FIGURAS_AVANCE_TROQUEL=?FIGURAS_AVANCE_TROQUEL '
      '  ,ANCHO_ARTICULO=?ANCHO_ARTICULO '
      '  ,VELOCIDAD_MAQUINA=?VELOCIDAD_MAQUINA '
      '  ,CALCULO_1=?CALCULO_1 '
      '  ,CALCULO_2=?CALCULO_2 '
      '  ,CALCULO_3=?CALCULO_3 '
      '  ,COLORES=?COLORES '
      '  ,TROQUEL=?TROQUEL '
      '  ,MAQUINA=?MAQUINA '
      '  ,ARTICULO=?ARTICULO '
      '  ,CILINDRO=?CILINDRO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ESCANDALLO=?ESCANDALLO AND '
      '  TIPO=?TIPO ')
    DataSource = DSQMProEscandallo
    Plan.Strings = (
      ' ')
    OnNewRecord = QMCalculoMetrosNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'ESCANDALLO '
      'TIPO ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_ETI_ESCANDALLO_CALC'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 41
    Top = 400
    object QMCalculoMetrosEMPRESA: TIntegerField
      FieldName = 'EMPRESA'
    end
    object QMCalculoMetrosESCANDALLO: TIntegerField
      FieldName = 'ESCANDALLO'
    end
    object QMCalculoMetrosTIPO: TFIBStringField
      FieldName = 'TIPO'
      Size = 3
    end
    object QMCalculoMetrosANCHO: TFloatField
      FieldName = 'ANCHO'
    end
    object QMCalculoMetrosLARGO: TFloatField
      FieldName = 'LARGO'
    end
    object QMCalculoMetrosCOLORES: TIntegerField
      FieldName = 'COLORES'
    end
    object QMCalculoMetrosTROQUEL: TIntegerField
      FieldName = 'TROQUEL'
      OnChange = QMCalculoMetrosTROQUELChange
    end
    object QMCalculoMetrosSH_ANCHO_TROQUEL: TFloatField
      FieldName = 'SH_ANCHO_TROQUEL'
    end
    object QMCalculoMetrosFIGURAS_ANCHO_TROQUEL: TFloatField
      FieldName = 'FIGURAS_ANCHO_TROQUEL'
    end
    object QMCalculoMetrosSV_AVANCE_TROQUEL: TFloatField
      FieldName = 'SV_AVANCE_TROQUEL'
    end
    object QMCalculoMetrosFIGURAS_AVANCE_TROQUEL: TFloatField
      FieldName = 'FIGURAS_AVANCE_TROQUEL'
    end
    object QMCalculoMetrosARTICULO: TFIBStringField
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMCalculoMetrosANCHO_ARTICULO: TFloatField
      FieldName = 'ANCHO_ARTICULO'
    end
    object QMCalculoMetrosMAQUINA: TIntegerField
      FieldName = 'MAQUINA'
    end
    object QMCalculoMetrosVELOCIDAD_MAQUINA: TFloatField
      FieldName = 'VELOCIDAD_MAQUINA'
    end
    object QMCalculoMetrosCALCULO_1: TFloatField
      FieldName = 'CALCULO_1'
    end
    object QMCalculoMetrosCALCULO_2: TFloatField
      FieldName = 'CALCULO_2'
    end
    object QMCalculoMetrosCALCULO_3: TFloatField
      FieldName = 'CALCULO_3'
    end
    object QMCalculoMetrosCILINDRO: TIntegerField
      FieldName = 'CILINDRO'
    end
  end
  object DSQMCalculoMetros: TDataSource
    DataSet = QMCalculoMetros
    Left = 144
    Top = 400
  end
end
