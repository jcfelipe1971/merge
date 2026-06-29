inherited FMConfig: TFMConfig
  Left = 401
  Top = 160
  Width = 838
  Height = 594
  HelpContext = 321
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = #218'tiles'
  Constraints.MinHeight = 412
  Constraints.MinWidth = 610
  OldCreateOrder = True
  PopupMenu = CEParamPerPMEdit
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 828
    Height = 541
    inherited TBMain: TLFToolBar
      Width = 824
      inherited EPMain: THYMEditPanel
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object PCMain: TLFPageControl
      Left = 2
      Top = 28
      Width = 824
      Height = 511
      ActivePage = TSTeclas
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 1
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSTeclas: TTabSheet
        Caption = '&Teclas'
        object PNTeclas: TLFPanel
          Left = 0
          Top = 0
          Width = 816
          Height = 483
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Pnl_Edicion: TLFPanel
            Left = 0
            Top = 0
            Width = 816
            Height = 52
            Align = alTop
            AutoSize = True
            BevelOuter = bvNone
            BorderWidth = 3
            TabOrder = 0
            object Grp_Combinacion: TGroupBox
              Left = 3
              Top = 3
              Width = 810
              Height = 46
              Align = alTop
              Caption = 'Combinaci'#243'n para ...'
              Ctl3D = True
              ParentCtl3D = False
              TabOrder = 0
              object Btn_Aceptar: TSpeedButton
                Left = 424
                Top = 14
                Width = 23
                Height = 23
                Hint = 'Aceptar'
                Flat = True
                NumGlyphs = 2
                ParentShowHint = False
                ShowHint = True
                OnClick = Btn_AceptarClick
              end
              object Edt_Tecla: TLFEdit
                Left = 178
                Top = 15
                Width = 233
                Height = 21
                TabOrder = 0
              end
              object Chk_Ctrl: TLFCheckBox
                Left = 10
                Top = 19
                Width = 49
                Height = 17
                Caption = 'Ctrl'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 1
                TabStop = True
                OnClick = Chk_CtrlClick
                Alignment = taLeftJustify
              end
              object Chk_Alt: TLFCheckBox
                Left = 66
                Top = 19
                Width = 39
                Height = 17
                Caption = 'Alt'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 2
                TabStop = True
                OnClick = Chk_AltClick
                Alignment = taLeftJustify
              end
              object Chk_Shift: TLFCheckBox
                Left = 110
                Top = 19
                Width = 65
                Height = 17
                Caption = 'Shift'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 3
                TabStop = True
                OnClick = Chk_ShiftClick
                Alignment = taLeftJustify
              end
            end
          end
          object Pnl_Grid: TLFPanel
            Left = 0
            Top = 52
            Width = 816
            Height = 431
            Align = alClient
            BevelOuter = bvNone
            BorderWidth = 3
            TabOrder = 1
            object DBGTeclas: THYTDBGrid
              Left = 3
              Top = 29
              Width = 810
              Height = 399
              Align = alClient
              Color = clInfoBk
              DataSource = DMConfig.DSQMTeclas
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Options = [dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
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
              AutoDeseleccionar = True
              PermutaPaneles = False
              CampoAOrdenarColor = clInfoBk
              OrdenMultiple = True
              Columns = <
                item
                  Expanded = False
                  FieldName = 'TITULO'
                  Width = 357
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'COMBINACION_STR'
                  Width = 112
                  Visible = True
                end>
            end
            object Pnl_Navegador: TLFPanel
              Left = 3
              Top = 3
              Width = 810
              Height = 26
              Align = alTop
              AutoSize = True
              BevelOuter = bvNone
              BorderWidth = 2
              TabOrder = 1
              object HYMNavTeclas: THYMNavigator
                Left = 4
                Top = 2
                Width = 88
                Height = 22
                DataSource = DMConfig.DSQMTeclas
                VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
                Flat = True
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                OnClick = HYMNavTeclasClick
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
      object TSGenericas: TTabSheet
        Caption = '&Gen'#233'ricas'
        ImageIndex = 2
        object PNGenericas: TLFPanel
          Left = 0
          Top = 0
          Width = 816
          Height = 483
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LVaciaEntradas: TLFLabel
            Left = 30
            Top = 52
            Width = 135
            Height = 13
            Caption = 'Vac'#237'a entradas innecesarias'
          end
          object LVaciaEntradasIncorrectas: TLFLabel
            Left = 30
            Top = 74
            Width = 282
            Height = 13
            Caption = 'Vac'#237'a las entradas innecesarias (incluyendo las incorrectas)'
          end
          object LInicializaSistema: TLFLabel
            Left = 30
            Top = 7
            Width = 336
            Height = 13
            Caption = 
              'Inicializa el sistema vaciando las tablas de datos de todas las ' +
              'Empresas'
          end
          object LVaciaUbicaciones: TLFLabel
            Left = 30
            Top = 29
            Width = 203
            Height = 13
            Caption = 'Vac'#237'a la tabla de ubicaciones innecesarias'
          end
          object LVaciaTemporales: TLFLabel
            Left = 30
            Top = 96
            Width = 130
            Height = 13
            Caption = 'Vac'#237'a las tablas temporales'
          end
          object LVaciaConfiguracion: TLFLabel
            Left = 30
            Top = 117
            Width = 158
            Height = 13
            Caption = 'Vac'#237'a las tablas de configuraci'#243'n'
          end
          object LFLCB: TLFLabel
            Left = 40
            Top = 213
            Width = 193
            Height = 13
            Alignment = taRightJustify
            Caption = 'Prefijo en c'#243'digos de barras de art'#237'culos:'
          end
          object LRutaLibros: TLFLabel
            Left = 55
            Top = 306
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ruta Libros'
          end
          object BDirectorioRutaLibros: TSpeedButton
            Tag = 2
            Left = 673
            Top = 303
            Width = 23
            Height = 21
            OnClick = BTNDirectorioBackupClick
          end
          object LDirectorioEDIEntrada: TLFLabel
            Left = 25
            Top = 328
            Width = 84
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ruta EDI Entrada'
          end
          object SBDirectorioEDIEntrada: TSpeedButton
            Tag = 3
            Left = 673
            Top = 325
            Width = 23
            Height = 21
            OnClick = BTNDirectorioBackupClick
          end
          object LDirectorioEDISalida: TLFLabel
            Left = 33
            Top = 350
            Width = 76
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ruta EDI Salida'
          end
          object SBDirectorioEDISalida: TSpeedButton
            Tag = 4
            Left = 673
            Top = 347
            Width = 23
            Height = 21
            OnClick = BTNDirectorioBackupClick
          end
          object LDirectorioAutofirma: TLFLabel
            Left = 65
            Top = 394
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Autofirma'
          end
          object SBDirectorioAutofirma: TSpeedButton
            Tag = 5
            Left = 673
            Top = 391
            Width = 23
            Height = 21
            OnClick = BTNDirectorioBackupClick
          end
          object SBDirectorio7Zip: TSpeedButton
            Tag = 6
            Left = 673
            Top = 413
            Width = 23
            Height = 21
            OnClick = BTNDirectorioBackupClick
          end
          object LDirectorio7Zip: TLFLabel
            Left = 88
            Top = 416
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = '7Zip'
          end
          object LVersionAutofirma: TLFLabel
            Left = 700
            Top = 394
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Version'
          end
          object LDirectorioCurl: TLFLabel
            Left = 91
            Top = 438
            Width = 18
            Height = 13
            Alignment = taRightJustify
            Caption = 'Curl'
          end
          object SBDirectorioCurl: TSpeedButton
            Tag = 7
            Left = 673
            Top = 435
            Width = 23
            Height = 21
            OnClick = BTNDirectorioBackupClick
          end
          object LDirectorioLector: TLFLabel
            Left = 31
            Top = 372
            Width = 78
            Height = 13
            Alignment = taRightJustify
            Caption = 'Directorio Lector'
          end
          object SBDirectorioLector: TSpeedButton
            Tag = 8
            Left = 673
            Top = 369
            Width = 23
            Height = 21
            OnClick = BTNDirectorioBackupClick
          end
          object LDirectorioSumatraPDF: TLFLabel
            Left = 49
            Top = 460
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'SumatraPDF'
          end
          object SBDirectorioSumatraPDF: TSpeedButton
            Tag = 9
            Left = 673
            Top = 457
            Width = 23
            Height = 21
            OnClick = BTNDirectorioBackupClick
          end
          object AniTempo: TAnimate
            Left = 32
            Top = 236
            Width = 364
            Height = 40
            Active = False
            CommonAVI = aviDeleteFile
            StopFrame = 73
            Visible = False
          end
          object CBConfigPVenta: TLFCheckBox
            Left = 40
            Top = 140
            Width = 400
            Height = 17
            Caption = 'No utilizar Precio Medio Ponderado en ventas'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 1
            TabStop = True
            OnClick = CBConfigPVentaClick
            Alignment = taLeftJustify
          end
          object CBEfectos: TLFCheckBox
            Left = 40
            Top = 156
            Width = 400
            Height = 17
            Caption = 'Realizar Apunte a Efectos a cobrar al recibir documentos de pago'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 2
            TabStop = True
            OnClick = CBEfectosClick
            Alignment = taLeftJustify
          end
          object CBUdSecundarias: TLFCheckBox
            Left = 40
            Top = 172
            Width = 400
            Height = 17
            Caption = 'Utilizar Unidades Secundarias en ventas'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 3
            TabStop = True
            OnClick = CBUdSecundariasClick
            Alignment = taLeftJustify
          end
          object CBPCoste: TLFCheckBox
            Left = 40
            Top = 189
            Width = 400
            Height = 17
            Caption = 'Utilizar Precio Coste en movimientos'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 4
            TabStop = True
            OnClick = CBPCosteClick
            Alignment = taLeftJustify
          end
          object EPrefijoCodBarras: TLFEdit
            Left = 240
            Top = 210
            Width = 121
            Height = 21
            MaxLength = 13
            TabOrder = 5
          end
          object TBGenericas: TLFToolBar
            Left = 0
            Top = 0
            Width = 23
            Height = 483
            Align = alLeft
            AutoSize = True
            DisabledImages = DMMain.ILMain_In
            EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 6
            Separators = True
            object TButtIniciaSistema: TToolButton
              Left = 0
              Top = 0
              Hint = 
                'Inicializa el sistema vaciando las tablas de datos de todas las ' +
                'Empresas'
              Caption = 'Inicia Sistema'
              ImageIndex = 27
              ParentShowHint = False
              Wrap = True
              ShowHint = True
              OnClick = TButtIniciaSistemaClick
            end
            object TButtUbicaciones: TToolButton
              Left = 0
              Top = 22
              Hint = 'Vac'#237'a la tabla de ubicaciones innecesarias'
              Caption = 'Ubicaciones'
              ImageIndex = 81
              ParentShowHint = False
              Wrap = True
              ShowHint = True
              OnClick = TButtUbicacionesClick
            end
            object TButtGen_Innecesarios: TToolButton
              Left = 0
              Top = 44
              Hint = 'Vac'#237'a entradas innecesarias'
              Caption = 'Vac'#237'a entradas innecesarias'
              ImageIndex = 54
              ParentShowHint = False
              Wrap = True
              ShowHint = True
              OnClick = TButtVaciaLogClick
            end
            object TButtGen_Todos: TToolButton
              Left = 0
              Top = 66
              Hint = 'Vac'#237'a las entradas innecesarias (incluyendo las incorrectas)'
              Caption = 'Vacia todas las entradas innecesarias'
              ImageIndex = 101
              ParentShowHint = False
              Wrap = True
              ShowHint = True
              OnClick = TButtGen_TodosClick
            end
            object TButtGen_LimpiaTemp: TToolButton
              Left = 0
              Top = 88
              Hint = 'Vac'#237'a las tablas temporales'
              Caption = 'Limpia Temporales'
              ImageIndex = 9
              ParentShowHint = False
              Wrap = True
              ShowHint = True
              OnClick = TButtGen_LimpiaTempClick
            end
            object TBBorraConf: TToolButton
              Left = 0
              Top = 110
              ImageIndex = 2
              OnClick = TBBorraConfClick
            end
          end
          object ERutaLibros: TLFEdit
            Left = 113
            Top = 303
            Width = 559
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 7
            OnChange = ERutaLibrosChange
          end
          object EDirectorioEDIEntrada: TLFEdit
            Left = 113
            Top = 325
            Width = 559
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 8
            OnChange = EDirectorioEDIEntradaChange
          end
          object EDirectorioEDISalida: TLFEdit
            Left = 113
            Top = 347
            Width = 559
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 9
            OnChange = EDirectorioEDISalidaChange
          end
          object EDirectorioAutofirma: TLFEdit
            Left = 113
            Top = 391
            Width = 559
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 11
            OnChange = EDirectorioAutofirmaChange
          end
          object EDirectorio7Zip: TLFEdit
            Left = 113
            Top = 413
            Width = 559
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 13
            OnChange = EDirectorio7ZipChange
          end
          object EVersionAutofirma: TLFEdit
            Left = 737
            Top = 391
            Width = 65
            Height = 21
            TabOrder = 12
            OnChange = EVersionAutofirmaChange
          end
          object EDirectorioCurl: TLFEdit
            Left = 113
            Top = 435
            Width = 559
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 14
            OnChange = EDirectorioCurlChange
          end
          object EDirectorioLector: TLFEdit
            Left = 113
            Top = 369
            Width = 559
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 10
            OnChange = EDirectorioLectorChange
          end
          object EDirectorioSumatraPDF: TLFEdit
            Left = 113
            Top = 457
            Width = 559
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 15
            OnChange = EDirectorioSumatraPDFChange
          end
        end
      end
      object TSInformacion: TTabSheet
        Caption = '&Inform./Manten.'
        ImageIndex = 3
        OnShow = TSInformacionShow
        object PInfo: TLFPanel
          Left = 0
          Top = 0
          Width = 816
          Height = 483
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object PNLDatos: TLFPanel
            Left = 0
            Top = 0
            Width = 816
            Height = 346
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object BTNDirectorioBackup: TSpeedButton
              Tag = 1
              Left = 425
              Top = 118
              Width = 23
              Height = 22
              OnClick = BTNDirectorioBackupClick
            end
            object LVersion: TLFLabel
              Left = 82
              Top = 57
              Width = 35
              Height = 13
              Alignment = taRightJustify
              Caption = 'Versi'#243'n'
            end
            object LUsuario: TLFLabel
              Left = 81
              Top = 79
              Width = 36
              Height = 13
              Alignment = taRightJustify
              Caption = 'Usuario'
            end
            object LSistema: TLFLabel
              Left = 80
              Top = 101
              Width = 37
              Height = 13
              Alignment = taRightJustify
              Caption = 'Sistema'
            end
            object LDirBackup: TLFLabel
              Left = 56
              Top = 123
              Width = 61
              Height = 13
              Alignment = taRightJustify
              Caption = 'Dir. Backups'
            end
            object LBaseDeDatos: TLFLabel
              Left = 49
              Top = 12
              Width = 68
              Height = 13
              Alignment = taRightJustify
              Caption = 'Base de datos'
            end
            object LBaseDeDatosAdjuntos: TLFLabel
              Left = 5
              Top = 34
              Width = 112
              Height = 13
              Alignment = taRightJustify
              Caption = 'Base de datos Adjuntos'
            end
            object EBaseDeDatos: TLFEdit
              Left = 121
              Top = 9
              Width = 326
              Height = 21
              Color = clInfoBk
              Enabled = False
              TabOrder = 0
            end
            object EVersion: TLFEdit
              Left = 121
              Top = 53
              Width = 326
              Height = 21
              Color = clInfoBk
              Enabled = False
              TabOrder = 2
            end
            object EUsuario: TLFEdit
              Left = 121
              Top = 75
              Width = 154
              Height = 21
              Color = clInfoBk
              Enabled = False
              TabOrder = 3
            end
            object ESistema: TLFEdit
              Left = 121
              Top = 97
              Width = 327
              Height = 21
              Color = clInfoBk
              Enabled = False
              TabOrder = 4
            end
            object EBackups: TLFEdit
              Left = 121
              Top = 119
              Width = 304
              Height = 21
              Color = clInfoBk
              Enabled = False
              TabOrder = 5
            end
            object EBaseDeDatosAdjuntos: TLFEdit
              Left = 121
              Top = 31
              Width = 326
              Height = 21
              Color = clInfoBk
              Enabled = False
              TabOrder = 1
            end
          end
          object PNLBotones: TLFPanel
            Left = 0
            Top = 346
            Width = 816
            Height = 137
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            object LRestore: TLFLabel
              Left = 117
              Top = 37
              Width = 37
              Height = 13
              Caption = 'Restore'
            end
            object LBackup: TLFLabel
              Left = 117
              Top = 60
              Width = 37
              Height = 13
              Caption = 'Backup'
            end
            object LSweep: TLFLabel
              Left = 117
              Top = 14
              Width = 33
              Height = 13
              Caption = 'Sweep'
            end
            object LActualizaciones: TLFLabel
              Left = 117
              Top = 83
              Width = 74
              Height = 13
              Caption = 'Actualizaciones'
              Visible = False
            end
            object TBBotones: TLFToolBar
              Left = 85
              Top = 8
              Width = 25
              Height = 90
              Align = alNone
              AutoSize = True
              DisabledImages = DMMain.ILMain_In
              EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
              EdgeInner = esNone
              Flat = True
              HotImages = DMMain.ILMain_Ac
              Images = DMMain.ILMain_Ac
              TabOrder = 0
              Separators = True
              object TButtSweep: TToolButton
                Left = 0
                Top = 0
                Hint = 'Sweep'
                Caption = 'Sweep'
                ImageIndex = 26
                ParentShowHint = False
                Wrap = True
                ShowHint = True
                OnClick = TButtSweepClick
              end
              object TButtRestore: TToolButton
                Left = 0
                Top = 22
                Hint = 'Restore'
                Caption = 'Restore'
                ImageIndex = 36
                ParentShowHint = False
                Wrap = True
                ShowHint = True
                OnClick = TButtRestoreClick
              end
              object TButtBackup: TToolButton
                Left = 0
                Top = 44
                Hint = 'Backup'
                Caption = 'Backup'
                ImageIndex = 49
                ParentShowHint = False
                Wrap = True
                ShowHint = True
                OnClick = TButtBackupClick
              end
              object TButtParches: TToolButton
                Left = 0
                Top = 66
                Hint = 'Actualizaciones'
                Caption = 'Parches'
                ImageIndex = 94
                ParentShowHint = False
                ShowHint = True
                Visible = False
                OnClick = TButtParchesClick
              end
            end
          end
        end
      end
      object TSAdjuntos: TTabSheet
        Caption = 'Adjuntos'
        ImageIndex = 8
        object PNLAdjuntos: TLFPanel
          Left = 0
          Top = 0
          Width = 816
          Height = 483
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LRutaFicheros: TLFLabel
            Left = 30
            Top = 61
            Width = 90
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ruta para Ficheros'
          end
          object LBaseDatosAdjuntos: TLFLabel
            Left = 50
            Top = 131
            Width = 70
            Height = 13
            Alignment = taRightJustify
            Caption = 'Base de Datos'
          end
          object LUsuarioBDAdjuntos: TLFLabel
            Left = 32
            Top = 153
            Width = 88
            Height = 13
            Alignment = taRightJustify
            Caption = 'Usuario de la BDD'
          end
          object LRolBDAdjuntos: TLFLabel
            Left = 52
            Top = 175
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Rol de la BDD'
          end
          object LClaveBDAdjuntos: TLFLabel
            Left = 67
            Top = 197
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Clave BDD'
          end
          object LCarpetaCompartida: TLFLabel
            Left = 8
            Top = 37
            Width = 172
            Height = 13
            Caption = 'Utilizando Carpeta Compartida'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LUtilizarBaseSeparadaAdjuntos: TLFLabel
            Left = 8
            Top = 109
            Width = 200
            Height = 13
            Caption = 'Utilizando Base de Datos separada'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LCharsetBDAdjuntos: TLFLabel
            Left = 58
            Top = 219
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Charset BDD'
          end
          object ERutaFicheros: TLFEdit
            Left = 125
            Top = 57
            Width = 355
            Height = 21
            TabOrder = 1
          end
          object EBaseDatosAdjuntos: TLFEdit
            Left = 125
            Top = 127
            Width = 355
            Height = 21
            TabOrder = 2
          end
          object EUsuarioBDAdjuntos: TLFEdit
            Left = 125
            Top = 149
            Width = 355
            Height = 21
            TabOrder = 3
          end
          object ERolBDAdjuntos: TLFEdit
            Left = 125
            Top = 171
            Width = 355
            Height = 21
            TabOrder = 4
          end
          object EClaveBDAdjuntos: TLFEdit
            Left = 125
            Top = 193
            Width = 355
            Height = 21
            PasswordChar = '*'
            TabOrder = 5
          end
          object TBAdjuntos: TLFToolBar
            Left = 0
            Top = 0
            Width = 816
            Height = 22
            AutoSize = True
            Caption = 'TBAdjuntos'
            DisabledImages = DMMain.ILMain_In
            EdgeBorders = []
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Separators = True
            object TButtLeerConfAdjuntos: TToolButton
              Left = 0
              Top = 0
              Hint = 'Leer configuracion'
              Caption = 'Leer configuracion'
              ImageIndex = 36
              OnClick = TButtLeerConfAdjuntosClick
            end
            object TButtGrabarConfAdjuntos: TToolButton
              Left = 23
              Top = 0
              Hint = 'Grabar configuracion'
              Caption = 'Grabar configuracion'
              ImageIndex = 41
              OnClick = TButtGrabarConfAdjuntosClick
            end
          end
          object BTraspasaAdjuntosACarpetaCompartida: TButton
            Left = 125
            Top = 248
            Width = 355
            Height = 25
            Hint = 'Traspasa TODOS los Adjuntos a Carpeta Compartida'
            Caption = 'Traspasa Adjuntos a Carpeta Compartida'
            TabOrder = 7
            OnClick = BTraspasaAdjuntosACarpetaCompartidaClick
          end
          object BTraspasaAdjuntosABaseSeparada: TButton
            Left = 125
            Top = 272
            Width = 355
            Height = 25
            Hint = 'Traspasa TODOS los Adjuntos a Base Separada'
            Caption = 'Traspasa Adjuntos a Base Separada'
            TabOrder = 8
            OnClick = BTraspasaAdjuntosABaseSeparadaClick
          end
          object BTraspasaAdjutnosABase: TButton
            Left = 125
            Top = 296
            Width = 355
            Height = 25
            Hint = 'Traspasa TODOS los Adjuntos a Base de datos'
            Caption = 'Traspasa Adjuntos a Base de datos'
            TabOrder = 9
            OnClick = BTraspasaAdjutnosABaseClick
          end
          object ECharsetBDAdjuntos: TLFEdit
            Left = 125
            Top = 215
            Width = 355
            Height = 21
            TabOrder = 6
          end
        end
      end
      object TSImagenes: TTabSheet
        Caption = 'Imagenes'
        ImageIndex = 9
        object PNLImagenes: TLFPanel
          Left = 0
          Top = 0
          Width = 816
          Height = 483
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LRutaFicherosImagenes: TLFLabel
            Left = 30
            Top = 61
            Width = 90
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ruta para Ficheros'
            Visible = False
          end
          object LBaseDatosAmagenes: TLFLabel
            Left = 50
            Top = 131
            Width = 70
            Height = 13
            Alignment = taRightJustify
            Caption = 'Base de Datos'
          end
          object LUsuarioBDImagenes: TLFLabel
            Left = 32
            Top = 153
            Width = 88
            Height = 13
            Alignment = taRightJustify
            Caption = 'Usuario de la BDD'
          end
          object LRolBDImagenes: TLFLabel
            Left = 52
            Top = 175
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Rol de la BDD'
          end
          object LClaveBDImagenes: TLFLabel
            Left = 67
            Top = 197
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Clave BDD'
          end
          object LCarpetaCompartidaImagenes: TLFLabel
            Left = 8
            Top = 37
            Width = 172
            Height = 13
            Caption = 'Utilizando Carpeta Compartida'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            Visible = False
          end
          object LUtilizarBaseSeparadaImagenes: TLFLabel
            Left = 8
            Top = 109
            Width = 200
            Height = 13
            Caption = 'Utilizando Base de Datos separada'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LCharsetBDImagenes: TLFLabel
            Left = 58
            Top = 219
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Charset BDD'
          end
          object ERutaImagenes: TLFEdit
            Left = 125
            Top = 57
            Width = 355
            Height = 21
            TabOrder = 1
            Visible = False
          end
          object EBaseDatosImagenes: TLFEdit
            Left = 125
            Top = 127
            Width = 355
            Height = 21
            TabOrder = 2
          end
          object EUsuarioBDImagenes: TLFEdit
            Left = 125
            Top = 149
            Width = 355
            Height = 21
            TabOrder = 3
          end
          object ERolBDImagenes: TLFEdit
            Left = 125
            Top = 171
            Width = 355
            Height = 21
            TabOrder = 4
          end
          object EClaveBDImagenes: TLFEdit
            Left = 125
            Top = 193
            Width = 355
            Height = 21
            PasswordChar = '*'
            TabOrder = 5
          end
          object TBImagenes: TLFToolBar
            Left = 0
            Top = 0
            Width = 816
            Height = 22
            AutoSize = True
            Caption = 'TBAdjuntos'
            DisabledImages = DMMain.ILMain_In
            EdgeBorders = []
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            Separators = True
            object TButtLeerConfImagenes: TToolButton
              Left = 0
              Top = 0
              Hint = 'Leer configuracion'
              Caption = 'Leer configuracion'
              ImageIndex = 36
              OnClick = TButtLeerConfImagenesClick
            end
            object TButtGrabarConfImagenes: TToolButton
              Left = 23
              Top = 0
              Hint = 'Grabar configuracion'
              Caption = 'Grabar configuracion'
              ImageIndex = 41
              OnClick = TButtGrabarConfImagenesClick
            end
          end
          object BTraspasaImagenesACarpetaCompartida: TButton
            Left = 125
            Top = 248
            Width = 355
            Height = 25
            Hint = 'Traspasa TODOS los Adjuntos a Carpeta Compartida'
            Caption = 'Traspasa Imagenes a Carpeta Compartida'
            TabOrder = 7
            Visible = False
            OnClick = BTraspasaImagenesACarpetaCompartidaClick
          end
          object BTraspasaImagenesABaseSeparada: TButton
            Left = 125
            Top = 272
            Width = 355
            Height = 25
            Hint = 'Traspasa TODOS los Adjuntos a Base Separada'
            Caption = 'Traspasa Imagenes a Base Separada'
            TabOrder = 8
            OnClick = BTraspasaImagenesABaseSeparadaClick
          end
          object BTraspasaImagenesABase: TButton
            Left = 125
            Top = 296
            Width = 355
            Height = 25
            Hint = 'Traspasa TODOS los Adjuntos a Base de datos'
            Caption = 'Traspasa Imagenes a Base de datos'
            TabOrder = 9
            OnClick = BTraspasaImagenesABaseClick
          end
          object ECharsetBDImagenes: TLFEdit
            Left = 125
            Top = 215
            Width = 355
            Height = 21
            TabOrder = 6
          end
        end
      end
      object TSMapa: TTabSheet
        Caption = '&Mapa'
        object PNMapa: TLFPanel
          Left = 0
          Top = 0
          Width = 816
          Height = 483
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object PMapaTitulo: TLFPanel
            Left = 0
            Top = 0
            Width = 816
            Height = 33
            Align = alTop
            BevelOuter = bvNone
            Caption = 'Mapa de Empresas-Ejercicios-Canales de la aplicaci'#243'n'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object PMapa: TLFPanel
            Left = 0
            Top = 33
            Width = 816
            Height = 450
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object TWMapa: TTreeView
              Left = 0
              Top = 22
              Width = 816
              Height = 428
              Align = alClient
              BevelInner = bvNone
              BevelOuter = bvNone
              Images = DMMain.ILMain_Ac
              Indent = 19
              ReadOnly = True
              TabOrder = 0
            end
            object TBMapa: TLFToolBar
              Left = 0
              Top = 0
              Width = 816
              Height = 22
              AutoSize = True
              EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
              EdgeInner = esNone
              EdgeOuter = esNone
              Flat = True
              HotImages = DMMain.ILMain_Ac
              Images = DMMain.ILMain_Ac
              ParentShowHint = False
              ShowHint = True
              TabOrder = 1
              Separators = True
              object TButtRegMapa: TToolButton
                Left = 0
                Top = 0
                Hint = 'Regenera mapa de la base de datos'
                Caption = 'Regenara Mapa'
                ImageIndex = 26
                OnClick = TButtRegMapaClick
              end
            end
          end
        end
      end
      object TSDetalle: TTabSheet
        Hint = 'Empresa-Ejercicio-Canal activos'
        Caption = '&Detalle'
        ImageIndex = 6
        ParentShowHint = False
        ShowHint = True
        object PDetalle: TLFPanel
          Left = 0
          Top = 0
          Width = 816
          Height = 483
          Hint = 'Empresa-Ejercicio-Canal activos'
          Align = alClient
          BevelOuter = bvNone
          Enabled = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          object PNDetalle: TLFPanel
            Left = 0
            Top = 0
            Width = 816
            Height = 483
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object LEmpresa: TLFLabel
              Left = 33
              Top = 17
              Width = 41
              Height = 13
              Alignment = taRightJustify
              Caption = 'Empresa'
            end
            object LEjercicio: TLFLabel
              Left = 34
              Top = 39
              Width = 40
              Height = 13
              Alignment = taRightJustify
              Caption = 'Ejercicio'
            end
            object Canal: TLFLabel
              Left = 144
              Top = 39
              Width = 27
              Height = 13
              Alignment = taRightJustify
              Caption = 'Canal'
            end
            object LPais: TLFLabel
              Left = 149
              Top = 83
              Width = 22
              Height = 13
              Alignment = taRightJustify
              Caption = 'Pa'#237's'
            end
            object LMoneda: TLFLabel
              Left = 132
              Top = 105
              Width = 39
              Height = 13
              Alignment = taRightJustify
              Caption = 'Moneda'
            end
            object LModoIVA: TLFLabel
              Left = 124
              Top = 126
              Width = 47
              Height = 13
              Alignment = taRightJustify
              Caption = 'Modo IVA'
            end
            object LTipoIVA: TLFLabel
              Left = 130
              Top = 148
              Width = 41
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tipo IVA'
            end
            object LPerfil: TLFLabel
              Left = 148
              Top = 60
              Width = 23
              Height = 13
              Alignment = taRightJustify
              Caption = 'Perfil'
            end
            object DBEEmpresa: TLFDbedit
              Left = 77
              Top = 13
              Width = 35
              Height = 21
              Color = clInfoBk
              DataField = 'EMPRESA'
              DataSource = DMConfig.DSxVerEstado
              Enabled = False
              TabOrder = 0
            end
            object DBETitEmpresa: TLFDbedit
              Left = 113
              Top = 13
              Width = 347
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO_SE'
              DataSource = DMConfig.DSxVerEstado
              Enabled = False
              TabOrder = 1
            end
            object DBECanal: TLFDbedit
              Left = 174
              Top = 35
              Width = 35
              Height = 21
              Color = clInfoBk
              DataField = 'CANAL'
              DataSource = DMConfig.DSxVerEstado
              Enabled = False
              TabOrder = 2
            end
            object DBETitCanal: TLFDbedit
              Left = 210
              Top = 35
              Width = 250
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO_GC'
              DataSource = DMConfig.DSxVerEstado
              Enabled = False
              TabOrder = 3
            end
            object DBEEjercicio: TLFDbedit
              Left = 77
              Top = 35
              Width = 35
              Height = 21
              Color = clInfoBk
              DataField = 'EJERCICIO'
              DataSource = DMConfig.DSxVerEstado
              Enabled = False
              TabOrder = 4
            end
            object DBCBActivo: TLFDBCheckBox
              Left = 32
              Top = 147
              Width = 49
              Height = 17
              Caption = 'Activo'
              ClicksDisabled = False
              ColorCheck = 57088
              TabOrder = 5
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'ACTIVO'
              DataSource = DMConfig.DSxVerEstado
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBEPais: TLFDbedit
              Left = 174
              Top = 79
              Width = 35
              Height = 21
              Color = clInfoBk
              DataField = 'PAIS'
              DataSource = DMConfig.DSxVerEstado
              Enabled = False
              TabOrder = 6
            end
            object DBEModoIva: TLFDbedit
              Left = 174
              Top = 123
              Width = 35
              Height = 21
              Color = clInfoBk
              DataField = 'MODO_IVA'
              DataSource = DMConfig.DSxVerEstado
              Enabled = False
              TabOrder = 7
            end
            object DBEMoneda: TLFDbedit
              Left = 174
              Top = 101
              Width = 35
              Height = 21
              Color = clInfoBk
              DataField = 'MONEDA'
              DataSource = DMConfig.DSxVerEstado
              Enabled = False
              TabOrder = 8
            end
            object GBContabilidad: TGroupBox
              Left = 32
              Top = 174
              Width = 430
              Height = 112
              Caption = 'Contabilidad'
              TabOrder = 9
              object LNiveles: TLFLabel
                Left = 101
                Top = 17
                Width = 35
                Height = 13
                Alignment = taRightJustify
                Caption = 'Niveles'
              end
              object LAsientoApertura: TLFLabel
                Left = 59
                Top = 38
                Width = 78
                Height = 13
                Alignment = taRightJustify
                Caption = 'Asiento Apertura'
              end
              object LFechaApertura: TLFLabel
                Left = 227
                Top = 20
                Width = 73
                Height = 13
                Alignment = taRightJustify
                Caption = 'Fecha Apertura'
              end
              object LFechaCierre: TLFLabel
                Left = 241
                Top = 41
                Width = 60
                Height = 13
                Alignment = taRightJustify
                Caption = 'Fecha Cierre'
              end
              object LFechaLimite: TLFLabel
                Left = 239
                Top = 63
                Width = 62
                Height = 13
                Alignment = taRightJustify
                Caption = 'Fecha L'#237'mite'
              end
              object LFechaActivacion: TLFLabel
                Left = 218
                Top = 84
                Width = 83
                Height = 13
                Alignment = taRightJustify
                Caption = 'Fecha Activaci'#243'n'
              end
              object LAsientoCierre: TLFLabel
                Left = 72
                Top = 60
                Width = 65
                Height = 13
                Alignment = taRightJustify
                Caption = 'Asiento Cierre'
              end
              object DBENiveles: TLFDbedit
                Left = 142
                Top = 14
                Width = 35
                Height = 21
                Color = clInfoBk
                DataField = 'NIVELES'
                DataSource = DMConfig.DSxVerEstado
                Enabled = False
                TabOrder = 0
              end
              object DBEAto_Cierre: TLFDbedit
                Left = 142
                Top = 58
                Width = 35
                Height = 21
                Color = clInfoBk
                DataField = 'ATO_CIERRE'
                DataSource = DMConfig.DSxVerEstado
                Enabled = False
                TabOrder = 1
              end
              object DBEAto_Apertura: TLFDbedit
                Left = 142
                Top = 36
                Width = 35
                Height = 21
                Color = clInfoBk
                DataField = 'ATO_APERTURA'
                DataSource = DMConfig.DSxVerEstado
                Enabled = False
                TabOrder = 2
              end
              object DBEFecApertura: TLFDbedit
                Left = 307
                Top = 14
                Width = 111
                Height = 21
                Color = clInfoBk
                DataField = 'F_APERTURA'
                DataSource = DMConfig.DSxVerEstado
                Enabled = False
                TabOrder = 3
              end
              object DBEFecCierre: TLFDbedit
                Left = 307
                Top = 36
                Width = 111
                Height = 21
                Color = clInfoBk
                DataField = 'F_CIERRE'
                DataSource = DMConfig.DSxVerEstado
                Enabled = False
                TabOrder = 4
              end
              object DBEFecLimite: TLFDbedit
                Left = 307
                Top = 58
                Width = 111
                Height = 21
                Color = clInfoBk
                DataField = 'F_LIMITE'
                DataSource = DMConfig.DSxVerEstado
                Enabled = False
                TabOrder = 5
              end
              object DBEActivacion: TLFDbedit
                Left = 307
                Top = 80
                Width = 111
                Height = 21
                Color = clInfoBk
                DataField = 'F_ACTIVACION'
                DataSource = DMConfig.DSxVerEstado
                Enabled = False
                TabOrder = 6
              end
            end
            object DBETitPais: TLFDbedit
              Left = 210
              Top = 79
              Width = 250
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO_SP'
              DataSource = DMConfig.DSxVerEstado
              Enabled = False
              TabOrder = 10
            end
            object DBETitMoneda: TLFDbedit
              Left = 210
              Top = 101
              Width = 250
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO_SM'
              DataSource = DMConfig.DSxVerEstado
              Enabled = False
              TabOrder = 11
            end
            object DBETitModoIva: TLFDbedit
              Left = 210
              Top = 123
              Width = 250
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO_MI'
              DataSource = DMConfig.DSxVerEstado
              Enabled = False
              TabOrder = 12
            end
            object DBETipoIva: TLFDbedit
              Left = 174
              Top = 145
              Width = 35
              Height = 21
              Color = clInfoBk
              DataField = 'TIPO_IVA'
              DataSource = DMConfig.DSxVerEstado
              Enabled = False
              TabOrder = 13
            end
            object DBETitTipoIva: TLFDbedit
              Left = 210
              Top = 145
              Width = 250
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO_TI'
              DataSource = DMConfig.DSxVerEstado
              Enabled = False
              TabOrder = 14
            end
            object DBETitPerfil: TLFDbedit
              Left = 210
              Top = 57
              Width = 250
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO_PE'
              DataSource = DMConfig.DSxVerEstado
              Enabled = False
              TabOrder = 15
            end
            object DBEPerfil: TLFDbedit
              Left = 174
              Top = 57
              Width = 35
              Height = 21
              Color = clInfoBk
              DataField = 'PERFIL'
              DataSource = DMConfig.DSxVerEstado
              Enabled = False
              TabOrder = 16
            end
            object ScrBImagen: TScrollBox
              Left = 29
              Top = 57
              Width = 85
              Height = 75
              HorzScrollBar.Visible = False
              VertScrollBar.Visible = False
              AutoScroll = False
              BorderStyle = bsNone
              TabOrder = 17
              object Imagen: TImage
                Left = 0
                Top = 0
                Width = 85
                Height = 75
                Align = alClient
                AutoSize = True
                IncrementalDisplay = True
                Stretch = True
              end
            end
          end
        end
      end
      object PImp: TTabSheet
        Caption = 'Im&presoras'
        ImageIndex = 6
        OnShow = PImpShow
        object PNImpresoras: TLFPanel
          Left = 0
          Top = 0
          Width = 816
          Height = 483
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LImpresoraPredeterminadaPapelNormal: TLFLabel
            Left = 36
            Top = 121
            Width = 361
            Height = 13
            Caption = 
              'Impresora predeterminada para la impresi'#243'n de documentos en pape' +
              'l normal:'
          end
          object LImpresoraPredeterminadaPapelContirnuo: TLFLabel
            Left = 36
            Top = 51
            Width = 371
            Height = 13
            Caption = 
              'Impresora predeterminada para la impresi'#243'n de documentos en pape' +
              'l continuo:'
          end
          object LblMoneda: TLFLabel
            Left = 39
            Top = 180
            Width = 231
            Height = 13
            Alignment = taRightJustify
            Caption = 'Segunda moneda para impresi'#243'n de documentos'
          end
          object CBMatricial: TLFComboBox
            Left = 36
            Top = 71
            Width = 345
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            OnChange = CBMatricialChange
          end
          object EDTPuertoMatricial: TLFEdit
            Left = 36
            Top = 93
            Width = 345
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 1
          end
          object DBLCBMoneda: TDBLookupComboBox
            Left = 275
            Top = 176
            Width = 156
            Height = 21
            KeyField = 'MONEDA'
            ListField = 'TITULO'
            ListSource = DMConfig.DSxMonedas
            TabOrder = 2
          end
          object CBLaser: TLFComboBox
            Left = 36
            Top = 141
            Width = 345
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 3
            OnChange = CBMatricialChange
          end
          object TBGuardarConfig: TLFToolBar
            Left = 0
            Top = 444
            Width = 816
            Height = 39
            Align = alBottom
            ButtonHeight = 36
            ButtonWidth = 155
            EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            ParentShowHint = False
            ShowCaptions = True
            ShowHint = True
            TabOrder = 4
            Separators = True
            object TButtGuardarActual: TToolButton
              Left = 0
              Top = 0
              AutoSize = True
              Caption = 'Guardar la configuraci'#243'n actual'
              ImageIndex = 41
              OnClick = TButtGuardarActualClick
            end
          end
        end
      end
      object TSConfiguracion: TTabSheet
        Caption = 'Configuraci'#243'n'
        ImageIndex = 7
        object PNLConfiguracion: TLFPanel
          Left = 0
          Top = 0
          Width = 816
          Height = 483
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object PGConfiguracion: TLFPageControl
            Left = 0
            Top = 0
            Width = 816
            Height = 483
            ActivePage = TSKriConfiguracion
            Align = alClient
            OwnerDraw = True
            TabIndex = 0
            TabOrder = 0
            TabActiveColor = clWhite
            TabInactiveColor = 14936298
            object TSKriConfiguracion: TTabSheet
              Caption = 'KriConfiguracion'
              object TBConfiguracion: TLFToolBar
                Left = 0
                Top = 0
                Width = 808
                Height = 29
                DisabledImages = DMMain.ILMain_In
                EdgeInner = esNone
                EdgeOuter = esNone
                HotImages = DMMain.ILMain_Ac
                Images = DMMain.ILMain_Ac
                TabOrder = 0
                Separators = True
                object NavKriConfiguracion: THYMNavigator
                  Left = 0
                  Top = 2
                  Width = 240
                  Height = 22
                  DataSource = DMConfig.DSxKriConfiguracion
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
                object ToolButton1: TToolButton
                  Left = 240
                  Top = 2
                  Width = 8
                  Style = tbsSeparator
                end
                object TButtRefrescaKriConfiguracion: TToolButton
                  Left = 248
                  Top = 2
                  Hint = 'Relee toda la configuracion'
                  Caption = 'Refresca Configuracion'
                  ImageIndex = 94
                  OnClick = TButtRefrescaKriConfiguracionClick
                end
                object PNLFiltroConfiguracion: TLFPanel
                  Left = 271
                  Top = 2
                  Width = 226
                  Height = 22
                  BevelOuter = bvNone
                  TabOrder = 1
                  object EFiltroConfiguracion: TLFEdit
                    Left = 3
                    Top = 0
                    Width = 222
                    Height = 21
                    TabOrder = 0
                    OnChange = EFiltroConfiguracionChange
                  end
                end
              end
              object DBGKriConfiguracion: TDBGrid
                Left = 0
                Top = 29
                Width = 808
                Height = 426
                Align = alClient
                DataSource = DMConfig.DSxKriConfiguracion
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                Columns = <
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'ID'
                    ReadOnly = True
                    Width = 36
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ESTADO'
                    Width = 41
                    Visible = True
                  end
                  item
                    Color = clInfoBk
                    Expanded = False
                    FieldName = 'DESCRIPCION'
                    ReadOnly = True
                    Width = 390
                    Visible = True
                  end>
              end
            end
            object TSDicNavegadores: TTabSheet
              Caption = 'DicNavegadores'
              ImageIndex = 1
              object TBDicNavegadores: TLFToolBar
                Left = 0
                Top = 0
                Width = 808
                Height = 29
                DisabledImages = DMMain.ILMain_In
                EdgeInner = esNone
                EdgeOuter = esNone
                HotImages = DMMain.ILMain_Ac
                Images = DMMain.ILMain_Ac
                TabOrder = 0
                Separators = True
                object NavDicNavegadores: THYMNavigator
                  Left = 0
                  Top = 2
                  Width = 240
                  Height = 22
                  DataSource = DMConfig.DSxDicNavegadores
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
                object ToolButton2: TToolButton
                  Left = 240
                  Top = 2
                  Width = 8
                  Style = tbsSeparator
                end
                object LPerfilDicNavegadores: TLFLabel
                  Left = 248
                  Top = 2
                  Width = 30
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Perfil'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Layout = tlCenter
                end
                object EFPerfilDicNavegadores: TLFEditFind2000
                  Left = 278
                  Top = 2
                  Width = 75
                  Height = 22
                  TabOrder = 1
                  OnChange = EFPerfilDicNavegadoresChange
                  Base_de_datos = DMMain.DataBase
                  Transaction = DMMain.TLocal
                  BuscarNums = False
                  BuscarChars = True
                  AutoCambiarFoco = False
                  CampoNum = 'PERFIL'
                  CampoStr = 'TITULO'
                  Posicion = tpCentrado
                  ReemplazarCaracter = True
                  SalirSiVacio = True
                  SalirSiNoExiste = False
                  Tabla_a_buscar = 'SYS_USUARIOS_PERFIL'
                  Tabla_asociada.DesplegarBusqueda = False
                  OrdenadoPor.Strings = (
                    'PERFIL')
                  Filtros = []
                  Entorno = DMMain.EntornoBusqueda
                end
              end
              object DBGDicNavegadores: TFIBHYGGridFind
                Left = 0
                Top = 29
                Width = 808
                Height = 426
                Align = alClient
                Color = clInfoBk
                DataSource = DMConfig.DSxDicNavegadores
                TabOrder = 1
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
                IndiceBitmapAscendente = 1
                IndiceBitmapChecked = 3
                IndiceBitmapDescendente = 2
                BaseDeDatos = DMMain.DataBase
                BuscarNums = False
                CampoAOrdenarColor = clInfoBk
                CampoAOrdenarBitmaps = DMMain.ILOrdGrid
                CamposAOrdernar.Strings = (
                  'FORMULARIO'
                  'NAVEGADOR'
                  'PERFIL')
                MensajeNoExiste = False
                SalirSiVacio = False
                SalirSiNoExiste = False
                Posicion = tpCentrado
                OrdenMultiple = True
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'PERFIL'
                    ReadOnly = True
                    Width = 32
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FORMULARIO'
                    ReadOnly = True
                    Width = 177
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NAVEGADOR'
                    ReadOnly = True
                    Width = 146
                    Visible = True
                  end
                  item
                    Color = clWindow
                    Expanded = False
                    FieldName = 'BOTONES'
                    Width = 104
                    Visible = True
                  end>
              end
            end
            object TSDicGrids: TTabSheet
              Caption = 'DicGrids'
              ImageIndex = 2
              object TBDicGrids: TLFToolBar
                Left = 0
                Top = 0
                Width = 808
                Height = 29
                DisabledImages = DMMain.ILMain_In
                EdgeInner = esNone
                EdgeOuter = esNone
                HotImages = DMMain.ILMain_Ac
                Images = DMMain.ILMain_Ac
                TabOrder = 0
                Separators = True
                object NavDicGrids: THYMNavigator
                  Left = 0
                  Top = 2
                  Width = 240
                  Height = 22
                  DataSource = DMConfig.DSxDicGrids
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
                object ToolButton3: TToolButton
                  Left = 240
                  Top = 2
                  Width = 8
                  Style = tbsSeparator
                end
                object LPerfilDicGrids: TLFLabel
                  Left = 248
                  Top = 2
                  Width = 30
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Perfil'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Layout = tlCenter
                end
                object EFPerfilDicGrids: TLFEditFind2000
                  Left = 278
                  Top = 2
                  Width = 75
                  Height = 22
                  TabOrder = 1
                  OnChange = EFPerfilDicGridsChange
                  Base_de_datos = DMMain.DataBase
                  Transaction = DMMain.TLocal
                  BuscarNums = False
                  BuscarChars = True
                  AutoCambiarFoco = False
                  CampoNum = 'PERFIL'
                  CampoStr = 'TITULO'
                  Posicion = tpCentrado
                  ReemplazarCaracter = True
                  SalirSiVacio = True
                  SalirSiNoExiste = False
                  Tabla_a_buscar = 'SYS_USUARIOS_PERFIL'
                  Tabla_asociada.DesplegarBusqueda = False
                  OrdenadoPor.Strings = (
                    'PERFIL')
                  Filtros = []
                end
              end
              object DBGDicGrids: TFIBHYGGridFind
                Left = 0
                Top = 29
                Width = 808
                Height = 426
                Align = alClient
                Color = clInfoBk
                DataSource = DMConfig.DSxDicGrids
                TabOrder = 1
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
                IndiceBitmapAscendente = 1
                IndiceBitmapChecked = 3
                IndiceBitmapDescendente = 2
                BaseDeDatos = DMMain.DataBase
                BuscarNums = False
                CampoAOrdenarColor = clInfoBk
                CampoAOrdenarBitmaps = DMMain.ILOrdGrid
                CamposAOrdernar.Strings = (
                  'FORMULARIO'
                  'GRID'
                  'PERFIL')
                MensajeNoExiste = False
                SalirSiVacio = False
                SalirSiNoExiste = False
                Posicion = tpCentrado
                OrdenMultiple = True
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'PERFIL'
                    ReadOnly = True
                    Width = 32
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FORMULARIO'
                    ReadOnly = True
                    Width = 177
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'GRID'
                    ReadOnly = True
                    Width = 146
                    Visible = True
                  end
                  item
                    Color = clWindow
                    Expanded = False
                    FieldName = 'RESTRICCION'
                    Width = 104
                    Visible = True
                  end>
              end
            end
            object TSDicPageControls: TTabSheet
              Caption = 'DicPageControls'
              ImageIndex = 3
              object DBGDicPageControls1: TFIBHYGGridFind
                Left = 0
                Top = 29
                Width = 808
                Height = 426
                Align = alClient
                Color = clInfoBk
                DataSource = DMConfig.DSxDicPagecontrols
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
                IndiceBitmapAscendente = 1
                IndiceBitmapChecked = 3
                IndiceBitmapDescendente = 2
                BaseDeDatos = DMMain.DataBase
                BuscarNums = False
                CampoAOrdenarColor = clInfoBk
                CampoAOrdenarBitmaps = DMMain.ILOrdGrid
                CamposAOrdernar.Strings = (
                  'FORMULARIO'
                  'PAGECONTROL'
                  'PERFIL'
                  'TABSHEET')
                ColumnasCheckBoxes.Strings = (
                  'RESTRICCION')
                ColumnasChecked.Strings = (
                  '1')
                ColumnasNoChecked.Strings = (
                  '0')
                MensajeNoExiste = False
                SalirSiVacio = False
                SalirSiNoExiste = False
                Posicion = tpCentrado
                OrdenMultiple = True
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'PERFIL'
                    ReadOnly = True
                    Width = 32
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'FORMULARIO'
                    ReadOnly = True
                    Width = 177
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PAGECONTROL'
                    ReadOnly = True
                    Width = 100
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TABSHEET'
                    ReadOnly = True
                    Width = 100
                    Visible = True
                  end
                  item
                    Color = clWindow
                    Expanded = False
                    FieldName = 'RESTRICCION'
                    Width = 56
                    Visible = True
                  end>
              end
              object TBDicPageControls: TLFToolBar
                Left = 0
                Top = 0
                Width = 808
                Height = 29
                DisabledImages = DMMain.ILMain_In
                EdgeInner = esNone
                EdgeOuter = esNone
                HotImages = DMMain.ILMain_Ac
                Images = DMMain.ILMain_Ac
                TabOrder = 1
                Separators = True
                object NavDicPageControls: THYMNavigator
                  Left = 0
                  Top = 2
                  Width = 240
                  Height = 22
                  DataSource = DMConfig.DSxDicPagecontrols
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
                object TButtSep: TToolButton
                  Left = 240
                  Top = 2
                  Width = 8
                  Style = tbsSeparator
                end
                object LPerfilDicPageControls: TLFLabel
                  Left = 248
                  Top = 2
                  Width = 30
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Perfil'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  Layout = tlCenter
                end
                object EFPerfilDicPageControls: TLFEditFind2000
                  Left = 278
                  Top = 2
                  Width = 75
                  Height = 22
                  TabOrder = 1
                  OnChange = EFPerfilDicPageControlsChange
                  Base_de_datos = DMMain.DataBase
                  Transaction = DMMain.TLocal
                  BuscarNums = False
                  BuscarChars = True
                  AutoCambiarFoco = False
                  CampoNum = 'PERFIL'
                  CampoStr = 'TITULO'
                  Posicion = tpCentrado
                  ReemplazarCaracter = True
                  SalirSiVacio = True
                  SalirSiNoExiste = False
                  Tabla_a_buscar = 'SYS_USUARIOS_PERFIL'
                  Tabla_asociada.DesplegarBusqueda = False
                  OrdenadoPor.Strings = (
                    'PERFIL')
                  Filtros = []
                end
              end
            end
            object TSUsuariosConcurrentes: TTabSheet
              Caption = 'Usuarios Concurrentes'
              ImageIndex = 4
              OnShow = TSUsuariosConcurrentesShow
              object TBUsuariosConcurrentes: TLFToolBar
                Left = 0
                Top = 0
                Width = 808
                Height = 22
                AutoSize = True
                Caption = 'TBAdjuntos'
                DisabledImages = DMMain.ILMain_In
                EdgeBorders = []
                EdgeInner = esNone
                EdgeOuter = esNone
                Flat = True
                HotImages = DMMain.ILMain_Ac
                Images = DMMain.ILMain_Ac
                ParentShowHint = False
                ShowHint = True
                TabOrder = 0
                Separators = True
                object TBLeerConfUsuariosConcurrentes: TToolButton
                  Left = 0
                  Top = 0
                  Hint = 'Leer configuracion'
                  Caption = 'Leer configuracion'
                  ImageIndex = 36
                  OnClick = TBLeerConfUsuariosConcurrentesClick
                end
                object TBGrabarConfUsuariosConcurrentes: TToolButton
                  Left = 23
                  Top = 0
                  Hint = 'Grabar configuracion'
                  Caption = 'Grabar configuracion'
                  ImageIndex = 41
                  OnClick = TBGrabarConfUsuariosConcurrentesClick
                end
                object TBRefrescarUsuariosConcurrentes: TToolButton
                  Left = 46
                  Top = 0
                  Hint = 'Refrescar conexiones'
                  Caption = 'Refrescar conexiones'
                  ImageIndex = 26
                  OnClick = TBRefrescarUsuariosConcurrentesClick
                end
              end
              object MUsuariosConcurrentes: TMemo
                Left = 0
                Top = 63
                Width = 808
                Height = 392
                Align = alClient
                Font.Charset = ANSI_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Courier New'
                Font.Style = []
                Lines.Strings = (
                  'MUsuariosConcurrentes')
                ParentFont = False
                ScrollBars = ssBoth
                TabOrder = 1
              end
              object PNLUsuariosConcurrentes: TLFPanel
                Left = 0
                Top = 22
                Width = 808
                Height = 41
                Align = alTop
                BevelOuter = bvNone
                TabOrder = 2
                object LUsuariosConcurrentes: TLFLabel
                  Left = 19
                  Top = 16
                  Width = 106
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Usuarios concurrentes'
                end
                object LUsuariosConcurrentesHint: TLFLabel
                  Left = 195
                  Top = 16
                  Width = 52
                  Height = 13
                  Caption = 'O no limita.'
                end
                object EUsuariosConcurrentes: TLFEdit
                  Left = 129
                  Top = 13
                  Width = 60
                  Height = 21
                  TabOrder = 0
                end
              end
            end
          end
        end
      end
      object TSParametros: TTabSheet
        Caption = 'Pa&rametros'
        ImageIndex = 8
        object PNLParametros: TLFPanel
          Left = 0
          Top = 0
          Width = 816
          Height = 483
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object PCParametros: TLFPageControl
            Left = 0
            Top = 0
            Width = 816
            Height = 483
            ActivePage = TSParamDef
            Align = alClient
            OwnerDraw = True
            TabIndex = 0
            TabOrder = 0
            OnChange = PCParametrosChange
            TabActiveColor = clWhite
            TabInactiveColor = 14936298
            object TSParamDef: TTabSheet
              Caption = 'Definici'#243'n'
              object TBParamDef: TLFToolBar
                Left = 0
                Top = 0
                Width = 808
                Height = 24
                EdgeBorders = []
                Flat = True
                HotImages = DMMain.ILMain_Ac
                Images = DMMain.ILMain_Ac
                TabOrder = 0
                Separators = True
                object NavParamDef: THYMNavigator
                  Left = 0
                  Top = 0
                  Width = 240
                  Height = 22
                  DataSource = DMConfig.DSQMParamDef
                  Flat = True
                  ParentShowHint = False
                  PopupMenu = CEParamDefPMEdit
                  ShowHint = True
                  TabOrder = 0
                  ModoDeSeguridad = True
                  DelCaption = 'Informaci'#243'n'
                  DelMessage = ' '#191' Borra el registro ? '
                  EditaControl = DBDescripcion
                  InsertaControl = DBParametro
                  Exclusivo = True
                  ControlEdit = CEParamDef
                  OrdenAscendente = True
                  InsertaUltimo = False
                end
                object TBSep1: TToolButton
                  Left = 240
                  Top = 0
                  Width = 8
                  Style = tbsSeparator
                end
                object G2KTLParametro: TG2KTBLoc
                  Left = 248
                  Top = 0
                  Hint = 'Localizar'
                  Caption = 'G2KTLParametro'
                  ImageIndex = 83
                  DataSource = DMConfig.DSQMParamDef
                  Base_de_datos = DMMain.DataBase
                  Tabla_a_buscar = 'SYS_PARAMETROS_DEFINICION'
                  CampoNum = 'PARAMETRO'
                  CampoStr = 'DESCRIPCION'
                  Filtros = []
                  Entorno = DMMain.EntornoBusqueda
                  OrdenadoPor.Strings = (
                    'PARAMETRO')
                end
                object TBSep2: TToolButton
                  Left = 271
                  Top = 0
                  Width = 8
                  ImageIndex = 82
                  Style = tbsSeparator
                end
                object TBCreaParametroGeneral: TToolButton
                  Left = 279
                  Top = 0
                  Hint = 'Crea Parametro General'
                  Caption = 'Crea Parametro General'
                  ImageIndex = 42
                  OnClick = TBCreaParametroGeneralClick
                end
                object TBTBCreaParametroEmpresa: TToolButton
                  Left = 302
                  Top = 0
                  Hint = 'Crea Parametro Empresa'
                  Caption = 'Crea Parametro Empresa'
                  ImageIndex = 17
                  OnClick = TBTBCreaParametroEmpresaClick
                end
                object TBCreaParametroEmpresaSerie: TToolButton
                  Left = 325
                  Top = 0
                  Hint = 'Crea Parametro Empresa-Serie'
                  Caption = 'Crea Parametro Empresa-Serie'
                  ImageIndex = 50
                  OnClick = TBCreaParametroEmpresaSerieClick
                end
                object TBCreaParametroPerfil: TToolButton
                  Left = 348
                  Top = 0
                  Hint = 'Crea Parametro Perfil'
                  Caption = 'Crea Parametro Perfil'
                  ImageIndex = 54
                  OnClick = TBCreaParametroPerfilClick
                end
                object TBCreaParametroUsuario: TToolButton
                  Left = 371
                  Top = 0
                  Hint = 'Crea Parametro Usuario'
                  Caption = 'Crea Parametro Usuario'
                  ImageIndex = 104
                  OnClick = TBCreaParametroUsuarioClick
                end
              end
              object PCParamDef: TLFPageControl
                Left = 0
                Top = 24
                Width = 808
                Height = 431
                ActivePage = TSParamDefFicha
                Align = alClient
                OwnerDraw = True
                TabIndex = 0
                TabOrder = 1
                TabPosition = tpBottom
                TabActiveColor = clWhite
                TabInactiveColor = 14936298
                object TSParamDefFicha: TTabSheet
                  Caption = 'Ficha'
                  object PNLParamDef: TLFPanel
                    Left = 0
                    Top = 0
                    Width = 800
                    Height = 405
                    Align = alClient
                    BevelOuter = bvNone
                    TabOrder = 0
                    object LAyuda: TLFLabel
                      Left = 76
                      Top = 121
                      Width = 30
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Ayuda'
                    end
                    object LValorPorDefecto: TLFLabel
                      Left = 256
                      Top = 78
                      Width = 81
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Valor por defecto'
                    end
                    object LNivel: TLFLabel
                      Left = 475
                      Top = 12
                      Width = 24
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Nivel'
                    end
                    object LValoresPosibles: TLFLabel
                      Left = 30
                      Top = 78
                      Width = 76
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Valores posibles'
                    end
                    object LLongitud: TLFLabel
                      Left = 65
                      Top = 100
                      Width = 41
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Longitud'
                    end
                    object LTipo: TLFLabel
                      Left = 85
                      Top = 56
                      Width = 21
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Tipo'
                    end
                    object LDescripcion: TLFLabel
                      Left = 50
                      Top = 34
                      Width = 56
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Descripci'#243'n'
                    end
                    object LParametro: TLFLabel
                      Left = 58
                      Top = 12
                      Width = 48
                      Height = 13
                      Alignment = taRightJustify
                      Caption = 'Par'#225'metro'
                    end
                    object LDetalle: TLFLabel
                      Left = 73
                      Top = 144
                      Width = 33
                      Height = 13
                      Caption = 'Detalle'
                    end
                    object EDTitTipo: TLFEdit
                      Left = 162
                      Top = 52
                      Width = 391
                      Height = 21
                      Color = clInfoBk
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clGrayText
                      Font.Height = -11
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      TabOrder = 4
                      Text = '[N] Num'#233'rico [A] Alfanum'#233'rico [F] Fecha [V] Lista de valores'
                    end
                    object DBAyuda: TLFDbedit
                      Left = 112
                      Top = 118
                      Width = 441
                      Height = 21
                      DataField = 'AYUDA'
                      DataSource = DMConfig.DSQMParamDef
                      TabOrder = 8
                    end
                    object DBNivel: TLFDbedit
                      Left = 504
                      Top = 8
                      Width = 49
                      Height = 21
                      Hint = 'Nivel necesario para poder darle valor'
                      DataField = 'NIVEL'
                      DataSource = DMConfig.DSQMParamDef
                      TabOrder = 1
                    end
                    object DBValor_Def: TLFDbedit
                      Left = 342
                      Top = 74
                      Width = 211
                      Height = 21
                      DataField = 'VALOR_DEF'
                      DataSource = DMConfig.DSQMParamDef
                      TabOrder = 6
                    end
                    object DBValores: TLFDbedit
                      Left = 112
                      Top = 74
                      Width = 121
                      Height = 21
                      Hint = '[en blanco] cualquier valor'
                      DataField = 'VALORES_POSIBLES'
                      DataSource = DMConfig.DSQMParamDef
                      TabOrder = 5
                    end
                    object DBLongitud: TLFDbedit
                      Left = 112
                      Top = 96
                      Width = 49
                      Height = 21
                      Hint = 'Longitud m'#225'xima del campo'
                      DataField = 'LONGITUD'
                      DataSource = DMConfig.DSQMParamDef
                      TabOrder = 7
                    end
                    object DBTipo: TLFDbedit
                      Left = 112
                      Top = 52
                      Width = 49
                      Height = 21
                      Hint = '[N] Num'#233'rico [A] Alfanum'#233'rico [F] Fecha [V] Lista de valores'
                      CharCase = ecUpperCase
                      DataField = 'TIPO'
                      DataSource = DMConfig.DSQMParamDef
                      TabOrder = 3
                      OnChange = DBTipoChange
                    end
                    object DBDescripcion: TLFDbedit
                      Left = 112
                      Top = 30
                      Width = 441
                      Height = 21
                      DataField = 'DESCRIPCION'
                      DataSource = DMConfig.DSQMParamDef
                      TabOrder = 2
                    end
                    object DBParametro: TLFDbedit
                      Left = 112
                      Top = 8
                      Width = 121
                      Height = 21
                      DataField = 'PARAMETRO'
                      DataSource = DMConfig.DSQMParamDef
                      TabOrder = 0
                    end
                    object DBMDetalle: TLFDBMemo
                      Left = 112
                      Top = 140
                      Width = 441
                      Height = 93
                      DataField = 'DETALLE'
                      DataSource = DMConfig.DSQMParamDef
                      ScrollBars = ssVertical
                      TabOrder = 9
                    end
                  end
                end
                object TSParamDefTabla: TTabSheet
                  Caption = 'Tabla'
                  ImageIndex = 1
                  object DBGParamDef: THYTDBGrid
                    Left = 0
                    Top = 0
                    Width = 800
                    Height = 405
                    Align = alClient
                    DataSource = DMConfig.DSQMParamDef
                    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
                    TabOrder = 0
                    TitleFont.Charset = DEFAULT_CHARSET
                    TitleFont.Color = clWindowText
                    TitleFont.Height = -11
                    TitleFont.Name = 'MS Sans Serif'
                    TitleFont.Style = []
                    IniStorage = FSMain
                    Insercion = False
                    ColumnaInicial = 0
                    UsaDicG2K = True
                    Changed = False
                    Idioma = 'CAS'
                    AutoDeseleccionar = True
                    TabFicha = TSParamDefFicha
                    PermutaPaneles = False
                    CamposAOrdenar.Strings = (
                      'AYUDA'
                      'DESCRIPCION'
                      'PARAMETRO')
                    CamposAOrdenarImgs = DMMain.ILOrdGrid
                    CampoAOrdenarColor = clInfoBk
                    OrdenMultiple = True
                    Columns = <
                      item
                        Expanded = False
                        FieldName = 'PARAMETRO'
                        Width = 97
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'DESCRIPCION'
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'VALOR_DEF'
                        Width = 151
                        Visible = True
                      end
                      item
                        Expanded = False
                        FieldName = 'AYUDA'
                        Visible = True
                      end>
                  end
                end
              end
            end
            object TSParamGen: TTabSheet
              Caption = 'Generales'
              ImageIndex = 1
              object TBParamGen: TLFToolBar
                Left = 0
                Top = 0
                Width = 808
                Height = 22
                EdgeBorders = []
                Flat = True
                TabOrder = 0
                Separators = True
                object NavParamGen: THYMNavigator
                  Left = 0
                  Top = 0
                  Width = 240
                  Height = 22
                  DataSource = DMConfig.DSQMParamGen
                  Flat = True
                  ParentShowHint = False
                  PopupMenu = CEParamGenPMEdit
                  ShowHint = True
                  TabOrder = 0
                  ModoDeSeguridad = True
                  DelCaption = 'Informaci'#243'n'
                  DelMessage = ' '#191' Borra el registro ? '
                  EditaControl = DBGFParamGen
                  InsertaControl = DBGFParamGen
                  Exclusivo = True
                  ControlEdit = CEParamGen
                  OrdenAscendente = True
                  InsertaUltimo = False
                end
              end
              object DBGFParamGen: TDBGridFind2000
                Left = 0
                Top = 22
                Width = 808
                Height = 348
                Align = alClient
                DataSource = DMConfig.DSQMParamGen
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                IniStorage = FSMain
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
                BuscarNums = True
                Campos.Strings = (
                  'PARAMETRO')
                CamposAMostrar.Strings = (
                  'PARAMETRO'
                  '0')
                CamposAMostrarAnchos.Strings = (
                  '0')
                CamposADevolver.Strings = (
                  '')
                CamposDesplegar.Strings = (
                  '1')
                CampoAOrdenarColor = clInfoBk
                CampoAOrdenarBitmaps = DMMain.ILOrdGrid
                CamposAOrdernar.Strings = (
                  'PARAMETRO'
                  'DESCRIPCION')
                MensajeNoExiste = False
                Numericos.Strings = (
                  'PARAMETRO')
                SalirSiVacio = False
                SalirSiNoExiste = False
                Tablas.Strings = (
                  'SYS_PARAMETROS_DEFINICION')
                Acciones.Strings = (
                  '')
                Titulos.Strings = (
                  'DESCRIPCION')
                Posicion = tpCentrado
                OnBusqueda = DBGFParamGenBusqueda
                OnExiste = DBGFParamGenExiste
                OnRowChange = DBGFParamGenRowChange
                Planes.Strings = (
                  '')
                OrdenMultiple = True
                Filtros = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'PARAMETRO'
                    Width = 91
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESCRIPCION'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clGrayText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ReadOnly = True
                    Width = 315
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR'
                    Width = 154
                    Visible = True
                  end>
              end
              object PNLParamGenAyuda: TLFPanel
                Left = 0
                Top = 370
                Width = 808
                Height = 85
                Align = alBottom
                BevelOuter = bvNone
                TabOrder = 2
                object DBParamGenAyuda: TDBText
                  Left = 0
                  Top = 0
                  Width = 808
                  Height = 21
                  Align = alTop
                  Color = clBtnFace
                  DataField = 'AYUDA'
                  DataSource = DMConfig.DSQMParamGen
                  ParentColor = False
                  WordWrap = True
                end
                object MParamGenAyuda: TLFMemo
                  Left = 0
                  Top = 21
                  Width = 808
                  Height = 64
                  Align = alClient
                  ReadOnly = True
                  ScrollBars = ssVertical
                  TabOrder = 0
                end
              end
            end
            object TSParamEmp: TTabSheet
              Caption = 'Empresa'
              ImageIndex = 2
              object TBParamEmp: TLFToolBar
                Left = 0
                Top = 0
                Width = 808
                Height = 22
                AutoSize = True
                EdgeBorders = []
                Flat = True
                TabOrder = 0
                Separators = True
                object NavParamEmp: THYMNavigator
                  Left = 0
                  Top = 0
                  Width = 240
                  Height = 22
                  DataSource = DMConfig.DSQMParamEmp
                  Flat = True
                  ParentShowHint = False
                  PopupMenu = CEParamEmpPMEdit
                  ShowHint = True
                  TabOrder = 0
                  ModoDeSeguridad = True
                  DelCaption = 'Informaci'#243'n'
                  DelMessage = ' '#191' Borra el registro ? '
                  EditaControl = DBGFParamEmp
                  InsertaControl = DBGFParamEmp
                  Exclusivo = True
                  ControlEdit = CEParamEmp
                  OrdenAscendente = True
                  InsertaUltimo = False
                end
                object ToolButton4: TToolButton
                  Left = 240
                  Top = 0
                  Width = 8
                  Style = tbsSeparator
                end
                object CBParamEmpTodos: TLFCheckBox
                  Left = 248
                  Top = 0
                  Width = 161
                  Height = 22
                  Caption = 'Mostrar todas las empresas'
                  Checked = True
                  State = cbChecked
                  ClicksDisabled = False
                  ColorCheck = 57088
                  TabOrder = 1
                  TabStop = True
                  OnClick = CBParamEmpTodosClick
                  Alignment = taLeftJustify
                end
              end
              object DBGFParamEmp: TDBGridFind2000
                Left = 0
                Top = 22
                Width = 808
                Height = 348
                Align = alClient
                DataSource = DMConfig.DSQMParamEmp
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                IniStorage = FSMain
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
                BuscarNums = True
                Campos.Strings = (
                  'PARAMETRO'
                  'EMPRESA')
                CamposAMostrar.Strings = (
                  'PARAMETRO'
                  '0'
                  'EMPRESA'
                  '0')
                CamposAMostrarAnchos.Strings = (
                  '0'
                  '0')
                CamposADevolver.Strings = (
                  ''
                  '')
                CamposDesplegar.Strings = (
                  '1'
                  '1')
                CampoAOrdenarColor = clInfoBk
                CampoAOrdenarBitmaps = DMMain.ILOrdGrid
                CamposAOrdernar.Strings = (
                  'PARAMETRO'
                  'DESCRIPCION'
                  'EMPRESA')
                MensajeNoExiste = False
                Numericos.Strings = (
                  'PARAMETRO'
                  'EMPRESA')
                SalirSiVacio = False
                SalirSiNoExiste = False
                Tablas.Strings = (
                  'SYS_PARAMETROS_DEFINICION'
                  'SYS_EMPRESAS')
                Acciones.Strings = (
                  ''
                  '')
                Titulos.Strings = (
                  'DESCRIPCION'
                  'TITULO')
                Posicion = tpCentrado
                OnBusqueda = DBGFParamEmpBusqueda
                OnExiste = DBGFParamEmpExiste
                OnRowChange = DBGFParamEmpRowChange
                Planes.Strings = (
                  ''
                  '')
                OrdenMultiple = True
                Filtros = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'EMPRESA'
                    Width = 51
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TITULO_EMPRESA'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clGrayText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ReadOnly = True
                    Width = 106
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PARAMETRO'
                    Width = 91
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESCRIPCION'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clGrayText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ReadOnly = True
                    Width = 263
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR'
                    Width = 154
                    Visible = True
                  end>
              end
              object PNLParamEmpAyuda: TLFPanel
                Left = 0
                Top = 370
                Width = 808
                Height = 85
                Align = alBottom
                BevelOuter = bvNone
                TabOrder = 2
                object DBParamEmpAyuda: TDBText
                  Left = 0
                  Top = 0
                  Width = 808
                  Height = 21
                  Align = alTop
                  Color = clBtnFace
                  DataField = 'AYUDA'
                  DataSource = DMConfig.DSQMParamEmp
                  ParentColor = False
                end
                object MParamEmpAyuda: TLFMemo
                  Left = 0
                  Top = 21
                  Width = 808
                  Height = 64
                  Align = alClient
                  ReadOnly = True
                  ScrollBars = ssVertical
                  TabOrder = 0
                end
              end
            end
            object TSParamSer: TTabSheet
              Caption = 'Empresa - Serie'
              ImageIndex = 3
              object TBParamSer: TLFToolBar
                Left = 0
                Top = 0
                Width = 808
                Height = 22
                AutoSize = True
                EdgeBorders = []
                Flat = True
                TabOrder = 0
                Separators = True
                object NavParamSer: THYMNavigator
                  Left = 0
                  Top = 0
                  Width = 240
                  Height = 22
                  DataSource = DMConfig.DSQMParamSer
                  Flat = True
                  ParentShowHint = False
                  PopupMenu = CEParamSerPMEdit
                  ShowHint = True
                  TabOrder = 0
                  ModoDeSeguridad = True
                  DelCaption = 'Informaci'#243'n'
                  DelMessage = ' '#191' Borra el registro ? '
                  EditaControl = DBGFParamSer
                  InsertaControl = DBGFParamSer
                  Exclusivo = True
                  ControlEdit = CEParamSer
                  OrdenAscendente = True
                  InsertaUltimo = False
                end
                object ToolButton5: TToolButton
                  Left = 240
                  Top = 0
                  Width = 8
                  Style = tbsSeparator
                end
                object CBParamSerTodos: TLFCheckBox
                  Left = 248
                  Top = 0
                  Width = 161
                  Height = 22
                  Caption = 'Mostrar todas las empresas'
                  Checked = True
                  State = cbChecked
                  ClicksDisabled = False
                  ColorCheck = 57088
                  TabOrder = 1
                  TabStop = True
                  OnClick = CBParamSerTodosClick
                  Alignment = taLeftJustify
                end
              end
              object DBGFParamSer: TDBGridFind2000
                Left = 0
                Top = 22
                Width = 808
                Height = 348
                Align = alClient
                DataSource = DMConfig.DSQMParamSer
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                IniStorage = FSMain
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
                BuscarNums = True
                Campos.Strings = (
                  'PARAMETRO'
                  'EMPRESA'
                  'SERIE')
                CamposAMostrar.Strings = (
                  'PARAMETRO'
                  '0'
                  'EMPRESA'
                  '0'
                  'SERIE'
                  '0')
                CamposAMostrarAnchos.Strings = (
                  '0'
                  '0'
                  '0')
                CamposADevolver.Strings = (
                  ''
                  ''
                  '')
                CamposDesplegar.Strings = (
                  '1'
                  '1'
                  '1')
                CampoAOrdenarColor = clInfoBk
                CampoAOrdenarBitmaps = DMMain.ILOrdGrid
                CamposAOrdernar.Strings = (
                  'PARAMETRO'
                  'DESCRIPCION'
                  'EMPRESA'
                  'SERIE')
                MensajeNoExiste = False
                Numericos.Strings = (
                  'PARAMETRO'
                  'EMPRESA'
                  'SERIE')
                SalirSiVacio = False
                SalirSiNoExiste = False
                Tablas.Strings = (
                  'SYS_PARAMETROS_DEFINICION'
                  'SYS_EMPRESAS'
                  'VER_SERIES')
                Acciones.Strings = (
                  ''
                  ''
                  '')
                Titulos.Strings = (
                  'DESCRIPCION'
                  'TITULO'
                  'TITULO')
                Posicion = tpCentrado
                OnBusqueda = DBGFParamSerBusqueda
                OnExiste = DBGFParamSerExiste
                OnRowChange = DBGFParamSerRowChange
                Planes.Strings = (
                  ''
                  ''
                  '')
                OrdenMultiple = True
                Filtros = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'EMPRESA'
                    Width = 51
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TITULO_EMPRESA'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clGrayText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ReadOnly = True
                    Width = 105
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'SERIE'
                    Width = 39
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TITULO_SERIE'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clGrayText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ReadOnly = True
                    Width = 121
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PARAMETRO'
                    Width = 91
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESCRIPCION'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clGrayText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ReadOnly = True
                    Width = 214
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR'
                    Width = 154
                    Visible = True
                  end>
              end
              object PNLParamSerAyuda: TLFPanel
                Left = 0
                Top = 370
                Width = 808
                Height = 85
                Align = alBottom
                BevelOuter = bvNone
                TabOrder = 2
                object DBParamSerAyuda: TDBText
                  Left = 0
                  Top = 0
                  Width = 808
                  Height = 21
                  Align = alTop
                  Color = clBtnFace
                  DataField = 'AYUDA'
                  DataSource = DMConfig.DSQMParamSer
                  ParentColor = False
                end
                object MParamSerAyuda: TLFMemo
                  Left = 0
                  Top = 21
                  Width = 808
                  Height = 64
                  Align = alClient
                  ReadOnly = True
                  ScrollBars = ssVertical
                  TabOrder = 0
                end
              end
            end
            object TSParamPer: TTabSheet
              Caption = 'Perfil de Usuario'
              object TBParamPer: TLFToolBar
                Left = 0
                Top = 0
                Width = 808
                Height = 22
                AutoSize = True
                ButtonWidth = 25
                DisabledImages = DMMain.ILMain_In
                EdgeBorders = []
                Flat = True
                Images = DMMain.ILMain_Ac
                TabOrder = 0
                Separators = True
                object NavParamPer: THYMNavigator
                  Left = 0
                  Top = 0
                  Width = 240
                  Height = 22
                  DataSource = DMConfig.DSQMParamPer
                  Flat = True
                  ParentShowHint = False
                  PopupMenu = CEParamPerPMEdit
                  ShowHint = True
                  TabOrder = 0
                  ModoDeSeguridad = True
                  DelCaption = 'Informaci'#243'n'
                  DelMessage = ' '#191' Borra el registro ? '
                  EditaControl = DBGFParamPer
                  InsertaControl = DBGFParamPer
                  Exclusivo = True
                  ControlEdit = CEParamPer
                  OrdenAscendente = True
                  InsertaUltimo = False
                end
                object ToolButton6: TToolButton
                  Left = 240
                  Top = 0
                  Width = 8
                  Style = tbsSeparator
                end
                object CBParamPerTodos: TLFCheckBox
                  Left = 248
                  Top = 0
                  Width = 161
                  Height = 22
                  Caption = 'Mostrar todos los perfiles'
                  Checked = True
                  State = cbChecked
                  ClicksDisabled = False
                  ColorCheck = 57088
                  TabOrder = 1
                  TabStop = True
                  OnClick = CBParamPerTodosClick
                  Alignment = taLeftJustify
                end
              end
              object DBGFParamPer: TDBGridFind2000
                Left = 0
                Top = 22
                Width = 808
                Height = 348
                Align = alClient
                DataSource = DMConfig.DSQMParamPer
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                IniStorage = FSMain
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
                BuscarNums = True
                Campos.Strings = (
                  'PARAMETRO'
                  'PERFIL')
                CamposAMostrar.Strings = (
                  'PARAMETRO'
                  '0'
                  'PERFIL'
                  '0')
                CamposAMostrarAnchos.Strings = (
                  '0'
                  '0')
                CamposADevolver.Strings = (
                  ''
                  '')
                CamposDesplegar.Strings = (
                  '1'
                  '1')
                CampoAOrdenarColor = clInfoBk
                CampoAOrdenarBitmaps = DMMain.ILOrdGrid
                CamposAOrdernar.Strings = (
                  'PARAMETRO'
                  'DESCRIPCION'
                  'PERFIL')
                MensajeNoExiste = False
                Numericos.Strings = (
                  'PARAMETRO'
                  'PERFIL')
                SalirSiVacio = False
                SalirSiNoExiste = False
                Tablas.Strings = (
                  'SYS_PARAMETROS_DEFINICION'
                  'SYS_USUARIOS_PERFIL')
                Acciones.Strings = (
                  ''
                  '')
                Titulos.Strings = (
                  'DESCRIPCION'
                  'TITULO')
                Posicion = tpCentrado
                OnBusqueda = DBGFParamPerBusqueda
                OnExiste = DBGFParamPerExiste
                OnRowChange = DBGFParamPerRowChange
                Planes.Strings = (
                  ''
                  '')
                OrdenMultiple = True
                Filtros = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'PERFIL'
                    Width = 37
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TITULO_PERFIL'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clGrayText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ReadOnly = True
                    Width = 114
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PARAMETRO'
                    Width = 91
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESCRIPCION'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clGrayText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ReadOnly = True
                    Width = 315
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR'
                    Width = 154
                    Visible = True
                  end>
              end
              object PNLParamPerAyuda: TLFPanel
                Left = 0
                Top = 370
                Width = 808
                Height = 85
                Align = alBottom
                BevelOuter = bvNone
                TabOrder = 2
                object DBParamPerAyuda: TDBText
                  Left = 0
                  Top = 0
                  Width = 808
                  Height = 21
                  Align = alTop
                  Color = clBtnFace
                  DataField = 'AYUDA'
                  DataSource = DMConfig.DSQMParamPer
                  ParentColor = False
                end
                object MParamPerAyuda: TLFMemo
                  Left = 0
                  Top = 21
                  Width = 808
                  Height = 64
                  Align = alClient
                  ReadOnly = True
                  ScrollBars = ssVertical
                  TabOrder = 0
                end
              end
            end
            object TSParamUsu: TTabSheet
              Caption = 'Usuario'
              ImageIndex = 5
              object TBParamUsu: TLFToolBar
                Left = 0
                Top = 0
                Width = 808
                Height = 22
                AutoSize = True
                ButtonWidth = 25
                DisabledImages = DMMain.ILMain_In
                EdgeBorders = []
                Flat = True
                Images = DMMain.ILMain_Ac
                TabOrder = 0
                Separators = True
                object NavParamUsu: THYMNavigator
                  Left = 0
                  Top = 0
                  Width = 240
                  Height = 22
                  DataSource = DMConfig.DSQMParamUsu
                  Flat = True
                  ParentShowHint = False
                  PopupMenu = CEParamPerPMEdit
                  ShowHint = True
                  TabOrder = 0
                  ModoDeSeguridad = True
                  DelCaption = 'Informaci'#243'n'
                  DelMessage = ' '#191' Borra el registro ? '
                  EditaControl = DBGFParamUsu
                  InsertaControl = DBGFParamUsu
                  Exclusivo = True
                  ControlEdit = CEParamPer
                  OrdenAscendente = True
                  InsertaUltimo = False
                end
                object Butt1: TToolButton
                  Left = 240
                  Top = 0
                  Width = 8
                  Style = tbsSeparator
                end
                object CBParamUsuTodos: TLFCheckBox
                  Left = 248
                  Top = 0
                  Width = 161
                  Height = 22
                  Caption = 'Mostrar todos los usuarios'
                  Checked = True
                  State = cbChecked
                  ClicksDisabled = False
                  ColorCheck = 57088
                  TabOrder = 1
                  TabStop = True
                  OnClick = CBParamUsuTodosClick
                  Alignment = taLeftJustify
                end
              end
              object DBGFParamUsu: TDBGridFind2000
                Left = 0
                Top = 22
                Width = 808
                Height = 348
                Align = alClient
                DataSource = DMConfig.DSQMParamUsu
                TabOrder = 1
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -11
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = []
                IniStorage = FSMain
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
                BuscarNums = True
                Campos.Strings = (
                  'PARAMETRO'
                  'USUARIO')
                CamposAMostrar.Strings = (
                  'PARAMETRO'
                  '0'
                  'USUARIO'
                  '0')
                CamposAMostrarAnchos.Strings = (
                  '0'
                  '0')
                CamposADevolver.Strings = (
                  ''
                  '')
                CamposDesplegar.Strings = (
                  '1'
                  '1')
                CampoAOrdenarColor = clInfoBk
                CampoAOrdenarBitmaps = DMMain.ILOrdGrid
                CamposAOrdernar.Strings = (
                  'PARAMETRO'
                  'DESCRIPCION'
                  'USUARIO'
                  'TITULO_USUARIO')
                MensajeNoExiste = False
                Numericos.Strings = (
                  'PARAMETRO'
                  'USUARIO')
                SalirSiVacio = False
                SalirSiNoExiste = False
                Tablas.Strings = (
                  'SYS_PARAMETROS_DEFINICION'
                  'SYS_USUARIOS')
                Acciones.Strings = (
                  ''
                  '')
                Titulos.Strings = (
                  'DESCRIPCION'
                  'NOMBRE')
                Posicion = tpCentrado
                OnExiste = DBGFParamUsuExiste
                OnRowChange = DBGFParamUsuRowChange
                Planes.Strings = (
                  ''
                  '')
                OrdenMultiple = True
                OrdenadosPor.Strings = (
                  ''
                  'USUARIO')
                Filtros = []
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'USUARIO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TITULO_USUARIO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'PARAMETRO'
                    Width = 91
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DESCRIPCION'
                    Font.Charset = DEFAULT_CHARSET
                    Font.Color = clGrayText
                    Font.Height = -11
                    Font.Name = 'MS Sans Serif'
                    Font.Style = []
                    ReadOnly = True
                    Width = 315
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'VALOR'
                    Width = 154
                    Visible = True
                  end>
              end
              object PNLParamUsuAyuda: TLFPanel
                Left = 0
                Top = 370
                Width = 808
                Height = 85
                Align = alBottom
                BevelOuter = bvNone
                TabOrder = 2
                object DBEAyuda: TDBText
                  Left = 0
                  Top = 0
                  Width = 808
                  Height = 21
                  Align = alTop
                  Color = clBtnFace
                  DataField = 'AYUDA'
                  DataSource = DMConfig.DSQMParamUsu
                  ParentColor = False
                end
                object MParamUsuAyuda: TLFMemo
                  Left = 0
                  Top = 21
                  Width = 808
                  Height = 64
                  Align = alClient
                  ReadOnly = True
                  ScrollBars = ssVertical
                  TabOrder = 0
                end
              end
            end
          end
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 541
    Width = 828
  end
  inherited CEMain: TControlEdit
    Left = 440
    Top = 8
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 472
    Top = 8
    inherited CEMainMifirst: TMenuItem
      ShortCut = 16450
    end
    inherited CEMainMiprior: TMenuItem
      ShortCut = 16465
    end
    inherited CEMainMinext: TMenuItem
      ShortCut = 16471
    end
    inherited CEMainMilast: TMenuItem
      ShortCut = 16457
    end
    inherited CEMainMiinsert: TMenuItem
      ShortCut = 16454
    end
    inherited CEMainMidelete: TMenuItem
      ShortCut = 16460
    end
    inherited CEMainMiedit: TMenuItem
      ShortCut = 16451
    end
    inherited CEMainMipost: TMenuItem
      ShortCut = 16472
    end
    inherited CEMainMicancel: TMenuItem
      ShortCut = 16470
    end
    inherited CEMainMirefresh: TMenuItem
      ShortCut = 16499
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
    Left = 400
    Top = 8
  end
  inherited FSMain: TLFFibFormStorage
    Left = 512
    Top = 8
  end
  object CEParamDef: TControlEdit
    PopUpMenu = CEParamDefPMEdit
    Teclas = DMMain.Teclas
    Left = 728
    Top = 8
  end
  object CEParamDefPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 760
    Top = 8
    object CEParamDefMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEParamDefMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEParamDefMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEParamDefMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEParamDefMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEParamDefMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEParamDefMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEParamDefMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEParamDefMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEParamDefMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEParamGen: TControlEdit
    PopUpMenu = CEParamGenPMEdit
    Teclas = DMMain.Teclas
    Left = 728
    Top = 48
  end
  object CEParamGenPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 760
    Top = 48
    object CEParamGenMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEParamGenMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEParamGenMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEParamGenMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEParamGenMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEParamGenMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEParamGenMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEParamGenMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEParamGenMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEParamGenMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEParamEmp: TControlEdit
    PopUpMenu = CEParamEmpPMEdit
    Teclas = DMMain.Teclas
    Left = 728
    Top = 88
  end
  object CEParamEmpPMEdit: TPopUpTeclas
    Left = 760
    Top = 88
    object CEParamEmpMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEParamEmpMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEParamEmpMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEParamEmpMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEParamEmpMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEParamEmpMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEParamEmpMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEParamEmpMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEParamEmpMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEParamEmpMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEParamSer: TControlEdit
    PopUpMenu = CEParamSerPMEdit
    Teclas = DMMain.Teclas
    Left = 728
    Top = 120
  end
  object CEParamSerPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 760
    Top = 120
    object CEParamSerMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEParamSerMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEParamSerMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEParamSerMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEParamSerMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEParamSerMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEParamSerMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEParamSerMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEParamSerMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEParamSerMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEParamPer: TControlEdit
    PopUpMenu = CEParamPerPMEdit
    Teclas = DMMain.Teclas
    Left = 728
    Top = 152
  end
  object CEParamPerPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 760
    Top = 152
    object CEParamPerMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEParamPerMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEParamPerMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEParamPerMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEParamPerMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEParamPerMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEParamPerMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEParamPerMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEParamPerMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEParamPerMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
