inherited FMRepartirHorasProyecto: TFMRepartirHorasProyecto
  ActiveControl = ERepartirUnidades
  Caption = 'Repartir Horas Proyecto'
  ClientHeight = 495
  ClientWidth = 618
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 618
    Height = 471
    inherited TBMain: TLFToolBar
      Width = 614
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
      end
    end
    object PEdit: TLFPanel
      Left = 2
      Top = 28
      Width = 614
      Height = 441
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object LRepartirFecha: TLFLabel
        Left = 59
        Top = 63
        Width = 30
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object LRepartirUnidades: TLFLabel
        Left = 23
        Top = 14
        Width = 66
        Height = 13
        Alignment = taRightJustify
        Caption = 'Uds. a repartir'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object LRepartirTitulo: TLFLabel
        Left = 61
        Top = 84
        Width = 28
        Height = 13
        Alignment = taRightJustify
        Caption = 'T'#237'tulo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object LRepartirotas: TLFLabel
        Left = 55
        Top = 106
        Width = 34
        Height = 13
        Alignment = taRightJustify
        Caption = 'Notas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object LRepartirUnidadesProyeto: TLFLabel
        Left = 43
        Top = 174
        Width = 45
        Height = 13
        Alignment = taRightJustify
        Caption = 'Unidades'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object LRepartirProyecto: TLFLabel
        Left = 177
        Top = 174
        Width = 42
        Height = 13
        Alignment = taRightJustify
        Caption = 'Proyecto'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentColor = False
        ParentFont = False
      end
      object LUsuario: TLFLabel
        Left = 166
        Top = 13
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = 'Usuario'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object DERepartirFecha: TLFDateEdit
        Left = 95
        Top = 59
        Width = 87
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 1
      end
      object ERepartirUnidades: TLFEdit
        Left = 95
        Top = 10
        Width = 62
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object MRepartirNotas: TLFMemo
        Left = 95
        Top = 103
        Width = 303
        Height = 65
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
      end
      object ERepartirUnidadesProyecto: TLFEdit
        Left = 95
        Top = 170
        Width = 62
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
      end
      object EFRepartirProyecto: TLFEditFind2000
        Left = 224
        Top = 170
        Width = 65
        Height = 21
        TabOrder = 5
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'PROYECTO'
        CampoStr = 'TITULO'
        CondicionBusqueda = 'CERRADO = 0'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'EMP_PROYECTOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'PROYECTO')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
      object MRepartirUnidadesProyecto: TLFMemo
        Left = 95
        Top = 192
        Width = 303
        Height = 209
        TabStop = False
        Color = clInfoBk
        ReadOnly = True
        TabOrder = 7
        WordWrap = False
      end
      object BRepartir: TButton
        Left = 322
        Top = 170
        Width = 75
        Height = 21
        Caption = '&Repartir'
        TabOrder = 6
        OnClick = BRepartirClick
      end
      object BGuardarReparticion: TButton
        Left = 322
        Top = 409
        Width = 75
        Height = 21
        Caption = '&Guardar'
        TabOrder = 8
        OnClick = BGuardarReparticionClick
      end
      object MonthCalendar: TMonthCalendar
        Left = 417
        Top = 0
        Width = 197
        Height = 441
        Align = alRight
        MultiSelect = True
        Date = 42674.3573010301
        EndDate = 42674
        TabOrder = 9
        WeekNumbers = True
        OnClick = MonthCalendarClick
      end
      object CBRepartirTitulo: TLFComboBox
        Left = 95
        Top = 81
        Width = 303
        Height = 21
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 2
        Text = 'Proyecto'
        OnChange = CBRepartirTituloChange
        Items.Strings = (
          'Proyecto'
          'Vacaciones'
          'Baja'
          'Festivo')
      end
      object EUsuario: TLFEdit
        Left = 206
        Top = 10
        Width = 192
        Height = 21
        TabStop = False
        Color = clInfoBk
        Enabled = False
        TabOrder = 10
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 471
    Width = 618
  end
end
