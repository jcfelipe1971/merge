object FMEmpEjerCanal: TFMEmpEjerCanal
  Left = 829
  Top = 395
  ActiveControl = CHKMemoriza
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Empresa - Ejercicio'
  ClientHeight = 359
  ClientWidth = 493
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PNLImagenes: TLFPanel
    Left = 0
    Top = 0
    Width = 493
    Height = 256
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object LSTICONOS: TListView
      Left = 0
      Top = 0
      Width = 493
      Height = 256
      Align = alClient
      Columns = <>
      LargeImages = DMEmpEjerCanal.ILEmpresas
      PopupMenu = POPUPCanal
      TabOrder = 0
      OnChange = LSTICONOSChange
      OnDblClick = LSTICONOSDblClick
      OnSelectItem = LSTICONOSSelectItem
    end
  end
  object PNLDetalles: TLFPanel
    Left = 0
    Top = 256
    Width = 493
    Height = 103
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object LBLFecha: TLFLabel
      Left = 167
      Top = 14
      Width = 30
      Height = 13
      Alignment = taRightJustify
      Caption = 'Fecha'
    end
    object LBLEjercicio: TLFLabel
      Left = 27
      Top = 14
      Width = 40
      Height = 13
      Alignment = taRightJustify
      Caption = 'Ejercicio'
    end
    object LSerie: TLFLabel
      Left = 43
      Top = 38
      Width = 24
      Height = 13
      Alignment = taRightJustify
      Caption = 'Serie'
    end
    object BBAceptar: TBitBtn
      Left = 137
      Top = 65
      Width = 82
      Height = 30
      BiDiMode = bdLeftToRight
      Caption = '&Aceptar'
      Default = True
      ParentBiDiMode = False
      TabOrder = 0
      OnClick = BBAceptarClick
    end
    object BBCancelar: TBitBtn
      Left = 265
      Top = 65
      Width = 82
      Height = 30
      Cancel = True
      Caption = '&Salir'
      ModalResult = 2
      TabOrder = 1
      OnClick = BBCancelarClick
    end
    object CBEjercicio: TLFComboBox
      Left = 72
      Top = 10
      Width = 65
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 2
      OnChange = CBEjercicioChange
      Items.Strings = (
        '1999')
    end
    object CHKMemoriza: TLFCheckBox
      Left = 305
      Top = 12
      Width = 169
      Height = 17
      Caption = 'Memorizar Fecha de Trabajo'
      ClicksDisabled = False
      ColorCheck = 57088
      TabOrder = 4
      TabStop = True
      Alignment = taLeftJustify
      OnChange = CHKMemorizaChange
    end
    object DTPFechaTrabajo: TLFDateEdit
      Left = 202
      Top = 10
      Width = 87
      Height = 21
      CheckOnExit = True
      NumGlyphs = 2
      TabOrder = 3
      OnChange = DTPFechaTrabajoChange
    end
    object EFSerie: TLFEditFind2000
      Left = 72
      Top = 34
      Width = 65
      Height = 21
      TabOrder = 5
      OnChange = EFSerieChange
      Base_de_datos = DMMain.DataBase
      Transaction = DMMain.TLocal
      BuscarNums = False
      BuscarChars = True
      AutoCambiarFoco = False
      CampoNum = 'SERIE'
      CampoStr = 'TITULO'
      Posicion = tpCentrado
      ReemplazarCaracter = True
      SalirSiVacio = True
      SalirSiNoExiste = False
      Tabla_a_buscar = 'VER_CANALES_SERIES'
      Tabla_asociada.DesplegarBusqueda = False
      OrdenadoPor.Strings = (
        'SERIE')
      Filtros = []
    end
    object ESerie: TLFEdit
      Left = 138
      Top = 34
      Width = 151
      Height = 21
      Color = clInfoBk
      Enabled = False
      TabOrder = 6
    end
  end
  object POPUPCanal: TPopupMenu
    AutoHotkeys = maManual
    OnPopup = POPUPCanalPopup
    Left = 50
    Top = 16
    object MICanal: TMenuItem
      Caption = 'Canal'
    end
  end
  object TEspera: TTimer
    Enabled = False
    Interval = 60000
    OnTimer = TEsperaTimer
    Left = 16
    Top = 16
  end
end
