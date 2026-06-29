object DMVerificaStockEscandallo: TDMVerificaStockEscandallo
  OldCreateOrder = False
  OnCreate = DMVerificaStockEscandalloCreate
  OnDestroy = DMVerificaStockEscandalloDestroy
  Left = 584
  Top = 421
  Height = 150
  Width = 215
  object QArticulo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 1
    SelectSQL.Strings = (
      
        'SELECT ARTICULO,TITULO_LARGO AS TITULO,ABIERTO FROM ART_ARTICULO' +
        'S'
      'WHERE'
      '   EMPRESA = ?EMPRESA AND'
      '   ARTICULO = ?ARTICULO')
    UniDirectional = True
    Left = 24
    Top = 8
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 120
  end
  object QEscandallo: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT E.DETALLE,A.TITULO_LARGO AS TITULO,E.CANTIDAD FROM ART_AR' +
        'TICULOS_ESCANDALLO E'
      'LEFT JOIN ART_ARTICULOS A'
      'ON'
      '  E.EMPRESA = A.EMPRESA AND'
      '  E.DETALLE = A.ARTICULO '
      'WHERE'
      '   E.EMPRESA = ?EMPRESA AND'
      '   E.ARTICULO = ?ARTICULO '
      'ORDER BY E.DETALLE,E.CANTIDAD')
    UniDirectional = False
    Left = 24
    Top = 56
    object QEscandalloDETALLE: TFIBStringField
      DisplayLabel = 'Codigo'
      FieldName = 'DETALLE'
      Size = 15
    end
    object QEscandalloTITULO: TFIBStringField
      DisplayLabel = 'Titulo'
      FieldName = 'TITULO'
      Size = 256
    end
    object QEscandalloCANTIDAD: TFloatField
      DisplayLabel = 'Cantidad (Esc.)'
      FieldName = 'CANTIDAD'
    end
    object QEscandalloEXISTENCIAS: TFloatField
      DisplayLabel = 'Existencias'
      FieldKind = fkCalculated
      FieldName = 'EXISTENCIAS'
      OnGetText = QEscandalloEXISTENCIASGetText
      Calculated = True
    end
    object QEscandalloNECESIDAD: TFloatField
      DisplayLabel = 'Necesidad'
      FieldKind = fkCalculated
      FieldName = 'NECESIDAD'
      OnGetText = QEscandalloNECESIDADGetText
      Calculated = True
    end
  end
  object DSQEscandallo: TDataSource
    DataSet = QEscandallo
    Left = 120
    Top = 56
  end
end
