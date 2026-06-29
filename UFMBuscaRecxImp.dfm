inherited FMBuscaRecxImp: TFMBuscaRecxImp
  Left = 437
  Top = 312
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Buscar recibos por importe'
  ClientHeight = 343
  ClientWidth = 971
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 971
    Height = 319
    inherited TBMain: TLFToolBar
      Width = 967
      EdgeBorders = [ebBottom]
      TabOrder = 1
      inherited NavMain: THYMNavigator
        Width = 112
        DataSource = DMCartera.DSxCarteraDet
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton
        Left = 112
      end
      inherited EPMain: THYMEditPanel
        Left = 120
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
        TabOrder = 2
      end
      inherited TSepTerc: TToolButton
        Left = 145
      end
      inherited TbuttComp: TToolButton
        Left = 153
      end
      object TButtSeparador: TToolButton
        Left = 176
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object PNLImporte: TLFPanel
        Left = 184
        Top = 0
        Width = 401
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object LBImporte: TLFLabel
          Left = 17
          Top = 4
          Width = 35
          Height = 13
          Alignment = taRightJustify
          Caption = 'Importe'
        end
        object LBMasMenos: TLFLabel
          Left = 116
          Top = 4
          Width = 14
          Height = 13
          Alignment = taRightJustify
          Caption = '+/-'
        end
        object EDTImporte: TLFEdit
          Left = 56
          Top = 0
          Width = 57
          Height = 21
          TabOrder = 0
          OnKeyUp = EDTImporteKeyUp
        end
        object EDTMasMenos: TLFEdit
          Left = 133
          Top = 0
          Width = 25
          Height = 21
          TabOrder = 1
          Text = '0'
          OnKeyUp = EDTImporteKeyUp
        end
        object UpDown: TUpDown
          Left = 158
          Top = 0
          Width = 15
          Height = 21
          Associate = EDTMasMenos
          Min = 0
          Max = 1000
          Position = 0
          TabOrder = 2
          Wrap = False
        end
        object CBPagados: TLFCheckBox
          Left = 192
          Top = 2
          Width = 89
          Height = 17
          Caption = 'Incl. Pagados'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 3
          TabStop = True
          Alignment = taLeftJustify
        end
        object CBInvisibles: TLFCheckBox
          Left = 296
          Top = 2
          Width = 91
          Height = 17
          Caption = 'Incl. Invisibles'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 4
          TabStop = True
          Alignment = taLeftJustify
        end
      end
      object TButtBuscar: TToolButton
        Left = 585
        Top = 0
        Hint = 'Buscar'
        Caption = 'Buscar'
        ImageIndex = 85
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtBuscarClick
      end
    end
    object DBGFMain: TDBGridFind2000
      Left = 2
      Top = 28
      Width = 967
      Height = 289
      Align = alClient
      Color = clInfoBk
      DataSource = DMCartera.DSxCarteraDet
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGFMainDrawColumnCell
      OnDblClick = DBGFMainDblClick
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
        'VENCIMIENTO'
        'PAGADO'
        'LIQUIDO'
        'FECHA_CIERRE'
        'FECHA_RECIBIDO'
        'FECHA_VALOR'
        'ESTADO'
        'CTA_PAGO'
        'DOCUMENTO'
        'NOMBRE'
        'TITULO'
        'ANTICIPADO'
        'TIPO_EFECTO'
        'EJERCICIO'
        'VISIBLE'
        'REGISTRO'
        'REMESA'
        'MONEDA'
        'RECIBIDO'
        'IMPAGADO'
        'LINEA')
      ColumnasCheckBoxes.Strings = (
        'PAGADO'
        'RECIBIDO'
        'ANTICIPADO'
        'VISIBLE')
      ColumnasChecked.Strings = (
        '1'
        '1'
        '1'
        '0')
      ColumnasNoChecked.Strings = (
        '0'
        '0'
        '0'
        '1')
      MensajeNoExiste = False
      SalirSiVacio = False
      SalirSiNoExiste = False
      Posicion = tpCentrado
      OrdenMultiple = True
      Filtros = []
      Entorno = DMMain.EntornoBusqueda
      Columns = <
        item
          Expanded = False
          FieldName = 'EJERCICIO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SIGNO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 23
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REGISTRO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LINEA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'VENCIMIENTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 63
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CTA_PAGO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LIQUIDO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RECIBIDO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PAGADO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VISIBLE'
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO_EFECTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'REMESA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 48
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ANTICIPADO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 25
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOCUMENTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MONEDA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 42
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MONEDA_CANAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'LIQUIDO_CANAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'FECHA_RECIBIDO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 63
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_VALOR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 63
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 319
    Width = 971
  end
  inherited CEMain: TControlEdit
    Left = 432
    Top = 96
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 464
    Top = 96
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
    Left = 344
    Top = 72
  end
  inherited FSMain: TLFFibFormStorage
    Left = 288
    Top = 72
  end
end
