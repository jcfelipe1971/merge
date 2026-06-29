inherited FMRCVCompra: TFMRCVCompra
  Left = 301
  Top = 240
  Width = 1210
  Height = 536
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'DTE Compras'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1200
    Height = 483
    inherited TBMain: TLFToolBar
      Width = 1196
      inherited NavMain: THYMNavigator
        DataSource = DMRCVCompra.DSQMQMRCV_COMPRA
        Hints.Strings = ()
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 288
      end
      inherited TbuttComp: TToolButton
        Left = 296
      end
      object TBSep1: TToolButton
        Left = 319
        Top = 0
        Width = 8
        ImageIndex = 25
        Style = tbsSeparator
      end
      object TButtMarcarTodas: TToolButton
        Left = 327
        Top = 0
        Caption = 'TButtMarcarTodas'
        ImageIndex = 146
        OnClick = TButtMarcarTodasClick
      end
      object TButtDesMarcarTodas: TToolButton
        Left = 350
        Top = 0
        Caption = 'TButtDesMarcarTodas'
        ImageIndex = 147
        OnClick = TButtDesMarcarTodasClick
      end
      object PNLFiltroFolio: TLFPanel
        Left = 373
        Top = 0
        Width = 150
        Height = 21
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 2
        object LFolio: TLFLabel
          Left = 0
          Top = 3
          Width = 22
          Height = 13
          Alignment = taRightJustify
          Caption = 'Folio'
        end
        object EFolio: TLFEdit
          Left = 27
          Top = 0
          Width = 123
          Height = 21
          TabOrder = 0
          OnKeyPress = EFolioKeyPress
        end
      end
      object TBSep2: TToolButton
        Left = 523
        Top = 0
        Width = 8
        ImageIndex = 26
        Style = tbsSeparator
      end
      object PNLFiltroPeriodo: TLFPanel
        Left = 531
        Top = 0
        Width = 376
        Height = 22
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 3
        object LPeriodo: TLFLabel
          Left = 104
          Top = 3
          Width = 36
          Height = 13
          Alignment = taRightJustify
          Caption = 'Periodo'
        end
        object LEjercicio: TLFLabel
          Left = 0
          Top = 3
          Width = 40
          Height = 13
          Alignment = taRightJustify
          Caption = 'Ejercicio'
        end
        object EFPeriodo: TLFEditFind2000
          Left = 143
          Top = 0
          Width = 39
          Height = 22
          AutoSize = False
          TabOrder = 0
          OnChange = EFPeriodoChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'PERIODO'
          CampoStr = 'TITULO'
          CondicionBusqueda = 'TIPO = 1'
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
        object ETituloPeriodo: TLFEdit
          Left = 183
          Top = 0
          Width = 193
          Height = 22
          TabStop = False
          AutoSize = False
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object EFEjercicio: TLFEditFind2000
          Left = 44
          Top = 0
          Width = 51
          Height = 21
          AutoSize = False
          TabOrder = 2
          OnChange = EFEjercicioChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'EJERCICIO'
          CampoStr = 'EJERCICIO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'EMP_EJERCICIOS'
          Tabla_asociada.DesplegarBusqueda = False
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
      end
      object TBSep3: TToolButton
        Left = 907
        Top = 0
        Width = 8
        ImageIndex = 19
        Style = tbsSeparator
      end
    end
    object PCMain: TLFPageControl
      Left = 2
      Top = 28
      Width = 1196
      Height = 453
      ActivePage = TSDocumentos
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 1
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSDocumentos: TTabSheet
        Caption = 'Documentos'
        object DBGCompras: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 1188
          Height = 403
          Align = alClient
          Color = clInfoBk
          DataSource = DMRCVCompra.DSQMQMRCV_COMPRA
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGComprasCellClick
          OnDrawColumnCell = DBGComprasDrawColumnCell
          OnDblClick = DBGComprasDblClick
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
          Transaction = DMEnviaxmLfacturasChl.TLocal
          BuscarNums = False
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'AGENTE'
            'B_DTO_LINEAS'
            'CLIENTE'
            'CODIGO_GIRO_CLIENTE'
            'CODIGO_GIRO_EMPRESA'
            'ENTRADA_FACTURACION'
            'ESTADO'
            'FECHA'
            'FECHA_CON'
            'FOLIO'
            'FORMA_PAGO'
            'LIQUIDO'
            'NIF'
            'NOMBRE_COMERCIAL'
            'RAZONREF'
            'RIG'
            'SERIE'
            'SU_REFERENCIA'
            'TERCERO'
            'TIPO_DOC_TRIBUTARIO'
            'TITULO'
            'TOTAL_A_COBRAR'
            'TIPO'
            'FECHA_DOCTO'
            'FECHA_RECLAMO'
            'MONTO_TOTAL'
            'ACEPTADO_CLIENTE'
            'CANTIDAD_ERRORES'
            'ESTADO_SII'
            'SII_TRACKID'
            'GLOSA'
            'GLOSA_ERR')
          ColumnasCheckBoxes.Strings = (
            'XML_RECIBIDO'
            'PDF_RECIBIDO'
            'ENTRADA_SELECCION')
          ColumnasChecked.Strings = (
            '1'
            '1'
            '1')
          ColumnasNoChecked.Strings = (
            '0'
            '0'
            '0')
          MensajeNoExiste = False
          SalirSiVacio = False
          SalirSiNoExiste = False
          Posicion = tpCentrado
          OrdenMultiple = True
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'RUT_PROVEEDOR'
              ReadOnly = True
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE_R_SOCIAL'
              ReadOnly = True
              Width = 350
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_DOCTO'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_DOC'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FOLIO'
              ReadOnly = True
              Width = 100
              Visible = True
            end
            item
              Color = clWindow
              Expanded = False
              FieldName = 'ENTRADA_SELECCION'
              Width = 43
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_RECEPCION'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_ACUSE'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TASA_IVA'
              ReadOnly = True
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IVA'
              ReadOnly = True
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MONTO_EXENTO'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MONTO_NETO'
              ReadOnly = True
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MONTO_TOTAL'
              ReadOnly = True
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RIG'
              ReadOnly = True
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'XML_RECIBIDO'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PDF_RECIBIDO'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_E'
              ReadOnly = True
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TERCERO'
              ReadOnly = True
              Width = 50
              Visible = True
            end>
        end
        object TBFiltros: TLFToolBar
          Left = 0
          Top = 0
          Width = 1188
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
          ShowHint = True
          TabOrder = 1
          Wrapable = False
          Separators = True
          object TButtFiltrar: TToolButton
            Left = 0
            Top = 0
            Hint = 'FIltrar'
            Caption = 'Filtrar'
            ImageIndex = 5
            OnClick = TButtFiltrarClick
          end
          object TBButtLimpiarFiltos: TToolButton
            Left = 23
            Top = 0
            Hint = 'Limpiar Filtros'
            Caption = 'Limpiar Filtos'
            ImageIndex = 6
            OnClick = TBButtLimpiarFiltosClick
          end
          object PNLRUTProveedor: TLFPanel
            Left = 46
            Top = 0
            Width = 201
            Height = 21
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 0
            object LRUTProveedor: TLFLabel
              Left = 0
              Top = 3
              Width = 75
              Height = 13
              Alignment = taRightJustify
              Caption = 'RUT Proveedor'
              Layout = tlCenter
            end
            object ERUTProveedor: TLFEdit
              Left = 80
              Top = 0
              Width = 121
              Height = 21
              AutoSize = False
              TabOrder = 0
            end
          end
          object TBSep4: TToolButton
            Left = 247
            Top = 0
            Width = 8
            ImageIndex = 27
            Style = tbsSeparator
          end
          object PNLFIltros: TPanel
            Left = 255
            Top = 0
            Width = 302
            Height = 21
            Align = alTop
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 1
            object LTipoDocumentoTributario: TLFLabel
              Left = 10
              Top = 3
              Width = 71
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tipo Doc. Trib.'
            end
            object EFTipoDocumentoTributario: TLFEditFind2000
              Left = 87
              Top = 0
              Width = 64
              Height = 21
              AutoSize = False
              TabOrder = 0
              OnChange = EFTipoDocumentoTributarioChange
              Base_de_datos = DMMain.DataBase
              Transaction = DMMain.TLocal
              BuscarNums = False
              BuscarChars = True
              AutoCambiarFoco = False
              CampoNum = 'CODIGO'
              CampoStr = 'TITULO'
              Posicion = tpCentrado
              ReemplazarCaracter = True
              SalirSiVacio = True
              SalirSiNoExiste = False
              Tabla_a_buscar = 'SII_TIPO_DOCUMENTO_TRIBUTARIO'
              Tabla_asociada.DesplegarBusqueda = False
              OnBusqueda = EFTipoDocumentoTributarioBusqueda
              OrdenadoPor.Strings = (
                'CODIGO')
              Filtros = []
            end
            object ETipoDocumentoTributario: TLFEdit
              Left = 152
              Top = 0
              Width = 147
              Height = 21
              TabStop = False
              AutoSize = False
              Color = clInfoBk
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
          end
          object CBDocumentosPendientes: TLFCheckBox
            Left = 557
            Top = 0
            Width = 140
            Height = 22
            Caption = 'Documentos Pendientes'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 2
            TabStop = True
            Alignment = taLeftJustify
            OnChange = CBDocumentosPendientesChange
          end
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 483
    Width = 1200
  end
  inherited CEMain: TControlEdit
    Left = 936
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 884
    Top = 12
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 992
    Top = 8
    object Importar_Excel: TAction
      Category = 'Procesos'
      Caption = 'Importar Excel'
      OnExecute = Importar_ExcelExecute
    end
    object AEnviaAcuseDeRecibo: TAction
      Category = 'Procesos'
      Caption = 'Envia acuse de recibo a proveedor'
      Hint = 'Envia acuse de recibo a proveedor'
      ImageIndex = 87
      OnExecute = AEnviaAcuseDeReciboExecute
    end
    object ACreaDteDesdeXml: TAction
      Category = 'Procesos'
      Caption = 'Crea Dte desde Xml'
      OnExecute = ACreaDteDesdeXmlExecute
    end
    object AGeneraFacturasMarcadas: TAction
      Category = 'Procesos'
      Caption = 'Genera facturas marcadas'
      ImageIndex = 46
      OnExecute = AGeneraFacturasMarcadasExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 824
    Top = 0
  end
end
