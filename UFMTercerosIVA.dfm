inherited FMTercerosIVA: TFMTercerosIVA
  Left = 814
  Top = 302
  Caption = 'Terceros y Modos de IVA'
  ClientHeight = 287
  Position = poOwnerFormCenter
  OnCloseQuery = FormCloseQuery
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 263
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        Width = 66
        DataSource = DMBorradorContabilidad.DSQMApuntes
        VisibleButtons = [nbEdit, nbPost, nbCancel]
        Hints.Strings = ()
        EditaControl = DBEBaseImponible
        InsertaControl = DBEBaseImponible
      end
      inherited TSepNav: TToolButton
        Left = 66
        Visible = False
      end
      inherited EPMain: THYMEditPanel
        Left = 74
        Width = 23
        VisibleButtons = [neSalir]
        Enabled = False
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 97
      end
      inherited TbuttComp: TToolButton
        Left = 105
      end
      object TButtSalir: TToolButton
        Left = 128
        Top = 0
        Hint = 'Confirmar Datos'
        Action = ASalir
        Caption = 'Confirmar Datos'
      end
    end
    inherited PCMain: TLFPageControl
      Height = 233
      TabStop = False
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Height = 205
          object LTercero: TLFLabel
            Left = 37
            Top = 43
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tercero'
          end
          object LCuenta: TLFLabel
            Left = 40
            Top = 65
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cuenta'
          end
          object LModoIva: TLFLabel
            Left = 12
            Top = 87
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Modo de IVA'
          end
          object LBaseImponible: TLFLabel
            Left = 2
            Top = 114
            Width = 72
            Height = 13
            Alignment = taRightJustify
            Caption = 'Base Imponible'
          end
          object Label1: TLFLabel
            Left = 15
            Top = 143
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cuenta Con.'
          end
          object DBETercerosNombre: TLFDbedit
            Left = 145
            Top = 39
            Width = 337
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'NOMBRE_COMERCIAL'
            DataSource = DMBorradorContabilidad.DSxTerceros
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
          object DBECuentaTitulo: TLFDbedit
            Left = 192
            Top = 61
            Width = 290
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMBorradorContabilidad.DSxCuentas
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
          object DBEModoIVATitulo: TLFDbedit
            Left = 145
            Top = 83
            Width = 337
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMBorradorContabilidad.DSxModoIva
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
          object DBEBaseImponible: TLFDbedit
            Left = 80
            Top = 110
            Width = 102
            Height = 21
            DataField = 'B_IMPONIBLE'
            DataSource = DMBorradorContabilidad.DSQMApuntes
            TabOrder = 0
          end
          object DBETercero: TLFDbedit
            Left = 80
            Top = 39
            Width = 64
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TERCERO'
            DataSource = DMBorradorContabilidad.DSQMAsientos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
          object DBECuenta: TLFDbedit
            Left = 80
            Top = 61
            Width = 111
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'CUENTA'
            DataSource = DMBorradorContabilidad.DSQMAsientos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
          end
          object DBEModo: TLFDbedit
            Left = 80
            Top = 83
            Width = 64
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'MODO_IVA'
            DataSource = DMBorradorContabilidad.DSQMAsientos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
          end
          object DBRGSigno: TDBRadioGroup
            Left = 184
            Top = 105
            Width = 272
            Height = 32
            Color = clBtnFace
            Columns = 2
            DataField = 'SIGNO'
            DataSource = DMBorradorContabilidad.DSQMAsientos
            Items.Strings = (
              'IVA Soportado'
              'IVA Repercutido')
            ParentColor = False
            ReadOnly = True
            TabOrder = 7
            Values.Strings = (
              '1'
              '0')
          end
          object DBETitCuentaCon: TLFDbedit
            Left = 182
            Top = 139
            Width = 300
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMBorradorContabilidad.DSxCuentasConDetalle
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 9
          end
          object DBEFCuenta_Con: TLFDBEditFind2000
            Left = 80
            Top = 139
            Width = 101
            Height = 21
            DataField = 'CUENTA_CON'
            DataSource = DMBorradorContabilidad.DSQMApuntes
            TabOrder = 8
            OnExit = DBEFCuenta_ConExit
            OnKeyDown = DBEFCuenta_ConKeyDown
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'tipo = 5'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFCuenta_ConBusqueda
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMBorradorContabilidad.EntornoFind
          end
          object CBAuto: TLFCheckBox
            Left = 80
            Top = 164
            Width = 209
            Height = 17
            Caption = 'No utilizar la suma de IVAS autom'#225'tica'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 10
            TabStop = True
            OnClick = CBAutoClick
            Alignment = taLeftJustify
          end
        end
      end
      inherited TSTabla: TTabSheet
        TabVisible = False
        inherited DBGMain: THYTDBGrid
          Width = 499
          Height = 161
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 263
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEMain
    Left = 384
    Top = 34
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 428
    inherited CEMainMifirst: TMenuItem
      Visible = False
    end
    inherited CEMainMiprior: TMenuItem
      Visible = False
    end
    inherited CEMainMinext: TMenuItem
      Visible = False
    end
    inherited CEMainMilast: TMenuItem
      Visible = False
    end
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
    inherited CEMainMirefresh: TMenuItem
      Visible = False
    end
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
    Left = 242
    Top = 6
  end
  inherited FSMain: TLFFibFormStorage
    Left = 288
    Top = 4
  end
  object ALNormal: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 160
    Top = 80
    object ASalir: TAction
      Caption = 'Salir'
      Hint = 'Salir'
      ImageIndex = 0
      OnExecute = ASalirExecute
    end
  end
end
