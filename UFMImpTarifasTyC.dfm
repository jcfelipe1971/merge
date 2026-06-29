inherited FMImpTarifasTyC: TFMImpTarifasTyC
  Left = 468
  Top = 220
  Caption = 'Importacion Tarifas TyC'
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
      ActivePage = TSImportacion2
      TabIndex = 1
      inherited TSImportacion2: TTabSheet
        inherited LProgreso: TLFLabel
          Top = 225
        end
        inherited PNLImportacion: TLFPanel
          Height = 225
          object LModelo: TLFLabel [0]
            Left = 44
            Top = 12
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Modelo'
          end
          object LTipoLona: TLFLabel [1]
            Left = 31
            Top = 33
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Lona'
          end
          object LFLabel1: TLFLabel [2]
            Left = 52
            Top = 56
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tarifa'
          end
          inherited BBorrarLog: TButton
            Top = 190
            TabOrder = 9
          end
          object BtImportar: TButton
            Left = 96
            Top = 198
            Width = 75
            Height = 25
            Caption = 'Importar'
            TabOrder = 7
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
            TabOrder = 8
          end
          object DBEFModelo: TLFEditFind2000
            Left = 83
            Top = 8
            Width = 64
            Height = 21
            TabOrder = 0
            OnChange = DBEFModeloChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'Z_SYS_MODELOS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBETipoLona: TLFEditFind2000
            Left = 83
            Top = 30
            Width = 64
            Height = 21
            TabOrder = 2
            OnChange = DBETipoLonaChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'Z_SYS_LONAS'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
          end
          object DBETarifa: TLFEditFind2000
            Left = 83
            Top = 52
            Width = 64
            Height = 21
            TabOrder = 4
            OnChange = DBETarifaChange
            Base_de_datos = DMMain.DataBase
            Transaction = DMMain.TLocal
            BuscarNums = False
            BuscarChars = True
            AutoCambiarFoco = False
            CampoNum = 'TARIFA'
            CampoStr = 'TITULO'
            Posicion = tpCentrado
            ReemplazarCaracter = True
            SalirSiVacio = True
            SalirSiNoExiste = False
            Tabla_a_buscar = 'ART_TARIFAS_C'
            Tabla_asociada.DesplegarBusqueda = False
            OrdenadoPor.Strings = (
              'TARIFA')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DescTipoLona: TLFEdit
            Left = 148
            Top = 30
            Width = 400
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
          object DescTarifa: TLFEdit
            Left = 148
            Top = 52
            Width = 400
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 5
          end
          object CBBloqueado: TCheckBox
            Left = 85
            Top = 78
            Width = 145
            Height = 17
            Caption = 'Precio Bloqueado'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 6
          end
          object EModelo: TLFEdit
            Left = 148
            Top = 8
            Width = 400
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
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
