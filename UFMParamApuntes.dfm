object FMParamApuntes: TFMParamApuntes
  Left = 624
  Top = 331
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Parametrizaci'#243'n de apuntes contables'
  ClientHeight = 303
  ClientWidth = 504
  Color = clBtnFace
  Constraints.MinHeight = 303
  Constraints.MinWidth = 504
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PNParametrizacion: TLFPanel
    Left = 0
    Top = 0
    Width = 504
    Height = 303
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object TBMain: TLFToolBar
      Left = 0
      Top = 0
      Width = 504
      Height = 41
      ButtonHeight = 36
      ButtonWidth = 62
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      ParentShowHint = False
      ShowCaptions = True
      ShowHint = True
      TabOrder = 2
      Separators = True
      object TButtGrabar: TToolButton
        Left = 0
        Top = 0
        Action = AGrabar
        Caption = 'Grabar'
      end
      object TButtConfigMasiva: TToolButton
        Left = 62
        Top = 0
        Hint = 'Configuraci'#243'n Masiva de Todos los Apuntes con el  modelo inicial'
        Action = AConfigMasiva
        ImageIndex = 26
      end
      object TButtSalir: TToolButton
        Left = 124
        Top = 0
        Action = ASalir
      end
    end
    object PNVariables: TLFPanel
      Left = 0
      Top = 119
      Width = 504
      Height = 184
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object LVariable: TLFLabel
        Left = 4
        Top = 4
        Width = 43
        Height = 13
        Caption = 'Variables'
      end
      object LFormatoFinal: TLFLabel
        Left = 255
        Top = 4
        Width = 60
        Height = 13
        Caption = 'Formato final'
      end
      object SBDatosIda: TSpeedButton
        Left = 225
        Top = 112
        Width = 25
        Height = 25
        Hint = 'Introducir Campo Seleccionado'
        Flat = True
        OnClick = SBDatosIdaClick
      end
      object SBTextoIda: TSpeedButton
        Left = 225
        Top = 152
        Width = 25
        Height = 25
        Hint = 'Introducir Texto Fijo'
        Flat = True
        OnClick = SBTextoIdaClick
      end
      object SBBorrarLinea: TSpeedButton
        Left = 475
        Top = 100
        Width = 25
        Height = 25
        Hint = 'Elimina la l'#237'nea seleccionada'
        Flat = True
        ParentShowHint = False
        ShowHint = True
        OnClick = SBBorrarLineaClick
      end
      object SBSubir: TSpeedButton
        Left = 475
        Top = 18
        Width = 25
        Height = 25
        Hint = 'Subir posiciones el registro seleccionado'
        Flat = True
        OnClick = SBSubirClick
      end
      object SBBajar: TSpeedButton
        Left = 475
        Top = 43
        Width = 25
        Height = 25
        Hint = 'Bajar posiciones el registro seleccionado'
        Flat = True
        OnClick = SBBajarClick
      end
      object SBBorrarTodo: TSpeedButton
        Left = 475
        Top = 125
        Width = 25
        Height = 25
        Hint = 'Borra todo el Formato final'
        Flat = True
        ParentShowHint = False
        ShowHint = True
        OnClick = SBBorrarTodoClick
      end
      object SBIntrodOriginal: TSpeedButton
        Left = 475
        Top = 150
        Width = 25
        Height = 25
        Hint = 'Introduce el Formato Original del Apunte'
        Flat = True
        ParentShowHint = False
        ShowHint = True
        OnClick = SBIntrodOriginalClick
      end
      object ETextoLibre: TLabeledEdit
        Left = 3
        Top = 156
        Width = 217
        Height = 21
        EditLabel.Width = 53
        EditLabel.Height = 13
        EditLabel.Caption = 'Texto Libre'
        LabelPosition = lpAbove
        LabelSpacing = 3
        MaxLength = 40
        TabOrder = 1
      end
      object ListDestino: TListBox
        Left = 254
        Top = 18
        Width = 217
        Height = 159
        ItemHeight = 13
        TabOrder = 2
      end
      object ListOrigen: TListBox
        Left = 4
        Top = 18
        Width = 217
        Height = 119
        ItemHeight = 13
        TabOrder = 0
      end
    end
    object PNConfig: TLFPanel
      Left = 0
      Top = 41
      Width = 504
      Height = 78
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object LGRupoAsientos: TLFLabel
        Left = 7
        Top = 9
        Width = 92
        Height = 13
        Alignment = taRightJustify
        Caption = 'Grupos de Asientos'
      end
      object LAsiento: TLFLabel
        Left = 59
        Top = 29
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'Asientos'
      end
      object LApunte: TLFLabel
        Left = 60
        Top = 53
        Width = 39
        Height = 13
        Alignment = taRightJustify
        Caption = 'Apuntes'
      end
      object BtnConfTexto: TBitBtn
        Left = 382
        Top = 4
        Width = 115
        Height = 30
        Hint = 'Configuraci'#243'n del texto del apunte'
        Caption = 'Configurar texto'
        TabOrder = 0
        OnClick = BtnConfTextoClick
      end
      object EFGrupoAsientos: TLFEditFind2000
        Left = 103
        Top = 5
        Width = 49
        Height = 21
        TabOrder = 1
        OnChange = EFGrupoAsientosChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'COD_GRUP_ASIENTO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_TEXTO_GRUPO_ASIENTOS'
        Tabla_asociada.DesplegarBusqueda = False
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
      object EFAsientos: TLFEditFind2000
        Left = 103
        Top = 27
        Width = 49
        Height = 21
        TabOrder = 2
        OnChange = EFAsientosChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'COD_ASIENTO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_TEXTO_ASIENTO'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFAsientosBusqueda
        OrdenadoPor.Strings = (
          'COD_ASIENTO')
        Filtros = []
      end
      object EFApuntes: TLFEditFind2000
        Left = 103
        Top = 49
        Width = 49
        Height = 21
        TabOrder = 3
        OnChange = EFApuntesChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'COD_APUNTE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_TEXTO_ASIENTO_APUNTES'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFApuntesBusqueda
        OrdenadoPor.Strings = (
          'COD_APUNTE')
        Filtros = []
      end
      object DBEGrupoAsientos: TLFDbedit
        Left = 153
        Top = 5
        Width = 201
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMParamApuntes.DSxGruposAsientos
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object DBEAsientos: TLFDbedit
        Left = 153
        Top = 27
        Width = 201
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMParamApuntes.DSxAsientos
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object DBEApuntes: TLFDbedit
        Left = 153
        Top = 49
        Width = 201
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMParamApuntes.DSxApuntes
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
    end
  end
  object ALMain: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 463
    Top = 6
    object AGrabar: TAction
      Caption = '&Grabar'
      Hint = 'Guardar nuevo formato'
      ImageIndex = 19
      OnExecute = AGrabarExecute
    end
    object ASalir: TAction
      Caption = '&Salir'
      Hint = 'Cerrar esta ventana'
      ImageIndex = 0
      OnExecute = ASalirExecute
    end
    object AConfigMasiva: TAction
      Caption = 'Conf. Inicial'
      ImageIndex = 56
      OnExecute = AConfigMasivaExecute
    end
    object AConfigNuevo: TAction
      Caption = 'ConfigNuevo'
      Hint = 'Introduce los formatos de los nuevos apuntes'
      ImageIndex = 30
      OnExecute = AConfigNuevoExecute
    end
  end
end
