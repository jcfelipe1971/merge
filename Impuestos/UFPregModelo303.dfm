inherited FPregModelo303: TFPregModelo303
  Left = 260
  Top = 209
  Width = 782
  Height = 481
  HelpContext = 260
  BorderStyle = bsSizeable
  Caption = 'Modelo 303'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 774
    Height = 454
    inherited TBMain: TLFToolBar
      Width = 774
      ButtonWidth = 74
      inherited TButtImprimir: TToolButton
        Left = 74
      end
      inherited TButtPrevisualizar: TToolButton
        Left = 148
      end
      inherited TButtSalir: TToolButton
        Left = 222
      end
      object TButtConfigurar: TToolButton
        Left = 296
        Top = 0
        Action = AConfigurar
      end
      object TButtModeloOficial: TToolButton
        Left = 370
        Top = 0
        Action = AmodeloOficial
      end
      object TButtInstrucciones: TToolButton
        Left = 444
        Top = 0
        Action = AInstrucciones
      end
      object TBExportar: TToolButton
        Left = 518
        Top = 0
        Hint = 'Exporta Modelo 303 en formato texto a la carpeta eat en C'
        Action = AExportarMod303
        Caption = 'Exportar'
        ImageIndex = 36
      end
    end
    object PNLDatos: TLFPanel
      Left = 0
      Top = 36
      Width = 774
      Height = 418
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object RGTipoDeclaracion: TRadioGroup
        Left = 0
        Top = 113
        Width = 774
        Height = 80
        Align = alTop
        BiDiMode = bdLeftToRight
        Caption = ' Forma de Pago '
        Columns = 2
        Ctl3D = True
        ItemIndex = 6
        Items.Strings = (
          'C - Solicitud de compensaci'#243'n'
          'D - Devolucion'
          'G - Cuenta corriente tributaria-ingreso'
          'I - Ingreso'
          'N - Sin actividad/resultado cero'
          'V - Cuenta corriente triguraria-devolucion'
          'U - Domiciliacion del ingreso en CCC')
        ParentBiDiMode = False
        ParentCtl3D = False
        TabOrder = 0
      end
      object PNLTitulo: TLFPanel
        Left = 0
        Top = 0
        Width = 774
        Height = 113
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object LblMod303: TLFLabel
          Left = 0
          Top = 0
          Width = 774
          Height = 24
          Align = alTop
          Alignment = taCenter
          Caption = 'MODELO 303. IVA TRIMESTRAL'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object LExoneradoPresentacionMod390: TLFLabel
          Left = 259
          Top = 27
          Width = 164
          Height = 13
          Alignment = taRightJustify
          Caption = 'Exonerado Presentacion Mod. 390'
        end
        object LVolumenAnual: TLFLabel
          Left = 523
          Top = 27
          Width = 131
          Height = 13
          Alignment = taRightJustify
          Caption = 'Volumen Anual distinto de 0'
        end
        object LEActividadPrincipal: TLFLabel
          Left = 6
          Top = 67
          Width = 69
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cod. Actividad'
        end
        object LEEpigrafeIAEPrincipal: TLFLabel
          Left = 16
          Top = 89
          Width = 59
          Height = 13
          Alignment = taRightJustify
          Caption = 'Epigrafe IAE'
        end
        object LActividadPrincipal: TLFLabel
          Left = 8
          Top = 48
          Width = 107
          Height = 13
          Caption = 'Actividad Principal'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LActividadOtras: TLFLabel
          Left = 200
          Top = 48
          Width = 31
          Height = 13
          Caption = 'Otras'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LFLabel1: TLFLabel
          Left = 206
          Top = 67
          Width = 69
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cod. Actividad'
        end
        object LFLabel2: TLFLabel
          Left = 216
          Top = 89
          Width = 59
          Height = 13
          Alignment = taRightJustify
          Caption = 'Epigrafe IAE'
        end
        object CBSinActividad: TLFCheckBox
          Left = 16
          Top = 25
          Width = 121
          Height = 17
          Caption = 'Sin Actividad'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 0
          TabStop = True
          Alignment = taLeftJustify
        end
        object CBEjercicio: TComboBox
          Left = 144
          Top = 24
          Width = 81
          Height = 21
          ItemHeight = 13
          TabOrder = 1
          Text = 'CBEjercicio'
          OnChange = CBEjercicioChange
        end
        object CBExoneradoPresentacionMod390: TComboBox
          Left = 428
          Top = 24
          Width = 45
          Height = 21
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 2
          Text = 'NO'
          Items.Strings = (
            'NO'
            'SI')
        end
        object CBVolumenAnual: TComboBox
          Left = 660
          Top = 24
          Width = 45
          Height = 21
          ItemHeight = 13
          ItemIndex = 1
          TabOrder = 3
          Text = 'SI'
          Items.Strings = (
            'NO'
            'SI')
        end
        object EActividadPrincipal: TLFEdit
          Left = 80
          Top = 64
          Width = 90
          Height = 21
          TabOrder = 4
        end
        object EEpigrafeIAEPrincipal: TLFEdit
          Left = 80
          Top = 86
          Width = 90
          Height = 21
          TabOrder = 5
        end
        object EActividad1: TLFEdit
          Left = 280
          Top = 64
          Width = 90
          Height = 21
          TabOrder = 6
        end
        object EEpigrafeIAE1: TLFEdit
          Left = 280
          Top = 84
          Width = 90
          Height = 21
          TabOrder = 7
        end
        object EActividad2: TLFEdit
          Left = 378
          Top = 64
          Width = 90
          Height = 21
          TabOrder = 8
        end
        object EEpigrafeIAE2: TLFEdit
          Left = 378
          Top = 84
          Width = 90
          Height = 21
          TabOrder = 9
        end
        object EActividad3: TLFEdit
          Left = 476
          Top = 64
          Width = 90
          Height = 21
          TabOrder = 10
        end
        object EEpigrafeIAE3: TLFEdit
          Left = 476
          Top = 84
          Width = 90
          Height = 21
          TabOrder = 11
        end
        object EActividad4: TLFEdit
          Left = 576
          Top = 64
          Width = 90
          Height = 21
          TabOrder = 12
        end
        object EEpigrafeIAE4: TLFEdit
          Left = 576
          Top = 84
          Width = 90
          Height = 21
          TabOrder = 13
        end
        object EActividad5: TLFEdit
          Left = 674
          Top = 64
          Width = 90
          Height = 21
          TabOrder = 14
        end
        object EEpigrafeIAE5: TLFEdit
          Left = 674
          Top = 84
          Width = 90
          Height = 21
          TabOrder = 15
        end
      end
      object PCDatosModelo: TLFPageControl
        Left = 0
        Top = 193
        Width = 774
        Height = 225
        ActivePage = TSDatosModelo
        Align = alClient
        OwnerDraw = True
        TabIndex = 0
        TabOrder = 2
        TabActiveColor = clWhite
        TabInactiveColor = 14936298
        object TSDatosModelo: TTabSheet
          Caption = 'Resultado'
          object DBGFModelo303: THYTDBGrid
            Left = 0
            Top = 0
            Width = 766
            Height = 197
            Align = alClient
            DataSource = DMRModelosHacienda.DSxModelo303
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnDblClick = APrevExecute
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
                Color = clInfoBk
                Expanded = False
                FieldName = 'DESCRIPCION'
                Width = 90
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'C21'
                Title.Alignment = taRightJustify
                Width = 90
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'C37'
                Title.Alignment = taRightJustify
                Width = 90
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'C38'
                Title.Alignment = taRightJustify
                Width = 90
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'C71'
                Title.Alignment = taRightJustify
                Width = 90
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'C110'
                Width = 90
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'C78'
                Width = 90
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'C87'
                Width = 90
                Visible = True
              end>
          end
        end
        object TSCasillas: TTabSheet
          Caption = 'Casillas'
          ImageIndex = 1
          OnShow = TSCasillasShow
          object TBCasillas: TLFToolBar
            Left = 0
            Top = 0
            Width = 766
            Height = 29
            Caption = 'Casillas'
            DisabledImages = DMMain.ILMain_In
            EdgeBorders = []
            EdgeInner = esNone
            EdgeOuter = esNone
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 0
            Separators = True
            object NavCasillas: THYMNavigator
              Left = 0
              Top = 2
              Width = 96
              Height = 22
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
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
            object TSep1: TToolButton
              Left = 96
              Top = 2
              Width = 8
              Style = tbsSeparator
            end
            object TButtRecargarCasillas: TToolButton
              Left = 104
              Top = 2
              Hint = 'Recargar datos'
              Caption = 'Recargar'
              ImageIndex = 26
              OnClick = TButtRecargarCasillasClick
            end
            object TSep2: TToolButton
              Left = 127
              Top = 2
              Width = 8
              ImageIndex = 27
              Style = tbsSeparator
            end
            object PNLPeriodo: TLFPanel
              Left = 135
              Top = 2
              Width = 250
              Height = 22
              BevelOuter = bvNone
              TabOrder = 1
              object LPeriodo: TLFLabel
                Left = 8
                Top = 3
                Width = 36
                Height = 13
                Alignment = taRightJustify
                Caption = 'Periodo'
              end
              object EFPeriodo: TLFEditFind2000
                Left = 49
                Top = 0
                Width = 40
                Height = 21
                TabOrder = 0
                OnChange = EFPeriodoChange
                Base_de_datos = DMMain.DataBase
                Transaction = DMMain.TLocal
                BuscarNums = False
                BuscarChars = True
                AutoCambiarFoco = False
                CampoNum = 'PERIODO'
                CampoStr = 'TITULO'
                CondicionBusqueda = 'TIPO IN (1, 2)'
                Posicion = tpCentrado
                ReemplazarCaracter = True
                SalirSiVacio = True
                SalirSiNoExiste = False
                Tabla_a_buscar = 'EMP_PERIODOS'
                Tabla_asociada.DesplegarBusqueda = False
                OrdenadoPor.Strings = (
                  'PERIODO')
                Filtros = [obEmpresa, obEjercicio]
                Entorno = DMMain.EntornoBusqueda
              end
              object EPeriodo: TLFEdit
                Left = 90
                Top = 0
                Width = 158
                Height = 21
                Color = clInfoBk
                Enabled = False
                TabOrder = 1
              end
            end
          end
          object PCCasillas: TLFPageControl
            Left = 0
            Top = 29
            Width = 766
            Height = 168
            ActivePage = TSCasillas_3233
            Align = alClient
            OwnerDraw = True
            TabIndex = 8
            TabOrder = 1
            TabActiveColor = clWhite
            TabInactiveColor = 14936298
            object TSCasillas_0103: TTabSheet
              Caption = '01 y 03'
              OnShow = TSCasillas_0103Show
              object DBGCasillas_0103: THYTDBGrid
                Left = 0
                Top = 0
                Width = 1216
                Height = 204
                Align = alClient
                Color = clInfoBk
                DataSource = DMRModelosHacienda.DSQMModelo303_C0103
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
                AutoDeseleccionar = True
                PermutaPaneles = False
                CampoAOrdenarColor = clInfoBk
                OrdenMultiple = True
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'REGISTRO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'RIG_VISIBLE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MONEDA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TIPO_IVA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'B_IMPONIBLE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'I_IVA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_TIPO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_SERIE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_NUMERO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NUM_FACTURA'
                    Width = 136
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOMBRE_R_SOCIAL'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CASILLA_01'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CASILLA_03'
                    Visible = True
                  end>
              end
            end
            object TSCasillas_0406: TTabSheet
              Caption = '04 y 06'
              ImageIndex = 1
              OnShow = TSCasillas_0406Show
              object DBGCasillas_0406: THYTDBGrid
                Left = 0
                Top = 0
                Width = 1216
                Height = 212
                Align = alClient
                Color = clInfoBk
                DataSource = DMRModelosHacienda.DSQMModelo303_C0406
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
                AutoDeseleccionar = True
                PermutaPaneles = False
                CampoAOrdenarColor = clInfoBk
                OrdenMultiple = True
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'REGISTRO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'RIG_VISIBLE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MONEDA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TIPO_IVA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'B_IMPONIBLE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'I_IVA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_TIPO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_SERIE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_NUMERO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NUM_FACTURA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOMBRE_R_SOCIAL'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CASILLA_04'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CASILLA_06'
                    Visible = True
                  end>
              end
            end
            object TSCasillas_0709: TTabSheet
              Caption = '07 y 09'
              ImageIndex = 2
              OnShow = TSCasillas_0709Show
              object DBGCasillas_0709: THYTDBGrid
                Left = 0
                Top = 0
                Width = 1216
                Height = 212
                Align = alClient
                Color = clInfoBk
                DataSource = DMRModelosHacienda.DSQMModelo303_C0709
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
                AutoDeseleccionar = True
                PermutaPaneles = False
                CampoAOrdenarColor = clInfoBk
                OrdenMultiple = True
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'REGISTRO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'RIG_VISIBLE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MONEDA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TIPO_IVA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'B_IMPONIBLE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'I_IVA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_TIPO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_SERIE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_NUMERO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NUM_FACTURA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOMBRE_R_SOCIAL'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CASILLA_07'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CASILLA_09'
                    Visible = True
                  end>
              end
            end
            object TSCasillas_1011: TTabSheet
              Caption = '10 y 11'
              ImageIndex = 3
              OnShow = TSCasillas_1011Show
              object DBGCasillas_1011: THYTDBGrid
                Left = 0
                Top = 0
                Width = 1216
                Height = 212
                Align = alClient
                Color = clInfoBk
                DataSource = DMRModelosHacienda.DSQMModelo303_C1011
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
                AutoDeseleccionar = True
                PermutaPaneles = False
                CampoAOrdenarColor = clInfoBk
                OrdenMultiple = True
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'REGISTRO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'RIG_VISIBLE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MONEDA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TIPO_IVA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'B_IMPONIBLE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'I_IVA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_TIPO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_SERIE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_NUMERO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NUM_FACTURA'
                    Width = 136
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOMBRE_R_SOCIAL'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CASILLA_10'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CASILLA_11'
                    Visible = True
                  end>
              end
            end
            object TSCasillas_1213: TTabSheet
              Caption = '12 y 13'
              ImageIndex = 13
              OnShow = TSCasillas_1213Show
              object DBGCasillas_1213: THYTDBGrid
                Left = 0
                Top = 0
                Width = 1216
                Height = 212
                Align = alClient
                Color = clInfoBk
                DataSource = DMRModelosHacienda.DSQMModelo303_C1213
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
                AutoDeseleccionar = True
                PermutaPaneles = False
                CampoAOrdenarColor = clInfoBk
                OrdenMultiple = True
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'REGISTRO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'RIG_VISIBLE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MONEDA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TIPO_IVA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'B_IMPONIBLE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'I_IVA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_TIPO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_SERIE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_NUMERO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NUM_FACTURA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOMBRE_R_SOCIAL'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CASILLA_12'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CASILLA_13'
                    Visible = True
                  end>
              end
            end
            object TSCasillas_1415: TTabSheet
              Caption = '14 y 15'
              ImageIndex = 4
              OnShow = TSCasillas_1415Show
              object DBGCasillas_1415: THYTDBGrid
                Left = 0
                Top = 0
                Width = 1216
                Height = 212
                Align = alClient
                Color = clInfoBk
                DataSource = DMRModelosHacienda.DSQMModelo303_C1415
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
                AutoDeseleccionar = True
                PermutaPaneles = False
                CampoAOrdenarColor = clInfoBk
                OrdenMultiple = True
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'REGISTRO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'RIG_VISIBLE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MONEDA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TIPO_IVA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'B_IMPONIBLE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'I_IVA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_TIPO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_SERIE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_NUMERO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NUM_FACTURA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOMBRE_R_SOCIAL'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CASILLA_14'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CASILLA_15'
                    Visible = True
                  end>
              end
            end
            object TSCasillas_2829: TTabSheet
              Caption = '28 y 29'
              ImageIndex = 5
              OnShow = TSCasillas_2829Show
              object DBGCasillas_2829: THYTDBGrid
                Left = 0
                Top = 0
                Width = 1216
                Height = 212
                Align = alClient
                Color = clInfoBk
                DataSource = DMRModelosHacienda.DSQMModelo303_C2829
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
                AutoDeseleccionar = True
                PermutaPaneles = False
                CampoAOrdenarColor = clInfoBk
                OrdenMultiple = True
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'REGISTRO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'RIG_VISIBLE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MONEDA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TIPO_IVA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'B_IMPONIBLE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'I_IVA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_TIPO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_SERIE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_NUMERO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NUM_FACTURA'
                    Width = 136
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOMBRE_R_SOCIAL'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CASILLA_28'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CASILLA_29'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CUENTA_GASTOS'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ARTICULO'
                    Visible = True
                  end>
              end
            end
            object TSCasillas_3031: TTabSheet
              Caption = '30 y 31'
              ImageIndex = 6
              OnShow = TSCasillas_3031Show
              object DBGCasillas_3031: THYTDBGrid
                Left = 0
                Top = 0
                Width = 1216
                Height = 212
                Align = alClient
                Color = clInfoBk
                DataSource = DMRModelosHacienda.DSQMModelo303_C3031
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
                AutoDeseleccionar = True
                PermutaPaneles = False
                CampoAOrdenarColor = clInfoBk
                OrdenMultiple = True
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'REGISTRO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'RIG_VISIBLE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MONEDA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MODO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TIPO_IVA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'B_IMPONIBLE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'I_IVA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_TIPO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_SERIE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_NUMERO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NUM_FACTURA'
                    Width = 136
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOMBRE_R_SOCIAL'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CASILLA_30'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CASILLA_31'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CUENTA_GASTOS'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ARTICULO'
                    Visible = True
                  end>
              end
            end
            object TSCasillas_3233: TTabSheet
              Caption = '32 y 33'
              ImageIndex = 7
              OnShow = TSCasillas_3233Show
              object DBGCasillas_3233: THYTDBGrid
                Left = 0
                Top = 0
                Width = 758
                Height = 204
                Align = alClient
                Color = clInfoBk
                DataSource = DMRModelosHacienda.DSQMModelo303_C3233
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
                AutoDeseleccionar = True
                PermutaPaneles = False
                CampoAOrdenarColor = clInfoBk
                OrdenMultiple = True
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'REGISTRO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'RIG_VISIBLE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MONEDA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MODO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TIPO_IVA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'B_IMPONIBLE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'I_IVA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_TIPO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_SERIE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_NUMERO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NUM_FACTURA'
                    Width = 136
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOMBRE_R_SOCIAL'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CASILLA_32'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CASILLA_33'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CUENTA_GASTOS'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ARTICULO'
                    Visible = True
                  end>
              end
            end
            object TSCasillas_3637: TTabSheet
              Caption = '36 y 37'
              ImageIndex = 8
              OnShow = TSCasillas_3637Show
              object DBGCasillas_3637: THYTDBGrid
                Left = 0
                Top = 0
                Width = 1216
                Height = 212
                Align = alClient
                Color = clInfoBk
                DataSource = DMRModelosHacienda.DSQMModelo303_C3637
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
                AutoDeseleccionar = True
                PermutaPaneles = False
                CampoAOrdenarColor = clInfoBk
                OrdenMultiple = True
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'REGISTRO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'RIG_VISIBLE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MONEDA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TIPO_IVA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'B_IMPONIBLE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'I_IVA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_TIPO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_SERIE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_NUMERO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NUM_FACTURA'
                    Width = 136
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOMBRE_R_SOCIAL'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CASILLA_36'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CASILLA_37'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CUENTA_GASTOS'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'ARTICULO'
                    Visible = True
                  end>
              end
            end
            object TSCasillas_4041: TTabSheet
              Caption = '40 y 41'
              ImageIndex = 9
              OnShow = TSCasillas_4041Show
              object DBGCasillas_4041: THYTDBGrid
                Left = 0
                Top = 0
                Width = 1216
                Height = 212
                Align = alClient
                Color = clInfoBk
                DataSource = DMRModelosHacienda.DSQMModelo303_C4041
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
                AutoDeseleccionar = True
                PermutaPaneles = False
                CampoAOrdenarColor = clInfoBk
                OrdenMultiple = True
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'REGISTRO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'RIG_VISIBLE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MONEDA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MODO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TIPO_IVA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'B_IMPONIBLE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'I_IVA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_TIPO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_SERIE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_NUMERO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NUM_FACTURA'
                    Width = 136
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOMBRE_R_SOCIAL'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CASILLA_40'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CASILLA_41'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CUENTA_GASTOS'
                    Visible = True
                  end>
              end
            end
            object TSCasillas_59: TTabSheet
              Caption = '59'
              ImageIndex = 10
              OnShow = TSCasillas_59Show
              object DBGCasillas_59: THYTDBGrid
                Left = 0
                Top = 0
                Width = 1216
                Height = 212
                Align = alClient
                Color = clInfoBk
                DataSource = DMRModelosHacienda.DSQMModelo303_C59
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
                AutoDeseleccionar = True
                PermutaPaneles = False
                CampoAOrdenarColor = clInfoBk
                OrdenMultiple = True
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'REGISTRO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'RIG_VISIBLE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MONEDA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TIPO_IVA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'B_IMPONIBLE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'I_IVA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_TIPO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_SERIE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_NUMERO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NUM_FACTURA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOMBRE_R_SOCIAL'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CASILLA_59'
                    Visible = True
                  end>
              end
            end
            object TSCasillas_60: TTabSheet
              Caption = '60'
              ImageIndex = 11
              OnShow = TSCasillas_60Show
              object DBGCasillas_60: THYTDBGrid
                Left = 0
                Top = 0
                Width = 1216
                Height = 212
                Align = alClient
                Color = clInfoBk
                DataSource = DMRModelosHacienda.DSQMModelo303_C60
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
                AutoDeseleccionar = True
                PermutaPaneles = False
                CampoAOrdenarColor = clInfoBk
                OrdenMultiple = True
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'REGISTRO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'RIG_VISIBLE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MONEDA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TIPO_IVA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'B_IMPONIBLE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'I_IVA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_TIPO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_SERIE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_NUMERO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NUM_FACTURA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOMBRE_R_SOCIAL'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CASILLA_60'
                    Visible = True
                  end>
              end
            end
            object TSCasillas_61: TTabSheet
              Caption = '61'
              ImageIndex = 12
              OnShow = TSCasillas_61Show
              object DBGCasillas_61: THYTDBGrid
                Left = 0
                Top = 0
                Width = 1216
                Height = 212
                Align = alClient
                Color = clInfoBk
                DataSource = DMRModelosHacienda.DSQMModelo303_C61
                Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
                AutoDeseleccionar = True
                PermutaPaneles = False
                CampoAOrdenarColor = clInfoBk
                OrdenMultiple = True
                Columns = <
                  item
                    Expanded = False
                    FieldName = 'REGISTRO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'RIG_VISIBLE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'MONEDA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'TIPO_IVA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'B_IMPONIBLE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'I_IVA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_TIPO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_SERIE'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'DOC_NUMERO'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NUM_FACTURA'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'NOMBRE_R_SOCIAL'
                    Visible = True
                  end
                  item
                    Expanded = False
                    FieldName = 'CASILLA_61'
                    Visible = True
                  end>
              end
            end
          end
        end
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 538
    Top = 60
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
    object AmodeloOficial: TAction
      Caption = 'Modelo Oficial'
      Hint = 'Modelo Oficial'
      ImageIndex = 136
      Visible = False
      OnExecute = AmodeloOficialExecute
    end
    object AInstrucciones: TAction
      Caption = 'Instrucciones'
      Hint = 'Instrucciones'
      ImageIndex = 1
      Visible = False
      OnExecute = AInstruccionesExecute
    end
    object AExportarMod303: TAction
      Caption = 'Exportar Modelo 303'
      Hint = 'Exportar Modelo 303'
      ImageIndex = 1
      OnExecute = AExportarMod303Execute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'CBExoneradoPresentacionMod390.ItemIndex'
      'CBVolumenAnual.ItemIndex'
      'EActividad1.Text'
      'EActividad2.Text'
      'EActividad3.Text'
      'EActividad4.Text'
      'EActividad5.Text'
      'EActividadPrincipal.Text'
      'EEpigrafeIAE1.Text'
      'EEpigrafeIAE2.Text'
      'EEpigrafeIAE3.Text'
      'EEpigrafeIAE4.Text'
      'EEpigrafeIAE5.Text'
      'EEpigrafeIAEPrincipal.Text')
    Left = 612
    Top = 0
  end
end
