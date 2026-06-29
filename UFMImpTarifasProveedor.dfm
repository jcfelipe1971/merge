inherited FMImpTarifasProveedor: TFMImpTarifasProveedor
  Left = 468
  Top = 220
  Caption = 'Importacion Tarifas Proveedor'
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    inherited TBMain: TLFToolBar
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
      end
    end
    inherited PCMain: TLFPageControl
      inherited TSImportacion2: TTabSheet
        inherited LProgreso: TLFLabel
          Top = 225
        end
        inherited PNLImportacion: TLFPanel
          Height = 225
          object LProveedor: TLFLabel [0]
            Left = 43
            Top = 12
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Proveedor'
          end
          object LArticulo: TLFLabel [1]
            Left = 57
            Top = 126
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Articulo'
          end
          object LTarifa: TLFLabel [2]
            Left = 65
            Top = 34
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tarifa'
          end
          object LCodProveedor: TLFLabel [3]
            Left = 18
            Top = 149
            Width = 74
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cod. Proveedor'
          end
          object LPrecio: TLFLabel [4]
            Left = 62
            Top = 171
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Precio'
          end
          object LDescuentos: TLFLabel [5]
            Left = 35
            Top = 101
            Width = 57
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descuentos'
          end
          object LFechaBaja: TLFLabel [6]
            Left = 38
            Top = 77
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Baja'
          end
          object LFechaAlta: TLFLabel [7]
            Left = 41
            Top = 58
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Alta'
          end
          inherited BBorrarLog: TButton
            Top = 190
            TabOrder = 14
          end
          object BtImportar: TButton
            Left = 96
            Top = 198
            Width = 75
            Height = 25
            Caption = 'Importar'
            TabOrder = 12
            OnClick = BtImportarClick
          end
          object CBModificar: TCheckBox
            Left = 184
            Top = 201
            Width = 145
            Height = 17
            Caption = 'Modificar si existe'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 13
          end
          object ETituloProveedor: TLFEdit
            Left = 218
            Top = 9
            Width = 386
            Height = 21
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object EFArticulo: TLFEditFind2000
            Left = 96
            Top = 123
            Width = 121
            Height = 21
            TabOrder = 8
            OnChange = EFArticuloChange
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
          object ETituloArticulo: TLFEdit
            Left = 218
            Top = 123
            Width = 386
            Height = 21
            TabStop = False
            Anchors = [akLeft, akTop, akRight]
            AutoSize = False
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 9
          end
          object ECodProveedor: TLFEdit
            Left = 96
            Top = 145
            Width = 121
            Height = 21
            TabOrder = 10
          end
          object EPrecio: TLFEdit
            Left = 96
            Top = 167
            Width = 121
            Height = 21
            TabOrder = 11
            Text = '0'
          end
          object EDesc1: TLFEdit
            Left = 96
            Top = 97
            Width = 121
            Height = 21
            TabOrder = 5
            Text = '0'
          end
          object EDesc2: TLFEdit
            Left = 224
            Top = 97
            Width = 121
            Height = 21
            TabOrder = 6
            Text = '0'
          end
          object EDesc3: TLFEdit
            Left = 352
            Top = 97
            Width = 121
            Height = 21
            TabOrder = 7
            Text = '0'
          end
          object DEBaja: TLFDateEdit
            Left = 96
            Top = 75
            Width = 121
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 4
          end
          object DEAlta: TLFDateEdit
            Left = 96
            Top = 53
            Width = 121
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 3
          end
          object EFProveedor: TLFEditFind2000
            Left = 96
            Top = 9
            Width = 121
            Height = 21
            TabOrder = 0
            OnChange = EFProveedorChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'PROVEEDOR'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tabla_a_buscar = 'VER_PROVEEDORES_EMPRESA'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'PROVEEDOR')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETarifa: TLFEdit
            Left = 96
            Top = 31
            Width = 121
            Height = 21
            TabOrder = 2
            Text = '0'
          end
        end
        inherited MLog: TLFMemo
          Top = 238
          Height = 258
        end
      end
    end
  end
end
