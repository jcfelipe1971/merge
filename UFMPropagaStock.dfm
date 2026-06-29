inherited FMPropagaStock: TFMPropagaStock
  Left = 402
  Top = 211
  HelpContext = 1106
  Caption = 'Propagaci'#243'n de Stocks'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        DataSource = DMPropagaStock.DSQMPropaga
        Hints.Strings = ()
        BeforeAction = NavMainBeforeAction
        EditaControl = DBCBStock
        InsertaControl = DBEFEmpresa
      end
      inherited EPMain: THYMEditPanel
        Width = 46
        VisibleButtons = [neImprime, neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 274
        Visible = False
      end
      inherited TbuttComp: TToolButton
        Left = 282
        Visible = False
      end
    end
    inherited PCMain: TLFPageControl
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          object GBOrigen: TGroupBox
            Left = 12
            Top = 26
            Width = 473
            Height = 97
            Caption = 'Origen'
            TabOrder = 0
            object LBLEmpresa: TLFLabel
              Left = 12
              Top = 23
              Width = 41
              Height = 13
              Alignment = taRightJustify
              Caption = 'Empresa'
            end
            object LBLAlmacen: TLFLabel
              Left = 12
              Top = 66
              Width = 41
              Height = 13
              Alignment = taRightJustify
              Caption = 'Almac'#233'n'
            end
            object LBLCanal: TLFLabel
              Left = 26
              Top = 45
              Width = 27
              Height = 13
              Alignment = taRightJustify
              Caption = 'Canal'
            end
            object DBEFEmpresa: TLFFibDBEditFind
              Left = 58
              Top = 19
              Width = 55
              Height = 21
              DataField = 'EMPRESA_O'
              DataSource = DMPropagaStock.DSQMPropaga
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              OnChange = DBEFEmpresaChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'SYS_EMPRESAS'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'EMPRESA'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
            end
            object DBEFAlmacen: TLFFibDBEditFind
              Left = 58
              Top = 63
              Width = 55
              Height = 21
              DataField = 'ALMACEN_O'
              DataSource = DMPropagaStock.DSQMPropaga
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 2
              OnChange = DBEFAlmacenChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'ART_ALMACENES'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'ALMACEN'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OnBusqueda = DBEFAlmacenBusqueda
            end
            object DBEFCanal: TLFFibDBEditFind
              Left = 58
              Top = 41
              Width = 55
              Height = 21
              DataField = 'CANAL_O'
              DataSource = DMPropagaStock.DSQMPropaga
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
              OnChange = DBEFCanalChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'GEN_CANALES'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'CANAL'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OnBusqueda = DBEFCanalBusqueda
            end
            object HYDBDEmpresa: TLFHYDBDescription
              Left = 114
              Top = 19
              Width = 349
              Height = 21
              Color = clInfoBk
              DataSource = DMPropagaStock.DSQMPropaga
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              Tabla_a_buscar = 'SYS_EMPRESAS'
              Campo_Descripcion = 'TITULO'
              Base_de_datos = DMMain.DataBase
              CamposWhereOrigen.Strings = (
                'EMPRESA_O')
              CamposWhereTabla.Strings = (
                'EMPRESA')
            end
            object HYDBDCanal: TLFHYDBDescription
              Left = 114
              Top = 41
              Width = 349
              Height = 21
              Color = clInfoBk
              DataSource = DMPropagaStock.DSQMPropaga
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              Tabla_a_buscar = 'SYS_CANALES'
              Campo_Descripcion = 'TITULO'
              Base_de_datos = DMMain.DataBase
              CamposWhereOrigen.Strings = (
                'CANAL_O')
              CamposWhereTabla.Strings = (
                'CANAL')
            end
            object HYDBDAlmacen: TLFHYDBDescription
              Left = 114
              Top = 63
              Width = 349
              Height = 21
              Color = clInfoBk
              DataSource = DMPropagaStock.DSQMPropaga
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              Tabla_a_buscar = 'ART_ALMACENES'
              Campo_Descripcion = 'TITULO'
              Base_de_datos = DMMain.DataBase
              CamposWhereOrigen.Strings = (
                'ALMACEN_O'
                'CANAL_O')
              CamposWhereTabla.Strings = (
                'ALMACEN'
                'EMPRESA')
            end
          end
          object GBDestino: TGroupBox
            Left = 12
            Top = 127
            Width = 473
            Height = 96
            Caption = 'Destino'
            TabOrder = 1
            object LBLEmpresaDestino: TLFLabel
              Left = 12
              Top = 24
              Width = 41
              Height = 13
              Alignment = taRightJustify
              Caption = 'Empresa'
            end
            object LBLAlmacenDestino: TLFLabel
              Left = 12
              Top = 68
              Width = 41
              Height = 13
              Alignment = taRightJustify
              Caption = 'Almac'#233'n'
            end
            object LBLCanalDestino: TLFLabel
              Left = 26
              Top = 46
              Width = 27
              Height = 13
              Alignment = taRightJustify
              Caption = 'Canal'
            end
            object DBEFEmpresaDestino: TLFDBEditFind2000
              Left = 58
              Top = 20
              Width = 55
              Height = 21
              DataField = 'EMPRESA_D'
              DataSource = DMPropagaStock.DSQMPropaga
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 0
              OnChange = DBEFEmpresaDestinoChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'SYS_EMPRESAS'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'EMPRESA'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              Filtros = []
              Entorno = DMMain.EntornoBusqueda
            end
            object DBEFAlmacenDestino: TLFDBEditFind2000
              Left = 58
              Top = 64
              Width = 55
              Height = 21
              DataField = 'ALMACEN_D'
              DataSource = DMPropagaStock.DSQMPropaga
              TabOrder = 2
              OnChange = DBEFAlmacenDestinoChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'ART_ALMACENES'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'ALMACEN'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OnBusqueda = DBEFAlmacenDestinoBusqueda
              Filtros = []
              Entorno = DMMain.EntornoBusqueda
            end
            object DBEFCanalDestino: TLFDBEditFind2000
              Left = 58
              Top = 42
              Width = 55
              Height = 21
              DataField = 'CANAL_D'
              DataSource = DMPropagaStock.DSQMPropaga
              TabOrder = 1
              OnChange = DBEFCanalDestinoChange
              AutoCambiarFoco = False
              Base_de_datos = DMMain.DataBase
              BuscarNums = False
              Tabla_a_buscar = 'GEN_CANALES'
              Tabla_asociada.DesplegarBusqueda = False
              CampoNum = 'CANAL'
              CampoStr = 'TITULO'
              ReemplazarCaracter = True
              SalirSiNoExiste = False
              SalirSiVacio = False
              OnBusqueda = DBEFCanalDestinoBusqueda
              Filtros = []
              Entorno = DMMain.EntornoBusqueda
            end
            object HYDBDAlmacenD: TLFHYDBDescription
              Left = 114
              Top = 64
              Width = 349
              Height = 21
              Color = clInfoBk
              DataSource = DMPropagaStock.DSQMPropaga
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
              Tabla_a_buscar = 'ART_ALMACENES'
              Campo_Descripcion = 'TITULO'
              Base_de_datos = DMMain.DataBase
              CamposWhereOrigen.Strings = (
                'ALMACEN_D'
                'CANAL_D')
              CamposWhereTabla.Strings = (
                'ALMACEN'
                'EMPRESA')
            end
            object HYDBDCanalD: TLFHYDBDescription
              Left = 114
              Top = 42
              Width = 349
              Height = 21
              Color = clInfoBk
              DataSource = DMPropagaStock.DSQMPropaga
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              Tabla_a_buscar = 'SYS_CANALES'
              Campo_Descripcion = 'TITULO'
              Base_de_datos = DMMain.DataBase
              CamposWhereOrigen.Strings = (
                'CANAL_D')
              CamposWhereTabla.Strings = (
                'CANAL')
            end
            object HYDBDEmpresaD: TLFHYDBDescription
              Left = 114
              Top = 20
              Width = 349
              Height = 21
              Color = clInfoBk
              DataSource = DMPropagaStock.DSQMPropaga
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 5
              Tabla_a_buscar = 'SYS_EMPRESAS'
              Campo_Descripcion = 'TITULO'
              Base_de_datos = DMMain.DataBase
              CamposWhereOrigen.Strings = (
                'EMPRESA_D')
              CamposWhereTabla.Strings = (
                'EMPRESA')
            end
          end
          object DBCBStock: TLFDBCheckBox
            Left = 12
            Top = 228
            Width = 97
            Height = 17
            Caption = 'Propaga Stock'
            ClicksDisabled = False
            TabOrder = 2
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'STOCK'
            DataSource = DMPropagaStock.DSQMPropaga
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBPmp: TLFDBCheckBox
            Left = 124
            Top = 228
            Width = 97
            Height = 17
            Caption = 'Propaga PMP'
            ClicksDisabled = False
            TabOrder = 3
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'PMP'
            DataSource = DMPropagaStock.DSQMPropaga
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          DataSource = DMPropagaStock.DSQMPropaga
          CamposAMarcar.Strings = (
            'PMP'
            'STOCK')
          CamposChecked.Strings = (
            '1'
            '1')
          CamposNoChecked.Strings = (
            '0'
            '0')
          CamposAOrdenar.Strings = (
            'AUTO_EJERCICIOS'
            'D_CANAL'
            'D_EJERCICIO'
            'D_EMPRESA'
            'MODIFICA'
            'MODO')
          Columns = <
            item
              Expanded = False
              FieldName = 'EMPRESA_O'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANAL_O'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALMACEN_O'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMPRESA_D'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANAL_D'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALMACEN_D'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'STOCK'
              Width = 47
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PMP'
              Width = 44
              Visible = True
            end>
        end
      end
    end
  end
  inherited CEMain: TControlEdit
    Left = 314
    Top = 44
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 366
    Top = 50
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 316
    Top = 96
  end
  inherited FSMain: TLFFibFormStorage
    Left = 372
    Top = 102
  end
end
