inherited FInfoLotesLst: TFInfoLotesLst
  Left = 406
  Top = 284
  Width = 987
  Height = 327
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Lotes'
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 977
    Height = 274
    inherited TBMain: TLFToolBar
      Width = 973
      TabOrder = 1
      inherited NavMain: THYMNavigator
        Width = 88
        DataSource = DMLstTrazabilidadLotes.DSxLotes
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton
        Left = 88
      end
      inherited EPMain: THYMEditPanel
        Left = 96
        Width = 33
        VisibleButtons = [neSalir]
        Hints.Strings = ()
        TabOrder = 2
      end
      inherited TSepTerc: TToolButton
        Left = 129
      end
      inherited TbuttComp: TToolButton
        Left = 137
      end
      object PNLFiltroLote: TLFPanel
        Left = 160
        Top = 0
        Width = 200
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object LFLLote: TLFLabel
          Left = 14
          Top = 4
          Width = 55
          Height = 13
          Alignment = taRightJustify
          Caption = 'Filtrar Lote  '
          Layout = tlCenter
        end
        object LFELote: TLFEdit
          Left = 73
          Top = 0
          Width = 121
          Height = 21
          TabOrder = 0
          OnKeyDown = LFELoteKeyDown
        end
      end
      object ToolButton1: TToolButton
        Left = 360
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBBuscarLote: TToolButton
        Left = 368
        Top = 0
        Hint = 'Filtrar por Lote'
        Caption = 'TBBuscarLote'
        ImageIndex = 5
        ParentShowHint = False
        ShowHint = True
        Style = tbsCheck
        OnClick = TBBuscarLoteClick
      end
    end
    object DBGInfoLotes: TFIBHYGGridFind
      Left = 2
      Top = 28
      Width = 973
      Height = 244
      Align = alClient
      DataSource = DMLstTrazabilidadLotes.DSxLotes
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGInfoLotesDblClick
      IniStorage = FSMain
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
      Idioma = 'CAS'
      AutoCambiarColumna = True
      AutoPostEnCheckBox = False
      AutoStartDrag = False
      AutoStartDragInterval = 0
      IndiceBitmapOrdenable = 0
      IndiceBitmapAscendente = 0
      IndiceBitmapChecked = -1
      IndiceBitmapDescendente = 0
      BaseDeDatos = DMMain.DataBase
      Transaction = DMLstTrazabilidadLotes.TLocal
      BuscarNums = False
      CampoAOrdenarColor = clInfoBk
      MensajeNoExiste = False
      SalirSiVacio = False
      SalirSiNoExiste = False
      Posicion = tpCentrado
      OrdenMultiple = True
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ID_LOTE'
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LOTE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'F_ENVASADO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'F_CADUCIDAD'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'F_FABRICACION'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CLASIFICACION'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 412
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 274
    Width = 977
  end
  inherited CEMain: TControlEdit
    Left = 296
    Top = 48
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 376
    Top = 56
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
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 152
    Top = 120
  end
end
