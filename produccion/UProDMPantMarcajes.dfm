object ProDMPantMarcajes: TProDMPantMarcajes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 344
  Top = 261
  Height = 498
  Width = 542
  object LstMarcajes: TRxMemoryData
    Active = True
    FieldDefs = <
      item
        Name = 'Imagen'
        Attributes = [faRequired]
        DataType = ftString
        Size = 60
      end
      item
        Name = 'Codigo'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Titulo'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'Notas'
        DataType = ftMemo
      end
      item
        Name = 'Horario'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'HorasTrab'
        DataType = ftString
        Size = 20
      end>
    Left = 296
    Top = 160
    object LstMarcajesImagen: TStringField
      FieldName = 'Imagen'
      Required = True
      Size = 60
    end
    object LstMarcajesCodigo: TStringField
      FieldName = 'Codigo'
    end
    object LstMarcajesTitulo: TStringField
      FieldName = 'Titulo'
    end
    object LstMarcajesNotas: TMemoField
      FieldName = 'Notas'
      BlobType = ftMemo
    end
    object LstMarcajesHorario: TStringField
      FieldName = 'Horario'
    end
    object LstMarcajesHorasTrab: TStringField
      FieldName = 'HorasTrab'
    end
  end
  object DSLstMarcajes: TDataSource
    DataSet = LstMarcajes
    Left = 392
    Top = 160
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 296
    Top = 16
  end
  object DSQMVerMarcajesOpe: TDataSource
    DataSet = QMVerMarcajesOpe
    Left = 160
    Top = 16
  end
  object xVerMarcajesOpe: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT OPE.*, TER.NOMBRE_R_SOCIAL, MAR.*, HOR.*'
      'FROM OPE_EMPLEADO OPE'
      'JOIN SYS_TERCEROS TER ON (OPE.TERCERO = TER.TERCERO)'
      'JOIN PRO_ORD_CAB_MARCA MAR ON (MAR.OPERARIO = OPE.EMPLEADO)'
      'JOIN OPE_HORARIOS HOR ON (OPE.HORARIO = HOR.HORARIO)'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'EMPLEADO = ?EMPLEADO')
    SelectSQL.Strings = (
      'SELECT OPE.*, TER.NOMBRE_R_SOCIAL, MAR.*, HOR.*'
      'FROM OPE_EMPLEADO OPE'
      'JOIN SYS_TERCEROS TER ON (OPE.TERCERO = TER.TERCERO)'
      'JOIN PRO_ORD_CAB_MARCA MAR ON (MAR.OPERARIO = OPE.EMPLEADO)'
      'JOIN OPE_HORARIOS HOR ON (OPE.HORARIO = HOR.HORARIO)'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'FECHA = ?FECHA'
      'ORDER BY EMPLEADO')
    UniDirectional = False
    DataSource = DSQMVerMarcajesOpe
    Left = 48
    Top = 64
    object xVerMarcajesOpeEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xVerMarcajesOpeEMPLEADO: TIntegerField
      DisplayLabel = 'Empleado'
      FieldName = 'EMPLEADO'
    end
    object xVerMarcajesOpeTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object xVerMarcajesOpeCATEGORIA: TFIBStringField
      DisplayLabel = 'Categoria'
      FieldName = 'CATEGORIA'
      Size = 3
    end
    object xVerMarcajesOpeCENTRO: TFIBStringField
      DisplayLabel = 'Centro'
      FieldName = 'CENTRO'
      Size = 3
    end
    object xVerMarcajesOpeDEPARTAMENTO: TFIBStringField
      DisplayLabel = 'Dpto.'
      FieldName = 'DEPARTAMENTO'
      Size = 3
    end
    object xVerMarcajesOpeSECCION: TFIBStringField
      DisplayLabel = 'Seccion'
      FieldName = 'SECCION'
      Size = 3
    end
    object xVerMarcajesOpeCALENDARIO: TIntegerField
      DisplayLabel = 'Calendario'
      FieldName = 'CALENDARIO'
    end
    object xVerMarcajesOpeN_SEGURIDAD_SOCIAL: TFIBStringField
      DisplayLabel = 'Nro. Seg. Social'
      FieldName = 'N_SEGURIDAD_SOCIAL'
      Size = 14
    end
    object xVerMarcajesOpeTIPO_CONTRATO: TFIBStringField
      DisplayLabel = 'Tipo Contrato'
      FieldName = 'TIPO_CONTRATO'
      Size = 3
    end
    object xVerMarcajesOpeINI_CONTRATO: TDateTimeField
      DisplayLabel = 'Ini. Contrato'
      FieldName = 'INI_CONTRATO'
    end
    object xVerMarcajesOpeFIN_CONTRATO: TDateTimeField
      DisplayLabel = 'Fin Contrato'
      FieldName = 'FIN_CONTRATO'
    end
    object xVerMarcajesOpeFECHA_NACIMIENTO: TDateTimeField
      DisplayLabel = 'Fec. Nacimiento'
      FieldName = 'FECHA_NACIMIENTO'
    end
    object xVerMarcajesOpeESTADO_CIVIL: TFIBStringField
      DisplayLabel = 'Estado Civil'
      FieldName = 'ESTADO_CIVIL'
      Size = 15
    end
    object xVerMarcajesOpeNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object xVerMarcajesOpeIMAGEN: TMemoField
      FieldName = 'IMAGEN'
      BlobType = ftMemo
      Size = 8
    end
    object xVerMarcajesOpeCODIGO_TARJETA: TFIBStringField
      DisplayLabel = 'Tarjeta'
      FieldName = 'CODIGO_TARJETA'
      Size = 25
    end
    object xVerMarcajesOpeUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
    object xVerMarcajesOpeRECURSO: TFIBStringField
      DisplayLabel = 'Recurso'
      FieldName = 'RECURSO'
      Size = 5
    end
    object xVerMarcajesOpeHORARIO: TFIBStringField
      DisplayLabel = 'Horario'
      FieldName = 'HORARIO'
      Size = 3
    end
    object xVerMarcajesOpeIMPUTACION: TIntegerField
      DisplayLabel = 'Imputacion'
      FieldName = 'IMPUTACION'
    end
    object xVerMarcajesOpeTIPOIMPUTACION: TIntegerField
      DisplayLabel = 'Tipo Imputacion'
      FieldName = 'TIPOIMPUTACION'
    end
    object xVerMarcajesOpeID_IMAGEN: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_IMAGEN'
    end
    object xVerMarcajesOpeTIPOTAREA: TFIBStringField
      DisplayLabel = 'Tipo Tarea'
      FieldName = 'TIPOTAREA'
      Size = 3
    end
    object xVerMarcajesOpeFORMACION_INI: TBlobField
      DisplayLabel = 'Formacion Ini.'
      FieldName = 'FORMACION_INI'
      Size = 8
    end
    object xVerMarcajesOpeEXPERIENCIA_PROF: TBlobField
      DisplayLabel = 'Experiencia Prof.'
      FieldName = 'EXPERIENCIA_PROF'
      Size = 8
    end
    object xVerMarcajesOpeNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object xVerMarcajesOpeFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xVerMarcajesOpeDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
    object xVerMarcajesOpeTIEMPO_TOT: TFloatField
      DisplayLabel = 'Tiempo Total'
      FieldName = 'TIEMPO_TOT'
    end
  end
  object DSxVerMarcajesOpe: TDataSource
    DataSet = xVerMarcajesOpe
    Left = 160
    Top = 64
  end
  object QMVerMarcajesOpe: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM OPE_EMPLEADO'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EMPLEADO=?old_EMPLEADO ')
    InsertSQL.Strings = (
      'INSERT INTO OPE_EMPLEADO'
      
        '  (N_SEGURIDAD_SOCIAL,INI_CONTRATO,FIN_CONTRATO,FECHA_NACIMIENTO' +
        ',NOTAS,IMAGEN,ID_IMAGEN,EMPLEADO,TERCERO,IMPUTACION,TIPOIMPUTACI' +
        'ON,EMPRESA,CALENDARIO,USUARIO,TIPOTAREA,CATEGORIA,CENTRO,DEPARTA' +
        'MENTO,SECCION,TIPO_CONTRATO,ESTADO_CIVIL,CODIGO_TARJETA,RECURSO,' +
        'HORARIO,FORMACION_INI,EXPERIENCIA_PROF)'
      'VALUES'
      
        '  (?N_SEGURIDAD_SOCIAL,?INI_CONTRATO,?FIN_CONTRATO,?FECHA_NACIMI' +
        'ENTO,?NOTAS,?IMAGEN,?ID_IMAGEN,?EMPLEADO,?TERCERO,?IMPUTACION,?T' +
        'IPOIMPUTACION,?EMPRESA,?CALENDARIO,?USUARIO,?TIPOTAREA,?CATEGORI' +
        'A,?CENTRO,?DEPARTAMENTO,?SECCION,?TIPO_CONTRATO,?ESTADO_CIVIL,?C' +
        'ODIGO_TARJETA,?RECURSO,?HORARIO,?FORMACION_INI,?EXPERIENCIA_PROF' +
        ')')
    RefreshSQL.Strings = (
      'SELECT OPE.*, TER.NOMBRE_R_SOCIAL, MAR.*'
      'FROM OPE_EMPLEADO OPE'
      'JOIN SYS_TERCEROS TER ON (OPE.TERCERO = TER.TERCERO)'
      'JOIN PRO_ORD_CAB_MARCA MAR ON (MAR.OPERARIO = OPE.EMPLEADO)'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EMPLEADO=?EMPLEADO ')
    SelectSQL.Strings = (
      'SELECT OPE.*, TER.NOMBRE_R_SOCIAL, MAR.*'
      'FROM OPE_EMPLEADO OPE'
      'JOIN SYS_TERCEROS TER ON (OPE.TERCERO = TER.TERCERO)'
      'JOIN PRO_ORD_CAB_MARCA MAR ON (MAR.OPERARIO = OPE.EMPLEADO)'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'FECHA = :FECHA'
      'ORDER BY EMPLEADO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE OPE_EMPLEADO'
      'SET'
      '  N_SEGURIDAD_SOCIAL=?N_SEGURIDAD_SOCIAL '
      '  ,INI_CONTRATO=?INI_CONTRATO '
      '  ,FIN_CONTRATO=?FIN_CONTRATO '
      '  ,FECHA_NACIMIENTO=?FECHA_NACIMIENTO '
      '  ,NOTAS=?NOTAS '
      '  ,IMAGEN=?IMAGEN '
      '  ,ID_IMAGEN=?ID_IMAGEN '
      '  ,TERCERO=?TERCERO '
      '  ,IMPUTACION=?IMPUTACION '
      '  ,TIPOIMPUTACION=?TIPOIMPUTACION '
      '  ,CALENDARIO=?CALENDARIO '
      '  ,USUARIO=?USUARIO '
      '  ,TIPOTAREA=?TIPOTAREA '
      '  ,CATEGORIA=?CATEGORIA '
      '  ,CENTRO=?CENTRO '
      '  ,DEPARTAMENTO=?DEPARTAMENTO '
      '  ,SECCION=?SECCION '
      '  ,TIPO_CONTRATO=?TIPO_CONTRATO '
      '  ,ESTADO_CIVIL=?ESTADO_CIVIL '
      '  ,CODIGO_TARJETA=?CODIGO_TARJETA '
      '  ,RECURSO=?RECURSO '
      '  ,HORARIO=?HORARIO '
      '  ,FORMACION_INI=?FORMACION_INI '
      '  ,EXPERIENCIA_PROF=?EXPERIENCIA_PROF '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EMPLEADO=?EMPLEADO ')
    AfterOpen = QMVerMarcajesOpeAfterOpen
    AfterScroll = QMVerMarcajesOpeAfterScroll
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EMPLEADO ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'OPE_EMPLEADO'
    UpdateTransaction = TLocal
    Left = 48
    Top = 16
    object QMVerMarcajesOpeEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMVerMarcajesOpeEMPLEADO: TIntegerField
      DisplayLabel = 'Empleado'
      FieldName = 'EMPLEADO'
    end
    object QMVerMarcajesOpeTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMVerMarcajesOpeCATEGORIA: TFIBStringField
      DisplayLabel = 'Categoria'
      FieldName = 'CATEGORIA'
      Size = 3
    end
    object QMVerMarcajesOpeCENTRO: TFIBStringField
      DisplayLabel = 'Centro'
      FieldName = 'CENTRO'
      Size = 3
    end
    object QMVerMarcajesOpeDEPARTAMENTO: TFIBStringField
      DisplayLabel = 'Dpto.'
      FieldName = 'DEPARTAMENTO'
      Size = 3
    end
    object QMVerMarcajesOpeSECCION: TFIBStringField
      DisplayLabel = 'Seccion'
      FieldName = 'SECCION'
      Size = 3
    end
    object QMVerMarcajesOpeCALENDARIO: TIntegerField
      DisplayLabel = 'Calendario'
      FieldName = 'CALENDARIO'
    end
    object QMVerMarcajesOpeN_SEGURIDAD_SOCIAL: TFIBStringField
      DisplayLabel = 'Nro. Seg. Social'
      FieldName = 'N_SEGURIDAD_SOCIAL'
      Size = 14
    end
    object QMVerMarcajesOpeTIPO_CONTRATO: TFIBStringField
      DisplayLabel = 'Tipo Contrato'
      FieldName = 'TIPO_CONTRATO'
      Size = 3
    end
    object QMVerMarcajesOpeINI_CONTRATO: TDateTimeField
      DisplayLabel = 'Ini. Contrato'
      FieldName = 'INI_CONTRATO'
    end
    object QMVerMarcajesOpeFIN_CONTRATO: TDateTimeField
      DisplayLabel = 'Fin Contrato'
      FieldName = 'FIN_CONTRATO'
    end
    object QMVerMarcajesOpeFECHA_NACIMIENTO: TDateTimeField
      DisplayLabel = 'Fec. Nacimiento'
      FieldName = 'FECHA_NACIMIENTO'
    end
    object QMVerMarcajesOpeESTADO_CIVIL: TFIBStringField
      DisplayLabel = 'Estado Civil'
      FieldName = 'ESTADO_CIVIL'
      Size = 15
    end
    object QMVerMarcajesOpeNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMVerMarcajesOpeIMAGEN: TMemoField
      FieldName = 'IMAGEN'
      BlobType = ftMemo
      Size = 8
    end
    object QMVerMarcajesOpeCODIGO_TARJETA: TFIBStringField
      DisplayLabel = 'Tarjeta'
      FieldName = 'CODIGO_TARJETA'
      Size = 25
    end
    object QMVerMarcajesOpeUSUARIO: TIntegerField
      DisplayLabel = 'Usuario'
      FieldName = 'USUARIO'
    end
    object QMVerMarcajesOpeRECURSO: TFIBStringField
      DisplayLabel = 'Recurso'
      FieldName = 'RECURSO'
      Size = 5
    end
    object QMVerMarcajesOpeHORARIO: TFIBStringField
      DisplayLabel = 'Horario'
      FieldName = 'HORARIO'
      Size = 3
    end
    object QMVerMarcajesOpeIMPUTACION: TIntegerField
      DisplayLabel = 'Imputacion'
      FieldName = 'IMPUTACION'
    end
    object QMVerMarcajesOpeTIPOIMPUTACION: TIntegerField
      DisplayLabel = 'Tipo Imputacion'
      FieldName = 'TIPOIMPUTACION'
    end
    object QMVerMarcajesOpeID_IMAGEN: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_IMAGEN'
    end
    object QMVerMarcajesOpeTIPOTAREA: TFIBStringField
      DisplayLabel = 'Tipo Tarea'
      FieldName = 'TIPOTAREA'
      Size = 3
    end
    object QMVerMarcajesOpeFORMACION_INI: TBlobField
      DisplayLabel = 'Formacion Ini.'
      FieldName = 'FORMACION_INI'
      Size = 8
    end
    object QMVerMarcajesOpeEXPERIENCIA_PROF: TBlobField
      DisplayLabel = 'Experiencia Prof.'
      FieldName = 'EXPERIENCIA_PROF'
      Size = 8
    end
    object QMVerMarcajesOpeFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMVerMarcajesOpeTIEMPO_TOT: TFloatField
      DisplayLabel = 'Tiempo Total'
      FieldName = 'TIEMPO_TOT'
    end
  end
  object SPDetalle: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM PRO_ORD_DET_MARCA DET, PRO_ORD_CAB_MARCA CAB'
      'WHERE DET.RIG=CAB.RIG '
      'AND CAB.FECHA=?FECHA'
      'AND CAB.OPERARIO=?OPERARIO'
      'AND CAB.EMPRESA=DET.EMPRESA'
      'AND CAB.SERIE=DET.SERIE'
      'AND CAB.CANAL=DET.CANAL'
      'AND CAB.EJERCICIO=DET.EJERCICIO'
      'AND CAB.TIPO=DET.TIPO')
    Transaction = TLocal
    AutoTrans = True
    Left = 296
    Top = 112
  end
  object xDetalles: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM PRO_ORD_DET_MARCA DET, PRO_ORD_CAB_MARCA CAB'
      'WHERE '
      'DET.RIG=CAB.RIG '
      'AND CAB.FECHA=?FECHA'
      'AND CAB.OPERARIO=?OPERARIO'
      'AND CAB.EMPRESA=DET.EMPRESA'
      'AND CAB.SERIE=DET.SERIE'
      'AND CAB.CANAL=DET.CANAL'
      'AND CAB.EJERCICIO=DET.EJERCICIO'
      'AND CAB.TIPO=DET.TIPO')
    UniDirectional = False
    DataSource = DSQMDetalles
    Left = 48
    Top = 256
    object xDetallesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xDetallesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xDetallesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xDetallesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xDetallesTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xDetallesRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xDetallesLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xDetallesRIG_OF: TIntegerField
      DisplayLabel = 'Ord. Prod.'
      FieldName = 'RIG_OF'
    end
    object xDetallesSUBORDEN: TIntegerField
      DisplayLabel = 'Suborden'
      FieldName = 'SUBORDEN'
    end
    object xDetallesLINEA_FASE: TIntegerField
      DisplayLabel = 'Linea Fase'
      FieldName = 'LINEA_FASE'
    end
    object xDetallesLINEA_TAREA: TIntegerField
      DisplayLabel = 'Linea Tarea'
      FieldName = 'LINEA_TAREA'
    end
    object xDetallesFECHA_PREV: TDateTimeField
      DisplayLabel = 'Fec. Prev.'
      FieldName = 'FECHA_PREV'
    end
    object xDetallesFECHA_REAL: TDateTimeField
      DisplayLabel = 'Fec. Real'
      FieldName = 'FECHA_REAL'
    end
    object xDetallesNUM_REF_SAL: TIntegerField
      DisplayLabel = 'Nro. Ref. Sal.'
      FieldName = 'NUM_REF_SAL'
    end
    object xDetallesHORA_INICIO: TFloatField
      DisplayLabel = 'Hora Ini.'
      FieldName = 'HORA_INICIO'
    end
    object xDetallesHORA_FIN: TFloatField
      DisplayLabel = 'Hora Fin'
      FieldName = 'HORA_FIN'
    end
    object xDetallesTIEMPO: TFloatField
      DisplayLabel = 'Tiempo'
      FieldName = 'TIEMPO'
    end
    object xDetallesRECURSO: TFIBStringField
      DisplayLabel = 'Recurso'
      FieldName = 'RECURSO'
      Size = 5
    end
    object xDetallesPRECIO_RECURSO: TFloatField
      DisplayLabel = 'Precio Rec.'
      FieldName = 'PRECIO_RECURSO'
    end
    object xDetallesTIPO_RECURSO: TFIBStringField
      DisplayLabel = 'Tipo Recurso'
      FieldName = 'TIPO_RECURSO'
      Size = 5
    end
    object xDetallesUNIDADES_FAB: TFloatField
      DisplayLabel = 'Uds. Fab.'
      FieldName = 'UNIDADES_FAB'
    end
    object xDetallesUNIDADES_DEFECTUOSAS: TFloatField
      DisplayLabel = 'Uds. Defecto'
      FieldName = 'UNIDADES_DEFECTUOSAS'
    end
    object xDetallesESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xDetallesNOTAS: TMemoField
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object xDetallesTOTAL_RECURSO: TFloatField
      DisplayLabel = 'Total Rec.'
      FieldName = 'TOTAL_RECURSO'
    end
    object xDetallesIDTAREA: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'IDTAREA'
    end
    object xDetallesIMPUTACION: TFIBStringField
      DisplayLabel = 'Imputacion'
      FieldName = 'IMPUTACION'
      Size = 3
    end
    object xDetallesTIEMPO_DEC: TFloatField
      DisplayLabel = 'Tiempo Dec.'
      FieldName = 'TIEMPO_DEC'
    end
    object xDetallesTIPOFASE: TFIBStringField
      DisplayLabel = 'Tipo Fase'
      FieldName = 'TIPOFASE'
      Size = 3
    end
    object xDetallesTIPOTAREA: TFIBStringField
      DisplayLabel = 'Tipo Tarea'
      FieldName = 'TIPOTAREA'
      Size = 3
    end
    object xDetallesNUEVA_TAREA: TIntegerField
      DisplayLabel = 'Nueva Tarea'
      FieldName = 'NUEVA_TAREA'
    end
    object xDetallesENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object xDetallesCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object xDetallesTIPO_MARCAJE: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_MARCAJE'
      Size = 3
    end
    object xDetallesID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object xDetallesEMPRESA1: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA1'
    end
    object xDetallesEJERCICIO1: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO1'
    end
    object xDetallesCANAL1: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL1'
    end
    object xDetallesSERIE1: TFIBStringField
      DisplayLabel = 'Serie 1'
      FieldName = 'SERIE1'
      Size = 10
    end
    object xDetallesTIPO1: TFIBStringField
      DisplayLabel = 'Tipo 1'
      FieldName = 'TIPO1'
      Size = 3
    end
    object xDetallesRIG1: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG1'
    end
    object xDetallesOPERARIO: TIntegerField
      DisplayLabel = 'Operario'
      FieldName = 'OPERARIO'
    end
    object xDetallesMAQUINA: TIntegerField
      DisplayLabel = 'Maquina'
      FieldName = 'MAQUINA'
    end
    object xDetallesPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xDetallesVARIOS: TFIBStringField
      DisplayLabel = 'Varios'
      FieldName = 'VARIOS'
      Size = 5
    end
    object xDetallesFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xDetallesTIEMPO_TOT: TFloatField
      DisplayLabel = 'Tiempo Total'
      FieldName = 'TIEMPO_TOT'
    end
    object xDetallesRIG_OFF: TIntegerField
      DisplayLabel = 'Ord. Prod.'
      FieldName = 'RIG_OFF'
    end
  end
  object DSxDetalles: TDataSource
    DataSet = xDetalles
    Left = 160
    Top = 256
  end
  object DSQMDetalles: TDataSource
    DataSet = QMDetalles
    Left = 160
    Top = 208
  end
  object QMDetalles: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_ORD_DET_MARCA'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_ORD_DET_MARCA'
      
        '  (FECHA_PREV,FECHA_REAL,PRECIO_RECURSO,UNIDADES_FAB,UNIDADES_DE' +
        'FEC,NOTAS,TOTAL_RECURSO,ENTRADA,SUBORDEN,SERIE,RIG,RIG_OF,HORA_I' +
        'NICIO,HORA_FIN,TIEMPO,IDTAREA,TIEMPO_DEC,NUEVA_TAREA,EMPRESA,EJE' +
        'RCICIO,CANAL,LINEA,LINEA_FASE,LINEA_TAREA,NUM_REF_SAL,ESTADO,TIP' +
        'OTAREA,TIPOFASE,TIPO,RECURSO,TIPO_RECURSO,IMPUTACION,ID_ORDEN,CA' +
        'NTIDAD,TIPO_MARCAJE)'
      'VALUES'
      
        '  (?FECHA_PREV,?FECHA_REAL,?PRECIO_RECURSO,?UNIDADES_FAB,?UNIDAD' +
        'ES_DEFEC,?NOTAS,?TOTAL_RECURSO,?ENTRADA,?SUBORDEN,?SERIE,?RIG,?R' +
        'IG_OF,?HORA_INICIO,?HORA_FIN,?TIEMPO,?IDTAREA,?TIEMPO_DEC,?NUEVA' +
        '_TAREA,?EMPRESA,?EJERCICIO,?CANAL,?LINEA,?LINEA_FASE,?LINEA_TARE' +
        'A,?NUM_REF_SAL,?ESTADO,?TIPOTAREA,?TIPOFASE,?TIPO,?RECURSO,?TIPO' +
        '_RECURSO,?IMPUTACION,?ID_ORDEN,?CANTIDAD,?TIPO_MARCAJE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_ORD_DET_MARCA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_ORD_DET_MARCA DET, PRO_ORD_CAB_MARCA CAB'
      'WHERE '
      'DET.RIG=CAB.RIG '
      'AND CAB.FECHA=?FECHA'
      'AND CAB.OPERARIO=?OPERARIO'
      'AND CAB.EMPRESA=DET.EMPRESA'
      'AND CAB.SERIE=DET.SERIE'
      'AND CAB.CANAL=DET.CANAL'
      'AND CAB.EJERCICIO=DET.EJERCICIO'
      'AND CAB.TIPO=DET.TIPO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_ORD_DET_MARCA'
      'SET'
      '  FECHA_PREV=?FECHA_PREV '
      '  ,FECHA_REAL=?FECHA_REAL '
      '  ,PRECIO_RECURSO=?PRECIO_RECURSO '
      '  ,UNIDADES_FAB=?UNIDADES_FAB '
      '  ,UNIDADES_DEFECTUOSAS=?UNIDADES_DEFECTUOSAS '
      '  ,NOTAS=?NOTAS '
      '  ,TOTAL_RECURSO=?TOTAL_RECURSO '
      '  ,ENTRADA=?ENTRADA '
      '  ,SUBORDEN=?SUBORDEN '
      '  ,RIG_OF=?RIG_OF '
      '  ,HORA_INICIO=?HORA_INICIO '
      '  ,HORA_FIN=?HORA_FIN '
      '  ,TIEMPO=?TIEMPO '
      '  ,IDTAREA=?IDTAREA '
      '  ,TIEMPO_DEC=?TIEMPO_DEC '
      '  ,NUEVA_TAREA=?NUEVA_TAREA '
      '  ,LINEA_FASE=?LINEA_FASE '
      '  ,LINEA_TAREA=?LINEA_TAREA '
      '  ,NUM_REF_SAL=?NUM_REF_SAL '
      '  ,ESTADO=?ESTADO '
      '  ,TIPOTAREA=?TIPOTAREA '
      '  ,TIPOFASE=?TIPOFASE '
      '  ,RECURSO=?RECURSO '
      '  ,TIPO_RECURSO=?TIPO_RECURSO '
      '  ,IMPUTACION=?IMPUTACION '
      '  ,ID_ORDEN=?ID_ORDEN '
      '  ,CANTIDAD=?CANTIDAD '
      '  ,TIPO_MARCAJE=?TIPO_MARCAJE '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA ')
    AfterOpen = QMDetallesAfterOpen
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'TIPO '
      'RIG '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ORD_DET_MARCA'
    UpdateTransaction = TLocal
    Left = 48
    Top = 208
    object QMDetallesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetallesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDetallesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDetallesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMDetallesTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMDetallesRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object QMDetallesLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetallesRIG_OF: TIntegerField
      DisplayLabel = 'Ord. Prod.'
      FieldName = 'RIG_OF'
    end
    object QMDetallesSUBORDEN: TIntegerField
      DisplayLabel = 'Suborden'
      FieldName = 'SUBORDEN'
    end
    object QMDetallesLINEA_FASE: TIntegerField
      DisplayLabel = 'Linea Fase'
      FieldName = 'LINEA_FASE'
    end
    object QMDetallesLINEA_TAREA: TIntegerField
      DisplayLabel = 'Linea Tarea'
      FieldName = 'LINEA_TAREA'
    end
    object QMDetallesFECHA_PREV: TDateTimeField
      DisplayLabel = 'Fec. Prev.'
      FieldName = 'FECHA_PREV'
    end
    object QMDetallesFECHA_REAL: TDateTimeField
      DisplayLabel = 'Fec. Real'
      FieldName = 'FECHA_REAL'
    end
    object QMDetallesNUM_REF_SAL: TIntegerField
      DisplayLabel = 'Nro. Ref. Sal.'
      FieldName = 'NUM_REF_SAL'
    end
    object QMDetallesHORA_INICIO: TFloatField
      DisplayLabel = 'Hora Ini.'
      FieldName = 'HORA_INICIO'
    end
    object QMDetallesHORA_FIN: TFloatField
      DisplayLabel = 'Hora Fin'
      FieldName = 'HORA_FIN'
    end
    object QMDetallesTIEMPO: TFloatField
      DisplayLabel = 'Tiempo'
      FieldName = 'TIEMPO'
    end
    object QMDetallesRECURSO: TFIBStringField
      DisplayLabel = 'Recurso'
      FieldName = 'RECURSO'
      Size = 5
    end
    object QMDetallesPRECIO_RECURSO: TFloatField
      DisplayLabel = 'Precio Rec.'
      FieldName = 'PRECIO_RECURSO'
    end
    object QMDetallesTIPO_RECURSO: TFIBStringField
      DisplayLabel = 'Tipo Recurso'
      FieldName = 'TIPO_RECURSO'
      Size = 5
    end
    object QMDetallesUNIDADES_FAB: TFloatField
      DisplayLabel = 'Uds. Fab.'
      FieldName = 'UNIDADES_FAB'
    end
    object QMDetallesUNIDADES_DEFECTUOSAS: TFloatField
      DisplayLabel = 'Uds. Defecto'
      FieldName = 'UNIDADES_DEFECTUOSAS'
    end
    object QMDetallesESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMDetallesNOTAS: TMemoField
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object QMDetallesTOTAL_RECURSO: TFloatField
      DisplayLabel = 'Total Rec.'
      FieldName = 'TOTAL_RECURSO'
    end
    object QMDetallesIDTAREA: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'IDTAREA'
    end
    object QMDetallesIMPUTACION: TFIBStringField
      DisplayLabel = 'Imputacion'
      FieldName = 'IMPUTACION'
      Size = 3
    end
    object QMDetallesTIEMPO_DEC: TFloatField
      DisplayLabel = 'Tiempo Dec.'
      FieldName = 'TIEMPO_DEC'
    end
    object QMDetallesTIPOFASE: TFIBStringField
      DisplayLabel = 'Tipo Fase'
      FieldName = 'TIPOFASE'
      Size = 3
    end
    object QMDetallesTIPOTAREA: TFIBStringField
      DisplayLabel = 'Tipo Tarea'
      FieldName = 'TIPOTAREA'
      Size = 3
    end
    object QMDetallesNUEVA_TAREA: TIntegerField
      DisplayLabel = 'Nueva Tarea'
      FieldName = 'NUEVA_TAREA'
    end
    object QMDetallesENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMDetallesCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object QMDetallesTIPO_MARCAJE: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_MARCAJE'
      Size = 3
    end
    object QMDetallesID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMDetallesOPERARIO: TIntegerField
      DisplayLabel = 'Operario'
      FieldName = 'OPERARIO'
    end
    object QMDetallesMAQUINA: TIntegerField
      DisplayLabel = 'Maquina'
      FieldName = 'MAQUINA'
    end
    object QMDetallesPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object QMDetallesVARIOS: TFIBStringField
      DisplayLabel = 'Varios'
      FieldName = 'VARIOS'
      Size = 5
    end
    object QMDetallesFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMDetallesTIEMPO_TOT: TFloatField
      DisplayLabel = 'Tiempo Total'
      FieldName = 'TIEMPO_TOT'
    end
    object QMDetallesRIG_OFF: TIntegerField
      DisplayLabel = 'Ord. Prod.'
      FieldName = 'RIG_OFF'
    end
  end
  object DSQMVerMarcajesMaq: TDataSource
    DataSet = QMVerMarcajesMaq
    Left = 160
    Top = 112
  end
  object xVerMarcajesMaq: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT MAQ.*, MAR.*, HOR.*'
      'FROM PRO_MAQUINAS_C MAQ'
      'JOIN PRO_ORD_CAB_MARCA MAR ON (MAR.MAQUINA = MAQ.CODMAQ)'
      'JOIN OPE_HORARIOS HOR ON (MAQ.HORARIO = HOR.HORARIO)'
      'WHERE'
      'MAR.EMPRESA = ?EMPRESA AND'
      'MAQ.CODMAQ = ?CODMAQ')
    SelectSQL.Strings = (
      'SELECT MAQ.*, MAR.*, HOR.*'
      'FROM PRO_MAQUINAS_C MAQ'
      'JOIN PRO_ORD_CAB_MARCA MAR ON (MAR.MAQUINA = MAQ.CODMAQ)'
      'JOIN OPE_HORARIOS HOR ON (MAQ.HORARIO = HOR.HORARIO)'
      'WHERE'
      'MAR.EMPRESA = ?EMPRESA AND'
      'MAR.FECHA = ?FECHA'
      'ORDER BY MAQ.CODMAQ')
    UniDirectional = False
    DataSource = DSQMVerMarcajesMaq
    Left = 48
    Top = 160
    object xVerMarcajesMaqEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xVerMarcajesMaqCODMAQ: TIntegerField
      DisplayLabel = 'Cod. Maquina'
      FieldName = 'CODMAQ'
    end
    object xVerMarcajesMaqTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 5
    end
    object xVerMarcajesMaqCODIDE: TFIBStringField
      DisplayLabel = 'Cod. IDE'
      FieldName = 'CODIDE'
      Size = 25
    end
    object xVerMarcajesMaqFECHA_COMPRA: TDateTimeField
      DisplayLabel = 'Fec. Compra'
      FieldName = 'FECHA_COMPRA'
    end
    object xVerMarcajesMaqFABRICANTE: TFIBStringField
      DisplayLabel = 'Fabricante'
      FieldName = 'FABRICANTE'
      Size = 25
    end
    object xVerMarcajesMaqNSERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NSERIE'
      Size = 10
    end
    object xVerMarcajesMaqDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
    object xVerMarcajesMaqOBSERVACION: TBlobField
      DisplayLabel = 'Observacion'
      FieldName = 'OBSERVACION'
      Size = 8
    end
    object xVerMarcajesMaqFRECUENCIA: TIntegerField
      DisplayLabel = 'Frecuencia'
      FieldName = 'FRECUENCIA'
    end
    object xVerMarcajesMaqCERTIFICACION: TIntegerField
      DisplayLabel = 'Certificacion'
      FieldName = 'CERTIFICACION'
    end
    object xVerMarcajesMaqFECHA_CERT: TDateTimeField
      DisplayLabel = 'Fec. Cert.'
      FieldName = 'FECHA_CERT'
    end
    object xVerMarcajesMaqRECURSO: TFIBStringField
      DisplayLabel = 'Recurso'
      FieldName = 'RECURSO'
      Size = 5
    end
    object xVerMarcajesMaqCALENDARIO: TIntegerField
      DisplayLabel = 'Calendario'
      FieldName = 'CALENDARIO'
    end
    object xVerMarcajesMaqHORARIO: TFIBStringField
      DisplayLabel = 'Horario'
      FieldName = 'HORARIO'
      Size = 3
    end
    object xVerMarcajesMaqEMPRESA1: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA1'
    end
    object xVerMarcajesMaqEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xVerMarcajesMaqCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xVerMarcajesMaqSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xVerMarcajesMaqTIPO1: TFIBStringField
      DisplayLabel = 'Tipo 1'
      FieldName = 'TIPO1'
      Size = 3
    end
    object xVerMarcajesMaqRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xVerMarcajesMaqOPERARIO: TIntegerField
      DisplayLabel = 'Operario'
      FieldName = 'OPERARIO'
    end
    object xVerMarcajesMaqMAQUINA: TIntegerField
      DisplayLabel = 'Maquina'
      FieldName = 'MAQUINA'
    end
    object xVerMarcajesMaqPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xVerMarcajesMaqVARIOS: TFIBStringField
      DisplayLabel = 'Varios'
      FieldName = 'VARIOS'
      Size = 5
    end
    object xVerMarcajesMaqFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xVerMarcajesMaqTIEMPO_TOT: TFloatField
      DisplayLabel = 'Tiempo Total'
      FieldName = 'TIEMPO_TOT'
    end
    object xVerMarcajesMaqRIG_OFF: TIntegerField
      DisplayLabel = 'Ord. Prod.'
      FieldName = 'RIG_OFF'
    end
    object xVerMarcajesMaqEMPRESA2: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA2'
    end
    object xVerMarcajesMaqHORARIO1: TFIBStringField
      DisplayLabel = 'Horario'
      FieldName = 'HORARIO1'
      Size = 3
    end
    object xVerMarcajesMaqDESCRIPCION1: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION1'
      Size = 100
    end
  end
  object DSxVerMarcajesMaq: TDataSource
    DataSet = xVerMarcajesMaq
    Left = 160
    Top = 160
  end
  object QMVerMarcajesMaq: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_MAQUINAS_C'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  CODMAQ=?old_CODMAQ ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_MAQUINAS_C'
      
        '  (FECHA_COMPRA,OBSERVACION,FECHA_CERT,NSERIE,EMPRESA,CODMAQ,DES' +
        'CRIPCION,FRECUENCIA,CERTIFICACION,TIPO,CODIDE,FABRICANTE,UBICACI' +
        'ON,RECURSO,CALENDARIO,HORARIO)'
      'VALUES'
      
        '  (?FECHA_COMPRA,?OBSERVACION,?FECHA_CERT,?NSERIE,?EMPRESA,?CODM' +
        'AQ,?DESCRIPCION,?FRECUENCIA,?CERTIFICACION,?TIPO,?CODIDE,?FABRIC' +
        'ANTE,?UBICACION,?RECURSO,?CALENDARIO,?HORARIO)')
    RefreshSQL.Strings = (
      'SELECT MAQ.*, MAR.*, HOR.*'
      'FROM PRO_MAQUINAS_C MAQ'
      'JOIN PRO_ORD_CAB_MARCA MAR ON (MAR.MAQUINA = MAQ.CODMAQ)'
      'JOIN OPE_HORARIOS HOR ON (MAQ.HORARIO = HOR.HORARIO)'
      'WHERE'
      'MAQ.EMPRESA=?EMPRESA AND '
      'MAQ.CODMAQ=?CODMAQ ')
    SelectSQL.Strings = (
      'SELECT MAQ.*, MAR.*, HOR.*'
      'FROM PRO_MAQUINAS_C MAQ'
      'JOIN PRO_ORD_CAB_MARCA MAR ON (MAR.MAQUINA = MAQ.CODMAQ)'
      'JOIN OPE_HORARIOS HOR ON (MAQ.HORARIO = HOR.HORARIO)'
      'WHERE'
      'EMPRESA = ?EMPRESA AND'
      'MAR.FECHA = ?FECHA'
      'ORDER BY CODMAQ')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_MAQUINAS_C'
      'SET'
      '  FECHA_COMPRA=?FECHA_COMPRA '
      '  ,OBSERVACION=?OBSERVACION '
      '  ,FECHA_CERT=?FECHA_CERT '
      '  ,NSERIE=?NSERIE '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,FRECUENCIA=?FRECUENCIA '
      '  ,CERTIFICACION=?CERTIFICACION '
      '  ,TIPO=?TIPO '
      '  ,CODIDE=?CODIDE '
      '  ,FABRICANTE=?FABRICANTE '
      '  ,UBICACION=?UBICACION '
      '  ,RECURSO=?RECURSO '
      '  ,CALENDARIO=?CALENDARIO '
      '  ,HORARIO=?HORARIO '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CODMAQ=?CODMAQ ')
    AfterOpen = QMVerMarcajesMaqAfterOpen
    AfterScroll = QMVerMarcajesMaqAfterScroll
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'CODMAQ ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_MAQUINAS_C'
    UpdateTransaction = TLocal
    Left = 48
    Top = 112
  end
  object xDetallesMaq: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM PRO_ORD_DET_MARCA DET, PRO_ORD_CAB_MARCA CAB'
      'WHERE '
      'DET.RIG=CAB.RIG '
      'AND CAB.FECHA=?FECHA'
      'AND CAB.MAQUINA=?MAQUINA'
      'AND CAB.EMPRESA=DET.EMPRESA'
      'AND CAB.SERIE=DET.SERIE'
      'AND CAB.CANAL=DET.CANAL'
      'AND CAB.EJERCICIO=DET.EJERCICIO'
      'AND CAB.TIPO=DET.TIPO')
    UniDirectional = False
    DataSource = DSQMDetallesMaq
    AfterOpen = xDetallesMaqAfterOpen
    Left = 48
    Top = 352
    object xDetallesMaqEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xDetallesMaqEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xDetallesMaqCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xDetallesMaqSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object xDetallesMaqTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object xDetallesMaqRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xDetallesMaqLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xDetallesMaqRIG_OF: TIntegerField
      DisplayLabel = 'Ord. Prod.'
      FieldName = 'RIG_OF'
    end
    object xDetallesMaqSUBORDEN: TIntegerField
      DisplayLabel = 'Suborden'
      FieldName = 'SUBORDEN'
    end
    object xDetallesMaqLINEA_FASE: TIntegerField
      DisplayLabel = 'Linea Fase'
      FieldName = 'LINEA_FASE'
    end
    object xDetallesMaqLINEA_TAREA: TIntegerField
      DisplayLabel = 'Linea Tarea'
      FieldName = 'LINEA_TAREA'
    end
    object xDetallesMaqFECHA_PREV: TDateTimeField
      DisplayLabel = 'Fec. Prev.'
      FieldName = 'FECHA_PREV'
    end
    object xDetallesMaqFECHA_REAL: TDateTimeField
      DisplayLabel = 'Fec. Real'
      FieldName = 'FECHA_REAL'
    end
    object xDetallesMaqNUM_REF_SAL: TIntegerField
      DisplayLabel = 'Nro. Ref. Sal.'
      FieldName = 'NUM_REF_SAL'
    end
    object xDetallesMaqHORA_INICIO: TFloatField
      DisplayLabel = 'Hora Ini.'
      FieldName = 'HORA_INICIO'
    end
    object xDetallesMaqHORA_FIN: TFloatField
      DisplayLabel = 'Hora Fin'
      FieldName = 'HORA_FIN'
    end
    object xDetallesMaqTIEMPO: TFloatField
      DisplayLabel = 'Tiempo'
      FieldName = 'TIEMPO'
    end
    object xDetallesMaqRECURSO: TFIBStringField
      DisplayLabel = 'Recurso'
      FieldName = 'RECURSO'
      Size = 5
    end
    object xDetallesMaqPRECIO_RECURSO: TFloatField
      DisplayLabel = 'Precio Rec.'
      FieldName = 'PRECIO_RECURSO'
    end
    object xDetallesMaqTIPO_RECURSO: TFIBStringField
      DisplayLabel = 'Tipo Recurso'
      FieldName = 'TIPO_RECURSO'
      Size = 5
    end
    object xDetallesMaqUNIDADES_FAB: TFloatField
      DisplayLabel = 'Uds. Fab.'
      FieldName = 'UNIDADES_FAB'
    end
    object xDetallesMaqUNIDADES_DEFECTUOSAS: TFloatField
      DisplayLabel = 'Uds. Defecto'
      FieldName = 'UNIDADES_DEFECTUOSAS'
    end
    object xDetallesMaqESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object xDetallesMaqNOTAS: TMemoField
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object xDetallesMaqTOTAL_RECURSO: TFloatField
      DisplayLabel = 'Total Rec.'
      FieldName = 'TOTAL_RECURSO'
    end
    object xDetallesMaqIDTAREA: TIntegerField
      DisplayLabel = 'Id Tarea'
      FieldName = 'IDTAREA'
    end
    object xDetallesMaqIMPUTACION: TFIBStringField
      DisplayLabel = 'Imputacion'
      FieldName = 'IMPUTACION'
      Size = 3
    end
    object xDetallesMaqTIEMPO_DEC: TFloatField
      DisplayLabel = 'Tiempo Dec.'
      FieldName = 'TIEMPO_DEC'
    end
    object xDetallesMaqTIPOFASE: TFIBStringField
      DisplayLabel = 'Tipo Fase'
      FieldName = 'TIPOFASE'
      Size = 3
    end
    object xDetallesMaqTIPOTAREA: TFIBStringField
      DisplayLabel = 'Tipo Tarea'
      FieldName = 'TIPOTAREA'
      Size = 3
    end
    object xDetallesMaqNUEVA_TAREA: TIntegerField
      DisplayLabel = 'Nueva Tarea'
      FieldName = 'NUEVA_TAREA'
    end
    object xDetallesMaqENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object xDetallesMaqCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object xDetallesMaqTIPO_MARCAJE: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_MARCAJE'
      Size = 3
    end
    object xDetallesMaqID_ORDEN: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object xDetallesMaqEMPRESA1: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA1'
    end
    object xDetallesMaqEJERCICIO1: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO1'
    end
    object xDetallesMaqCANAL1: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL1'
    end
    object xDetallesMaqSERIE1: TFIBStringField
      DisplayLabel = 'Serie 1'
      FieldName = 'SERIE1'
      Size = 10
    end
    object xDetallesMaqTIPO1: TFIBStringField
      DisplayLabel = 'Tipo 1'
      FieldName = 'TIPO1'
      Size = 3
    end
    object xDetallesMaqRIG1: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG1'
    end
    object xDetallesMaqOPERARIO: TIntegerField
      DisplayLabel = 'Operario'
      FieldName = 'OPERARIO'
    end
    object xDetallesMaqMAQUINA: TIntegerField
      DisplayLabel = 'Maquina'
      FieldName = 'MAQUINA'
    end
    object xDetallesMaqPROVEEDOR: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object xDetallesMaqVARIOS: TFIBStringField
      DisplayLabel = 'Varios'
      FieldName = 'VARIOS'
      Size = 5
    end
    object xDetallesMaqFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object xDetallesMaqTIEMPO_TOT: TFloatField
      DisplayLabel = 'Tiempo Total'
      FieldName = 'TIEMPO_TOT'
    end
    object xDetallesMaqRIG_OFF: TIntegerField
      DisplayLabel = 'Ord. Prod.'
      FieldName = 'RIG_OFF'
    end
  end
  object DSxDetallesMaq: TDataSource
    DataSet = xDetallesMaq
    Left = 160
    Top = 352
  end
  object DSQMDetallesMaq: TDataSource
    DataSet = QMDetallesMaq
    Left = 160
    Top = 304
  end
  object QMDetallesMaq: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM PRO_ORD_DET_MARCA'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  EJERCICIO=?old_EJERCICIO AND '
      '  CANAL=?old_CANAL AND '
      '  SERIE=?old_SERIE AND '
      '  TIPO=?old_TIPO AND '
      '  RIG=?old_RIG AND '
      '  LINEA=?old_LINEA ')
    InsertSQL.Strings = (
      'INSERT INTO PRO_ORD_DET_MARCA'
      
        '  (FECHA_PREV,FECHA_REAL,PRECIO_RECURSO,UNIDADES_FAB,UNIDADES_DE' +
        'FEC,NOTAS,TOTAL_RECURSO,ENTRADA,SUBORDEN,SERIE,RIG,RIG_OF,HORA_I' +
        'NICIO,HORA_FIN,TIEMPO,IDTAREA,TIEMPO_DEC,NUEVA_TAREA,EMPRESA,EJE' +
        'RCICIO,CANAL,LINEA,LINEA_FASE,LINEA_TAREA,NUM_REF_SAL,ESTADO,TIP' +
        'OTAREA,TIPOFASE,TIPO,RECURSO,TIPO_RECURSO,IMPUTACION,ID_ORDEN,CA' +
        'NTIDAD,TIPO_MARCAJE)'
      'VALUES'
      
        '  (?FECHA_PREV,?FECHA_REAL,?PRECIO_RECURSO,?UNIDADES_FAB,?UNIDAD' +
        'ES_DEFEC,?NOTAS,?TOTAL_RECURSO,?ENTRADA,?SUBORDEN,?SERIE,?RIG,?R' +
        'IG_OF,?HORA_INICIO,?HORA_FIN,?TIEMPO,?IDTAREA,?TIEMPO_DEC,?NUEVA' +
        '_TAREA,?EMPRESA,?EJERCICIO,?CANAL,?LINEA,?LINEA_FASE,?LINEA_TARE' +
        'A,?NUM_REF_SAL,?ESTADO,?TIPOTAREA,?TIPOFASE,?TIPO,?RECURSO,?TIPO' +
        '_RECURSO,?IMPUTACION,?ID_ORDEN,?CANTIDAD,?TIPO_MARCAJE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM PRO_ORD_DET_MARCA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA ')
    SelectSQL.Strings = (
      'SELECT * FROM PRO_ORD_DET_MARCA DET, PRO_ORD_CAB_MARCA CAB'
      'WHERE '
      'DET.RIG=CAB.RIG '
      'AND CAB.FECHA=?FECHA'
      'AND CAB.MAQUINA=?MAQUINA'
      'AND CAB.EMPRESA=DET.EMPRESA'
      'AND CAB.SERIE=DET.SERIE'
      'AND CAB.CANAL=DET.CANAL'
      'AND CAB.EJERCICIO=DET.EJERCICIO'
      'AND CAB.TIPO=DET.TIPO')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE PRO_ORD_DET_MARCA'
      'SET'
      '  FECHA_PREV=?FECHA_PREV '
      '  ,FECHA_REAL=?FECHA_REAL '
      '  ,PRECIO_RECURSO=?PRECIO_RECURSO '
      '  ,UNIDADES_FAB=?UNIDADES_FAB '
      '  ,UNIDADES_DEFECTUOSAS=?UNIDADES_DEFECTUOSAS '
      '  ,NOTAS=?NOTAS '
      '  ,TOTAL_RECURSO=?TOTAL_RECURSO '
      '  ,ENTRADA=?ENTRADA '
      '  ,SUBORDEN=?SUBORDEN '
      '  ,RIG_OF=?RIG_OF '
      '  ,HORA_INICIO=?HORA_INICIO '
      '  ,HORA_FIN=?HORA_FIN '
      '  ,TIEMPO=?TIEMPO '
      '  ,IDTAREA=?IDTAREA '
      '  ,TIEMPO_DEC=?TIEMPO_DEC '
      '  ,NUEVA_TAREA=?NUEVA_TAREA '
      '  ,LINEA_FASE=?LINEA_FASE '
      '  ,LINEA_TAREA=?LINEA_TAREA '
      '  ,NUM_REF_SAL=?NUM_REF_SAL '
      '  ,ESTADO=?ESTADO '
      '  ,TIPOTAREA=?TIPOTAREA '
      '  ,TIPOFASE=?TIPOFASE '
      '  ,RECURSO=?RECURSO '
      '  ,TIPO_RECURSO=?TIPO_RECURSO '
      '  ,IMPUTACION=?IMPUTACION '
      '  ,ID_ORDEN=?ID_ORDEN '
      '  ,CANTIDAD=?CANTIDAD '
      '  ,TIPO_MARCAJE=?TIPO_MARCAJE '
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  EJERCICIO=?EJERCICIO AND '
      '  CANAL=?CANAL AND '
      '  SERIE=?SERIE AND '
      '  TIPO=?TIPO AND '
      '  RIG=?RIG AND '
      '  LINEA=?LINEA ')
    AfterOpen = QMDetallesAfterOpen
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'EJERCICIO '
      'CANAL '
      'SERIE '
      'TIPO '
      'RIG '
      'LINEA ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'PRO_ORD_DET_MARCA'
    UpdateTransaction = TLocal
    Left = 48
    Top = 304
    object IntegerField25: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object IntegerField26: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object IntegerField27: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object FIBStringField12: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object FIBStringField13: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object IntegerField28: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object IntegerField29: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object IntegerField30: TIntegerField
      DisplayLabel = 'Ord. Prod.'
      FieldName = 'RIG_OF'
    end
    object IntegerField31: TIntegerField
      DisplayLabel = 'Suborden'
      FieldName = 'SUBORDEN'
    end
    object IntegerField32: TIntegerField
      DisplayLabel = 'Linea Fase'
      FieldName = 'LINEA_FASE'
    end
    object IntegerField33: TIntegerField
      DisplayLabel = 'Linea Tarea'
      FieldName = 'LINEA_TAREA'
    end
    object DateTimeField4: TDateTimeField
      DisplayLabel = 'Fec. Prev.'
      FieldName = 'FECHA_PREV'
    end
    object DateTimeField5: TDateTimeField
      DisplayLabel = 'Fec. Real'
      FieldName = 'FECHA_REAL'
    end
    object IntegerField34: TIntegerField
      DisplayLabel = 'Nro. Ref. Sal.'
      FieldName = 'NUM_REF_SAL'
    end
    object FloatField11: TFloatField
      DisplayLabel = 'Hora Ini.'
      FieldName = 'HORA_INICIO'
    end
    object FloatField12: TFloatField
      DisplayLabel = 'Hora Fin'
      FieldName = 'HORA_FIN'
    end
    object FloatField13: TFloatField
      DisplayLabel = 'Tiempo'
      FieldName = 'TIEMPO'
    end
    object FIBStringField14: TFIBStringField
      DisplayLabel = 'Recurso'
      FieldName = 'RECURSO'
      Size = 5
    end
    object FloatField14: TFloatField
      DisplayLabel = 'Precio Rec.'
      FieldName = 'PRECIO_RECURSO'
    end
    object FIBStringField15: TFIBStringField
      DisplayLabel = 'Tipo Recurso'
      FieldName = 'TIPO_RECURSO'
      Size = 5
    end
    object FloatField15: TFloatField
      DisplayLabel = 'Uds. Fab.'
      FieldName = 'UNIDADES_FAB'
    end
    object FloatField16: TFloatField
      DisplayLabel = 'Uds. Defecto'
      FieldName = 'UNIDADES_DEFECTUOSAS'
    end
    object IntegerField35: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object MemoField2: TMemoField
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object FloatField17: TFloatField
      DisplayLabel = 'Total Recurso'
      FieldName = 'TOTAL_RECURSO'
    end
    object IntegerField36: TIntegerField
      DisplayLabel = 'Id Tarea'
      FieldName = 'IDTAREA'
    end
    object FIBStringField16: TFIBStringField
      DisplayLabel = 'Imputacion'
      FieldName = 'IMPUTACION'
      Size = 3
    end
    object FloatField18: TFloatField
      DisplayLabel = 'Tiempo Dec.'
      FieldName = 'TIEMPO_DEC'
    end
    object FIBStringField17: TFIBStringField
      DisplayLabel = 'Tipo Fase'
      FieldName = 'TIPOFASE'
      Size = 3
    end
    object FIBStringField18: TFIBStringField
      DisplayLabel = 'Tipo Tarea'
      FieldName = 'TIPOTAREA'
      Size = 3
    end
    object IntegerField37: TIntegerField
      DisplayLabel = 'Nueva Tarea'
      FieldName = 'NUEVA_TAREA'
    end
    object IntegerField38: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object FloatField19: TFloatField
      DisplayLabel = 'Cantidad'
      FieldName = 'CANTIDAD'
    end
    object FIBStringField19: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO_MARCAJE'
      Size = 3
    end
    object IntegerField39: TIntegerField
      DisplayLabel = 'ID Orden'
      FieldName = 'ID_ORDEN'
    end
    object IntegerField40: TIntegerField
      DisplayLabel = 'Operario'
      FieldName = 'OPERARIO'
    end
    object IntegerField41: TIntegerField
      DisplayLabel = 'Maquina'
      FieldName = 'MAQUINA'
    end
    object IntegerField42: TIntegerField
      DisplayLabel = 'Proveedor'
      FieldName = 'PROVEEDOR'
    end
    object FIBStringField20: TFIBStringField
      DisplayLabel = 'Varios'
      FieldName = 'VARIOS'
      Size = 5
    end
    object DateTimeField6: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object FloatField20: TFloatField
      DisplayLabel = 'Tiempo Total'
      FieldName = 'TIEMPO_TOT'
    end
    object IntegerField43: TIntegerField
      DisplayLabel = 'Ord. Prod.'
      FieldName = 'RIG_OFF'
    end
  end
  object SPDetalleMaq: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'SELECT * FROM PRO_ORD_DET_MARCA DET, PRO_ORD_CAB_MARCA CAB'
      'WHERE DET.RIG=CAB.RIG '
      'AND CAB.FECHA=?FECHA'
      'AND CAB.MAQUINA=?MAQUINA'
      'AND CAB.EMPRESA=DET.EMPRESA'
      'AND CAB.SERIE=DET.SERIE'
      'AND CAB.CANAL=DET.CANAL'
      'AND CAB.EJERCICIO=DET.EJERCICIO'
      'AND CAB.TIPO=DET.TIPO')
    Transaction = TLocal
    AutoTrans = True
    Left = 296
    Top = 64
  end
end
