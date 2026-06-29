inherited FMEquivalenciaColores: TFMEquivalenciaColores
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Equivalencia de Colores'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        DataSource = DMEquivalenciaColores.DSEquivalenciaColores
        Hints.Strings = ()
        EditaControl = DBGEquivalenciaColores
        InsertaControl = DBGEquivalenciaColores
        OnChangeState = NavMainChangeState
      end
      inherited EPMain: THYMEditPanel
        Width = 23
        DataSource = DMEquivalenciaColores.DSEquivalenciaColores
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 251
      end
      inherited TbuttComp: TToolButton
        Left = 259
      end
    end
    object PNLEdicion: TLFPanel
      Left = 2
      Top = 28
      Width = 498
      Height = 302
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object PNLFiltro: TLFPanel
        Left = 0
        Top = 0
        Width = 498
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        object LColor: TLFLabel
          Left = 19
          Top = 12
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = 'Color'
        end
        object LArticuloBase: TLFLabel
          Left = 136
          Top = 12
          Width = 43
          Height = 13
          Alignment = taRightJustify
          Caption = 'Art. Base'
        end
        object LArticuloCorrespondeinte: TLFLabel
          Left = 298
          Top = 12
          Width = 58
          Height = 13
          Alignment = taRightJustify
          Caption = 'Art. Corresp.'
        end
        object EFColor: TLFEditFind2000
          Left = 48
          Top = 8
          Width = 81
          Height = 21
          TabOrder = 0
          OnChange = EFFiltroChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'CODIGO'
          CampoStr = 'DESCRIPCION'
          CondicionBusqueda = 'ACTIVO=1'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'Z_SYS_COLORES'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'CODIGO')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
        end
        object EFArticuloBase: TLFEditFind2000
          Left = 184
          Top = 8
          Width = 97
          Height = 21
          TabOrder = 1
          OnChange = EFFiltroChange
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
        object EFArticuloCorrespondente: TLFEditFind2000
          Left = 360
          Top = 8
          Width = 121
          Height = 21
          TabOrder = 2
          OnChange = EFFiltroChange
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
      end
      object DBGEquivalenciaColores: TDBGridFind2000
        Left = 0
        Top = 41
        Width = 498
        Height = 261
        Align = alClient
        DataSource = DMEquivalenciaColores.DSEquivalenciaColores
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Insercion = False
        ColumnaInicial = 0
        UsaDicG2K = True
        Changed = False
        Idioma = 'CAS'
        AutoCambiarColumna = False
        AutoPostEnCheckBox = False
        AutoStartDrag = False
        AutoStartDragInterval = 0
        IndiceBitmapOrdenable = 0
        IndiceBitmapAscendente = 1
        IndiceBitmapChecked = 3
        IndiceBitmapDescendente = 2
        BaseDeDatos = DMMain.DataBase
        BuscarNums = False
        Campos.Strings = (
          'ARTICULO_BASE'
          'ARTICULO_CORRESP'
          'COLOR')
        CamposAMostrar.Strings = (
          'ARTICULO_BASE'
          '0'
          'ARTICULO_CORRESP'
          '0'
          'COLOR'
          '0')
        CamposAMostrarAnchos.Strings = (
          '0'
          '0'
          '0')
        CamposADevolver.Strings = (
          ''
          ''
          '')
        CamposDesplegar.Strings = (
          '1'
          '1'
          '1')
        CampoAOrdenarColor = clInfoBk
        CampoAOrdenarBitmaps = DMMain.ILOrdGrid
        CamposAOrdernar.Strings = (
          'ARTICULO_BASE'
          'ARTICULO_CORRESP'
          'COLOR')
        MensajeNoExiste = False
        Numericos.Strings = (
          'ARTICULO'
          'ARTICULO'
          'CODIGO')
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tablas.Strings = (
          'VER_ARTICULOS_EF'
          'VER_ARTICULOS_EF'
          'Z_SYS_COLORES')
        Acciones.Strings = (
          ''
          ''
          '')
        Titulos.Strings = (
          'TITULO'
          'TITULO'
          'DESCRIPCION')
        Posicion = tpCentrado
        OnBusqueda = DBGEquivalenciaColoresBusqueda
        Planes.Strings = (
          ''
          ''
          '')
        OrdenMultiple = True
        OrdenadosPor.Strings = (
          'ARTICULO'
          'ARTICULO'
          'CODIGO')
        Filtros = []
        Columns = <
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'COLOR'
            ReadOnly = True
            Width = 70
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ARTICULO_BASE'
            Width = 135
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'ARTICULO_CORRESP'
            Width = 135
            Visible = True
          end>
      end
    end
  end
  inherited CEMain: TControlEdit
    DataSource = DMEquivalenciaColores.DSEquivalenciaColores
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
