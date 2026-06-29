inherited ProFMImputaciones: TProFMImputaciones
  Left = 300
  Top = 231
  Width = 841
  Height = 475
  HelpContext = 177
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Imputaci'#243'n de Compras a Ordenes de Producci'#243'n'
  OldCreateOrder = True
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 831
    Height = 422
    Caption = 'PMain'
    inherited TBMain: TLFToolBar
      Width = 827
      TabOrder = 1
      inherited EPMain: THYMEditPanel
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
        TabOrder = 1
      end
      object PNLProduccion: TLFPanel
        Left = 25
        Top = 0
        Width = 341
        Height = 22
        BevelOuter = bvNone
        TabOrder = 0
        object LblFechaImp: TLFLabel
          Left = 22
          Top = 3
          Width = 102
          Height = 13
          Alignment = taRightJustify
          Caption = '&Fecha Imputaci'#243'n'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object DEFechaImputacion: TDateEdit
          Left = 128
          Top = 0
          Width = 95
          Height = 21
          NumGlyphs = 2
          TabOrder = 0
          OnChange = DEFechaImputacionChange
        end
        object CBUtilizarFechaDocumento: TLFCheckBox
          Left = 226
          Top = 2
          Width = 107
          Height = 17
          Caption = 'Utilizar Fec. Doc.'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 1
          TabStop = True
          Alignment = taLeftJustify
          OnChange = CBUtilizarFechaDocumentoChange
        end
      end
      object ToolButton1: TToolButton
        Left = 366
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtRegenera: TToolButton
        Left = 374
        Top = 0
        Hint = 'Genera o Regenera la tabla de Recepci'#243'n de Pedidos'
        Caption = 'Regenera'
        ImageIndex = 26
        OnClick = TButtRegeneraClick
      end
      object TButtLineasImp: TToolButton
        Left = 397
        Top = 0
        Hint = 'Muestra las l'#237'neas imputables del documento'
        Caption = 'Lineas Imputables'
        ImageIndex = 23
        OnClick = TButtLineasImpClick
      end
      object TButtLineasNoImp: TToolButton
        Left = 420
        Top = 0
        Hint = 'Muestra las l'#237'neas no imputables del documento'
        Caption = 'Lineas No Imputables'
        ImageIndex = 22
        OnClick = TButtLineasNoImpClick
      end
      object TButtImputar: TToolButton
        Left = 443
        Top = 0
        Hint = 'Imputar los documentos marcados'
        Caption = 'Imputar'
        ImageIndex = 94
        OnClick = TButtImputarClick
      end
      object TButtMarcarTodas: TToolButton
        Left = 466
        Top = 0
        Hint = 'Marcar como imputadas todas las l'#237'neas'
        ImageIndex = 146
        OnClick = TButtMarcarTodasClick
      end
      object TButtImputarUnidadesLinea: TToolButton
        Left = 489
        Top = 0
        Hint = 'Imputar todas las unidades de la l'#237'nea'
        Caption = 'Imputar Unidades Linea'
        ImageIndex = 42
        OnClick = TButtImputarUnidadesLineaClick
      end
      object TButtMarcarTodasImp: TToolButton
        Left = 512
        Top = 0
        Hint = 'Marcar como imputadas todas las unidades de las l'#237'neas'
        ImageIndex = 19
        OnClick = TButtMarcarTodasImpClick
      end
      object ToolButton3: TToolButton
        Left = 535
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtImputarOrdenes: TToolButton
        Left = 543
        Top = 0
        Hint = 'Imputar a Ordenes de Producci'#243'n'
        Caption = 'Imputar Ordenes'
        ImageIndex = 92
        OnClick = TButtProduccionClick
      end
    end
    object DBGFImputaciones: TDBGridFind2000
      Left = 2
      Top = 28
      Width = 827
      Height = 392
      Align = alClient
      DataSource = ProDMImputaciones.DSQMDetalle
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
      Transaction = ProDMImputaciones.TLocal
      BuscarNums = False
      Campos.Strings = (
        'FASE_ORDEN'
        'ID_ORDEN')
      CamposAMostrar.Strings = (
        'FASE_ORDEN'
        '0'
        'ID_ORDEN'
        '2'
        'EJERCICIO'
        'RIG_OF')
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
      CamposAOrdernar.Strings = (
        'ARTICULO'
        'RIG'
        'TITULO')
      CamposNoAccesibles.Strings = (
        'RIG'
        'TITULO'
        'ARTICULO'
        'MONEDA'
        'U_IMPUTADAS'
        'U_PDTES_IMPUTAR')
      ColumnasCheckBoxes.Strings = (
        'IMPUTADO'
        'IMPUTABLE'
        'ENTRADA_IMPUTACION')
      ColumnasChecked.Strings = (
        '1'
        '1'
        '1')
      ColumnasNoChecked.Strings = (
        '0'
        '0'
        '0')
      MensajeNoExiste = False
      Numericos.Strings = (
        'LINEA_FASE'
        'ID_ORDEN')
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tablas.Strings = (
        'PRO_ORD_FASES'
        'PRO_ORD')
      Acciones.Strings = (
        ''
        '')
      Titulos.Strings = (
        'FASE'
        'COMPUESTO')
      Posicion = tpCentrado
      OnBusqueda = DBGFImputacionesBusqueda
      Planes.Strings = (
        ''
        '')
      OrdenMultiple = True
      OrdenadosPor.Strings = (
        ''
        'ID_ORDEN')
      Filtros = []
      Entorno = DMMain.EntornoBusqueda
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'EJERCICIO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 27
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TIPO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 27
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'SERIE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 27
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'RIG'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Width = 37
          Visible = True
        end
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
          Width = 31
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ARTICULO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Title.Caption = 'Art'#237'culo'
          Width = 77
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
          Title.Caption = 'T'#237'tulo'
          Width = 179
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'U_IMPUTADAS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 46
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'U_PDTES_IMPUTAR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'U_A_IMPUTAR'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IMPUTADO'
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ENTRADA_IMPUTACION'
          Width = 39
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IMPUTABLE'
          Width = 49
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ID_ORDEN'
          Width = 51
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FASE_ORDEN'
          Width = 29
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 422
    Width = 831
  end
  inherited CEMain: TControlEdit
    Left = 592
    Top = 0
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 624
    Top = 0
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
    Left = 656
    Top = 0
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'CBUtilizarFechaDocumento.Checked')
    Left = 688
    Top = 0
  end
end
