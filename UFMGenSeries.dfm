inherited FMGenSeries: TFMGenSeries
  Left = 367
  Top = 292
  Width = 483
  Height = 322
  HelpContext = 20
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Series de Empresa'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 473
    Height = 269
    inherited TBMain: TLFToolBar
      Width = 469
      inherited NavMain: THYMNavigator
        Width = 198
        DataSource = DMGenSeries.DSQMGenSeries
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBETitulo
      end
      inherited TSepNav: TToolButton
        Left = 198
      end
      inherited EPMain: THYMEditPanel
        Left = 206
        Width = 78
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 286
      end
      inherited TbuttComp: TToolButton
        Left = 294
      end
    end
    inherited PCMain: TLFPageControl
      Width = 469
      Height = 239
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 461
          Height = 211
          inherited G2KTableLoc: TG2KTBLoc
            Left = 106
            Top = 48
            DataSource = DMGenSeries.DSQMGenSeries
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'GEN_SERIES'
            CampoNum = 'SERIE'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'SERIE')
          end
          object LSerie: TLFLabel
            Left = 89
            Top = 36
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Serie'
          end
          object LTitulo: TLFLabel
            Left = 85
            Top = 58
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object LProvincia: TLFLabel
            Left = 69
            Top = 78
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Provincia'
          end
          object LAutorizacionSFV: TLFLabel
            Left = 32
            Top = 123
            Width = 81
            Height = 13
            Alignment = taRightJustify
            Caption = 'Autorizacion SFV'
          end
          object LTipoNCF: TLFLabel
            Left = 69
            Top = 145
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo NCF'
          end
          object DBESerie: TLFDbedit
            Left = 118
            Top = 32
            Width = 75
            Height = 21
            TabStop = False
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'SERIE'
            DataSource = DMGenSeries.DSQMGenSeries
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 118
            Top = 54
            Width = 340
            Height = 21
            DataField = 'TITULO'
            DataSource = DMGenSeries.DSQMGenSeries
            TabOrder = 1
          end
          object DBCHKActivo: TLFDBCheckBox
            Left = 118
            Top = 165
            Width = 100
            Height = 17
            Caption = '&Activa'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 9
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO'
            DataSource = DMGenSeries.DSQMGenSeries
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFProvincia: TLFDBEditFind2000
            Left = 118
            Top = 76
            Width = 45
            Height = 21
            DataField = 'PROVINCIA'
            DataSource = DMGenSeries.DSQMGenSeries
            TabOrder = 2
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_PROVINCIAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'PROVINCIA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'PROVINCIA')
            Filtros = []
          end
          object DBEProvincia: TLFDbedit
            Left = 164
            Top = 76
            Width = 294
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMGenSeries.DSxPronvicia
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object DBCBRectificaciones: TLFDBCheckBox
            Left = 118
            Top = 181
            Width = 100
            Height = 17
            Caption = '&Rectificaci'#243'n'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 10
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'RECT'
            DataSource = DMGenSeries.DSQMGenSeries
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEAutorizacionSFV: TLFDBEditFind2000
            Left = 118
            Top = 120
            Width = 340
            Height = 21
            DataField = 'SFV_AUTORIZACION'
            DataSource = DMGenSeries.DSQMGenSeries
            ReadOnly = True
            TabOrder = 6
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SFV_AUTORIZACIONES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'AUTORIZACION'
            CampoStr = 'FECHA_DESDE'
            CondicionBusqueda = 'TIPO='#39'E'#39
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'AUTORIZACION')
            Filtros = [obEmpresa]
          end
          object DBETipoNCF: TLFDBEditFind2000
            Left = 118
            Top = 142
            Width = 45
            Height = 21
            DataField = 'Z_TIPO_NCF'
            DataSource = DMGenSeries.DSQMGenSeries
            TabOrder = 7
            OnChange = DBETipoNCFChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'Z_SYS_TIPO_NCF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO_NCF'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TIPO_NCF')
            Filtros = []
          end
          object ETituloTipoNCF: TLFEdit
            Left = 164
            Top = 142
            Width = 294
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            TabOrder = 8
          end
          object DBCBEmitidaPorTerceros: TLFDBCheckBox
            Left = 0
            Top = 101
            Width = 131
            Height = 17
            Caption = 'Emitida por Terceros'
            ClicksDisabled = False
            ColorCheck = 57088
            Layout = checkboxRight
            TabOrder = 4
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'EMITIDA_POR_TERCEROS'
            DataSource = DMGenSeries.DSQMGenSeries
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEPrefijoTerceros: TLFDbedit
            Left = 136
            Top = 98
            Width = 322
            Height = 21
            DataField = 'PREFIJO_FAC_TERCERO'
            DataSource = DMGenSeries.DSQMGenSeries
            TabOrder = 5
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 461
          Height = 211
          DataSource = DMGenSeries.DSQMGenSeries
          ControlEdit = CEMain
          CamposAMarcar.Strings = (
            'ACTIVO')
          CamposChecked.Strings = (
            '1')
          CamposNoChecked.Strings = (
            '0')
          CamposAOrdenar.Strings = (
            'serie'
            'titulo'
            'activo')
          Columns = <
            item
              Expanded = False
              FieldName = 'SERIE'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 242
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTIVO'
              Width = 44
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 269
    Width = 473
    EdgeBorders = []
  end
  inherited CEMain: TControlEdit
    Left = 282
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 320
    Top = 30
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 276
    Top = 84
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AActivarSerie: TAction
      Category = 'Procesos'
      Caption = 'Activar la Serie actual'
      Hint = 'Activar la Serie actual'
      ImageIndex = 19
      OnExecute = AActivarSerieExecute
    end
    object ADesactivarSerie: TAction
      Category = 'Procesos'
      Caption = 'Desactivar la Serie actual'
      Hint = 'Desactivar la Serie actual'
      ImageIndex = 27
      OnExecute = ADesactivarSerieExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 322
    Top = 88
  end
end
