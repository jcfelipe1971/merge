inherited FMVerifactu: TFMVerifactu
  Left = 363
  Top = 181
  Width = 1183
  Height = 761
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Verifactu'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1173
    Height = 708
    inherited TBMain: TLFToolBar
      Width = 1169
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
      end
      object TBSep4: TToolButton
        Left = 80
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBRefrescar: TToolButton
        Left = 88
        Top = 0
        Caption = 'Refrescar'
        ImageIndex = 26
        OnClick = TBRefrescarClick
      end
    end
    object PCMain: TLFPageControl
      Left = 2
      Top = 28
      Width = 1169
      Height = 678
      ActivePage = TSPendientes
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 1
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSPendientes: TTabSheet
        Caption = 'Pendientes'
        OnShow = TSPendientesShow
        object PNLSecuencias: TLFPanel
          Left = 0
          Top = 0
          Width = 1161
          Height = 650
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object TBRegistroFactura: TLFToolBar
            Left = 0
            Top = 0
            Width = 1161
            Height = 22
            AutoSize = True
            DisabledImages = DMMain.ILMain_In
            EdgeBorders = []
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            Separators = True
            object NavRegistroFactura: THYMNavigator
              Left = 0
              Top = 0
              Width = 240
              Height = 22
              DataSource = DMVerifactu.DSRegFacturasPend
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              Exclusivo = True
              OrdenAscendente = True
              InsertaUltimo = False
            end
            object TBSep2: TToolButton
              Left = 240
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object TBAnularRegistro: TToolButton
              Left = 248
              Top = 0
              Hint = 'Crear registro de anulacion'
              Caption = 'Anular Registro'
              ImageIndex = 27
              OnClick = TBAnularRegistroClick
            end
            object TBSep3: TToolButton
              Left = 271
              Top = 0
              Width = 8
              ImageIndex = 28
              Style = tbsSeparator
            end
            object TBDuplicar: TToolButton
              Left = 279
              Top = 0
              Hint = 'Duplicar registro'
              Caption = 'Duplicar registro'
              ImageIndex = 18
              OnClick = TBDuplicarClick
            end
          end
          object DBGRegistroFactura: TDBGridFind2000
            Left = 0
            Top = 22
            Width = 1161
            Height = 146
            Align = alClient
            DataSource = DMVerifactu.DSRegFacturasPend
            TabOrder = 1
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDrawColumnCell = DBGRegistroFacturaDrawColumnCell
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
            ColumnasCheckBoxes.Strings = (
              'ACTIVO')
            ColumnasChecked.Strings = (
              '1')
            ColumnasNoChecked.Strings = (
              '0')
            MensajeNoExiste = False
            SalirSiVacio = False
            SalirSiNoExiste = False
            Posicion = tpCentrado
            OrdenMultiple = True
            Filtros = []
            Columns = <
              item
                Expanded = False
                FieldName = 'ACTIVO'
                Width = 35
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'ID_SECUENCIA'
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'ESTADO_REGISTRO'
                Width = 100
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TIPO_REGISTRO'
                Width = 65
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'ENCADENAMIENTO_PRIMERREG'
                Width = 65
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'ENC_RA_IDEMISORFACTURA'
                Width = 140
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'ENC_RA_NUMSERIEFACTURA'
                Width = 140
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'ENC_RA_FECHAEXPEDICIONFACTURA'
                Width = 140
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'ENC_RA_HUELLA'
                Width = 250
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'FECHAHORAHUSOGENREGISTRO'
                Width = 120
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'ID_SISTEMAINFORMATICO'
                Width = 65
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TIPOHUELLA'
                Width = 65
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'INFO_HUELLA'
                Width = 250
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'HUELLA'
                Width = 250
                Visible = True
              end>
          end
          object PNLRegistroFactura: TLFPanel
            Left = 0
            Top = 168
            Width = 1161
            Height = 482
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 2
            object PNLRegistroFacturaAnulacion: TLFPanel
              Left = 0
              Top = 0
              Width = 1161
              Height = 482
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              DesignSize = (
                1161
                482)
              object LAnulIdSecuencia: TLFLabel
                Left = 24
                Top = 32
                Width = 60
                Height = 13
                Alignment = taRightJustify
                Caption = 'IdSecuencia'
              end
              object LAnulIdVersion: TLFLabel
                Left = 40
                Top = 56
                Width = 44
                Height = 13
                Alignment = taRightJustify
                Caption = 'IdVersion'
              end
              object LAnulIdEmisor: TLFLabel
                Left = 44
                Top = 96
                Width = 40
                Height = 13
                Alignment = taRightJustify
                Caption = 'IdEmisor'
              end
              object LAnulIdFactura: TLFLabel
                Left = 8
                Top = 76
                Width = 240
                Height = 13
                AutoSize = False
                Caption = 'Id Factura'
                Color = clAppWorkSpace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
              end
              object LAnulNumSerieFactura: TLFLabel
                Left = 38
                Top = 120
                Width = 46
                Height = 13
                Alignment = taRightJustify
                Caption = 'NumSerie'
              end
              object LAnulFechaExpedicion: TLFLabel
                Left = 2
                Top = 144
                Width = 82
                Height = 13
                Alignment = taRightJustify
                Caption = 'FechaExpedicion'
              end
              object LAnulRefExterna: TLFLabel
                Left = 303
                Top = 32
                Width = 53
                Height = 13
                Alignment = taRightJustify
                Caption = 'RefExterna'
              end
              object LGeneradoPor: TLFLabel
                Left = 18
                Top = 236
                Width = 66
                Height = 13
                Alignment = taRightJustify
                Caption = 'Generado Por'
              end
              object LAnulGPNombreRazon: TLFLabel
                Left = 16
                Top = 260
                Width = 68
                Height = 13
                Alignment = taRightJustify
                Caption = 'NombreRazon'
              end
              object LAnulGPIdOtroCodPais: TLFLabel
                Left = 343
                Top = 284
                Width = 77
                Height = 13
                Alignment = taRightJustify
                Caption = 'IdOtro - CodPais'
              end
              object LAnulGPNIF: TLFLabel
                Left = 67
                Top = 284
                Width = 17
                Height = 13
                Alignment = taRightJustify
                Caption = 'NIF'
              end
              object LAnulGPIDOTRO_IDTYPE: TLFLabel
                Left = 349
                Top = 308
                Width = 71
                Height = 13
                Alignment = taRightJustify
                Caption = 'IdOtro - IdType'
              end
              object LAnulGPIDOTRO_ID: TLFLabel
                Left = 373
                Top = 332
                Width = 47
                Height = 13
                Alignment = taRightJustify
                Caption = 'IdOtro - Id'
              end
              object LAnulGeneradoPor: TLFLabel
                Left = 8
                Top = 216
                Width = 561
                Height = 13
                AutoSize = False
                Caption = 'Generado Por'
                Color = clAppWorkSpace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
              end
              object SBFacturaAnulacion: TSpeedButton
                Left = 176
                Top = 3
                Width = 23
                Height = 22
                Hint = 'Ir a Factura'
                ParentShowHint = False
                ShowHint = True
                OnClick = SBFacturaAnulacionClick
              end
              object LEstadoRegistroAnul: TLFLabel
                Left = 51
                Top = 460
                Width = 33
                Height = 13
                Alignment = taRightJustify
                Caption = 'Estado'
              end
              object LCodigoErrorAnul: TLFLabel
                Left = 213
                Top = 460
                Width = 47
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cod. Error'
              end
              object LDescErrorAnul: TLFLabel
                Left = 391
                Top = 460
                Width = 53
                Height = 13
                Alignment = taRightJustify
                Caption = 'Desc. Error'
              end
              object LFLabel1: TLFLabel
                Left = 410
                Top = 80
                Width = 483
                Height = 52
                Caption = 
                  'Indicador que especifica que se trata de la anulacion de un regi' +
                  'stro de facturacion de alta'#13#10'(o subsanacion de un registro de fa' +
                  'cturacion de anulacion previo) cuando este no existe en la AEAT'#13 +
                  #10'(o en el propio sistema informatico, si asi procede indicar).'#13#10 +
                  'Este campo forma parte del detalle de las circunstancias de gene' +
                  'racion de los registros de facturacion.'
              end
              object LFLabel2: TLFLabel
                Left = 410
                Top = 144
                Width = 558
                Height = 65
                Caption = 
                  'Indicador que especifica que se esta generando -para volverlo a ' +
                  'remitir- un nuevo registro de facturacion de anulacion'#13#10'subsanad' +
                  'o tras haber sido rechazado en su remision inmediatamente anteri' +
                  'or, es decir, en el ultimo envio que contenia'#13#10'ese registro de f' +
                  'acturacion de anulacion rechazado.'#13#10'Solo es necesario informarlo' +
                  ' en caso de remision voluntaria "VERI*FACTU".'#13#10'Este campo forma ' +
                  'parte del detalle de las circunstancias de generacion de los reg' +
                  'istros de facturacion.'
              end
              object DBEAnulIdSecuencia: TLFDbedit
                Left = 88
                Top = 28
                Width = 121
                Height = 21
                Color = clInfoBk
                DataField = 'ID_SECUENCIA'
                DataSource = DMVerifactu.DSRegFactAnulacion
                ReadOnly = True
                TabOrder = 0
                OnChange = DBEIdSecuenciaChange
              end
              object DBEAnulIdVersion: TLFDbedit
                Left = 88
                Top = 52
                Width = 121
                Height = 21
                DataField = 'IDVERSION'
                DataSource = DMVerifactu.DSRegFactAnulacion
                TabOrder = 1
              end
              object DBEAnulIdEmisor: TLFDbedit
                Left = 88
                Top = 92
                Width = 121
                Height = 21
                DataField = 'IDEMISORFACTURAANULADA'
                DataSource = DMVerifactu.DSRegFactAnulacion
                TabOrder = 3
              end
              object DBEAnulNumSerieFactura: TLFDbedit
                Left = 88
                Top = 116
                Width = 121
                Height = 21
                DataField = 'NUMSERIEFACTURAANULADA'
                DataSource = DMVerifactu.DSRegFactAnulacion
                TabOrder = 4
              end
              object DBDEAnulFechaExpedicion: TLFDBDateEdit
                Left = 88
                Top = 140
                Width = 121
                Height = 21
                DataField = 'FECHAEXPEDICIONFACTURAANULADA'
                DataSource = DMVerifactu.DSRegFactAnulacion
                CheckOnExit = True
                NumGlyphs = 2
                TabOrder = 5
              end
              object DBEAnulRefExterna: TLFDbedit
                Left = 360
                Top = 28
                Width = 457
                Height = 21
                Color = clInfoBk
                DataField = 'REFEXTERNA'
                DataSource = DMVerifactu.DSRegFactAnulacion
                ReadOnly = True
                TabOrder = 2
              end
              object DBCBSinRegistroPrevio: TLFDBCheckBox
                Left = 304
                Top = 103
                Width = 102
                Height = 17
                Hint = 
                  'Indicador que especifica que se trata de la anulacion de un regi' +
                  'stro de facturacion de alta'#13#10'(o subsanacion de un registro de fa' +
                  'cturacion de anulacion previo) cuando este no existe en la AEAT'#13 +
                  #10'(o en el propio sistema informatico, si asi procede indicar).'#13#10 +
                  'Este campo forma parte del detalle de las circunstancias de gene' +
                  'racion de los registros de facturacion.'
                Caption = 'Sin Reg. Previo'
                ClicksDisabled = False
                ColorCheck = 57088
                Layout = checkboxRight
                ShowHint = True
                TabOrder = 6
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'SINREGISTROPREVIO'
                DataSource = DMVerifactu.DSRegFactAnulacion
                ParentShowHint = False
                ValueChecked = 'S'
                ValueUnchecked = 'N'
              end
              object DBCBAnulRechazoPrevio: TLFDBCheckBox
                Left = 303
                Top = 170
                Width = 103
                Height = 17
                Hint = 
                  'Indicador que especifica que se esta generando -para volverlo a ' +
                  'remitir- un nuevo registro de facturacion de anulacion'#13#10'subsanad' +
                  'o tras haber sido rechazado en su remision inmediatamente anteri' +
                  'or, es decir, en el ultimo envio que contenia'#13#10'ese registro de f' +
                  'acturacion de anulacion rechazado.'#13#10'Solo es necesario informarlo' +
                  ' en caso de remision voluntaria "VERI*FACTU".'#13#10'Este campo forma ' +
                  'parte del detalle de las circunstancias de generacion de los reg' +
                  'istros de facturacion.'
                Caption = 'Rechazo Previo'
                ClicksDisabled = False
                ColorCheck = 57088
                Layout = checkboxRight
                ShowHint = True
                TabOrder = 7
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'RECHAZOPREVIO'
                DataSource = DMVerifactu.DSRegFactAnulacion
                ParentShowHint = False
                ValueChecked = 'S'
                ValueUnchecked = 'N'
              end
              object DBCBGeneradoPor: TRxDBComboBox
                Left = 88
                Top = 232
                Width = 121
                Height = 21
                DataField = 'GENERADOPOR'
                DataSource = DMVerifactu.DSRegFactAnulacion
                ItemHeight = 13
                Items.Strings = (
                  'Expedidor'
                  'Destinatario'
                  'Tercero')
                TabOrder = 8
                Values.Strings = (
                  'E'
                  'D'
                  'T')
              end
              object DBEAnulGPNombreRazon: TLFDbedit
                Left = 88
                Top = 256
                Width = 457
                Height = 21
                DataField = 'GENERADOR_NOMBRERAZON'
                DataSource = DMVerifactu.DSRegFactAnulacion
                TabOrder = 9
              end
              object DBEAnulGPIdOtroCodPais: TLFDbedit
                Left = 424
                Top = 280
                Width = 121
                Height = 21
                DataField = 'GENERADOR_IDOTRO_CODIGOPAIS'
                DataSource = DMVerifactu.DSRegFactAnulacion
                TabOrder = 11
              end
              object DBEAnulGPNIF: TLFDbedit
                Left = 88
                Top = 280
                Width = 121
                Height = 21
                DataField = 'GENERADOR_NIF'
                DataSource = DMVerifactu.DSRegFactAnulacion
                TabOrder = 10
              end
              object DBEAnulGPIDOTRO_IDTYPE: TLFDbedit
                Left = 424
                Top = 304
                Width = 121
                Height = 21
                DataField = 'GENERADOR_IDOTRO_IDTYPE'
                DataSource = DMVerifactu.DSRegFactAnulacion
                TabOrder = 12
              end
              object DBEAnulGPIDOTRO_ID: TLFDbedit
                Left = 424
                Top = 328
                Width = 121
                Height = 21
                DataField = 'GENERADOR_IDOTRO_ID'
                DataSource = DMVerifactu.DSRegFactAnulacion
                TabOrder = 13
              end
              object DBEEstadoRegistroAnul: TLFDbedit
                Left = 88
                Top = 456
                Width = 121
                Height = 21
                Color = clInfoBk
                DataField = 'ESTADO_REGISTRO'
                DataSource = DMVerifactu.DSRegFacturasPend
                ReadOnly = True
                TabOrder = 14
                OnChange = DBEEstadoRegistroChange
              end
              object DBECodigoErrorAnul: TLFDbedit
                Left = 264
                Top = 456
                Width = 121
                Height = 21
                Color = clInfoBk
                DataField = 'CODIGO_ERROR_REGISTRO'
                DataSource = DMVerifactu.DSRegFacturasPend
                ReadOnly = True
                TabOrder = 15
              end
              object DBEDescErrorAnul: TLFDbedit
                Left = 448
                Top = 456
                Width = 705
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                Color = clInfoBk
                DataField = 'DESCRIPCIONERRORREGISTRO'
                DataSource = DMVerifactu.DSRegFacturasPend
                ReadOnly = True
                TabOrder = 16
              end
              object NavRegFactAnulacion: THYMNavigator
                Left = 0
                Top = 0
                Width = 168
                Height = 25
                DataSource = DMVerifactu.DSRegFactAnulacion
                VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
                ParentShowHint = False
                ShowHint = True
                TabOrder = 17
                ModoDeSeguridad = True
                DelCaption = 'Informaci'#243'n'
                DelMessage = ' '#191' Borra el registro ? '
                Exclusivo = True
                OrdenAscendente = True
                InsertaUltimo = False
              end
            end
            object PNLRegistroFacturaAlta: TLFPanel
              Left = 0
              Top = 0
              Width = 1161
              Height = 482
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              DesignSize = (
                1161
                482)
              object LIdSecuencia: TLFLabel
                Left = 24
                Top = 32
                Width = 60
                Height = 13
                Alignment = taRightJustify
                Caption = 'IdSecuencia'
              end
              object LIdVersion: TLFLabel
                Left = 40
                Top = 56
                Width = 44
                Height = 13
                Alignment = taRightJustify
                Caption = 'IdVersion'
              end
              object LIdFactIdEmisor: TLFLabel
                Left = 316
                Top = 120
                Width = 40
                Height = 13
                Alignment = taRightJustify
                Caption = 'IdEmisor'
              end
              object LPendAltaIdFactura: TLFLabel
                Left = 8
                Top = 76
                Width = 240
                Height = 13
                AutoSize = False
                Caption = 'Id Factura'
                Color = clAppWorkSpace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
              end
              object LIdFactNumSerie: TLFLabel
                Left = 38
                Top = 96
                Width = 46
                Height = 13
                Alignment = taRightJustify
                Caption = 'NumSerie'
              end
              object LIdFactFechaExpedicion: TLFLabel
                Left = -1
                Top = 120
                Width = 85
                Height = 13
                Alignment = taRightJustify
                Caption = 'Fecha Expedicion'
              end
              object LRefExterna: TLFLabel
                Left = 303
                Top = 32
                Width = 53
                Height = 13
                Alignment = taRightJustify
                Caption = 'RefExterna'
              end
              object LNombreRazonEmisor: TLFLabel
                Left = 251
                Top = 96
                Width = 105
                Height = 13
                Alignment = taRightJustify
                Caption = 'Nombre Razon Emisor'
              end
              object LTerceroIdOtroCodPais: TLFLabel
                Left = 615
                Top = 260
                Width = 77
                Height = 13
                Alignment = taRightJustify
                Caption = 'IdOtro - CodPais'
              end
              object LTerceroNIF: TLFLabel
                Left = 339
                Top = 260
                Width = 17
                Height = 13
                Alignment = taRightJustify
                Caption = 'NIF'
              end
              object LTipoFactura: TLFLabel
                Left = 24
                Top = 168
                Width = 60
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tipo Factura'
              end
              object LTipoRectificativa: TLFLabel
                Left = 29
                Top = 192
                Width = 55
                Height = 13
                Alignment = taRightJustify
                Caption = 'Tipo Rectif.'
              end
              object LPendAltaRectificativa: TLFLabel
                Left = 8
                Top = 216
                Width = 240
                Height = 13
                AutoSize = False
                Caption = 'Rectificativa'
                Color = clAppWorkSpace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
              end
              object LFechaOperacion: TLFLabel
                Left = 2
                Top = 144
                Width = 82
                Height = 13
                Alignment = taRightJustify
                Caption = 'Fecha Operacion'
              end
              object LDescOperacion: TLFLabel
                Left = 282
                Top = 144
                Width = 74
                Height = 13
                Alignment = taRightJustify
                Caption = 'DescOperacion'
              end
              object LEmitidaPorTerceroDestinatario: TLFLabel
                Left = 270
                Top = 192
                Width = 86
                Height = 13
                Alignment = taRightJustify
                Caption = 'Emit x Terc./Dest.'
              end
              object LTerceroNombreRazon: TLFLabel
                Left = 285
                Top = 236
                Width = 71
                Height = 13
                Alignment = taRightJustify
                Caption = 'Nombre Razon'
              end
              object LTerceroIdOtroIdType: TLFLabel
                Left = 621
                Top = 284
                Width = 71
                Height = 13
                Alignment = taRightJustify
                Caption = 'IdOtro - IdType'
              end
              object LTerceroIdOtroId: TLFLabel
                Left = 645
                Top = 308
                Width = 47
                Height = 13
                Alignment = taRightJustify
                Caption = 'IdOtro - Id'
              end
              object LDestoIdOtroCodPais: TLFLabel
                Left = 615
                Top = 380
                Width = 77
                Height = 13
                Alignment = taRightJustify
                Caption = 'IdOtro - CodPais'
              end
              object LDestNIF: TLFLabel
                Left = 339
                Top = 380
                Width = 17
                Height = 13
                Alignment = taRightJustify
                Caption = 'NIF'
              end
              object LDestNombreRazon: TLFLabel
                Left = 288
                Top = 356
                Width = 68
                Height = 13
                Alignment = taRightJustify
                Caption = 'NombreRazon'
              end
              object LDestIdOtroIdType: TLFLabel
                Left = 621
                Top = 404
                Width = 71
                Height = 13
                Alignment = taRightJustify
                Caption = 'IdOtro - IdType'
              end
              object LDestIdOtroId: TLFLabel
                Left = 645
                Top = 428
                Width = 47
                Height = 13
                Alignment = taRightJustify
                Caption = 'IdOtro - Id'
              end
              object LCuotaTotal: TLFLabel
                Left = 920
                Top = 32
                Width = 52
                Height = 13
                Alignment = taRightJustify
                Caption = 'CuotaTotal'
              end
              object LImporteTotal: TLFLabel
                Left = 913
                Top = 56
                Width = 59
                Height = 13
                Alignment = taRightJustify
                Caption = 'ImporteTotal'
              end
              object LNumRegistroAcuerdoFact: TLFLabel
                Left = 835
                Top = 80
                Width = 137
                Height = 13
                Alignment = taRightJustify
                Caption = 'Num. Registro Acuerdo Fact.'
              end
              object LIdAcuerdoSistemaInf: TLFLabel
                Left = 862
                Top = 104
                Width = 110
                Height = 13
                Alignment = taRightJustify
                Caption = 'Id Acuerdo Sistema Inf.'
              end
              object LEstado: TLFLabel
                Left = 51
                Top = 460
                Width = 33
                Height = 13
                Alignment = taRightJustify
                Caption = 'Estado'
              end
              object LCodigoErrorRegistro: TLFLabel
                Left = 213
                Top = 460
                Width = 47
                Height = 13
                Alignment = taRightJustify
                Caption = 'Cod. Error'
              end
              object LDescErrorRegistro: TLFLabel
                Left = 391
                Top = 460
                Width = 53
                Height = 13
                Alignment = taRightJustify
                Caption = 'Desc. Error'
              end
              object LRectIdEmisor: TLFLabel
                Left = 41
                Top = 240
                Width = 43
                Height = 13
                Alignment = taRightJustify
                Caption = 'Id Emisor'
              end
              object LRectNumSerie: TLFLabel
                Left = 35
                Top = 264
                Width = 49
                Height = 13
                Alignment = taRightJustify
                Caption = 'Num Serie'
              end
              object LRectFechaExpedicion: TLFLabel
                Left = -1
                Top = 288
                Width = 85
                Height = 13
                Alignment = taRightJustify
                Caption = 'Fecha Expedicion'
              end
              object LSusIdEmisor: TLFLabel
                Left = 44
                Top = 360
                Width = 40
                Height = 13
                Alignment = taRightJustify
                Caption = 'IdEmisor'
              end
              object LSusNumSerie: TLFLabel
                Left = 38
                Top = 384
                Width = 46
                Height = 13
                Alignment = taRightJustify
                Caption = 'NumSerie'
              end
              object LSusFechaExpedicion: TLFLabel
                Left = 2
                Top = 408
                Width = 82
                Height = 13
                Alignment = taRightJustify
                Caption = 'FechaExpedicion'
              end
              object LSustitutiva: TLFLabel
                Left = 8
                Top = 336
                Width = 240
                Height = 13
                AutoSize = False
                Caption = 'Sustitutiva'
                Color = clAppWorkSpace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
              end
              object LEmitidaPorTercero: TLFLabel
                Left = 256
                Top = 216
                Width = 561
                Height = 13
                AutoSize = False
                Caption = 'Emitida Por Tercero'
                Color = clAppWorkSpace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
              end
              object LDestinatario: TLFLabel
                Left = 256
                Top = 336
                Width = 561
                Height = 13
                AutoSize = False
                Caption = 'Destinatario'
                Color = clAppWorkSpace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
              end
              object SBFactura: TSpeedButton
                Left = 176
                Top = 3
                Width = 23
                Height = 22
                Hint = 'Ir a Factura'
                ParentShowHint = False
                ShowHint = True
                OnClick = SBFacturaClick
              end
              object LEmisor: TLFLabel
                Left = 256
                Top = 76
                Width = 561
                Height = 13
                AutoSize = False
                Caption = 'Emisor'
                Color = clAppWorkSpace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentColor = False
                ParentFont = False
              end
              object DBEIdSecuencia: TLFDbedit
                Left = 88
                Top = 28
                Width = 121
                Height = 21
                Color = clInfoBk
                DataField = 'ID_SECUENCIA'
                DataSource = DMVerifactu.DSRegFactAlta
                ReadOnly = True
                TabOrder = 0
                OnChange = DBEIdSecuenciaChange
              end
              object DBEIdVersion: TLFDbedit
                Left = 88
                Top = 52
                Width = 121
                Height = 21
                DataField = 'IDVERSION'
                DataSource = DMVerifactu.DSRegFactAlta
                TabOrder = 2
              end
              object DBEIdFactIdEmisor: TLFDbedit
                Left = 360
                Top = 116
                Width = 121
                Height = 21
                DataField = 'IDFACTURA_IDEMISORFACTURA'
                DataSource = DMVerifactu.DSRegFactAlta
                TabOrder = 9
              end
              object DBEIdFactNumSerie: TLFDbedit
                Left = 88
                Top = 92
                Width = 121
                Height = 21
                DataField = 'IDFACTURA_NUMSERIEFACTURA'
                DataSource = DMVerifactu.DSRegFactAlta
                TabOrder = 3
              end
              object DBERefExterna: TLFDbedit
                Left = 360
                Top = 28
                Width = 457
                Height = 21
                Color = clInfoBk
                DataField = 'REFEXTERNA'
                DataSource = DMVerifactu.DSRegFactAlta
                ReadOnly = True
                TabOrder = 1
              end
              object DBENombreRazonEmisor: TLFDbedit
                Left = 360
                Top = 92
                Width = 457
                Height = 21
                DataField = 'NOMBRERAZONEMISOR'
                DataSource = DMVerifactu.DSRegFactAlta
                TabOrder = 8
              end
              object DBETerceroIdOtroCodPais: TLFDbedit
                Left = 696
                Top = 256
                Width = 121
                Height = 21
                DataField = 'TERCERO_IDOTRO_CODIGOPAIS'
                DataSource = DMVerifactu.DSRegFactAlta
                TabOrder = 17
              end
              object DBETerceroNIF: TLFDbedit
                Left = 360
                Top = 256
                Width = 121
                Height = 21
                DataField = 'TERCERO_NIF'
                DataSource = DMVerifactu.DSRegFactAlta
                TabOrder = 16
              end
              object DBDEFechaOperacion: TLFDBDateEdit
                Left = 88
                Top = 140
                Width = 121
                Height = 21
                DataField = 'FECHAOPERACION'
                DataSource = DMVerifactu.DSRegFactAlta
                CheckOnExit = True
                NumGlyphs = 2
                TabOrder = 5
              end
              object DBEDescOperacion: TLFDbedit
                Left = 360
                Top = 140
                Width = 457
                Height = 21
                DataField = 'DESCRIPCIONOPERACION'
                DataSource = DMVerifactu.DSRegFactAlta
                TabOrder = 10
              end
              object DBCBFactSimplificada: TLFDBCheckBox
                Left = 1005
                Top = 125
                Width = 121
                Height = 17
                Caption = 'Fact Simplificada'
                ClicksDisabled = False
                ColorCheck = 57088
                Layout = checkboxRight
                TabOrder = 34
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'FACTURASIMPLIFICADAART7273'
                DataSource = DMVerifactu.DSRegFactAlta
                ValueChecked = 'S'
                ValueUnchecked = 'N'
              end
              object DBDEIdFactFechaExpedicion: TLFDBDateEdit
                Left = 88
                Top = 116
                Width = 121
                Height = 21
                DataField = 'IDFACTURA_FECHAEXPEDICIONFAC'
                DataSource = DMVerifactu.DSRegFactAlta
                CheckOnExit = True
                NumGlyphs = 2
                TabOrder = 4
              end
              object DBCBSubsanacion: TLFDBCheckBox
                Left = 1005
                Top = 141
                Width = 121
                Height = 17
                Caption = 'Subsanacion'
                ClicksDisabled = False
                ColorCheck = 57088
                Layout = checkboxRight
                TabOrder = 36
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'SUBSANACION'
                DataSource = DMVerifactu.DSRegFactAlta
                ValueChecked = 'S'
                ValueUnchecked = 'N'
              end
              object DBCBRechazoPrevio: TLFDBCheckBox
                Left = 869
                Top = 158
                Width = 121
                Height = 17
                Caption = 'Rechazo Prev.'
                ClicksDisabled = False
                ColorCheck = 57088
                Layout = checkboxRight
                TabOrder = 37
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'RECHAZOPREVIO'
                DataSource = DMVerifactu.DSRegFactAlta
                ValueChecked = 'S'
                ValueUnchecked = 'N'
              end
              object DBCBFactSinIdentificarDest: TLFDBCheckBox
                Left = 253
                Top = 403
                Width = 121
                Height = 17
                Caption = 'Fact Sin Identificar Dest'
                ClicksDisabled = False
                ColorCheck = 57088
                Layout = checkboxRight
                TabOrder = 25
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'FACTURASINIDENTIFDEST'
                DataSource = DMVerifactu.DSRegFactAlta
                ValueChecked = 'S'
                ValueUnchecked = 'N'
              end
              object DBCBMacrodato: TLFDBCheckBox
                Left = 869
                Top = 141
                Width = 121
                Height = 17
                Caption = 'Macrodato'
                ClicksDisabled = False
                ColorCheck = 57088
                Layout = checkboxRight
                TabOrder = 35
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'MACRODATO'
                DataSource = DMVerifactu.DSRegFactAlta
                ValueChecked = 'S'
                ValueUnchecked = 'N'
              end
              object DBETerceroNombreRazon: TLFDbedit
                Left = 360
                Top = 232
                Width = 457
                Height = 21
                DataField = 'TERCERO_NOMBRERAZON'
                DataSource = DMVerifactu.DSRegFactAlta
                TabOrder = 15
              end
              object DBETerceroIdOtroIdType: TLFDbedit
                Left = 696
                Top = 280
                Width = 121
                Height = 21
                DataField = 'TERCERO_IDOTRO_IDTYPE'
                DataSource = DMVerifactu.DSRegFactAlta
                TabOrder = 18
              end
              object DBETerceroIdOtroId: TLFDbedit
                Left = 696
                Top = 304
                Width = 121
                Height = 21
                DataField = 'TERCERO_IDOTRO_ID'
                DataSource = DMVerifactu.DSRegFactAlta
                TabOrder = 19
              end
              object DBEDestoIdOtroCodPais: TLFDbedit
                Left = 696
                Top = 376
                Width = 121
                Height = 21
                DataField = 'DEST_IDD_IDOTRO_CODIGOPAIS'
                DataSource = DMVerifactu.DSRegFactAlta
                TabOrder = 26
              end
              object DBEDestNIF: TLFDbedit
                Left = 360
                Top = 376
                Width = 121
                Height = 21
                DataField = 'DEST_IDD_NIF'
                DataSource = DMVerifactu.DSRegFactAlta
                TabOrder = 24
              end
              object DBEDestNombreRazon: TLFDbedit
                Left = 360
                Top = 352
                Width = 457
                Height = 21
                DataField = 'DEST_IDD_NOMBRERAZON'
                DataSource = DMVerifactu.DSRegFactAlta
                TabOrder = 23
              end
              object DBEDestIdOtroIdType: TLFDbedit
                Left = 696
                Top = 400
                Width = 121
                Height = 21
                DataField = 'DEST_IDD_IDOTRO_IDTYPE'
                DataSource = DMVerifactu.DSRegFactAlta
                TabOrder = 27
              end
              object DBEDestIdOtroId: TLFDbedit
                Left = 696
                Top = 424
                Width = 121
                Height = 21
                DataField = 'DEST_IDD_IDOTRO_ID'
                DataSource = DMVerifactu.DSRegFactAlta
                TabOrder = 28
              end
              object DBCBCupon: TLFDBCheckBox
                Left = 869
                Top = 125
                Width = 121
                Height = 17
                Caption = 'Cupon'
                ClicksDisabled = False
                ColorCheck = 57088
                Layout = checkboxRight
                TabOrder = 33
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'CUPON'
                DataSource = DMVerifactu.DSRegFactAlta
                ValueChecked = 'S'
                ValueUnchecked = 'N'
              end
              object DBECuotaTotal: TLFDbedit
                Left = 976
                Top = 28
                Width = 121
                Height = 21
                DataField = 'CUOTATOTAL'
                DataSource = DMVerifactu.DSRegFactAlta
                TabOrder = 29
              end
              object DBEImporteTotal: TLFDbedit
                Left = 976
                Top = 52
                Width = 121
                Height = 21
                DataField = 'IMPORTETOTAL'
                DataSource = DMVerifactu.DSRegFactAlta
                TabOrder = 30
              end
              object DBENumRegistroAcuerdoFact: TLFDbedit
                Left = 976
                Top = 76
                Width = 121
                Height = 21
                DataField = 'NUMREGISTROACUERDOFACTURACION'
                DataSource = DMVerifactu.DSRegFactAlta
                TabOrder = 31
              end
              object DBEIdAcuerdoSistemaInf: TLFDbedit
                Left = 976
                Top = 100
                Width = 121
                Height = 21
                DataField = 'IDACUERDOSISTEMAINFORMATICO'
                DataSource = DMVerifactu.DSRegFactAlta
                TabOrder = 32
              end
              object DBEEstadoRegistro: TLFDbedit
                Left = 88
                Top = 456
                Width = 121
                Height = 21
                Color = clInfoBk
                DataField = 'ESTADO_REGISTRO'
                DataSource = DMVerifactu.DSRegFacturasPend
                ReadOnly = True
                TabOrder = 39
                OnChange = DBEEstadoRegistroChange
              end
              object DBECodigoErrorRegistro: TLFDbedit
                Left = 264
                Top = 456
                Width = 121
                Height = 21
                Color = clInfoBk
                DataField = 'CODIGO_ERROR_REGISTRO'
                DataSource = DMVerifactu.DSRegFacturasPend
                ReadOnly = True
                TabOrder = 40
              end
              object DBEDescErrorRegistro: TLFDbedit
                Left = 448
                Top = 456
                Width = 705
                Height = 21
                Anchors = [akLeft, akTop, akRight]
                Color = clInfoBk
                DataField = 'DESCRIPCIONERRORREGISTRO'
                DataSource = DMVerifactu.DSRegFacturasPend
                ReadOnly = True
                TabOrder = 41
              end
              object DBERectIdEmisor: TLFDbedit
                Left = 88
                Top = 236
                Width = 121
                Height = 21
                DataField = 'FR_IDFR_IDEMISORFACTURA'
                DataSource = DMVerifactu.DSRegFactAlta
                TabOrder = 12
              end
              object DBERectNumSerie: TLFDbedit
                Left = 88
                Top = 260
                Width = 121
                Height = 21
                DataField = 'FR_IDFR_NUMSERIEFACTURA'
                DataSource = DMVerifactu.DSRegFactAlta
                TabOrder = 13
              end
              object DBDERectFechaExpedicion: TLFDBDateEdit
                Left = 88
                Top = 284
                Width = 121
                Height = 21
                DataField = 'IDFACTURA_FECHAEXPEDICIONFAC'
                DataSource = DMVerifactu.DSRegFactAlta
                CheckOnExit = True
                NumGlyphs = 2
                TabOrder = 14
              end
              object DBESusIdEmisor: TLFDbedit
                Left = 88
                Top = 356
                Width = 121
                Height = 21
                DataField = 'FS_IDFS_IDEMISORFACTURA'
                DataSource = DMVerifactu.DSRegFactAlta
                TabOrder = 20
              end
              object DBESusNumSerie: TLFDbedit
                Left = 88
                Top = 380
                Width = 121
                Height = 21
                DataField = 'FS_IDFS_NUMSERIEFACTURA'
                DataSource = DMVerifactu.DSRegFactAlta
                TabOrder = 21
              end
              object DBDESusFechaExpedicion: TLFDBDateEdit
                Left = 88
                Top = 404
                Width = 121
                Height = 21
                DataField = 'FS_IDFS_FECHAEXPEDICIONFAC'
                DataSource = DMVerifactu.DSRegFactAlta
                CheckOnExit = True
                NumGlyphs = 2
                TabOrder = 22
              end
              object DBCGRegistroFacturaDesg: TLFDBCtrlGrid
                Left = 824
                Top = 184
                Width = 337
                Height = 268
                Anchors = [akLeft, akTop, akRight]
                ColCount = 1
                DataSource = DMVerifactu.DSRegFactAltaDesg
                PanelHeight = 134
                PanelWidth = 321
                TabOrder = 38
                RowCount = 2
                object LDesgImpuesto: TLFLabel
                  Left = 17
                  Top = 6
                  Width = 43
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Impuesto'
                end
                object LDesgClaveRegimen: TLFLabel
                  Left = 33
                  Top = 27
                  Width = 27
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Clave'
                end
                object LDesgCaliificacion: TLFLabel
                  Left = 37
                  Top = 49
                  Width = 23
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Calif.'
                end
                object LDesgOperacionExenta: TLFLabel
                  Left = 27
                  Top = 71
                  Width = 33
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Exenta'
                end
                object LDesgTipoImpositivo: TLFLabel
                  Left = 155
                  Top = 92
                  Width = 44
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Tipo Imp.'
                end
                object LDesgBaseImponible: TLFLabel
                  Left = 13
                  Top = 93
                  Width = 47
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Base Imp.'
                end
                object LDesgTipoRecargo: TLFLabel
                  Left = 160
                  Top = 114
                  Width = 39
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Rec Eq.'
                end
                object LDesgBaseImponibleACoste: TLFLabel
                  Left = -5
                  Top = 115
                  Width = 66
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'B.Imp.a Coste'
                end
                object DBEDesgTipoImpositivo: TLFDbedit
                  Left = 203
                  Top = 88
                  Width = 41
                  Height = 21
                  DataField = 'TIPOIMPOSITIVO'
                  DataSource = DMVerifactu.DSRegFactAltaDesg
                  TabOrder = 6
                end
                object DBEDesgBaseImponible: TLFDbedit
                  Left = 64
                  Top = 89
                  Width = 90
                  Height = 21
                  DataField = 'BASEIMPONIBLEOIMPORTENOSUJETO'
                  DataSource = DMVerifactu.DSRegFactAltaDesg
                  TabOrder = 4
                end
                object DBEDesgCuota: TLFDbedit
                  Left = 246
                  Top = 88
                  Width = 75
                  Height = 21
                  DataField = 'CUOTAREPERCUTIDA'
                  DataSource = DMVerifactu.DSRegFactAltaDesg
                  TabOrder = 7
                end
                object DBEDesgTipoRecargo: TLFDbedit
                  Left = 203
                  Top = 110
                  Width = 41
                  Height = 21
                  DataField = 'TIPORECARGOEQUIVALENCIA'
                  DataSource = DMVerifactu.DSRegFactAltaDesg
                  TabOrder = 8
                end
                object DBEDesgCuotaRecargo: TLFDbedit
                  Left = 246
                  Top = 110
                  Width = 75
                  Height = 21
                  DataField = 'CUOTARECARGOEQUIVALENCIA'
                  DataSource = DMVerifactu.DSRegFactAltaDesg
                  TabOrder = 9
                end
                object DBEDesgBaseImponibleACoste: TLFDbedit
                  Left = 64
                  Top = 111
                  Width = 90
                  Height = 21
                  DataField = 'BASEIMPONIBLEACOSTE'
                  DataSource = DMVerifactu.DSRegFactAltaDesg
                  TabOrder = 5
                end
                object DBCBDesgImpuesto: TRxDBComboBox
                  Left = 64
                  Top = 2
                  Width = 257
                  Height = 21
                  DataField = 'IMPUESTO'
                  DataSource = DMVerifactu.DSRegFactAltaDesg
                  ItemHeight = 13
                  Items.Strings = (
                    ''
                    '01 Impuesto sobre el Valor Anadido (IVA)'
                    
                      '02 Impuesto sobre la Produccion, los Servicios y la Importacion ' +
                      '(IPSI) de Ceuta y Melilla'
                    '03 Impuesto General Indirecto Canario (IGIC)'
                    '05 Otros')
                  TabOrder = 0
                  Values.Strings = (
                    ''
                    '01'
                    '02'
                    '03'
                    '05')
                end
                object DBCBDesgClaveRegimen: TRxDBComboBox
                  Left = 64
                  Top = 24
                  Width = 257
                  Height = 21
                  DataField = 'IMPUESTO'
                  DataSource = DMVerifactu.DSRegFactAltaDesg
                  ItemHeight = 13
                  Items.Strings = (
                    ''
                    '01 Operacion de regimen general.'
                    '02 Exportacion.'
                    
                      '03 Operaciones a las que se aplique el regimen especial de biene' +
                      's usados, objetos de arte, antiguedades y objetos de coleccion.'
                    '04 Regimen especial del oro de inversion.'
                    '05 Regimen especial de las agencias de viajes.'
                    '06 Regimen especial grupo de entidades en IVA (Nivel Avanzado)'
                    '07 Regimen especial del criterio de caja.'
                    
                      '08 Operaciones sujetas al IPSI  / IGIC (Impuesto sobre la Produc' +
                      'cion, los Servicios y la Importacion  / Impuesto General Indirec' +
                      'to Canario).'
                    
                      '09 Facturacion de las prestaciones de servicios de agencias de v' +
                      'iaje que actuan como mediadoras en nombre y por cuenta ajena (D.' +
                      'A.4a RD1619/2012)'
                    
                      '10 Cobros por cuenta de terceros de honorarios profesionales o d' +
                      'e derechos derivados de la propiedad industrial, de autor u otro' +
                      's por cuenta de sus socios, asociados o colegiados efectuados po' +
                      'r sociedades, asociaciones, colegios profesionales u otras entid' +
                      'ades que realicen estas funciones de cobro.'
                    '11 Operaciones de arrendamiento de local de negocio.'
                    
                      '14 Factura con IVA pendiente de devengo en certificaciones de ob' +
                      'ra cuyo destinatario sea una Administracion Publica.'
                    
                      '15 Factura con IVA pendiente de devengo en operaciones de tracto' +
                      ' sucesivo.'
                    
                      '17 Operacion acogida a alguno de los regimenes previstos en el C' +
                      'apitulo XI del Titulo IX (OSS e IOSS)'
                    '18 Recargo de equivalencia.'
                    
                      '19 Operaciones de actividades incluidas en el Regimen Especial d' +
                      'e Agricultura, Ganaderia y Pesca (REAGYP)'
                    '20 Regimen simplificado')
                  TabOrder = 1
                  Values.Strings = (
                    ''
                    '01'
                    '02'
                    '03'
                    '04'
                    '05'
                    '06'
                    '07'
                    '08'
                    '09'
                    '10'
                    '11'
                    '14'
                    '15'
                    '17'
                    '18'
                    '19'
                    '20')
                end
                object DBCBDesgCaliificacion: TRxDBComboBox
                  Left = 64
                  Top = 46
                  Width = 257
                  Height = 21
                  DataField = 'CALIFICACIONOPERACION'
                  DataSource = DMVerifactu.DSRegFactAltaDesg
                  ItemHeight = 13
                  Items.Strings = (
                    ''
                    
                      'S1 Operacion Sujeta y No exenta - Sin inversion del sujeto pasiv' +
                      'o.'
                    
                      'S2 Operacion Sujeta y No exenta - Con Inversion del sujeto pasiv' +
                      'o'
                    'N1 Operacion No Sujeta articulo 7, 14, otros.'
                    'N2 Operacion No Sujeta por Reglas de localizacion.')
                  TabOrder = 2
                  Values.Strings = (
                    ''
                    'S1'
                    'S2'
                    'N1'
                    'N2')
                end
                object DBCBDesgOperacionExenta: TRxDBComboBox
                  Left = 64
                  Top = 67
                  Width = 257
                  Height = 21
                  DataField = 'OPERACIONEXENTA'
                  DataSource = DMVerifactu.DSRegFactAltaDesg
                  ItemHeight = 13
                  Items.Strings = (
                    ''
                    'E1 Exenta por el articulo 20'
                    'E2 Exenta por el articulo 21'
                    'E3 Exenta por el articulo 22'
                    'E4 Exenta por los articulos 23 y 24'
                    'E5 Exenta por el articulo 25'
                    'E6 Exenta por otros')
                  TabOrder = 3
                  Values.Strings = (
                    ''
                    'E1'
                    'E2'
                    'E3'
                    'E4'
                    'E5'
                    'E6')
                end
              end
              object DBCBTipoFactura: TRxDBComboBox
                Left = 88
                Top = 164
                Width = 161
                Height = 21
                DataField = 'TIPOFACTURA'
                DataSource = DMVerifactu.DSRegFactAlta
                ItemHeight = 13
                Items.Strings = (
                  'F1 Factura'
                  'F2 Factura Simplificada (ticket)'
                  
                    'F3 Factura emitida en sustitucion de facturas simplificadas fact' +
                    'uradas y declaradas'
                  
                    'R1 Factura Rectificativa (Art 80.1 y 80.2, 80.6 y error fundado ' +
                    'en derecho)'
                  'R2 Factura Rectificativa (Art. 80.3)'
                  'R3 Factura Rectificativa (Art. 80.4)'
                  'R4 Factura Rectificativa (Resto)'
                  'R5 Factura Rectificativa en facturas simplificadas')
                TabOrder = 6
                Values.Strings = (
                  'F1'
                  'F2'
                  'F3'
                  'R1'
                  'R2'
                  'R3'
                  'R4'
                  'R5')
              end
              object DBCBTipoRectificativa: TRxDBComboBox
                Left = 88
                Top = 188
                Width = 161
                Height = 21
                DataField = 'TIPORECTIFICATIVA'
                DataSource = DMVerifactu.DSRegFactAlta
                ItemHeight = 13
                Items.Strings = (
                  ''
                  'Por sustitucion'
                  'Por diferencias')
                TabOrder = 7
                Values.Strings = (
                  ''
                  'S'
                  'I')
              end
              object DBCBEmitidaPorTerceroDestinatario: TRxDBComboBox
                Left = 360
                Top = 188
                Width = 121
                Height = 21
                DataField = 'EMITIDAPORTERCEROODEST'
                DataSource = DMVerifactu.DSRegFactAlta
                ItemHeight = 13
                Items.Strings = (
                  ''
                  'Tercero'
                  'Destinatario')
                TabOrder = 11
                Values.Strings = (
                  ''
                  'T'
                  'D')
              end
              object NavRegFactAlta: THYMNavigator
                Left = 0
                Top = 0
                Width = 168
                Height = 25
                DataSource = DMVerifactu.DSRegFactAlta
                VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
                ParentShowHint = False
                ShowHint = True
                TabOrder = 42
                ModoDeSeguridad = True
                DelCaption = 'Informaci'#243'n'
                DelMessage = ' '#191' Borra el registro ? '
                Exclusivo = True
                OrdenAscendente = True
                InsertaUltimo = False
              end
            end
          end
        end
      end
      object TSRemision: TTabSheet
        Caption = 'Remision'
        ImageIndex = 1
        OnShow = TSRemisionShow
        object TBRemision: TLFToolBar
          Left = 0
          Top = 0
          Width = 1161
          Height = 22
          AutoSize = True
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
          Separators = True
          object NavRemision: THYMNavigator
            Left = 0
            Top = 0
            Width = 240
            Height = 22
            DataSource = DMVerifactu.DSRemision
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object TBSep1: TToolButton
            Left = 240
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
        end
        object DBGRemision: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 1161
          Height = 75
          Align = alTop
          Color = clInfoBk
          DataSource = DMVerifactu.DSRemision
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = DBGRemisionDrawColumnCell
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
              FieldName = 'ID_REMISION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO_ENVIO'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIMESTAMPPRESENTACION'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CSV'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBLIGADOEMISION_NOMBRERAZON'
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBLIGADOEMISION_NIF'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REPRESENTANTE_NOMBRERAZON'
              Width = 250
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REPRESENTANTE_NIF'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REMISIONVOL_FECHAFINVERIFACTU'
              Width = 112
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REMISIONVOL_INCIDENCIA'
              Width = 110
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REMISIONREQUERIMIENTO_REFREQ'
              Width = 110
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REMISIONREQUERIMIENTO_FINREQ'
              Width = 110
              Visible = True
            end>
        end
        object PCRemision: TLFPageControl
          Left = 0
          Top = 97
          Width = 1161
          Height = 553
          ActivePage = TSVistaRemision
          Align = alClient
          OwnerDraw = True
          TabIndex = 0
          TabOrder = 2
          TabActiveColor = clWhite
          TabInactiveColor = 14936298
          object TSVistaRemision: TTabSheet
            Caption = 'Remision'
            OnShow = TSVistaRemisionShow
          end
          object TSRemisionRAW: TTabSheet
            Caption = 'XML'
            ImageIndex = 1
            OnShow = TSRemisionRAWShow
            object PNLSOAP: TLFPanel
              Left = 0
              Top = 0
              Width = 1153
              Height = 525
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              OnResize = PNLSOAPResize
              object splSOAP: TSplitter
                Left = 577
                Top = 0
                Width = 8
                Height = 525
                Cursor = crHSplit
                Color = clAppWorkSpace
                ParentColor = False
              end
              object PNLSOAPRequest: TLFPanel
                Left = 0
                Top = 0
                Width = 577
                Height = 525
                Align = alLeft
                BevelOuter = bvNone
                TabOrder = 0
                object LSOAPRequest: TLFLabel
                  Left = 0
                  Top = 0
                  Width = 577
                  Height = 13
                  Align = alTop
                  Caption = 'SOAP Request'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object DBMSOAPRequest: TLFDBMemo
                  Left = 0
                  Top = 13
                  Width = 577
                  Height = 512
                  Align = alClient
                  Color = clInfoBk
                  DataField = 'SOAP_REQUEST'
                  DataSource = DMVerifactu.DSRemisionSOAP
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 0
                end
              end
              object PNLSOAPResponse: TLFPanel
                Left = 585
                Top = 0
                Width = 568
                Height = 525
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 1
                object LSOAPResponse: TLFLabel
                  Left = 0
                  Top = 0
                  Width = 568
                  Height = 13
                  Align = alTop
                  Caption = 'SOAP Response'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object DBMSOAPResponse: TLFDBMemo
                  Left = 0
                  Top = 13
                  Width = 568
                  Height = 512
                  Align = alClient
                  Color = clInfoBk
                  DataField = 'SOAP_RESPONSE'
                  DataSource = DMVerifactu.DSRemisionSOAP
                  Font.Charset = ANSI_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'Courier New'
                  Font.Style = []
                  ParentFont = False
                  ReadOnly = True
                  TabOrder = 0
                end
              end
            end
          end
        end
      end
      object TSConfiguracion: TTabSheet
        Caption = 'Configuracion'
        ImageIndex = 2
        object LSICodPais: TLFLabel
          Left = 415
          Top = 76
          Width = 77
          Height = 13
          Alignment = taRightJustify
          Caption = 'IdOtro - CodPais'
        end
        object LSINIF: TLFLabel
          Left = 139
          Top = 76
          Width = 17
          Height = 13
          Alignment = taRightJustify
          Caption = 'NIF'
        end
        object LSINombreRazon: TLFLabel
          Left = 88
          Top = 52
          Width = 68
          Height = 13
          Alignment = taRightJustify
          Caption = 'NombreRazon'
        end
        object LSIIdType: TLFLabel
          Left = 421
          Top = 100
          Width = 71
          Height = 13
          Alignment = taRightJustify
          Caption = 'IdOtro - IdType'
        end
        object LSIID: TLFLabel
          Left = 445
          Top = 124
          Width = 47
          Height = 13
          Alignment = taRightJustify
          Caption = 'IdOtro - Id'
        end
        object LConfiguracionSI: TLFLabel
          Left = 8
          Top = 32
          Width = 609
          Height = 13
          AutoSize = False
          Caption = 'Configuracion Sistema Informatico'
          Color = clAppWorkSpace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object LSINombreSistemaInformatico: TLFLabel
          Left = 25
          Top = 148
          Width = 132
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nombre Sistema Informatico'
        end
        object LSIIdSistemaInformatico: TLFLabel
          Left = 53
          Top = 172
          Width = 104
          Height = 13
          Alignment = taRightJustify
          Caption = 'Id Sistema Informatico'
        end
        object LSINumeroInstalacion: TLFLabel
          Left = 66
          Top = 196
          Width = 91
          Height = 13
          Alignment = taRightJustify
          Caption = 'Numero Instalacion'
        end
        object LSITipoUsoPosibleSoloVerifactu: TLFLabel
          Left = 8
          Top = 244
          Width = 149
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo Uso Posible Solo Verifactu'
        end
        object LSITipoUsoPosibleMultiOT: TLFLabel
          Left = 34
          Top = 268
          Width = 123
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo Uso Posible Multi OT'
        end
        object LSIIndicadorMultipleOT: TLFLabel
          Left = 48
          Top = 292
          Width = 109
          Height = 13
          Alignment = taRightJustify
          Caption = 'Indicador Multriples OT'
        end
        object LSIIntervaloRefresco: TLFLabel
          Left = 70
          Top = 500
          Width = 87
          Height = 13
          Alignment = taRightJustify
          Caption = 'Intervalo Refresco'
        end
        object LCertificado1: TLFLabel
          Left = 8
          Top = 325
          Width = 609
          Height = 13
          AutoSize = False
          Caption = 'Certificado'
          Color = clAppWorkSpace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object LCertificadoClave: TLFLabel
          Left = 129
          Top = 401
          Width = 27
          Height = 13
          Alignment = taRightJustify
          Caption = 'Clave'
        end
        object LServicio: TLFLabel
          Left = 8
          Top = 453
          Width = 609
          Height = 13
          AutoSize = False
          Caption = 'Servicio'
          Color = clAppWorkSpace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object DBTCertificadoCargado: TDBText
          Left = 622
          Top = 348
          Width = 134
          Height = 13
          AutoSize = True
          DataField = 'CERTIFICADO_CARGADO'
          DataSource = DMVerifactu.DSConfiguracion
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LCertificadoFichero: TLFLabel
          Left = 121
          Top = 377
          Width = 35
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fichero'
        end
        object LCertificadoVencimiento: TLFLabel
          Left = 98
          Top = 424
          Width = 58
          Height = 13
          Alignment = taRightJustify
          Caption = 'Vencimiento'
        end
        object LVersionSIF: TLFLabel
          Left = 103
          Top = 220
          Width = 54
          Height = 13
          Alignment = taRightJustify
          Caption = 'Version SIF'
        end
        object DBESICodPais: TLFDbedit
          Left = 496
          Top = 72
          Width = 121
          Height = 21
          Color = clInfoBk
          DataField = 'IDOTRO_CODIGOPAIS'
          DataSource = DMVerifactu.DSConfiguracion
          Enabled = False
          ReadOnly = True
          TabOrder = 2
        end
        object DBESINIF: TLFDbedit
          Left = 160
          Top = 72
          Width = 121
          Height = 21
          Color = clInfoBk
          DataField = 'NIF'
          DataSource = DMVerifactu.DSConfiguracion
          Enabled = False
          ReadOnly = True
          TabOrder = 1
        end
        object DBESINombreRazon: TLFDbedit
          Left = 160
          Top = 48
          Width = 457
          Height = 21
          Color = clInfoBk
          DataField = 'NOMBRERAZON'
          DataSource = DMVerifactu.DSConfiguracion
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
        object DBESIIdType: TLFDbedit
          Left = 496
          Top = 96
          Width = 121
          Height = 21
          Color = clInfoBk
          DataField = 'IDOTRO_IDTYPE'
          DataSource = DMVerifactu.DSConfiguracion
          Enabled = False
          ReadOnly = True
          TabOrder = 3
        end
        object DBESIID: TLFDbedit
          Left = 496
          Top = 120
          Width = 121
          Height = 21
          Color = clInfoBk
          DataField = 'IDOTRO_ID'
          DataSource = DMVerifactu.DSConfiguracion
          Enabled = False
          ReadOnly = True
          TabOrder = 4
        end
        object DBESINombreSistemaInformatico: TLFDbedit
          Left = 160
          Top = 144
          Width = 457
          Height = 21
          Color = clInfoBk
          DataField = 'NOMBRESISTEMAINFORMATICO'
          DataSource = DMVerifactu.DSConfiguracion
          Enabled = False
          ReadOnly = True
          TabOrder = 5
        end
        object DBESIIdSistemaInformatico: TLFDbedit
          Left = 160
          Top = 168
          Width = 121
          Height = 21
          Color = clInfoBk
          DataField = 'IDSISTEMAINFORMATICO'
          DataSource = DMVerifactu.DSConfiguracion
          Enabled = False
          ReadOnly = True
          TabOrder = 6
        end
        object DBESINumeroInstalacion: TLFDbedit
          Left = 160
          Top = 192
          Width = 457
          Height = 21
          Color = clInfoBk
          DataField = 'NUMEROINSTALACION'
          DataSource = DMVerifactu.DSConfiguracion
          Enabled = False
          ReadOnly = True
          TabOrder = 7
        end
        object DBESITipoUsoPosibleSoloVerifactu: TLFDbedit
          Left = 160
          Top = 240
          Width = 121
          Height = 21
          Color = clInfoBk
          DataField = 'TIPOUSOPOSIBLESOLOVERIFACTU'
          DataSource = DMVerifactu.DSConfiguracion
          Enabled = False
          ReadOnly = True
          TabOrder = 9
        end
        object DBESITipoUsoPosibleMultiOT: TLFDbedit
          Left = 160
          Top = 264
          Width = 121
          Height = 21
          Color = clInfoBk
          DataField = 'TIPOUSOPOSIBLEMULTIOT'
          DataSource = DMVerifactu.DSConfiguracion
          Enabled = False
          ReadOnly = True
          TabOrder = 10
        end
        object DBESIIndicadorMultipleOT: TLFDbedit
          Left = 160
          Top = 288
          Width = 121
          Height = 21
          Color = clInfoBk
          DataField = 'INDICADORMULTIPLESOT'
          DataSource = DMVerifactu.DSConfiguracion
          Enabled = False
          ReadOnly = True
          TabOrder = 11
        end
        object DBESIIntervaloRefresco: TLFDbedit
          Left = 160
          Top = 496
          Width = 121
          Height = 21
          DataField = 'INTERVALO_REFRESCO'
          DataSource = DMVerifactu.DSConfiguracion
          TabOrder = 17
        end
        object DBECertificadoClave: TLFDbedit
          Left = 160
          Top = 397
          Width = 457
          Height = 21
          DataField = 'CERTIFICADO_CLAVE'
          DataSource = DMVerifactu.DSConfiguracion
          PasswordChar = '*'
          TabOrder = 14
        end
        object BCargarCertificado: TButton
          Left = 160
          Top = 344
          Width = 457
          Height = 25
          Caption = 'Cargar Certificado'
          TabOrder = 12
          OnClick = BCargarCertificadoClick
        end
        object NavClave: THYMNavigator
          Left = 0
          Top = 0
          Width = 56
          Height = 25
          DataSource = DMVerifactu.DSConfiguracion
          VisibleButtons = [nbPost, nbCancel]
          ParentShowHint = False
          ShowHint = True
          TabOrder = 18
          ModoDeSeguridad = True
          DelCaption = 'Informaci'#243'n'
          DelMessage = ' '#191' Borra el registro ? '
          Exclusivo = True
          OrdenAscendente = True
          InsertaUltimo = False
        end
        object DBCBEntornoPruebas: TLFDBCheckBox
          Left = 54
          Top = 472
          Width = 121
          Height = 17
          Caption = 'Entorno Pruebas'
          ClicksDisabled = False
          ColorCheck = 57088
          Layout = checkboxRight
          TabOrder = 16
          TabStop = True
          Alignment = taLeftJustify
          DataField = 'ENTORNO_PREUBAS'
          DataSource = DMVerifactu.DSConfiguracion
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBECertificadoFichero: TLFDbedit
          Left = 160
          Top = 373
          Width = 457
          Height = 21
          DataField = 'CERTIFICADO_FICHERO'
          DataSource = DMVerifactu.DSConfiguracion
          TabOrder = 13
        end
        object DBDECertificadoClave: TLFDBDateEdit
          Left = 160
          Top = 421
          Width = 121
          Height = 21
          DataField = 'CERTIFICADO_VENCIMIENTO'
          DataSource = DMVerifactu.DSConfiguracion
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 15
        end
        object DBEVersionSIF: TLFDbedit
          Left = 160
          Top = 216
          Width = 121
          Height = 21
          Color = clInfoBk
          DataField = 'VERSION_SIF'
          DataSource = DMVerifactu.DSConfiguracion
          Enabled = False
          ReadOnly = True
          TabOrder = 8
        end
      end
      object TSErrores: TTabSheet
        Caption = 'Errores'
        ImageIndex = 3
        OnShow = TSErroresShow
        object TBErrores: TLFToolBar
          Left = 0
          Top = 0
          Width = 1161
          Height = 22
          AutoSize = True
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
          Separators = True
          object NavErrores: THYMNavigator
            Left = 0
            Top = 0
            Width = 240
            Height = 22
            DataSource = DMVerifactu.DSxErrores
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object TBSep11: TToolButton
            Left = 240
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object SBVerFacturaError: TToolButton
            Left = 248
            Top = 0
            Hint = 'Ver Factura'
            Caption = 'Ver Factura'
            ImageIndex = 61
            OnClick = SBVerFacturaErrorClick
          end
          object TBDuplicarErrores: TToolButton
            Left = 271
            Top = 0
            Hint = 'Duplicar registro'
            Caption = 'Duplicar registro'
            ImageIndex = 18
            OnClick = TBDuplicarClick
          end
        end
        object DBGErrores: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 1161
          Height = 628
          Align = alClient
          Color = clInfoBk
          DataSource = DMVerifactu.DSxErrores
          ReadOnly = True
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGErroresCellClick
          OnDrawColumnCell = DBGErroresDrawColumnCell
          OnDblClick = DBGErroresDblClick
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
              FieldName = 'EJERCICIO'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SERIE'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 30
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RIG'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_REGISTRO'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_SECUENCIA'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_REMISION'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO_REGISTRO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO_ERROR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION_ERROR'
              Width = 800
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 708
    Width = 1173
  end
  inherited CEMain: TControlEdit
    Left = 288
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 324
    Top = 4
  end
  inherited ALMain: TLFActionList
    Top = 8
  end
  inherited FSMain: TLFFibFormStorage
    Left = 400
    Top = 8
  end
end
