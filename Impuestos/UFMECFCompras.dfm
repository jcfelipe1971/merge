inherited FMECFCompras: TFMECFCompras
  Left = 379
  Top = 212
  Caption = 'ECF - Compras'
  ClientHeight = 558
  ClientWidth = 1151
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1151
    Height = 534
    inherited TBMain: TLFToolBar
      Width = 1147
      inherited NavMain: THYMNavigator
        Width = 176
        DataSource = DMECFCompras.DSQMDocumentos
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton
        Left = 176
      end
      inherited EPMain: THYMEditPanel
        Left = 184
        Width = 33
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 217
      end
      inherited TbuttComp: TToolButton
        Left = 225
      end
    end
    object TBECFCompras: TLFToolBar
      Left = 2
      Top = 28
      Width = 1147
      Height = 24
      DisabledImages = DMMain.ILMain_In
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Wrapable = False
      Separators = True
      object TBFiltrar: TToolButton
        Left = 0
        Top = 0
        Hint = 'Filtrar'
        Caption = 'Filtrar'
        ImageIndex = 5
        OnClick = TBFiltrarClick
      end
      object TBLimpiarFiltros: TToolButton
        Left = 23
        Top = 0
        Hint = 'Limpiar Filtros'
        Caption = 'Limpiar Filtros'
        ImageIndex = 6
        OnClick = TBLimpiarFiltrosClick
      end
      object TBSep1: TToolButton
        Left = 46
        Top = 0
        Width = 8
        ImageIndex = 2
        Style = tbsSeparator
      end
      object PNLFitroSerie: TLFPanel
        Left = 54
        Top = 0
        Width = 179
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object LFiltroSerie: TLFLabel
          Left = 4
          Top = 3
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = 'Serie'
          Layout = tlCenter
        end
        object CBSeries: TLFComboBox
          Left = 33
          Top = 0
          Width = 145
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          OnChange = TBFiltrarClick
        end
      end
      object PNLFiltroTipoECF: TLFPanel
        Left = 233
        Top = 0
        Width = 93
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object LFiltroTipoECF: TLFLabel
          Left = 4
          Top = 3
          Width = 37
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo CF'
          Layout = tlCenter
        end
        object EFTipoECF: TLFEditFind2000
          Left = 46
          Top = 0
          Width = 45
          Height = 21
          TabOrder = 0
          OnChange = TBFiltrarClick
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoADevolver = 'TIPO_NCF'
          CampoNum = 'TIPO_NCF'
          CampoStr = 'TITULO'
          CondicionBusqueda = 'TIPO_NCF in ('#39'41'#39', '#39'43'#39', '#39'47'#39')'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'Z_SYS_TIPO_NCF'
          Tabla_asociada.DesplegarBusqueda = False
          Filtros = []
        end
      end
      object PNLFiltroCliente: TLFPanel
        Left = 326
        Top = 0
        Width = 126
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LFiltroProveedor: TLFLabel
          Left = 1
          Top = 3
          Width = 49
          Height = 13
          Alignment = taRightJustify
          Caption = 'Proveedor'
          Layout = tlCenter
        end
        object EFProveedor: TLFEditFind2000
          Left = 53
          Top = 0
          Width = 80
          Height = 21
          TabOrder = 0
          OnChange = TBFiltrarClick
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoADevolver = 'PROVEEDOR'
          CampoNum = 'PROVEEDOR'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_PROVEEDORES'
          Tabla_asociada.DesplegarBusqueda = False
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
      end
      object PNLFiltroDocumento: TLFPanel
        Left = 452
        Top = 0
        Width = 241
        Height = 22
        BevelOuter = bvNone
        TabOrder = 3
        object LDesdeDocumento: TLFLabel
          Left = 12
          Top = 3
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde'
          Layout = tlCenter
        end
        object LHastaDocumento: TLFLabel
          Left = 130
          Top = 3
          Width = 28
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta'
          Layout = tlCenter
        end
        object EDesdeDocumento: TLFEdit
          Left = 48
          Top = 0
          Width = 80
          Height = 21
          TabOrder = 0
          OnChange = TBFiltrarClick
        end
        object EHastaDocumento: TLFEdit
          Left = 164
          Top = 0
          Width = 80
          Height = 21
          TabOrder = 1
          OnChange = TBFiltrarClick
        end
      end
    end
    object DBGECFCompras: TDBGridFind2000
      Left = 2
      Top = 52
      Width = 1147
      Height = 480
      Align = alClient
      Color = clInfoBk
      DataSource = DMECFCompras.DSQMDocumentos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGECFComprasCellClick
      OnDblClick = DBGECFComprasDblClick
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
      Idioma = 'CAS'
      AutoCambiarColumna = False
      AutoPostEnCheckBox = True
      AutoStartDrag = False
      AutoStartDragInterval = 0
      IndiceBitmapOrdenable = 0
      IndiceBitmapAscendente = 1
      IndiceBitmapChecked = 3
      IndiceBitmapDescendente = 2
      BaseDeDatos = DMMain.DataBase
      Transaction = DMECFCompras.TLocal
      BuscarNums = False
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      ColumnasCheckBoxes.Strings = (
        'RESPUESTA_ENVIO'
        'RESPUESTA_CONSULTA')
      ColumnasChecked.Strings = (
        '1'
        '1')
      ColumnasNoChecked.Strings = (
        '0'
        '0')
      MensajeNoExiste = False
      SalirSiVacio = False
      SalirSiNoExiste = False
      Posicion = tpCentrado
      OrdenMultiple = True
      Filtros = []
      Entorno = DMMain.EntornoBusqueda
      Columns = <
        item
          Expanded = False
          FieldName = 'FECHA'
          Width = 82
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ENCF'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SERIE'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RIG'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PROVEEDOR'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_ENVIO'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STATUS_CONSULTA'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SEQUENCE_CONSUMED'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LEGAL_STATUS_CONSULTA'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SECURITY_CODE'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MENSAJE_ERROR_ENVIO_ECF'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_E'
          Width = 82
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TRACK_ID'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GOVERMENT_RESPONSE'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL_FACTURA'
          Width = 80
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RESPUESTA_ENVIO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RESPUESTA_CONSULTA'
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 534
    Width = 1151
  end
  inherited CEMain: TControlEdit
    Left = 496
    Top = 0
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 528
    Top = 0
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMiedit: TMenuItem
      Visible = False
    end
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
  inherited ALMain: TLFActionList
    Left = 560
    Top = 0
  end
  inherited FSMain: TLFFibFormStorage
    Left = 584
    Top = 0
  end
end
