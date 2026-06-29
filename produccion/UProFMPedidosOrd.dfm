inherited ProFMPedidosOrd: TProFMPedidosOrd
  Left = 321
  Top = 177
  Caption = 'Pedidos '
  ClientHeight = 447
  ClientWidth = 790
  Position = poScreenCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 790
    Height = 423
    inherited TBMain: TLFToolBar
      Width = 786
      TabOrder = 2
      inherited EPMain: THYMEditPanel
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object TSep1: TToolButton
        Left = 25
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object PNLFiltroSituacion: TLFPanel
        Left = 33
        Top = 0
        Width = 365
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object LSituacion: TLFLabel
          Left = 10
          Top = 2
          Width = 55
          Height = 16
          Alignment = taRightJustify
          Caption = 'Situaci'#243'n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          Layout = tlCenter
        end
        object CBFiltro: TLFComboBox
          Left = 68
          Top = 0
          Width = 296
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 0
          Text = 'Pendiente '
          OnChange = CBFiltroChange
          Items.Strings = (
            'Pendiente '
            'En proceso'
            'Finalizada')
        end
      end
      object TSep2: TToolButton
        Left = 398
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtGenerar: TToolButton
        Left = 406
        Top = 0
        Hint = 'Generar Orden'
        Caption = 'Generar'
        ImageIndex = 94
        ParentShowHint = False
        ShowHint = True
        Visible = False
        OnClick = TButtGenerarClick
      end
      object TSep3: TToolButton
        Left = 429
        Top = 0
        Width = 8
        ImageIndex = 52
        Style = tbsSeparator
      end
      object TButtBorraRelacion: TToolButton
        Left = 437
        Top = 0
        Hint = 'Borrar la Relaci'#243'n entre el Pedido y la OF'
        Caption = 'Borrar Relaci'#243'n Pedido - OF'
        ImageIndex = 27
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtBorraRelacionClick
      end
      object TBCierre: TToolButton
        Left = 460
        Top = 0
        Hint = 'Generar Orden'
        Caption = 'TBCierre'
        ImageIndex = 92
        ParentShowHint = False
        ShowHint = True
        OnClick = TBCierreClick
      end
      object TBDeslanza: TToolButton
        Left = 483
        Top = 0
        Hint = 'Deslanzar Ordenes'
        Caption = 'Deslanzar'
        ImageIndex = 51
        ParentShowHint = False
        ShowHint = True
        OnClick = TBDeslanzaClick
      end
    end
    object PNLPedidos: TLFPanel
      Left = 2
      Top = 28
      Width = 786
      Height = 250
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object DBGLineasPedidos: TDBGridFind2000
        Left = 0
        Top = 0
        Width = 786
        Height = 250
        Align = alClient
        DataSource = ProDMPedidosOrd.DSQMDetallePedidos
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGLineasPedidosDrawColumnCell
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
        IndiceBitmapAscendente = 1
        IndiceBitmapChecked = 3
        IndiceBitmapDescendente = 2
        BaseDeDatos = DMMain.DataBase
        BuscarNums = False
        Campos.Strings = (
          'ESCANDALLO')
        CamposAMostrar.Strings = (
          'ESCANDALLO'
          '0')
        CamposAMostrarAnchos.Strings = (
          '0')
        CamposADevolver.Strings = (
          'ESCANDALLO')
        CamposDesplegar.Strings = (
          '1')
        CampoAOrdenarColor = clInfoBk
        CampoAOrdenarBitmaps = DMMain.ILOrdGrid
        ColumnasCheckBoxes.Strings = (
          'MARCA')
        ColumnasChecked.Strings = (
          '1')
        ColumnasNoChecked.Strings = (
          '0')
        MensajeNoExiste = False
        Numericos.Strings = (
          'COMPUESTO')
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tablas.Strings = (
          'PRO_ESCANDALLO')
        Acciones.Strings = (
          '')
        Titulos.Strings = (
          'ESCANDALLO')
        Posicion = tpCentrado
        OnBusqueda = DBGLineasPedidosBusqueda
        Planes.Strings = (
          '')
        OrdenMultiple = True
        Filtros = []
        Columns = <
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'SITUACION'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Width = 75
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'ESTADO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clInfoBk
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Visible = False
          end
          item
            Expanded = False
            FieldName = 'ESCANDALLO'
            Width = 59
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'RIG'
            Width = 44
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'LINEA'
            Width = 34
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'ARTICULO'
            Width = 70
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TITULO'
            Width = 200
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'UNIDADES'
            Width = 40
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'PRECIO'
            Width = 50
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'B_IMPONIBLE'
            Width = 62
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'PRO_UNIDADES'
            Width = 45
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'PRO_B_IMPONIBLE'
            Visible = False
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'UDS_PRODUCIDAS'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MARCA'
            Width = 22
            Visible = True
          end>
      end
    end
    object PNLDetalles: TLFPanel
      Left = 2
      Top = 278
      Width = 786
      Height = 143
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object LNotas: TLFLabel
        Left = 0
        Top = 0
        Width = 30
        Height = 143
        Align = alLeft
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Notas'
        Visible = False
      end
      object DBMNotas: TLFDBMemo
        Left = 30
        Top = 0
        Width = 373
        Height = 143
        Align = alClient
        DataField = 'NOTAS'
        DataSource = ProDMPedidosOrd.DSQMProPedidosOrd
        TabOrder = 0
        Visible = False
      end
      object DBGCierres: TDBGridFind2000
        Left = 403
        Top = 0
        Width = 383
        Height = 143
        Align = alRight
        Color = clInfoBk
        DataSource = ProDMPedidosOrd.DSQMProPedidosOrd
        TabOrder = 1
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
        CampoAOrdenarColor = clInfoBk
        MensajeNoExiste = False
        SalirSiVacio = False
        SalirSiNoExiste = False
        Posicion = tpCentrado
        OrdenMultiple = True
        Filtros = []
        Columns = <
          item
            Expanded = False
            FieldName = 'FECHA'
            Width = 110
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UNIDADES'
            Width = 65
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UDS_MANUAL'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Situaci'#243'n'
            Width = 89
            Visible = True
          end>
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 423
    Width = 790
  end
  object PMMarcats: TPopupMenu
    AutoHotkeys = maManual
    Left = 632
    object MIMarcar: TMenuItem
      Caption = 'Marcar'
      OnClick = MIMarcarClick
    end
    object MIDesmarcar: TMenuItem
      Caption = 'Desmarcar'
      OnClick = MIDesmarcarClick
    end
  end
end
