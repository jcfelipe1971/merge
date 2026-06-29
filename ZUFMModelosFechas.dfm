object ZFMModelosFechas: TZFMModelosFechas
  Left = 424
  Top = 263
  BorderStyle = bsDialog
  Caption = 'D'#237'as en servir Modelos'
  ClientHeight = 377
  ClientWidth = 464
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PnlModelo: TLFPanel
    Left = 0
    Top = 0
    Width = 464
    Height = 68
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object LblModelo: TLFLabel
      Left = 21
      Top = 40
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Modelo'
    end
    object EFModelo: TLFEditFind2000
      Left = 61
      Top = 37
      Width = 50
      Height = 21
      TabOrder = 0
      OnChange = EFModeloChange
      Base_de_datos = DMMain.DataBase
      Transaction = ZDMModelosFechas.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'CODIGO'
      CampoStr = 'DESCRIPCION'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tabla_a_buscar = 'Z_SYS_MODELOS'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'CODIGO')
      Filtros = []
    end
    object DBEDescModelo: TLFDbedit
      Left = 112
      Top = 37
      Width = 300
      Height = 21
      TabStop = False
      Color = clInfoBk
      DataField = 'DESCRIPCION'
      DataSource = ZDMModelosFechas.DSxDescModelo
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object TBMain: TLFToolBar
      Left = 0
      Top = 0
      Width = 464
      Height = 26
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      Images = DMMain.ILMain_Ac
      TabOrder = 2
      Separators = True
      object TButtProcesoColores: TToolButton
        Left = 0
        Top = 0
        Action = ZAProcesoDias
        ImageIndex = 4
      end
      object ToolButton2: TToolButton
        Left = 23
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object HYMEditPanel1: THYMEditPanel
        Left = 31
        Top = 0
        Width = 20
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
  object PnlMain: TLFPanel
    Left = 0
    Top = 68
    Width = 464
    Height = 309
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object TBDetalle: TLFToolBar
      Left = 0
      Top = 0
      Width = 464
      Height = 24
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      TabOrder = 0
      Separators = True
      object NavFechas: THYMNavigator
        Left = 0
        Top = 0
        Width = 220
        Height = 22
        DataSource = ZDMModelosFechas.DSModelosFechas
        Flat = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        EditaControl = DBGFModelosFechas
        InsertaControl = DBGFModelosFechas
        Exclusivo = True
        OrdenAscendente = True
        InsertaUltimo = False
      end
      object TSep1: TToolButton
        Left = 220
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtSalir: TToolButton
        Left = 228
        Top = 0
        Caption = 'Salir'
        ImageIndex = 0
        OnClick = TButtSalirClick
      end
    end
    object DBGFModelosFechas: TDBGridFind2000
      Left = 0
      Top = 24
      Width = 464
      Height = 285
      Align = alClient
      DataSource = ZDMModelosFechas.DSModelosFechas
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Insercion = False
      ColumnaInicial = 1
      UsaDicG2K = True
      Changed = False
      Idioma = 'CAS'
      AutoCambiarColumna = False
      AutoPostEnCheckBox = False
      AutoStartDrag = False
      AutoStartDragInterval = 0
      IndiceBitmapOrdenable = 0
      IndiceBitmapAscendente = 0
      IndiceBitmapChecked = -1
      IndiceBitmapDescendente = 0
      BaseDeDatos = DMMain.DataBase
      BuscarNums = False
      Campos.Strings = (
        'COLOR')
      CamposAMostrar.Strings = (
        'COLOR'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0')
      CamposADevolver.Strings = (
        'CODIGO')
      CamposDesplegar.Strings = (
        '1')
      CampoAOrdenarColor = clInfoBk
      MensajeNoExiste = False
      Numericos.Strings = (
        'CODIGO')
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tablas.Strings = (
        'Z_SYS_COLORES')
      Acciones.Strings = (
        '')
      Titulos.Strings = (
        'DESCRIPCION')
      Posicion = tpCentrado
      OnBusqueda = DBGFModelosFechasBusqueda
      Planes.Strings = (
        '')
      OrdenMultiple = True
      OrdenadosPor.Strings = (
        'CODIGO')
      Filtros = []
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LINEA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_INI'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA_FIN'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DIAS_SERVIR'
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COLOR'
          Width = 46
          Visible = True
        end>
    end
  end
  object ZLADiasServir: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 424
    Top = 40
    object ZAProcesoDias: TAction
      Caption = 'Generar colores'
      Hint = 'Generar colores'
      ImageIndex = 25
      OnExecute = ZAProcesoDiasExecute
    end
  end
end
