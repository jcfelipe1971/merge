inherited FMFormasPagoTpv: TFMFormasPagoTpv
  Left = 461
  Top = 251
  Caption = 'Formas de Pago TPV'
  ClientHeight = 287
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 263
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        DataSource = DSQMFomaPago
        Hints.Strings = ()
      end
      inherited EPMain: THYMEditPanel
        Width = 23
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 251
      end
      inherited TbuttComp: TToolButton
        Left = 259
      end
    end
    inherited PCMain: TLFPageControl
      Height = 233
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Height = 205
          object LSerie: TLabel
            Left = 58
            Top = 60
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Serie'
          end
          object LFormaPago: TLabel
            Left = 25
            Top = 82
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Forma Pago'
          end
          object LCuenta: TLabel
            Left = 48
            Top = 104
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cuenta'
          end
          object DBESerie: TDBEdit
            Left = 88
            Top = 56
            Width = 102
            Height = 21
            Color = clInfoBk
            DataField = 'SERIE'
            DataSource = DSQMFomaPago
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnChange = DBESerieChange
          end
          object DBEFFormaPago: TDBEditFind2000
            Left = 88
            Top = 78
            Width = 102
            Height = 21
            DataField = 'FORMA_PAGO'
            DataSource = DSQMFomaPago
            TabOrder = 1
            OnChange = DBEFFormaPagoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_FORMAS_PAGO_EMP'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'FORMA'
            CampoStr = 'TITULO'
            CampoADevolver = 'FORMA'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBETituloFormaPago: TLFEdit
            Left = 191
            Top = 78
            Width = 278
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
          object DBEFCuenta: TDBEditFind2000
            Left = 88
            Top = 100
            Width = 102
            Height = 21
            DataField = 'CUENTA_PAGO'
            DataSource = DSQMFomaPago
            TabOrder = 2
            OnChange = DBEFCuentaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CampoADevolver = 'CUENTA'
            CondicionBusqueda = 'gestion=27 or gestion=11 or gestion=28'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBETituloCuenta: TLFEdit
            Left = 191
            Top = 100
            Width = 278
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
          object DBETituloSerie: TLFEdit
            Left = 191
            Top = 56
            Width = 278
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Height = 205
          DataSource = DSQMFomaPago
          ControlEdit = CEMain
          Columns = <
            item
              Expanded = False
              FieldName = 'FORMA_PAGO'
              Title.Caption = 'Forma de Pago'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUENTA_PAGO'
              Title.Caption = 'Cuenta'
              Width = 113
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
    Left = 242
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 284
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
    Left = 334
    Top = 32
  end
  inherited FSMain: TLFFibFormStorage
    Left = 242
    Top = 102
  end
  object DSQMFomaPago: TDataSource
    DataSet = DMFormasPagoTpv.QMFormasPagoTpv
    Left = 290
    Top = 102
  end
end
