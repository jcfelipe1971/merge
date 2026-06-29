inherited ProFMLstNecesidades: TProFMLstNecesidades
  Left = 480
  Top = 291
  Caption = 'Listado de necesidades'
  ClientHeight = 289
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 223
    inherited PCMain: TLFPageControl [0]
      Height = 171
    end
    inherited TBMain: TLFToolBar [1]
    end
    inherited PBListado: TProgressBar [2]
      Top = 207
      TabOrder = 3
    end
    object PNLLimites: TLFPanel
      Left = 0
      Top = 36
      Width = 592
      Height = 171
      Align = alClient
      BevelOuter = bvNone
      Caption = 'PNLLimites'
      TabOrder = 2
      object GBAlmStock: TGroupBox
        Left = 0
        Top = 62
        Width = 592
        Height = 52
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
          Left = 76
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
          Left = 76
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
          Left = 156
          Top = 16
          Width = 337
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
          Left = 156
          Top = 38
          Width = 337
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
        Height = 62
        Align = alTop
        TabOrder = 1
        object LblOrden: TLFLabel
          Left = 28
          Top = 17
          Width = 43
          Height = 13
          Alignment = taRightJustify
          Caption = 'ID Orden'
        end
        object LCompuesto: TLFLabel
          Left = 18
          Top = 38
          Width = 53
          Height = 13
          Alignment = taRightJustify
          Caption = 'Compuesto'
        end
        object EFIdOrden: TLFEditFind2000
          Left = 76
          Top = 13
          Width = 79
          Height = 21
          TabOrder = 0
          OnChange = EFIdOrdenChange
          OnKeyUp = EFIdOrdenKeyUp
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          Campos_Desplegar.Strings = (
            'RIG_OF')
          CampoNum = 'ID_ORDEN'
          CampoStr = 'COMPUESTO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'PRO_ORD'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFIdOrdenBusqueda
          OrdenadoPor.Strings = (
            'ID_ORDEN')
          Filtros = []
        end
        object DBEArtOrd: TLFDbedit
          Left = 76
          Top = 35
          Width = 79
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'COMPUESTO'
          DataSource = ProDMLstNecesidades.DSOrden
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object EArtDesc: TLFDbedit
          Left = 156
          Top = 35
          Width = 337
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = ProDMLstNecesidades.DSOrden
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
      object GBTipoLst: TGroupBox
        Left = 0
        Top = 114
        Width = 592
        Height = 57
        Align = alBottom
        Caption = 'Tipo Listado'
        TabOrder = 2
        object ChkBSubordenes: TLFCheckBox
          Left = 169
          Top = 17
          Width = 111
          Height = 17
          Caption = 'Sub'#243'rdenes'
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
    Top = 223
    inherited LComentario: TLFLabel
      Left = 35
    end
    inherited LOrden: TLFLabel
      Left = 353
      Visible = False
    end
    inherited LFechaListado: TLFLabel
      Left = 8
    end
    inherited EComentario: TLFEdit
      Left = 91
      Width = 403
    end
    inherited CBOrden: TLFComboBox
      Left = 424
      Width = 70
      Visible = False
    end
    inherited TDPFechaListado: TLFDateEdit
      Left = 91
    end
  end
  inherited ALMain: TLFActionList
    Left = 348
    Top = 58
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'ChkBEquivalencias.Checked'
      'ChkBSubordenes.Checked')
  end
end
