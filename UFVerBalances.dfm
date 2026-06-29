inherited FVerBalances: TFVerBalances
  Left = 491
  Top = 201
  Width = 854
  Height = 476
  HelpContext = 1810
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Ver Balances'
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 844
    Height = 423
    inherited TBMain: TLFToolBar
      Width = 840
      Caption = 'TBMain'
      inherited TSepNav: TToolButton [0]
        Left = 0
      end
      inherited EPMain: THYMEditPanel [1]
        Left = 8
        Width = 40
        VisibleButtons = [neReport, neSalir]
        Hints.Strings = (
          'Buscar'
          'B'#250'squeda aproximada'
          'B'#250'squeda exacta'
          'Imprime pantalla'
          'Filtra rango'
          'Ver todos o s'#243'lo los que tienen importes'
          'Copiar'
          'Cortar'
          'Pegar'
          'Cerrar la ventana')
        OnClickReport = EPMainClickReport
      end
      inherited TSepTerc: TToolButton [2]
        Left = 48
      end
      inherited TbuttComp: TToolButton [3]
        Left = 56
      end
      object PDesc: TLFPanel [4]
        Left = 79
        Top = 0
        Width = 658
        Height = 22
        Align = alLeft
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 0
        object LBalance: TLFLabel
          Left = 3
          Top = 5
          Width = 39
          Height = 13
          Alignment = taRightJustify
          Caption = 'Balance'
        end
        object LPeriodo: TLFLabel
          Left = 331
          Top = 5
          Width = 36
          Height = 13
          Alignment = taRightJustify
          Caption = 'Periodo'
        end
        object EBal_cod: TLFEdit
          Left = 45
          Top = 2
          Width = 33
          Height = 21
          AutoSize = False
          Color = clInactiveCaptionText
          TabOrder = 0
        end
        object EBal_Tit: TLFEdit
          Left = 80
          Top = 2
          Width = 247
          Height = 21
          AutoSize = False
          Color = clInactiveCaptionText
          TabOrder = 1
        end
        object EPer_Cod: TLFEdit
          Left = 371
          Top = 2
          Width = 33
          Height = 21
          AutoSize = False
          Color = clInactiveCaptionText
          TabOrder = 2
        end
        object EPer_Tit: TLFEdit
          Left = 406
          Top = 2
          Width = 252
          Height = 21
          AutoSize = False
          Color = clInactiveCaptionText
          TabOrder = 3
        end
      end
      inherited NavMain: THYMNavigator [5]
        Left = 737
        Width = 46
        DataSource = DSxVerBalance
        VisibleButtons = [nbFirst, nbLast]
        Hints.Strings = ()
        TabOrder = 2
      end
    end
    object DBGMain: THYTDBGrid
      Left = 2
      Top = 28
      Width = 840
      Height = 393
      Align = alClient
      Color = clInfoBk
      DataSource = DSxVerBalance
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGMainDblClick
      OnKeyPress = DBGMainKeyPress
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
      Idioma = 'CAS'
      AutoDeseleccionar = True
      PermutaPaneles = False
      CampoAOrdenarColor = clInfoBk
      OrdenMultiple = True
      Columns = <
        item
          Expanded = False
          FieldName = 'CLAVE'
          Width = 52
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO'
          Width = 265
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'TIPO'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'GRUPO'
          Title.Alignment = taCenter
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ANTERIOR'
          Title.Alignment = taRightJustify
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACTUAL'
          Title.Alignment = taRightJustify
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DIFERENCIA'
          Title.Alignment = taRightJustify
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ACTIVO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PORCENTUAL'
          Title.Alignment = taRightJustify
          Width = 47
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 423
    Width = 844
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMiprior: TMenuItem
      Visible = False
    end
    inherited CEMainMinext: TMenuItem
      Visible = False
    end
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
    inherited CEMainMiedit: TMenuItem
      Visible = False
    end
    inherited CEMainMipost: TMenuItem
      Visible = False
    end
    inherited CEMainMicancel: TMenuItem
      Visible = False
    end
    inherited CEMainMirefresh: TMenuItem
      Visible = False
    end
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
  end
  object xVerBalance: TFIBDataSetRO
    Database = DMMain.DataBase
    Transaction = TLocal
    AutoTrans = True
    BufferChunks = 32
    SelectSQL.Strings = (
      'SELECT * FROM VER_BALANCES_CONTENIDO'
      'ORDER BY CLAVE')
    UniDirectional = False
    Left = 34
    Top = 120
    object xVerBalanceCLAVE: TFIBStringField
      DisplayLabel = 'Clave'
      FieldName = 'CLAVE'
      Size = 15
    end
    object xVerBalanceTIPO: TFIBStringField
      DisplayLabel = 'Tipo'
      FieldName = 'TIPO'
      Size = 1
    end
    object xVerBalanceGRUPO: TFIBStringField
      DisplayLabel = 'Grupo'
      FieldName = 'GRUPO'
      Size = 1
    end
    object xVerBalanceANTERIOR: TFloatField
      DisplayLabel = 'Anterior'
      FieldName = 'ANTERIOR'
    end
    object xVerBalanceACTUAL: TFloatField
      DisplayLabel = 'Actual'
      FieldName = 'ACTUAL'
    end
    object xVerBalanceDIFERENCIA: TFloatField
      DisplayLabel = 'Diferencia'
      FieldName = 'DIFERENCIA'
    end
    object xVerBalancePORCENTUAL: TFloatField
      DisplayLabel = 'Porc.'
      FieldName = 'PORCENTUAL'
    end
    object xVerBalanceACTIVO: TIntegerField
      DisplayLabel = 'Activo'
      FieldName = 'ACTIVO'
    end
    object xVerBalanceEMPRESA: TIntegerField
      DisplayLabel = 'Empresa'
      FieldName = 'EMPRESA'
    end
    object xVerBalanceCANAL: TIntegerField
      DisplayLabel = 'Canal'
      FieldName = 'CANAL'
    end
    object xVerBalanceEJERCICIO: TIntegerField
      DisplayLabel = 'Ejercicio'
      FieldName = 'EJERCICIO'
    end
    object xVerBalancePERIODO: TFIBStringField
      DisplayLabel = 'Periodo'
      FieldName = 'PERIODO'
      Size = 2
    end
    object xVerBalanceBALANCE: TIntegerField
      DisplayLabel = 'Balance'
      FieldName = 'BALANCE'
    end
    object xVerBalanceORDEN: TIntegerField
      DisplayLabel = 'Orden'
      FieldName = 'ORDEN'
    end
    object xVerBalanceTITULO: TFIBStringField
      DisplayLabel = 'Descripcion'
      FieldName = 'TITULO'
      Size = 100
    end
  end
  object DSxVerBalance: TDataSource
    DataSet = xVerBalance
    Left = 80
    Top = 118
  end
  object TLocal: THYTransaction
    Active = False
    DefaultDatabase = DMMain.DataBase
    TimeoutAction = TARollback
    TRParams.Strings = (
      'read_committed'
      'read')
    Left = 32
    Top = 88
  end
end
