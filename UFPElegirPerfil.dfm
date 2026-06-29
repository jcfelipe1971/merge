object FPElegirPerfil: TFPElegirPerfil
  Left = 481
  Top = 415
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Elecci'#243'n de perfil'
  ClientHeight = 31
  ClientWidth = 212
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    212
    31)
  PixelsPerInch = 96
  TextHeight = 13
  object LPerfil: TLFLabel
    Left = 14
    Top = 9
    Width = 23
    Height = 13
    Alignment = taRightJustify
    Caption = 'Perfil'
  end
  object btnAceptar: TButton
    Left = 93
    Top = 3
    Width = 54
    Height = 25
    Anchors = [akTop, akRight]
    Caption = '&Aceptar'
    ModalResult = 1
    TabOrder = 0
  end
  object btnCancelar: TButton
    Left = 152
    Top = 3
    Width = 54
    Height = 25
    Anchors = [akTop, akRight]
    Caption = '&Cancelar'
    ModalResult = 2
    TabOrder = 1
  end
  object EFPerfil: TLFEditFind2000
    Left = 42
    Top = 5
    Width = 39
    Height = 21
    TabOrder = 2
    Base_de_datos = DMMain.DataBase
    Transaction = DMMain.TLocal
    BuscarNums = False
    BuscarChars = True
    AutoCambiarFoco = False
    CampoADevolver = 'PERFIL'
    CampoNum = 'TITULO'
    Posicion = tpCentrado
    ReemplazarCaracter = True
    SalirSiVacio = True
    SalirSiNoExiste = False
    Tabla_a_buscar = 'SYS_USUARIOS_PERFIL'
    Tabla_asociada.DesplegarBusqueda = False
    OnBusqueda = EFPerfilBusqueda
    OrdenadoPor.Strings = (
      'PERFIL')
    Filtros = []
    Entorno = DMMain.EntornoBusqueda
  end
end
