inherited FMPreciosArticuloDoc: TFMPreciosArticuloDoc
  Left = 491
  Top = 233
  Caption = 'Precios de Art'#237'culo por Tarifas'
  ClientHeight = 466
  ClientWidth = 792
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 792
    Height = 442
    inherited TBMain: TLFToolBar
      Width = 788
      inherited NavMain: THYMNavigator
        Width = 110
        DataSource = DMPreciosArticuloDoc.DSQMTarifas
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton
        Left = 110
      end
      inherited EPMain: THYMEditPanel
        Left = 118
        Width = 58
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickSalir = EPMainClickSalir
      end
      inherited TSepTerc: TToolButton
        Left = 176
      end
      inherited TbuttComp: TToolButton
        Left = 184
      end
      object TBSep1: TToolButton
        Left = 207
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object PNLMoneda: TLFPanel
        Left = 215
        Top = 0
        Width = 352
        Height = 22
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 2
        object LMoneda: TLFLabel
          Left = 10
          Top = 4
          Width = 39
          Height = 13
          Alignment = taRightJustify
          Caption = 'Moneda'
        end
        object DBMoneda: TLFDbedit
          Left = 53
          Top = 0
          Width = 59
          Height = 21
          Color = clInfoBk
          DataField = 'MONEDA'
          DataSource = DMPreciosArticuloDoc.DSxMonedas
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object DBTitMoneda: TLFDbedit
          Left = 113
          Top = 0
          Width = 239
          Height = 21
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMPreciosArticuloDoc.DSxMonedas
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
    end
    object DBGFTarifas: TDBGridFind2000
      Left = 2
      Top = 28
      Width = 788
      Height = 412
      Align = alClient
      BorderStyle = bsNone
      Color = clInfoBk
      DataSource = DMPreciosArticuloDoc.DSQMTarifas
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDblClick = DBGFTarifasDblClick
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
      Transaction = DMPreciosArticuloDoc.TLocal
      BuscarNums = False
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      CamposAOrdernar.Strings = (
        'ARTICULO'
        'BLOQUEADO'
        'COMISION'
        'FAMILIA'
        'P_COSTE'
        'PRECIO_PONDERADO'
        'PVP'
        'TARIFA'
        'TITULO')
      CamposNoAccesibles.Strings = (
        'ARTICULO'
        'COMISION'
        'FAMILIA'
        'P_COSTE'
        'PRECIO_PONDERADO'
        'TARIFA'
        'TITULO')
      ColumnasCheckBoxes.Strings = (
        'BLOQUEADO')
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
          Expanded = False
          FieldName = 'ARTICULO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 78
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
          ReadOnly = True
          Width = 211
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FAMILIA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 28
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TARIFA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 27
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNID_MINIMAS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 49
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNID_MAXIMAS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 62
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECIO_PONDERADO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 62
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'P_COSTE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 62
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COMISION'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 49
          Visible = True
        end
        item
          Color = clWindow
          Expanded = False
          FieldName = 'MARGEN'
          Width = 43
          Visible = True
        end
        item
          Color = clWindow
          Expanded = False
          FieldName = 'PVP'
          Width = 56
          Visible = True
        end
        item
          Color = clWindow
          Expanded = False
          FieldName = 'BLOQUEADO'
          Width = 19
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 442
    Width = 792
  end
  inherited CEMain: TControlEdit
    Left = 256
    Top = 104
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 336
    Top = 104
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
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
end
