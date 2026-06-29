inherited FMTarifas: TFMTarifas
  Left = 358
  Top = 247
  HelpContext = 91
  Caption = 'Tarifas'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 185
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        DataSource = DMTarifas.DSQMTarifas
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBETarifa
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        Busca01 = DBETarifa
        Busca02 = DBETitulo
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
    end
    inherited PCMain: TLFPageControl
      Height = 155
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Height = 127
          inherited G2KTableLoc: TG2KTBLoc
            Top = 53
            DataSource = DMTarifas.DSQMTarifas
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'ART_TARIFAS_C'
            CampoNum = 'TARIFA'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'TARIFA')
          end
          object LBLTarifa: TLFLabel
            Left = 80
            Top = 24
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tarifa'
          end
          object LBLNombre: TLFLabel
            Left = 70
            Top = 46
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nombre'
          end
          object LBLMoneda: TLFLabel
            Left = 68
            Top = 68
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Moneda'
          end
          object DBETarifa: TLFDbedit
            Left = 113
            Top = 20
            Width = 42
            Height = 21
            CharCase = ecUpperCase
            DataField = 'TARIFA'
            DataSource = DMTarifas.DSQMTarifas
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 113
            Top = 42
            Width = 255
            Height = 21
            DataField = 'TITULO'
            DataSource = DMTarifas.DSQMTarifas
            TabOrder = 1
          end
          object DBCHKActiva: TLFDBCheckBox
            Left = 113
            Top = 88
            Width = 59
            Height = 17
            Caption = 'Activa'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 3
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVA'
            DataSource = DMTarifas.DSQMTarifas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFMoneda: TLFDBEditFind2000
            Left = 113
            Top = 64
            Width = 37
            Height = 21
            DataField = 'MONEDA'
            DataSource = DMTarifas.DSQMTarifas
            TabOrder = 2
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
          object HYDBDMoneda: TLFHYDBDescription
            Left = 151
            Top = 64
            Width = 217
            Height = 21
            Color = clInfoBk
            DataSource = DMTarifas.DSQMTarifas
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
            Tabla_a_buscar = 'SYS_MONEDAS'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'MONEDA')
            CamposWhereTabla.Strings = (
              'MONEDA')
          end
          object DBCKBIvaIncluido: TLFDBCheckBox
            Left = 177
            Top = 88
            Width = 85
            Height = 17
            Caption = 'IVA Incluido'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 5
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'IVA_INCLUIDO'
            DataSource = DMTarifas.DSQMTarifas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Height = 127
          DataSource = DMTarifas.DSQMTarifas
          CamposAMarcar.Strings = (
            'ACTIVA'
            'IVA_INCLUIDO')
          CamposChecked.Strings = (
            '1'
            '1')
          CamposNoChecked.Strings = (
            '0'
            '0')
          CamposAOrdenar.Strings = (
            'TARIFA'
            'TITULO'
            'TIPO'
            'ACTIVA'
            'COMISION'
            'CARGO_PORCENTUAL'
            'CARGO_LINEAL'
            'MONEDA')
          Columns = <
            item
              Expanded = False
              FieldName = 'TARIFA'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 280
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MONEDA'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IVA_INCLUIDO'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTIVA'
              Width = 35
              Visible = True
            end>
        end
        inherited BMaximizarTabla: TButton
          Top = 351
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 185
    Height = 223
    inherited TBDetalle: TLFToolBar
      EdgeInner = esNone
      EdgeOuter = esNone
      TabOrder = 1
      inherited NavDetalle: THYMNavigator
        DataSource = DMTarifas.DSQMDetalle
        Hints.Strings = ()
        OnClickAfterAdjust = NavDetalleClickAfterAdjust
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Height = 201
      DataSource = DMTarifas.DSQMDetalle
      TabOrder = 0
      ColumnaInicial = 1
      Transaction = DMTarifas.TLocal
      Campos.Strings = (
        'CALCULO')
      CamposAMostrar.Strings = (
        'CALCULO'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0')
      CamposADevolver.Strings = (
        '')
      CamposDesplegar.Strings = (
        '1')
      CamposAOrdernar.Strings = (
        'CALCULO'
        'LINEA'
        'TIT_CALCULO'
        'UNID_MAXIMAS'
        'UNID_MINIMAS')
      Numericos.Strings = (
        'CALCULO')
      Tablas.Strings = (
        'ART_TARIFAS_CALCULOS')
      Titulos.Strings = (
        'TITULO')
      Filtros = [obEmpresa]
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LINEA'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 35
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CALCULO'
          Width = 41
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TIT_CALCULO'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 252
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNID_MINIMAS'
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'UNID_MAXIMAS'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    ButtonWidth = 23
  end
  inherited CEMain: TControlEdit
    Left = 376
    Top = 88
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 424
    Top = 88
  end
  inherited ALMain: TLFActionList
    Left = 352
    Top = 0
    object AVisualizarTarifasDetalladas: TAction
      Category = 'Listados'
      Caption = 'Visualizar Tarifas Detalladas Filtradas'
      Hint = 'Visualizar Tarifas Detalladas Filtradas'
      ImageIndex = 14
      OnExecute = AVisualizarTarifasDetalladasExecute
    end
    object AImprimirTarifasDetalladas: TAction
      Category = 'Listados'
      Caption = 'Imprimir Tarifas Detalladas Filtradas'
      Hint = 'Imprimir Tarifas Detalladas Filtradas'
      ImageIndex = 14
      OnExecute = AImprimirTarifasDetalladasExecute
    end
    object ATarifasDetalladas: TAction
      Category = 'Listados'
      Caption = 'Tarifas Detalladas'
      Hint = 'Tarifas Detalladas'
      ImageIndex = 14
      OnExecute = ATarifasDetalladasExecute
    end
    object AArticulosPorTarifasFiltradas: TAction
      Category = 'Listados'
      Caption = 'Art'#237'culos por Tarifas Filtradas'
      Hint = 'Art'#237'culos por Tarifas Filtradas'
      ImageIndex = 14
      OnExecute = AArticulosPorTarifasFiltradasExecute
    end
    object APreciosTarifas: TAction
      Category = 'Listados'
      Caption = 'Precios por Tarifas'
      Hint = 'Precios por Tarifas'
      ImageIndex = 14
      OnExecute = APreciosTarifasExecute
    end
    object APreciosporTarifasDetallado: TAction
      Category = 'Listados'
      Caption = 'Precios por Tarifas Detallado'
      Hint = 'Precios por Tarifas Detallado'
      ImageIndex = 14
      OnExecute = APreciosporTarifasDetalladoExecute
    end
    object ASep: TAction
      Category = 'Listados'
      Caption = '-'
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object AConfListadoTarifasDetalladas: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de Tarifas Detalladas'
      Hint = 'Listado de Tarifas Detalladas'
      ImageIndex = 77
      Visible = False
      OnExecute = AConfListadoTarifasDetalladasExecute
    end
    object AConfListadodeTarifasIVADesglosado: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de Tarifas IVA Desglosado'
      Hint = 'Listado de Tarifas IVA Desglosado'
      ImageIndex = 77
      OnExecute = AConfListadodeTarifasIVADesglosadoExecute
    end
    object AConfListadoArtPorTarifas: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de Art'#237'culos por Tarifas Filtradas / Tarifas Detalladas'
      Hint = 'Listado de Art'#237'culos por Tarifas Filtradas / Tarifas Detalladas'
      ImageIndex = 77
      OnExecute = AConfListadoArtPorTarifasExecute
    end
    object AConfListadoPrecioTarifas: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado de Precios por Tarifas'
      Hint = 'Listado de Precios por Tarifas'
      ImageIndex = 77
      OnExecute = AConfListadoPrecioTarifasExecute
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
    object ARecalcula: TAction
      Category = 'Procesos'
      Caption = 'Recalcula los Precios de la Tarifa'
      Hint = 'Recalcula los Precios de la Tarifa'
      ImageIndex = 3
      OnExecute = ARecalculaExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AAsignaAClientesFiltrados: TAction
      Category = 'Procesos'
      Caption = 'Asigna Tarifa a Clientes Filtrados'
      Hint = 'Asigna la tarifa actual a todos los clientes filtrados'
      ImageIndex = 42
      OnExecute = AAsignaAClientesFiltradosExecute
    end
    object ARecalculaPrecioMercado: TAction
      Category = 'Procesos'
      Caption = 'Recalcula Precio Mercado'
      Hint = 
        'Recalcula el precio de Mercado seg'#250'n:'#13#10'P. Mercado = P. Manual x ' +
        '(Factor [USD->DOM] + Cargo Lineal)'
      ImageIndex = 55
      OnExecute = ARecalculaPrecioMercadoExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 384
    Top = 0
  end
  inherited CEDetalle: TControlEdit
    SubComplementario = ALMain
    Left = 376
    Top = 128
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 424
    Top = 128
  end
end
