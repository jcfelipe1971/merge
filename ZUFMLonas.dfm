inherited ZFMLonas: TZFMLonas
  Left = 468
  Top = 140
  Caption = 'Mantenimiento de Tipos de Lonas'
  ClientHeight = 377
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 353
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        DataSource = ZDMLonas.DSQMLonas
        Hints.Strings = ()
        OnClick = NavMainClick
        EditaControl = DBEDescripcion
        InsertaControl = DBECodigo
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
      end
    end
    inherited PCMain: TLFPageControl
      Height = 323
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Height = 295
          inherited G2KTableLoc: TG2KTBLoc
            Left = 169
            Top = 19
          end
          object LblCodigo: TLFLabel
            Left = 57
            Top = 31
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo'
          end
          object LblDescripcion: TLFLabel
            Left = 34
            Top = 53
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object LblImagen: TLFLabel
            Left = 55
            Top = 119
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Imagen'
          end
          object LblMultiplo: TLFLabel
            Left = 25
            Top = 75
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = 'M'#250'ltiplo Linea'
          end
          object LFLabel1: TLFLabel
            Left = 241
            Top = 75
            Width = 68
            Height = 13
            Alignment = taRightJustify
            Caption = 'M'#250'ltiplo Salida'
          end
          object LblSeccion: TLFLabel
            Left = 51
            Top = 97
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Secci'#243'n'
          end
          object DBECodigo: TLFDbedit
            Left = 95
            Top = 27
            Width = 34
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CODIGO'
            DataSource = ZDMLonas.DSQMLonas
            TabOrder = 0
          end
          object DBEDescripcion: TLFDbedit
            Left = 95
            Top = 49
            Width = 300
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = ZDMLonas.DSQMLonas
            TabOrder = 1
          end
          object DBEFImagen: TLFDBEditFind2000
            Left = 95
            Top = 115
            Width = 34
            Height = 21
            DataField = 'IMAGEN'
            DataSource = ZDMLonas.DSQMLonas
            TabOrder = 5
            OnChange = DBEFImagenChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_IMAGENES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODIGO'
            CampoStr = 'NOMBRE'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CODIGO')
            Filtros = []
          end
          object ETituloImagen: TLFEdit
            Left = 130
            Top = 115
            Width = 265
            Height = 21
            TabStop = False
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 6
          end
          object ScrBImagen: TScrollBox
            Left = 249
            Top = 144
            Width = 144
            Height = 144
            BevelOuter = bvNone
            BorderStyle = bsNone
            TabOrder = 7
            object Imagen: TImage
              Left = 0
              Top = 0
              Width = 144
              Height = 144
              Align = alClient
              AutoSize = True
              IncrementalDisplay = True
              Stretch = True
            end
          end
          object DBEMultiplo: TLFDbedit
            Left = 95
            Top = 71
            Width = 82
            Height = 21
            DataField = 'MULTIPLO'
            DataSource = ZDMLonas.DSQMLonas
            TabOrder = 2
          end
          object DBEMultiploSalida: TLFDbedit
            Left = 313
            Top = 71
            Width = 82
            Height = 21
            DataField = 'MULTIPLO_SALIDA'
            DataSource = ZDMLonas.DSQMLonas
            TabOrder = 3
          end
          object LFDBTipo: TLFDBCheckBox
            Left = 184
            Top = 28
            Width = 121
            Height = 17
            Caption = 'Persiana'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 8
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'TIPO'
            DataSource = ZDMLonas.DSQMLonas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object BCargarImagen: TButton
            Left = 348
            Top = 117
            Width = 22
            Height = 18
            Caption = '...'
            TabOrder = 9
            Visible = False
            OnClick = BCargarImagenClick
          end
          object DBEFSeccion: TLFDBEditFind2000
            Left = 95
            Top = 93
            Width = 34
            Height = 21
            BevelInner = bvNone
            BevelOuter = bvNone
            DataField = 'SECCION'
            DataSource = ZDMLonas.DSQMLonas
            TabOrder = 4
            OnChange = DBEFSeccionChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'OPE_SECCIONES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'SECCION'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'SECCION')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETitSeccion: TLFEdit
            Left = 130
            Top = 93
            Width = 265
            Height = 21
            TabStop = False
            AutoSize = False
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 10
          end
          object BClipboard: TButton
            Left = 370
            Top = 117
            Width = 23
            Height = 18
            Hint = 'Cargar imagen desde porta papeles'
            Caption = 'P'
            TabOrder = 11
            Visible = False
            OnClick = BClipboardClick
          end
        end
      end
      object TSLonasTareas: TTabSheet [1]
        Caption = 'T&areas'
        ImageIndex = 2
        object TBLonaTareas: TLFToolBar
          Left = 0
          Top = 0
          Width = 490
          Height = 26
          Caption = 'TBLonaTareas'
          EdgeInner = esNone
          EdgeOuter = esNone
          TabOrder = 0
          Separators = True
          object NavLonaTareas: THYMNavigator
            Left = 0
            Top = 2
            Width = 240
            Height = 22
            DataSource = ZDMLonas.DSLonaTareas
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGTareas: TDBGridFind2000
          Left = 0
          Top = 51
          Width = 490
          Height = 244
          Align = alClient
          DataSource = ZDMLonas.DSLonaTareas
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
          IndiceBitmapAscendente = 0
          IndiceBitmapChecked = -1
          IndiceBitmapDescendente = 0
          BaseDeDatos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          Campos.Strings = (
            'TAREA'
            'SECCION'
            'RECURSO')
          CamposAMostrar.Strings = (
            'TAREA'
            '0'
            'SECCION'
            '0'
            'RECURSO'
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
          MensajeNoExiste = False
          Numericos.Strings = (
            'TAREA'
            'SECCION'
            'RECURSO')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'PRO_SYS_TAREAS'
            'OPE_SECCIONES'
            'PRO_RECURSOS')
          Acciones.Strings = (
            ''
            ''
            '')
          Titulos.Strings = (
            'TITULO'
            'DESCRIPCION'
            'TITULO')
          Posicion = tpCentrado
          OnBusqueda = DBGTareasBusqueda
          Planes.Strings = (
            ''
            ''
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            'TAREA'
            'SECCION'
            'RECURSO')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'TAREA'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SECCION'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RECURSO'
              Width = 100
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ORDEN'
              Width = 100
              Visible = True
            end>
        end
        object PnlLonaInfo: TLFPanel
          Left = 0
          Top = 26
          Width = 490
          Height = 25
          Align = alTop
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 2
          object DBLCodigo: TLFDbedit
            Left = 2
            Top = 2
            Width = 43
            Height = 21
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'CODIGO'
            DataSource = ZDMLonas.DSQMLonas
            Enabled = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBLLonaDesc: TLFDbedit
            Left = 47
            Top = 2
            Width = 440
            Height = 21
            Color = clInfoBk
            DataField = 'DESCRIPCION'
            DataSource = ZDMLonas.DSQMLonas
            Enabled = False
            ReadOnly = True
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Height = 295
          DataSource = ZDMLonas.DSQMLonas
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 311
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MULTIPLO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MULTIPLO_SALIDA'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 353
  end
  inherited ALMain: TLFActionList
    Left = 280
    Top = 72
  end
  inherited FSMain: TLFFibFormStorage
    Left = 317
    Top = 72
  end
end
