object ProFMGantt: TProFMGantt
  Left = 402
  Top = 227
  Width = 815
  Height = 588
  Caption = 'Diagrama de Gantt'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = CEMainPMEdit
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PNLMain: TLFPanel
    Left = 0
    Top = 0
    Width = 807
    Height = 177
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object TBMain: TLFToolBar
      Left = 0
      Top = 0
      Width = 807
      Height = 24
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
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
        Width = 240
        Height = 22
        DataSource = ProDMGantt.DSQMGantt
        Flat = True
        ParentShowHint = False
        PopupMenu = CEMainPMEdit
        ShowHint = True
        TabOrder = 1
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        EditaControl = DBGGantt
        InsertaControl = DBGGantt
        Exclusivo = True
        ControlEdit = CEMain
        OrdenAscendente = True
        InsertaUltimo = True
      end
      object ToolButton1: TToolButton
        Left = 240
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBActualizar: TToolButton
        Left = 248
        Top = 0
        Hint = 'Actualizar Diagrama de Gantt'
        Caption = 'Actualizar'
        ImageIndex = 26
        ParentShowHint = False
        ShowHint = True
        OnClick = TBActualizarClick
      end
      object ToolButton3: TToolButton
        Left = 271
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object EPPanel: THYMEditPanel
        Left = 279
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
    end
    object DBGGantt: TFIBHYGGridFind
      Left = 0
      Top = 24
      Width = 807
      Height = 153
      Align = alClient
      DataSource = ProDMGantt.DSQMGantt
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Insercion = False
      ColumnaInicial = 1
      UsaDicG2K = True
      Changed = True
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
      Transaction = ProDMGantt.TLocal
      BuscarNums = False
      CampoAOrdenarColor = clInfoBk
      MensajeNoExiste = False
      SalirSiVacio = False
      SalirSiNoExiste = False
      Posicion = tpCentrado
      OrdenMultiple = True
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ID'
          ReadOnly = True
          Width = 57
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TAREA'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'RECURSO'
          Width = 72
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'INICIO'
          Width = 120
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DURACION'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'PRIORIDAD'
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPCION'
          Width = 250
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'IDENTIFICADOR_TAREA'
          Width = 70
          Visible = True
        end>
    end
  end
  object GT: TGantt
    Left = 0
    Top = 177
    Width = 807
    Height = 384
    Align = alClient
    ColorFondo = clTeal
    OnItemDblClick = GTItemDblClick
    OnItemPaint = GTItemPaint
    Datos.ID = 'ID'
    Datos.Color = 'RECURSO'
    Datos.EjeY_ID = 'PRIORIDAD'
    Datos.EjeY_Desc = 'TAREA'
    Datos.FecInicio = 'INICIO'
    Datos.Tiempo = 'DURACION'
    Datos.DataSource = ProDMGantt.DSQMGantt
    EjeX.Altura = 50
    EjeX.AnchoEscala = 24
    EjeX.EscalaPrincipal = esDias
    EjeX.EscalaSecundaria = esHoras
    EjeX.Color = clBtnFace
    EjeY.Anchura = 150
    EjeY.Color = clBtnFace
    EjeY.AltoEscala = 50
    SoloLectura = False
    PermiteSolapar = True
    MenuEjeY = PopupMenuDiagrama
  end
  object PopupMenuDiagrama: TPopupMenu
    AutoHotkeys = maManual
    Left = 616
    Top = 72
    object MINuevaTarea: TMenuItem
      Caption = 'Nueva &Tarea'
      OnClick = MINuevaTareaClick
    end
    object MINuevoRecurso: TMenuItem
      Caption = 'Nuevo &Recurso'
      OnClick = MINuevoRecursoClick
    end
  end
  object CEMain: TControlEdit
    PopUpMenu = CEMainPMEdit
    Teclas = DMMain.Teclas
    Left = 504
    Top = 72
  end
  object CEMainPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 536
    Top = 72
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
  end
end
