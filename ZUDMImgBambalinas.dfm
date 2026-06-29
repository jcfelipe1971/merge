object ZDMImgBambalinas: TZDMImgBambalinas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 220
  Top = 107
  Height = 164
  Width = 186
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 122
    Top = 18
  end
  object xBambalinas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from z_ver_img_Bambalinas'
      'order by codigo')
    UniDirectional = False
    Left = 40
    Top = 16
    object xBambalinasCODIGO: TFIBStringField
      DisplayLabel = 'Codigo'
      FieldName = 'CODIGO'
      Size = 3
    end
    object xBambalinasDESCRIPCION: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'DESCRIPCION'
      Size = 60
    end
    object xBambalinasNUM_IMAGEN: TIntegerField
      DisplayLabel = 'Nro. Imagen'
      FieldName = 'NUM_IMAGEN'
    end
    object xBambalinasIMAGEN: TBlobField
      DisplayLabel = 'Imagen'
      FieldName = 'IMAGEN'
      Size = 8
    end
  end
  object DSxBambalinas: TDataSource
    DataSet = xBambalinas
    Left = 40
    Top = 72
  end
end
