inherited FMReparacionesDicomol: TFMReparacionesDicomol
  Left = 346
  Top = 311
  Caption = 'Mantenimiento de Reparaciones'
  ClientHeight = 297
  ClientWidth = 530
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 530
    Height = 273
    inherited TBMain: TLFToolBar
      Width = 526
      inherited NavMain: THYMNavigator
        Width = 200
        Hints.Strings = ()
        EditaControl = LFDBCliente
        InsertaControl = LFDBCliente
      end
      inherited TSepNav: TToolButton
        Left = 200
      end
      inherited EPMain: THYMEditPanel
        Left = 208
        Width = 78
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 286
      end
      inherited TbuttComp: TToolButton
        Left = 294
      end
    end
    inherited PCMain: TLFPageControl
      Width = 526
      Height = 243
      inherited TSFicha: TTabSheet
        object SBACliente: TSpeedButton [0]
          Left = 372
          Top = 7
          Width = 23
          Height = 22
          GroupIndex = -1
          OnDblClick = SBAClienteDblClick
        end
        object SBAOrden: TSpeedButton [1]
          Left = 463
          Top = 185
          Width = 23
          Height = 22
          GroupIndex = -1
          OnDblClick = SBAOrdenDblClick
        end
        inherited PEdit: TLFPanel
          Width = 518
          Height = 215
          inherited G2KTableLoc: TG2KTBLoc
            CamposADesplegar.Strings = (
              'IDREPARACION')
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'Z_REPARACIONES'
            CampoNum = 'IDREPARACION'
            CampoStr = 'ARTICULO'
          end
          object LReparacion: TLFLabel
            Left = 20
            Top = 58
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = 'Reparaci'#243'n'
          end
          object LFecha: TLFLabel
            Left = 355
            Top = 58
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LCliente: TLFLabel
            Left = 43
            Top = 81
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cliente'
          end
          object LArticulo: TLFLabel
            Left = 38
            Top = 124
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Art'#237'culo'
          end
          object LFamilia: TLFLabel
            Left = 43
            Top = 103
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Familia'
          end
          object LSerie: TLFLabel
            Left = 388
            Top = 164
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Serie'
          end
          object LOrden: TLFLabel
            Left = 383
            Top = 186
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Orden'
          end
          object LEstado: TLFLabel
            Left = 232
            Top = 35
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Estado'
          end
          object LFDBCliente: TLFDBEditFind2000
            Left = 80
            Top = 76
            Width = 57
            Height = 21
            DataField = 'CLIENTE'
            DataSource = DMReparacionesDicomol.ZDSQMReparaciones
            TabOrder = 1
            OnChange = LFDBClienteChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CLIENTES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CLIENTE'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CLIENTE')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object LFDBFamilia: TLFDBEditFind2000
            Left = 80
            Top = 98
            Width = 57
            Height = 21
            DataField = 'FAMILIA'
            DataSource = DMReparacionesDicomol.ZDSQMReparaciones
            TabOrder = 2
            OnChange = LFDBFamiliaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_FAMILIAS_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'FAMILIA'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'FAMILIA <> '#39'SYS'#39
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'FAMILIA')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEFSeries: TDBEditFind2000
            Left = 417
            Top = 160
            Width = 61
            Height = 21
            DataField = 'SERIE'
            DataSource = DMReparacionesDicomol.ZDSQMReparaciones
            TabOrder = 5
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_SERIES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'SERIE'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'SERIE')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object LFOrden: TLFEdit
            Left = 417
            Top = 182
            Width = 61
            Height = 21
            Color = clInfoBk
            ReadOnly = True
            TabOrder = 6
          end
          object LFDBArticulo: TLFDBEditFind2000
            Left = 80
            Top = 120
            Width = 96
            Height = 21
            DataField = 'ARTICULO'
            DataSource = DMReparacionesDicomol.ZDSQMReparaciones
            TabOrder = 3
            OnChange = LFDBArticuloChange
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
            OrdenadoPor.Strings = (
              'ARTICULO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEProveedor: TLFDbedit
            Left = 80
            Top = 54
            Width = 57
            Height = 21
            Color = clInfoBk
            DataField = 'IDREPARACION'
            DataSource = DMReparacionesDicomol.ZDSQMReparaciones
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBDTPFecha: TDBDateEdit
            Left = 390
            Top = 54
            Width = 90
            Height = 21
            DataField = 'FECHA'
            DataSource = DMReparacionesDicomol.ZDSQMReparaciones
            NumGlyphs = 2
            TabOrder = 4
          end
          object DescArticulo: TLFDbedit
            Left = 177
            Top = 120
            Width = 303
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescArticulo'
            DataSource = DMReparacionesDicomol.ZDSQMReparaciones
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 7
          end
          object DescCliente: TLFDbedit
            Left = 138
            Top = 76
            Width = 342
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescCliente'
            DataSource = DMReparacionesDicomol.ZDSQMReparaciones
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 8
          end
          object DescFamilia: TLFDbedit
            Left = 138
            Top = 98
            Width = 342
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescFamilia'
            DataSource = DMReparacionesDicomol.ZDSQMReparaciones
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 9
          end
          object LFDBEstado: TLFDbedit
            Left = 269
            Top = 32
            Width = 211
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO_ESTADO'
            DataSource = DMReparacionesDicomol.ZDSQMReparaciones
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 10
          end
          object LFDBOrdV: TLFDbedit
            Left = 313
            Top = 171
            Width = 53
            Height = 21
            DataField = 'ID_ORDEN'
            DataSource = DMReparacionesDicomol.ZDSQMReparaciones
            TabOrder = 11
            Visible = False
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 518
          Height = 215
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          ControlEdit = CEMain
          CamposAOrdenar.Strings = (
            'ARTICULO'
            'CLIENTE'
            'FAMILIA'
            'FECHA'
            'IDREPARACION')
          Columns = <
            item
              Expanded = False
              FieldName = 'IDREPARACION'
              Title.Caption = 'Reparaci'#243'n'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLIENTE'
              Title.Caption = 'Cliente'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FAMILIA'
              Title.Caption = 'Familia'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ARTICULO'
              Title.Caption = 'Art'#237'culo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Title.Caption = 'Fecha'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMPRESA'
              Title.Caption = 'Empresa'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SERIE'
              Title.Caption = 'Serie'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DescFamilia'
              Title.Caption = 'Descripci'#243'n Familia'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DescCliente'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DescArticulo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO_REP'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 273
    Width = 530
  end
  inherited CEMain: TControlEdit
    Left = 256
    Top = 12
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 428
    Top = 4
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 360
    Top = 8
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Proceso'
      Caption = 'Proceso'
      ImageIndex = 16
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listado'
      Caption = 'Listado'
      ImageIndex = 14
    end
    object AGenerarOrden: TAction
      Category = 'Proceso'
      Caption = 'Generar Orden'
      OnExecute = AGenerarOrdenExecute
    end
    object AListadoEtiquetas: TAction
      Category = 'Listado'
      Caption = 'Listado de Etiquetas'
      ImageIndex = 95
      OnExecute = AListadoEtiquetasExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 400
    Top = 8
  end
  object ALReparaciones: TLFActionList
    Reset = False
    Enabled = True
    Changed = False
    Left = 464
    Top = 8
    object AACliente: TAction
      Caption = 'AACliente'
      OnExecute = AAClienteExecute
    end
    object AAOrden: TAction
      Caption = 'AAOrden'
      OnExecute = AAOrdenExecute
    end
  end
end
