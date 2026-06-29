object DMMovEntreUbicaciones: TDMMovEntreUbicaciones
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 556
  Top = 322
  Height = 449
  Width = 435
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 64
    Top = 8
  end
  object xUbicacionO: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * '
      'from art_almacenes_ubicaciones'
      'where empresa=?empresa and composicion=?composicion')
    UniDirectional = False
    Left = 64
    Top = 56
    object xUbicacionOEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xUbicacionOALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xUbicacionOCALLE: TFIBStringField
      DisplayLabel = 'Calle'
      FieldName = 'CALLE'
      Size = 3
    end
    object xUbicacionOESTANTERIA: TFIBStringField
      DisplayLabel = 'Estanteria'
      FieldName = 'ESTANTERIA'
      Size = 3
    end
    object xUbicacionOREPISA: TFIBStringField
      DisplayLabel = 'Repisa'
      FieldName = 'REPISA'
      Size = 3
    end
    object xUbicacionOPOSICION: TFIBStringField
      DisplayLabel = 'Pos.'
      FieldName = 'POSICION'
      Size = 3
    end
    object xUbicacionOTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xUbicacionOVOLUMEN_MAX: TFloatField
      DisplayLabel = 'Vol. Max.'
      FieldName = 'VOLUMEN_MAX'
    end
    object xUbicacionODIAMETRO_MAX: TFloatField
      DisplayLabel = 'Diam. Max.'
      FieldName = 'DIAMETRO_MAX'
    end
    object xUbicacionOPESO_MAX: TFloatField
      DisplayLabel = 'Peso Max.'
      FieldName = 'PESO_MAX'
    end
    object xUbicacionOVOLUMEN_ACC: TFloatField
      DisplayLabel = 'Vol. Acc.'
      FieldName = 'VOLUMEN_ACC'
    end
    object xUbicacionOPESO_ACC: TFloatField
      DisplayLabel = 'Peso Acc.'
      FieldName = 'PESO_ACC'
    end
    object xUbicacionODIAMETRO_ACC: TFloatField
      DisplayLabel = 'Diam. Acc.'
      FieldName = 'DIAMETRO_ACC'
    end
    object xUbicacionOID_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubicacion'
      FieldName = 'ID_UBICACION'
    end
    object xUbicacionOCOMPOSICION: TFIBStringField
      DisplayLabel = 'Composicion'
      FieldName = 'COMPOSICION'
      Size = 15
    end
    object xUbicacionOGENERAL: TIntegerField
      DisplayLabel = 'General'
      FieldName = 'GENERAL'
    end
    object xUbicacionOUNIDADES_ACC: TFloatField
      DisplayLabel = 'Uds. Acc.'
      FieldName = 'UNIDADES_ACC'
    end
  end
  object xTituloUBD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select titulo '
      'from art_almacenes_ubicaciones'
      'where empresa=?empresa and composicion=?composicion')
    UniDirectional = False
    Left = 64
    Top = 104
    object FIBStringField1: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSxUbicacionO: TDataSource
    DataSet = xUbicacionO
    Left = 184
    Top = 56
  end
  object DSxTituloUBD: TDataSource
    DataSet = xTituloUBD
    Left = 184
    Top = 104
  end
  object xArticulosD: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_ART_STOCKS_UBICACIONES'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'CANAL = :CANAL AND'
      'COMPOSICION = :COMPOSICION')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 64
    Top = 200
    object xArticulosDEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xArticulosDCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xArticulosDALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xArticulosDCALLE: TFIBStringField
      DisplayLabel = 'Calle'
      FieldName = 'CALLE'
      Size = 3
    end
    object xArticulosDESTANTERIA: TFIBStringField
      DisplayLabel = 'Estanteria'
      FieldName = 'ESTANTERIA'
      Size = 3
    end
    object xArticulosDREPISA: TFIBStringField
      DisplayLabel = 'Repisa'
      FieldName = 'REPISA'
      Size = 3
    end
    object xArticulosDPOSICION: TFIBStringField
      DisplayLabel = 'Pos.'
      FieldName = 'POSICION'
      Size = 3
    end
    object xArticulosDARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xArticulosDTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
    object xArticulosDCOMPOSICION: TFIBStringField
      DisplayLabel = 'Composicion'
      FieldName = 'COMPOSICION'
      Size = 15
    end
    object xArticulosDTITULO_COMP: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_COMP'
      Size = 60
    end
    object xArticulosDID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object xArticulosDENTRADAS: TFloatField
      DisplayLabel = 'Entradas'
      FieldName = 'ENTRADAS'
    end
    object xArticulosDSALIDAS: TFloatField
      DisplayLabel = 'Salidas'
      FieldName = 'SALIDAS'
    end
    object xArticulosDEXISTENCIAS: TFloatField
      DisplayLabel = 'Existencias'
      FieldName = 'EXISTENCIAS'
    end
    object xArticulosDID_STOCKS_UB: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_STOCKS_UB'
    end
    object xArticulosDID_A_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubic. Art.'
      FieldName = 'ID_A_UBICACION'
    end
    object xArticulosDID_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubicacion'
      FieldName = 'ID_UBICACION'
    end
    object xArticulosDGENERAL: TIntegerField
      DisplayLabel = 'General'
      FieldName = 'GENERAL'
    end
  end
  object xArticulosO: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_ART_STOCKS_UBICACIONES'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'CANAL = :CANAL AND'
      'COMPOSICION = :COMPOSICION AND'
      'EXISTENCIAS <> 0')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 64
    Top = 152
    object xArticulosOEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xArticulosOCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xArticulosOALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xArticulosOCALLE: TFIBStringField
      DisplayLabel = 'Calle'
      FieldName = 'CALLE'
      Size = 3
    end
    object xArticulosOESTANTERIA: TFIBStringField
      DisplayLabel = 'Estanteria'
      FieldName = 'ESTANTERIA'
      Size = 3
    end
    object xArticulosOREPISA: TFIBStringField
      DisplayLabel = 'Repisa'
      FieldName = 'REPISA'
      Size = 3
    end
    object xArticulosOPOSICION: TFIBStringField
      DisplayLabel = 'Pos.'
      FieldName = 'POSICION'
      Size = 3
    end
    object xArticulosOARTICULO: TFIBStringField
      DisplayLabel = 'Articulo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object xArticulosOTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 256
    end
    object xArticulosOCOMPOSICION: TFIBStringField
      DisplayLabel = 'Composicion'
      FieldName = 'COMPOSICION'
      Size = 15
    end
    object xArticulosOTITULO_COMP: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO_COMP'
      Size = 60
    end
    object xArticulosOID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object xArticulosOENTRADAS: TFloatField
      DisplayLabel = 'Entradas'
      FieldName = 'ENTRADAS'
    end
    object xArticulosOSALIDAS: TFloatField
      DisplayLabel = 'Salidas'
      FieldName = 'SALIDAS'
    end
    object xArticulosOEXISTENCIAS: TFloatField
      DisplayLabel = 'Existencias'
      FieldName = 'EXISTENCIAS'
    end
    object xArticulosOID_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubicacion'
      FieldName = 'ID_UBICACION'
    end
    object xArticulosOGENERAL: TIntegerField
      DisplayLabel = 'General'
      FieldName = 'GENERAL'
    end
    object xArticulosOID_STOCKS_UB: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_STOCKS_UB'
    end
    object xArticulosOID_A_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubic. Art.'
      FieldName = 'ID_A_UBICACION'
    end
  end
  object DSxArticulosO: TDataSource
    DataSet = xArticulosO
    Left = 184
    Top = 152
  end
  object DSxArticulosD: TDataSource
    DataSet = xArticulosD
    Left = 184
    Top = 200
  end
  object QMDetalle: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'delete from tmp_traspaso_entre_ub'
      'WHERE   ENTRADA=?ENTRADA AND'
      '                 EMPRESA=?EMPRESA AND'
      '                 CANAL=?CANAL AND'
      '                 ALMACEN=?ALMACEN AND'
      '                 CALLE=?CALLE AND'
      '                 ESTANTERIA=?ESTANTERIA AND'
      '                 REPISA=?REPISA AND'
      '                 POSICION=?POSICION AND'
      '                 ARTICULO=?ARTICULO AND'
      '                 LINEA=?LINEA'
      '')
    InsertSQL.Strings = (
      
        'insert into  tmp_traspaso_entre_ub(ENTRADA, EMPRESA, CANAL,ALMAC' +
        'EN,CALLE,ESTANTERIA,REPISA,POSICION,ARTICULO,UNIDADES,ID_A,ID_UB' +
        'ICACION,LINEA,TITULO,PESO,VOLUMEN,DIAMETRO,D_ALMACEN,D_CALLE,D_E' +
        'STANTERIA,D_REPISA,D_POSICION,D_ID_UBICACION,FECHA,EJERCICIO,ID_' +
        'LOTE)'
      
        '  values(?ENTRADA,?EMPRESA,?CANAL,?ALMACEN,?CALLE,?ESTANTERIA,?R' +
        'EPISA,?POSICION,?ARTICULO,?UNIDADES,?ID_A,?ID_UBICACION,?LINEA,?' +
        'TITULO,?PESO,?VOLUMEN,?DIAMETRO,?D_ALMACEN,?D_CALLE,?D_ESTANTERI' +
        'A,?D_REPISA,?D_POSICION,?D_ID_UBICACION,?FECHA,?EJERCICIO,?ID_LO' +
        'TE)')
    RefreshSQL.Strings = (
      'SELECT * FROM TMP_TRASPASO_ENTRE_UB'
      'WHERE   '
      'ENTRADA=?ENTRADA AND'
      'LINEA=?LINEA'
      '')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_TRASPASO_ENTRE_UB'
      'WHERE   ENTRADA=?ENTRADA AND'
      '                 EMPRESA=?EMPRESA AND'
      '                 CANAL=?CANAL AND'
      '                 ALMACEN=?ALMACEN AND'
      '                 CALLE=?CALLE AND'
      '                 ESTANTERIA=?ESTANTERIA AND'
      '                 REPISA=?REPISA AND'
      '                 POSICION=?POSICION')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE TMP_TRASPASO_ENTRE_UB'
      'SET UNIDADES=?UNIDADES, ID_LOTE=?ID_LOTE'
      'WHERE'
      '  ENTRADA=?ENTRADA AND'
      '  EMPRESA=?EMPRESA AND'
      '  CANAL=?CANAL AND'
      '  ALMACEN=?ALMACEN AND'
      '  CALLE=?CALLE AND'
      '  ESTANTERIA=?ESTANTERIA AND'
      '  REPISA=?REPISA AND'
      '  POSICION=?POSICION AND'
      '  ARTICULO=?ARTICULO'
      ''
      ' '
      '  ')
    AfterDelete = Graba
    AfterPost = Graba
    BeforePost = QMDetalleBeforePost
    OnNewRecord = QMDetalleNewRecord
    ClavesPrimarias.Strings = (
      'ENTRADA '
      'LINEA'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_TRASPASO_ENTRE_UB'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 64
    Top = 248
    object QMDetalleENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMDetalleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetalleCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDetalleALMACEN: TFIBStringField
      DisplayLabel = 'Almac'#233'n O'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object QMDetalleCALLE: TFIBStringField
      DisplayLabel = 'Calle'
      FieldName = 'CALLE'
      Size = 3
    end
    object QMDetalleESTANTERIA: TFIBStringField
      DisplayLabel = 'Estanteria'
      FieldName = 'ESTANTERIA'
      Size = 3
    end
    object QMDetalleREPISA: TFIBStringField
      DisplayLabel = 'Repisa'
      FieldName = 'REPISA'
      Size = 3
    end
    object QMDetallePOSICION: TFIBStringField
      DisplayLabel = 'Pos.'
      FieldName = 'POSICION'
      Size = 3
    end
    object QMDetalleARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      OnChange = QMDetalleARTICULOChange
      Size = 15
    end
    object QMDetalleLINEA: TIntegerField
      DisplayLabel = 'L'#237'nea'
      FieldName = 'LINEA'
    end
    object QMDetalleUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
      OnChange = QMDetalleUNIDADESChange
    end
    object QMDetalleID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMDetalleID_UBICACION: TIntegerField
      DisplayLabel = 'Ubicaci'#243'n O'
      FieldName = 'ID_UBICACION'
    end
    object QMDetalleTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMDetallePESO: TFloatField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
    end
    object QMDetalleVOLUMEN: TFloatField
      DisplayLabel = 'Volumen'
      FieldName = 'VOLUMEN'
    end
    object QMDetalleDIAMETRO: TFloatField
      DisplayLabel = 'Diametro'
      FieldName = 'DIAMETRO'
    end
    object QMDetalleD_ALMACEN: TFIBStringField
      DisplayLabel = 'Almac'#233'n D'
      FieldName = 'D_ALMACEN'
      Size = 3
    end
    object QMDetalleD_CALLE: TFIBStringField
      DisplayLabel = 'Calle D.'
      FieldName = 'D_CALLE'
      Size = 3
    end
    object QMDetalleD_ESTANTERIA: TFIBStringField
      DisplayLabel = 'Est. D.'
      FieldName = 'D_ESTANTERIA'
      Size = 3
    end
    object QMDetalleD_REPISA: TFIBStringField
      DisplayLabel = 'Rep. D.'
      FieldName = 'D_REPISA'
      Size = 3
    end
    object QMDetalleD_POSICION: TFIBStringField
      DisplayLabel = 'Pos. D.'
      FieldName = 'D_POSICION'
      Size = 3
    end
    object QMDetalleD_ID_UBICACION: TIntegerField
      DisplayLabel = 'Ubicaci'#243'n D'
      FieldName = 'D_ID_UBICACION'
    end
    object QMDetalleFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMDetalleEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDetalleID_LOTE: TIntegerField
      DisplayLabel = 'ID Lote'
      FieldName = 'ID_LOTE'
    end
    object QMDetalleLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      OnGetText = QMDetalleLOTEGetText
    end
  end
  object DSQMDetalle: TDataSource
    DataSet = QMDetalle
    Left = 184
    Top = 248
  end
  object xUbicacionD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT *'
      'FROM ART_ALMACENES_UBICACIONES'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'COMPOSICION = :COMPOSICION')
    UniDirectional = False
    Left = 64
    Top = 296
    object xUbicacionDEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xUbicacionDALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      Size = 3
    end
    object xUbicacionDCALLE: TFIBStringField
      DisplayLabel = 'Calle'
      FieldName = 'CALLE'
      Size = 3
    end
    object xUbicacionDESTANTERIA: TFIBStringField
      DisplayLabel = 'Estanteria'
      FieldName = 'ESTANTERIA'
      Size = 3
    end
    object xUbicacionDREPISA: TFIBStringField
      DisplayLabel = 'Repisa'
      FieldName = 'REPISA'
      Size = 3
    end
    object xUbicacionDPOSICION: TFIBStringField
      DisplayLabel = 'Pos.'
      FieldName = 'POSICION'
      Size = 3
    end
    object xUbicacionDTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xUbicacionDVOLUMEN_MAX: TFloatField
      DisplayLabel = 'Vol. Max.'
      FieldName = 'VOLUMEN_MAX'
    end
    object xUbicacionDDIAMETRO_MAX: TFloatField
      DisplayLabel = 'Diam. Max.'
      FieldName = 'DIAMETRO_MAX'
    end
    object xUbicacionDPESO_MAX: TFloatField
      DisplayLabel = 'Peso Max.'
      FieldName = 'PESO_MAX'
    end
    object xUbicacionDVOLUMEN_ACC: TFloatField
      DisplayLabel = 'Vol. Acc.'
      FieldName = 'VOLUMEN_ACC'
    end
    object xUbicacionDPESO_ACC: TFloatField
      DisplayLabel = 'Peso Acc.'
      FieldName = 'PESO_ACC'
    end
    object xUbicacionDDIAMETRO_ACC: TFloatField
      DisplayLabel = 'Diam. Acc.'
      FieldName = 'DIAMETRO_ACC'
    end
    object xUbicacionDID_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubicacion'
      FieldName = 'ID_UBICACION'
    end
    object xUbicacionDCOMPOSICION: TFIBStringField
      DisplayLabel = 'Composicion'
      FieldName = 'COMPOSICION'
      Size = 15
    end
    object xUbicacionDGENERAL: TIntegerField
      DisplayLabel = 'General'
      FieldName = 'GENERAL'
    end
    object xUbicacionDUNIDADES_ACC: TFloatField
      DisplayLabel = 'Uds. Acc.'
      FieldName = 'UNIDADES_ACC'
    end
  end
  object DSxUbicacionD: TDataSource
    DataSet = xUbicacionD
    Left = 184
    Top = 296
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 184
    Top = 8
  end
  object DSQMDetalleMovSimple: TDataSource
    DataSet = QMDetalleMovSimple
    Left = 184
    Top = 344
  end
  object QMDetalleMovSimple: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM TMP_TRASPASO_ENTRE_UB'
      'WHERE'
      '  LINEA=?old_LINEA AND '
      '  ENTRADA=?old_ENTRADA ')
    InsertSQL.Strings = (
      'INSERT INTO TMP_TRASPASO_ENTRE_UB'
      
        '  (FECHA,DIAMETRO,VOLUMEN,PESO,UNIDADES,D_ID_UBICACION,ID_UBICAC' +
        'ION,ID_A,LINEA,ENTRADA,TITULO,CANAL,EJERCICIO,EMPRESA,LOTE,D_POS' +
        'ICION,D_REPISA,D_ESTANTERIA,D_CALLE,D_ALMACEN,ARTICULO,POSICION,' +
        'REPISA,ESTANTERIA,CALLE,ALMACEN,ID_LOTE)'
      'VALUES'
      
        '  (?FECHA,?DIAMETRO,?VOLUMEN,?PESO,?UNIDADES,?D_ID_UBICACION,?ID' +
        '_UBICACION,?ID_A,?LINEA,?ENTRADA,?TITULO,?CANAL,?EJERCICIO,?EMPR' +
        'ESA,?LOTE,?D_POSICION,?D_REPISA,?D_ESTANTERIA,?D_CALLE,?D_ALMACE' +
        'N,?ARTICULO,?POSICION,?REPISA,?ESTANTERIA,?CALLE,?ALMACEN,?ID_LO' +
        'TE)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM TMP_TRASPASO_ENTRE_UB'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  ENTRADA=?ENTRADA ')
    SelectSQL.Strings = (
      'SELECT * FROM TMP_TRASPASO_ENTRE_UB'
      'WHERE'
      'ENTRADA=?ENTRADA '
      'ORDER BY LINEA')
    UniDirectional = True
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE TMP_TRASPASO_ENTRE_UB'
      'SET'
      '  FECHA=?FECHA '
      '  ,DIAMETRO=?DIAMETRO '
      '  ,VOLUMEN=?VOLUMEN '
      '  ,PESO=?PESO '
      '  ,UNIDADES=?UNIDADES '
      '  ,D_ID_UBICACION=?D_ID_UBICACION '
      '  ,ID_UBICACION=?ID_UBICACION '
      '  ,ID_A=?ID_A '
      '  ,TITULO=?TITULO '
      '  ,CANAL=?CANAL '
      '  ,EJERCICIO=?EJERCICIO '
      '  ,EMPRESA=?EMPRESA '
      '  ,LOTE=?LOTE '
      '  ,D_POSICION=?D_POSICION '
      '  ,D_REPISA=?D_REPISA '
      '  ,D_ESTANTERIA=?D_ESTANTERIA '
      '  ,D_CALLE=?D_CALLE '
      '  ,D_ALMACEN=?D_ALMACEN '
      '  ,ARTICULO=?ARTICULO '
      '  ,POSICION=?POSICION '
      '  ,REPISA=?REPISA '
      '  ,ESTANTERIA=?ESTANTERIA '
      '  ,CALLE=?CALLE '
      '  ,ALMACEN=?ALMACEN '
      '  ,ID_LOTE=?ID_LOTE'
      'WHERE'
      '  LINEA=?LINEA AND '
      '  ENTRADA=?ENTRADA ')
    BeforePost = QMDetalleBeforePost
    OnNewRecord = QMDetalleMovSimpleNewRecord
    ClavesPrimarias.Strings = (
      'LINEA '
      'ENTRADA ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'TMP_TRASPASO_ENTRE_UB'
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 64
    Top = 344
    object QMDetalleMovSimpleENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QMDetalleMovSimpleEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMDetalleMovSimpleEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMDetalleMovSimpleCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMDetalleMovSimpleALMACEN: TFIBStringField
      DisplayLabel = 'Almacen'
      FieldName = 'ALMACEN'
      OnChange = QMDetalleMovSimpleALMACENChange
      Size = 3
    end
    object QMDetalleMovSimpleCALLE: TFIBStringField
      DisplayLabel = 'Calle'
      FieldName = 'CALLE'
      Size = 3
    end
    object QMDetalleMovSimpleESTANTERIA: TFIBStringField
      DisplayLabel = 'Est.'
      FieldName = 'ESTANTERIA'
      Size = 3
    end
    object QMDetalleMovSimpleREPISA: TFIBStringField
      DisplayLabel = 'Rep.'
      FieldName = 'REPISA'
      Size = 3
    end
    object QMDetalleMovSimplePOSICION: TFIBStringField
      DisplayLabel = 'Pos.'
      FieldName = 'POSICION'
      Size = 3
    end
    object QMDetalleMovSimpleARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      OnChange = QMDetalleMovSimpleARTICULOChange
      Size = 15
    end
    object QMDetalleMovSimpleLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMDetalleMovSimpleUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
      OnChange = QMDetalleMovSimpleUNIDADESChange
    end
    object QMDetalleMovSimpleID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMDetalleMovSimpleID_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubiaci'#243'n O'
      FieldName = 'ID_UBICACION'
      OnChange = QMDetalleMovSimpleID_UBICACIONChange
    end
    object QMDetalleMovSimpleTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object QMDetalleMovSimplePESO: TFloatField
      DisplayLabel = 'Peso'
      FieldName = 'PESO'
    end
    object QMDetalleMovSimpleVOLUMEN: TFloatField
      DisplayLabel = 'Volumen'
      FieldName = 'VOLUMEN'
    end
    object QMDetalleMovSimpleDIAMETRO: TFloatField
      DisplayLabel = 'Diametro'
      FieldName = 'DIAMETRO'
    end
    object QMDetalleMovSimpleD_ALMACEN: TFIBStringField
      DisplayLabel = 'Alm. D.'
      FieldName = 'D_ALMACEN'
      Size = 3
    end
    object QMDetalleMovSimpleD_CALLE: TFIBStringField
      DisplayLabel = 'Calle D.'
      FieldName = 'D_CALLE'
      Size = 3
    end
    object QMDetalleMovSimpleD_ESTANTERIA: TFIBStringField
      DisplayLabel = 'Est. D.'
      FieldName = 'D_ESTANTERIA'
      Size = 3
    end
    object QMDetalleMovSimpleD_REPISA: TFIBStringField
      DisplayLabel = 'Rep. D.'
      FieldName = 'D_REPISA'
      Size = 3
    end
    object QMDetalleMovSimpleD_POSICION: TFIBStringField
      DisplayLabel = 'Pos. D.'
      FieldName = 'D_POSICION'
      Size = 3
    end
    object QMDetalleMovSimpleD_ID_UBICACION: TIntegerField
      DisplayLabel = 'ID Ubicaci'#243'n D'
      FieldName = 'D_ID_UBICACION'
      OnChange = QMDetalleMovSimpleD_ID_UBICACIONChange
    end
    object QMDetalleMovSimpleFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMDetalleMovSimpleTITULO_UBIC_ORIGEN: TStringField
      DisplayLabel = 'Ubic. Orig.'
      FieldKind = fkCalculated
      FieldName = 'TITULO_UBIC_ORIGEN'
      OnGetText = QMDetalleMovSimpleTITULO_UBIC_ORIGENGetText
      Size = 60
      Calculated = True
    end
    object QMDetalleMovSimpleTITULO_UBIC_DESTINO: TStringField
      DisplayLabel = 'Ubic. Dest.'
      FieldKind = fkCalculated
      FieldName = 'TITULO_UBIC_DESTINO'
      OnGetText = QMDetalleMovSimpleTITULO_UBIC_DESTINOGetText
      Size = 60
      Calculated = True
    end
    object QMDetalleMovSimpleID_LOTE: TIntegerField
      DisplayLabel = 'ID Lote'
      FieldName = 'ID_LOTE'
    end
    object QMDetalleMovSimpleLOTE: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE'
      OnGetText = QMDetalleMovSimpleLOTEGetText
    end
  end
end
