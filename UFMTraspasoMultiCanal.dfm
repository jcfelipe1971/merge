inherited FMTraspasoMultiCanal: TFMTraspasoMultiCanal
  Left = 304
  Top = 207
  Caption = 'Traspaso de Documentos'
  ClientHeight = 300
  ClientWidth = 448
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 448
    Height = 276
    inherited TBMain: TLFToolBar
      Width = 444
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      TabOrder = 1
      object TButtTrapasa: TToolButton [0]
        Left = 0
        Top = 0
        Action = ATraspasa
      end
      inherited EPMain: THYMEditPanel
        Left = 23
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object PNTraspaso: TLFPanel
      Left = 2
      Top = 28
      Width = 444
      Height = 246
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object RGDocumento: TRadioGroup
        Left = 0
        Top = 77
        Width = 444
        Height = 73
        Align = alClient
        Caption = 'Documento Destino '
        Columns = 3
        ItemIndex = 1
        Items.Strings = (
          'Oferta'
          'Pedidos'
          'Albaranes'
          'Facturas')
        TabOrder = 0
        OnClick = RGDocumentoClick
      end
      object GBDatos: TGroupBox
        Left = 0
        Top = 0
        Width = 444
        Height = 77
        Align = alTop
        Caption = 'Datos Destino'
        TabOrder = 1
        object LBCanal: TLFLabel
          Left = 15
          Top = 22
          Width = 27
          Height = 13
          Alignment = taRightJustify
          Caption = 'Canal'
        end
        object LBSerie: TLFLabel
          Left = 18
          Top = 44
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = 'Serie'
        end
        object EFCanales: TLFEditFind2000
          Left = 47
          Top = 19
          Width = 73
          Height = 21
          TabOrder = 0
          OnChange = EFCanalesChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'CANAL'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'CANAL')
          Filtros = [obEmpresa, obEjercicio]
          Entorno = DMMain.EntornoBusqueda
        end
        object ETituloCanal: TLFEdit
          Left = 121
          Top = 19
          Width = 308
          Height = 21
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
        object EFSeries: TLFEditFind2000
          Left = 47
          Top = 41
          Width = 73
          Height = 21
          TabOrder = 2
          OnChange = EFSeriesChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'SERIE'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_SERIES'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFSeriesBusqueda
          OrdenadoPor.Strings = (
            'SERIE')
          Filtros = [obEmpresa, obEjercicio]
          Entorno = DMMain.EntornoBusqueda
        end
        object ETituloSerie: TLFEdit
          Left = 121
          Top = 41
          Width = 308
          Height = 21
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 3
        end
      end
      object GBVarios: TGroupBox
        Left = 0
        Top = 150
        Width = 444
        Height = 96
        Align = alBottom
        TabOrder = 2
        object LFechaDoc: TLFLabel
          Left = 20
          Top = 20
          Width = 56
          Height = 13
          Alignment = taRightJustify
          Caption = 'Fecha Doc.'
        end
        object DEFechaDst: TLFDateEdit
          Left = 80
          Top = 16
          Width = 89
          Height = 21
          CheckOnExit = True
          NumGlyphs = 2
          TabOrder = 0
        end
        object CBBorraDoc: TLFCheckBox
          Left = 237
          Top = 19
          Width = 191
          Height = 17
          Caption = 'Borrar Doc. Origen'
          Checked = True
          State = cbChecked
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 1
          TabStop = True
          OnClick = CBBorraDocClick
          Alignment = taLeftJustify
        end
        object CBStockDestino: TLFCheckBox
          Left = 237
          Top = 43
          Width = 191
          Height = 17
          Caption = 'Generar Mov. Stock en destino'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 2
          TabStop = True
          Alignment = taLeftJustify
        end
        object CBCerrarFactura: TLFCheckBox
          Left = 18
          Top = 45
          Width = 191
          Height = 17
          Caption = 'Cerrar Factura'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 3
          TabStop = True
          Alignment = taLeftJustify
        end
        object CBStockOrigen: TLFCheckBox
          Left = 237
          Top = 67
          Width = 191
          Height = 17
          Caption = 'Borrar Mov. Stock en doc. origen'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 4
          TabStop = True
          Alignment = taLeftJustify
        end
        object CBPrecios: TLFCheckBox
          Left = 18
          Top = 67
          Width = 191
          Height = 17
          Caption = 'Regenerar Precios del Doc. destino'
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 5
          TabStop = True
          Alignment = taLeftJustify
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 276
    Width = 448
    ActionList = nil
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
  inherited ALMain: TLFActionList
    Left = 328
    Top = 16
    object ATraspasa: TAction
      Caption = 'Trapasa'
      Hint = 'Realizar Traspaso'
      ImageIndex = 42
      OnExecute = ATraspasaExecute
    end
    object ASalir: TAction
      Caption = 'Salir'
      Hint = 'Salir'
      ImageIndex = 0
    end
  end
end
