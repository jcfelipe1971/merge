inherited ZFMSeriesCli: TZFMSeriesCli
  Left = 285
  Top = 128
  Width = 578
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Mantenimiento Nros. Series Cliente'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 568
    Height = 154
    inherited TBMain: TLFToolBar
      Width = 564
      inherited NavMain: THYMNavigator
        DataSource = ZDMSeriesCli.DSCabSeriesCli
        Hints.Strings = ()
        EditaControl = DBEFCliente
        InsertaControl = DBEFCliente
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
    end
    inherited PCMain: TLFPageControl
      Width = 564
      Height = 124
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 556
          Height = 96
          inherited G2KTableLoc: TG2KTBLoc
            Top = 26
            DataSource = ZDMSeriesCli.DSCabSeriesCli
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'VER_ART_ARTICULOS_SER_CLI'
            CampoNum = 'CLIENTE'
            CampoStr = 'NOMBRE_R_SOCIAL'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'CLIENTE')
          end
          object LID: TLFLabel
            Left = 29
            Top = 17
            Width = 11
            Height = 13
            Caption = 'ID'
          end
          object LFecha: TLFLabel
            Left = 10
            Top = 61
            Width = 30
            Height = 13
            Caption = 'Fecha'
          end
          object LCliente: TLFLabel
            Left = 8
            Top = 40
            Width = 32
            Height = 13
            Caption = 'Cliente'
          end
          object LFDBId: TLFDbedit
            Left = 45
            Top = 13
            Width = 57
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ID'
            DataSource = ZDMSeriesCli.DSCabSeriesCli
            Enabled = False
            TabOrder = 0
          end
          object LFDBFecha: TLFDBDateEdit
            Left = 44
            Top = 57
            Width = 89
            Height = 21
            DataField = 'FECHA'
            DataSource = ZDMSeriesCli.DSCabSeriesCli
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 3
          end
          object DBEFCliente: TLFDBEditFind2000
            Left = 45
            Top = 35
            Width = 57
            Height = 21
            DataField = 'CLIENTE'
            DataSource = ZDMSeriesCli.DSCabSeriesCli
            TabOrder = 1
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CLIENTES_SIMPLE'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CLIENTE'
            CampoStr = 'NOMBRE_COMERCIAL'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CLIENTE')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object ECliente: TLFDbedit
            Left = 104
            Top = 35
            Width = 442
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'NOMBRE_R_SOCIAL'
            DataSource = ZDMSeriesCli.DSCabSeriesCli
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
          object PBExportacion: TProgressBar
            Left = 0
            Top = 80
            Width = 556
            Height = 16
            Align = alBottom
            Min = 0
            Max = 100
            TabOrder = 4
            Visible = False
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 556
          Height = 96
          DataSource = ZDMSeriesCli.DSCabSeriesCli
          CamposAOrdenar.Strings = (
            'CLIENTE'
            'FECHA'
            'ID'
            'NOMBRE_R_SOCIAL')
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLIENTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Width = 65
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOMBRE_R_SOCIAL'
              Width = 318
              Visible = True
            end>
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 154
    Width = 568
    Height = 254
    inherited TBDetalle: TLFToolBar
      Width = 568
      inherited NavDetalle: THYMNavigator
        DataSource = ZDMSeriesCli.DSDetSeriesCli
        Hints.Strings = ()
        InsertaUltimo = True
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 568
      Height = 232
      DataSource = ZDMSeriesCli.DSDetSeriesCli
      OnCellClick = DBGFDetalleCellClick
      OnDrawColumnCell = DBGFDetalleDrawColumnCell
      OnDblClick = DBGFDetalleDblClick
      ColumnaInicial = 1
      Campos.Strings = (
        'ARTICULO'
        'NSERIE'
        'ALMACEN')
      CamposAMostrar.Strings = (
        'ARTICULO'
        '0'
        'NSERIE'
        '0'
        'ALMACEN'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0'
        '0'
        '0')
      CamposADevolver.Strings = (
        ''
        'NSERIE'
        '')
      CamposDesplegar.Strings = (
        '1'
        '1'
        '1')
      CamposAOrdernar.Strings = (
        'ARTICULO'
        'CLIENTE'
        'CODIGO'
        'FECHA_CADUCIDAD'
        'FECHA_GARANTIA_CLIENTE'
        'FECHA_GARANTIA_PROVEEDOR'
        'LINEA'
        'NSERIE'
        'TITULO_LARGO')
      Numericos.Strings = (
        'ARTICULO'
        'NSERIE'
        'ALMACEN')
      SalirSiVacio = True
      SalirSiNoExiste = True
      Tablas.Strings = (
        'VER_ARTICULOS_EF'
        'ART_ARTICULOS_SERIALIZACION'
        'ART_ALMACENES')
      Acciones.Strings = (
        ''
        ''
        '')
      Titulos.Strings = (
        'TITULO'
        ''
        'TITULO')
      OnBusqueda = DBGFDetalleBusqueda
      Planes.Strings = (
        ''
        ''
        '')
      OrdenadosPor.Strings = (
        'ARTICULO'
        'NSERIE'
        'ALMACEN')
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LINEA'
          ReadOnly = True
          Width = 40
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ALMACEN'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ARTICULO'
          Width = 80
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TITULO_LARGO'
          ReadOnly = True
          Width = 199
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NSERIE'
          Width = 157
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'FECHA_CADUCIDAD'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'FECHA_GARANTIA_CLIENTE'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'FECHA_GARANTIA_PROVEEDOR'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'NOTAS'
          ReadOnly = True
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Width = 568
  end
  inherited CEMain: TControlEdit
    Left = 336
    Top = 12
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 372
    Top = 12
  end
  inherited ALMain: TLFActionList
    Left = 416
    Top = 8
    object AExportacionExcel: TAction
      Category = 'Listados'
      Caption = 'Exportacion Excel'
      Hint = 'Exportacion Excel'
      ImageIndex = 105
      OnExecute = AExportacionExcelExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 456
    Top = 8
  end
  inherited CEDetalle: TControlEdit
    Left = 406
    Top = 72
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 442
    Top = 74
  end
end
