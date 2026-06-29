object ProFMSubstituirEsc: TProFMSubstituirEsc
  Left = 407
  Top = 188
  Width = 693
  Height = 496
  Caption = 'Sustituci'#243'n componentes'
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PMain: TLFPanel
    Left = 0
    Top = 0
    Width = 685
    Height = 469
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object TBMain: TLFToolBar
      Left = 0
      Top = 0
      Width = 685
      Height = 26
      AutoSize = True
      BorderWidth = 1
      EdgeBorders = []
      EdgeInner = esNone
      EdgeOuter = esNone
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Wrapable = False
      Separators = True
      object TBCargar: TToolButton
        Left = 0
        Top = 0
        Action = ACargaDatos
      end
      object TBSubstituir: TToolButton
        Left = 23
        Top = 0
        Action = AEjecutarSubs
      end
      object ToolButton2: TToolButton
        Left = 46
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object EPMain: THYMEditPanel
        Left = 54
        Top = 0
        Width = 20
        Height = 22
        VisibleButtons = [neSalir]
        ParentShowHint = False
        SalirCaption = 'Salida'
        SalirMensaje = ' '#191' Abandonar esta Ventana de Edici'#243'n ? '
        ShowHint = True
        TabOrder = 0
        Flat = True
        Exclusivo = True
      end
      object ToolButton1: TToolButton
        Left = 74
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object ToolButton7: TToolButton
        Left = 82
        Top = 0
        Action = AInicializar
        ImageIndex = 39
      end
    end
    object PNLSeleccion: TLFPanel
      Left = 0
      Top = 313
      Width = 685
      Height = 156
      Align = alClient
      BevelOuter = bvNone
      Caption = 'PNLSeleccion'
      TabOrder = 1
      object DBGComp: TDBGridFind2000
        Left = 0
        Top = 24
        Width = 685
        Height = 132
        Align = alClient
        DataSource = ProDMSubstituirEsc.DSQTempSubsEsc
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnCellClick = DBGCompCellClick
        OnDblClick = DBGCompDblClick
        Insercion = False
        ColumnaInicial = 0
        UsaDicG2K = True
        Changed = False
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
        CampoAOrdenarColor = clInfoBk
        CampoAOrdenarBitmaps = DMMain.ILOrdGrid
        CamposAOrdernar.Strings = (
          'COMPUESTO'
          'DESC_COMPUESTO'
          'ESCANDALLO'
          'ESTADO'
          'FECHA'
          'ID_ESC'
          'MARCADO')
        ColumnasCheckBoxes.Strings = (
          'MARCADO')
        ColumnasChecked.Strings = (
          '1')
        ColumnasNoChecked.Strings = (
          '0')
        MensajeNoExiste = False
        SalirSiVacio = False
        SalirSiNoExiste = False
        Posicion = tpCentrado
        OrdenMultiple = True
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
        Columns = <
          item
            Expanded = False
            FieldName = 'MARCADO'
            Width = 50
            Visible = True
          end
          item
            Color = clAqua
            Expanded = False
            FieldName = 'ESCANDALLO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'COMPUESTO'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESC_COMPUESTO'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA'
            Width = 90
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'UNIDADES'
            ReadOnly = True
            Visible = True
          end>
      end
      object TBDetalle: TLFToolBar
        Left = 0
        Top = 0
        Width = 685
        Height = 24
        AutoSize = True
        EdgeInner = esNone
        EdgeOuter = esNone
        HotImages = DMMain.ILMain_Ac
        Images = DMMain.ILMain_Ac
        TabOrder = 1
        Separators = True
        object NavDetalle: THYMNavigator
          Left = 0
          Top = 2
          Width = 160
          Height = 22
          DataSource = ProDMSubstituirEsc.DSQTempSubsEsc
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
          Flat = True
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          ModoDeSeguridad = True
          DelCaption = 'Informaci'#243'n'
          DelMessage = ' '#191' Borra el registro ? '
          EditaControl = DBGComp
          Exclusivo = True
          OrdenAscendente = True
          InsertaUltimo = False
        end
        object ToolButton5: TToolButton
          Left = 160
          Top = 2
          Width = 8
          Style = tbsSeparator
        end
        object TBMarcar: TToolButton
          Left = 168
          Top = 2
          Action = AMarcar
        end
        object TBDesmarcar: TToolButton
          Left = 191
          Top = 2
          Action = ADesmarcar
        end
        object ToolButton6: TToolButton
          Left = 214
          Top = 2
          Width = 8
          Style = tbsSeparator
        end
        object PNLFiltro: TLFPanel
          Left = 222
          Top = 2
          Width = 305
          Height = 22
          BevelOuter = bvNone
          TabOrder = 1
          object LDescripcion: TLFLabel
            Left = 8
            Top = 4
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripcion'
          end
          object EFiltroDescripcion: TLFEdit
            Left = 68
            Top = 0
            Width = 229
            Height = 21
            TabOrder = 0
            OnChange = EFiltroDescripcionChange
          end
        end
      end
    end
    object PNLComponentes: TLFPanel
      Left = 0
      Top = 26
      Width = 685
      Height = 287
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object PNLOrigenDestino: TLFPanel
        Left = 0
        Top = 0
        Width = 685
        Height = 249
        Align = alClient
        BevelOuter = bvNone
        Caption = 'PNLOrigenDestino'
        TabOrder = 0
        object PNLOrigen: TLFPanel
          Left = 0
          Top = 0
          Width = 685
          Height = 124
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object DBGComponenteOrigen: TDBGridFind2000
            Left = 0
            Top = 22
            Width = 685
            Height = 102
            Align = alClient
            Color = clInfoBk
            DataSource = ProDMSubstituirEsc.DSQMCompuestoOrigen
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Insercion = False
            ColumnaInicial = 0
            UsaDicG2K = True
            Changed = False
            AutoCambiarColumna = False
            AutoPostEnCheckBox = True
            AutoStartDrag = False
            AutoStartDragInterval = 0
            IndiceBitmapOrdenable = 0
            IndiceBitmapAscendente = 1
            IndiceBitmapChecked = 3
            IndiceBitmapDescendente = 2
            BaseDeDatos = DMMain.DataBase
            BuscarNums = False
            Campos.Strings = (
              'COMPONENTE')
            CamposAMostrar.Strings = (
              'COMPONENTE'
              '0')
            CamposAMostrarAnchos.Strings = (
              '0')
            CamposADevolver.Strings = (
              '')
            CamposDesplegar.Strings = (
              '1')
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            CamposAOrdernar.Strings = (
              'COMPONENTE'
              'DESC_COMPONENTE'
              'MAESTRO')
            ColumnasCheckBoxes.Strings = (
              'MAESTRO')
            ColumnasChecked.Strings = (
              '1')
            ColumnasNoChecked.Strings = (
              '0')
            MensajeNoExiste = False
            Numericos.Strings = (
              'ARTICULO')
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tablas.Strings = (
              'VER_ARTICULOS_EF')
            Acciones.Strings = (
              '')
            Titulos.Strings = (
              'TITULO')
            Posicion = tpCentrado
            Planes.Strings = (
              '')
            OrdenMultiple = True
            OrdenadosPor.Strings = (
              'ARTICULO')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            Columns = <
              item
                Expanded = False
                FieldName = 'COMPONENTE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESC_COMPONENTE'
                ReadOnly = True
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'MAESTRO'
                Width = 47
                Visible = True
              end>
          end
          object TBComponenteOrigen: TLFToolBar
            Left = 0
            Top = 0
            Width = 685
            Height = 22
            AutoSize = True
            EdgeBorders = []
            Flat = True
            Images = DMMain.ILMain_Ac
            TabOrder = 1
            Separators = True
            object NavComponenteOrigen: THYMNavigator
              Left = 0
              Top = 0
              Width = 240
              Height = 22
              DataSource = ProDMSubstituirEsc.DSQMCompuestoOrigen
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              EditaControl = DBGComponenteOrigen
              InsertaControl = DBGComponenteOrigen
              Exclusivo = True
              OrdenAscendente = True
              InsertaUltimo = False
            end
            object ToolButton3: TToolButton
              Left = 240
              Top = 0
              Width = 9
              Style = tbsSeparator
            end
            object LComponenteOrigen: TLFLabel
              Left = 249
              Top = 0
              Width = 92
              Height = 22
              Caption = 'Componente origen'
              Layout = tlCenter
            end
          end
        end
        object PNLDestino: TLFPanel
          Left = 0
          Top = 124
          Width = 685
          Height = 125
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBGComponenteDestino: TDBGridFind2000
            Left = 0
            Top = 22
            Width = 685
            Height = 103
            Align = alClient
            Color = clInfoBk
            DataSource = ProDMSubstituirEsc.DSQMCompuestoDestino
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Insercion = False
            ColumnaInicial = 0
            UsaDicG2K = True
            Changed = False
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
              'COMPONENTE')
            CamposAMostrar.Strings = (
              'COMPONENTE'
              '0')
            CamposAMostrarAnchos.Strings = (
              '0')
            CamposADevolver.Strings = (
              '')
            CamposDesplegar.Strings = (
              '1')
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            CamposAOrdernar.Strings = (
              'COMPONENTE'
              'DESC_COMPONENTE'
              'ORDEN'
              'UNIDADES')
            MensajeNoExiste = False
            Numericos.Strings = (
              'ARTICULO')
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tablas.Strings = (
              'VER_ARTICULOS_EF')
            Acciones.Strings = (
              '')
            Titulos.Strings = (
              'TITULO')
            Posicion = tpCentrado
            Planes.Strings = (
              '')
            OrdenMultiple = True
            OrdenadosPor.Strings = (
              'ARTICULO')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            Columns = <
              item
                Expanded = False
                FieldName = 'COMPONENTE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DESC_COMPONENTE'
                ReadOnly = True
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'UNIDADES'
                Visible = True
              end>
          end
          object TBComponenteDestino: TLFToolBar
            Left = 0
            Top = 0
            Width = 685
            Height = 22
            AutoSize = True
            EdgeBorders = []
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 1
            Separators = True
            object NavComponenteDestino: THYMNavigator
              Left = 0
              Top = 0
              Width = 240
              Height = 22
              DataSource = ProDMSubstituirEsc.DSQMCompuestoDestino
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              ModoDeSeguridad = True
              DelCaption = 'Informaci'#243'n'
              DelMessage = ' '#191' Borra el registro ? '
              EditaControl = DBGComponenteDestino
              InsertaControl = DBGComponenteDestino
              Exclusivo = True
              OrdenAscendente = True
              InsertaUltimo = False
            end
            object ToolButton4: TToolButton
              Left = 240
              Top = 0
              Width = 9
              Style = tbsSeparator
            end
            object LComponenteDestino: TLFLabel
              Left = 249
              Top = 0
              Width = 97
              Height = 22
              Caption = 'Componente destino'
              Layout = tlCenter
            end
          end
        end
      end
      object RGEstado: TRadioGroup
        Left = 0
        Top = 249
        Width = 685
        Height = 38
        Align = alBottom
        Caption = 'Estado Escandallo'
        Columns = 3
        ItemIndex = 2
        Items.Strings = (
          'No Activo'
          'Activo'
          'Todos')
        TabOrder = 1
      end
    end
  end
  object LFSubsComp: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 576
    Top = 40
    object ACargaDatos: TAction
      Caption = 'ACargaDatos'
      Hint = 'Cargar Datos'
      ImageIndex = 26
      OnExecute = ACargaDatosExecute
    end
    object AEjecutarSubs: TAction
      Caption = 'AEjecutarSubs'
      Hint = 'Ejecutar substituci'#243'n'
      ImageIndex = 25
      OnExecute = AEjecutarSubsExecute
    end
    object AMarcar: TAction
      Caption = 'Marcar'
      Hint = 'Selecciona todos los escandallos filtrados'
      ImageIndex = 19
      OnExecute = AMarcarExecute
    end
    object ADesmarcar: TAction
      Caption = 'Desmarcar'
      Hint = 'Quita la marca de los escandallos filtrados'
      ImageIndex = 27
      OnExecute = ADesmarcarExecute
    end
    object AInicializar: TAction
      Caption = 'Inicializar'
      Hint = 'Vacia los datos actuales'
      ImageIndex = 57
      OnExecute = AInicializarExecute
    end
  end
end
