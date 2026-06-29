inherited ObrFMPartidasPlantilla: TObrFMPartidasPlantilla
  Left = 293
  Top = 167
  Caption = 'Formulario de Plantilla de Partidas'
  ClientHeight = 422
  ClientWidth = 590
  PopupMenu = CENotasPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 590
    Height = 202
    inherited TBMain: TLFToolBar
      Width = 586
      inherited NavMain: THYMNavigator
        DataSource = ObrDMPartidasPlantilla.DSQMCabecera
        Hints.Strings = ()
        EditaControl = DBEFPartida
        InsertaControl = DBEFPartida
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
    end
    inherited PCMain: TLFPageControl
      Width = 586
      Height = 172
      ActivePage = TSNotas
      TabIndex = 1
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 578
          Height = 144
          inherited G2KTableLoc: TG2KTBLoc
            Left = 74
            Top = 43
          end
          object LPartida: TLFLabel
            Left = 140
            Top = 14
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Partida'
          end
          object LCantidad: TLFLabel
            Left = 27
            Top = 36
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cantidad'
          end
          object LMedida1: TLFLabel
            Left = 26
            Top = 58
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Medida 1'
          end
          object LMedida2: TLFLabel
            Left = 189
            Top = 58
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Medida 2'
          end
          object LMedida3: TLFLabel
            Left = 355
            Top = 58
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Medida 3'
          end
          object LPVenta: TLFLabel
            Left = 11
            Top = 90
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'P. Venta Ud.'
          end
          object LPCoste: TLFLabel
            Left = 11
            Top = 112
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'P. Coste Ud.'
          end
          object LTotalVenta: TLFLabel
            Left = 179
            Top = 90
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = 'Total Venta'
          end
          object LTotalCoste: TLFLabel
            Left = 179
            Top = 112
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Total Coste'
          end
          object LMargenAbsoluto: TLFLabel
            Left = 342
            Top = 90
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Margen Abs.'
          end
          object LMargenPorcentual: TLFLabel
            Left = 344
            Top = 112
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Margen Por.'
          end
          object LCodigo: TLFLabel
            Left = 36
            Top = 14
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo'
          end
          object DBChkBDefecto: TLFDBCheckBox
            Left = 507
            Top = 12
            Width = 60
            Height = 17
            Caption = 'Defecto'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 6
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'DEFECTO'
            DataSource = ObrDMPartidasPlantilla.DSQMCabecera
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBECodigo: TLFDbedit
            Left = 74
            Top = 11
            Width = 50
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'CODIGO'
            DataSource = ObrDMPartidasPlantilla.DSQMCabecera
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 7
          end
          object DBEDescripcion: TLFDbedit
            Left = 229
            Top = 11
            Width = 207
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = ObrDMPartidasPlantilla.DSQMCabecera
            TabOrder = 1
          end
          object DBEFPartida: TLFDBEditFind2000
            Left = 178
            Top = 11
            Width = 50
            Height = 21
            DataField = 'PARTIDA'
            DataSource = ObrDMPartidasPlantilla.DSQMCabecera
            TabOrder = 0
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'OBR_SYS_PARTIDA'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'PARTIDA'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object DBECantidad: TLFDbedit
            Left = 74
            Top = 33
            Width = 50
            Height = 21
            DataField = 'CANTIDAD'
            DataSource = ObrDMPartidasPlantilla.DSQMCabecera
            TabOrder = 2
          end
          object DBEMedida1: TLFDbedit
            Left = 74
            Top = 55
            Width = 100
            Height = 21
            DataField = 'MEDIDA_1'
            DataSource = ObrDMPartidasPlantilla.DSQMCabecera
            TabOrder = 3
          end
          object DBEMedida2: TLFDbedit
            Left = 238
            Top = 55
            Width = 100
            Height = 21
            DataField = 'MEDIDA_2'
            DataSource = ObrDMPartidasPlantilla.DSQMCabecera
            TabOrder = 4
          end
          object DBEMedida3: TLFDbedit
            Left = 404
            Top = 55
            Width = 100
            Height = 21
            DataField = 'MEDIDA_3'
            DataSource = ObrDMPartidasPlantilla.DSQMCabecera
            TabOrder = 5
          end
          object DBEPVenta: TLFDbedit
            Left = 74
            Top = 87
            Width = 75
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'P_VENTA'
            DataSource = ObrDMPartidasPlantilla.DSxInfoActualizada
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 8
          end
          object DBEPCoste: TLFDbedit
            Left = 74
            Top = 109
            Width = 75
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'P_COSTE'
            DataSource = ObrDMPartidasPlantilla.DSxInfoActualizada
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 9
          end
          object DBETotVenta: TLFDbedit
            Left = 238
            Top = 87
            Width = 75
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TOTAL_VENTA'
            DataSource = ObrDMPartidasPlantilla.DSxInfoActualizada
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 10
          end
          object DBETotCoste: TLFDbedit
            Left = 238
            Top = 109
            Width = 75
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TOTAL_COSTE'
            DataSource = ObrDMPartidasPlantilla.DSxInfoActualizada
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 11
          end
          object DBEMargenAbs: TLFDbedit
            Left = 404
            Top = 87
            Width = 75
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'MARGEN_ABS'
            DataSource = ObrDMPartidasPlantilla.DSxInfoActualizada
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 12
          end
          object DBEMargenPor: TLFDbedit
            Left = 404
            Top = 109
            Width = 75
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'MARGEN_POR'
            DataSource = ObrDMPartidasPlantilla.DSxInfoActualizada
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 13
          end
        end
      end
      object TSNotas: TTabSheet [1]
        Caption = '&Notas'
        ImageIndex = 2
        object TBNotas: TLFToolBar
          Left = 0
          Top = 0
          Width = 578
          Height = 24
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 0
          Separators = True
          object NavNotas: THYMNavigator
            Left = 0
            Top = 0
            Width = 80
            Height = 22
            DataSource = ObrDMPartidasPlantilla.DSQMCabecera
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CENotasPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = LFDBNotas
            Exclusivo = True
            ControlEdit = CENotas
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object LFPanelNotas: TLFPanel
          Left = 0
          Top = 24
          Width = 578
          Height = 120
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object LFDBNotas: TLFDBMemo
            Left = 0
            Top = 0
            Width = 578
            Height = 120
            Align = alClient
            DataField = 'NOTAS'
            DataSource = ObrDMPartidasPlantilla.DSQMCabecera
            TabOrder = 0
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 578
          Height = 144
          DataSource = ObrDMPartidasPlantilla.DSQMCabecera
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 202
    Width = 590
    Height = 196
    inherited TBDetalle: TLFToolBar
      Width = 590
      EdgeInner = esNone
      EdgeOuter = esNone
      inherited NavDetalle: THYMNavigator
        DataSource = ObrDMPartidasPlantilla.DSQMDetalle
        Hints.Strings = ()
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 590
      Height = 174
      DataSource = ObrDMPartidasPlantilla.DSQMDetalle
      PopupMenu = nil
      IniStorage = FSMain
      ColumnaInicial = 2
      Campos.Strings = (
        'ARTICULO')
      CamposAMostrar.Strings = (
        'ARTICULO'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0')
      CamposADevolver.Strings = (
        '')
      CamposDesplegar.Strings = (
        '1')
      Numericos.Strings = (
        'ARTICULO')
      Tablas.Strings = (
        'ART_ARTICULOS')
      Acciones.Strings = (
        '')
      Titulos.Strings = (
        'TITULO')
      Planes.Strings = (
        '')
      OrdenadosPor.Strings = (
        '')
      Filtros = [obEmpresa]
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LINEA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ORDEN'
          Width = 36
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ARTICULO'
          Width = 87
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPCION'
          Width = 247
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANTIDAD'
          Width = 48
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MEDIDA_1'
          Width = 113
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MEDIDA_2'
          Width = 105
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MEDIDA_3'
          Width = 102
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'P_VENTA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCUENTO'
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TOTAL_VENTA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'P_COSTE'
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TOTAL_COSTE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'MARGEN_ABS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'MARGEN_POR'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 398
    Width = 590
  end
  inherited CEMain: TControlEdit
    EnlazadoA = nil
    Left = 416
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 452
    Top = 4
  end
  inherited ALMain: TLFActionList
    Left = 332
    Top = 24
  end
  inherited FSMain: TLFFibFormStorage
    Left = 372
    Top = 24
  end
  inherited CEDetalle: TControlEdit
    Left = 416
    Top = 76
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 452
    Top = 76
  end
  object CENotas: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSNotas
    FichaExclusiva = TSNotas
    PanelEdicion = LFPanelNotas
    PopUpMenu = CENotasPMEdit
    Teclas = DMMain.Teclas
    Left = 416
    Top = 40
  end
  object CENotasPMEdit: TPopUpTeclas
    Left = 452
    Top = 40
    object CENotasMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CENotasMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CENotasMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CENotasMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CENotasMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CENotasMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CENotasMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CENotasMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CENotasMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CENotasMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
