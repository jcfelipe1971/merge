inherited FMConfigTraspasoLotes: TFMConfigTraspasoLotes
  Left = 562
  Top = 248
  Caption = 'Traspaso de Lotes'
  ClientHeight = 240
  ClientWidth = 590
  OldCreateOrder = True
  Visible = True
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 590
    Height = 216
    inherited TBMain: TLFToolBar
      Width = 586
      TabOrder = 1
      inherited EPMain: THYMEditPanel
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
        OnClickSalir = EPMainClickSalir
      end
      object TButtAceptar: TToolButton
        Left = 25
        Top = 0
        Hint = 'Aceptar la configuraci'#243'n de lotes'
        Caption = 'Aceptar la configuraci'#243'n de lotes'
        ImageIndex = 19
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtAceptarClick
      end
      object TBSep2: TToolButton
        Left = 48
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtLotes: TToolButton
        Left = 56
        Top = 0
        Hint = 'Selecci'#243'n de Lotes'
        Caption = 'Selecci'#243'n de Lotes'
        ImageIndex = 120
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtLotesClick
      end
      object TBParametrizacion: TToolButton
        Left = 79
        Top = 0
        Hint = 'Parametrizaci'#243'n de lotes'
        Caption = 'TBParametrizacion'
        ImageIndex = 1
        OnClick = TBParametrizacionClick
      end
      object PNLArticulo: TLFPanel
        Left = 102
        Top = 0
        Width = 389
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object LBArticulo: TLFLabel
          Left = 11
          Top = 4
          Width = 46
          Height = 13
          Alignment = taRightJustify
          Caption = 'Art'#237'culo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object EArticulo: TLFEdit
          Left = 60
          Top = 0
          Width = 89
          Height = 21
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object ETituloArticulo: TLFEdit
          Left = 150
          Top = 0
          Width = 239
          Height = 21
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
      end
    end
    object DBGFLotes: TDBGridFind2000
      Left = 2
      Top = 50
      Width = 586
      Height = 164
      Align = alClient
      DataSource = DMConfigTraspasoLotes.DSQMConfigLotes
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
      IndiceBitmapAscendente = 0
      IndiceBitmapChecked = -1
      IndiceBitmapDescendente = 0
      BaseDeDatos = DMMain.DataBase
      BuscarNums = False
      CampoAOrdenarColor = clInfoBk
      CamposNoAccesibles.Strings = (
        'ID_A'
        'ID_DETALLES'
        'LINEA'
        'ARTICULO'
        'TIPO'
        'PROVEEDOR'
        'ID_LOTE')
      MensajeNoExiste = False
      SalirSiVacio = False
      SalirSiNoExiste = False
      Posicion = tpCentrado
      OrdenMultiple = True
      Filtros = []
      Columns = <
        item
          Expanded = False
          FieldName = 'LOTE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'F_ENVASADO'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'F_CADUCIDAD'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'F_FABRICACION'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SERIE'
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLASIFICACION'
          Width = 114
          Visible = True
        end>
    end
    object TBNav: TLFToolBar
      Left = 2
      Top = 28
      Width = 586
      Height = 22
      ButtonHeight = 21
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      TabOrder = 2
      Separators = True
      object NavMain: THYMNavigator
        Left = 0
        Top = 0
        Width = 240
        Height = 21
        DataSource = DMConfigTraspasoLotes.DSQMConfigLotes
        Flat = True
        ParentShowHint = False
        PopupMenu = CEMainPMEdit
        ShowHint = True
        TabOrder = 0
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        Exclusivo = True
        ControlEdit = CEMain
        OrdenAscendente = True
        InsertaUltimo = False
      end
      object TSep1: TToolButton
        Left = 240
        Top = 0
        Width = 25
        Style = tbsSeparator
      end
      object DBEUnidadesRestantes: TLFDbedit
        Left = 265
        Top = 0
        Width = 121
        Height = 21
        Color = clInfoBk
        DataField = 'TOTAL'
        DataSource = DMConfigTraspasoLotes.DSxUnidadesEtiquetar
        Enabled = False
        ReadOnly = True
        TabOrder = 1
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 216
    Width = 590
  end
  inherited CEMain: TControlEdit
    Left = 328
    Top = 72
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 424
    Top = 80
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
end
