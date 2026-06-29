inherited FMCuentasIVA: TFMCuentasIVA
  Left = 710
  Top = 214
  Width = 600
  Height = 416
  HelpContext = 305
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Cuentas IVA'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 590
    Height = 363
    inherited TBMain: TLFToolBar
      Width = 586
      inherited NavMain: THYMNavigator
        Width = 176
        DataSource = DMCuentasIVA.DSQMCuentaIVA
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        EditaControl = DBECargoIVA
      end
      inherited TSepNav: TToolButton
        Left = 176
      end
      inherited EPMain: THYMEditPanel
        Left = 184
        Width = 78
        VisibleButtons = [neImprime, neRango, neSalir]
        Hints.Strings = ()
        Busca01 = Owner
        Busca02 = Owner
        Busca03 = Owner
        Busca04 = Owner
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 262
      end
      inherited TbuttComp: TToolButton
        Left = 270
      end
    end
    inherited PCMain: TLFPageControl
      Width = 586
      Height = 333
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 578
          Height = 305
          inherited G2KTableLoc: TG2KTBLoc
            Top = 16
            DataSource = DMCuentasIVA.DSQMCuentaIVA
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'CON_CUENTAS_IVA'
          end
          object LBLTipo: TLFLabel
            Left = 22
            Top = 13
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
            FocusControl = DBETipoDet
          end
          object LBLModo: TLFLabel
            Left = 16
            Top = 35
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Modo'
            FocusControl = DBEModoDet
          end
          object DBETipoDet: TLFDbedit
            Left = 89
            Top = 9
            Width = 288
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMCuentasIVA.DSxTipoIva
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
          object DBEModoDet: TLFDbedit
            Left = 89
            Top = 31
            Width = 288
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMCuentasIVA.DSxModoIva
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
          object DBETipo: TLFDbedit
            Left = 48
            Top = 9
            Width = 40
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TIPO_IVA'
            DataSource = DMCuentasIVA.DSQMCuentaIVA
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
          object DBEModo: TLFDbedit
            Left = 48
            Top = 31
            Width = 40
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'MODO_IVA'
            DataSource = DMCuentasIVA.DSQMCuentaIVA
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
          object GBCuentasCargo: TGroupBox
            Left = 5
            Top = 61
            Width = 564
            Height = 116
            Caption = 'Cuentas de Cargo'
            TabOrder = 5
            object LBLCargoIVA: TLFLabel
              Left = 25
              Top = 24
              Width = 26
              Height = 13
              Alignment = taRightJustify
              Caption = 'I.V.A.'
            end
            object LBLCargoRec: TLFLabel
              Left = 30
              Top = 68
              Width = 21
              Height = 13
              Alignment = taRightJustify
              Caption = 'R.E.'
            end
            object LCtaCargoRECC: TLFLabel
              Left = 10
              Top = 46
              Width = 41
              Height = 13
              Hint = 'Registro Especial de Criterio de Caja'
              Alignment = taRightJustify
              Caption = 'R.E.C.C.'
              ParentShowHint = False
              ShowHint = True
            end
            object LCtaCargoISP: TLFLabel
              Left = 25
              Top = 90
              Width = 26
              Height = 13
              Alignment = taRightJustify
              Caption = 'I.S.P.'
            end
            object DBECargoIVA: TLFDBEditFind2000
              Left = 56
              Top = 20
              Width = 98
              Height = 21
              DataField = 'CTA_CARGO_IVA'
              DataSource = DMCuentasIVA.DSQMCuentaIVA
              TabOrder = 0
              OnChange = DBECargoIVAChange
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
              OnVerificacion = DBECargoIVAVerificacion
              OrdenadoPor.Strings = (
                'CUENTA')
              Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
              Entorno = DMMain.EntornoBusqueda
            end
            object DBECargoRec: TLFDBEditFind2000
              Left = 56
              Top = 64
              Width = 98
              Height = 21
              DataField = 'CTA_CARGO_REC'
              DataSource = DMCuentasIVA.DSQMCuentaIVA
              TabOrder = 2
              OnChange = DBECargoRecChange
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
              OnVerificacion = DBECargoRecVerificacion
              OrdenadoPor.Strings = (
                'CUENTA')
              Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
              Entorno = DMMain.EntornoBusqueda
            end
            object ETituloCargoIva: TLFEdit
              Left = 155
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
              TabOrder = 4
            end
            object ETituloCargoRec: TLFEdit
              Left = 155
              Top = 64
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
              TabOrder = 5
            end
            object DBECargoIVARECC: TLFDBEditFind2000
              Left = 56
              Top = 42
              Width = 98
              Height = 21
              DataField = 'CTA_CARGO_IVA_RECC'
              DataSource = DMCuentasIVA.DSQMCuentaIVA
              TabOrder = 1
              OnChange = DBECargoIVARECCChange
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
              OnVerificacion = DBECargoIVAVerificacion
              OrdenadoPor.Strings = (
                'CUENTA')
              Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
              Entorno = DMMain.EntornoBusqueda
            end
            object ETituloCargoIvaRECC: TLFEdit
              Left = 155
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
              TabOrder = 6
            end
            object DBECargoISP: TLFDBEditFind2000
              Left = 56
              Top = 86
              Width = 98
              Height = 21
              DataField = 'CTA_CARGO_IVA_ISP'
              DataSource = DMCuentasIVA.DSQMCuentaIVA
              TabOrder = 3
              OnChange = DBECargoISPChange
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
              OnVerificacion = DBECargoISPVerificacion
              OrdenadoPor.Strings = (
                'CUENTA')
              Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
              Entorno = DMMain.EntornoBusqueda
            end
            object ETituloCargoISP: TLFEdit
              Left = 155
              Top = 86
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
              TabOrder = 7
            end
          end
          object GBCuentasAbono: TGroupBox
            Left = 5
            Top = 179
            Width = 564
            Height = 118
            Caption = 'Cuentas de Abono'
            TabOrder = 6
            object LBLAbonoIVA: TLFLabel
              Left = 25
              Top = 25
              Width = 26
              Height = 13
              Alignment = taRightJustify
              Caption = 'I.V.A.'
            end
            object LBLAbonoRec: TLFLabel
              Left = 30
              Top = 69
              Width = 21
              Height = 13
              Alignment = taRightJustify
              Caption = 'R.E.'
            end
            object LCtaAbonoRECC: TLFLabel
              Left = 10
              Top = 47
              Width = 41
              Height = 13
              Hint = 'Registro Especial de Criterio de Caja'
              Alignment = taRightJustify
              Caption = 'R.E.C.C.'
              ParentShowHint = False
              ShowHint = True
            end
            object LCtaAbonoISP: TLFLabel
              Left = 25
              Top = 91
              Width = 26
              Height = 13
              Alignment = taRightJustify
              Caption = 'I.S.P.'
            end
            object DBEAbonoIVA: TLFDBEditFind2000
              Left = 56
              Top = 21
              Width = 98
              Height = 21
              DataField = 'CTA_ABONO_IVA'
              DataSource = DMCuentasIVA.DSQMCuentaIVA
              TabOrder = 0
              OnChange = DBEAbonoIVAChange
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
              OnVerificacion = DBEAbonoIVAVerificacion
              OrdenadoPor.Strings = (
                'CUENTA')
              Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
              Entorno = DMMain.EntornoBusqueda
            end
            object DBEAbonoRec: TLFDBEditFind2000
              Left = 56
              Top = 65
              Width = 98
              Height = 21
              DataField = 'CTA_ABONO_REC'
              DataSource = DMCuentasIVA.DSQMCuentaIVA
              TabOrder = 2
              OnChange = DBEAbonoRecChange
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
              OnVerificacion = DBEAbonoRecVerificacion
              OrdenadoPor.Strings = (
                'CUENTA')
              Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
              Entorno = DMMain.EntornoBusqueda
            end
            object ETituloAbonoIva: TLFEdit
              Left = 155
              Top = 21
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
              TabOrder = 4
            end
            object ETituloAbonoRec: TLFEdit
              Left = 155
              Top = 65
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
              TabOrder = 5
            end
            object DBEAbonoIVARECC: TLFDBEditFind2000
              Left = 56
              Top = 43
              Width = 98
              Height = 21
              DataField = 'CTA_ABONO_IVA_RECC'
              DataSource = DMCuentasIVA.DSQMCuentaIVA
              TabOrder = 1
              OnChange = DBEAbonoIVARECCChange
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
              OnVerificacion = DBEAbonoIVAVerificacion
              OrdenadoPor.Strings = (
                'CUENTA')
              Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
              Entorno = DMMain.EntornoBusqueda
            end
            object ETituloAbonoIvaRECC: TLFEdit
              Left = 155
              Top = 43
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
              TabOrder = 6
            end
            object DBEAbonoISP: TLFDBEditFind2000
              Left = 56
              Top = 87
              Width = 98
              Height = 21
              DataField = 'CTA_ABONO_IVA_ISP'
              DataSource = DMCuentasIVA.DSQMCuentaIVA
              TabOrder = 3
              OnChange = DBEAbonoISPChange
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
              OnVerificacion = DBEAbonoISPVerificacion
              OrdenadoPor.Strings = (
                'CUENTA')
              Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
              Entorno = DMMain.EntornoBusqueda
            end
            object ETituloAbonoISP: TLFEdit
              Left = 155
              Top = 87
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
              TabOrder = 7
            end
          end
          object GBPorcentajes: TGroupBox
            Left = 394
            Top = 3
            Width = 175
            Height = 51
            Caption = 'Porcentajes'
            Enabled = False
            TabOrder = 4
            object LBLIVA: TLFLabel
              Left = 6
              Top = 22
              Width = 20
              Height = 13
              Alignment = taRightJustify
              Caption = 'IVA.'
            end
            object LBLRE: TLFLabel
              Left = 94
              Top = 22
              Width = 18
              Height = 13
              Alignment = taRightJustify
              Caption = 'RE.'
            end
            object DBE_P_Iva: TLFDbedit
              Left = 30
              Top = 18
              Width = 50
              Height = 21
              Color = clInfoBk
              DataField = 'P_IVA'
              DataSource = DMCuentasIVA.DSQMCuentaIVA
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
            object DBE_P_Recargo: TLFDbedit
              Left = 116
              Top = 18
              Width = 50
              Height = 21
              Color = clInfoBk
              DataField = 'P_REC'
              DataSource = DMCuentasIVA.DSQMCuentaIVA
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
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 578
          Height = 266
          DataSource = DMCuentasIVA.DSQMCuentaIVA
          CamposAOrdenar.Strings = (
            'CTA_ABONO_IVA'
            'CTA_ABONO_REC'
            'CTA_CARGO_IVA'
            'CTA_CARGO_REC'
            'MODO_IVA'
            'TIPO_IVA')
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO_IVA'
              Title.Alignment = taCenter
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MODO_IVA'
              Title.Alignment = taCenter
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CTA_CARGO_IVA'
              Width = 103
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CTA_CARGO_REC'
              Width = 103
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CTA_ABONO_IVA'
              Width = 103
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CTA_ABONO_REC'
              Width = 103
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 363
    Width = 590
  end
  inherited CEMain: TControlEdit
    Left = 312
    Top = 0
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 364
    Top = 0
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
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
  inherited ALMain: TLFActionList
    Left = 424
    Top = 2
  end
  inherited FSMain: TLFFibFormStorage
    Left = 473
    Top = 1
  end
end
