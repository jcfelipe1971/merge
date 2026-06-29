inherited FMCorreo: TFMCorreo
  Left = 362
  Top = 254
  Width = 768
  Height = 577
  HelpContext = 33
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Correo Electr'#243'nico'
  PopupMenu = CEDetallePMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 758
    Height = 524
    inherited TBMain: TLFToolBar
      Width = 754
      inherited NavMain: THYMNavigator
        DataSource = DMCorreo.DSQMCorreo
        Hints.Strings = ()
        BeforeAction = NavMainBeforeAction
        OnClick = NavMainClick
        OnClickBefore = NavMainClickBefore
        OnClickAfterAdjust = NavMainClickAfterAdjust
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
      end
      object TSep1: TToolButton
        Left = 305
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtSend: TToolButton
        Left = 313
        Top = 0
        Action = ASend
      end
    end
    inherited PCMain: TLFPageControl
      Width = 754
      Height = 494
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 746
          Height = 466
          Enabled = True
          object PCCorreoDetalle: TLFPageControl
            Left = 0
            Top = 104
            Width = 746
            Height = 124
            ActivePage = TSDestinos
            Align = alTop
            Images = DMMain.ILMain_Ac
            MultiLine = True
            OwnerDraw = True
            TabIndex = 0
            TabOrder = 0
            TabPosition = tpLeft
            TabActiveColor = clWhite
            TabInactiveColor = 14936298
            object TSDestinos: TTabSheet
              Hint = 'Destinos'
              ParentShowHint = False
              ShowHint = True
              OnShow = TSDestinosShow
              object DBGFCorreoDetalle: TDBGridFind2000
                Left = 0
                Top = 0
                Width = 611
                Height = 113
                DataSource = DMCorreo.DSQMCorreoDetalle
                Options = [dgEditing, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
                  'TIPO')
                CamposAMostrar.Strings = (
                  'TIPO'
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
                  'TIPO')
                SalirSiVacio = False
                SalirSiNoExiste = False
                Tablas.Strings = (
                  'SYS_TIPOS_DESTINO')
                Acciones.Strings = (
                  '')
                Titulos.Strings = (
                  'TITULO')
                BeforeColEnter = DBGFCorreoDetalleBeforeColEnter
                Posicion = tpCentrado
                OrdenMultiple = True
                Filtros = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'TIPO'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESTINO_ADRESS'
                    Width = 475
                    Visible = True
                  end>
              end
              object BitBtnATercero: TBitBtn
                Left = 620
                Top = 0
                Width = 93
                Height = 25
                Action = AAddTercero
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
              end
              object BitBtnAAgrup: TBitBtn
                Left = 620
                Top = 29
                Width = 93
                Height = 25
                Action = AAddAgrupacion
                ParentShowHint = False
                ShowHint = True
                TabOrder = 2
              end
              object BitBtnBajaTercero: TBitBtn
                Left = 620
                Top = 59
                Width = 93
                Height = 25
                Action = ABajaTercero
                ParentShowHint = False
                ShowHint = True
                TabOrder = 3
                NumGlyphs = 2
              end
              object BitBtnBajaAgrupacion: TBitBtn
                Left = 620
                Top = 88
                Width = 93
                Height = 25
                Action = ABajaAgrupacion
                TabOrder = 4
              end
            end
            object TSAdjuntos: TTabSheet
              Hint = 'Adjuntar Ficheros'
              ImageIndex = 87
              OnShow = TSAdjuntosShow
              object DBGFAdjuntos: TDBGridFind2000
                Left = 0
                Top = 0
                Width = 611
                Height = 113
                Color = clInfoBk
                DataSource = DMCorreo.DSQMCorreoAdjuntos
                Enabled = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Options = [dgEditing, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
                    FieldName = 'FICHERO'
                    Width = 490
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TAMANYO'
                    Width = 86
                    Visible = True
                  end>
              end
              object BitBtnAdjuntar: TBitBtn
                Left = 620
                Top = 0
                Width = 93
                Height = 25
                Action = AAdjuntar
                ParentShowHint = False
                ShowHint = True
                TabOrder = 1
              end
            end
          end
          object PNLInfo: TLFPanel
            Left = 0
            Top = 0
            Width = 746
            Height = 82
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object LEMail: TLFLabel
              Left = 115
              Top = 55
              Width = 27
              Height = 13
              Alignment = taRightJustify
              Caption = 'e-mail'
            end
            object LNombre: TLFLabel
              Left = 105
              Top = 33
              Width = 37
              Height = 13
              Alignment = taRightJustify
              Caption = 'Nombre'
            end
            object LUsuario: TLFLabel
              Left = 106
              Top = 11
              Width = 36
              Height = 13
              Alignment = taRightJustify
              Caption = 'Usuario'
            end
            object DBEUsuario: TLFDbedit
              Left = 146
              Top = 8
              Width = 129
              Height = 21
              Color = clInfoBk
              DataField = 'NOMBRE'
              DataSource = DMCorreo.DSxUsuarios
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
            object DBENombreCorreo: TLFDbedit
              Left = 146
              Top = 30
              Width = 386
              Height = 21
              Color = clInfoBk
              DataField = 'NOMBRE_CORREO'
              DataSource = DMCorreo.DSxUsuarios
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
            object DBEDirCorreo: TLFDbedit
              Left = 146
              Top = 52
              Width = 386
              Height = 21
              Color = clInfoBk
              DataField = 'DIR_CORREO'
              DataSource = DMCorreo.DSxUsuarios
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
          end
          object PNLMsg: TLFPanel
            Left = 0
            Top = 228
            Width = 746
            Height = 238
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 2
            object MemoMensaje: TLFDBMemo
              Left = 0
              Top = 29
              Width = 746
              Height = 209
              Align = alClient
              DataField = 'MENSAJE'
              DataSource = DMCorreo.DSQMCorreo
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'Arial'
              Font.Style = []
              ParentFont = False
              ScrollBars = ssVertical
              TabOrder = 1
            end
            object TBAsunto: TLFToolBar
              Left = 0
              Top = 0
              Width = 746
              Height = 29
              ButtonHeight = 33
              EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
              EdgeInner = esNone
              EdgeOuter = esNone
              Flat = True
              TabOrder = 0
              Separators = True
              object PNLSubject: TLFPanel
                Left = 0
                Top = 0
                Width = 741
                Height = 33
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
                object Asunto: TLFLabel
                  Left = 3
                  Top = 6
                  Width = 33
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Asunto'
                end
                object InsertaVariable: TSpeedButton
                  Left = 715
                  Top = 2
                  Width = 23
                  Height = 22
                  Layout = blGlyphRight
                  OnClick = InsertaVariableClick
                end
                object DBEAsunto: TLFDbedit
                  Left = 40
                  Top = 2
                  Width = 561
                  Height = 21
                  DataField = 'ASUNTO'
                  DataSource = DMCorreo.DSQMCorreo
                  TabOrder = 0
                end
                object CBVariables: TLFComboBox
                  Left = 602
                  Top = 2
                  Width = 111
                  Height = 21
                  ItemHeight = 13
                  TabOrder = 1
                  Text = 'Variables'
                  Items.Strings = (
                    'Nombre'
                    'Nombre_Comercial'
                    'NIF'
                    'Telefono01'
                    'Telefono02'
                    'TeleFax')
                end
              end
            end
          end
          object TBDetalle: TLFToolBar
            Left = 0
            Top = 82
            Width = 746
            Height = 22
            AutoSize = True
            EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            TabOrder = 3
            Separators = True
            object NavDetalle: THYMNavigator
              Left = 0
              Top = 0
              Width = 220
              Height = 22
              DataSource = DMCorreo.DSQMCorreoDetalle
              Flat = True
              ParentShowHint = False
              PopupMenu = CEDetallePMEdit
              ShowHint = True
              TabOrder = 0
              BeforeAction = NavDetalleBeforeAction
              OnClick = NavDetalleClick
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              EditaControl = DBGFCorreoDetalle
              InsertaControl = DBGFCorreoDetalle
              OnClickBefore = NavDetalleClickBefore
              Exclusivo = True
              ControlEdit = CEDetalle
              OrdenAscendente = True
              InsertaUltimo = False
              OnClickAfterAdjust = NavDetalleClickAfterAdjust
            end
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 746
          Height = 466
          DataSource = DMCorreo.DSQMCorreo
          Columns = <
            item
              Expanded = False
              FieldName = 'USUARIO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ASUNTO'
              Width = 507
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 524
    Width = 758
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEDetalle
    FichaEdicion = nil
    FichaExclusiva = nil
    Complementario = TBDetalle
    Left = 420
    Top = 12
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 464
    Top = 16
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 266
    Top = 356
    object AVisualizarCorreo: TAction
      Category = 'Listados'
      Caption = 'Visualizar Correo'
      Hint = 'Visualizar Correo'
      ImageIndex = 14
      OnExecute = AVisualizarCorreoExecute
    end
    object AImprimirCorreo: TAction
      Category = 'Listados'
      Caption = 'Imprimir Correo'
      Hint = 'Imprimir Correo'
      ImageIndex = 14
      OnExecute = AImprimirCorreoExecute
    end
    object AVisualizarCorreosFiltrados: TAction
      Category = 'Listados'
      Caption = 'Visualizar Correos Filtrados'
      Hint = 'Visualizar Correos Filtrados'
      ImageIndex = 14
      OnExecute = AVisualizarCorreosFiltradosExecute
    end
    object AImprimirCorreosFiltrados: TAction
      Category = 'Listados'
      Caption = 'Imprimir Correos Filtrados'
      Hint = 'Imprimir Correos Filtrados'
      ImageIndex = 14
      OnExecute = AImprimirCorreosFiltradosExecute
    end
    object ASep: TAction
      Category = 'Listados'
      Caption = '-'
    end
    object AConfRapida: TAction
      Category = 'Listados'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados de Correo'
      Hint = 'Configuraci'#243'n R'#225'pida de Listados de Correo'
      ImageIndex = 77
      OnExecute = AConfRapidaExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object ASend: TAction
      Category = 'Procesos'
      Caption = 'Enviar este Correo'
      Hint = 'Enviar este Correo'
      ImageIndex = 34
      OnExecute = ASendExecute
    end
    object ASendListaCorreo: TAction
      Category = 'Procesos'
      Caption = 'Send a Lista de Correo'
      Hint = 'Envia Mails por separado'
      ImageIndex = 34
      OnExecute = ASendListaCorreoExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AAgregaTercerosFiltrados: TAction
      Category = 'Procesos'
      Caption = 'AAgregaTercerosFiltrados'
      OnExecute = AAgregaTercerosFiltradosExecute
    end
    object AAgregaClientesFiltrados: TAction
      Category = 'Procesos'
      Caption = 'AAgregaClientesFiltrados'
    end
    object AAgregaProveedoresFiltrados: TAction
      Category = 'Procesos'
      Caption = 'AAgregaProveedoresFiltrados'
    end
    object AAgregaAcreedoresFiltrados: TAction
      Category = 'Procesos'
      Caption = 'AAgregaAcreedoresFiltrados'
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 380
    Top = 52
  end
  object ALCorreo: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 336
    Top = 54
    object AAddTercero: TAction
      Hint = 'A'#241'ade un mail de un Tercero'
      ImageIndex = 54
      OnExecute = AAddTerceroExecute
    end
    object AAddAgrupacion: TAction
      Hint = 'A'#241'ade una agrupaci'#243'n'
      ImageIndex = 4
      OnExecute = AAddAgrupacionExecute
    end
    object ABajaTercero: TAction
      Hint = 'Borra una direcci'#243'n de un Tercero'
      ImageIndex = 20
      OnExecute = ABajaTerceroExecute
    end
    object ABajaAgrupacion: TAction
      Hint = 'Borra las direcciones de una Agrupaci'#243'n'
      ImageIndex = 27
      OnExecute = ABajaAgrupacionExecute
    end
    object AAdjuntar: TAction
      Hint = 'Adjuntar Nuevo Fichero'
      ImageIndex = 59
      OnExecute = AAdjuntarExecute
    end
  end
  object CEDetalle: TControlEdit
    EnlazadoA = CEMain
    SubComplementario = ALMain
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 420
    Top = 60
  end
  object CEDetallePMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 466
    Top = 60
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
  object Mail: TIdMessage
    AttachmentEncoding = 'UUE'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 396
    Top = 244
  end
  object SMTP: TIdSMTP
    OnStatus = SMTPStatus
    OnWork = SMTPWork
    OnWorkBegin = SMTPWorkBegin
    OnWorkEnd = SMTPWorkEnd
    SASLMechanisms = <>
    Left = 338
    Top = 187
  end
  object News: TIdNNTP
    OnStatus = NewsStatus
    OnWork = NewsWork
    OnWorkBegin = NewsWorkBegin
    OnWorkEnd = NewsWorkEnd
    Left = 398
    Top = 188
  end
  object IdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL
    Destination = ':25'
    MaxLineAction = maException
    Port = 25
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 304
    Top = 192
  end
end
