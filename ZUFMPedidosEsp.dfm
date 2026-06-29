inherited ZFMPedidosEsp: TZFMPedidosEsp
  Left = 316
  Top = 158
  Width = 916
  Height = 658
  ActiveControl = DBCBMontado
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Pedido Especial de Cliente'
  OldCreateOrder = False
  PopupMenu = CEImagenesPMEdit
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 681
    Height = 605
    Align = alLeft
    TabOrder = 2
    object SBACliente: TSpeedButton [0]
      Left = 95
      Top = 11
      Width = 180
      Height = 21
      Action = AACliente
      OnDblClick = SBAClienteDblClick
    end
    object SBAPedido: TSpeedButton [1]
      Left = 410
      Top = 55
      Width = 51
      Height = 22
      Action = AAPedido
    end
    inherited TBMain: TLFToolBar
      Width = 677
      TabOrder = 3
      inherited NavMain: THYMNavigator
        Width = 132
        DataSource = ZDMPedidosEsp.DSPedidosCab
        VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        EditaControl = DBEFCliente
        InsertaControl = EFSerie
      end
      inherited TSepNav: TToolButton
        Left = 132
      end
      inherited EPMain: THYMEditPanel
        Left = 140
        Width = 29
        DataSource = ZDMPedidosEsp.DSPedidosCab
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 169
      end
      inherited TbuttComp: TToolButton
        Left = 177
      end
      object TSep1: TToolButton
        Left = 200
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtCrearPedido: TToolButton
        Left = 208
        Top = 0
        Hint = 'Crear Pedido y Orden de Producci'#243'n'
        Caption = 'Crear Pedido y Orden de Producci'#243'n'
        ImageIndex = 62
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtCrearPedidoClick
      end
      object TSep3: TToolButton
        Left = 231
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtInformes: TToolButton
        Left = 239
        Top = 0
        Caption = 'Informes'
        DropdownMenu = PMInformes
        ImageIndex = 14
        Style = tbsDropDown
      end
    end
    object PnlCab: TLFPanel
      Left = 2
      Top = 28
      Width = 677
      Height = 109
      Align = alTop
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 0
      object LblEstado: TLFLabel
        Left = 293
        Top = 13
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = 'Estado'
      end
      object LblDiasServir: TLFLabel
        Left = 264
        Top = 78
        Width = 60
        Height = 13
        Alignment = taRightJustify
        Caption = 'D'#237'as a servir'
      end
      object LblFechaPrev: TLFLabel
        Left = 269
        Top = 57
        Width = 58
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha Prev.'
      end
      object LblFecha: TLFLabel
        Left = 295
        Top = 35
        Width = 30
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha'
      end
      object LblSuRef: TLFLabel
        Left = 15
        Top = 56
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = 'Su Ref.'
      end
      object LblCliente: TLFLabel
        Left = 19
        Top = 33
        Width = 32
        Height = 13
        Alignment = taRightJustify
        Caption = 'Cliente'
      end
      object LblNotas: TLFLabel
        Left = 429
        Top = 12
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Notas'
      end
      object LblPedido: TLFLabel
        Left = 384
        Top = 78
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = 'Pedido'
      end
      object LBLSerie: TLFLabel
        Left = 27
        Top = 12
        Width = 24
        Height = 13
        Alignment = taRightJustify
        Caption = 'Serie'
        Layout = tlCenter
      end
      object LDiasTransporte: TLFLabel
        Left = 7
        Top = 78
        Width = 62
        Height = 13
        Alignment = taRightJustify
        Caption = 'D'#237'as Transp.'
      end
      object EEstado: TLFEdit
        Left = 328
        Top = 8
        Width = 90
        Height = 21
        TabStop = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
        Text = 'EEstado'
      end
      object DBESuRef: TLFDbedit
        Left = 55
        Top = 52
        Width = 203
        Height = 21
        DataField = 'SU_REFERENCIA'
        DataSource = ZDMPedidosEsp.DSPedidosCab
        TabOrder = 2
      end
      object DBEFCliente: TLFDBEditFind2000
        Left = 55
        Top = 30
        Width = 47
        Height = 21
        DataField = 'CLIENTE'
        DataSource = ZDMPedidosEsp.DSPedidosCab
        TabOrder = 1
        OnChange = DBEFClienteChange
        Accion = ANewCliente
        AutoCambiarFoco = False
        Base_de_datos = DMMain.DataBase
        BuscarNums = False
        Tabla_a_buscar = 'ver_clientes_ef'
        Tabla_asociada.DesplegarBusqueda = False
        CampoNum = 'CLIENTE'
        CampoStr = 'NOMBRE_COMERCIAL'
        ReemplazarCaracter = True
        SalirSiNoExiste = False
        SalirSiVacio = False
        OrdenadoPor.Strings = (
          'CLIENTE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object DBEDiasServir: TLFDbedit
        Left = 328
        Top = 74
        Width = 44
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'DIAS_SERVIR'
        DataSource = ZDMPedidosEsp.DSPedidosCab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
      object DBDEFechaPrev: TLFDBDateEdit
        Left = 328
        Top = 52
        Width = 90
        Height = 21
        DataField = 'FECHA_ENTREGA_PREV'
        DataSource = ZDMPedidosEsp.DSPedidosCab
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 4
      end
      object DBDEFecha: TLFDBDateEdit
        Left = 328
        Top = 30
        Width = 90
        Height = 21
        DataField = 'FECHA'
        DataSource = ZDMPedidosEsp.DSPedidosCab
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 3
      end
      object DescCliente: TLFHYDBDescription
        Left = 103
        Top = 30
        Width = 170
        Height = 21
        Color = clInfoBk
        DataSource = ZDMPedidosEsp.DSPedidosCab
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 7
        OnDblClick = AAClienteExecute
        Tabla_a_buscar = 'VER_CLIENTES_EMPRESA'
        Campo_Descripcion = 'NOMBRE_COMERCIAL'
        Base_de_datos = DMMain.DataBase
        CamposWhereOrigen.Strings = (
          'CLIENTE'
          'EMPRESA')
        CamposWhereTabla.Strings = (
          'CLIENTE'
          'EMPRESA')
      end
      object DBMNotas: TLFDBMemo
        Left = 461
        Top = 8
        Width = 210
        Height = 62
        DataField = 'NOTAS'
        DataSource = ZDMPedidosEsp.DSPedidosCab
        ScrollBars = ssVertical
        TabOrder = 8
      end
      object DBEPedido: TLFDbedit
        Left = 421
        Top = 74
        Width = 68
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'RIG_D'
        DataSource = ZDMPedidosEsp.DSPedidosCab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
        OnDblClick = AAPedidoExecute
      end
      object EFSerie: TLFDBEditFind2000
        Left = 55
        Top = 8
        Width = 47
        Height = 21
        DataField = 'SERIE_D'
        DataSource = ZDMPedidosEsp.DSPedidosCab
        TabOrder = 0
        OnChange = EFSerieChange
        AutoCambiarFoco = False
        Base_de_datos = DMMain.DataBase
        BuscarNums = False
        Tabla_a_buscar = 'VER_CANALES_SERIES'
        Tabla_asociada.DesplegarBusqueda = False
        CampoNum = 'SERIE'
        CampoStr = 'TITULO'
        ReemplazarCaracter = True
        SalirSiNoExiste = False
        SalirSiVacio = False
        OrdenadoPor.Strings = (
          'SERIE')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object ETitSerie: TLFEdit
        Left = 103
        Top = 8
        Width = 170
        Height = 21
        TabStop = False
        AutoSize = False
        Color = clInfoBk
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
      object EDiasTransporte: TLFEdit
        Left = 73
        Top = 74
        Width = 35
        Height = 21
        Hint = 'Dias de entrega del cliente'
        TabStop = False
        AutoSize = False
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 11
      end
      object ETituloTransportista: TLFEdit
        Left = 109
        Top = 74
        Width = 149
        Height = 21
        TabStop = False
        AutoSize = False
        Color = clInfoBk
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 12
      end
    end
    object PnlTipo: TLFPanel
      Left = 2
      Top = 137
      Width = 677
      Height = 466
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object PCModelosArt: TLFPageControl
        Left = 0
        Top = 0
        Width = 677
        Height = 466
        ActivePage = TSProva
        Align = alClient
        OwnerDraw = True
        TabIndex = 0
        TabOrder = 0
        OnResize = PCModelosArtResize
        TabActiveColor = clWhite
        TabInactiveColor = 14936298
        object TSProva: TTabSheet
          Caption = 'TSProva'
          OnShow = TSPestanyaShow
          object PNLProva: TLFPanel
            Left = 0
            Top = 0
            Width = 669
            Height = 88
            Align = alTop
            BevelOuter = bvNone
            Ctl3D = True
            ParentCtl3D = False
            TabOrder = 0
            object LTipoArticulo: TLFLabel
              Left = 4
              Top = 5
              Width = 61
              Height = 13
              Caption = 'Tipo Art'#237'culo'
            end
            object LLacado: TLFLabel
              Left = 29
              Top = 46
              Width = 36
              Height = 13
              Caption = 'Lacado'
            end
            object LCantidad: TLFLabel
              Left = 133
              Top = 46
              Width = 42
              Height = 13
              Caption = 'Cantidad'
            end
            object LModelo: TLFLabel
              Left = 140
              Top = 5
              Width = 35
              Height = 13
              Caption = 'Modelo'
            end
            object LSubtipo: TLFLabel
              Left = 139
              Top = 25
              Width = 36
              Height = 13
              Caption = 'Subtipo'
            end
            object LTipo: TLFLabel
              Left = 44
              Top = 25
              Width = 21
              Height = 13
              Caption = 'Tipo'
            end
            object DBETipoArticulo: TLFDbedit
              Left = 70
              Top = 1
              Width = 41
              Height = 21
              Color = clInfoBk
              DataField = 'TIPO_ARTICULO_TYC'
              DataSource = ZDMPedidosEsp.DSPedidosTipo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object DBELacado: TLFDbedit
              Left = 70
              Top = 43
              Width = 41
              Height = 21
              Color = clInfoBk
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
            object DBEModelo: TLFDbedit
              Left = 180
              Top = 1
              Width = 41
              Height = 21
              Color = clInfoBk
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object DBECantidad: TLFDbedit
              Left = 180
              Top = 43
              Width = 41
              Height = 21
              Color = clInfoBk
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
            object ButtElimina: TBitBtn
              Left = 542
              Top = 2
              Width = 125
              Height = 25
              Caption = 'Eliminar Pesta'#241'a'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 4
              OnClick = ButtEliminaClick
            end
            object ScrBImagen: TScrollBox
              Left = 238
              Top = 3
              Width = 66
              Height = 59
              BevelOuter = bvNone
              BorderStyle = bsNone
              TabOrder = 5
              object Imagen: TImage
                Left = 0
                Top = 0
                Width = 66
                Height = 59
                Align = alClient
                AutoSize = True
                IncrementalDisplay = True
                Stretch = True
              end
            end
            object DBESubtipo: TLFDbedit
              Left = 180
              Top = 22
              Width = 41
              Height = 21
              Color = clInfoBk
              DataSource = ZDMPedidosEsp.DSPedidosTipo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 6
            end
            object DBETipo: TLFDbedit
              Left = 70
              Top = 22
              Width = 41
              Height = 21
              Color = clInfoBk
              DataSource = ZDMPedidosEsp.DSPedidosTipo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 7
            end
            object PNLAccionesDBG: TLFPanel
              Left = 0
              Top = 69
              Width = 669
              Height = 19
              Align = alBottom
              BevelOuter = bvNone
              TabOrder = 8
              object LBorrarLineaSup: TLFLabel
                Left = 558
                Top = 2
                Width = 59
                Height = 13
                Caption = 'Borrar L'#237'nea'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsUnderline]
                ParentFont = False
                OnClick = LblBorraClick
              end
              object LIrAlPrimeroSup: TLFLabel
                Left = 197
                Top = 2
                Width = 54
                Height = 13
                Caption = 'Ir al primero'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsUnderline]
                ParentFont = False
                OnClick = LblInicioClick
              end
              object LGuardarCambiosSup: TLFLabel
                Left = 99
                Top = 2
                Width = 81
                Height = 13
                Caption = 'Guardar Cambios'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsUnderline]
                ParentFont = False
                OnClick = LblGuardaClick
              end
              object LNuevaLineaSup: TLFLabel
                Left = 19
                Top = 2
                Width = 63
                Height = 13
                Caption = 'Nueva L'#237'nea'
                FocusControl = ButtAnyadir
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsUnderline]
                ParentFont = False
                OnClick = LblNuevoClick
              end
              object LEditarLineaSup: TLFLabel
                Left = 111
                Top = 2
                Width = 58
                Height = 13
                Caption = 'Editar L'#237'nea'
                FocusControl = ButtAnyadir
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsUnderline]
                ParentFont = False
                OnClick = LblEditaClick
              end
              object LFNotasB: TLFLabel
                Left = 312
                Top = 2
                Width = 59
                Height = 13
                Caption = 'A'#241'adir notas'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlue
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsUnderline]
                ParentFont = False
                OnClick = LFNotasBClick
              end
            end
            object DBMNotasPed: TLFDBMemo
              Left = 324
              Top = 2
              Width = 210
              Height = 62
              DataField = 'NOTAS'
              DataSource = ZDMPedidosEsp.DSPedidosTipo
              ScrollBars = ssVertical
              TabOrder = 9
            end
          end
          object DBCGProva: TLFDBCtrlGrid
            Left = 0
            Top = 109
            Width = 669
            Height = 329
            Align = alClient
            ColCount = 1
            DataSource = ZDMPedidosEsp.DSPedidosDet
            PanelBorder = gbNone
            PanelHeight = 164
            PanelWidth = 653
            TabOrder = 1
            RowCount = 2
            SelectedColor = clSilver
            OnPaintPanel = DBCGPaintPanel
            object LblProva: TLFLabel
              Left = 28
              Top = 6
              Width = 28
              Height = 13
              Alignment = taRightJustify
              Caption = 'Lineal'
            end
            object LSalida: TLFLabel
              Left = 27
              Top = 27
              Width = 29
              Height = 13
              Alignment = taRightJustify
              Caption = 'Salida'
            end
            object LLona: TLFLabel
              Left = 31
              Top = 150
              Width = 24
              Height = 13
              Alignment = taRightJustify
              Caption = 'Lona'
            end
            object LCantidadDBG: TLFLabel
              Left = 111
              Top = 6
              Width = 42
              Height = 13
              Alignment = taRightJustify
              Caption = 'Cantidad'
            end
            object LIrAlPrimero: TLFLabel
              Left = 181
              Top = 168
              Width = 54
              Height = 13
              Caption = 'Ir al primero'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = LblInicioClick
            end
            object LBorrarLinea: TLFLabel
              Left = 563
              Top = 168
              Width = 59
              Height = 13
              Caption = 'Borrar L'#237'nea'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = LblBorraClick
            end
            object LNuevaLinea: TLFLabel
              Left = 19
              Top = 168
              Width = 63
              Height = 13
              Caption = 'Nueva L'#237'nea'
              FocusControl = ButtAnyadir
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = LblNuevoClick
            end
            object LLacadoGrid: TLFLabel
              Left = 117
              Top = 27
              Width = 36
              Height = 13
              Alignment = taRightJustify
              Caption = 'Lacado'
            end
            object LAltura: TLFLabel
              Left = 29
              Top = 49
              Width = 27
              Height = 13
              Alignment = taRightJustify
              Caption = 'Altura'
            end
            object LManivela: TLFLabel
              Left = 240
              Top = 6
              Width = 43
              Height = 13
              Alignment = taRightJustify
              Caption = 'Manivela'
            end
            object LEmisor: TLFLabel
              Left = 252
              Top = 27
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = 'Emisor'
              Visible = False
            end
            object LMontaje: TLFLabel
              Left = 245
              Top = 49
              Width = 38
              Height = 13
              Alignment = taRightJustify
              Caption = 'Montaje'
            end
            object LColocacion: TLFLabel
              Left = 347
              Top = 72
              Width = 53
              Height = 13
              Alignment = taRightJustify
              Caption = 'Colocaci'#243'n'
            end
            object LTejadillo: TLFLabel
              Left = 244
              Top = 72
              Width = 39
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tejadillo'
            end
            object LPorteria: TLFLabel
              Left = 362
              Top = 94
              Width = 38
              Height = 13
              Alignment = taRightJustify
              Caption = 'Porter'#237'a'
            end
            object LEntera: TLFLabel
              Left = 369
              Top = 50
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = 'Entera'
            end
            object LOllaosPeq: TLFLabel
              Left = 466
              Top = 50
              Width = 54
              Height = 13
              Alignment = taRightJustify
              Caption = 'Ollaos Peq.'
            end
            object LTipoConf: TLFLabel
              Left = 471
              Top = 27
              Width = 49
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tipo Conf.'
            end
            object LVarilla: TLFLabel
              Left = 255
              Top = 116
              Width = 28
              Height = 13
              Alignment = taRightJustify
              Caption = 'Varilla'
            end
            object LCarril: TLFLabel
              Left = 377
              Top = 116
              Width = 23
              Height = 13
              Alignment = taRightJustify
              Caption = 'Carril'
            end
            object LCurrias: TLFLabel
              Left = 251
              Top = 94
              Width = 32
              Height = 13
              Alignment = taRightJustify
              Caption = 'Currias'
            end
            object LTapajuntas: TLFLabel
              Left = 370
              Top = 150
              Width = 53
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tapajuntas'
            end
            object LOllaosGran: TLFLabel
              Left = 462
              Top = 72
              Width = 58
              Height = 13
              Alignment = taRightJustify
              Caption = 'Ollaos Gran.'
            end
            object LRotulo: TLFLabel
              Left = 174
              Top = 150
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = 'R'#243'tulo'
            end
            object LAlto: TLFLabel
              Left = 130
              Top = 48
              Width = 18
              Height = 13
              Alignment = taRightJustify
              Caption = 'Alto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsUnderline]
              ParentFont = False
            end
            object LRibete: TLFLabel
              Left = 25
              Top = 116
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = 'Ribete'
            end
            object LBanvalina: TLFLabel
              Left = 7
              Top = 94
              Width = 49
              Height = 13
              Alignment = taRightJustify
              Caption = 'Bambalina'
            end
            object LConfeccion: TLFLabel
              Left = 494
              Top = 6
              Width = 54
              Height = 13
              Alignment = taRightJustify
              Caption = 'Confecci'#243'n'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsUnderline]
              ParentFont = False
            end
            object LGuardarCambios: TLFLabel
              Left = 91
              Top = 168
              Width = 81
              Height = 13
              Caption = 'Guardar Cambios'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = LblGuardaClick
            end
            object LEditarLinea: TLFLabel
              Left = 103
              Top = 168
              Width = 58
              Height = 13
              Caption = 'Editar L'#237'nea'
              FocusControl = ButtAnyadir
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = LblEditaClick
            end
            object LLinea: TLFLabel
              Left = 595
              Top = 148
              Width = 28
              Height = 13
              Alignment = taRightJustify
              Caption = 'L'#237'nea'
            end
            object LLineaPed: TLFLabel
              Left = 571
              Top = 128
              Width = 53
              Height = 13
              Alignment = taRightJustify
              Caption = 'L'#237'nea Ped.'
            end
            object LAncho: TLFLabel
              Left = 179
              Top = 6
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = 'Ancho'
            end
            object LLargo: TLFLabel
              Left = 183
              Top = 27
              Width = 27
              Height = 13
              Alignment = taRightJustify
              Caption = 'Largo'
            end
            object LModBamb: TLFLabel
              Left = 2
              Top = 72
              Width = 54
              Height = 13
              Alignment = taRightJustify
              Caption = 'Mod.Bamb.'
            end
            object LAnadirNotas: TLFLabel
              Left = 311
              Top = 167
              Width = 59
              Height = 13
              Caption = 'A'#241'adir notas'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsUnderline]
              ParentFont = False
              OnClick = LFNotasBClick
            end
            object DBEFLinea: TLFDBEditFind2000
              Left = 59
              Top = 2
              Width = 40
              Height = 21
              DataField = 'LINEAL'
              DataSource = ZDMPedidosEsp.DSPedidosDet
              TabOrder = 0
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'Z_SYS_MODELOS_DET'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'LINEA'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              Filtros = []
              Entorno = DMMain.EntornoBusqueda
            end
            object DBEFSalida: TLFDBEditFind2000
              Left = 59
              Top = 24
              Width = 40
              Height = 21
              DataSource = ZDMPedidosEsp.DSPedidosDet
              TabOrder = 1
              AutoCambiarFoco = False
              BuscarNums = False
              Tabla_asociada.DesplegarBusqueda = False
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OnBusqueda = DBEFSalidaBusqueda
              Filtros = []
            end
            object DBEFLona: TLFDBEditFind2000
              Left = 59
              Top = 146
              Width = 100
              Height = 21
              DataSource = ZDMPedidosEsp.DSPedidosDet
              TabOrder = 2
              AutoCambiarFoco = False
              BuscarNums = False
              Tabla_asociada.DesplegarBusqueda = False
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              Filtros = [obEmpresa]
            end
            object DBEComent: TLFDbedit
              Left = 209
              Top = 146
              Width = 150
              Height = 21
              DataSource = ZDMPedidosEsp.DSPedidosDet
              TabOrder = 3
            end
            object DBEII: TLFDbedit
              Left = 627
              Top = 146
              Width = 20
              Height = 21
              DataSource = ZDMPedidosEsp.DSPedidosDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
            end
            object DBCBManual: TLFDBCheckBox
              Left = 355
              Top = 6
              Width = 57
              Height = 16
              Caption = 'Manual'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 5
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'MANUAL_O_MOTOR'
              DataSource = ZDMPedidosEsp.DSPedidosDet
              ValueChecked = '0'
              ValueUnchecked = '1'
            end
            object DBCBMotor: TLFDBCheckBox
              Left = 355
              Top = 27
              Width = 51
              Height = 15
              Caption = 'Motor'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 6
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'MANUAL_O_MOTOR'
              DataSource = ZDMPedidosEsp.DSPedidosDet
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBEFAltura: TLFDBEditFind2000
              Left = 59
              Top = 46
              Width = 40
              Height = 21
              DataSource = ZDMPedidosEsp.DSPedidosDet
              TabOrder = 7
              AutoCambiarFoco = False
              BuscarNums = False
              Tabla_asociada.DesplegarBusqueda = False
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OnBusqueda = DBEFSalidaBusqueda
              Filtros = []
            end
            object DBEFManivela: TLFDBEditFind2000
              Left = 286
              Top = 2
              Width = 40
              Height = 21
              DataSource = ZDMPedidosEsp.DSPedidosDet
              TabOrder = 8
              AutoCambiarFoco = False
              BuscarNums = False
              Tabla_asociada.DesplegarBusqueda = False
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              Filtros = [obEmpresa]
            end
            object DBEFEmisor: TLFDBEditFind2000
              Left = 286
              Top = 24
              Width = 65
              Height = 21
              DataSource = ZDMPedidosEsp.DSPedidosDet
              TabOrder = 9
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_asociada.DesplegarBusqueda = False
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OnBusqueda = MotorEmisorBusqueda
              Filtros = [obEmpresa]
            end
            object DBEMMontaje: TLFDBEditFind2000
              Left = 286
              Top = 46
              Width = 40
              Height = 21
              DataSource = ZDMPedidosEsp.DSPedidosDet
              TabOrder = 10
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_asociada.DesplegarBusqueda = False
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              Filtros = [obEmpresa]
            end
            object DBEFColocacion: TLFDBEditFind2000
              Left = 403
              Top = 68
              Width = 40
              Height = 21
              DataSource = ZDMPedidosEsp.DSPedidosDet
              TabOrder = 11
              AutoCambiarFoco = False
              BuscarNums = False
              Tabla_asociada.DesplegarBusqueda = False
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              Filtros = [obEmpresa]
            end
            object DBEFTejadillo: TLFDBEditFind2000
              Left = 286
              Top = 68
              Width = 40
              Height = 21
              DataSource = ZDMPedidosEsp.DSPedidosDet
              TabOrder = 12
              AutoCambiarFoco = False
              BuscarNums = False
              Tabla_asociada.DesplegarBusqueda = False
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              Filtros = [obEmpresa]
            end
            object DBEFPorteria: TLFDBEditFind2000
              Left = 403
              Top = 90
              Width = 40
              Height = 21
              DataSource = ZDMPedidosEsp.DSPedidosDet
              TabOrder = 13
              AutoCambiarFoco = False
              BuscarNums = False
              Tabla_asociada.DesplegarBusqueda = False
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              Filtros = [obEmpresa]
            end
            object DBCBPartida: TLFDBCheckBox
              Left = 415
              Top = 6
              Width = 54
              Height = 16
              Caption = 'Partida'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 14
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'PARTIDA_O_ENTERA'
              DataSource = ZDMPedidosEsp.DSPedidosDet
              ValueChecked = '0'
              ValueUnchecked = '1'
            end
            object DBCBEntrada: TLFDBCheckBox
              Left = 415
              Top = 27
              Width = 50
              Height = 15
              Caption = 'Entera'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 15
              TabStop = True
              Alignment = taLeftJustify
              DataSource = ZDMPedidosEsp.DSPedidosDet
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBEFEntera: TLFDBEditFind2000
              Left = 403
              Top = 46
              Width = 40
              Height = 21
              DataSource = ZDMPedidosEsp.DSPedidosDet
              TabOrder = 16
              AutoCambiarFoco = False
              BuscarNums = False
              Tabla_asociada.DesplegarBusqueda = False
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              Filtros = [obEmpresa]
            end
            object DBEAncho: TLFDbedit
              Left = 213
              Top = 2
              Width = 22
              Height = 21
              DataField = 'CANTIDAD'
              DataSource = ZDMPedidosEsp.DSPedidosDet
              TabOrder = 17
            end
            object DBELargo: TLFDbedit
              Left = 213
              Top = 24
              Width = 22
              Height = 21
              DataField = 'CANTIDAD'
              DataSource = ZDMPedidosEsp.DSPedidosDet
              TabOrder = 18
            end
            object DBCBDesdeArriba: TLFDBCheckBox
              Left = 113
              Top = 119
              Width = 116
              Height = 15
              Caption = 'Desde arriba'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 19
              TabStop = True
              Alignment = taLeftJustify
              DataSource = ZDMPedidosEsp.DSPedidosDet
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBRefuerzoAlt15cm: TLFDBCheckBox
              Left = 113
              Top = 103
              Width = 116
              Height = 16
              Caption = 'Refuerzo Alt. + 15cm'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 20
              TabStop = True
              Alignment = taLeftJustify
              DataSource = ZDMPedidosEsp.DSPedidosDet
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBDoblaAbajo5cm: TLFDBCheckBox
              Left = 113
              Top = 87
              Width = 116
              Height = 15
              Caption = 'Dobla. Abajo + 5cm'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 21
              TabStop = True
              Alignment = taLeftJustify
              DataSource = ZDMPedidosEsp.DSPedidosDet
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBQuedar5cm: TLFDBCheckBox
              Left = 113
              Top = 72
              Width = 88
              Height = 15
              Caption = 'Quedar + 5cm'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 22
              TabStop = True
              Alignment = taLeftJustify
              DataSource = ZDMPedidosEsp.DSPedidosDet
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBEFOllaosPeq: TLFDBEditFind2000
              Left = 523
              Top = 46
              Width = 40
              Height = 21
              DataSource = ZDMPedidosEsp.DSPedidosDet
              TabOrder = 23
              AutoCambiarFoco = False
              BuscarNums = False
              Tabla_asociada.DesplegarBusqueda = False
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              Filtros = [obEmpresa]
            end
            object DBEFTipoConf: TLFDBEditFind2000
              Left = 523
              Top = 24
              Width = 40
              Height = 21
              DataSource = ZDMPedidosEsp.DSPedidosDet
              TabOrder = 24
              AutoCambiarFoco = False
              BuscarNums = False
              Tabla_asociada.DesplegarBusqueda = False
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              Filtros = [obEmpresa]
            end
            object DBEFCarril: TLFDBEditFind2000
              Left = 403
              Top = 112
              Width = 40
              Height = 21
              DataSource = ZDMPedidosEsp.DSPedidosDet
              TabOrder = 25
              AutoCambiarFoco = False
              BuscarNums = False
              Tabla_asociada.DesplegarBusqueda = False
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              Filtros = [obEmpresa]
            end
            object DBEFCurrias: TLFDBEditFind2000
              Left = 286
              Top = 90
              Width = 40
              Height = 21
              DataSource = ZDMPedidosEsp.DSPedidosDet
              TabOrder = 26
              AutoCambiarFoco = False
              BuscarNums = False
              Tabla_asociada.DesplegarBusqueda = False
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              Filtros = [obEmpresa]
            end
            object DBEFTapajuntas: TLFDBEditFind2000
              Left = 426
              Top = 146
              Width = 65
              Height = 21
              DataSource = ZDMPedidosEsp.DSPedidosDet
              TabOrder = 27
              AutoCambiarFoco = False
              BuscarNums = False
              Tabla_asociada.DesplegarBusqueda = False
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              Filtros = [obEmpresa]
            end
            object DBEFOllaosGran: TLFDBEditFind2000
              Left = 523
              Top = 68
              Width = 40
              Height = 21
              DataSource = ZDMPedidosEsp.DSPedidosDet
              TabOrder = 28
              AutoCambiarFoco = False
              BuscarNums = False
              Tabla_asociada.DesplegarBusqueda = False
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              Filtros = [obEmpresa]
            end
            object DBCBDobladilloAlrededor: TLFDBCheckBox
              Left = 464
              Top = 94
              Width = 98
              Height = 17
              Caption = 'Dobladillo Alred.'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 29
              TabStop = True
              Alignment = taLeftJustify
              DataSource = ZDMPedidosEsp.DSPedidosDet
              ValueChecked = '0'
              ValueUnchecked = '1'
            end
            object DBCBArriba: TLFDBCheckBox
              Left = 572
              Top = 6
              Width = 57
              Height = 16
              Caption = 'Arriba'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 30
              TabStop = True
              Alignment = taLeftJustify
              DataSource = ZDMPedidosEsp.DSPedidosDet
              ValueChecked = '0'
              ValueUnchecked = '1'
            end
            object DBCBAbajo: TLFDBCheckBox
              Left = 572
              Top = 25
              Width = 57
              Height = 15
              Caption = 'Abajo'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 31
              TabStop = True
              Alignment = taLeftJustify
              DataSource = ZDMPedidosEsp.DSPedidosDet
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBVelcro: TLFDBCheckBox
              Left = 572
              Top = 45
              Width = 54
              Height = 16
              Caption = 'Velcro'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 32
              TabStop = True
              Alignment = taLeftJustify
              DataSource = ZDMPedidosEsp.DSPedidosDet
              ValueChecked = '0'
              ValueUnchecked = '1'
            end
            object DBCBCorte: TLFDBCheckBox
              Left = 572
              Top = 66
              Width = 54
              Height = 15
              Caption = 'Corte'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 33
              TabStop = True
              Alignment = taLeftJustify
              DataSource = ZDMPedidosEsp.DSPedidosDet
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBMontado: TLFDBCheckBox
              Left = 572
              Top = 86
              Width = 66
              Height = 16
              Caption = 'Montado'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 34
              TabStop = True
              Alignment = taLeftJustify
              DataSource = ZDMPedidosEsp.DSPedidosDet
              ValueChecked = '0'
              ValueUnchecked = '1'
            end
            object DBCBQuedar: TLFDBCheckBox
              Left = 572
              Top = 106
              Width = 58
              Height = 15
              Caption = 'Quedar'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 35
              TabStop = True
              Alignment = taLeftJustify
              DataSource = ZDMPedidosEsp.DSPedidosDet
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBEFVarilla: TLFDBEditFind2000
              Left = 286
              Top = 112
              Width = 40
              Height = 21
              DataSource = ZDMPedidosEsp.DSPedidosDet
              TabOrder = 36
              AutoCambiarFoco = False
              BuscarNums = False
              Tabla_asociada.DesplegarBusqueda = False
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              Filtros = [obEmpresa]
            end
            object DBECantidadDBG: TLFDbedit
              Left = 156
              Top = 2
              Width = 40
              Height = 21
              DataField = 'CANTIDAD'
              DataSource = ZDMPedidosEsp.DSPedidosDet
              TabOrder = 37
            end
            object DBELacadoDBG: TLFDbedit
              Left = 156
              Top = 24
              Width = 40
              Height = 21
              DataField = 'CANTIDAD'
              DataSource = ZDMPedidosEsp.DSPedidosDet
              TabOrder = 38
            end
            object DBEBanbalinas: TLFDbedit
              Left = 59
              Top = 90
              Width = 40
              Height = 21
              DataField = 'CANTIDAD'
              DataSource = ZDMPedidosEsp.DSPedidosDet
              TabOrder = 39
            end
            object DBERibete: TLFDbedit
              Left = 59
              Top = 112
              Width = 40
              Height = 21
              DataField = 'CANTIDAD'
              DataSource = ZDMPedidosEsp.DSPedidosDet
              TabOrder = 40
            end
            object DBEArticulo: TLFDbedit
              Left = 508
              Top = 146
              Width = 81
              Height = 21
              DataField = 'Articulo'
              DataSource = ZDMPedidosEsp.DSPedidosDet
              TabOrder = 41
            end
            object DBELineaPed: TLFDbedit
              Left = 627
              Top = 124
              Width = 20
              Height = 21
              DataSource = ZDMPedidosEsp.DSPedidosDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 42
            end
            object DBEModBamb: TLFDbedit
              Left = 59
              Top = 68
              Width = 40
              Height = 21
              DataField = 'CANTIDAD'
              DataSource = ZDMPedidosEsp.DSPedidosDet
              TabOrder = 43
            end
          end
          object TBDBG: TLFToolBar
            Left = 0
            Top = 88
            Width = 669
            Height = 21
            ButtonHeight = 18
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            TabOrder = 2
            Separators = True
            object NavDet: THYMNavigator
              Left = 0
              Top = 0
              Width = 220
              Height = 18
              DataSource = ZDMPedidosEsp.DSPedidosDet
              Flat = True
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              Exclusivo = True
              ControlEdit = CEDetalle
              OrdenAscendente = True
              InsertaUltimo = False
            end
          end
        end
      end
    end
    object ButtAnyadir: TBitBtn
      Left = 546
      Top = 102
      Width = 125
      Height = 25
      Caption = 'A'#241'adir Pesta'#241'a'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = ButtAnyadirClick
      OnEnter = ButtAnyadirClick
      NumGlyphs = 2
    end
  end
  inherited TBActions: TLFToolBar
    Top = 605
    Width = 906
  end
  object PnlFax: TLFPanel [2]
    Left = 681
    Top = 0
    Width = 225
    Height = 605
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object PCFax: TLFPageControl
      Left = 0
      Top = 25
      Width = 225
      Height = 142
      ActivePage = TSImagen
      Align = alTop
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 0
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSImagen: TTabSheet
        Caption = 'Imagen'
        object PnlFaxCab: TLFPanel
          Left = 0
          Top = 0
          Width = 217
          Height = 114
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            217
            114)
          object LblRutaImg: TLFLabel
            Left = 5
            Top = 14
            Width = 76
            Height = 13
            Caption = 'Ruta de Imagen'
          end
          object SBImagen: TSpeedButton
            Left = 192
            Top = 32
            Width = 23
            Height = 21
            Hint = 'Cargar Imagen desde Archivo'
            Anchors = [akTop, akRight]
            Flat = True
            OnClick = SBImagenClick
          end
          object LblDescImg: TLFLabel
            Left = 5
            Top = 61
            Width = 109
            Height = 13
            Caption = 'Descripci'#243'n de Imagen'
          end
          object DBERutaImg: TLFDbedit
            Left = 5
            Top = 32
            Width = 185
            Height = 21
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            DataField = 'RUTA_IMG'
            DataSource = ZDMPedidosEsp.DSPedidosImg
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBEDescImg: TLFDbedit
            Left = 5
            Top = 76
            Width = 185
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'DESCRIPCION_IMG'
            DataSource = ZDMPedidosEsp.DSPedidosImg
            TabOrder = 1
          end
        end
      end
      object TSTabla: TTabSheet
        Caption = 'Tabla'
        ImageIndex = 1
        object DBGridFind20001: TDBGridFind2000
          Left = 0
          Top = 0
          Width = 215
          Height = 114
          Align = alClient
          Color = clInfoBk
          DataSource = ZDMPedidosEsp.DSPedidosImg
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
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
              FieldName = 'LINEA'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION_IMG'
              Width = 241
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RUTA_IMG'
              Width = 218
              Visible = True
            end>
        end
      end
    end
    object PnlFaxDet: TLFPanel
      Left = 0
      Top = 167
      Width = 225
      Height = 438
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object ScrBImagenFax: TScrollBox
        Left = 0
        Top = 0
        Width = 225
        Height = 438
        Align = alClient
        AutoScroll = False
        AutoSize = True
        BevelEdges = []
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        TabOrder = 0
        object ImagenFax: TImage
          Left = 0
          Top = 0
          Width = 225
          Height = 438
          Align = alClient
          Stretch = True
        end
        object ImagenFax2: TImage
          Left = 0
          Top = 0
          Width = 225
          Height = 438
          Align = alClient
          Visible = False
          OnMouseDown = ImagenFax2MouseDown
        end
      end
    end
    object TBFax: TLFToolBar
      Left = 0
      Top = 0
      Width = 225
      Height = 25
      Caption = 'TBFax'
      EdgeBorders = []
      Flat = True
      TabOrder = 2
      Separators = True
      object NavImagenes: THYMNavigator
        Left = 0
        Top = 0
        Width = 220
        Height = 22
        DataSource = ZDMPedidosEsp.DSPedidosImg
        Flat = True
        ParentShowHint = False
        PopupMenu = CEImagenesPMEdit
        ShowHint = True
        TabOrder = 0
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        Exclusivo = True
        ControlEdit = CEImagenes
        OrdenAscendente = True
        InsertaUltimo = False
      end
    end
  end
  inherited CEMain: TControlEdit
    DataSource = ZDMPedidosEsp.DSPedidosCab
    EnlazadoA = CEImagenes
    PanelEdicion = PnlCab
    Left = 32
    Top = 503
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 63
    Top = 503
    inherited CEMainMifirst: TMenuItem
      Visible = False
    end
    inherited CEMainMiprior: TMenuItem
      Visible = False
    end
    inherited CEMainMinext: TMenuItem
      Visible = False
    end
    inherited CEMainMilast: TMenuItem
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
  object ALPedidosEsp: TActionList
    Left = 63
    Top = 565
    object AACliente: TAction
      Caption = 'Ver Datos Cliente'
      Hint = 'Doble click o Ctrl+Alt+C para ver los datos del Cliente'
      ShortCut = 49219
      OnExecute = AAClienteExecute
    end
    object ANewCliente: TAction
      Caption = 'ANewCliente'
      OnExecute = ANewClienteExecute
    end
    object AAPedido: TAction
      Caption = 'Ver Pedido'
      Hint = 'Doble click o Ctrl+Alt+P para ver el pedido'
      ShortCut = 49232
      OnExecute = AAPedidoExecute
    end
  end
  object CEImagenes: TControlEdit
    DataSource = ZDMPedidosEsp.DSPedidosImg
    EnlazadoA = CEMain
    FichaEdicion = TSImagen
    PanelEdicion = PnlFaxCab
    PopUpMenu = CEImagenesPMEdit
    Teclas = DMMain.Teclas
    Left = 32
    Top = 534
  end
  object CEImagenesPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 63
    Top = 534
    object CEImagenesMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEImagenesMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEImagenesMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEImagenesMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEImagenesMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEImagenesMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEImagenesMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEImagenesMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEImagenesMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEImagenesMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEDetalle: TControlEdit
    DataSource = ZDMPedidosEsp.DSPedidosDet
    FichaEdicion = TSProva
    FichaExclusiva = TSProva
    Left = 32
    Top = 472
  end
  object PMInformes: TPopupMenu
    AutoHotkeys = maManual
    Left = 63
    Top = 472
    object VerListadodePedidoEspecial1: TMenuItem
      Caption = 'Visualizar Pedido Especial'
      OnClick = VerListadodePedidoEspecial1Click
    end
    object ImprimirListadodePedidoEspecial1: TMenuItem
      Caption = 'Imprimir Pedido Especial'
      OnClick = ImprimirListadodePedidoEspecial1Click
    end
    object VerLisadodePedidoEspecialNuevo1: TMenuItem
      Caption = 'Listado Pedidos Especiales'
      Visible = False
      OnClick = VerLisadodePedidoEspecial2
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object Configuracin1: TMenuItem
      Caption = 'Configuraci'#243'n R'#225'pida'
      object ListadodePedidoEspecial2: TMenuItem
        Caption = 'Listado Pedido Especial'
        OnClick = ListadodePedidoEspecial2Click
      end
    end
  end
end
