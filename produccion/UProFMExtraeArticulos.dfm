object ProFMExtraeArticulos: TProFMExtraeArticulos
  Left = 352
  Top = 254
  BorderStyle = bsSingle
  Caption = 'Distribucion de los art'#237'culos en el almac'#233'n'
  ClientHeight = 289
  ClientWidth = 504
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = CEMainPMEdit
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PNLotes: TLFPanel
    Left = 0
    Top = 0
    Width = 504
    Height = 289
    Align = alClient
    TabOrder = 0
    object DBGFDistribuye: TDBGridFind2000
      Left = 1
      Top = 45
      Width = 502
      Height = 243
      Align = alClient
      DataSource = ProDMExtraeArticulos.DSQMDistribucion
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      IniStorage = FSMain
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
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
        'UBICACION')
      CamposAMostrar.Strings = (
        'UBICACION'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0')
      CamposADevolver.Strings = (
        '')
      CamposDesplegar.Strings = (
        '1')
      CampoAOrdenarColor = clInfoBk
      CamposNoAccesibles.Strings = (
        'ID_A'
        'ID_DETALLES'
        'LINEA'
        'ARTICULO'
        'TIPO')
      MensajeNoExiste = False
      Numericos.Strings = (
        'COMPOSICION')
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tablas.Strings = (
        'VER_ARTICULOS_UBICACIONES')
      Acciones.Strings = (
        '')
      Titulos.Strings = (
        'TITULO_DESCRIPCION')
      Posicion = tpCentrado
      OnBusqueda = DBGFDistribuyeBusqueda
      Planes.Strings = (
        '')
      OrdenMultiple = True
      Filtros = []
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LINEA_UBICACION'
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
          FieldName = 'UBICACION'
          Width = 143
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 189
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES'
          Width = 82
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'VOLUMEN'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 73
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'PESO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGray
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 79
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DIAMETRO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 65
          Visible = True
        end>
    end
    object TBMain: TLFToolBar
      Left = 1
      Top = 1
      Width = 502
      Height = 22
      EdgeBorders = []
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 1
      Separators = True
      object LBArticulo: TLFLabel
        Left = 0
        Top = 0
        Width = 57
        Height = 22
        Alignment = taCenter
        AutoSize = False
        Caption = 'Art'#237'culo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object DBEArticulo: TLFDbedit
        Left = 57
        Top = 0
        Width = 89
        Height = 22
        Color = clInfoBk
        DataField = 'ARTICULO'
        DataSource = ProDMExtraeArticulos.DSxArticulos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object DBEDescripcion: TLFDbedit
        Left = 146
        Top = 0
        Width = 239
        Height = 22
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = ProDMExtraeArticulos.DSxArticulos
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object TBSeparador: TToolButton
        Left = 385
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object EFDistribucion: THYMEditPanel
        Left = 393
        Top = 0
        Width = 22
        Height = 22
        VisibleButtons = [neSalir]
        ParentShowHint = False
        SalirCaption = 'Salida'
        SalirMensaje = ' '#191' Abandonar esta Ventana de Edici'#243'n ? '
        ShowHint = True
        TabOrder = 2
        Flat = True
        Exclusivo = True
      end
      object TButtAceptar: TToolButton
        Left = 415
        Top = 0
        Hint = 'Aceptar Distribuci'#243'n'
        Caption = 'Aceptar Distribuci'#243'n'
        ImageIndex = 19
        OnClick = TButtAceptarClick
      end
    end
    object TBNav: TLFToolBar
      Left = 1
      Top = 23
      Width = 502
      Height = 22
      Flat = True
      TabOrder = 2
      Separators = True
      object NavMain: THYMNavigator
        Left = 0
        Top = 0
        Width = 240
        Height = 22
        DataSource = ProDMExtraeArticulos.DSQMDistribucion
        Flat = True
        ParentShowHint = False
        PopupMenu = CEMainPMEdit
        ShowHint = True
        TabOrder = 0
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        EditaControl = DBGFDistribuye
        InsertaControl = DBGFDistribuye
        Exclusivo = True
        ControlEdit = CEMain
        OrdenAscendente = True
        InsertaUltimo = False
      end
    end
  end
  object CEMain: TControlEdit
    PopUpMenu = CEMainPMEdit
    Teclas = DMMain.Teclas
    Left = 328
    Top = 72
  end
  object CEMainPMEdit: TPopUpTeclas
    Left = 424
    Top = 80
    object CEMainMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEMainMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEMainMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEMainMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEMainMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEMainMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEMainMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEMainMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEMainMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEMainMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object FSMain: TLFFibFormStorage
    UseRegistry = False
    StoredValues = <>
    Database = DMMain.DataBase
    SaveFormControls = True
    LoadFormControls = True
    Profile = 0
    User = 0
    ChangedControls = False
    Left = 412
    Top = 32
  end
end
