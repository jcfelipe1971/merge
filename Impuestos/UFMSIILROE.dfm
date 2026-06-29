inherited FMSIILROE: TFMSIILROE
  Left = 550
  Width = 894
  Height = 467
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'SII - LROE'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 884
    Height = 233
    Align = alTop
    inherited TBMain: TLFToolBar
      Width = 880
      inherited NavMain: THYMNavigator
        DataSource = DMSIILROE.DSPresentacion
        Hints.Strings = ()
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepTerc: TToolButton
        Left = 288
      end
      inherited TbuttComp: TToolButton
        Left = 296
      end
    end
    inherited PCMain: TLFPageControl
      Width = 880
      Height = 203
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 872
          Height = 175
          inherited G2KTableLoc: TG2KTBLoc
            Plan.Strings = (
              ' ')
            DataSource = DMSIILROE.DSPresentacion
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SII_LROE_PRESENTACION'
            CampoNum = 'ID'
            CampoStr = 'ESTADO_ENVIO'
          end
          object LIdPresentacion: TLFLabel
            Left = 54
            Top = 5
            Width = 9
            Height = 13
            Alignment = taRightJustify
            Caption = 'Id'
          end
          object LEstadoPresentacion: TLFLabel
            Left = 206
            Top = 3
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Estado'
          end
          object LModelo: TLFLabel
            Left = 28
            Top = 27
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Modelo'
          end
          object LCapitulo: TLFLabel
            Left = 25
            Top = 49
            Width = 38
            Height = 13
            Alignment = taRightJustify
            Caption = 'Capitulo'
          end
          object LSubcapitulo: TLFLabel
            Left = 7
            Top = 70
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Subcapitulo'
          end
          object LEjercicio: TLFLabel
            Left = 23
            Top = 92
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ejercicio'
          end
          object LNIF: TLFLabel
            Left = 478
            Top = 49
            Width = 17
            Height = 13
            Alignment = taRightJustify
            Caption = 'NIF'
          end
          object LOperacion: TLFLabel
            Left = 14
            Top = 114
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Operacion'
          end
          object LNombre: TLFLabel
            Left = 458
            Top = 70
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nombre'
          end
          object DBEIdPresentacion: TLFDbedit
            Left = 68
            Top = 1
            Width = 121
            Height = 21
            Color = clInfoBk
            DataField = 'ID'
            DataSource = DMSIILROE.DSPresentacion
            Enabled = False
            TabOrder = 0
            OnChange = DBEIdPresentacionChange
          end
          object DBEEstado: TLFDbedit
            Left = 244
            Top = 1
            Width = 117
            Height = 21
            Color = clInfoBk
            DataField = 'ESTADO_ENVIO'
            DataSource = DMSIILROE.DSPresentacion
            Enabled = False
            TabOrder = 1
          end
          object DBEModelo: TRxDBComboBox
            Left = 68
            Top = 23
            Width = 350
            Height = 21
            Color = clInfoBk
            DataField = 'MODELO'
            DataSource = DMSIILROE.DSPresentacion
            ItemHeight = 13
            Items.Strings = (
              'Libro Registro de Operaciones Econ'#243'micas (personas fisicas)'
              'Libro Registro de Operaciones Econ'#243'micas (personas jur'#237'dicas)')
            TabOrder = 3
            Values.Strings = (
              '140'
              '240')
          end
          object DBECapitulo: TRxDBComboBox
            Left = 68
            Top = 45
            Width = 350
            Height = 21
            Color = clInfoBk
            DataField = 'CAPITULO'
            DataSource = DMSIILROE.DSPresentacion
            DropDownCount = 9
            ItemHeight = 13
            Items.Strings = (
              'Facturas emitidas'
              'Facturas recibidas'
              'Bienes de inversi'#243'n'
              'Determinadas operaciones intracomunitarias'
              'Criterio de caja'
              'Otra informaci'#243'n con trascendencia tributaria')
            TabOrder = 4
            Values.Strings = (
              '1'
              '2'
              '3'
              '4'
              '5'
              '6')
          end
          object DBESubcapitulo: TRxDBComboBox
            Left = 68
            Top = 67
            Width = 350
            Height = 21
            Color = clInfoBk
            DataField = 'SUBCAPITULO'
            DataSource = DMSIILROE.DSPresentacion
            ItemHeight = 13
            Items.Strings = (
              'Facturas emitidas con software garante'
              'Facturas emitidas sin software garante'
              
                'Transferencias intracomunitarias, informes periciales y otros tr' +
                'abajos'
              'Ventas de bienes en consigna'
              'Cobros'
              'Pagos'
              'Importes superiores a 6.000 euros percibidos en met'#225'lico'
              'Operaciones de seguros'
              'Agencias de viajes')
            TabOrder = 5
            Values.Strings = (
              '1.1'
              '1.2'
              '4.1'
              '4.2'
              '5.1'
              '5.2'
              '6.1'
              '6.2'
              '6.3')
          end
          object DBEOperacion: TRxDBComboBox
            Left = 68
            Top = 111
            Width = 350
            Height = 21
            Color = clInfoBk
            DataField = 'OPERACION'
            DataSource = DMSIILROE.DSPresentacion
            ItemHeight = 13
            Items.Strings = (
              'Alta'
              'Modificaci'#243'n'
              'Alta devoluci'#243'n en r'#233'gimen de viajeros'
              'Modificaci'#243'n devoluci'#243'n en r'#233'gimen de viajeros')
            TabOrder = 7
            Values.Strings = (
              'A00'
              'M00'
              'A01'
              'M01')
          end
          object DBENIF: TLFDbedit
            Left = 500
            Top = 45
            Width = 121
            Height = 21
            Color = clInfoBk
            DataField = 'OBLIGADOTRIBUTARIO_NIF'
            DataSource = DMSIILROE.DSPresentacion
            TabOrder = 8
          end
          object DBEEjercicio: TLFDbedit
            Left = 68
            Top = 89
            Width = 121
            Height = 21
            Color = clInfoBk
            DataField = 'EJERCICIO'
            DataSource = DMSIILROE.DSPresentacion
            TabOrder = 6
          end
          object DBENombre: TLFDbedit
            Left = 500
            Top = 67
            Width = 350
            Height = 21
            Color = clInfoBk
            DataField = 'OBLIGADOTRIBUTARIO_NOMBRE'
            DataSource = DMSIILROE.DSPresentacion
            TabOrder = 9
          end
          object DBEDescripcionEstado: TLFDbedit
            Left = 362
            Top = 1
            Width = 488
            Height = 21
            Color = clInfoBk
            DataField = 'DESCRIPCION_ESTADO'
            DataSource = DMSIILROE.DSPresentacion
            Enabled = False
            TabOrder = 2
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 872
          Height = 175
          DataSource = DMSIILROE.DSPresentacion
          CamposAOrdenar.Strings = (
            'CAPITULO'
            'DESCRIPCION_ESTADO'
            'EJERCICIO'
            'ESTADO_ENVIO'
            'ID'
            'MODELO'
            'OBLIGADOTRIBUTARIO_NIF'
            'OBLIGADOTRIBUTARIO_NOMBRE'
            'OPERACION'
            'SUBCAPITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MODELO'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CAPITULO'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUBCAPITULO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OPERACION'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EJERCICIO'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBLIGADOTRIBUTARIO_NIF'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBLIGADOTRIBUTARIO_NOMBRE'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO_ENVIO'
              Width = 120
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION_ESTADO'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 414
    Width = 884
  end
  object PDetalle: TLFPanel [2]
    Left = 0
    Top = 233
    Width = 884
    Height = 181
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object TBSuministroFacturasEmitidas: TLFToolBar
      Left = 0
      Top = 0
      Width = 884
      Height = 29
      Caption = 'TBRegistroFacturasEmitidas'
      EdgeInner = esNone
      EdgeOuter = esNone
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 0
      Separators = True
      object NavDocumentos: THYMNavigator
        Left = 0
        Top = 2
        Width = 165
        Height = 22
        DataSource = DMSIILROE.DSDocumentos
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
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
      object TBSep1: TToolButton
        Left = 165
        Top = 2
        Width = 8
        Style = tbsSeparator
      end
      object TBSeleccionarTodo: TToolButton
        Left = 173
        Top = 2
        Hint = 'Seleccionar Todo'
        Caption = 'Seleccionar Todo'
        ImageIndex = 146
        ParentShowHint = False
        ShowHint = True
        OnClick = TBSeleccionarTodoClick
      end
      object TBDeseleccionarTodo: TToolButton
        Left = 196
        Top = 2
        Hint = 'Deseleccionar Todo'
        Caption = 'Deseleccionar Todo'
        ImageIndex = 147
        ParentShowHint = False
        ShowHint = True
        OnClick = TBDeseleccionarTodoClick
      end
    end
    object PCDocumentos: TLFPageControl
      Left = 0
      Top = 29
      Width = 884
      Height = 152
      ActivePage = TSSeleccionados
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 1
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSSeleccionados: TTabSheet
        Caption = 'Seleccionados'
        OnShow = TSSeleccionadosShow
        object DBGSeleccionados: THYTDBGrid
          Left = 0
          Top = 0
          Width = 876
          Height = 124
          Align = alClient
          Color = clInfoBk
          DataSource = DMSIILROE.DSDocumentos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = DBGSeleccionadosDrawColumnCell
          OnDblClick = DBGSeleccionadosDblClick
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
              FieldName = 'ESTADO_ENVIO'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION_ESTADO'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_I'
              Width = 60
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
              FieldName = 'SERIE'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RIG'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO_IDENTIFICATIVO'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CSV'
              Width = 132
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_RECEPCION'
              Width = 80
              Visible = True
            end>
        end
      end
      object TSDisponibles: TTabSheet
        Caption = 'Disponibles'
        ImageIndex = 1
        OnShow = TSDisponiblesShow
        object DBGDisponibles: THYTDBGrid
          Left = 0
          Top = 0
          Width = 876
          Height = 124
          Align = alClient
          Color = clInfoBk
          DataSource = DMSIILROE.DSDisponibles
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDrawColumnCell = DBGDisponiblesDrawColumnCell
          OnDblClick = DBGDisponiblesDblClick
          IniStorage = FSMain
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          Idioma = 'CAS'
          AutoDeseleccionar = True
          TabFicha = TSFicha
          PermutaPaneles = True
          CamposAOrdenar.Strings = (
            'CODIGO_IDENTIFICATIVO'
            'EJERCICIO'
            'RIG'
            'SERIE'
            'TIPO')
          CamposAOrdenarImgs = DMMain.ILOrdGrid
          CampoAOrdenarColor = clInfoBk
          OrdenMultiple = True
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SERIE'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RIG'
              Width = 90
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO_IDENTIFICATIVO'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CSV'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_RECEPCION'
              Width = 90
              Visible = True
            end>
        end
      end
    end
  end
  inherited CEMain: TControlEdit
    Left = 360
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 396
    Top = 4
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 440
    Top = 0
    object AGenerarPresentacion: TAction
      Category = 'Procesos'
      Caption = 'Generar Presentacion'
      Hint = 'Generar Presentacion'
      ImageIndex = 57
      OnExecute = AGenerarPresentacionExecute
    end
    object AEnviaPresentacion: TAction
      Category = 'Procesos'
      Caption = 'Enviar Presentacion'
      Hint = 'Enviar Presentacion'
      ImageIndex = 36
      OnExecute = AEnviaPresentacionExecute
    end
    object AGuardarFicheroPresentacion: TAction
      Category = 'Procesos'
      Caption = 'Guardar Fichero Presentacion'
      Hint = 'Guardar Fichero Presentacion'
      ImageIndex = 41
      OnExecute = AGuardarFicheroPresentacionExecute
    end
    object AGuardarFicheroRespuesta: TAction
      Category = 'Procesos'
      Caption = 'Guardar Fichero Respuesta'
      Hint = 'Guardar Fichero Respuesta'
      ImageIndex = 41
      OnExecute = AGuardarFicheroRespuestaExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 480
    Top = 0
  end
end
