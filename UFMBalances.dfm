inherited FMBalances: TFMBalances
  Left = 315
  Top = 126
  Width = 621
  Height = 370
  HelpContext = 285
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Balances (definici'#243'n)'
  PopupMenu = CEBalancePMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 611
    Height = 132
    inherited TBMain: TLFToolBar
      Width = 607
      inherited NavMain: THYMNavigator
        DataSource = DMBalances.DSQMBalances_Def
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBEClave
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        Busca01 = DBEClave
        Busca02 = DBETitulo
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TbuttComp: TToolButton
        Enabled = False
      end
      object TButtRefrescar: TToolButton
        Left = 319
        Top = 0
        Hint = 'Refrescar la lista de Balances'
        Caption = 'Refrescar'
        ImageIndex = 26
        OnClick = TButtRefrescarClick
      end
      object ToolButton1: TToolButton
        Left = 342
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object NavBalances: THYMNavigator
        Left = 350
        Top = 0
        Width = 44
        Height = 22
        DataSource = DMBalances.DSQMBalances
        VisibleButtons = [nbPrior, nbNext]
        Flat = True
        ParentShowHint = False
        PopupMenu = CEBalancePMEdit
        ShowHint = True
        TabOrder = 2
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        Exclusivo = True
        ControlEdit = CEBalance
        OrdenAscendente = True
        InsertaUltimo = False
      end
      object ToolButton2: TToolButton
        Left = 394
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object PNLTitBalance: TLFPanel
        Left = 402
        Top = 0
        Width = 235
        Height = 22
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 3
        object DBEBalance: TLFDbedit
          Left = 0
          Top = 0
          Width = 234
          Height = 21
          TabStop = False
          AutoSize = False
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMBalances.DSQMBalances
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          OnChange = DBEBalanceChange
        end
      end
    end
    inherited PCMain: TLFPageControl
      Width = 607
      Height = 102
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 599
          Height = 69
          Align = alTop
          inherited G2KTableLoc: TG2KTBLoc
            Left = 72
            Top = 48
            DataSource = DMBalances.DSQMBalances_Def
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_BALANCES_DEFINICION        '
            CampoNum = 'CLAVE'
            CampoStr = 'TITULO'
          end
          object LBLTitulo: TLFLabel
            Left = 155
            Top = 12
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object LBLTipo: TLFLabel
            Left = 162
            Top = 34
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LBLSigno: TLFLabel
            Left = 329
            Top = 34
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Signo'
          end
          object LBLOrden: TLFLabel
            Left = 13
            Top = 34
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Orden'
          end
          object LBLGrupo: TLFLabel
            Left = 408
            Top = 34
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Grupo'
          end
          object LBLClave: TLFLabel
            Left = 15
            Top = 12
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Clave'
          end
          object DBCBGrupo: TDBComboBox
            Left = 441
            Top = 31
            Width = 41
            Height = 21
            DataField = 'GRUPO'
            DataSource = DMBalances.DSQMBalances_Def
            ItemHeight = 13
            TabOrder = 0
          end
          object DBSEOrden: TDBSpinEdit
            Left = 48
            Top = 31
            Width = 81
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 1
            Value = 0
            DataField = 'ORDEN'
            DataSource = DMBalances.DSQMBalances_Def
          end
          object DBETitulo: TLFDbedit
            Left = 188
            Top = 9
            Width = 381
            Height = 21
            DataField = 'TITULO'
            DataSource = DMBalances.DSQMBalances_Def
            TabOrder = 2
          end
          object DBEClave: TLFDbedit
            Left = 48
            Top = 9
            Width = 81
            Height = 21
            DataField = 'CLAVE'
            DataSource = DMBalances.DSQMBalances_Def
            TabOrder = 3
          end
          object DBCBTipo: TDBComboBox
            Left = 188
            Top = 31
            Width = 41
            Height = 21
            DataField = 'TIPO'
            DataSource = DMBalances.DSQMBalances_Def
            ItemHeight = 13
            Items.Strings = (
              'L'
              'R'
              'S'
              'T')
            TabOrder = 4
          end
          object DBCBSigno: TDBComboBox
            Left = 361
            Top = 31
            Width = 41
            Height = 21
            DataField = 'SIGNO'
            DataSource = DMBalances.DSQMBalances_Def
            ItemHeight = 13
            Items.Strings = (
              '0'
              '1'
              '2')
            TabOrder = 5
          end
          object EDTTipo: TLFDbedit
            Left = 230
            Top = 31
            Width = 89
            Height = 21
            Color = clInfoBk
            DataField = 'DESC_TIPO'
            DataSource = DMBalances.DSQMBalances_Def
            Enabled = False
            TabOrder = 6
          end
          object EDTGrupo: TLFDbedit
            Left = 483
            Top = 31
            Width = 86
            Height = 21
            Color = clInfoBk
            DataField = 'DESC_GRUPO'
            DataSource = DMBalances.DSQMBalances_Def
            Enabled = False
            TabOrder = 7
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 599
          Height = 74
          DataSource = DMBalances.DSQMBalances_Def
          CamposAOrdenar.Strings = (
            'CLAVE'
            'GRUPO'
            'ORDEN'
            'TIPO')
          Columns = <
            item
              Expanded = False
              FieldName = 'CLAVE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 26
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GRUPO'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ORDEN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 322
              Visible = True
            end>
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 132
    Width = 611
    Height = 185
    inherited TBDetalle: TLFToolBar
      Width = 611
      EdgeBorders = [ebBottom]
      EdgeInner = esNone
      EdgeOuter = esNone
      inherited NavDetalle: THYMNavigator
        DataSource = DMBalances.DSQMBalances_Def_Detalle
        Hints.Strings = ()
        Exclusivo = True
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 611
      Height = 163
      DataSource = DMBalances.DSQMBalances_Def_Detalle
      OnColEnter = DBGFBalancesDetColEnter
      IniStorage = FSMain
      IndiceBitmapAscendente = 0
      IndiceBitmapChecked = -1
      IndiceBitmapDescendente = 0
      Transaction = DMBalances.TLocal
      CamposAMostrarAnchos.Strings = (
        '0')
      CamposNoAccesibles.Strings = (
        'DESC_SIGNO')
      OrdenadosPor.Strings = (
        '')
      Columns = <
        item
          Expanded = False
          FieldName = 'ACUMULA'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SIGNO'
          PickList.Strings = (
            '0'
            '1'
            '2'
            '3'
            '4'
            '5'
            '6')
          Width = 40
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DESC_SIGNO'
          Title.Font.Charset = DEFAULT_CHARSET
          Title.Font.Color = clGrayText
          Title.Font.Height = -11
          Title.Font.Name = 'MS Sans Serif'
          Title.Font.Style = []
          Width = 300
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 317
    Width = 611
  end
  inherited CEMain: TControlEdit
    Left = 492
    Top = 34
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 526
    Top = 34
  end
  inherited ALMain: TLFActionList
    Left = 358
    Top = 24
    object ARenumera: TAction
      Category = 'Procesos'
      Caption = 'Renumerar'
      Hint = 'Renumerar'
      ImageIndex = 3
      OnExecute = ARenumeraExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AVisualizarDefBalance: TAction
      Category = 'Listados'
      Caption = 'Visualizar Listado Definici'#243'n Balances'
      Hint = 'Visualizar Listado Definici'#243'n Balances'
      ImageIndex = 14
      OnExecute = AVisualizarDefBalanceExecute
    end
    object ASep: TAction
      Category = 'Listados'
      Caption = '-'
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AConfDefBalance: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listados de Definici'#243'n Balances'
      ImageIndex = 14
      OnExecute = AConfDefBalanceExecute
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 396
    Top = 23
  end
  inherited CEDetalle: TControlEdit
    EnlazadoA = CEBalance
    Left = 493
    Top = 83
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 530
    Top = 84
  end
  object CEBalance: TControlEdit
    EnlazadoA = CEMain
    PopUpMenu = CEBalancePMEdit
    Teclas = DMMain.Teclas
    Left = 493
    Top = 128
  end
  object CEBalancePMEdit: TPopUpTeclas
    Left = 530
    Top = 128
    object CEBalanceMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CEBalanceMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEBalanceMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEBalanceMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CEBalanceMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEBalanceMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEBalanceMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CEBalanceMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
      Visible = False
    end
    object CEBalanceMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object CEBalanceMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
      Visible = False
    end
  end
end
