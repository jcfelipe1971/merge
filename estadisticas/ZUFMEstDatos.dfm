inherited ZFMEstDatos: TZFMEstDatos
  Left = 216
  Top = 263
  Width = 961
  Height = 430
  BorderStyle = bsSizeable
  Caption = 'Estad'#237'stica'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 953
    Height = 403
    inherited TBMain: TLFToolBar
      Width = 953
      object TButtConfigurar: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
      object ToolButton1: TToolButton
        Left = 360
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object LInformacion: TLFLabel
        Left = 368
        Top = 0
        Width = 10
        Height = 36
        Constraints.MinWidth = 10
        Layout = tlCenter
      end
    end
    object PnlCab: TLFPanel
      Left = 0
      Top = 36
      Width = 953
      Height = 81
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object LBLPeriodo: TLFLabel
        Left = 209
        Top = 55
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = 'Periodo'
      end
      object LBLGrupo: TLFLabel
        Left = 216
        Top = 12
        Width = 29
        Height = 13
        Alignment = taRightJustify
        Caption = 'Grupo'
      end
      object LBLEstadistica: TLFLabel
        Left = 192
        Top = 33
        Width = 53
        Height = 13
        Alignment = taRightJustify
        Caption = 'Estad'#237'stica'
      end
      object DBEDescGrupo: TLFDbedit
        Left = 308
        Top = 8
        Width = 285
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = ZDMEstDatos.DSxDescGrupo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object DBEDescEstadistica: TLFDbedit
        Left = 308
        Top = 30
        Width = 285
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = ZDMEstDatos.DSxDescEstadistica
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object EFPeriodo: TLFEditFind2000
        Left = 250
        Top = 52
        Width = 57
        Height = 21
        TabOrder = 4
        Text = '19'
        OnChange = EFPeriodoChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'PERIODO'
        CampoStr = 'TITULO'
        CondicionBusqueda = 'tipo<>5'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = False
        Tabla_a_buscar = 'SYS_PERIODOS'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'PERIODO')
        Filtros = []
      end
      object DBEDescPeriodo: TLFDbedit
        Left = 308
        Top = 52
        Width = 174
        Height = 21
        Color = clInfoBk
        DataField = 'TITULO'
        DataSource = ZDMEstDatos.DSxDescPeriodo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
      end
      object EGrupo: TLFEdit
        Left = 250
        Top = 8
        Width = 57
        Height = 21
        TabStop = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object EEstadistica: TLFEdit
        Left = 250
        Top = 30
        Width = 57
        Height = 21
        TabStop = False
        Color = clInfoBk
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object ChkBVerTotal: TLFCheckBox
        Left = 487
        Top = 54
        Width = 104
        Height = 17
        Caption = 'Ver Total Periodo'
        Checked = True
        State = cbChecked
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 6
        TabStop = True
        OnClick = CambioCheck
        OnEnter = CambioCheck
        OnExit = CambioCheck
        Alignment = taLeftJustify
      end
      object CBOrdenTotal: TLFComboBox
        Left = 594
        Top = 30
        Width = 129
        Height = 21
        ItemHeight = 13
        ItemIndex = 0
        TabOrder = 8
        Text = 'No Ordenar por Total'
        OnChange = CBOrdenTotalChange
        Items.Strings = (
          'No Ordenar por Total'
          'Orden Ascendente'
          'Orden Descendente')
      end
      object ChkBOcultarMeses: TLFCheckBox
        Left = 595
        Top = 54
        Width = 102
        Height = 17
        Caption = 'Ocultar Meses'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 7
        TabStop = True
        OnClick = CambioCheck
        OnEnter = CambioCheck
        OnExit = CambioCheck
        Alignment = taLeftJustify
      end
    end
    object PnlDet: TLFPanel
      Left = 0
      Top = 117
      Width = 953
      Height = 286
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      object DBGFEstadistica: TDBGridFind2000
        Left = 0
        Top = 0
        Width = 953
        Height = 286
        Align = alClient
        Ctl3D = True
        DataSource = ZDMEstDatos.DSQMEstadistica
        Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ReadOnly = True
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        IniStorage = FSMain
        Insercion = False
        ColumnaInicial = 0
        UsaDicG2K = True
        Changed = False
        Idioma = 'CAS'
        AutoCambiarColumna = True
        AutoPostEnCheckBox = False
        AutoStartDrag = False
        AutoStartDragInterval = 0
        IndiceBitmapOrdenable = 0
        IndiceBitmapAscendente = 1
        IndiceBitmapChecked = 3
        IndiceBitmapDescendente = 2
        BaseDeDatos = DMMain.DataBase
        BuscarNums = False
        BuscarChars = False
        CampoAOrdenarColor = clInfoBk
        CampoAOrdenarBitmaps = DMMain.ILOrdGrid
        CamposAOrdernar.Strings = (
          'CLAVE_1'
          'CLAVE_2'
          'CLAVE_3'
          'MES01'
          'MES02'
          'MES03'
          'MES04'
          'MES05'
          'MES06'
          'MES07'
          'MES08'
          'MES09'
          'MES10'
          'MES11'
          'MES12'
          'DESC_CLAVE_1'
          'DESC_CLAVE_2'
          'DESC_CLAVE_3'
          'CAMPO_AUX_1'
          'CAMPO_AUX_2'
          'CAMPO_AUX_3'
          'CAMPO_AUX_4'
          'CAMPO_AUX_5')
        MensajeNoExiste = False
        SalirSiVacio = False
        SalirSiNoExiste = False
        Posicion = tpCentrado
        OrdenMultiple = True
        Filtros = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CLAVE_1'
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESC_CLAVE_1'
            Width = 175
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLAVE_2'
            Width = 55
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESC_CLAVE_2'
            Width = 93
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CLAVE_3'
            Width = 54
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESC_CLAVE_3'
            Width = 91
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CAMPO_AUX_1'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CAMPO_AUX_2'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CAMPO_AUX_3'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CAMPO_AUX_4'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'CAMPO_AUX_5'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MES01'
            Width = 52
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MES02'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MES03'
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MES04'
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MES05'
            Width = 49
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MES06'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MES07'
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MES08'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MES09'
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MES10'
            Width = 51
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MES11'
            Width = 48
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MES12'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TOTALPERIODO'
            Visible = True
          end>
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 412
    Top = 6
    inherited AImprimir: TAction
      OnExecute = AImprimirExecute
    end
    inherited APrev: TAction
      OnExecute = APrevExecute
    end
    inherited ARecargar: TAction
      Caption = '&Recalcular'
      Hint = 'Recalcular estad'#237'stica'
      OnExecute = ARecargarExecute
    end
  end
end
