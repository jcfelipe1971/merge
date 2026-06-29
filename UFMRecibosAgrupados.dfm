inherited FMRecibosAgrupados: TFMRecibosAgrupados
  Left = 369
  Top = 304
  Width = 600
  Height = 370
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Recibos Agrupados'
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 590
    Height = 317
    inherited TBMain: TLFToolBar
      Width = 586
      TabOrder = 1
      inherited EPMain: THYMEditPanel
        Width = 23
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object DBGFRecibos: TDBGridFind2000
      Left = 2
      Top = 28
      Width = 586
      Height = 287
      Align = alClient
      DataSource = DMRecibosAgrupados.DSxAgrupados
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnDrawColumnCell = DBGFRecibosDrawColumnCell
      OnDblClick = DBGFRecibosDblClick
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
      Transaction = DMRecibosAgrupados.TLocal
      BuscarNums = False
      CampoAOrdenarColor = clInfoBk
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
          FieldName = 'EJERCICIO_REC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 45
          Visible = True
        end
        item
          Alignment = taRightJustify
          Color = clInfoBk
          Expanded = False
          FieldName = 'DOC_TIPO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taRightJustify
          Width = 29
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DOC_NUMERO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taRightJustify
          Width = 60
          Visible = True
        end
        item
          Alignment = taRightJustify
          Color = clInfoBk
          Expanded = False
          FieldName = 'DOC_SERIE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taRightJustify
          Width = 62
          Visible = True
        end
        item
          Alignment = taRightJustify
          Color = clInfoBk
          Expanded = False
          FieldName = 'DOC_FECHA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taRightJustify
          Width = 65
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'REGISTRO_REC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taRightJustify
          Width = 75
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LINEA_REC'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taRightJustify
          Width = 40
          Visible = True
        end
        item
          Alignment = taRightJustify
          Color = clInfoBk
          Expanded = False
          FieldName = 'VENCIMIENTO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taRightJustify
          Width = 65
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'liquido_moneda'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Alignment = taRightJustify
          Width = 107
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 317
    Width = 590
  end
  inherited CEMainPMEdit: TPopUpTeclas
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
