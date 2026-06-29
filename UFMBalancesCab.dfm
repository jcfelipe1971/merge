inherited FMBalancesCAB: TFMBalancesCAB
  Left = 629
  Top = 355
  HelpContext = 284
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Cabecera de Balances'
  ClientHeight = 282
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 258
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        DataSource = DMBalances.DSQMBalancesCAB
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBEBalance
        OnClickBefore = NavMainClickBefore
      end
      inherited EPMain: THYMEditPanel
        Width = 40
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepTerc: TToolButton
        Left = 268
      end
      inherited TbuttComp: TToolButton
        Left = 276
        Enabled = False
      end
    end
    inherited PCMain: TLFPageControl
      Height = 228
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Height = 200
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = DMBalances.DSQMBalancesCAB
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_BALANCES'
            CampoNum = 'BALANCE'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'BALANCE')
          end
          object LBalance: TLFLabel
            Left = 28
            Top = 36
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Balance'
            FocusControl = DBEBalance
          end
          object LTitulo: TLFLabel
            Left = 39
            Top = 58
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
            FocusControl = DBETitulo
          end
          object DBEBalance: TLFDbedit
            Left = 72
            Top = 32
            Width = 64
            Height = 21
            DataField = 'BALANCE'
            DataSource = DMBalances.DSQMBalancesCAB
            MaxLength = 5
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 72
            Top = 54
            Width = 244
            Height = 21
            DataField = 'TITULO'
            DataSource = DMBalances.DSQMBalancesCAB
            TabOrder = 1
          end
          object DBRGTipo: TDBRadioGroup
            Left = 72
            Top = 94
            Width = 244
            Height = 75
            Caption = 'Tipo de Balance'
            DataField = 'TIPO'
            DataSource = DMBalances.DSQMBalancesCAB
            Enabled = False
            Items.Strings = (
              'Situaci'#243'n'
              'P'#233'rdidas y Ganancias'
              'Cuadro de financiaci'#243'n')
            TabOrder = 2
            Values.Strings = (
              '1'
              '2'
              '3')
          end
          object DBCBActivo: TLFDBCheckBox
            Left = 376
            Top = 34
            Width = 89
            Height = 17
            Caption = 'Activo'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 3
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO'
            DataSource = DMBalances.DSQMBalancesCAB
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Height = 200
          DataSource = DMBalances.DSQMBalancesCAB
          Columns = <
            item
              Expanded = False
              FieldName = 'BALANCE'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 311
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GENERICO'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 35
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 258
  end
  inherited CEMain: TControlEdit
    Left = 360
    Top = 60
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 408
    Top = 62
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 360
    Top = 2
    object ARegenera: TAction
      Category = 'Procesos'
      Caption = 'Regenera el Balance en base a su origen'
      Hint = 'Regenera el Balance en base a su origen'
      ImageIndex = 26
      OnExecute = ARegeneraExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 410
    Top = 6
  end
end
