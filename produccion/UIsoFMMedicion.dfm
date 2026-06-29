inherited IsoFMMedicion: TIsoFMMedicion
  Left = 262
  Top = 173
  Width = 766
  Height = 576
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Control de los Equipos de Medici'#243'n'
  FormStyle = fsNormal
  PopupMenu = CEDetallePMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 756
    Height = 523
    inherited TBMain: TLFToolBar
      Width = 752
      inherited NavMain: THYMNavigator
        DataSource = IsoDMMedicion.DSQMMedicionC
        Hints.Strings = ()
        EditaControl = DBEDenominacion
        InsertaControl = DBEDenominacion
      end
      inherited EPMain: THYMEditPanel
        DataSource = IsoDMMedicion.DSQMMedicionC
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
        OnClickReport = EPMainClickReport
      end
    end
    inherited PCMain: TLFPageControl
      Width = 752
      Height = 493
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 744
          Height = 213
          Align = alTop
          inherited G2KTableLoc: TG2KTBLoc
            Top = 29
            DataSource = IsoDMMedicion.DSQMMedicionC
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'ISO_MEDICION_C'
            CampoNum = 'RIG'
            CampoStr = 'DENOMINACION'
          end
          object LRIG: TLFLabel
            Left = 46
            Top = 7
            Width = 19
            Height = 13
            Alignment = taRightJustify
            Caption = 'RIG'
            FocusControl = DBERIG
          end
          object LDenominacion: TLFLabel
            Left = 165
            Top = 7
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'Denominaci'#243'n'
            FocusControl = DBEDenominacion
          end
          object LCodId: TLFLabel
            Left = 524
            Top = 7
            Width = 88
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cod. Identificaci'#243'n'
            FocusControl = DBECodId
          end
          object LFechaAdq: TLFLabel
            Left = 525
            Top = 29
            Width = 87
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Adquisici'#243'n'
          end
          object LFabricante: TLFLabel
            Left = 180
            Top = 29
            Width = 50
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fabricante'
            FocusControl = DBEEFabricante
          end
          object LNroSerie: TLFLabel
            Left = 18
            Top = 29
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nro. Serie'
            FocusControl = DBENSerie
          end
          object LDescripcion: TLFLabel
            Left = 9
            Top = 51
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
            FocusControl = DBEDescrip
          end
          object LUbicacion: TLFLabel
            Left = 16
            Top = 73
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ubicaci'#243'n'
            FocusControl = DBEUbicacion
          end
          object LPCal: TLFLabel
            Left = 536
            Top = 73
            Width = 136
            Height = 13
            Alignment = taRightJustify
            Caption = 'Procedimiento de calibraci'#243'n'
            FocusControl = DBEPCal
          end
          object LUsuario: TLFLabel
            Left = 29
            Top = 97
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Usuario'
          end
          object LRangoMedida: TLFLabel
            Left = 6
            Top = 117
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Rango Med.'
            FocusControl = DBERangoMedida
          end
          object LDivEscala: TLFLabel
            Left = 247
            Top = 117
            Width = 87
            Height = 13
            Alignment = taRightJustify
            Caption = 'Divisi'#243'n de Escala'
            FocusControl = DBEDivEscala
          end
          object LIncertidumbre: TLFLabel
            Left = 534
            Top = 117
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Incertidumbre'
            FocusControl = DBEIncertidumbre
          end
          object LObservaciones: TLFLabel
            Left = 42
            Top = 139
            Width = 22
            Height = 13
            Alignment = taRightJustify
            Caption = 'Obs.'
          end
          object LFrecuenciaCalibrado: TLFLabel
            Left = 498
            Top = 96
            Width = 100
            Height = 13
            Alignment = taRightJustify
            Caption = 'Frecuencia Calibrado'
            FocusControl = DBEFrecCal
          end
          object LCertificado: TLFLabel
            Left = 269
            Top = 72
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#186' Certificado'
          end
          object LDias: TLFLabel
            Left = 657
            Top = 95
            Width = 21
            Height = 13
            Caption = 'd'#237'as'
          end
          object DBERIG: TLFDbedit
            Left = 69
            Top = 3
            Width = 86
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'RIG'
            DataSource = IsoDMMedicion.DSQMMedicionC
            Enabled = False
            TabOrder = 0
          end
          object DBEDenominacion: TLFDbedit
            Left = 237
            Top = 3
            Width = 257
            Height = 21
            DataField = 'DENOMINACION'
            DataSource = IsoDMMedicion.DSQMMedicionC
            TabOrder = 1
          end
          object DBECodId: TLFDbedit
            Left = 616
            Top = 3
            Width = 124
            Height = 21
            DataField = 'CODID'
            DataSource = IsoDMMedicion.DSQMMedicionC
            TabOrder = 2
          end
          object DBEEFabricante: TLFDbedit
            Left = 237
            Top = 25
            Width = 257
            Height = 21
            DataField = 'FABRICANTE'
            DataSource = IsoDMMedicion.DSQMMedicionC
            TabOrder = 4
          end
          object DBENSerie: TLFDbedit
            Left = 69
            Top = 25
            Width = 86
            Height = 21
            CharCase = ecUpperCase
            DataField = 'NSERIE'
            DataSource = IsoDMMedicion.DSQMMedicionC
            TabOrder = 3
          end
          object DBEDescrip: TLFDbedit
            Left = 69
            Top = 47
            Width = 671
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = IsoDMMedicion.DSQMMedicionC
            TabOrder = 6
          end
          object DBEUbicacion: TLFDbedit
            Left = 69
            Top = 69
            Width = 154
            Height = 21
            DataField = 'UBICACION'
            DataSource = IsoDMMedicion.DSQMMedicionC
            TabOrder = 7
          end
          object DBEPCal: TLFDbedit
            Left = 676
            Top = 69
            Width = 64
            Height = 21
            DataField = 'PRCAL'
            DataSource = IsoDMMedicion.DSQMMedicionC
            TabOrder = 9
          end
          object DBEFUsuarios: TLFDBEditFind2000
            Left = 69
            Top = 91
            Width = 65
            Height = 21
            DataField = 'USUARIO'
            DataSource = IsoDMMedicion.DSQMMedicionC
            TabOrder = 10
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_EMPLEADOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'EMPLEADO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object DBEDescUsuario: TLFDbedit
            Left = 135
            Top = 91
            Width = 357
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = IsoDMMedicion.DSxUsuarios
            Enabled = False
            ReadOnly = True
            TabOrder = 11
          end
          object DBERangoMedida: TLFDbedit
            Left = 69
            Top = 113
            Width = 154
            Height = 21
            DataField = 'RANGOM'
            DataSource = IsoDMMedicion.DSQMMedicionC
            TabOrder = 13
          end
          object DBEDivEscala: TLFDbedit
            Left = 338
            Top = 113
            Width = 154
            Height = 21
            DataField = 'DIVESCALA'
            DataSource = IsoDMMedicion.DSQMMedicionC
            TabOrder = 14
          end
          object DBEIncertidumbre: TLFDbedit
            Left = 602
            Top = 113
            Width = 138
            Height = 21
            DataField = 'INCERTIDUMBRE'
            DataSource = IsoDMMedicion.DSQMMedicionC
            TabOrder = 15
          end
          object DBMNotas: TLFDBMemo
            Left = 69
            Top = 135
            Width = 671
            Height = 73
            DataField = 'OBSERVACIONES'
            DataSource = IsoDMMedicion.DSQMMedicionC
            TabOrder = 16
          end
          object DBEFrecCal: TLFDbedit
            Left = 602
            Top = 91
            Width = 50
            Height = 21
            DataField = 'FRECUENCIA'
            DataSource = IsoDMMedicion.DSQMMedicionC
            TabOrder = 12
          end
          object DBENCertificado: TLFDbedit
            Left = 338
            Top = 69
            Width = 154
            Height = 21
            DataField = 'CERTIFICADO'
            DataSource = IsoDMMedicion.DSQMMedicionC
            TabOrder = 8
          end
          object DBDTPFechaAdq: TLFDBDateEdit
            Left = 616
            Top = 25
            Width = 124
            Height = 21
            DataField = 'FECHA_COMPRA'
            DataSource = IsoDMMedicion.DSQMMedicionC
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 5
          end
        end
        object PDetalle: TLFPanel
          Left = 0
          Top = 213
          Width = 744
          Height = 252
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBGFDetalle: TDBGridFind2000
            Left = 0
            Top = 26
            Width = 744
            Height = 226
            Align = alClient
            DataSource = IsoDMMedicion.DSQMMedicionD
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Insercion = False
            ColumnaInicial = 1
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
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
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
                FieldName = 'LINEA'
                ReadOnly = True
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA_ULT'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA_PROX'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'RESULTADO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LABORATORIO'
                Visible = True
              end>
          end
          object ToolBar1: TLFToolBar
            Left = 0
            Top = 0
            Width = 744
            Height = 26
            EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            TabOrder = 1
            Separators = True
            object NavDetalle: THYMNavigator
              Left = 0
              Top = 0
              Width = 240
              Height = 22
              DataSource = IsoDMMedicion.DSQMMedicionD
              Flat = True
              ParentShowHint = False
              PopupMenu = CEDetallePMEdit
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              EditaControl = DBGFDetalle
              InsertaControl = DBGFDetalle
              Exclusivo = True
              ControlEdit = CEDetalle
              OrdenAscendente = True
              InsertaUltimo = True
            end
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 744
          Height = 465
          DataSource = IsoDMMedicion.DSQMMedicionC
          CamposAOrdenar.Strings = (
            'CERTIFICADO'
            'CODID'
            'DENOMINACION'
            'DESCRIPCION'
            'DIVESCALA'
            'FABRICANTE'
            'FECHA_COMPRA'
            'FRECUENCIA'
            'INCERTIDUMBRE'
            'NSERIE'
            'PRCAL'
            'RANGOM'
            'RIG'
            'UBICACION'
            'USUARIO')
          Columns = <
            item
              Expanded = False
              FieldName = 'RIG'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DENOMINACION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_COMPRA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FABRICANTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NSERIE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRCAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UBICACION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'USUARIO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'xDescUsuario'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RANGOM'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIVESCALA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INCERTIDUMBRE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FRECUENCIA'
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
    Left = 500
    Top = 24
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 528
    Top = 24
  end
  inherited ALMain: TLFActionList
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AFichaControl: TAction
      Category = 'Listados'
      Caption = 'Listado Ficha de Control'
      ImageIndex = 14
      OnExecute = AFichaControlExecute
    end
    object ALstSegRev: TAction
      Category = 'Listados'
      Caption = 'Listado Siguientes Revisiones'
      ImageIndex = 14
      OnExecute = ALstSegRevExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
    object ALstConfig: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de Equipos de Medici'#243'n'
      ImageIndex = 77
      OnExecute = ALstConfigExecute
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos'
      ImageIndex = 59
    end
    object AAdjuntoMedicion: TAction
      Category = 'Adjuntos'
      Caption = 'Adjuntos de la medicion'
      Hint = 'Adjuntos de la medicion'
      ImageIndex = 59
      OnExecute = AAdjuntoMedicionExecute
    end
  end
  object CEDetalle: TControlEdit
    FichaEdicion = TSFicha
    FichaExclusiva = TSFicha
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 644
    Top = 27
  end
  object CEDetallePMEdit: TPopUpTeclas
    Left = 672
    Top = 32
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
