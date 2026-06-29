object ProDMInfoMarcajes: TProDMInfoMarcajes
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 219
  Top = 172
  Height = 150
  Width = 335
  object QMarcajes: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT *'
      'FROM VER_PRO_ORD_MARCA '
      'WHERE'
      'ID_ORDEN = :ID_ORDEN AND'
      'LINEA_FASE = :LINEA_FASE AND'
      'LINEA_TAREA = :LINEA_TAREA')
    SelectSQL.Strings = (
      'SELECT *'
      'FROM VER_PRO_ORD_MARCA '
      'WHERE'
      'ID_ORDEN = :ID_ORDEN'
      'ORDER BY LINEA_FASE, LINEA_TAREA')
    UniDirectional = False
    Left = 40
    Top = 16
    object QMarcajesID_ORDEN: TIntegerField
      DisplayLabel = 'Id. Orden'
      FieldName = 'ID_ORDEN'
    end
    object QMarcajesIDTAREA: TIntegerField
      DisplayLabel = 'Id. Tarea'
      FieldName = 'IDTAREA'
    end
    object QMarcajesLINEA_FASE: TIntegerField
      DisplayLabel = 'Fase'
      FieldName = 'LINEA_FASE'
    end
    object QMarcajesLINEA_TAREA: TIntegerField
      DisplayLabel = 'Tarea'
      FieldName = 'LINEA_TAREA'
    end
    object QMarcajesFECHA_REAL: TDateTimeField
      DisplayLabel = 'Fecha'
      FieldName = 'FECHA_REAL'
    end
    object QMarcajesHORA_INICIO: TFloatField
      DisplayLabel = 'Hora Ini.'
      FieldName = 'HORA_INICIO'
    end
    object QMarcajesHORA_FIN: TFloatField
      DisplayLabel = 'Hora Fin'
      FieldName = 'HORA_FIN'
    end
    object QMarcajesTIEMPO: TFloatField
      DisplayLabel = 'Tiempo'
      FieldName = 'TIEMPO'
    end
    object QMarcajesRECURSO: TFIBStringField
      DisplayLabel = 'Recurso'
      FieldName = 'RECURSO'
      Size = 5
    end
    object QMarcajesTITULO_RECURSO: TFIBStringField
      DisplayLabel = 'Tit. Recurso'
      FieldName = 'TITULO_RECURSO'
      Size = 40
    end
    object QMarcajesTIPO_RECURSO: TFIBStringField
      DisplayLabel = 'Tipo. Rec.'
      FieldName = 'TIPO_RECURSO'
      Size = 5
    end
    object QMarcajesOPERARIO: TIntegerField
      DisplayLabel = 'Operario'
      FieldName = 'OPERARIO'
    end
    object QMarcajesTITULO_EMPLEADO: TFIBStringField
      DisplayLabel = 'Nombre Operario'
      FieldName = 'TITULO_EMPLEADO'
      Size = 60
    end
    object QMarcajesMAQUINA: TIntegerField
      DisplayLabel = 'M'#225'quina'
      FieldName = 'MAQUINA'
    end
    object QMarcajesTITULO_MAQUINA: TFIBStringField
      DisplayLabel = 'Tit. M'#225'quina'
      FieldName = 'TITULO_MAQUINA'
      Size = 100
    end
    object QMarcajesUNIDADES_FAB: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES_FAB'
    end
    object QMarcajesESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMarcajesTOTAL_RECURSO: TFloatField
      DisplayLabel = 'Total Rec.'
      FieldName = 'TOTAL_RECURSO'
    end
    object QMarcajesEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QMarcajesEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QMarcajesCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QMarcajesSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QMarcajesTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMarcajesRIG: TIntegerField
      FieldName = 'RIG'
    end
    object QMarcajesLINEA: TIntegerField
      DisplayLabel = 'Linea'
      FieldName = 'LINEA'
    end
    object QMarcajesTURNO: TFIBStringField
      DisplayLabel = 'Turno'
      FieldName = 'TURNO'
      Size = 3
    end
    object QMarcajesTITULO_TURNO: TFIBStringField
      DisplayLabel = 'Tit. Turno'
      FieldName = 'TITULO_TURNO'
      Size = 100
    end
    object QMarcajesCAUSA: TFIBStringField
      DisplayLabel = 'Causa'
      FieldName = 'CAUSA'
      Size = 3
    end
    object QMarcajesTITULO_CAUSA: TFIBStringField
      DisplayLabel = 'Tit. Causa'
      FieldName = 'TITULO_CAUSA'
      Size = 100
    end
    object QMarcajesUNIDADES_DEFECTUOSAS: TFloatField
      DisplayLabel = 'Unid. Defectuosas'
      FieldName = 'UNIDADES_DEFECTUOSAS'
    end
    object QMarcajesCANTIDAD_RECHAZADA: TFloatField
      DisplayLabel = 'Cant. rechazo'
      FieldName = 'CANTIDAD_RECHAZADA'
    end
    object QMarcajesNO_PRODUCTIVA: TIntegerField
      DisplayLabel = 'No prod.'
      FieldName = 'NO_PRODUCTIVA'
    end
    object QMarcajesHORAS_NO_PRODUCTIVAS: TFloatField
      DisplayLabel = 'H. No Prod.'
      FieldName = 'HORAS_NO_PRODUCTIVAS'
    end
    object QMarcajesEFICIENCIA: TFloatField
      DisplayLabel = 'Eficiencia'
      FieldName = 'EFICIENCIA'
    end
  end
  object DSQMarcajes: TDataSource
    DataSet = QMarcajes
    Left = 144
    Top = 16
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 244
    Top = 16
  end
end
