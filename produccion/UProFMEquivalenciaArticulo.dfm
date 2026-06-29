inherited ProFMEquivalenciaArticulo: TProFMEquivalenciaArticulo
  Left = 303
  Top = 284
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Mantenimiento de Art'#237'culos con Equivalencia'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 213
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        DataSource = ProDMEquivalenciaArticulo.DSProCabEquival
        Hints.Strings = ()
        EditaControl = LFDBDesc
        InsertaControl = LFDBDesc
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
    end
    inherited PCMain: TLFPageControl
      Height = 183
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Height = 155
          inherited G2KTableLoc: TG2KTBLoc
            Left = 80
          end
          object LEquivalencia: TLFLabel
            Left = 17
            Top = 27
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Equivalencia'
          end
          object LDescripcion: TLFLabel
            Left = 22
            Top = 49
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object LArticulo: TLFLabel
            Left = 43
            Top = 71
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Articulo'
          end
          object LFDBId: TLFDbedit
            Left = 82
            Top = 24
            Width = 76
            Height = 21
            Color = clInfoBk
            DataField = 'ID_EQUIVAL'
            DataSource = ProDMEquivalenciaArticulo.DSProCabEquival
            ReadOnly = True
            TabOrder = 0
          end
          object LFDBDesc: TLFDbedit
            Left = 82
            Top = 46
            Width = 399
            Height = 21
            DataField = 'DESC_EQUIVAL'
            DataSource = ProDMEquivalenciaArticulo.DSProCabEquival
            TabOrder = 1
          end
          object LFDBEArticulo: TLFFibDBEditFind
            Left = 82
            Top = 68
            Width = 92
            Height = 21
            DataField = 'ARTICULO'
            DataSource = ProDMEquivalenciaArticulo.DSProCabEquival
            TabOrder = 2
            OnChange = LFDBEArticuloChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_ARTICULOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = LFDBEArticuloBusqueda
          end
          object CBDefecto: TLFDBCheckBox
            Left = 82
            Top = 91
            Width = 198
            Height = 17
            Caption = 'Por Defecto'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 3
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'DEFECTO'
            DataSource = ProDMEquivalenciaArticulo.DSProCabEquival
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object EDescripcionArticulo: TLFEdit
            Left = 175
            Top = 68
            Width = 306
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
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Height = 155
          DataSource = ProDMEquivalenciaArticulo.DSProCabEquival
          CamposChecked.Strings = (
            'DEFECTO')
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_EQUIVAL'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESC_EQUIVAL'
              Width = 220
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ARTICULO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEFECTO'
              Width = 65
              Visible = True
            end>
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 213
    Height = 195
    inherited TBDetalle: TLFToolBar
      inherited NavDetalle: THYMNavigator
        DataSource = ProDMEquivalenciaArticulo.DSProDetEquival
        Hints.Strings = ()
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Height = 173
      DataSource = ProDMEquivalenciaArticulo.DSProDetEquival
      PopupMenu = nil
      ColumnaInicial = 1
      Campos.Strings = (
        'ARTICULO_EQUIVAL')
      CamposAMostrar.Strings = (
        'ARTICULO_EQUIVAL'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0')
      CamposADevolver.Strings = (
        '')
      CamposDesplegar.Strings = (
        '1')
      Numericos.Strings = (
        'ARTICULO')
      Tablas.Strings = (
        'ART_ARTICULOS')
      Acciones.Strings = (
        '')
      Titulos.Strings = (
        'TITULO')
      OnBusqueda = DBGFDetalleBusqueda
      Planes.Strings = (
        '')
      OrdenadosPor.Strings = (
        'ARTICULO')
      Filtros = [obEmpresa]
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LINEA'
          ReadOnly = True
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ORDEN'
          Width = 30
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ARTICULO_EQUIVAL'
          Width = 90
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO'
          ReadOnly = True
          Width = 252
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'STOCK'
          ReadOnly = True
          Width = 61
          Visible = True
        end>
    end
  end
  inherited ALMain: TLFActionList
    Top = 24
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Stock'
      Caption = 'Stock'
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Stock;Almacen'
      Caption = 'Almacen'
    end
    object ANoCalcularStock: TAction
      Category = 'Stock;Almacen'
      Caption = 'No calcular stock'
      OnExecute = AStockAlmacenExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Top = 16
  end
end
