inherited ZFMArticulos: TZFMArticulos
  Left = 395
  Top = 234
  Width = 800
  Height = 486
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Visualizador de Art'#237'culos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 790
    Height = 137
    inherited TBMain: TLFToolBar
      Width = 786
      inherited NavMain: THYMNavigator
        Width = 110
        DataSource = ZDMArticulos.DSQMArticulos
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton
        Left = 110
      end
      inherited EPMain: THYMEditPanel
        Left = 118
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 178
      end
      inherited TbuttComp: TToolButton
        Left = 186
        Hint = 'Procesa'
        Visible = True
        OnClick = TbuttCompClick
      end
    end
    inherited PCMain: TLFPageControl
      Width = 786
      Height = 107
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 778
          Height = 79
          inherited G2KTableLoc: TG2KTBLoc
            Left = 11
            Top = 3
            DataSource = ZDMArticulos.DSQMArticulos
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'VER_ARTICULOS_EF'
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'FAMILIA<>'#39'SYS'#39
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'ARTICULO')
          end
          object LArticulo: TLFLabel
            Left = 40
            Top = 15
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Art'#237'culo'
          end
          object LPrecioVenta: TLFLabel
            Left = 36
            Top = 36
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'P. Venta'
          end
          object LStock: TLFLabel
            Left = 377
            Top = 37
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Stock'
          end
          object DBEArticulo: TLFDbedit
            Left = 82
            Top = 11
            Width = 88
            Height = 21
            Color = clInfoBk
            DataField = 'ARTICULO'
            DataSource = ZDMArticulos.DSQMArticulos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 171
            Top = 11
            Width = 327
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = ZDMArticulos.DSQMArticulos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBEPVenta: TLFDbedit
            Left = 82
            Top = 33
            Width = 88
            Height = 21
            Color = clInfoBk
            DataField = 'PRECIO_VENTA'
            DataSource = ZDMArticulos.DSQMArticulos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object DBEStockCab: TLFDbedit
            Left = 410
            Top = 33
            Width = 88
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'StockAlm'
            DataSource = ZDMArticulos.DSQMArticulos
            ReadOnly = True
            TabOrder = 3
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 778
          Height = 79
          DataSource = ZDMArticulos.DSQMArticulos
          Columns = <
            item
              Expanded = False
              FieldName = 'ARTICULO'
              Width = 82
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 292
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FAMILIA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_IVA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_ARTICULO_TYC'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECIO_VENTA'
              Visible = True
            end>
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 137
    Width = 790
    Height = 296
    inherited TBDetalle: TLFToolBar
      Width = 790
      inherited NavDetalle: THYMNavigator
        DataSource = ZDMArticulos.DSQMDetStocks
        Hints.Strings = ()
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 790
      Height = 274
      Color = clInfoBk
      DataSource = ZDMArticulos.DSQMDetStocks
      Font.Color = clGrayText
      ParentFont = False
      ReadOnly = True
      IniStorage = FSMain
      CamposAOrdernar.Strings = (
        'ALMACEN'
        'EXISTENCIAS'
        'ENTRADAS'
        'SALIDAS'
        'STOCK_MAXIMO'
        'STOCK_MINIMO'
        'STOCK_VIRTUAL'
        'PEDIDOS_D_CLI'
        'PEDIDOS_A_PRO'
        'RESERVADAS'
        'EN_PROCESO_PROD'
        'DISPONIBLES')
      Columns = <
        item
          Expanded = False
          FieldName = 'ALMACEN'
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STOCK'
          Width = 69
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PEDIDOS_D_CLI'
          Width = 78
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RESERVADAS'
          Width = 84
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PARA_SERVIR'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DISPONIBLE'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DISPONIBLES'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'STOCK_MINIMO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PEDIDOS_A_PRO'
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'EN_PROCESO_PROD'
          Width = 71
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'STOCK_MAXIMO'
          Visible = False
        end
        item
          Expanded = False
          FieldName = 'STOCK_VIRTUAL'
          Width = 79
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 433
    Width = 790
  end
  inherited CEMain: TControlEdit
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Top = 4
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
    inherited CEMainMiedit: TMenuItem
      Visible = False
    end
    inherited CEMainMipost: TMenuItem
      Visible = False
    end
    inherited CEMainMicancel: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Top = 8
  end
  inherited FSMain: TLFFibFormStorage
    Top = 8
  end
  inherited CEDetalle: TControlEdit
    PanelEdicion = PDetalle
    Left = 280
    Top = 32
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 316
    Top = 32
  end
end
