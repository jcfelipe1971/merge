object FMCentrosCoste: TFMCentrosCoste
  Left = 344
  Top = 328
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Centros de Coste'
  ClientHeight = 462
  ClientWidth = 720
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = CEPlantillasDPPMEdit
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PAvisos: TLFPanel
    Left = 567
    Top = 0
    Width = 153
    Height = 462
    Align = alRight
    BevelOuter = bvNone
    TabOrder = 0
    object LBLCcNoDistribuidos: TLFLabel
      Left = 0
      Top = 0
      Width = 153
      Height = 24
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = 'CC. NO DISTRIBU'#205'DOS'
      Color = clBtnFace
      ParentColor = False
      Layout = tlCenter
    end
    object LBLAlertaPresupuesto: TLFLabel
      Left = 0
      Top = 230
      Width = 153
      Height = 24
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = 'ALERTA PRESUPUESTO'
      Color = clBtnFace
      ParentColor = False
      Layout = tlCenter
    end
    object LVCcNoDistribuidos: TListView
      Left = 0
      Top = 24
      Width = 153
      Height = 206
      Align = alTop
      Color = clInfoBk
      Columns = <
        item
          AutoSize = True
          Caption = 'Centro Coste'
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      GridLines = True
      ReadOnly = True
      RowSelect = True
      ParentFont = False
      ShowColumnHeaders = False
      TabOrder = 0
      ViewStyle = vsReport
      OnDblClick = LVCcNoDistribuidosDblClick
      OnDeletion = LVCcNoDistribuidosDeletion
    end
    object LVAlertaPresupuesto: TListView
      Left = 0
      Top = 254
      Width = 153
      Height = 208
      Align = alClient
      Color = clInfoBk
      Columns = <
        item
          AutoSize = True
          Caption = 'Centro Coste'
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      GridLines = True
      ReadOnly = True
      RowSelect = True
      ParentFont = False
      ShowColumnHeaders = False
      TabOrder = 1
      ViewStyle = vsReport
      OnDblClick = LVAlertaPresupuestoDblClick
      OnDeletion = LVAlertaPresupuestoDeletion
    end
  end
  object PMain: TLFPanel
    Left = 0
    Top = 0
    Width = 567
    Height = 462
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object TBMain: TLFToolBar
      Left = 0
      Top = 0
      Width = 567
      Height = 24
      EdgeBorders = []
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 0
      Separators = True
      object CBPlanes: TLFComboBox
        Left = 0
        Top = 0
        Width = 536
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnSelect = CBPlanesSelect
      end
      object ToolButton4: TToolButton
        Left = 536
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtSalir: TToolButton
        Left = 544
        Top = 0
        Hint = 'Cerrar la ventana'
        Caption = 'Salir'
        ImageIndex = 0
        OnClick = TButtSalirClick
      end
    end
    object PArbolCC: TLFPanel
      Left = 0
      Top = 24
      Width = 567
      Height = 209
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object TVCentrosCoste: TTreeView
        Left = 0
        Top = 0
        Width = 567
        Height = 209
        Align = alClient
        Indent = 19
        ReadOnly = True
        TabOrder = 0
        OnDblClick = TVCentrosCosteDblClick
        OnDeletion = TVCentrosCosteDeletion
      end
    end
    object PCMain: TLFPageControl
      Left = 0
      Top = 233
      Width = 567
      Height = 229
      ActivePage = TSCentrosCoste
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 2
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSCentrosCoste: TTabSheet
        Caption = '&Centros de Coste'
        OnShow = TSCentrosCosteShow
        object TBCentroCoste: TLFToolBar
          Left = 0
          Top = 0
          Width = 559
          Height = 22
          EdgeBorders = []
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object NavCentrosCoste: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            DataSource = DMCentrosCoste.DSQMCentrosCoste
            Flat = True
            ParentShowHint = False
            PopupMenu = CECentrosCostePMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFCentrosCoste
            InsertaControl = DBGFCentrosCoste
            Exclusivo = True
            ControlEdit = CECentrosCoste
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object TSep1: TToolButton
            Left = 220
            Top = 0
            Width = 8
            ParentShowHint = False
            ShowHint = True
            Style = tbsSeparator
          end
          object PCentrosCosteCC: TLFPanel
            Left = 228
            Top = 0
            Width = 249
            Height = 21
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 1
            object EdCentroCosteCC: TLFEdit
              Left = 0
              Top = 0
              Width = 249
              Height = 21
              Color = clInfoBk
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
          end
          object TSep2: TToolButton
            Left = 477
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TButtSubirNivel: TToolButton
            Left = 485
            Top = 0
            Hint = 'Subir nivel'
            Caption = 'Subir Nivel'
            ImageIndex = 53
            ParentShowHint = False
            ShowHint = True
            OnClick = TButtSubirNivelClick
          end
          object TButtBajarNivel: TToolButton
            Left = 508
            Top = 0
            Hint = 'Bajar nivel'
            Caption = 'Bajar Nivel'
            ImageIndex = 52
            ParentShowHint = False
            ShowHint = True
            OnClick = TButtBajarNivelClick
          end
          object TButtRefrescar: TToolButton
            Left = 531
            Top = 0
            Hint = 'Refrescar '#225'rbol'
            Caption = 'Refrescar'
            ImageIndex = 39
            ParentShowHint = False
            ShowHint = True
            OnClick = TButtRefrescarClick
          end
        end
        object DBGFCentrosCoste: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 559
          Height = 179
          Align = alClient
          DataSource = DMCentrosCoste.DSQMCentrosCoste
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnColEnter = DBGFCentrosCosteColEnter
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
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          ColumnasCheckBoxes.Strings = (
            'DISTRIBUCION_POSTERIOR')
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
          Columns = <
            item
              Expanded = False
              FieldName = 'CENTRO_COSTE'
              Width = 76
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 367
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NIVEL'
              Width = 39
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DISTRIBUCION_POSTERIOR'
              Width = 37
              Visible = True
            end>
        end
      end
      object TSPresupuestos: TTabSheet
        Caption = '&Presupuestos'
        ImageIndex = 1
        OnShow = TSPresupuestosShow
        object TBPresupuestos: TLFToolBar
          Left = 0
          Top = 0
          Width = 559
          Height = 22
          EdgeBorders = []
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object NavPresupuestos: THYMNavigator
            Left = 0
            Top = 0
            Width = 200
            Height = 22
            DataSource = DMCentrosCoste.DSQMPresupuestos
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEPresupuestosPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFPresupuestos
            InsertaControl = DBGFPresupuestos
            Exclusivo = True
            ControlEdit = CEPresupuestos
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object TSep3: TToolButton
            Left = 200
            Top = 0
            Width = 8
            ParentShowHint = False
            ShowHint = True
            Style = tbsSeparator
          end
          object PCentrosCosteP: TLFPanel
            Left = 208
            Top = 0
            Width = 249
            Height = 21
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 1
            object EdCentroCostePP: TLFEdit
              Left = 0
              Top = 0
              Width = 249
              Height = 21
              Color = clInfoBk
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
          end
          object TSep4: TToolButton
            Left = 457
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TButtPropagar: TToolButton
            Left = 465
            Top = 0
            Hint = 'Propagar presupuestos'
            Caption = 'Subir Nivel'
            ImageIndex = 86
            ParentShowHint = False
            ShowHint = True
            OnClick = TButtPropagarClick
          end
        end
        object DBGFPresupuestos: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 559
          Height = 179
          Align = alClient
          DataSource = DMCentrosCoste.DSQMPresupuestos
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnColEnter = DBGFPresupuestosColEnter
          OnDrawColumnCell = DBGFPresupuestosDrawColumnCell
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
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposNoAccesibles.Strings = (
            'SALDO'
            'TITULO'
            'DESVIACION')
          ColumnasCheckBoxes.Strings = (
            'TIPO_CONTROL')
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
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 181
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRESUPUESTO'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'SALDO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'DESVIACION'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 69
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CONTROL'
              Width = 74
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_CONTROL'
              Visible = True
            end>
        end
      end
      object TSCuentas: TTabSheet
        Caption = 'C&uentas'
        ImageIndex = 2
        object TBCuentas: TLFToolBar
          Left = 0
          Top = 0
          Width = 559
          Height = 22
          EdgeBorders = []
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object NavCuentas: THYMNavigator
            Left = 0
            Top = 0
            Width = 125
            Height = 22
            DataSource = DMCentrosCoste.DSxCuentas
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CEPlantillasDPPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFCuentas
            InsertaControl = DBGFCuentas
            Exclusivo = True
            ControlEdit = CEPlantillasDP
            OrdenAscendente = True
            InsertaUltimo = False
            OnClickAfterAdjust = NavPlantillasDPClickAfterAdjust
          end
          object ToolButton1: TToolButton
            Left = 125
            Top = 0
            Width = 8
            ParentShowHint = False
            ShowHint = True
            Style = tbsSeparator
          end
          object PNLCuenta: TLFPanel
            Left = 133
            Top = 0
            Width = 249
            Height = 21
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 1
            object EdCuenta: TLFEdit
              Left = 0
              Top = 0
              Width = 249
              Height = 21
              Color = clInfoBk
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
          end
          object ToolButton2: TToolButton
            Left = 382
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
        end
        object DBGFCuentas: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 559
          Height = 179
          Align = alClient
          DataSource = DMCentrosCoste.DSxCuentas
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
          AutoCambiarColumna = True
          AutoPostEnCheckBox = False
          AutoStartDrag = False
          AutoStartDragInterval = 0
          IndiceBitmapOrdenable = 0
          IndiceBitmapAscendente = 1
          IndiceBitmapChecked = 3
          IndiceBitmapDescendente = 2
          BaseDeDatos = DMMain.DataBase
          Transaction = DMCentrosCoste.TLocal
          BuscarNums = False
          CamposAMostrarAnchos.Strings = (
            '0')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'PORCENTAJE'
            'PLANTILLA'
            'PLAN_CONTABLE'
            'PL_TITULO'
            'LINEA'
            'ID_PL'
            'ID_CC'
            'ID_P'
            'CUENTA'
            'CENTRO_COSTE'
            'CC_TITULO'
            'CANAL')
          MensajeNoExiste = False
          SalirSiVacio = False
          SalirSiNoExiste = False
          Posicion = tpCentrado
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            '')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CUENTA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 90
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PLANTILLA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 56
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LINEA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 33
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PL_TITULO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 278
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PORCENTAJE'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 54
              Visible = True
            end>
        end
      end
      object TSPlantillasDP: TTabSheet
        Caption = 'Plantillas de &Distribuci'#243'n Posterior'
        ImageIndex = 3
        OnShow = TSPlantillasDPShow
        object TBPlantillasDP: TLFToolBar
          Left = 0
          Top = 0
          Width = 559
          Height = 22
          EdgeBorders = []
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object NavPlantillasDP: THYMNavigator
            Left = 0
            Top = 0
            Width = 220
            Height = 22
            DataSource = DMCentrosCoste.DSQMPlantillas
            Flat = True
            ParentShowHint = False
            PopupMenu = CEPlantillasDPPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFPlantillasDP
            InsertaControl = DBGFPlantillasDP
            Exclusivo = True
            ControlEdit = CEPlantillasDP
            OrdenAscendente = True
            InsertaUltimo = False
            OnClickAfterAdjust = NavPlantillasDPClickAfterAdjust
          end
          object TSep5: TToolButton
            Left = 220
            Top = 0
            Width = 8
            ParentShowHint = False
            ShowHint = True
            Style = tbsSeparator
          end
          object PEdCentroCosteDP: TLFPanel
            Left = 228
            Top = 0
            Width = 249
            Height = 21
            AutoSize = True
            BevelOuter = bvNone
            TabOrder = 1
            object EdCentroCosteDP: TLFEdit
              Left = 0
              Top = 0
              Width = 249
              Height = 21
              Color = clInfoBk
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
          end
          object TSep6: TToolButton
            Left = 477
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TButtRepartir: TToolButton
            Left = 485
            Top = 0
            ParentShowHint = False
            ShowHint = True
            OnClick = TButtRepartirClick
          end
        end
        object DBGFPlantillasDP: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 559
          Height = 179
          Align = alClient
          DataSource = DMCentrosCoste.DSQMPlantillas
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGFPlantillasDPCellClick
          OnColEnter = DBGFPlantillasDPColEnter
          OnDrawColumnCell = DBGFPlantillasDPDrawColumnCell
          OnKeyUp = DBGFPlantillasDPKeyUp
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          AutoCambiarColumna = True
          AutoPostEnCheckBox = False
          AutoStartDrag = False
          AutoStartDragInterval = 0
          IndiceBitmapOrdenable = 0
          IndiceBitmapAscendente = 1
          IndiceBitmapChecked = 3
          IndiceBitmapDescendente = 2
          BaseDeDatos = DMMain.DataBase
          Transaction = DMCentrosCoste.TLocal
          BuscarNums = False
          Campos.Strings = (
            'PLANTILLA')
          CamposAMostrar.Strings = (
            'PLANTILLA'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0')
          CamposADevolver.Strings = (
            '')
          CamposDesplegar.Strings = (
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposNoAccesibles.Strings = (
            'TITULO'
            'APLICADA')
          ColumnasCheckBoxes.Strings = (
            'APLICADA')
          ColumnasChecked.Strings = (
            '1')
          ColumnasNoChecked.Strings = (
            '0')
          MensajeNoExiste = False
          Numericos.Strings = (
            'PLANTILLA')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'ANA_PLANTILLAS_CC')
          Acciones.Strings = (
            '')
          Titulos.Strings = (
            'TITULO')
          Posicion = tpCentrado
          OnBusqueda = DBGFPlantillasDPBusqueda
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            '')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'INICIO'
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FIN'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PLANTILLA'
              Width = 41
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'TITULO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 306
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'APLICADA'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ReadOnly = True
              Width = 48
              Visible = True
            end>
        end
      end
    end
  end
  object CECentrosCoste: TControlEdit
    PopUpMenu = CECentrosCostePMEdit
    Teclas = DMMain.Teclas
    Left = 384
    Top = 80
  end
  object CECentrosCostePMEdit: TPopUpTeclas
    Left = 424
    Top = 80
    object CECentrosCosteMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CECentrosCosteMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CECentrosCosteMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CECentrosCosteMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CECentrosCosteMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CECentrosCosteMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CECentrosCosteMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CECentrosCosteMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CECentrosCosteMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CECentrosCosteMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEPresupuestos: TControlEdit
    PopUpMenu = CEPresupuestosPMEdit
    Teclas = DMMain.Teclas
    Left = 384
    Top = 120
  end
  object CEPresupuestosPMEdit: TPopUpTeclas
    Left = 424
    Top = 120
    object CEPresupuestosMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEPresupuestosMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEPresupuestosMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEPresupuestosMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEPresupuestosMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEPresupuestosMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEPresupuestosMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEPresupuestosMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEPresupuestosMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEPresupuestosMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEPlantillasDP: TControlEdit
    PopUpMenu = CEPlantillasDPPMEdit
    Teclas = DMMain.Teclas
    Left = 384
    Top = 160
  end
  object CEPlantillasDPPMEdit: TPopUpTeclas
    Left = 424
    Top = 160
    object CEPlantillasDPMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEPlantillasDPMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEPlantillasDPMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEPlantillasDPMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEPlantillasDPMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEPlantillasDPMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEPlantillasDPMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEPlantillasDPMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEPlantillasDPMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEPlantillasDPMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object FSMain: TLFFibFormStorage
    StoredValues = <>
    Database = DMMain.DataBase
    SaveFormControls = True
    LoadFormControls = True
    Profile = 0
    User = 0
    ChangedControls = False
    Left = 462
    Top = 80
  end
end
