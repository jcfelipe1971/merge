object FMBusquedaArtPostizo: TFMBusquedaArtPostizo
  Left = 512
  Top = 310
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'B'#250'squeda de Documento por N'#186' de Serie'
  ClientHeight = 171
  ClientWidth = 312
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDefault
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PMain: TLFPanel
    Left = 0
    Top = 0
    Width = 312
    Height = 171
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object LBLNArtPostizo: TLFLabel
      Left = 31
      Top = 78
      Width = 74
      Height = 13
      Alignment = taRightJustify
      Caption = 'Art'#237'culo Postizo'
    end
    object EFArtPostizo: TLFEditFind2000
      Left = 112
      Top = 74
      Width = 121
      Height = 21
      TabOrder = 0
      OnKeyDown = EFArtPostizoKeyDown
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'ARTICULO'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = True
      Tabla_a_buscar = 'ART_ARTICULOS'
      Tabla_asociada.DesplegarBusqueda = False
      OnBusqueda = EFArtPostizoBusqueda
      OrdenadoPor.Strings = (
        'ARTICULO')
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
    end
    object TBMain: TLFToolBar
      Left = 0
      Top = 0
      Width = 312
      Height = 26
      EdgeInner = esNone
      EdgeOuter = esNone
      TabOrder = 1
      Separators = True
      object HYMEPanel: THYMEditPanel
        Left = 0
        Top = 2
        Width = 23
        Height = 22
        VisibleButtons = [neSalir]
        ParentShowHint = False
        SalirCaption = 'Salida'
        SalirMensaje = ' '#191' Abandonar esta Ventana de Edici'#243'n ? '
        ShowHint = True
        TabOrder = 0
        Flat = True
        Exclusivo = True
      end
    end
  end
end
