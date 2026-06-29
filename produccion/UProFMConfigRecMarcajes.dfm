inherited ProFMConfigRecMarcajes: TProFMConfigRecMarcajes
  Left = 374
  Top = 184
  Width = 600
  Height = 451
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Configuraci'#243'n de Recogida de Marcajes'
  PopupMenu = CEDetallePMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 590
    Height = 200
    inherited TBMain: TLFToolBar
      Width = 586
      inherited NavMain: THYMNavigator
        Width = 200
        DataSource = ProDMConfigRecMarcajes.DSConfigCabMarca
        Hints.Strings = ()
        EditaControl = DBEDescrip
        InsertaControl = DBEDescrip
      end
      inherited TSepNav: TToolButton
        Left = 200
      end
      inherited EPMain: THYMEditPanel
        Left = 208
        Width = 78
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 288
      end
      inherited TbuttComp: TToolButton
        Left = 296
      end
      object TButtExportarConfig: TToolButton
        Left = 319
        Top = 0
        Hint = 'Exportar Configuraci'#243'n a Fichero'
        Caption = 'Exportar Configuraci'#243'n a Fichero'
        ImageIndex = 36
        OnClick = TButtExportarConfigClick
      end
    end
    inherited PCMain: TLFPageControl
      Width = 586
      Height = 170
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 578
          Height = 137
          Align = alTop
          inherited G2KTableLoc: TG2KTBLoc
            Top = 24
            DataSource = ProDMConfigRecMarcajes.DSConfigCabMarca
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'PRO_CONFIG_CAB_MARCA'
            CampoNum = 'RIG'
            CampoStr = 'DESCRIPCION'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'RIG')
          end
          object LblRutaOri: TLFLabel
            Left = 24
            Top = 30
            Width = 42
            Height = 13
            Caption = 'Ruta Ori.'
          end
          object LblFecha: TLFLabel
            Left = 393
            Top = 30
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LblCodigo: TLFLabel
            Left = 33
            Top = 7
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo'
          end
          object LblDescripcion: TLFLabel
            Left = 126
            Top = 7
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object LblRutaInc: TLFLabel
            Left = 22
            Top = 52
            Width = 44
            Height = 13
            Caption = 'Ruta Inc.'
          end
          object LblRutaDest: TLFLabel
            Left = 15
            Top = 74
            Width = 51
            Height = 13
            Caption = 'Ruta Dest.'
          end
          object LblRutaConfig: TLFLabel
            Left = 8
            Top = 96
            Width = 59
            Height = 13
            Caption = 'Ruta Config.'
          end
          object LblTipoRec: TLFLabel
            Left = 392
            Top = 52
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Recurso'
          end
          object DBERuta: TLFDbedit
            Left = 72
            Top = 26
            Width = 292
            Height = 21
            DataField = 'RUTA'
            DataSource = ProDMConfigRecMarcajes.DSConfigCabMarca
            MaxLength = 200
            TabOrder = 2
          end
          object ButtOrigen: TButton
            Left = 366
            Top = 26
            Width = 21
            Height = 21
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 3
            OnClick = ButtOrigenClick
          end
          object DBDFecha: TLFDBDateEdit
            Left = 430
            Top = 26
            Width = 97
            Height = 21
            DataField = 'FECHA'
            DataSource = ProDMConfigRecMarcajes.DSConfigCabMarca
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 10
          end
          object DBECodigo: TLFDbedit
            Left = 72
            Top = 4
            Width = 46
            Height = 21
            DataField = 'RIG'
            DataSource = ProDMConfigRecMarcajes.DSConfigCabMarca
            TabOrder = 0
          end
          object DBEDescrip: TLFDbedit
            Left = 187
            Top = 4
            Width = 340
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = ProDMConfigRecMarcajes.DSConfigCabMarca
            MaxLength = 100
            TabOrder = 1
          end
          object DBERutaInc: TLFDbedit
            Left = 72
            Top = 48
            Width = 292
            Height = 21
            DataField = 'RUTAINC'
            DataSource = ProDMConfigRecMarcajes.DSConfigCabMarca
            TabOrder = 4
          end
          object ButtInc: TButton
            Left = 366
            Top = 48
            Width = 21
            Height = 21
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 5
            OnClick = ButtIncClick
          end
          object ButtDest: TButton
            Left = 366
            Top = 70
            Width = 21
            Height = 21
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 7
            OnClick = ButtDestClick
          end
          object DBERutaDest: TLFDbedit
            Left = 72
            Top = 70
            Width = 292
            Height = 21
            DataField = 'RUTADEST'
            DataSource = ProDMConfigRecMarcajes.DSConfigCabMarca
            TabOrder = 6
          end
          object DBRGTMarcaje: TDBRadioGroup
            Left = 392
            Top = 69
            Width = 136
            Height = 65
            Caption = 'Tipo marcaje'
            DataField = 'TIPOMARCAJE'
            DataSource = ProDMConfigRecMarcajes.DSConfigCabMarca
            Items.Strings = (
              'Marcaje por parejas'
              'Marcaje por jornada')
            TabOrder = 12
            Values.Strings = (
              '0'
              '1')
          end
          object ButtConfig: TButton
            Left = 366
            Top = 92
            Width = 21
            Height = 21
            Caption = '...'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 9
            OnClick = ButtConfigClick
          end
          object DBERutaConfig: TLFDbedit
            Left = 72
            Top = 92
            Width = 292
            Height = 21
            DataField = 'RUTACONFIG'
            DataSource = ProDMConfigRecMarcajes.DSConfigCabMarca
            TabOrder = 8
          end
          object DBEFTipoRec: TLFDBEditFind2000
            Left = 463
            Top = 49
            Width = 64
            Height = 21
            DataField = 'TIPORECURSO'
            DataSource = ProDMConfigRecMarcajes.DSConfigCabMarca
            TabOrder = 11
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'PRO_SYS_RECURSOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'RECURSO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 578
          Height = 142
          DataSource = ProDMConfigRecMarcajes.DSConfigCabMarca
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          PopupMenu = CEMainPMEdit
          ControlEdit = CEMain
          Columns = <
            item
              Expanded = False
              FieldName = 'RIG'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 292
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RUTA'
              Width = 500
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RUTAINC'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RUTADEST'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RUTACONFIG'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPOMARCAJE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPORECURSO'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 398
    Width = 590
  end
  object PnlDet: TLFPanel [2]
    Left = 0
    Top = 200
    Width = 590
    Height = 198
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 2
    object TBDetalle: TLFToolBar
      Left = 0
      Top = 0
      Width = 590
      Height = 26
      AutoSize = True
      BorderWidth = 1
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Wrapable = False
      Separators = True
      object NavDetalle: THYMNavigator
        Left = 0
        Top = 0
        Width = 200
        Height = 22
        DataSource = ProDMConfigRecMarcajes.DSConfigDetMarca
        Flat = True
        ParentShowHint = False
        PopupMenu = CEDetallePMEdit
        ShowHint = True
        TabOrder = 0
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        EditaControl = DBGDetall
        InsertaControl = DBGDetall
        Exclusivo = True
        ControlEdit = CEDetalle
        OrdenAscendente = True
        InsertaUltimo = False
      end
    end
    object DBGDetall: TDBGridFind2000
      Left = 0
      Top = 26
      Width = 590
      Height = 172
      Align = alClient
      DataSource = ProDMConfigRecMarcajes.DSConfigDetMarca
      TabOrder = 1
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
      IndiceBitmapChecked = 3
      IndiceBitmapDescendente = 0
      BaseDeDatos = DMMain.DataBase
      BuscarNums = False
      Campos.Strings = (
        'TIPOMARC')
      CamposAMostrar.Strings = (
        'TIPOMARC'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0')
      CamposADevolver.Strings = (
        '')
      CamposDesplegar.Strings = (
        '1')
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      MensajeNoExiste = False
      Numericos.Strings = (
        'RECURSO')
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tablas.Strings = (
        'PRO_SYS_RECURSOS')
      Titulos.Strings = (
        'TITULO')
      Posicion = tpCentrado
      OrdenMultiple = False
      Filtros = []
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
          Width = 43
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ORDEN'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CAMPO'
          Width = 280
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LONG_INI'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LONG_FIN'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TABLA_FISICA'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CAMPO_FISICO'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIPOMARC'
          Width = 70
          Visible = True
        end>
    end
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEDetalle
    Left = 232
    Top = 224
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Top = 220
  end
  inherited ALMain: TLFActionList
    Left = 388
    Top = 12
  end
  inherited FSMain: TLFFibFormStorage
    Left = 426
    Top = 198
  end
  object CEDetalle: TControlEdit
    EnlazadoA = CEMain
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 236
    Top = 160
  end
  object CEDetallePMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 332
    Top = 156
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
