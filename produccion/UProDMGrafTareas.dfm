object ProDMGrafTareas: TProDMGrafTareas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 412
  Top = 296
  Height = 137
  Width = 215
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 152
    Top = 16
  end
  object xGrafCosteTareas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from pro_graf_comparacion_tareas(?id_orden)')
    UniDirectional = False
    Left = 48
    Top = 15
    object xGrafCosteTareasLINEA_FASE: TIntegerField
      DisplayLabel = 'Linea Fase'
      FieldName = 'LINEA_FASE'
    end
    object xGrafCosteTareasTIPOTAREA: TFIBStringField
      DisplayLabel = 'Tipo Tarea'
      FieldName = 'TIPOTAREA'
      Size = 3
    end
    object xGrafCosteTareasTAREA: TFIBStringField
      DisplayLabel = 'Tarea'
      FieldName = 'TAREA'
      Size = 60
    end
    object xGrafCosteTareasTOTAL_PREV: TFloatField
      DisplayLabel = 'Total Prev.'
      FieldName = 'TOTAL_PREV'
    end
    object xGrafCosteTareasTOTAL_REAL: TFloatField
      DisplayLabel = 'Total Real'
      FieldName = 'TOTAL_REAL'
    end
  end
end
