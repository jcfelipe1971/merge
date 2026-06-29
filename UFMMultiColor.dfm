inherited FMMultiColor: TFMMultiColor
  Caption = 'Selecci'#243'n Multicolor'
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        Width = 115
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton
        Left = 115
      end
      inherited EPMain: THYMEditPanel
        Left = 123
        Width = 23
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 146
      end
      inherited TbuttComp: TToolButton
        Left = 154
      end
      object TBSep: TToolButton
        Left = 177
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBMarcarTodos: TToolButton
        Left = 185
        Top = 0
        Hint = 'Marcar todos los colores'
        Action = AMarcarTodos
      end
      object TBDesmarcarTodos: TToolButton
        Left = 208
        Top = 0
        Hint = 'Desmarcar todos los colores'
        Action = ADesmarcarTodos
      end
    end
    object DBGMain: TDBGridFind2000
      Left = 2
      Top = 28
      Width = 498
      Height = 302
      Align = alClient
      DataSource = DMMultiColor.DSQMColores
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
      AutoCambiarColumna = False
      AutoPostEnCheckBox = True
      AutoStartDrag = False
      AutoStartDragInterval = 0
      IndiceBitmapOrdenable = 0
      IndiceBitmapAscendente = 1
      IndiceBitmapChecked = 3
      IndiceBitmapDescendente = 2
      BaseDeDatos = DMMain.DataBase
      Transaction = DMMultiColor.TLocal
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
          FieldName = 'S_COLOR'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO'
          ReadOnly = True
          Width = 269
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MARCADO'
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    ActionList = nil
  end
  inherited CEMainPMEdit: TPopUpTeclas
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
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    object AMarcarTodos: TAction
      Caption = 'Marcar Todos'
      ImageIndex = 146
      OnExecute = AMarcarTodosExecute
    end
    object ADesmarcarTodos: TAction
      Caption = 'Desmarcar Todos'
      ImageIndex = 147
      OnExecute = ADesmarcarTodosExecute
    end
  end
end
