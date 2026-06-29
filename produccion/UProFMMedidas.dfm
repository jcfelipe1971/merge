inherited ProFMMedidas: TProFMMedidas
  Left = 376
  Top = 95
  ActiveControl = PMain
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  Caption = 'Mantenimiento de Medidas'
  ClientHeight = 537
  ClientWidth = 613
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 613
    Height = 288
    inherited TBMain: TLFToolBar
      Width = 609
      inherited NavMain: THYMNavigator
        Width = 60
        DataSource = ProDMMedidas.DSMedidas
        VisibleButtons = [nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton
        Left = 60
      end
      inherited EPMain: THYMEditPanel
        Left = 68
        Width = 20
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 88
      end
      inherited TbuttComp: TToolButton
        Left = 96
        Hint = 'Crear Nota'
        Action = ANotas
      end
    end
    inherited PCMain: TLFPageControl
      Width = 609
      Height = 258
      inherited TSFicha: TTabSheet
        object SBAEscandallo: TSpeedButton [0]
          Left = 146
          Top = 112
          Width = 23
          Height = 22
          GroupIndex = -1
          OnDblClick = SBAEscandalloDblClick
        end
        inherited PEdit: TLFPanel
          Width = 601
          Height = 230
          object LID: TLFLabel
            Left = 49
            Top = 9
            Width = 11
            Height = 13
            Alignment = taRightJustify
            Caption = 'ID'
          end
          object LArticulo: TLFLabel
            Left = 25
            Top = 32
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Articulo'
          end
          object LMedida2: TLFLabel
            Left = 151
            Top = 53
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Medida 2'
          end
          object LMedida1: TLFLabel
            Left = 16
            Top = 54
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Medida 1'
          end
          object LMedida3: TLFLabel
            Left = 16
            Top = 74
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Medida 3'
          end
          object LEscandallo: TLFLabel
            Left = 8
            Top = 98
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Escandallo'
          end
          object LMedida4: TLFLabel
            Left = 151
            Top = 75
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Medida 4'
          end
          object LNotas: TLFLabel
            Left = 298
            Top = 49
            Width = 28
            Height = 13
            Caption = 'Notas'
          end
          object LAlmacen: TLFLabel
            Left = 19
            Top = 144
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Almac'#233'n'
          end
          object LUnidadesPendientes: TLFLabel
            Left = 13
            Top = 167
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = 'Uds. Ped.'
          end
          object LStock: TLFLabel
            Left = 32
            Top = 191
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Stock'
          end
          object LUnidadesAsignadasALote: TLFLabel
            Left = 135
            Top = 191
            Width = 98
            Height = 13
            Alignment = taRightJustify
            Caption = 'Uds. Asignadas Lote'
          end
          object LLoteOptimo: TLFLabel
            Left = 307
            Top = 191
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Lote '#211'ptimo'
          end
          object LUnidadesAFabricar: TLFLabel
            Left = 444
            Top = 191
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Uds. Fabricar'
          end
          object LUnidadesAFabricarManual: TLFLabel
            Left = 406
            Top = 214
            Width = 101
            Height = 13
            Alignment = taRightJustify
            Caption = 'Uds. Fabricar Manual'
          end
          object LFID: TLFDbedit
            Left = 64
            Top = 5
            Width = 49
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ID_MEDIDA'
            DataSource = ProDMMedidas.DSMedidas
            ReadOnly = True
            TabOrder = 0
            OnChange = LFIDChange
          end
          object LFDBArticulo: TLFDbedit
            Left = 64
            Top = 27
            Width = 121
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ARTICULO'
            DataSource = ProDMMedidas.DSMedidas
            ReadOnly = True
            TabOrder = 1
          end
          object DescArticulo: TLFDbedit
            Left = 186
            Top = 27
            Width = 286
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescArticulo'
            DataSource = ProDMMedidas.DSMedidas
            ReadOnly = True
            TabOrder = 2
          end
          object LFDBMedida2: TLFDbedit
            Left = 199
            Top = 49
            Width = 79
            Height = 21
            DataField = 'MEDIDA_2'
            DataSource = ProDMMedidas.DSMedidas
            TabOrder = 4
          end
          object LFDBMedida1: TLFDbedit
            Left = 64
            Top = 49
            Width = 79
            Height = 21
            DataField = 'MEDIDA_1'
            DataSource = ProDMMedidas.DSMedidas
            TabOrder = 3
          end
          object LFDBMedida3: TLFDbedit
            Left = 64
            Top = 71
            Width = 79
            Height = 21
            DataField = 'MEDIDA_3'
            DataSource = ProDMMedidas.DSMedidas
            TabOrder = 5
          end
          object LFDBEscandallo: TLFDbedit
            Left = 64
            Top = 93
            Width = 79
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ID_ESCANDALLO'
            DataSource = ProDMMedidas.DSMedidas
            ReadOnly = True
            TabOrder = 7
          end
          object LFDBMedida4: TLFDbedit
            Left = 199
            Top = 71
            Width = 79
            Height = 21
            DataField = 'MEDIDA_4'
            DataSource = ProDMMedidas.DSMedidas
            TabOrder = 6
          end
          object LFDBNotas: TLFDBMemo
            Left = 299
            Top = 64
            Width = 262
            Height = 71
            DataField = 'NOTAS'
            DataSource = ProDMMedidas.DSMedidas
            TabOrder = 8
          end
          object LFCBTraspasar: TLFDBCheckBox
            Left = 64
            Top = 118
            Width = 184
            Height = 17
            Caption = 'Traspasar tareas a notas pedido'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 9
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'TRASPASAR_NOTAS_PEDIDO'
            DataSource = ProDMMedidas.DSMedidas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object LFDBAlmacen: TLFDbedit
            Left = 64
            Top = 140
            Width = 58
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ALMACEN'
            DataSource = ProDMMedidas.DSMedidas
            ReadOnly = True
            TabOrder = 10
          end
          object DescAlmacen: TLFDbedit
            Left = 123
            Top = 140
            Width = 279
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'descalmacen'
            DataSource = ProDMMedidas.DSMedidas
            ReadOnly = True
            TabOrder = 11
          end
          object LFDBUnPed: TLFDbedit
            Left = 64
            Top = 163
            Width = 59
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'UNIDADES_PED'
            DataSource = ProDMMedidas.DSMedidas
            ReadOnly = True
            TabOrder = 12
          end
          object LFDBUnStock: TLFDbedit
            Left = 64
            Top = 187
            Width = 59
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'UNIDADES_STOCK'
            DataSource = ProDMMedidas.DSMedidas
            ReadOnly = True
            TabOrder = 13
          end
          object LFDBUniAsignadas: TLFDbedit
            Left = 237
            Top = 187
            Width = 59
            Height = 21
            DataField = 'UNIDADES_ASIGNADAS_LOTE'
            DataSource = ProDMMedidas.DSMedidas
            TabOrder = 14
          end
          object LFDBLoteOp: TLFDbedit
            Left = 368
            Top = 187
            Width = 59
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'UNIDADES_OPTIMO_ESC'
            DataSource = ProDMMedidas.DSMedidas
            ReadOnly = True
            TabOrder = 15
          end
          object LFDBFabOp: TLFDbedit
            Left = 511
            Top = 187
            Width = 59
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'UNIDADES_OP'
            DataSource = ProDMMedidas.DSMedidas
            ReadOnly = True
            TabOrder = 16
          end
          object LFDAFabricar: TLFDbedit
            Left = 511
            Top = 209
            Width = 59
            Height = 21
            DataField = 'UNIDADES_FABRICAR_LIBRE'
            DataSource = ProDMMedidas.DSMedidas
            TabOrder = 17
          end
        end
      end
      inherited TSTabla: TTabSheet
        OnShow = nil
        inherited DBGMain: THYTDBGrid
          Width = 601
          Height = 230
          DataSource = ProDMMedidas.DSMedidas
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 513
    Width = 613
  end
  object LFPanelDetall: TLFPanel [2]
    Left = 0
    Top = 288
    Width = 613
    Height = 225
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object PCMedidas: TLFPageControl
      Left = 0
      Top = 0
      Width = 613
      Height = 225
      ActivePage = TSTareas
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 0
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSTareas: TTabSheet
        Caption = 'Tareas'
        object DBGDetalle: TDBGridFind2000
          Left = 0
          Top = 26
          Width = 605
          Height = 171
          Align = alClient
          DataSource = ProDMMedidas.DSDetMedidas
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
          IndiceBitmapAscendente = 0
          IndiceBitmapChecked = 3
          IndiceBitmapDescendente = 0
          BaseDeDatos = DMMain.DataBase
          BuscarNums = False
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          ColumnasCheckBoxes.Strings = (
            'Traspasar')
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
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TIPOTAREA'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DescripTarea'
              ReadOnly = True
              Width = 120
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TAREA'
              ReadOnly = True
              Visible = False
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CANTIDAD'
              ReadOnly = True
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TRASPASAR'
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LINEA_FASE'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDADES'
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIEMPO_UNITARIO'
              Visible = True
            end>
        end
        object TBTareas: TLFToolBar
          Left = 0
          Top = 0
          Width = 605
          Height = 26
          EdgeBorders = []
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Separators = True
          object NavDetalle: THYMNavigator
            Left = 0
            Top = 2
            Width = 160
            Height = 22
            DataSource = ProDMMedidas.DSDetMedidas
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
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
        end
      end
      object TSComponentes: TTabSheet
        Caption = 'Componentes'
        ImageIndex = 2
        object TBComponentes: TLFToolBar
          Left = 0
          Top = 0
          Width = 605
          Height = 26
          EdgeBorders = []
          Flat = True
          TabOrder = 0
          Separators = True
          object NavComponentes: THYMNavigator
            Left = 0
            Top = 0
            Width = 100
            Height = 22
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
            Flat = True
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
        end
        object DBGComponentes: TDBGridFind2000
          Left = 0
          Top = 26
          Width = 605
          Height = 171
          Align = alClient
          DataSource = ProDMMedidas.DSxComponentes
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
          BaseDeDatos = DMMain.DataBase
          BuscarNums = False
          CampoAOrdenarColor = clInfoBk
          MensajeNoExiste = False
          SalirSiVacio = False
          SalirSiNoExiste = False
          Posicion = tpCentrado
          OrdenMultiple = True
          Filtros = []
          Columns = <
            item
              Expanded = False
              FieldName = 'LINEA_COMP'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMPONENTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALMACEN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDADES'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UNIDAD_FAB'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRE_COS_UNI'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL'
              Visible = True
            end>
        end
      end
      object TSLotes: TTabSheet
        Caption = 'Lotes'
        ImageIndex = 1
        object TBLotes: TLFToolBar
          Left = 0
          Top = 0
          Width = 605
          Height = 26
          EdgeBorders = []
          Flat = True
          TabOrder = 0
          Separators = True
          object NavLote: THYMNavigator
            Left = 0
            Top = 0
            Width = 200
            Height = 22
            DataSource = ProDMMedidas.DSMedidasLotes
            Flat = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = True
          end
        end
        object DBGLotes: TDBGridFind2000
          Left = 0
          Top = 26
          Width = 605
          Height = 171
          Align = alClient
          DataSource = ProDMMedidas.DSMedidasLotes
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnKeyUp = DBGLotesKeyUp
          Insercion = False
          ColumnaInicial = 3
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
          BaseDeDatos = DMMain.DataBase
          BuscarNums = False
          CamposAMostrarAnchos.Strings = (
            '0')
          CampoAOrdenarColor = clInfoBk
          MensajeNoExiste = False
          SalirSiVacio = False
          SalirSiNoExiste = False
          Posicion = tpCentrado
          OnBusqueda = DBGLotesBusqueda
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            '')
          Filtros = []
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LINEA'
              ReadOnly = True
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_PEDIDO'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ID_MEDIDA'
              Visible = False
            end
            item
              Expanded = False
              FieldName = 'ID_LOTE'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LOTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STOCK'
              Visible = True
            end>
        end
      end
    end
  end
  inherited CEMainPMEdit: TPopUpTeclas
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
    inherited CEMainMiedit: TMenuItem
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
    Top = 32
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object ACrearOF: TAction
      Category = 'Procesos'
      Caption = 'Generar OF'
      OnExecute = ACrearOFExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Top = 32
  end
  object ALMedidas: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 496
    Top = 36
    object AEscandallo: TAction
      Caption = 'AEscandallo'
      OnExecute = AEscandalloExecute
    end
    object ANotas: TAction
      Caption = 'ANotas'
      OnExecute = ANotasExecute
    end
  end
end
