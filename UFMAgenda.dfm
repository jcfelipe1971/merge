inherited FMAgenda: TFMAgenda
  Left = 283
  Top = 139
  ActiveControl = DBCtrlGAgenda
  Caption = 'Agenda'
  ClientHeight = 539
  ClientWidth = 1096
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1096
    Height = 515
    inherited TBMain: TLFToolBar
      Width = 1092
      inherited EPMain: THYMEditPanel
        Width = 33
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object PCMain: TLFPageControl
      Left = 2
      Top = 28
      Width = 1092
      Height = 485
      ActivePage = TSAgenda
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 1
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSAgenda: TTabSheet
        Caption = 'Agenda'
        object DBCtrlGAgenda: TLFDBCtrlGrid
          Left = 0
          Top = 24
          Width = 1084
          Height = 433
          Align = alClient
          ColCount = 1
          DataSource = DMAgenda.DSQMAgenda
          PanelHeight = 54
          PanelWidth = 1068
          TabOrder = 0
          RowCount = 8
          object DBDEFecha: TLFDBDateEdit
            Left = 5
            Top = 5
            Width = 99
            Height = 21
            DataField = 'FECHA'
            DataSource = DMAgenda.DSQMAgenda
            ReadOnly = True
            CheckOnExit = True
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            NumGlyphs = 2
            ParentFont = False
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 105
            Top = 5
            Width = 245
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMAgenda.DSQMAgenda
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object DBMDescripcion: TLFDBMemo
            Left = 352
            Top = 5
            Width = 716
            Height = 46
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            DataField = 'DESCRIPCION'
            DataSource = DMAgenda.DSQMAgenda
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
          end
          object DBCEstado: TLFDBCheckBox
            Left = 5
            Top = 32
            Width = 81
            Height = 17
            Caption = 'Visto'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 3
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ESTADO'
            DataSource = DMAgenda.DSQMAgenda
            ValueChecked = '3'
            ValueUnchecked = '0'
          end
        end
        object TBAgenda: TLFToolBar
          Left = 0
          Top = 0
          Width = 1084
          Height = 24
          AutoSize = True
          Caption = 'TBAgenda'
          DisabledImages = DMMain.ILMain_In
          EdgeInner = esNone
          EdgeOuter = esNone
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Separators = True
          object TBGrabaAgenda: TToolButton
            Left = 0
            Top = 2
            Hint = 'Graba Registro de Agenda'
            Action = AGrabaAgenda
          end
          object TBEliminaAgenda: TToolButton
            Left = 23
            Top = 2
            Action = AEliminaAgenda
          end
        end
      end
      object TSEventos: TTabSheet
        Caption = 'Eventos'
        ImageIndex = 1
        object DBCtrlGEventos: TLFDBCtrlGrid
          Left = 0
          Top = 24
          Width = 1084
          Height = 433
          Align = alClient
          ColCount = 1
          DataSource = DMAgenda.DSQMAgendaEventoPeriodos
          PanelHeight = 54
          PanelWidth = 1068
          TabOrder = 0
          RowCount = 8
          object LTitulo: TLFLabel
            Left = 10
            Top = 11
            Width = 26
            Height = 13
            Caption = 'Titulo'
          end
          object LPeriodicidad: TLFLabel
            Left = 10
            Top = 34
            Width = 58
            Height = 13
            Caption = 'Periodicidad'
          end
          object LFechaDesde: TLFLabel
            Left = 348
            Top = 8
            Width = 43
            Height = 13
            Caption = 'F. Desde'
          end
          object LFechaHasta: TLFLabel
            Left = 348
            Top = 32
            Width = 40
            Height = 13
            Caption = 'F. Hasta'
          end
          object DBETituloEvento: TLFDbedit
            Left = 72
            Top = 7
            Width = 273
            Height = 21
            DataField = 'TITULO'
            DataSource = DMAgenda.DSQMAgendaEventoPeriodos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBEDiaMes: TLFDbedit
            Left = 129
            Top = 29
            Width = 42
            Height = 21
            DataField = 'DIA_MES'
            DataSource = DMAgenda.DSQMAgendaEventoPeriodos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object DBEFechaInicio: TLFDBDateEdit
            Left = 396
            Top = 7
            Width = 95
            Height = 21
            DataField = 'FECHA_INICIO'
            DataSource = DMAgenda.DSQMAgendaEventoPeriodos
            CheckOnExit = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            NumGlyphs = 2
            ParentFont = False
            TabOrder = 2
          end
          object DBEFechaFin: TLFDBDateEdit
            Left = 396
            Top = 29
            Width = 95
            Height = 21
            DataField = 'FECHA_FIN'
            DataSource = DMAgenda.DSQMAgendaEventoPeriodos
            CheckOnExit = True
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            NumGlyphs = 2
            ParentFont = False
            TabOrder = 3
          end
          object DBDescripcion: TLFDBMemo
            Left = 493
            Top = 8
            Width = 572
            Height = 47
            Anchors = [akLeft, akTop, akRight]
            DataField = 'DESCRIPCION'
            DataSource = DMAgenda.DSQMAgendaEventoPeriodos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
          object DBDiaSemana: TLFDBComboBoxValue
            Left = 72
            Top = 29
            Width = 57
            Height = 21
            DataField = 'DIA_SEMANA'
            DataSource = DMAgenda.DSQMAgendaEventoPeriodos
            ItemHeight = 13
            Items.Strings = (
              'Sin Asignar'
              'Lunes'
              'Martes'
              'Miercoles'
              'Jueves'
              'Viernes'
              'Sabado'
              'Domingo')
            Values.Strings = (
              ''
              'L'
              'M'
              'X'
              'J'
              'V'
              'S'
              'D')
            TabOrder = 5
          end
          object DBMes: TLFDBComboBoxValue
            Left = 171
            Top = 29
            Width = 121
            Height = 21
            DataField = 'MES'
            DataSource = DMAgenda.DSQMAgendaEventoPeriodos
            ItemHeight = 13
            Items.Strings = (
              'Sin Asignar'
              'Enero'
              'Febrero'
              'Marzo'
              'Abril'
              'Mayo '
              'Junio'
              'Julio'
              'Agosto'
              'Septiembre'
              'Octubre'
              'Noviembre'
              'Diciembre')
            Values.Strings = (
              '0'
              '1'
              '2'
              '3'
              '4'
              '5'
              '6'
              '7'
              '8'
              '9'
              '10'
              '11'
              '12')
            TabOrder = 6
          end
        end
        object TBEventos: TLFToolBar
          Left = 0
          Top = 0
          Width = 1084
          Height = 24
          AutoSize = True
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 1
          Separators = True
          object TBGrabaAgendaEvento: TToolButton
            Left = 0
            Top = 2
            Action = AGrabaEventoAgenda
          end
          object TBEliminaAgendaEvento: TToolButton
            Left = 23
            Top = 2
            Action = AEliminaEventoAgenda
          end
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 515
    Width = 1096
  end
  inherited CEMain: TControlEdit
    Left = 304
    Top = 0
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 344
    Top = 0
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
  inherited ALMain: TLFActionList
    Left = 392
    Top = 0
  end
  inherited FSMain: TLFFibFormStorage
    Left = 432
    Top = 0
  end
  object ALAgenda: TLFActionList
    Reset = False
    Enabled = True
    Changed = False
    Left = 480
    object AGeneraAgenda: TAction
      Caption = 'Genera Agenda'
      ImageIndex = 9
      OnExecute = AGeneraAgendaExecute
    end
    object AEliminaAgenda: TAction
      Caption = 'Elimina Agenda'
      Hint = 'Elimina registro de agenda'
      ImageIndex = 27
      OnExecute = AEliminaAgendaExecute
    end
    object AGrabaAgenda: TAction
      Caption = 'Graba Agenda'
      Hint = 'Graba Agenda'
      ImageIndex = 19
      OnExecute = AGrabaAgendaExecute
    end
    object AEliminaEventoAgenda: TAction
      Caption = 'Elimina evento agenda'
      Hint = 'Elimina evento agenda'
      ImageIndex = 27
      OnExecute = AEliminaEventoAgendaExecute
    end
    object AGrabaEventoAgenda: TAction
      Caption = 'Graba Evento Agenda'
      Hint = 'Graba Evento Agenda'
      ImageIndex = 19
      OnExecute = AGrabaEventoAgendaExecute
    end
  end
end
