inherited FMultiBalances: TFMultiBalances
  Left = 467
  Top = 384
  Caption = 'Multi Selecci'#243'n'
  ClientHeight = 220
  ClientWidth = 398
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 398
    Height = 196
    inherited TBMain: TLFToolBar
      Width = 394
      TabOrder = 1
      inherited NavMain: THYMNavigator
        Width = 88
        DataSource = DMMultiBalances.DSxMultiBalance
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton
        Left = 88
      end
      inherited EPMain: THYMEditPanel
        Left = 96
        Width = 25
        DataSource = DMMultiSeleccion.DSxMultiSeleccion
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 121
      end
      inherited TbuttComp: TToolButton
        Left = 129
      end
      object TSep1: TToolButton
        Left = 152
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtMarcarTodos: TToolButton
        Left = 160
        Top = 0
        Action = AMarcarTodos
        ParentShowHint = False
        ShowHint = True
      end
      object TButtDesmarcarTodos: TToolButton
        Left = 183
        Top = 0
        Action = ADesmarcarTodos
        ParentShowHint = False
        ShowHint = True
      end
    end
    object DBGSeleccion: TDBGridFind2000
      Left = 2
      Top = 28
      Width = 394
      Height = 166
      Align = alClient
      DataSource = DMMultiBalances.DSxMultiBalance
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
      Idioma = 'CAS'
      AutoCambiarColumna = False
      AutoPostEnCheckBox = False
      AutoStartDrag = False
      AutoStartDragInterval = 0
      IndiceBitmapOrdenable = 0
      IndiceBitmapAscendente = 1
      IndiceBitmapChecked = 3
      IndiceBitmapDescendente = 2
      BaseDeDatos = DMMain.DataBase
      Transaction = DMMultiSeleccion.TLocal
      BuscarNums = False
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      ColumnasCheckBoxes.Strings = (
        'MARCADO')
      ColumnasChecked.Strings = (
        '1')
      ColumnasNoChecked.Strings = (
        '0')
      MensajeNoExiste = False
      SalirSiVacio = False
      SalirSiNoExiste = False
      Posicion = tpCentrado
      OrdenMultiple = True
      Filtros = []
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CANAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 50
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO_CANAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 253
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MARCADO'
          ReadOnly = True
          Width = 51
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 196
    Width = 398
  end
  inherited CEMain: TControlEdit
    DataSource = DMMultiSeleccion.DSxMultiSeleccion
    Left = 200
    Top = 94
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 240
    Top = 92
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
  end
  inherited ALMain: TLFActionList
    Left = 164
    Top = 149
    object AMarcarTodos: TAction
      Caption = 'AMarcarTodos'
      Hint = 'Marcar Todos'
      ImageIndex = 146
      OnExecute = AMarcarTodosExecute
    end
    object ADesmarcarTodos: TAction
      Caption = 'ADesmarcarTodos'
      Hint = 'Desmarcar Todos'
      ImageIndex = 147
      OnExecute = ADesmarcarTodosExecute
    end
    object ASalir: TAction
      Caption = 'ASalir'
      Hint = 'Salir'
      ImageIndex = 0
    end
  end
end
