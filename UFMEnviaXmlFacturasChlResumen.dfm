inherited FMEnviaXmlFacturasChlResumen: TFMEnviaXmlFacturasChlResumen
  Left = 303
  Top = 215
  Caption = 'Resumen DTE Chile'
  ClientHeight = 400
  ClientWidth = 927
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 927
    Height = 376
    object LDesdeCliente: TLFLabel [0]
      Left = 2
      Top = 197
      Width = 923
      Height = 20
      Align = alTop
      Caption = 'Documentos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LFLabel1: TLFLabel [1]
      Left = 2
      Top = 28
      Width = 923
      Height = 20
      Align = alTop
      Caption = 'RCV Venta'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    inherited TBMain: TLFToolBar
      Width = 923
      inherited NavMain: THYMNavigator
        DataSource = DMEnviaxmLfacturasChl.DSQMRCV_VENTA_TOTAL
        Hints.Strings = ()
      end
      inherited EPMain: THYMEditPanel
        Width = 29
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 257
      end
      inherited TbuttComp: TToolButton
        Left = 265
      end
    end
    object DBGDocumentos: TDBGridFind2000
      Left = 2
      Top = 217
      Width = 923
      Height = 149
      Align = alTop
      Color = clInfoBk
      DataSource = DMEnviaxmLfacturasChl.DSQMDocumentos_Totales
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
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
      AutoPostEnCheckBox = True
      AutoStartDrag = False
      AutoStartDragInterval = 0
      IndiceBitmapOrdenable = 0
      IndiceBitmapAscendente = 1
      IndiceBitmapChecked = 3
      IndiceBitmapDescendente = 2
      BaseDeDatos = DMMain.DataBase
      Transaction = DMEnviaxmLfacturasChl.TLocal
      BuscarNums = False
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      CamposAOrdernar.Strings = (
        'AGENTE'
        'B_DTO_LINEAS'
        'CLIENTE'
        'CODIGO_GIRO_CLIENTE'
        'CODIGO_GIRO_EMPRESA'
        'ENTRADA_FACTURACION'
        'ESTADO'
        'FECHA'
        'FECHA_CON'
        'FOLIO'
        'FORMA_PAGO'
        'LIQUIDO'
        'NIF'
        'NOMBRE_COMERCIAL'
        'RAZONREF'
        'RIG'
        'SERIE'
        'SU_REFERENCIA'
        'TERCERO'
        'TIPO_DOC_TRIBUTARIO'
        'TITULO'
        'TOTAL_A_COBRAR'
        'TIPO')
      ColumnasCheckBoxes.Strings = (
        'ENTRADA_FACTURACION'
        'INVERSION_SUJETO_PASIVO'
        'SIN_DETALLE'
        'SIN_RECIBOS'
        'CAMBIO_FIJO')
      ColumnasChecked.Strings = (
        '1'
        '1'
        '1'
        '1'
        '1')
      ColumnasNoChecked.Strings = (
        '0'
        '0'
        '0'
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
          FieldName = 'TIPO_DOC_TRIBUTARIO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TOTAL_A_COBRAR'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LIQUIDO'
          Visible = True
        end>
    end
    object DBGridFind20001: TDBGridFind2000
      Left = 2
      Top = 48
      Width = 923
      Height = 149
      Align = alTop
      Color = clInfoBk
      DataSource = DMEnviaxmLfacturasChl.DSQMRCV_VENTA_TOTAL
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clGrayText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 2
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
      Transaction = DMEnviaxmLfacturasChl.TLocal
      BuscarNums = False
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      CamposAOrdernar.Strings = (
        'AGENTE'
        'B_DTO_LINEAS'
        'CLIENTE'
        'CODIGO_GIRO_CLIENTE'
        'CODIGO_GIRO_EMPRESA'
        'ENTRADA_FACTURACION'
        'ESTADO'
        'FECHA'
        'FECHA_CON'
        'FOLIO'
        'FORMA_PAGO'
        'LIQUIDO'
        'NIF'
        'NOMBRE_COMERCIAL'
        'RAZONREF'
        'RIG'
        'SERIE'
        'SU_REFERENCIA'
        'TERCERO'
        'TIPO_DOC_TRIBUTARIO'
        'TITULO'
        'TOTAL_A_COBRAR'
        'TIPO')
      ColumnasCheckBoxes.Strings = (
        'ENTRADA_FACTURACION'
        'INVERSION_SUJETO_PASIVO'
        'SIN_DETALLE'
        'SIN_RECIBOS'
        'CAMBIO_FIJO')
      ColumnasChecked.Strings = (
        '1'
        '1'
        '1'
        '1'
        '1')
      ColumnasNoChecked.Strings = (
        '0'
        '0'
        '0'
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
          FieldName = 'TITULO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO_DOC'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MONTO_EXENTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MONTO_NETO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MONTO_IVA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MONTO_TOTAL'
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 376
    Width = 927
  end
  inherited CEMain: TControlEdit
    Top = 100
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 324
    Top = 84
  end
  inherited ALMain: TLFActionList
    Top = 96
  end
  inherited FSMain: TLFFibFormStorage
    Left = 416
    Top = 88
  end
end
