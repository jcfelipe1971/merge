object DMRelacionaAnticipo: TDMRelacionaAnticipo
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 475
  Top = 198
  Height = 318
  Width = 456
  object DSxAnticiposRel: TDataSource
    DataSet = xAnticiposRel
    Left = 120
    Top = 8
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 304
    Top = 8
  end
  object xAnticiposRel: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'select d_rig as RIG,d_linea as LINEA,importe_ant,o_id_detalles_s' +
        ' as ID_DETALLES_S'
      'from ges_detalles_relaciones_ant'
      'where d_id_detalles_s=?id_detalles_s')
    UniDirectional = False
    Left = 32
    Top = 8
    object xAnticiposRelRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xAnticiposRelLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xAnticiposRelIMPORTE_ANT: TFloatField
      DisplayLabel = 'Imp. Ant.'
      FieldName = 'IMPORTE_ANT'
    end
    object xAnticiposRelID_DETALLES_S: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES_S'
    end
  end
  object xAnticiposDisp: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select * from  dame_anticipos_de_clientes(?empresa,?ejercicio,'
      '?canal,?cliente,?id_d_s)')
    UniDirectional = False
    Left = 32
    Top = 56
    object xAnticiposDispRIG: TIntegerField
      DisplayLabel = 'Nro. Doc.'
      FieldName = 'RIG'
    end
    object xAnticiposDispLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object xAnticiposDispPRECIO: TFloatField
      DisplayLabel = 'Precio'
      FieldName = 'PRECIO'
    end
    object xAnticiposDispID_DETALLES_S: TIntegerField
      DisplayLabel = 'ID Det.'
      FieldName = 'ID_DETALLES_S'
    end
    object xAnticiposDispRESTO_ANTICIPO: TFloatField
      DisplayLabel = 'Resto Ant.'
      FieldName = 'RESTO_ANTICIPO'
    end
    object xAnticiposDispEJERCICIO_R: TIntegerField
      DisplayLabel = 'Ejer. R.'
      FieldName = 'EJERCICIO_R'
    end
  end
  object DSxAnticiposDisp: TDataSource
    DataSet = xAnticiposDisp
    Left = 120
    Top = 56
  end
  object QRelaciona: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      
        'execute procedure  g_crea_relacion_anticipo(?SALDO_CTA,?O_ID_DET' +
        'ALLES_S,?D_ID_DETALLES_S,?TOTAL_LINEA)')
    Transaction = TLocal
    AutoTrans = True
    Left = 216
    Top = 8
  end
  object QEliminaRelacion: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'delete from ges_detalles_relaciones_ant'
      'where o_id_detalles_s=?o_id_detalles_s and'
      '           d_id_detalles_s=?d_id_detalles_s')
    Transaction = TLocal
    AutoTrans = True
    Left = 216
    Top = 56
  end
  object xArticulo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'select articulo,titulo from ges_detalles_s'
      'where id_detalles_s=?id_detalles_s')
    UniDirectional = False
    Left = 32
    Top = 104
  end
  object DSxArticulo: TDataSource
    DataSet = xArticulo
    Left = 120
    Top = 104
  end
end
