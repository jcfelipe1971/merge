inherited FMImprimirCodBarras: TFMImprimirCodBarras
  Left = 421
  Top = 191
  Width = 1037
  Height = 414
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Mantenimiento de Impresi'#243'n de C'#243'digos de Barras'
  Constraints.MinHeight = 355
  Constraints.MinWidth = 1037
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1027
    Height = 121
    inherited TBMain: TLFToolBar
      Width = 1023
      inherited NavMain: THYMNavigator
        DataSource = DMImprimirCodBarras.DSQMImpCBCabecera
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBETitulo
      end
      inherited EPMain: THYMEditPanel
        Width = 23
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 251
      end
      inherited TbuttComp: TToolButton
        Left = 259
      end
    end
    inherited PCMain: TLFPageControl
      Width = 1023
      Height = 91
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 1015
          Height = 65
          Align = alTop
          object LBLNRegistro: TLFLabel
            Left = 8
            Top = 10
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo'
          end
          object LBLNombreFicha: TLFLabel
            Left = 4
            Top = 32
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nombre'
          end
          object LTipoDocumento: TLFLabel
            Left = 492
            Top = 10
            Width = 79
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Documento'
          end
          object LIdDocumento: TLFLabel
            Left = 504
            Top = 32
            Width = 67
            Height = 13
            Alignment = taRightJustify
            Caption = 'Id Documento'
          end
          object DBECodBarras: TLFDbedit
            Left = 47
            Top = 6
            Width = 59
            Height = 21
            Color = clInfoBk
            DataField = 'NUMERO'
            DataSource = DMImprimirCodBarras.DSQMImpCBCabecera
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
          object DBETitulo: TLFDbedit
            Left = 47
            Top = 28
            Width = 438
            Height = 21
            DataField = 'TITULO'
            DataSource = DMImprimirCodBarras.DSQMImpCBCabecera
            TabOrder = 1
          end
          object DBCBTipoDocumento: TLFDBComboBoxValue
            Left = 577
            Top = 6
            Width = 88
            Height = 21
            DataField = 'TIPO_DOC'
            DataSource = DMImprimirCodBarras.DSQMImpCBCabecera
            DropDownCount = 10
            ItemHeight = 13
            Items.Strings = (
              'OFP'
              'OFC'
              'PEP'
              'ALP'
              'FAP'
              'OFC'
              'PEC'
              'ALB'
              'FAC')
            Values.Strings = (
              'OFP'
              'OFC'
              'PEP'
              'ALP'
              'FAP'
              'OFC'
              'PEC'
              'ALB'
              'FAC')
            TabOrder = 2
            OnChange = DBCBTipoDocumentoChange
          end
          object ETipoDocumento: TLFEdit
            Left = 666
            Top = 6
            Width = 199
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 3
            Text = 'EDocumento'
          end
          object DBEFIdDocumento: TLFFibDBEditFind
            Left = 577
            Top = 28
            Width = 88
            Height = 21
            DataField = 'ID_DOC'
            DataSource = DMImprimirCodBarras.DSQMImpCBCabecera
            TabOrder = 4
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'GES_CABECERAS_S'
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'EJERCICIO')
            CampoNum = 'RIG'
            CampoStr = 'SERIE'
            CampoADevolver = 'ID_S'
            ReemplazarCaracter = True
            SalirSiNoExiste = True
            SalirSiVacio = True
            OnBusqueda = DBEFIdDocumentoBusqueda
            OrdenadoPor.Strings = (
              'EJERCICIO DESC, SERIE, RIG')
          end
          object DBEDocumento: TLFDbedit
            Left = 666
            Top = 28
            Width = 199
            Height = 21
            Color = clInfoBk
            DataField = 'DOCUMENTO'
            DataSource = DMImprimirCodBarras.DSQMImpCBCabecera
            Enabled = False
            TabOrder = 5
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 1015
          Height = 63
          DataSource = DMImprimirCodBarras.DSQMImpCBCabecera
          Columns = <
            item
              Expanded = False
              FieldName = 'NUMERO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 409
              Visible = True
            end>
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 121
    Width = 1027
    Height = 240
    inherited TBDetalle: TLFToolBar
      Width = 1027
      EdgeInner = esNone
      EdgeOuter = esNone
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      DesignSize = (
        1027
        22)
      inherited NavDetalle: THYMNavigator
        DataSource = DMImprimirCodBarras.DSQMImpCBDetalle
        Hints.Strings = ()
        Exclusivo = True
      end
      object TBSep1: TToolButton
        Left = 220
        Top = 0
        Width = 8
        ImageIndex = 25
        Style = tbsSeparator
      end
      object TButtInfoStock: TToolButton
        Left = 228
        Top = 0
        Hint = 'Informacion de Stock'
        Caption = 'Informacion de Stock'
        ImageIndex = 1
        OnClick = TButtInfoStockClick
      end
      object TBSep2: TToolButton
        Left = 251
        Top = 0
        Width = 6
        Style = tbsSeparator
      end
      object LListados: TLFLabel
        Left = 257
        Top = 0
        Width = 50
        Height = 22
        Alignment = taCenter
        Anchors = [akLeft]
        AutoSize = False
        Caption = 'Listado'
        Layout = tlCenter
      end
      object CBListado: TLFComboBox
        Left = 307
        Top = 0
        Width = 302
        Height = 21
        BevelEdges = [beTop]
        Anchors = [akTop]
        ItemHeight = 13
        TabOrder = 1
      end
      object TBSep3: TToolButton
        Left = 609
        Top = 0
        Width = 8
        ImageIndex = 39
        Style = tbsSeparator
      end
      object PNLEtiqVacias: TLFPanel
        Left = 617
        Top = 0
        Width = 121
        Height = 22
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 2
        object LEtiqVacias: TLFLabel
          Left = 0
          Top = 0
          Width = 79
          Height = 22
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Etiquetas Vacias'
          Layout = tlCenter
        end
        object EEtiqVacias: TLFEdit
          Left = 85
          Top = 0
          Width = 36
          Height = 21
          TabOrder = 0
          Text = '0'
        end
      end
      object TBSep4: TToolButton
        Left = 738
        Top = 0
        Width = 8
        ImageIndex = 39
        Style = tbsSeparator
      end
      object TBImprimirEtiquetas: TToolButton
        Left = 746
        Top = 0
        Action = AImprimirCodBarras
        Caption = 'Imprimir etiqueta'
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 833
      Height = 218
      DataSource = DMImprimirCodBarras.DSQMImpCBDetalle
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
      TabOrder = 0
      OnCellClick = DBGFDetalleCellClick
      OnColEnter = DBGFDetalleColEnter
      OnDrawColumnCell = DBGFDetalleDrawColumnCell
      OnDblClick = DBGFDetalleDblClick
      UsaDicG2K = False
      BuscarChars = False
      Campos.Strings = (
        'ARTICULO'
        'COD_BARRAS'
        'TARIFA'
        'ARTICULO')
      CamposAMostrar.Strings = (
        'ARTICULO'
        '0'
        'COD_BARRAS'
        '0'
        'TARIFA'
        '0'
        'ARTICULO'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0'
        '0'
        '0'
        '0')
      CamposADevolver.Strings = (
        'ARTICULO'
        ''
        ''
        '')
      CamposDesplegar.Strings = (
        '0'
        '1'
        '1'
        '1')
      CamposAOrdernar.Strings = (
        'ARTICULO'
        'FECHA'
        'ALFA_6')
      Numericos.Strings = (
        'BARRAS'
        'BARRAS'
        'TARIFA'
        'ARTICULO')
      SalirSiVacio = True
      SalirSiNoExiste = True
      Tablas.Strings = (
        'VER_ARTICULOS_CON_BARRAS'
        'ART_ARTICULOS_BARRAS'
        'ART_TARIFAS_C'
        'VER_ARTICULOS_EF')
      Acciones.Strings = (
        ''
        ''
        ''
        '')
      Titulos.Strings = (
        'TITULO'
        'BARRAS'
        'TITULO'
        'TITULO')
      OnBusqueda = DBGFDetalleBusqueda
      OnCampoDevuelve = DBGFDetalleCampoDevuelve
      Planes.Strings = (
        ''
        ''
        ''
        '')
      OrdenadosPor.Strings = (
        'TITULO'
        'TITULO'
        'TITULO'
        'TITULO')
      Filtros = [obEmpresa]
      Columns = <
        item
          Expanded = False
          FieldName = 'ARTICULO'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ALFA_6'
          Width = 100
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NUM_COPIAS'
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LOTE'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'FECHA'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPO'
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PESO'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TARIFA'
          Width = 34
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECIO_VENTA'
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'IMPORTE_VENTA'
          ReadOnly = True
          Width = 71
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO'
          ReadOnly = True
          Width = 300
          Visible = True
        end>
    end
    object PNLImagen: TLFPanel
      Left = 833
      Top = 22
      Width = 194
      Height = 218
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
      object ICodBarras: TImage
        Left = 0
        Top = 13
        Width = 194
        Height = 164
        Align = alClient
        Center = True
        Proportional = True
        Stretch = True
      end
      object LCodigoDeBarras: TLFLabel
        Left = 0
        Top = 0
        Width = 194
        Height = 13
        Align = alTop
        Alignment = taCenter
        Caption = 'C'#243'digo de Barras'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object PNLEditCodigo: TLFPanel
        Left = 0
        Top = 177
        Width = 194
        Height = 41
        Align = alBottom
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 0
        DesignSize = (
          194
          41)
        object AuxCodBarras: THYDBEdit
          Left = 8
          Top = 12
          Width = 179
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          DataField = 'COD_BARRAS'
          DataSource = DMImprimirCodBarras.DSQMImpCBDetalle
          Enabled = True
          TabOrder = 0
          OnChange = AuxCodBarrasChange
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 361
    Width = 1027
  end
  inherited CEMain: TControlEdit
    Left = 72
    Top = 300
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 72
    Top = 332
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 6
    Top = 300
    object AVisualizarCodBarras: TAction
      Category = 'Listados'
      Caption = 'Visualizar C'#243'digos de Barras'
      Hint = 'Visualizar C'#243'digos de Barras'
      ImageIndex = 38
      OnExecute = AVisualizarCodBarrasExecute
    end
    object AConfRapida: TAction
      Category = 'Listados'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      Hint = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
      OnExecute = AConfRapidaExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AImprimirCodBarras: TAction
      Category = 'Listados'
      Caption = 'Imprimir C'#243'digos de Barras'
      Hint = 'Imprimir C'#243'digos de Barras'
      ImageIndex = 38
      OnExecute = AImprimirCodBarrasExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AUnaEtiqueta: TAction
      Category = 'Procesos'
      Caption = 'Una Etiqueta por linea'
      Hint = 'Establece el nro. de copias a imprimir a 1'
      ImageIndex = 57
      OnExecute = AUnaEtiquetaExecute
    end
    object AEtiquetasPorUnidades: TAction
      Category = 'Procesos'
      Caption = 'Tantas etiquetas como unidades'
      Hint = 'Establece el nro. de copias segun las unidades de la l'#237'na'
      ImageIndex = 87
      OnExecute = AEtiquetasPorUnidadesExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 39
    Top = 300
  end
  inherited CEDetalle: TControlEdit
    Left = 106
    Top = 300
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 106
    Top = 332
  end
  object CodBarras: TCodeBar
    Alto = 100
    OrigenY = 0
    OrigenX = 0
    Modulo = 1
    Ratio = 2
    ChequearDigito = False
    TipoChequeo = csmModulo10
    Porcentaje = 20
    Fuente.Charset = DEFAULT_CHARSET
    Fuente.Color = clWindowText
    Fuente.Height = -11
    Fuente.Name = 'MS Sans Serif'
    Fuente.Style = []
    DigitoControl = ' '
    Left = 6
    Top = 332
  end
end
