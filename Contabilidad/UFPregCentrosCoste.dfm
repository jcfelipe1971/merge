inherited FPregCentrosCoste: TFPregCentrosCoste
  Left = 607
  Top = 221
  Caption = 'Listado de Centros de Coste'
  ClientWidth = 365
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 365
    object LNivel: TLFLabel [0]
      Left = 113
      Top = 105
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nivel'
    end
    object LHastaFecha: TLFLabel [1]
      Left = 76
      Top = 80
      Width = 61
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta Fecha'
    end
    object LHastaCanal: TLFLabel [2]
      Left = 79
      Top = 176
      Width = 58
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta Canal'
    end
    object LDigito: TLFLabel [3]
      Left = 110
      Top = 128
      Width = 27
      Height = 13
      Alignment = taRightJustify
      Caption = 'Digito'
    end
    object LDesdeFecha: TLFLabel [4]
      Left = 73
      Top = 57
      Width = 64
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde Fecha'
    end
    object LDesdeCanal: TLFLabel [5]
      Left = 76
      Top = 153
      Width = 61
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde Canal'
    end
    inherited TBMain: TLFToolBar
      Width = 365
      object TButtConfiguracionRapida: TToolButton
        Left = 288
        Top = 0
        Action = AConfiguracionRapida
      end
    end
    object CBDigito: TLFComboBox
      Left = 140
      Top = 125
      Width = 120
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Text = '1'
      Items.Strings = (
        '1'
        '2'
        '3'
        '4'
        '5')
    end
    object EHastaCanal: TLFEdit
      Left = 140
      Top = 173
      Width = 120
      Height = 21
      TabOrder = 2
      Text = '1'
    end
    object EDesdeCanal: TLFEdit
      Left = 140
      Top = 149
      Width = 120
      Height = 21
      TabOrder = 3
      Text = '1'
    end
    object DEHFecha: TLFDateEdit
      Left = 140
      Top = 77
      Width = 120
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 4
      Text = '01/01/2005'
    end
    object DEDFecha: TLFDateEdit
      Left = 140
      Top = 53
      Width = 120
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 5
      Text = '01/01/2005'
    end
    object CBNivel: TLFComboBox
      Left = 140
      Top = 101
      Width = 120
      Height = 21
      ItemHeight = 13
      TabOrder = 6
      Text = '5'
      Items.Strings = (
        '4'
        '5')
    end
  end
  inherited ALMain: TLFActionList
    Left = 40
    Top = 45
    inherited AImprimir: TAction
      OnExecute = AImprimirExecute
    end
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
    object AConfiguracionRapida: TAction
      Caption = '&Configurar'
      ImageIndex = 77
      OnExecute = AConfiguracionRapidaExecute
    end
  end
  object frCentroCoste: TfrHYReport
    DataSet = DMMain.QListados
    InitialZoom = pzDefault
    PreviewButtons = [pbZoom, pbLoad, pbSave, pbPrint, pbFind, pbHelp, pbExit]
    Title = 'Listado de Centros de Coste'
    RebuildPrinter = False
    OnGetValue = frCentroCosteGetValue
    KeyField = 'LISTADO'
    BlobField = 'DEF_LISTADO'
    NameField = 'TITULO'
    GroupField = 'GRUPO'
    TypeField = 'TIPO'
    Left = 8
    Top = 45
    ReportForm = {19000000}
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'rec_version'
      'read_committed'
      'nowait')
    Left = 8
    Top = 77
  end
  object QListado2: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      
        'SELECT * FROM TMP_CENTROS_COSTE_2 WHERE ENTRADA=?entrada and niv' +
        'el=?nivel and num_digito=?num_digito and canal=?canal order by c' +
        'uenta')
    UniDirectional = False
    Left = 40
    Top = 109
    object QListado2ENTRADA: TIntegerField
      DisplayLabel = 'Sel.'
      FieldName = 'ENTRADA'
    end
    object QListado2EMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object QListado2EJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object QListado2CANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object QListado2CUENTA: TFIBStringField
      DisplayLabel = 'Cuenta'
      FieldName = 'CUENTA'
      Size = 15
    end
    object QListado2NIVEL: TIntegerField
      DisplayLabel = 'Nivel'
      FieldName = 'NIVEL'
    end
    object QListado2NUM_DIGITO: TIntegerField
      DisplayLabel = 'Nro. Digito'
      FieldName = 'NUM_DIGITO'
    end
    object QListado2D1: TFIBStringField
      DisplayLabel = 'Dig. 1'
      FieldName = 'D1'
      Size = 3
    end
    object QListado2I1: TFloatField
      DisplayLabel = 'Imp. 1'
      FieldName = 'I1'
    end
    object QListado2D2: TFIBStringField
      DisplayLabel = 'Dig. 2'
      FieldName = 'D2'
      Size = 3
    end
    object QListado2I2: TFloatField
      DisplayLabel = 'Imp. 2'
      FieldName = 'I2'
    end
    object QListado2D3: TFIBStringField
      DisplayLabel = 'Dig. 3'
      FieldName = 'D3'
      Size = 3
    end
    object QListado2I3: TFloatField
      DisplayLabel = 'Imp. 3'
      FieldName = 'I3'
    end
    object QListado2D4: TFIBStringField
      DisplayLabel = 'Dig. 4'
      FieldName = 'D4'
      Size = 3
    end
    object QListado2I4: TFloatField
      DisplayLabel = 'Imp. 4'
      FieldName = 'I4'
    end
    object QListado2D5: TFIBStringField
      DisplayLabel = 'Dig. 5'
      FieldName = 'D5'
      Size = 3
    end
    object QListado2I5: TFloatField
      DisplayLabel = 'Imp. 5'
      FieldName = 'I5'
    end
    object QListado2D6: TFIBStringField
      DisplayLabel = 'Dig. 6'
      FieldName = 'D6'
      Size = 3
    end
    object QListado2I6: TFloatField
      DisplayLabel = 'Imp. 6'
      FieldName = 'I6'
    end
    object QListado2D7: TFIBStringField
      DisplayLabel = 'Dig. 7'
      FieldName = 'D7'
      Size = 3
    end
    object QListado2I7: TFloatField
      DisplayLabel = 'Imp. 7'
      FieldName = 'I7'
    end
    object QListado2D8: TFIBStringField
      DisplayLabel = 'Dig. 8'
      FieldName = 'D8'
      Size = 3
    end
    object QListado2I8: TFloatField
      DisplayLabel = 'Imp. 8'
      FieldName = 'I8'
    end
    object QListado2D9: TFIBStringField
      DisplayLabel = 'Dig. 9'
      FieldName = 'D9'
      Size = 3
    end
    object QListado2I9: TFloatField
      DisplayLabel = 'Imp. 9'
      FieldName = 'I9'
    end
    object QListado2D10: TFIBStringField
      DisplayLabel = 'Dig. 10'
      FieldName = 'D10'
      Size = 3
    end
    object QListado2I10: TFloatField
      DisplayLabel = 'Imp. 10'
      FieldName = 'I10'
    end
    object QListado2D11: TFIBStringField
      DisplayLabel = 'Dig. 11'
      FieldName = 'D11'
      Size = 3
    end
    object QListado2I11: TFloatField
      DisplayLabel = 'Imp. 11'
      FieldName = 'I11'
    end
    object QListado2D12: TFIBStringField
      DisplayLabel = 'Dig. 12'
      FieldName = 'D12'
      Size = 3
    end
    object QListado2I12: TFloatField
      DisplayLabel = 'Imp. 12'
      FieldName = 'I12'
    end
    object QListado2D13: TFIBStringField
      DisplayLabel = 'Dig. 13'
      FieldName = 'D13'
      Size = 3
    end
    object QListado2I13: TFloatField
      DisplayLabel = 'Imp. 13'
      FieldName = 'I13'
    end
    object QListado2D14: TFIBStringField
      DisplayLabel = 'Dig. 14'
      FieldName = 'D14'
      Size = 3
    end
    object QListado2I14: TFloatField
      DisplayLabel = 'Imp. 14'
      FieldName = 'I14'
    end
    object QListado2D15: TFIBStringField
      DisplayLabel = 'Dig. 15'
      FieldName = 'D15'
      Size = 3
    end
    object QListado2I15: TFloatField
      DisplayLabel = 'Imp. 15'
      FieldName = 'I15'
    end
    object QListado2D16: TFIBStringField
      DisplayLabel = 'Dig. 16'
      FieldName = 'D16'
      Size = 3
    end
    object QListado2I16: TFloatField
      DisplayLabel = 'Imp. 16'
      FieldName = 'I16'
    end
    object QListado2D17: TFIBStringField
      DisplayLabel = 'Dig. 17'
      FieldName = 'D17'
      Size = 3
    end
    object QListado2I17: TFloatField
      DisplayLabel = 'Imp. 17'
      FieldName = 'I17'
    end
    object QListado2D18: TFIBStringField
      DisplayLabel = 'Dig. 18'
      FieldName = 'D18'
      Size = 3
    end
    object QListado2I18: TFloatField
      DisplayLabel = 'Imp. 18'
      FieldName = 'I18'
    end
    object QListado2D19: TFIBStringField
      DisplayLabel = 'Dig. 19'
      FieldName = 'D19'
      Size = 3
    end
    object QListado2I19: TFloatField
      DisplayLabel = 'Imp. 19'
      FieldName = 'I19'
    end
    object QListado2D20: TFIBStringField
      DisplayLabel = 'Dig. 20'
      FieldName = 'D20'
      Size = 3
    end
    object QListado2I20: TFloatField
      DisplayLabel = 'Imp. 20'
      FieldName = 'I20'
    end
    object QListado2D21: TFIBStringField
      DisplayLabel = 'Dig. 21'
      FieldName = 'D21'
      Size = 3
    end
    object QListado2I21: TFloatField
      DisplayLabel = 'Imp. 21'
      FieldName = 'I21'
    end
    object QListado2D22: TFIBStringField
      DisplayLabel = 'Dig. 22'
      FieldName = 'D22'
      Size = 3
    end
    object QListado2I22: TFloatField
      DisplayLabel = 'Imp. 22'
      FieldName = 'I22'
    end
    object QListado2D23: TFIBStringField
      DisplayLabel = 'Dig. 23'
      FieldName = 'D23'
      Size = 3
    end
    object QListado2I23: TFloatField
      DisplayLabel = 'Imp. 23'
      FieldName = 'I23'
    end
    object QListado2D24: TFIBStringField
      DisplayLabel = 'Dig. 24'
      FieldName = 'D24'
      Size = 3
    end
    object QListado2I24: TFloatField
      DisplayLabel = 'Imp. 24'
      FieldName = 'I24'
    end
    object QListado2D25: TFIBStringField
      DisplayLabel = 'Dig. 25'
      FieldName = 'D25'
      Size = 3
    end
    object QListado2I25: TFloatField
      DisplayLabel = 'Imp. 25'
      FieldName = 'I25'
    end
    object QListado2D26: TFIBStringField
      DisplayLabel = 'Dig. 26'
      FieldName = 'D26'
      Size = 3
    end
    object QListado2I26: TFloatField
      DisplayLabel = 'Imp. 26'
      FieldName = 'I26'
    end
    object QListado2D27: TFIBStringField
      DisplayLabel = 'Dig. 27'
      FieldName = 'D27'
      Size = 3
    end
    object QListado2I27: TFloatField
      DisplayLabel = 'Imp. 27'
      FieldName = 'I27'
    end
    object QListado2D28: TFIBStringField
      DisplayLabel = 'Dig. 28'
      FieldName = 'D28'
      Size = 3
    end
    object QListado2I28: TFloatField
      DisplayLabel = 'Imp. 28'
      FieldName = 'I28'
    end
    object QListado2D29: TFIBStringField
      DisplayLabel = 'Dig. 29'
      FieldName = 'D29'
      Size = 3
    end
    object QListado2I29: TFloatField
      DisplayLabel = 'Imp. 29'
      FieldName = 'I29'
    end
    object QListado2D30: TFIBStringField
      DisplayLabel = 'Dig. 30'
      FieldName = 'D30'
      Size = 3
    end
    object QListado2I30: TFloatField
      DisplayLabel = 'Imp. 30'
      FieldName = 'I30'
    end
  end
  object DSListado: TDataSource
    DataSet = QListado
    Left = 8
    Top = 141
  end
  object QListado: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    UniDirectional = False
    Left = 8
    Top = 109
  end
  object DSListado2: TDataSource
    DataSet = QListado2
    Left = 40
    Top = 141
  end
  object frDBListado: TfrDBDataSet
    DataSet = QListado
    Left = 8
    Top = 173
  end
  object frDBListado2: TfrDBDataSet
    DataSet = QListado2
    Left = 40
    Top = 173
  end
end
