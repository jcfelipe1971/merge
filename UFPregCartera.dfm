inherited FPregCartera: TFPregCartera
  Left = 403
  Top = 236
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado Cartera '
  ClientHeight = 439
  ClientWidth = 504
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 504
    Height = 208
    inherited TBMain: TLFToolBar
      Width = 504
      EdgeBorders = []
      object TButtConfRapida: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
        ParentShowHint = False
        ShowHint = True
      end
    end
    inherited PBListado: TProgressBar
      Top = 192
      Width = 504
    end
    inherited PCMain: TLFPageControl
      Width = 504
      Height = 156
      ActivePage = TSPagos
      TabIndex = 0
      object TSPagos: TTabSheet
        Caption = 'Pagos'
        object PCPAGOS: TLFPageControl
          Left = 0
          Top = 0
          Width = 496
          Height = 127
          ActivePage = TSAcreedores
          Align = alClient
          OwnerDraw = True
          TabIndex = 1
          TabOrder = 0
          TabPosition = tpBottom
          TabActiveColor = clWhite
          TabInactiveColor = 14936298
          object TSProveedores: TTabSheet
            Caption = '&Proveedores'
            object LHastaProveedor: TLFLabel
              Left = 10
              Top = 46
              Width = 28
              Height = 13
              Alignment = taRightJustify
              Caption = 'Hasta'
            end
            object LDesdeProveedor: TLFLabel
              Left = 7
              Top = 24
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = 'Desde'
            end
            object DBEProvDesde: TLFEdit
              Left = 110
              Top = 20
              Width = 370
              Height = 21
              Color = clInfoBk
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
            object EFProvHasta: TLFEditFind2000
              Left = 43
              Top = 42
              Width = 66
              Height = 21
              TabOrder = 1
              OnChange = EFProvHastaChange
              Base_de_datos = DMMain.DataBase
              Transaction = DMMain.TLocal
              BuscarNums = False
              BuscarChars = True
              AutoCambiarFoco = False
              CampoNum = 'PROVEEDOR'
              CampoStr = 'TITULO'
              Posicion = tpCentrado
              ReemplazarCaracter = True
              SalirSiVacio = True
              SalirSiNoExiste = False
              Tabla_a_buscar = 'VER_PROVEEDORES'
              Tabla_asociada.DesplegarBusqueda = False
              OrdenadoPor.Strings = (
                'PROVEEDOR')
              Filtros = [obEmpresa, obEjercicio, obCanal]
              Entorno = DMMain.EntornoBusqueda
            end
            object EFProvDesde: TLFEditFind2000
              Left = 43
              Top = 20
              Width = 66
              Height = 21
              TabOrder = 2
              OnChange = EFProvDesdeChange
              Base_de_datos = DMMain.DataBase
              Transaction = DMMain.TLocal
              BuscarNums = False
              BuscarChars = True
              AutoCambiarFoco = False
              CampoNum = 'PROVEEDOR'
              CampoStr = 'TITULO'
              Posicion = tpCentrado
              ReemplazarCaracter = True
              SalirSiVacio = True
              SalirSiNoExiste = False
              Tabla_a_buscar = 'VER_PROVEEDORES'
              Tabla_asociada.DesplegarBusqueda = False
              OrdenadoPor.Strings = (
                'PROVEEDOR')
              Filtros = [obEmpresa, obEjercicio, obCanal]
              Entorno = DMMain.EntornoBusqueda
            end
            object DBEProvHasta: TLFEdit
              Left = 110
              Top = 42
              Width = 370
              Height = 21
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
          object TSAcreedores: TTabSheet
            Caption = '&Acreedores'
            ImageIndex = 1
            object LHastaAcreedor: TLFLabel
              Left = 10
              Top = 46
              Width = 28
              Height = 13
              Alignment = taRightJustify
              Caption = 'Hasta'
            end
            object LDesdeAcreedor: TLFLabel
              Left = 7
              Top = 24
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = 'Desde'
            end
            object DBEAcrDesde: TLFEdit
              Left = 110
              Top = 20
              Width = 370
              Height = 21
              Color = clInfoBk
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
            object EFAcrHasta: TLFEditFind2000
              Left = 43
              Top = 42
              Width = 66
              Height = 21
              TabOrder = 1
              OnChange = EFAcrHastaChange
              Base_de_datos = DMMain.DataBase
              Transaction = DMMain.TLocal
              BuscarNums = False
              BuscarChars = True
              AutoCambiarFoco = False
              CampoNum = 'ACREEDOR'
              CampoStr = 'TITULO'
              Posicion = tpCentrado
              ReemplazarCaracter = True
              SalirSiVacio = True
              SalirSiNoExiste = False
              Tabla_a_buscar = 'VER_ACREEDORES'
              Tabla_asociada.DesplegarBusqueda = False
              OrdenadoPor.Strings = (
                'ACREEDOR')
              Filtros = [obEmpresa, obEjercicio, obCanal]
              Entorno = DMMain.EntornoBusqueda
            end
            object EFAcrDesde: TLFEditFind2000
              Left = 43
              Top = 20
              Width = 66
              Height = 21
              TabOrder = 2
              OnChange = EFAcrDesdeChange
              Base_de_datos = DMMain.DataBase
              Transaction = DMMain.TLocal
              BuscarNums = False
              BuscarChars = True
              AutoCambiarFoco = False
              CampoNum = 'ACREEDOR'
              CampoStr = 'TITULO'
              Posicion = tpCentrado
              ReemplazarCaracter = True
              SalirSiVacio = True
              SalirSiNoExiste = False
              Tabla_a_buscar = 'VER_ACREEDORES'
              Tabla_asociada.DesplegarBusqueda = False
              OrdenadoPor.Strings = (
                'ACREEDOR')
              Filtros = [obEmpresa, obEjercicio, obCanal]
              Entorno = DMMain.EntornoBusqueda
            end
            object DBEAcrHasta: TLFEdit
              Left = 110
              Top = 42
              Width = 370
              Height = 21
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
        end
      end
      object TSCobros: TTabSheet
        Caption = 'Cobros'
        ImageIndex = 1
        object PCCobros: TLFPageControl
          Left = 0
          Top = 0
          Width = 496
          Height = 127
          ActivePage = TSClientes
          Align = alClient
          OwnerDraw = True
          TabIndex = 0
          TabOrder = 0
          TabPosition = tpBottom
          TabActiveColor = clWhite
          TabInactiveColor = 14936298
          object TSClientes: TTabSheet
            Caption = '&Clientes'
            object PNClientes: TLFPanel
              Left = 0
              Top = 0
              Width = 488
              Height = 117
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object GBTitulo: TGroupBox
                Left = 0
                Top = 0
                Width = 488
                Height = 117
                Align = alClient
                Caption = 'Clientes'
                TabOrder = 0
                object LDesdeCliente: TLFLabel
                  Left = 7
                  Top = 24
                  Width = 31
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Desde'
                end
                object LHastaCliente: TLFLabel
                  Left = 10
                  Top = 46
                  Width = 28
                  Height = 13
                  Alignment = taRightJustify
                  Caption = 'Hasta'
                end
                object EFCliDesde: TLFEditFind2000
                  Left = 43
                  Top = 20
                  Width = 66
                  Height = 21
                  TabOrder = 0
                  OnChange = EFCliDesdeChange
                  Base_de_datos = DMMain.DataBase
                  Transaction = DMMain.TLocal
                  BuscarNums = False
                  BuscarChars = True
                  AutoCambiarFoco = False
                  CampoNum = 'CLIENTE'
                  CampoStr = 'TITULO'
                  Posicion = tpCentrado
                  ReemplazarCaracter = True
                  SalirSiVacio = True
                  SalirSiNoExiste = False
                  Tabla_a_buscar = 'VER_CLIENTES_EF'
                  Tabla_asociada.DesplegarBusqueda = False
                  OrdenadoPor.Strings = (
                    'CLIENTE')
                  Filtros = [obEmpresa, obEjercicio, obCanal]
                  Entorno = DMMain.EntornoBusqueda
                end
                object EFCliHasta: TLFEditFind2000
                  Left = 43
                  Top = 42
                  Width = 66
                  Height = 21
                  TabOrder = 1
                  OnChange = EFCliHastaChange
                  Base_de_datos = DMMain.DataBase
                  Transaction = DMMain.TLocal
                  BuscarNums = False
                  BuscarChars = True
                  AutoCambiarFoco = False
                  CampoNum = 'CLIENTE'
                  CampoStr = 'TITULO'
                  Posicion = tpCentrado
                  ReemplazarCaracter = True
                  SalirSiVacio = True
                  SalirSiNoExiste = False
                  Tabla_a_buscar = 'VER_CLIENTES_EF'
                  Tabla_asociada.DesplegarBusqueda = False
                  OrdenadoPor.Strings = (
                    'CLIENTE')
                  Filtros = [obEmpresa, obEjercicio, obCanal]
                  Entorno = DMMain.EntornoBusqueda
                end
                object DBECliDesde: TLFEdit
                  Left = 110
                  Top = 20
                  Width = 370
                  Height = 21
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
                object DBECliHasta: TLFEdit
                  Left = 110
                  Top = 42
                  Width = 370
                  Height = 21
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
                object CHKCuentas: TLFCheckBox
                  Left = 60
                  Top = 66
                  Width = 112
                  Height = 17
                  Caption = 'Cuentas Contables'
                  ClicksDisabled = False
                  ColorCheck = 57088
                  TabOrder = 4
                  TabStop = True
                  Alignment = taLeftJustify
                end
              end
            end
          end
          object TSAgentes: TTabSheet
            Caption = '&Agente'
            ImageIndex = 1
            object GBAgente: TGroupBox
              Left = 0
              Top = 0
              Width = 488
              Height = 117
              Align = alClient
              Caption = 'Agente'
              TabOrder = 0
              object LDesdeAgente: TLFLabel
                Left = 7
                Top = 24
                Width = 31
                Height = 13
                Alignment = taRightJustify
                Caption = 'Desde'
              end
              object EFAgente: TLFEditFind2000
                Left = 43
                Top = 20
                Width = 66
                Height = 21
                TabOrder = 0
                OnChange = EFAgenteChange
                Base_de_datos = DMMain.DataBase
                Transaction = DMMain.TLocal
                BuscarNums = False
                BuscarChars = True
                AutoCambiarFoco = False
                CampoNum = 'AGENTE'
                CampoStr = 'TITULO'
                Posicion = tpCentrado
                ReemplazarCaracter = True
                SalirSiVacio = True
                SalirSiNoExiste = False
                Tabla_a_buscar = 'VER_AGENTES'
                Tabla_asociada.DesplegarBusqueda = False
                OrdenadoPor.Strings = (
                  'AGENTE')
                Filtros = [obEmpresa]
                Entorno = DMMain.EntornoBusqueda
              end
              object DBEAgenteDesde: TLFEdit
                Left = 110
                Top = 20
                Width = 370
                Height = 21
                Color = clInfoBk
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
              object CHKCuentasAgente: TLFCheckBox
                Left = 60
                Top = 66
                Width = 112
                Height = 17
                Caption = 'Cuentas Contables'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 2
                TabStop = True
                Alignment = taLeftJustify
              end
            end
          end
        end
      end
    end
  end
  object PNLComun: TLFPanel [1]
    Left = 0
    Top = 208
    Width = 504
    Height = 231
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object PNEstado: TLFPanel
      Left = 0
      Top = 156
      Width = 256
      Height = 75
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 3
      object LMoneda: TLFLabel
        Left = 24
        Top = 24
        Width = 39
        Height = 13
        Alignment = taRightJustify
        Caption = 'Moneda'
      end
      object DBLCBMoneda: TDBLookupComboBox
        Left = 70
        Top = 21
        Width = 122
        Height = 21
        KeyField = 'MONEDA'
        ListField = 'TITULO'
        ListSource = DMLSTCartera.DSxMonedas
        TabOrder = 0
      end
    end
    object RGOrden: TRadioGroup
      Left = 256
      Top = 156
      Width = 248
      Height = 75
      Align = alClient
      Caption = 'Orden'
      ItemIndex = 0
      Items.Strings = (
        'Vencimiento'
        'Documento')
      TabOrder = 4
    end
    object GBEstadoAgente: TGroupBox
      Left = 0
      Top = 88
      Width = 504
      Height = 68
      Align = alTop
      Caption = 'Estado'
      TabOrder = 2
      object LBLRecibido: TLFLabel
        Left = 53
        Top = 18
        Width = 122
        Height = 13
        Alignment = taRightJustify
        Caption = 'Con Documento Recibido'
      end
      object LBLAceptar: TLFLabel
        Left = 21
        Top = 39
        Width = 154
        Height = 13
        Alignment = taRightJustify
        Caption = 'Formas de pago con Aceptaci'#243'n'
      end
      object CBRecibido: TLFComboBox
        Left = 181
        Top = 14
        Width = 106
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          'Ambos'
          'Recibido'
          'Sin Recibir')
      end
      object CBAceptar: TLFComboBox
        Left = 181
        Top = 36
        Width = 106
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        Items.Strings = (
          'Ambos'
          'Con Aceptacion'
          'Sin Aceptacion'
          '')
      end
      object LFCBCobrado: TLFCheckBox
        Left = 306
        Top = 9
        Width = 73
        Height = 17
        Caption = 'Cobrado'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 2
        TabStop = True
        Alignment = taLeftJustify
      end
      object LFCBNormal: TLFCheckBox
        Left = 410
        Top = 9
        Width = 68
        Height = 17
        Caption = 'Normal'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 3
        TabStop = True
        Alignment = taLeftJustify
      end
      object LFCBImpagado: TLFCheckBox
        Left = 306
        Top = 27
        Width = 73
        Height = 17
        Caption = 'Impagado'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 4
        TabStop = True
        Alignment = taLeftJustify
      end
      object LFCBRemesado: TLFCheckBox
        Left = 410
        Top = 27
        Width = 74
        Height = 17
        Caption = 'Remesado'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 5
        TabStop = True
        Alignment = taLeftJustify
      end
      object LFCBPagConta: TLFCheckBox
        Left = 306
        Top = 45
        Width = 127
        Height = 17
        Caption = 'Pagar'#233' contabilizado'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 6
        TabStop = True
        Alignment = taLeftJustify
      end
    end
    object GBFechasVencimiento: TGroupBox
      Left = 0
      Top = 44
      Width = 504
      Height = 44
      Align = alTop
      Caption = 'Fechas Vencimiento'
      TabOrder = 1
      object LBLDesdeVencimiento: TLFLabel
        Left = 78
        Top = 21
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LBLHastaVencimiento: TLFLabel
        Left = 231
        Top = 21
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object DTPFechaDesdeVencimiento: TLFDateEdit
        Left = 114
        Top = 17
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 0
      end
      object DTPFechaHastaVencimiento: TLFDateEdit
        Left = 265
        Top = 17
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
      end
    end
    object GBFechasFactura: TGroupBox
      Left = 0
      Top = 0
      Width = 504
      Height = 44
      Align = alTop
      Caption = 'Fechas Factura'
      TabOrder = 0
      object LBLDesdeFactura: TLFLabel
        Left = 78
        Top = 21
        Width = 31
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde'
      end
      object LBLHastaFactura: TLFLabel
        Left = 231
        Top = 21
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta'
      end
      object DTPFechaDesdeFactura: TLFDateEdit
        Left = 114
        Top = 17
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 0
      end
      object DTPFechaHastaFactura: TLFDateEdit
        Left = 265
        Top = 17
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 392
    Top = 62
    inherited APrev: TAction
      ImageIndex = 19
      OnExecute = APrevExecute
    end
    inherited ASalir: TAction
      Tag = 2
    end
    inherited ARecargar: TAction
      Tag = 2
      ImageIndex = 39
      OnExecute = ARecargarExecute
    end
  end
end
