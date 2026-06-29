inherited FMDetallePagoFactura: TFMDetallePagoFactura
  ActiveControl = DBECobrar
  Caption = 'Detalle Pago Factura'
  ClientHeight = 403
  ClientWidth = 563
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 563
    Height = 379
    inherited TBMain: TLFToolBar
      Width = 559
      Height = 40
      ButtonHeight = 36
      ButtonWidth = 72
      ShowCaptions = True
      inherited EPMain: THYMEditPanel
        Width = 41
        Height = 36
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object ToolButton1: TToolButton
        Left = 41
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtImprimir: TToolButton
        Left = 49
        Top = 0
        Caption = '&Imprimir'
        ImageIndex = 14
        OnClick = TButtImprimirClick
      end
      object TButtPrevisualizar: TToolButton
        Left = 121
        Top = 0
        Caption = '&Previsualizar'
        ImageIndex = 125
        OnClick = TButtPrevisualizarClick
      end
    end
    object PNLCobro: TLFPanel
      Left = 2
      Top = 42
      Width = 559
      Height = 191
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object LACobrar: TLFLabel
        Left = 67
        Top = 72
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'A cobrar'
      end
      object LTotalFactura: TLFLabel
        Left = 44
        Top = 20
        Width = 63
        Height = 13
        Alignment = taRightJustify
        Caption = 'Total Factura'
      end
      object LResto: TLFLabel
        Left = 79
        Top = 125
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Resto'
      end
      object LAnticipado: TLFLabel
        Left = 57
        Top = 42
        Width = 50
        Height = 13
        Alignment = taRightJustify
        Caption = 'Anticipado'
      end
      object LFormaPago: TLFLabel
        Left = 244
        Top = 72
        Width = 57
        Height = 13
        Alignment = taRightJustify
        Caption = 'Forma Pago'
      end
      object LComentario: TLFLabel
        Left = 55
        Top = 94
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = 'Comentario'
      end
      object LAsignaVencimiento: TLFLabel
        Left = 14
        Top = 160
        Width = 93
        Height = 13
        Alignment = taRightJustify
        Caption = 'Asigna Vencimiento'
      end
      object BCobrar: TButton
        Left = 380
        Top = 64
        Width = 75
        Height = 47
        Caption = '&Cobrar'
        TabOrder = 5
        OnClick = BCobrarClick
      end
      object DBEAnticipado: TLFDbedit
        Left = 112
        Top = 38
        Width = 121
        Height = 21
        Color = clInfoBk
        DataField = 'IMPORTE_ANTICIPO'
        DataSource = DMDetallePagoFactura.DSQMCabecera
        Enabled = False
        TabOrder = 1
      end
      object DBECobrar: TLFDbedit
        Left = 112
        Top = 68
        Width = 121
        Height = 21
        DataField = 'IMPORTE_PAGADO'
        DataSource = DMDetallePagoFactura.DSQMCabecera
        TabOrder = 2
      end
      object DBEResto: TLFDbedit
        Left = 112
        Top = 121
        Width = 121
        Height = 21
        Color = clInfoBk
        DataField = 'RESTO'
        DataSource = DMDetallePagoFactura.DSQMCabecera
        Enabled = False
        TabOrder = 6
      end
      object DBETotalFactura: TLFDbedit
        Left = 112
        Top = 16
        Width = 121
        Height = 21
        Color = clInfoBk
        DataField = 'LIQUIDO'
        DataSource = DMDetallePagoFactura.DSQMCabecera
        Enabled = False
        TabOrder = 0
      end
      object EFFormaPago: TLFEditFind2000
        Left = 304
        Top = 68
        Width = 65
        Height = 21
        TabOrder = 3
        Text = 'CON'
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'FORMA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_FORMAS_PAGO_EMP'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'FORMA')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EComentario: TLFEdit
        Left = 112
        Top = 90
        Width = 257
        Height = 21
        TabOrder = 4
      end
      object DEVencimiento: TLFDateEdit
        Left = 112
        Top = 157
        Width = 121
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 7
      end
      object BAsignaVencimiento: TButton
        Left = 240
        Top = 155
        Width = 121
        Height = 25
        Caption = '&Asigna Vencimiento'
        TabOrder = 8
        OnClick = BAsignaVencimientoClick
      end
    end
    object PNLDetalle: TLFPanel
      Left = 2
      Top = 233
      Width = 559
      Height = 144
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object DBGDetalleCartera: TDBGridFind2000
        Left = 0
        Top = 0
        Width = 559
        Height = 144
        Align = alClient
        DataSource = DMDetallePagoFactura.DSQMCarteraDetalle
        TabOrder = 0
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
        AutoPostEnCheckBox = True
        AutoStartDrag = False
        AutoStartDragInterval = 0
        IndiceBitmapOrdenable = 0
        IndiceBitmapAscendente = 1
        IndiceBitmapChecked = 3
        IndiceBitmapDescendente = 2
        BaseDeDatos = DMMain.DataBase
        BuscarNums = False
        Campos.Strings = (
          'CTA_PAGO'
          'TIPO_EFECTO')
        CamposAMostrar.Strings = (
          'CTA_PAGO'
          '0'
          'TIPO_EFECTO'
          '0')
        CamposAMostrarAnchos.Strings = (
          '0'
          '0')
        CamposADevolver.Strings = (
          ''
          '')
        CamposDesplegar.Strings = (
          '1'
          '1')
        CampoAOrdenarColor = clInfoBk
        CampoAOrdenarBitmaps = DMMain.ILOrdGrid
        ColumnasCheckBoxes.Strings = (
          'PAGADO')
        ColumnasChecked.Strings = (
          '1')
        ColumnasNoChecked.Strings = (
          '0')
        MensajeNoExiste = False
        Numericos.Strings = (
          'CUENTA'
          'TIPO')
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tablas.Strings = (
          'CON_CUENTAS'
          'SYS_TIPO_EFECTO')
        Acciones.Strings = (
          ''
          '')
        Titulos.Strings = (
          'TITULO'
          'TITULO')
        Posicion = tpCentrado
        OnBusqueda = DBGDetalleCarteraBusqueda
        Planes.Strings = (
          ''
          '')
        OrdenMultiple = True
        OrdenadosPor.Strings = (
          'CUENTA'
          'TIPO')
        Filtros = []
        Columns = <
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'LINEA'
            ReadOnly = True
            Width = 34
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'VENCIMIENTO'
            Width = 69
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CTA_PAGO'
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'LIQUIDO'
            ReadOnly = True
            Width = 81
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PAGADO'
            Width = 40
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_EFECTO'
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'OBSERVACIONES'
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'MONEDA'
            ReadOnly = True
            Width = 44
            Visible = True
          end>
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 379
    Width = 563
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
