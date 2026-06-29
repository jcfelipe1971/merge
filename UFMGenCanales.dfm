inherited FMGenCanales: TFMGenCanales
  Left = 589
  Top = 218
  Width = 400
  Height = 310
  HelpContext = 19
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Canales de la Empresa'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 390
    Height = 257
    inherited TBMain: TLFToolBar
      Width = 386
      inherited NavMain: THYMNavigator
        Width = 176
        DataSource = DMGenCanales.DSQMGenCanales
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        OnClick = NavMainClick
        EditaControl = DBETitulo
        InsertaControl = DBETitulo
      end
      inherited TSepNav: TToolButton
        Left = 176
      end
      inherited EPMain: THYMEditPanel
        Left = 184
        Width = 78
        VisibleButtons = [neImprime, neRango, neSalir]
        Hints.Strings = ()
        Busca01 = DBETitulo
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
      Width = 386
      Height = 227
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 378
          Height = 199
          object LBLCanal: TLFLabel
            Left = 27
            Top = 20
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Canal'
          end
          object LBLTitulo: TLFLabel
            Left = 26
            Top = 42
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object LBLPais: TLFLabel
            Left = 32
            Top = 64
            Width = 22
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pa'#237's'
          end
          object LBLTipoIVA: TLFLabel
            Left = 13
            Top = 86
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo IVA'
          end
          object LBLMoneda: TLFLabel
            Left = 15
            Top = 130
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Moneda'
          end
          object LBLModoIVA: TLFLabel
            Left = 7
            Top = 108
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = 'Modo IVA'
          end
          object LBLPerfilDef: TLFLabel
            Left = 8
            Top = 152
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Perfil Def.'
          end
          object LColor: TLFLabel
            Left = 28
            Top = 173
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Color'
          end
          object DBECanal: TLFDbedit
            Left = 59
            Top = 16
            Width = 48
            Height = 21
            Color = clInfoBk
            DataField = 'CANAL'
            DataSource = DMGenCanales.DSQMGenCanales
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnChange = DBECanalChange
          end
          object DBETitulo: TLFDbedit
            Left = 59
            Top = 38
            Width = 314
            Height = 21
            DataField = 'TITULO'
            DataSource = DMGenCanales.DSQMGenCanales
            TabOrder = 2
          end
          object DBCHKActivo: TLFDBCheckBox
            Left = 111
            Top = 18
            Width = 66
            Height = 17
            Caption = '&Activo'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 1
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO'
            DataSource = DMGenCanales.DSQMGenCanales
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFPais: TLFDBEditFind2000
            Left = 59
            Top = 60
            Width = 45
            Height = 21
            DataField = 'PAIS'
            DataSource = DMGenCanales.DSQMGenCanales
            TabOrder = 3
            OnChange = DBEFPaisChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_PAISES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'PAIS'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnExiste = DBEFPaisExiste
            OrdenadoPor.Strings = (
              'PAIS')
            Filtros = []
          end
          object EPaisTit: TLFEdit
            Left = 105
            Top = 60
            Width = 268
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
          object DBEFMoneda: TLFDBEditFind2000
            Left = 59
            Top = 126
            Width = 45
            Height = 21
            DataField = 'MONEDA'
            DataSource = DMGenCanales.DSQMGenCanales
            TabOrder = 13
            OnChange = DBEFMonedaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_MONEDAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'MONEDA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'MONEDA')
            Filtros = []
          end
          object EMonedaTit: TLFEdit
            Left = 105
            Top = 126
            Width = 268
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 14
          end
          object DBEFTipoIVA: TLFDBEditFind2000
            Left = 59
            Top = 82
            Width = 45
            Height = 21
            DataField = 'TIPO_IVA'
            DataSource = DMGenCanales.DSQMGenCanales
            TabOrder = 5
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TIPO_IVA'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TIPO')
            Filtros = [obPais]
          end
          object DBETitIva: TLFDbedit
            Left = 190
            Top = 82
            Width = 183
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMGenCanales.DSxTiposIVA
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
          end
          object DBETipIva: TLFDbedit
            Left = 105
            Top = 82
            Width = 44
            Height = 21
            Color = clInfoBk
            DataField = 'P_IVA'
            DataSource = DMGenCanales.DSxTiposIVA
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
          end
          object DBERecIva: TLFDbedit
            Left = 150
            Top = 82
            Width = 39
            Height = 21
            Color = clInfoBk
            DataField = 'P_RECARGO'
            DataSource = DMGenCanales.DSxTiposIVA
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 7
          end
          object DBEFModoIVA: TLFDBEditFind2000
            Left = 59
            Top = 104
            Width = 45
            Height = 21
            DataField = 'MODO_IVA'
            DataSource = DMGenCanales.DSQMGenCanales
            TabOrder = 9
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_MODO_IVA'
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'Iva'
              'Recargo'
              'Deducible')
            CampoNum = 'MODO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'MODO')
            Filtros = []
          end
          object DBEModoTit: TLFDbedit
            Left = 189
            Top = 104
            Width = 184
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMGenCanales.DSxModosIVA
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 12
          end
          object DBCHKIva: TLFDBCheckBox
            Left = 107
            Top = 106
            Width = 35
            Height = 17
            Hint = 'Tiene Cargo de IVA'
            Caption = 'Iva'
            ClicksDisabled = False
            Color = clBtnFace
            ColorCheck = 57088
            Enabled = False
            ParentColor = False
            TabOrder = 10
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'IVA'
            DataSource = DMGenCanales.DSxModosIVA
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCHKRecargo: TLFDBCheckBox
            Left = 146
            Top = 106
            Width = 39
            Height = 17
            Hint = 'Tiene Cargo de Recargo de Equivalencia'
            Caption = 'Rec.'
            ClicksDisabled = False
            Color = clBtnFace
            ColorCheck = 57088
            Enabled = False
            ParentColor = False
            TabOrder = 11
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'RECARGO'
            DataSource = DMGenCanales.DSxModosIVA
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFPerfil: TLFDBEditFind2000
            Left = 59
            Top = 148
            Width = 45
            Height = 21
            DataField = 'PERFIL'
            DataSource = DMGenCanales.DSQMGenCanales
            TabOrder = 15
            OnChange = DBEFPerfilChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_PERFILES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'PERFIL'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'PERFIL')
            Filtros = []
          end
          object ETituloPerfil: TLFEdit
            Left = 105
            Top = 148
            Width = 268
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 16
          end
          object EColor: TLFEdit
            Left = 59
            Top = 170
            Width = 87
            Height = 19
            Ctl3D = False
            ParentCtl3D = False
            ReadOnly = True
            TabOrder = 17
            Text = '             ...'
            OnClick = EColorClick
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 199
          DataSource = DMGenCanales.DSQMGenCanales
          ControlEdit = CEMain
          CamposAMarcar.Strings = (
            'ACTIVO')
          CamposChecked.Strings = (
            '1')
          CamposNoChecked.Strings = (
            '0')
          CamposAOrdenar.Strings = (
            'Canal'
            'titulo'
            'activo')
          Columns = <
            item
              Expanded = False
              FieldName = 'CANAL'
              Width = 43
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 251
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTIVO'
              Width = 42
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 257
    Width = 390
  end
  inherited CEMain: TControlEdit
    Left = 260
    Top = 40
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 310
    Top = 38
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
    Left = 314
    Top = 86
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AActivarCanal: TAction
      Category = 'Procesos'
      Caption = 'Activar el Canal actual'
      Hint = 'Activar el Canal actual'
      ImageIndex = 19
      OnExecute = AActivarCanalExecute
    end
    object ADesactivarCanal: TAction
      Category = 'Procesos'
      Caption = 'Desactivar el Canal actual'
      Hint = 'Desactivar el Canal actual'
      ImageIndex = 27
      OnExecute = ADesactivarCanalExecute
    end
    object AEliminaCanal: TAction
      Category = 'Procesos'
      Caption = 'Elimina el canal aunque tenga datos'
      Hint = 'Elimina el canal aunque tenga datos'
      ImageIndex = 27
      OnExecute = AEliminaCanalExecute
    end
    object AAsignaModoIva: TAction
      Category = 'Procesos;"Modo de Iva - Cliente"'
      Caption = 
        'Asigna el Modo de IVA del canal a las cuentas de clientes en est' +
        'e canal'
      Hint = 
        'Asigna el Modo de IVA del canal a las cuentas de clientes en est' +
        'e canal'
      ImageIndex = 104
      OnExecute = AAsignaModoIvaExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Procesos;"Modo de Iva - Cliente"'
      Caption = 'Modo de Iva - Cliente'
    end
    object ACopiaModoIva: TAction
      Category = 'Procesos;"Modo de Iva - Cliente"'
      Caption = 
        'Copia el Modo de IVA de las cuentas de gesti'#243'n del canal selecci' +
        'onado al canal de trabajo'
      Hint = 
        'Copia el Modo de IVA de las cuentas de gesti'#243'n del canal selecci' +
        'onado al canal de trabajo'
      ImageIndex = 37
      OnExecute = ACopiaModoIvaExecute
    end
    object AAsignaModoIvaProv: TAction
      Category = 'Procesos;"Modo de Iva - Proveedor"'
      Caption = 
        'Asigna el Modo de IVA del canal a las cuentas de proveedores en ' +
        'este canal'
      Hint = 
        'Asigna el Modo de IVA del canal a las cuentas de proveedores en ' +
        'este canal'
      ImageIndex = 64
      OnExecute = AAsignaModoIvaProvExecute
    end
    object AAsignaModoIvaAcr: TAction
      Category = 'Procesos;"Modo de Iva - Acreedor"'
      Caption = 
        'Asigna el Modo de IVA del canal a las cuentas de acreedores en e' +
        'ste canal'
      Hint = 
        'Asigna el Modo de IVA del canal a las cuentas de acreedores en e' +
        'ste canal'
      ImageIndex = 63
      OnExecute = AAsignaModoIvaAcrExecute
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Procesos;"Modo de Iva - Proveedor"'
      Caption = 'Modo de Iva - Proveedor'
    end
    object LFCategoryAction4: TLFCategoryAction
      Category = 'Procesos;"Modo de Iva - Acreedor"'
      Caption = 'Modo de Iva - Acreedor'
    end
    object ACopiaModoIvaAcre: TAction
      Category = 'Procesos;"Modo de Iva - Acreedor"'
      Caption = 
        'Copia el Modo de IVA de las cuentas de gesti'#243'n del canal selecci' +
        'onado al canal de trabajo'
      Hint = 
        'Copia el Modo de IVA de las cuentas de gesti'#243'n del canal selecci' +
        'onado al canal de trabajo'
      ImageIndex = 37
      OnExecute = ACopiaModoIvaAcreExecute
    end
    object ACopiaModoIvaProv: TAction
      Category = 'Procesos;"Modo de Iva - Proveedor"'
      Caption = 
        'Copia el Modo de IVA de las cuentas de gesti'#243'n del canal selecci' +
        'onado al canal de trabajo'
      Hint = 
        'Copia el Modo de IVA de las cuentas de gesti'#243'n del canal selecci' +
        'onado al canal de trabajo'
      ImageIndex = 37
      OnExecute = ACopiaModoIvaProvExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 260
    Top = 90
  end
end
