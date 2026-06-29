inherited FMAgrupacionFac: TFMAgrupacionFac
  Left = 404
  Top = 281
  Width = 800
  Height = 493
  HelpContext = 211
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Agrupaciones de Facturas'
  PopupMenu = CEDetallePMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 790
    Height = 440
    inherited TBMain: TLFToolBar
      Width = 786
      inherited NavMain: THYMNavigator
        DataSource = DMAgrupacionFac.DSQMAgrupacionFac
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBECodigo
        OnClickBefore = NavMainClickBefore
      end
      inherited EPMain: THYMEditPanel
        Width = 46
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 274
      end
      inherited TbuttComp: TToolButton
        Left = 282
        Hint = 'Procesar Facturas'
      end
    end
    inherited PCMain: TLFPageControl
      Width = 786
      Height = 162
      Align = alTop
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 778
          Height = 134
          object LCodigo: TLFLabel
            Left = 94
            Top = 21
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo'
          end
          object LTitulo: TLFLabel
            Left = 99
            Top = 43
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object LReferencia: TLFLabel
            Left = 75
            Top = 64
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Referencia'
          end
          object LFecha: TLFLabel
            Left = 97
            Top = 86
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LBProceso: TLFLabel
            Left = 485
            Top = 20
            Width = 276
            Height = 22
            Alignment = taCenter
            AutoSize = False
            Caption = '*** PROCESANDO ***'
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -19
            Font.Name = 'Arial'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBECodigo: TLFDbedit
            Left = 131
            Top = 17
            Width = 35
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CODIGO'
            DataSource = DMAgrupacionFac.DSQMAgrupacionFac
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 131
            Top = 39
            Width = 315
            Height = 21
            DataField = 'TITULO'
            DataSource = DMAgrupacionFac.DSQMAgrupacionFac
            TabOrder = 1
          end
          object DBDTFecha: TLFDBDateEdit
            Left = 131
            Top = 83
            Width = 87
            Height = 21
            DataField = 'FECHA'
            DataSource = DMAgrupacionFac.DSQMAgrupacionFac
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 3
          end
          object DBEReferencia: TLFDbedit
            Left = 131
            Top = 61
            Width = 315
            Height = 21
            CharCase = ecUpperCase
            DataField = 'REFERENCIA'
            DataSource = DMAgrupacionFac.DSQMAgrupacionFac
            TabOrder = 2
          end
          object DBCBCerrar: TLFDBCheckBox
            Left = 226
            Top = 85
            Width = 111
            Height = 17
            Caption = 'Cerrar Facturas'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 4
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'CERRAR'
            DataSource = DMAgrupacionFac.DSQMAgrupacionFac
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object ANITempo: TAnimate
            Left = 598
            Top = 55
            Width = 48
            Height = 45
            Active = False
            CommonAVI = aviFindComputer
            StopFrame = 8
            Visible = False
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 778
          Height = 134
          DataSource = DMAgrupacionFac.DSQMAgrupacionFac
          ControlEdit = CEMain
          CamposAOrdenar.Strings = (
            'CERRAR'
            'CODIGO'
            'FECHA'
            'REFERENCIA'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Width = 46
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 328
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REFERENCIA'
              Width = 256
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Visible = True
            end>
        end
      end
    end
    object PNLDetalle: TLFPanel
      Left = 2
      Top = 190
      Width = 786
      Height = 248
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object TBDetalle: TLFToolBar
        Left = 0
        Top = 0
        Width = 786
        Height = 22
        AutoSize = True
        EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        TabOrder = 0
        Separators = True
        object NavDetalle: THYMNavigator
          Left = 0
          Top = 0
          Width = 220
          Height = 22
          DataSource = DMAgrupacionFac.DSQMAgrupacionFacDet
          Flat = True
          ParentShowHint = False
          PopupMenu = CEDetallePMEdit
          ShowHint = True
          TabOrder = 0
          ModoDeSeguridad = True
          DelCaption = 'Informaci'#243'n'
          DelMessage = ' '#191' Borra el registro ? '
          EditaControl = DBGDetalle
          Exclusivo = True
          ControlEdit = CEDetalle
          OrdenAscendente = True
          InsertaUltimo = False
          OnClickAfterAdjust = NavDetalleClickAfterAdjust
        end
      end
      object DBGDetalle: TDBGridFind2000
        Left = 0
        Top = 22
        Width = 786
        Height = 226
        Align = alClient
        DataSource = DMAgrupacionFac.DSQMAgrupacionFacDet
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnColEnter = DBGDetalleColEnter
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
        CampoAOrdenarColor = clInfoBk
        CampoAOrdenarBitmaps = DMMain.ILOrdGrid
        CamposAOrdernar.Strings = (
          'CANAL'
          'CLIENTE'
          'CODIGO'
          'EJERCICIO'
          'EMPRESA'
          'FECHA'
          'FORMA_PAGO'
          'MONEDA'
          'REFERENCIA'
          'RIG'
          'SERIE'
          'TIPO'
          'TITULO'
          'TOTAL')
        ColumnasCheckBoxes.Strings = (
          'PROCESAR')
        ColumnasChecked.Strings = (
          '1')
        ColumnasNoChecked.Strings = (
          '0')
        MensajeNoExiste = False
        SalirSiVacio = False
        SalirSiNoExiste = False
        Posicion = tpCentrado
        CamposCalcAOrdenar.Strings = (
          'LIQUIDO_MONEDA')
        CamposCalcReferencia.Strings = (
          'TOTAL')
        OrdenMultiple = True
        Filtros = []
        Columns = <
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'EJERCICIO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ReadOnly = True
            Width = 40
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'CANAL'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ReadOnly = True
            Width = 32
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'SERIE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ReadOnly = True
            Width = 43
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'RIG'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ReadOnly = True
            Width = 55
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'MONEDA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ReadOnly = True
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'FORMA_PAGO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ReadOnly = True
            Width = 40
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'CLIENTE'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ReadOnly = True
            Width = 48
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'TITULO'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ReadOnly = True
            Width = 241
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'FECHA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ReadOnly = True
            Width = 72
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'LIQUIDO_MONEDA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ReadOnly = True
            Width = 82
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PROCESAR'
            Width = 31
            Visible = True
          end>
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 440
    Width = 790
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEDetalle
    Left = 508
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 544
    Top = 8
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    object AProcesarFacturas: TAction
      Category = 'Procesos'
      Caption = 'Procesar Facturas'
      Hint = 'Procesar Facturas'
      ImageIndex = 94
      OnExecute = AProcesarFacturasExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
  end
  object CEDetalle: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSFicha
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 585
    Top = 10
  end
  object CEDetallePMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 624
    Top = 8
    object CEDetalleMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEDetalleMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEDetalleMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEDetalleMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEDetalleMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEDetalleMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEDetalleMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEDetalleMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEDetalleMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEDetalleMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
