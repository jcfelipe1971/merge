object FMPackingListTraspasos: TFMPackingListTraspasos
  Left = 490
  Top = 176
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Traspasos'
  ClientHeight = 147
  ClientWidth = 444
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
  object PMain: TLFPanel
    Left = 0
    Top = 0
    Width = 444
    Height = 147
    Align = alClient
    AutoSize = True
    BevelOuter = bvNone
    BorderWidth = 2
    TabOrder = 0
    object TBMain: TLFToolBar
      Left = 2
      Top = 2
      Width = 440
      Height = 22
      EdgeBorders = []
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 0
      Separators = True
      object TButtConfirmar: TToolButton
        Left = 0
        Top = 0
        Hint = 'Aceptar'
        Caption = 'Confirmar'
        ImageIndex = 19
        OnClick = TButtConfirmarClick
      end
      object TButtSalir: TToolButton
        Left = 23
        Top = 0
        Hint = 'Cancelar'
        Caption = 'Salir'
        ImageIndex = 0
        OnClick = TButtSalirClick
      end
    end
    object GBOrigen: TGroupBox
      Left = 2
      Top = 24
      Width = 440
      Height = 64
      Align = alTop
      Caption = 'Origen'
      TabOrder = 1
      object DBENumeroBulto: TLFDbedit
        Left = 11
        Top = 27
        Width = 53
        Height = 21
        Color = clInfoBk
        DataField = 'NUMERO_BULTO'
        DataSource = DMPackingList.DSQMBultosDet
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object DBENumeroBultoActual: TLFDbedit
        Left = 11
        Top = 27
        Width = 53
        Height = 21
        Color = clInfoBk
        DataField = 'NUMERO_BULTO'
        DataSource = DMPackingList.DSQMBultoActual
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object DBEArticulo: TLFDbedit
        Left = 65
        Top = 27
        Width = 103
        Height = 21
        Color = clInfoBk
        DataField = 'ARTICULO'
        DataSource = DMPackingList.DSQMBultosDet
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
      object DBETitulo: TLFDbedit
        Left = 169
        Top = 27
        Width = 265
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = DMPackingList.DSQMBultosDet
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
    end
    object GBDestino: TGroupBox
      Left = 2
      Top = 88
      Width = 440
      Height = 58
      Align = alTop
      Caption = 'Destino'
      TabOrder = 2
      object LBLUnidades: TLFLabel
        Left = 131
        Top = 26
        Width = 45
        Height = 13
        Alignment = taRightJustify
        Caption = 'Unidades'
      end
      object LBLBulto: TLFLabel
        Left = 28
        Top = 26
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = 'Bulto'
      end
      object EdUnidades: TLFEdit
        Left = 181
        Top = 22
        Width = 65
        Height = 21
        TabOrder = 2
        OnChange = EdUnidadesChange
        OnKeyPress = EdUnidadesKeyPress
      end
      object EFBulto: TLFEditFind2000
        Left = 57
        Top = 22
        Width = 65
        Height = 21
        TabOrder = 0
        OnChange = EdUnidadesChange
        OnKeyPress = EFBultoKeyPress
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'NUMERO_BULTO'
        CampoStr = 'TITULO_BULTO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'GES_CABECERAS_S_BULTOS'
        Tabla_asociada.DesplegarBusqueda = False
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
      object EFTipoBulto: TLFEditFind2000
        Left = 57
        Top = 22
        Width = 65
        Height = 21
        TabOrder = 1
        OnKeyPress = EFBultoKeyPress
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'BULTO'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'ART_BULTOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'BULTO')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
    end
  end
end
