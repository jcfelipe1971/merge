inherited ObrFMPartidasOferta: TObrFMPartidasOferta
  Left = 259
  Top = 181
  Caption = 'Partidas en Oferta de Cliente'
  ClientHeight = 422
  ClientWidth = 590
  PopupMenu = ControlEdit1PMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 590
    Height = 234
    inherited TBMain: TLFToolBar
      Width = 586
      inherited NavMain: THYMNavigator
        DataSource = ObrDMPartidasOferta.DSQMCabPlantilla
        Hints.Strings = ()
        EditaControl = DBECantidad
        InsertaControl = EFPlantilla
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
      end
      object PnlOferta: TLFPanel
        Left = 319
        Top = 0
        Width = 114
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LblOferta: TLFLabel
          Left = 10
          Top = 4
          Width = 44
          Height = 13
          Caption = 'N'#186' Oferta'
        end
        object DBEOferta: TLFDbedit
          Left = 59
          Top = 0
          Width = 50
          Height = 21
          TabStop = False
          Color = clInfoBk
          DataField = 'RIG'
          DataSource = ObrDMPartidasOferta.DSQMCabOferta
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
    inherited PCMain: TLFPageControl
      Top = 53
      Width = 586
      Height = 179
      ActivePage = TSNotas
      TabIndex = 1
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 578
          Height = 151
          inherited G2KTableLoc: TG2KTBLoc
            Left = 63
            Top = 20
          end
          object LblModoForm: TLFLabel
            Left = 0
            Top = 0
            Width = 578
            Height = 16
            Align = alTop
            Alignment = taCenter
            Caption = 'Ver Partida de Oferta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -13
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LblPartida: TLFLabel
            Left = 14
            Top = 40
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Linea Partida'
          end
          object LblMedida2: TLFLabel
            Left = 191
            Top = 84
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Medida 2'
          end
          object LblMedida3: TLFLabel
            Left = 351
            Top = 84
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Medida 3'
          end
          object LTotalVenta: TLFLabel
            Left = 181
            Top = 106
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = 'Total Venta'
          end
          object LTotalCoste: TLFLabel
            Left = 182
            Top = 127
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Total Coste'
          end
          object LMargenAbsoluto: TLFLabel
            Left = 337
            Top = 106
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Margen Abs.'
          end
          object LMargenPorcentual: TLFLabel
            Left = 339
            Top = 127
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Margen Por.'
          end
          object LblMedida1: TLFLabel
            Left = 32
            Top = 84
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Medida 1'
          end
          object LblPVenta: TLFLabel
            Left = 16
            Top = 106
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'P. Venta Ud.'
          end
          object LPCosteUnidad: TLFLabel
            Left = 17
            Top = 129
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'P. Coste Ud.'
          end
          object LblCantidad: TLFLabel
            Left = 33
            Top = 62
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cantidad'
          end
          object LblOrden: TLFLabel
            Left = 346
            Top = 40
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Orden'
          end
          object LblPlantilla: TLFLabel
            Left = 25
            Top = 17
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#186' Plantilla'
          end
          object DBEPartida: TLFDbedit
            Left = 131
            Top = 36
            Width = 43
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'PARTIDA'
            DataSource = ObrDMPartidasOferta.DSQMCabPlantilla
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
            Left = 175
            Top = 36
            Width = 163
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DESCRIPCION'
            DataSource = ObrDMPartidasOferta.DSQMCabPlantilla
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 8
          end
          object DBEMedida2: TLFDbedit
            Left = 240
            Top = 80
            Width = 100
            Height = 21
            DataField = 'MEDIDA_2'
            DataSource = ObrDMPartidasOferta.DSQMCabPlantilla
            TabOrder = 5
          end
          object DBEMedida3: TLFDbedit
            Left = 400
            Top = 80
            Width = 100
            Height = 21
            DataField = 'MEDIDA_3'
            DataSource = ObrDMPartidasOferta.DSQMCabPlantilla
            TabOrder = 6
          end
          object DBETotVenta: TLFDbedit
            Left = 240
            Top = 102
            Width = 75
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TOTAL_VENTA'
            DataSource = ObrDMPartidasOferta.DSxInfoActualizada
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 9
          end
          object DBETotCoste: TLFDbedit
            Left = 240
            Top = 124
            Width = 75
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TOTAL_COSTE'
            DataSource = ObrDMPartidasOferta.DSxInfoActualizada
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 10
          end
          object DBEMargenAbs: TLFDbedit
            Left = 400
            Top = 102
            Width = 75
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'MARGEN_ABS'
            DataSource = ObrDMPartidasOferta.DSxInfoActualizada
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 11
          end
          object DBEMargenPor: TLFDbedit
            Left = 400
            Top = 124
            Width = 75
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'MARGEN_POR'
            DataSource = ObrDMPartidasOferta.DSxInfoActualizada
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 12
          end
          object DBEMedida1: TLFDbedit
            Left = 80
            Top = 80
            Width = 100
            Height = 21
            DataField = 'MEDIDA_1'
            DataSource = ObrDMPartidasOferta.DSQMCabPlantilla
            TabOrder = 4
          end
          object DBEPVenta: TLFDbedit
            Left = 80
            Top = 102
            Width = 75
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'P_VENTA'
            DataSource = ObrDMPartidasOferta.DSxInfoActualizada
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 13
          end
          object DBEPCoste: TLFDbedit
            Left = 80
            Top = 124
            Width = 75
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'P_COSTE'
            DataSource = ObrDMPartidasOferta.DSxInfoActualizada
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 14
          end
          object DBECantidad: TLFDbedit
            Left = 80
            Top = 58
            Width = 50
            Height = 21
            DataField = 'CANTIDAD'
            DataSource = ObrDMPartidasOferta.DSQMCabPlantilla
            TabOrder = 3
          end
          object DBEOrden: TLFDbedit
            Left = 378
            Top = 36
            Width = 60
            Height = 21
            DataField = 'ORDEN'
            DataSource = ObrDMPartidasOferta.DSQMCabPlantilla
            TabOrder = 2
          end
          object EFPlantilla: TLFEditFind2000
            Left = 80
            Top = 14
            Width = 50
            Height = 21
            TabOrder = 0
            OnChange = EFPlantillaChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'OBR_PARTIDA_CAB'
            Tabla_asociada.DesplegarBusqueda = False
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBELineaPartida: TLFDbedit
            Left = 80
            Top = 36
            Width = 50
            Height = 21
            Color = clInfoBk
            DataField = 'LINEA'
            DataSource = ObrDMPartidasOferta.DSQMCabPlantilla
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
        end
      end
      object TSNotas: TTabSheet [1]
        Caption = 'Notas'
        ImageIndex = 2
        object LFToolBar1: TLFToolBar
          Left = 0
          Top = 0
          Width = 578
          Height = 26
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          Flat = True
          TabOrder = 0
          Separators = True
          object NavNotas: THYMNavigator
            Left = 0
            Top = 0
            Width = 80
            Height = 22
            DataSource = ObrDMPartidasOferta.DSQMCabPlantilla
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = ControlEdit1PMEdit
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
          Top = 26
          Width = 578
          Height = 125
          Align = alClient
          TabOrder = 1
          object LFDBNotas: TLFDBMemo
            Left = 1
            Top = 1
            Width = 576
            Height = 123
            Align = alClient
            DataField = 'NOTAS'
            DataSource = ObrDMPartidasOferta.DSQMCabPlantilla
            TabOrder = 0
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 578
          Height = 151
          DataSource = ObrDMPartidasOferta.DSQMCabPlantilla
          Columns = <
            item
              Expanded = False
              FieldName = 'LINEA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ORDEN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PARTIDA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANTIDAD'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MEDIDA_1'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MEDIDA_2'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MEDIDA_3'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P_VENTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL_VENTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P_COSTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL_COSTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MARGEN_ABS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MARGEN_POR'
              Visible = True
            end>
        end
      end
    end
    object PnlConfig: TLFPanel
      Left = 2
      Top = 28
      Width = 586
      Height = 25
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object ChkBInsertarDetalle: TLFCheckBox
        Left = 15
        Top = 5
        Width = 149
        Height = 17
        Caption = 'Insertar Detalle de Plantilla'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 0
        TabStop = True
        Alignment = taLeftJustify
        OnChange = ChkBInsertarDetalleChange
      end
      object ChkBBorrarDetalle: TLFCheckBox
        Left = 184
        Top = 5
        Width = 133
        Height = 17
        Caption = 'Borrar Detalle de Oferta'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 1
        TabStop = True
        Alignment = taLeftJustify
        OnChange = ChkBBorrarDetalleChange
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 234
    Width = 590
    Height = 164
    inherited TBDetalle: TLFToolBar
      Width = 590
      inherited NavDetalle: THYMNavigator
        DataSource = ObrDMPartidasOferta.DSQMDetPlantilla
        Hints.Strings = ()
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 590
      Height = 142
      DataSource = ObrDMPartidasOferta.DSQMDetPlantilla
      PopupMenu = nil
      IniStorage = FSMain
      Campos.Strings = (
        'LINEA_PARTIDA'
        'ARTICULO')
      CamposAMostrar.Strings = (
        'LINEA_PARTIDA'
        '0'
        'ARTICULO'
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
      Numericos.Strings = (
        'LINEA'
        'ARTICULO')
      Tablas.Strings = (
        'OBR_PARTIDA_OFC_CAB'
        'VER_ARTICULOS_EF')
      Acciones.Strings = (
        ''
        '')
      Titulos.Strings = (
        'DESCRIPCION'
        'TITULO')
      OnBusqueda = DBGFDetalleBusqueda
      Planes.Strings = (
        ''
        '')
      OrdenadosPor.Strings = (
        ''
        '')
      Columns = <
        item
          Expanded = False
          FieldName = 'LINEA_PARTIDA'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ORDEN'
          Width = 38
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ARTICULO'
          Width = 83
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPCION'
          Width = 245
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANTIDAD'
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MEDIDA_1'
          Width = 115
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MEDIDA_2'
          Width = 116
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MEDIDA_3'
          Width = 120
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
    Left = 490
    Top = 12
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 525
    Top = 12
  end
  inherited ALMain: TLFActionList
    Top = 14
    object AVerArticulos: TAction
      Category = 'Procesos'
      Caption = 'Ver Art'#237'culos sin Partidas'
      Hint = 'Ver Art'#237'culos sin Partidas'
      OnExecute = AVerArticulosExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
  end
  inherited FSMain: TLFFibFormStorage
    Top = 14
  end
  inherited CEDetalle: TControlEdit
    Left = 492
    Top = 74
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 527
    Top = 74
  end
  object CENotas: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSNotas
    FichaExclusiva = TSNotas
    PanelEdicion = LFPanelNotas
    PopUpMenu = ControlEdit1PMEdit
    Teclas = DMMain.Teclas
    Left = 490
    Top = 42
  end
  object ControlEdit1PMEdit: TPopUpTeclas
    Left = 526
    Top = 44
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
