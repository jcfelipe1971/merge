object IsoDMAcciones: TIsoDMAcciones
  OldCreateOrder = False
  OnCreate = DMIsoAccionesCreate
  Left = 521
  Top = 199
  Height = 235
  Width = 308
  object DSQMIsoAcciones: TDataSource
    DataSet = QMIsoAcciones
    Left = 47
    Top = 72
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 229
    Top = 27
  end
  object frIsoAcciones: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Accion Correctiva/Preventiva'
    RebuildPrinter = False
    OnBeforePrint = frIsoAccionesEnterRect
    OnEnterRect = frIsoAccionesEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 129
    Top = 19
    ReportForm = {19000000}
  end
  object xTipo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM ISO_INC_ACCIONES_TIPO'
      'where tipo=?tipo')
    UniDirectional = False
    DataSource = DSQMIsoAcciones
    Left = 44
    Top = 144
    object xTipoDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
    end
    object xTipoTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
  end
  object QMIsoAcciones: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM ISO_ACCIONES_PRE'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  RIC=?old_RIC AND '
      '  TIPO=?old_TIPO ')
    InsertSQL.Strings = (
      'INSERT INTO ISO_ACCIONES_PRE'
      
        '  (FECHA,DESCRIPCIONINC,ANALISIS,CAUSAS,ACCION,COMPROBACION,FECH' +
        'ACIERRE,COSTE,ID_ACCION_PRE,TIEMPO,ID_INC,ID_INC_LINEA_ACC,RIC,P' +
        'ROCEDENCIA,DESCRIPCION,FDESCRIPCIONINC,FANALISIS,FACCION,FCOMPRO' +
        'BACION,EMPRESA,ID_RECURSO,PLANO,TIPO,FECHAPREVISTA)'
      'VALUES'
      
        '  (?FECHA,?DESCRIPCIONINC,?ANALISIS,?CAUSAS,?ACCION,?COMPROBACIO' +
        'N,?FECHACIERRE,?COSTE,?ID_ACCION_PRE,?TIEMPO,?ID_INC,?ID_INC_LIN' +
        'EA_ACC,?RIC,?PROCEDENCIA,?DESCRIPCION,?FDESCRIPCIONINC,?FANALISI' +
        'S,?FACCION,?FCOMPROBACION,?EMPRESA,?ID_RECURSO,?PLANO,?TIPO,?FEC' +
        'HAPREVISTA)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM ISO_ACCIONES_PRE'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  RIC=?RIC AND '
      '  TIPO=?TIPO ')
    SelectSQL.Strings = (
      'SELECT * FROM ISO_ACCIONES_PRE'
      'where empresa=?empresa'
      'order by tipo, ric')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE ISO_ACCIONES_PRE'
      'SET'
      '  FECHA=?FECHA '
      '  ,DESCRIPCIONINC=?DESCRIPCIONINC '
      '  ,ANALISIS=?ANALISIS '
      '  ,CAUSAS=?CAUSAS '
      '  ,ACCION=?ACCION '
      '  ,COMPROBACION=?COMPROBACION '
      '  ,FECHACIERRE=?FECHACIERRE '
      '  ,COSTE=?COSTE '
      '  ,ID_ACCION_PRE=?ID_ACCION_PRE '
      '  ,TIEMPO=?TIEMPO '
      '  ,ID_INC=?ID_INC '
      '  ,ID_INC_LINEA_ACC=?ID_INC_LINEA_ACC '
      '  ,PROCEDENCIA=?PROCEDENCIA '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,FDESCRIPCIONINC=?FDESCRIPCIONINC '
      '  ,FANALISIS=?FANALISIS '
      '  ,FACCION=?FACCION '
      '  ,FCOMPROBACION=?FCOMPROBACION '
      '  ,ID_RECURSO=?ID_RECURSO '
      '  ,PLANO=?PLANO'
      '  ,FECHAPREVISTA=?FECHAPREVISTA'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  RIC=?RIC AND '
      '  TIPO=?TIPO ')
    AfterDelete = Graba
    AfterPost = Graba
    AfterScroll = QMIsoAccionesAfterScroll
    BeforeOpen = QMIsoAccionesBeforeOpen
    BeforePost = QMIsoAccionesBeforePost
    OnNewRecord = QMIsoAccionesNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'RIC '
      'TIPO ')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'ISO_ACCIONES_PRE'
    UpdateTransaction = TLocal
    Left = 44
    Top = 20
    object QMIsoAccionesRIC: TIntegerField
      DisplayLabel = 'R.I.C.'
      FieldName = 'RIC'
    end
    object QMIsoAccionesPROCEDENCIA: TFIBStringField
      DisplayLabel = 'Procedencia'
      FieldName = 'PROCEDENCIA'
    end
    object QMIsoAccionesFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object QMIsoAccionesDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 100
    end
    object QMIsoAccionesPLANO: TFIBStringField
      DisplayLabel = 'Plano'
      FieldName = 'PLANO'
      Size = 15
    end
    object QMIsoAccionesDESCRIPCIONINC: TBlobField
      DisplayLabel = 'Descripcion Inc.'
      FieldName = 'DESCRIPCIONINC'
      Size = 8
    end
    object QMIsoAccionesFDESCRIPCIONINC: TIntegerField
      DisplayLabel = 'Responsable Descripci'#243'n Inc.'
      FieldName = 'FDESCRIPCIONINC'
    end
    object QMIsoAccionesANALISIS: TBlobField
      DisplayLabel = 'An'#225'lisis'
      FieldName = 'ANALISIS'
      Size = 8
    end
    object QMIsoAccionesFANALISIS: TIntegerField
      DisplayLabel = 'Responsable An'#225'lisis'
      FieldName = 'FANALISIS'
    end
    object QMIsoAccionesCAUSAS: TBlobField
      DisplayLabel = 'Causas'
      FieldName = 'CAUSAS'
      Size = 8
    end
    object QMIsoAccionesACCION: TBlobField
      DisplayLabel = 'Acci'#243'n'
      FieldName = 'ACCION'
      Size = 8
    end
    object QMIsoAccionesFACCION: TIntegerField
      DisplayLabel = 'Responsable Acci'#243'n'
      FieldName = 'FACCION'
    end
    object QMIsoAccionesCOMPROBACION: TBlobField
      DisplayLabel = 'Comprobaci'#243'n'
      FieldName = 'COMPROBACION'
      Size = 8
    end
    object QMIsoAccionesFCOMPROBACION: TIntegerField
      DisplayLabel = 'Responsable Comprobaci'#243'n'
      FieldName = 'FCOMPROBACION'
    end
    object QMIsoAccionesFECHACIERRE: TDateTimeField
      DisplayLabel = 'Fecha Cierre'
      FieldName = 'FECHACIERRE'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object QMIsoAccionesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMIsoAccionesTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMIsoAccionesID_RECURSO: TFIBStringField
      DisplayLabel = 'ID Recurso'
      FieldName = 'ID_RECURSO'
      Size = 5
    end
    object QMIsoAccionesTIEMPO: TIntegerField
      DisplayLabel = 'Tiempo'
      FieldName = 'TIEMPO'
    end
    object QMIsoAccionesID_ACCION_PRE: TIntegerField
      DisplayLabel = 'ID Accion Pre.'
      FieldName = 'ID_ACCION_PRE'
    end
    object QMIsoAccionesCOSTE: TFloatField
      DisplayLabel = 'Coste'
      FieldName = 'COSTE'
    end
    object QMIsoAccionesID_INC: TIntegerField
      DisplayLabel = 'ID Inc.'
      FieldName = 'ID_INC'
    end
    object QMIsoAccionesID_INC_LINEA_ACC: TIntegerField
      DisplayLabel = 'ID Inc. Linea Acc.'
      FieldName = 'ID_INC_LINEA_ACC'
    end
    object QMIsoAccionesFECHAPREVISTA: TDateTimeField
      DisplayLabel = 'Fecha Prevista'
      FieldName = 'FECHAPREVISTA'
    end
    object QMIsoAccionesESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
  end
  object QBloquea: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'update iso_acciones_pre'
      '  set estado=?estado'
      'where'
      '  ID_ACCION_PRE = ?ID_ACCION_PRE')
    Transaction = TLocal
    AutoTrans = True
    Left = 223
    Top = 148
  end
  object xEstados: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT'
      '  ESTADO,TITULO'
      'FROM SYS_GES_ESTADOS                '
      'WHERE'
      '  ESTADO=?ESTADO ')
    SelectSQL.Strings = (
      'SELECT TITULO FROM SYS_GES_ESTADOS'
      'WHERE ESTADO=?ESTADO')
    UniDirectional = False
    DataSource = DSQMIsoAcciones
    Left = 156
    Top = 84
  end
  object DSxEstado: TDataSource
    DataSet = xEstados
    Left = 216
    Top = 84
  end
end
