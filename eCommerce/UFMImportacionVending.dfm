inherited FMImportacionVending: TFMImportacionVending
  Left = 264
  Top = 208
  Width = 1125
  Height = 480
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Importacion Maquinas Vending'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1115
    Height = 427
    inherited TBMain: TLFToolBar
      Width = 1111
      inherited EPMain: THYMEditPanel
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object TSep1: TToolButton
        Left = 25
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtCrearAlbaranes: TToolButton
        Left = 33
        Top = 0
        Action = ACrearAlbaranes
      end
      object TBSep2: TToolButton
        Left = 56
        Top = 0
        Width = 8
        ImageIndex = 61
        Style = tbsSeparator
      end
      object TBMarcarTodas: TToolButton
        Left = 64
        Top = 0
        Action = AMarcarTodas
      end
      object TBDesmarcar: TToolButton
        Left = 87
        Top = 0
        Action = ADesmarcar
      end
    end
    object PNLCabecera: TLFPanel
      Left = 2
      Top = 28
      Width = 1111
      Height = 144
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object PNLConfiguracionImportacion: TLFPanel
        Left = 0
        Top = 0
        Width = 633
        Height = 144
        Align = alLeft
        Anchors = [akLeft, akTop, akRight, akBottom]
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          633
          144)
        object LURLCSV: TLFLabel
          Left = 18
          Top = 14
          Width = 49
          Height = 13
          Alignment = taRightJustify
          Caption = 'URL Base'
        end
        object LAlmacen: TLFLabel
          Left = 9
          Top = 80
          Width = 62
          Height = 13
          Alignment = taRightJustify
          Caption = 'Almacen Alb.'
        end
        object LDesdeFecha: TLFLabel
          Left = 8
          Top = 36
          Width = 64
          Height = 13
          Alignment = taRightJustify
          Caption = 'Desde Fecha'
        end
        object LFechaAlbaran: TLFLabel
          Left = 22
          Top = 124
          Width = 51
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fecha Alb.'
        end
        object LHastaFecha: TLFLabel
          Left = 11
          Top = 57
          Width = 61
          Height = 13
          Alignment = taRightJustify
          Caption = 'Hasta Fecha'
        end
        object LSerie: TLFLabel
          Left = 26
          Top = 102
          Width = 45
          Height = 13
          Alignment = taRightJustify
          Caption = 'Serie Alb.'
        end
        object DEDesdeFecha: TLFDateEdit
          Left = 77
          Top = 32
          Width = 121
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
        end
        object DEFechaAlbaran: TLFDateEdit
          Left = 77
          Top = 120
          Width = 121
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 1
        end
        object DEHastaFecha: TLFDateEdit
          Left = 77
          Top = 54
          Width = 121
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 2
        end
        object EAlmacen: TLFEdit
          Left = 199
          Top = 76
          Width = 426
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          Enabled = False
          TabOrder = 3
        end
        object EFAlmacen: TLFEditFind2000
          Left = 77
          Top = 76
          Width = 121
          Height = 21
          TabOrder = 4
          OnChange = EFAlmacenChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'ALMACEN'
          CampoStr = 'AL_TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_ALMACENES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'ALMACEN')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFSerie: TLFEditFind2000
          Left = 77
          Top = 98
          Width = 121
          Height = 21
          TabOrder = 5
          OnChange = EFSerieChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'SERIE'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_SERIES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'SERIE')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object ESerie: TLFEdit
          Left = 199
          Top = 98
          Width = 426
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          Enabled = False
          TabOrder = 6
        end
        object EURLCSV: TLFEdit
          Left = 77
          Top = 10
          Width = 548
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 7
          Text = 
            'http://delfos-online.com/webServiceLogicart/GetDetalleMovimiento' +
            'sCsv.php'
        end
      end
      object PNLSeleccinMaquina: TLFPanel
        Left = 633
        Top = 0
        Width = 478
        Height = 144
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object DBGFSeleccinMaquina: TDBGridFind2000
          Left = 0
          Top = 0
          Width = 478
          Height = 144
          Align = alClient
          DataSource = DMImportacionVending.DSxMaquinasImportar
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
            'MAQUINA'
            'TITULO'
            'PARAMETRO_CLIENTE'
            'PARAMETRO_MAQUINA'
            'PARAMETRO_UBICACION')
          ColumnasCheckBoxes.Strings = (
            'ACTIVO')
          ColumnasChecked.Strings = (
            '1')
          ColumnasNoChecked.Strings = (
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
              FieldName = 'ACTIVO'
              Width = 35
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'MAQUINA'
              Width = 45
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO'
              Width = 170
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PARAMETRO_CLIENTE'
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PARAMETRO_MAQUINA'
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PARAMETRO_UBICACION'
              Width = 60
              Visible = True
            end>
        end
      end
    end
    object PNLDetalle: TLFPanel
      Left = 2
      Top = 172
      Width = 1111
      Height = 253
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object TBDetalle: TLFToolBar
        Left = 0
        Top = 0
        Width = 1111
        Height = 24
        AutoSize = True
        DisabledImages = DMMain.ILMain_In
        EdgeBorders = []
        HotImages = DMMain.ILMain_Ac
        Images = DMMain.ILMain_Ac
        TabOrder = 0
        Separators = True
        object NavDetalle: THYMNavigator
          Left = 0
          Top = 2
          Width = 165
          Height = 22
          DataSource = DMImportacionVending.DSRXMDDatosImportacion
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
        object TSep2: TToolButton
          Left = 165
          Top = 2
          Width = 8
          Style = tbsSeparator
        end
        object PNLProgreso: TLFPanel
          Left = 173
          Top = 2
          Width = 524
          Height = 22
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object LProgreso: TLFLabel
            Left = 0
            Top = 0
            Width = 42
            Height = 22
            Align = alLeft
            Alignment = taRightJustify
            Caption = 'Progreso'
            Layout = tlCenter
          end
        end
      end
      object DBGFDetalle: TDBGridFind2000
        Left = 0
        Top = 24
        Width = 1111
        Height = 229
        Align = alClient
        Color = clInfoBk
        DataSource = DMImportacionVending.DSRXMDDatosImportacion
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGFDetalleDrawColumnCell
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
        Filtros = []
        Columns = <
          item
            Expanded = False
            FieldName = 'UNIDADES'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CENTRO_COSTE'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGO_EXTERNO'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGO_PERSONA'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION_MAQUINA'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION_PRODUCTO'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'UBICACION'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLIENTE_VENDING'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA'
            Width = 112
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'INDENTIFICADOR_PERSONA'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MAQUINA'
            Width = 60
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'PRODUCTO'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EXISTE_ARTICULO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EXISTE_CLIENTE'
            Width = 70
            Visible = True
          end>
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 427
    Width = 1115
  end
  inherited CEMain: TControlEdit
    Left = 592
    Top = 60
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 628
    Top = 60
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
    Left = 590
    Top = 28
    object ALeerMaquina: TAction
      Category = 'Procesos'
      Caption = 'Leer Datos'
      Hint = 'Importar datos Maquina Vending'
      ImageIndex = 49
    end
    object ACrearAlbaranes: TAction
      Category = 'Procesos'
      Caption = 'Crear Albaranes'
      Hint = 'Importar datos y crear albaranes'
      ImageIndex = 60
      OnExecute = ACrearAlbaranesExecute
    end
    object AMarcarTodas: TAction
      Category = 'Procesos'
      Caption = 'Marcar Todas'
      Hint = 'Marcar todas las maquinas'
      ImageIndex = 146
      OnExecute = AMarcarTodasExecute
    end
    object ADesmarcar: TAction
      Category = 'Procesos'
      Caption = 'Desmarcar Todas'
      Hint = 'Desmarcar todas las maquinas'
      ImageIndex = 147
      OnExecute = ADesmarcarExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'EURLCSV.Text')
    Left = 624
    Top = 24
  end
end
