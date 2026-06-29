object ProDMGrafCostesFases: TProDMGrafCostesFases
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 192
  Top = 107
  Height = 150
  Width = 215
  object TLocal: THYTransaction
    Active = True
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 136
    Top = 16
  end
  object xGrafCostesFases: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from pro_graf_costes_fases(?id_orden)')
    UniDirectional = False
    Left = 48
    Top = 15
    object xGrafCostesFasesLINEA_FASE: TIntegerField
      DisplayLabel = 'Linea Fase'
      FieldName = 'LINEA_FASE'
    end
    object xGrafCostesFasesFASE: TFIBStringField
      DisplayLabel = 'Fase'
      FieldName = 'FASE'
      Size = 60
    end
    object xGrafCostesFasesTAREA_PREV: TFloatField
      DisplayLabel = 'Tarea Prev.'
      FieldName = 'TAREA_PREV'
    end
    object xGrafCostesFasesTAREA_REAL: TFloatField
      DisplayLabel = 'Tarea Real'
      FieldName = 'TAREA_REAL'
    end
    object xGrafCostesFasesMATERIAL_PREV: TFloatField
      DisplayLabel = 'Mat. Prev.'
      FieldName = 'MATERIAL_PREV'
    end
    object xGrafCostesFasesMATERIAL_REAL: TFloatField
      DisplayLabel = 'Mat. Real'
      FieldName = 'MATERIAL_REAL'
    end
  end
end
