object DMSIICertificados: TDMSIICertificados
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 379
  Top = 262
  Height = 275
  Width = 367
  object QMCertificados: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SII_CERTIFICADOS'
      'WHERE'
      '  EMPRESA=:EMPRESA AND'
      '  RUT=:RUT')
    InsertSQL.Strings = (
      'INSERT INTO SII_CERTIFICADOS'
      
        '  (EMPRESA,CONTRASENYA,RUT, FECHA_RESOLUCION, NRO_RESOLUCION, NO' +
        'MBRE_RESPONSABLE, SUCSII)'
      'VALUES'
      
        '  (:EMPRESA, :CONTRASENYA, :RUT, :FECHA_RESOLUCION, :NRO_RESOLUC' +
        'ION, :NOMBRE_RESPONSABLE, :SUCSII)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SII_CERTIFICADOS'
      'WHERE'
      '  EMPRESA=?EMPRESA AND '
      '  RUT=?RUT ')
    SelectSQL.Strings = (
      'SELECT * FROM SII_CERTIFICADOS '
      'WHERE '
      'EMPRESA=:EMPRESA'
      'ORDER BY RUT')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SII_CERTIFICADOS'
      'SET'
      'CERTIFICADO = :CERTIFICADO,'
      'CONTRASENYA = :CONTRASENYA,'
      'FECHA_RESOLUCION = :FECHA_RESOLUCION,'
      'NRO_RESOLUCION = :NRO_RESOLUCION,'
      'NOMBRE_RESPONSABLE =  :NOMBRE_RESPONSABLE, '
      'SUCSII = :SUCSII'
      'WHERE'
      'EMPRESA = :EMPRESA AND'
      'RUT = :RUT')
    BeforePost = QMCertificadosBeforePost
    OnNewRecord = QMCertificadosNewRecord
    ClavesPrimarias.Strings = (
      'EMPRESA '
      'RUT ')
    AccionesInhibidas = []
    Opciones = [NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SII_CERTIFICADOS'
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 48
    Top = 24
    object QMCertificadosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMCertificadosCERTIFICADO: TBlobField
      DisplayLabel = 'Certificado'
      FieldName = 'CERTIFICADO'
      Size = 8
    end
    object QMCertificadosCONTRASENYA: TFIBStringField
      DisplayLabel = 'Contrase'#241'a'
      FieldName = 'CONTRASENYA'
      Size = 40
    end
    object QMCertificadosRUT: TFIBStringField
      FieldName = 'RUT'
    end
    object QMCertificadosFECHA_RESOLUCION: TDateTimeField
      DisplayLabel = 'Fecha Resolucion'
      FieldName = 'FECHA_RESOLUCION'
    end
    object QMCertificadosNRO_RESOLUCION: TIntegerField
      DisplayLabel = 'Nro. Resolucion'
      FieldName = 'NRO_RESOLUCION'
    end
    object QMCertificadosNOMBRE_RESPONSABLE: TFIBStringField
      DisplayLabel = 'Nombre Responsable'
      FieldName = 'NOMBRE_RESPONSABLE'
      Size = 60
    end
    object QMCertificadosSUCSII: TFIBStringField
      DisplayLabel = 'Sucursal SII'
      FieldName = 'SUCSII'
      Size = 40
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 224
    Top = 24
  end
  object TUpdate: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 304
    Top = 24
  end
  object DSQMCertificados: TDataSource
    DataSet = QMCertificados
    Left = 144
    Top = 24
  end
end
