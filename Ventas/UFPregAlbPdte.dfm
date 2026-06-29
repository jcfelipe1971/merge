inherited FPregAlbPdte: TFPregAlbPdte
  Left = 437
  Top = 331
  ActiveControl = EFClienteD
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Listado de Albaranes de Venta Pendientes'
  ClientHeight = 362
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 280
    inherited TBMain: TLFToolBar
      object TButtMultiSerie: TToolButton
        Left = 360
        Top = 0
        Action = AMultiSerie
        Caption = '&Multi-Serie'
      end
    end
    inherited PBListado: TProgressBar
      Top = 264
      TabOrder = 3
    end
    inherited PCMain: TLFPageControl
      Top = 80
      Height = 184
      ActivePage = TSCliente
      TabIndex = 0
      object TSCliente: TTabSheet
        Caption = 'Cliente'
        object Panel5: TLFPanel
          Left = 0
          Top = 0
          Width = 584
          Height = 156
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object LClienteD: TLFLabel
            Left = 46
            Top = 52
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Cliente'
          end
          object LClienteH: TLFLabel
            Left = 49
            Top = 74
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Cliente'
          end
          object LDesdeFecha: TLFLabel
            Left = 108
            Top = 96
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Fecha'
          end
          object LHastaFecha: TLFLabel
            Left = 286
            Top = 96
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta Fecha'
          end
          object EFClienteD: TLFEditFind2000
            Left = 116
            Top = 48
            Width = 59
            Height = 21
            TabOrder = 0
            OnChange = EFClienteDChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'CLIENTE'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_CLIENTES_EMPRESA'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'CLIENTE')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EClienteD: TLFEdit
            Left = 176
            Top = 48
            Width = 329
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
          object EClienteH: TLFEdit
            Left = 176
            Top = 70
            Width = 329
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
          object EFClienteH: TLFEditFind2000
            Left = 116
            Top = 70
            Width = 59
            Height = 21
            TabOrder = 1
            OnChange = EFClienteHChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'CLIENTE'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_CLIENTES_EMPRESA'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'CLIENTE')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DTPFechaD: TLFDateEdit
            Left = 176
            Top = 92
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 2
          end
          object DTPFechaH: TLFDateEdit
            Left = 351
            Top = 92
            Width = 87
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 3
          end
        end
      end
    end
    object PNLTop: TLFPanel
      Left = 0
      Top = 36
      Width = 592
      Height = 44
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object RBFacturado: TRadioButton
        Left = 193
        Top = 13
        Width = 73
        Height = 17
        Caption = 'Facturado'
        TabOrder = 0
      end
      object RBPdteFacturar: TRadioButton
        Left = 23
        Top = 13
        Width = 102
        Height = 17
        Caption = 'Pdte. Facturar'
        Checked = True
        TabOrder = 1
        TabStop = True
      end
      object RBTodos: TRadioButton
        Left = 371
        Top = 13
        Width = 57
        Height = 17
        Caption = 'Todos'
        TabOrder = 2
      end
    end
  end
  inherited PNLOrden: TLFPanel
    Top = 280
    Height = 82
    inherited EComentario: TLFEdit
      TabOrder = 1
    end
    inherited CBOrden: TLFComboBox
      Width = 203
      TabOrder = 0
    end
    object CBAgrupadoPorModelo: TLFCheckBox
      Left = 108
      Top = 56
      Width = 401
      Height = 17
      Caption = 'Agrupado por Modelo-Color (Tallas y Colores)'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 3
      TabStop = True
      Alignment = taLeftJustify
    end
  end
  inherited ALMain: TLFActionList
    Left = 424
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
    object AMultiSerie: TAction [4]
      Caption = 'Multi-Serie'
      Hint = 'Multi-Serie'
      ImageIndex = 115
      OnExecute = AMultiSerieExecute
    end
    inherited AConfigurar: TAction
      Hint = 'Configuraci'#243'n R'#225'pida del Listado'
    end
  end
end
