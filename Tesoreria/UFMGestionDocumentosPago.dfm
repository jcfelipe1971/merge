inherited FMGestionDocumentosPago: TFMGestionDocumentosPago
  Width = 674
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Gestion de Documentos de Pago'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 664
    Height = 177
    inherited TBMain: TLFToolBar
      Width = 660
      inherited NavMain: THYMNavigator
        DataSource = DMGestionDocumentosPago.DSAgrupacionDocumentos
        Hints.Strings = ()
        EditaControl = DBDEFecha
        InsertaControl = DBDEFecha
      end
      inherited EPMain: THYMEditPanel
        DataSource = DMGestionDocumentosPago.DSAgrupacionDocumentos
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      object ToolButton3: TToolButton
        Left = 319
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object PNLTipo: TLFPanel
        Left = 327
        Top = 0
        Width = 187
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LTipo: TLFLabel
          Left = 10
          Top = 4
          Width = 26
          Height = 13
          Alignment = taRightJustify
          Caption = 'Tipo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object RBTalon: TRadioButton
          Left = 48
          Top = 3
          Width = 60
          Height = 17
          Caption = 'Talon'
          TabOrder = 0
          OnClick = RadioButtonTipoClick
        end
        object RBPagare: TRadioButton
          Left = 120
          Top = 3
          Width = 60
          Height = 17
          Caption = 'Pagare'
          TabOrder = 1
          OnClick = RadioButtonTipoClick
        end
      end
    end
    inherited PCMain: TLFPageControl
      Width = 660
      Height = 147
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 652
          Height = 119
          inherited G2KTableLoc: TG2KTBLoc
            Left = 65
            DataSource = DMGestionDocumentosPago.DSAgrupacionDocumentos
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'EMP_CARTERA_AGRUP_DOC'
            CampoNum = 'RIG'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object LAgrupacion: TLFLabel
            Left = 45
            Top = 20
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Agrupacion'
          end
          object LFecha: TLFLabel
            Left = 69
            Top = 42
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LBanco: TLFLabel
            Left = 68
            Top = 64
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Banco'
          end
          object LTitulo: TLFLabel
            Left = 73
            Top = 86
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = 'Titulo'
          end
          object LImporte: TLFLabel
            Left = 376
            Top = 20
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Importe'
          end
          object DBEAgrupacion: TLFDbedit
            Left = 104
            Top = 16
            Width = 121
            Height = 21
            Color = clInfoBk
            DataField = 'RIG'
            DataSource = DMGestionDocumentosPago.DSAgrupacionDocumentos
            Enabled = False
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 104
            Top = 82
            Width = 433
            Height = 21
            DataField = 'TITULO'
            DataSource = DMGestionDocumentosPago.DSAgrupacionDocumentos
            TabOrder = 3
          end
          object DBEFBanco: TLFDBEditFind2000
            Left = 104
            Top = 60
            Width = 121
            Height = 21
            DataField = 'BANCO'
            DataSource = DMGestionDocumentosPago.DSAgrupacionDocumentos
            TabOrder = 2
            OnChange = DBEFBancoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_BANCOS_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'BANCO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'BANCO')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloBanco: TLFEdit
            Left = 226
            Top = 60
            Width = 311
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 4
          end
          object DBDEFecha: TLFDBDateEdit
            Left = 104
            Top = 38
            Width = 121
            Height = 21
            DataField = 'FECHA'
            DataSource = DMGestionDocumentosPago.DSAgrupacionDocumentos
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 1
          end
          object DBEImporte: TLFDbedit
            Left = 416
            Top = 16
            Width = 121
            Height = 21
            Color = clInfoBk
            DataField = 'IMPORTE'
            DataSource = DMGestionDocumentosPago.DSxInfoActualizada
            Enabled = False
            TabOrder = 5
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 652
          Height = 119
          DataSource = DMGestionDocumentosPago.DSAgrupacionDocumentos
          Columns = <
            item
              Expanded = False
              FieldName = 'RIG'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_EFECTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BANCO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Visible = True
            end>
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 177
    Width = 664
    Height = 231
    inherited TBDetalle: TLFToolBar
      Width = 664
      ParentShowHint = False
      ShowHint = True
      inherited NavDetalle: THYMNavigator
        DataSource = DMGestionDocumentosPago.DSAgrupacionDocumentosDet
        Hints.Strings = ()
      end
      object ToolButton1: TToolButton
        Left = 220
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtGeneraConfirming: TToolButton
        Left = 228
        Top = 0
        Hint = 'Generamos Formato Confirming'
        Caption = 'Genera Confirming'
        DropdownMenu = PPFormatosConfirming
        ImageIndex = 124
        Style = tbsDropDown
      end
      object ToolButton4: TToolButton
        Left = 264
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtPagare: TToolButton
        Left = 272
        Top = 0
        Hint = 'Generamos Formato Pagare'
        Caption = 'Genera Pagare'
        DropdownMenu = PUPagares
        ImageIndex = 124
        Style = tbsDropDown
      end
      object TSep1: TToolButton
        Left = 308
        Top = 0
        Width = 8
        ImageIndex = 31
        Style = tbsSeparator
      end
      object TBMarcarTodos: TToolButton
        Left = 316
        Top = 0
        Action = AMarcarTodos
      end
      object TBBorrarMarcados: TToolButton
        Left = 339
        Top = 0
        Action = ABorrarMarcados
      end
      object ToolButton2: TToolButton
        Left = 362
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBPagaDocumentos: TToolButton
        Left = 370
        Top = 0
        Action = APagaDocumentos
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 664
      Height = 60
      DataSource = DMGestionDocumentosPago.DSAgrupacionDocumentosDet
      PopupMenu = nil
      OnDblClick = DBGFDetalleDblClick
      OnTitleClick = DBGFDetalleTitleClick
      AutoPostEnCheckBox = True
      ColumnasCheckBoxes.Strings = (
        'MARCA')
      ColumnasChecked.Strings = (
        '1')
      ColumnasNoChecked.Strings = (
        '0')
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'EJERCICIO'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DOCUMENTO'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MARCA'
          Width = 36
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'COD_CLI_PRO'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO'
          ReadOnly = True
          Width = 283
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LIQUIDO'
          ReadOnly = True
          Width = 81
          Visible = True
        end>
    end
    object DBGDetalleDocumentos: TDBGridFind2000
      Left = 0
      Top = 82
      Width = 664
      Height = 81
      Align = alBottom
      Color = clInfoBk
      DataSource = DMGestionDocumentosPago.DSDetalleDocumento
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 2
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
      AutoPostEnCheckBox = True
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
        'DOCUMENTO'
        'EJERCICIO')
      ColumnasCheckBoxes.Strings = (
        'MARCA')
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
      Entorno = DMMain.EntornoBusqueda
      Columns = <
        item
          Expanded = False
          FieldName = 'REGISTRO'
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LINEA'
          Width = 39
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'COD_CLI_PRO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VENCIMIENTO'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CTA_PAGO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LIQUIDO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FORMA_PAGO'
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOC_TIPO'
          Width = 53
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOC_SERIE'
          Width = 59
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOC_NUMERO'
          Width = 76
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DOC_FECHA'
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MONEDA'
          Width = 44
          Visible = True
        end>
    end
    object DBGIncidencias: TNsDBGrid
      Left = 0
      Top = 163
      Width = 664
      Height = 68
      Align = alBottom
      Color = clInfoBk
      DataSource = DMGestionDocumentosPago.DSxIncidencias
      ReadOnly = True
      TabOrder = 3
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
      Columns = <
        item
          Expanded = False
          FieldName = 'INCIDENCIA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO_INCIDENCIA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA'
          Width = 109
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Width = 664
  end
  inherited CEMain: TControlEdit
    DataSource = DMGestionDocumentosPago.DSAgrupacionDocumentos
  end
  inherited ALMain: TLFActionList
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AInsertarDocumentos: TAction
      Category = 'Procesos'
      Caption = 'Insertar Documentos'
      Hint = 'Inserta los documentos pendientes'
      ImageIndex = 43
      OnExecute = AInsertarDocumentosExecute
    end
    object AMarcarTodos: TAction
      Category = 'Procesos'
      Caption = 'Marcar Todos'
      Hint = 'Marca todos los documentos'
      ImageIndex = 146
      OnExecute = AMarcarTodosExecute
    end
    object ABorrarMarcados: TAction
      Category = 'Procesos'
      Caption = 'Borrar registros marcados'
      Hint = 'Borra los registros marcados'
      ImageIndex = 27
      OnExecute = ABorrarMarcadosExecute
    end
    object APagaDocumentos: TAction
      Category = 'Procesos'
      Caption = 'Paga Documentos'
      Hint = 'Contabiliza el pago de los documentos marcados'
      ImageIndex = 19
      OnExecute = APagaDocumentosExecute
    end
  end
  inherited CEDetalle: TControlEdit
    DataSource = DMGestionDocumentosPago.DSAgrupacionDocumentosDet
  end
  object PPFormatosConfirming: TPopUpTeclas
    Left = 449
    Top = 49
    object MIConfirmingBBV: TMenuItem
      Caption = 'B. Bilbao Vizcaya'
      Hint = 'Banco Bilbao Vizcaya'
      OnClick = MIBancoConfirmingClick
    end
    object MIConfirmingBSantarder: TMenuItem
      Tag = 1
      Caption = 'B. Santarder'
      Hint = 'Banco Santander'
      OnClick = MIBancoConfirmingClick
    end
    object MIConfirmingBCentralHispano: TMenuItem
      Tag = 2
      Caption = 'B. Central Hispano'
      Hint = 'Banco Central Hispano'
      OnClick = MIBancoConfirmingClick
    end
    object MIConfirmingBGuipuzcoano: TMenuItem
      Tag = 3
      Caption = 'B. Guipuzcoano'
      Hint = 'Banco Guipuzcoano'
      OnClick = MIBancoConfirmingClick
    end
    object MIConfirmingBdeValencia: TMenuItem
      Tag = 4
      Caption = 'B. de Valencia'
      Hint = 'Banco de Valencia'
      OnClick = MIBancoConfirmingClick
    end
    object MIConfirmingBBanesto: TMenuItem
      Tag = 5
      Caption = 'B. Banesto'
      Hint = 'B. Banesto'
      OnClick = MIBancoConfirmingClick
    end
    object MIConfirmingBSabadell: TMenuItem
      Tag = 6
      Caption = 'B. Sabadell'
      Hint = 'B. Sabadell'
      OnClick = MIBancoConfirmingClick
    end
    object MIConfirmingBankinter: TMenuItem
      Tag = 7
      Caption = 'Bankinter'
      Hint = 'Bankinter'
      OnClick = MIBancoConfirmingClick
    end
    object MIConfirmingBPopular: TMenuItem
      Tag = 8
      Caption = 'B. Popular'
      Hint = 'B. Popular'
      OnClick = MIBancoConfirmingClick
    end
    object MIConfirmingLaCaixa: TMenuItem
      Tag = 9
      Caption = 'La Caixa'
      Hint = 'La Caixa'
      OnClick = MIBancoConfirmingClick
    end
  end
  object PUPagares: TPopupMenu
    Left = 488
    Top = 48
    object MIPagareSabadell: TMenuItem
      Tag = 6
      Caption = 'B. Sabadell'
      OnClick = MIBancoPagareClick
    end
    object MIPagareLaCaixa: TMenuItem
      Tag = 9
      Caption = 'La Caixa'
      OnClick = MIBancoPagareClick
    end
  end
end
