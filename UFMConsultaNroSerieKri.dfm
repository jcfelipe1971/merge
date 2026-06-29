object FMConsultaNroSerieKri: TFMConsultaNroSerieKri
  Left = 359
  Top = 157
  Width = 648
  Height = 467
  Caption = 'Consultade N'#250'mero de Serie'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PNLMain: TLFPanel
    Left = 0
    Top = 0
    Width = 640
    Height = 440
    Align = alClient
    TabOrder = 0
    object PageControl1: TLFPageControl
      Left = 1
      Top = 1
      Width = 638
      Height = 438
      ActivePage = TSLotes
      Align = alClient
      OwnerDraw = True
      TabIndex = 1
      TabOrder = 0
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSNroSerie: TTabSheet
        Caption = 'Nro. Serie'
        object PNLNroSerie: TLFPanel
          Left = 0
          Top = 0
          Width = 630
          Height = 33
          Align = alTop
          TabOrder = 0
          object LNroSerie: TLFLabel
            Left = 28
            Top = 9
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nro Serie'
          end
          object LArticuloNroSerie: TLFLabel
            Left = 264
            Top = 9
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Articulo'
          end
          object ENroSerie: TLFEdit
            Left = 76
            Top = 5
            Width = 121
            Height = 21
            TabOrder = 0
            OnChange = ENroSerieChange
          end
          object EFArticuloNroSerie: TEditFind2000
            Left = 304
            Top = 5
            Width = 121
            Height = 21
            TabOrder = 1
            OnChange = EFArticuloNroSerieChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            CondicionBusqueda = ' serializado_kri = 1'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'ART_ARTICULOS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'ARTICULO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
        end
        object GBAlbaranEntrada: TGroupBox
          Left = 0
          Top = 33
          Width = 630
          Height = 75
          Align = alTop
          Caption = 'Albaranes de Entradas'
          TabOrder = 1
          object DBGAlbaranEntrada: TDBGrid
            Left = 2
            Top = 15
            Width = 626
            Height = 58
            Align = alClient
            DataSource = DMConsultaNroSerieKri.DSxNroSerieKri
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'EJERCICIO_ENT'
                ReadOnly = True
                Width = 47
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CANAL_ENT'
                ReadOnly = True
                Width = 34
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'SERIE_ENT'
                ReadOnly = True
                Width = 36
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'RIG_ENT'
                ReadOnly = True
                Width = 62
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'LINEA_ENT'
                ReadOnly = True
                Width = 33
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'ALMACEN_ENT'
                ReadOnly = True
                Width = 46
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'FECHA_ENT'
                ReadOnly = True
                Width = 67
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'PROVEEDOR'
                ReadOnly = True
                Width = 57
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO_PROVEEDOR'
                ReadOnly = True
                Width = 203
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO_ALMACEN_ENT'
                ReadOnly = True
                Width = 224
                Visible = True
              end>
          end
        end
        object GBAlbaranSalida: TGroupBox
          Left = 0
          Top = 108
          Width = 630
          Height = 75
          Align = alTop
          Caption = 'Albaranes de Salidas'
          TabOrder = 2
          object DBGAlbaranSalida: TDBGrid
            Left = 2
            Top = 15
            Width = 626
            Height = 58
            Align = alClient
            DataSource = DMConsultaNroSerieKri.DSxNroSerieKri
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'EJERCICIO_SAL'
                ReadOnly = True
                Width = 48
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CANAL_SAL'
                ReadOnly = True
                Width = 32
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'SERIE_SAL'
                ReadOnly = True
                Width = 38
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'RIG_SAL'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'LINEA_SAL'
                ReadOnly = True
                Width = 32
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'ALMACEN_SAL'
                ReadOnly = True
                Width = 46
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'FECHA_SAL'
                ReadOnly = True
                Width = 68
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CLIENTE'
                ReadOnly = True
                Width = 58
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO_CLIENTE'
                ReadOnly = True
                Width = 204
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO_ALMACEN_SAL'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'DEVOLUCION_VENTA'
                ReadOnly = True
                Width = 28
                Visible = True
              end>
          end
        end
        object GBNrosDeSerie: TGroupBox
          Left = 0
          Top = 333
          Width = 630
          Height = 77
          Align = alClient
          Caption = 'Tabla'
          TabOrder = 3
          object DBGNrosDeSerie: TDBGrid
            Left = 2
            Top = 15
            Width = 626
            Height = 60
            Align = alClient
            DataSource = DMConsultaNroSerieKri.DSxNroSerieKri
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'ARTICULO'
                ReadOnly = True
                Width = 111
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'NRO_SERIE'
                ReadOnly = True
                Width = 178
                Visible = True
              end>
          end
        end
        object GBMovimientoentrada: TGroupBox
          Left = 0
          Top = 183
          Width = 630
          Height = 75
          Align = alTop
          Caption = 'Movimientos de Entrada'
          TabOrder = 4
          object DBGMovimientoentrada: TDBGrid
            Left = 2
            Top = 15
            Width = 626
            Height = 58
            Align = alClient
            DataSource = DMConsultaNroSerieKri.DSxNroSerieKri
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'EJERCICIO_MOE'
                ReadOnly = True
                Width = 50
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CANAL_MOE'
                ReadOnly = True
                Width = 32
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'SERIE_MOE'
                ReadOnly = True
                Width = 40
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'RIG_MOE'
                ReadOnly = True
                Width = 60
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'LINEA_MOE'
                ReadOnly = True
                Width = 35
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'ALMACEN_MOE'
                ReadOnly = True
                Width = 46
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'FECHA_MOE'
                ReadOnly = True
                Width = 70
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO_ALMACEN_MOE'
                ReadOnly = True
                Width = 273
                Visible = True
              end>
          end
        end
        object GBMovimientoSalida: TGroupBox
          Left = 0
          Top = 258
          Width = 630
          Height = 75
          Align = alTop
          Caption = 'Movimientos de Salida'
          TabOrder = 5
          object DBGMovimientoSalida: TDBGrid
            Left = 2
            Top = 15
            Width = 626
            Height = 58
            Align = alClient
            DataSource = DMConsultaNroSerieKri.DSxNroSerieKri
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'EJERCICIO_MOS'
                ReadOnly = True
                Width = 51
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CANAL_MOS'
                ReadOnly = True
                Width = 32
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'SERIE_MOS'
                ReadOnly = True
                Width = 39
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'RIG_MOS'
                ReadOnly = True
                Width = 61
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'LINEA_MOS'
                ReadOnly = True
                Width = 35
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'ALMACEN_MOS'
                ReadOnly = True
                Width = 46
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'FECHA_MOS'
                ReadOnly = True
                Width = 70
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO_ALMACEN_MOS'
                ReadOnly = True
                Width = 272
                Visible = True
              end>
          end
        end
      end
      object TSLotes: TTabSheet
        Caption = 'Lotes'
        ImageIndex = 1
        object PNLLotes: TLFPanel
          Left = 0
          Top = 0
          Width = 630
          Height = 33
          Align = alTop
          TabOrder = 0
          object LLote: TLFLabel
            Left = 50
            Top = 8
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Lote'
          end
          object LArticuloLote: TLFLabel
            Left = 265
            Top = 8
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Articulo'
          end
          object ELote: TLFEdit
            Left = 76
            Top = 5
            Width = 121
            Height = 21
            TabOrder = 0
            OnChange = ELoteChange
          end
          object EFArticulosLotes: TEditFind2000
            Left = 304
            Top = 5
            Width = 121
            Height = 21
            TabOrder = 1
            OnChange = EFArticulosLotesChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            CondicionBusqueda = ' lotes_kri = 1'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'ART_ARTICULOS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'ARTICULO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
        end
        object GBAlbaranLoteEntrada: TGroupBox
          Left = 0
          Top = 33
          Width = 630
          Height = 75
          Align = alTop
          Caption = 'Albaranes de Entradas'
          TabOrder = 1
          object DBGAlbaranLoteEntrada: TDBGrid
            Left = 2
            Top = 15
            Width = 626
            Height = 58
            Align = alClient
            DataSource = DMConsultaNroSerieKri.DSxLotesEntradas
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'COUNT'
                ReadOnly = True
                Width = 50
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'EJERCICIO_ENT'
                ReadOnly = True
                Width = 50
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CANAL_ENT'
                ReadOnly = True
                Width = 35
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'SERIE_ENT'
                ReadOnly = True
                Width = 35
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'RIG_ENT'
                ReadOnly = True
                Width = 50
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'LINEA_ENT'
                ReadOnly = True
                Width = 35
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'FECHA_ENT'
                ReadOnly = True
                Width = 65
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'ALMACEN_ENT'
                ReadOnly = True
                Width = 50
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO_ALMACEN_ENT'
                ReadOnly = True
                Width = 100
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'PROVEEDOR'
                ReadOnly = True
                Width = 60
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO_PROVEEDOR'
                ReadOnly = True
                Width = 200
                Visible = True
              end>
          end
        end
        object GBAlbaranLoteSalida: TGroupBox
          Left = 0
          Top = 108
          Width = 630
          Height = 75
          Align = alTop
          Caption = 'Albaranes de Salidas'
          TabOrder = 2
          object DBGAlbaranLoteSalida: TDBGrid
            Left = 2
            Top = 15
            Width = 626
            Height = 58
            Align = alClient
            DataSource = DMConsultaNroSerieKri.DSxLotesSalidas
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'COUNT'
                ReadOnly = True
                Width = 50
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'EJERCICIO_SAL'
                ReadOnly = True
                Width = 50
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CANAL_SAL'
                ReadOnly = True
                Width = 35
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'SERIE_SAL'
                ReadOnly = True
                Width = 35
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'RIG_SAL'
                ReadOnly = True
                Width = 50
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'LINEA_SAL'
                ReadOnly = True
                Width = 35
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'FECHA_SAL'
                ReadOnly = True
                Width = 70
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'ALMACEN_SAL'
                ReadOnly = True
                Width = 50
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO_ALMACEN_SAL'
                ReadOnly = True
                Width = 100
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CLIENTE'
                ReadOnly = True
                Width = 65
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO_CLIENTE'
                ReadOnly = True
                Width = 200
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'DEVOLUCION_VENTA'
                ReadOnly = True
                Width = 28
                Visible = True
              end>
          end
        end
        object GBLote: TGroupBox
          Left = 0
          Top = 333
          Width = 630
          Height = 77
          Align = alClient
          Caption = 'Tabla'
          TabOrder = 3
          object DBGLote: TDBGrid
            Left = 2
            Top = 15
            Width = 626
            Height = 60
            Align = alClient
            DataSource = DMConsultaNroSerieKri.DSxNroDeLote
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'COUNT'
                ReadOnly = True
                Width = 50
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'ARTICULO'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'LOTE'
                ReadOnly = True
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CADUCIDAD'
                ReadOnly = True
                Visible = True
              end>
          end
        end
        object GBMovimientoLoteEntrada: TGroupBox
          Left = 0
          Top = 183
          Width = 630
          Height = 75
          Align = alTop
          Caption = 'Movimientos de Entrada'
          TabOrder = 4
          object DBGMovimientoLoteEntrada: TDBGrid
            Left = 2
            Top = 15
            Width = 626
            Height = 58
            Align = alClient
            DataSource = DMConsultaNroSerieKri.DSxLotesMovEnt
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'COUNT'
                ReadOnly = True
                Width = 52
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'EJERCICIO_MOE'
                ReadOnly = True
                Width = 51
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CANAL_MOE'
                ReadOnly = True
                Width = 35
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'SERIE_MOE'
                ReadOnly = True
                Width = 36
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'RIG_MOE'
                ReadOnly = True
                Width = 48
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'LINEA_MOE'
                ReadOnly = True
                Width = 36
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'FECHA_MOE'
                ReadOnly = True
                Width = 72
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'ALMACEN_MOE'
                ReadOnly = True
                Width = 49
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO_ALMACEN_MOE'
                ReadOnly = True
                Visible = True
              end>
          end
        end
        object GBMovimientoLoteSalida: TGroupBox
          Left = 0
          Top = 258
          Width = 630
          Height = 75
          Align = alTop
          Caption = 'Movimiento de Salidas'
          TabOrder = 5
          object DBGMovimientoLoteSalida: TDBGrid
            Left = 2
            Top = 15
            Width = 626
            Height = 58
            Align = alClient
            DataSource = DMConsultaNroSerieKri.DSxLotesMovSal
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'COUNT'
                ReadOnly = True
                Width = 52
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'EJERCICIO_MOS'
                ReadOnly = True
                Width = 52
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CANAL_MOS'
                ReadOnly = True
                Width = 38
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'SERIE_MOS'
                ReadOnly = True
                Width = 35
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'RIG_MOS'
                ReadOnly = True
                Width = 45
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'LINEA_MOS'
                ReadOnly = True
                Width = 37
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'FECHA_MOS'
                ReadOnly = True
                Width = 75
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'ALMACEN_MOS'
                ReadOnly = True
                Width = 48
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO_ALMACEN_MOS'
                ReadOnly = True
                Visible = True
              end>
          end
        end
      end
    end
  end
end
