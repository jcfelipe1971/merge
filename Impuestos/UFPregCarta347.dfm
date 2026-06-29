inherited FPregCarta347: TFPregCarta347
  Left = 380
  Top = 175
  HelpContext = 260
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Carta con Cifra Anual del Modelo 347 de Hacienda'
  ClientHeight = 431
  ClientWidth = 684
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 684
    Height = 431
    inherited TBMain: TLFToolBar
      Width = 684
      ButtonWidth = 85
      TabOrder = 2
      inherited TButtImprimir: TToolButton
        Left = 85
      end
      inherited TButtPrevisualizar: TToolButton
        Left = 170
      end
      inherited TButtSalir: TToolButton
        Left = 255
      end
      object TButtEnviarMail: TToolButton
        Left = 340
        Top = 0
        Action = AEnviarMail
        Caption = '&E-mail directo'
      end
      object TButtEnviarMailCorreo: TToolButton
        Left = 425
        Top = 0
        Action = AEnviarMailCliente
      end
      object TButtConfigurar: TToolButton
        Left = 510
        Top = 0
        Action = AConfigurar
      end
    end
    inherited PBListado: TProgressBar
      Top = 344
      Width = 684
      TabOrder = 5
    end
    object GBDatos: TGroupBox
      Left = 0
      Top = 360
      Width = 684
      Height = 71
      Align = alBottom
      Caption = 'Datos Complementarios'
      TabOrder = 1
      object LBLLugar: TLFLabel
        Left = 217
        Top = 33
        Width = 27
        Height = 13
        Alignment = taRightJustify
        Caption = 'Lugar'
      end
      object LblFecha: TLFLabel
        Left = 31
        Top = 33
        Width = 67
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha Listado'
      end
      object ELugar: TLFEdit
        Left = 251
        Top = 29
        Width = 294
        Height = 21
        TabOrder = 1
      end
      object DTPFecha: TLFDateEdit
        Left = 104
        Top = 29
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 0
      end
    end
    object RGTerceros: TRadioGroup
      Left = 0
      Top = 36
      Width = 684
      Height = 48
      Align = alTop
      Caption = 'Selecci'#243'n'
      Columns = 3
      Items.Strings = (
        'Terceros'
        'Todos'
        'E-mail')
      TabOrder = 0
      OnClick = RGTercerosClick
    end
    object PNLCarta: TLFPanel
      Left = 0
      Top = 84
      Width = 393
      Height = 260
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 3
      object LHasta: TLFLabel
        Left = 48
        Top = 87
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object LDesde: TLFLabel
        Left = 45
        Top = 65
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object EFTerceroH: TLFEditFind2000
        Left = 82
        Top = 82
        Width = 64
        Height = 21
        TabOrder = 1
        OnChange = EFTerceroHChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'TERCERO'
        CampoStr = 'NOMBRE_R_SOCIAL'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_TERCEROS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'TERCERO')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
      object EFTerceroD: TLFEditFind2000
        Left = 82
        Top = 60
        Width = 64
        Height = 21
        TabOrder = 0
        OnChange = EFTerceroDChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'TERCERO'
        CampoStr = 'NOMBRE_R_SOCIAL'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_TERCEROS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'TERCERO')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
      object DBETerceroH: TLFDbedit
        Left = 147
        Top = 82
        Width = 400
        Height = 21
        Color = clInfoBk
        DataField = 'NOMBRE_R_SOCIAL'
        DataSource = DMRMayoresCantidad.DSxTerceroH
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object DBETerceroD: TLFDbedit
        Left = 147
        Top = 60
        Width = 400
        Height = 21
        Color = clInfoBk
        DataField = 'NOMBRE_R_SOCIAL'
        DataSource = DMRMayoresCantidad.DSxTerceroD
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
    end
    object PNLCorreo: TLFPanel
      Left = 393
      Top = 84
      Width = 291
      Height = 260
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 4
      Visible = False
      object DBGCorreos: THYTDBGrid
        Left = 0
        Top = 41
        Width = 291
        Height = 219
        Align = alClient
        DataSource = DMRMayoresCantidad.DSCorreosElectronicos
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
        AutoDeseleccionar = True
        PermutaPaneles = False
        CamposAMarcar.Strings = (
          'EMAIL_ALB'
          'EMAIL_ALP'
          'EMAIL_FAC'
          'EMAIL_FAP'
          'EMAIL_FCR'
          'EMAIL_OCP'
          'EMAIL_OFC'
          'EMAIL_OFP'
          'EMAIL_PEC'
          'EMAIL_PEP')
        CamposChecked.Strings = (
          '1'
          '1'
          '1'
          '1'
          '1'
          '1'
          '1'
          '1'
          '1'
          '1')
        CamposNoChecked.Strings = (
          '0'
          '0'
          '0'
          '0'
          '0'
          '0'
          '0'
          '0'
          '0'
          '0')
        CampoAOrdenarColor = clInfoBk
        OrdenMultiple = True
        Columns = <
          item
            Expanded = False
            FieldName = 'NOMBRE'
            Width = 333
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMAIL_OFC'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMAIL_PEC'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMAIL_ALB'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMAIL_FAC'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMAIL_OFP'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMAIL_OCP'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMAIL_PEP'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMAIL_ALP'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMAIL_FAP'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EMAIL_FCR'
            Width = 30
            Visible = True
          end>
      end
      object PNLCorreoTercero: TLFPanel
        Left = 0
        Top = 0
        Width = 291
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object LTercero: TLFLabel
          Left = 12
          Top = 13
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tercero'
        end
        object EFTerceroMail: TLFEditFind2000
          Left = 54
          Top = 9
          Width = 64
          Height = 21
          TabOrder = 0
          OnChange = EFTerceroMailChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'TERCERO'
          CampoStr = 'NOMBRE_R_SOCIAL'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tabla_a_buscar = 'SYS_TERCEROS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'TERCERO')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
        end
        object DBETerceroMail: TLFDbedit
          Left = 119
          Top = 9
          Width = 400
          Height = 21
          Color = clInfoBk
          DataField = 'NOMBRE_R_SOCIAL'
          DataSource = DMRMayoresCantidad.DSxTerceroMail
          Enabled = False
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
  end
  inherited ALMain: TLFActionList
    Left = 456
    Top = 40
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
    object AEnviarMail: TAction
      Caption = '&Enviar e-mail'
      Hint = 'Enviar Carta con Cifra Anual por e-mail'
      ImageIndex = 34
      OnExecute = AEnviarMailExecute
    end
    object AEnviarMailCliente: TAction
      Caption = 'Cliente &Outlook'
      Hint = 'Envia correo electronico mediante cliente de correo instalado'
      ImageIndex = 34
      OnExecute = AEnviarMailClienteExecute
    end
  end
end
