object ProDMLstEscandalloImg: TProDMLstEscandalloImg
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Left = 326
  Top = 433
  Height = 384
  Width = 604
  object xEscandalloD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT COMPUESTO FROM PRO_ESCANDALLO'
      'WHERE EMPRESA=?EMPRESA AND ESCANDALLO=?ESCANDALLO'
      'AND TIPO=?TIPO')
    UniDirectional = False
    Left = 28
    Top = 24
    object xEscandalloDCOMPUESTO: TFIBStringField
      DisplayLabel = 'Compuesto'
      FieldName = 'COMPUESTO'
      Size = 15
    end
  end
  object DSEscandalloD: TDataSource
    DataSet = xEscandalloD
    Left = 112
    Top = 24
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 192
    Top = 16
  end
  object xEscandalloH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT COMPUESTO FROM PRO_ESCANDALLO'
      'WHERE EMPRESA=?EMPRESA AND ESCANDALLO=?ESCANDALLO'
      'AND TIPO=?TIPO')
    UniDirectional = False
    Left = 28
    Top = 79
    object xEscandalloHCOMPUESTO: TFIBStringField
      DisplayLabel = 'Compuesto'
      FieldName = 'COMPUESTO'
      Size = 15
    end
  end
  object DSEscandalloH: TDataSource
    DataSet = xEscandalloH
    Left = 112
    Top = 79
  end
  object xMinEscandalloD: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT min(escandallo) as min_d FROM PRO_ESCANDALLO'
      'WHERE EMPRESA=?EMPRESA AND TIPO=?TIPO')
    UniDirectional = False
    Left = 52
    Top = 136
    object xMinEscandalloDMIN_D: TIntegerField
      DisplayLabel = 'Min. D.'
      FieldName = 'MIN_D'
    end
  end
  object DSxMaxEscandalloD: TDataSource
    DataSet = xMinEscandalloD
    Left = 160
    Top = 136
  end
  object xMaxEscandalloH: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT max(escandallo) max_h FROM PRO_ESCANDALLO'
      'WHERE EMPRESA=?EMPRESA AND TIPO=?TIPO')
    UniDirectional = False
    Left = 52
    Top = 191
    object xMaxEscandalloHMAX_H: TIntegerField
      DisplayLabel = 'Max. H.'
      FieldName = 'MAX_H'
    end
  end
  object DSxMaxEscandalloH: TDataSource
    DataSet = xMaxEscandalloH
    Left = 168
    Top = 191
  end
  object frDBEscandallos: TfrDBDataSet
    DataSource = DSLstEscandallos
    Left = 528
    Top = 80
  end
  object frListadoEscImg: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado Escandallos'
    RebuildPrinter = False
    OnGetValue = frListadoEscImgGetValue
    OnBeforePrint = frListadoEscImgEnterRect
    OnEnterRect = frListadoEscImgEnterRect
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    Left = 472
    Top = 24
    ReportForm = {19000000}
  end
  object QMLstEscandallos: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT ESC.*, ART.TITULO_LARGO'
      'FROM PRO_ESCANDALLO ESC'
      
        'JOIN ART_ARTICULOS ART ON ESC.EMPRESA = ART.EMPRESA AND ESC.COMP' +
        'UESTO = ART.ARTICULO'
      'WHERE'
      'ESC.EMPRESA = :EMPRESA AND'
      'ESC.ESCANDALLO >= :ESCANDALLO_INI AND'
      'ESC.ESCANDALLO <= :ESCANDALLO_FIN AND'
      'TIPO = :TIPO'
      'ORDER BY EMPRESA, ESCANDALLO')
    UniDirectional = False
    AfterScroll = QMLstEscandallosAfterScroll
    Left = 424
    Top = 152
    object QMLstEscandallosESCANDALLO: TIntegerField
      DisplayLabel = 'Escandallo'
      FieldName = 'ESCANDALLO'
    end
    object QMLstEscandallosCOMPUESTO: TFIBStringField
      DisplayLabel = 'Compuesto'
      FieldName = 'COMPUESTO'
      Size = 15
    end
    object QMLstEscandallosUNIDAD: TFIBStringField
      DisplayLabel = 'Unidad'
      FieldName = 'UNIDAD'
      Size = 2
    end
    object QMLstEscandallosUNIDADES: TFloatField
      DisplayLabel = 'Uds.'
      FieldName = 'UNIDADES'
    end
    object QMLstEscandallosMEDIDA_1: TFloatField
      DisplayLabel = 'Medida 1'
      FieldName = 'MEDIDA_1'
    end
    object QMLstEscandallosMEDIDA_2: TFloatField
      DisplayLabel = 'Medida 2'
      FieldName = 'MEDIDA_2'
    end
    object QMLstEscandallosMEDIDA_3: TFloatField
      DisplayLabel = 'Medida 3'
      FieldName = 'MEDIDA_3'
    end
    object QMLstEscandallosCOSTE_FIJO: TFloatField
      DisplayLabel = 'Coste Fijo'
      FieldName = 'COSTE_FIJO'
    end
    object QMLstEscandallosCOSTE_MOBRA: TFloatField
      DisplayLabel = 'Coste Mo.'
      FieldName = 'COSTE_MOBRA'
    end
    object QMLstEscandallosCOSTE_MATER: TFloatField
      DisplayLabel = 'Coste Mat.'
      FieldName = 'COSTE_MATER'
    end
    object QMLstEscandallosCOSTE_MAQUI: TFloatField
      DisplayLabel = 'Coste Maq.'
      FieldName = 'COSTE_MAQUI'
    end
    object QMLstEscandallosCOSTE_TEXTE: TFloatField
      DisplayLabel = 'Coste Tex.'
      FieldName = 'COSTE_TEXTE'
    end
    object QMLstEscandallosCOSTE_VAR: TFloatField
      DisplayLabel = 'Coste Var.'
      FieldName = 'COSTE_VAR'
    end
    object QMLstEscandallosCOSTE_TOTAL: TFloatField
      DisplayLabel = 'Coste Total'
      FieldName = 'COSTE_TOTAL'
    end
    object QMLstEscandallosESTADO: TIntegerField
      DisplayLabel = 'Estado'
      FieldName = 'ESTADO'
    end
    object QMLstEscandallosNOTAS: TMemoField
      FieldName = 'NOTAS'
      BlobType = ftMemo
      Size = 8
    end
    object QMLstEscandallosDIBUJO: TMemoField
      FieldName = 'DIBUJO'
      BlobType = ftMemo
      Size = 8
    end
    object QMLstEscandallosFECHA_CREAC: TDateTimeField
      DisplayLabel = 'Fec. Creacion'
      FieldName = 'FECHA_CREAC'
    end
    object QMLstEscandallosTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 60
    end
    object QMLstEscandallosTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 3
    end
    object QMLstEscandallosEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
  end
  object DSLstEscandallos: TDataSource
    DataSet = QMLstEscandallos
    Left = 528
    Top = 152
  end
  object QueryTemp: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    Transaction = TLocal
    AutoTrans = True
    Left = 264
    Top = 77
  end
  object QGeneral: THYFIBQuery
    Database = DMMain.DataBase
    ParamCheck = True
    SQL.Strings = (
      'select titulo from sys_empresas'
      'where empresa=?empresa')
    Transaction = TLocal
    AutoTrans = True
    Left = 336
    Top = 77
  end
  object QMLstDibEsc: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = False
    BufferChunks = 32
    SelectSQL.Strings = (
      'select first(1) id_imagen from pro_dib_esc'
      'where empresa=?empresa and escandallo=?escandallo and tipo=?tipo')
    UniDirectional = False
    Left = 424
    Top = 216
    object QMLstDibEscID_IMAGEN: TIntegerField
      DisplayLabel = 'ID'
      FieldName = 'ID_IMAGEN'
    end
  end
  object DSLstDibEscs: TDataSource
    DataSet = QMLstDibEsc
    Left = 528
    Top = 216
  end
  object frDBDibEsc: TfrDBDataSet
    DataSource = DSLstDibEscs
    Left = 440
    Top = 80
  end
end
