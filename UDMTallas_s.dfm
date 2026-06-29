object DMTallas_s: TDMTallas_s
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 584
  Top = 208
  Height = 410
  Width = 342
  object QMver_detalles_gr_sd: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'Delete from ver_detalles_gr_sd where id_d_s_gr=?id_d_s_gr')
    InsertSQL.Strings = (
      'insert into ver_detalles_gr_Sd ('
      '  Ref_proveedor, s_color, id_s,ID_D_S_GR,'
      
        '  p_compra, p_venta, t01, t02, t03, t04, t05, t06, t07, t08, t09' +
        ', t10, t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t2' +
        '2,caja_edi,tipo_caja_edi)'
      'values ('
      '?Ref_proveedor, ?s_color, ?id_s,?ID_D_S_GR,'
      
        '?p_compra, ?p_venta, ?t01, ?t02, ?t03, ?t04, ?t05, ?t06, ?t07, ?' +
        't08, ?t09, ?t10, ?t11, ?t12, ?t13, ?t14, ?t15, ?t16, ?t17, ?t18,' +
        ' ?t19, ?t20, ?t21, ?t22,?caja_edi,?tipo_caja_edi)')
    RefreshSQL.Strings = (
      'Select * FROM xver_detalles_s_grl_ro(?ID_D_S_GR)')
    SelectSQL.Strings = (
      'Select * FROM xver_detalles_s_gr_ro(?id_s)'
      'order by id_d_s_gr')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_DETALLES_GR_SD'
      'SET'
      'REF_PROVEEDOR = :REF_PROVEEDOR,'
      'S_COLOR = :S_COLOR,'
      'P_COMPRA = :P_COMPRA,'
      'P_VENTA = :P_VENTA,'
      'T01 = :T01,'
      'T02 = :T02,'
      'T03 = :T03,'
      'T04 = :T04,'
      'T05 = :T05,'
      'T06 = :T06,'
      'T07 = :T07,'
      'T08 = :T08,'
      'T09 = :T09,'
      'T10 = :T10,'
      'T11 = :T11,'
      'T12 = :T12,'
      'T13 = :T13,'
      'T14 = :T14,'
      'T15 = :T15,'
      'T16 = :T16,'
      'T17 = :T17,'
      'T18 = :T18,'
      'T19 = :T19,'
      'T20 = :T20,'
      'T21 = :T21,'
      'T22 = :T22,'
      'CAJA_EDI = :CAJA_EDI,'
      'TIPO_CAJA_EDI = :TIPO_CAJA_EDI'
      'WHERE'
      'ID_D_S_GR = :ID_D_S_GR')
    AfterDelete = QMver_detalles_gr_sdAfterPost
    AfterPost = QMver_detalles_gr_sdAfterPost
    BeforePost = QMver_detalles_gr_sdBeforePost
    OnNewRecord = QMver_detalles_gr_sdNewRecord
    ClavesPrimarias.Strings = (
      'ID_D_S_GR)'#13)
    AccionesInhibidas = []
    Opciones = [DesactivarControlesAlOrdenar, NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 64
    Top = 8
    object QMver_detalles_gr_sdREF_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Ref. Prov.'
      FieldName = 'REF_PROVEEDOR'
      OnChange = QMver_detalles_gr_sdREF_PROVEEDORChange
      Size = 25
    end
    object QMver_detalles_gr_sdS_COLOR: TFIBStringField
      DisplayLabel = 'Color'
      FieldName = 'S_COLOR'
      OnChange = QMver_detalles_gr_sdS_COLORChange
      Size = 10
    end
    object QMver_detalles_gr_sdID_A_M_C: TIntegerField
      DisplayLabel = 'ID Mod.'
      FieldName = 'ID_A_M_C'
    end
    object QMver_detalles_gr_sdID_G_T: TIntegerField
      DisplayLabel = 'ID Grupo Tallas'
      FieldName = 'ID_G_T'
    end
    object QMver_detalles_gr_sdP_COMPRA: TFloatField
      DisplayLabel = 'P. Compra'
      FieldName = 'P_COMPRA'
    end
    object QMver_detalles_gr_sdP_VENTA: TFloatField
      DisplayLabel = 'P. Venta'
      FieldName = 'P_VENTA'
    end
    object QMver_detalles_gr_sdTITM: TFIBStringField
      DisplayLabel = 'Modelo'
      FieldName = 'TITM'
      Size = 256
    end
    object QMver_detalles_gr_sdTITMC: TFIBStringField
      DisplayLabel = 'Mod. Color'
      FieldName = 'TITMC'
      Size = 256
    end
    object QMver_detalles_gr_sdID_D_S_GR: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_D_S_GR'
    end
    object QMver_detalles_gr_sdT01: TFloatField
      FieldName = 'T01'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_sdT02: TFloatField
      FieldName = 'T02'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_sdT03: TFloatField
      FieldName = 'T03'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_sdT04: TFloatField
      FieldName = 'T04'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_sdT05: TFloatField
      FieldName = 'T05'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_sdT06: TFloatField
      FieldName = 'T06'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_sdT07: TFloatField
      FieldName = 'T07'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_sdT08: TFloatField
      FieldName = 'T08'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_sdT09: TFloatField
      FieldName = 'T09'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_sdT10: TFloatField
      FieldName = 'T10'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_sdT11: TFloatField
      FieldName = 'T11'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_sdT12: TFloatField
      FieldName = 'T12'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_sdT13: TFloatField
      FieldName = 'T13'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_sdT14: TFloatField
      FieldName = 'T14'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_sdT15: TFloatField
      FieldName = 'T15'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_sdT16: TFloatField
      FieldName = 'T16'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_sdT17: TFloatField
      FieldName = 'T17'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_sdT18: TFloatField
      FieldName = 'T18'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_sdT19: TFloatField
      FieldName = 'T19'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_sdT20: TFloatField
      FieldName = 'T20'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_sdT21: TFloatField
      FieldName = 'T21'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_sdT22: TFloatField
      FieldName = 'T22'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_sdUTOTAL: TFloatField
      DisplayLabel = 'Total Uds.'
      FieldName = 'UTOTAL'
    end
    object QMver_detalles_gr_sdPTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'PTOTAL'
    end
    object QMver_detalles_gr_sdCAMBIA: TIntegerField
      DisplayLabel = 'Cambia'
      FieldName = 'CAMBIA'
    end
    object QMver_detalles_gr_sdID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
    object QMver_detalles_gr_sdCAJA_EDI: TIntegerField
      DisplayLabel = 'Caja EDI'
      FieldName = 'CAJA_EDI'
    end
    object QMver_detalles_gr_sdTIPO_CAJA_EDI: TFIBStringField
      DisplayLabel = 'Tipo Caja EDI'
      FieldName = 'TIPO_CAJA_EDI'
      Size = 5
    end
  end
  object QMver_detalles_gr_sd_pv: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 32
    CachedUpdates = False
    InsertSQL.Strings = (
      'select * from ver_detalles_gr_sd_pv')
    RefreshSQL.Strings = (
      'Select * FROM xver_detalles_s_grl_ro_pv(?ID_D_S_GR)')
    SelectSQL.Strings = (
      'Select * FROM xver_detalles_s_gr_ro_pv(?id_s)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_DETALLES_GR_SD_PV'
      'SET'
      'P_VENTA = :P_VENTA,'
      'P01 = :P01,'
      'P02 = :P02,'
      'P03 = :P03,'
      'P04 = :P04,'
      'P05 = :P05,'
      'P06 = :P06,'
      'P07 = :P07,'
      'P08 = :P08,'
      'P09 = :P09,'
      'P10 = :P10,'
      'P11 = :P11,'
      'P12 = :P12,'
      'P13 = :P13,'
      'P14 = :P14,'
      'P15 = :P15,'
      'P16 = :P16,'
      'P17 = :P17,'
      'P18 = :P18,'
      'P19 = :P19,'
      'P20 = :P20,'
      'P21 = :P21,'
      'P22 = :P22'
      'WHERE'
      'ID_D_S_GR = :ID_D_S_GR')
    AfterPost = QMver_detalles_gr_sdAfterPost
    OnNewRecord = QMver_detalles_gr_sd_pvNewRecord
    ClavesPrimarias.Strings = (
      'ID_D_S_GR)'#13)
    AccionesInhibidas = []
    Opciones = [DesactivarControlesAlOrdenar, NoControlarConcurrencia]
    AutoSQLdeVistas = False
    ComprobarTabla = False
    Mensajes = False
    BloqOpt = True
    UpdateTransaction = TUpdate
    AutoCommit = True
    Left = 64
    Top = 56
    object QMver_detalles_gr_sd_pvREF_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Ref. Proveedor'
      FieldName = 'REF_PROVEEDOR'
      Size = 25
    end
    object QMver_detalles_gr_sd_pvS_COLOR: TFIBStringField
      DisplayLabel = 'Color'
      FieldName = 'S_COLOR'
      Size = 10
    end
    object QMver_detalles_gr_sd_pvID_A_M_C: TIntegerField
      DisplayLabel = 'ID Mod.'
      FieldName = 'ID_A_M_C'
    end
    object QMver_detalles_gr_sd_pvID_G_T: TIntegerField
      DisplayLabel = 'ID Grupo Tallas'
      FieldName = 'ID_G_T'
    end
    object QMver_detalles_gr_sd_pvP_COMPRA: TFloatField
      DisplayLabel = 'P. Compra'
      FieldName = 'P_COMPRA'
    end
    object QMver_detalles_gr_sd_pvP_VENTA: TFloatField
      DisplayLabel = 'P. Venta'
      FieldName = 'P_VENTA'
    end
    object QMver_detalles_gr_sd_pvTITM: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITM'
      Size = 256
    end
    object QMver_detalles_gr_sd_pvTITMC: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITMC'
      Size = 256
    end
    object QMver_detalles_gr_sd_pvID_D_S_GR: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_D_S_GR'
    end
    object QMver_detalles_gr_sd_pvP01: TFloatField
      FieldName = 'P01'
    end
    object QMver_detalles_gr_sd_pvP02: TFloatField
      FieldName = 'P02'
    end
    object QMver_detalles_gr_sd_pvP03: TFloatField
      FieldName = 'P03'
    end
    object QMver_detalles_gr_sd_pvP04: TFloatField
      FieldName = 'P04'
    end
    object QMver_detalles_gr_sd_pvP05: TFloatField
      FieldName = 'P05'
    end
    object QMver_detalles_gr_sd_pvP06: TFloatField
      FieldName = 'P06'
    end
    object QMver_detalles_gr_sd_pvP07: TFloatField
      FieldName = 'P07'
    end
    object QMver_detalles_gr_sd_pvP08: TFloatField
      FieldName = 'P08'
    end
    object QMver_detalles_gr_sd_pvP09: TFloatField
      FieldName = 'P09'
    end
    object QMver_detalles_gr_sd_pvP10: TFloatField
      FieldName = 'P10'
    end
    object QMver_detalles_gr_sd_pvP11: TFloatField
      FieldName = 'P11'
    end
    object QMver_detalles_gr_sd_pvP12: TFloatField
      FieldName = 'P12'
    end
    object QMver_detalles_gr_sd_pvP13: TFloatField
      FieldName = 'P13'
    end
    object QMver_detalles_gr_sd_pvP14: TFloatField
      FieldName = 'P14'
    end
    object QMver_detalles_gr_sd_pvP15: TFloatField
      FieldName = 'P15'
    end
    object QMver_detalles_gr_sd_pvP16: TFloatField
      FieldName = 'P16'
    end
    object QMver_detalles_gr_sd_pvP17: TFloatField
      FieldName = 'P17'
    end
    object QMver_detalles_gr_sd_pvP18: TFloatField
      FieldName = 'P18'
    end
    object QMver_detalles_gr_sd_pvP19: TFloatField
      FieldName = 'P19'
    end
    object QMver_detalles_gr_sd_pvP20: TFloatField
      FieldName = 'P20'
    end
    object QMver_detalles_gr_sd_pvP21: TFloatField
      FieldName = 'P21'
    end
    object QMver_detalles_gr_sd_pvP22: TFloatField
      FieldName = 'P22'
    end
    object QMver_detalles_gr_sd_pvID_S: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_S'
    end
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 184
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
    Left = 184
    Top = 56
  end
end
