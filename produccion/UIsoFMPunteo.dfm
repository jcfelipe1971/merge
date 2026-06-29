inherited IsoFMPunteo: TIsoFMPunteo
  Left = 207
  Top = 187
  Width = 858
  Height = 473
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Punteos y Cierres de Informes de No Conformidad'
  OldCreateOrder = False
  PopupMenu = nil
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 848
    Height = 420
    inherited TBMain: TLFToolBar
      Width = 844
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      TabOrder = 1
      inherited NavMain: THYMNavigator
        Width = 144
        DataSource = IsoDMPunteo.DSQMPunteo
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbPost, nbCancel]
        Hints.Strings = ()
        EditaControl = DBGFPunteoInc
        InsertaControl = DBGFPunteoInc
      end
      inherited TSepNav: TToolButton
        Left = 144
      end
      inherited EPMain: THYMEditPanel
        Left = 152
        Width = 33
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 185
      end
      inherited TbuttComp: TToolButton
        Left = 193
      end
      object TBSep1: TToolButton
        Left = 216
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBTipos: TToolButton
        Left = 224
        Top = 0
        Caption = 'Tipos'
        DropdownMenu = PMPunteo
        ImageIndex = 118
        Style = tbsDropDown
      end
      object TBSep2: TToolButton
        Left = 260
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBValidar: TToolButton
        Left = 268
        Top = 0
        Action = AIsoValidar
      end
    end
    object DBGFPunteoInc: TDBGridFind2000
      Left = 2
      Top = 28
      Width = 844
      Height = 390
      Align = alClient
      DataSource = IsoDMPunteo.DSQMPunteo
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
      BuscarNums = False
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      CamposAOrdernar.Strings = (
        'CLI_PRO_INTE')
      ColumnasCheckBoxes.Strings = (
        'VBCALIDAD'
        'VBRESDEPARTAMENTO'
        'ESTADO')
      ColumnasChecked.Strings = (
        '1'
        '1'
        '1')
      ColumnasNoChecked.Strings = (
        '0'
        '0'
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
          FieldName = 'RIC'
          Width = 70
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TIPO'
          ReadOnly = True
          Width = 45
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'xDescTipo'
          ReadOnly = True
          Width = 140
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CLI_PRO_INTE'
          ReadOnly = True
          Width = 70
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'xDescCliPro'
          ReadOnly = True
          Width = 240
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'SITUACION'
          ReadOnly = True
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VBCALIDAD'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VBRESDEPARTAMENTO'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESTADO'
          Width = 60
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 420
    Width = 848
  end
  inherited CEMain: TControlEdit
    Left = 424
    Top = 0
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 464
    Top = 0
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
    inherited CEMainMiedit: TMenuItem
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
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 496
    Top = 0
  end
  inherited FSMain: TLFFibFormStorage
    Left = 536
    Top = 0
  end
  object ALIsoIncPunteo: TActionList
    Images = DMMain.ILMain_Ac
    Left = 496
    Top = 32
    object AIsoValidar: TAction
      Caption = 'Validar INC'
      Hint = 'Confirmar el cierre y vistos bueos de los INC'#39's'
      ImageIndex = 19
      OnExecute = AIsoValidarExecute
    end
    object AIsoClienteFiltro: TAction
      Category = 'Filtro'
      Caption = '&Cliente'
      OnExecute = AIsoClienteFiltroExecute
    end
    object AIsoProvFiltro: TAction
      Category = 'Filtro'
      Caption = '&Proveedor'
      OnExecute = AIsoProvFiltroExecute
    end
    object AIsoOtrosFiltro: TAction
      Category = 'Filtro'
      Caption = '&Varios/Otros'
      OnExecute = AIsoOtrosFiltroExecute
    end
    object AIsoTodosFiltro: TAction
      Category = 'Filtro'
      Caption = '&Todos'
      OnExecute = AIsoTodosFiltroExecute
    end
  end
  object PMPunteo: TPopupMenu
    AutoHotkeys = maManual
    Left = 536
    Top = 32
    object MGTipo: TMenuItem
      Caption = 'Tipo'
      object MITodos: TMenuItem
        Action = AIsoTodosFiltro
      end
      object MICliente: TMenuItem
        Action = AIsoClienteFiltro
      end
      object MIProveedor: TMenuItem
        Action = AIsoProvFiltro
      end
      object MIOtrosVarios: TMenuItem
        Action = AIsoOtrosFiltro
      end
    end
  end
end
