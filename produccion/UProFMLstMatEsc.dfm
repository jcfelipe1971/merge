inherited ProFMLstMatEsc: TProFMLstMatEsc
  Left = 445
  Top = 213
  Caption = 'Listado de Escandallos por Material'
  ClientHeight = 256
  ClientWidth = 500
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 500
    Height = 190
    inherited TBMain: TLFToolBar
      Width = 500
      TabOrder = 3
    end
    object GBComponente: TGroupBox [1]
      Left = 0
      Top = 36
      Width = 500
      Height = 68
      Align = alTop
      Caption = 'Componente'
      TabOrder = 1
      object LDesdeArticulo: TLFLabel
        Left = 41
        Top = 19
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LHastaArticulo: TLFLabel
        Left = 44
        Top = 40
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object LFDescArticulo: TLFEdit
        Left = 156
        Top = 15
        Width = 337
        Height = 21
        TabStop = False
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 0
      end
      object EFArticuloHasta: TLFEditFind2000
        Left = 76
        Top = 37
        Width = 79
        Height = 21
        TabOrder = 2
        OnChange = EFArticuloHastaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ARTICULO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_ARTICULOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'ARTICULO')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object LFDescArticuloHasta: TLFEdit
        Left = 156
        Top = 37
        Width = 337
        Height = 21
        TabStop = False
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 3
      end
      object EFArticuloDesde: TLFEditFind2000
        Left = 76
        Top = 15
        Width = 79
        Height = 21
        TabOrder = 1
        OnChange = EFArticuloDesdeChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ARTICULO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_ARTICULOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'ARTICULO')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
    end
    object GBEsc: TGroupBox [2]
      Left = 0
      Top = 104
      Width = 500
      Height = 86
      Align = alClient
      Caption = 'Compuesto'
      TabOrder = 2
      object LblAlmDesde: TLFLabel
        Left = 40
        Top = 20
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LblAlmHasta: TLFLabel
        Left = 43
        Top = 41
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object LFPorDefecto: TLFCheckBox
        Left = 415
        Top = 62
        Width = 77
        Height = 17
        Caption = 'Por defecto'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 0
        TabStop = True
        Alignment = taLeftJustify
        OnChange = LFPorDefectoChange
      end
      object LFDescCompDesde: TLFEdit
        Left = 156
        Top = 16
        Width = 337
        Height = 21
        TabStop = False
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 1
      end
      object LFDescCompHasta: TLFEdit
        Left = 156
        Top = 38
        Width = 337
        Height = 21
        TabStop = False
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 2
      end
      object DBEFCompDesde: TLFEditFind2000
        Left = 76
        Top = 16
        Width = 79
        Height = 21
        TabOrder = 3
        OnChange = DBEFCompDesdeChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ARTICULO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_ARTICULOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'ARTICULO')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBEFCompHasta: TLFEditFind2000
        Left = 76
        Top = 38
        Width = 79
        Height = 21
        TabOrder = 4
        OnChange = DBEFCompHastaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ARTICULO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_ARTICULOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'ARTICULO')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
    end
    inherited PCMain: TLFPageControl
      Left = 8
      Top = -28
      Height = 1
      Align = alNone
      TabOrder = 0
    end
  end
  inherited PNLOrden: TLFPanel
    Top = 190
    Width = 500
    inherited LComentario: TLFLabel
      Left = 31
    end
    inherited LOrden: TLFLabel
      Left = 212
      Visible = False
    end
    inherited LFechaListado: TLFLabel
      Left = 6
    end
    inherited EComentario: TLFEdit
      Left = 90
      TabOrder = 2
    end
    inherited CBOrden: TLFComboBox
      Left = 282
      TabOrder = 0
      Visible = False
    end
    inherited TDPFechaListado: TLFDateEdit
      Left = 90
      TabOrder = 1
    end
  end
  inherited ALMain: TLFActionList
    Left = 428
    Top = 46
    inherited AImprimir: TAction
      OnExecute = AImprimirExecute
    end
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
