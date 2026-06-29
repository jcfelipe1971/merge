inherited ZFMReplicacionModelosDet: TZFMReplicacionModelosDet
  Left = 728
  Top = 488
  ActiveControl = CBIncDec
  BorderStyle = bsDialog
  Caption = 'Replicaci'#243'n Datos Modelos'
  ClientHeight = 416
  ClientWidth = 574
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 574
    Height = 392
    object LModelo: TLFLabel [0]
      Left = 19
      Top = 40
      Width = 35
      Height = 13
      Alignment = taRightJustify
      Caption = 'Modelo'
    end
    object LSalida: TLFLabel [1]
      Left = 146
      Top = 62
      Width = 29
      Height = 13
      Alignment = taRightJustify
      Caption = 'Salida'
    end
    object LLinea: TLFLabel [2]
      Left = 28
      Top = 62
      Width = 26
      Height = 13
      Alignment = taRightJustify
      Caption = 'Linea'
    end
    object LDesdeLinea: TLFLabel [3]
      Left = 402
      Top = 292
      Width = 60
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde Linea'
      Visible = False
    end
    object LDesdeSalida: TLFLabel [4]
      Left = 399
      Top = 337
      Width = 63
      Height = 13
      Alignment = taRightJustify
      Caption = 'Desde Salida'
      Visible = False
    end
    object LHastaSalida: TLFLabel [5]
      Left = 402
      Top = 358
      Width = 60
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta Salida'
      Visible = False
    end
    object LHastaLinea: TLFLabel [6]
      Left = 405
      Top = 315
      Width = 57
      Height = 13
      Alignment = taRightJustify
      Caption = 'Hasta Linea'
      Visible = False
    end
    object LEscandallo: TLFLabel [7]
      Left = 267
      Top = 62
      Width = 52
      Height = 13
      Alignment = taRightJustify
      Caption = 'Escandallo'
    end
    object LSeleccion: TLFLabel [8]
      Left = 28
      Top = 92
      Width = 157
      Height = 13
      Caption = 'Seleccione las medidas a replicar'
    end
    inherited TBMain: TLFToolBar
      Width = 570
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      TabOrder = 10
      inherited EPMain: THYMEditPanel
        Width = 20
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object ToolButton2: TToolButton
        Left = 20
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBEjecutar: TToolButton
        Left = 28
        Top = 0
        Hint = 'Ejecutar replicaci'#243'n'
        Caption = 'TBEjecutar'
        ImageIndex = 25
        ParentShowHint = False
        ShowHint = True
        OnClick = TBEjecutarClick
      end
      object ToolButton1: TToolButton
        Left = 51
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBMarcar: TToolButton
        Left = 59
        Top = 0
        Hint = 'Marcar todos'
        ImageIndex = 19
        OnClick = TBMarcarClick
      end
      object TBDesmarcar: TToolButton
        Left = 82
        Top = 0
        Hint = 'Desmarcar todos'
        ImageIndex = 27
        OnClick = TBDesmarcarClick
      end
    end
    object LFEModelo: TLFEdit
      Left = 58
      Top = 36
      Width = 75
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      TabOrder = 0
    end
    object LFEDescModelo: TLFEdit
      Left = 134
      Top = 36
      Width = 266
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      TabOrder = 2
    end
    object LFSalidaModelo: TLFEdit
      Left = 179
      Top = 58
      Width = 75
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      TabOrder = 3
    end
    object LFLineaModelo: TLFEdit
      Left = 58
      Top = 58
      Width = 75
      Height = 21
      TabStop = False
      Color = clInfoBk
      Enabled = False
      TabOrder = 4
    end
    object LFEFDesdeL: TLFEdit
      Left = 467
      Top = 289
      Width = 71
      Height = 21
      TabOrder = 5
      Visible = False
    end
    object LFEFDesdeS: TLFEdit
      Left = 467
      Top = 333
      Width = 71
      Height = 21
      TabOrder = 7
      Visible = False
    end
    object LFEFHastaL: TLFEdit
      Left = 467
      Top = 311
      Width = 71
      Height = 21
      TabOrder = 6
      Visible = False
    end
    object LFEFHastaS: TLFEdit
      Left = 467
      Top = 355
      Width = 71
      Height = 21
      TabOrder = 8
      Visible = False
    end
    object GBReplicaciones: TGroupBox
      Left = 28
      Top = 275
      Width = 365
      Height = 115
      Caption = 'Replicaciones'
      TabOrder = 9
      object CBLona: TLFCheckBox
        Left = 16
        Top = 47
        Width = 170
        Height = 17
        Caption = 'Replicar C'#225'lculos de Lona'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 1
        TabStop = True
        Alignment = taLeftJustify
      end
      object CBConfecc: TLFCheckBox
        Left = 16
        Top = 70
        Width = 170
        Height = 17
        Caption = 'Replicar Tipos Confecci'#243'n'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 2
        TabStop = True
        Alignment = taLeftJustify
      end
      object CBLacado: TLFCheckBox
        Left = 187
        Top = 23
        Width = 170
        Height = 17
        Caption = 'Replicar Incr. Lacado PVP'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 4
        TabStop = True
        Alignment = taLeftJustify
      end
      object CBEscandallo: TLFCheckBox
        Left = 187
        Top = 70
        Width = 170
        Height = 17
        Caption = 'Replicar Escandallo'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 6
        TabStop = True
        Alignment = taLeftJustify
      end
      object CBMotor: TLFCheckBox
        Left = 187
        Top = 47
        Width = 170
        Height = 17
        Caption = 'Replicar Motores'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 5
        TabStop = True
        Alignment = taLeftJustify
      end
      object CBTodos: TLFCheckBox
        Left = 16
        Top = 23
        Width = 170
        Height = 17
        Caption = 'Todos'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 0
        TabStop = True
        Alignment = taLeftJustify
        OnChange = CBTodosChange
      end
      object CBIncDec: TLFCheckBox
        Left = 16
        Top = 94
        Width = 170
        Height = 17
        Caption = 'Replicar Incr./Decr.'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 3
        TabStop = True
        Alignment = taLeftJustify
      end
    end
    object LFEscandallo: TLFEdit
      Left = 323
      Top = 58
      Width = 77
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 11
    end
    object DBGReplicar: TDBGridFind2000
      Left = 27
      Top = 109
      Width = 466
      Height = 162
      DataSource = ZDMReplicacionModelosDet.DSTempModelos
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
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
      IndiceBitmapAscendente = 1
      IndiceBitmapChecked = 3
      IndiceBitmapDescendente = 2
      BaseDeDatos = DMMain.DataBase
      BuscarNums = False
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      CamposAOrdernar.Strings = (
        'Linea'
        'Salida')
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
      OrdenadosPor.Strings = (
        'linea'
        'salida')
      Filtros = [obEmpresa]
      Entorno = DMMain.EntornoBusqueda
      Columns = <
        item
          Expanded = False
          FieldName = 'MARCADO'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'MODELO'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'LINEA'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SALIDA'
          Width = 50
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ESCANDALLO'
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 392
    Width = 574
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
end
