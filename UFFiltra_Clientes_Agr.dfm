inherited FFiltra_Clientes_Agr: TFFiltra_Clientes_Agr
  Left = 835
  Top = 358
  ActiveControl = EFAgrupacion
  Caption = 'Filtrado de Clientes por Agrupaci'#243'n'
  ClientHeight = 274
  ClientWidth = 392
  OldCreateOrder = True
  Position = poDefault
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 392
    Height = 250
    object SBAnade: TSpeedButton [0]
      Left = 270
      Top = 114
      Width = 110
      Height = 30
      Caption = '&Insertar Condici'#243'n'
      Flat = True
      OnClick = SBAnadeClick
    end
    object SBBorraCond: TSpeedButton [1]
      Left = 270
      Top = 155
      Width = 110
      Height = 30
      Caption = '&Borrar Condici'#243'n'
      Flat = True
      OnClick = SBBorraCondClick
    end
    object SBAceptar: TSpeedButton [2]
      Left = 270
      Top = 197
      Width = 110
      Height = 30
      Caption = '&Aceptar'
      Flat = True
      NumGlyphs = 2
      OnClick = SBAceptarClick
    end
    inherited TBMain: TLFToolBar
      Width = 388
      inherited EPMain: THYMEditPanel
        Width = 33
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object SGCondiciones: TStringGrid
      Left = 5
      Top = 110
      Width = 251
      Height = 160
      Color = clInfoBk
      ColCount = 2
      DefaultRowHeight = 21
      FixedColor = clSilver
      FixedCols = 0
      RowCount = 2
      TabOrder = 1
      ColWidths = (
        64
        163)
    end
    object GBAgrupacion: TGroupBox
      Left = 4
      Top = 30
      Width = 384
      Height = 74
      Caption = 'Condici'#243'n'
      TabOrder = 2
      object LBLAgrupacion: TLFLabel
        Left = 11
        Top = 50
        Width = 54
        Height = 13
        Alignment = taRightJustify
        Caption = 'Agrupaci'#243'n'
      end
      object EFAgrupacion: TLFEditFind2000
        Left = 70
        Top = 46
        Width = 51
        Height = 21
        TabOrder = 0
        OnChange = EFAgrupacionChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'AGRUPACION'
        CampoStr = 'TITULO'
        CondicionBusqueda = 'tipo='#39'C'#39
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ver_agrupaciones'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'AGRUPACION')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
      object ETitulo: TLFEdit
        Left = 122
        Top = 46
        Width = 255
        Height = 21
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object CHKAnd: TLFCheckBox
        Left = 35
        Top = 17
        Width = 49
        Height = 17
        Caption = 'Y'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 2
        TabStop = True
        OnClick = CHKAndClick
        Alignment = taLeftJustify
      end
      object CHKor: TLFCheckBox
        Left = 154
        Top = 17
        Width = 49
        Height = 17
        Caption = 'O'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 3
        TabStop = True
        OnClick = CHKorClick
        Alignment = taLeftJustify
      end
      object CHKNOT: TLFCheckBox
        Left = 273
        Top = 17
        Width = 52
        Height = 17
        Caption = 'NI'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 4
        TabStop = True
        OnClick = CHKNOTClick
        Alignment = taLeftJustify
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 250
    Width = 392
  end
  inherited CEMain: TControlEdit
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
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
    Left = 344
    Top = 8
  end
end
