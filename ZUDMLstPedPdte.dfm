object ZDMLstPedPdte: TZDMLstPedPdte
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 244
  Top = 118
  Height = 451
  Width = 643
  object xClienteD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT TER.NOMBRE_R_SOCIAL as TITULO FROM EMP_CLIENTES CLI LEFT ' +
        'JOIN SYS_TERCEROS TER ON (CLI.TERCERO=TER.TERCERO)'
      'WHERE EMPRESA=?EMPRESA AND CLIENTE=?CLIENTE')
    UniDirectional = False
    Left = 266
    Top = 66
    object xClienteDTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSClienteD: TDataSource
    DataSet = xClienteD
    Left = 334
    Top = 66
  end
  object DSListado: TDataSource
    DataSet = QMListado
    Left = 104
    Top = 72
  end
  object QMListado: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      '/*select * from*/'
      
        'EXECUTE PROCEDURE  Z_lst_pedidos_pdte_servir(?EMPRESA,?EJERCICIO' +
        ','
      ' ?CANAL,?SERIE,?TIPO_FILTRO,?FECHAD,?FECHAH,'
      ' ?FAMILIAD,?FAMILIAH,?CLIENTED,?CLIENTEH,'
      ' ?ARTICULOD,?ARTICULOH,?SERVIDO,?AGENTED,?AGENTEH)'
      'order by v_codcliente,v_rigpec')
    UniDirectional = False
    Left = 44
    Top = 72
    object QMListadoV_ARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'V_ARTICULO'
      Size = 15
    end
    object QMListadoV_NOMBREARTICULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'V_NOMBREARTICULO'
      Size = 60
    end
    object QMListadoV_UNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'V_UNIDADES'
    end
    object QMListadoV_PRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'V_PRECIO'
    end
    object QMListadoV_RIGPEC: TIntegerField
      DisplayLabel = 'Nro. Ped.'
      FieldName = 'V_RIGPEC'
    end
    object QMListadoV_NOMBRECLIENTE: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'V_NOMBRECLIENTE'
      Size = 60
    end
    object QMListadoV_CODCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'V_CODCLIENTE'
    end
    object QMListadoV_FECHAPED: TDateTimeField
      DisplayLabel = 'Fec. Ped.'
      FieldName = 'V_FECHAPED'
    end
    object QMListadoV_FAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'V_FAMILIA'
      Size = 5
    end
    object QMListadoV_FECHA_ENTREGA_PED: TDateTimeField
      DisplayLabel = 'Fec. Entrega Ped.'
      FieldName = 'V_FECHA_ENTREGA_PED'
    end
    object QMListadoV_SERVIDO: TIntegerField
      DisplayLabel = 'Servido'
      FieldName = 'V_SERVIDO'
    end
    object QMListadoV_UNI_SERV: TFloatField
      DisplayLabel = 'Uds. Servidas'
      FieldName = 'V_UNI_SERV'
    end
    object QMListadoV_UNI_PDTE: TFloatField
      DisplayLabel = 'Uds. Pend.'
      FieldName = 'V_UNI_PDTE'
    end
    object QMListadoV_TOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'V_TOTAL'
    end
    object QMListadoV_TOTAL_SERV: TFloatField
      DisplayLabel = 'Total Serv.'
      FieldName = 'V_TOTAL_SERV'
    end
    object QMListadoV_CODAGENTE: TIntegerField
      DisplayLabel = 'Agente'
      FieldName = 'V_CODAGENTE'
    end
    object QMListadoV_NOMBREAGENTE: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'V_NOMBREAGENTE'
      Size = 60
    end
    object QMListadoV_NOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'V_NOTAS'
      Size = 8
    end
    object QMListadoV_SERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'V_SERIE'
      Size = 10
    end
    object QMListadoV_DTO_PP: TFloatField
      DisplayLabel = 'Dto. P.P.'
      FieldName = 'V_DTO_PP'
    end
    object QMListadoV_DTO_CIAL: TFloatField
      DisplayLabel = 'Dto. Cial.'
      FieldName = 'V_DTO_CIAL'
    end
    object QMListadoV_DTO: TFloatField
      DisplayLabel = 'Dto.'
      FieldName = 'V_DTO'
    end
    object QMListadoV_DTO2: TFloatField
      DisplayLabel = 'Dto. 1'
      FieldName = 'V_DTO2'
    end
    object QMListadoV_DTO3: TFloatField
      DisplayLabel = 'Dto. 2'
      FieldName = 'V_DTO3'
    end
  end
  object xClienteH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT TER.NOMBRE_R_SOCIAL as TITULO FROM EMP_CLIENTES CLI LEFT ' +
        'JOIN SYS_TERCEROS TER ON (CLI.TERCERO=TER.TERCERO)'
      'WHERE EMPRESA=?EMPRESA AND CLIENTE=?CLIENTE')
    UniDirectional = False
    Left = 266
    Top = 122
    object xClienteHTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSclienteH: TDataSource
    DataSet = xClienteH
    Left = 334
    Top = 118
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 112
    Top = 16
  end
  object frPedPdte: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de pedidos'
    RebuildPrinter = False
    OnGetValue = frPedPdteGetValue
    OnBeforePrint = frPedPdteBeforePrint
    OnEnterRect = frPedPdteBeforePrint
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 44
    Top = 18
    ReportForm = {19000000}
  end
  object FrDBPedPdte: TfrDBDataSet
    DataSource = DSListado
    Left = 176
    Top = 72
  end
  object QGeneral: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 40
    Top = 192
  end
  object xArticuloD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA AND ARTICULO=?ARTICULO')
    UniDirectional = False
    Left = 410
    Top = 194
    object xArticuloDTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object xArticuloH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT TITULO FROM VER_ARTICULOS'
      'WHERE EMPRESA=?EMPRESA AND ARTICULO=?ARTICULO')
    UniDirectional = False
    Left = 410
    Top = 242
    object xArticuloHTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSArticuloD: TDataSource
    DataSet = xArticuloD
    Left = 486
    Top = 190
  end
  object DSArticuloH: TDataSource
    DataSet = xArticuloH
    Left = 482
    Top = 242
  end
  object xAgenteD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT TER.NOMBRE_R_SOCIAL as TITULO FROM EMP_AGENTES AG LEFT JO' +
        'IN SYS_TERCEROS TER ON (AG.TERCERO=TER.TERCERO)'
      'WHERE EMPRESA=?EMPRESA AND AGENTE=?AGENTE')
    UniDirectional = False
    Left = 266
    Top = 194
    object xAgenteDTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object xAgenteH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT TER.NOMBRE_R_SOCIAL as TITULO FROM EMP_AGENTES AG LEFT JO' +
        'IN SYS_TERCEROS TER ON (AG.TERCERO=TER.TERCERO)'
      'WHERE EMPRESA=?EMPRESA AND AGENTE=?AGENTE')
    UniDirectional = False
    Left = 266
    Top = 246
    object xAgenteHTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSAgenteD: TDataSource
    DataSet = xAgenteD
    Left = 338
    Top = 194
  end
  object DSAgenteH: TDataSource
    DataSet = xAgenteH
    Left = 338
    Top = 242
  end
  object QMultiSerie: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'insert into tmp_multiserie'
      
        ' select es.empresa,es.ejercicio,es.canal,es.serie,gs.titulo,0,?e' +
        'ntrada'
      'from emp_series es join gen_series gs'
      'on((es.empresa=gs.empresa)and(es.serie=gs.serie))'
      
        'where (es.empresa=?empresa and es.ejercicio=?ejercicio and es.ca' +
        'nal=?canal)'
      '')
    Transaction = TLocal
    AutoTrans = True
    Left = 40
    Top = 260
  end
  object xFamiliaH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_FAMILIAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  FAMILIA=?FAMILIA ')
    SelectSQL.Strings = (
      'SELECT FAMILIA,TITULO TITULO FROM ART_FAMILIAS'
      'WHERE EMPRESA=?EMPRESA AND FAMILIA=?FAMILIA')
    UniDirectional = False
    Left = 409
    Top = 115
    object xFamiliaHFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object xFamiliaHTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object DSxFamiliaH: TDataSource
    DataSet = xFamiliaH
    Left = 481
    Top = 110
  end
  object DSxFamiliaD: TDataSource
    DataSet = xFamiliaD
    Left = 480
    Top = 67
  end
  object xFamiliaD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_FAMILIAS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  FAMILIA=?FAMILIA ')
    SelectSQL.Strings = (
      'SELECT FAMILIA,TITULO FROM ART_FAMILIAS'
      'WHERE EMPRESA=?EMPRESA AND FAMILIA=?FAMILIA')
    UniDirectional = False
    Left = 406
    Top = 65
    object xFamiliaDFAMILIA: TFIBStringField
      DisplayLabel = 'Familia'
      FieldName = 'FAMILIA'
      Size = 5
    end
    object xFamiliaDTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
  end
  object QTemp: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 96
    Top = 192
  end
  object xCanalDesde: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ALMACENES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ALMACEN=?ALMACEN ')
    SelectSQL.Strings = (
      'SELECT canal, titulo FROM gen_canales'
      'where empresa=?empresa and canal=?canal')
    UniDirectional = False
    Left = 254
    Top = 296
    object xCanalDesdeTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object xCanalDesdeCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
  end
  object DSxCanalDesde: TDataSource
    DataSet = xCanalDesde
    Left = 334
    Top = 299
  end
  object DSxCanalHasta: TDataSource
    DataSet = xCanalHasta
    Left = 336
    Top = 357
  end
  object xCanalHasta: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ALMACENES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ALMACEN=?ALMACEN ')
    SelectSQL.Strings = (
      'SELECT canal,titulo FROM gen_canales'
      'where empresa=?empresa and canal=?canal')
    UniDirectional = False
    Left = 252
    Top = 366
    object xCanalHastaTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 40
    end
    object xCanalHastaCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
  end
end
