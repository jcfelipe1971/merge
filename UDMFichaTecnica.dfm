object DMFichaTecnica: TDMFichaTecnica
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Left = 240
  Top = 157
  Height = 264
  Width = 356
  object QMFichaTecnica: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 1024
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_FICHA_TECNICA'
      'WHERE'
      '  ID_FICHA_TECNICA=?old_ID_FICHA_TECNICA ')
    InsertSQL.Strings = (
      'INSERT INTO VER_FICHA_TECNICA'
      
        '  (EMPRESA,'#13#10'ID_FICHA_TECNICA,TITULO,MATRICULA,CLIENTE,NOMBRE_R_' +
        'SOCIAL,ID_CLIENTE,MARCA,TITULO_MARCA,ID_MARCA,MODELO,'#13#10'BASTIDOR,' +
        'MOTOR,KILOMETRAJE,ANYO_FABRICACION,COLOR,MEDIDA_NEUMATICO,ID_IMA' +
        'GEN,ID_GALERIA,FECHA_COMPRA,FECHA_ULTIMA_ITV,'#13#10'FECHA_PROXIMA_ITV' +
        ',RENTING,NOTAS)'
      'VALUES'
      
        '  (?EMPRESA,'#13#10'?ID_FICHA_TECNICA,?TITULO,?MATRICULA,?CLIENTE,?NOM' +
        'BRE_R_SOCIAL,?ID_CLIENTE,?MARCA,?TITULO_MARCA,?ID_MARCA,?MODELO,' +
        #13#10'?BASTIDOR,?MOTOR,?KILOMETRAJE,?ANYO_FABRICACION,?COLOR,?MEDIDA' +
        '_NEUMATICO,?ID_IMAGEN,?ID_GALERIA,?FECHA_COMPRA,?FECHA_ULTIMA_IT' +
        'V,'#13#10'?FECHA_PROXIMA_ITV,?RENTING,?NOTAS)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_FICHA_TECNICA'
      'WHERE'
      '  ID_FICHA_TECNICA=?ID_FICHA_TECNICA ')
    SelectSQL.Strings = (
      'SELECT * FROM VER_FICHA_TECNICA'
      'WHERE '
      'EMPRESA = ?EMPRESA '
      'ORDER BY MATRICULA')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_FICHA_TECNICA'
      'SET'
      '  EMPRESA=?EMPRESA '
      '  ,TITULO=?TITULO '
      '  ,MATRICULA=?MATRICULA '
      '  ,CLIENTE=?CLIENTE '
      '  ,NOMBRE_R_SOCIAL=?NOMBRE_R_SOCIAL '
      '  ,ID_CLIENTE=?ID_CLIENTE '
      '  ,MARCA=?MARCA '
      '  ,TITULO_MARCA=?TITULO_MARCA '
      '  ,ID_MARCA=?ID_MARCA '
      '  ,MODELO=?MODELO '
      '  ,BASTIDOR=?BASTIDOR '
      '  ,MOTOR=?MOTOR '
      '  ,KILOMETRAJE=?KILOMETRAJE '
      '  ,ANYO_FABRICACION=?ANYO_FABRICACION '
      '  ,COLOR=?COLOR '
      '  ,MEDIDA_NEUMATICO=?MEDIDA_NEUMATICO '
      '  ,ID_IMAGEN=?ID_IMAGEN '
      '  ,ID_GALERIA=?ID_GALERIA '
      '  ,FECHA_COMPRA=?FECHA_COMPRA '
      '  ,FECHA_ULTIMA_ITV=?FECHA_ULTIMA_ITV '
      '  ,FECHA_PROXIMA_ITV=?FECHA_PROXIMA_ITV '
      '  ,RENTING=?RENTING '
      '  ,NOTAS=?NOTAS '
      'WHERE'
      '  ID_FICHA_TECNICA=?ID_FICHA_TECNICA ')
    Plan.Strings = (
      
        'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
        'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
    AfterClose = QMFichaTecnicaAfterClose
    AfterOpen = QMFichaTecnicaAfterOpen
    BeforePost = QMFichaTecnicaBeforePost
    OnNewRecord = QMFichaTecnicaNewRecord
    ClavesPrimarias.Strings = (
      'ID_FICHA_TECNICA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_FICHA_TECNICA'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 40
    Top = 8
    object QMFichaTecnicaEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMFichaTecnicaID_FICHA_TECNICA: TIntegerField
      DisplayLabel = 'Id. Ficha Tec.'
      FieldName = 'ID_FICHA_TECNICA'
    end
    object QMFichaTecnicaMATRICULA: TFIBStringField
      DisplayLabel = 'Matricula'
      FieldName = 'MATRICULA'
    end
    object QMFichaTecnicaTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMFichaTecnicaCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMFichaTecnicaNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Nombre R. Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMFichaTecnicaID_CLIENTE: TIntegerField
      DisplayLabel = 'Id. Cliente'
      FieldName = 'ID_CLIENTE'
    end
    object QMFichaTecnicaID_MARCA: TIntegerField
      DisplayLabel = 'Id Marca'
      FieldName = 'ID_MARCA'
    end
    object QMFichaTecnicaMARCA: TFIBStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA'
      Size = 5
    end
    object QMFichaTecnicaTITULO_MARCA: TFIBStringField
      DisplayLabel = 'Titulo Marca'
      FieldName = 'TITULO_MARCA'
      Size = 60
    end
    object QMFichaTecnicaMODELO: TFIBStringField
      DisplayLabel = 'Modelo'
      DisplayWidth = 60
      FieldName = 'MODELO'
      Size = 60
    end
    object QMFichaTecnicaBASTIDOR: TFIBStringField
      DisplayLabel = 'Bastidor'
      FieldName = 'BASTIDOR'
      Size = 60
    end
    object QMFichaTecnicaID_IMAGEN: TIntegerField
      DisplayLabel = 'Id. Imagen'
      FieldName = 'ID_IMAGEN'
    end
    object QMFichaTecnicaID_GALERIA: TIntegerField
      DisplayLabel = 'Id. Galeria'
      FieldName = 'ID_GALERIA'
    end
    object QMFichaTecnicaFECHA_COMPRA: TDateTimeField
      DisplayLabel = 'Fec. Compra'
      FieldName = 'FECHA_COMPRA'
    end
    object QMFichaTecnicaFECHA_PROXIMA_ITV: TDateTimeField
      DisplayLabel = 'Fec. Prox. ITV'
      FieldName = 'FECHA_PROXIMA_ITV'
    end
    object QMFichaTecnicaFECHA_ULTIMA_ITV: TDateTimeField
      DisplayLabel = 'Fec. Ult. ITV'
      FieldName = 'FECHA_ULTIMA_ITV'
    end
    object QMFichaTecnicaRENTING: TFIBStringField
      DisplayLabel = 'Renting'
      FieldName = 'RENTING'
      Size = 60
    end
    object QMFichaTecnicaNOTAS: TBlobField
      DisplayLabel = 'Notas'
      FieldName = 'NOTAS'
      Size = 8
    end
    object QMFichaTecnicaMOTOR: TFIBStringField
      DisplayLabel = 'Motor'
      FieldName = 'MOTOR'
      Size = 60
    end
    object QMFichaTecnicaKILOMETRAJE: TIntegerField
      DisplayLabel = 'Kilomentraje'
      FieldName = 'KILOMETRAJE'
    end
    object QMFichaTecnicaANYO_FABRICACION: TIntegerField
      DisplayLabel = 'A'#241'o Fabricacion'
      FieldName = 'ANYO_FABRICACION'
    end
    object QMFichaTecnicaCOLOR: TFIBStringField
      DisplayLabel = 'Color'
      FieldName = 'COLOR'
      Size = 60
    end
    object QMFichaTecnicaMEDIDA_NEUMATICO: TFIBStringField
      DisplayLabel = 'Medida Neumatico'
      FieldName = 'MEDIDA_NEUMATICO'
      Size = 60
    end
  end
  object DSQMFichaTecnica: TDataSource
    DataSet = QMFichaTecnica
    Left = 136
    Top = 8
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 272
    Top = 8
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 272
    Top = 56
  end
  object QMCabReparar: TFIBDataSetRO
    Database = DMMain.DataBase
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT *'
      'FROM VER_REPAR_CAB_REPARACIONES'
      'WHERE'
      'IDCABREPARAR = :IDCABREPARAR')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_REPAR_CAB_REPARACIONES'
      'WHERE'
      'ID_FICHA_TECNICA = :ID_FICHA_TECNICA'
      'ORDER BY IDCABREPARAR DESC')
    UniDirectional = False
    DataSource = DSQMFichaTecnica
    Left = 40
    Top = 56
    object QMCabRepararIDCABREPARAR: TIntegerField
      DisplayLabel = 'Id Rep.'
      FieldName = 'IDCABREPARAR'
    end
    object QMCabRepararEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCabRepararEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMCabRepararCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMCabRepararTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMCabRepararEQUIPO: TFIBStringField
      DisplayLabel = 'Equipo'
      FieldName = 'EQUIPO'
      Size = 60
    end
    object QMCabRepararMARCA: TFIBStringField
      DisplayLabel = 'Marca'
      FieldName = 'MARCA'
      Size = 60
    end
    object QMCabRepararMODELO: TFIBStringField
      DisplayLabel = 'Modelo'
      FieldName = 'MODELO'
      Size = 60
    end
    object QMCabRepararNUM_SERIE: TFIBStringField
      DisplayLabel = 'Nro. Serie'
      FieldName = 'NUM_SERIE'
      Size = 60
    end
    object QMCabRepararCONDICION: TFIBStringField
      DisplayLabel = 'Condicion'
      FieldName = 'CONDICION'
      Size = 60
    end
    object QMCabRepararOT: TFIBStringField
      DisplayLabel = 'O.T.'
      FieldName = 'OT'
      Size = 60
    end
    object QMCabRepararTECNICO: TFIBStringField
      DisplayLabel = 'Tecnico'
      FieldName = 'TECNICO'
      Size = 60
    end
    object QMCabRepararFECHA_AVISO: TDateTimeField
      DisplayLabel = 'Fec. Aviso'
      FieldName = 'FECHA_AVISO'
    end
    object QMCabRepararFECHA_ENTRADA: TDateTimeField
      DisplayLabel = 'Fec. Entrada'
      FieldName = 'FECHA_ENTRADA'
    end
    object QMCabRepararFECHA_SALIDA: TDateTimeField
      DisplayLabel = 'Fec. Salida'
      FieldName = 'FECHA_SALIDA'
    end
    object QMCabRepararOBSERVACIONES_CLIENTE: TMemoField
      DisplayLabel = 'Observaciones Cli.'
      FieldName = 'OBSERVACIONES_CLIENTE'
      BlobType = ftMemo
      Size = 8
    end
    object QMCabRepararTIPO_ACTUACION: TIntegerField
      DisplayLabel = 'Tipo Actuacion'
      FieldName = 'TIPO_ACTUACION'
    end
    object QMCabRepararTRABAJO_REALIZADO: TMemoField
      DisplayLabel = 'Trab. Realizado'
      FieldName = 'TRABAJO_REALIZADO'
      BlobType = ftMemo
      Size = 8
    end
    object QMCabRepararESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMCabRepararCARGO_COSTE: TIntegerField
      DisplayLabel = 'Cargo Coste'
      FieldName = 'CARGO_COSTE'
    end
    object QMCabRepararID_NUM_SERIE: TIntegerField
      DisplayLabel = 'Id Nro. Serie'
      FieldName = 'ID_NUM_SERIE'
    end
    object QMCabRepararTOTAL_COSTE: TFloatField
      DisplayLabel = 'Total Coste'
      FieldName = 'TOTAL_COSTE'
    end
    object QMCabRepararESTADO_REPAR: TIntegerField
      DisplayLabel = 'Estado Rep.'
      FieldName = 'ESTADO_REPAR'
    end
    object QMCabRepararCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCabRepararREPARACION: TIntegerField
      DisplayLabel = 'Reparacion'
      FieldName = 'REPARACION'
    end
    object QMCabRepararID_FICHA_TECNICA: TIntegerField
      DisplayLabel = 'Id Fic. Tecnica'
      FieldName = 'ID_FICHA_TECNICA'
    end
    object QMCabRepararID_S: TIntegerField
      DisplayLabel = 'Id Doc.'
      FieldName = 'ID_S'
    end
    object QMCabRepararSERIE_DOC: TFIBStringField
      DisplayLabel = 'Serie Doc.'
      FieldName = 'SERIE_DOC'
      Size = 10
    end
    object QMCabRepararKILOMETROS: TFIBStringField
      DisplayLabel = 'Km'
      FieldName = 'KILOMETROS'
      Size = 60
    end
    object QMCabRepararSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMCabRepararFECHA_PREV_SALIDA: TDateTimeField
      DisplayLabel = 'Fec. Prev. Salida'
      FieldName = 'FECHA_PREV_SALIDA'
    end
    object QMCabRepararCONTACTO_EMAIL: TFIBStringField
      DisplayLabel = 'Contacto Email'
      FieldName = 'CONTACTO_EMAIL'
      Size = 100
    end
    object QMCabRepararCONTACTO_NOMBRE: TFIBStringField
      DisplayLabel = 'Contacto Nombre'
      FieldName = 'CONTACTO_NOMBRE'
      Size = 60
    end
    object QMCabRepararCONTACTO_TELEFONO: TFIBStringField
      DisplayLabel = 'Contacto Tel.'
      FieldName = 'CONTACTO_TELEFONO'
    end
    object QMCabRepararKILOMETROS_ENTRADA: TFloatField
      DisplayLabel = 'Km Entrada'
      FieldName = 'KILOMETROS_ENTRADA'
    end
    object QMCabRepararSITUACION: TIntegerField
      DisplayLabel = 'Situacion'
      FieldName = 'SITUACION'
    end
    object QMCabRepararID_S_ORIGEN: TIntegerField
      DisplayLabel = 'Id Doc. Origen'
      FieldName = 'ID_S_ORIGEN'
    end
    object QMCabRepararPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
    object QMCabRepararTIPO: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
    end
    object QMCabRepararCONTACTO_LATITUD: TFloatField
      DisplayLabel = 'Contacto Latitud'
      FieldName = 'CONTACTO_LATITUD'
    end
    object QMCabRepararCONTACTO_LONGITUD: TFloatField
      DisplayLabel = 'Contacto Longitud'
      FieldName = 'CONTACTO_LONGITUD'
    end
    object QMCabRepararCONTACTO_LOCALIDAD: TFIBStringField
      DisplayLabel = 'Contacto Localidad'
      FieldName = 'CONTACTO_LOCALIDAD'
      Size = 8
    end
    object QMCabRepararCONTACTO_DIR_NOMBRE: TFIBStringField
      DisplayLabel = 'Contacto Direccion'
      FieldName = 'CONTACTO_DIR_NOMBRE'
      Size = 100
    end
    object QMCabRepararCONTACTO_DIR_NOMBRE_2: TFIBStringField
      DisplayLabel = 'Contacto Direccion 2'
      FieldName = 'CONTACTO_DIR_NOMBRE_2'
      Size = 100
    end
    object QMCabRepararHORARIO_1_DESDE: TDateTimeField
      DisplayLabel = 'Horario 1 Desde'
      FieldName = 'HORARIO_1_DESDE'
    end
    object QMCabRepararHORARIO_1_HASTA: TDateTimeField
      DisplayLabel = 'Horario 1 Hasta'
      FieldName = 'HORARIO_1_HASTA'
    end
    object QMCabRepararHORARIO_2_DESDE: TDateTimeField
      DisplayLabel = 'Horario 2 Desde'
      FieldName = 'HORARIO_2_DESDE'
    end
    object QMCabRepararHORARIO_2_HASTA: TDateTimeField
      DisplayLabel = 'Horario 2 Hasta'
      FieldName = 'HORARIO_2_HASTA'
    end
    object QMCabRepararDIRECCION_DOCUMENTO: TIntegerField
      DisplayLabel = 'Dir. Documento'
      FieldName = 'DIRECCION_DOCUMENTO'
    end
    object QMCabRepararID_REP_RECEPCION: TIntegerField
      DisplayLabel = 'Id Recep.'
      FieldName = 'ID_REP_RECEPCION'
    end
    object QMCabRepararNOMBRE_COMERCIAL: TFIBStringField
      DisplayLabel = 'Nombre Comercial'
      FieldName = 'NOMBRE_COMERCIAL'
      Size = 60
    end
    object QMCabRepararNOMBRE_R_SOCIAL: TFIBStringField
      DisplayLabel = 'Razon Social'
      FieldName = 'NOMBRE_R_SOCIAL'
      Size = 60
    end
    object QMCabRepararTITULO_ESTADO: TFIBStringField
      DisplayLabel = 'Desc. Estado'
      FieldName = 'TITULO_ESTADO'
      Size = 40
    end
    object QMCabRepararTITULO_SITUACION: TFIBStringField
      DisplayLabel = 'Desc. Situacion'
      FieldName = 'TITULO_SITUACION'
      Size = 40
    end
    object QMCabRepararTITULO_TIPO_REPARACION: TFIBStringField
      DisplayLabel = 'Desc. Tipo Rep.'
      FieldName = 'TITULO_TIPO_REPARACION'
      Size = 25
    end
    object QMCabRepararTITULO_TIPO_ACTUACION: TFIBStringField
      DisplayLabel = 'Desc. Tipo Actuacion'
      FieldName = 'TITULO_TIPO_ACTUACION'
      Size = 25
    end
    object QMCabRepararTITULO_PROYECTO: TFIBStringField
      DisplayLabel = 'Desc. Proyecto'
      FieldName = 'TITULO_PROYECTO'
      Size = 60
    end
    object QMCabRepararTITULO_LOCALIDAD: TFIBStringField
      DisplayLabel = 'Localidad'
      FieldName = 'TITULO_LOCALIDAD'
      Size = 40
    end
    object QMCabRepararCODIGO_POSTAL: TFIBStringField
      DisplayLabel = 'Cod. Postal'
      FieldName = 'CODIGO_POSTAL'
      Size = 10
    end
    object QMCabRepararEJERCICIO_ORIGEN: TIntegerField
      DisplayLabel = 'Ejercicio Orig.'
      FieldName = 'EJERCICIO_ORIGEN'
    end
    object QMCabRepararCANAL_ORIGEN: TIntegerField
      DisplayLabel = 'Canal Orig.'
      FieldName = 'CANAL_ORIGEN'
    end
    object QMCabRepararSERIE_ORIGEN: TFIBStringField
      DisplayLabel = 'Serie Orig.'
      FieldName = 'SERIE_ORIGEN'
      Size = 10
    end
    object QMCabRepararTIPO_ORIGEN: TFIBStringField
      DisplayLabel = 'Tipo Orig.'
      FieldName = 'TIPO_ORIGEN'
      Size = 3
    end
    object QMCabRepararRIG_ORIGEN: TIntegerField
      DisplayLabel = 'RIG Orig.'
      FieldName = 'RIG_ORIGEN'
    end
    object QMCabRepararEJERCICIO_DESTINO: TIntegerField
      DisplayLabel = 'Ejer. Dest.'
      FieldName = 'EJERCICIO_DESTINO'
    end
    object QMCabRepararCANAL_DESTINO: TIntegerField
      DisplayLabel = 'Canal Dest.'
      FieldName = 'CANAL_DESTINO'
    end
    object QMCabRepararSERIE_DESTINO: TFIBStringField
      DisplayLabel = 'Serie Dest.'
      FieldName = 'SERIE_DESTINO'
      Size = 10
    end
    object QMCabRepararTIPO_DESTINO: TFIBStringField
      DisplayLabel = 'Tipo Dest.'
      FieldName = 'TIPO_DESTINO'
      Size = 3
    end
    object QMCabRepararRIG_DESTINO: TIntegerField
      DisplayLabel = 'RIG Dest.'
      FieldName = 'RIG_DESTINO'
    end
  end
  object DSQMCabReparar: TDataSource
    DataSet = QMCabReparar
    Left = 136
    Top = 56
  end
end
