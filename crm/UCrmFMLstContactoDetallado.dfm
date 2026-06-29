inherited CrmFMLstContactoDetallado: TCrmFMLstContactoDetallado
  Left = 310
  Top = 221
  Caption = 'Listado Contacto Detallado'
  ClientHeight = 289
  ClientWidth = 504
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 504
    Height = 223
    inherited TBMain: TLFToolBar
      Width = 504
    end
    inherited PCMain: TLFPageControl
      Width = 504
      Height = 187
    end
    object LFPanelCentral: TLFPanel
      Left = 0
      Top = 36
      Width = 504
      Height = 187
      Align = alClient
      TabOrder = 2
      object LDesdeContacto: TLFLabel
        Left = 9
        Top = 40
        Width = 77
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Contacto'
      end
      object LHastaContacto: TLFLabel
        Left = 12
        Top = 63
        Width = 74
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Contacto'
      end
      object LDesdeFechaCreacion: TLFLabel
        Left = 22
        Top = 112
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Fecha'
      end
      object LHastaFechaCreacion: TLFLabel
        Left = 25
        Top = 135
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Fecha'
      end
      object LFechaCreacion: TLFLabel
        Left = 211
        Top = 123
        Width = 81
        Height = 13
        Caption = '(Fecha Creacion)'
      end
      object LFDesdeContacto: TLFEditFind2000
        Left = 89
        Top = 37
        Width = 67
        Height = 21
        TabOrder = 0
        OnChange = LFDesdeContactoChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ID_CONTACTO'
        CampoStr = 'NOMBRE_COMERCIAL'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'CRM_CONTACTOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'ID_CONTACTO')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
      object DBEDesdeContacto: TLFDbedit
        Left = 157
        Top = 37
        Width = 297
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'NOMBRE_COMERCIAL'
        DataSource = CrmDMLstContactoDetallado.DSxContactoD
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object DBEHastaContacto: TLFDbedit
        Left = 157
        Top = 59
        Width = 297
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'NOMBRE_COMERCIAL'
        DataSource = CrmDMLstContactoDetallado.DSxContactoH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object LFHastaContacto: TLFEditFind2000
        Left = 89
        Top = 59
        Width = 67
        Height = 21
        TabOrder = 3
        OnChange = LFHastaContactoChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'ID_CONTACTO'
        CampoStr = 'NOMBRE_COMERCIAL'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'CRM_CONTACTOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'ID_CONTACTO')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
      object DEFechaDesde: TLFDateEdit
        Left = 89
        Top = 109
        Width = 121
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 4
      end
      object DEFechaHasta: TLFDateEdit
        Left = 89
        Top = 131
        Width = 121
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 5
      end
    end
  end
  inherited PNLOrden: TLFPanel
    Top = 223
    Width = 504
    inherited LComentario: TLFLabel
      Left = 30
    end
    inherited LOrden: TLFLabel
      Left = 245
      Visible = False
    end
    inherited LFechaListado: TLFLabel
      Left = 4
    end
    inherited EComentario: TLFEdit
      Left = 89
    end
    inherited CBOrden: TLFComboBox
      Left = 316
      Width = 29
      Visible = False
    end
    inherited TDPFechaListado: TLFDateEdit
      Left = 89
    end
  end
  inherited ALMain: TLFActionList
    Left = 360
    Top = 54
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
