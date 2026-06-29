inherited ZFMArtToldos: TZFMArtToldos
  Left = 275
  Top = 304
  Width = 600
  Height = 451
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Datos especiales de Toldos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 590
    Height = 227
    inherited TBMain: TLFToolBar
      Width = 586
      inherited NavMain: THYMNavigator
        DataSource = ZDMArtToldos.DSQMToldos
        Hints.Strings = ()
        OnClick = NavMainClick
        EditaControl = DBChkBIncr
        InsertaControl = DBEFLona
      end
      inherited EPMain: THYMEditPanel
        Width = 29
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 257
      end
      inherited TbuttComp: TToolButton
        Left = 265
      end
    end
    inherited PCMain: TLFPageControl
      Width = 586
      Height = 197
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 578
          Height = 169
          inherited G2KTableLoc: TG2KTBLoc
            Left = 61
            Top = 112
          end
          object LblTarifa: TLFLabel
            Left = 21
            Top = 102
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tarifa'
          end
          object LblPCoste: TLFLabel
            Left = 369
            Top = 2
            Width = 68
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'P. Coste'
          end
          object LblPVenta: TLFLabel
            Left = 438
            Top = 2
            Width = 68
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'P. Venta'
          end
          object LblMargen: TLFLabel
            Left = 507
            Top = 2
            Width = 68
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'Margen'
          end
          object LblToldo: TLFLabel
            Left = 22
            Top = 21
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Toldo'
          end
          object LblLona: TLFLabel
            Left = 24
            Top = 80
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Lona'
          end
          object LblArmazon: TLFLabel
            Left = 8
            Top = 58
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Armaz'#243'n'
          end
          object DBChkBMotor: TLFDBCheckBox
            Left = 52
            Top = 146
            Width = 49
            Height = 17
            Caption = 'Motor'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 19
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'MOTOR'
            DataSource = ZDMArtToldos.DSQMToldos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEPCoste: TLFDbedit
            Left = 369
            Top = 18
            Width = 68
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'P_COSTE'
            DataSource = ZDMArtToldos.DSxDatosToldo
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object DBEPVenta: TLFDbedit
            Left = 438
            Top = 18
            Width = 68
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'P_VENTA'
            DataSource = ZDMArtToldos.DSxDatosToldo
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object DBEMargen: TLFDbedit
            Left = 507
            Top = 18
            Width = 68
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'MARGEN'
            DataSource = ZDMArtToldos.DSxDatosToldo
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
          object DBEFTarifa: TLFDBEditFind2000
            Left = 52
            Top = 99
            Width = 42
            Height = 21
            Color = clInfoBk
            DataField = 'TARIFA'
            DataSource = ZDMArtToldos.DSQMToldos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 15
            OnChange = DBEFTarifaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_TARIFAS_C'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TARIFA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DescTarifa: TLFHYDBDescription
            Left = 95
            Top = 99
            Width = 121
            Height = 21
            Color = clInfoBk
            DataSource = ZDMArtToldos.DSQMToldos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 16
            Tabla_a_buscar = 'ART_TARIFAS_C'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'EMPRESA'
              'TARIFA')
            CamposWhereTabla.Strings = (
              'EMPRESA'
              'TARIFA')
          end
          object EToldo: TLFEdit
            Left = 52
            Top = 18
            Width = 86
            Height = 21
            TabStop = False
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            Text = 'EToldo'
          end
          object EDescToldo: TLFEdit
            Left = 139
            Top = 18
            Width = 223
            Height = 21
            TabStop = False
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Text = 'EDescToldo'
          end
          object DBEFLona: TLFDBEditFind2000
            Left = 52
            Top = 77
            Width = 86
            Height = 21
            Color = clInfoBk
            DataField = 'LONA'
            DataSource = ZDMArtToldos.DSQMToldos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 10
            OnChange = DBEFLonaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_ARTICULOS_EF'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'tipo_articulo_tyc="L"'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DescLona: TLFHYDBDescription
            Left = 139
            Top = 77
            Width = 223
            Height = 21
            Color = clInfoBk
            DataSource = ZDMArtToldos.DSQMToldos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 11
            Tabla_a_buscar = 'ART_ARTICULOS'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'EMPRESA'
              'LONA')
            CamposWhereTabla.Strings = (
              'EMPRESA'
              'ARTICULO')
          end
          object DBEArmazon: TLFDbedit
            Left = 52
            Top = 55
            Width = 86
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ARMAZON'
            DataSource = ZDMArtToldos.DSQMToldos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
            OnChange = DBEArmazonChange
          end
          object DescArmazon: TLFHYDBDescription
            Left = 139
            Top = 55
            Width = 223
            Height = 21
            Color = clInfoBk
            DataSource = ZDMArtToldos.DSQMToldos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
            Tabla_a_buscar = 'ART_ARTICULOS'
            Campo_Descripcion = 'TITULO'
            Base_de_datos = DMMain.DataBase
            CamposWhereOrigen.Strings = (
              'ARMAZON'
              'EMPRESA')
            CamposWhereTabla.Strings = (
              'ARTICULO'
              'EMPRESA')
          end
          object DBEPCosteLona: TLFDbedit
            Left = 369
            Top = 77
            Width = 68
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'P_COSTE'
            DataSource = ZDMArtToldos.DSxDatosLona
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 12
          end
          object DBEPVentaLona: TLFDbedit
            Left = 438
            Top = 77
            Width = 68
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'P_VENTA'
            DataSource = ZDMArtToldos.DSxDatosLona
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 13
          end
          object DBEPMargenLona: TLFDbedit
            Left = 507
            Top = 77
            Width = 68
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'MARGEN'
            DataSource = ZDMArtToldos.DSxDatosLona
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 14
          end
          object DBEPCosteArmazon: TLFDbedit
            Left = 369
            Top = 55
            Width = 68
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'P_COSTE'
            DataSource = ZDMArtToldos.DSxDatosArmazon
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 7
          end
          object DBEPVentaArmazon: TLFDbedit
            Left = 438
            Top = 55
            Width = 68
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'P_VENTA'
            DataSource = ZDMArtToldos.DSxDatosArmazon
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 8
          end
          object DBEPMargenArmazon: TLFDbedit
            Left = 507
            Top = 55
            Width = 68
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'MARGEN'
            DataSource = ZDMArtToldos.DSxDatosArmazon
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 9
          end
          object DBCBDefecto: TLFDBCheckBox
            Left = 157
            Top = 146
            Width = 57
            Height = 17
            Caption = 'Defecto'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 20
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'DEFECTO'
            DataSource = ZDMArtToldos.DSQMToldos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBChkBIncr: TLFDBCheckBox
            Left = 52
            Top = 123
            Width = 109
            Height = 17
            Caption = 'Incr. Lacado PVP'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 17
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'INCR_LACADO_PVP'
            DataSource = ZDMArtToldos.DSQMToldos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEIncr: TLFDbedit
            Left = 157
            Top = 121
            Width = 59
            Height = 21
            DataField = 'P_INCR_LACADO_PVP'
            DataSource = ZDMArtToldos.DSQMToldos
            TabOrder = 18
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 578
          Height = 169
          DataSource = ZDMArtToldos.DSQMToldos
          CamposAMarcar.Strings = (
            'DEFECTO'
            'INCR_LACADO_PVP'
            'MOTOR')
          CamposChecked.Strings = (
            '1'
            '1'
            '1')
          CamposNoChecked.Strings = (
            '0'
            '0'
            '0')
          CamposAOrdenar.Strings = (
            'ARMAZON'
            'ARTICULO'
            'DEFECTO'
            'INCR_LACADO_PVP'
            'LONA'
            'MOTOR'
            'P_INCR_LACADO_PVP'
            'TARIFA')
          Columns = <
            item
              Expanded = False
              FieldName = 'TARIFA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ARMAZON'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LONA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PCosteToldo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PVentaToldo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MargenToldo'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PCosteLona'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PVentaLona'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MargenLona'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MultiploLona'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TotalLinea'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TotalSalida'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'M2_Lona'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MOTOR'
              Width = 32
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEFECTO'
              Width = 42
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar [1]
    Top = 398
    Width = 590
  end
  inherited PDetalle: TLFPanel [2]
    Top = 227
    Width = 590
    Height = 171
    inherited TBDetalle: TLFToolBar
      Width = 590
      inherited NavDetalle: THYMNavigator
        DataSource = ZDMArtToldos.DSQMToldosDet
        Hints.Strings = ()
        Exclusivo = True
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 590
      Height = 149
      DataSource = ZDMArtToldos.DSQMToldosDet
      OnCellClick = DBGFDetalleCellClick
      OnDrawColumnCell = DBGFDetalleDrawColumnCell
      OnDblClick = DBGFDetalleDblClick
      ColumnaInicial = 1
      Campos.Strings = (
        'DETALLE'
        'ESCANDALLO_DEF')
      CamposAMostrar.Strings = (
        'DETALLE'
        '0'
        'ESCANDALLO_DEF'
        '0')
      CamposAMostrarAnchos.Strings = (
        '0'
        '0')
      CamposADevolver.Strings = (
        ''
        '')
      CamposDesplegar.Strings = (
        '1'
        '1')
      ColumnasCheckBoxes.Strings = (
        'VALORAR')
      ColumnasChecked.Strings = (
        '1')
      ColumnasNoChecked.Strings = (
        '0')
      Numericos.Strings = (
        'ARTICULO'
        'ESCANDALLO')
      Tablas.Strings = (
        'ART_ARTICULOS'
        'PRO_ESCANDALLO')
      Acciones.Strings = (
        ''
        '')
      Titulos.Strings = (
        'TITULO'
        'COMPUESTO')
      OnBusqueda = DBGFDetalleBusqueda
      Planes.Strings = (
        ''
        '')
      OrdenadosPor.Strings = (
        ''
        '')
      Filtros = [obEmpresa]
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TipoArt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DETALLE'
          Width = 70
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'DescArt'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 164
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'PCoste'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 48
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'PVenta'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 48
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'Margen'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Width = 45
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESCANDALLO_DEF'
          Width = 56
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'VALORAR'
          Width = 26
          Visible = True
        end>
    end
  end
  inherited CEMain: TControlEdit
    Left = 360
    Top = 3
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 396
    Top = 3
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 192
    Top = 29
  end
  inherited FSMain: TLFFibFormStorage
    Left = 232
    Top = 29
  end
  inherited CEDetalle: TControlEdit
    Left = 360
    Top = 34
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 397
    Top = 34
  end
end
