object ProFMDefecto: TProFMDefecto
  Left = 250
  Top = 124
  Width = 800
  Height = 500
  Caption = 'Mantenimiento de Defectos de Material'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = CEDetallePMEdit
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 792
    Height = 23
    EdgeBorders = []
    EdgeInner = esNone
    EdgeOuter = esNone
    Flat = True
    HotImages = DMMain.ILMain_Ac
    Images = DMMain.ILMain_Ac
    TabOrder = 0
    Separators = True
    object NavMain: THYMNavigator
      Left = 0
      Top = 0
      Width = 200
      Height = 22
      DataSource = ProDMDefecto.DSQMDefecto
      Flat = True
      ParentShowHint = False
      PopupMenu = CEMainPMEdit
      ShowHint = True
      TabOrder = 0
      ModoDeSeguridad = True
      DelCaption = 'Informaci'#243'n'
      DelMessage = ' '#191' Borra el registro ? '
      EditaControl = DBGFDefecto
      InsertaControl = DBGFDefecto
      Exclusivo = True
      ControlEdit = CEMain
      OrdenAscendente = True
      InsertaUltimo = False
    end
    object TSep1: TToolButton
      Left = 200
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object TButtSalir: TToolButton
      Left = 208
      Top = 0
      Action = ASalir
      ParentShowHint = False
      ShowHint = True
    end
    object ToolButton1: TToolButton
      Left = 231
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object TBActualizarFiltrados: TToolButton
      Left = 239
      Top = 0
      Action = SActualizarFiltrados
    end
    object ToolButton2: TToolButton
      Left = 262
      Top = 0
      Width = 8
      Style = tbsSeparator
    end
    object PnlNavFiltros: TLFPanel
      Left = 270
      Top = 0
      Width = 509
      Height = 22
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object LblEstado: TLFLabel
        Left = 5
        Top = 5
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = 'Estado'
      end
      object LblDesdeFecha: TLFLabel
        Left = 148
        Top = 5
        Width = 64
        Height = 13
        Alignment = taRightJustify
        Caption = 'Desde Fecha'
      end
      object LblHastaFecha: TLFLabel
        Left = 315
        Top = 5
        Width = 61
        Height = 13
        Alignment = taRightJustify
        Caption = 'Hasta Fecha'
      end
      object CBEstado: TLFComboBox
        Left = 41
        Top = 2
        Width = 96
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        Text = 'No Actualizado'
        OnChange = CBEstadoChange
        Items.Strings = (
          'No Actualizado'
          'Actualizado'
          'Todos')
      end
      object DEDesde: TLFDateEdit
        Left = 215
        Top = 2
        Width = 90
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
        OnChange = DEDesdeChange
      end
      object DEHasta: TLFDateEdit
        Left = 379
        Top = 2
        Width = 90
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 2
        OnChange = DEHastaChange
      end
      object ButtFiltrar: TButton
        Left = 470
        Top = 2
        Width = 37
        Height = 21
        Caption = 'Filtrar'
        TabOrder = 3
        OnClick = ButtFiltrarClick
      end
    end
  end
  object PnlMain: TLFPanel
    Left = 0
    Top = 23
    Width = 792
    Height = 450
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object Splitter1: TSplitter
      Left = 0
      Top = 235
      Width = 792
      Height = 4
      Cursor = crVSplit
      Align = alTop
    end
    object PCDefecto: TLFPageControl
      Left = 0
      Top = 0
      Width = 792
      Height = 235
      ActivePage = TSFicha
      Align = alTop
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 0
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSFicha: TTabSheet
        Caption = '&Ficha'
        object DBGFDefecto: TDBGridFind2000
          Left = 0
          Top = 0
          Width = 784
          Height = 207
          Align = alClient
          DataSource = ProDMDefecto.DSQMDefecto
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Insercion = False
          ColumnaInicial = 1
          UsaDicG2K = True
          Changed = False
          Idioma = 'CAS'
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
            'OP'
            'OPERARIO'
            'FASE')
          CamposAMostrar.Strings = (
            'OP'
            '0'
            'OPERARIO'
            '0'
            'FASE'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0'
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
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'ACTUALIZADO'
            'Compuesto'
            'CUARTAS'
            'FASE'
            'FECHA'
            'ID'
            'OP'
            'OPERARIO'
            'TIRADO')
          ColumnasCheckBoxes.Strings = (
            'ACTUALIZADO')
          ColumnasChecked.Strings = (
            '1')
          ColumnasNoChecked.Strings = (
            '0')
          MensajeNoExiste = False
          Numericos.Strings = (
            'ID_ORDEN'
            'EMPLEADO'
            'TIPOFASE')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'PRO_ORD'
            'VER_EMPLEADOS_EF'
            'PRO_ORD_FASES')
          Acciones.Strings = (
            ''
            ''
            '')
          Titulos.Strings = (
            'COMPUESTO'
            'TITULO'
            'FASE')
          Posicion = tpCentrado
          OnBusqueda = DBGFDefectoBusqueda
          Planes.Strings = (
            ''
            ''
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            ''
            ''
            ''
            '')
          Filtros = [obEmpresa]
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ID'
              ReadOnly = True
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OP'
              Width = 72
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'COMPUESTO'
              ReadOnly = True
              Width = 100
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO_ARTICULO'
              ReadOnly = True
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FASE'
              Width = 40
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO_FASE'
              ReadOnly = True
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OPERARIO'
              Width = 40
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO_OPERARIO'
              ReadOnly = True
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANTIDAD_TERMINADAS'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUARTAS'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIRADO'
              Width = 72
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTUALIZADO'
              Width = 35
              Visible = True
            end>
        end
      end
    end
    object PnlDetalle: TLFPanel
      Left = 0
      Top = 239
      Width = 792
      Height = 211
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object TBDetalle: TLFToolBar
        Left = 0
        Top = 0
        Width = 792
        Height = 25
        EdgeInner = esNone
        EdgeOuter = esNone
        Flat = True
        HotImages = DMMain.ILMain_Ac
        Images = DMMain.ILMain_Ac
        TabOrder = 0
        Separators = True
        object NavDetalle: THYMNavigator
          Left = 0
          Top = 0
          Width = 240
          Height = 22
          DataSource = ProDMDefecto.DSQMDetalle
          Flat = True
          ParentShowHint = False
          PopupMenu = CEDetallePMEdit
          ShowHint = True
          TabOrder = 0
          ModoDeSeguridad = True
          DelCaption = 'Informaci'#243'n'
          DelMessage = ' '#191' Borra el registro ? '
          EditaControl = DBGFDetalle
          InsertaControl = DBGFDetalle
          Exclusivo = True
          ControlEdit = CEDetalle
          OrdenAscendente = True
          InsertaUltimo = False
        end
      end
      object DBGFDetalle: TDBGridFind2000
        Left = 0
        Top = 25
        Width = 792
        Height = 186
        Align = alClient
        DataSource = ProDMDefecto.DSQMDetalle
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        Insercion = False
        ColumnaInicial = 2
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
        Transaction = ProDMDefecto.TLocal
        BuscarNums = False
        Campos.Strings = (
          'CODIGO_DEFECTO')
        CamposAMostrar.Strings = (
          'CODIGO_DEFECTO'
          '0')
        CamposAMostrarAnchos.Strings = (
          '0'
          '0')
        CamposADevolver.Strings = (
          '')
        CamposDesplegar.Strings = (
          '1')
        CampoAOrdenarColor = clInfoBk
        CamposAOrdernar.Strings = (
          'ID')
        MensajeNoExiste = False
        Numericos.Strings = (
          'CODIGO_DEFECTO')
        SalirSiVacio = False
        SalirSiNoExiste = False
        Tablas.Strings = (
          'PRO_SYS_TIPO_DEFECTO')
        Acciones.Strings = (
          '')
        Titulos.Strings = (
          'DESCRIPCION')
        Posicion = tpCentrado
        Planes.Strings = (
          '')
        OrdenMultiple = True
        OrdenadosPor.Strings = (
          ''
          ''
          ''
          '')
        Filtros = []
        Entorno = DMMain.EntornoBusqueda
        Columns = <
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'LINEA'
            ReadOnly = True
            Width = 35
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CODIGO_DEFECTO'
            Width = 138
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'DescDefecto'
            ReadOnly = True
            Width = 212
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CANTIDAD'
            Width = 78
            Visible = True
          end>
      end
    end
  end
  object CEMain: TControlEdit
    EnlazadoA = CEDetalle
    FichaEdicion = TSFicha
    FichaExclusiva = TSFicha
    SubComplementario = ALMain
    PopUpMenu = CEMainPMEdit
    Teclas = DMMain.Teclas
    Left = 260
    Top = 24
  end
  object CEMainPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 296
    Top = 24
    object CEMainMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEMainMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEMainMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEMainMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEMainMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEMainMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEMainMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEMainMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEMainMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEMainMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
    object CEMainMiSep: TMenuItem
      Caption = '-'
    end
    object CEMainMibuscar: TMenuItem
      Caption = 'Buscar'
      ShortCut = 16450
    end
    object CEMainMiaprox: TMenuItem
      Caption = 'B'#250'squeda aproximada'
      Enabled = False
      ShortCut = 16465
      Visible = False
    end
    object CEMainMiexacta: TMenuItem
      Caption = 'B'#250'squeda exacta'
      Enabled = False
      ShortCut = 16471
      Visible = False
    end
    object CEMainMiimprime: TMenuItem
      Caption = 'Imprime pantalla'
      ShortCut = 16457
      Visible = False
    end
    object CEMainMirango: TMenuItem
      Caption = 'Filtra rango'
      Enabled = False
      ShortCut = 16454
    end
    object CEMainMireport: TMenuItem
      Caption = 'Imprime report'
      Enabled = False
      ShortCut = 16460
      Visible = False
    end
    object CEMainMicopy: TMenuItem
      Caption = 'Copiar'
      ShortCut = 16451
      Visible = False
    end
    object CEMainMicut: TMenuItem
      Caption = 'Cortar'
      ShortCut = 16472
      Visible = False
    end
    object CEMainMipaste: TMenuItem
      Caption = 'Pegar'
      ShortCut = 16470
      Visible = False
    end
    object CEMainMisalir: TMenuItem
      Caption = 'Cerrar la ventana'
      ShortCut = 16499
    end
  end
  object ALMain: TLFActionList
    Images = DMMain.ILMain_Ac
    IniStorage = FSMain
    Reset = False
    Enabled = True
    Changed = False
    Left = 328
    Top = 40
    object ASalir: TAction
      Caption = 'Salir'
      Hint = 'Salir'
      ImageIndex = 0
      OnExecute = ASalirExecute
    end
    object SActualizarFiltrados: TAction
      Caption = 'Actualizar Filtrados'
      Hint = 'Actualizar Filtrados'
      ImageIndex = 39
      OnExecute = SActualizarFiltradosExecute
    end
  end
  object FSMain: TLFFibFormStorage
    UseRegistry = False
    StoredValues = <>
    Database = DMMain.DataBase
    SaveFormControls = True
    LoadFormControls = True
    Profile = 0
    User = 0
    ChangedControls = False
    Left = 408
    Top = 48
  end
  object CEDetallePMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 522
    Top = 194
    object CEDetalleMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEDetalleMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEDetalleMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEDetalleMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEDetalleMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEDetalleMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEDetalleMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEDetalleMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEDetalleMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEDetalleMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEDetalle: TControlEdit
    EnlazadoA = CEMain
    Complementario = TBMain
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 486
    Top = 192
  end
end
