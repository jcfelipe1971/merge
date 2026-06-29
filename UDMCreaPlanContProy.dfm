object DMCreaPlanContProy: TDMCreaPlanContProy
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 485
  Top = 341
  Height = 198
  Width = 342
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'rec_version'
      'nowait')
    Left = 44
    Top = 20
  end
  object SPCreaContabilidad: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'EXECUTE procedure ana_crea_contabilidad_proyecto ('
      '   ?EMPRESA, ?EJERCICIO,'
      '    ?CANAL, ?PROYECTO, ?PLAN_CONTABLE_ORIGEN, ?INDICE ,'
      '    ?ACTUALIZA_E_ANA, ?SUFIJO_CONTABLE)')
    Transaction = TLocal
    AutoTrans = True
    Left = 158
    Top = 16
  end
  object xPlanContableOrigen: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select p.indice_sufijo,p.sufijo_contable,a.titulo,a.plan_contabl' +
        'e'
      'from ana_plan_contable a'
      'join emp_proyectos p'
      'on (p.empresa=a.empresa and'
      '    p.proyecto=a.proyecto)'
      'where a.empresa=?empresa   and'
      '      a.plan_contable=?plan_contable'
      'order by p.proyecto')
    UniDirectional = False
    Left = 42
    Top = 92
    object xPlanContableOrigenINDICE_SUFIJO: TIntegerField
      DisplayLabel = 'Ind. Sufijo'
      FieldName = 'INDICE_SUFIJO'
    end
    object xPlanContableOrigenSUFIJO_CONTABLE: TFIBStringField
      DisplayLabel = 'Sufijo Cont.'
      FieldName = 'SUFIJO_CONTABLE'
      Size = 15
    end
    object xPlanContableOrigenTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object xPlanContableOrigenPLAN_CONTABLE: TFIBStringField
      DisplayLabel = 'P.C.G.'
      FieldName = 'PLAN_CONTABLE'
      Size = 10
    end
  end
  object DSxPlanContableOrigen: TDataSource
    DataSet = xPlanContableOrigen
    Left = 157
    Top = 92
  end
end
