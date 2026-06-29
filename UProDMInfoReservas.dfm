object ProDMInfoReservas: TProDMInfoReservas
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 219
  Top = 172
  Height = 150
  Width = 335
  object QReservas: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    RefreshSQL.Strings = (
      'SELECT R.*, A.TITULO_LARGO AS TITULO,'
      '       (CAST(SUBSTRING((SELECT LIST(L.CLASIFICACION, '#39', '#39')'
      '                        FROM PRO_ORD_RESERVA_LOTE OL'
      
        '                        JOIN ART_ARTICULOS_LOTES L ON (OL.ID_LOT' +
        'E = L.ID_LOTE)'
      '                        WHERE'
      
        '                        OL.ID_ORDEN = R.ID_ORDEN) FROM 1 FOR 100' +
        ') AS VARCHAR(100))) CLASIFICACION_LOTE_RESERVA,'
      '       (SELECT FIRST 1 ID_LOTE'
      '        FROM PRO_ORD_RESERVA_LOTE'
      '        WHERE'
      '        ID_ORDEN = R.ID_ORDEN'
      '        ORDER BY LINEA_RES) ID_LOTE_RESERVA,'
      '       (CAST(SUBSTRING((SELECT LIST(L.LOTE, '#39', '#39')'
      '                        FROM PRO_ORD_RESERVA_LOTE OL'
      
        '                        JOIN ART_ARTICULOS_LOTES L ON (OL.ID_LOT' +
        'E = L.ID_LOTE)'
      '                        WHERE'
      
        '                        OL.ID_ORDEN = R.ID_ORDEN) FROM 1 FOR 20)' +
        ' AS VARCHAR(20))) LOTE_RESERVA'
      'FROM PRO_ORD_RESERVA R'
      
        'JOIN ART_ARTICULOS A ON (R.EMPRESA = A.EMPRESA AND R.COMPUESTO =' +
        ' A.ARTICULO)'
      'WHERE'
      'R.ID_ORDEN = :ID_ORDEN AND'
      'R.LINEA_RES = :LINEA_RES')
    SelectSQL.Strings = (
      'SELECT R.*, A.TITULO_LARGO AS TITULO,'
      '       (CAST(SUBSTRING((SELECT LIST(L.CLASIFICACION, '#39', '#39')'
      '                        FROM PRO_ORD_RESERVA_LOTE OL'
      
        '                        JOIN ART_ARTICULOS_LOTES L ON (OL.ID_LOT' +
        'E = L.ID_LOTE)'
      '                        WHERE'
      
        '                        OL.ID_ORDEN = R.ID_ORDEN) FROM 1 FOR 100' +
        ') AS VARCHAR(100))) CLASIFICACION_LOTE_RESERVA,'
      '       (SELECT FIRST 1 ID_LOTE'
      '        FROM PRO_ORD_RESERVA_LOTE'
      '        WHERE'
      '        ID_ORDEN = R.ID_ORDEN'
      '        ORDER BY LINEA_RES) ID_LOTE_RESERVA,'
      '       (CAST(SUBSTRING((SELECT LIST(L.LOTE, '#39', '#39')'
      '                        FROM PRO_ORD_RESERVA_LOTE OL'
      
        '                        JOIN ART_ARTICULOS_LOTES L ON (OL.ID_LOT' +
        'E = L.ID_LOTE)'
      '                        WHERE'
      
        '                        OL.ID_ORDEN = R.ID_ORDEN) FROM 1 FOR 20)' +
        ' AS VARCHAR(20))) LOTE_RESERVA'
      'FROM PRO_ORD_RESERVA R'
      
        'JOIN ART_ARTICULOS A ON (R.EMPRESA = A.EMPRESA AND R.COMPUESTO =' +
        ' A.ARTICULO)'
      'WHERE'
      'R.ID_ORDEN = :ID_ORDEN'
      'ORDER BY R.ID_RESERVA')
    UniDirectional = False
    Left = 40
    Top = 16
    object QReservasEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QReservasEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QReservasCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QReservasSERIE: TFIBStringField
      DisplayLabel = 'Serie'
      FieldName = 'SERIE'
      Size = 10
    end
    object QReservasRIG_OF: TIntegerField
      DisplayLabel = 'RIG'
      FieldName = 'RIG_OF'
    end
    object QReservasID_ORDEN: TIntegerField
      DisplayLabel = 'Id Orden'
      FieldName = 'ID_ORDEN'
    end
    object QReservasLINEA_RES: TIntegerField
      DisplayLabel = 'Lin. Reserva'
      FieldName = 'LINEA_RES'
    end
    object QReservasID_RESERVA: TIntegerField
      DisplayLabel = 'Id Reserva'
      FieldName = 'ID_RESERVA'
    end
    object QReservasALMACEN_LAN: TFIBStringField
      DisplayLabel = 'Alm. Lan.'
      FieldName = 'ALMACEN_LAN'
      Size = 3
    end
    object QReservasALMACEN_SAL: TFIBStringField
      DisplayLabel = 'Alm. Sal.'
      FieldName = 'ALMACEN_SAL'
      Size = 3
    end
    object QReservasCOMPUESTO: TFIBStringField
      DisplayLabel = 'Compuesto'
      FieldName = 'COMPUESTO'
      Size = 15
    end
    object QReservasUNIDADES: TFloatField
      DisplayLabel = 'Unidades'
      FieldName = 'UNIDADES'
    end
    object QReservasN_MOV_STOCK_RESERVA: TIntegerField
      DisplayLabel = 'Nro. Mov. Stock'
      FieldName = 'N_MOV_STOCK_RESERVA'
    end
    object QReservasENTRADA: TIntegerField
      DisplayLabel = 'Entrada'
      FieldName = 'ENTRADA'
    end
    object QReservasFECHA: TDateTimeField
      DisplayLabel = 'Fec. Reserva'
      FieldName = 'FECHA'
    end
    object QReservasID_LOTE: TIntegerField
      DisplayLabel = 'Id Lote'
      FieldName = 'ID_LOTE'
    end
    object QReservasLOTE: TStringField
      DisplayLabel = 'Desc. Lote'
      FieldKind = fkCalculated
      FieldName = 'LOTE'
      OnGetText = QReservasLOTEGetText
      Calculated = True
    end
    object QReservasESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QReservasTITULO: TFIBStringField
      DisplayLabel = 'Desc. Compuesto'
      FieldName = 'TITULO'
      Size = 256
    end
    object QReservasCLASIFICACION: TFIBStringField
      DisplayLabel = 'Clasificaci'#243'n'
      FieldName = 'CLASIFICACION_LOTE_RESERVA'
      Size = 100
    end
    object QReservasID_LOTE_RESERVA: TIntegerField
      DisplayLabel = 'Id Lote'
      FieldName = 'ID_LOTE_RESERVA'
    end
    object QReservasLOTE_RESERVA: TFIBStringField
      DisplayLabel = 'Lote'
      FieldName = 'LOTE_RESERVA'
    end
  end
  object DSQReservas: TDataSource
    DataSet = QReservas
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
