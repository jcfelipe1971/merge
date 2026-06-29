inherited FMCuentasIRPF: TFMCuentasIRPF
  Left = 619
  Top = 267
  Width = 600
  Height = 370
  HelpContext = 306
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Cuentas I.R.P.F.'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 590
    Height = 317
    inherited TBMain: TLFToolBar
      Width = 586
      inherited NavMain: THYMNavigator
        Width = 176
        DataSource = DMCuentasIRPF.DSQMVerIRPF
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        EditaControl = DBECargoIRPF
      end
      inherited TSepNav: TToolButton
        Left = 176
      end
      inherited EPMain: THYMEditPanel
        Left = 184
        VisibleButtons = [neBuscar, neImprime, neRango, neSalir]
        Hints.Strings = ()
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
      Width = 586
      Height = 287
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 578
          Height = 259
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = DMCuentasIRPF.DSQMVerIRPF
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'VER_IRPF'
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa, obEjercicio, obCanal, obPais]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'TIPO')
          end
          object LBLTipo: TLFLabel
            Left = 65
            Top = 66
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
            FocusControl = DBETipoDet
          end
          object LBLRetencion: TLFLabel
            Left = 37
            Top = 88
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Retenci'#243'n'
          end
          object LBLAplicableA: TLFLabel
            Left = 174
            Top = 88
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Aplicable a'
          end
          object DBETipo: TLFDbedit
            Left = 90
            Top = 62
            Width = 34
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TIPO'
            DataSource = DMCuentasIRPF.DSQMVerIRPF
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBETipoDet: TLFDbedit
            Left = 125
            Top = 62
            Width = 290
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMCuentasIRPF.DSQMVerIRPF
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBE_P_Iva: TLFDbedit
            Left = 90
            Top = 84
            Width = 64
            Height = 21
            Color = clInfoBk
            DataField = 'P_IRPF'
            DataSource = DMCuentasIRPF.DSQMVerIRPF
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object GBCuentas: TGroupBox
            Left = 8
            Top = 113
            Width = 559
            Height = 80
            Caption = 'Cuentas'
            TabOrder = 3
            object LBLCargoIVA: TLFLabel
              Left = 15
              Top = 24
              Width = 28
              Height = 13
              Alignment = taRightJustify
              Caption = 'Cargo'
            end
            object LBLCargoRec: TLFLabel
              Left = 12
              Top = 46
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = 'Abono'
            end
            object DBECargoIRPF: TLFDBEditFind2000
              Left = 47
              Top = 20
              Width = 98
              Height = 21
              DataField = 'CUENTA'
              DataSource = DMCuentasIRPF.DSQMVerIRPF
              TabOrder = 0
              OnChange = DBECargoIRPFChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'VER_SUBCUENTAS_GESTION'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'CUENTA'
              CampoStr = 'TITULO'
              CampoADevolver = 'CUENTA'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OnVerificacion = DBECargoIRPFVerificacion
              OrdenadoPor.Strings = (
                'CUENTA')
              Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
              Entorno = DMMain.EntornoBusqueda
            end
            object DBEAbonoIRPF: TLFDBEditFind2000
              Left = 47
              Top = 42
              Width = 98
              Height = 21
              DataField = 'CUENTA_ABONO'
              DataSource = DMCuentasIRPF.DSQMVerIRPF
              TabOrder = 1
              OnChange = DBEAbonoIRPFChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'VER_SUBCUENTAS_GESTION'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'CUENTA'
              CampoStr = 'TITULO'
              CampoADevolver = 'CUENTA'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OnVerificacion = DBEAbonoIRPFVerificacion
              OrdenadoPor.Strings = (
                'CUENTA')
              Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
              Entorno = DMMain.EntornoBusqueda
            end
            object ECuentaCargo: TLFEdit
              Left = 146
              Top = 20
              Width = 402
              Height = 21
              TabStop = False
              Color = clInfoBk
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
            end
            object ECuentaAbono: TLFEdit
              Left = 146
              Top = 42
              Width = 402
              Height = 21
              TabStop = False
              Color = clInfoBk
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 3
            end
          end
          object DBEAplicableA: TLFDbedit
            Left = 230
            Top = 84
            Width = 185
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO_BASE'
            DataSource = DMCuentasIRPF.DSQMVerIRPF
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 578
          Height = 259
          DataSource = DMCuentasIRPF.DSQMVerIRPF
          CamposAOrdenar.Strings = (
            'CUENTA'
            'CUENTA_ABONO'
            'P_IRPF'
            'TIPO')
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 204
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P_IRPF'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUENTA'
              Width = 105
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUENTA_ABONO'
              Width = 103
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 317
    Width = 590
  end
  inherited CEMain: TControlEdit
    Left = 300
    Top = 12
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 336
    Top = 12
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
end
