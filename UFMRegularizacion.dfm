object FMRegularizacion: TFMRegularizacion
  Left = 499
  Top = 422
  Width = 400
  Height = 247
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Asiento de Regularizaci'#243'n'
  Color = clBtnFace
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
  object LCuenta: TLFLabel
    Left = 37
    Top = 71
    Width = 186
    Height = 13
    Alignment = taRightJustify
    Caption = 'Cuenta de P'#233'rdidas y Ganancias'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object EFCuenta: TLFEditFind2000
    Left = 228
    Top = 67
    Width = 121
    Height = 21
    TabOrder = 0
    OnExit = EFCuentaExit
    OnKeyDown = EFCuentaKeyDown
    Base_de_datos = DMMain.DataBase
    Transaction = DMMain.TLocal
    BuscarNums = False
    BuscarChars = True
    AutoCambiarFoco = False
    CampoNum = 'CUENTA'
    CampoStr = 'TITULO'
    CondicionBusqueda = 'GESTION=16'
    Posicion = tpCentrado
    ReemplazarCaracter = True
    SalirSiVacio = False
    SalirSiNoExiste = False
    Tabla_a_buscar = 'VER_SUBCUENTAS_GESTION'
    Tabla_asociada.DesplegarBusqueda = False
    OrdenadoPor.Strings = (
      'CUENTA')
    Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
    Entorno = DMMain.EntornoBusqueda
  end
  object CBAmortizacion: TLFCheckBox
    Left = 40
    Top = 93
    Width = 305
    Height = 21
    Caption = 'Contabilizar amortizaciones pendientes'
    ClicksDisabled = False
    ColorCheck = 57088
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 1
    TabStop = True
    Alignment = taLeftJustify
  end
  object ButtAceptar: TButton
    Left = 96
    Top = 126
    Width = 75
    Height = 25
    Caption = 'Aceptar'
    TabOrder = 2
    OnClick = ButtAceptarClick
  end
  object ButtCancelar: TButton
    Left = 208
    Top = 126
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    TabOrder = 3
    OnClick = ButtCancelarClick
  end
end
