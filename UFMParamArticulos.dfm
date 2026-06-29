inherited FMParamArticulos: TFMParamArticulos
  Left = 285
  Top = 196
  AutoSize = True
  Caption = 'Parametrizaci'#243'n de C'#243'digos de Art'#237'culo'
  ClientHeight = 327
  ClientWidth = 524
  PopupMenu = CECabeceraPMEdit
  Position = poScreenCenter
  Visible = True
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 524
    Height = 303
    inherited TBMain: TLFToolBar
      Width = 520
      inherited NavMain: THYMNavigator
        DataSource = DMParamArticulos.DSTMaestro_Estructura
        Hints.Strings = ()
        PopupMenu = CECabeceraPMEdit
        EditaControl = DBECodigo
        InsertaControl = DBECodigo
        ControlEdit = CECabecera
      end
      inherited EPMain: THYMEditPanel
        VisibleButtons = [neBuscar, neImprime, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
    end
    inherited PCMain: TLFPageControl
      Top = 57
      Width = 520
      Height = 244
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 512
          Height = 216
          Enabled = True
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = DMParamArticulos.DSTMaestro_Estructura
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'ART_MOD_ESTRUCTURA_CAB'
            CampoNum = 'COD_MODELO'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'COD_MODELO')
          end
          object GridDetalle: THYTDBGrid
            Left = 41
            Top = 0
            Width = 295
            Height = 216
            TabStop = False
            Align = alClient
            Color = clInfoBk
            DataSource = DMParamArticulos.DSTDetalle_Estructura
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
            ParentFont = False
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
            AutoDeseleccionar = True
            PermutaPaneles = False
            CampoAOrdenarColor = clInfoBk
            OrdenMultiple = True
            Columns = <
              item
                Expanded = False
                FieldName = 'ORDEN'
                Width = 34
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TIPO'
                Width = 89
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DIGITOS'
                Width = 35
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LIBRE'
                Width = 97
                Visible = True
              end>
          end
          object PNLBotonera: TLFPanel
            Left = 0
            Top = 0
            Width = 41
            Height = 216
            Align = alLeft
            BevelOuter = bvNone
            TabOrder = 1
            object SBArriba: TSpeedButton
              Left = 8
              Top = 45
              Width = 23
              Height = 22
              Hint = 'Sube la linea'
              Flat = True
              ParentShowHint = False
              ShowHint = True
              OnClick = SBArribaClick
            end
            object SBAbajo: TSpeedButton
              Left = 8
              Top = 68
              Width = 23
              Height = 22
              Hint = 'Baja la linea'
              Flat = True
              ParentShowHint = False
              ShowHint = True
              OnClick = SBAbajoClick
            end
            object SBBorraLinea: TSpeedButton
              Left = 8
              Top = 128
              Width = 23
              Height = 22
              Hint = 'Borra la Linea'
              Flat = True
              ParentShowHint = False
              ShowHint = True
              OnClick = SBBorraLineaClick
            end
            object SBBorraTodas: TSpeedButton
              Left = 8
              Top = 151
              Width = 23
              Height = 22
              Hint = 'Borrar todas las lineas'
              Flat = True
              ParentShowHint = False
              ShowHint = True
              OnClick = SBBorraTodasClick
            end
          end
          object PNLSeleccion: TLFPanel
            Left = 336
            Top = 0
            Width = 176
            Height = 216
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 2
            object LDigitos: TLFLabel
              Left = 126
              Top = 12
              Width = 49
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'D'#237'gitos'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsUnderline]
              ParentFont = False
            end
            object LTipo: TLFLabel
              Left = 42
              Top = 12
              Width = 81
              Height = 13
              Alignment = taCenter
              AutoSize = False
              Caption = 'Tipo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsUnderline]
              ParentFont = False
            end
            object LEjercicio: TLFLabel
              Left = 79
              Top = 34
              Width = 50
              Height = 13
              Alignment = taRightJustify
              Caption = 'Ejercicio'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LTemporada: TLFLabel
              Left = 65
              Top = 60
              Width = 64
              Height = 13
              Alignment = taRightJustify
              Caption = 'Temporada'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LTalla: TLFLabel
              Left = 100
              Top = 86
              Width = 29
              Height = 13
              Alignment = taRightJustify
              Caption = 'Talla'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LColor: TLFLabel
              Left = 99
              Top = 111
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'Color'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LBaseModelo: TLFLabel
              Left = 55
              Top = 137
              Width = 74
              Height = 13
              Alignment = taRightJustify
              Caption = 'Base Modelo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LTextoLibre: TLFLabel
              Left = 64
              Top = 163
              Width = 65
              Height = 13
              Alignment = taRightJustify
              Caption = 'Texto Libre'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LTexto: TLFLabel
              Left = 16
              Top = 189
              Width = 33
              Height = 13
              Alignment = taRightJustify
              Caption = 'Texto'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object SBLibre: TSpeedButton
              Left = 10
              Top = 160
              Width = 23
              Height = 22
              Flat = True
              OnClick = SBLibreClick
            end
            object SBBase: TSpeedButton
              Left = 10
              Top = 134
              Width = 23
              Height = 22
              Flat = True
              OnClick = SBBaseClick
            end
            object SBColor: TSpeedButton
              Left = 10
              Top = 108
              Width = 23
              Height = 22
              Flat = True
              OnClick = SBColorClick
            end
            object SBTalla: TSpeedButton
              Left = 10
              Top = 82
              Width = 23
              Height = 22
              Flat = True
              OnClick = SBTallaClick
            end
            object SBTemporada: TSpeedButton
              Left = 10
              Top = 56
              Width = 23
              Height = 22
              Flat = True
              OnClick = SBTemporadaClick
            end
            object SBEjercicio: TSpeedButton
              Left = 10
              Top = 30
              Width = 23
              Height = 22
              Flat = True
              OnClick = SBEjercicioClick
            end
            object SEEjercicio: TSpinEdit
              Left = 132
              Top = 30
              Width = 37
              Height = 22
              MaxValue = 15
              MinValue = 1
              TabOrder = 0
              Value = 1
            end
            object SETemporada: TSpinEdit
              Left = 132
              Top = 56
              Width = 37
              Height = 22
              MaxValue = 15
              MinValue = 1
              TabOrder = 1
              Value = 1
            end
            object SETalla: TSpinEdit
              Left = 132
              Top = 82
              Width = 37
              Height = 22
              MaxValue = 15
              MinValue = 1
              TabOrder = 2
              Value = 1
            end
            object SEColor: TSpinEdit
              Left = 132
              Top = 107
              Width = 37
              Height = 22
              MaxValue = 15
              MinValue = 1
              TabOrder = 3
              Value = 1
            end
            object SEBase: TSpinEdit
              Left = 132
              Top = 133
              Width = 37
              Height = 22
              MaxValue = 15
              MinValue = 1
              TabOrder = 4
              Value = 1
            end
            object SELibre: TSpinEdit
              Left = 132
              Top = 159
              Width = 37
              Height = 22
              MaxValue = 15
              MinValue = 1
              TabOrder = 5
              Value = 1
            end
            object ETexto: TLFEdit
              Left = 56
              Top = 185
              Width = 113
              Height = 21
              CharCase = ecUpperCase
              TabOrder = 6
            end
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 512
          Height = 216
          DataSource = DMParamArticulos.DSTMaestro_Estructura
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ControlEdit = CECabecera
          CamposAOrdenar.Strings = (
            'COD_MODELO'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'COD_MODELO'
              Width = 96
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 378
              Visible = True
            end>
        end
      end
    end
    object PCabecera: TLFPanel
      Left = 2
      Top = 28
      Width = 520
      Height = 29
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object LTitulo: TLFLabel
        Left = 184
        Top = 6
        Width = 26
        Height = 13
        Alignment = taRightJustify
        Caption = 'Titulo'
        Layout = tlCenter
      end
      object LCodModelo: TLFLabel
        Left = 11
        Top = 5
        Width = 60
        Height = 13
        Alignment = taRightJustify
        Caption = 'C'#243'd. Modelo'
        Layout = tlCenter
      end
      object DBETitulo: TLFDbedit
        Left = 212
        Top = 2
        Width = 303
        Height = 21
        DataField = 'TITULO'
        DataSource = DMParamArticulos.DSTMaestro_Estructura
        TabOrder = 1
      end
      object DBECodigo: TLFDbedit
        Left = 74
        Top = 2
        Width = 105
        Height = 21
        DataField = 'COD_MODELO'
        DataSource = DMParamArticulos.DSTMaestro_Estructura
        TabOrder = 0
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 303
    Width = 524
  end
  inherited CEMain: TControlEdit
    FichaEdicion = nil
    FichaExclusiva = nil
    PanelEdicion = nil
    Teclas = nil
    Left = 476
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 432
    Top = 8
    inherited CEMainMifirst: TMenuItem
      OnClick = nil
    end
    inherited CEMainMiprior: TMenuItem
      OnClick = nil
    end
    inherited CEMainMinext: TMenuItem
      OnClick = nil
    end
    inherited CEMainMilast: TMenuItem
      OnClick = nil
    end
    inherited CEMainMiinsert: TMenuItem
      OnClick = nil
    end
    inherited CEMainMidelete: TMenuItem
      OnClick = nil
    end
    inherited CEMainMiedit: TMenuItem
      OnClick = nil
    end
    inherited CEMainMipost: TMenuItem
      OnClick = nil
    end
    inherited CEMainMicancel: TMenuItem
      OnClick = nil
    end
    inherited CEMainMirefresh: TMenuItem
      OnClick = nil
    end
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 326
  end
  object CEDetalle: TControlEdit
    DataSource = DMParamArticulos.DSTDetalle_Estructura
    EnlazadoA = CECabecera
    FichaEdicion = TSFicha
    FichaExclusiva = TSFicha
    PanelEdicion = PEdit
    PopUpMenu = CEMainPMEdit
    Teclas = DMMain.Teclas
    Left = 312
    Top = 88
  end
  object CECabecera: TControlEdit
    DataSource = DMParamArticulos.DSTMaestro_Estructura
    EnlazadoA = CEDetalle
    PanelEdicion = PCabecera
    PopUpMenu = CECabeceraPMEdit
    Teclas = DMMain.Teclas
    Left = 384
    Top = 32
  end
  object CECabeceraPMEdit: TPopUpTeclas
    Left = 464
    Top = 48
    object CECabeceraMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CECabeceraMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CECabeceraMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CECabeceraMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CECabeceraMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CECabeceraMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CECabeceraMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CECabeceraMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CECabeceraMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CECabeceraMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
