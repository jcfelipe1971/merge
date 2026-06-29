inherited FMProcesosMasivosLineas: TFMProcesosMasivosLineas
  Left = 486
  Top = 256
  Width = 736
  Height = 468
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Procesos Masivos sobre Lineas'
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 726
    Height = 415
    inherited TBMain: TLFToolBar
      Width = 722
      inherited NavMain: THYMNavigator
        Width = 216
        DataSource = DMProcesosMasivosLineas.DSQMDocLineas
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        EditaControl = DBGMain
        InsertaControl = DBGMain
      end
      inherited TSepNav: TToolButton
        Left = 216
      end
      inherited EPMain: THYMEditPanel
        Left = 224
        Width = 33
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 257
      end
      inherited TbuttComp: TToolButton
        Left = 265
      end
      object TBSep1: TToolButton
        Left = 288
        Top = 0
        Width = 8
        ImageIndex = 25
        Style = tbsSeparator
      end
      object TBMarcarTodo: TToolButton
        Left = 296
        Top = 0
        Hint = 'Marcar Todo'
        Caption = 'Marcar Todo'
        ImageIndex = 146
        OnClick = TBMarcarTodoClick
      end
      object TBDesmarcarTodo: TToolButton
        Left = 319
        Top = 0
        Hint = 'Desmarcar Todo'
        Caption = 'Desmarcar Todo'
        ImageIndex = 147
        OnClick = TBDesmarcarTodoClick
      end
      object TBSep2: TToolButton
        Left = 342
        Top = 0
        Width = 8
        ImageIndex = 23
        Style = tbsSeparator
      end
      object TBConfirmar: TToolButton
        Left = 350
        Top = 0
        Hint = 'Confirmar seleccion'
        Caption = 'Confirmar'
        ImageIndex = 19
        OnClick = TBConfirmarClick
      end
      object TBSep3: TToolButton
        Left = 373
        Top = 0
        Width = 8
        ImageIndex = 20
        Style = tbsSeparator
      end
      object TBCancelar: TToolButton
        Left = 381
        Top = 0
        Hint = 'Cancelar Seleccion'
        Caption = 'Cancelar'
        ImageIndex = 20
        OnClick = TBCancelarClick
      end
    end
    object DBGMain: TDBGridFind2000
      Left = 2
      Top = 28
      Width = 722
      Height = 385
      Align = alClient
      DataSource = DMProcesosMasivosLineas.DSQMDocLineas
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
      AutoPostEnCheckBox = True
      AutoStartDrag = False
      AutoStartDragInterval = 0
      IndiceBitmapOrdenable = 0
      IndiceBitmapAscendente = 1
      IndiceBitmapChecked = 3
      IndiceBitmapDescendente = 2
      BaseDeDatos = DMMain.DataBase
      BuscarNums = False
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      ColumnasCheckBoxes.Strings = (
        'SELECCIONADO')
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
      Entorno = DMMain.EntornoBusqueda
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LINEA'
          ReadOnly = True
          Width = 45
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ORDEN'
          ReadOnly = True
          Width = 45
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ARTICULO'
          ReadOnly = True
          Width = 120
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO'
          ReadOnly = True
          Width = 300
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'UNIDADES'
          ReadOnly = True
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SELECCIONADO'
          Width = 70
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 415
    Width = 726
  end
  inherited CEMain: TControlEdit
    Left = 520
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 556
    Top = 4
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
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
    Left = 592
    Top = 4
  end
  inherited FSMain: TLFFibFormStorage
    Left = 632
    Top = 4
  end
end
