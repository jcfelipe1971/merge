inherited FMFormasPago: TFMFormasPago
  Left = 527
  Top = 223
  Height = 375
  HelpContext = 288
  ActiveControl = NavMain
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Formas de Pago'
  PopupMenu = CEIdiomasPMEdit
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 322
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        DataSource = DMFormasPago.DSQMFormaPago
        Hints.Strings = ()
        EditaControl = DBETipo
        InsertaControl = DBETipo
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        Busca01 = DBETipo
        Busca02 = DBETitulo
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 288
      end
      inherited TbuttComp: TToolButton
        Left = 296
        Hint = 'Regenera las Formas de Pago'
        ImageIndex = 39
      end
    end
    inherited PCMain: TLFPageControl
      Height = 292
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Height = 264
          inherited G2KTableLoc: TG2KTBLoc
            Left = 48
            Top = 10
            DataSource = DMFormasPago.DSQMFormaPago
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_FORMAS_PAGO'
            CampoNum = 'FORMA'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'FORMA')
          end
          object LBLCodigo: TLFLabel
            Left = 34
            Top = 8
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo'
            FocusControl = DBETipo
          end
          object LBLTitulo: TLFLabel
            Left = 39
            Top = 30
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
            FocusControl = DBETitulo
          end
          object LBLTipoEfecto: TLFLabel
            Left = 12
            Top = 96
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Efecto'
          end
          object LBLPlazos: TLFLabel
            Left = 36
            Top = 73
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Plazos'
          end
          object LBLPrimerPlazo: TLFLabel
            Left = 141
            Top = 73
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Dias 1er Plazo'
          end
          object LBLRestoPlazos: TLFLabel
            Left = 275
            Top = 73
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Resto Plazos'
          end
          object LBLDatosAMostrar: TLFLabel
            Left = 78
            Top = 240
            Width = 175
            Height = 13
            Alignment = taRightJustify
            Caption = 'Datos Bancarios a mostrar en Ventas'
          end
          object LTituloLargo: TLFLabel
            Left = 9
            Top = 52
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo Largo'
            FocusControl = DBETituloLargo
          end
          object DBETipo: TLFDbedit
            Left = 73
            Top = 4
            Width = 47
            Height = 21
            CharCase = ecUpperCase
            DataField = 'FORMA'
            DataSource = DMFormasPago.DSQMFormaPago
            TabOrder = 0
          end
          object DBCHKActivo: TLFDBCheckBox
            Left = 136
            Top = 6
            Width = 63
            Height = 17
            Caption = '&Remesar'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 1
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'REMESAR'
            DataSource = DMFormasPago.DSQMFormaPago
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBETitulo: TLFDbedit
            Left = 73
            Top = 26
            Width = 326
            Height = 21
            DataField = 'TITULO'
            DataSource = DMFormasPago.DSQMFormaPago
            TabOrder = 4
          end
          object DBCHKProntoPago: TLFDBCheckBox
            Left = 208
            Top = 6
            Width = 85
            Height = 17
            Caption = '&Pronto Pago'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 2
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'PRONTO_PAGO'
            DataSource = DMFormasPago.DSQMFormaPago
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBSEPlazos: TDBSpinEdit
            Left = 73
            Top = 70
            Width = 57
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 6
            Value = 0
            DataField = 'PLAZOS'
            DataSource = DMFormasPago.DSQMFormaPago
          end
          object DBSEPrimerPlazo: TDBSpinEdit
            Left = 214
            Top = 70
            Width = 57
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 7
            Value = 0
            DataField = 'DIAS_1_PLAZO'
            DataSource = DMFormasPago.DSQMFormaPago
          end
          object DBSERestoPlazos: TDBSpinEdit
            Left = 342
            Top = 70
            Width = 57
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 8
            Value = 0
            DataField = 'DIAS_E_PLAZOS'
            DataSource = DMFormasPago.DSQMFormaPago
          end
          object DBEFTipoEfecto: TLFDBEditFind2000
            Left = 73
            Top = 93
            Width = 45
            Height = 21
            DataField = 'TIPO_EFECTO'
            DataSource = DMFormasPago.DSQMFormaPago
            TabOrder = 9
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TIPO_EFECTO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object DBETitTipoEfecto: TLFDbedit
            Left = 119
            Top = 93
            Width = 280
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMFormasPago.DSxTipoEfecto
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 10
          end
          object DBCBAceptar: TLFDBCheckBox
            Left = 78
            Top = 135
            Width = 300
            Height = 17
            Caption = '&Aceptaci'#243'n'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 12
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACEPTAR'
            DataSource = DMFormasPago.DSQMFormaPago
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBPagoAutomatico: TLFDBCheckBox
            Left = 297
            Top = 6
            Width = 104
            Height = 17
            Caption = 'Pago &Autom'#225'tico'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 3
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'PAGO_AUTOMATICO'
            DataSource = DMFormasPago.DSQMFormaPago
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBVDatosBancarios: TDBComboBoxValue
            Left = 260
            Top = 236
            Width = 139
            Height = 21
            Style = csDropDownList
            DataField = 'DATOS_BANCARIOS'
            DataSource = DMFormasPago.DSQMFormaPago
            ItemHeight = 13
            Items.Strings = (
              'Ninguno'
              'Datos del Cliente'
              'Datos de la Empresa')
            Values.Strings = (
              '0'
              '1'
              '2')
            TabOrder = 17
          end
          object DBCBHeredaFin: TLFDBCheckBox
            Left = 78
            Top = 155
            Width = 300
            Height = 17
            Caption = 'Hereda Financiaci'#243'n'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 13
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'HEREDA_FINANCIACION'
            DataSource = DMFormasPago.DSQMFormaPago
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBOrdenPago: TLFDBCheckBox
            Left = 78
            Top = 174
            Width = 300
            Height = 17
            Caption = 'Ordenes de Pago'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 14
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ORDENAR_PAGO'
            DataSource = DMFormasPago.DSQMFormaPago
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCHKMesN: TLFDBCheckBox
            Left = 78
            Top = 116
            Width = 300
            Height = 17
            Caption = 'Pago en Meses Naturales'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 11
            TabStop = True
            Alignment = taLeftJustify
            OnChange = DBCHKMesNClick
            DataField = 'MES_NATURAL'
            DataSource = DMFormasPago.DSQMFormaPago
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBPedirDetallesDePago: TLFDBCheckBox
            Left = 78
            Top = 194
            Width = 300
            Height = 17
            Caption = 'Pedir Detalles de Pago'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 15
            TabStop = True
            Alignment = taLeftJustify
            OnChange = DBCHKMesNClick
            DataField = 'PEDIR_DETALLE_PAGO'
            DataSource = DMFormasPago.DSQMFormaPago
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBETituloLargo: TLFDbedit
            Left = 73
            Top = 48
            Width = 326
            Height = 21
            DataField = 'TITULO_LARGO'
            DataSource = DMFormasPago.DSQMFormaPago
            TabOrder = 5
            OnEnter = DBETituloLargoEnter
          end
          object DBCBSinRecibos: TLFDBCheckBox
            Left = 78
            Top = 214
            Width = 300
            Height = 17
            Caption = 'No generar recibos'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 16
            TabStop = True
            Alignment = taLeftJustify
            OnChange = DBCHKMesNClick
            DataField = 'SIN_RECIBOS'
            DataSource = DMFormasPago.DSQMFormaPago
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      object TSIdiomas: TTabSheet [1]
        Caption = '&Idiomas'
        ImageIndex = 1
        OnShow = TSIdiomasShow
        object TBIdiomas: TLFToolBar
          Left = 0
          Top = 0
          Width = 490
          Height = 25
          ButtonHeight = 21
          EdgeBorders = []
          TabOrder = 0
          Separators = True
          object NavIdiomas: THYMNavigator
            Left = 0
            Top = 2
            Width = 240
            Height = 21
            DataSource = DMFormasPago.DSQMFormasPagoIdioma
            Flat = True
            ParentShowHint = False
            PopupMenu = CEIdiomasPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFIdiomas
            InsertaControl = DBGFIdiomas
            Exclusivo = True
            ControlEdit = CEIdiomas
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object ToolButton1: TToolButton
            Left = 240
            Top = 2
            Width = 10
            Style = tbsSeparator
          end
          object DBETITFP: TLFDbedit
            Left = 250
            Top = 2
            Width = 239
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMFormasPago.DSQMFormaPago
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
        end
        object PNIdiomas: TLFPanel
          Left = 0
          Top = 25
          Width = 490
          Height = 239
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBGFIdiomas: TDBGridFind2000
            Left = 0
            Top = 0
            Width = 490
            Height = 239
            Align = alClient
            DataSource = DMFormasPago.DSQMFormasPagoIdioma
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
              'IDIOMA')
            CamposAMostrar.Strings = (
              'IDIOMA'
              '0')
            CamposAMostrarAnchos.Strings = (
              '0')
            CamposADevolver.Strings = (
              '')
            CamposDesplegar.Strings = (
              '1')
            CampoAOrdenarColor = clInfoBk
            MensajeNoExiste = False
            Numericos.Strings = (
              'IDIOMA')
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tablas.Strings = (
              'SYS_IDIOMAS')
            Acciones.Strings = (
              '')
            Titulos.Strings = (
              'TITULO')
            Posicion = tpCentrado
            OnBusqueda = DBGFIdiomasBusqueda
            Planes.Strings = (
              '')
            OrdenMultiple = True
            Filtros = []
            Columns = <
              item
                Expanded = False
                FieldName = 'IDIOMA'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TITULO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TITULO_LARGO'
                Visible = True
              end>
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Height = 264
          DataSource = DMFormasPago.DSQMFormaPago
          CamposAMarcar.Strings = (
            'ACEPTAR'
            'HEREDA_FINANCIACION'
            'MES_NATURAL'
            'ORDENAR_PAGO'
            'PAGO_AUTOMATICO'
            'PEDIR_DETALLE_PAGO'
            'PRONTO_PAGO'
            'REMESAR'
            'SIN_RECIBOS')
          CamposChecked.Strings = (
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1')
          CamposNoChecked.Strings = (
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0')
          CamposAOrdenar.Strings = (
            'DIAS_1_PLAZO'
            'DIAS_E_PLAZOS'
            'FORMA'
            'PLAZOS'
            'REMESAR'
            'TIPO_EFECTO'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'FORMA'
              Width = 59
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 249
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PLAZOS'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIAS_1_PLAZO'
              Width = 72
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 322
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEIdiomas
    Left = 348
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 378
    Top = 4
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 426
    Top = 6
  end
  inherited FSMain: TLFFibFormStorage
    Left = 466
    Top = 6
  end
  object CEIdiomas: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSIdiomas
    FichaExclusiva = TSIdiomas
    PopUpMenu = CEIdiomasPMEdit
    Teclas = DMMain.Teclas
    Left = 352
    Top = 64
  end
  object CEIdiomasPMEdit: TPopUpTeclas
    Left = 400
    Top = 64
    object CEIdiomasMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEIdiomasMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEIdiomasMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEIdiomasMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEIdiomasMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEIdiomasMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEIdiomasMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEIdiomasMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEIdiomasMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEIdiomasMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
