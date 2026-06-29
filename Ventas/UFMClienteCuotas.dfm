inherited FMClienteCuotas: TFMClienteCuotas
  Left = 444
  Top = 149
  Width = 845
  Height = 491
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = ' Cuotas a clientes'
  Constraints.MinHeight = 335
  Constraints.MinWidth = 845
  FormStyle = fsNormal
  PopupMenu = CEMainPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 835
    Height = 265
    inherited TBMain: TLFToolBar
      Width = 831
      inherited NavMain: THYMNavigator
        DataSource = DMClienteCuotas.DSQMCuotas
        Hints.Strings = ()
        InsertaControl = DBEFCliente
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        Width = 66
        DataSource = DMClienteCuotas.DSQMCuotas
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 294
      end
      inherited TbuttComp: TToolButton
        Left = 302
      end
    end
    inherited PCMain: TLFPageControl
      Width = 831
      Height = 235
      inherited TSFicha: TTabSheet
        object SBVerDoc: TSpeedButton [0]
          Left = 398
          Top = 75
          Width = 82
          Height = 21
          Hint = 'Doble click o Ctrl+Alt+R para ver el registro de IVA generado'
          GroupIndex = -1
          OnDblClick = SBVerDocDblClick
        end
        object SBACliente: TSpeedButton [1]
          Left = 188
          Top = 10
          Width = 311
          Height = 21
          Hint = 'Doble click o Ctrl+Alt+C para ver los datos del Cliente'
          GroupIndex = -1
          Caption = 'Ver Datos Cliente'
          OnDblClick = SBAClienteDblClick
        end
        object SBAProyecto: TSpeedButton [2]
          Left = 167
          Top = 32
          Width = 311
          Height = 21
          Hint = 'Doble click o Ctrl+Alt+C para ver los datos del Cliente'
          GroupIndex = -1
          Caption = 'Ver Datos Cliente'
          OnDblClick = SBAProyectoDblClick
        end
        inherited PEdit: TLFPanel
          Width = 823
          Height = 207
          object LPeriodicidad: TLFLabel [0]
            Left = 566
            Top = 144
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Periodicidad'
          end
          object LTipoDoc: TLFLabel [1]
            Left = 547
            Top = 100
            Width = 77
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo documento'
          end
          object LProxCuota: TLFLabel [2]
            Left = 525
            Top = 188
            Width = 99
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha pr'#243'xima cuota'
          end
          object LDias: TLFLabel [3]
            Left = 741
            Top = 144
            Width = 23
            Height = 13
            Alignment = taRightJustify
            Caption = 'D'#237'as'
          end
          object LFechaFinCuota: TLFLabel [4]
            Left = 545
            Top = 166
            Width = 79
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha fin cuotas'
          end
          object LLineaInicial: TLFLabel [5]
            Left = 566
            Top = 122
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cuota Inicial'
          end
          inherited G2KTableLoc: TG2KTBLoc
            Left = 17
            Top = 55
            Plan.Strings = (
              ' ')
            CamposADesplegar.Strings = (
              'CLIENTE'
              'CUOTA')
            DataSource = DMClienteCuotas.DSQMCuotas
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'VER_EMP_CLIENTES_CUOTAS'
            CampoNum = 'ID_CUOTA'
            CampoStr = 'NOMBRE_R_SOCIAL'
            Filtros = [obEmpresa, obCanal]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'CLIENTE'
              'CUOTA')
          end
          object LNotas: TLFLabel
            Left = 0
            Top = 100
            Width = 86
            Height = 13
            Alignment = taRightJustify
            Caption = 'Notas Documento'
          end
          object LProyecto: TLFLabel
            Left = 44
            Top = 57
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proyecto'
            FocusControl = EFProyecto
          end
          object LCliente: TLFLabel
            Left = 54
            Top = 34
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente'
          end
          object LBLCuota: TLFLabel
            Left = 517
            Top = 34
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cuota'
          end
          object LIdCuota: TLFLabel
            Left = 44
            Top = 12
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'ID Cuota'
          end
          object LSuReferenica: TLFLabel
            Left = 18
            Top = 78
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Su Referencia'
          end
          object DBCBVPeriodicidad: TDBComboBoxValue
            Left = 628
            Top = 140
            Width = 97
            Height = 21
            Style = csDropDownList
            DataField = 'PERIODICIDAD'
            DataSource = DMClienteCuotas.DSQMCuotas
            ItemHeight = 13
            Items.Strings = (
              'diaria'
              '1 mes'
              '2 meses'
              '3 meses'
              '4 meses'
              '5 meses'
              '6 meses'
              '7 meses'
              '8 meses'
              '9 meses'
              '10 meses'
              '11 meses'
              '12 meses')
            Values.Strings = (
              '0'
              '1'
              '2'
              '3'
              '4'
              '5'
              '6'
              '7'
              '8'
              '9'
              '10'
              '11'
              '12')
            TabOrder = 9
          end
          object GBUltCuota: TGroupBox
            Left = 629
            Top = 3
            Width = 188
            Height = 88
            Caption = ' '#218'ltima cuota facturada  '
            TabOrder = 6
            object LSerie: TLFLabel
              Left = 32
              Top = 21
              Width = 24
              Height = 13
              Alignment = taRightJustify
              Caption = 'Serie'
            end
            object LNumero: TLFLabel
              Left = 19
              Top = 42
              Width = 37
              Height = 13
              Alignment = taRightJustify
              Caption = 'N'#250'mero'
            end
            object LFecha: TLFLabel
              Left = 26
              Top = 64
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha'
            end
            object DBERig: TLFDbedit
              Left = 60
              Top = 38
              Width = 97
              Height = 21
              TabStop = False
              Color = clAqua
              DataField = 'RIG_DOC'
              DataSource = DMClienteCuotas.DSQMCuotas
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBESerie: TLFDbedit
              Left = 60
              Top = 16
              Width = 97
              Height = 21
              TabStop = False
              Color = clInfoBk
              DataField = 'SERIE_ULT_CUOTA'
              DataSource = DMClienteCuotas.DSQMCuotas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBDTPUltCuota: TLFDBDateEdit
              Left = 60
              Top = 60
              Width = 97
              Height = 21
              DataField = 'FECHA_ULT_CUOTA'
              DataSource = DMClienteCuotas.DSQMCuotas
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 2
            end
          end
          object DBCBTipoDoc: TDBComboBox
            Left = 628
            Top = 96
            Width = 45
            Height = 21
            Style = csDropDownList
            DataField = 'TIPO_DOC'
            DataSource = DMClienteCuotas.DSQMCuotas
            ItemHeight = 13
            Items.Strings = (
              'FAC'
              'ALB'
              'REC')
            TabOrder = 7
          end
          object DBCKSuplido: TLFDBCheckBox
            Left = 507
            Top = 76
            Width = 98
            Height = 17
            Caption = ' Suplido'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 5
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'SUPLIDO'
            DataSource = DMClienteCuotas.DSQMCuotas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCKAgrupado: TLFDBCheckBox
            Left = 507
            Top = 56
            Width = 98
            Height = 17
            Caption = ' Agrupa cuotas'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 4
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'AGRUPADA'
            DataSource = DMClienteCuotas.DSQMCuotas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBMNotas: TLFDBMemo
            Left = 90
            Top = 96
            Width = 409
            Height = 109
            Anchors = [akLeft, akTop, akBottom]
            DataField = 'NOTAS'
            DataSource = DMClienteCuotas.DSQMCuotas
            ScrollBars = ssVertical
            TabOrder = 3
          end
          object DBDTPProxCuota: TLFDBDateEdit
            Left = 628
            Top = 184
            Width = 97
            Height = 21
            TabStop = False
            DataField = 'FECHA_PROX_CUOTA'
            DataSource = DMClienteCuotas.DSQMCuotas
            ReadOnly = True
            CheckOnExit = True
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            NumGlyphs = 2
            ParentFont = False
            TabOrder = 12
          end
          object DBETitTipoDoc: TLFDbedit
            Left = 674
            Top = 96
            Width = 143
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMClienteCuotas.DSxTipoDoc
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 13
          end
          object DBSEPrimerPlazo: TDBSpinEdit
            Left = 768
            Top = 139
            Width = 49
            Height = 22
            MaxValue = 31
            MinValue = 0
            TabOrder = 10
            Value = 0
            DataField = 'DIAS'
            DataSource = DMClienteCuotas.DSQMCuotas
          end
          object DEFinCuota: TLFDBDateEdit
            Left = 628
            Top = 162
            Width = 97
            Height = 21
            DataField = 'FECHA_FIN_CUOTA'
            DataSource = DMClienteCuotas.DSQMCuotas
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 11
          end
          object DBELineaInicial: TLFDbedit
            Left = 628
            Top = 118
            Width = 97
            Height = 21
            DataField = 'LINEA_INICIAL'
            DataSource = DMClienteCuotas.DSQMCuotas
            TabOrder = 8
          end
          object EFProyecto: TLFDBEditFind2000
            Left = 90
            Top = 52
            Width = 64
            Height = 21
            AutoSelect = False
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'PROYECTO'
            DataSource = DMClienteCuotas.DSQMCuotas
            TabOrder = 1
            OnChange = EFProyectoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'EMP_PROYECTOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'PROYECTO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'proyecto')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETitProyecto: TLFEdit
            Left = 155
            Top = 52
            Width = 344
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 14
          end
          object DBEFCliente: TLFDBEditFind2000
            Left = 90
            Top = 30
            Width = 97
            Height = 21
            DataField = 'CLIENTE'
            DataSource = DMClienteCuotas.DSQMCuotas
            TabOrder = 0
            OnChange = DBEFClienteChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CLIENTES_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CLIENTE'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CLIENTE')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETitCliente: TLFEdit
            Left = 188
            Top = 30
            Width = 311
            Height = 21
            AutoSize = False
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 15
          end
          object DBECuota: TLFDbedit
            Left = 550
            Top = 30
            Width = 38
            Height = 21
            Color = clInfoBk
            DataField = 'CUOTA'
            DataSource = DMClienteCuotas.DSQMCuotas
            ReadOnly = True
            TabOrder = 16
          end
          object DBEIdCuota: TLFDbedit
            Left = 90
            Top = 8
            Width = 64
            Height = 21
            Color = clInfoBk
            DataField = 'ID_CUOTA'
            DataSource = DMClienteCuotas.DSQMCuotas
            ReadOnly = True
            TabOrder = 17
          end
          object DBESuReferencia: TLFDbedit
            Left = 90
            Top = 74
            Width = 409
            Height = 21
            DataField = 'SU_REFERENCIA'
            DataSource = DMClienteCuotas.DSQMCuotas
            TabOrder = 2
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 823
          Height = 207
          DataSource = DMClienteCuotas.DSQMCuotas
          CamposChecked.Strings = (
            'SUPLIDO'
            'AGRUPADA')
          CamposAOrdenar.Strings = (
            'AGRUPADA'
            'ARTICULO'
            'CLIENTE'
            'DESCRIPCION'
            'DESCUENTO'
            'FECHA_ULT_CUOTA'
            'IMPORTE'
            'PERIODICIDAD'
            'SERIE_ULT_CUOTA'
            'TIPO_DOC')
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_CUOTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLIENTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE_R_SOCIAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_ULT_CUOTA'
              Width = 77
              Visible = True
            end>
        end
      end
      object TSObservaciones: TTabSheet
        Caption = '&Notas'
        ImageIndex = 2
        object PNLNotas: TLFPanel
          Left = 0
          Top = 24
          Width = 823
          Height = 183
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object DBREObservaciones: TDBRichEdit
            Left = 0
            Top = 24
            Width = 823
            Height = 159
            Align = alClient
            DataField = 'OBSERVACIONES'
            DataSource = DMClienteCuotas.DSQMCuotas
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            ScrollBars = ssVertical
            TabOrder = 0
            OnEnter = DBREObservacionesEnter
            OnSelectionChange = DBREObservacionesSelectionChange
          end
          object TBObservaciones: TLFToolBar
            Left = 0
            Top = 0
            Width = 823
            Height = 24
            AutoSize = True
            EdgeInner = esNone
            EdgeOuter = esNone
            Images = DMMain.ToolbarImages
            TabOrder = 1
            Separators = True
            object btnTButtNegrita: TToolButton
              Left = 0
              Top = 2
              Action = FMain.RichEditBold1
            end
            object btnTButtCursiva: TToolButton
              Left = 23
              Top = 2
              Action = FMain.RichEditItalic1
            end
            object btnTButtSubrayado: TToolButton
              Left = 46
              Top = 2
              Action = FMain.RichEditUnderline1
            end
            object btnTButtSep4: TToolButton
              Left = 69
              Top = 2
              Width = 8
              Style = tbsSeparator
              Visible = False
            end
            object btnTButtAlinIzq: TToolButton
              Left = 77
              Top = 2
              Action = FMain.RichEditAlignLeft1
            end
            object btnTButtAlinCentr: TToolButton
              Left = 100
              Top = 2
              Action = FMain.RichEditAlignCenter1
            end
            object btnTButtAlinDer: TToolButton
              Left = 123
              Top = 2
              Action = FMain.RichEditAlignRight1
            end
            object btnTButtSep5: TToolButton
              Left = 146
              Top = 2
              Width = 8
              Style = tbsSeparator
              Visible = False
            end
            object btnTButtBullet: TToolButton
              Left = 154
              Top = 2
              Action = FMain.RichEditBullets1
            end
            object btnTButtSep3: TToolButton
              Left = 177
              Top = 2
              Width = 8
              Style = tbsSeparator
              Visible = False
            end
            object CBFontName: TLFComboBox
              Left = 185
              Top = 2
              Width = 192
              Height = 21
              ItemHeight = 13
              TabOrder = 1
              Text = 'Nombre de la fuente'
              OnChange = CBFontNameChange
            end
            object btnTButtSep6: TToolButton
              Left = 377
              Top = 2
              Width = 8
              Style = tbsSeparator
            end
            object PNLTamano: TLFPanel
              Left = 385
              Top = 2
              Width = 40
              Height = 22
              TabOrder = 0
              object EFontSize: TLFEdit
                Left = 1
                Top = 0
                Width = 24
                Height = 21
                TabOrder = 0
                Text = '0'
                OnChange = EFontSizeChange
              end
              object UDFontSize: TUpDown
                Left = 25
                Top = 0
                Width = 15
                Height = 21
                Associate = EFontSize
                Min = 0
                Position = 0
                TabOrder = 1
                Wrap = True
              end
            end
          end
        end
        object TBNotas: TLFToolBar
          Left = 0
          Top = 0
          Width = 823
          Height = 24
          AutoSize = True
          Caption = 'TBNotas'
          EdgeInner = esNone
          EdgeOuter = esNone
          TabOrder = 1
          Separators = True
          object NavNotas: THYMNavigator
            Left = 0
            Top = 2
            Width = 88
            Height = 22
            DataSource = DMClienteCuotas.DSQMCuotas
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEMainPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBREObservaciones
            Exclusivo = True
            ControlEdit = CENotas
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 265
    Width = 835
    Height = 173
    inherited TBDetalle: TLFToolBar
      Width = 835
      inherited NavDetalle: THYMNavigator
        DataSource = DMClienteCuotas.DSCuotasDetalle
        Hints.Strings = ()
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 835
      Height = 151
      DataSource = DMClienteCuotas.DSCuotasDetalle
      PopupMenu = nil
      Campos.Strings = (
        'ARTICULO')
      CamposAMostrar.Strings = (
        'ARTICULO'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0')
      CamposADevolver.Strings = (
        '')
      CamposDesplegar.Strings = (
        '1')
      Numericos.Strings = (
        'ARTICULO')
      Tablas.Strings = (
        'VER_ARTICULOS_EF')
      Acciones.Strings = (
        '')
      Titulos.Strings = (
        'TITULO')
      OnBusqueda = DBGFDetalleBusqueda
      Planes.Strings = (
        '')
      OrdenadosPor.Strings = (
        '')
      Columns = <
        item
          Expanded = False
          FieldName = 'ARTICULO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPCION'
          Width = 269
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IMPORTE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCUENTO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'P_COSTE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDAD_FOMENTO'
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 438
    Width = 835
  end
  inherited CEMain: TControlEdit
    Left = 768
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 804
    inherited CEMainMibuscar: TMenuItem
      Enabled = False
      Visible = False
    end
    inherited CEMainMiimprime: TMenuItem
      Enabled = False
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMicopy: TMenuItem
      Enabled = False
      Visible = True
    end
    inherited CEMainMicut: TMenuItem
      Enabled = False
      Visible = True
    end
    inherited CEMainMipaste: TMenuItem
      Enabled = False
      Visible = True
    end
    inherited CEMainMisalir: TMenuItem
      Enabled = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 768
    Top = 0
    object LFCategoryAction4: TLFCategoryAction
      Category = 'Listados;Contrato'
      Caption = 'Contrato'
      Hint = 'Listado de Contrato'
      ImageIndex = 14
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AListadoCuotas: TAction
      Category = 'Listados'
      Caption = 'Listado de cuotas a clientes'
      Hint = 'Listado de cuotas a clientes'
      ImageIndex = 14
      OnExecute = AListadoCuotasExecute
    end
    object aListadoContrato: TAction
      Category = 'Listados;Contrato'
      Caption = 'Listado de contrato del mantenimiento/cuota'
      Hint = 'Listado de contrato del mantenimiento o cuota'
      ImageIndex = 14
      OnExecute = aListadoContratoExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos'
      ImageIndex = 59
    end
    object AAdjuntosCuota: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos de la Cuota'
      ImageIndex = 59
      OnExecute = AAdjuntosCuotaExecute
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      Hint = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
    object AConfListadoCuotas: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n de Listado de cuotas a clientes'
      Hint = 'Listado de cuotas a clientes'
      ImageIndex = 77
      OnExecute = AConfListadoCuotasExecute
    end
    object AConfContrato: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de contrato del mantenimiento/cuota'
      Hint = 'Listado de contrato del mantenimiento o cuota'
      ImageIndex = 77
      OnExecute = AConfContratoExecute
    end
    object aListadoContratoMAIL: TAction
      Category = 'Listados;Contrato'
      Caption = 'Listado de contrato del mantenimiento/cuota por e-mail'
      Hint = 
        'Listado de contrato del mantenimiento o cuota por correo electr'#243 +
        'nico'
      ImageIndex = 34
      OnExecute = aListadoContratoMAILExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 800
    Top = 0
  end
  inherited CEDetalle: TControlEdit
    Left = 766
    Top = 104
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 802
    Top = 106
  end
  object CENotas: TControlEdit
    DataSource = DMClienteCuotas.DSQMCuotas
    FichaEdicion = TSObservaciones
    FichaExclusiva = TSObservaciones
    PanelEdicion = PNLNotas
    SubComplementario = ALMain
    PopUpMenu = CEMainPMEdit
    Teclas = DMMain.Teclas
    Left = 768
    Top = 68
  end
end
