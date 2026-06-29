inherited FMLoteSimple: TFMLoteSimple
  Width = 500
  Height = 504
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Lote Simple'
  Constraints.MinWidth = 500
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 490
    Height = 451
    inherited TBMain: TLFToolBar
      Width = 486
      inherited NavMain: THYMNavigator
        DataSource = DMLoteSimple.DSQMLoteSimple
        Hints.Strings = ()
        EditaControl = DBEFFamilia
        InsertaControl = DBELoteSimple
      end
      inherited EPMain: THYMEditPanel
        Width = 68
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepTerc: TToolButton
        Left = 296
      end
      inherited TbuttComp: TToolButton
        Left = 304
      end
      object PNLFiltro: TLFPanel
        Left = 327
        Top = 0
        Width = 123
        Height = 21
        AutoSize = True
        BevelOuter = bvNone
        TabOrder = 2
        object LFiltroFamilia: TLFLabel
          Left = 0
          Top = 4
          Width = 32
          Height = 13
          Alignment = taRightJustify
          Caption = 'Familia'
        end
        object EFFiltroFamilia: TLFEditFind2000
          Left = 36
          Top = 0
          Width = 87
          Height = 21
          TabOrder = 0
          OnChange = EFFiltroFamiliaChange
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
          Tabla_a_buscar = 'ART_FAMILIAS'
          Tabla_asociada.DesplegarBusqueda = False
          OnBusqueda = EFFiltroFamiliaBusqueda
          OrdenadoPor.Strings = (
            'FAMILIA')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
        end
      end
    end
    inherited PCMain: TLFPageControl
      Width = 486
      Height = 421
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 478
          Height = 393
          inherited G2KTableLoc: TG2KTBLoc
            Top = 18
            Plan.Strings = (
              
                'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
                'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
            CamposADesplegar.Strings = (
              'FAMILIA'
              'ARTICULO')
            DataSource = DMLoteSimple.DSQMLoteSimple
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'ART_LOTE_SIMPLE'
            CampoNum = 'LOTE_SIMPLE'
            CampoStr = 'FECHA_CADUCIDAD'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'LOTE_SIMPLE')
          end
          object LLoteSimple: TLFLabel
            Left = 43
            Top = 3
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Lote'
          end
          object LBLFamilia: TLFLabel
            Left = 32
            Top = 25
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Familia'
          end
          object LFechaInicio: TLFLabel
            Left = 15
            Top = 70
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fec. Inicio'
          end
          object LNotas: TLFLabel
            Left = 36
            Top = 114
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Notas'
          end
          object LFechaCaducidad: TLFLabel
            Left = 18
            Top = 94
            Width = 46
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fec. Cad.'
          end
          object LArticulo: TLFLabel
            Left = 29
            Top = 47
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Articulo'
          end
          object DBELoteSimple: TLFDbedit
            Left = 68
            Top = 0
            Width = 121
            Height = 21
            CharCase = ecUpperCase
            DataField = 'LOTE_SIMPLE'
            DataSource = DMLoteSimple.DSQMLoteSimple
            TabOrder = 0
          end
          object DBEFFamilia: TLFDBEditFind2000
            Left = 68
            Top = 22
            Width = 59
            Height = 21
            CharCase = ecUpperCase
            DataField = 'FAMILIA'
            DataSource = DMLoteSimple.DSQMLoteSimple
            TabOrder = 1
            OnChange = DBEFFamiliaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'ART_FAMILIAS                   '
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'FAMILIA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OnBusqueda = DBEFFamiliaBusqueda
            OrdenadoPor.Strings = (
              'FAMILIA')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETitFamilia: TLFEdit
            Left = 128
            Top = 22
            Width = 345
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            Constraints.MinWidth = 345
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object DBMNotas: TLFDBMemo
            Left = 68
            Top = 110
            Width = 406
            Height = 281
            Anchors = [akLeft, akTop, akRight, akBottom]
            BevelEdges = []
            BevelInner = bvNone
            BevelOuter = bvNone
            DataField = 'NOTAS'
            DataSource = DMLoteSimple.DSQMLoteSimple
            ScrollBars = ssVertical
            TabOrder = 7
          end
          object DBDEFechaInicio: TLFDBDateEdit
            Left = 68
            Top = 66
            Width = 121
            Height = 21
            DataField = 'FECHA_INICIO'
            DataSource = DMLoteSimple.DSQMLoteSimple
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 5
          end
          object DBDEFechaCaducidad: TLFDBDateEdit
            Left = 68
            Top = 88
            Width = 121
            Height = 21
            DataField = 'FECHA_CADUCIDAD'
            DataSource = DMLoteSimple.DSQMLoteSimple
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 6
          end
          object DBEFArticulo: TLFDBEditFind2000
            Left = 68
            Top = 44
            Width = 121
            Height = 21
            CharCase = ecUpperCase
            DataField = 'ARTICULO'
            DataSource = DMLoteSimple.DSQMLoteSimple
            TabOrder = 3
            OnChange = DBEFArticuloChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'VER_ARTICULOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OnBusqueda = DBEFArticuloBusqueda
            OrdenadoPor.Strings = (
              'ARTICULO')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETitArticulo: TLFEdit
            Left = 190
            Top = 44
            Width = 283
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            Constraints.MinWidth = 283
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
          Width = 478
          Height = 393
          DataSource = DMLoteSimple.DSQMLoteSimple
          CamposAMarcar.Strings = (
            'DISPONIBLE')
          CamposChecked.Strings = (
            '1')
          CamposNoChecked.Strings = (
            '0')
          CamposAOrdenar.Strings = (
            'ARTICULO'
            'DISPONIBLE'
            'FAMILIA'
            'FECHA_CADUCIDAD'
            'FECHA_INICIO'
            'LOTE_SIMPLE')
          Columns = <
            item
              Expanded = False
              FieldName = 'LOTE_SIMPLE'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FAMILIA'
              Width = 44
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_INICIO'
              Width = 112
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_CADUCIDAD'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ARTICULO'
              Width = 121
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DISPONIBLE'
              Width = 60
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 451
    Width = 490
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object ACrearRangos: TAction
      Category = 'Procesos'
      Caption = 'Crea Rangos'
      Hint = 'Crea Rangos de Lotes'
      ImageIndex = 10
      OnExecute = ACrearRangosExecute
    end
  end
end
