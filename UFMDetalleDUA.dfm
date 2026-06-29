inherited FMDetalleDUA: TFMDetalleDUA
  Caption = 'Detalles de Linea'
  ClientHeight = 371
  ClientWidth = 690
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 690
    Height = 347
    object LDUA: TLFLabel [0]
      Left = 51
      Top = 52
      Width = 23
      Height = 13
      Alignment = taRightJustify
      Caption = 'DUA'
    end
    object LProveedor: TLFLabel [1]
      Left = 25
      Top = 76
      Width = 49
      Height = 13
      Alignment = taRightJustify
      Caption = 'Proveedor'
    end
    object LFacturaProv: TLFLabel [2]
      Left = 10
      Top = 124
      Width = 64
      Height = 13
      Alignment = taRightJustify
      Caption = 'Factura Prov.'
    end
    object LFechaAdmision: TLFLabel [3]
      Left = -1
      Top = 100
      Width = 75
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha Admision'
    end
    inherited TBMain: TLFToolBar
      Width = 686
      TabOrder = 1
      object NavDetalleDUA: THYMNavigator [0]
        Left = 0
        Top = 0
        Width = 112
        Height = 22
        DataSource = DMDetalleDUA.DSQMDetalle
        VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        Exclusivo = True
        OrdenAscendente = True
        InsertaUltimo = False
      end
      object ToolButton1: TToolButton [1]
        Left = 112
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      inherited EPMain: THYMEditPanel
        Left = 120
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object DBEDUA: TLFDbedit
      Left = 80
      Top = 48
      Width = 597
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      DataField = 'DUA'
      DataSource = DMDetalleDUA.DSQMDetalle
      TabOrder = 0
    end
    object DBEFProveedor: TLFDBEditFind2000
      Left = 79
      Top = 72
      Width = 82
      Height = 21
      AutoSize = False
      DataField = 'PROVEEDOR'
      DataSource = DMDetalleDUA.DSQMDetalle
      TabOrder = 2
      OnChange = DBEFProveedorChange
      AutoCambiarFoco = False
      Base_de_datos = DMMain.DataBase
      BuscarNums = False
      Tabla_a_buscar = 'VER_PROVEEDORES'
      Tabla_asociada.DesplegarBusqueda = False
      CampoNum = 'PROVEEDOR'
      CampoStr = 'TITULO'
      ReemplazarCaracter = True
      SalirSiNoExiste = False
      SalirSiVacio = True
      OrdenadoPor.Strings = (
        'PROVEEDOR')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object EProveedor: TLFEdit
      Left = 162
      Top = 72
      Width = 515
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 3
    end
    object DBDEFechaAdmision: TLFDBDateEdit
      Left = 79
      Top = 96
      Width = 121
      Height = 21
      DataField = 'FECHA_ADMISION'
      DataSource = DMDetalleDUA.DSQMDetalle
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 4
    end
    object DBGFacturasProveedor: TDBGridFind2000
      Left = 80
      Top = 144
      Width = 597
      Height = 193
      DataSource = DMDetalleDUA.DSFacturasProveedor
      TabOrder = 5
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Insercion = False
      ColumnaInicial = 0
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
        'ID_E_FAP')
      CamposAMostrar.Strings = (
        'ID_E_FAP'
        '3'
        'SERIE'
        'EJERCICIO'
        'NUM_FACTURA')
      CamposAMostrarAnchos.Strings = (
        '0')
      CamposADevolver.Strings = (
        '')
      CamposDesplegar.Strings = (
        '1')
      CampoAOrdenarColor = clInfoBk
      MensajeNoExiste = False
      Numericos.Strings = (
        'ID_E')
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tablas.Strings = (
        'VER_CABECERAS_FACTURA_PROV')
      Acciones.Strings = (
        '')
      Titulos.Strings = (
        'RIG')
      Posicion = tpCentrado
      OnBusqueda = DBGFacturasProveedorBusqueda
      Planes.Strings = (
        '')
      OrdenMultiple = True
      OrdenadosPor.Strings = (
        'FECHA')
      Filtros = [obEmpresa, obCanal]
      Columns = <
        item
          Expanded = False
          FieldName = 'ID_E_FAP'
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DOCUMENTO'
          ReadOnly = True
          Width = 491
          Visible = True
        end>
    end
    object NavFacturasProveedor: THYMNavigator
      Left = 81
      Top = 119
      Width = 240
      Height = 25
      DataSource = DMDetalleDUA.DSFacturasProveedor
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      ModoDeSeguridad = True
      DelCaption = 'Informaci'#243'n'
      DelMessage = ' '#191' Borra el registro ? '
      Exclusivo = True
      OrdenAscendente = True
      InsertaUltimo = False
    end
  end
  inherited TBActions: TLFToolBar
    Top = 347
    Width = 690
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
end
