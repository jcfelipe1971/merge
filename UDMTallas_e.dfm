object DMTallas_e: TDMTallas_e
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 701
  Top = 248
  Height = 327
  Width = 312
  object QMver_detalles_gr_ed: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 32
    CachedUpdates = False
    DeleteSQL.Strings = (
      'Delete from ver_detalles_gr_ed where id_d_e_gr=?id_d_e_gr')
    InsertSQL.Strings = (
      'insert into ver_detalles_gr_ed ('
      '  Ref_proveedor, s_color, id_e,ID_D_E_GR,'
      
        '  p_compra, p_venta, t01, t02, t03, t04, t05, t06, t07, t08, t09' +
        ', t10, t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t2' +
        '2)'
      'values ('
      '?Ref_proveedor, ?s_color, ?id_e,?ID_D_E_GR,'
      
        '?p_compra, ?p_venta, ?t01, ?t02, ?t03, ?t04, ?t05, ?t06, ?t07, ?' +
        't08, ?t09, ?t10, ?t11, ?t12, ?t13, ?t14, ?t15, ?t16, ?t17, ?t18,' +
        ' ?t19, ?t20, ?t21, ?t22)')
    RefreshSQL.Strings = (
      'Select * FROM xver_detalles_e_grl_ro(?ID_D_E_GR)')
    SelectSQL.Strings = (
      'Select * FROM xver_detalles_e_gr_ro(?ID_E)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'Update ver_detalles_gr_ed '
      
        'set Ref_proveedor=?Ref_proveedor, s_color=?s_color, p_compra=?p_' +
        'compra, p_venta=?p_venta, '
      
        '      t01=?t01, t02=?t02, t03=?t03, t04=?t04, t05=?t05, t06=?t06' +
        ', t07=?t07, t08=?t08, t09=?t09, t10=?t10, t11=?t11, t12=?t12, t1' +
        '3=?t13, t14=?t14, t15=?t15, t16=?t16, t17=?t17, t18=?t18, t19=?t' +
        '19, t20=?t20, t21=?t21, t22=?t22 '
      'where id_d_e_gr=?id_d_e_gr')
    AfterDelete = QMver_detalles_gr_edAfterPost
    AfterPost = QMver_detalles_gr_edAfterPost
    BeforePost = QMver_detalles_gr_edBeforePost
    OnNewRecord = QMver_detalles_gr_edNewRecord
    ClavesPrimarias.Strings = (
      'ID_D_E_GR)'#13)
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
    object QMver_detalles_gr_edREF_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Ref. Prov.'
      DisplayWidth = 25
      FieldName = 'REF_PROVEEDOR'
      OnChange = QMver_detalles_gr_edREF_PROVEEDORChange
      Size = 25
    end
    object QMver_detalles_gr_edS_COLOR: TFIBStringField
      DisplayLabel = 'Color'
      FieldName = 'S_COLOR'
      OnChange = QMver_detalles_gr_edS_COLORChange
      Size = 10
    end
    object QMver_detalles_gr_edID_E: TIntegerField
      DisplayLabel = 'ID Doc.'
      FieldName = 'ID_E'
    end
    object QMver_detalles_gr_edID_A_M_C: TIntegerField
      DisplayLabel = 'ID Mod.'
      FieldName = 'ID_A_M_C'
    end
    object QMver_detalles_gr_edID_G_T: TIntegerField
      DisplayLabel = 'ID Grupo Tallas'
      FieldName = 'ID_G_T'
    end
    object QMver_detalles_gr_edP_COMPRA: TFloatField
      DisplayLabel = 'P. Compra'
      FieldName = 'P_COMPRA'
    end
    object QMver_detalles_gr_edP_VENTA: TFloatField
      DisplayLabel = 'P.Venta'
      FieldName = 'P_VENTA'
    end
    object QMver_detalles_gr_edTITM: TFIBStringField
      DisplayLabel = 'Modelo'
      DisplayWidth = 256
      FieldName = 'TITM'
      Size = 256
    end
    object QMver_detalles_gr_edTITMC: TFIBStringField
      DisplayLabel = 'Mod. Color'
      FieldName = 'TITMC'
      Size = 256
    end
    object QMver_detalles_gr_edID_D_E_GR: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_D_E_GR'
    end
    object QMver_detalles_gr_edT01: TFloatField
      FieldName = 'T01'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_edT02: TFloatField
      FieldName = 'T02'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_edT03: TFloatField
      FieldName = 'T03'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_edT04: TFloatField
      FieldName = 'T04'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_edT05: TFloatField
      FieldName = 'T05'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_edT06: TFloatField
      FieldName = 'T06'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_edT07: TFloatField
      FieldName = 'T07'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_edT08: TFloatField
      FieldName = 'T08'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_edT09: TFloatField
      FieldName = 'T09'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_edT10: TFloatField
      FieldName = 'T10'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_edT11: TFloatField
      FieldName = 'T11'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_edT12: TFloatField
      FieldName = 'T12'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_edT13: TFloatField
      FieldName = 'T13'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_edT14: TFloatField
      FieldName = 'T14'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_edT15: TFloatField
      FieldName = 'T15'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_edT16: TFloatField
      FieldName = 'T16'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_edT17: TFloatField
      FieldName = 'T17'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_edT18: TFloatField
      FieldName = 'T18'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_edT19: TFloatField
      FieldName = 'T19'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_edT20: TFloatField
      FieldName = 'T20'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_edT21: TFloatField
      FieldName = 'T21'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_edT22: TFloatField
      FieldName = 'T22'
      DisplayFormat = '#'
    end
    object QMver_detalles_gr_edUTOTAL: TFloatField
      DisplayLabel = 'Total Uds.'
      FieldName = 'UTOTAL'
    end
    object QMver_detalles_gr_edPTOTAL: TFloatField
      DisplayLabel = 'Total'
      FieldName = 'PTOTAL'
    end
    object QMver_detalles_gr_edCAMBIA: TIntegerField
      DisplayLabel = 'Cambia'
      FieldName = 'CAMBIA'
    end
  end
  object QMver_detalles_gr_ed_pc: TFIBTableSet
    Database = DMMain.DataBase
    Transaction = TLocal
    UsaNulls = True
    BufferChunks = 32
    CachedUpdates = False
    RefreshSQL.Strings = (
      'Select * FROM xver_detalles_e_grl_ro_pc(?ID_D_e_GR)')
    SelectSQL.Strings = (
      'Select * FROM xver_detalles_e_gr_ro_pc(?ID_E)')
    UniDirectional = False
    UpdateRecordTypes = [cusUnmodified, cusModified, cusInserted]
    UpdateSQL.Strings = (
      'UPDATE VER_DETALLES_GR_ED_PC'
      'SET'
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
      'ID_D_E_GR = :ID_D_E_GR')
    AfterPost = QMver_detalles_gr_edAfterPost
    ClavesPrimarias.Strings = (
      'ID_D_e_GR)'#13)
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
    object QMver_detalles_gr_ed_pcREF_PROVEEDOR: TFIBStringField
      DisplayLabel = 'Ref. Proveedor'
      FieldName = 'REF_PROVEEDOR'
      Size = 25
    end
    object QMver_detalles_gr_ed_pcS_COLOR: TFIBStringField
      DisplayLabel = 'Color'
      FieldName = 'S_COLOR'
      Size = 10
    end
    object QMver_detalles_gr_ed_pcID_A_M_C: TIntegerField
      DisplayLabel = 'ID Mod.'
      FieldName = 'ID_A_M_C'
    end
    object QMver_detalles_gr_ed_pcID_G_T: TIntegerField
      DisplayLabel = 'ID Grupo Tallas'
      FieldName = 'ID_G_T'
    end
    object QMver_detalles_gr_ed_pcP_COMPRA: TFloatField
      DisplayLabel = 'P. Compra'
      FieldName = 'P_COMPRA'
    end
    object QMver_detalles_gr_ed_pcP_VENTA: TFloatField
      DisplayLabel = 'P. Venta'
      FieldName = 'P_VENTA'
    end
    object QMver_detalles_gr_ed_pcTITM: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITM'
      Size = 256
    end
    object QMver_detalles_gr_ed_pcTITMC: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITMC'
      Size = 256
    end
    object QMver_detalles_gr_ed_pcP01: TFloatField
      FieldName = 'P01'
    end
    object QMver_detalles_gr_ed_pcP02: TFloatField
      FieldName = 'P02'
    end
    object QMver_detalles_gr_ed_pcP03: TFloatField
      FieldName = 'P03'
    end
    object QMver_detalles_gr_ed_pcP04: TFloatField
      FieldName = 'P04'
    end
    object QMver_detalles_gr_ed_pcP05: TFloatField
      FieldName = 'P05'
    end
    object QMver_detalles_gr_ed_pcP06: TFloatField
      FieldName = 'P06'
    end
    object QMver_detalles_gr_ed_pcP07: TFloatField
      FieldName = 'P07'
    end
    object QMver_detalles_gr_ed_pcP08: TFloatField
      FieldName = 'P08'
    end
    object QMver_detalles_gr_ed_pcP09: TFloatField
      FieldName = 'P09'
    end
    object QMver_detalles_gr_ed_pcP10: TFloatField
      FieldName = 'P10'
    end
    object QMver_detalles_gr_ed_pcP11: TFloatField
      FieldName = 'P11'
    end
    object QMver_detalles_gr_ed_pcP12: TFloatField
      FieldName = 'P12'
    end
    object QMver_detalles_gr_ed_pcP13: TFloatField
      FieldName = 'P13'
    end
    object QMver_detalles_gr_ed_pcP14: TFloatField
      FieldName = 'P14'
    end
    object QMver_detalles_gr_ed_pcP15: TFloatField
      FieldName = 'P15'
    end
    object QMver_detalles_gr_ed_pcP16: TFloatField
      FieldName = 'P16'
    end
    object QMver_detalles_gr_ed_pcP17: TFloatField
      FieldName = 'P17'
    end
    object QMver_detalles_gr_ed_pcP18: TFloatField
      FieldName = 'P18'
    end
    object QMver_detalles_gr_ed_pcP19: TFloatField
      FieldName = 'P19'
    end
    object QMver_detalles_gr_ed_pcP20: TFloatField
      FieldName = 'P20'
    end
    object QMver_detalles_gr_ed_pcP21: TFloatField
      FieldName = 'P21'
    end
    object QMver_detalles_gr_ed_pcP22: TFloatField
      FieldName = 'P22'
    end
    object QMver_detalles_gr_ed_pcID_E: TIntegerField
      DisplayLabel = 'ID Doc.'
      FieldName = 'ID_E'
    end
    object QMver_detalles_gr_ed_pcID_D_E_GR: TIntegerField
      DisplayLabel = 'Id'
      FieldName = 'ID_D_E_GR'
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
