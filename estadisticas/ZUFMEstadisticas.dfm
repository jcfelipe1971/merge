inherited ZFMEstadisticas: TZFMEstadisticas
  Left = 265
  Top = 274
  Width = 766
  Height = 576
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Mantenimiento de Estad'#237'sticas'
  PopupMenu = CEDetallePMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 756
    Height = 140
    Align = alTop
    inherited TBMain: TLFToolBar
      Width = 752
      inherited NavMain: THYMNavigator
        DataSource = ZDMEstadisticas.DSQMGrupo
        Hints.Strings = ()
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
    end
    inherited PCMain: TLFPageControl
      Width = 752
      Height = 110
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 744
          Height = 82
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = ZDMEstadisticas.DSQMGrupo
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'EST_GRUPOS'
            CampoNum = 'GRUPO'
            CampoStr = 'TITULO'
          end
          object LBLGrupo: TLFLabel
            Left = 43
            Top = 17
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Grupo'
          end
          object LBLTituloGrupo: TLFLabel
            Left = 44
            Top = 39
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object DBEGrupo: TLFDbedit
            Left = 76
            Top = 13
            Width = 65
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'GRUPO'
            DataSource = ZDMEstadisticas.DSQMGrupo
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBETitGrupo: TLFDbedit
            Left = 76
            Top = 35
            Width = 366
            Height = 21
            DataField = 'TITULO'
            DataSource = ZDMEstadisticas.DSQMGrupo
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 744
          Height = 82
          DataSource = ZDMEstadisticas.DSQMGrupo
          Columns = <
            item
              Expanded = False
              FieldName = 'GRUPO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 325
              Visible = True
            end>
        end
      end
    end
  end
  object PDetalle: TLFPanel [1]
    Left = 0
    Top = 140
    Width = 756
    Height = 383
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object PCDetalle: TLFPageControl
      Left = 0
      Top = 0
      Width = 756
      Height = 383
      ActivePage = TSFichaEst
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 0
      TabPosition = tpBottom
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSFichaEst: TTabSheet
        Caption = '&Ficha'
        object GBCondiciones: TGroupBox
          Left = 0
          Top = 251
          Width = 748
          Height = 106
          Align = alBottom
          Caption = ' Condiciones '
          Enabled = False
          TabOrder = 0
          object LblReglas: TLFLabel
            Left = 261
            Top = 17
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Otras Reglas'
          end
          object LBLNombreCampoFecha: TLFLabel
            Left = 216
            Top = 39
            Width = 106
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nombre Campo Fecha'
          end
          object LOrden: TLFLabel
            Left = 293
            Top = 62
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Orden'
          end
          object ChkBEmpresa: TLFCheckBox
            Left = 11
            Top = 15
            Width = 63
            Height = 17
            Caption = 'Empresa'
            Checked = True
            State = cbChecked
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 0
            TabStop = True
            OnClick = ChkBEmpresaClick
            Alignment = taLeftJustify
          end
          object ChkBEjercicio: TLFCheckBox
            Left = 11
            Top = 37
            Width = 63
            Height = 17
            Caption = 'Ejercicio'
            Checked = True
            State = cbChecked
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 2
            TabStop = True
            OnClick = ChkBEjercicioClick
            Alignment = taLeftJustify
          end
          object ChkBCanal: TLFCheckBox
            Left = 11
            Top = 59
            Width = 63
            Height = 17
            Caption = 'Canal'
            Checked = True
            State = cbChecked
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 4
            TabStop = True
            OnClick = ChkBCanalClick
            Alignment = taLeftJustify
          end
          object ChkBSerie: TLFCheckBox
            Left = 11
            Top = 81
            Width = 63
            Height = 17
            Caption = 'Serie'
            Checked = True
            State = cbChecked
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 6
            TabStop = True
            OnClick = ChkBSerieClick
            Alignment = taLeftJustify
          end
          object DBCBVEmpresas: TDBComboBoxValue
            Left = 75
            Top = 13
            Width = 153
            Height = 21
            Style = csDropDownList
            DataField = 'EMPRESA'
            DataSource = ZDMEstadisticas.DSQMDetalle
            ItemHeight = 13
            TabOrder = 1
            OnChange = DBCBVEmpresasChange
          end
          object DBCBVEjercicios: TDBComboBoxValue
            Left = 75
            Top = 35
            Width = 118
            Height = 21
            Style = csDropDownList
            DataField = 'EJERCICIO'
            DataSource = ZDMEstadisticas.DSQMDetalle
            ItemHeight = 13
            TabOrder = 3
            OnChange = DBCBVEjerciciosChange
          end
          object DBCBVCanales: TDBComboBoxValue
            Left = 75
            Top = 57
            Width = 118
            Height = 21
            Style = csDropDownList
            DataField = 'CANAL'
            DataSource = ZDMEstadisticas.DSQMDetalle
            ItemHeight = 13
            TabOrder = 5
            OnChange = DBCBVCanalesChange
          end
          object DBCBVSeries: TDBComboBoxValue
            Left = 75
            Top = 79
            Width = 118
            Height = 21
            Style = csDropDownList
            DataField = 'SERIE'
            DataSource = ZDMEstadisticas.DSQMDetalle
            ItemHeight = 13
            TabOrder = 7
          end
          object DBMReglas: TLFDBMemo
            Left = 326
            Top = 13
            Width = 401
            Height = 21
            DataField = 'REGLAS'
            DataSource = ZDMEstadisticas.DSQMDetalle
            TabOrder = 8
          end
          object DBMClaves: TLFDBMemo
            Left = 326
            Top = 35
            Width = 240
            Height = 22
            DataField = 'CLAVES'
            DataSource = ZDMEstadisticas.DSQMDetalle
            TabOrder = 9
          end
          object DBCBVOrdenTotal: TDBComboBoxValue
            Left = 326
            Top = 58
            Width = 129
            Height = 21
            Style = csDropDownList
            DataField = 'ORDEN_TOTAL'
            DataSource = ZDMEstadisticas.DSQMDetalle
            DropDownCount = 3
            ItemHeight = 13
            Items.Strings = (
              'No Ordenar por Total'
              'Orden Ascendente'
              'Orden Descendente')
            Values.Strings = (
              '0'
              '1'
              '2')
            TabOrder = 10
          end
        end
        object GBConsulta: TGroupBox
          Left = 0
          Top = 124
          Width = 748
          Height = 127
          Align = alClient
          Caption = ' Consulta '
          TabOrder = 1
          object LBLTablas: TLFLabel
            Left = 22
            Top = 22
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tablas'
          end
          object LBLCampoAux: TLFLabel
            Left = 572
            Top = 13
            Width = 33
            Height = 13
            Alignment = taCenter
            Caption = 'Campo'
          end
          object LBLTituloAux: TLFLabel
            Left = 650
            Top = 12
            Width = 28
            Height = 13
            Alignment = taCenter
            Caption = 'T'#237'tulo'
          end
          object LBLCampoAux1: TLFLabel
            Left = 538
            Top = 33
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Aux. 1'
          end
          object LBLCampoAux2: TLFLabel
            Left = 538
            Top = 55
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Aux. 2'
          end
          object LBLCampoAux3: TLFLabel
            Left = 538
            Top = 77
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Aux. 3'
          end
          object LBLCampoAux4: TLFLabel
            Left = 538
            Top = 97
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Aux. 4'
          end
          object LBLAcum: TLFLabel
            Left = 336
            Top = 13
            Width = 53
            Height = 13
            Caption = 'Acumulado'
          end
          object DBMTablas: TLFDBMemo
            Left = 59
            Top = 19
            Width = 261
            Height = 94
            DataField = 'TABLAS'
            DataSource = ZDMEstadisticas.DSQMDetalle
            TabOrder = 0
          end
          object DBEAux1: TLFDbedit
            Left = 572
            Top = 29
            Width = 77
            Height = 21
            DataField = 'CAMPO_AUX_1'
            DataSource = ZDMEstadisticas.DSQMDetalle
            TabOrder = 2
          end
          object DBEAux2: TLFDbedit
            Left = 572
            Top = 51
            Width = 77
            Height = 21
            DataField = 'CAMPO_AUX_2'
            DataSource = ZDMEstadisticas.DSQMDetalle
            TabOrder = 4
          end
          object DBEAux3: TLFDbedit
            Left = 572
            Top = 73
            Width = 77
            Height = 21
            DataField = 'CAMPO_AUX_3'
            DataSource = ZDMEstadisticas.DSQMDetalle
            TabOrder = 6
          end
          object DBEAux4: TLFDbedit
            Left = 572
            Top = 95
            Width = 77
            Height = 21
            DataField = 'CAMPO_AUX_4'
            DataSource = ZDMEstadisticas.DSQMDetalle
            TabOrder = 8
          end
          object DBETitAux1: TLFDbedit
            Left = 650
            Top = 29
            Width = 77
            Height = 21
            DataField = 'TIT_CAMPO_AUX_1'
            DataSource = ZDMEstadisticas.DSQMDetalle
            TabOrder = 3
          end
          object DBETitAux2: TLFDbedit
            Left = 650
            Top = 51
            Width = 77
            Height = 21
            DataField = 'TIT_CAMPO_AUX_2'
            DataSource = ZDMEstadisticas.DSQMDetalle
            TabOrder = 5
          end
          object DBETitAux3: TLFDbedit
            Left = 650
            Top = 73
            Width = 77
            Height = 21
            DataField = 'TIT_CAMPO_AUX_3'
            DataSource = ZDMEstadisticas.DSQMDetalle
            TabOrder = 7
          end
          object DBETitAux4: TLFDbedit
            Left = 650
            Top = 95
            Width = 77
            Height = 21
            DataField = 'TIT_CAMPO_AUX_4'
            DataSource = ZDMEstadisticas.DSQMDetalle
            TabOrder = 9
          end
          object DBMAcumulados: TLFDBMemo
            Left = 336
            Top = 29
            Width = 161
            Height = 22
            DataField = 'ACUMULADOS'
            DataSource = ZDMEstadisticas.DSQMDetalle
            TabOrder = 1
          end
        end
        object GBEstadistica: TGroupBox
          Left = 0
          Top = 22
          Width = 748
          Height = 102
          Align = alTop
          Caption = ' Estad'#237'stica '
          TabOrder = 2
          object LBLEstadistica: TLFLabel
            Left = 30
            Top = 23
            Width = 25
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#250'm.'
          end
          object LBLClave1: TLFLabel
            Left = 376
            Top = 32
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Clave 1'
          end
          object LBLNumClaves: TLFLabel
            Left = 8
            Top = 68
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#186' Claves'
          end
          object LBLClave: TLFLabel
            Left = 416
            Top = 12
            Width = 77
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Clave'
          end
          object LBLTitulo: TLFLabel
            Left = 494
            Top = 12
            Width = 77
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'T'#237'tulo'
          end
          object LBLDescClave: TLFLabel
            Left = 572
            Top = 12
            Width = 77
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Desc. Clave'
          end
          object LBLTitDescClave: TLFLabel
            Left = 650
            Top = 12
            Width = 77
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'T'#237't. Desc. Clave'
          end
          object LBLClave2: TLFLabel
            Left = 376
            Top = 54
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Clave 2'
            Visible = False
          end
          object LBLClave3: TLFLabel
            Left = 376
            Top = 76
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Clave 3'
            Visible = False
          end
          object LBLTitEstadistica: TLFLabel
            Left = 27
            Top = 45
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object DBEEstadistica: TLFDbedit
            Left = 59
            Top = 20
            Width = 65
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ESTADISTICA'
            DataSource = ZDMEstadisticas.DSQMDetalle
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBETitEstadistica: TLFDbedit
            Left = 59
            Top = 42
            Width = 277
            Height = 21
            DataField = 'TITULO'
            DataSource = ZDMEstadisticas.DSQMDetalle
            TabOrder = 1
          end
          object DBEClave1: TLFDbedit
            Left = 416
            Top = 28
            Width = 77
            Height = 21
            DataField = 'CLAVE_1'
            DataSource = ZDMEstadisticas.DSQMDetalle
            TabOrder = 3
          end
          object DBEClave2: TLFDbedit
            Left = 416
            Top = 50
            Width = 77
            Height = 21
            DataField = 'CLAVE_2'
            DataSource = ZDMEstadisticas.DSQMDetalle
            TabOrder = 7
            Visible = False
          end
          object DBEClave3: TLFDbedit
            Left = 416
            Top = 72
            Width = 77
            Height = 21
            DataField = 'CLAVE_3'
            DataSource = ZDMEstadisticas.DSQMDetalle
            TabOrder = 11
            Visible = False
          end
          object DBETitulo3: TLFDbedit
            Left = 494
            Top = 72
            Width = 77
            Height = 21
            DataField = 'TITULO_3'
            DataSource = ZDMEstadisticas.DSQMDetalle
            TabOrder = 12
            Visible = False
          end
          object DBETitulo2: TLFDbedit
            Left = 494
            Top = 50
            Width = 77
            Height = 21
            DataField = 'TITULO_2'
            DataSource = ZDMEstadisticas.DSQMDetalle
            TabOrder = 8
            Visible = False
          end
          object DBETitulo1: TLFDbedit
            Left = 494
            Top = 28
            Width = 77
            Height = 21
            DataField = 'TITULO_1'
            DataSource = ZDMEstadisticas.DSQMDetalle
            TabOrder = 4
          end
          object DBCBNumClaves: TDBComboBox
            Left = 59
            Top = 64
            Width = 65
            Height = 21
            DataField = 'NUM_CLAVES'
            DataSource = ZDMEstadisticas.DSQMDetalle
            ItemHeight = 13
            Items.Strings = (
              '3'
              '2'
              '1')
            TabOrder = 2
            OnChange = DBCBNumClavesChange
          end
          object DBEDescClave1: TLFDbedit
            Left = 572
            Top = 28
            Width = 77
            Height = 21
            DataField = 'DESC_CLAVE_1'
            DataSource = ZDMEstadisticas.DSQMDetalle
            TabOrder = 5
          end
          object DBETituloDesc1: TLFDbedit
            Left = 650
            Top = 28
            Width = 77
            Height = 21
            DataField = 'TITULO_DESC_1'
            DataSource = ZDMEstadisticas.DSQMDetalle
            TabOrder = 6
          end
          object DBETituloDesc2: TLFDbedit
            Left = 650
            Top = 50
            Width = 77
            Height = 21
            DataField = 'TITULO_DESC_2'
            DataSource = ZDMEstadisticas.DSQMDetalle
            TabOrder = 10
            Visible = False
          end
          object DBEDescClave2: TLFDbedit
            Left = 572
            Top = 50
            Width = 77
            Height = 21
            DataField = 'DESC_CLAVE_2'
            DataSource = ZDMEstadisticas.DSQMDetalle
            TabOrder = 9
            Visible = False
          end
          object DBEDescClave3: TLFDbedit
            Left = 572
            Top = 72
            Width = 77
            Height = 21
            DataField = 'DESC_CLAVE_3'
            DataSource = ZDMEstadisticas.DSQMDetalle
            TabOrder = 13
            Visible = False
          end
          object DBETituloDesc3: TLFDbedit
            Left = 650
            Top = 72
            Width = 77
            Height = 21
            DataField = 'TITULO_DESC_3'
            DataSource = ZDMEstadisticas.DSQMDetalle
            TabOrder = 14
            Visible = False
          end
        end
        object TBDetalle: TLFToolBar
          Left = 0
          Top = 0
          Width = 748
          Height = 22
          AutoSize = True
          EdgeBorders = []
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          Separators = True
          object NavDetalle: THYMNavigator
            Left = 0
            Top = 0
            Width = 200
            Height = 22
            DataSource = ZDMEstadisticas.DSQMDetalle
            Flat = True
            ParentShowHint = False
            PopupMenu = CEDetallePMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            ControlEdit = CEDetalle
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
      end
      object TSTablaEst: TTabSheet
        Caption = '&Tabla'
        ImageIndex = 1
        object DBGDetalle: THYTDBGrid
          Left = 0
          Top = 0
          Width = 748
          Height = 357
          Align = alClient
          Color = clInfoBk
          DataSource = ZDMEstadisticas.DSQMDetalle
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
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
          TabFicha = TSFicha
          PermutaPaneles = True
          CamposAOrdenarImgs = DMMain.ILOrdGrid
          CampoAOrdenarColor = clInfoBk
          OrdenMultiple = True
          Columns = <
            item
              Expanded = False
              FieldName = 'ESTADISTICA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GRUPO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUM_CLAVES'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 523
    Width = 756
  end
  inherited CEMain: TControlEdit
    Left = 545
    Top = 20
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 589
    Top = 20
  end
  inherited ALMain: TLFActionList
    Left = 400
    Top = 16
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object ADuplicarEstadistica: TLFDatasetAction
      Category = 'Procesos'
      Caption = 'Duplicar Estad'#237'stica'
      Hint = 'Duplicar Estad'#237'stica'
      ImageIndex = 37
      OnExecute = ADuplicarEstadisticaExecute
      DataSource = ZDMEstadisticas.DSQMDetalle
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Otros'
      Caption = 'Otros'
      GroupIndex = 1
      ImageIndex = 99
    end
    object AVerDatos: TAction
      Category = 'Otros'
      Caption = 'Ver Datos de Estad'#237'stica'
      Hint = 'Ver Datos de Estad'#237'stica'
      ImageIndex = 21
      OnExecute = AVerDatosExecute
    end
    object ASep2: TAction
      Category = 'Otros'
      Caption = '-'
    end
    object AComparaEstadisticas: TAction
      Category = 'Otros'
      Caption = 'Comparaci'#243'n de Estad'#237'sticas'
      Hint = 'Comparaci'#243'n de Estad'#237'sticas'
      ImageIndex = 128
      OnExecute = AComparaEstadisticasExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 262
    Top = 26
  end
  object CEDetalle: TControlEdit
    EnlazadoA = CEMain
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 544
    Top = 52
  end
  object CEDetallePMEdit: TPopUpTeclas
    Left = 590
    Top = 52
    object CEDetalleMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEDetalleMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEDetalleMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEDetalleMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEDetalleMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEDetalleMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEDetalleMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEDetalleMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEDetalleMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEDetalleMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
