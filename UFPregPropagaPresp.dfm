object FPregPropagaPresp: TFPregPropagaPresp
  Left = 227
  Top = 172
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Propagar Presupuestos'
  ClientHeight = 279
  ClientWidth = 488
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PMain: TLFPanel
    Left = 0
    Top = 0
    Width = 488
    Height = 279
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object TBMain: TLFToolBar
      Left = 0
      Top = 0
      Width = 488
      Height = 26
      Caption = ''
      EdgeBorders = []
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 0
      Separators = True
      object TButtConfirmar: TToolButton
        Left = 0
        Top = 0
        Hint = 'Confirmar'
        Caption = 'Confirmar'
        ImageIndex = 19
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtConfirmarClick
      end
      object TButtSalir: TToolButton
        Left = 23
        Top = 0
        Hint = 'Cerrar la ventana'
        Caption = 'Salir'
        ImageIndex = 0
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtSalirClick
      end
    end
    object GBActualizar: TGroupBox
      Left = 8
      Top = 32
      Width = 473
      Height = 63
      Caption = 'Actualizar desde'
      TabOrder = 1
      object LBLEjercicio: TLFLabel
        Left = 35
        Top = 25
        Width = 40
        Height = 13
        Caption = 'Ejercicio'
      end
      object RBReal: TRadioButton
        Left = 232
        Top = 24
        Width = 81
        Height = 17
        Caption = 'Real'
        TabOrder = 1
      end
      object RBPresupuesto: TRadioButton
        Left = 344
        Top = 24
        Width = 104
        Height = 17
        Caption = 'Presupuesto'
        Checked = True
        TabOrder = 2
        TabStop = True
      end
      object CBEjercicio: TLFComboBox
        Left = 89
        Top = 22
        Width = 96
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
      end
    end
    object GBCentrosCoste: TGroupBox
      Left = 8
      Top = 187
      Width = 473
      Height = 81
      Caption = 'Centros de Coste'
      TabOrder = 4
      object LBLCCInicial: TLFLabel
        Left = 49
        Top = 21
        Width = 27
        Height = 13
        Caption = 'Inicial'
      end
      object LBLCCFinal: TLFLabel
        Left = 54
        Top = 46
        Width = 22
        Height = 13
        Caption = 'Final'
      end
      object EdCCInicialTit: TLFEdit
        Left = 179
        Top = 19
        Width = 254
        Height = 21
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object EdCCFinalTit: TLFEdit
        Left = 179
        Top = 44
        Width = 254
        Height = 21
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object EFCCInicial: TLFEditFind2000
        Left = 88
        Top = 19
        Width = 89
        Height = 21
        TabOrder = 0
        OnChange = EFCCInicialChange
        Base_de_datos = DMMain.DataBase
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'CENTRO_COSTE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ANA_CENTROS_COSTE'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFCCInicialBusqueda
        OrdenadoPor.Strings = (
          'NIVEL'
          'CENTRO_COSTE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFCCFinal: TLFEditFind2000
        Left = 88
        Top = 44
        Width = 89
        Height = 21
        TabOrder = 1
        OnChange = EFCCFinalChange
        Base_de_datos = DMMain.DataBase
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'CENTRO_COSTE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ANA_CENTROS_COSTE'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFCCFinalBusqueda
        OrdenadoPor.Strings = (
          'NIVEL'
          'CENTRO_COSTE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
    end
    object GBNiveles: TGroupBox
      Left = 8
      Top = 101
      Width = 233
      Height = 81
      Caption = 'Nivel'
      TabOrder = 2
      object LBLNivelInicial: TLFLabel
        Left = 48
        Top = 23
        Width = 27
        Height = 13
        Caption = 'Inicial'
      end
      object Label4: TLFLabel
        Left = 53
        Top = 49
        Width = 22
        Height = 13
        Caption = 'Final'
      end
      object EFNivelInicial: TLFEditFind2000
        Left = 88
        Top = 22
        Width = 89
        Height = 21
        TabOrder = 0
        Base_de_datos = DMMain.DataBase
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'NIVEL'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_ANA_CC_NIVELES'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFNivelInicialBusqueda
        OrdenadoPor.Strings = (
          'NIVEL')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFNivelFinal: TLFEditFind2000
        Left = 88
        Top = 48
        Width = 89
        Height = 21
        TabOrder = 1
        Base_de_datos = DMMain.DataBase
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'NIVEL'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_ANA_CC_NIVELES'
        Tabla_asociada.DesplegarBusqueda = False
        OnBusqueda = EFNivelFinalBusqueda
        OrdenadoPor.Strings = (
          'NIVEL')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
    end
    object GBIncrementos: TGroupBox
      Left = 247
      Top = 101
      Width = 234
      Height = 81
      Caption = 'Incremento'
      TabOrder = 3
      object LBLIncPorciento: TLFLabel
        Left = 40
        Top = 25
        Width = 45
        Height = 13
        Caption = 'Porciento'
      end
      object LBLIncLineal: TLFLabel
        Left = 57
        Top = 51
        Width = 28
        Height = 13
        Caption = 'Lineal'
      end
      object EdIncPorc: TLFEdit
        Left = 96
        Top = 22
        Width = 84
        Height = 21
        TabOrder = 0
        Text = '0'
      end
      object EdIncLineal: TLFEdit
        Left = 96
        Top = 48
        Width = 84
        Height = 21
        TabOrder = 1
        Text = '0'
      end
    end
  end
end
