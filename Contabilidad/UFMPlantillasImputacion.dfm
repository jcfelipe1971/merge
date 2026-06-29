inherited FMPlantillasImputacion: TFMPlantillasImputacion
  Left = 438
  Top = 243
  Caption = 'Plantillas de Imputaci'#243'n'
  ClientHeight = 394
  ClientWidth = 580
  OldCreateOrder = True
  PopupMenu = CECuentasPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 580
    Height = 161
    Align = alTop
    inherited TBMain: TLFToolBar
      Top = 26
      Width = 576
      inherited NavMain: THYMNavigator
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBETitulo
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        Width = 52
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 280
        Visible = False
      end
      inherited TbuttComp: TToolButton
        Left = 288
        Visible = False
      end
    end
    inherited PCMain: TLFPageControl
      Top = 52
      Width = 576
      Height = 107
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 568
          Height = 79
          object LBLPlantilla: TLFLabel
            Left = 56
            Top = 18
            Width = 36
            Height = 13
            Caption = 'Plantilla'
          end
          object LBLTitulo: TLFLabel
            Left = 64
            Top = 43
            Width = 28
            Height = 13
            Caption = 'T'#237'tulo'
          end
          object DBEPlantilla: TLFDbedit
            Left = 104
            Top = 15
            Width = 121
            Height = 21
            DataField = 'PLANTILLA'
            DataSource = DMPlantillasImputacion.DSQMPlantillas
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 104
            Top = 40
            Width = 401
            Height = 21
            DataField = 'TITULO'
            DataSource = DMPlantillasImputacion.DSQMPlantillas
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 568
          Height = 79
          Columns = <
            item
              Expanded = False
              FieldName = 'PLANTILLA'
              Width = 81
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 451
              Visible = True
            end>
        end
      end
    end
    object TBPlanes: TLFToolBar
      Left = 2
      Top = 2
      Width = 576
      Height = 24
      ButtonHeight = 21
      EdgeBorders = []
      Flat = True
      TabOrder = 2
      Separators = True
      object CBPlanes: TLFComboBox
        Left = 0
        Top = 0
        Width = 574
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnSelect = CBPlanesSelect
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 370
    Width = 580
    EdgeOuter = esNone
  end
  object PDetalle: TLFPanel [2]
    Left = 0
    Top = 161
    Width = 580
    Height = 209
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object PCDetalle: TLFPageControl
      Left = 0
      Top = 0
      Width = 580
      Height = 209
      ActivePage = TSCentrosCoste
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 0
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSCentrosCoste: TTabSheet
        Caption = 'Centros de Coste'
        OnShow = TSCentrosCosteShow
        object TBCentrosCoste: TLFToolBar
          Left = 0
          Top = 0
          Width = 572
          Height = 22
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 0
          Separators = True
          object NavCentrosCoste: THYMNavigator
            Left = 0
            Top = 0
            Width = 240
            Height = 22
            DataSource = DMPlantillasImputacion.DSQMCentrosCoste
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
            OnClickAfterAdjust = NavCentrosCosteClickAfterAdjust
          end
          object PIncompleta: TLFPanel
            Left = 240
            Top = 0
            Width = 225
            Height = 22
            BevelOuter = bvNone
            TabOrder = 1
            object EdPlantillaIncompleta: TLFEdit
              Left = 38
              Top = -1
              Width = 139
              Height = 21
              Color = clRed
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              Text = 'PLANTILLA INCOMPLETA'
            end
          end
        end
        object DBGFCentrosCoste: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 572
          Height = 159
          Align = alClient
          DataSource = DMPlantillasImputacion.DSQMCentrosCoste
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnColEnter = DBGFCentrosCosteColEnter
          Insercion = False
          ColumnaInicial = 1
          UsaDicG2K = True
          Changed = False
          AutoCambiarColumna = True
          AutoPostEnCheckBox = True
          AutoStartDrag = False
          AutoStartDragInterval = 0
          IndiceBitmapOrdenable = 0
          IndiceBitmapAscendente = 1
          IndiceBitmapChecked = 3
          IndiceBitmapDescendente = 2
          BaseDeDatos = DMMain.DataBase
          Transaction = DMPlantillasImputacion.TLocal
          BuscarNums = False
          Campos.Strings = (
            'CENTRO_COSTE')
          CamposAMostrar.Strings = (
            'CENTRO_COSTE'
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
            'LINEA'
            'TITULO')
          ColumnasCheckBoxes.Strings = (
            'REDONDEO')
          ColumnasChecked.Strings = (
            '1')
          ColumnasNoChecked.Strings = (
            '0')
          MensajeNoExiste = False
          Numericos.Strings = (
            'CENTRO_COSTE')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'ANA_CENTROS_COSTE')
          Acciones.Strings = (
            '')
          Titulos.Strings = (
            'TITULO')
          Posicion = tpCentrado
          OnBusqueda = DBGFCentrosCosteBusqueda
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            '')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
          Columns = <
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
              Width = 39
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CENTRO_COSTE'
              Width = 83
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
              Width = 281
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PORCENTAJE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REDONDEO'
              Visible = True
            end>
        end
      end
      object TSAsignacionCuentas: TTabSheet
        Caption = 'Asignaci'#243'n de cuentas'
        ImageIndex = 1
        OnShow = TSAsignacionCuentasShow
        object TBCuentas: TLFToolBar
          Left = 0
          Top = 0
          Width = 572
          Height = 22
          ButtonWidth = 26
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object NavCuentas: THYMNavigator
            Left = 0
            Top = 0
            Width = 234
            Height = 22
            DataSource = DMPlantillasImputacion.DSQMCuentas
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbInsert, nbDelete, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CECuentasPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFCuentas
            InsertaControl = DBGFCuentas
            Exclusivo = True
            ControlEdit = CECuentas
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object TSep1: TToolButton
            Left = 234
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TButtInsertarCuentas: TToolButton
            Left = 242
            Top = 0
            Hint = 'Adicionar bloques de cuentas'
            Caption = 'Insertar Cuentas'
            ImageIndex = 71
            ParentShowHint = False
            ShowHint = True
            OnClick = TButtInsertarCuentasClick
          end
          object TSep2: TToolButton
            Left = 268
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TButtCrearImputaciones: TToolButton
            Left = 276
            Top = 0
            Hint = 'Realizar imputaciones de todas las nuevas cuentas insertadas'
            Caption = 'Crear Imputaciones'
            ImageIndex = 55
            ParentShowHint = False
            ShowHint = True
            OnClick = TButtCrearImputacionesClick
          end
          object TButtReCrearImputaciones: TToolButton
            Left = 302
            Top = 0
            Hint = 
              'Recrea las imputaciones de la cuenta seleccionada con las condic' +
              'iones actuales'
            Caption = 'Recrear Imputaciones'
            ImageIndex = 26
            ParentShowHint = False
            ShowHint = True
            OnClick = TButtReCrearImputacionesClick
          end
          object TButtRecreaPlantilla: TToolButton
            Left = 328
            Top = 0
            Hint = 'Recrea las imputaciones de toda la plantilla'
            Caption = 'Recrea las imputaciones de toda la plantilla'
            ImageIndex = 17
            ParentShowHint = False
            ShowHint = True
            OnClick = TButtRecreaPlantillaClick
          end
          object TbuttReconstruye: TToolButton
            Left = 354
            Top = 0
            Hint = 'Reconstruir todas la Cont. Analitica'
            Caption = 'Reconstruir todas la Cont. Analitica'
            ImageIndex = 26
            ParentShowHint = False
            ShowHint = True
            OnClick = TbuttReconstruyeClick
          end
        end
        object DBGFCuentas: TDBGridFind2000
          Left = 0
          Top = 22
          Width = 572
          Height = 159
          Align = alClient
          DataSource = DMPlantillasImputacion.DSQMCuentas
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnColEnter = DBGFCuentasColEnter
          OnColExit = DBGFCuentasColExit
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
          Transaction = DMPlantillasImputacion.TLocal
          BuscarNums = False
          Campos.Strings = (
            'CUENTA')
          CamposAMostrar.Strings = (
            'CUENTA'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0')
          CamposADevolver.Strings = (
            '')
          CamposDesplegar.Strings = (
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CondicionBusqueda = 'TIPO=5'
          MensajeNoExiste = False
          Numericos.Strings = (
            'CUENTA')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'CON_CUENTAS')
          Acciones.Strings = (
            '')
          Titulos.Strings = (
            'TITULO')
          Posicion = tpCentrado
          Planes.Strings = (
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            '')
          Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'CUENTA'
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
              Width = 438
              Visible = True
            end>
        end
      end
    end
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CECentrosCoste
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 280
    Top = 72
  end
  inherited FSMain: TLFFibFormStorage
    Left = 312
    Top = 72
  end
  object CECentrosCoste: TControlEdit
    EnlazadoA = CECuentas
    FichaExclusiva = TSCentrosCoste
    PopUpMenu = CECentrosCostePMEdit
    Teclas = DMMain.Teclas
    Left = 336
    Top = 128
  end
  object CECentrosCostePMEdit: TPopUpTeclas
    Left = 376
    Top = 128
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
  object CECuentas: TControlEdit
    EnlazadoA = CEMain
    FichaExclusiva = TSAsignacionCuentas
    PopUpMenu = CECuentasPMEdit
    Teclas = DMMain.Teclas
    Left = 336
    Top = 160
  end
  object CECuentasPMEdit: TPopUpTeclas
    Left = 376
    Top = 160
    object CECuentasMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CECuentasMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CECuentasMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CECuentasMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CECuentasMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CECuentasMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CECuentasMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CECuentasMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CECuentasMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CECuentasMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
