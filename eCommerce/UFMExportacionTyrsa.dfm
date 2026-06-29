inherited FMExportacionTyrsa: TFMExportacionTyrsa
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Exportacion Tyrsa'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    inherited TBMain: TLFToolBar
      inherited EPMain: THYMEditPanel
        Width = 33
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object PNLDetalle: TLFPanel
      Left = 2
      Top = 69
      Width = 498
      Height = 261
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object TBDetalle: TLFToolBar
        Left = 0
        Top = 0
        Width = 498
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
          Width = 230
          Height = 22
          DataSource = DMExportacionTyrsa.DSxTablasExportar
          ParentShowHint = False
          PopupMenu = CEMainPMEdit
          ShowHint = True
          TabOrder = 0
          ModoDeSeguridad = True
          DelCaption = 'Informaci'#243'n'
          DelMessage = ' '#191' Borra el registro ? '
          EditaControl = DBGFDetalle
          InsertaControl = DBGFDetalle
          Exclusivo = True
          ControlEdit = CEMain
          OrdenAscendente = True
          InsertaUltimo = False
        end
        object PNLProgreso: TLFPanel
          Left = 230
          Top = 2
          Width = 219
          Height = 22
          BevelOuter = bvNone
          TabOrder = 1
          DesignSize = (
            219
            22)
          object LProgreso: TLFLabel
            Left = 10
            Top = 4
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Progreso'
          end
          object Progreso: TProgressBar
            Left = 59
            Top = 0
            Width = 158
            Height = 22
            Anchors = [akLeft, akTop, akRight]
            Min = 0
            Max = 100
            TabOrder = 0
          end
        end
      end
      object DBGFDetalle: TDBGridFind2000
        Left = 0
        Top = 24
        Width = 498
        Height = 237
        Align = alClient
        DataSource = DMExportacionTyrsa.DSxTablasExportar
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Insercion = False
        ColumnaInicial = 0
        UsaDicG2K = False
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
        Transaction = DMExportacionTyrsa.TLocal
        BuscarNums = False
        CampoAOrdenarColor = clWindow
        CampoAOrdenarBitmaps = DMMain.ILOrdGrid
        ColumnasCheckBoxes.Strings = (
          'MARCADO')
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
            FieldName = 'NOMBRE'
            Width = 283
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MARCADO'
            Visible = True
          end>
      end
    end
    object PNLCabecera: TLFPanel
      Left = 2
      Top = 28
      Width = 498
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      DesignSize = (
        498
        41)
      object LRutaExportacion: TLFLabel
        Left = 5
        Top = 15
        Width = 82
        Height = 13
        Alignment = taRightJustify
        Caption = 'Ruta Exportaci'#243'n'
      end
      object DERutaExportacion: TDirectoryEdit
        Left = 91
        Top = 12
        Width = 398
        Height = 21
        DialogOptions = [sdAllowCreate]
        NumGlyphs = 1
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnExit = DERutaExportacionExit
      end
    end
  end
  inherited CEMain: TControlEdit
    DataSource = DMExportacionTyrsa.DSxTablasExportar
  end
  inherited CEMainPMEdit: TPopUpTeclas
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
    object AExportar: TAction
      Caption = 'Exportar'
      Hint = 'Exportar datos a fichero'
      ImageIndex = 36
      OnExecute = AExportarExecute
    end
  end
end
