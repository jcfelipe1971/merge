object FMErrorPedidoEdi: TFMErrorPedidoEdi
  Left = 201
  Top = 264
  Width = 696
  Height = 453
  Caption = 'Error en el Mensaje EDI'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TLFPanel
    Left = 0
    Top = 0
    Width = 688
    Height = 426
    Align = alClient
    TabOrder = 0
    object PCabecera: TLFPanel
      Left = 1
      Top = 1
      Width = 686
      Height = 48
      Align = alTop
      TabOrder = 0
      object DBTNroPedido: TDBText
        Left = 5
        Top = 18
        Width = 65
        Height = 17
        Color = clInfoBk
        DataField = 'NUMPED'
        DataSource = DMEDI.DSxPedDet
        ParentColor = False
      end
      object LNroPedido: TLFLabel
        Left = 5
        Top = 2
        Width = 48
        Height = 13
        Caption = 'N'#186' Pedido'
      end
      object DBTFecha: TDBText
        Left = 74
        Top = 18
        Width = 71
        Height = 17
        Color = clInfoBk
        DataField = 'FECHA'
        DataSource = DMEDI.DSxPedDet
        ParentColor = False
      end
      object LFechaPedido: TLFLabel
        Left = 76
        Top = 2
        Width = 30
        Height = 13
        Caption = 'Fecha'
      end
      object DBTSucursalQPide: TDBText
        Left = 224
        Top = 18
        Width = 84
        Height = 17
        Color = clInfoBk
        DataField = 'QPIDE'
        DataSource = DMEDI.DSxPedDet
        ParentColor = False
      end
      object LSucursal: TLFLabel
        Left = 224
        Top = 2
        Width = 41
        Height = 13
        Caption = 'Sucursal'
      end
      object DBTFechaEntrega: TDBText
        Left = 149
        Top = 18
        Width = 71
        Height = 17
        Color = clInfoBk
        DataField = 'FECHAERE'
        DataSource = DMEDI.DSxPedDet
        ParentColor = False
      end
      object LFechaEntrega: TLFLabel
        Left = 149
        Top = 2
        Width = 61
        Height = 13
        Caption = 'Fec. Entrega'
      end
      object DBTSucursalSUCURSAL: TDBText
        Left = 312
        Top = 18
        Width = 153
        Height = 17
        Color = clInfoBk
        DataField = 'SUCURSAL'
        DataSource = DMEDI.DSxPedDet
        ParentColor = False
      end
    end
    object PDetalle: TLFPanel
      Left = 1
      Top = 49
      Width = 686
      Height = 128
      Align = alTop
      TabOrder = 1
      object DBTLinea: TDBText
        Left = 5
        Top = 18
        Width = 65
        Height = 17
        Color = clInfoBk
        DataField = 'CLAVE2'
        DataSource = DMEDI.DSxPedDet
        ParentColor = False
      end
      object LLinea: TLFLabel
        Left = 5
        Top = 2
        Width = 26
        Height = 13
        Caption = 'Linea'
      end
      object LEAN: TLFLabel
        Left = 75
        Top = 2
        Width = 22
        Height = 13
        Caption = 'EAN'
      end
      object DBTEAN: TDBText
        Left = 74
        Top = 18
        Width = 71
        Height = 17
        Color = clInfoBk
        DataField = 'REFEAN'
        DataSource = DMEDI.DSxPedDet
        ParentColor = False
      end
      object LRefCliente: TLFLabel
        Left = 149
        Top = 2
        Width = 55
        Height = 13
        Caption = 'Ref. Cliente'
      end
      object DBTArticulo: TDBText
        Left = 149
        Top = 18
        Width = 108
        Height = 17
        Color = clInfoBk
        DataField = 'REFCLI'
        DataSource = DMEDI.DSxPedDet
        ParentColor = False
      end
      object DBTReferenciaProveedor: TDBText
        Left = 260
        Top = 18
        Width = 205
        Height = 17
        Color = clInfoBk
        DataField = 'REFPROV'
        DataSource = DMEDI.DSxPedDet
        ParentColor = False
      end
      object LReferenciaProveedor: TLFLabel
        Left = 261
        Top = 2
        Width = 72
        Height = 13
        Caption = 'Ref. Proveedor'
      end
      object DBTReferenciaEtiqueta: TDBText
        Left = 469
        Top = 97
        Width = 204
        Height = 17
        Color = clInfoBk
        DataField = 'REFETIQ'
        DataSource = DMEDI.DSxPedDet
        ParentColor = False
      end
      object LReferenciaEtiqueta: TLFLabel
        Left = 469
        Top = 81
        Width = 62
        Height = 13
        Caption = 'Ref. Etiqueta'
      end
      object DBTDescripcion: TDBText
        Left = 149
        Top = 38
        Width = 316
        Height = 17
        Color = clInfoBk
        DataField = 'DESCMER'
        DataSource = DMEDI.DSxPedDet
        ParentColor = False
      end
      object DBTDescripcion2: TDBText
        Left = 149
        Top = 58
        Width = 316
        Height = 17
        Color = clInfoBk
        DataField = 'DESCMER2'
        DataSource = DMEDI.DSxPedDet
        ParentColor = False
      end
      object DBTCantidad: TDBText
        Left = 5
        Top = 97
        Width = 65
        Height = 17
        Color = clInfoBk
        DataField = 'CANTPED'
        DataSource = DMEDI.DSxPedDet
        ParentColor = False
      end
      object LCantidad: TLFLabel
        Left = 5
        Top = 81
        Width = 42
        Height = 13
        Caption = 'Cantidad'
      end
      object LFechaEntregaLinea: TLFLabel
        Left = 5
        Top = 41
        Width = 61
        Height = 13
        Caption = 'Fec. Entrega'
      end
      object DBTFechaEntregaLinea: TDBText
        Left = 5
        Top = 55
        Width = 65
        Height = 17
        Color = clInfoBk
        DataField = 'FECHAE'
        DataSource = DMEDI.DSxPedDet
        ParentColor = False
      end
      object DBTPrecioNeto: TDBText
        Left = 74
        Top = 97
        Width = 71
        Height = 17
        Color = clInfoBk
        DataField = 'PRECION'
        DataSource = DMEDI.DSxPedDet
        ParentColor = False
      end
      object LPrecioNeto: TLFLabel
        Left = 74
        Top = 81
        Width = 56
        Height = 13
        Caption = 'Precio Neto'
      end
      object DBTPrecioBruto: TDBText
        Left = 149
        Top = 97
        Width = 65
        Height = 17
        Color = clInfoBk
        DataField = 'PRECIOB'
        DataSource = DMEDI.DSxPedDet
        ParentColor = False
      end
      object LPRecioBruto: TLFLabel
        Left = 149
        Top = 81
        Width = 58
        Height = 13
        Caption = 'Precio Bruto'
      end
      object LDescuento1: TLFLabel
        Left = 218
        Top = 81
        Width = 25
        Height = 13
        Caption = 'Desc'
      end
      object DBTDescuento1: TDBText
        Left = 218
        Top = 97
        Width = 65
        Height = 17
        Color = clInfoBk
        DataField = 'PORCEN11'
        DataSource = DMEDI.DSxPedDet
        ParentColor = False
      end
      object DBTDescuento2: TDBText
        Left = 287
        Top = 97
        Width = 65
        Height = 17
        Color = clInfoBk
        DataField = 'PORCEN21'
        DataSource = DMEDI.DSxPedDet
        ParentColor = False
      end
      object LDescuento2: TLFLabel
        Left = 287
        Top = 81
        Width = 25
        Height = 13
        Caption = 'Desc'
      end
      object DBTDescuento3: TDBText
        Left = 356
        Top = 97
        Width = 65
        Height = 17
        Color = clInfoBk
        DataField = 'PORCEN31'
        DataSource = DMEDI.DSxPedDet
        ParentColor = False
      end
      object LDescuento3: TLFLabel
        Left = 356
        Top = 81
        Width = 25
        Height = 13
        Caption = 'Desc'
      end
      object DBTLMarca: TDBText
        Left = 469
        Top = 18
        Width = 204
        Height = 17
        Color = clInfoBk
        DataField = 'MARCA'
        DataSource = DMEDI.DSxPedDet
        ParentColor = False
      end
      object DBTModelo: TDBText
        Left = 469
        Top = 38
        Width = 204
        Height = 17
        Color = clInfoBk
        DataField = 'COLOR'
        DataSource = DMEDI.DSxPedDet
        ParentColor = False
      end
      object DBTTamano: TDBText
        Left = 469
        Top = 58
        Width = 204
        Height = 17
        Color = clInfoBk
        DataField = 'TAMANO'
        DataSource = DMEDI.DSxPedDet
        ParentColor = False
      end
      object LMarcaModeloTamano: TLFLabel
        Left = 469
        Top = 2
        Width = 114
        Height = 13
        Caption = 'Marca/Modelo/Tamano'
      end
    end
    object PGErroresPedidos: TLFPageControl
      Left = 1
      Top = 177
      Width = 686
      Height = 248
      ActivePage = TSErrArticulo
      Align = alClient
      MultiLine = True
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 2
      TabPosition = tpLeft
      TabWidth = 100
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSErrArticulo: TTabSheet
        Caption = 'Articulo'
        object LFLabel1: TLFLabel
          Left = 211
          Top = 5
          Width = 27
          Height = 13
          Caption = '------->'
        end
        object LError: TLFLabel
          Left = 8
          Top = 29
          Width = 254
          Height = 92
          AutoSize = False
          Caption = 
            'El articulo seleccionado ya esta unido a otra referencia de clie' +
            'nte.'#13#10'REF. CLI. %s'
          WordWrap = True
        end
        object DBERefProv: TLFDbedit
          Left = 8
          Top = 0
          Width = 177
          Height = 21
          Color = clInfoBk
          DataField = 'REFPROV'
          DataSource = DMEDI.DSxPedDet
          Enabled = False
          TabOrder = 2
        end
        object EFArticulo: TEditFind2000
          Left = 272
          Top = 0
          Width = 126
          Height = 21
          TabOrder = 0
          OnChange = EFArticuloChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'ARTICULO'
          CampoStr = 'TITULO'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_ARTICULOS_EF'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'ARTICULO')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EArticulo: TLFEdit
          Left = 399
          Top = 0
          Width = 256
          Height = 21
          Color = clInfoBk
          Enabled = False
          TabOrder = 3
        end
        object BSeleccionarArticulo: TButton
          Left = 56
          Top = 200
          Width = 75
          Height = 25
          Caption = '&Seleccionar'
          ModalResult = 1
          TabOrder = 1
        end
        object BCancelar: TButton
          Left = 144
          Top = 200
          Width = 75
          Height = 25
          Caption = '&Cancelar'
          ModalResult = 2
          TabOrder = 4
        end
        object DBGSeleccionRapida: TNsDBGrid
          Left = 272
          Top = 24
          Width = 383
          Height = 213
          DataSource = DMEDI.DSxArticulosEDI
          TabOrder = 5
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = DBGSeleccionRapidaDblClick
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          Idioma = 'CAS'
          Columns = <
            item
              Expanded = False
              FieldName = 'ARTICULO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 251
              Visible = True
            end>
        end
      end
      object TSErrPrecio: TTabSheet
        Caption = 'Precio'
        ImageIndex = 1
        object LPrecioPrecio: TLFLabel
          Left = 13
          Top = 36
          Width = 30
          Height = 13
          Alignment = taRightJustify
          Caption = 'Precio'
        end
        object LPrecioDescuento: TLFLabel
          Left = 184
          Top = 36
          Width = 52
          Height = 13
          Alignment = taRightJustify
          Caption = 'Descuento'
        end
        object BSelecPrecio: TButton
          Left = 232
          Top = 88
          Width = 75
          Height = 25
          Caption = '&Seleccionar'
          ModalResult = 1
          TabOrder = 0
        end
        object BCancelaPrecio: TButton
          Left = 320
          Top = 88
          Width = 75
          Height = 25
          Caption = '&Cancelar'
          ModalResult = 2
          TabOrder = 1
        end
        object REPrecio: THYGRightEdit
          Left = 48
          Top = 32
          Width = 121
          Height = 21
          TabOrder = 2
          OnChange = VerificaNro
        end
        object REDescuento: THYGRightEdit
          Left = 240
          Top = 32
          Width = 89
          Height = 21
          TabOrder = 3
        end
        object REDescuento2: THYGRightEdit
          Left = 336
          Top = 32
          Width = 89
          Height = 21
          TabOrder = 4
        end
        object REDescuento3: THYGRightEdit
          Left = 432
          Top = 32
          Width = 89
          Height = 21
          TabOrder = 5
        end
        object CHBModificarTarifa: TLFCheckBox
          Left = 544
          Top = 34
          Width = 129
          Height = 17
          Caption = 'Modificar Tarifa'
          Checked = True
          State = cbChecked
          ClicksDisabled = False
          ColorCheck = 57088
          TabOrder = 6
          TabStop = True
          Alignment = taLeftJustify
        end
      end
    end
  end
end
