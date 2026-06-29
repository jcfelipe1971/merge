inherited FMMonedaCuenta: TFMMonedaCuenta
  Left = 369
  Top = 382
  Height = 316
  HelpContext = 32
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Monedas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 263
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        Width = 176
        DataSource = DMMonedaCuenta.DSQMMonedas
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        EditaControl = DBENegativa
        InsertaControl = DBENegativa
      end
      inherited TSepNav: TToolButton
        Left = 176
      end
      inherited EPMain: THYMEditPanel
        Left = 184
        VisibleButtons = [neBuscar, neImprime, neRango, neSalir]
        Hints.Strings = ()
        Busca01 = DBEMoneda
        Busca02 = ETituloMoneda
        Busca03 = Owner
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 264
      end
      inherited TbuttComp: TToolButton
        Left = 272
      end
    end
    inherited PCMain: TLFPageControl
      Height = 233
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Height = 205
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = DMMonedaCuenta.DSQMMonedas
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'VER_CUENTAS_MONEDA'
            CampoNum = 'MONEDA'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'MONEDA')
          end
          object LBLMoneda: TLFLabel
            Left = 22
            Top = 52
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Moneda'
          end
          object LBNegativa: TLFLabel
            Left = 18
            Top = 73
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Negativa'
          end
          object LBPositiva: TLFLabel
            Left = 24
            Top = 94
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Positiva'
          end
          object DBEMoneda: TLFDbedit
            Left = 66
            Top = 48
            Width = 100
            Height = 21
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'MONEDA'
            DataSource = DMMonedaCuenta.DSQMMonedas
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnChange = DBEMonedaChange
          end
          object ETituloMoneda: TLFEdit
            Left = 167
            Top = 48
            Width = 303
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object DBENegativa: TLFDBEditFind2000
            Left = 66
            Top = 70
            Width = 100
            Height = 21
            DataField = 'CUENTA_NEGATIVO'
            DataSource = DMMonedaCuenta.DSQMMonedas
            TabOrder = 2
            OnChange = DBENegativaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'tipo=5'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEPositiva: TLFDBEditFind2000
            Left = 66
            Top = 92
            Width = 100
            Height = 21
            DataField = 'CUENTA_POSITIVO'
            DataSource = DMMonedaCuenta.DSQMMonedas
            TabOrder = 3
            OnChange = DBEPositivaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'tipo=5'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloCtaNegativa: TLFEdit
            Left = 167
            Top = 70
            Width = 303
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
          object ETituloCtaPositiva: TLFEdit
            Left = 167
            Top = 92
            Width = 303
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Height = 205
          DataSource = DMMonedaCuenta.DSQMMonedas
          CamposAOrdenar.Strings = (
            'DEC_CALCULOS'
            'DEC_VER'
            'MONEDA'
            'SIGNO_MONEDA'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'MONEDA'
              Width = 77
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 187
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUENTA_NEGATIVO'
              Width = 98
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUENTA_POSITIVO'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 263
  end
  inherited CEMain: TControlEdit
    Left = 284
    Top = 14
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 324
    Top = 14
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
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
    Left = 286
    Top = 60
  end
  inherited FSMain: TLFFibFormStorage
    Left = 326
    Top = 60
  end
end
