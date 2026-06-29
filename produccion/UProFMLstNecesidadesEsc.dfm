inherited ProFMLstNecesidadesEsc: TProFMLstNecesidadesEsc
  Left = 480
  Top = 291
  Caption = 'Listado de necesidades'
  ClientHeight = 346
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 280
    inherited PCMain: TLFPageControl [0]
      Height = 228
    end
    inherited TBMain: TLFToolBar [1]
    end
    inherited PBListado: TProgressBar [2]
      Top = 264
      TabOrder = 3
    end
    object PNLLimites: TLFPanel
      Left = 0
      Top = 36
      Width = 592
      Height = 228
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object GBAlmStock: TGroupBox
        Left = 0
        Top = 97
        Width = 592
        Height = 74
        Align = alClient
        Caption = 'Almacenes Stock'
        TabOrder = 0
        object LblAlmDesde: TLFLabel
          Left = 41
          Top = 19
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
        end
        object LblAlmHasta: TLFLabel
          Left = 42
          Top = 40
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
        end
        object EFAlmDesde: TLFEditFind2000
          Left = 75
          Top = 16
          Width = 79
          Height = 21
          TabOrder = 0
          OnChange = EFAlmDesdeChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'ALMACEN'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'ART_ALMACENES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'ALMACEN')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFAlmHasta: TLFEditFind2000
          Left = 75
          Top = 38
          Width = 79
          Height = 21
          TabOrder = 1
          OnChange = EFAlmHastaChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'ALMACEN'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'ART_ALMACENES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'ALMACEN')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EDescAlmDesde: TLFEdit
          Left = 155
          Top = 16
          Width = 329
          Height = 21
          TabStop = False
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object EDescAlmHasta: TLFEdit
          Left = 155
          Top = 38
          Width = 329
          Height = 21
          TabStop = False
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
      end
      object GBOrden: TGroupBox
        Left = 0
        Top = 0
        Width = 592
        Height = 97
        Align = alTop
        TabOrder = 1
        object LblOrden: TLFLabel
          Left = 19
          Top = 17
          Width = 52
          Height = 13
          Alignment = taRightJustify
          Caption = 'Escandallo'
        end
        object LCompuesto: TLFLabel
          Left = 18
          Top = 38
          Width = 53
          Height = 13
          Alignment = taRightJustify
          Caption = 'Compuesto'
        end
        object LMultiplicador: TLFLabel
          Left = 12
          Top = 62
          Width = 59
          Height = 13
          Alignment = taRightJustify
          Caption = 'Multiplicador'
        end
        object EFEscandallo: TLFEditFind2000
          Left = 75
          Top = 13
          Width = 79
          Height = 21
          TabOrder = 0
          OnChange = EFEscandalloChange
          OnKeyUp = EFEscandalloKeyUp
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'ESCANDALLO'
          CampoStr = 'COMPUESTO'
          CondicionBusqueda = 'tipo='#39'EPR'#39
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'PRO_ESCANDALLO'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'ESCANDALLO')
          Filtros = []
        end
        object DBEArtOrd: TLFDbedit
          Left = 75
          Top = 35
          Width = 79
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'COMPUESTO'
          DataSource = ProDMLstNecesidadesEsc.DSEscandallo
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object DBEArtDesc: TLFDbedit
          Left = 155
          Top = 35
          Width = 329
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = ProDMLstNecesidadesEsc.DSCompuesto
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object EMultiplicador: TLFEdit
          Left = 75
          Top = 57
          Width = 79
          Height = 21
          TabOrder = 2
          Text = '1'
        end
      end
      object GBTipoLst: TGroupBox
        Left = 0
        Top = 171
        Width = 592
        Height = 57
        Align = alBottom
        Caption = 'Tipo Listado'
        TabOrder = 2
        object ChkBSubescandallo: TLFCheckBox
          Left = 169
          Top = 17
          Width = 111
          Height = 17
          Caption = 'Subescandallo'
          Checked = True
          State = cbChecked
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 0
          TabStop = True
          Alignment = taLeftJustify
        end
        object CBAgrupa: TRadioButton
          Left = 42
          Top = 17
          Width = 111
          Height = 17
          Caption = 'Agrupaci'#243'n'
          Checked = True
          TabOrder = 1
          TabStop = True
          OnClick = CBAgrupaClick
        end
        object CBFases: TRadioButton
          Left = 42
          Top = 36
          Width = 111
          Height = 17
          Caption = 'Por Fases'
          TabOrder = 2
          OnClick = CBFasesClick
        end
        object ChkBEquivalencias: TLFCheckBox
          Left = 169
          Top = 36
          Width = 111
          Height = 17
          Caption = 'Equivalencias'
          Checked = True
          State = cbChecked
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 3
          TabStop = True
          Alignment = taLeftJustify
        end
      end
    end
  end
  inherited PNLOrden: TLFPanel
    Top = 280
    inherited LComentario: TLFLabel
      Left = 35
    end
    inherited LOrden: TLFLabel
      Left = 382
      Visible = False
    end
    inherited LFechaListado: TLFLabel
      Left = 8
    end
    inherited EComentario: TLFEdit
      Left = 91
      Width = 296
    end
    inherited CBOrden: TLFComboBox
      Left = 453
      Width = 30
      Visible = False
    end
    inherited TDPFechaListado: TLFDateEdit
      Left = 91
    end
  end
  inherited ALMain: TLFActionList
    Left = 348
    Top = 58
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'ChkBEquivalencias.Checked'
      'ChkBSubescandallo.Checked')
  end
end
