inherited FMLst: TFMLst
  Left = 365
  Top = 383
  Caption = 'Informe'
  ClientHeight = 417
  ClientWidth = 592
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited TBMain: TLFToolBar
    Width = 592
    object TButtConf: TToolButton
      Left = 288
      Top = 0
      Action = AConfigurar
    end
  end
  inherited PCMain: TLFPageControl
    Width = 592
    Height = 381
    ActivePage = TSLimites
    MultiLine = True
    TabIndex = 0
    object TSLimites: TTabSheet
      BorderWidth = 2
      Caption = 'L'#237'mites  '
      object PNLLimites: TLFPanel
        Left = 0
        Top = 0
        Width = 580
        Height = 348
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 0
        object PNLLimFilMae: TLFPanel
          Left = 0
          Top = 65
          Width = 580
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          Visible = False
          object ChkFilMae: TLFCheckBox
            Left = 8
            Top = 2
            Width = 249
            Height = 17
            Caption = 'Conservar Filtro Maestro'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 0
            TabStop = True
            Alignment = taLeftJustify
          end
        end
        object GBEjemploEditFindDesdeHasta: TGroupBox
          Left = 0
          Top = 0
          Width = 580
          Height = 65
          Align = alTop
          Caption = ' Clientes '
          TabOrder = 1
          Visible = False
          DesignSize = (
            580
            65)
          object LblDesCli: TLFLabel
            Left = 66
            Top = 20
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde'
          end
          object LblHasCli: TLFLabel
            Left = 69
            Top = 42
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Hasta'
          end
          object ChkLimClie: TLFCheckBox
            Left = 8
            Top = 18
            Width = 49
            Height = 17
            Caption = 'Filtrar'
            Checked = True
            State = cbChecked
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 0
            TabStop = True
            Alignment = taLeftJustify
            OnChange = ChkLimClieChange
          end
          object EdDesCli: TLFEditFind2000
            Left = 104
            Top = 16
            Width = 81
            Height = 21
            TabOrder = 1
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'CLIENTE'
            CampoStr = 'NOMBRE_COMERCIAL'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_CLIENTES_EF'
            Tabla_asociada.DesplegarBusqueda = False
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object TitDesCli: TLFDbedit
            Left = 186
            Top = 16
            Width = 362
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            DataField = 'NOMBRE_COMERCIAL'
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object EdHasCli: TLFEditFind2000
            Left = 104
            Top = 38
            Width = 81
            Height = 21
            TabOrder = 3
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'CLIENTE'
            CampoStr = 'NOMBRE_COMERCIAL'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_CLIENTES_EF'
            Tabla_asociada.DesplegarBusqueda = False
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object TitHasCli: TLFDbedit
            Left = 186
            Top = 38
            Width = 362
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            DataField = 'NOMBRE_COMERCIAL'
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
    end
    object TSOpciones: TTabSheet
      BorderWidth = 2
      Caption = 'Opciones  '
      ImageIndex = 1
      object PNLOpciones: TLFPanel
        Left = 0
        Top = 0
        Width = 580
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        Visible = False
        object LblCanal: TLFLabel
          Left = 25
          Top = 17
          Width = 27
          Height = 13
          Alignment = taRightJustify
          Caption = 'Canal'
        end
        object CBCanales: TLFComboBox
          Left = 58
          Top = 13
          Width = 231
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          Items.Strings = (
            'Todos los canales')
        end
      end
    end
    object TSAgrupOrd: TTabSheet
      BorderWidth = 2
      Caption = 'Salida'
      ImageIndex = 2
      object PNLOpcGen: TLFPanel
        Left = 0
        Top = 65
        Width = 580
        Height = 96
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        Visible = False
        object LblFechaList: TLFLabel
          Left = 12
          Top = 17
          Width = 85
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fecha del Informe'
        end
        object LblMoneda: TLFLabel
          Left = 376
          Top = 17
          Width = 39
          Height = 13
          Alignment = taRightJustify
          Caption = 'Moneda'
        end
        object LblComentario: TLFLabel
          Left = 44
          Top = 61
          Width = 53
          Height = 13
          Alignment = taRightJustify
          Caption = 'Comentario'
        end
        object LblOrden: TLFLabel
          Left = 68
          Top = 39
          Width = 29
          Height = 13
          Alignment = taRightJustify
          Caption = 'Orden'
        end
        object DTPFechaListado: TLFDateEdit
          Left = 105
          Top = 13
          Width = 87
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
        end
        object DBLCBMoneda: TDBLookupComboBox
          Left = 422
          Top = 13
          Width = 122
          Height = 21
          KeyField = 'MONEDA'
          ListField = 'TITULO'
          TabOrder = 1
        end
        object EDComentario: TLFEdit
          Left = 105
          Top = 57
          Width = 303
          Height = 21
          MaxLength = 28
          TabOrder = 3
        end
        object CBOrden: TLFComboBox
          Left = 105
          Top = 35
          Width = 209
          Height = 21
          ItemHeight = 13
          TabOrder = 2
        end
      end
      object PNLTipoInforme: TLFPanel
        Left = 0
        Top = 0
        Width = 580
        Height = 65
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object RGTipoInforme: TRadioGroup
          Left = 0
          Top = 0
          Width = 289
          Height = 65
          Align = alLeft
          Caption = ' Tipo de Informe '
          ItemIndex = 0
          Items.Strings = (
            'Informe'
            'Carta')
          TabOrder = 0
          Visible = False
        end
        object RGResumido: TRadioGroup
          Left = 289
          Top = 0
          Width = 291
          Height = 65
          Align = alClient
          ItemIndex = 0
          Items.Strings = (
            'Detallado'
            'Resumido')
          TabOrder = 1
          Visible = False
          OnClick = RGResumidoClick
        end
      end
      object PNLTotales: TLFPanel
        Left = 0
        Top = 161
        Width = 580
        Height = 104
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object GBAgrupadoPor: TGroupBox
          Left = 0
          Top = 0
          Width = 388
          Height = 104
          Align = alClient
          Caption = ' Totalizado Por '
          TabOrder = 0
          Visible = False
        end
        object RGSaltoPagina: TRadioGroup
          Left = 388
          Top = 0
          Width = 192
          Height = 104
          Hint = 'El Salto lo realizar'#225' por la Agrupaci'#243'n m'#225's alta'
          Align = alRight
          Caption = ' Salto de P'#225'gina '
          ItemIndex = 0
          Items.Strings = (
            'Sin Salto'
            'Con Salto')
          TabOrder = 1
          Visible = False
        end
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 404
    Top = 6
    inherited AImprimir: TAction
      Tag = 1
    end
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
  end
end
