inherited FMPruebas: TFMPruebas
  Left = 365
  Top = 213
  Width = 1417
  Height = 551
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'FMPruebas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1407
    Height = 498
    Caption = 'PMain'
    inherited TBMain: TLFToolBar
      Width = 1403
      Caption = 'TBMain'
      inherited NavMain: THYMNavigator
        Hints.Strings = ()
        OnClick = NavMainClick
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
      end
      object BSep1: TToolButton
        Left = 339
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object BBorrarMemo: TToolButton
        Left = 347
        Top = 0
        Hint = 'Borrar Log'
        Caption = 'Borrar Log'
        ImageIndex = 18
        OnClick = BBorrarMemoClick
      end
    end
    object PCMain: TLFPageControl
      Left = 2
      Top = 28
      Width = 1403
      Height = 193
      ActivePage = TabSheet1
      Align = alTop
      OwnerDraw = True
      TabIndex = 24
      TabOrder = 1
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSFicha: TTabSheet
        Caption = 'Ficha'
        object BReadFile: TButton
          Left = 16
          Top = 16
          Width = 201
          Height = 25
          Caption = 'Prueba ReadFile'
          TabOrder = 0
          OnClick = BReadFileClick
        end
        object BPruebaVelocidadQueryUnidireccional: TButton
          Left = 224
          Top = 16
          Width = 201
          Height = 25
          Caption = 'Prueba Velocidad Query Unidireccional'
          TabOrder = 1
          OnClick = BPruebaVelocidadQueryUnidireccionalClick
        end
        object BArticuloNuevo: TButton
          Left = 16
          Top = 40
          Width = 201
          Height = 25
          Caption = 'Prueba Articulo Nuevo'
          TabOrder = 2
          OnClick = BArticuloNuevoClick
        end
        object PruebaMensaje: TButton
          Left = 16
          Top = 64
          Width = 201
          Height = 25
          Caption = 'Prueba Mensaje'
          TabOrder = 3
          OnClick = PruebaMensajeClick
        end
        object BRegistry: TButton
          Left = 16
          Top = 88
          Width = 201
          Height = 25
          Caption = 'Leer registro'
          TabOrder = 4
          OnClick = BRegistryClick
        end
        object BVerificaIBAN: TButton
          Left = 16
          Top = 112
          Width = 201
          Height = 25
          Caption = 'Verifica IBAN'
          TabOrder = 5
          OnClick = BVerificaIBANClick
        end
        object Button3: TButton
          Left = 224
          Top = 40
          Width = 201
          Height = 25
          Caption = 'Validar'
          TabOrder = 6
          OnClick = Button3Click
        end
        object BNumeroALetra: TButton
          Left = 224
          Top = 64
          Width = 201
          Height = 25
          Caption = 'Numero a Letra'
          TabOrder = 7
          OnClick = BNumeroALetraClick
        end
        object rgRegistro: TRadioGroup
          Left = 448
          Top = 16
          Width = 185
          Height = 49
          Caption = 'Registro'
          ItemIndex = 0
          Items.Strings = (
            'HKEY_LOCAL_MACHINE'
            'HKEY_CURRENT_USER')
          TabOrder = 8
        end
        object ERutaRegistro: TEdit
          Left = 640
          Top = 20
          Width = 393
          Height = 21
          TabOrder = 9
          Text = '\SOFTWARE\AutoFirma'
        end
        object EClaveRegistro: TEdit
          Left = 640
          Top = 42
          Width = 393
          Height = 21
          TabOrder = 10
          Text = 'InstallDir'
        end
        object BGetRegistro: TButton
          Left = 1032
          Top = 20
          Width = 43
          Height = 42
          Caption = 'Leer'
          TabOrder = 11
          OnClick = BGetRegistroClick
        end
        object BScreens: TButton
          Left = 224
          Top = 88
          Width = 201
          Height = 25
          Caption = 'Screens'
          TabOrder = 12
          OnClick = BScreensClick
        end
        object BFileExists: TButton
          Left = 224
          Top = 112
          Width = 201
          Height = 25
          Caption = 'FileExists'
          TabOrder = 13
          OnClick = BFileExistsClick
        end
        object EDirFileExists: TEdit
          Left = 432
          Top = 114
          Width = 393
          Height = 21
          TabOrder = 14
          Text = 'Directorio FileExists'
        end
      end
      object TSTabla: TTabSheet
        Caption = 'Tabla'
        ImageIndex = 1
        object DBGMain: THYTDBGrid
          Left = 0
          Top = 0
          Width = 1395
          Height = 165
          Align = alClient
          DataSource = DMPruebas.DSCabecera
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
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
              FieldName = 'EMPRESA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EJERCICIO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SERIE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RIG'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TERCERO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIRECCION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLIENTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SU_REFERENCIA'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FORMA_PAGO'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AGENTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'B_DTO_LINEAS'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTO_PP'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DTO_CIAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'POR_FINANCIACION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LIQUIDO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TARIFA'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_S'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IDIOMA'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_PORTES'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'USUARIO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE'
              Width = 64
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MODIFICA_DOC'
              Visible = True
            end>
        end
      end
      object TSReturning: TTabSheet
        Caption = 'Returning'
        ImageIndex = 2
        DesignSize = (
          1395
          165)
        object Label1: TLFLabel
          Left = 24
          Top = 56
          Width = 237
          Height = 13
          Caption = 'Prueba de SQL INSERT INTO ... RETURNING ...'
        end
        object BPruebaReturning: TButton
          Left = 24
          Top = 24
          Width = 105
          Height = 25
          Caption = 'Prueba Returning'
          TabOrder = 0
          OnClick = BPruebaReturningClick
        end
        object Memo1: TLFMemo
          Left = 280
          Top = 16
          Width = 1107
          Height = 137
          Anchors = [akLeft, akTop, akRight]
          Enabled = False
          Lines.Strings = (
            'INSERT INTO SYS_ENTRADAS '
            '(USUARIO, EMPRESA, UBICACION) '
            'VALUES '
            '(:USUARIO, :EMPRESA, :UBICACION) '
            'RETURNING '
            'ENTRADA, FEC_ENTRADA')
          TabOrder = 1
        end
      end
      object TSFormato: TTabSheet
        Caption = 'Formato'
        ImageIndex = 3
        DesignSize = (
          1395
          165)
        object Imagen: TImage
          Left = 200
          Top = 56
          Width = 100
          Height = 100
          Stretch = True
        end
        object PNLEjecutarDentroAplicacion: TLFPanel
          Left = 0
          Top = 0
          Width = 185
          Height = 165
          Align = alLeft
          BevelOuter = bvNone
          TabOrder = 0
          object BEjecutarNotepad: TButton
            Left = 40
            Top = 16
            Width = 129
            Height = 25
            Caption = 'Ejecutar Notepad'
            TabOrder = 0
            OnClick = BEjecutarNotepadClick
          end
          object TButtDaysBetween: TButton
            Left = 40
            Top = 48
            Width = 129
            Height = 25
            Caption = 'Dias entre fechas'
            TabOrder = 1
            OnClick = TButtDaysBetweenClick
          end
          object Button1: TButton
            Left = 40
            Top = 80
            Width = 129
            Height = 25
            Caption = 'Prueba colores'
            TabOrder = 2
            OnClick = Button1Click
          end
          object BPasteClipboard: TButton
            Left = 40
            Top = 112
            Width = 129
            Height = 25
            Caption = 'Paste Clipboard'
            TabOrder = 3
            OnClick = BPasteClipboardClick
          end
        end
        object BPruebaFormato: TButton
          Left = 200
          Top = 16
          Width = 105
          Height = 25
          Caption = 'Prueba Formato'
          TabOrder = 1
          OnClick = BPruebaFormatoClick
        end
        object RGPrueba: TRadioGroup
          Left = 352
          Top = 16
          Width = 185
          Height = 105
          Caption = 'Prueba'
          Columns = 2
          Items.Strings = (
            'cero'
            'uno'
            'dos'
            'tres'
            'cuatro'
            'cinco')
          TabOrder = 2
          OnClick = RGPruebaClick
        end
        object BPruebaRG: TButton
          Left = 360
          Top = 128
          Width = 169
          Height = 25
          Caption = 'Prueba RadioGroup'
          TabOrder = 3
          OnClick = BPruebaRGClick
        end
        object EBase64: TEdit
          Left = 560
          Top = 24
          Width = 761
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
          Text = 
            '{"ver":1,"fecha":"2020-10-13","cuit":30000000007,"ptoVta":10,"ti' +
            'poCmp":1,"nroCmp":94,"importe":12100,"moneda":"DOL","ctz":65,"ti' +
            'poDocRec":80,"nroDocRec":20000000001,"tipoCodAut":"E","codAut":7' +
            '0417054367476}'
        end
        object BBase64: TButton
          Left = 1324
          Top = 24
          Width = 70
          Height = 20
          Anchors = [akTop, akRight]
          Caption = 'Base64'
          TabOrder = 5
          OnClick = BBase64Click
        end
        object Button4: TButton
          Left = 688
          Top = 53
          Width = 105
          Height = 25
          Caption = 'StrToFloatDec'
          TabOrder = 6
          OnClick = Button4Click
        end
        object Edit1: TEdit
          Left = 560
          Top = 56
          Width = 121
          Height = 21
          TabOrder = 7
          Text = '1,548.43'
        end
      end
      object TSVersion: TTabSheet
        Caption = 'Version'
        object BDameVersion: TButton
          Left = 16
          Top = 8
          Width = 81
          Height = 25
          Caption = 'Dame Version'
          TabOrder = 0
          OnClick = BDameVersionClick
        end
        object EDirectorioABorrar: TLFEdit
          Left = 16
          Top = 48
          Width = 561
          Height = 21
          TabOrder = 1
          Text = 'C:\Borrame\Prueba'
        end
        object BBorrarDirectorio: TButton
          Left = 583
          Top = 45
          Width = 97
          Height = 25
          Caption = 'Borrar Directorio'
          TabOrder = 2
          OnClick = BBorrarDirectorioClick
        end
      end
      object TSDescargarImagen: TTabSheet
        Caption = 'Descargar Imagen'
        OnShow = TSDescargarImagenShow
        object LProcesoDescarga: TLabel
          Left = 152
          Top = 101
          Width = 88
          Height = 13
          Caption = 'Proceso Descarga'
        end
        object LEHexToColor: TLabel
          Left = 706
          Top = 62
          Width = 50
          Height = 25
          Alignment = taCenter
          AutoSize = False
          Caption = '#32CD32'
          Color = clInfoBk
          ParentColor = False
          Layout = tlCenter
        end
        object LHex1: TLabel
          Left = 757
          Top = 62
          Width = 50
          Height = 25
          Alignment = taCenter
          AutoSize = False
          Caption = '#FF0000'
          Color = clInfoBk
          ParentColor = False
          Layout = tlCenter
        end
        object LHex2: TLabel
          Left = 808
          Top = 62
          Width = 50
          Height = 25
          Alignment = taCenter
          AutoSize = False
          Caption = '#00FF00'
          Color = clInfoBk
          ParentColor = False
          Layout = tlCenter
        end
        object LHex3: TLabel
          Left = 859
          Top = 62
          Width = 50
          Height = 25
          Alignment = taCenter
          AutoSize = False
          Caption = '#0000FF'
          Color = clInfoBk
          ParentColor = False
          Layout = tlCenter
        end
        object LHex4: TLabel
          Left = 757
          Top = 88
          Width = 50
          Height = 25
          Alignment = taCenter
          AutoSize = False
          Caption = '#FFFF00'
          Color = clInfoBk
          ParentColor = False
          Layout = tlCenter
        end
        object LHex5: TLabel
          Left = 808
          Top = 88
          Width = 50
          Height = 25
          Alignment = taCenter
          AutoSize = False
          Caption = '#FF00FF'
          Color = clInfoBk
          ParentColor = False
          Layout = tlCenter
        end
        object LHex6: TLabel
          Left = 859
          Top = 88
          Width = 50
          Height = 25
          Alignment = taCenter
          AutoSize = False
          Caption = '#00FFFF'
          Color = clInfoBk
          ParentColor = False
          Layout = tlCenter
        end
        object LHex7: TLabel
          Left = 757
          Top = 114
          Width = 50
          Height = 25
          Alignment = taCenter
          AutoSize = False
          Caption = '#101010'
          Color = clInfoBk
          ParentColor = False
          Layout = tlCenter
        end
        object LHex8: TLabel
          Left = 808
          Top = 114
          Width = 50
          Height = 25
          Alignment = taCenter
          AutoSize = False
          Caption = '#909090'
          Color = clInfoBk
          ParentColor = False
          Layout = tlCenter
        end
        object LHex9: TLabel
          Left = 859
          Top = 114
          Width = 50
          Height = 25
          Alignment = taCenter
          AutoSize = False
          Caption = '#FFFFFF'
          Color = clInfoBk
          ParentColor = False
          Layout = tlCenter
        end
        object EURLImagen: TLFEdit
          Left = 24
          Top = 39
          Width = 577
          Height = 21
          TabOrder = 0
          Text = 'http://itoools.com/19402-large_leocity/telwin-converter-500.jpg'
        end
        object BDescargarImagen: TButton
          Left = 608
          Top = 37
          Width = 97
          Height = 25
          Caption = 'Descargar Imagen'
          TabOrder = 1
          OnClick = BDescargarImagenClick
        end
        object BDescargar: TButton
          Left = 64
          Top = 96
          Width = 75
          Height = 25
          Caption = 'Descargar'
          TabOrder = 2
          OnClick = BDescargarClick
        end
        object PBDescargaFTP: TProgressBar
          Left = 152
          Top = 120
          Width = 150
          Height = 16
          Min = 0
          Max = 100
          TabOrder = 3
        end
        object BHexToColor: TButton
          Left = 608
          Top = 62
          Width = 97
          Height = 25
          Caption = 'HEX -> Color'
          TabOrder = 4
          OnClick = BHexToColorClick
        end
        object EHexToColor: TLFEdit
          Left = 24
          Top = 64
          Width = 577
          Height = 21
          TabOrder = 5
          Text = '#32CD32'
        end
      end
      object TSEmail: TTabSheet
        Caption = 'Email'
        ImageIndex = 6
        object BEnviarFacturaA1: TButton
          Left = 16
          Top = 8
          Width = 137
          Height = 25
          Caption = 'Enviar Factura Visible'
          TabOrder = 0
          OnClick = BEnviarFacturaA1Click
        end
        object EDirecciones: TEdit
          Left = 16
          Top = 48
          Width = 281
          Height = 21
          TabOrder = 1
          Text = 'a@gmail.com;b@gmail.com;c@gmail.com'
        end
        object BDividirString: TButton
          Left = 312
          Top = 48
          Width = 75
          Height = 25
          Caption = 'Dividir'
          TabOrder = 2
          OnClick = BDividirStringClick
        end
        object Button2: TButton
          Left = 312
          Top = 72
          Width = 75
          Height = 25
          Caption = 'Enviar correo'
          TabOrder = 3
          OnClick = Button2Click
        end
      end
      object TSExcel: TTabSheet
        Caption = 'Excel'
        ImageIndex = 7
        object BPruebaExportacionExcel: TButton
          Left = 32
          Top = 40
          Width = 265
          Height = 25
          Caption = 'Prueba Exportacion Excel'
          TabOrder = 0
          OnClick = BPruebaExportacionExcelClick
        end
        object BPruebaImportacionExcel: TButton
          Left = 344
          Top = 40
          Width = 273
          Height = 25
          Caption = 'Prueba Importacion Excel'
          TabOrder = 1
          OnClick = BPruebaImportacionExcelClick
        end
        object BPruebaExportacionCSVSQL: TButton
          Left = 32
          Top = 72
          Width = 265
          Height = 25
          Caption = 'Prueba Exportacion SQL CSV'
          TabOrder = 2
          OnClick = BPruebaExportacionCSVSQLClick
        end
        object BPruebaExportacionCSVDataSource: TButton
          Left = 32
          Top = 104
          Width = 265
          Height = 25
          Caption = 'Prueba Exportacion DataSource CSV'
          TabOrder = 3
          OnClick = BPruebaExportacionCSVDataSourceClick
        end
        object BFormularioImportacion: TButton
          Left = 344
          Top = 72
          Width = 273
          Height = 25
          Caption = 'Formulario Importacion'
          TabOrder = 4
          OnClick = BFormularioImportacionClick
        end
      end
      object TSProduccion: TTabSheet
        Caption = 'Produccion'
        object LCerrarAbrirOrdenesLONPER: TLFLabel
          Left = 16
          Top = 56
          Width = 153
          Height = 13
          Caption = 'Cerrar y abrir ordenes (LONPER)'
        end
        object LDesdeIdOrden: TLFLabel
          Left = 20
          Top = 84
          Width = 72
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde IdOrden'
        end
        object LHastaIdOrden: TLFLabel
          Left = 23
          Top = 104
          Width = 69
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta IdOrden'
        end
        object BVerTablasAbiertas: TButton
          Left = 40
          Top = 4
          Width = 209
          Height = 25
          Caption = 'Ver Tablas abiertas en produccion'
          TabOrder = 0
          OnClick = BVerTablasAbiertasClick
        end
        object EDesdeIdOrden: TLFEdit
          Left = 96
          Top = 80
          Width = 121
          Height = 21
          TabOrder = 1
        end
        object EHastaIdOrden: TLFEdit
          Left = 96
          Top = 102
          Width = 121
          Height = 21
          TabOrder = 2
        end
        object BEmpezarAbrirCerrarOrdenes: TButton
          Left = 224
          Top = 76
          Width = 97
          Height = 53
          Caption = 'Empezar'
          TabOrder = 3
          OnClick = BEmpezarAbrirCerrarOrdenesClick
        end
        object BtNRecalcularCodLote: TButton
          Left = 384
          Top = 80
          Width = 113
          Height = 49
          Hint = 'Recalcula codigo art_articulos_lotes'
          Caption = 'Recalc Cod Art Lotes'
          TabOrder = 4
          OnClick = BtNRecalcularCodLoteClick
        end
      end
      object TSSII: TTabSheet
        Caption = 'SII'
        object BUtilizarMSXML2: TButton
          Left = 48
          Top = 8
          Width = 169
          Height = 25
          Caption = 'Utilizar MSXML2'
          TabOrder = 0
          OnClick = BUtilizarMSXML2Click
        end
        object BPruebaSIIFacturasEmitidas: TButton
          Left = 48
          Top = 40
          Width = 169
          Height = 25
          Caption = 'Prueba SII Facturas Emitidas'
          TabOrder = 1
          OnClick = BPruebaSIIFacturasEmitidasClick
        end
        object ECertName: TLFEdit
          Left = 48
          Top = 72
          Width = 657
          Height = 21
          TabOrder = 2
          Text = 'LOCAL_MACHINE\My\LOCAL_MACHINE\My\CLOUD'
        end
        object EArchivoXML: TLFEdit
          Left = 48
          Top = 96
          Width = 657
          Height = 21
          TabOrder = 3
        end
      end
      object TSStringGrid: TTabSheet
        Caption = 'String Grid'
        ImageIndex = 11
        OnShow = TSStringGridShow
        object sgPrueba: TStringGrid
          Left = 0
          Top = 33
          Width = 1395
          Height = 132
          Align = alClient
          TabOrder = 0
          OnSelectCell = sgPruebaSelectCell
          ColWidths = (
            64
            64
            64
            108
            64)
        end
        object dtpPrueba: TDateTimePicker
          Left = 600
          Top = 0
          Width = 186
          Height = 21
          CalAlignment = dtaLeft
          Date = 43248.4519797801
          Time = 43248.4519797801
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 1
          Visible = False
          OnChange = dtpPruebaChange
        end
        object PNLStringGrid: TPanel
          Left = 0
          Top = 0
          Width = 1395
          Height = 33
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 2
          object EFicheroExcelStringgrid: TEdit
            Left = 7
            Top = 2
            Width = 538
            Height = 21
            TabOrder = 0
          end
          object BLeerExcelStringGrid: TButton
            Left = 584
            Top = 0
            Width = 75
            Height = 25
            Caption = 'BLeerExcelStringGrid'
            TabOrder = 1
            OnClick = BLeerExcelStringGridClick
          end
          object BSeleccionFicheroExcelStringgrid: TButton
            Left = 544
            Top = 0
            Width = 25
            Height = 25
            Caption = '...'
            TabOrder = 2
            OnClick = BSeleccionFicheroExcelStringgridClick
          end
        end
      end
      object TSFacturaElectronicaBO: TTabSheet
        Caption = 'Factura Elect. BO'
        ImageIndex = 12
        object QRCode: TImage
          Left = 658
          Top = 24
          Width = 105
          Height = 105
          AutoSize = True
        end
        object LNumeroFactura: TLabel
          Left = 28
          Top = 24
          Width = 76
          Height = 13
          Alignment = taRightJustify
          Caption = 'Numero Factura'
        end
        object LFechaTransaccion: TLabel
          Left = 12
          Top = 68
          Width = 92
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fecha Transaccion'
        end
        object LLlaveDosificacion: TLabel
          Left = 17
          Top = 112
          Width = 87
          Height = 13
          Alignment = taRightJustify
          Caption = 'Llave Dosificacion'
        end
        object LMontoTransaccion: TLabel
          Left = 12
          Top = 90
          Width = 92
          Height = 13
          Alignment = taRightJustify
          Caption = 'Monto Transaccion'
        end
        object LNIT: TLabel
          Left = 86
          Top = 46
          Width = 18
          Height = 13
          Alignment = taRightJustify
          Caption = 'NIT'
        end
        object LNumeroAutorizacion: TLabel
          Left = 6
          Top = 2
          Width = 98
          Height = 13
          Alignment = taRightJustify
          Caption = 'Numero Autorizacion'
        end
        object LCodigoEsperado: TLabel
          Left = 17
          Top = 134
          Width = 87
          Height = 13
          Alignment = taRightJustify
          Caption = 'Llave Dosificacion'
        end
        object LLector: TLabel
          Left = 665
          Top = 3
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = 'Lector'
        end
        object ELlaveDosificacion: TEdit
          Left = 112
          Top = 110
          Width = 300
          Height = 21
          TabOrder = 5
          Text = '9rCB7Sv4X29d)5k7N%3ab89p-3(5[A'
        end
        object EMontoTransaccion: TEdit
          Left = 112
          Top = 88
          Width = 300
          Height = 21
          TabOrder = 4
          Text = '2500'
        end
        object ENIT: TEdit
          Left = 112
          Top = 44
          Width = 300
          Height = 21
          TabOrder = 2
          Text = '4189179011'
        end
        object ENumeroAutorizacion: TEdit
          Left = 112
          Top = 0
          Width = 300
          Height = 21
          TabOrder = 0
          Text = '29040011007'
        end
        object ENumeroFactura: TEdit
          Left = 112
          Top = 22
          Width = 300
          Height = 21
          TabOrder = 1
          Text = '1503'
        end
        object BCalcularCodigoControlSFV: TButton
          Left = 416
          Top = 37
          Width = 75
          Height = 60
          Caption = '&Calcular SFV'
          TabOrder = 7
          OnClick = BCalcularCodigoControlSFVClick
        end
        object DTPFechaTransaccion: TDateTimePicker
          Left = 112
          Top = 66
          Width = 300
          Height = 21
          CalAlignment = dtaLeft
          Date = 39265
          Time = 39265
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 3
        end
        object BEjemplo1: TButton
          Left = 496
          Top = 0
          Width = 155
          Height = 25
          Caption = 'Ejemplo 1 - 6A-DC-53-05-14'
          TabOrder = 8
          OnClick = BEjemplo1Click
        end
        object BEjemplo2: TButton
          Left = 496
          Top = 24
          Width = 155
          Height = 25
          Caption = 'Ejemplo 2 - 7B-F3-48-A8'
          TabOrder = 9
          OnClick = BEjemplo2Click
        end
        object BEjemplo3: TButton
          Left = 496
          Top = 48
          Width = 155
          Height = 25
          Caption = 'Ejemplo 3 - FB-A6-E4-78'
          TabOrder = 10
          OnClick = BEjemplo3Click
        end
        object BEjemplo4: TButton
          Left = 496
          Top = 72
          Width = 155
          Height = 25
          Caption = 'Ejemplo 4 - 71-D5-61-C8'
          TabOrder = 11
          OnClick = BEjemplo4Click
        end
        object BEjemplo5: TButton
          Left = 496
          Top = 96
          Width = 155
          Height = 25
          Caption = 'Ejemplo 5 - 62-12-AF-1B'
          TabOrder = 12
          OnClick = BEjemplo5Click
        end
        object BEjemplo6: TButton
          Left = 496
          Top = 120
          Width = 155
          Height = 25
          Caption = 'Ejemplo 6 - 6A-50-31-01-32'
          TabOrder = 13
          OnClick = BEjemplo6Click
        end
        object BEjemplo7: TButton
          Left = 496
          Top = 144
          Width = 155
          Height = 25
          Caption = 'Ejemplo 7 - A8-6B-FD-82-16'
          TabOrder = 14
          OnClick = BEjemplo7Click
        end
        object ECodigoEsperado: TEdit
          Left = 112
          Top = 132
          Width = 300
          Height = 21
          TabOrder = 6
          Text = '6A-DC-53-05-14'
        end
        object ELectura: TEdit
          Left = 698
          Top = 0
          Width = 65
          Height = 21
          TabOrder = 15
          OnKeyPress = ELecturaKeyPress
        end
      end
      object TSWeb: TTabSheet
        Caption = 'TSWeb'
        ImageIndex = 13
        object LCliente: TLFLabel
          Left = 35
          Top = 35
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cliente'
        end
        object LMaquina: TLFLabel
          Left = 26
          Top = 57
          Width = 41
          Height = 13
          Alignment = taRightJustify
          Caption = 'Maquina'
        end
        object LDesdeFecha: TLFLabel
          Left = 3
          Top = 80
          Width = 64
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde Fecha'
        end
        object LHastaFecha: TLFLabel
          Left = 6
          Top = 101
          Width = 61
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta Fecha'
        end
        object LURLCSV: TLFLabel
          Left = 18
          Top = 14
          Width = 49
          Height = 13
          Alignment = taRightJustify
          Caption = 'URL Base'
        end
        object BLeerCSV: TButton
          Left = 200
          Top = 37
          Width = 97
          Height = 68
          Caption = 'Descargar CSV'
          TabOrder = 0
          OnClick = BLeerCSVClick
        end
        object EURLCSV: TLFEdit
          Left = 72
          Top = 10
          Width = 713
          Height = 21
          TabOrder = 1
          Text = 
            'http://cloudtime-eu.com/webServiceLogicart/GetSalesMachineCsv.ph' +
            'p'
        end
        object ECliente: TLFEdit
          Left = 72
          Top = 32
          Width = 121
          Height = 21
          TabOrder = 2
          Text = '001'
        end
        object EMaquina: TLFEdit
          Left = 72
          Top = 54
          Width = 121
          Height = 21
          TabOrder = 3
          Text = '2003'
        end
        object DEDesdeFecha: TLFDateEdit
          Left = 72
          Top = 76
          Width = 121
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 4
        end
        object DEHastaFecha: TLFDateEdit
          Left = 72
          Top = 98
          Width = 121
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 5
        end
      end
      object TSNotas: TTabSheet
        Caption = 'TSNotas'
        ImageIndex = 14
        OnShow = TSNotasShow
        object NavPruebaNotas: THYMNavigator
          Left = 24
          Top = 8
          Width = 240
          Height = 25
          DataSource = DMPruebas.DSxArticulos
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
        object DBEArticulo: TLFDbedit
          Left = 32
          Top = 40
          Width = 121
          Height = 21
          DataField = 'TITULO'
          DataSource = DMPruebas.DSxArticulos
          TabOrder = 1
        end
        object DBMArticuloNotas: TLFDBMemo
          Left = 32
          Top = 64
          Width = 185
          Height = 89
          DataField = 'NOTAS'
          DataSource = DMPruebas.DSxArticulos
          TabOrder = 2
        end
      end
      object TSOrden: TTabSheet
        Caption = 'TSOrden'
        ImageIndex = 14
        OnShow = TSOrdenShow
        object NavOrden: THYMNavigator
          Left = 24
          Top = 8
          Width = 240
          Height = 25
          DataSource = DMPruebas.DSxArticulos
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
        object FIBHYGGridFind1: TFIBHYGGridFind
          Left = 8
          Top = 40
          Width = 320
          Height = 120
          DataSource = DMPruebas.DSxOrden
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
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_ORDEN'
              Visible = True
            end>
        end
      end
      object TSSubirArchivo: TTabSheet
        Caption = 'Subir Archivo'
        ImageIndex = 15
        object BSubirArchivo: TButton
          Left = 608
          Top = 37
          Width = 97
          Height = 25
          Caption = 'Subir archivo'
          TabOrder = 0
          OnClick = BSubirArchivoClick
        end
        object EURLEvnioFichero: TLFEdit
          Left = 24
          Top = 40
          Width = 577
          Height = 21
          TabOrder = 1
          Text = 'http://delfos-online.com/test/file.php'
        end
        object EFicheroSubir: TLFEdit
          Left = 24
          Top = 64
          Width = 577
          Height = 21
          TabOrder = 2
          Text = 'C:\Users\Usuari\Documents\Factura_A_190561-Firmado.xsig'
        end
      end
      object TSPrestasop: TTabSheet
        Caption = 'Prestasop'
        ImageIndex = 16
        OnShow = TSPrestasopShow
        object LPSToken: TLFLabel
          Left = 36
          Top = 35
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Token'
        end
        object LPSResource: TLFLabel
          Left = 21
          Top = 57
          Width = 46
          Height = 13
          Alignment = taRightJustify
          Caption = 'Resource'
        end
        object LFLabel3: TLFLabel
          Left = 3
          Top = 104
          Width = 64
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde Fecha'
        end
        object LFLabel4: TLFLabel
          Left = 6
          Top = 125
          Width = 61
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta Fecha'
        end
        object LPSURLBase: TLFLabel
          Left = 18
          Top = 14
          Width = 49
          Height = 13
          Alignment = taRightJustify
          Caption = 'URL Base'
        end
        object LLlamadaWebService: TLFLabel
          Left = 27
          Top = 78
          Width = 40
          Height = 13
          Alignment = taRightJustify
          Caption = 'Llamada'
        end
        object LPSId: TLFLabel
          Left = 417
          Top = 57
          Width = 9
          Height = 13
          Alignment = taRightJustify
          Caption = 'Id'
        end
        object LPSOpciones: TLFLabel
          Left = 378
          Top = 14
          Width = 49
          Height = 13
          Alignment = taRightJustify
          Caption = 'URL Base'
        end
        object LPSOpcionesInfo: TLabel
          Left = 432
          Top = 32
          Width = 353
          Height = 25
          AutoSize = False
          Caption = 
            '&&display=[id,lastname,firstname]&&filtr[id]=[1,5]&&sort=[id_DES' +
            'C]&&limit=[9,5]'
        end
        object EPSURLBase: TLFEdit
          Left = 72
          Top = 10
          Width = 297
          Height = 21
          TabOrder = 0
          Text = 'http://prestashop.agricaldes.com'
          OnChange = EPSURLBaseChange
        end
        object EPSToken: TLFEdit
          Left = 72
          Top = 32
          Width = 297
          Height = 21
          TabOrder = 1
          Text = 'ZDD664AK54C7YI1E61ZKCYMBPIDTNDS5'
          OnChange = EPSURLBaseChange
        end
        object EPSResource: TComboBox
          Left = 72
          Top = 54
          Width = 297
          Height = 21
          ItemHeight = 0
          TabOrder = 2
          OnChange = EPSURLBaseChange
        end
        object LFDateEdit1: TLFDateEdit
          Left = 72
          Top = 100
          Width = 121
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 3
        end
        object LFDateEdit2: TLFDateEdit
          Left = 72
          Top = 122
          Width = 121
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 4
        end
        object ELlamadaWebService: TEdit
          Left = 72
          Top = 76
          Width = 713
          Height = 21
          Color = clInfoBk
          TabOrder = 5
        end
        object BPSSynopsis: TButton
          Left = 275
          Top = 100
          Width = 70
          Height = 29
          Caption = 'Synopsis'
          TabOrder = 6
          OnClick = BPSSynopsisClick
        end
        object BPS_Blank: TButton
          Left = 275
          Top = 132
          Width = 70
          Height = 29
          Caption = 'Blank'
          TabOrder = 7
          OnClick = BPS_BlankClick
        end
        object BPSCrear: TButton
          Left = 371
          Top = 100
          Width = 70
          Height = 29
          Caption = 'Crear'
          TabOrder = 8
          OnClick = BPSCrearClick
        end
        object Elastname: TEdit
          Left = 518
          Top = 98
          Width = 264
          Height = 21
          TabOrder = 9
          Text = 'Isola'
        end
        object Efirstname: TEdit
          Left = 518
          Top = 120
          Width = 264
          Height = 21
          TabOrder = 10
          Text = 'Duilio Juan'
        end
        object eemail: TEdit
          Left = 518
          Top = 142
          Width = 264
          Height = 21
          TabOrder = 11
          Text = 'duilioisola@delfos.net'
        end
        object EPSId: TLFEdit
          Left = 432
          Top = 54
          Width = 353
          Height = 21
          TabOrder = 12
          Text = '0'
          OnChange = EPSURLBaseChange
        end
        object BModificar: TButton
          Left = 371
          Top = 132
          Width = 70
          Height = 29
          Caption = 'Modificar'
          TabOrder = 13
          OnClick = BModificarClick
        end
        object BBorrar: TButton
          Left = 443
          Top = 100
          Width = 70
          Height = 29
          Caption = 'Borrar'
          TabOrder = 14
          OnClick = BBorrarClick
        end
        object BLista: TButton
          Left = 443
          Top = 132
          Width = 70
          Height = 29
          Caption = 'Lista'
          TabOrder = 15
          OnClick = BListaClick
        end
        object EPSOpciones: TLFEdit
          Left = 432
          Top = 10
          Width = 353
          Height = 21
          TabOrder = 16
          OnChange = EPSURLBaseChange
        end
        object BWSInicializar: TButton
          Left = 194
          Top = 100
          Width = 75
          Height = 25
          Caption = 'Inicializar'
          TabOrder = 17
          OnClick = BWSInicializarClick
        end
      end
      object TSSafemoney: TTabSheet
        Caption = 'Safemoney'
        ImageIndex = 17
        DesignSize = (
          1395
          165)
        object LFLabel1: TLFLabel
          Left = 36
          Top = 5
          Width = 31
          Height = 13
          Alignment = taRightJustify
          Caption = 'Cobrar'
        end
        object EImporteACobrar: TLFEdit
          Left = 72
          Top = 1
          Width = 65
          Height = 21
          TabOrder = 0
          Text = '0,10'
          OnChange = EPSURLBaseChange
        end
        object BCobrar: TButton
          Left = 152
          Top = -1
          Width = 75
          Height = 25
          Caption = 'Cobrar'
          TabOrder = 1
          OnClick = BCobrarClick
        end
        object BInicializar: TButton
          Left = 328
          Top = -1
          Width = 75
          Height = 25
          Caption = 'Inicializar'
          TabOrder = 2
          OnClick = BInicializarClick
        end
        object BCancelarCobro: TButton
          Left = 240
          Top = -1
          Width = 75
          Height = 25
          Caption = 'Cancelar'
          TabOrder = 3
          OnClick = BCancelarCobroClick
        end
        object mSafemoney: TMemo
          Left = 72
          Top = 25
          Width = 1304
          Height = 140
          Anchors = [akLeft, akTop, akRight, akBottom]
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          Lines.Strings = (
            'Hora                   :'
            'Importe a Cobrar       :'
            'Importe Cobrado Parcial:'
            'Importe Cobrado        :'
            'Cambio Entregado       :'
            'Cambio No Entregado    :'
            'Error De Cobro         :')
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 4
        end
        object BTimerCobro: TButton
          Left = 696
          Top = -1
          Width = 75
          Height = 25
          Caption = 'Refresco ON'
          TabOrder = 5
          OnClick = BTimerCobroClick
        end
      end
      object TSNet2Phone: TTabSheet
        Caption = 'Net2Phone'
        ImageIndex = 18
        DesignSize = (
          1395
          165)
        object LNet2PhoneToken: TLabel
          Left = 9
          Top = 1
          Width = 31
          Height = 13
          Caption = 'Token'
        end
        object LNet2PhoneExtension: TLabel
          Left = 8
          Top = 40
          Width = 46
          Height = 13
          Caption = 'Extension'
        end
        object LNet2PhoneTelefono: TLabel
          Left = 8
          Top = 80
          Width = 42
          Height = 13
          Caption = 'Telefono'
        end
        object BClick2Call: TButton
          Left = 134
          Top = 95
          Width = 75
          Height = 25
          Caption = 'Click 2 Call'
          TabOrder = 3
          OnClick = BClick2CallClick
        end
        object EToken: TEdit
          Left = 8
          Top = 16
          Width = 1376
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          Text = 
            'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyIjoiY2xpY2syY2FsbCI' +
            'sImNvbnRleHQiOiIwOTQzIiwiZXhwIjo4ODAyNTYxMjM5OSwicHdkIjoiNUg0Tjk' +
            '2bmt1dlFMYUFUIn0.SzR9Mnkf3n4MXTftn5TePuKAomCZpI684mAKNCp8GsI'
        end
        object ETelefono: TEdit
          Left = 8
          Top = 96
          Width = 121
          Height = 21
          TabOrder = 2
          Text = '664473102'
        end
        object EExtension: TEdit
          Left = 8
          Top = 56
          Width = 121
          Height = 21
          TabOrder = 1
          Text = '201'
        end
      end
      object TSJSON: TTabSheet
        Caption = 'JSON'
        ImageIndex = 19
        object LNodoJSONPadre: TLFLabel
          Left = 584
          Top = 0
          Width = 57
          Height = 13
          Caption = 'Nodo Padre'
        end
        object LNodoJSONHijo: TLFLabel
          Left = 584
          Top = 88
          Width = 47
          Height = 13
          Caption = 'Nodo Hijo'
        end
        object MJSON: TLFMemo
          Left = 0
          Top = 0
          Width = 577
          Height = 165
          Align = alLeft
          Lines.Strings = (
            '{'
            '  "environment": {'
            '    "home_url": "https://woocommerce.delfos.net",'
            '    "site_url": "https://woocommerce.delfos.net",'
            '    "version": "5.6.0",'
            
              '    "log_directory": "/var/www/vhosts/woocommerce.delfos.net/htt' +
              'pdocs/wp-content/uploads/wc-logs/",'
            '    "log_directory_writable": true,'
            '    "wp_version": "5.8.1",'
            '    "wp_multisite": false,'
            '    "wp_memory_limit": 134217728,'
            '    "wp_debug_mode": false,'
            '    "wp_cron": true,'
            '    "language": "es_ES",'
            '    "external_object_cache": null,'
            '    "server_info": "Apache",'
            '    "php_version": "7.4.23",'
            '    "php_post_max_size": 8388608,'
            '    "php_max_execution_time": 30,'
            '    "php_max_input_vars": 1000,'
            '    "curl_version": "7.52.1, OpenSSL/1.0.2u",'
            '    "suhosin_installed": false,'
            '    "max_upload_size": 2097152,'
            '    "mysql_version": "5.5.5",'
            '    "mysql_version_string": "5.5.5-10.1.48-MariaDB-0+deb9u2",'
            '    "default_timezone": "UTC",'
            '    "fsockopen_or_curl_enabled": true,'
            '    "soapclient_enabled": true,'
            '    "domdocument_enabled": true,'
            '    "gzip_enabled": true,'
            '    "mbstring_enabled": true,'
            '    "remote_post_successful": true,'
            '    "remote_post_response": "200",'
            '    "remote_get_successful": true,'
            '    "remote_get_response": "200"'
            '  },'
            '  "database": {'
            '    "wc_database_version": "5.6.0",'
            '    "database_prefix": "T21PCqlcG_",'
            '    "maxmind_geoip_database": "",'
            '    "database_tables": {'
            '      "woocommerce": {'
            '        "T21PCqlcG_woocommerce_sessions": {'
            '          "data": "0.02",'
            '          "index": "0.02",'
            '          "engine": "InnoDB"'
            '        },'
            '        "T21PCqlcG_woocommerce_api_keys": {'
            '          "data": "0.02",'
            '          "index": "0.03",'
            '          "engine": "InnoDB"'
            '        },'
            '        "T21PCqlcG_woocommerce_attribute_taxonomies": {'
            '          "data": "0.02",'
            '          "index": "0.02",'
            '          "engine": "InnoDB"'
            '        },'
            
              '        "T21PCqlcG_woocommerce_downloadable_product_permissions"' +
              ': {'
            '          "data": "0.02",'
            '          "index": "0.06",'
            '          "engine": "InnoDB"'
            '        },'
            '        "T21PCqlcG_woocommerce_order_items": {'
            '          "data": "0.02",'
            '          "index": "0.02",'
            '          "engine": "InnoDB"'
            '        },'
            '        "T21PCqlcG_woocommerce_order_itemmeta": {'
            '          "data": "0.02",'
            '          "index": "0.03",'
            '          "engine": "InnoDB"'
            '        },'
            '        "T21PCqlcG_woocommerce_tax_rates": {'
            '          "data": "0.02",'
            '          "index": "0.06",'
            '          "engine": "InnoDB"'
            '        },'
            '        "T21PCqlcG_woocommerce_tax_rate_locations": {'
            '          "data": "0.02",'
            '          "index": "0.03",'
            '          "engine": "InnoDB"'
            '        },'
            '        "T21PCqlcG_woocommerce_shipping_zones": {'
            '          "data": "0.02",'
            '          "index": "0.00",'
            '          "engine": "InnoDB"'
            '        },'
            '        "T21PCqlcG_woocommerce_shipping_zone_locations": {'
            '          "data": "0.02",'
            '          "index": "0.03",'
            '          "engine": "InnoDB"'
            '        },'
            '        "T21PCqlcG_woocommerce_shipping_zone_methods": {'
            '          "data": "0.02",'
            '          "index": "0.00",'
            '          "engine": "InnoDB"'
            '        },'
            '        "T21PCqlcG_woocommerce_payment_tokens": {'
            '          "data": "0.02",'
            '          "index": "0.02",'
            '          "engine": "InnoDB"'
            '        },'
            '        "T21PCqlcG_woocommerce_payment_tokenmeta": {'
            '          "data": "0.02",'
            '          "index": "0.03",'
            '          "engine": "InnoDB"'
            '        },'
            '        "T21PCqlcG_woocommerce_log": {'
            '          "data": "0.02",'
            '          "index": "0.02",'
            '          "engine": "InnoDB"'
            '        }'
            '      },'
            '      "other": {'
            '        "T21PCqlcG_actionscheduler_actions": {'
            '          "data": "0.02",'
            '          "index": "0.13",'
            '          "engine": "InnoDB"'
            '        },'
            '        "T21PCqlcG_actionscheduler_claims": {'
            '          "data": "0.02",'
            '          "index": "0.02",'
            '          "engine": "InnoDB"'
            '        },'
            '        "T21PCqlcG_actionscheduler_groups": {'
            '          "data": "0.02",'
            '          "index": "0.02",'
            '          "engine": "InnoDB"'
            '        },'
            '        "T21PCqlcG_actionscheduler_logs": {'
            '          "data": "0.02",'
            '          "index": "0.03",'
            '          "engine": "InnoDB"'
            '        },'
            '        "T21PCqlcG_commentmeta": {'
            '          "data": "0.02",'
            '          "index": "0.03",'
            '          "engine": "InnoDB"'
            '        },'
            '        "T21PCqlcG_comments": {'
            '          "data": "0.02",'
            '          "index": "0.09",'
            '          "engine": "InnoDB"'
            '        },'
            '        "T21PCqlcG_links": {'
            '          "data": "0.02",'
            '          "index": "0.02",'
            '          "engine": "InnoDB"'
            '        },'
            '        "T21PCqlcG_options": {'
            '          "data": "1.05",'
            '          "index": "0.06",'
            '          "engine": "InnoDB"'
            '        },'
            '        "T21PCqlcG_postmeta": {'
            '          "data": "0.02",'
            '          "index": "0.03",'
            '          "engine": "InnoDB"'
            '        },'
            '        "T21PCqlcG_posts": {'
            '          "data": "0.02",'
            '          "index": "0.06",'
            '          "engine": "InnoDB"'
            '        },'
            '        "T21PCqlcG_termmeta": {'
            '          "data": "0.02",'
            '          "index": "0.03",'
            '          "engine": "InnoDB"'
            '        },'
            '        "T21PCqlcG_terms": {'
            '          "data": "0.02",'
            '          "index": "0.03",'
            '          "engine": "InnoDB"'
            '        },'
            '        "T21PCqlcG_term_relationships": {'
            '          "data": "0.02",'
            '          "index": "0.02",'
            '          "engine": "InnoDB"'
            '        },'
            '        "T21PCqlcG_term_taxonomy": {'
            '          "data": "0.02",'
            '          "index": "0.03",'
            '          "engine": "InnoDB"'
            '        },'
            '        "T21PCqlcG_usermeta": {'
            '          "data": "0.02",'
            '          "index": "0.03",'
            '          "engine": "InnoDB"'
            '        },'
            '        "T21PCqlcG_users": {'
            '          "data": "0.02",'
            '          "index": "0.05",'
            '          "engine": "InnoDB"'
            '        },'
            '        "T21PCqlcG_wc_admin_notes": {'
            '          "data": "0.05",'
            '          "index": "0.00",'
            '          "engine": "InnoDB"'
            '        },'
            '        "T21PCqlcG_wc_admin_note_actions": {'
            '          "data": "0.02",'
            '          "index": "0.02",'
            '          "engine": "InnoDB"'
            '        },'
            '        "T21PCqlcG_wc_category_lookup": {'
            '          "data": "0.02",'
            '          "index": "0.00",'
            '          "engine": "InnoDB"'
            '        },'
            '        "T21PCqlcG_wc_customer_lookup": {'
            '          "data": "0.02",'
            '          "index": "0.03",'
            '          "engine": "InnoDB"'
            '        },'
            '        "T21PCqlcG_wc_download_log": {'
            '          "data": "0.02",'
            '          "index": "0.03",'
            '          "engine": "InnoDB"'
            '        },'
            '        "T21PCqlcG_wc_order_coupon_lookup": {'
            '          "data": "0.02",'
            '          "index": "0.03",'
            '          "engine": "InnoDB"'
            '        },'
            '        "T21PCqlcG_wc_order_product_lookup": {'
            '          "data": "0.02",'
            '          "index": "0.06",'
            '          "engine": "InnoDB"'
            '        },'
            '        "T21PCqlcG_wc_order_stats": {'
            '          "data": "0.02",'
            '          "index": "0.05",'
            '          "engine": "InnoDB"'
            '        },'
            '        "T21PCqlcG_wc_order_tax_lookup": {'
            '          "data": "0.02",'
            '          "index": "0.03",'
            '          "engine": "InnoDB"'
            '        },'
            '        "T21PCqlcG_wc_product_meta_lookup": {'
            '          "data": "0.02",'
            '          "index": "0.09",'
            '          "engine": "InnoDB"'
            '        },'
            '        "T21PCqlcG_wc_reserved_stock": {'
            '          "data": "0.02",'
            '          "index": "0.00",'
            '          "engine": "InnoDB"'
            '        },'
            '        "T21PCqlcG_wc_tax_rate_classes": {'
            '          "data": "0.02",'
            '          "index": "0.02",'
            '          "engine": "InnoDB"'
            '        },'
            '        "T21PCqlcG_wc_webhooks": {'
            '          "data": "0.02",'
            '          "index": "0.02",'
            '          "engine": "InnoDB"'
            '        }'
            '      }'
            '    },'
            '    "database_size": {'
            '      "data": 1.9200000000000006,'
            '      "index": 1.4300000000000006'
            '    }'
            '  },'
            '  "active_plugins": ['
            '    {'
            '      "plugin": "woocommerce/woocommerce.php",'
            '      "name": "WooCommerce",'
            '      "version": "5.6.0",'
            '      "version_latest": "5.6.0",'
            '      "url": "https://woocommerce.com/",'
            '      "author_name": "Automattic",'
            '      "author_url": "https://woocommerce.com",'
            '      "network_activated": false'
            '    }'
            '  ],'
            '  "inactive_plugins": ['
            '    {'
            '      "plugin": "akismet/akismet.php",'
            '      "name": "Akismet Anti-Spam",'
            '      "version": "4.1.12",'
            '      "version_latest": "4.1.12",'
            '      "url": "https://akismet.com/",'
            '      "author_name": "Automattic",'
            '      "author_url": "https://automattic.com/wordpress-plugins/",'
            '      "network_activated": false'
            '    },'
            '    {'
            '      "plugin": "hello.php",'
            '      "name": "Hello Dolly",'
            '      "version": "1.7.2",'
            '      "version_latest": "1.7.2",'
            '      "url": "http://wordpress.org/plugins/hello-dolly/",'
            '      "author_name": "Matt Mullenweg",'
            '      "author_url": "http://ma.tt/",'
            '      "network_activated": false'
            '    }'
            '  ],'
            '  "dropins_mu_plugins": {'
            '    "dropins": [],'
            '    "mu_plugins": []'
            '  },'
            '  "theme": {'
            '    "name": "Storefront",'
            '    "version": "3.8.1",'
            '    "version_latest": "3.8.1",'
            '    "author_url": "https://woocommerce.com/",'
            '    "is_child_theme": false,'
            '    "has_woocommerce_support": true,'
            '    "has_woocommerce_file": false,'
            '    "has_outdated_templates": false,'
            '    "overrides": [],'
            '    "parent_name": "",'
            '    "parent_version": "",'
            '    "parent_version_latest": "",'
            '    "parent_author_url": ""'
            '  },'
            '  "settings": {'
            '    "api_enabled": false,'
            '    "force_ssl": false,'
            '    "currency": "EUR",'
            '    "currency_symbol": "&euro;",'
            '    "currency_position": "right",'
            '    "thousand_separator": ".",'
            '    "decimal_separator": ",",'
            '    "number_of_decimals": 2,'
            '    "geolocation_enabled": false,'
            '    "taxonomies": {'
            '      "external": "external",'
            '      "grouped": "grouped",'
            '      "simple": "simple",'
            '      "variable": "variable"'
            '    },'
            '    "product_visibility_terms": {'
            '      "exclude-from-catalog": "exclude-from-catalog",'
            '      "exclude-from-search": "exclude-from-search",'
            '      "featured": "featured",'
            '      "outofstock": "outofstock",'
            '      "rated-1": "rated-1",'
            '      "rated-2": "rated-2",'
            '      "rated-3": "rated-3",'
            '      "rated-4": "rated-4",'
            '      "rated-5": "rated-5"'
            '    },'
            '    "woocommerce_com_connected": "no"'
            '  },'
            '  "security": {'
            '    "secure_connection": true,'
            '    "hide_errors": true'
            '  },'
            '  "pages": ['
            '    {'
            '      "page_name": "Base de la tienda",'
            '      "page_id": "5",'
            '      "page_set": true,'
            '      "page_exists": true,'
            '      "page_visible": true,'
            '      "shortcode": "",'
            '      "block": "",'
            '      "shortcode_required": false,'
            '      "shortcode_present": false,'
            '      "block_present": false,'
            '      "block_required": false'
            '    },'
            '    {'
            '      "page_name": "Carrito",'
            '      "page_id": "6",'
            '      "page_set": true,'
            '      "page_exists": true,'
            '      "page_visible": true,'
            '      "shortcode": "[woocommerce_cart]",'
            '      "block": "woocommerce/cart",'
            '      "shortcode_required": true,'
            '      "shortcode_present": true,'
            '      "block_present": false,'
            '      "block_required": true'
            '    },'
            '    {'
            '      "page_name": "Finalizar compra",'
            '      "page_id": "7",'
            '      "page_set": true,'
            '      "page_exists": true,'
            '      "page_visible": true,'
            '      "shortcode": "[woocommerce_checkout]",'
            '      "block": "woocommerce/checkout",'
            '      "shortcode_required": true,'
            '      "shortcode_present": true,'
            '      "block_present": false,'
            '      "block_required": true'
            '    },'
            '    {'
            '      "page_name": "Mi cuenta",'
            '      "page_id": "8",'
            '      "page_set": true,'
            '      "page_exists": true,'
            '      "page_visible": true,'
            '      "shortcode": "[woocommerce_my_account]",'
            '      "block": "",'
            '      "shortcode_required": true,'
            '      "shortcode_present": true,'
            '      "block_present": false,'
            '      "block_required": false'
            '    },'
            '    {'
            '      "page_name": "T'#233'rminos y condiciones",'
            '      "page_id": "",'
            '      "page_set": false,'
            '      "page_exists": false,'
            '      "page_visible": false,'
            '      "shortcode": "",'
            '      "block": "",'
            '      "shortcode_required": false,'
            '      "shortcode_present": false,'
            '      "block_present": false,'
            '      "block_required": false'
            '    }'
            '  ],'
            '  "post_type_counts": ['
            '    {'
            '      "type": "attachment",'
            '      "count": "1"'
            '    },'
            '    {'
            '      "type": "page",'
            '      "count": "6"'
            '    },'
            '    {'
            '      "type": "post",'
            '      "count": "2"'
            '    },'
            '    {'
            '      "type": "product",'
            '      "count": "1"'
            '    }'
            '  ]'
            '}')
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object ENodoJSONPadre: TLFEdit
          Left = 584
          Top = 16
          Width = 121
          Height = 21
          TabOrder = 1
          Text = 'environment'
        end
        object ENodoJSONHijo: TLFEdit
          Left = 584
          Top = 104
          Width = 121
          Height = 21
          TabOrder = 2
          Text = 'version'
        end
        object BJSONObtenerHijos: TButton
          Left = 584
          Top = 38
          Width = 121
          Height = 25
          Caption = 'Obtener Hijos'
          TabOrder = 3
          OnClick = BJSONObtenerHijosClick
        end
        object BJSONObtenerValorHijo: TButton
          Left = 584
          Top = 126
          Width = 121
          Height = 25
          Caption = 'Obtener Valor Hijo'
          TabOrder = 4
          OnClick = BJSONObtenerValorHijoClick
        end
      end
      object TSTBAI: TTabSheet
        Caption = 'TBAI'
        ImageIndex = 20
        object ETBAI: TEdit
          Left = 8
          Top = 8
          Width = 377
          Height = 21
          TabOrder = 0
          Text = 'TBAI-00000006Y-251019-btFpwP8dcLGAF-'
        end
        object BCRC8: TButton
          Left = 392
          Top = 6
          Width = 75
          Height = 25
          Caption = 'Calc. CRC8'
          TabOrder = 1
          OnClick = BCRC8Click
        end
        object BComprimirGZip: TButton
          Left = 392
          Top = 32
          Width = 81
          Height = 25
          Caption = 'Comprimir GZip'
          TabOrder = 2
          OnClick = BComprimirGZipClick
        end
      end
      object TSXML: TTabSheet
        Caption = 'TSXML'
        ImageIndex = 21
        object LXMLNodoPadre: TLFLabel
          Left = 584
          Top = 56
          Width = 57
          Height = 13
          Caption = 'Nodo Padre'
        end
        object MXML: TLFMemo
          Left = 0
          Top = 0
          Width = 577
          Height = 165
          Align = alLeft
          Lines.Strings = (
            '<?xml version="1.0" encoding="utf-8"?>'
            '<T:TicketBai xmlns:T="urn:ticketbai:emision">'
            #9'<Cabecera>'
            #9#9'<IDVersionTBAI>1.2</IDVersionTBAI>'
            #9'</Cabecera>'
            #9'<Sujetos>'
            #9#9'<Emisor>'
            #9#9#9'<NIF>B95642500</NIF>'
            #9#9#9'<ApellidosNombreRazonSocial>ECOTHERM ENERGY '
            'S.L.</ApellidosNombreRazonSocial>'
            #9#9'</Emisor>'
            #9#9'<Destinatarios>'
            #9#9#9'<IDDestinatario>'
            #9#9#9#9'<NIF>11973150V</NIF>'
            #9#9#9#9'<ApellidosNombreRazonSocial>ANGEL MENDEZ '
            'ESTEVEZ</ApellidosNombreRazonSocial>'
            #9#9#9#9'<CodigoPostal>49600</CodigoPostal>'
            #9#9#9'</IDDestinatario>'
            #9#9'</Destinatarios>'
            #9'</Sujetos>'
            #9'<Factura>'
            #9#9'<CabeceraFactura>'
            #9#9#9'<SerieFactura>C</SerieFactura>'
            #9#9#9'<NumFactura>211083</NumFactura>'
            #9#9#9'<FechaExpedicionFactura>31-12-2021</FechaExpedicionFactura>'
            #9#9#9'<HoraExpedicionFactura>16:30:03</HoraExpedicionFactura>'
            #9#9'</CabeceraFactura>'
            #9#9'<DatosFactura>'
            #9#9#9'<FechaOperacion>31-12-2021</FechaOperacion>'
            #9#9#9'<DescripcionFactura>Venta</DescripcionFactura>'
            #9#9#9'<ImporteTotalFactura>551.76</ImporteTotalFactura>'
            #9#9#9'<Claves>'
            #9#9#9#9'<IDClave>'
            #9#9#9#9#9
            
              '<ClaveRegimenIvaOpTrascendencia>01</ClaveRegimenIvaOpTrascendenc' +
              'ia>'
            #9#9#9#9'</IDClave>'
            #9#9#9'</Claves>'
            #9#9'</DatosFactura>'
            #9#9'<TipoDesglose>'
            #9#9#9'<DesgloseFactura>'
            #9#9#9#9'<Sujeta>'
            #9#9#9#9#9'<NoExenta>'
            #9#9#9#9#9#9'<DetalleNoExenta>'
            #9#9#9#9#9#9#9'<TipoNoExenta>S1</TipoNoExenta>'
            #9#9#9#9#9#9#9'<DesgloseIVA>'
            #9#9#9#9#9#9#9#9'<DetalleIVA>'
            #9#9#9#9#9#9#9#9#9
            '<BaseImponible>456.00</BaseImponible>'
            #9#9#9#9#9#9#9#9#9
            '<TipoImpositivo>21.00</TipoImpositivo>'
            #9#9#9#9#9#9#9#9#9
            '<CuotaImpuesto>95.76</CuotaImpuesto>'
            #9#9#9#9#9#9#9#9#9
            '<TipoRecargoEquivalencia>0.00</TipoRecargoEquivalencia>'
            #9#9#9#9#9#9#9#9#9
            '<CuotaRecargoEquivalencia>0.00</CuotaRecargoEquivalencia>'
            #9#9#9#9#9#9#9#9'</DetalleIVA>'
            #9#9#9#9#9#9#9'</DesgloseIVA>'
            #9#9#9#9#9#9'</DetalleNoExenta>'
            #9#9#9#9#9'</NoExenta>'
            #9#9#9#9'</Sujeta>'
            #9#9#9'</DesgloseFactura>'
            #9#9'</TipoDesglose>'
            #9'</Factura>'
            #9'<HuellaTBAI>'
            #9#9'<EncadenamientoFacturaAnterior>'
            #9#9#9'<SerieFacturaAnterior>C</SerieFacturaAnterior>'
            #9#9#9'<NumFacturaAnterior>211083</NumFacturaAnterior>'
            
              #9#9#9'<FechaExpedicionFacturaAnterior>31-12-2021</FechaExpedicionFa' +
              'cturaAnterior>'
            #9#9#9
            
              '<SignatureValueFirmaFacturaAnterior>BRSgh2QfYdJVcwQ0U+bhehB87FrL' +
              'UM5F2MGXwhMZxlZ7VfuKTI54dzuj+LE8'
            
              '+Voc2gpDfCWbR408N1GOvHi6lTLUgCMGyVQCs5xR</SignatureValueFirmaFac' +
              'turaAnterior>'
            #9#9'</EncadenamientoFacturaAnterior>'
            #9#9'<Software>'
            #9#9#9'<LicenciaTBAI>LICTBAI</LicenciaTBAI>'
            #9#9#9'<EntidadDesarrolladora>'
            #9#9#9#9'<NIF>B67287797</NIF>'
            #9#9#9'</EntidadDesarrolladora>'
            #9#9#9'<Nombre>Delfos Online</Nombre>'
            #9#9#9'<Version>2021</Version>'
            #9#9'</Software>'
            #9#9'<NumSerieDispositivo>02:50:F3:9E:DD:73</NumSerieDispositivo>'
            #9'</HuellaTBAI>'
            #9'<ds:Signature xmlns:ds="http://www.w3.org/2000/09/xmldsig#" '
            'Id="Signature-4e2a1668-5f18-498b-80d4-f42e2f550e9a-Signature">'
            #9#9'<ds:SignedInfo>'
            #9#9#9'<ds:CanonicalizationMethod '
            'Algorithm="http://www.w3.org/TR/2001/REC-xml-c14n-20010315"/>'
            #9#9#9'<ds:SignatureMethod '
            'Algorithm="http://www.w3.org/2001/04/xmldsig-more#rsa-sha512"/>'
            
              #9#9#9'<ds:Reference Id="Reference-7f5fd99d-897c-4010-90ac-d7eab0629' +
              '0f1" URI="">'
            #9#9#9#9'<ds:Transforms>'
            #9#9#9#9#9'<ds:Transform '
            'Algorithm="http://www.w3.org/TR/2001/REC-xml-c14n-20010315"/>'
            #9#9#9#9#9'<ds:Transform '
            
              'Algorithm="http://www.w3.org/2000/09/xmldsig#enveloped-signature' +
              '"/>'
            #9#9#9#9#9'<ds:Transform '
            'Algorithm="http://www.w3.org/TR/1999/REC-xpath-19991116">'
            #9#9#9#9#9#9'<ds:XPath '
            
              'xmlns:ds="http://www.w3.org/2000/09/xmldsig#">not(ancestor-or-se' +
              'lf::ds:Signature)</ds:XPath>'
            #9#9#9#9#9'</ds:Transform>'
            #9#9#9#9'</ds:Transforms>'
            #9#9#9#9'<ds:DigestMethod '
            'Algorithm="http://www.w3.org/2001/04/xmlenc#sha512"/>'
            #9#9#9#9
            
              '<ds:DigestValue>52vPJl9xQW6qIyoZJ94c+7tJdqF1F4i/0syISKPaulErxIOH' +
              'xW2r3ryxr2faeyKIUzWgoQ5iqWFzQNyiIpa'
            'Chw==</ds:DigestValue>'
            #9#9#9'</ds:Reference>'
            
              #9#9#9'<ds:Reference Type="http://uri.etsi.org/01903#SignedPropertie' +
              's" '
            
              'URI="#Signature-4e2a1668-5f18-498b-80d4-f42e2f550e9a-SignedPrope' +
              'rties">'
            #9#9#9#9'<ds:DigestMethod '
            'Algorithm="http://www.w3.org/2001/04/xmlenc#sha512"/>'
            #9#9#9#9
            
              '<ds:DigestValue>i5UI1PRcHgyqRLusbP2Oc63rEkQn7A3zI5+MUaWkCYhjuJl6' +
              'BWzt4ZLZGiR4lvlbf1ATV3Kos6l2PCF'
            'juA4+BA==</ds:DigestValue>'
            #9#9#9'</ds:Reference>'
            
              #9#9#9'<ds:Reference URI="#Signature-4e2a1668-5f18-498b-80d4-f42e2f5' +
              '50e9a-KeyInfo">'
            #9#9#9#9'<ds:DigestMethod '
            'Algorithm="http://www.w3.org/2001/04/xmlenc#sha512"/>'
            #9#9#9#9
            
              '<ds:DigestValue>D4zOqJtpbS/qJVR0nz4j/mOPAwxuZxgMAbsi0Pa+TjvX8c7C' +
              'xwBxVQOjiMKv0fQOmH5meGWWrdv'
            'zlH0XGPCI4Q==</ds:DigestValue>'
            #9#9#9'</ds:Reference>'
            #9#9'</ds:SignedInfo>'
            #9#9'<ds:SignatureValue '
            
              'Id="Signature-4e2a1668-5f18-498b-80d4-f42e2f550e9a-SignatureValu' +
              'e">N3ey4tFlGtjUXCs0oSj1exPPyvHaQuZpkpO'
            
              '2FtcXg9oBz8ieC6K90c8xsRhAleE8sUGn9jTrRKqK3mrMKBd6hS3aWYfo+RYfejD' +
              'lLiF4iQTaZ3IhLYrbXH9kFk24hOHR'
            
              'yglH4fc+6Cf9rqk0TEXSXCqOHw5DK4pF6YzPK0LFxP5DQrprn318BFwHJm0R9yWP' +
              'v/AFv8fji4uqSzOOoBDzfVxoDT'
            
              'ZHCHf2w1P+XPkaD6VaBNqVRkCFcc+GxpT5oO/aYzb2jMU4HSr0VK0BGLs0gUgQo9' +
              'VEcMBc0j9YQMoepwjy1UNl'
            'HeK6gtyn1K7GSiEVw0mVcPUag6ThVzcXxSeYAw==</ds:SignatureValue>'
            
              #9#9'<ds:KeyInfo Id="Signature-4e2a1668-5f18-498b-80d4-f42e2f550e9a' +
              '-KeyInfo">'
            #9#9#9'<ds:X509Data>'
            #9#9#9#9
            
              '<ds:X509Certificate>MIIIqzCCB5OgAwIBAgIQOdTZA6df2BxfV8bMCn4NCzAN' +
              'BgkqhkiG9w0BAQsFADBNMQswCQY'
            
              'DVQQGEwJFUzERMA8GA1UECgwIRk5NVC1SQ00xDjAMBgNVBAsMBUNFUkVTMRswGQY' +
              'DVQQDDBJBQyBSZX'
            
              'ByZXNlbnRhY2nDs24wHhcNMjAwOTA4MTgwMDQ0WhcNMjIwOTA4MTgwMDQ0WjCCAR' +
              'UxWjBYBgNVBA0MUV'
            
              'JlZzowODAwNSAvSG9qYTpCLTUyNDI4MSAvVG9tbzo0NjU3NCAvRm9saW86MjE3IC' +
              '9GZWNoYTowMi8xMC8yMD'
            
              'E4IC9JbnNjcmlwY2nDs246MTEYMBYGA1UEBRMPSURDRVMtWDMyNDUyOTlFMRQwEg' +
              'YDVQQqDAtEVUlMSU8'
            
              'gSlVBTjEOMAwGA1UEBAwFSVNPTEExMzAxBgNVBAMMKlgzMjQ1Mjk5RSBEVUlMSU8' +
              'gSlVBTiBJU09MQSAoUjog'
            
              'QjY3Mjg3Nzk3KTEYMBYGA1UEYQwPVkFURVMtQjY3Mjg3Nzk3MRswGQYDVQQKDBJE' +
              'RUxGT1MgT05MSU5FIF'
            
              'MuTC4xCzAJBgNVBAYTAkVTMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQ' +
              'EAhH2OhSn1vrtaQ0eZOE54'
            
              'UrAKjcDIjwZKrwB5cJVNn1KNv8nt6X42GdgYShzGxLzlECajnLZdIB8kZX6Zr39B' +
              'qIddq1EGsCJQPCuZhBVUJBPOo+x'
            
              '8OGu6iTfBqjTC4PKiQLLIl9Drzbn6jFCmDgbFl/N9mvD2OZFQTsxim6OkQsRTxtj' +
              'mzI7f6XvYYEL7Ugo8/8jPErruEbodm'
            
              'CFU4TK2jFvOQCYhAo+UE7k6DhSs7ZWVHVIDzLj6invNWthpV41tCno60utFNn4gq' +
              'Vd5r2jAjKnq9mMhKQga2d5i8IrV'
            
              '/Z4Pl0LcwJkUlKtPMjx7L87UoOp3UOJPUJiQVnkSVjVaewIDAQABo4IEuzCCBLcw' +
              'geIGA1UdEQSB'
            
              '2jCB14EVRFVJTElPSVNPTEFAR01BSUwuQ09NpIG9MIG6MSMwIQYJKwYBBAGsZgEU' +
              'DBRBZG1pbmlzdHJhZG9y'
            
              'IMO6bmljbzEeMBwGCSsGAQQBrGYBBwwPVkFURVMtQjY3Mjg3Nzk3MSEwHwYJKwYB' +
              'BAGsZgEGDBJERUxGT1'
            
              'MgT05MSU5FIFMuTC4xHjAcBgkrBgEEAaxmAQQMD0lEQ0VTLVgzMjQ1Mjk5RTEUMB' +
              'IGCSsGAQQBrGYBAgwFSV'
            
              'NPTEExGjAYBgkrBgEEAaxmAQEMC0RVSUxJTyBKVUFOMAwGA1UdEwEB/wQCMAAwDg' +
              'YDVR0PAQH/BAQDAg'
            
              'XgMB0GA1UdJQQWMBQGCCsGAQUFBwMCBggrBgEFBQcDBDCBggYIKwYBBQUHAQEEdj' +
              'B0MD0GCCsGAQUFB'
            
              'zABhjFodHRwOi8vb2NzcHJlcC5jZXJ0LmZubXQuZXMvb2NzcHJlcC9PY3NwUmVzc' +
              'G9uZGVyMDMGCCsGAQUFBz'
            
              'AChidodHRwOi8vd3d3LmNlcnQuZm5tdC5lcy9jZXJ0cy9BQ1JFUC5jcnQwHQYDVR' +
              '0OBBYEFEcvh2uiGb0pVaplf3ML'
            
              '7Ad6nQa3MIIBPwYDVR0gBIIBNjCCATIwggEYBgorBgEEAaxmAwsBMIIBCDApBggr' +
              'BgEFBQcCARYdaHR0cDovL3d'
            
              '3dy5jZXJ0LmZubXQuZXMvZHBjcy8wgdoGCCsGAQUFBwICMIHNDIHKQ2VydGlmaWN' +
              'hZG8gY3VhbGlmaWNhZG8'
            
              'gZGUgcmVwcmVzZW50YW50ZSBkZSBwLiBqdXLDrWRpY2EgKHJlbGFjacOzbiBjb24' +
              'gQUFQUCB5IGNvbnRyYXRh'
            
              'Y2nDs24pLiBTdWpldG8gYSBjb25kaWNpb25lcyBkZSB1c28gc2Vnw7puIERQQyBk' +
              'ZSBGTk1ULVJDTSwgTklGOiB'
            
              'RMjgyNjAwNC1KIChDL0pvcmdlIEp1YW4gMTA2LTI4MDA5LU1hZHJpZC1Fc3Bhw7F' +
              'hKTAJBgcEAIvsQAEAMAkGB'
            '2CFVAEDBQgw'
            
              'gaYGCCsGAQUFBwEDBIGZMIGWMAgGBgQAjkYBATATBgYEAI5GAQYwCQYHBACORgEG' +
              'ATBoBgYEAI5GAQUw'
            
              'XjAtFidodHRwczovL3d3dy5jZXJ0LmZubXQuZXMvcGRzL1BEU19lcy5wZGYTAmVz' +
              'MC0WJ2h0dHBzOi8vd3d3LmNl'
            
              'cnQuZm5tdC5lcy9wZHMvUERTX2VuLnBkZhMCZW4wCwYGBACORgEDAgEPMB8GA1Ud' +
              'IwQYMBaAFNxQlp/XM'
            
              'YnJEeTvll/2X4JSRmJTMIHhBgNVHR8EgdkwgdYwgdOggdCggc2GgZ1sZGFwOi8vb' +
              'GRhcHJlcC5jZXJ0LmZubXQu'
            
              'ZXMvQ049Q1JMMTE0NyxPVT1BQyUyMFJlcHJlc2VudGFjaW9uLE9VPUNFUkVTLE89' +
              'Rk5NVC1SQ00sQz1FUz9jZ'
            
              'XJ0aWZpY2F0ZVJldm9jYXRpb25MaXN0O2JpbmFyeT9iYXNlP29iamVjdGNsYXNzP' +
              'WNSTERpc3RyaWJ1dGlvblBva'
            
              'W50hitodHRwOi8vd3d3LmNlcnQuZm5tdC5lcy9jcmxzcmVwL0NSTDExNDcuY3JsM' +
              'A0GCSqGSIb3DQEBCwUAA4IB'
            
              'AQDBR8A3HsB8Joao3k3xV3dgWqua87NV/gZBm/JX7DGc/RBl++Ugbj9TQOEmXDHZ' +
              'zbAd+iZ8DB+NmCqgm+IRp'
            
              'bUqrcXoSFTya5TsnJ7Na3gNKNP+w+BlbifbSe2Yo/79+WoIAf46ds8diBGZe/ZYJ' +
              'PmXyiAp7dOLg0ir/pBHYNozKgGzZ'
            
              '4oZlXFlzYAB06lq7rK/40G8bPMeYUz5Y9mNMdsRRlXRtECbObHLItfhbPdEXL6Ys' +
              'oKgFklrdqJXJkgZz8H23//6htqqB1'
            
              'gMhMMy/jNXGuuZsYPNpwPCqtFpVN76OYfVzguLeasYbXA10oIsa0joE5gG9z+gRI' +
              'VRQFxvsVMA</ds:X509Certificate>'
            #9#9#9#9
            
              '<ds:X509Certificate>MIIG3DCCBMSgAwIBAgIQYcLU1PaprndVkma5ja/WITAN' +
              'BgkqhkiG9w0BAQsFADA7MQswCQ'
            
              'YDVQQGEwJFUzERMA8GA1UECgwIRk5NVC1SQ00xGTAXBgNVBAsMEEFDIFJBSVogRk' +
              '5NVC1SQ00wHhcNMT'
            
              'UwNjMwMDk1MTUzWhcNMjkxMjMxMTA1MTUzWjBNMQswCQYDVQQGEwJFUzERMA8GA1' +
              'UECgwIRk5NVC1SQ'
            
              '00xDjAMBgNVBAsMBUNFUkVTMRswGQYDVQQDDBJBQyBSZXByZXNlbnRhY2nDs24wg' +
              'gEiMA0GCSqGSIb3DQE'
            
              'BAQUAA4IBDwAwggEKAoIBAQDCO7E+oUYbuTJaWkEQtIFgcRHD/kHavy+XBFdfCdU' +
              'zDh9w7Yq4kYckBPW/YU1'
            
              'QRa4v35HbajEMCs4cyLnoJy8Wyzq7qrSwmNHhMYDjtGywJXbCo5SZVbIwyagWig8' +
              'Nb/x9Y5WGWIY76E9agPAoEY'
            
              'OxOG8h1J6ipNoBbq0R+4N4ODaq57ABY7mUSXb4WgjoVg4WxxZw0GGLuc8R1idoX1' +
              'G/VqxvNymeCZ7o1bEwbs7'
            
              'X3NhRsK21w3ju8pkUNZXN6Pkflh9qIslOLiokKbiDwwAZE4nvU//B8Q8FLYk1sgT' +
              'QTLET2EQZ308FlECRp3i6Ay4iez'
            
              'c0Yd3FKIDmOxCdDUcDAgMBAAGjggLIMIICxDASBgNVHRMBAf8ECDAGAQH/AgEAMA' +
              '4GA1UdDwEB/wQEAwIB'
            
              'BjAdBgNVHQ4EFgQU3FCWn9cxickR5O+WX/ZfglJGYlMwgZgGCCsGAQUFBwEBBIGL' +
              'MIGIMEkGCCsGAQUFBzAB'
            
              'hj1odHRwOi8vb2NzcGZubXRyY21jYS5jZXJ0LmZubXQuZXMvb2NzcGZubXRyY21j' +
              'YS9PY3NwUmVzcG9uZGVyMD'
            
              'sGCCsGAQUFBzAChi9odHRwOi8vd3d3LmNlcnQuZm5tdC5lcy9jZXJ0cy9BQ1JBSV' +
              'pGTk1UUkNNLmNydDAfBgNVH'
            'SME'
            
              'GDAWgBT3fcX9xOiaG3dkp/UdoMy/h2CabTCB6wYDVR0gBIHjMIHgMIHdBgRVHSAA' +
              'MIHUMCkGCCsGAQUFBwIB'
            
              'Fh1odHRwOi8vd3d3LmNlcnQuZm5tdC5lcy9kcGNzLzCBpgYIKwYBBQUHAgIwgZkM' +
              'gZZTdWpldG8gYSBsYXMgY2'
            
              '9uZGljaW9uZXMgZGUgdXNvIGV4cHVlc3RhcyBlbiBsYSBEZWNsYXJhY2nDs24gZG' +
              'UgUHLDoWN0aWNhcyBkZS'
            
              'BDZXJ0aWZpY2FjacOzbiBkZSBsYSBGTk1ULVJDTSAoIEMvIEpvcmdlIEp1YW4sID' +
              'EwNi0yODAwOS1NYWRyaWQ'
            
              'tRXNwYcOxYSkwgdQGA1UdHwSBzDCByTCBxqCBw6CBwIaBkGxkYXA6Ly9sZGFwZm5' +
              'tdC5jZXJ0LmZubXQuZXM'
            
              'vQ049Q1JMLE9VPUFDJTIwUkFJWiUyMEZOTVQtUkNNLE89Rk5NVC1SQ00sQz1FUz9' +
              'hdXRob3JpdHlSZXZvY2F0'
            
              'aW9uTGlzdDtiaW5hcnk/YmFzZT9vYmplY3RjbGFzcz1jUkxEaXN0cmlidXRpb25Q' +
              'b2ludIYraHR0cDovL3d3dy5jZXJ0L'
            
              'mZubXQuZXMvY3Jscy9BUkxGTk1UUkNNLmNybDANBgkqhkiG9w0BAQsFAAOCAgEAp' +
              'S/HpvFq3S42VmjXtoNVxd'
            
              'h+m1/NdjoWVY6M2o9c+UZofrZWbaiQ+aNOn6/+Qf/LZk41jD+nEa/O1GkPyAineY' +
              'tjyW6Ae7ltVPIVIWQa3fALcgyN7'
            
              's/U31qPooU7Zv7a5mghpxapWHvtL9yxpLjrtGsZD32qysIJ2pjDqJa5WeWVKF2RS' +
              '1zy6Bm/9JzlxzTCH03kivP5ltp+cHi'
            
              'k/KzJZ+HgPv6BLwO+OYrJ19vGbPuDGgOj7uJTG3XQIlZchTltgCmNRPKs/HOGOyD' +
              'mWxm07FmrADQ1NWag3gjoH'
            
              '8xcfAlp9aBnm/UXFJuAkGOq8ASr+A5dpJeDP/rlKphDdxJpG5YKRwRSb7PnAccst' +
              'mGx'
            
              'ynL+K/0ofxAhbWqC6z7KeGyZBTeVIilPhp+xZzJnvFVBjN6s2j7W3+esQkiT4SdY' +
              '9RN+c3tBuWF54UNc7YVe6KVTjzk'
            
              'pev9szp6vUNQ+A45i2KGXRLN6/16nA9fujzITRWmX4tOGABo0aL/wBrf3Po89gvZ' +
              'wZRaVQ9Bw/KfEF8eZDhA1Mg'
            
              'QKSPJLSXSl58elHGFLUR2CQMGl+mgfPB0qZUUkRG/RYpZLocczAz6pfkxA3Mt3Df' +
              'IyVtA/YJ0O4ZYpdbH9zdJZI1R'
            
              'QEWmFrMOrEAWmGIG0SmNpARqOPJsTQJomUcvd3EvA7so2LzLJ+Sjj2So=</ds:X5' +
              '09Certificate>'
            #9#9#9#9
            
              '<ds:X509Certificate>MIIFgzCCA2ugAwIBAgIPXZONMGc2yAYdGsdUhGkHMA0G' +
              'CSqGSIb3DQEBCwUAMDsxCzAJB'
            
              'gNVBAYTAkVTMREwDwYDVQQKDAhGTk1ULVJDTTEZMBcGA1UECwwQQUMgUkFJWiBGT' +
              'k1ULVJDTTAeFw0'
            
              'wODEwMjkxNTU5NTZaFw0zMDAxMDEwMDAwMDBaMDsxCzAJBgNVBAYTAkVTMREwDwY' +
              'DVQQKDAhGTk1UL'
            
              'VJDTTEZMBcGA1UECwwQQUMgUkFJWiBGTk1ULVJDTTCCAiIwDQYJKoZIhvcNAQEBB' +
              'QADggIPADCCAgoCggI'
            
              'BALpxgHpMhm5/yBNtwMZ9HACXjywMI7sQmkCpGreHiPibVmr75nuOi5KOpyVdWRH' +
              'bNi63URcfqQgfBBckWKo3Shj'
            
              'f5TnUV/3XwSyRAZHiItQDwFj8d0fsjz50Q7qsNI1NOHZnjrDIbzAzWHFctPVrbtQ' +
              'BULgTfmxKo0nRIBnuvMApGGWn3v'
            
              '7v3QqQIecaZ5JCEJhfTzC8PhxFtBDXaEAUwED653cXeuYLj2VbPNmaUtu1vZ5Gzz' +
              '3rkQUCwJaydkxNEJY7kvqcfw+'
            
              'Z374jNUUeAlz+taibmSXaXvMiwzn15Cou08YfxGyqxRxqAQVKL9LFwag0Jl1mpdI' +
              'CIfkYtwb1TplvqKtMUejPUBjFd8g5C'
            
              'SxJkjKZqLsXF3mwWsXmo8RZZUc1g16p6DULmbvkzSDGm0oGObVo/CK67lWMK07q8' +
              '7Hj/LaZmtVC+nFNCM+HH'
            
              'mpxffnTtOmlcYF7wk5HlqX2doWjKI/pgG6BU6VtX7hI+cL5NqYuSf+4lsKMB7Obi' +
              'Fj86xsc3i1w4peSMKGJ47xVqCfWS+'
            
              '2QrYv6YyVZLag13cqXM7zlzced0ezvXg5KkAYmY6252TUtB7p2ZSysV4999AeU14' +
              'ECll2jB0nVetBX+RvnU0Z1qrB5Q'
            'stocQjpYL05ac70r8NWQMetUqIJ5G+GR4of6ygnXYMgrwTJbFaai0b1AgMBAAGj'
            
              'gYMwgYAwDwYDVR0TAQH/BAUwAwEB/zAOBgNVHQ8BAf8EBAMCAQYwHQYDVR0OBBYE' +
              'FPd9xf3E6Jobd2Sn'
            
              '9R2gzL+HYJptMD4GA1UdIAQ3MDUwMwYEVR0gADArMCkGCCsGAQUFBwIBFh1odHRw' +
              'Oi8vd3d3LmNlcnQuZm5t'
            
              'dC5lcy9kcGNzLzANBgkqhkiG9w0BAQsFAAOCAgEAB5BK3/MjTvDDnFFlm5wioooM' +
              'hfNzKWtN/gHiqQxjAb8EZ6Wd'
            
              'mF/9ARP67Jpi6Yb+tmLSbkyU+8B1RXxlDPiyN8+sD8+Nb/kZ94/sHvJwnvDKuO+3' +
              '/3Y3dlv2bojzr2IyIpMNOmqOFGY'
            
              'MLVN0V2Ue1bLdI4E7pWYjJ2cJj+F3qkPNZVEI7VFY/uY5+ctHhKQV8Xa7pO6kO8R' +
              'f77IzlhEYt8llvhjho6Tc+hj507wT'
            
              'mzl6NLrTQfv6MooqtyuGC2mDOL7Nii4LcK2NJpLuHvUBKwrZ1pebbuCoGRw6IYsM' +
              'HkCtA+fdZn71uSANA+iW+YJF1'
            
              'DngoABd15jmfZ5nc8OaKveri6E6FO80vFIOiZiaBECEHX5FaZNXzuvO+FB8TxxuB' +
              'EOb+dY7Ixjp6o7RTUaN8Tvkasq6'
            
              '+yO3m/qZASlaWFot4/nUbQ4mrcFuNLwy+AwF+mWj2zs3gyLp1txyM/1d8iC9djwj' +
              '2ij3+RvrWWTV3F9yfiD8zYm1kGdN'
            
              'Yno/Tq0dwzn+evQoFt9B9kiABdcPUXmsEKvU7ANm5mqwujGSQkBqvjrTcuFqN1W8' +
              'rB2Vt2lh8kORdOag0wokRqEIr'
            
              '9baRRmW1FMdW4R58MD3R++Lj8UGrp1MYp3/RgT408m2ECVAdf4WqslKYIYvuu8wd' +
              '+RU4riEmViAqhOLUTpPSP'
            'aLtrM=</ds:X509Certificate>'
            #9#9#9'</ds:X509Data>'
            #9#9#9'<ds:KeyValue>'
            #9#9#9#9'<ds:RSAKeyValue>'
            #9#9#9#9#9
            
              '<ds:Modulus>hH2OhSn1vrtaQ0eZOE54UrAKjcDIjwZKrwB5cJVNn1KNv8nt6X42' +
              'GdgYShzGxLzlECajnLZdIB8kZX6Zr'
            
              '39BqIddq1EGsCJQPCuZhBVUJBPOo+x8OGu6iTfBqjTC4PKiQLLIl9Drzbn6jFCmD' +
              'gbFl/N9mvD2OZFQTsxim6OkQsRT'
            
              'xtjmzI7f6XvYYEL7Ugo8/8jPErruEbodmCFU4TK2jFvOQCYhAo+UE7k6DhSs7ZWV' +
              'HVIDzLj6invNWthpV41tCno60utF'
            
              'Nn4gqVd5r2jAjKnq9mMhKQga2d5i8IrV/Z4Pl0LcwJkUlKtPMjx7L87UoOp3UOJP' +
              'UJiQVnkSVjVaew==</ds:Modulus>'
            #9#9#9#9#9'<ds:Exponent>AQAB</ds:Exponent>'
            #9#9#9#9'</ds:RSAKeyValue>'
            #9#9#9'</ds:KeyValue>'
            #9#9'</ds:KeyInfo>'
            #9#9'<ds:Object>'
            
              #9#9#9'<xades:QualifyingProperties xmlns:xades="http://uri.etsi.org/' +
              '01903/v1.3.2#" '
            
              'Id="Signature-4e2a1668-5f18-498b-80d4-f42e2f550e9a-QualifyingPro' +
              'perties" '
            
              'Target="#Signature-4e2a1668-5f18-498b-80d4-f42e2f550e9a-Signatur' +
              'e" '
            'xmlns:ds="http://www.w3.org/2000/09/xmldsig#">'
            #9#9#9#9'<xades:SignedProperties '
            
              'Id="Signature-4e2a1668-5f18-498b-80d4-f42e2f550e9a-SignedPropert' +
              'ies">'
            #9#9#9#9#9'<xades:SignedSignatureProperties>'
            #9#9#9#9#9#9
            '<xades:SigningTime>2022-01-07T20:02:00+01:00</xades:SigningTime>'
            #9#9#9#9#9#9'<xades:SigningCertificate>'
            #9#9#9#9#9#9#9'<xades:Cert>'
            #9#9#9#9#9#9#9#9'<xades:CertDigest>'
            #9#9#9#9#9#9#9#9#9'<ds:DigestMethod '
            'Algorithm="http://www.w3.org/2001/04/xmlenc#sha512"/>'
            #9#9#9#9#9#9#9#9#9
            
              '<ds:DigestValue>9lqDQ1aoi5ceMPcS1XMxZz0desraxDRqC8Pewxaj9TloaHwf' +
              'OV9OVswGn9GXLd8tbANQWOK9dhx'
            '6xzPc3kI6jA==</ds:DigestValue>'
            #9#9#9#9#9#9#9#9'</xades:CertDigest>'
            #9#9#9#9#9#9#9#9'<xades:IssuerSerial>'
            #9#9#9#9#9#9#9#9#9
            
              '<ds:X509IssuerName>CN=AC Representacion, OU=CERES, O=FNMT-RCM, C' +
              '=ES</ds:X509IssuerName>'
            #9#9#9#9#9#9#9#9#9
            
              '<ds:X509SerialNumber>76871164266117933315607805484032986379</ds:' +
              'X509SerialNumber>'
            #9#9#9#9#9#9#9#9'</xades:IssuerSerial>'
            #9#9#9#9#9#9#9'</xades:Cert>'
            #9#9#9#9#9#9'</xades:SigningCertificate>'
            #9#9#9#9#9#9'<xades:SignaturePolicyIdentifier>'
            #9#9#9#9#9#9#9'<xades:SignaturePolicyId>'
            #9#9#9#9#9#9#9#9'<xades:SigPolicyId>'
            #9#9#9#9#9#9#9#9#9
            
              '<xades:Identifier>https://www.gipuzkoa.eus/ticketbai/sinadura</x' +
              'ades:Identifier>'
            #9#9#9#9#9#9#9#9#9'<xades:Description/>'
            #9#9#9#9#9#9#9#9'</xades:SigPolicyId>'
            #9#9#9#9#9#9#9#9'<xades:SigPolicyHash>'
            #9#9#9#9#9#9#9#9#9'<ds:DigestMethod '
            'Algorithm="http://www.w3.org/2001/04/xmlenc#sha256"/>'
            #9#9#9#9#9#9#9#9#9
            
              '<ds:DigestValue>6NrKAm60o7u62FUQwzZew24ra2ve9PRQYwC21AM6In0=</ds' +
              ':DigestValue>'
            #9#9#9#9#9#9#9#9'</xades:SigPolicyHash>'
            #9#9#9#9#9#9#9#9'<xades:SigPolicyQualifiers>'
            #9#9#9#9#9#9#9#9#9
            '<xades:SigPolicyQualifier>'
            #9#9#9#9#9#9#9#9#9#9
            
              '<xades:SPURI>https://www.gipuzkoa.eus/ticketbai/sinadura</xades:' +
              'SPURI>'
            #9#9#9#9#9#9#9#9#9
            '</xades:SigPolicyQualifier>'
            #9#9#9#9#9#9#9#9'</xades:SigPolicyQualifiers>'
            #9#9#9#9#9#9#9'</xades:SignaturePolicyId>'
            #9#9#9#9#9#9'</xades:SignaturePolicyIdentifier>'
            #9#9#9#9#9'</xades:SignedSignatureProperties>'
            #9#9#9#9#9'<xades:SignedDataObjectProperties>'
            #9#9#9#9#9#9'<xades:DataObjectFormat '
            
              'ObjectReference="#Reference-7f5fd99d-897c-4010-90ac-d7eab06290f1' +
              '">'
            #9#9#9#9#9#9#9'<xades:Description/>'
            #9#9#9#9#9#9#9'<xades:ObjectIdentifier>'
            #9#9#9#9#9#9#9#9'<xades:Identifier '
            
              'Qualifier="OIDAsURN">urn:oid:1.2.840.10003.5.109.10</xades:Ident' +
              'ifier>'
            #9#9#9#9#9#9#9#9'<xades:Description/>'
            #9#9#9#9#9#9#9'</xades:ObjectIdentifier>'
            #9#9#9#9#9#9#9
            '<xades:MimeType>text/xml</xades:MimeType>'
            #9#9#9#9#9#9#9'<xades:Encoding/>'
            #9#9#9#9#9#9'</xades:DataObjectFormat>'
            #9#9#9#9#9'</xades:SignedDataObjectProperties>'
            #9#9#9#9'</xades:SignedProperties>'
            #9#9#9'</xades:QualifyingProperties>'
            #9#9'</ds:Object>'
            #9'</ds:Signature>'
            '</T:TicketBai>'
            ' ')
          ScrollBars = ssVertical
          TabOrder = 0
          WordWrap = False
        end
        object EXMLNodo1: TLFEdit
          Left = 592
          Top = 72
          Width = 121
          Height = 21
          TabOrder = 1
          Text = 'Signature'
        end
        object BXMLObtenerHijos: TButton
          Left = 576
          Top = 22
          Width = 121
          Height = 25
          Caption = 'Obtener Hijos'
          TabOrder = 2
          OnClick = BXMLObtenerHijosClick
        end
        object EXMLFichero: TLFEdit
          Left = 576
          Top = 0
          Width = 473
          Height = 21
          TabOrder = 3
          Text = 'C:\WINDOWS\Temp\TicketBAI-2021-C-211083.xml'
        end
        object BXMLCargarArchivo: TButton
          Left = 1056
          Top = 0
          Width = 43
          Height = 25
          Caption = 'Cargar'
          TabOrder = 4
          OnClick = BXMLCargarArchivoClick
        end
        object BXMLObtenerHijosNodoPadre: TButton
          Left = 592
          Top = 94
          Width = 121
          Height = 25
          Caption = 'Obtener Hijos'
          TabOrder = 5
          OnClick = BXMLObtenerHijosNodoPadreClick
        end
        object EXMLNodo2: TLFEdit
          Left = 716
          Top = 72
          Width = 121
          Height = 21
          TabOrder = 6
          Text = 'SignatureValue'
        end
      end
      object TSInsercionMasiva: TTabSheet
        Caption = 'Ins. Masiva'
        ImageIndex = 22
        object BInsMasiva: TButton
          Left = 48
          Top = 24
          Width = 145
          Height = 25
          Caption = 'BInsMasiva'
          TabOrder = 0
          OnClick = BInsMasivaClick
        end
      end
      object TSGLS: TTabSheet
        Caption = 'TSGLS'
        ImageIndex = 23
        object MGLSContenido: TMemo
          Left = 377
          Top = 0
          Width = 1018
          Height = 165
          Align = alClient
          Lines.Strings = (
            '<?xml version="1.0" encoding="utf-8"?>'
            ''
            '<!--Notes:'
            '   uidcliente: Customer ID (credentials).'
            '               Test uidcliente included.'
            '               Production uiddcliente will be given by Asm.'
            ''
            '   <Envio>     Do not include more than 20 to be efficient.'
            ''
            
              '   <Servicio>  For value 74 (EuroBusinessParcel). List of countr' +
              'ies (at 08/05/2015):'
            '                   43 - AT - AUSTRIA '
            '                   32 - BE - BELGIUM '
            '                  359 - BG - BULGARIA '
            '                  385 - HR - CROATIA '
            '                  301 - CY - CYPRUS '
            '                   42 - CZ - CZECH REPUBLIC '
            '                   45 - DK - DENMARK '
            '                  360 - EE - ESTONIA '
            '                  358 - FI - FINLAND '
            '                   33 - FR - FRANCE '
            '                   49 - DE - GERMANY '
            '                   30 - GR - GREECE '
            '                   31 - NL - HOLLAND '
            '                   36 - HU - HUNGARY '
            '                  353 - IE  - IRELAND '
            '                   39 - IT - ITALY '
            '                   78 - LV - LATVIA '
            '                   77 - LT - LITHUANIA '
            '                  352 - LU - LUXEMBOURG '
            '                  443 - MT - MALTA '
            '                   48 - PL - POLAND '
            '                   40 - RO - ROMANIA '
            '                    7 - RU - RUSSIA'
            '                  421 - SK - SLOVAKIA '
            '                  386 - SI - SLOVENIA '
            '                   46 - SE - SWEDEN '
            '                  411 - CH - SWITZERLAND'
            '                   44 - GB - UNITED KINGDOM '
            '               '
            
              '               You can use this codes (40 for Romania) or intern' +
              'ational standar ISO code (RO).'
            '               '
            '-->'
            ''
            
              '<Servicios uidcliente="5D405075-D828-4994-B935-4CF9CF825885" xml' +
              'ns="http://WSintegracion/">'
            
              '  <Envio codbarras="">                                          ' +
              '            <!-- [mandatory] Shipment barcode (codbarras is opti' +
              'onal). Usually empty or format 99999999999999. It is what we cal' +
              'l "Common label". The customer '
            
              'prints their labels adapted to the needs of Asm, but do not want' +
              ' send a file to be loaded in Asm (preadvice file or manifest fil' +
              'e), want insert shipments with  webservice. In this case the cli' +
              'ent generates the barcode '
            
              '(starts with 31) according to the rules of nomenclature and cont' +
              'ent indicated by Asm. Tag <PlazaDestino> is necessary in order t' +
              'o include <PlazaDestino>.<Nombre> and <PlazaDestino>.<Nemonico> ' +
              'on label-->'
            
              '    <Fecha>20/04/2024</Fecha>                                   ' +
              '            <!-- [mandatory] Shipment date, format DD/MM/YYYY, >' +
              '= today and usually today -->'
            
              '    <Portes>P</Portes>                                          ' +
              '            <!-- [optional] Postage type (P=prepaid / D=cod), us' +
              'ually "P" -->'
            
              '    <Servicio>1</Servicio>                                      ' +
              '            <!-- [mandatory] Service: 1=Courier, 37=Economy, 74=' +
              'EuroBusinessParcel, 12=International Express, 13=International E' +
              'conomy, ... -->'
            
              '    <Horario>3</Horario>                                        ' +
              '            <!-- [mandatory] Horary:  3=ASM24, 2=ASM14, 18=Econo' +
              'my, 19=ParcelShop... Usual combinations of <Servicio>+<Horario>:' +
              ' 1+3=ASM24, 1+2=ASM14, '
            
              '37+18=Economy, 74+void=EuroBusinessParcel, 12+void=International' +
              ', 1+19=ParcelShop -->'
            
              '    <Bultos>1</Bultos>                                          ' +
              '            <!-- [mandatory] Number of packages of shipment -->'
            
              '    <Peso>4</Peso>                                              ' +
              '            <!-- [mandatory] Weigth -->'
            
              '    <Retorno>0</Retorno>                                        ' +
              '            <!-- [optional] SWAP, collect goods on delivery (0:N' +
              'o, 1:Yes) -->'
            
              '    <Remite>                                                    ' +
              '            <!-- [mandatory] Sender -->'
            
              '      <Plaza></Plaza>                                           ' +
              '            <!-- [optional] Origin agency -->'
            
              '      <Nombre>sender name</Nombre>                              ' +
              '            <!-- [mandatory], up to 80 characters -->'
            
              '      <Direccion>sender address</Direccion>                     ' +
              '            <!-- [mandatory], up to 80 characters -->'
            
              '      <Poblacion>sender city</Poblacion>                        ' +
              '            <!-- [mandatory] -->'
            
              '      <Provincia>sender province</Provincia>                    ' +
              '            <!-- [optional] -->'
            
              '      <Pais>34</Pais>                                           ' +
              '            <!-- [mandatory] always 34=Spain -->'
            
              '      <CP>sender zipcode</CP>                                   ' +
              '            <!-- [mandatory]format 99999 -->'
            
              '      <Telefono>sender phone</Telefono>                         ' +
              '            <!-- [optional] format 9999999999, not include the c' +
              'ountry code (+34 for Spain, +33 for France, etc.) -->'
            
              '      <Movil>sender cellular</Movil>                            ' +
              '            <!-- [optional] format 9999999999, not include the c' +
              'ountry code (+34 for Spain, +33 for France, etc.) -->'
            
              '      <Email>sender email</Email>                               ' +
              '            <!-- [optional] up to 200 characters -->'
            
              '      <Departamento>sender department</Departamento>            ' +
              '            <!-- [optional] up to 50 characters -->'
            
              '      <Observaciones>Notes</Observaciones>                      ' +
              '            <!-- [optional] up to 80 characters -->'
            '    </Remite>'
            
              '    <Destinatario>                                              ' +
              '            <!-- [mandatory] Recipient (consignee) -->'
            
              '      <Nombre>delivery name</Nombre>                            ' +
              '            <!-- [mandatory], up to 80 characters -->'
            
              '      <Direccion>delivery address</Direccion>                   ' +
              '            <!-- [mandatory], up to 80 characters -->'
            
              '      <Poblacion>delivery city</Poblacion>                      ' +
              '            <!-- [mandatory] -->'
            
              '      <Provincia>delivery province</Provincia>                  ' +
              '            <!-- [optional] -->'
            
              '      <Pais>34</Pais>                                           ' +
              '            <!-- [mandatory] 34=Spain, 351=Portugal -->'
            
              '      <CP>Delivery zipcode</CP>                                 ' +
              '            <!-- [mandatory]format 99999 for Spain, 9999-999 for' +
              ' Portugal -->'
            
              '      <Telefono>delivery phone</Telefono>                       ' +
              '            <!-- [optional] format 999999999999999, not include ' +
              'the country code (+34 for Spain, +33 for France, etc.) -->'
            
              '      <Movil>delivery cellular</Movil>                          ' +
              '            <!-- format 999999999999999 [mandatory for EuroBusin' +
              'essParcel, <Servicio>=74, because it is possible to send a sms. ' +
              'Optional for all other]. Not '
            
              'include the country code (+34 for Spain, +33 for France, etc.) -' +
              '->'
            
              '      <Email>delivery email</Email>                             ' +
              '            <!-- up to 200 characters [mandatory for EuroBusines' +
              'sParcel, <Servicio>=74, optional for all other] -->'
            
              '      <Observaciones>shipment observations</Observaciones>      ' +
              '            <!-- [optional] up to 80 characters -->'
            
              '      <ATT>delivery Contact (useful when delivery name is a busi' +
              'ness)</ATT> <!-- [optional] -->'
            
              '      <Departamento>delivery department</Departamento>          ' +
              '            <!-- [optional] up to 50 characters -->'
            '     </Destinatario>'
            
              '    <Referencias>                                               ' +
              '            <!-- Shipment References (optional but highly recomm' +
              'ended, at less the tipo=C) -->'
            
              '      <Referencia tipo="C">1234567AFG86TY9</Referencia>         ' +
              '            <!-- [one of the two mandatory] Unique shipment/orde' +
              'r reference, up to 15 characters -->'
            '    </Referencias>'
            
              '    <Importes>                                                  ' +
              '            <!-- [optional] -->'
            
              '      <Debidos>0</Debidos>                                      ' +
              '            <!-- [optional] always 0 or missing, ASM decides the' +
              ' price of deliver the shipment -->'
            
              '      <Reembolso>12,35</Reembolso>                              ' +
              '            <!-- [optional] Refunt amount, CAD: cash on delivery' +
              ' (when <Portes>=P) -->'
            '    </Importes>'
            
              '    <Seguro tipo="">                                            ' +
              '            <!-- [optional] Insurance [optional]. 0=No, 1=Normal' +
              'ized, 2=Special value -->'
            
              '      <Descripcion></Descripcion>                               ' +
              '            <!-- [optional] Description Goods insured -->'
            
              '      <Importe>0</Importe>                                      ' +
              '            <!-- [optional] Amount of insured goods (always 0) -' +
              '->'
            '    </Seguro>'
            
              '    <DevuelveAdicionales>                                       ' +
              '            <!-- [optional] in order to return additional data -' +
              '->'
            
              '      <Etiqueta tipo=""></Etiqueta>                             ' +
              '            <!-- [optional] Shipment label: Format to return, po' +
              'ssible values: EPL,DPL,JPG,PNG,PDF. EuroBusinessParcel only work' +
              's with JPG and PDF -->'
            '    </DevuelveAdicionales>'
            #9'<detallebultos>'
            #9#9'<bulto>'
            #9#9#9'<bulto>1</bulto>'
            #9#9#9'<kilos>1,5</kilos>'
            #9#9#9'<largo>56</largo>'
            #9#9#9'<ancho>21,5</ancho>'
            #9#9#9'<alto>7</alto>'
            #9#9#9'<volumen>7</volumen>'
            #9#9#9'<Extra1>Datos1</Extra1>'
            #9#9#9'<Extra2>DAtos2</Extra2>'#9
            #9#9#9'<Extra3>DAtos3</Extra3>'#9#9#9#9#9#9#9
            #9#9'</bulto>'
            #9#9'<bulto>'
            #9#9#9'<bulto>1</bulto>'
            #9#9#9'<kilos>1,5</kilos>'
            #9#9#9'<largo>56</largo>'
            #9#9#9'<ancho>21,5</ancho>'
            #9#9#9'<alto>7</alto>'
            #9#9#9'<volumen>7</volumen>'
            #9#9#9'<Extra1>Datos1</Extra1>'
            #9#9#9'<Extra2>DAtos2</Extra2>'#9
            #9#9#9'<Extra3>DAtos3</Extra3>'#9#9#9#9#9#9#9
            #9#9'</bulto>'#9#9
            #9'</detallebultos>'
            #9'<DescMercancia>'
            
              #9#9'<Item tipo="0">56228^01317EMB2MD^Muchacha con perro blanco^940' +
              '6 90 38^^^1^115.7000^25.0000^^^ES^PCS^0.0000</Item>'
            
              #9#9'<Item tipo="1">56229^01317EMB2MD^Marco de madera natural-01317' +
              '-EMB2MD^9406 90 38^^1^0.0000^0.0000^0.0000^3.5000^3.5000^ES^PCS^' +
              '0.0000</Item>'
            
              #9#9'<Item tipo="2">56230^01319EMB2MD^Dos hombres^9406 90 38^^^1^11' +
              '5.7000^25.0000^^^ES^PCS^0.0000</Item>'
            
              #9#9'<Item tipo="3">56231^01319EMB2MD^Marco de madera natural-01319' +
              '-EMB2MD^9406 90 38^^1^0.0000^0.0000^0.0000^3.5000^3.5000^ES^PCS^' +
              '0.0000</Item>'
            #9'</DescMercancia>'
            #9'<!-- 56228 //ID PRODUCTO -->'
            #9'<!-- 01317EMB2MD //REFERENCIA PRODUCTO -->'
            #9'<!-- Muchacha con perro blanco //NOMBRE DEL PRODUCTO -->'
            #9'<!-- 9406 90 38 //CODIGO ARANCELARIO -->'
            #9'<!-- ^^ //DESCRIPCION CORTA-->'
            #9'<!-- 1 '#9'// UNIDADES DEL PRODUCTO-->'
            #9'<!-- 115.7000'#9'//PRECIO DEL PRODUCTO -->'
            #9'<!-- 25.0000'#9'//IMPUESTOS DEL PRODUCTO -->'
            #9'<!-- ^^'#9'//KILOS DEL PRODUCTO -->'
            #9'<!-- ^^'#9'//VOLUMEN DEL PRODUCTO -->'
            #9'<!-- ES'#9'//PAIS DE FABRICACION DEL PRODUCTO -->'
            #9'<!-- PCS //UNIDAD DEL PRODUCTO FIJO -->'
            #9'<!-- 0.0000 //DESCUENTO DE IMPORTE DEL PRODUCTO -->'
            '  </Envio>'
            '</Servicios>')
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object PNLGLS: TLFPanel
          Left = 0
          Top = 0
          Width = 377
          Height = 165
          Align = alLeft
          TabOrder = 1
          object LFLabel6: TLFLabel
            Left = 21
            Top = 57
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Resource'
          end
          object LFLabel2: TLFLabel
            Left = 18
            Top = 14
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'URL Base'
          end
          object LFLabel5: TLFLabel
            Left = 36
            Top = 35
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Token'
          end
          object LGLSContenido: TLFLabel
            Left = 311
            Top = 97
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Conenido -->'
          end
          object EGLSURLWebService: TLFEdit
            Left = 72
            Top = 10
            Width = 297
            Height = 21
            TabOrder = 0
            Text = 'https://alb.idril.es:8443/Wsintegracion'
            OnChange = EPSURLBaseChange
          end
          object EGLSGUID: TLFEdit
            Left = 72
            Top = 32
            Width = 297
            Height = 21
            TabOrder = 1
            Text = '5D405075-D828-4994-B935-4CF9CF825885'
            OnChange = EPSURLBaseChange
          end
          object CBGLSResource: TComboBox
            Left = 72
            Top = 54
            Width = 297
            Height = 21
            ItemHeight = 13
            ItemIndex = 0
            TabOrder = 2
            Text = 'GrabarServicios'
            OnChange = EPSURLBaseChange
            Items.Strings = (
              'GrabarServicios'
              'EtiquetaEnvioTG'
              'GetExpCliAm')
          end
          object BGLSPost: TButton
            Left = 72
            Top = 80
            Width = 75
            Height = 25
            Caption = 'Post'
            TabOrder = 3
            OnClick = BGLSPostClick
          end
        end
      end
      object TabSheet1: TTabSheet
        ImageIndex = 24
        object MLogSkrit: TMemo
          Left = 377
          Top = 0
          Width = 1018
          Height = 165
          Align = alClient
          Lines.Strings = (
            '<?xml version="1.0" encoding="utf-8"?>'
            ''
            '<!--Notes:'
            '   uidcliente: Customer ID (credentials).'
            '               Test uidcliente included.'
            '               Production uiddcliente will be given by Asm.'
            ''
            '   <Envio>     Do not include more than 20 to be efficient.'
            ''
            
              '   <Servicio>  For value 74 (EuroBusinessParcel). List of countr' +
              'ies (at 08/05/2015):'
            '                   43 - AT - AUSTRIA '
            '                   32 - BE - BELGIUM '
            '                  359 - BG - BULGARIA '
            '                  385 - HR - CROATIA '
            '                  301 - CY - CYPRUS '
            '                   42 - CZ - CZECH REPUBLIC '
            '                   45 - DK - DENMARK '
            '                  360 - EE - ESTONIA '
            '                  358 - FI - FINLAND '
            '                   33 - FR - FRANCE '
            '                   49 - DE - GERMANY '
            '                   30 - GR - GREECE '
            '                   31 - NL - HOLLAND '
            '                   36 - HU - HUNGARY '
            '                  353 - IE  - IRELAND '
            '                   39 - IT - ITALY '
            '                   78 - LV - LATVIA '
            '                   77 - LT - LITHUANIA '
            '                  352 - LU - LUXEMBOURG '
            '                  443 - MT - MALTA '
            '                   48 - PL - POLAND '
            '                   40 - RO - ROMANIA '
            '                    7 - RU - RUSSIA'
            '                  421 - SK - SLOVAKIA '
            '                  386 - SI - SLOVENIA '
            '                   46 - SE - SWEDEN '
            '                  411 - CH - SWITZERLAND'
            '                   44 - GB - UNITED KINGDOM '
            '               '
            
              '               You can use this codes (40 for Romania) or intern' +
              'ational standar ISO code (RO).'
            '               '
            '-->'
            ''
            
              '<Servicios uidcliente="5D405075-D828-4994-B935-4CF9CF825885" xml' +
              'ns="http://WSintegracion/">'
            
              '  <Envio codbarras="">                                          ' +
              '            <!-- [mandatory] Shipment barcode (codbarras is opti' +
              'onal). Usually empty or format 99999999999999. It is what we cal' +
              'l "Common label". The customer '
            
              'prints their labels adapted to the needs of Asm, but do not want' +
              ' send a file to be loaded in Asm (preadvice file or manifest fil' +
              'e), want insert shipments with  webservice. In this case the cli' +
              'ent generates the barcode '
            
              '(starts with 31) according to the rules of nomenclature and cont' +
              'ent indicated by Asm. Tag <PlazaDestino> is necessary in order t' +
              'o include <PlazaDestino>.<Nombre> and <PlazaDestino>.<Nemonico> ' +
              'on label-->'
            
              '    <Fecha>20/04/2024</Fecha>                                   ' +
              '            <!-- [mandatory] Shipment date, format DD/MM/YYYY, >' +
              '= today and usually today -->'
            
              '    <Portes>P</Portes>                                          ' +
              '            <!-- [optional] Postage type (P=prepaid / D=cod), us' +
              'ually "P" -->'
            
              '    <Servicio>1</Servicio>                                      ' +
              '            <!-- [mandatory] Service: 1=Courier, 37=Economy, 74=' +
              'EuroBusinessParcel, 12=International Express, 13=International E' +
              'conomy, ... -->'
            
              '    <Horario>3</Horario>                                        ' +
              '            <!-- [mandatory] Horary:  3=ASM24, 2=ASM14, 18=Econo' +
              'my, 19=ParcelShop... Usual combinations of <Servicio>+<Horario>:' +
              ' 1+3=ASM24, 1+2=ASM14, '
            
              '37+18=Economy, 74+void=EuroBusinessParcel, 12+void=International' +
              ', 1+19=ParcelShop -->'
            
              '    <Bultos>1</Bultos>                                          ' +
              '            <!-- [mandatory] Number of packages of shipment -->'
            
              '    <Peso>4</Peso>                                              ' +
              '            <!-- [mandatory] Weigth -->'
            
              '    <Retorno>0</Retorno>                                        ' +
              '            <!-- [optional] SWAP, collect goods on delivery (0:N' +
              'o, 1:Yes) -->'
            
              '    <Remite>                                                    ' +
              '            <!-- [mandatory] Sender -->'
            
              '      <Plaza></Plaza>                                           ' +
              '            <!-- [optional] Origin agency -->'
            
              '      <Nombre>sender name</Nombre>                              ' +
              '            <!-- [mandatory], up to 80 characters -->'
            
              '      <Direccion>sender address</Direccion>                     ' +
              '            <!-- [mandatory], up to 80 characters -->'
            
              '      <Poblacion>sender city</Poblacion>                        ' +
              '            <!-- [mandatory] -->'
            
              '      <Provincia>sender province</Provincia>                    ' +
              '            <!-- [optional] -->'
            
              '      <Pais>34</Pais>                                           ' +
              '            <!-- [mandatory] always 34=Spain -->'
            
              '      <CP>sender zipcode</CP>                                   ' +
              '            <!-- [mandatory]format 99999 -->'
            
              '      <Telefono>sender phone</Telefono>                         ' +
              '            <!-- [optional] format 9999999999, not include the c' +
              'ountry code (+34 for Spain, +33 for France, etc.) -->'
            
              '      <Movil>sender cellular</Movil>                            ' +
              '            <!-- [optional] format 9999999999, not include the c' +
              'ountry code (+34 for Spain, +33 for France, etc.) -->'
            
              '      <Email>sender email</Email>                               ' +
              '            <!-- [optional] up to 200 characters -->'
            
              '      <Departamento>sender department</Departamento>            ' +
              '            <!-- [optional] up to 50 characters -->'
            
              '      <Observaciones>Notes</Observaciones>                      ' +
              '            <!-- [optional] up to 80 characters -->'
            '    </Remite>'
            
              '    <Destinatario>                                              ' +
              '            <!-- [mandatory] Recipient (consignee) -->'
            
              '      <Nombre>delivery name</Nombre>                            ' +
              '            <!-- [mandatory], up to 80 characters -->'
            
              '      <Direccion>delivery address</Direccion>                   ' +
              '            <!-- [mandatory], up to 80 characters -->'
            
              '      <Poblacion>delivery city</Poblacion>                      ' +
              '            <!-- [mandatory] -->'
            
              '      <Provincia>delivery province</Provincia>                  ' +
              '            <!-- [optional] -->'
            
              '      <Pais>34</Pais>                                           ' +
              '            <!-- [mandatory] 34=Spain, 351=Portugal -->'
            
              '      <CP>Delivery zipcode</CP>                                 ' +
              '            <!-- [mandatory]format 99999 for Spain, 9999-999 for' +
              ' Portugal -->'
            
              '      <Telefono>delivery phone</Telefono>                       ' +
              '            <!-- [optional] format 999999999999999, not include ' +
              'the country code (+34 for Spain, +33 for France, etc.) -->'
            
              '      <Movil>delivery cellular</Movil>                          ' +
              '            <!-- format 999999999999999 [mandatory for EuroBusin' +
              'essParcel, <Servicio>=74, because it is possible to send a sms. ' +
              'Optional for all other]. Not '
            
              'include the country code (+34 for Spain, +33 for France, etc.) -' +
              '->'
            
              '      <Email>delivery email</Email>                             ' +
              '            <!-- up to 200 characters [mandatory for EuroBusines' +
              'sParcel, <Servicio>=74, optional for all other] -->'
            
              '      <Observaciones>shipment observations</Observaciones>      ' +
              '            <!-- [optional] up to 80 characters -->'
            
              '      <ATT>delivery Contact (useful when delivery name is a busi' +
              'ness)</ATT> <!-- [optional] -->'
            
              '      <Departamento>delivery department</Departamento>          ' +
              '            <!-- [optional] up to 50 characters -->'
            '     </Destinatario>'
            
              '    <Referencias>                                               ' +
              '            <!-- Shipment References (optional but highly recomm' +
              'ended, at less the tipo=C) -->'
            
              '      <Referencia tipo="C">1234567AFG86TY9</Referencia>         ' +
              '            <!-- [one of the two mandatory] Unique shipment/orde' +
              'r reference, up to 15 characters -->'
            '    </Referencias>'
            
              '    <Importes>                                                  ' +
              '            <!-- [optional] -->'
            
              '      <Debidos>0</Debidos>                                      ' +
              '            <!-- [optional] always 0 or missing, ASM decides the' +
              ' price of deliver the shipment -->'
            
              '      <Reembolso>12,35</Reembolso>                              ' +
              '            <!-- [optional] Refunt amount, CAD: cash on delivery' +
              ' (when <Portes>=P) -->'
            '    </Importes>'
            
              '    <Seguro tipo="">                                            ' +
              '            <!-- [optional] Insurance [optional]. 0=No, 1=Normal' +
              'ized, 2=Special value -->'
            
              '      <Descripcion></Descripcion>                               ' +
              '            <!-- [optional] Description Goods insured -->'
            
              '      <Importe>0</Importe>                                      ' +
              '            <!-- [optional] Amount of insured goods (always 0) -' +
              '->'
            '    </Seguro>'
            
              '    <DevuelveAdicionales>                                       ' +
              '            <!-- [optional] in order to return additional data -' +
              '->'
            
              '      <Etiqueta tipo=""></Etiqueta>                             ' +
              '            <!-- [optional] Shipment label: Format to return, po' +
              'ssible values: EPL,DPL,JPG,PNG,PDF. EuroBusinessParcel only work' +
              's with JPG and PDF -->'
            '    </DevuelveAdicionales>'
            #9'<detallebultos>'
            #9#9'<bulto>'
            #9#9#9'<bulto>1</bulto>'
            #9#9#9'<kilos>1,5</kilos>'
            #9#9#9'<largo>56</largo>'
            #9#9#9'<ancho>21,5</ancho>'
            #9#9#9'<alto>7</alto>'
            #9#9#9'<volumen>7</volumen>'
            #9#9#9'<Extra1>Datos1</Extra1>'
            #9#9#9'<Extra2>DAtos2</Extra2>'#9
            #9#9#9'<Extra3>DAtos3</Extra3>'#9#9#9#9#9#9#9
            #9#9'</bulto>'
            #9#9'<bulto>'
            #9#9#9'<bulto>1</bulto>'
            #9#9#9'<kilos>1,5</kilos>'
            #9#9#9'<largo>56</largo>'
            #9#9#9'<ancho>21,5</ancho>'
            #9#9#9'<alto>7</alto>'
            #9#9#9'<volumen>7</volumen>'
            #9#9#9'<Extra1>Datos1</Extra1>'
            #9#9#9'<Extra2>DAtos2</Extra2>'#9
            #9#9#9'<Extra3>DAtos3</Extra3>'#9#9#9#9#9#9#9
            #9#9'</bulto>'#9#9
            #9'</detallebultos>'
            #9'<DescMercancia>'
            
              #9#9'<Item tipo="0">56228^01317EMB2MD^Muchacha con perro blanco^940' +
              '6 90 38^^^1^115.7000^25.0000^^^ES^PCS^0.0000</Item>'
            
              #9#9'<Item tipo="1">56229^01317EMB2MD^Marco de madera natural-01317' +
              '-EMB2MD^9406 90 38^^1^0.0000^0.0000^0.0000^3.5000^3.5000^ES^PCS^' +
              '0.0000</Item>'
            
              #9#9'<Item tipo="2">56230^01319EMB2MD^Dos hombres^9406 90 38^^^1^11' +
              '5.7000^25.0000^^^ES^PCS^0.0000</Item>'
            
              #9#9'<Item tipo="3">56231^01319EMB2MD^Marco de madera natural-01319' +
              '-EMB2MD^9406 90 38^^1^0.0000^0.0000^0.0000^3.5000^3.5000^ES^PCS^' +
              '0.0000</Item>'
            #9'</DescMercancia>'
            #9'<!-- 56228 //ID PRODUCTO -->'
            #9'<!-- 01317EMB2MD //REFERENCIA PRODUCTO -->'
            #9'<!-- Muchacha con perro blanco //NOMBRE DEL PRODUCTO -->'
            #9'<!-- 9406 90 38 //CODIGO ARANCELARIO -->'
            #9'<!-- ^^ //DESCRIPCION CORTA-->'
            #9'<!-- 1 '#9'// UNIDADES DEL PRODUCTO-->'
            #9'<!-- 115.7000'#9'//PRECIO DEL PRODUCTO -->'
            #9'<!-- 25.0000'#9'//IMPUESTOS DEL PRODUCTO -->'
            #9'<!-- ^^'#9'//KILOS DEL PRODUCTO -->'
            #9'<!-- ^^'#9'//VOLUMEN DEL PRODUCTO -->'
            #9'<!-- ES'#9'//PAIS DE FABRICACION DEL PRODUCTO -->'
            #9'<!-- PCS //UNIDAD DEL PRODUCTO FIJO -->'
            #9'<!-- 0.0000 //DESCUENTO DE IMPORTE DEL PRODUCTO -->'
            '  </Envio>'
            '</Servicios>')
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object PNLSkrit: TLFPanel
          Left = 0
          Top = 0
          Width = 377
          Height = 165
          Align = alLeft
          TabOrder = 1
          object LFLabel7: TLFLabel
            Left = 21
            Top = 57
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Resource'
          end
          object LFLabel8: TLFLabel
            Left = 18
            Top = 14
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'URL Base'
          end
          object LFLabel9: TLFLabel
            Left = 36
            Top = 35
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Token'
          end
          object LFLabel10: TLFLabel
            Left = 311
            Top = 89
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Conenido -->'
          end
          object LSkritAssociate: TLFLabel
            Left = 21
            Top = 80
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Associate'
          end
          object LSkritClient: TLFLabel
            Left = 41
            Top = 102
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = 'Client'
          end
          object LSkritOpciones: TLFLabel
            Left = 22
            Top = 145
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Opciones'
          end
          object LSkritId: TLFLabel
            Left = 58
            Top = 125
            Width = 9
            Height = 13
            Alignment = taRightJustify
            Caption = 'Id'
          end
          object ESkritURLBase: TLFEdit
            Left = 72
            Top = 10
            Width = 297
            Height = 21
            TabOrder = 0
            Text = 'https://api.erp.skrit.ws'
            OnChange = EPSURLBaseChange
          end
          object ESkritToken: TLFEdit
            Left = 72
            Top = 32
            Width = 297
            Height = 21
            TabOrder = 1
            Text = 
              '6D333128-D2D6-4814-ADFF-F0BBC4151CAF-9B06F069-A2BC-4324-8422-762' +
              '440C5DED3'
            OnChange = EPSURLBaseChange
          end
          object CBSkritResource: TComboBox
            Left = 72
            Top = 54
            Width = 297
            Height = 21
            ItemHeight = 13
            TabOrder = 2
            Text = 'deliveryNotes'
            OnChange = EPSURLBaseChange
            Items.Strings = (
              'deliveryNotes')
          end
          object BSkirPostId: TButton
            Tag = 1
            Left = 288
            Top = 104
            Width = 83
            Height = 25
            Caption = 'Post Id'
            TabOrder = 7
            OnClick = BSkirPostIdClick
          end
          object ESkritAssociate: TLFEdit
            Left = 72
            Top = 76
            Width = 193
            Height = 21
            TabOrder = 3
            Text = 'HER'
            OnChange = EPSURLBaseChange
          end
          object ESkritClient: TLFEdit
            Left = 72
            Top = 98
            Width = 193
            Height = 21
            TabOrder = 4
            Text = '3538'
            OnChange = EPSURLBaseChange
          end
          object EskritOpciones: TLFEdit
            Left = 72
            Top = 142
            Width = 193
            Height = 21
            TabOrder = 6
            Text = '?from=2025-03-14&to=2025-03-14'
            OnChange = EPSURLBaseChange
          end
          object ESkritId: TLFEdit
            Left = 72
            Top = 120
            Width = 193
            Height = 21
            TabOrder = 5
            Text = '202500000000010'
            OnChange = EPSURLBaseChange
          end
          object BSkritPostOpciones: TButton
            Tag = 2
            Left = 288
            Top = 130
            Width = 83
            Height = 25
            Caption = 'Post Opciones'
            TabOrder = 8
            OnClick = BSkirPostIdClick
          end
        end
      end
    end
    object MDebug: TLFMemo
      Left = 2
      Top = 221
      Width = 1403
      Height = 275
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Courier New'
      Font.Style = []
      Lines.Strings = (
        'MDebug')
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 2
    end
  end
  inherited TBActions: TLFToolBar
    Top = 498
    Width = 1407
  end
  inherited CEMain: TControlEdit
    Left = 608
    Top = 0
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 640
    Top = 0
  end
  inherited ALMain: TLFActionList
    Left = 704
    Top = 0
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'EFicheroSubir.Text'
      'EURLEvnioFichero.Text'
      'EURLImagen.Text'
      'EPSURLBase.Text'
      'EPSToken.Text'
      'EPSOpciones.Text')
    Left = 736
    Top = 0
  end
  object Timer: TTimer
    Enabled = False
    OnTimer = TimerTimer
    Left = 544
  end
  object HTTPRIO1: THTTPRIO
    HTTPWebNode.Agent = 'Borland SOAP 1.1'
    HTTPWebNode.UseUTF8InHeader = False
    HTTPWebNode.InvokeOptions = [soIgnoreInvalidCerts]
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody]
    Left = 576
  end
  object IdFTP: TIdFTP
    OnWork = IdFTPWork
    OnWorkBegin = IdFTPWorkBegin
    OnWorkEnd = IdFTPWorkEnd
    IPVersion = Id_IPv4
    ConnectTimeout = 0
    NATKeepAlive.UseKeepAlive = False
    NATKeepAlive.IdleTimeMS = 0
    NATKeepAlive.IntervalMS = 0
    ProxySettings.ProxyType = fpcmNone
    ProxySettings.Port = 0
    Left = 672
  end
  object tmrSafemoney: TTimer
    Enabled = False
    OnTimer = tmrSafemoneyTimer
    Left = 768
  end
end
