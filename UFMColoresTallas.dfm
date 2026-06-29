inherited FMColoresTallas: TFMColoresTallas
  Left = 355
  Top = 351
  Width = 492
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Colores de articulos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 482
    Height = 177
    inherited TBMain: TLFToolBar
      Width = 478
      inherited NavMain: THYMNavigator
        DataSource = DSart_colores
        Hints.Strings = ()
        OnClick = NavMainClick
        EditaControl = DBECodigo
        InsertaControl = DBECodigo
      end
      inherited EPMain: THYMEditPanel
        DataSource = DSart_colores
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
    end
    inherited PCMain: TLFPageControl
      Width = 478
      Height = 147
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 470
          Height = 119
          inherited G2KTableLoc: TG2KTBLoc
            Top = 48
            CamposADesplegar.Strings = (
              'COD_COLOR'
              'TITULO')
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'ART_COLORES'
            CampoNum = 'COD_COLOR'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'COD_COLOR')
          end
          object LCodigo: TLFLabel
            Left = 19
            Top = 16
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Codigo'
          end
          object LTitulo: TLFLabel
            Left = 27
            Top = 38
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = 'Titulo'
          end
          object LTipoColor: TLFLabel
            Left = 4
            Top = 59
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Color'
          end
          object LImagen: TLFLabel
            Left = 17
            Top = 81
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Imagen'
          end
          object Imagen: TImage
            Left = 352
            Top = 8
            Width = 113
            Height = 105
            Anchors = [akLeft, akTop, akRight]
          end
          object DBECodigo: TLFDbedit
            Left = 56
            Top = 12
            Width = 57
            Height = 21
            DataField = 'COD_COLOR'
            DataSource = DSart_colores
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 56
            Top = 34
            Width = 289
            Height = 21
            DataField = 'TITULO'
            DataSource = DSart_colores
            MaxLength = 25
            TabOrder = 1
          end
          object DBEFTipoColor: TLFDBEditFind2000
            Left = 56
            Top = 56
            Width = 57
            Height = 21
            DataField = 'TIPO'
            DataSource = DSart_colores
            TabOrder = 2
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_TIPO_COLOR'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TIPO')
            Filtros = []
          end
          object DBETituloTipo: TLFDbedit
            Left = 114
            Top = 56
            Width = 231
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO_TIPO'
            DataSource = DSart_colores
            Enabled = False
            TabOrder = 3
          end
          object EImagenTitulo: TLFEdit
            Left = 114
            Top = 78
            Width = 231
            Height = 21
            Color = clInfoBk
            Enabled = False
            TabOrder = 5
            Text = 'EImagenTitulo'
          end
          object BCargarImagen: TButton
            Left = 297
            Top = 79
            Width = 23
            Height = 18
            Caption = '...'
            TabOrder = 6
            Visible = False
            OnClick = BCargarImagenClick
          end
          object BClipboard: TButton
            Left = 320
            Top = 79
            Width = 23
            Height = 18
            Caption = 'P'
            TabOrder = 7
            Visible = False
            OnClick = BClipboardClick
          end
          object DBEFImagen: TLFDBEditFind2000
            Left = 56
            Top = 78
            Width = 57
            Height = 21
            DataField = 'IMAGEN'
            DataSource = DMMaestrosTallas.DSart_colores
            TabOrder = 4
            OnChange = DBEFImagenChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_IMAGENES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'NOMBRE'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 470
          Height = 119
          DataSource = DSart_colores
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          CamposAOrdenar.Strings = (
            'COD_COLOR'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'COD_COLOR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 250
              Visible = True
            end>
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 177
    Width = 482
    Height = 231
    inherited TBDetalle: TLFToolBar
      Width = 482
      inherited NavDetalle: THYMNavigator
        DataSource = DSArtColorEmpresa
        Hints.Strings = ()
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 482
      Height = 209
      DataSource = DSArtColorEmpresa
      PopupMenu = nil
      Campos.Strings = (
        'PROVEEDOR')
      CamposAMostrar.Strings = (
        'PROVEEDOR'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0')
      CamposADevolver.Strings = (
        '')
      CamposDesplegar.Strings = (
        '1')
      Numericos.Strings = (
        'PROVEEDOR')
      Tablas.Strings = (
        'VER_PROVEEDORES_CUENTAS')
      Acciones.Strings = (
        '')
      Titulos.Strings = (
        'TITULO')
      Planes.Strings = (
        '')
      OrdenadosPor.Strings = (
        'PROVEEDOR')
      Filtros = [obEmpresa, obEjercicio, obCanal]
      Columns = <
        item
          Expanded = False
          FieldName = 'PROVEEDOR'
          Width = 54
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO'
          ReadOnly = True
          Width = 170
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CODIGO_PROVEEDOR'
          Width = 215
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Width = 482
  end
  inherited CEMain: TControlEdit
    DataSource = DSart_colores
    Left = 276
    Top = 60
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 248
    Top = 48
  end
  inherited CEDetalle: TControlEdit
    DataSource = DSArtColorEmpresa
  end
  object DSart_colores: TDataSource
    Left = 160
    Top = 40
  end
  object DSArtColorEmpresa: TDataSource
    Left = 160
    Top = 72
  end
end
