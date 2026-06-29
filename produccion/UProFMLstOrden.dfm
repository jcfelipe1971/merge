inherited ProFMLstOrden: TProFMLstOrden
  Left = 283
  Top = 199
  Caption = 'Listado de Orden de Producci'#243'n'
  ClientHeight = 295
  ClientWidth = 539
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 539
    Height = 229
    inherited TBMain: TLFToolBar
      Width = 539
    end
    inherited PBListado: TProgressBar
      Top = 213
      Width = 539
      TabOrder = 4
    end
    inherited PCMain: TLFPageControl
      Top = 77
      Width = 539
      Height = 136
    end
    object PanelCentral: TLFPanel
      Left = 0
      Top = 77
      Width = 539
      Height = 136
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object LDesdeFase: TLFLabel
        Left = 8
        Top = 51
        Width = 57
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Fase'
      end
      object LOrdenProd: TLFLabel
        Left = 36
        Top = 31
        Width = 29
        Height = 13
        Alignment = taRightJustify
        Caption = 'Orden'
      end
      object LHastaFase: TLFLabel
        Left = 11
        Top = 74
        Width = 54
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Fase'
      end
      object LGuionFechas: TLFLabel
        Left = 316
        Top = 114
        Width = 8
        Height = 29
        Alignment = taRightJustify
        Caption = '-'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -24
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object EFIdOrden: TLFEditFind2000
        Left = 68
        Top = 26
        Width = 58
        Height = 21
        TabOrder = 0
        OnChange = EFIdOrdenChange
        OnExit = EFIdOrdenExit
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
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
        Filtros = [obEmpresa, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBECompuesto: TLFDbedit
        Left = 127
        Top = 26
        Width = 79
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'COMPUESTO'
        DataSource = ProDMLstOrden.DSOrden
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnChange = DBECompuestoChange
      end
      object ETituloCompuesto: TLFEdit
        Left = 207
        Top = 26
        Width = 194
        Height = 21
        TabStop = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 6
      end
      object DBEFaseD: TLFDbedit
        Left = 127
        Top = 48
        Width = 274
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'FASE'
        DataSource = ProDMLstOrden.DSFaseD
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
      end
      object DBEFaseH: TLFDbedit
        Left = 127
        Top = 70
        Width = 274
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'FASE'
        DataSource = ProDMLstOrden.DSFaseH
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 8
      end
      object EFFaseH: TLFEditFind2000
        Left = 68
        Top = 70
        Width = 58
        Height = 21
        TabOrder = 2
        OnChange = EFFaseHChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'LINEA_FASE'
        CampoStr = 'FASE'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'PRO_ORD_FASES'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFFaseHBusqueda
        OrdenadoPor.Strings = (
          'LINEA_FASE')
        Filtros = []
      end
      object EFFaseD: TLFEditFind2000
        Left = 68
        Top = 48
        Width = 58
        Height = 21
        TabOrder = 1
        OnChange = EFFaseDChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'LINEA_FASE'
        CampoStr = 'FASE'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'PRO_ORD_FASES'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFFaseDBusqueda
        OrdenadoPor.Strings = (
          'LINEA_FASE')
        Filtros = []
      end
      object RGTipoListado: TRadioGroup
        Left = 407
        Top = 20
        Width = 110
        Height = 78
        Caption = 'Tipo de Listado '
        ItemIndex = 0
        Items.Strings = (
          'Previsto'
          'Real')
        TabOrder = 4
      end
      object CBAgruparTareas: TLFCheckBox
        Left = 68
        Top = 101
        Width = 121
        Height = 17
        Caption = 'Agrupar Tareas'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 3
        TabStop = True
        Alignment = taLeftJustify
      end
      object CBFechaImputacion: TLFCheckBox
        Left = 68
        Top = 124
        Width = 121
        Height = 17
        Caption = 'Fecha Imputaci'#243'n'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 9
        TabStop = True
        Alignment = taLeftJustify
        OnChange = CBFechaImputacionChange
      end
      object LFFechaDesde: TLFDateEdit
        Left = 214
        Top = 122
        Width = 97
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 10
      end
      object LFFechaHasta: TLFDateEdit
        Left = 330
        Top = 122
        Width = 97
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 11
      end
      object CBListarNrosSeries: TLFCheckBox
        Left = 213
        Top = 101
        Width = 121
        Height = 19
        Caption = 'Listar Nros. Series'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 12
        TabStop = True
        Alignment = taLeftJustify
      end
      object CBListarLotes: TLFCheckBox
        Left = 331
        Top = 101
        Width = 121
        Height = 19
        Caption = 'Listar Lotes'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 13
        TabStop = True
        Alignment = taLeftJustify
      end
    end
    object PNLTop: TLFPanel
      Left = 0
      Top = 36
      Width = 539
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 3
      object LabelCab: TLFLabel
        Left = 20
        Top = 14
        Width = 77
        Height = 13
        Alignment = taRightJustify
        Caption = 'Listar Cabecera:'
      end
      object RBCabSi: TRadioButton
        Left = 148
        Top = 13
        Width = 48
        Height = 17
        Caption = 'S'#237
        Checked = True
        TabOrder = 0
        TabStop = True
        OnClick = RBCabSiClick
      end
      object RBCabNo: TRadioButton
        Left = 274
        Top = 13
        Width = 59
        Height = 17
        Caption = 'No'
        TabOrder = 1
        TabStop = True
        OnClick = RBCabNoClick
      end
    end
  end
  inherited PNLOrden: TLFPanel
    Top = 229
    Width = 539
    inherited LComentario: TLFLabel
      Left = 31
    end
    inherited LOrden: TLFLabel
      Left = 280
      Width = 133
      Caption = 'Ordenado por (NO VISIBLE)'
      Visible = False
    end
    inherited LFechaListado: TLFLabel
      Left = 6
    end
    inherited EComentario: TLFEdit
      Left = 90
      Width = 408
    end
    inherited CBOrden: TLFComboBox
      Left = 418
      Width = 72
      Visible = False
    end
    inherited TDPFechaListado: TLFDateEdit
      Left = 90
    end
  end
  inherited ALMain: TLFActionList
    Left = 472
    Top = 50
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'RGTipoListado.ItemIndex'
      'CBAgruparTareas.Checked'
      'CBListarLotes.Checked'
      'CBListarNrosSeries.Checked')
  end
end
