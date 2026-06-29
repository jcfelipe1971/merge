inherited FMSincronizacionTiendArticuloNuevo: TFMSincronizacionTiendArticuloNuevo
  Left = 733
  Top = 234
  Width = 803
  BorderStyle = bsSizeable
  Caption = 'FMSincronizacionTiendArticuloNuevo'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 793
    inherited TBMain: TLFToolBar
      Width = 789
      inherited EPMain: THYMEditPanel
        Width = 49
        VisibleButtons = [neSalir]
        Hints.Strings = ()
        OnClickSalir = EPMainClickSalir
      end
    end
    object PNLDatosPrestashop: TLFPanel
      Left = 377
      Top = 28
      Width = 414
      Height = 302
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object MDatosPrestashop: TLFMemo
        Left = 0
        Top = 0
        Width = 414
        Height = 302
        Align = alClient
        Lines.Strings = (
          'Datos de producto:'
          '  id_product : '
          '  id_product_attribute : '
          '  id_attribute : '
          '  Cod. Articulo Propuesto : '
          '  reference : '
          '  reference (limpia) : '
          '  ean13 : '
          '  upc : '
          '  product_name : '
          '  id_supplier : '
          '  id_manufacturer : '
          '  Fabricante : '
          '  quantity : '
          '  price : '
          '  Porcentaje IVA : '
          '  Precio Venta Iva Incluido : '
          '  weight : ')
        TabOrder = 0
        WordWrap = False
      end
    end
    object PNLSeleccionArticulo: TLFPanel
      Left = 2
      Top = 28
      Width = 375
      Height = 302
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 2
      object LArticuloPropuesto: TLFLabel
        Left = 8
        Top = 9
        Width = 105
        Height = 13
        Caption = 'Articulo Propuesto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LArticuloReferencia: TLFLabel
        Left = 8
        Top = 73
        Width = 110
        Height = 13
        Caption = 'Articulo Referencia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LArticuloAlfa1: TLFLabel
        Left = 8
        Top = 137
        Width = 77
        Height = 13
        Caption = 'Articulo Alfa1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LArticuloOtro: TLFLabel
        Left = 8
        Top = 202
        Width = 25
        Height = 13
        Caption = 'Otro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LInfoArticuloPropuesto: TLFLabel
        Left = 8
        Top = 46
        Width = 107
        Height = 13
        Caption = 'Info Articulo Propuesto'
      end
      object LInfoEArticuloReferencia: TLFLabel
        Left = 8
        Top = 110
        Width = 111
        Height = 13
        Caption = 'Info Articulo Referencia'
      end
      object LInfoArticuloAlfa1: TLFLabel
        Left = 8
        Top = 174
        Width = 83
        Height = 13
        Caption = 'Info Articulo Alfa1'
      end
      object LInfoEArticuloOtro: TLFLabel
        Left = 8
        Top = 238
        Width = 79
        Height = 13
        Caption = 'Info Articulo Otro'
      end
      object EArticuloPropuesto: TLFEdit
        Left = 8
        Top = 23
        Width = 121
        Height = 21
        TabOrder = 0
        OnChange = EArticuloPropuestoChange
      end
      object EArticuloReferencia: TLFEdit
        Left = 8
        Top = 87
        Width = 121
        Height = 21
        TabOrder = 1
        OnChange = EArticuloReferenciaChange
      end
      object EArticuloAlfa1: TLFEdit
        Left = 8
        Top = 149
        Width = 121
        Height = 21
        TabOrder = 2
        OnChange = EArticuloAlfa1Change
      end
      object EFArticuloOtro: TLFEditFind2000
        Left = 8
        Top = 215
        Width = 121
        Height = 21
        TabOrder = 3
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
      object BSeleccionarPropuesto: TButton
        Left = 132
        Top = 21
        Width = 75
        Height = 25
        Caption = 'Seleccionar'
        ModalResult = 1
        TabOrder = 4
        OnClick = BSeleccionarPropuestoClick
      end
      object BSeleccionarReferencia: TButton
        Left = 132
        Top = 85
        Width = 75
        Height = 25
        Caption = 'Seleccionar'
        ModalResult = 1
        TabOrder = 5
        OnClick = BSeleccionarReferenciaClick
      end
      object BSeleccionarAlfa1: TButton
        Left = 132
        Top = 146
        Width = 75
        Height = 25
        Caption = 'Seleccionar'
        ModalResult = 1
        TabOrder = 6
        OnClick = BSeleccionarAlfa1Click
      end
      object BSeleccionarOtro: TButton
        Left = 132
        Top = 213
        Width = 75
        Height = 25
        Caption = 'Seleccionar'
        ModalResult = 1
        TabOrder = 7
        OnClick = BSeleccionarOtroClick
      end
    end
  end
  inherited TBActions: TLFToolBar
    Width = 793
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
