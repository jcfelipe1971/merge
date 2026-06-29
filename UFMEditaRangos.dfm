inherited FMEditaRangos: TFMEditaRangos
  Left = 394
  Top = 227
  Caption = 'Edici'#243'n de Rangos'
  ClientHeight = 289
  ClientWidth = 640
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 640
    Height = 265
    inherited TBMain: TLFToolBar
      Width = 636
      TabOrder = 1
      inherited NavMain: THYMNavigator
        Width = 240
        DataSource = DMRangosPortes.DSxRangosTMP
        Hints.Strings = ()
        TabOrder = 1
      end
      inherited TSepNav: TToolButton
        Left = 240
      end
      inherited EPMain: THYMEditPanel
        Left = 248
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
        TabOrder = 2
      end
      inherited TSepTerc: TToolButton
        Left = 273
      end
      inherited TbuttComp: TToolButton
        Left = 281
      end
      object TButtAceptar: TToolButton
        Left = 304
        Top = 0
        Hint = 'Aceptar Rangos'
        Caption = 'Aceptar Rangos'
        ImageIndex = 19
        OnClick = TButtAceptarClick
      end
      object TBSeparador: TToolButton
        Left = 327
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object LRango: TLFLabel
        Left = 335
        Top = 0
        Width = 57
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = 'Rango'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object DBEDescripcion: TLFDbedit
        Left = 392
        Top = 0
        Width = 239
        Height = 22
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMRangosPortes.DSQMCabecera
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object DBGFRangos: TDBGridFind2000
      Left = 2
      Top = 28
      Width = 636
      Height = 235
      Align = alClient
      DataSource = DMRangosPortes.DSxRangosTMP
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
      AutoPostEnCheckBox = False
      AutoStartDrag = False
      AutoStartDragInterval = 0
      IndiceBitmapOrdenable = 0
      IndiceBitmapAscendente = 0
      IndiceBitmapChecked = -1
      IndiceBitmapDescendente = 0
      BaseDeDatos = DMMain.DataBase
      Transaction = DMRangosPortes.TLocal
      BuscarNums = False
      CamposAMostrarAnchos.Strings = (
        '0')
      CampoAOrdenarColor = clInfoBk
      CamposNoAccesibles.Strings = (
        'LINEA'
        'EMPRESA'
        'ENTRADA'
        'ID_RANGO'
        'RANGO')
      MensajeNoExiste = False
      SalirSiVacio = False
      SalirSiNoExiste = False
      Posicion = tpCentrado
      OrdenMultiple = True
      OrdenadosPor.Strings = (
        '')
      Filtros = []
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LINEA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 44
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALOR'
          Width = 89
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 265
    Width = 640
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
