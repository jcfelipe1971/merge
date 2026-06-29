inherited FMDatosTercerosIVA: TFMDatosTercerosIVA
  Left = 803
  Top = 206
  Caption = 'Datos generales para el IVA'
  ClientHeight = 287
  Position = poOwnerFormCenter
  OnCloseQuery = FormCloseQuery
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 263
    inherited TBMain: TLFToolBar
      TabOrder = 1
      inherited NavMain: THYMNavigator
        Width = 88
        VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        EditaControl = DBEFTercero
        InsertaControl = DBEFTercero
      end
      inherited TSepNav: TToolButton
        Left = 88
      end
      inherited EPMain: THYMEditPanel
        Left = 96
        Width = 23
        VisibleButtons = [neSalir]
        Hints.Strings = ()
        OnClickSalir = EPMainClickSalir
      end
      inherited TSepTerc: TToolButton
        Left = 119
      end
      inherited TbuttComp: TToolButton
        Left = 127
        Hint = 'Confirmar Datos'
        Action = ASalir
        Caption = 'Confirmar Datos'
      end
    end
    inherited PCMain: TLFPageControl
      Height = 233
      TabOrder = 0
      TabStop = False
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Height = 205
          object LTercero: TLFLabel
            Left = 65
            Top = 27
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tercero'
          end
          object LCuenta: TLFLabel
            Left = 68
            Top = 71
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cuenta'
          end
          object LModoIva: TLFLabel
            Left = 31
            Top = 93
            Width = 71
            Height = 13
            Alignment = taRightJustify
            Caption = 'Modo de I.V.A.'
          end
          object LBLNif: TLFLabel
            Left = 76
            Top = 49
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = 'N.I.F.'
          end
          object LBLDocNumero: TLFLabel
            Left = 39
            Top = 151
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Doc. N'#250'mero'
          end
          object LBLDocSerie: TLFLabel
            Left = 52
            Top = 173
            Width = 50
            Height = 13
            Alignment = taRightJustify
            Caption = 'Doc. Serie'
          end
          object DBETercero: TLFDbedit
            Left = 172
            Top = 23
            Width = 285
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
            TabOrder = 4
          end
          object DBECuenta: TLFDbedit
            Left = 194
            Top = 67
            Width = 263
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
            TabOrder = 7
          end
          object DBEModoIva: TLFDbedit
            Left = 172
            Top = 89
            Width = 285
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
            TabOrder = 6
          end
          object DBENif: TLFDbedit
            Left = 107
            Top = 45
            Width = 160
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'NIF'
            DataSource = DMBorradorContabilidad.DSxTerceros
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
          object DBRGSigno: TDBRadioGroup
            Left = 107
            Top = 110
            Width = 350
            Height = 34
            Columns = 2
            DataField = 'SIGNO'
            DataSource = DMBorradorContabilidad.DSQMAsientos
            Items.Strings = (
              'IVA Soportado'
              'IVA Repercutido')
            TabOrder = 3
            TabStop = True
            Values.Strings = (
              '1'
              '0')
          end
          object DBEFTercero: TLFDBEditFind2000
            Left = 107
            Top = 23
            Width = 64
            Height = 21
            DataField = 'TERCERO'
            DataSource = DMBorradorContabilidad.DSQMAsientos
            TabOrder = 0
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TERCEROS'
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'TERCERO'
              'NOMBRE_COMERCIAL'
              'NIF')
            CampoNum = 'TERCERO'
            CampoStr = 'NOMBRE_COMERCIAL'
            CampoADevolver = 'TERCERO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TERCERO')
            Filtros = []
            Entorno = DMBorradorContabilidad.EntornoFind
          end
          object DBEFCuenta: TLFDBEditFind2000
            Left = 107
            Top = 67
            Width = 86
            Height = 21
            DataField = 'CUENTA'
            DataSource = DMBorradorContabilidad.DSQMAsientos
            TabOrder = 1
            OnExit = DBEFCuentaExit
            OnKeyDown = DBEFCuentaKeyDown
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'CUENTA'
              'TITULO')
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CampoADevolver = 'CUENTA'
            CondicionBusqueda = 'NIVEL=5'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFCuentaBusqueda
            OrdenadoPor.Strings = (
              'CUENTA')
            Filtros = [obEmpresa, obEjercicio]
            Entorno = DMBorradorContabilidad.EntornoFind
          end
          object DBEFModoIVA: TLFDBEditFind2000
            Left = 107
            Top = 89
            Width = 64
            Height = 21
            DataField = 'MODO_IVA'
            DataSource = DMBorradorContabilidad.DSQMAsientos
            TabOrder = 2
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_MODO_IVA'
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'MODO'
              'TITULO'
              'IVA'
              'RECARGO')
            CampoNum = 'MODO'
            CampoStr = 'TITULO'
            CampoADevolver = 'MODO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'MODO')
            Filtros = []
            Entorno = DMBorradorContabilidad.EntornoFind
          end
          object DBEDoc_Numero: TLFDbedit
            Left = 107
            Top = 147
            Width = 64
            Height = 21
            DataField = 'DOC_NUMERO'
            DataSource = DMBorradorContabilidad.DSQMAsientos
            TabOrder = 8
          end
          object DBEFSerie: TLFDBEditFind2000
            Left = 107
            Top = 169
            Width = 64
            Height = 21
            DataField = 'DOC_SERIE'
            DataSource = DMBorradorContabilidad.DSQMAsientos
            TabOrder = 9
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CANALES_SERIES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'SERIE'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'SERIE')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMBorradorContabilidad.EntornoFind
          end
          object DBETitSerie: TLFDbedit
            Left = 172
            Top = 169
            Width = 285
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMBorradorContabilidad.DSxSerie
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 10
          end
        end
      end
      inherited TSTabla: TTabSheet
        TabVisible = False
        inherited DBGMain: THYTDBGrid
          Width = 385
          Height = 170
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 263
  end
  inherited CEMain: TControlEdit
    Left = 218
    Top = 8
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 268
    Top = 8
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
    Left = 324
    Top = 8
    object ASalir: TLFNoSaveAction
      Caption = 'Grabar Datos'
      Hint = 'Grabar Datos'
      ImageIndex = 41
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 166
    Top = 6
  end
end
