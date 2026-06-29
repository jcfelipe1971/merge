inherited FMRemesasImpagado: TFMRemesasImpagado
  Left = 648
  Top = 184
  Caption = 'Impagado'
  ClientHeight = 211
  ClientWidth = 312
  OldCreateOrder = True
  Position = poOwnerFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 312
    Height = 187
    object LFechaImpagado: TLFLabel [0]
      Left = 68
      Top = 104
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha Imp.'
    end
    object LBLGastos: TLFLabel [1]
      Left = 61
      Top = 39
      Width = 60
      Height = 13
      Alignment = taRightJustify
      Caption = 'Base Gastos'
    end
    object LBLGastosSinIva: TLFLabel [2]
      Left = 52
      Top = 83
      Width = 69
      Height = 13
      Alignment = taRightJustify
      Caption = 'Gastos sin IVA'
    end
    object LBLIvaGastos: TLFLabel [3]
      Left = 68
      Top = 61
      Width = 53
      Height = 13
      Alignment = taRightJustify
      Caption = 'IVA Gastos'
    end
    object LCentroCoste: TLFLabel [4]
      Left = 60
      Top = 126
      Width = 61
      Height = 13
      Alignment = taRightJustify
      Caption = 'Centro Coste'
    end
    inherited TBMain: TLFToolBar
      Width = 308
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      object TButtConfirmar: TToolButton [0]
        Left = 0
        Top = 0
        Hint = 'Confirmar el vencimiento'
        Caption = 'Confirmar'
        ImageIndex = 19
        ParentShowHint = False
        ShowHint = True
        OnClick = TButtConfirmarClick
      end
      inherited EPMain: THYMEditPanel
        Left = 23
        Width = 23
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object REBaseGastos: TLFEdit
      Left = 126
      Top = 34
      Width = 114
      Height = 21
      TabOrder = 1
      OnKeyDown = OnKeyDown
    end
    object REIvaGastos: TLFEdit
      Left = 126
      Top = 56
      Width = 114
      Height = 21
      TabOrder = 2
      OnKeyDown = OnKeyDown
    end
    object REGastosSinIva: TLFEdit
      Left = 126
      Top = 78
      Width = 114
      Height = 21
      TabOrder = 3
      OnKeyDown = OnKeyDown
    end
    object DTPFechaImpagado: TLFDateEdit
      Left = 126
      Top = 100
      Width = 114
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 4
    end
    object EFDigito_1: TLFEditFind2000
      Left = 126
      Top = 122
      Width = 22
      Height = 21
      MaxLength = 1
      TabOrder = 5
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'LET_DIGITO'
      CampoStr = 'TITULO'
      CondicionBusqueda = 'num_digito=1'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = True
      Tabla_a_buscar = 'CON_CENTROS_COSTE'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'let_digito')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object EFDigito_2: TLFEditFind2000
      Left = 149
      Top = 122
      Width = 22
      Height = 21
      MaxLength = 1
      TabOrder = 6
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'LET_DIGITO'
      CampoStr = 'TITULO'
      CondicionBusqueda = 'num_digito=2'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'CON_CENTROS_COSTE'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'let_digito')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object EFDigito_3: TLFEditFind2000
      Left = 172
      Top = 122
      Width = 22
      Height = 21
      MaxLength = 1
      TabOrder = 7
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'LET_DIGITO'
      CampoStr = 'TITULO'
      CondicionBusqueda = 'num_digito=3'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'CON_CENTROS_COSTE'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'let_digito')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object EFDigito_4: TLFEditFind2000
      Left = 195
      Top = 122
      Width = 22
      Height = 21
      MaxLength = 1
      TabOrder = 8
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'LET_DIGITO'
      CampoStr = 'TITULO'
      CondicionBusqueda = 'num_digito=4'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'CON_CENTROS_COSTE'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'let_digito')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object EFDigito_5: TLFEditFind2000
      Left = 218
      Top = 122
      Width = 22
      Height = 21
      MaxLength = 1
      TabOrder = 9
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'LET_DIGITO'
      CampoStr = 'TITULO'
      CondicionBusqueda = 'num_digito=5'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'CON_CENTROS_COSTE'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'let_digito')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Entorno = DMMain.EntornoBusqueda
    end
    object CBGastosEmpresa: TLFCheckBox
      Left = 126
      Top = 146
      Width = 169
      Height = 33
      Caption = 'Gastos a cargo de la Empresa'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 10
      TabStop = True
      Alignment = taLeftJustify
    end
  end
  inherited TBActions: TLFToolBar
    Top = 187
    Width = 312
  end
  inherited CEMainPMEdit: TPopUpTeclas
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
end
