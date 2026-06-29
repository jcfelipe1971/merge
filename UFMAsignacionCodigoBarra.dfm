inherited FMAsignacionCodigoBarra: TFMAsignacionCodigoBarra
  ActiveControl = DBGMain
  Caption = 'Asignacion Codigo Barra'
  ClientWidth = 587
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 587
    inherited TBMain: TLFToolBar
      Width = 583
      object NavMain: THYMNavigator [0]
        Left = 0
        Top = 0
        Width = 220
        Height = 22
        DataSource = DMAsignacionCodigoBarra.DSQMCodigosBarra
        Flat = True
        ParentShowHint = False
        PopupMenu = CEMainPMEdit
        ShowHint = True
        TabOrder = 2
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        Exclusivo = True
        ControlEdit = CEMain
        OrdenAscendente = True
        InsertaUltimo = False
      end
      object TSep1: TToolButton [1]
        Left = 220
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object PNLTipoCodigoBarra: TLFPanel [2]
        Left = 228
        Top = 0
        Width = 189
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object LTipoCodigoBarra: TLFLabel
          Left = 13
          Top = 4
          Width = 21
          Height = 13
          Caption = 'Tipo'
        end
        object CBTipoCodigoBarra: TLFComboBox
          Left = 40
          Top = 0
          Width = 145
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          Text = 'CBTipoCodigoBarra'
          OnChange = CBTipoCodigoBarraChange
        end
      end
      object TSep2: TToolButton [3]
        Left = 417
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      inherited EPMain: THYMEditPanel
        Left = 425
        Width = 23
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object DBGMain: TDBGridFind2000
      Left = 2
      Top = 28
      Width = 583
      Height = 302
      Align = alClient
      DataSource = DMAsignacionCodigoBarra.DSQMCodigosBarra
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnKeyPress = DBGMainKeyPress
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
          Expanded = False
          FieldName = 'BARRAS'
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ARTICULO'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TIPO'
          ReadOnly = True
          Width = 35
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO'
          ReadOnly = True
          Width = 256
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Width = 587
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
