object DMFacturacionCuotasCli: TDMFacturacionCuotasCli
  OldCreateOrder = False
  OnCreate = DMFacturaCuotasCreate
  Left = 460
  Top = 213
  Height = 333
  Width = 420
  object QMCuotas: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM VER_CLIENTES_CUOTAS_DETALLE_DOC'
      'WHERE'
      '  EMPRESA=?old_EMPRESA AND '
      '  CLIENTE=?old_CLIENTE AND '
      '  CUOTA=?old_CUOTA AND '
      '  LINEA=?old_LINEA AND'
      '  LINEA_DET=?LINEA_DET')
    InsertSQL.Strings = (
      'INSERT INTO VER_CLIENTES_CUOTAS_DETALLE_DOC'
      
        '  (EMPRESA,CLIENTE,TERCERO,TITULO,CUOTA,LINEA,ARTICULO,DESCRIPCI' +
        'ON,IMPORTE,DESCUENTO,SUPLIDO,FECHA,TIPO_DOC,AGRUPADA,PROCESADA,I' +
        'D_A,ID_S,'
      'UNIDADES)'
      'VALUES'
      
        '  (?EMPRESA,?CLIENTE,?TERCERO,?TITULO,?CUOTA,?LINEA,?ARTICULO,?D' +
        'ESCRIPCION,?IMPORTE,?DESCUENTO,?SUPLIDO,?FECHA,?TIPO_DOC,?AGRUPA' +
        'DA,?PROCESADA,?ID_A,?ID_S,'
      '?UNIDADES)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM VER_CLIENTES_CUOTAS_DETALLE_DOC'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CLIENTE=?CLIENTE AND '
      '  CUOTA=?CUOTA AND '
      '  LINEA=?LINEA AND'
      '  LINEA_DET=?LINEA_DET')
    SelectSQL.Strings = (
      'SELECT * FROM VER_CLIENTES_CUOTAS_DETALLE_DOC'
      'WHERE EMPRESA = ?EMPRESA'
      'AND CANAL = ?CANAL '
      'AND ID_S = 0 '
      'ORDER BY CLIENTE,CUOTA,FECHA, LINEA, LINEA_DET')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_CLIENTES_CUOTAS_DETALLE_DOC'
      'SET'
      '  TERCERO=?TERCERO '
      '  ,TITULO=?TITULO '
      '  ,ARTICULO=?ARTICULO '
      '  ,DESCRIPCION=?DESCRIPCION '
      '  ,IMPORTE=?IMPORTE '
      '  ,DESCUENTO=?DESCUENTO '
      '  ,SUPLIDO=?SUPLIDO '
      '  ,FECHA=?FECHA '
      '  ,TIPO_DOC=?TIPO_DOC '
      '  ,AGRUPADA=?AGRUPADA '
      '  ,PROCESADA=?PROCESADA '
      '  ,ID_A=?ID_A '
      '  ,ID_S=?ID_S '
      '  ,UNIDADES=?UNIDADES'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  CLIENTE=?CLIENTE AND '
      '  CUOTA=?CUOTA AND '
      '  LINEA=?LINEA AND'
      '  LINEA_DET=?LINEA_DET')
    AfterDelete = Graba
    AfterOpen = QMCuotasAfterOpen
    AfterPost = Graba
    BeforeInsert = QMCuotasNewRecord
    OnCalcFields = QMCuotasCalcFields
    OnNewRecord = QMCuotasNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'CLIENTE '
      'CUOTA '
      'LINEA '
      'LINEA_DET'#13)
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = True
    ComprobarTabla = False
    Mensajes = False
    TableName = 'VER_CLIENTES_CUOTAS_DETALLE_DOC'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 56
    Top = 16
    object QMCuotasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCuotasCLIENTE: TIntegerField
      DisplayLabel = 'Cliente'
      FieldName = 'CLIENTE'
    end
    object QMCuotasTERCERO: TIntegerField
      DisplayLabel = 'Tercero'
      FieldName = 'TERCERO'
    end
    object QMCuotasTITULO: TFIBStringField
      DisplayLabel = 'T'#237'tulo'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMCuotasCUOTA: TIntegerField
      DisplayLabel = 'Cuota'
      FieldName = 'CUOTA'
    end
    object QMCuotasLINEA: TIntegerField
      DisplayLabel = 'Nro. Cuota'
      FieldName = 'LINEA'
    end
    object QMCuotasARTICULO: TFIBStringField
      DisplayLabel = 'Art'#237'culo'
      FieldName = 'ARTICULO'
      Size = 15
    end
    object QMCuotasDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripci'#243'n'
      FieldName = 'DESCRIPCION'
      Size = 256
    end
    object QMCuotasIMPORTE: TFloatField
      DisplayLabel = 'Importe'
      FieldName = 'IMPORTE'
    end
    object QMCuotasDESCUENTO: TFloatField
      DisplayLabel = 'Desc.'
      FieldName = 'DESCUENTO'
    end
    object QMCuotasSUPLIDO: TIntegerField
      DisplayLabel = 'Suplido'
      FieldName = 'SUPLIDO'
    end
    object QMCuotasFECHA: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA'
    end
    object QMCuotasTIPO_DOC: TFIBStringField
      DisplayLabel = 'Tipo Doc.'
      FieldName = 'TIPO_DOC'
      Size = 3
    end
    object QMCuotasAGRUPADA: TIntegerField
      DisplayLabel = 'Agrupada'
      FieldName = 'AGRUPADA'
    end
    object QMCuotasPROCESADA: TIntegerField
      DisplayLabel = 'Proc.'
      FieldName = 'PROCESADA'
    end
    object QMCuotasID_A: TIntegerField
      DisplayLabel = 'ID Art.'
      FieldName = 'ID_A'
    end
    object QMCuotasID_S: TIntegerField
      DisplayLabel = 'ID S'
      FieldName = 'ID_S'
    end
    object QMCuotasUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object QMCuotasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMCuotasPUEDE_FACTURAR: TIntegerField
      FieldKind = fkCalculated
      FieldName = 'PUEDE_FACTURAR'
      Calculated = True
    end
    object QMCuotasID_S_D: TIntegerField
      FieldName = 'ID_S_D'
    end
    object QMCuotasPROYECTO: TIntegerField
      DisplayLabel = 'Proyecto'
      FieldName = 'PROYECTO'
    end
    object QMCuotasTITULO_PROYECTO: TFIBStringField
      DisplayLabel = 'T'#237'tulo proyecto'
      FieldName = 'TITULO_PROYECTO'
      Size = 60
    end
    object QMCuotasCODIGO_INTERNO_PROYECTO: TFIBStringField
      DisplayLabel = 'C'#243'd. Int. Proy.'
      FieldName = 'CODIGO_INTERNO_PROYECTO'
      Size = 25
    end
    object QMCuotasLINEA_DET: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA_DET'
    end
    object QMCuotasUNIDAD_FOMENTO: TFloatField
      DisplayLabel = 'Unidad fomento'
      FieldName = 'UNIDAD_FOMENTO'
    end
  end
  object DSQMCuotas: TDataSource
    DataSet = QMCuotas
    Left = 144
    Top = 16
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 288
    Top = 16
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 288
    Top = 64
  end
end
