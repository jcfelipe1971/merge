inherited FMSII: TFMSII
  Left = 243
  Top = 152
  Width = 1200
  Height = 665
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Suministro Inmediato de Informacion'
  Constraints.MinHeight = 600
  Constraints.MinWidth = 1200
  OnResize = FormResize
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1190
    Height = 612
    inherited TBMain: TLFToolBar
      Width = 1186
      inherited NavMain: THYMNavigator
        DataSource = DMSII.DSPresentacion
        Hints.Strings = ()
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        DataSource = DMSII.DSPresentacion
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepTerc: TToolButton
        Left = 288
      end
      inherited TbuttComp: TToolButton
        Left = 296
      end
    end
    inherited PCMain: TLFPageControl
      Width = 1186
      Height = 77
      Align = alTop
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 1178
          Height = 49
          inherited G2KTableLoc: TG2KTBLoc
            Plan.Strings = (
              ' ')
            DataSource = DMSII.DSPresentacion
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SII_PRESENTACION'
            CampoNum = 'ID_SII_PRESENTACION'
            CampoStr = 'TIPO_PRESENTACION'
            Filtros = [obEmpresa, obCanal]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'ID_SII_PRESENTACION')
          end
          object PNLPresentacion: TLFPanel
            Left = 0
            Top = 0
            Width = 1178
            Height = 41
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object LIdPresentacion: TLFLabel
              Left = 54
              Top = 5
              Width = 9
              Height = 13
              Alignment = taRightJustify
              Caption = 'Id'
            end
            object DBEIdPresentacion: TLFDbedit
              Left = 68
              Top = 1
              Width = 121
              Height = 21
              Color = clInfoBk
              DataField = 'ID_SII_PRESENTACION'
              DataSource = DMSII.DSPresentacion
              Enabled = False
              TabOrder = 0
              OnChange = DBEIdPresentacionChange
            end
            object DBRGTipoPresentacion: TDBRadioGroup
              Left = 204
              Top = 0
              Width = 157
              Height = 41
              Caption = 'Tipo Presentacion'
              Columns = 2
              DataField = 'TIPO_PRESENTACION'
              DataSource = DMSII.DSPresentacion
              Items.Strings = (
                'Recibidas'
                'Emitidas')
              TabOrder = 1
              Values.Strings = (
                'REC'
                'EMI')
              OnChange = DBRGTipoPresentacionChange
            end
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 1178
          Height = 49
          DataSource = DMSII.DSPresentacion
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_SII_PRESENTACION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMPRESA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_PRESENTACION'
              Visible = True
            end>
        end
      end
    end
    object PCTipoPresentacion: TLFPageControl
      Left = 2
      Top = 105
      Width = 1186
      Height = 505
      ActivePage = TSEmitidas
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 2
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSEmitidas: TTabSheet
        Caption = 'Emitidas'
        OnShow = TSEmitidasShow
        object PNLSuministroFacturasEmitidas: TLFPanel
          Left = 0
          Top = 0
          Width = 1178
          Height = 105
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object LTitularSuministroFacturasEmitidas: TLFLabel
            Left = 42
            Top = 81
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Titular'
          end
          object LFechaCreacionSuministroFacturasEmitidas: TLFLabel
            Left = 448
            Top = 36
            Width = 75
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Creacion'
          end
          object LFechaPresentacionSuministroFacturasEmitidas: TLFLabel
            Left = 451
            Top = 58
            Width = 72
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Present.'
          end
          object LIdSuministroFacturasEmitidas: TLFLabel
            Left = 11
            Top = 37
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Id Suministro'
          end
          object LNIFSuministroFacturasEmitidas: TLFLabel
            Left = 254
            Top = 36
            Width = 17
            Height = 13
            Alignment = taRightJustify
            Caption = 'NIF'
          end
          object LNIFRepresentanteSuministroFacturasEmitidas: TLFLabel
            Left = 214
            Top = 58
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'NIF Repres.'
          end
          object LTipoComunicacionSuministroFacturasEmitidas: TLFLabel
            Left = 3
            Top = 59
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Comunic.'
          end
          object lcsveMI: TLFLabel
            Left = 736
            Top = 36
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'CSV'
          end
          object LEstadoEnvioEmi: TLFLabel
            Left = 694
            Top = 58
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Estado Envio'
          end
          object DBDEFechaCreacionSuministroFacturasEmitidas: TLFDBDateEdit
            Left = 528
            Top = 33
            Width = 121
            Height = 21
            DataField = 'FECHA_CREACION'
            DataSource = DMSII.DSSLRFacEmi
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 5
          end
          object DBDEFechaPresentacionSuministroFacturasEmitidas: TLFDBDateEdit
            Left = 528
            Top = 55
            Width = 121
            Height = 21
            DataField = 'FECHA_PRESENTACION'
            DataSource = DMSII.DSSLRFacEmi
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 6
          end
          object DBEIdSuministroFacturasEmitidas: TLFDbedit
            Left = 76
            Top = 33
            Width = 121
            Height = 21
            DataField = 'ID_SII_SUMLRFACTURASEMITIDAS'
            DataSource = DMSII.DSSLRFacEmi
            TabOrder = 0
            OnChange = DBEIdSuministroFacturasEmitidasChange
          end
          object DBENIFSuministroFacturasEmitidas: TLFDbedit
            Left = 276
            Top = 33
            Width = 121
            Height = 21
            DataField = 'NIF'
            DataSource = DMSII.DSSLRFacEmi
            TabOrder = 3
          end
          object DBENIFRepresentanteSuministroFacturasEmitidas: TLFDbedit
            Left = 276
            Top = 55
            Width = 121
            Height = 21
            DataField = 'NIF_REPRESENTANTE'
            DataSource = DMSII.DSSLRFacEmi
            TabOrder = 4
          end
          object DBETitularSuministroFacturasEmitidas: TLFDbedit
            Left = 76
            Top = 77
            Width = 573
            Height = 21
            DataField = 'TITULAR_NOMBRE_RAZON'
            DataSource = DMSII.DSSLRFacEmi
            TabOrder = 2
          end
          object TBSuministroFacturasEmitidas: TLFToolBar
            Left = 0
            Top = 0
            Width = 1178
            Height = 29
            Caption = 'TBRegistroFacturasEmitidas'
            EdgeInner = esNone
            EdgeOuter = esNone
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 9
            Separators = True
            object NavSuministroFacturasEmitidas: THYMNavigator
              Left = 0
              Top = 2
              Width = 240
              Height = 22
              DataSource = DMSII.DSSLRFacEmi
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
          end
          object DBECSV1: TLFDbedit
            Left = 761
            Top = 33
            Width = 150
            Height = 21
            DataField = 'CSV'
            DataSource = DMSII.DSSLRFacEmi
            TabOrder = 7
            OnChange = DBECSV1Change
          end
          object DBEESTADO_ENVIO1: TLFDbedit
            Left = 761
            Top = 55
            Width = 393
            Height = 21
            DataField = 'ESTADO_ENVIO'
            DataSource = DMSII.DSSLRFacEmi
            TabOrder = 8
          end
          object DBCBTipoComunicacionFacturasEmitidas: TRxDBComboBox
            Left = 76
            Top = 55
            Width = 121
            Height = 21
            Color = clInfoBk
            DataField = 'TIPOCOMUNICACION'
            DataSource = DMSII.DSSLRFacEmi
            ItemHeight = 13
            Items.Strings = (
              'Alta'
              'Modificacion'
              'Baja')
            TabOrder = 1
            Values.Strings = (
              'A0'
              'A1'
              'A4')
          end
        end
        object PNLRegistroFacturasEmitidas: TLFPanel
          Left = 0
          Top = 105
          Width = 1178
          Height = 372
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object TBRegistroFacturasEmitidas: TLFToolBar
            Left = 0
            Top = 0
            Width = 1178
            Height = 29
            Caption = 'TBRegistroFacturasEmitidas'
            EdgeInner = esNone
            EdgeOuter = esNone
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 0
            Separators = True
            object NavRegistroFacturasEmitidas: THYMNavigator
              Left = 0
              Top = 2
              Width = 234
              Height = 22
              DataSource = DMSII.DSRLRFacEmi
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
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
            object ButtSep1: TToolButton
              Left = 234
              Top = 2
              Width = 8
              Style = tbsSeparator
            end
            object TButtIrADocumentoEmitidas: TToolButton
              Left = 242
              Top = 2
              Action = AIrADocumentoEmitidas
            end
            object TButtIrARegistroIVAEmitidas: TToolButton
              Left = 265
              Top = 2
              Action = AIrARegistroIVAEmitidas
            end
          end
          object PCRegistroFacturasEmitidas: TLFPageControl
            Left = 0
            Top = 29
            Width = 1178
            Height = 343
            ActivePage = TSFichaRegistroFacturasEmitidas
            Align = alClient
            OwnerDraw = True
            TabIndex = 0
            TabOrder = 1
            OnChange = PCRegistroFacturasEmitidasChange
            TabActiveColor = clWhite
            TabInactiveColor = 14936298
            object TSFichaRegistroFacturasEmitidas: TTabSheet
              Caption = 'Ficha'
              object PNLRegistroFacturasEmitidasDatos: TLFPanel
                Left = 0
                Top = 0
                Width = 1170
                Height = 203
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
                object LFLabel9: TLFLabel
                  Left = 52
                  Top = 161
                  Width = 45
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Tipo Fac.'
                end
                object LFLabel1: TLFLabel
                  Left = 46
                  Top = 7
                  Width = 51
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Id Registro'
                end
                object LFLabel10: TLFLabel
                  Left = 230
                  Top = 7
                  Width = 107
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'F. Agr. N. Serie F. Emi.'
                end
                object LFLabel11: TLFLabel
                  Left = 249
                  Top = 29
                  Width = 88
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'F. Agr Fec. Exped.'
                end
                object LFLabel12: TLFLabel
                  Left = 223
                  Top = 73
                  Width = 114
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'F. Rect. N. Serie F. Emi.'
                end
                object LFLabel13: TLFLabel
                  Left = 222
                  Top = 95
                  Width = 115
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'F. Rect. Fec. Expedicon'
                end
                object LFLabel15: TLFLabel
                  Left = 245
                  Top = 139
                  Width = 92
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Imp. F. Rect. Cuota'
                end
                object LFLabel16: TLFLabel
                  Left = 222
                  Top = 161
                  Width = 115
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Imp. F. Rect.Cuota Rec.'
                end
                object LFLabel17: TLFLabel
                  Left = 500
                  Top = 7
                  Width = 73
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Fec. Operacion'
                end
                object LFLabel18: TLFLabel
                  Left = 496
                  Top = 29
                  Width = 77
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Clave Reg. Esp.'
                end
                object LFLabel19: TLFLabel
                  Left = 487
                  Top = 51
                  Width = 86
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Clave Reg. Esp. 1'
                end
                object LFLabel2: TLFLabel
                  Left = 285
                  Top = 51
                  Width = 50
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Tipo Rect.'
                end
                object LFLabel20: TLFLabel
                  Left = 487
                  Top = 73
                  Width = 86
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Clave Reg. Esp. 2'
                end
                object LFLabel21: TLFLabel
                  Left = 921
                  Top = 51
                  Width = 118
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Num. Reg. Acuedro Fac.'
                end
                object LFLabel22: TLFLabel
                  Left = 511
                  Top = 117
                  Width = 62
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Importe Total'
                end
                object LFLabel23: TLFLabel
                  Left = 486
                  Top = 139
                  Width = 87
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Base Imp. A Coste'
                end
                object LFLabel24: TLFLabel
                  Left = 517
                  Top = 161
                  Width = 56
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Descripcion'
                end
                object LFLabel25: TLFLabel
                  Left = 721
                  Top = 138
                  Width = 90
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Imnueble Situacion'
                end
                object LFLabel26: TLFLabel
                  Left = 701
                  Top = 160
                  Width = 110
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Imnueble Ref. Catastral'
                end
                object LFLabel27: TLFLabel
                  Left = 467
                  Top = 95
                  Width = 106
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Imp. Trans. Sujeta IVA'
                end
                object LFLabel28: TLFLabel
                  Left = 941
                  Top = 73
                  Width = 98
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Emitida Por Terceros'
                end
                object LFLabel29: TLFLabel
                  Left = 946
                  Top = 95
                  Width = 93
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Varios Destinatarios'
                end
                object LFLabel3: TLFLabel
                  Left = 247
                  Top = 118
                  Width = 88
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Imp. F. Rect. Base'
                end
                object LFLabel30: TLFLabel
                  Left = 1008
                  Top = 117
                  Width = 31
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Cupon'
                end
                object LFLabel31: TLFLabel
                  Left = 697
                  Top = 7
                  Width = 114
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Contrap. Nombre Razon'
                end
                object LFLabel32: TLFLabel
                  Left = 751
                  Top = 29
                  Width = 60
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Contrap. NIF'
                end
                object LFLabel33: TLFLabel
                  Left = 722
                  Top = 51
                  Width = 89
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Contrap. NIF Repr.'
                end
                object LFLabel34: TLFLabel
                  Left = 723
                  Top = 73
                  Width = 88
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Contrap. Cod. Pais'
                end
                object LFLabel35: TLFLabel
                  Left = 735
                  Top = 95
                  Width = 76
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Contrap. IdType'
                end
                object LFLabel36: TLFLabel
                  Left = 759
                  Top = 117
                  Width = 52
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Contrap. Id'
                end
                object LFLabel37: TLFLabel
                  Left = 971
                  Top = 139
                  Width = 68
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Tipo Desglose'
                end
                object LFLabel38: TLFLabel
                  Left = 933
                  Top = 161
                  Width = 106
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Tipo Desgl. Operacion'
                end
                object LFLabel4: TLFLabel
                  Left = 12
                  Top = 29
                  Width = 85
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Per. Imp. Ejercicio'
                end
                object LFLabel5: TLFLabel
                  Left = 16
                  Top = 51
                  Width = 81
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Per. Imp. Periodo'
                end
                object LFLabel6: TLFLabel
                  Left = 46
                  Top = 73
                  Width = 51
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Emisor NIF'
                end
                object LFLabel7: TLFLabel
                  Left = -13
                  Top = 95
                  Width = 110
                  Height = 13
                  Hint = 'Emisor Num. Serie Fac.'
                  Alignment = taRightJustify
                  Caption = 'Emisor Num. Serie Fac.'
                  ParentShowHint = False
                  ShowHint = True
                end
                object LFLabel8: TLFLabel
                  Left = -30
                  Top = 117
                  Width = 127
                  Height = 13
                  Hint = 'Emisor Num. Serie Fac. Fin'
                  Alignment = taRightJustify
                  Caption = 'Emisor Num. Serie Fac. Fin'
                  ParentShowHint = False
                  ShowHint = True
                end
                object LEstadoRegistroEmi: TLFLabel
                  Left = 22
                  Top = 182
                  Width = 75
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Estado Registro'
                end
                object LFLabel99: TLFLabel
                  Left = -12
                  Top = 139
                  Width = 110
                  Height = 13
                  Hint = 'Emisor Fec. Expedicion'
                  Alignment = taRightJustify
                  Caption = 'Emisor Fec. Expedicion'
                  ParentShowHint = False
                  ShowHint = True
                end
                object DBEFACEXP_BASEIMPONIBLEACOSTE: TLFDbedit
                  Left = 577
                  Top = 135
                  Width = 110
                  Height = 21
                  DataField = 'FACEXP_BASEIMPONIBLEACOSTE'
                  DataSource = DMSII.DSRLRFacEmi
                  TabOrder = 23
                end
                object DBEFACEXP_CLAVE_REG_ESP: TLFDbedit
                  Left = 577
                  Top = 25
                  Width = 110
                  Height = 21
                  DataField = 'FACEXP_CLAVE_REG_ESP'
                  DataSource = DMSII.DSRLRFacEmi
                  TabOrder = 18
                end
                object DBEFACEXP_CLAVE_REG_ESP1: TLFDbedit
                  Left = 577
                  Top = 47
                  Width = 110
                  Height = 21
                  DataField = 'FACEXP_CLAVE_REG_ESP1'
                  DataSource = DMSII.DSRLRFacEmi
                  TabOrder = 19
                end
                object DBEFACEXP_CLAVE_REG_ESP2: TLFDbedit
                  Left = 577
                  Top = 69
                  Width = 110
                  Height = 21
                  DataField = 'FACEXP_CLAVE_REG_ESP2'
                  DataSource = DMSII.DSRLRFacEmi
                  TabOrder = 20
                end
                object DBEFACEXP_CONTRAP_NIF: TLFDbedit
                  Left = 815
                  Top = 25
                  Width = 110
                  Height = 21
                  DataField = 'FACEXP_CONTRAP_NIF'
                  DataSource = DMSII.DSRLRFacEmi
                  TabOrder = 26
                end
                object DBEFACEXP_CONTRAP_NIF_REPRES: TLFDbedit
                  Left = 815
                  Top = 47
                  Width = 110
                  Height = 21
                  DataField = 'FACEXP_CONTRAP_NIF_REPRES'
                  DataSource = DMSII.DSRLRFacEmi
                  TabOrder = 27
                end
                object DBEFACEXP_CONTRAP_NOMBRE_RAZON: TLFDbedit
                  Left = 815
                  Top = 3
                  Width = 338
                  Height = 21
                  DataField = 'FACEXP_CONTRAP_NOMBRE_RAZON'
                  DataSource = DMSII.DSRLRFacEmi
                  TabOrder = 25
                end
                object DBEFACEXP_CONTRAPARTE_CODPAIS: TLFDbedit
                  Left = 815
                  Top = 69
                  Width = 110
                  Height = 21
                  DataField = 'FACEXP_CONTRAPARTE_CODPAIS'
                  DataSource = DMSII.DSRLRFacEmi
                  TabOrder = 28
                end
                object DBEFACEXP_CONTRAPARTE_ID: TLFDbedit
                  Left = 815
                  Top = 113
                  Width = 110
                  Height = 21
                  DataField = 'FACEXP_CONTRAPARTE_ID'
                  DataSource = DMSII.DSRLRFacEmi
                  TabOrder = 30
                end
                object DBEFACEXP_CONTRAPARTE_IDTYPE: TLFDbedit
                  Left = 815
                  Top = 91
                  Width = 110
                  Height = 21
                  DataField = 'FACEXP_CONTRAPARTE_IDTYPE'
                  DataSource = DMSII.DSRLRFacEmi
                  TabOrder = 29
                end
                object DBEFACEXP_CUPON: TLFDbedit
                  Left = 1043
                  Top = 113
                  Width = 110
                  Height = 21
                  DataField = 'FACEXP_CUPON'
                  DataSource = DMSII.DSRLRFacEmi
                  TabOrder = 36
                end
                object DBEFACEXP_DESCRIPCION: TLFDbedit
                  Left = 577
                  Top = 157
                  Width = 110
                  Height = 21
                  DataField = 'FACEXP_DESCRIPCION'
                  DataSource = DMSII.DSRLRFacEmi
                  TabOrder = 24
                end
                object DBEFACEXP_EMITIDA_POR_TERCEROS: TLFDbedit
                  Left = 1043
                  Top = 69
                  Width = 110
                  Height = 21
                  DataField = 'FACEXP_EMITIDA_POR_TERCEROS'
                  DataSource = DMSII.DSRLRFacEmi
                  TabOrder = 34
                end
                object DBEFACEXP_FAGR_FECHAEXPEDICION: TLFDbedit
                  Left = 339
                  Top = 25
                  Width = 110
                  Height = 21
                  DataField = 'FACEXP_FAGR_FECHAEXPEDICION'
                  DataSource = DMSII.DSRLRFacEmi
                  TabOrder = 10
                end
                object DBEFACEXP_FAGR_NUMSERIEFACEMISOR: TLFDbedit
                  Left = 339
                  Top = 3
                  Width = 110
                  Height = 21
                  DataField = 'FACEXP_FAGR_NUMSERIEFACEMISOR'
                  DataSource = DMSII.DSRLRFacEmi
                  TabOrder = 9
                end
                object DBEFACEXP_FECHAOPERACION: TLFDbedit
                  Left = 577
                  Top = 3
                  Width = 110
                  Height = 21
                  DataField = 'FACEXP_FECHAOPERACION'
                  DataSource = DMSII.DSRLRFacEmi
                  TabOrder = 17
                end
                object DBEFACEXP_FRECT_FECHAEXPEDICION: TLFDbedit
                  Left = 339
                  Top = 91
                  Width = 110
                  Height = 21
                  DataField = 'FACEXP_FRECT_FECHAEXPEDICION'
                  DataSource = DMSII.DSRLRFacEmi
                  TabOrder = 13
                end
                object DBEFACEXP_FRECT_NUMSERIEFACEMISOR: TLFDbedit
                  Left = 339
                  Top = 69
                  Width = 110
                  Height = 21
                  DataField = 'FACEXP_FRECT_NUMSERIEFACEMISOR'
                  DataSource = DMSII.DSRLRFacEmi
                  TabOrder = 12
                end
                object DBEFACEXP_IMPORTE_TOTAL: TLFDbedit
                  Left = 577
                  Top = 113
                  Width = 110
                  Height = 21
                  DataField = 'FACEXP_IMPORTE_TOTAL'
                  DataSource = DMSII.DSRLRFacEmi
                  TabOrder = 22
                end
                object DBEFACEXP_IMPORTETRANSMSUJETAIVA: TLFDbedit
                  Left = 577
                  Top = 91
                  Width = 110
                  Height = 21
                  DataField = 'FACEXP_IMPORTETRANSMSUJETAIVA'
                  DataSource = DMSII.DSRLRFacEmi
                  TabOrder = 21
                end
                object DBEFACEXP_IMPRECT_BASERECT: TLFDbedit
                  Left = 339
                  Top = 113
                  Width = 110
                  Height = 21
                  DataField = 'FACEXP_IMPRECT_BASERECT'
                  DataSource = DMSII.DSRLRFacEmi
                  TabOrder = 14
                end
                object DBEFACEXP_IMPRECT_CUOTARECRECT: TLFDbedit
                  Left = 339
                  Top = 135
                  Width = 110
                  Height = 21
                  DataField = 'FACEXP_IMPRECT_CUOTARECT'
                  DataSource = DMSII.DSRLRFacEmi
                  TabOrder = 15
                end
                object DBEFACEXP_IMPRECT_CUOTARECT: TLFDbedit
                  Left = 339
                  Top = 157
                  Width = 110
                  Height = 21
                  DataField = 'FACEXP_IMPRECT_CUOTARECRECT'
                  DataSource = DMSII.DSRLRFacEmi
                  TabOrder = 16
                end
                object DBEFACEXP_INMUEBLE_REFCATASTRAL: TLFDbedit
                  Left = 815
                  Top = 157
                  Width = 110
                  Height = 21
                  DataField = 'FACEXP_INMUEBLE_REFCATASTRAL'
                  DataSource = DMSII.DSRLRFacEmi
                  TabOrder = 32
                end
                object DBEFACEXP_INMUEBLE_SITUACIONINM: TLFDbedit
                  Left = 815
                  Top = 135
                  Width = 110
                  Height = 21
                  DataField = 'FACEXP_INMUEBLE_SITUACIONINM'
                  DataSource = DMSII.DSRLRFacEmi
                  TabOrder = 31
                end
                object DBEFACEXP_NUMREGACUERDOFAC: TLFDbedit
                  Left = 1043
                  Top = 47
                  Width = 110
                  Height = 21
                  DataField = 'FACEXP_NUMREGACUERDOFAC'
                  DataSource = DMSII.DSRLRFacEmi
                  TabOrder = 33
                end
                object DBEFACEXP_TIPOFACTURA: TLFDbedit
                  Left = 101
                  Top = 157
                  Width = 110
                  Height = 21
                  DataField = 'FACEXP_TIPOFACTURA'
                  DataSource = DMSII.DSRLRFacEmi
                  TabOrder = 7
                end
                object DBEFACEXP_TIPORECTIFICATIVA: TLFDbedit
                  Left = 339
                  Top = 47
                  Width = 110
                  Height = 21
                  DataField = 'FACEXP_TIPORECTIFICATIVA'
                  DataSource = DMSII.DSRLRFacEmi
                  TabOrder = 11
                end
                object DBEFACEXP_VARIOSDESTINATARIOS: TLFDbedit
                  Left = 1043
                  Top = 91
                  Width = 110
                  Height = 21
                  DataField = 'FACEXP_VARIOSDESTINATARIOS'
                  DataSource = DMSII.DSRLRFacEmi
                  TabOrder = 35
                end
                object DBEID_SII_REGLRFACTURASEMITIDAS: TLFDbedit
                  Left = 101
                  Top = 3
                  Width = 110
                  Height = 21
                  DataField = 'ID_SII_REGLRFACTURASEMITIDAS'
                  DataSource = DMSII.DSRLRFacEmi
                  TabOrder = 0
                end
                object DBEIDFAC_EMISOR_NIF: TLFDbedit
                  Left = 101
                  Top = 69
                  Width = 110
                  Height = 21
                  DataField = 'IDFAC_EMISOR_NIF'
                  DataSource = DMSII.DSRLRFacEmi
                  TabOrder = 3
                end
                object DBEIDFAC_EMISOR_NUMSERIEFAC: TLFDbedit
                  Left = 101
                  Top = 91
                  Width = 110
                  Height = 21
                  DataField = 'IDFAC_EMISOR_NUMSERIEFAC'
                  DataSource = DMSII.DSRLRFacEmi
                  TabOrder = 4
                end
                object DBEIDFAC_EMISOR_NUMSERIEFACFIN: TLFDbedit
                  Left = 101
                  Top = 113
                  Width = 110
                  Height = 21
                  DataField = 'IDFAC_EMISOR_NUMSERIEFACFIN'
                  DataSource = DMSII.DSRLRFacEmi
                  TabOrder = 5
                end
                object DBEPERIODOIMPOSITIVO_EJERCICIO: TLFDbedit
                  Left = 101
                  Top = 25
                  Width = 110
                  Height = 21
                  DataField = 'PERIODOIMPOSITIVO_EJERCICIO'
                  DataSource = DMSII.DSRLRFacEmi
                  TabOrder = 1
                end
                object DBEPERIODOIMPOSITIVO_PERIODO: TLFDbedit
                  Left = 101
                  Top = 47
                  Width = 110
                  Height = 21
                  DataField = 'PERIODOIMPOSITIVO_PERIODO'
                  DataSource = DMSII.DSRLRFacEmi
                  TabOrder = 2
                end
                object DBETIPO_DESGLOSE: TLFDbedit
                  Left = 1043
                  Top = 135
                  Width = 110
                  Height = 21
                  DataField = 'TIPO_DESGLOSE'
                  DataSource = DMSII.DSRLRFacEmi
                  TabOrder = 37
                end
                object DBETIPO_DESGLOSE_OPERACION: TLFDbedit
                  Left = 1043
                  Top = 157
                  Width = 110
                  Height = 21
                  DataField = 'TIPO_DESGLOSE_OPERACION'
                  DataSource = DMSII.DSRLRFacEmi
                  TabOrder = 38
                end
                object DBEESTADO_REGISTRO1: TLFDbedit
                  Left = 101
                  Top = 179
                  Width = 110
                  Height = 21
                  DataField = 'ESTADO_REGISTRO'
                  DataSource = DMSII.DSRLRFacEmi
                  TabOrder = 8
                  OnChange = DBEESTADO_REGISTROChange
                end
                object DBECODIGO_ERROR1: TLFDbedit
                  Left = 227
                  Top = 179
                  Width = 110
                  Height = 21
                  DataField = 'CODIGO_ERROR'
                  DataSource = DMSII.DSRLRFacEmi
                  TabOrder = 39
                end
                object DBEDESCRIPCION_ERROR1: TLFDbedit
                  Left = 339
                  Top = 179
                  Width = 814
                  Height = 21
                  DataField = 'DESCRIPCION_ERROR'
                  DataSource = DMSII.DSRLRFacEmi
                  TabOrder = 40
                end
                object DBEIDFAC_EMISOR_FECHA_EXPEDICION1: TLFDbedit
                  Left = 101
                  Top = 135
                  Width = 110
                  Height = 21
                  DataField = 'IDFAC_EMISOR_FECHA_EXPEDICION'
                  DataSource = DMSII.DSRLRFacEmi
                  TabOrder = 6
                end
              end
              object PNLDesgloseFacturasEmitidas: TLFPanel
                Left = 0
                Top = 203
                Width = 1170
                Height = 112
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 1
                object DBCGDesgloseFacEmi: TLFDBCtrlGrid
                  Left = 0
                  Top = 29
                  Width = 1170
                  Height = 83
                  Align = alClient
                  ColCount = 1
                  DataSource = DMSII.DSDesgloseFacEmi
                  PanelBorder = gbNone
                  PanelHeight = 83
                  PanelWidth = 1154
                  TabOrder = 0
                  RowCount = 1
                  object LFLabel75: TLFLabel
                    Left = 88
                    Top = 6
                    Width = 9
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Id'
                  end
                  object LFLabel76: TLFLabel
                    Left = 10
                    Top = 28
                    Width = 87
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Suj. Exenta Causa'
                  end
                  object LFLabel77: TLFLabel
                    Left = 16
                    Top = 50
                    Width = 81
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Suj. Exenta Base'
                  end
                  object LFLabel78: TLFLabel
                    Left = 473
                    Top = 6
                    Width = 100
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Suj. No Ex. Tipo Imp.'
                  end
                  object LFLabel79: TLFLabel
                    Left = 493
                    Top = 28
                    Width = 80
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Suj. No Ex. Base'
                  end
                  object LFLabel80: TLFLabel
                    Left = 463
                    Top = 50
                    Width = 110
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Suj. No Ex. Cuota Rep.'
                  end
                  object LFLabel81: TLFLabel
                    Left = 710
                    Top = 6
                    Width = 103
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Suj. No Ex. Tipo Rec.'
                  end
                  object LFLabel82: TLFLabel
                    Left = 705
                    Top = 28
                    Width = 110
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Suj. No Ex. Cuota Rec.'
                  end
                  object LFLabel83: TLFLabel
                    Left = 930
                    Top = 6
                    Width = 111
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'No sujeta Imp. Art 7, 14'
                  end
                  object LFLabel84: TLFLabel
                    Left = 938
                    Top = 28
                    Width = 103
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'No sujeta Importe TAI'
                  end
                  object LFLabel85: TLFLabel
                    Left = 259
                    Top = 6
                    Width = 77
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Suj. No Ex. Tipo'
                  end
                  object DBEID_SII_DESGLOSEFACTURA_EMI: TLFDbedit
                    Left = 101
                    Top = 2
                    Width = 110
                    Height = 21
                    DataField = 'ID_SII_DESGLOSEFACTURA_EMI'
                    DataSource = DMSII.DSDesgloseFacEmi
                    TabOrder = 0
                  end
                  object DBESUJETA_EXENTA_CAUSA: TLFDbedit
                    Left = 101
                    Top = 24
                    Width = 110
                    Height = 21
                    DataField = 'SUJETA_EXENTA_CAUSA'
                    DataSource = DMSII.DSDesgloseFacEmi
                    TabOrder = 1
                  end
                  object DBESUJETA_EXENTA_BASEIMPONIBLE: TLFDbedit
                    Left = 101
                    Top = 46
                    Width = 110
                    Height = 21
                    DataField = 'SUJETA_EXENTA_BASEIMPONIBLE'
                    DataSource = DMSII.DSDesgloseFacEmi
                    TabOrder = 2
                  end
                  object DBESUJETA_NO_EXENTA_TIPO: TLFDbedit
                    Left = 339
                    Top = 2
                    Width = 110
                    Height = 21
                    DataField = 'SUJETA_NO_EXENTA_TIPO'
                    DataSource = DMSII.DSDesgloseFacEmi
                    TabOrder = 3
                  end
                  object DBESUJETA_NO_EXENTA_TIPOIMP: TLFDbedit
                    Left = 577
                    Top = 2
                    Width = 110
                    Height = 21
                    DataField = 'SUJETA_NO_EXENTA_TIPOIMP'
                    DataSource = DMSII.DSDesgloseFacEmi
                    TabOrder = 4
                  end
                  object DBESUJETA_NO_EXENTA_BASEIMP: TLFDbedit
                    Left = 577
                    Top = 24
                    Width = 110
                    Height = 21
                    DataField = 'SUJETA_NO_EXENTA_BASEIMP'
                    DataSource = DMSII.DSDesgloseFacEmi
                    TabOrder = 5
                  end
                  object DBESUJETA_NO_EXENTA_CUOTAREP: TLFDbedit
                    Left = 577
                    Top = 46
                    Width = 110
                    Height = 21
                    DataField = 'SUJETA_NO_EXENTA_CUOTAREP'
                    DataSource = DMSII.DSDesgloseFacEmi
                    TabOrder = 6
                  end
                  object DBESUJETA_NO_EXENTA_TIPOREC: TLFDbedit
                    Left = 817
                    Top = 2
                    Width = 110
                    Height = 21
                    DataField = 'SUJETA_NO_EXENTA_TIPOREC'
                    DataSource = DMSII.DSDesgloseFacEmi
                    TabOrder = 7
                  end
                  object DBESUJETA_NO_EXENTA_CUOTAREC: TLFDbedit
                    Left = 817
                    Top = 24
                    Width = 110
                    Height = 21
                    DataField = 'SUJETA_NO_EXENTA_CUOTAREC'
                    DataSource = DMSII.DSDesgloseFacEmi
                    TabOrder = 8
                  end
                  object DBENO_SUJETA_IMPORTE_ART_7_14: TLFDbedit
                    Left = 1043
                    Top = 2
                    Width = 110
                    Height = 21
                    DataField = 'NO_SUJETA_IMPORTE_ART_7_14'
                    DataSource = DMSII.DSDesgloseFacEmi
                    TabOrder = 9
                  end
                  object DBENO_SUJETA_IMPORTE_TAI: TLFDbedit
                    Left = 1043
                    Top = 24
                    Width = 110
                    Height = 21
                    DataField = 'NO_SUJETA_IMPORTE_TAI'
                    DataSource = DMSII.DSDesgloseFacEmi
                    TabOrder = 10
                  end
                end
                object TBDesgloseFacturasEmitidas: TLFToolBar
                  Left = 0
                  Top = 0
                  Width = 1170
                  Height = 29
                  Caption = 'TBRegistroFacturasEmitidas'
                  EdgeBorders = []
                  EdgeInner = esNone
                  EdgeOuter = esNone
                  HotImages = DMMain.ILMain_Ac
                  Images = DMMain.ILMain_Ac
                  TabOrder = 1
                  Separators = True
                  object NavDesgloseFacturasEmitidas: THYMNavigator
                    Left = 0
                    Top = 2
                    Width = 234
                    Height = 22
                    DataSource = DMSII.DSDesgloseFacEmi
                    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
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
                end
              end
            end
            object TSTablaRegistroFacturasEmitidas: TTabSheet
              Caption = 'Tabla'
              ImageIndex = 1
              object DBGRegistroFacturasEmitidas: THYTDBGrid
                Left = 0
                Top = 0
                Width = 1170
                Height = 315
                Align = alClient
                Color = clInfoBk
                DataSource = DMSII.DSRLRFacEmi
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnDrawColumnCell = DBGRegistroFacturasDrawColumnCell
                OnDblClick = DBGRegistroFacturasEmitidasDblClick
                IniStorage = FSMain
                Insercion = False
                ColumnaInicial = 0
                UsaDicG2K = True
                Changed = False
                Idioma = 'CAS'
                AutoDeseleccionar = True
                TabFicha = TSFicha
                PermutaPaneles = True
                CamposAOrdenarImgs = DMMain.ILOrdGrid
                CampoAOrdenarColor = clInfoBk
                OrdenMultiple = True
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_SII_REGLRFACTURASEMITIDAS'
                    Width = 45
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ESTADO_REGISTRO'
                    Width = 66
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CODIGO_ERROR'
                    Width = 55
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESCRIPCION_ERROR'
                    Width = 205
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PERIODOIMPOSITIVO_EJERCICIO'
                    Width = 40
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PERIODOIMPOSITIVO_PERIODO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_TIPOFACTURA'
                    Width = 40
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'IDFAC_EMISOR_NUMSERIEFAC'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'IDFAC_EMISOR_NUMSERIEFACFIN'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'IDFAC_EMISOR_FECHA_EXPEDICION'
                    Width = 72
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_CONTRAP_NOMBRE_RAZON'
                    Width = 250
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'IDFAC_EMISOR_NIF'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_CONTRAP_NIF'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_CONTRAPARTE_CODPAIS'
                    Width = 91
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_CONTRAPARTE_IDTYPE'
                    Width = 55
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_CONTRAPARTE_ID'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_CONTRAP_NIF_REPRES'
                    Width = 94
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_FAGR_NUMSERIEFACEMISOR'
                    Width = 123
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_FAGR_FECHAEXPEDICION'
                    Width = 111
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_TIPORECTIFICATIVA'
                    Width = 55
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_NUMREGACUERDOFAC'
                    Width = 95
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_FRECT_NUMSERIEFACEMISOR'
                    Width = 126
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_FRECT_FECHAEXPEDICION'
                    Width = 105
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_IMPRECT_BASERECT'
                    Width = 59
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_IMPRECT_CUOTARECT'
                    Width = 71
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_IMPRECT_CUOTARECRECT'
                    Width = 81
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_FECHAOPERACION'
                    Width = 83
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_CLAVE_REG_ESP'
                    Width = 78
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_CLAVE_REG_ESP1'
                    Width = 91
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_CLAVE_REG_ESP2'
                    Width = 94
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_IMPORTE_TOTAL'
                    Width = 72
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_BASEIMPONIBLEACOSTE'
                    Width = 110
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_DESCRIPCION'
                    Width = 153
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_INMUEBLE_SITUACIONINM'
                    Width = 96
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_INMUEBLE_REFCATASTRAL'
                    Width = 68
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_IMPORTETRANSMSUJETAIVA'
                    Width = 134
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_EMITIDA_POR_TERCEROS'
                    Width = 67
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_VARIOSDESTINATARIOS'
                    Width = 58
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_CUPON'
                    Width = 36
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TIPO_DESGLOSE'
                    Width = 55
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TIPO_DESGLOSE_OPERACION'
                    Width = 89
                    Visible = True
                  end>
              end
            end
            object TSDisponiblesRegistroFacturasEmitidas: TTabSheet
              Caption = 'Disponibles'
              ImageIndex = 2
              object DBGRegistroFacturasEmitidasDisponibles: THYTDBGrid
                Left = 0
                Top = 29
                Width = 1170
                Height = 286
                Align = alClient
                Color = clInfoBk
                DataSource = DMSII.DSRLRFacEmiDisponibles
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                ParentFont = False
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnDrawColumnCell = DBGRegistroFacturasDisponiblesDrawColumnCell
                OnDblClick = DBGRegistroFacturasEmitidasDisponiblesDblClick
                IniStorage = FSMain
                Insercion = False
                ColumnaInicial = 0
                UsaDicG2K = True
                Changed = False
                Idioma = 'CAS'
                AutoDeseleccionar = True
                TabFicha = TSFicha
                PermutaPaneles = True
                CamposAOrdenarImgs = DMMain.ILOrdGrid
                CampoAOrdenarColor = clInfoBk
                OrdenMultiple = True
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_SII_REGLRFACTURASEMITIDAS'
                    Width = 59
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PERIODOIMPOSITIVO_EJERCICIO'
                    Width = 40
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PERIODOIMPOSITIVO_PERIODO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_TIPOFACTURA'
                    Width = 40
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'IDFAC_EMISOR_NUMSERIEFAC'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'IDFAC_EMISOR_NUMSERIEFACFIN'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'IDFAC_EMISOR_FECHA_EXPEDICION'
                    Width = 72
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_CONTRAP_NOMBRE_RAZON'
                    Width = 250
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'IDFAC_EMISOR_NIF'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_CONTRAP_NIF'
                    Width = 65
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_CONTRAPARTE_CODPAIS'
                    Width = 91
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_CONTRAPARTE_IDTYPE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_CONTRAPARTE_ID'
                    Width = 88
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_CONTRAP_NIF_REPRES'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_TIPORECTIFICATIVA'
                    Width = 70
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_FAGR_NUMSERIEFACEMISOR'
                    Width = 123
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_FAGR_FECHAEXPEDICION'
                    Width = 107
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_FRECT_NUMSERIEFACEMISOR'
                    Width = 117
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_FRECT_FECHAEXPEDICION'
                    Width = 90
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_IMPRECT_BASERECT'
                    Width = 65
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_IMPRECT_CUOTARECT'
                    Width = 63
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_IMPRECT_CUOTARECRECT'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_FECHAOPERACION'
                    Width = 79
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_CLAVE_REG_ESP'
                    Width = 84
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_CLAVE_REG_ESP1'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_CLAVE_REG_ESP2'
                    Width = 91
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_NUMREGACUERDOFAC'
                    Width = 90
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_IMPORTE_TOTAL'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_BASEIMPONIBLEACOSTE'
                    Width = 105
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_DESCRIPCION'
                    Width = 207
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_INMUEBLE_SITUACIONINM'
                    Width = 103
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_INMUEBLE_REFCATASTRAL'
                    Width = 101
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_IMPORTETRANSMSUJETAIVA'
                    Width = 134
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_EMITIDA_POR_TERCEROS'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_VARIOSDESTINATARIOS'
                    Width = 98
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACEXP_CUPON'
                    Width = 38
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TIPO_DESGLOSE'
                    Width = 93
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TIPO_DESGLOSE_OPERACION'
                    Width = 85
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ESTADO_REGISTRO'
                    Width = 133
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CODIGO_ERROR'
                    Width = 58
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESCRIPCION_ERROR'
                    Width = 430
                    Visible = True
                  end>
              end
              object PNLSeleccionDisponiblesEmitidas: TLFPanel
                Left = 0
                Top = 0
                Width = 1170
                Height = 29
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 1
                object LSeleccionDisponiblesEmitidas: TLFLabel
                  Left = 69
                  Top = 8
                  Width = 135
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Seleccion Fecha Expedicion'
                end
                object DEDesdeDisponiblesEmitidas: TLFDateEdit
                  Left = 208
                  Top = 4
                  Width = 121
                  Height = 21
                  CheckOnExit = True
                  NumGlyphs = 2
                  TabOrder = 0
                end
                object DEHastaDisponiblesEmitidas: TLFDateEdit
                  Left = 344
                  Top = 4
                  Width = 121
                  Height = 21
                  CheckOnExit = True
                  NumGlyphs = 2
                  TabOrder = 1
                end
                object BSeleccionarDisponiblesEmitidas: TButton
                  Left = 488
                  Top = 4
                  Width = 75
                  Height = 21
                  Caption = 'Seleccionar'
                  TabOrder = 2
                  OnClick = BSeleccionarDisponiblesEmitidasClick
                end
              end
            end
          end
        end
      end
      object TSRecibidas: TTabSheet
        Caption = 'Recibidas'
        ImageIndex = 1
        OnShow = TSRecibidasShow
        object PNLSuministroFacturasRecibidas: TLFPanel
          Left = 0
          Top = 0
          Width = 1178
          Height = 105
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object LTitularSuministroFacturasRecibidas: TLFLabel
            Left = 42
            Top = 81
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Titular'
          end
          object LFechaCreacionSuministroFacturasRecibidas: TLFLabel
            Left = 448
            Top = 36
            Width = 75
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Creacion'
          end
          object LFechaPresentacionSuministroFacturasRecibidas: TLFLabel
            Left = 451
            Top = 58
            Width = 72
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Present.'
          end
          object LIdSuministroFacturasRecibidas: TLFLabel
            Left = 11
            Top = 36
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Id Suministro'
          end
          object LNISuministroFacturasRecibidas: TLFLabel
            Left = 254
            Top = 36
            Width = 17
            Height = 13
            Alignment = taRightJustify
            Caption = 'NIF'
          end
          object LNIFRepresentanteSuministroFacturasRecibidas: TLFLabel
            Left = 214
            Top = 58
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'NIF Repres.'
          end
          object LTipoComunicacionSuministroFacturasRecibidas: TLFLabel
            Left = 3
            Top = 58
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Comunic.'
          end
          object LCSV: TLFLabel
            Left = 736
            Top = 36
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'CSV'
          end
          object LEstadoEnvio: TLFLabel
            Left = 694
            Top = 58
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Estado Envio'
          end
          object DBEFechaCreacionSuministroFacturasRecibidas: TLFDBDateEdit
            Left = 528
            Top = 33
            Width = 121
            Height = 21
            DataField = 'FECHA_CREACION'
            DataSource = DMSII.DSSLRFacRec
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 5
          end
          object DBEFechaPresentacionSuministroFacturasRecibidas: TLFDBDateEdit
            Left = 528
            Top = 55
            Width = 121
            Height = 21
            DataField = 'FECHA_PRESENTACION'
            DataSource = DMSII.DSSLRFacRec
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 6
          end
          object DBEIdSuministroFacturasRecibidas: TLFDbedit
            Left = 76
            Top = 33
            Width = 121
            Height = 21
            DataField = 'ID_SII_SUMLRFACTURASRECIBIDAS'
            DataSource = DMSII.DSSLRFacRec
            TabOrder = 0
            OnChange = DBEIdSuministroFacturasRecibidasChange
          end
          object DBENIFSuministroFacturasRecibidas: TLFDbedit
            Left = 276
            Top = 33
            Width = 121
            Height = 21
            DataField = 'NIF'
            DataSource = DMSII.DSSLRFacRec
            TabOrder = 3
          end
          object DBENIFRepresentanteSuministroFacturasRecibidas: TLFDbedit
            Left = 276
            Top = 55
            Width = 121
            Height = 21
            DataField = 'NIF_REPRESENTANTE'
            DataSource = DMSII.DSSLRFacRec
            TabOrder = 4
          end
          object DBETitularSuministroFacturasRecibidas: TLFDbedit
            Left = 76
            Top = 77
            Width = 573
            Height = 21
            DataField = 'TITULAR_NOMBRE_RAZON'
            DataSource = DMSII.DSSLRFacRec
            TabOrder = 2
          end
          object TBSuministroFacturasRecibidas: TLFToolBar
            Left = 0
            Top = 0
            Width = 1178
            Height = 29
            Caption = 'TBRegistroFacturasEmitidas'
            EdgeInner = esNone
            EdgeOuter = esNone
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 9
            Separators = True
            object NavSuministroFacturasRecibidas: THYMNavigator
              Left = 0
              Top = 2
              Width = 240
              Height = 22
              DataSource = DMSII.DSSLRFacRec
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              Exclusivo = True
              OrdenAscendente = True
              InsertaUltimo = False
              OnClickAfterAdjust = NavSuministroFacturasRecibidasClickAfterAdjust
            end
          end
          object DBECSV: TLFDbedit
            Left = 761
            Top = 33
            Width = 150
            Height = 21
            DataField = 'CSV'
            DataSource = DMSII.DSSLRFacRec
            TabOrder = 7
            OnChange = DBECSVChange
          end
          object DBEESTADO_ENVIO: TLFDbedit
            Left = 761
            Top = 55
            Width = 393
            Height = 21
            DataField = 'ESTADO_ENVIO'
            DataSource = DMSII.DSSLRFacRec
            TabOrder = 8
          end
          object RBCBTipoComunicacionSuministroFacturasRecibidas: TRxDBComboBox
            Left = 76
            Top = 55
            Width = 121
            Height = 21
            Color = clInfoBk
            DataField = 'TIPOCOMUNICACION'
            DataSource = DMSII.DSSLRFacRec
            ItemHeight = 13
            Items.Strings = (
              'Alta'
              'Modificacion'
              'Baja')
            TabOrder = 1
            Values.Strings = (
              'A0'
              'A1'
              'A4')
          end
        end
        object PNLRegistroFacturasRecibidas: TLFPanel
          Left = 0
          Top = 105
          Width = 1178
          Height = 372
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object TBRegistroFacturasRecibidas: TLFToolBar
            Left = 0
            Top = 0
            Width = 1178
            Height = 29
            Caption = 'TBRegistroFacturasEmitidas'
            EdgeInner = esNone
            EdgeOuter = esNone
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 0
            Separators = True
            object NavRegistroFacturasRecibidas: THYMNavigator
              Left = 0
              Top = 2
              Width = 234
              Height = 22
              DataSource = DMSII.DSRLRFacRec
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
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
            object ButtSep2: TToolButton
              Left = 234
              Top = 2
              Width = 8
              Style = tbsSeparator
            end
            object TButtIrADocumentoRecibidas: TToolButton
              Left = 242
              Top = 2
              Action = AIrADocumentoRecibidas
            end
            object TButtIrARegistroIVARecibidas: TToolButton
              Left = 265
              Top = 2
              Action = AIrARegistroIVARecibidas
            end
          end
          object PCRegistroFacturasRecibidas: TLFPageControl
            Left = 0
            Top = 29
            Width = 1178
            Height = 343
            ActivePage = TSFichaRegistroFacturasRecibidas
            Align = alClient
            OwnerDraw = True
            TabIndex = 0
            TabOrder = 1
            OnChange = PCRegistroFacturasRecibidasChange
            TabActiveColor = clWhite
            TabInactiveColor = 14936298
            object TSFichaRegistroFacturasRecibidas: TTabSheet
              Caption = 'Ficha'
              object PNLRegistroFacturasRecibidasDatos: TLFPanel
                Left = 0
                Top = 0
                Width = 1170
                Height = 203
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 0
                object LFLabel74: TLFLabel
                  Left = 216
                  Top = 140
                  Width = 119
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'F. Agr. N. Ser. F. Emi. Fin'
                end
                object LFLabel14: TLFLabel
                  Left = 46
                  Top = 7
                  Width = 51
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Id Registro'
                end
                object LFLabel39: TLFLabel
                  Left = 12
                  Top = 29
                  Width = 85
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Per. Imp. Ejercicio'
                end
                object LFLabel40: TLFLabel
                  Left = 16
                  Top = 51
                  Width = 81
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Per. Imp. Periodo'
                end
                object LFLabel41: TLFLabel
                  Left = 46
                  Top = 73
                  Width = 51
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Emisor NIF'
                end
                object LFLabel42: TLFLabel
                  Left = 18
                  Top = 95
                  Width = 79
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Emisor Cod. Pais'
                end
                object LFLabel43: TLFLabel
                  Left = 30
                  Top = 117
                  Width = 67
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Emisor IdType'
                end
                object LFLabel44: TLFLabel
                  Left = 54
                  Top = 139
                  Width = 43
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Emisor Id'
                end
                object LFLabel45: TLFLabel
                  Left = 223
                  Top = 29
                  Width = 113
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Emi. N. Serie F. Emi. Fin'
                end
                object LFLabel46: TLFLabel
                  Left = 227
                  Top = 51
                  Width = 110
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Emisor Fec. Expedicion'
                end
                object LFLabel47: TLFLabel
                  Left = 277
                  Top = 73
                  Width = 60
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Tipo Factura'
                end
                object LFLabel48: TLFLabel
                  Left = 254
                  Top = 95
                  Width = 83
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Tipo Rectificativa'
                end
                object LFLabel49: TLFLabel
                  Left = 246
                  Top = 161
                  Width = 91
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'F. Agr. Fec. Exped.'
                end
                object LFLabel50: TLFLabel
                  Left = 461
                  Top = 7
                  Width = 114
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'F. Rect. N. Serie F. Emi.'
                end
                object LFLabel51: TLFLabel
                  Left = 475
                  Top = 29
                  Width = 98
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'F. Rect. Fec. Exped.'
                end
                object LFLabel52: TLFLabel
                  Left = 508
                  Top = 51
                  Width = 65
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'F. Rect. Base'
                end
                object LFLabel53: TLFLabel
                  Left = 504
                  Top = 73
                  Width = 69
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'F. Rect. Cuota'
                end
                object LFLabel54: TLFLabel
                  Left = 478
                  Top = 95
                  Width = 95
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'F. Rect. Cuota Rec.'
                end
                object LFLabel55: TLFLabel
                  Left = 968
                  Top = 51
                  Width = 73
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Fec. Operacion'
                end
                object LFLabel56: TLFLabel
                  Left = 496
                  Top = 117
                  Width = 77
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Clave Reg. Esp.'
                end
                object LFLabel57: TLFLabel
                  Left = 487
                  Top = 139
                  Width = 86
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Clave Reg. Esp. 1'
                end
                object LFLabel58: TLFLabel
                  Left = 487
                  Top = 161
                  Width = 86
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Clave Reg. Esp. 2'
                end
                object LFLabel59: TLFLabel
                  Left = 697
                  Top = 6
                  Width = 114
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Contrap. Nombre Razon'
                end
                object LFLabel60: TLFLabel
                  Left = 751
                  Top = 29
                  Width = 60
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Contrap. NIF'
                end
                object LFLabel61: TLFLabel
                  Left = 722
                  Top = 51
                  Width = 89
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Contrap. NIF Repr.'
                end
                object LFLabel62: TLFLabel
                  Left = 723
                  Top = 73
                  Width = 88
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Contrap. Cod. Pais'
                end
                object LFLabel63: TLFLabel
                  Left = 735
                  Top = 94
                  Width = 76
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Contrap. IdType'
                end
                object LFLabel64: TLFLabel
                  Left = 759
                  Top = 116
                  Width = 52
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Contrap. Id'
                end
                object LFLabel65: TLFLabel
                  Left = 937
                  Top = 73
                  Width = 104
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'N. Reg. Acuedro Fac.'
                end
                object LFLabel66: TLFLabel
                  Left = 979
                  Top = 95
                  Width = 62
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Importe Total'
                end
                object LFLabel67: TLFLabel
                  Left = 954
                  Top = 116
                  Width = 87
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Base Imp. A Coste'
                end
                object LFLabel68: TLFLabel
                  Left = 41
                  Top = 161
                  Width = 56
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Descripcion'
                end
                object LFLabel69: TLFLabel
                  Left = 715
                  Top = 138
                  Width = 96
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Aduanas Num. DUA'
                end
                object LFLabel70: TLFLabel
                  Left = 668
                  Top = 160
                  Width = 143
                  Height = 13
                  Hint = 'Aduanas Fec. Reg. Con. DUA'
                  Alignment = taRightJustify
                  Caption = 'Aduanas Fec. Reg. Con. DUA'
                  ParentShowHint = False
                  ShowHint = True
                end
                object LFLabel71: TLFLabel
                  Left = 948
                  Top = 160
                  Width = 92
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Fec. Reg. Contable'
                end
                object LFLabel72: TLFLabel
                  Left = 962
                  Top = 138
                  Width = 79
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Cuota Deducible'
                end
                object LFLabel73: TLFLabel
                  Left = 229
                  Top = 7
                  Width = 107
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Emisor N. Serie F. Emi.'
                end
                object LEstadoRegistro: TLFLabel
                  Left = 22
                  Top = 182
                  Width = 75
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Estado Registro'
                end
                object DBEFACREC_ADUANAS_FECHAREGCONTDUA: TLFDbedit
                  Left = 815
                  Top = 157
                  Width = 110
                  Height = 21
                  DataField = 'FACREC_ADUANAS_FECHAREGCONTDUA'
                  DataSource = DMSII.DSRLRFacRec
                  TabOrder = 31
                end
                object DBEFACREC_ADUANAS_NUMERODUA: TLFDbedit
                  Left = 815
                  Top = 135
                  Width = 110
                  Height = 21
                  DataField = 'FACREC_ADUANAS_NUMERODUA'
                  DataSource = DMSII.DSRLRFacRec
                  TabOrder = 30
                end
                object DBEFACREC_BASEIMPONIBLEACOSTE: TLFDbedit
                  Left = 1043
                  Top = 113
                  Width = 110
                  Height = 21
                  DataField = 'FACREC_BASEIMPONIBLEACOSTE'
                  DataSource = DMSII.DSRLRFacRec
                  TabOrder = 35
                end
                object DBEFACREC_CLAVE_REG_ESP: TLFDbedit
                  Left = 577
                  Top = 113
                  Width = 110
                  Height = 21
                  DataField = 'FACREC_CLAVE_REG_ESP'
                  DataSource = DMSII.DSRLRFacRec
                  TabOrder = 21
                end
                object DBEFACREC_CLAVE_REG_ESP1: TLFDbedit
                  Left = 577
                  Top = 135
                  Width = 110
                  Height = 21
                  DataField = 'FACREC_CLAVE_REG_ESP1'
                  DataSource = DMSII.DSRLRFacRec
                  TabOrder = 22
                end
                object DBEFACREC_CLAVE_REG_ESP2: TLFDbedit
                  Left = 577
                  Top = 157
                  Width = 110
                  Height = 21
                  DataField = 'FACREC_CLAVE_REG_ESP2'
                  DataSource = DMSII.DSRLRFacRec
                  TabOrder = 23
                end
                object DBEFACREC_CONTRAP_NIF: TLFDbedit
                  Left = 815
                  Top = 25
                  Width = 110
                  Height = 21
                  DataField = 'FACREC_CONTRAP_NIF'
                  DataSource = DMSII.DSRLRFacRec
                  TabOrder = 25
                end
                object DBEFACREC_CONTRAP_NIF_REPRES: TLFDbedit
                  Left = 815
                  Top = 47
                  Width = 110
                  Height = 21
                  DataField = 'FACREC_CONTRAP_NIF_REPRES'
                  DataSource = DMSII.DSRLRFacRec
                  TabOrder = 26
                end
                object DBEFACREC_CONTRAP_NOMBRE_RAZON: TLFDbedit
                  Left = 816
                  Top = 3
                  Width = 338
                  Height = 21
                  DataField = 'FACREC_CONTRAP_NOMBRE_RAZON'
                  DataSource = DMSII.DSRLRFacRec
                  TabOrder = 24
                end
                object DBEFACREC_CONTRAPARTE_CODPAIS: TLFDbedit
                  Left = 815
                  Top = 69
                  Width = 110
                  Height = 21
                  DataField = 'FACREC_CONTRAPARTE_CODPAIS'
                  DataSource = DMSII.DSRLRFacRec
                  TabOrder = 27
                end
                object DBEFACREC_CONTRAPARTE_ID: TLFDbedit
                  Left = 815
                  Top = 113
                  Width = 110
                  Height = 21
                  DataField = 'FACREC_CONTRAPARTE_ID'
                  DataSource = DMSII.DSRLRFacRec
                  TabOrder = 29
                end
                object DBEFACREC_CONTRAPARTE_IDTYPE: TLFDbedit
                  Left = 815
                  Top = 91
                  Width = 110
                  Height = 21
                  DataField = 'FACREC_CONTRAPARTE_IDTYPE'
                  DataSource = DMSII.DSRLRFacRec
                  TabOrder = 28
                end
                object DBEFACREC_CUOTA_DEDUCIBLE: TLFDbedit
                  Left = 1043
                  Top = 135
                  Width = 110
                  Height = 21
                  DataField = 'FACREC_CUOTA_DEDUCIBLE'
                  DataSource = DMSII.DSRLRFacRec
                  TabOrder = 36
                end
                object DBEFACREC_DESCRIPCION: TLFDbedit
                  Left = 101
                  Top = 157
                  Width = 110
                  Height = 21
                  DataField = 'FACREC_DESCRIPCION'
                  DataSource = DMSII.DSRLRFacRec
                  TabOrder = 7
                end
                object DBEFACREC_FAGR_FECHAEXPEDICION: TLFDbedit
                  Left = 339
                  Top = 157
                  Width = 110
                  Height = 21
                  DataField = 'FACREC_FAGR_FECHAEXPEDICION'
                  DataSource = DMSII.DSRLRFacRec
                  TabOrder = 15
                end
                object DBEFACREC_FAGR_NUMSERIEFACEMISOR: TLFDbedit
                  Left = 339
                  Top = 135
                  Width = 110
                  Height = 21
                  DataField = 'FACREC_FAGR_NUMSERIEFACEMISOR'
                  DataSource = DMSII.DSRLRFacRec
                  TabOrder = 14
                end
                object DBEFACREC_FECHAOPERACION: TLFDbedit
                  Left = 1043
                  Top = 47
                  Width = 110
                  Height = 21
                  DataField = 'FACREC_FECHAOPERACION'
                  DataSource = DMSII.DSRLRFacRec
                  TabOrder = 32
                end
                object DBEFACREC_FECHAREGCONTABLE: TLFDbedit
                  Left = 1043
                  Top = 157
                  Width = 110
                  Height = 21
                  DataField = 'FACREC_FECHAREGCONTABLE'
                  DataSource = DMSII.DSRLRFacRec
                  TabOrder = 37
                end
                object DBEFACREC_FRECT_FECHAEXPEDICION: TLFDbedit
                  Left = 577
                  Top = 25
                  Width = 110
                  Height = 21
                  DataField = 'FACREC_FRECT_FECHAEXPEDICION'
                  DataSource = DMSII.DSRLRFacRec
                  TabOrder = 17
                end
                object DBEFACREC_FRECT_NUMSERIEFACEMISOR: TLFDbedit
                  Left = 577
                  Top = 3
                  Width = 110
                  Height = 21
                  DataField = 'FACREC_FRECT_NUMSERIEFACEMISOR'
                  DataSource = DMSII.DSRLRFacRec
                  TabOrder = 16
                end
                object DBEFACREC_IMPORTE_TOTAL: TLFDbedit
                  Left = 1043
                  Top = 91
                  Width = 110
                  Height = 21
                  DataField = 'FACREC_IMPORTE_TOTAL'
                  DataSource = DMSII.DSRLRFacRec
                  TabOrder = 34
                end
                object DBEFACREC_IMPRECT_BASERECT: TLFDbedit
                  Left = 577
                  Top = 47
                  Width = 110
                  Height = 21
                  DataField = 'FACREC_IMPRECT_BASERECT'
                  DataSource = DMSII.DSRLRFacRec
                  TabOrder = 18
                end
                object DBEFACREC_IMPRECT_CUOTARECRECT: TLFDbedit
                  Left = 577
                  Top = 91
                  Width = 110
                  Height = 21
                  DataField = 'FACREC_IMPRECT_CUOTARECRECT'
                  DataSource = DMSII.DSRLRFacRec
                  TabOrder = 20
                end
                object DBEFACREC_IMPRECT_CUOTARECT: TLFDbedit
                  Left = 577
                  Top = 69
                  Width = 110
                  Height = 21
                  DataField = 'FACREC_IMPRECT_CUOTARECT'
                  DataSource = DMSII.DSRLRFacRec
                  TabOrder = 19
                end
                object DBEFACREC_NUMREGACUERDOFAC: TLFDbedit
                  Left = 1043
                  Top = 69
                  Width = 110
                  Height = 21
                  DataField = 'FACREC_NUMREGACUERDOFAC'
                  DataSource = DMSII.DSRLRFacRec
                  TabOrder = 33
                end
                object DBEFACREC_TIPOFACTURA: TLFDbedit
                  Left = 339
                  Top = 69
                  Width = 110
                  Height = 21
                  DataField = 'FACREC_TIPOFACTURA'
                  DataSource = DMSII.DSRLRFacRec
                  TabOrder = 12
                end
                object DBEFACREC_TIPORECTIFICATIVA: TLFDbedit
                  Left = 339
                  Top = 91
                  Width = 110
                  Height = 21
                  DataField = 'FACREC_TIPORECTIFICATIVA'
                  DataSource = DMSII.DSRLRFacRec
                  TabOrder = 13
                end
                object DBEID_SII_REGLRFACTURASRECIBIDAS: TLFDbedit
                  Left = 101
                  Top = 3
                  Width = 110
                  Height = 21
                  DataField = 'ID_SII_REGLRFACTURASRECIBIDAS'
                  DataSource = DMSII.DSRLRFacRec
                  TabOrder = 0
                end
                object DBEIDFAC_EMISOR_FECHA_EXPEDICION: TLFDbedit
                  Left = 339
                  Top = 47
                  Width = 110
                  Height = 21
                  DataField = 'IDFAC_EMISOR_FECHA_EXPEDICION'
                  DataSource = DMSII.DSRLRFacRec
                  TabOrder = 11
                end
                object DBEIDFAC_EMISOR_NIF1: TLFDbedit
                  Left = 101
                  Top = 69
                  Width = 110
                  Height = 21
                  DataField = 'IDFAC_EMISOR_NIF'
                  DataSource = DMSII.DSRLRFacRec
                  TabOrder = 3
                end
                object DBEIDFAC_EMISOR_NUMSERIEFAC1: TLFDbedit
                  Left = 339
                  Top = 3
                  Width = 110
                  Height = 21
                  DataField = 'IDFAC_EMISOR_NUMSERIEFAC'
                  DataSource = DMSII.DSRLRFacRec
                  TabOrder = 9
                end
                object DBEIDFAC_EMISOR_NUMSERIEFACFIN1: TLFDbedit
                  Left = 339
                  Top = 25
                  Width = 110
                  Height = 21
                  DataField = 'IDFAC_EMISOR_NUMSERIEFACFIN'
                  DataSource = DMSII.DSRLRFacRec
                  TabOrder = 10
                end
                object DBEIDFAC_EMISOR_OTRO_CODPAIS: TLFDbedit
                  Left = 101
                  Top = 91
                  Width = 110
                  Height = 21
                  DataField = 'IDFAC_EMISOR_OTRO_CODPAIS'
                  DataSource = DMSII.DSRLRFacRec
                  TabOrder = 4
                end
                object DBEIDFAC_EMISOR_OTRO_ID: TLFDbedit
                  Left = 101
                  Top = 135
                  Width = 110
                  Height = 21
                  DataField = 'IDFAC_EMISOR_OTRO_ID'
                  DataSource = DMSII.DSRLRFacRec
                  TabOrder = 6
                end
                object DBEIDFAC_EMISOR_OTRO_IDTYPE: TLFDbedit
                  Left = 101
                  Top = 113
                  Width = 110
                  Height = 21
                  DataField = 'IDFAC_EMISOR_OTRO_IDTYPE'
                  DataSource = DMSII.DSRLRFacRec
                  TabOrder = 5
                end
                object DBEPERIODOIMPOSITIVO_EJERCICIO1: TLFDbedit
                  Left = 101
                  Top = 25
                  Width = 110
                  Height = 21
                  DataField = 'PERIODOIMPOSITIVO_EJERCICIO'
                  DataSource = DMSII.DSRLRFacRec
                  TabOrder = 1
                end
                object DBEPERIODOIMPOSITIVO_PERIODO1: TLFDbedit
                  Left = 101
                  Top = 47
                  Width = 110
                  Height = 21
                  DataField = 'PERIODOIMPOSITIVO_PERIODO'
                  DataSource = DMSII.DSRLRFacRec
                  TabOrder = 2
                end
                object DBEESTADO_REGISTRO: TLFDbedit
                  Left = 101
                  Top = 179
                  Width = 110
                  Height = 21
                  DataField = 'ESTADO_REGISTRO'
                  DataSource = DMSII.DSRLRFacRec
                  TabOrder = 8
                  OnChange = DBEESTADO_REGISTROChange
                end
                object DBEDESCRIPCION_ERROR: TLFDbedit
                  Left = 339
                  Top = 179
                  Width = 814
                  Height = 21
                  DataField = 'DESCRIPCION_ERROR'
                  DataSource = DMSII.DSRLRFacRec
                  TabOrder = 39
                end
                object DBECODIGO_ERROR: TLFDbedit
                  Left = 228
                  Top = 179
                  Width = 110
                  Height = 21
                  DataField = 'CODIGO_ERROR'
                  DataSource = DMSII.DSRLRFacRec
                  TabOrder = 38
                end
              end
              object PNLDesgloseRegistroFacturasRecibidas: TLFPanel
                Left = 0
                Top = 203
                Width = 1170
                Height = 112
                Align = alClient
                BevelOuter = bvNone
                TabOrder = 1
                object TBDesgloseRegistroFacturasRecibidas: TLFToolBar
                  Left = 0
                  Top = 0
                  Width = 1170
                  Height = 29
                  Caption = 'TBRegistroFacturasEmitidas'
                  EdgeInner = esNone
                  EdgeOuter = esNone
                  HotImages = DMMain.ILMain_Ac
                  Images = DMMain.ILMain_Ac
                  TabOrder = 0
                  Separators = True
                  object NavDesgloseRegistroFacturasRecibidas: THYMNavigator
                    Left = 0
                    Top = 2
                    Width = 234
                    Height = 22
                    DataSource = DMSII.DSDesgloseFacRec
                    VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
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
                end
                object DBCGDesgloseFacRec: TLFDBCtrlGrid
                  Left = 0
                  Top = 29
                  Width = 1170
                  Height = 83
                  Align = alClient
                  ColCount = 1
                  DataSource = DMSII.DSDesgloseFacRec
                  PanelBorder = gbNone
                  PanelHeight = 83
                  PanelWidth = 1154
                  TabOrder = 1
                  RowCount = 1
                  object LFLabel86: TLFLabel
                    Left = 88
                    Top = 6
                    Width = 9
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'Id'
                  end
                  object LFLabel87: TLFLabel
                    Left = 711
                    Top = 6
                    Width = 100
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'I.S.P. Tipo Impositivo'
                  end
                  object LFLabel88: TLFLabel
                    Left = 758
                    Top = 28
                    Width = 53
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'I.S.P. Base'
                  end
                  object LFLabel89: TLFLabel
                    Left = 941
                    Top = 6
                    Width = 95
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'I.S.P. Tipo Rec. Eq.'
                  end
                  object LFLabel90: TLFLabel
                    Left = 937
                    Top = 28
                    Width = 102
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'I.S.P. Cuota Rec. Eq.'
                  end
                  object LFLabel91: TLFLabel
                    Left = 244
                    Top = 6
                    Width = 91
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'D.I. Tipo Impositivo'
                  end
                  object LFLabel92: TLFLabel
                    Left = 291
                    Top = 28
                    Width = 44
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'D.I. Base'
                  end
                  object LFLabel93: TLFLabel
                    Left = 289
                    Top = 50
                    Width = 48
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'D.I. Cuota'
                  end
                  object LFLabel94: TLFLabel
                    Left = 488
                    Top = 6
                    Width = 86
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'D.I. Tipo Rec. Eq.'
                  end
                  object LFLabel95: TLFLabel
                    Left = 481
                    Top = 28
                    Width = 93
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'D.I. Cuota Rec. Eq.'
                  end
                  object LFLabel96: TLFLabel
                    Left = 755
                    Top = 50
                    Width = 57
                    Height = 13
                    Alignment = taRightJustify
                    Caption = 'I.S.P. Cuota'
                  end
                  object LFLabel97: TLFLabel
                    Left = -29
                    Top = 28
                    Width = 125
                    Height = 13
                    Hint = 'Desglose IVA Porcentaje Compensacion REAGYP'
                    Alignment = taRightJustify
                    Caption = 'D.I. Porc. Comp. REAGYP'
                    ParentShowHint = False
                    ShowHint = True
                  end
                  object LFLabel98: TLFLabel
                    Left = -23
                    Top = 50
                    Width = 120
                    Height = 13
                    Hint = 'Desglose IVA Importe Compensacion REAGYP'
                    Alignment = taRightJustify
                    Caption = 'D.I. Imp. Comp. REAGYP'
                    ParentShowHint = False
                    ShowHint = True
                  end
                  object DBEID_SII_DESGLOSEFACTURA_REC: TLFDbedit
                    Left = 100
                    Top = 2
                    Width = 110
                    Height = 21
                    DataField = 'ID_SII_DESGLOSEFACTURA_REC'
                    DataSource = DMSII.DSDesgloseFacRec
                    TabOrder = 0
                  end
                  object DBEISP_TIPOIMPOSITIVO: TLFDbedit
                    Left = 815
                    Top = 2
                    Width = 110
                    Height = 21
                    DataField = 'ISP_TIPOIMPOSITIVO'
                    DataSource = DMSII.DSDesgloseFacRec
                    TabOrder = 8
                  end
                  object DBEISP_BASEIMPONIBLE: TLFDbedit
                    Left = 815
                    Top = 24
                    Width = 110
                    Height = 21
                    DataField = 'ISP_BASEIMPONIBLE'
                    DataSource = DMSII.DSDesgloseFacRec
                    TabOrder = 9
                  end
                  object DBEISP_CUOTASOPORTADA: TLFDbedit
                    Left = 815
                    Top = 46
                    Width = 110
                    Height = 21
                    DataField = 'ISP_CUOTASOPORTADA'
                    DataSource = DMSII.DSDesgloseFacRec
                    TabOrder = 10
                  end
                  object DBEISP_TIPORECARGOEQUIVALENCIA: TLFDbedit
                    Left = 1043
                    Top = 2
                    Width = 110
                    Height = 21
                    DataField = 'ISP_TIPORECARGOEQUIVALENCIA'
                    DataSource = DMSII.DSDesgloseFacRec
                    TabOrder = 11
                  end
                  object DBEISP_CUOTARECARGOEQUIVALENCIA: TLFDbedit
                    Left = 1043
                    Top = 24
                    Width = 110
                    Height = 21
                    DataField = 'ISP_CUOTARECARGOEQUIVALENCIA'
                    DataSource = DMSII.DSDesgloseFacRec
                    TabOrder = 12
                  end
                  object DBEDI_TIPOIMPOSITIVO: TLFDbedit
                    Left = 339
                    Top = 2
                    Width = 110
                    Height = 21
                    DataField = 'DI_TIPOIMPOSITIVO'
                    DataSource = DMSII.DSDesgloseFacRec
                    TabOrder = 3
                  end
                  object DBEDI_BASEIMPONIBLE: TLFDbedit
                    Left = 339
                    Top = 24
                    Width = 110
                    Height = 21
                    DataField = 'DI_BASEIMPONIBLE'
                    DataSource = DMSII.DSDesgloseFacRec
                    TabOrder = 4
                  end
                  object DBEDI_CUOTASOPORTADA: TLFDbedit
                    Left = 339
                    Top = 46
                    Width = 110
                    Height = 21
                    DataField = 'DI_CUOTASOPORTADA'
                    DataSource = DMSII.DSDesgloseFacRec
                    TabOrder = 5
                  end
                  object DBEDI_TIPORECARGOEQUIVALENCIA: TLFDbedit
                    Left = 577
                    Top = 2
                    Width = 110
                    Height = 21
                    DataField = 'DI_TIPORECARGOEQUIVALENCIA'
                    DataSource = DMSII.DSDesgloseFacRec
                    TabOrder = 6
                  end
                  object DBEDI_CUOTARECARGOEQUIVALENCIA: TLFDbedit
                    Left = 577
                    Top = 24
                    Width = 110
                    Height = 21
                    DataField = 'DI_CUOTARECARGOEQUIVALENCIA'
                    DataSource = DMSII.DSDesgloseFacRec
                    TabOrder = 7
                  end
                  object DBEDI_PORCENTCOMPSENSACIONREAGYP: TLFDbedit
                    Left = 100
                    Top = 24
                    Width = 110
                    Height = 21
                    DataField = 'DI_PORCENTCOMPSENSACIONREAGYP'
                    DataSource = DMSII.DSDesgloseFacRec
                    TabOrder = 1
                  end
                  object DBEDI_IMPORTECOMPSENSACIONREAGYP: TLFDbedit
                    Left = 100
                    Top = 46
                    Width = 110
                    Height = 21
                    DataField = 'DI_IMPORTECOMPSENSACIONREAGYP'
                    DataSource = DMSII.DSDesgloseFacRec
                    TabOrder = 2
                  end
                end
              end
            end
            object TSTablaRegistroFacturasRecibidas: TTabSheet
              Caption = 'Tabla'
              ImageIndex = 1
              object DBGRegistroFacturasRecibidas: THYTDBGrid
                Left = 0
                Top = 0
                Width = 1170
                Height = 315
                Align = alClient
                Color = clInfoBk
                DataSource = DMSII.DSRLRFacRec
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                ParentFont = False
                ReadOnly = True
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnDrawColumnCell = DBGRegistroFacturasDrawColumnCell
                OnDblClick = DBGRegistroFacturasRecibidasDblClick
                IniStorage = FSMain
                Insercion = False
                ColumnaInicial = 0
                UsaDicG2K = True
                Changed = False
                Idioma = 'CAS'
                AutoDeseleccionar = True
                TabFicha = TSFicha
                PermutaPaneles = True
                CamposAOrdenarImgs = DMMain.ILOrdGrid
                CampoAOrdenarColor = clInfoBk
                OrdenMultiple = True
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_SII_REGLRFACTURASRECIBIDAS'
                    Width = 78
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ESTADO_REGISTRO'
                    Width = 66
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CODIGO_ERROR'
                    Width = 56
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESCRIPCION_ERROR'
                    Width = 241
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PERIODOIMPOSITIVO_EJERCICIO'
                    Width = 40
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PERIODOIMPOSITIVO_PERIODO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_FECHAREGCONTABLE'
                    Width = 72
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'IDFAC_EMISOR_NUMSERIEFAC'
                    Width = 110
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'IDFAC_EMISOR_FECHA_EXPEDICION'
                    Width = 72
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_CONTRAP_NOMBRE_RAZON'
                    Width = 250
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'IDFAC_EMISOR_NIF'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'IDFAC_EMISOR_OTRO_CODPAIS'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'IDFAC_EMISOR_OTRO_IDTYPE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'IDFAC_EMISOR_OTRO_ID'
                    Width = 105
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_TIPOFACTURA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_TIPORECTIFICATIVA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_FAGR_NUMSERIEFACEMISOR'
                    Width = 124
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_FAGR_FECHAEXPEDICION'
                    Width = 108
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_FRECT_NUMSERIEFACEMISOR'
                    Width = 121
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_FRECT_FECHAEXPEDICION'
                    Width = 99
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_IMPRECT_BASERECT'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_IMPRECT_CUOTARECT'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_IMPRECT_CUOTARECRECT'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_FECHAOPERACION'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_CLAVE_REG_ESP'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_CLAVE_REG_ESP1'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_CLAVE_REG_ESP2'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_NUMREGACUERDOFAC'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_IMPORTE_TOTAL'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_BASEIMPONIBLEACOSTE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_DESCRIPCION'
                    Width = 239
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_ADUANAS_NUMERODUA'
                    Width = 127
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_ADUANAS_FECHAREGCONTDUA'
                    Width = 81
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_CONTRAP_NIF_REPRES'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_CONTRAP_NIF'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_CONTRAPARTE_CODPAIS'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_CONTRAPARTE_IDTYPE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_CONTRAPARTE_ID'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_CUOTA_DEDUCIBLE'
                    Visible = True
                  end>
              end
            end
            object TSDisponiblesTSRegistroFacturasRecibidas: TTabSheet
              Caption = 'Disponibles'
              ImageIndex = 2
              object DBGRegistroFacturasRecibidasDisponibles: THYTDBGrid
                Left = 0
                Top = 29
                Width = 1170
                Height = 286
                Align = alClient
                Color = clInfoBk
                DataSource = DMSII.DSRLRFacRecDisponibles
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                ParentFont = False
                TabOrder = 0
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                OnDrawColumnCell = DBGRegistroFacturasDisponiblesDrawColumnCell
                OnDblClick = DBGRegistroFacturasRecibidasDisponiblesDblClick
                IniStorage = FSMain
                Insercion = False
                ColumnaInicial = 0
                UsaDicG2K = True
                Changed = False
                Idioma = 'CAS'
                AutoDeseleccionar = True
                TabFicha = TSFicha
                PermutaPaneles = True
                CamposAOrdenarImgs = DMMain.ILOrdGrid
                CampoAOrdenarColor = clInfoBk
                OrdenMultiple = True
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'ID_SII_REGLRFACTURASRECIBIDAS'
                    Width = 56
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PERIODOIMPOSITIVO_EJERCICIO'
                    Width = 40
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PERIODOIMPOSITIVO_PERIODO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_FECHAREGCONTABLE'
                    Width = 96
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'IDFAC_EMISOR_NUMSERIEFAC'
                    Width = 118
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'IDFAC_EMISOR_FECHA_EXPEDICION'
                    Width = 69
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_CONTRAP_NOMBRE_RAZON'
                    Width = 250
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'IDFAC_EMISOR_NIF'
                    Width = 106
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'IDFAC_EMISOR_OTRO_CODPAIS'
                    Width = 50
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'IDFAC_EMISOR_OTRO_IDTYPE'
                    Width = 47
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'IDFAC_EMISOR_OTRO_ID'
                    Width = 109
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'IDFAC_EMISOR_NUMSERIEFACFIN'
                    Width = 97
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_TIPOFACTURA'
                    Width = 38
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_TIPORECTIFICATIVA'
                    Width = 50
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_FAGR_NUMSERIEFACEMISOR'
                    Width = 118
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_FAGR_FECHAEXPEDICION'
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_FRECT_NUMSERIEFACEMISOR'
                    Width = 119
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_FRECT_FECHAEXPEDICION'
                    Width = 101
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_IMPRECT_BASERECT'
                    Width = 66
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_IMPRECT_CUOTARECT'
                    Width = 67
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_IMPRECT_CUOTARECRECT'
                    Width = 77
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_FECHAOPERACION'
                    Width = 80
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_CLAVE_REG_ESP'
                    Width = 82
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_CLAVE_REG_ESP1'
                    Width = 89
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_CLAVE_REG_ESP2'
                    Width = 88
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_NUMREGACUERDOFAC'
                    Width = 98
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_IMPORTE_TOTAL'
                    Width = 81
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_BASEIMPONIBLEACOSTE'
                    Width = 104
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_DESCRIPCION'
                    Width = 93
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_ADUANAS_NUMERODUA'
                    Width = 106
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_ADUANAS_FECHAREGCONTDUA'
                    Width = 78
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_CONTRAP_NIF_REPRES'
                    Width = 89
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_CONTRAP_NIF'
                    Width = 102
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_CONTRAPARTE_CODPAIS'
                    Width = 59
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_CONTRAPARTE_IDTYPE'
                    Width = 56
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_CONTRAPARTE_ID'
                    Width = 81
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FACREC_CUOTA_DEDUCIBLE'
                    Width = 85
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESCRIPCION_ERROR'
                    Width = 431
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ESTADO_REGISTRO'
                    Width = 87
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CODIGO_ERROR'
                    Width = 54
                    Visible = True
                  end>
              end
              object PNLSeleccionDisponiblesRecibidas: TLFPanel
                Left = 0
                Top = 0
                Width = 1170
                Height = 29
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 1
                object LSeleccionDisponiblesRecibidas: TLFLabel
                  Left = 50
                  Top = 8
                  Width = 154
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Seleccion Fecha Contabilizacion'
                end
                object DEDesdeDisponiblesRecibidas: TLFDateEdit
                  Left = 208
                  Top = 4
                  Width = 121
                  Height = 21
                  CheckOnExit = True
                  NumGlyphs = 2
                  TabOrder = 0
                end
                object DEHastaDisponiblesRecibidas: TLFDateEdit
                  Left = 344
                  Top = 4
                  Width = 121
                  Height = 21
                  CheckOnExit = True
                  NumGlyphs = 2
                  TabOrder = 1
                end
                object BSeleccionarDisponiblesRecibidas: TButton
                  Left = 488
                  Top = 4
                  Width = 75
                  Height = 21
                  Caption = 'Seleccionar'
                  TabOrder = 2
                  OnClick = BSeleccionarDisponiblesRecibidasClick
                end
              end
            end
          end
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 612
    Width = 1190
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AGenerarPresentacion: TAction
      Category = 'Procesos'
      Caption = 'Generar Presentacion'
      ImageIndex = 57
      OnExecute = AGenerarPresentacionExecute
    end
    object AEnviarPresentacion: TAction
      Category = 'Procesos'
      Caption = 'Enviar Presentacion'
      Hint = 'Enviar Presentacion'
      ImageIndex = 36
      OnExecute = AEnviarPresentacionExecute
    end
    object AGuardarFicheroPresentacion: TAction
      Category = 'Procesos'
      Caption = 'Guardar Fichero Presentacion'
      Hint = 'Guardar Fichero Presentacion'
      ImageIndex = 41
      OnExecute = AGuardarFicheroPresentacionExecute
    end
    object AGuardarFicheroRespuesta: TAction
      Category = 'Procesos'
      Caption = 'Guardar Fichero Respuesta'
      Hint = 'Guardar Fichero Respuesta'
      ImageIndex = 41
      OnExecute = AGuardarFicheroRespuestaExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Enlaces'
      Caption = 'Enlaces'
      ImageIndex = 97
    end
    object AIrADocumentoEmitidas: TAction
      Category = 'Enlaces'
      Caption = 'Ir a Documento emitido'
      Hint = 'Ir al Documento de Factura emitida'
      ImageIndex = 61
      OnExecute = AIrADocumentoEmitidasExecute
    end
    object AIrADocumentoRecibidas: TAction
      Category = 'Enlaces'
      Caption = 'Ir a Documento recibido'
      Hint = 'Ir al Documento de Factura recibida'
      ImageIndex = 61
      OnExecute = AIrADocumentoRecibidasExecute
    end
    object AIrARegistroIVAEmitidas: TAction
      Category = 'Enlaces'
      Caption = 'Ir a Registro de IVA emitido'
      Hint = 'Ir al Registro de IVA de la factura emitida'
      ImageIndex = 110
      OnExecute = AIrARegistroIVAEmitidasExecute
    end
    object AIrARegistroIVARecibidas: TAction
      Category = 'Enlaces'
      Caption = 'Ir a Registro de IVA recibido'
      Hint = 'Ir al Registro de IVA de la factura recibida'
      ImageIndex = 110
      OnExecute = AIrARegistroIVARecibidasExecute
    end
    object AVerificarPresentacion: TAction
      Category = 'Procesos'
      Caption = 'Verificar Presentacion'
      Hint = 'Verificar Respuesta de Presentacion'
      ImageIndex = 118
      OnExecute = AVerificarPresentacionExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 360
    Top = 0
  end
end
