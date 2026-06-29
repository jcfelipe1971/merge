object DMTipoLineaVentaKri: TDMTipoLineaVentaKri
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 273
  Top = 103
  Height = 150
  Width = 215
  object QMTipoLineaVentaKri: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = False
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'DELETE FROM SYS_TIPO_LINEA_VENTA_KRI'
      'WHERE'
      '  ID=?old_ID ')
    InsertSQL.Strings = (
      'INSERT INTO SYS_TIPO_LINEA_VENTA_KRI'
      '  (ID,TITULO)'
      'VALUES'
      '  (?ID,?TITULO)')
    RefreshSQL.Strings = (
      'SELECT'
      '  *'
      'FROM SYS_TIPO_LINEA_VENTA_KRI'
      'WHERE'
      '  ID=?ID ')
    SelectSQL.Strings = (
      'SELECT * FROM SYS_TIPO_LINEA_VENTA_KRI'
      'ORDER BY ID')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE SYS_TIPO_LINEA_VENTA_KRI'
      'SET'
      '  TITULO=?TITULO '
      'WHERE'
      '  ID=?ID ')
    ClavesPrimarias.Strings = (
      'ID')
    AccionesInhibidas = []
    Opciones = []
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    TableName = 'SYS_TIPO_LINEA_VENTA_KRI'
    Left = 50
    Top = 12
    object QMTipoLineaVentaKriID: TIntegerField
      DisplayLabel = 'Tipo'
      FieldName = 'ID'
    end
    object QMTipoLineaVentaKriTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 60
    end
  end
  object DSQMTipoLineaVentaKri: TDataSource
    DataSet = QMTipoLineaVentaKri
    Left = 51
    Top = 58
  end
  object TLocal: THYTransaction
    Active = True
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 150
    Top = 34
  end
end
