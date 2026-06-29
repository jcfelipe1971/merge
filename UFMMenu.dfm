object FMMenu: TFMMenu
  Left = 212
  Top = 126
  BorderStyle = bsNone
  Caption = 'Menu'
  ClientHeight = 791
  ClientWidth = 235
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object tvMenu: TTreeView
    Left = 0
    Top = 0
    Width = 235
    Height = 766
    Align = alClient
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderWidth = 1
    Color = clWhite
    DragMode = dmAutomatic
    HotTrack = True
    Images = DMMain.ILMain_Ac
    Indent = 19
    ParentShowHint = False
    ReadOnly = True
    RightClickSelect = True
    ShowButtons = False
    ShowHint = True
    StateImages = DMMain.ILMain_Ac
    TabOrder = 0
    OnClick = tvMenuClick
    OnDblClick = tvMenuDblClick
    OnDragDrop = tvMenuDragDrop
    OnDragOver = tvMenuDragOver
    OnKeyPress = tvMenuKeyPress
    OnMouseDown = tvMenuMouseDown
    OnMouseMove = tvMenuMouseMove
  end
  object TBMain: TLFToolBar
    Left = 0
    Top = 766
    Width = 235
    Height = 25
    Align = alBottom
    EdgeBorders = []
    Images = DMMain.ILMain_Ac
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Separators = True
    object TBConfigurar: TToolButton
      Left = 0
      Top = 2
      Hint = 'Configurar Menu'
      Caption = 'Configurar'
      ImageIndex = 2
      OnClick = TBConfigurarClick
    end
    object BSep1: TToolButton
      Left = 23
      Top = 2
      Width = 8
      Style = tbsSeparator
    end
    object TBGuardar: TToolButton
      Left = 31
      Top = 2
      Hint = 'Guarda los cambios'
      Caption = 'Guardar'
      ImageIndex = 41
      OnClick = TBGuardarClick
    end
    object TBCancelar: TToolButton
      Left = 54
      Top = 2
      Hint = 'Cancela los cambios'
      Caption = 'Cancelar'
      ImageIndex = 20
      OnClick = TBCancelarClick
    end
  end
  object pmOpcionesNodo: TPopupMenu
    OnPopup = pmOpcionesNodoPopup
    Left = 168
    Top = 32
    object MIBorrar: TMenuItem
      Caption = 'Borrar'
      OnClick = MIBorrarClick
    end
    object MIInsertar: TMenuItem
      Caption = 'Insertar'
      OnClick = MIInsertarClick
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object MICrearAccesoDirecto: TMenuItem
      Caption = 'Crear Acceso Directo'
      OnClick = MICrearAccesoDirectoClick
    end
    object MIOculatarBorde: TMenuItem
      Caption = 'Ocultar Borde Accesos  Directos'
      OnClick = MIOculatarBordeClick
    end
    object MIMostrarBorde: TMenuItem
      Caption = 'Mostrar Borde Accesos  Directos'
      OnClick = MIMostrarBordeClick
    end
    object MIMostrarAvisos: TMenuItem
      Caption = 'Mostrar Avisos'
      OnClick = MIMostrarAvisosClick
    end
  end
end
