object ProFMLstCodBarras: TProFMLstCodBarras
  Left = 487
  Top = 209
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Listado de C'#243'digo de Barras'
  ClientHeight = 208
  ClientWidth = 401
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PNLCodBarras: TLFPanel
    Left = 0
    Top = 41
    Width = 401
    Height = 167
    Align = alClient
    TabOrder = 0
    object GBFamilia: TGroupBox
      Left = 1
      Top = 1
      Width = 399
      Height = 165
      Align = alClient
      TabOrder = 0
      object GroupBox1: TGroupBox
        Left = 73
        Top = 92
        Width = 315
        Height = 63
        Caption = 'Configuraci'#243'n etiqueta'
        TabOrder = 0
        object LFLnBlanco: TLFLabel
          Left = 37
          Top = 39
          Width = 149
          Height = 13
          Caption = 'N'#250'mero de Espacios en Blanco'
        end
        object LBLEtiVacias: TLFLabel
          Left = 50
          Top = 19
          Width = 136
          Height = 13
          Caption = 'N'#250'mero de C'#243'digo de Barras'
        end
        object EdCodBarras: TLFEdit
          Left = 191
          Top = 16
          Width = 68
          Height = 21
          TabOrder = 0
          Text = '1'
        end
        object LFEnBlanco: TLFEdit
          Left = 191
          Top = 37
          Width = 68
          Height = 21
          BiDiMode = bdRightToLeft
          ParentBiDiMode = False
          TabOrder = 1
          Text = '0'
        end
      end
      object PCMain: TLFPageControl
        Left = 2
        Top = 15
        Width = 395
        Height = 76
        ActivePage = TSProduccion
        Align = alCustom
        OwnerDraw = True
        Style = tsFlatButtons
        TabIndex = 4
        TabOrder = 1
        TabActiveColor = clWhite
        TabInactiveColor = 14936298
        object TSFases: TTabSheet
          Caption = 'TSFases'
          OnShow = TSFasesShow
          object Label7: TLFLabel
            Left = 10
            Top = 4
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Fase'
          end
          object Label8: TLFLabel
            Left = 13
            Top = 27
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Fase'
          end
          object EFFaseH: TLFEditFind2000
            Left = 70
            Top = 23
            Width = 55
            Height = 21
            TabOrder = 0
            OnChange = EFFaseHChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'FASE'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'PRO_SYS_FASES'
            Tabla_asociada.DesplegarBusqueda = False
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFaseD: TLFDbedit
            Left = 125
            Top = 1
            Width = 256
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = ProDMLstCodBarras.DSFaseD
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object EFFaseD: TLFEditFind2000
            Left = 70
            Top = 1
            Width = 55
            Height = 21
            TabOrder = 2
            OnChange = EFFaseDChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'FASE'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'PRO_SYS_FASES'
            Tabla_asociada.DesplegarBusqueda = False
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFaseH: TLFDbedit
            Left = 125
            Top = 23
            Width = 256
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = ProDMLstCodBarras.DSFaseH
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
        end
        object TSTarea: TTabSheet
          Caption = 'TSTarea'
          ImageIndex = 1
          OnShow = TSTareaShow
          object Label5: TLFLabel
            Left = 5
            Top = 4
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Tarea'
          end
          object Label6: TLFLabel
            Left = 8
            Top = 27
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Tarea'
          end
          object EFTareaD: TLFEditFind2000
            Left = 70
            Top = 1
            Width = 55
            Height = 21
            TabOrder = 0
            OnChange = EFTareaDChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'TAREA'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'PRO_SYS_TAREAS'
            Tabla_asociada.DesplegarBusqueda = False
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object LFDbedit5: TLFDbedit
            Left = 125
            Top = 1
            Width = 256
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = ProDMLstCodBarras.DSxTareaD
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object LFDbedit6: TLFDbedit
            Left = 125
            Top = 23
            Width = 256
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = ProDMLstCodBarras.DSxTareaH
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object EFTareaH: TLFEditFind2000
            Left = 70
            Top = 23
            Width = 55
            Height = 21
            TabOrder = 3
            OnChange = EFTareaHChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'TAREA'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'PRO_SYS_TAREAS'
            Tabla_asociada.DesplegarBusqueda = False
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
        end
        object TSMaquines: TTabSheet
          Caption = 'TSMaquines'
          ImageIndex = 2
          OnShow = TSMaquinesShow
          object Label1: TLFLabel
            Left = 9
            Top = 4
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde M'#225'q.'
          end
          object Label2: TLFLabel
            Left = 12
            Top = 27
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta M'#225'q.'
          end
          object EFMaquinaD: TLFEditFind2000
            Left = 70
            Top = 1
            Width = 55
            Height = 21
            TabOrder = 0
            OnChange = EFMaquinaDChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'CODMAQ'
            CampoStr = 'DESCRIPCION'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'PRO_MAQUINAS_C'
            Tabla_asociada.DesplegarBusqueda = False
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object LFDbedit1: TLFDbedit
            Left = 125
            Top = 1
            Width = 256
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DESCRIPCION'
            DataSource = ProDMLstCodBarras.DSMaquinaC
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object LFDbedit2: TLFDbedit
            Left = 125
            Top = 23
            Width = 256
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DESCRIPCION'
            DataSource = ProDMLstCodBarras.DSMaquinaH
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object EFMaquinaH: TLFEditFind2000
            Left = 70
            Top = 23
            Width = 55
            Height = 21
            TabOrder = 3
            OnChange = EFMaquinaHChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'CODMAQ'
            CampoStr = 'DESCRIPCION'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'PRO_MAQUINAS_C'
            Tabla_asociada.DesplegarBusqueda = False
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
        end
        object TSEmpleado: TTabSheet
          Caption = 'TSEmpleado'
          ImageIndex = 3
          OnShow = TSEmpleadoShow
          object Label3: TLFLabel
            Left = 7
            Top = 4
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Empl.'
          end
          object Label4: TLFLabel
            Left = 10
            Top = 27
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Empl.'
          end
          object EFEmpleadoD: TLFEditFind2000
            Left = 70
            Top = 1
            Width = 55
            Height = 21
            TabOrder = 0
            OnChange = EFEmpleadoDChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'EMPLEADO'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_EMPLEADOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object LFDbedit3: TLFDbedit
            Left = 125
            Top = 1
            Width = 256
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = ProDMLstCodBarras.DSxEmpleadoD
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object LFDbedit4: TLFDbedit
            Left = 125
            Top = 23
            Width = 256
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = ProDMLstCodBarras.DSxEmpleadoH
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object EFEmpleadoH: TLFEditFind2000
            Left = 70
            Top = 23
            Width = 55
            Height = 21
            TabOrder = 3
            OnChange = EFEmpleadoHChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'EMPLEADO'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_EMPLEADOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
        end
        object TSProduccion: TTabSheet
          Caption = 'TSProduccion'
          OnShow = TSProduccionShow
          object Label9: TLFLabel
            Left = 2
            Top = 4
            Width = 72
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde IdOrden'
          end
          object Label10: TLFLabel
            Left = 5
            Top = 27
            Width = 69
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta IdOrden'
          end
          object EFOrdenD: TLFEditFind2000
            Left = 80
            Top = 1
            Width = 55
            Height = 21
            TabOrder = 0
            OnChange = EFTareaDChange
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
            OnBusqueda = EFOrdenDBusqueda
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object EFOrdenH: TLFEditFind2000
            Left = 80
            Top = 23
            Width = 55
            Height = 21
            TabOrder = 1
            OnChange = EFTareaHChange
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
            OnBusqueda = EFOrdenHBusqueda
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
        end
      end
    end
    object PNLOcultar: TLFPanel
      Left = 5
      Top = 11
      Width = 382
      Height = 26
      BevelOuter = bvNone
      TabOrder = 1
    end
  end
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 401
    Height = 41
    ButtonHeight = 36
    ButtonWidth = 69
    Flat = True
    Images = DMMain.ILMain_Ac
    ParentShowHint = False
    ShowCaptions = True
    ShowHint = True
    TabOrder = 1
    Separators = True
    object TButtImprimir: TToolButton
      Left = 0
      Top = 0
      Action = AImprimir
    end
    object TButtVisualizar: TToolButton
      Left = 69
      Top = 0
      Action = AVisualizar
    end
    object TButtSalir: TToolButton
      Left = 138
      Top = 0
      Action = ASalir
    end
    object TButtConfRapida: TToolButton
      Left = 207
      Top = 0
      Action = AConfRapida
    end
  end
  object ActionList1: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 306
    Top = 24
    object ASalir: TAction
      Caption = 'Salir'
      Hint = 'Salir'
      ImageIndex = 0
      OnExecute = ASalirExecute
    end
    object AVisualizar: TAction
      Caption = '  Visualizar  '
      Hint = 'Visualizar'
      ImageIndex = 19
      OnExecute = AVisualizarExecute
    end
    object AImprimir: TAction
      Caption = 'Imprimir'
      Hint = 'Salir'
      ImageIndex = 14
      OnExecute = AImprimirExecute
    end
    object AConfRapida: TAction
      Caption = 'Conf. R'#225'pida'
      Hint = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
      OnExecute = AConfRapidaExecute
    end
  end
end
