inherited FMPrecioReposicion: TFMPrecioReposicion
  Left = 247
  Top = 206
  Width = 1212
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Tarifa Reposicion'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1202
    inherited TBMain: TLFToolBar
      Width = 1198
      inherited NavMain: THYMNavigator
        Width = 216
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        EditaControl = DBGMain
        InsertaControl = DBGMain
      end
      inherited TSepNav: TToolButton
        Left = 216
      end
      inherited EPMain: THYMEditPanel
        Left = 224
        Width = 37
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 261
      end
      inherited TbuttComp: TToolButton
        Left = 269
      end
    end
    object DBGMain: TDBGridFind2000
      Left = 2
      Top = 54
      Width = 1198
      Height = 276
      Align = alClient
      DataSource = DMPrecioReposicion.DSxPrecioReposicion
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnCellClick = DBGMainCellClick
      OnDrawColumnCell = DBGMainDrawColumnCell
      OnDblClick = DBGMainDblClick
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
        'GAMA')
      CamposAMostrar.Strings = (
        'GAMA'
        '0')
      CamposADevolver.Strings = (
        '')
      CamposDesplegar.Strings = (
        '1')
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      CamposAOrdernar.Strings = (
        'ARTICULO'
        'DESCUENTO'
        'FAMILIA'
        'GAMA'
        'INCREMENTO'
        'PRECIO_BASE_REPOSICION'
        'PRECIO_REPOSICION'
        'TITULO_ARTICULO'
        'TITULO_FAMILIA'
        'TITULO_GAMA')
      MensajeNoExiste = False
      Numericos.Strings = (
        'GAMA')
      SalirSiVacio = False
      SalirSiNoExiste = False
      Tablas.Strings = (
        'SYS_GAMAS')
      Acciones.Strings = (
        '')
      Titulos.Strings = (
        'TITULO')
      Posicion = tpCentrado
      Planes.Strings = (
        '')
      OrdenMultiple = True
      OrdenadosPor.Strings = (
        'GAMA')
      Filtros = []
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ARTICULO'
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO_ARTICULO'
          Width = 300
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'FAMILIA'
          Width = 50
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO_FAMILIA'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'GAMA'
          Width = 50
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO_GAMA'
          Width = 150
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRECIO_BASE_REPOSICION'
          Width = 80
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'PRECIO_REPOSICION'
          Width = 80
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DESCUENTO'
          Width = 70
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'INCREMENTO'
          Width = 70
          Visible = True
        end>
    end
    object PNLFiltros: TLFPanel
      Left = 2
      Top = 28
      Width = 1198
      Height = 26
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object LFamilia: TLFLabel
        Left = 14
        Top = 6
        Width = 32
        Height = 13
        Alignment = taRightJustify
        Caption = 'Familia'
      end
      object LGama: TLFLabel
        Left = 146
        Top = 6
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'Gama'
      end
      object EFFamilia: TLFEditFind2000
        Left = 52
        Top = 2
        Width = 69
        Height = 21
        TabOrder = 0
        OnChange = EFFamiliaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'FAMILIA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'VER_FAMILIAS_CUENTAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'FAMILIA')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object EFGama: TLFEditFind2000
        Left = 180
        Top = 2
        Width = 69
        Height = 21
        TabOrder = 1
        OnChange = EFFamiliaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'GAMA'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_GAMAS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'GAMA')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
      end
    end
  end
  inherited TBActions: TLFToolBar
    Width = 1202
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
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
