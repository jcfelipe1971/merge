object FMCuAnualesValorExistencias: TFMCuAnualesValorExistencias
  Left = 596
  Top = 230
  Width = 202
  Height = 141
  Caption = 'Valor Existencias'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PNLMain: TLFPanel
    Left = 0
    Top = 0
    Width = 194
    Height = 114
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object LCuenta: TLFLabel
      Left = 18
      Top = 10
      Width = 34
      Height = 13
      Alignment = taRightJustify
      Caption = 'Cuenta'
    end
    object LImporte: TLFLabel
      Left = 17
      Top = 34
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Importe'
    end
    object LNivel: TLFLabel
      Left = 28
      Top = 57
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nivel'
    end
    object EFCuentas: TEditFind2000
      Left = 56
      Top = 6
      Width = 105
      Height = 21
      TabOrder = 0
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'CUENTA'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'CON_CUENTAS'
      Tabla_asociada.DesplegarBusqueda = False
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object EImporte: TRightMaskEdit
      Left = 56
      Top = 29
      Width = 105
      Height = 21
      Cursor = 0
      TabOrder = 1
      Text = '0'
      Opciones = [Numerico]
    end
    object BOk: TButton
      Left = 64
      Top = 80
      Width = 75
      Height = 25
      Caption = '&OK'
      TabOrder = 3
      OnClick = BOkClick
    end
    object CBoxNivel: TLFComboBox
      Left = 56
      Top = 52
      Width = 105
      Height = 21
      ItemHeight = 13
      TabOrder = 2
      Text = '4'
    end
  end
end
