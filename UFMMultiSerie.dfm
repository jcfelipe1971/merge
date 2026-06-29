inherited FMMultiSerie: TFMMultiSerie
  Left = 641
  Top = 174
  Caption = 'Selecci'#243'n de Series'
  ClientHeight = 220
  ClientWidth = 392
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 392
    Height = 196
    inherited TBMain: TLFToolBar
      Width = 388
      TabOrder = 1
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
        Width = 38
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 161
      end
      inherited TbuttComp: TToolButton
        Left = 169
      end
      object TBSep: TToolButton
        Left = 192
        Top = 0
        Width = 8
        ImageIndex = 148
        Style = tbsSeparator
      end
      object TButtMarcarTodos: TToolButton
        Left = 200
        Top = 0
        Action = AMarcarTodos
        ParentShowHint = False
        ShowHint = True
      end
      object TButtDesmarcarTodos: TToolButton
        Left = 223
        Top = 0
        Action = ADesmarcarTodos
        ParentShowHint = False
        ShowHint = True
      end
    end
    object DBGMain: TDBGridFind2000
      Left = 2
      Top = 28
      Width = 388
      Height = 166
      Align = alClient
      DataSource = DMMultiserie.DSQMSeries
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
      AutoCambiarColumna = False
      AutoPostEnCheckBox = True
      AutoStartDrag = False
      AutoStartDragInterval = 0
      IndiceBitmapOrdenable = 0
      IndiceBitmapAscendente = 1
      IndiceBitmapChecked = 3
      IndiceBitmapDescendente = 2
      BaseDeDatos = DMMain.DataBase
      Transaction = DMMultiserie.TLocal
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
          FieldName = 'SERIE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 56
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 239
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MARCADO'
          Width = 49
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 196
    Width = 392
    ActionList = nil
  end
  inherited CEMain: TControlEdit
    Left = 152
    Top = 146
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 276
    Top = 152
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
    Left = 56
    Top = 141
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
