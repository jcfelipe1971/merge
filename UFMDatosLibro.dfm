object FMDatosLibro: TFMDatosLibro
  Left = 491
  Top = 272
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Especificar Datos de los Libros'
  ClientHeight = 459
  ClientWidth = 664
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PMain: TLFPanel
    Left = 0
    Top = 0
    Width = 664
    Height = 459
    Align = alClient
    TabOrder = 0
    object PCMain: TLFPageControl
      Left = 1
      Top = 41
      Width = 662
      Height = 417
      ActivePage = TSExtracciones
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 0
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSEmpresario: TTabSheet
        Caption = 'Datos Empresario'
        TabVisible = False
        object PnlEmpresario: TLFPanel
          Left = 0
          Top = 0
          Width = 654
          Height = 389
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object GBEmpresario: TGroupBox
            Left = 0
            Top = 0
            Width = 388
            Height = 186
            Align = alLeft
            Caption = ' Identificaci'#243'n del Empresario '
            TabOrder = 0
            object LNombreEmpresario: TLFLabel
              Left = 13
              Top = 29
              Width = 37
              Height = 13
              Alignment = taRightJustify
              Caption = 'Nombre'
            end
            object LApellidosEmpresario: TLFLabel
              Left = 8
              Top = 51
              Width = 42
              Height = 13
              Alignment = taRightJustify
              Caption = 'Apellidos'
            end
            object LNIFEmpresario: TLFLabel
              Left = 33
              Top = 74
              Width = 17
              Height = 13
              Alignment = taRightJustify
              Caption = 'NIF'
            end
            object LCodigoPostalEmpresario: TLFLabel
              Left = 283
              Top = 117
              Width = 39
              Height = 13
              Alignment = taRightJustify
              Caption = 'C.Postal'
            end
            object LDomicilioEmpresario: TLFLabel
              Left = 8
              Top = 97
              Width = 42
              Height = 13
              Alignment = taRightJustify
              Caption = 'Domicilio'
            end
            object LCiudadEmpresario: TLFLabel
              Left = 17
              Top = 117
              Width = 33
              Height = 13
              Alignment = taRightJustify
              Caption = 'Ciudad'
            end
            object LFaxEmpresario: TLFLabel
              Left = 217
              Top = 161
              Width = 17
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fax'
            end
            object LTelefonoEmpresario: TLFLabel
              Left = 8
              Top = 161
              Width = 42
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tel'#233'fono'
            end
            object LProvinciaEmpresario: TLFLabel
              Left = 8
              Top = 139
              Width = 44
              Height = 13
              Alignment = taRightJustify
              Caption = 'Provincia'
            end
            object EdtNomE: TLFEdit
              Left = 58
              Top = 25
              Width = 318
              Height = 21
              MaxLength = 32
              TabOrder = 0
            end
            object EdtApe1E: TLFEdit
              Left = 58
              Top = 47
              Width = 158
              Height = 21
              MaxLength = 32
              TabOrder = 1
            end
            object EdtApe2E: TLFEdit
              Left = 217
              Top = 47
              Width = 159
              Height = 21
              MaxLength = 32
              TabOrder = 2
            end
            object EdtCpE: TLFEdit
              Left = 330
              Top = 113
              Width = 46
              Height = 21
              MaxLength = 5
              TabOrder = 6
            end
            object EdtNifE: TLFEdit
              Left = 58
              Top = 69
              Width = 158
              Height = 21
              MaxLength = 9
              TabOrder = 3
            end
            object EdtDomiciE: TLFEdit
              Left = 58
              Top = 91
              Width = 318
              Height = 21
              MaxLength = 32
              TabOrder = 4
            end
            object EdtFaxE: TLFEdit
              Left = 239
              Top = 157
              Width = 137
              Height = 21
              MaxLength = 10
              TabOrder = 9
            end
            object EdtTlfE: TLFEdit
              Left = 58
              Top = 157
              Width = 137
              Height = 21
              MaxLength = 10
              TabOrder = 8
            end
            object EdtCiudadE: TLFEdit
              Left = 58
              Top = 113
              Width = 213
              Height = 21
              MaxLength = 32
              TabOrder = 5
            end
            object EdtProvinE: TLFEdit
              Left = 58
              Top = 135
              Width = 318
              Height = 21
              MaxLength = 10
              TabOrder = 7
            end
          end
          object GPRepresentante: TGroupBox
            Left = 266
            Top = 0
            Width = 388
            Height = 186
            Align = alRight
            Caption = ' Identificaci'#243'n del Representante '
            TabOrder = 1
            object LNombreRepresentante: TLFLabel
              Left = 13
              Top = 28
              Width = 37
              Height = 13
              Alignment = taRightJustify
              Caption = 'Nombre'
            end
            object LApellidoRepresentante: TLFLabel
              Left = 8
              Top = 50
              Width = 42
              Height = 13
              Alignment = taRightJustify
              Caption = 'Apellidos'
            end
            object LNIFRepresentante: TLFLabel
              Left = 31
              Top = 72
              Width = 19
              Height = 13
              Alignment = taRightJustify
              Caption = 'DNI'
            end
            object LCodigoPostalRepresentante: TLFLabel
              Left = 284
              Top = 116
              Width = 39
              Height = 13
              Alignment = taRightJustify
              Caption = 'C.Postal'
            end
            object LDomicilioRepresentante: TLFLabel
              Left = 8
              Top = 94
              Width = 42
              Height = 13
              Alignment = taRightJustify
              Caption = 'Domicilio'
            end
            object LCiudadRepresentante: TLFLabel
              Left = 17
              Top = 116
              Width = 33
              Height = 13
              Alignment = taRightJustify
              Caption = 'Ciudad'
            end
            object LFaxRepresentante: TLFLabel
              Left = 217
              Top = 161
              Width = 17
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fax'
            end
            object LTelefonoRepresentante: TLFLabel
              Left = 8
              Top = 161
              Width = 42
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tel'#233'fono'
            end
            object LProvinciaRepresentante: TLFLabel
              Left = 8
              Top = 139
              Width = 44
              Height = 13
              Alignment = taRightJustify
              Caption = 'Provincia'
            end
            object EdtNomR: TLFEdit
              Left = 58
              Top = 24
              Width = 318
              Height = 21
              MaxLength = 32
              TabOrder = 0
            end
            object EdtApe1R: TLFEdit
              Left = 58
              Top = 46
              Width = 159
              Height = 21
              MaxLength = 32
              TabOrder = 1
            end
            object EdtApe2R: TLFEdit
              Left = 217
              Top = 46
              Width = 159
              Height = 21
              MaxLength = 32
              TabOrder = 2
            end
            object EdtCpR: TLFEdit
              Left = 330
              Top = 112
              Width = 46
              Height = 21
              MaxLength = 5
              TabOrder = 6
            end
            object EdtDniR: TLFEdit
              Left = 58
              Top = 68
              Width = 159
              Height = 21
              MaxLength = 9
              TabOrder = 3
            end
            object EdtDomiciR: TLFEdit
              Left = 58
              Top = 90
              Width = 318
              Height = 21
              MaxLength = 32
              TabOrder = 4
            end
            object EdtFaxR: TLFEdit
              Left = 238
              Top = 157
              Width = 137
              Height = 21
              MaxLength = 10
              TabOrder = 9
            end
            object EdtTlfR: TLFEdit
              Left = 58
              Top = 157
              Width = 137
              Height = 21
              MaxLength = 10
              TabOrder = 8
            end
            object EdtCiudadR: TLFEdit
              Left = 58
              Top = 112
              Width = 213
              Height = 21
              MaxLength = 32
              TabOrder = 5
            end
            object EdtProvinR: TLFEdit
              Left = 58
              Top = 135
              Width = 317
              Height = 21
              MaxLength = 10
              TabOrder = 7
            end
          end
          object GPRegistro: TGroupBox
            Left = 0
            Top = 186
            Width = 654
            Height = 203
            Align = alBottom
            Caption = ' Datos Registrales '
            TabOrder = 2
            object LRegistroMercantil: TLFLabel
              Left = 29
              Top = 68
              Width = 100
              Height = 13
              Alignment = taRightJustify
              Caption = 'Registro Mercantil de'
            end
            object LTomo: TLFLabel
              Left = 432
              Top = 46
              Width = 27
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tomo'
            end
            object LFolio: TLFLabel
              Left = 538
              Top = 46
              Width = 22
              Height = 13
              Alignment = taRightJustify
              Caption = 'Folio'
            end
            object LLibro: TLFLabel
              Left = 436
              Top = 68
              Width = 23
              Height = 13
              Alignment = taRightJustify
              Caption = 'Libro'
            end
            object LOtros: TLFLabel
              Left = 434
              Top = 90
              Width = 25
              Height = 13
              Alignment = taRightJustify
              Caption = 'Otros'
            end
            object LHojaRegistro: TLFLabel
              Left = 627
              Top = 46
              Width = 66
              Height = 13
              Alignment = taRightJustify
              Caption = 'Hoja Registral'
            end
            object LTipoRegPublic: TLFLabel
              Left = 13
              Top = 90
              Width = 116
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tipo de Registro P'#250'blico'
            end
            object LTotalLibro: TLFLabel
              Left = 608
              Top = 112
              Width = 85
              Height = 13
              Alignment = taRightJustify
              Caption = 'N'#186' Total de Libros'
            end
            object LSeccion: TLFLabel
              Left = 649
              Top = 68
              Width = 39
              Height = 13
              Alignment = taRightJustify
              Caption = 'Secci'#243'n'
            end
            object LFechaSolicitud: TLFLabel
              Left = 55
              Top = 46
              Width = 73
              Height = 13
              Alignment = taRightJustify
              Caption = 'Fecha Solicitud'
            end
            object EdtRegistro: TLFEdit
              Left = 135
              Top = 64
              Width = 266
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 32
              TabOrder = 1
            end
            object EdtTomo: TLFEdit
              Left = 464
              Top = 42
              Width = 64
              Height = 21
              MaxLength = 6
              TabOrder = 4
            end
            object EdtFolio: TLFEdit
              Left = 565
              Top = 42
              Width = 53
              Height = 21
              MaxLength = 6
              TabOrder = 5
            end
            object EdtLibro: TLFEdit
              Left = 464
              Top = 64
              Width = 64
              Height = 21
              MaxLength = 6
              TabOrder = 7
            end
            object EdtSeccion: TLFEdit
              Left = 698
              Top = 64
              Width = 63
              Height = 21
              MaxLength = 6
              TabOrder = 8
            end
            object EdtOtros: TLFEdit
              Left = 464
              Top = 86
              Width = 297
              Height = 21
              MaxLength = 32
              TabOrder = 9
            end
            object EdtHoja: TLFEdit
              Left = 698
              Top = 42
              Width = 63
              Height = 21
              MaxLength = 6
              TabOrder = 6
            end
            object EdtTipoRegis: TLFEdit
              Left = 135
              Top = 86
              Width = 266
              Height = 21
              CharCase = ecUpperCase
              MaxLength = 32
              TabOrder = 2
            end
            object EdtTotal: TLFEdit
              Left = 697
              Top = 108
              Width = 65
              Height = 21
              MaxLength = 3
              TabOrder = 10
            end
            object RGRetencion: TRadioGroup
              Left = 135
              Top = 113
              Width = 130
              Height = 48
              Caption = ' Solicita Retenci'#243'n '
              Columns = 2
              ItemIndex = 1
              Items.Strings = (
                'S'#237
                'No')
              TabOrder = 3
            end
            object DEFechaSolicitud: TLFDateEdit
              Left = 135
              Top = 42
              Width = 90
              Height = 21
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 0
            end
          end
        end
      end
      object TSLibros: TTabSheet
        Caption = 'Datos Libros'
        ImageIndex = 1
        TabVisible = False
        object PnlLibros: TLFPanel
          Left = 0
          Top = 0
          Width = 654
          Height = 389
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LTipo: TLFLabel
            Left = 174
            Top = 61
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LFormato: TLFLabel
            Left = 157
            Top = 84
            Width = 38
            Height = 13
            Alignment = taRightJustify
            Caption = 'Formato'
          end
          object LFichero: TLFLabel
            Left = 160
            Top = 106
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fichero'
          end
          object LNombre: TLFLabel
            Left = 158
            Top = 128
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nombre'
          end
          object LNroLibro: TLFLabel
            Left = 479
            Top = 128
            Width = 38
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#186' Libro'
          end
          object LFechaApertura: TLFLabel
            Left = 122
            Top = 150
            Width = 73
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Apertura'
          end
          object LFechaCierre: TLFLabel
            Left = 409
            Top = 150
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Cierre'
          end
          object LListaLibros: TLFLabel
            Left = 112
            Top = 179
            Width = 345
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Lista de Libros a Legalizar'
          end
          object LNombreDirectorio: TLFLabel
            Left = 112
            Top = 17
            Width = 83
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nombre directorio'
          end
          object LDescripcionLeg: TLFLabel
            Left = 67
            Top = 39
            Width = 127
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descrip. de la Legalizaci'#243'n'
          end
          object EdtNomFichero: TLFEdit
            Left = 204
            Top = 102
            Width = 336
            Height = 21
            TabOrder = 5
          end
          object EdtNomLibro: TLFEdit
            Left = 204
            Top = 124
            Width = 261
            Height = 21
            TabOrder = 7
          end
          object EdtNumLibro: TLFEdit
            Left = 521
            Top = 124
            Width = 41
            Height = 21
            MaxLength = 5
            TabOrder = 8
            OnExit = EdtNumLibroExit
          end
          object CmbBxTipo: TLFComboBox
            Left = 204
            Top = 57
            Width = 270
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 3
            Text = 'Diario'
            OnChange = CmbBxTipoChange
            Items.Strings = (
              'Diario')
          end
          object CmbBxFormato: TLFComboBox
            Left = 204
            Top = 80
            Width = 270
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 4
            Text = 'Excel'
            OnChange = CmbBxFormatoChange
            Items.Strings = (
              'Excel')
          end
          object BtnBuscar: TButton
            Left = 541
            Top = 103
            Width = 20
            Height = 20
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 6
            OnClick = BtnBuscarClick
          end
          object CmbBxNomTipo: TLFComboBox
            Left = 476
            Top = 57
            Width = 85
            Height = 21
            Style = csSimple
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ItemIndex = 0
            ParentFont = False
            TabOrder = 14
            TabStop = False
            Text = 'DIARIO'
            Items.Strings = (
              'DIARIO'
              'INVENTAR')
          end
          object CmbBxNomFormato: TLFComboBox
            Left = 477
            Top = 80
            Width = 84
            Height = 21
            Style = csSimple
            BiDiMode = bdLeftToRight
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ItemIndex = 0
            ParentBiDiMode = False
            ParentFont = False
            TabOrder = 13
            TabStop = False
            Text = 'XLS'
            Items.Strings = (
              'XLS'
              'INV_CUENTAS')
          end
          object LstBxLista: TListBox
            Left = 112
            Top = 195
            Width = 345
            Height = 185
            ItemHeight = 13
            MultiSelect = True
            TabOrder = 12
          end
          object EdtNomDirec: TLFEdit
            Left = 204
            Top = 13
            Width = 336
            Height = 21
            TabOrder = 0
            OnExit = EdtNomDirecExit
          end
          object EdtDescrip: TLFEdit
            Left = 204
            Top = 35
            Width = 357
            Height = 21
            TabOrder = 2
          end
          object PnlBtn: TLFPanel
            Left = 466
            Top = 195
            Width = 103
            Height = 185
            TabOrder = 11
            object BtnLimpiar: TButton
              Left = 14
              Top = 56
              Width = 75
              Height = 25
              Caption = 'Limpiar'
              TabOrder = 1
              OnClick = BtnLimpiarClick
            end
            object BtnInsertar: TButton
              Left = 13
              Top = 13
              Width = 75
              Height = 25
              Caption = 'Insertar'
              TabOrder = 0
              OnClick = BtnInsertarClick
            end
            object BtnEliminar: TButton
              Left = 14
              Top = 99
              Width = 75
              Height = 25
              Caption = 'Eliminar'
              TabOrder = 2
              OnClick = BtnEliminarClick
            end
            object BtnTerminar: TButton
              Left = 14
              Top = 141
              Width = 75
              Height = 25
              Caption = 'Terminar'
              TabOrder = 3
              OnClick = BtnTerminarClick
            end
          end
          object DEApertura: TLFDateEdit
            Left = 204
            Top = 146
            Width = 89
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 9
            OnExit = DEAperturaExit
          end
          object DECierre: TLFDateEdit
            Left = 474
            Top = 146
            Width = 89
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 10
            OnExit = DECierreExit
          end
          object BtnBuscarDir: TButton
            Left = 541
            Top = 14
            Width = 20
            Height = 20
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = BtnBuscarDirClick
          end
        end
      end
      object TSExtracciones: TTabSheet
        Caption = 'Extracciones'
        ImageIndex = 2
        object PNLExtracciones: TLFPanel
          Left = 0
          Top = 0
          Width = 654
          Height = 389
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LCarpetaExtraccion: TLFLabel
            Left = 29
            Top = 8
            Width = 90
            Height = 13
            Alignment = taRightJustify
            Caption = 'Carpeta Extraccion'
          end
          object LEExtension: TLFLabel
            Left = 73
            Top = 32
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Extension'
          end
          object BCarpetaExtraccion: TButton
            Left = 621
            Top = 6
            Width = 20
            Height = 20
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 1
            OnClick = BCarpetaExtraccionClick
          end
          object ECarpetaExtraccion: TLFEdit
            Left = 124
            Top = 5
            Width = 493
            Height = 21
            TabOrder = 0
            OnChange = ECarpetaExtraccionChange
            OnExit = ECarpetaExtraccionExit
          end
          object CBSumasYSaldosMensuales: TLFCheckBox
            Left = 128
            Top = 64
            Width = 329
            Height = 17
            Caption = 'Sumas y Saldos Mensuales Acumulados'
            Checked = True
            State = cbChecked
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 3
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBMayorContable: TLFCheckBox
            Left = 128
            Top = 88
            Width = 329
            Height = 17
            Caption = 'Mayor contable'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 4
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBDiarioContable: TLFCheckBox
            Left = 128
            Top = 112
            Width = 329
            Height = 17
            Caption = 'Diario contable'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 5
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBExtension: TLFComboBox
            Left = 124
            Top = 27
            Width = 101
            Height = 21
            ItemHeight = 13
            ItemIndex = 1
            TabOrder = 2
            Text = 'LibreOffice'
            OnChange = CBExtensionChange
            Items.Strings = (
              'Excel'
              'LibreOffice')
          end
          object CBDiarioContableCSV: TLFCheckBox
            Left = 128
            Top = 136
            Width = 329
            Height = 17
            Caption = 'Diario contable CSV'
            Checked = True
            State = cbChecked
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 6
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBMayorContableCSV: TLFCheckBox
            Left = 128
            Top = 160
            Width = 329
            Height = 17
            Caption = 'Mayor contable CSV'
            Checked = True
            State = cbChecked
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 7
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBMayorContableCSV_6_7: TLFCheckBox
            Left = 128
            Top = 184
            Width = 329
            Height = 17
            Caption = 'Mayor contable CSV - Ctas 6 y 7'
            Checked = True
            State = cbChecked
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 8
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBMayorContableCSV_52: TLFCheckBox
            Left = 128
            Top = 208
            Width = 329
            Height = 17
            Caption = 'Mayor contable CSV - Ctas 52'
            Checked = True
            State = cbChecked
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 9
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBMayorContableCSV_570: TLFCheckBox
            Left = 128
            Top = 232
            Width = 329
            Height = 17
            Caption = 'Mayor contable CSV - Ctas 570'
            Checked = True
            State = cbChecked
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 10
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBMayorContableCSV_572: TLFCheckBox
            Left = 128
            Top = 256
            Width = 329
            Height = 17
            Caption = 'Mayor contable CSV - Ctas 572'
            Checked = True
            State = cbChecked
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 11
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBBalanceCierre: TLFCheckBox
            Left = 128
            Top = 280
            Width = 329
            Height = 17
            Caption = 'Balance de Cierre'
            Checked = True
            State = cbChecked
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 12
            TabStop = True
            Alignment = taLeftJustify
          end
          object CBBalancePerdidasYGanancias: TLFCheckBox
            Left = 128
            Top = 304
            Width = 329
            Height = 17
            Caption = 'Balance de Perdidas y Ganancias'
            Checked = True
            State = cbChecked
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 13
            TabStop = True
            Alignment = taLeftJustify
          end
        end
      end
    end
    object TBMain: TLFToolBar
      Left = 1
      Top = 1
      Width = 662
      Height = 40
      AutoSize = True
      ButtonHeight = 36
      ButtonWidth = 82
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      Flat = True
      Images = DMMain.ILMain_Ac
      ShowCaptions = True
      TabOrder = 1
      Separators = True
      object TButtVerificar: TToolButton
        Left = 0
        Top = 0
        Action = AVerificarDatos
        ParentShowHint = False
        ShowHint = True
      end
      object TButtSalir: TToolButton
        Left = 82
        Top = 0
        Hint = 'Cerrar esta ventana'
        Action = ASalir
        ParentShowHint = False
        ShowHint = True
      end
      object TBExportar: TToolButton
        Left = 164
        Top = 0
        Action = AExportar
      end
    end
  end
  object ALMain: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 368
    Top = 8
    object ASalir: TAction
      Caption = '&Salir'
      Hint = 'Salir'
      ImageIndex = 0
      OnExecute = ASalirExecute
    end
    object AVerificarDatos: TAction
      Caption = '&Verificar Datos'
      Hint = 'Comprueba los datos obligatorios'
      ImageIndex = 19
      OnExecute = AVerificarDatosExecute
    end
    object AExportar: TAction
      Caption = 'Exportar'
      Hint = 'Exportar informes seleccionados'
      ImageIndex = 36
      OnExecute = AExportarExecute
    end
  end
end
