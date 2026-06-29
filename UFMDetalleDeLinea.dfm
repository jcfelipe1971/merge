inherited FMDetalleDeLinea: TFMDetalleDeLinea
  Caption = 'Detalles de Linea'
  ClientHeight = 371
  ClientWidth = 690
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 690
    Height = 347
    inherited TBMain: TLFToolBar
      Width = 686
      object NavDetalleDeLinea: THYMNavigator [0]
        Left = 0
        Top = 0
        Width = 112
        Height = 22
        DataSource = DMDetalleDeLinea.DSQMDetalle
        VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = NavDetalleDeLineaClick
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
    object PCMain: TLFPageControl
      Left = 2
      Top = 28
      Width = 686
      Height = 317
      ActivePage = TSRecepcion
      Align = alClient
      OwnerDraw = True
      TabIndex = 1
      TabOrder = 1
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TEDetalleEntrega: TTabSheet
        Caption = 'Detalle Entrega'
        object PNLEntrega: TLFPanel
          Left = 0
          Top = 0
          Width = 678
          Height = 289
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            678
            289)
          object LUnidades: TLFLabel
            Left = 43
            Top = 106
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'm2 o Unidades'
          end
          object LAcabado: TLFLabel
            Left = 71
            Top = 154
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Acabado'
          end
          object LAreaVisible: TLFLabel
            Left = 11
            Top = 58
            Width = 103
            Height = 13
            Alignment = taRightJustify
            Caption = 'Area Visible (An. x Al.)'
          end
          object LEmbalaje: TLFLabel
            Left = 71
            Top = 178
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Embalaje'
          end
          object LEntregaAAFF: TLFLabel
            Left = 48
            Top = 202
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'Entrega AAFF'
          end
          object LExplicacionUnidades: TLFLabel
            Left = 211
            Top = 106
            Width = 312
            Height = 13
            Caption = 
              '(ojo, si es un articulo unitario aqui habra que poner a mano un ' +
              '"1")'
          end
          object LFechaInstalacion: TLFLabel
            Left = 53
            Top = 226
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Instal.'
          end
          object LLugarInstalacion: TLFLabel
            Left = 56
            Top = 254
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Lugar Instal.'
          end
          object LMedidaTotal: TLFLabel
            Left = 1
            Top = 82
            Width = 113
            Height = 13
            Alignment = taRightJustify
            Caption = 'Medida Total  (An. x Al.)'
          end
          object LPrecio: TLFLabel
            Left = 21
            Top = 130
            Width = 93
            Height = 13
            Alignment = taRightJustify
            Caption = 'Precio m2 o Unidad'
          end
          object LReferencia: TLFLabel
            Left = 62
            Top = 10
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Referencia'
          end
          object LSoporte: TLFLabel
            Left = 79
            Top = 34
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Articulo'
          end
          object DBCBFechaEntregaPendiente: TLFDBCheckBox
            Left = 328
            Top = 195
            Width = 241
            Height = 17
            Caption = 'Fecha Entrega Pendiente'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 15
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ENTREGA_AAFF_PEND'
            DataSource = DMDetalleDeLinea.DSQMDetalle
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBFechaInstalacionPendiente: TLFDBCheckBox
            Left = 328
            Top = 212
            Width = 241
            Height = 17
            Caption = 'Fecha Instalacion Pendiente'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 16
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'FECHA_INSTALACION_PEND'
            DataSource = DMDetalleDeLinea.DSQMDetalle
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBHoraInstalacionPendiente: TLFDBCheckBox
            Left = 328
            Top = 229
            Width = 241
            Height = 17
            Caption = 'Hora Instalacion Pendiente'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 17
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'HORA_INSTALACION_PEND'
            DataSource = DMDetalleDeLinea.DSQMDetalle
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBDEFechaInstalacion: TLFDBDateEdit
            Left = 120
            Top = 222
            Width = 121
            Height = 21
            DataField = 'FECHA_INSTALACION'
            DataSource = DMDetalleDeLinea.DSQMDetalle
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 12
          end
          object DBDEHoraInstalacion: TDBDateTimePicker
            Left = 242
            Top = 222
            Width = 72
            Height = 21
            CalAlignment = dtaLeft
            Date = 43689.3871174653
            Time = 43689.3871174653
            Checked = False
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 13
            DataField = 'FECHA_INSTALACION'
            DataSource = DMDetalleDeLinea.DSQMDetalle
          end
          object DBEAcabado: TLFDbedit
            Left = 120
            Top = 150
            Width = 547
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'ACABADO'
            DataSource = DMDetalleDeLinea.DSQMDetalle
            TabOrder = 8
          end
          object DBEAltoAreaVisible: TLFDbedit
            Left = 224
            Top = 54
            Width = 86
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'ALTO_AREA_VISIBLE'
            DataSource = DMDetalleDeLinea.DSQMDetalle
            TabOrder = 3
          end
          object DBEAltoMedidaTotal: TLFDbedit
            Left = 224
            Top = 78
            Width = 86
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'ALTO_MEDIDA_TOTAL'
            DataSource = DMDetalleDeLinea.DSQMDetalle
            TabOrder = 5
            OnChange = DBEMedidaTotalChange
          end
          object DBEAnchoAreaVisible: TLFDbedit
            Left = 120
            Top = 54
            Width = 86
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'ANCHO_AREA_VISIBLE'
            DataSource = DMDetalleDeLinea.DSQMDetalle
            TabOrder = 2
          end
          object DBEAnchoMedidaTotal: TLFDbedit
            Left = 120
            Top = 78
            Width = 86
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'ANCHO_MEDIDA_TOTAL'
            DataSource = DMDetalleDeLinea.DSQMDetalle
            TabOrder = 4
            OnChange = DBEMedidaTotalChange
          end
          object DBEEmbalaje: TLFDbedit
            Left = 120
            Top = 174
            Width = 547
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'EMBALAJE'
            DataSource = DMDetalleDeLinea.DSQMDetalle
            TabOrder = 9
          end
          object DBEEntregaAAFF: TLFDBDateEdit
            Left = 120
            Top = 198
            Width = 121
            Height = 21
            DataField = 'ENTREGA_AAFF'
            DataSource = DMDetalleDeLinea.DSQMDetalle
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 10
          end
          object DBEHoraEntregaAAFF: TDBDateTimePicker
            Left = 242
            Top = 198
            Width = 72
            Height = 21
            CalAlignment = dtaLeft
            Date = 43689.3871174653
            Time = 43689.3871174653
            Checked = False
            DateFormat = dfShort
            DateMode = dmComboBox
            Kind = dtkTime
            ParseInput = False
            TabOrder = 11
            DataField = 'ENTREGA_AAFF'
            DataSource = DMDetalleDeLinea.DSQMDetalle
          end
          object DBELugarInstalacion: TLFDbedit
            Left = 120
            Top = 246
            Width = 547
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'LUGAR_INSTALACION'
            DataSource = DMDetalleDeLinea.DSQMDetalle
            TabOrder = 14
          end
          object DBEPrecio: TLFDbedit
            Left = 120
            Top = 126
            Width = 86
            Height = 21
            DataField = 'PRECIO'
            DataSource = DMDetalleDeLinea.DSQMDetalle
            TabOrder = 7
          end
          object DBEReferencia: TLFDbedit
            Left = 120
            Top = 6
            Width = 547
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'REFERENCIA'
            DataSource = DMDetalleDeLinea.DSQMDetalle
            TabOrder = 0
          end
          object DBESoporte: TLFDbedit
            Left = 120
            Top = 30
            Width = 547
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'SOPORTE'
            DataSource = DMDetalleDeLinea.DSQMDetalle
            TabOrder = 1
          end
          object DBEUnidades: TLFDbedit
            Left = 120
            Top = 102
            Width = 86
            Height = 21
            DataField = 'UNIDADES'
            DataSource = DMDetalleDeLinea.DSQMDetalle
            TabOrder = 6
          end
        end
      end
      object TSRecepcion: TTabSheet
        Caption = 'Recepcion'
        ImageIndex = 1
        object ScrBImagen: TScrollBox
          Left = 465
          Top = 0
          Width = 213
          Height = 289
          HorzScrollBar.Visible = False
          VertScrollBar.Visible = False
          Align = alClient
          AutoScroll = False
          BevelEdges = []
          TabOrder = 0
          object Imagen: TImage
            Left = 0
            Top = 0
            Width = 209
            Height = 285
            Align = alClient
            AutoSize = True
            Center = True
            IncrementalDisplay = True
            Proportional = True
            Stretch = True
          end
        end
        object PNLRecepcion: TLFPanel
          Left = 0
          Top = 0
          Width = 465
          Height = 289
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 1
          object LTransportista: TLFLabel
            Left = 223
            Top = 63
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Transportista'
          end
          object LBastidor: TLFLabel
            Left = 30
            Top = 42
            Width = 38
            Height = 13
            Alignment = taRightJustify
            Caption = 'Bastidor'
          end
          object LComentarioFechaPrevista: TLFLabel
            Left = 231
            Top = 86
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Comentario'
          end
          object LComentarioRecepcion: TLFLabel
            Left = 231
            Top = 108
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Comentario'
          end
          object LFechaPeticion: TLFLabel
            Left = -2
            Top = 64
            Width = 70
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fec. Recogida'
          end
          object LFechaPrevista: TLFLabel
            Left = 6
            Top = 86
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fec. Prevista'
          end
          object LFechaRecepcion: TLFLabel
            Left = 12
            Top = 108
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fec.Recep.'
          end
          object LImagen: TLFLabel
            Left = 32
            Top = 253
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Imagen'
          end
          object LMarca: TLFLabel
            Left = 38
            Top = 20
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Marca'
          end
          object LModelo: TLFLabel
            Left = 249
            Top = 20
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Modelo'
          end
          object LNotas: TLFLabel
            Left = 40
            Top = 130
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Notas'
          end
          object ETituloImagen: TLFEdit
            Left = 139
            Top = 250
            Width = 312
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 17
          end
          object BCargarImagen: TButton
            Left = 403
            Top = 251
            Width = 23
            Height = 18
            Caption = '...'
            TabOrder = 13
            Visible = False
            OnClick = BCargarImagenClick
          end
          object DBDEFechaRecogida: TLFDBDateEdit
            Left = 72
            Top = 60
            Width = 121
            Height = 21
            DataField = 'FECHA_RECOGIDA'
            DataSource = DMDetalleDeLinea.DSQMDetalle
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 5
          end
          object DBDEFechaPrevista: TLFDBDateEdit
            Left = 72
            Top = 82
            Width = 121
            Height = 21
            DataField = 'FECHA_PREVISTA_RECEPCION'
            DataSource = DMDetalleDeLinea.DSQMDetalle
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 7
          end
          object DBDEFechaRecepcion: TLFDBDateEdit
            Left = 72
            Top = 104
            Width = 121
            Height = 21
            DataField = 'FECHA_RECEPCION'
            DataSource = DMDetalleDeLinea.DSQMDetalle
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 9
          end
          object DBEBastidor: TLFDbedit
            Left = 72
            Top = 38
            Width = 379
            Height = 21
            DataField = 'BASTIDOR'
            DataSource = DMDetalleDeLinea.DSQMDetalle
            TabOrder = 4
          end
          object DBEComentarioFechaPrevista: TLFDbedit
            Left = 288
            Top = 82
            Width = 163
            Height = 21
            DataField = 'COMENTARIO_PREVISION_RECEPCION'
            DataSource = DMDetalleDeLinea.DSQMDetalle
            TabOrder = 8
          end
          object DBEComentarioRecepcion: TLFDbedit
            Left = 288
            Top = 104
            Width = 163
            Height = 21
            DataField = 'COMENTARIO_RECEPCION'
            DataSource = DMDetalleDeLinea.DSQMDetalle
            TabOrder = 10
          end
          object DBEFModelo: TLFFibDBEditFind
            Left = 288
            Top = 16
            Width = 41
            Height = 21
            DataField = 'ID_MODELO'
            DataSource = DMDetalleDeLinea.DSQMDetalle
            TabOrder = 2
            OnChange = DBEFModeloChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_MODELO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ID_MODELO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OnBusqueda = DBEFModeloBusqueda
            OrdenadoPor.Strings = (
              'TITULO')
          end
          object DBEFImagen: TLFDBEditFind2000
            Left = 72
            Top = 250
            Width = 66
            Height = 21
            DataField = 'IMAGEN'
            DataSource = DMDetalleDeLinea.DSQMDetalle
            TabOrder = 12
            OnChange = DBEFImagenChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_IMAGENES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'NOMBRE'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
          end
          object DBEFMarca: TLFFibDBEditFind
            Left = 72
            Top = 16
            Width = 41
            Height = 21
            DataField = 'ID_MARCA'
            DataSource = DMDetalleDeLinea.DSQMDetalle
            TabOrder = 0
            OnChange = DBEFMarcaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_MARCA'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ID_MARCA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'TITULO')
          end
          object DBEFTransportista: TLFFibDBEditFind
            Left = 288
            Top = 60
            Width = 41
            Height = 21
            DataField = 'TRANSPORTISTA'
            DataSource = DMDetalleDeLinea.DSQMDetalle
            TabOrder = 6
            OnChange = DBEFTransportistaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_TRANSPORTISTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TRANSPORTISTA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TRANSPORTISTA')
          end
          object DBMNotas: TLFDBMemo
            Left = 72
            Top = 128
            Width = 379
            Height = 121
            DataField = 'NOTA'
            DataSource = DMDetalleDeLinea.DSQMDetalle
            TabOrder = 11
          end
          object EMarca: TLFEdit
            Left = 114
            Top = 16
            Width = 103
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 15
            Text = 'Marca'
          end
          object EModelo: TLFEdit
            Left = 330
            Top = 16
            Width = 95
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 16
            Text = 'Modelo'
          end
          object ETransportista: TLFEdit
            Left = 330
            Top = 60
            Width = 121
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 18
            Text = 'Transportista'
          end
          object BCrearMarca: TButton
            Left = 218
            Top = 18
            Width = 23
            Height = 18
            Caption = '...'
            TabOrder = 1
            OnClick = BCrearMarcaClick
          end
          object BCrearModelo: TButton
            Left = 426
            Top = 18
            Width = 23
            Height = 18
            Caption = '...'
            TabOrder = 3
            OnClick = BCrearModeloClick
          end
          object BClipboard: TButton
            Left = 426
            Top = 251
            Width = 23
            Height = 18
            Hint = 'Cargar imagen desde porta papeles'
            Caption = 'P'
            TabOrder = 14
            Visible = False
            OnClick = BClipboardClick
          end
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 347
    Width = 690
  end
  inherited CEMain: TControlEdit
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Top = 4
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
    Top = 0
  end
  inherited FSMain: TLFFibFormStorage
    Top = 0
  end
end
