object ZDMLstOrdenes: TZDMLstOrdenes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 322
  Top = 336
  Height = 553
  Width = 745
  object frLstOrders: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de precios'
    RebuildPrinter = False
    OnGetValue = frLstOrdersGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 238
    Top = 12
    ReportForm = {19000000}
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 475
    Top = 12
  end
  object dsxUntilOrder: TDataSource
    DataSet = xUntilOrder
    Left = 140
    Top = 71
  end
  object dsxFromOrder: TDataSource
    DataSet = xFromOrder
    Left = 140
    Top = 17
  end
  object xFromOrder: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT S_REFERENCIA FROM z_ges_ordprod_c'
      '  where empresa   = :empresa and'
      '        ejercicio = :ejercicio and'
      '        canal     = :canal and'
      '        serie     = :serie and'
      '        rig       = :orden')
    UniDirectional = False
    Left = 32
    Top = 16
    object xFromOrderS_REFERENCIA: TFIBStringField
      DisplayLabel = 'Su Ref.'
      FieldName = 'S_REFERENCIA'
    end
  end
  object xUntilOrder: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT S_REFERENCIA FROM z_ges_ordprod_c'
      '  where empresa   = :empresa and'
      '        ejercicio = :ejercicio and'
      '        canal     = :canal and'
      '        serie     = :serie and'
      '        rig       = :orden')
    UniDirectional = False
    Left = 36
    Top = 71
  end
  object qDetails: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO ')
    SelectSQL.Strings = (
      'select ord.empresa                    as empresa,'
      
        '       ord.rig                        as orden_fabricacion,     ' +
        '      '
      '       ord.fecha_emision              as fecha_recepcion,'
      '       ord.fecha_entrega              as fecha_entrega,'
      '       ord.cliente                    as codigo_cliente,'
      '       cli.nombre_comercial           as nombre_cliente,'
      '       ord.s_referencia               as pedido_cliente,'
      '       ord.articulo                   as etiqueta,'
      '       ord.titulo                     as nombre_etiqueta,'
      '       ord.cantidad                   as cantidad,'
      '       art.z_ancho                    as ancho,'
      '       art.z_avance                   as avance,'
      '       prn.descripcion                as impresora,'
      '       art.z_barniz                   as barnizar,'
      '       bar.descripcion                as tipo_barniz,'
      '       art.estampacion                as estampar,'
      '       est.descripcion                as tipo_estampado,'
      '       emaq.descripcion               as maquina_estampadora,'
      '       art.ancho_film_estamp          as ancho_film,'
      '       art.reimpresion                as reimprimir,'
      '       rmaq.descripcion               as maquina_reimpresora,'
      '       pap.descripcion                as papel,'
      '       art.z_troqueles                as troquel,'
      '       adh.descripcion                as adhesivo,'
      '       ptr.pos_ancho                  as x,'
      '       ptr.pos_avance                 as y,'
      '       sil.descripcion                as siliconado,'
      '       cil.descripcion                as desarrollo,'
      '       cil.codigo                     as cilindro,'
      '       pro.nombre_comercial           as nombre_proveedor,'
      '       art.fotograbado                as fotograbado,'
      '       pos.descripcion                as posicion_texto,'
      '       art.z_ancho_bobina             as ancho_bobina,'
      '       art.observaciones_etiq         as observaciones_etiqueta,'
      '       ord.notas                      as observaciones_pedido,'
      '       art.z_etiquetas_x_rollo        as etiquetas_por_rollo,'
      '       vmaq.descripcion               as maquina_verificadora,'
      '       art.z_diametro_interior        as diametro_interior,'
      '       art.num_verificacion           as numero_verificacion,'
      '       art.z_diametro_exterior        as diametro_exterior,'
      '       eti.descripcion                as etiquetado,'
      '       art.z_etiquetas_al_ancho       as etiquetas_al_ancho,'
      '       caj.descripcion                as modelo_caja,'
      '       art.etiqueta_x_caja            as etiquetas_por_caja,'
      '       dir.dir_completa               as direccion_entrega,'
      '       ord.precio                     as precio_mil,'
      '       ord.fecha_fabrica              as fecha_fabricacion,'
      '       ord.gtos_iniciales             as varios,'
      '       imp.descripcion                as impresion,'
      '       ord.pedido                     as pedido_delfos,'
      '       estad.descripcion              as estado,'
      '       loc.titulo                     as poblacion,'
      '       loc.codigo_postal              as poblacion_cp'
      
        'from z_ges_ordprod_c                                            ' +
        '             ord'
      
        '  left join sys_terceros                                        ' +
        '             cli'
      '    on (ord.tercero=cli.tercero)'
      
        '  left join z_art_articulos_ficha_tecnica                       ' +
        '             art'
      '    on (art.articulo=ord.articulo) and (art.empresa=ord.empresa)'
      
        '  left join emp_proveedores                                     ' +
        '             emp'
      '    on (art.proveedor_papel=emp.proveedor and'
      '        art.empresa=emp.empresa)'
      
        '  left join sys_terceros                                        ' +
        '             pro'
      '    on (emp.tercero=pro.tercero)'
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             bar'
      
        '    on (bar.tipo_aux=art.tipo_aux_barniz and                    ' +
        '      '
      '        bar.codigo=art.codigo_barniz)'
      
        ' left join z_emp_maquinas                                       ' +
        '             prn                                         '
      '    on (prn.empresa=art.empresa and'
      
        '        prn.maquina=art.z_maquinas)                             ' +
        '      '
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             est                               '
      
        '    on (est.tipo_aux=art.tipo_aux_estampacion and               ' +
        '      '
      
        '        est.codigo=art.codigo_estampacion)                      ' +
        '      '
      
        '  left join z_emp_maquinas                                      ' +
        '            emaq                                       '
      
        '    on (emaq.empresa=art.empresa and                            ' +
        '      '
      '        emaq.maquina=art.maquina_estampacion)'
      
        '  left join z_emp_maquinas                                      ' +
        '            rmaq'
      '    on (rmaq.empresa=art.empresa and'
      '        rmaq.maquina=art.maquina_reimpresora)'
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             pap'
      '    on (pap.tipo_aux=art.z_tipo_aux_material and'
      '        pap.codigo=art.z_codigo_material)'
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             adh'
      '    on (adh.tipo_aux=art.z_tipo_aux_adhesivo and'
      '        adh.codigo=art.z_codigo_adhesivo)'
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             pos'
      '    on (pos.tipo_aux=art.z_tipo_aux_posicion_salida and'
      '        pos.codigo=art.z_codigo_posicion_salida)'
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             sil'
      '    on (sil.tipo_aux=art.z_tipo_aux_siliconado and'
      '        sil.codigo=art.z_codigo_siliconado)'
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             cil'
      '    on (cil.tipo_aux=art.tipo_aux_cilindro and'
      '        cil.codigo=art.codigo_cilindro)'
      
        '  left join z_emp_maquinas                                      ' +
        '            vmaq'
      '    on (vmaq.empresa=art.empresa and'
      '        vmaq.maquina=art.maquina_verificacion)'
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             caj'
      '    on (caj.tipo_aux=art.tipo_aux_modelocaja and'
      '        caj.codigo=art.codigo_modelocaja)'
      
        '  left join emp_troqueles                                       ' +
        '           ptr'
      '    on (ptr.troquel=art.z_troqueles)'
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             eti'
      '    on (eti.tipo_aux=art.tipo_aux_tipoetiq and'
      '        eti.codigo=art.codigo_tipoetiq)'
      
        '  left join sys_terceros_direcciones                            ' +
        '             dir'
      '    on (dir.tercero=ord.tercero and'
      '        dir.direccion=ord.direc_entr)'
      
        '  left join sys_localidades                                     ' +
        '             loc'
      '    on (dir.dir_localidad = loc.localidad)'
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             imp'
      '    on (imp.tipo_aux=art.z_tipo_aux_tipo_impresion and'
      '        imp.codigo=art.z_codigo_tipo_impresion)'
      
        '  left join z_sys_estado_ordf                                   ' +
        '             estad'
      '    on (ord.estado = estad.estado)'
      ''
      '')
    UniDirectional = False
    AfterScroll = qDetailsAfterScroll
    Left = 318
    Top = 72
    object qDetailsEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object qDetailsORDEN_FABRICACION: TIntegerField
      DisplayLabel = 'Ord. Fab.'
      FieldName = 'ORDEN_FABRICACION'
    end
    object qDetailsFECHA_RECEPCION: TDateTimeField
      DisplayLabel = 'Fecha Recep.'
      FieldName = 'FECHA_RECEPCION'
    end
    object qDetailsFECHA_ENTREGA: TDateTimeField
      DisplayLabel = 'Fec. Ent.'
      FieldName = 'FECHA_ENTREGA'
    end
    object qDetailsCODIGO_CLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CODIGO_CLIENTE'
    end
    object qDetailsNOMBRE_CLIENTE: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'NOMBRE_CLIENTE'
      Size = 60
    end
    object qDetailsPEDIDO_CLIENTE: TFIBStringField
      DisplayLabel = 'Ped. Cli.'
      FieldName = 'PEDIDO_CLIENTE'
    end
    object qDetailsETIQUETA: TFIBStringField
      DisplayLabel = 'Etiqueta'
      FieldName = 'ETIQUETA'
      Size = 15
    end
    object qDetailsNOMBRE_ETIQUETA: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'NOMBRE_ETIQUETA'
      Size = 60
    end
    object qDetailsCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object qDetailsANCHO: TIntegerField
      DisplayLabel = 'Ancho'
      FieldName = 'ANCHO'
    end
    object qDetailsAVANCE: TIntegerField
      DisplayLabel = 'Avance'
      FieldName = 'AVANCE'
    end
    object qDetailsIMPRESORA: TFIBStringField
      DisplayLabel = 'Impresora'
      FieldName = 'IMPRESORA'
      Size = 40
    end
    object qDetailsBARNIZAR: TIntegerField
      DisplayLabel = 'Barnizar'
      FieldName = 'BARNIZAR'
    end
    object qDetailsTIPO_BARNIZ: TFIBStringField
      DisplayLabel = 'Tipo Barniz'
      FieldName = 'TIPO_BARNIZ'
      Size = 40
    end
    object qDetailsESTAMPAR: TIntegerField
      DisplayLabel = 'Estampar'
      FieldName = 'ESTAMPAR'
    end
    object qDetailsTIPO_ESTAMPADO: TFIBStringField
      DisplayLabel = 'Tipo Estampado'
      FieldName = 'TIPO_ESTAMPADO'
      Size = 40
    end
    object qDetailsMAQUINA_ESTAMPADORA: TFIBStringField
      DisplayLabel = 'Maq. Estampadora'
      FieldName = 'MAQUINA_ESTAMPADORA'
      Size = 40
    end
    object qDetailsANCHO_FILM: TIntegerField
      DisplayLabel = 'Ancho Film'
      FieldName = 'ANCHO_FILM'
    end
    object qDetailsREIMPRIMIR: TIntegerField
      DisplayLabel = 'Reimprimir'
      FieldName = 'REIMPRIMIR'
    end
    object qDetailsMAQUINA_REIMPRESORA: TFIBStringField
      DisplayLabel = 'Maq. Reimp.'
      FieldName = 'MAQUINA_REIMPRESORA'
      Size = 40
    end
    object qDetailsPAPEL: TFIBStringField
      DisplayLabel = 'Papel'
      FieldName = 'PAPEL'
      Size = 40
    end
    object qDetailsTROQUEL: TIntegerField
      DisplayLabel = 'Troquel'
      FieldName = 'TROQUEL'
    end
    object qDetailsADHESIVO: TFIBStringField
      DisplayLabel = 'Adhesivo'
      FieldName = 'ADHESIVO'
      Size = 40
    end
    object qDetailsX: TIntegerField
      DisplayLabel = 'X'
      FieldName = 'X'
    end
    object qDetailsY: TIntegerField
      DisplayLabel = 'Y'
      FieldName = 'Y'
    end
    object qDetailsSILICONADO: TFIBStringField
      DisplayLabel = 'Siliconado'
      FieldName = 'SILICONADO'
      Size = 40
    end
    object qDetailsDESARROLLO: TFIBStringField
      DisplayLabel = 'Desarrollo'
      FieldName = 'DESARROLLO'
      Size = 40
    end
    object qDetailsCILINDRO: TFIBStringField
      DisplayLabel = 'Cilindro'
      FieldName = 'CILINDRO'
      Size = 8
    end
    object qDetailsNOMBRE_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'NOMBRE_PROVEEDOR'
      Size = 60
    end
    object qDetailsFOTOGRABADO: TFIBStringField
      DisplayLabel = 'Fotograbado'
      FieldName = 'FOTOGRABADO'
      Size = 15
    end
    object qDetailsPOSICION_TEXTO: TFIBStringField
      DisplayLabel = 'Pos. Texto'
      FieldName = 'POSICION_TEXTO'
      Size = 40
    end
    object qDetailsANCHO_BOBINA: TIntegerField
      DisplayLabel = 'Ancho Bobina'
      FieldName = 'ANCHO_BOBINA'
    end
    object qDetailsOBSERVACIONES_ETIQUETA: TBlobField
      DisplayLabel = 'Notas Etiq.'
      FieldName = 'OBSERVACIONES_ETIQUETA'
      Size = 8
    end
    object qDetailsOBSERVACIONES_PEDIDO: TBlobField
      DisplayLabel = 'Notas Ped.'
      FieldName = 'OBSERVACIONES_PEDIDO'
      Size = 8
    end
    object qDetailsETIQUETAS_POR_ROLLO: TIntegerField
      DisplayLabel = 'Etiq. x Rollo'
      FieldName = 'ETIQUETAS_POR_ROLLO'
    end
    object qDetailsMAQUINA_VERIFICADORA: TFIBStringField
      DisplayLabel = 'Maq. Verificadora'
      FieldName = 'MAQUINA_VERIFICADORA'
      Size = 40
    end
    object qDetailsDIAMETRO_INTERIOR: TIntegerField
      DisplayLabel = 'Diam. Int.'
      FieldName = 'DIAMETRO_INTERIOR'
    end
    object qDetailsDIAMETRO_EXTERIOR: TIntegerField
      DisplayLabel = 'Diam. Ext.'
      FieldName = 'DIAMETRO_EXTERIOR'
    end
    object qDetailsETIQUETADO: TFIBStringField
      DisplayLabel = 'Etiquetado'
      FieldName = 'ETIQUETADO'
      Size = 40
    end
    object qDetailsETIQUETAS_AL_ANCHO: TIntegerField
      DisplayLabel = 'Etiq. Ancho'
      FieldName = 'ETIQUETAS_AL_ANCHO'
    end
    object qDetailsMODELO_CAJA: TFIBStringField
      DisplayLabel = 'Mod. Caja'
      FieldName = 'MODELO_CAJA'
      Size = 40
    end
    object qDetailsETIQUETAS_POR_CAJA: TIntegerField
      DisplayLabel = 'Etiq. x Caja'
      FieldName = 'ETIQUETAS_POR_CAJA'
    end
    object qDetailsDIRECCION_ENTREGA: TFIBStringField
      DisplayLabel = 'Dir. Entrega'
      FieldName = 'DIRECCION_ENTREGA'
      Size = 69
    end
    object qDetailsPRECIO_MIL: TFloatField
      DisplayLabel = 'Precio Mil.'
      FieldName = 'PRECIO_MIL'
    end
    object qDetailsFECHA_FABRICACION: TDateTimeField
      DisplayLabel = 'Fec. Fabricacion'
      FieldName = 'FECHA_FABRICACION'
    end
    object qDetailsVARIOS: TFloatField
      DisplayLabel = 'Varios'
      FieldName = 'VARIOS'
    end
    object qDetailsIMPRESION: TFIBStringField
      DisplayLabel = 'Impresion'
      FieldName = 'IMPRESION'
      Size = 40
    end
    object qDetailsPEDIDO_DELFOS: TIntegerField
      DisplayLabel = 'Ped. Delfos'
      FieldName = 'PEDIDO_DELFOS'
    end
    object qDetailsESTADO: TFIBStringField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
      Size = 40
    end
    object qDetailsPOBLACION: TFIBStringField
      DisplayLabel = 'Poblacion'
      FieldName = 'POBLACION'
      Size = 40
    end
    object qDetailsPOBLACION_CP: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'POBLACION_CP'
      Size = 10
    end
    object qDetailsNUMERO_VERIFICACION: TFIBStringField
      DisplayLabel = 'Nro. Verif.'
      FieldName = 'NUMERO_VERIFICACION'
      Size = 15
    end
  end
  object dsDetails: TDataSource
    DataSet = qDetails
    Left = 318
    Top = 129
  end
  object DatailData: TfrDBDataSet
    DataSource = dsDetails
    Left = 318
    Top = 186
  end
  object dsxUntilClient: TDataSource
    DataSet = xUntilClient
    Left = 140
    Top = 179
  end
  object dsxFromClient: TDataSource
    DataSet = xFromClient
    Left = 140
    Top = 125
  end
  object xFromClient: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT nombre_comercial from ver_clientes_cuentas'
      '  where empresa   = :empresa and'
      '        ejercicio = :ejercicio and'
      '        canal     = :canal and'
      '        cliente   = :cliente')
    UniDirectional = False
    Left = 36
    Top = 124
    object xFromClientNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nomb. Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
  end
  object xUntilClient: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT nombre_comercial from ver_clientes_cuentas'
      '  where empresa   = :empresa and'
      '        ejercicio = :ejercicio and'
      '        canal     = :canal and'
      '        cliente   = :cliente')
    UniDirectional = False
    Left = 36
    Top = 179
    object xUntilClientNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nomb. Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
  end
  object dsxUntilLabel: TDataSource
    DataSet = xUntilLabel
    Left = 140
    Top = 295
  end
  object dsxFromLabel: TDataSource
    DataSet = xFromLabel
    Left = 140
    Top = 241
  end
  object xFromLabel: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo_largo as titulo from art_articulos'
      '  where empresa  = :empresa  and'
      '        articulo = :articulo')
    UniDirectional = False
    Left = 36
    Top = 240
    object xFromLabelTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
  end
  object xUntilLabel: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo_largo as titulo from art_articulos'
      '  where empresa  = :empresa  and'
      '        articulo = :articulo')
    UniDirectional = False
    Left = 36
    Top = 295
    object xUntilLabelTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
  end
  object qTexts: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select txt.cod_art_texto    as linea,'
      '       txt.texto            as texto,'
      '       col.descripcion      as color,'
      '       txt.pantone          as pantone,'
      '       ani.descripcion      as anilox,'
      '       txt.cuerpo_impresion as posicion,'
      '       txt.comp_pantone     as composicion'
      
        'from z_art_articulos_textos_etiq                                ' +
        '             txt'
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             col'
      '    on (col.tipo_aux=txt.tipo_aux_color and'
      '        col.codigo=txt.codigo_color)'
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             ani'
      '    on (ani.tipo_aux=txt.tipo_aux_anilox and'
      '        ani.codigo=txt.codigo_anilox)'
      'where'
      '  articulo=:etiqueta and'
      '  empresa=:empresa')
    UniDirectional = False
    DataSource = dsDetails
    Left = 396
    Top = 73
  end
  object dsTexts: TDataSource
    DataSet = qTexts
    Left = 396
    Top = 130
  end
  object TextsData: TfrDBDataSet
    DataSource = dsTexts
    Left = 396
    Top = 188
  end
  object zzzSQLMemo: TQuery
    SQL.Strings = (
      'select ord.empresa                    as empresa,'
      
        '       ord.rig                        as orden_fabricacion,     ' +
        '      '
      '       ord.fecha_emision              as fecha_recepcion,'
      '       ord.fecha_entrega              as fecha_entrega,'
      '       ord.cliente                    as codigo_cliente,'
      '       cli.nombre_comercial           as nombre_cliente,'
      '       ord.s_referencia               as pedido_cliente,'
      '       ord.articulo                   as etiqueta,'
      '       ord.titulo                     as nombre_etiqueta,'
      '       ord.cantidad                   as cantidad,'
      '       art.z_ancho                    as ancho,'
      '       art.z_avance                   as avance,'
      '       prn.descripcion                as impresora,'
      '       art.z_barniz                   as barnizar,'
      '       bar.descripcion                as tipo_barniz,'
      '       art.estampacion                as estampar,'
      '       est.descripcion                as tipo_estampado,'
      '       emaq.descripcion               as maquina_estampadora,'
      '       art.ancho_film_estamp          as ancho_film,'
      '       art.reimpresion                as reimprimir,'
      '       rmaq.descripcion               as maquina_reimpresora,'
      '       pap.descripcion                as papel,'
      '       art.z_troqueles                as troquel,'
      '       adh.descripcion                as adhesivo,'
      '       ptr.pos_ancho                  as x,'
      '       ptr.pos_avance                 as y,'
      '       sil.descripcion                as siliconado,'
      '       cil.descripcion                as desarrollo,'
      '       cil.codigo                     as cilindro,'
      '       pro.nombre_comercial           as nombre_proveedor,'
      '       art.fotograbado                as fotograbado,'
      '       pos.descripcion                as posicion_texto,'
      '       art.z_ancho_bobina             as ancho_bobina,'
      '       art.observaciones_etiq         as observaciones_etiqueta,'
      '       ord.notas                      as observaciones_pedido,'
      '       art.z_etiquetas_x_rollo        as etiquetas_por_rollo,'
      '       vmaq.descripcion               as maquina_verificadora,'
      '       art.z_diametro_interior        as diametro_interior,'
      '       art.num_verificacion           as numero_verificacion,'
      '       art.z_diametro_exterior        as diametro_exterior,'
      '       eti.descripcion                as etiquetado,'
      '       art.z_etiquetas_al_ancho       as etiquetas_al_ancho,'
      '       caj.descripcion                as modelo_caja,'
      '       art.etiqueta_x_caja            as etiquetas_por_caja,'
      '       dir.dir_completa               as direccion_entrega,'
      '       ord.precio                     as precio_mil,'
      '       ord.fecha_fabrica              as fecha_fabricacion,'
      '       ord.gtos_iniciales             as varios,'
      '       imp.descripcion                as impresion,'
      '       ord.pedido                     as pedido_delfos,'
      '       estad.descripcion              as estado,'
      '       loc.titulo                     as poblacion,'
      '       loc.codigo_postal              as poblacion_cp'
      
        'from z_ges_ordprod_c                                            ' +
        '             ord'
      
        '  left join sys_terceros                                        ' +
        '             cli'
      '    on (ord.tercero=cli.tercero)'
      
        '  left join z_art_articulos_ficha_tecnica                       ' +
        '             art'
      '    on (art.articulo=ord.articulo) and (art.empresa=ord.empresa)'
      
        '  left join emp_proveedores                                     ' +
        '             emp'
      '    on (art.proveedor_papel=emp.proveedor and'
      '        art.empresa=emp.empresa)'
      
        '  left join sys_terceros                                        ' +
        '             pro'
      '    on (emp.tercero=pro.tercero)'
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             bar                               '
      
        '    on (bar.tipo_aux=art.tipo_aux_barniz and                    ' +
        '      '
      
        '        bar.codigo=art.codigo_barniz)                           ' +
        '      '
      
        ' left join z_emp_maquinas                                       ' +
        '             prn                                         '
      
        '    on (prn.empresa=art.empresa and                             ' +
        '      '
      
        '        prn.maquina=art.z_maquinas)                             ' +
        '      '
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             est                               '
      
        '    on (est.tipo_aux=art.tipo_aux_estampacion and               ' +
        '      '
      
        '        est.codigo=art.codigo_estampacion)                      ' +
        '      '
      
        '  left join z_emp_maquinas                                      ' +
        '            emaq                                       '
      
        '    on (emaq.empresa=art.empresa and                            ' +
        '      '
      
        '        emaq.maquina=art.maquina_estampacion)                   ' +
        '      '
      
        '  left join z_emp_maquinas                                      ' +
        '            rmaq                                       '
      
        '    on (rmaq.empresa=art.empresa and                            ' +
        '      '
      
        '        rmaq.maquina=art.maquina_reimpresora)                   ' +
        '      '
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             pap'
      
        '    on (pap.tipo_aux=art.z_tipo_aux_material and                ' +
        '      '
      
        '        pap.codigo=art.z_codigo_material)                       ' +
        '      '
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             adh                               '
      '    on (adh.tipo_aux=art.z_tipo_aux_adhesivo and'
      '        adh.codigo=art.z_codigo_adhesivo)'
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             pos                               '
      '    on (pos.tipo_aux=art.z_tipo_aux_posicion_salida and'
      '        pos.codigo=art.z_codigo_posicion_salida)'
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             sil                               '
      
        '    on (sil.tipo_aux=art.z_tipo_aux_siliconado and              ' +
        '        '
      '        sil.codigo=art.z_codigo_siliconado)'
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             cil                               '
      
        '    on (cil.tipo_aux=art.tipo_aux_cilindro and                  ' +
        '    '
      '        cil.codigo=art.codigo_cilindro)'
      
        '  left join z_emp_maquinas                                      ' +
        '            vmaq                                       '
      
        '    on (vmaq.empresa=art.empresa and                            ' +
        '      '
      
        '        vmaq.maquina=art.maquina_verificacion)                  ' +
        '       '
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             caj                               '
      
        '    on (caj.tipo_aux=art.tipo_aux_modelocaja and                ' +
        '      '
      '        caj.codigo=art.codigo_modelocaja)'
      
        '  left join emp_troqueles                                       ' +
        '           ptr'
      '    on (ptr.troquel=art.z_troqueles)'
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             eti'
      
        '    on (eti.tipo_aux=art.tipo_aux_tipoetiq and                  ' +
        '    '
      '        eti.codigo=art.codigo_tipoetiq)'
      
        '  left join sys_terceros_direcciones                            ' +
        '             dir'
      '    on (dir.tercero=ord.tercero and'
      '        dir.direccion=ord.direc_entr)'
      
        '  left join sys_localidades                                     ' +
        '             loc'
      '    on (dir.dir_localidad = loc.localidad)'
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             imp'
      '    on (imp.tipo_aux=art.z_tipo_aux_tipo_impresion and'
      '        imp.codigo=art.z_codigo_tipo_impresion)'
      
        '  left join z_sys_estado_ordf                                   ' +
        '             estad'
      '    on (ord.estado = estad.estado)'
      ''
      '')
    Left = 404
    Top = 268
  end
  object zzzColors: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select count(distinct(codigo_color))'
      
        'from z_art_articulos_textos_etiq                                ' +
        '             txt'
      'where'
      '  articulo=:etiqueta and'
      '  empresa=:empresa')
    UniDirectional = False
    DataSource = dsDetails
    Left = 349
    Top = 284
    object zzzColorsCOUNT: TIntegerField
      DisplayLabel = 'Cantidad'
      FieldName = 'COUNT'
    end
  end
  object qTotal: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO ')
    SelectSQL.Strings = (
      'select sum(cantidad*precio+gtos_iniciales) as Total'
      
        'from z_ges_ordprod_c                                            ' +
        '             ord'
      
        '  left join sys_terceros                                        ' +
        '             cli'
      '    on (ord.tercero=cli.tercero)'
      
        '  left join z_art_articulos_ficha_tecnica                       ' +
        '             art'
      '    on (art.articulo=ord.articulo) and (art.empresa=ord.empresa)'
      
        '  left join emp_proveedores                                     ' +
        '             emp'
      '    on (art.proveedor_papel=emp.proveedor and'
      '        art.empresa=emp.empresa)'
      
        '  left join sys_terceros                                        ' +
        '             pro'
      '    on (emp.tercero=pro.tercero)'
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             bar                               '
      
        '    on (bar.tipo_aux=art.tipo_aux_barniz and                    ' +
        '      '
      
        '        bar.codigo=art.codigo_barniz)                           ' +
        '      '
      
        ' left join z_emp_maquinas                                       ' +
        '             prn                                         '
      
        '    on (prn.empresa=art.empresa and                             ' +
        '      '
      
        '        prn.maquina=art.z_maquinas)                             ' +
        '      '
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             est                               '
      
        '    on (est.tipo_aux=art.tipo_aux_estampacion and               ' +
        '      '
      
        '        est.codigo=art.codigo_estampacion)                      ' +
        '      '
      
        '  left join z_emp_maquinas                                      ' +
        '            emaq                                       '
      
        '    on (emaq.empresa=art.empresa and                            ' +
        '      '
      
        '        emaq.maquina=art.maquina_estampacion)                   ' +
        '      '
      
        '  left join z_emp_maquinas                                      ' +
        '            rmaq                                       '
      
        '    on (rmaq.empresa=art.empresa and                            ' +
        '      '
      
        '        rmaq.maquina=art.maquina_reimpresora)                   ' +
        '      '
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             pap                               '
      
        '    on (pap.tipo_aux=art.z_tipo_aux_material and                ' +
        '      '
      
        '        pap.codigo=art.z_codigo_material)                       ' +
        '      '
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             adh                               '
      
        '    on (adh.tipo_aux=art.z_tipo_aux_adhesivo and                ' +
        '      '
      
        '        adh.codigo=art.z_codigo_adhesivo)                       ' +
        '      '
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             pos                               '
      
        '    on (pos.tipo_aux=art.z_tipo_aux_posicion_salida and         ' +
        '             '
      '        pos.codigo=art.z_codigo_posicion_salida)'
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             sil                               '
      
        '    on (sil.tipo_aux=art.z_tipo_aux_siliconado and              ' +
        '        '
      '        sil.codigo=art.z_codigo_siliconado)'
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             cil                               '
      
        '    on (cil.tipo_aux=art.tipo_aux_cilindro and                  ' +
        '    '
      '        cil.codigo=art.codigo_cilindro)'
      
        '  left join z_emp_maquinas                                      ' +
        '            vmaq                                       '
      
        '    on (vmaq.empresa=art.empresa and                            ' +
        '      '
      
        '        vmaq.maquina=art.maquina_verificacion)                  ' +
        '       '
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             caj                               '
      
        '    on (caj.tipo_aux=art.tipo_aux_modelocaja and                ' +
        '      '
      '        caj.codigo=art.codigo_modelocaja)'
      
        '  left join emp_troqueles                                       ' +
        '           ptr'
      '    on (ptr.troquel=art.z_troqueles)'
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             eti                               '
      
        '    on (eti.tipo_aux=art.tipo_aux_tipoetiq and                  ' +
        '    '
      '        eti.codigo=art.codigo_tipoetiq)'
      
        '  left join sys_terceros_direcciones                            ' +
        '             dir'
      '    on (dir.tercero=ord.tercero and '
      
        '        dir.direccion=ord.direc_entr)                           ' +
        '          '
      ''
      ''
      '')
    UniDirectional = False
    AfterScroll = qDetailsAfterScroll
    Left = 240
    Top = 73
    object qTotalTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
  end
  object dsTotal: TDataSource
    DataSet = qTotal
    Left = 240
    Top = 130
  end
  object TotalData: TfrDBDataSet
    DataSource = dsTotal
    Left = 240
    Top = 188
  end
  object qSubtotal: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ART_ARTICULOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  ARTICULO=?ARTICULO ')
    SelectSQL.Strings = (
      'select sum(cantidad*precio+gtos_iniciales) as Total'
      
        'from z_ges_ordprod_c                                            ' +
        '             ord'
      
        '  left join sys_terceros                                        ' +
        '             cli'
      '    on (ord.tercero=cli.tercero)'
      
        '  left join z_art_articulos_ficha_tecnica                       ' +
        '             art'
      '    on (art.articulo=ord.articulo) and (art.empresa=ord.empresa)'
      
        '  left join emp_proveedores                                     ' +
        '             emp'
      '    on (art.proveedor_papel=emp.proveedor and'
      '        art.empresa=emp.empresa)'
      
        '  left join sys_terceros                                        ' +
        '             pro'
      '    on (emp.tercero=pro.tercero)'
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             bar                               '
      
        '    on (bar.tipo_aux=art.tipo_aux_barniz and                    ' +
        '      '
      
        '        bar.codigo=art.codigo_barniz)                           ' +
        '      '
      
        ' left join z_emp_maquinas                                       ' +
        '             prn                                         '
      
        '    on (prn.empresa=art.empresa and                             ' +
        '      '
      
        '        prn.maquina=art.z_maquinas)                             ' +
        '      '
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             est                               '
      
        '    on (est.tipo_aux=art.tipo_aux_estampacion and               ' +
        '      '
      
        '        est.codigo=art.codigo_estampacion)                      ' +
        '      '
      
        '  left join z_emp_maquinas                                      ' +
        '            emaq                                       '
      
        '    on (emaq.empresa=art.empresa and                            ' +
        '      '
      
        '        emaq.maquina=art.maquina_estampacion)                   ' +
        '      '
      
        '  left join z_emp_maquinas                                      ' +
        '            rmaq                                       '
      
        '    on (rmaq.empresa=art.empresa and                            ' +
        '      '
      
        '        rmaq.maquina=art.maquina_reimpresora)                   ' +
        '      '
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             pap                               '
      
        '    on (pap.tipo_aux=art.z_tipo_aux_material and                ' +
        '      '
      
        '        pap.codigo=art.z_codigo_material)                       ' +
        '      '
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             adh                               '
      
        '    on (adh.tipo_aux=art.z_tipo_aux_adhesivo and                ' +
        '      '
      
        '        adh.codigo=art.z_codigo_adhesivo)                       ' +
        '      '
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             pos                               '
      
        '    on (pos.tipo_aux=art.z_tipo_aux_posicion_salida and         ' +
        '             '
      '        pos.codigo=art.z_codigo_posicion_salida)'
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             sil                               '
      
        '    on (sil.tipo_aux=art.z_tipo_aux_siliconado and              ' +
        '        '
      '        sil.codigo=art.z_codigo_siliconado)'
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             cil                               '
      
        '    on (cil.tipo_aux=art.tipo_aux_cilindro and                  ' +
        '    '
      '        cil.codigo=art.codigo_cilindro)'
      
        '  left join z_emp_maquinas                                      ' +
        '            vmaq                                       '
      
        '    on (vmaq.empresa=art.empresa and                            ' +
        '      '
      
        '        vmaq.maquina=art.maquina_verificacion)                  ' +
        '       '
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             caj                               '
      
        '    on (caj.tipo_aux=art.tipo_aux_modelocaja and                ' +
        '      '
      '        caj.codigo=art.codigo_modelocaja)'
      
        '  left join emp_troqueles                                       ' +
        '           ptr'
      '    on (ptr.troquel=art.z_troqueles)'
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             eti                               '
      
        '    on (eti.tipo_aux=art.tipo_aux_tipoetiq and                  ' +
        '    '
      '        eti.codigo=art.codigo_tipoetiq)'
      
        '  left join sys_terceros_direcciones                            ' +
        '             dir'
      '    on (dir.tercero=ord.tercero and '
      
        '        dir.direccion=ord.direc_entr)                           ' +
        '          '
      ''
      ''
      ''
      '')
    UniDirectional = False
    AfterScroll = qDetailsAfterScroll
    Left = 472
    Top = 73
    object qSubtotalTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'TOTAL'
    end
  end
  object dsSubTotal: TDataSource
    DataSet = qSubtotal
    Left = 472
    Top = 130
  end
  object SubtotalData: TfrDBDataSet
    DataSource = dsSubTotal
    Left = 472
    Top = 188
  end
  object zzzSQLTotalMemo: TQuery
    SQL.Strings = (
      'select sum(cantidad*precio+gtos_iniciales) as Total'
      
        'from z_ges_ordprod_c                                            ' +
        '             ord'
      
        '  left join sys_terceros                                        ' +
        '             cli'
      '    on (ord.tercero=cli.tercero)'
      
        '  left join z_art_articulos_ficha_tecnica                       ' +
        '             art'
      '    on (art.articulo=ord.articulo) and (art.empresa=ord.empresa)'
      
        '  left join emp_proveedores                                     ' +
        '             emp'
      '    on (art.proveedor_papel=emp.proveedor and'
      '        art.empresa=emp.empresa)'
      
        '  left join sys_terceros                                        ' +
        '             pro'
      '    on (emp.tercero=pro.tercero)'
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             bar                               '
      
        '    on (bar.tipo_aux=art.tipo_aux_barniz and                    ' +
        '      '
      
        '        bar.codigo=art.codigo_barniz)                           ' +
        '      '
      
        ' left join z_emp_maquinas                                       ' +
        '             prn                                         '
      
        '    on (prn.empresa=art.empresa and                             ' +
        '      '
      
        '        prn.maquina=art.z_maquinas)                             ' +
        '      '
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             est                               '
      
        '    on (est.tipo_aux=art.tipo_aux_estampacion and               ' +
        '      '
      
        '        est.codigo=art.codigo_estampacion)                      ' +
        '      '
      
        '  left join z_emp_maquinas                                      ' +
        '            emaq                                       '
      
        '    on (emaq.empresa=art.empresa and                            ' +
        '      '
      
        '        emaq.maquina=art.maquina_estampacion)                   ' +
        '      '
      
        '  left join z_emp_maquinas                                      ' +
        '            rmaq                                       '
      
        '    on (rmaq.empresa=art.empresa and                            ' +
        '      '
      
        '        rmaq.maquina=art.maquina_reimpresora)                   ' +
        '      '
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             pap                               '
      
        '    on (pap.tipo_aux=art.z_tipo_aux_material and                ' +
        '      '
      
        '        pap.codigo=art.z_codigo_material)                       ' +
        '      '
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             adh                               '
      
        '    on (adh.tipo_aux=art.z_tipo_aux_adhesivo and                ' +
        '      '
      
        '        adh.codigo=art.z_codigo_adhesivo)                       ' +
        '      '
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             pos                               '
      
        '    on (pos.tipo_aux=art.z_tipo_aux_posicion_salida and         ' +
        '             '
      '        pos.codigo=art.z_codigo_posicion_salida)'
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             sil                               '
      
        '    on (sil.tipo_aux=art.z_tipo_aux_siliconado and              ' +
        '        '
      '        sil.codigo=art.z_codigo_siliconado)'
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             cil                               '
      
        '    on (cil.tipo_aux=art.tipo_aux_cilindro and                  ' +
        '    '
      '        cil.codigo=art.codigo_cilindro)'
      
        '  left join z_emp_maquinas                                      ' +
        '            vmaq                                       '
      
        '    on (vmaq.empresa=art.empresa and                            ' +
        '      '
      
        '        vmaq.maquina=art.maquina_verificacion)                  ' +
        '       '
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             caj                               '
      
        '    on (caj.tipo_aux=art.tipo_aux_modelocaja and                ' +
        '      '
      '        caj.codigo=art.codigo_modelocaja)'
      
        '  left join emp_troqueles                                       ' +
        '           ptr'
      '    on (ptr.troquel=art.z_troqueles)'
      
        '  left join z_sys_tablas_auxiliares                             ' +
        '             eti                               '
      
        '    on (eti.tipo_aux=art.tipo_aux_tipoetiq and                  ' +
        '    '
      '        eti.codigo=art.codigo_tipoetiq)'
      
        '  left join sys_terceros_direcciones                            ' +
        '             dir'
      '    on (dir.tercero=ord.tercero and '
      
        '        dir.direccion=ord.direc_entr)                           ' +
        '          '
      ''
      '')
    Left = 456
    Top = 280
  end
end
