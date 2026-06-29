object FMGasCerrar: TFMGasCerrar
  Left = 545
  Top = 260
  Width = 377
  Height = 257
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Cerrar Ventas Gas'
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
  object PnlCerrar: TLFPanel
    Left = 0
    Top = 26
    Width = 369
    Height = 204
    Align = alClient
    TabOrder = 0
    object GBOrigen: TGroupBox
      Left = 1
      Top = 1
      Width = 367
      Height = 75
      Align = alTop
      Caption = 'Origen'
      TabOrder = 0
      object LblRigOrigen: TLFLabel
        Left = 13
        Top = 23
        Width = 16
        Height = 13
        Alignment = taRightJustify
        Caption = 'Rig'
      end
      object LFechaCierreOrigen: TLFLabel
        Left = 100
        Top = 46
        Width = 60
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha Cierre'
      end
      object LID: TLFLabel
        Left = 19
        Top = 46
        Width = 9
        Height = 13
        Alignment = taRightJustify
        Caption = 'Id'
      end
      object LFERigOrigen: TLFEdit
        Left = 33
        Top = 20
        Width = 56
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
      end
      object DEFechaCierre: TLFDateEdit
        Left = 163
        Top = 42
        Width = 105
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
      end
      object DTCierre: TDateTimePicker
        Left = 269
        Top = 42
        Width = 69
        Height = 21
        CalAlignment = dtaLeft
        Date = 40439
        Time = 40439
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkTime
        ParseInput = False
        TabOrder = 2
        TabStop = False
      end
      object LFEIdOrigen: TLFEdit
        Left = 33
        Top = 42
        Width = 56
        Height = 21
        TabStop = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
    end
    object GBDestino: TGroupBox
      Left = 1
      Top = 76
      Width = 367
      Height = 54
      Align = alClient
      Caption = 'Destino'
      TabOrder = 1
      object LFechaInicioDestino: TLFLabel
        Left = 102
        Top = 23
        Width = 58
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha Inicio'
      end
      object DEFechaInicioDestino: TLFDateEdit
        Left = 163
        Top = 20
        Width = 105
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 0
      end
      object DTInicio: TDateTimePicker
        Left = 269
        Top = 20
        Width = 69
        Height = 21
        CalAlignment = dtaLeft
        Date = 39343
        Time = 39343
        DateFormat = dfShort
        DateMode = dmComboBox
        Kind = dtkTime
        ParseInput = False
        TabOrder = 1
        TabStop = False
      end
      object LFCBOrigen: TLFCheckBox
        Left = 12
        Top = 22
        Width = 77
        Height = 17
        Caption = 'Origen'
        Checked = True
        State = cbChecked
        ClicksDisabled = False
        TabOrder = 2
        TabStop = True
        Alignment = taLeftJustify
      end
    end
    object GBCopiar: TGroupBox
      Left = 1
      Top = 130
      Width = 367
      Height = 73
      Align = alBottom
      Caption = 'Copiar'
      TabOrder = 2
      object LRIGCopiar: TLFLabel
        Left = 19
        Top = 27
        Width = 9
        Height = 13
        Alignment = taRightJustify
        Caption = 'Id'
      end
      object EFIdVenta: TLFEditFind2000
        Left = 33
        Top = 23
        Width = 57
        Height = 21
        TabOrder = 0
        OnChange = EFIdVentaChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        Campos_Desplegar.Strings = (
          'FECHA_INICIO')
        CampoADevolver = 'ID_VENTA'
        CampoNum = 'ID_VENTA'
        CampoStr = 'TURNO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'GES_GAS_CAB_VENTA'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'FECHA_INICIO DESC')
        Filtros = [obEmpresa, obEjercicio, obCanal]
        Entorno = DMMain.EntornoBusqueda
      end
      object ETurno: TLFEdit
        Left = 91
        Top = 23
        Width = 60
        Height = 21
        TabStop = False
        Color = clInfoBk
        Enabled = False
        ReadOnly = True
        TabOrder = 1
      end
      object EOrden: TLFEdit
        Left = 152
        Top = 23
        Width = 60
        Height = 21
        TabStop = False
        Color = clInfoBk
        Enabled = False
        ReadOnly = True
        TabOrder = 2
      end
    end
  end
  object TBMain: TLFToolBar
    Left = 0
    Top = 0
    Width = 369
    Height = 26
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    Flat = True
    Images = DMMain.ILMain_Ac
    TabOrder = 1
    Separators = True
    object TBSalir: TToolButton
      Left = 0
      Top = 0
      Caption = 'Salir'
      ImageIndex = 0
      OnClick = TBSalirClick
    end
    object TBCerrar: TToolButton
      Left = 23
      Top = 0
      Caption = 'Cerrar'
      ImageIndex = 68
      OnClick = TBCerrarClick
    end
  end
end
