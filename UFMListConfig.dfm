inherited FMListConfig: TFMListConfig
  Left = 467
  Top = 306
  HelpContext = 708
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = ' Listados'
  ClientHeight = 220
  ClientWidth = 438
  OldCreateOrder = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 438
    Height = 220
    inherited TBMain: TLFToolBar
      Width = 438
      inherited TButtPrevisualizar: TToolButton
        Tag = 1
      end
      object TButtSalir2: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
        ParentShowHint = False
        ShowHint = True
      end
    end
    object PNLMain: TLFPanel
      Left = 0
      Top = 36
      Width = 438
      Height = 184
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object LBLFormato: TLFLabel
        Left = 28
        Top = 56
        Width = 38
        Height = 13
        Alignment = taRightJustify
        Caption = 'Formato'
      end
      object LBLCopias: TLFLabel
        Left = 20
        Top = 100
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = 'N. Copias'
      end
      object LBLCabecera: TLFLabel
        Left = 20
        Top = 78
        Width = 46
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cabecera'
      end
      object LTipo: TLFLabel
        Left = 45
        Top = 34
        Width = 21
        Height = 13
        Alignment = taRightJustify
        Caption = 'Tipo'
      end
      object LBLFormatoGrupo: TLFLabel
        Left = 349
        Top = 56
        Width = 29
        Height = 13
        Alignment = taRightJustify
        Caption = 'Grupo'
      end
      object LBLCabeceraGrupo: TLFLabel
        Left = 349
        Top = 78
        Width = 29
        Height = 13
        Alignment = taRightJustify
        Caption = 'Grupo'
      end
      object EFFormato: TLFEditFind2000
        Left = 71
        Top = 52
        Width = 40
        Height = 21
        TabOrder = 0
        OnChange = EFFormatoChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        Campos_Desplegar.Strings = (
          'TITULO')
        CampoADevolver = 'LISTADO'
        CampoNum = 'LISTADO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'DIC_LISTADOS'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFFormatoBusqueda
        Filtros = []
      end
      object ECopias: TLFEdit
        Left = 71
        Top = 96
        Width = 40
        Height = 21
        TabOrder = 2
        Text = '1'
      end
      object EFCabecera: TLFEditFind2000
        Left = 71
        Top = 74
        Width = 40
        Height = 21
        TabOrder = 1
        OnChange = EFCabeceraChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        Campos_Desplegar.Strings = (
          'TITULO')
        CampoADevolver = 'LISTADO'
        CampoNum = 'LISTADO'
        CampoStr = 'TITULO'
        CondicionBusqueda = 'grupo=1000'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'DIC_LISTADOS'
        Tabla_asociada.DesplegarBusqueda = False
        Filtros = []
      end
      object CHKPijama: TLFCheckBox
        Left = 71
        Top = 122
        Width = 300
        Height = 17
        Caption = 'Pijama'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 3
        TabStop = True
        Alignment = taLeftJustify
      end
      object DBEFormato: TLFDbedit
        Left = 112
        Top = 52
        Width = 220
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMListConfig.DSxListadoDef
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object DBECabecera: TLFDbedit
        Left = 112
        Top = 74
        Width = 220
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMListConfig.DSxListadoCab
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object EdTipo: TLFEdit
        Left = 71
        Top = 30
        Width = 40
        Height = 21
        CharCase = ecUpperCase
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
      end
      object DBEGruFor: TLFDbedit
        Left = 383
        Top = 52
        Width = 40
        Height = 21
        Color = clInfoBk
        DataField = 'GRUPO'
        DataSource = DMListConfig.DSxListadoDef
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
      object DBEGruCab: TLFDbedit
        Left = 383
        Top = 74
        Width = 40
        Height = 21
        Color = clInfoBk
        DataField = 'GRUPO'
        DataSource = DMListConfig.DSxListadoCab
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 9
      end
      object CHKDefecto: TLFCheckBox
        Left = 71
        Top = 144
        Width = 300
        Height = 17
        Caption = 'Establecer este listado por defecto para el grupo'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 4
        TabStop = True
        Alignment = taLeftJustify
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 284
    Top = 4
    inherited AImprimir: TAction
      Visible = False
    end
    inherited APrev: TAction
      Tag = 1
      Visible = False
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
