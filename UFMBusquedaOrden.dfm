object FMBusquedaOrden: TFMBusquedaOrden
  Left = 892
  Top = 236
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'B'#250'squeda de Doc. por Orden'
  ClientHeight = 78
  ClientWidth = 272
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PMain: TLFPanel
    Left = 0
    Top = 0
    Width = 272
    Height = 78
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object LIDOrdenProduccion: TLFLabel
      Left = 36
      Top = 45
      Width = 41
      Height = 13
      Alignment = taRightJustify
      Caption = 'Id Orden'
    end
    object EFIdOrden: TEditFind2000
      Left = 84
      Top = 41
      Width = 121
      Height = 21
      TabOrder = 0
      OnKeyDown = EFIdOrdenKeyDown
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'ID_ORDEN'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = True
      Tabla_a_buscar = 'VER_PRO_ORD'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'TITULO, ID_ORDEN')
      Filtros = [obEmpresa, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object TBMain: TLFToolBar
      Left = 0
      Top = 0
      Width = 272
      Height = 27
      ButtonHeight = 23
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      TabOrder = 1
      Separators = True
      object HYMEPanel: THYMEditPanel
        Left = 0
        Top = 0
        Width = 50
        Height = 23
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = (
          'Confirmar Filtro'
          'B'#250'squeda aproximada'
          'B'#250'squeda exacta'
          'Imprime pantalla'
          'Filtra rango'
          'Imprime report'
          'Copiar'
          'Cortar'
          'Pegar'
          'Cerrar la ventana')
        ParentShowHint = False
        SalirCaption = 'Salida'
        SalirMensaje = ' '#191' Abandonar esta Ventana de Edici'#243'n ? '
        ShowHint = True
        TabOrder = 0
        Flat = True
        Exclusivo = True
        OnClickBuscar = HYMEPanelClickBuscar
      end
    end
  end
end
