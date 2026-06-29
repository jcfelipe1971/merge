inherited FMParamModelosHacienda: TFMParamModelosHacienda
  Left = 269
  Top = 105
  Width = 600
  Height = 655
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Parametros Modelos de Hacienda'
  PopupMenu = nil
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 590
    Height = 602
    inherited TBMain: TLFToolBar
      Width = 586
      inherited NavMain: THYMNavigator
        Width = 92
        DataSource = DMParamModelosHacienda.DSQMModelos
        VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited TSepNav: TToolButton
        Left = 92
      end
      inherited EPMain: THYMEditPanel
        Left = 100
        Width = 27
        VisibleButtons = [neSalir]
        Hints.Strings = (
          'Buscar'
          'B'#250'squeda aproximada'
          'B'#250'squeda exacta'
          'Listado de Afiliados'
          'Filtra rango'
          'Listado de Afiliados'
          'Copiar'
          'Cortar'
          'Pegar'
          'Cerrar la ventana')
      end
      inherited TSepTerc: TToolButton
        Left = 127
      end
      inherited TbuttComp: TToolButton
        Left = 135
      end
    end
    inherited PCMain: TLFPageControl
      Width = 586
      Height = 572
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 578
          Height = 544
          inherited G2KTableLoc: TG2KTBLoc
            Left = 35
            Top = 23
          end
          object GBDeclarante: TGroupBox
            Left = 0
            Top = 80
            Width = 578
            Height = 150
            Align = alTop
            Caption = ' Datos Declarante '
            TabOrder = 1
            object LFLNIF: TLFLabel
              Left = 22
              Top = 18
              Width = 72
              Height = 13
              Alignment = taRightJustify
              Caption = 'NIF Declarante'
            end
            object LFLNombre: TLFLabel
              Left = 217
              Top = 17
              Width = 92
              Height = 13
              Alignment = taRightJustify
              Caption = 'Nombre Declarante'
            end
            object LFLTipoCalle: TLFLabel
              Left = 47
              Top = 41
              Width = 47
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tipo Calle'
            end
            object LFLNumero: TLFLabel
              Left = 57
              Top = 61
              Width = 37
              Height = 13
              Alignment = taRightJustify
              Caption = 'Numero'
            end
            object LFLCodPostal: TLFLabel
              Left = 40
              Top = 83
              Width = 54
              Height = 13
              Alignment = taRightJustify
              Caption = 'Cod. Postal'
            end
            object LFLTelefono: TLFLabel
              Left = 423
              Top = 105
              Width = 42
              Height = 13
              Alignment = taRightJustify
              Caption = 'Telefono'
            end
            object LFLProvincia: TLFLabel
              Left = 380
              Top = 83
              Width = 44
              Height = 13
              Alignment = taRightJustify
              Caption = 'Provincia'
            end
            object LFLMunicipio: TLFLabel
              Left = 179
              Top = 83
              Width = 45
              Height = 13
              Alignment = taRightJustify
              Caption = 'Municipio'
            end
            object LFLEscalera: TLFLabel
              Left = 182
              Top = 61
              Width = 41
              Height = 13
              Alignment = taRightJustify
              Caption = 'Escalera'
            end
            object LFLCalle: TLFLabel
              Left = 200
              Top = 39
              Width = 23
              Height = 13
              Alignment = taRightJustify
              Caption = 'Calle'
            end
            object LFLPiso: TLFLabel
              Left = 319
              Top = 61
              Width = 20
              Height = 13
              Alignment = taRightJustify
              Caption = 'Piso'
            end
            object LFLPuerta: TLFLabel
              Left = 433
              Top = 61
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = 'Puerta'
            end
            object LFLIBAN: TLFLabel
              Left = 69
              Top = 127
              Width = 25
              Height = 13
              Alignment = taRightJustify
              Caption = 'IBAN'
            end
            object LFLBIC: TLFLabel
              Left = 374
              Top = 127
              Width = 17
              Height = 13
              Alignment = taRightJustify
              Caption = 'BIC'
            end
            object LFLEntidad: TLFLabel
              Left = 62
              Top = 105
              Width = 34
              Height = 13
              Alignment = taRightJustify
              Caption = 'Cuenta'
            end
            object DBENIF: TLFDbedit
              Left = 100
              Top = 14
              Width = 107
              Height = 21
              CharCase = ecUpperCase
              DataField = 'DECLARANTE_NIF'
              DataSource = DMParamModelosHacienda.DSQMModelos
              TabOrder = 0
            end
            object DBENombre: TLFDbedit
              Left = 315
              Top = 14
              Width = 240
              Height = 21
              CharCase = ecUpperCase
              DataField = 'DECLARANTE_NOMBRE'
              DataSource = DMParamModelosHacienda.DSQMModelos
              TabOrder = 1
            end
            object DBETipoCalle: TLFDbedit
              Left = 100
              Top = 36
              Width = 69
              Height = 21
              CharCase = ecUpperCase
              DataField = 'DECLARANTE_TIPO_CALLE'
              DataSource = DMParamModelosHacienda.DSQMModelos
              TabOrder = 2
            end
            object DBENumero: TLFDbedit
              Left = 100
              Top = 58
              Width = 69
              Height = 21
              CharCase = ecUpperCase
              DataField = 'DECLARANTE_NUMERO'
              DataSource = DMParamModelosHacienda.DSQMModelos
              TabOrder = 4
            end
            object DBECodPostal: TLFDbedit
              Left = 100
              Top = 80
              Width = 69
              Height = 21
              CharCase = ecUpperCase
              DataField = 'DECLARANTE_CODIGO_POSTAL'
              DataSource = DMParamModelosHacienda.DSQMModelos
              TabOrder = 8
            end
            object DBETelefono: TLFDbedit
              Left = 470
              Top = 102
              Width = 85
              Height = 21
              CharCase = ecUpperCase
              DataField = 'DECLARANTE_TELEFONO'
              DataSource = DMParamModelosHacienda.DSQMModelos
              TabOrder = 15
            end
            object DBEMunicipio: TLFDbedit
              Left = 229
              Top = 80
              Width = 134
              Height = 21
              CharCase = ecUpperCase
              DataField = 'DECLARANTE_MUNICIPIO'
              DataSource = DMParamModelosHacienda.DSQMModelos
              TabOrder = 9
            end
            object DBEProvincia: TLFDbedit
              Left = 429
              Top = 80
              Width = 126
              Height = 21
              CharCase = ecUpperCase
              DataField = 'DECLARANTE_PROVINCIA'
              DataSource = DMParamModelosHacienda.DSQMModelos
              TabOrder = 10
            end
            object DBEEscalera: TLFDbedit
              Left = 229
              Top = 58
              Width = 79
              Height = 21
              CharCase = ecUpperCase
              DataField = 'DECLARANTE_ESCALERA'
              DataSource = DMParamModelosHacienda.DSQMModelos
              TabOrder = 5
            end
            object DBECalle: TLFDbedit
              Left = 229
              Top = 36
              Width = 326
              Height = 21
              CharCase = ecUpperCase
              DataField = 'DECLARANTE_CALLE'
              DataSource = DMParamModelosHacienda.DSQMModelos
              TabOrder = 3
            end
            object DBEPiso: TLFDbedit
              Left = 344
              Top = 58
              Width = 79
              Height = 21
              CharCase = ecUpperCase
              DataField = 'DECLARANTE_PISO'
              DataSource = DMParamModelosHacienda.DSQMModelos
              TabOrder = 6
            end
            object DBEPuerta: TLFDbedit
              Left = 469
              Top = 58
              Width = 86
              Height = 21
              CharCase = ecUpperCase
              DataField = 'DECLARANTE_PUERTA'
              DataSource = DMParamModelosHacienda.DSQMModelos
              TabOrder = 7
            end
            object DBEIBAN: TLFDbedit
              Tag = 2
              Left = 100
              Top = 124
              Width = 269
              Height = 21
              CharCase = ecUpperCase
              DataField = 'DECLARANTE_IBAN'
              DataSource = DMParamModelosHacienda.DSQMModelos
              TabOrder = 16
            end
            object DBEBIC: TLFDbedit
              Tag = 2
              Left = 396
              Top = 124
              Width = 159
              Height = 21
              CharCase = ecUpperCase
              DataField = 'DECLARANTE_BIC'
              DataSource = DMParamModelosHacienda.DSQMModelos
              TabOrder = 17
            end
            object DBEEntidad: TLFDbedit
              Left = 100
              Top = 102
              Width = 45
              Height = 21
              CharCase = ecUpperCase
              DataField = 'DECLARANTE_ENTIDAD'
              DataSource = DMParamModelosHacienda.DSQMModelos
              TabOrder = 11
            end
            object DBESucursal: TLFDbedit
              Left = 146
              Top = 102
              Width = 43
              Height = 21
              CharCase = ecUpperCase
              DataField = 'DECLARANTE_SUCURSAL'
              DataSource = DMParamModelosHacienda.DSQMModelos
              TabOrder = 12
            end
            object DBEDC: TLFDbedit
              Left = 190
              Top = 102
              Width = 26
              Height = 21
              CharCase = ecUpperCase
              DataField = 'DECLARANTE_DC'
              DataSource = DMParamModelosHacienda.DSQMModelos
              TabOrder = 13
            end
            object DBECuenta: TLFDbedit
              Left = 217
              Top = 102
              Width = 193
              Height = 21
              CharCase = ecUpperCase
              DataField = 'DECLARANTE_CUENTA'
              DataSource = DMParamModelosHacienda.DSQMModelos
              TabOrder = 14
            end
          end
          object GBDelegacion: TGroupBox
            Left = 0
            Top = 0
            Width = 578
            Height = 80
            Align = alTop
            TabOrder = 0
            DesignSize = (
              578
              80)
            object LFLDelegacion: TLFLabel
              Left = 42
              Top = 14
              Width = 54
              Height = 13
              Alignment = taRightJustify
              Caption = 'Delegacion'
            end
            object LFLAdministracion: TLFLabel
              Left = 28
              Top = 36
              Width = 68
              Height = 13
              Alignment = taRightJustify
              Caption = 'Administracion'
            end
            object LFLCodAdmin: TLFLabel
              Left = 99
              Top = 58
              Width = 104
              Height = 13
              Alignment = taRightJustify
              Caption = 'Codigo Administracion'
            end
            object DBEDelegacion: TLFDbedit
              Left = 100
              Top = 10
              Width = 455
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              CharCase = ecUpperCase
              DataField = 'DELEGACION'
              DataSource = DMParamModelosHacienda.DSQMModelos
              TabOrder = 0
            end
            object DBEAdministracion: TLFDbedit
              Left = 100
              Top = 32
              Width = 455
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              CharCase = ecUpperCase
              DataField = 'ADMINISTRACION'
              DataSource = DMParamModelosHacienda.DSQMModelos
              TabOrder = 1
            end
            object DBECodAdmin: TLFDbedit
              Left = 206
              Top = 54
              Width = 61
              Height = 21
              CharCase = ecUpperCase
              DataField = 'COD_ADMINISTRACION'
              DataSource = DMParamModelosHacienda.DSQMModelos
              TabOrder = 2
            end
          end
          object GBPresentador: TGroupBox
            Left = 0
            Top = 230
            Width = 578
            Height = 128
            Align = alClient
            Caption = ' Datos Presentador/Contacto '
            Constraints.MinHeight = 128
            TabOrder = 2
            object LFLNIFP: TLFLabel
              Left = 17
              Top = 18
              Width = 77
              Height = 13
              Alignment = taRightJustify
              Caption = 'NIF Presentador'
            end
            object LFLNombreP: TLFLabel
              Left = 214
              Top = 17
              Width = 97
              Height = 13
              Alignment = taRightJustify
              Caption = 'Nombre Presentador'
            end
            object LFLTipoCalleP: TLFLabel
              Left = 47
              Top = 38
              Width = 47
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tipo Calle'
            end
            object LFLNumeroP: TLFLabel
              Left = 57
              Top = 60
              Width = 37
              Height = 13
              Alignment = taRightJustify
              Caption = 'Numero'
            end
            object LFLCodPostalP: TLFLabel
              Left = 40
              Top = 83
              Width = 54
              Height = 13
              Alignment = taRightJustify
              Caption = 'Cod. Postal'
            end
            object LFLTelefonoP: TLFLabel
              Left = 53
              Top = 105
              Width = 42
              Height = 13
              Alignment = taRightJustify
              Caption = 'Telefono'
            end
            object LFLProvinciaP: TLFLabel
              Left = 379
              Top = 83
              Width = 44
              Height = 13
              Alignment = taRightJustify
              Caption = 'Provincia'
            end
            object LFLMunicipioP: TLFLabel
              Left = 183
              Top = 83
              Width = 45
              Height = 13
              Alignment = taRightJustify
              Caption = 'Municipio'
            end
            object LFLEscaleraP: TLFLabel
              Left = 186
              Top = 61
              Width = 41
              Height = 13
              Alignment = taRightJustify
              Caption = 'Escalera'
            end
            object LFLCalleP: TLFLabel
              Left = 204
              Top = 39
              Width = 23
              Height = 13
              Alignment = taRightJustify
              Caption = 'Calle'
            end
            object LFLPisoP: TLFLabel
              Left = 326
              Top = 60
              Width = 20
              Height = 13
              Alignment = taRightJustify
              Caption = 'Piso'
            end
            object LFLPuertaP: TLFLabel
              Left = 439
              Top = 60
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = 'Puerta'
            end
            object DBENIFP: TLFDbedit
              Left = 100
              Top = 14
              Width = 108
              Height = 21
              CharCase = ecUpperCase
              DataField = 'PRESENTADOR_NIF'
              DataSource = DMParamModelosHacienda.DSQMModelos
              TabOrder = 0
            end
            object DBENombreP: TLFDbedit
              Left = 315
              Top = 14
              Width = 240
              Height = 21
              CharCase = ecUpperCase
              DataField = 'PRESENTADOR_NOMBRE'
              DataSource = DMParamModelosHacienda.DSQMModelos
              TabOrder = 1
            end
            object DBETipoCalleP: TLFDbedit
              Left = 100
              Top = 36
              Width = 80
              Height = 21
              CharCase = ecUpperCase
              DataField = 'PRESENTADOR_TIPO_CALLE'
              DataSource = DMParamModelosHacienda.DSQMModelos
              TabOrder = 2
            end
            object DBENumeroP: TLFDbedit
              Left = 100
              Top = 58
              Width = 80
              Height = 21
              CharCase = ecUpperCase
              DataField = 'PRESENTADOR_NUMERO'
              DataSource = DMParamModelosHacienda.DSQMModelos
              TabOrder = 4
            end
            object DBECodPostalP: TLFDbedit
              Left = 100
              Top = 80
              Width = 80
              Height = 21
              CharCase = ecUpperCase
              DataField = 'PRESENTADOR_CODIGO_POSTAL'
              DataSource = DMParamModelosHacienda.DSQMModelos
              TabOrder = 8
            end
            object DBETelefonoP: TLFDbedit
              Left = 100
              Top = 102
              Width = 80
              Height = 21
              CharCase = ecUpperCase
              DataField = 'PRESENTADOR_TELEFONO'
              DataSource = DMParamModelosHacienda.DSQMModelos
              TabOrder = 11
            end
            object DBEMunicipioP: TLFDbedit
              Left = 232
              Top = 80
              Width = 116
              Height = 21
              CharCase = ecUpperCase
              DataField = 'PRESENTADOR_MUNICIPIO'
              DataSource = DMParamModelosHacienda.DSQMModelos
              TabOrder = 9
            end
            object DBEProvinciaP: TLFDbedit
              Left = 429
              Top = 80
              Width = 126
              Height = 21
              CharCase = ecUpperCase
              DataField = 'PRESENTADOR_PROVINCIA'
              DataSource = DMParamModelosHacienda.DSQMModelos
              TabOrder = 10
            end
            object DBEEscaleraP: TLFDbedit
              Left = 232
              Top = 58
              Width = 79
              Height = 21
              CharCase = ecUpperCase
              DataField = 'PRESENTADOR_ESCALERA'
              DataSource = DMParamModelosHacienda.DSQMModelos
              TabOrder = 5
            end
            object DBECalleP: TLFDbedit
              Tag = 40
              Left = 232
              Top = 36
              Width = 323
              Height = 21
              CharCase = ecUpperCase
              DataField = 'PRESENTADOR_CALLE'
              DataSource = DMParamModelosHacienda.DSQMModelos
              TabOrder = 3
            end
            object DBEPisoP: TLFDbedit
              Left = 351
              Top = 58
              Width = 79
              Height = 21
              CharCase = ecUpperCase
              DataField = 'PRESENTADOR_PISO'
              DataSource = DMParamModelosHacienda.DSQMModelos
              TabOrder = 6
            end
            object DBEPuertaP: TLFDbedit
              Left = 474
              Top = 58
              Width = 81
              Height = 21
              CharCase = ecUpperCase
              DataField = 'PRESENTADOR_PUERTA'
              DataSource = DMParamModelosHacienda.DSQMModelos
              TabOrder = 7
            end
          end
          object GBModelos: TGroupBox
            Left = 0
            Top = 436
            Width = 578
            Height = 108
            Align = alBottom
            TabOrder = 4
            object LTBAIDispositivo: TLFLabel
              Left = 203
              Top = 86
              Width = 51
              Height = 13
              Alignment = taRightJustify
              Caption = 'Dispositivo'
            end
            object LTBAILicencia: TLFLabel
              Left = 406
              Top = 86
              Width = 40
              Height = 13
              Alignment = taRightJustify
              Caption = 'Licencia'
            end
            object LFDBCBModelo300: TLFDBCheckBox
              Left = 385
              Top = 12
              Width = 187
              Height = 17
              Caption = 'M-300 Efectivo/Adeudo en Cuenta'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 2
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'M_300_EFECTIVO'
              DataSource = DMParamModelosHacienda.DSQMModelos
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object LFDBCBModelo115: TLFDBCheckBox
              Left = 195
              Top = 12
              Width = 187
              Height = 16
              Caption = 'M-115 Efectivo/Adeudo en Cuenta'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 1
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'M_115_EFECTIVO'
              DataSource = DMParamModelosHacienda.DSQMModelos
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object LFDBCBModelo110: TLFDBCheckBox
              Left = 7
              Top = 12
              Width = 187
              Height = 17
              Caption = 'M-110 Efectivo/Adeudo en Cuenta'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 0
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'M_110_EFECTIVO'
              DataSource = DMParamModelosHacienda.DSQMModelos
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object CB303Mensual: TLFDBCheckBox
              Left = 7
              Top = 30
              Width = 187
              Height = 17
              Caption = 'Devoluci'#243'n Mensual del M-303'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 3
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'DEVOLUCION_MENSUAL_M303'
              DataSource = DMParamModelosHacienda.DSQMModelos
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object CB349Mensual: TLFDBCheckBox
              Left = 195
              Top = 30
              Width = 187
              Height = 17
              Caption = 'Devoluci'#243'n Mensual del M-349'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 4
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'DEVOLUCION_MENSUAL_M349'
              DataSource = DMParamModelosHacienda.DSQMModelos
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object CBSIIPruebas: TLFCheckBox
              Left = 7
              Top = 68
              Width = 187
              Height = 17
              Caption = 'SII en modo Pruebas'
              ClicksDisabled = False
              Color = clRed
              ColorCheck = 57088
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 7
              TabStop = True
              OnClick = CBSIIPruebasClick
              Alignment = taLeftJustify
              OnChange = CBSIIPruebasChange
            end
            object CBTBAIPruebas: TLFCheckBox
              Left = 7
              Top = 86
              Width = 187
              Height = 17
              Caption = 'TBAI en modo Pruebas'
              ClicksDisabled = False
              Color = clRed
              ColorCheck = 57088
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 11
              TabStop = True
              Alignment = taLeftJustify
              OnChange = CBTBAIPruebasChange
            end
            object ETBAIDispositivo: TLFEdit
              Left = 258
              Top = 83
              Width = 121
              Height = 21
              TabOrder = 12
            end
            object ETBAILicencia: TLFEdit
              Left = 450
              Top = 83
              Width = 121
              Height = 21
              Color = clInfoBk
              Enabled = False
              TabOrder = 13
            end
            object CB592Mensual: TLFDBCheckBox
              Left = 385
              Top = 30
              Width = 187
              Height = 17
              Caption = 'Devoluci'#243'n Mensual del M-592'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 5
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'DEVOLUCION_MENSUAL_M592'
              DataSource = DMParamModelosHacienda.DSQMModelos
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBUtilizaSII: TLFDBCheckBox
              Left = 7
              Top = 49
              Width = 187
              Height = 18
              Caption = 'Declara mediante SII'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 6
              TabStop = True
              Alignment = taLeftJustify
              OnChange = DBCBUtilizaSIIChange
              DataField = 'UTILIZA_SII'
              DataSource = DMParamModelosHacienda.DSQMModelos
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBUtilizaTicketBAI: TLFDBCheckBox
              Left = 195
              Top = 49
              Width = 187
              Height = 17
              Caption = 'Utiliza TicketBAI'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 8
              TabStop = True
              Alignment = taLeftJustify
              OnChange = DBCBUtilizaTicketBAIChange
              DataField = 'UTILIZA_TICKETBAI'
              DataSource = DMParamModelosHacienda.DSQMModelos
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBUtilizaVerifactu: TLFDBCheckBox
              Left = 383
              Top = 49
              Width = 187
              Height = 18
              Caption = 'Utiliza Verifactu'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 9
              TabStop = True
              Alignment = taLeftJustify
              OnChange = DBCBUtilizaVerifactuChange
              DataField = 'UTILIZA_VERIFACTU'
              DataSource = DMParamModelosHacienda.DSQMModelos
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCBVerifactuPruebas: TLFDBCheckBox
              Left = 383
              Top = 65
              Width = 187
              Height = 18
              Caption = 'Verifactu  en modo Pruebas'
              ClicksDisabled = False
              Color = clRed
              ColorCheck = 57088
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentColor = False
              ParentFont = False
              TabOrder = 10
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'VERIFACTU_MODO_PRUEBAS'
              DataSource = DMParamModelosHacienda.DSQMModelos
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
          object GBCertificado: TGroupBox
            Left = 0
            Top = 358
            Width = 578
            Height = 78
            Align = alBottom
            Caption = 'Certificado'
            TabOrder = 3
            DesignSize = (
              578
              78)
            object LCertificado: TLFLabel
              Left = 46
              Top = 13
              Width = 50
              Height = 13
              Alignment = taRightJustify
              Caption = 'Certificado'
            end
            object LCertificadoLROE: TLFLabel
              Left = 4
              Top = 35
              Width = 92
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fichero Cert. LROE'
            end
            object LCertificadoLROEClave: TLFLabel
              Left = 12
              Top = 57
              Width = 84
              Height = 13
              Alignment = taRightJustify
              Caption = 'Clave Cert. LROE'
            end
            object SBCertificadoLROE: TSpeedButton
              Tag = 7
              Left = 532
              Top = 31
              Width = 23
              Height = 21
              Anchors = [akTop, akRight]
              OnClick = SBCertificadoLROEClick
            end
            object DBECertificado: TLFDbedit
              Left = 100
              Top = 9
              Width = 455
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DataField = 'CERTIFICADO'
              DataSource = DMParamModelosHacienda.DSQMModelos
              TabOrder = 0
            end
            object DBECertificadoLROE: TLFDbedit
              Left = 100
              Top = 31
              Width = 431
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DataField = 'CERTIFICADO_LROE_FICHERO'
              DataSource = DMParamModelosHacienda.DSQMModelos
              TabOrder = 1
            end
            object DBECertificadoLROEClave: TLFDbedit
              Left = 100
              Top = 53
              Width = 455
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              DataField = 'CERTIFICADO_LROE_CLAVE'
              DataSource = DMParamModelosHacienda.DSQMModelos
              PasswordChar = '*'
              TabOrder = 2
            end
          end
        end
      end
      inherited TSTabla: TTabSheet
        Enabled = False
        OnShow = nil
        inherited DBGMain: THYTDBGrid
          Width = 578
          Height = 543
          DataSource = DMParamModelosHacienda.DSQMModelos
          CamposAMarcar.Strings = (
            'M_110_EFECTIVO'
            'M_115_EFECTIVO'
            'M_300_EFECTIVO')
          CamposAOrdenar.Strings = (
            'CODIGO'
            'ESPECIE')
          Columns = <
            item
              Expanded = False
              FieldName = 'DELEGACION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ADMINISTRACION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COD_ADMINISTRACION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DECLARANTE_NIF'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DECLARANTE_NOMBRE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DECLARANTE_TELEFONO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DECLARANTE_CALLE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DECLARANTE_NUMERO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DECLARANTE_ESCALERA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DECLARANTE_PISO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DECLARANTE_PUERTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DECLARANTE_CODIGO_POSTAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DECLARANTE_MUNICIPIO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DECLARANTE_PROVINCIA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DECLARANTE_TELEFONO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DECLARANTE_ENTIDAD'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DECLARANTE_SUCURSAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DECLARANTE_DC'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DECLARANTE_CUENTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'M_110_EFECTIVO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'M_115_EFECTIVO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'M_300_EFECTIVO'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 602
    Width = 590
  end
  inherited CEMain: TControlEdit
    Left = 416
    Top = 8
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 446
    Top = 8
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
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
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
  inherited ALMain: TLFActionList
    Left = 476
    Top = 8
  end
  inherited FSMain: TLFFibFormStorage
    Left = 506
    Top = 8
  end
end
