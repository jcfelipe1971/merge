inherited FMLmpTablasTmp: TFMLmpTablasTmp
  Left = 556
  Top = 288
  BorderIcons = [biSystemMenu]
  Caption = 'Limpia las tablas temporales del sistema'
  ClientHeight = 247
  ClientWidth = 368
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 368
    Height = 223
    inherited TBMain: TLFToolBar
      Width = 364
      object TButtTodas: TToolButton [0]
        Left = 0
        Top = 0
        Action = ASeleccionarTodo
        ParentShowHint = False
        ShowHint = True
      end
      object TButtDesmarcar: TToolButton [1]
        Left = 23
        Top = 0
        Action = ADesSeleccionar
        ParentShowHint = False
        ShowHint = True
      end
      object TButtRefrescar: TToolButton [2]
        Left = 46
        Top = 0
        Action = ARefrescar
        ParentShowHint = False
        ShowHint = True
      end
      object TButtSep2: TToolButton [3]
        Left = 69
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtLimpiar: TToolButton [4]
        Left = 77
        Top = 0
        Hint = 'Limpiar todas las tablas marcadas'
        Caption = 'Limpiar'
        ImageIndex = 25
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtLimpiarClick
      end
      object TButtSep3: TToolButton [5]
        Left = 100
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      inherited EPMain: THYMEditPanel
        Left = 108
        Width = 22
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object DBGridFTablas: TDBGridFind2000
      Left = 2
      Top = 28
      Width = 364
      Height = 193
      Align = alClient
      DataSource = DMLmpTablasTmp.DSQMTablasTemporales
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgCancelOnExit]
      ReadOnly = True
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
      Transaction = DMLmpTablasTmp.TLocal
      BuscarNums = False
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      CamposAOrdernar.Strings = (
        'NOMBRE')
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
          FieldName = 'NOMBRE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 265
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MARCADO'
          Width = 48
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 223
    Width = 368
  end
  inherited CEMain: TControlEdit
    Left = 216
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 252
    Top = 4
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
    Left = 184
    Top = 8
    object ASeleccionarTodo: TAction
      Hint = 'Marcar todas las tablas'
      ImageIndex = 146
      OnExecute = ASeleccionarTodoExecute
    end
    object ADesSeleccionar: TAction
      Hint = 'DesMarcar todas las tablas'
      ImageIndex = 147
      OnExecute = ADesSeleccionarExecute
    end
    object ARefrescar: TAction
      Hint = 'Refresca todas las tablas'
      ImageIndex = 26
      OnExecute = ARefrescarExecute
    end
  end
end
