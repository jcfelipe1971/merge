inherited FPregModelo110: TFPregModelo110
  Left = 381
  Top = 215
  Width = 972
  Height = 551
  HelpContext = 260
  ActiveControl = CBPeriodo
  BorderStyle = bsSizeable
  Caption = 'Modelo 110 / 111 Retenciones'
  OldCreateOrder = True
  PopupMenu = CEDetallePMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 964
    Height = 524
    inherited TBMain: TLFToolBar
      Width = 964
      inherited TButtRecargar: TToolButton
        ParentShowHint = False
        ShowHint = True
      end
      object TButtConfigurar: TToolButton
        Left = 288
        Top = 0
        Action = AConfigurar
      end
      object ToolButton1: TToolButton
        Left = 360
        Top = 0
        Action = AModeloOficial
      end
      object ToolButton2: TToolButton
        Left = 432
        Top = 0
        Action = AInstrucciones
      end
      object TButtExportar: TToolButton
        Left = 504
        Top = 0
        Action = AExportar
      end
    end
    inherited PBListado: TProgressBar
      Top = 508
      Width = 964
      TabOrder = 3
    end
    object PNLLimites: TLFPanel
      Left = 0
      Top = 36
      Width = 964
      Height = 77
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object LPeriodo: TLFLabel
        Left = 131
        Top = 40
        Width = 38
        Height = 13
        Alignment = taRightJustify
        Caption = 'Per'#237'odo'
      end
      object LEjercicio: TLFLabel
        Left = 129
        Top = 19
        Width = 40
        Height = 13
        Alignment = taRightJustify
        Caption = 'Ejercicio'
      end
      object CBEjercicio: TLFComboBox
        Left = 176
        Top = 15
        Width = 73
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnChange = FiltroChange
      end
      object CBPeriodo: TLFComboBox
        Left = 176
        Top = 37
        Width = 99
        Height = 21
        Style = csDropDownList
        DropDownCount = 16
        ItemHeight = 13
        TabOrder = 1
        OnChange = FiltroChange
        Items.Strings = (
          '1'#186' Trimestre'
          '2'#186' Trimestre'
          '3'#186' Trimestre'
          '4'#186' Trimestre'
          'Enero'
          'Febrero'
          'Marzo'
          'Abril'
          'Mayo'
          'Junio'
          'Julio'
          'Agosto'
          'Septiembre'
          'Octubre'
          'Noviembre'
          'Diciembre')
      end
    end
    object PNLDetalle: TLFPanel
      Left = 0
      Top = 113
      Width = 964
      Height = 395
      Align = alClient
      BevelOuter = bvNone
      Caption = 'PNLDetalle'
      TabOrder = 2
      object TBDetalle: TLFToolBar
        Left = 0
        Top = 0
        Width = 964
        Height = 22
        AutoSize = True
        DisabledImages = DMMain.ILMain_In
        EdgeBorders = []
        Flat = True
        HotImages = DMMain.ILMain_Ac
        Images = DMMain.ILMain_Ac
        TabOrder = 0
        Separators = True
        object NavDetalleModelo: THYMNavigator
          Left = 0
          Top = 0
          Width = 220
          Height = 22
          DataSource = DMRModelosHacienda.DSxMod110_Detalle
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          Flat = True
          ParentShowHint = False
          PopupMenu = CEDetallePMEdit
          ShowHint = True
          TabOrder = 0
          ModoDeSeguridad = True
          DelCaption = 'Informaci'#243'n'
          DelMessage = ' '#191' Borra el registro ? '
          EditaControl = DBGDetalleModelo
          InsertaControl = DBGDetalleModelo
          Exclusivo = False
          ControlEdit = CEDetalle
          OrdenAscendente = True
          InsertaUltimo = False
        end
      end
      object DBGDetalleModelo: THYTDBGrid
        Left = 0
        Top = 22
        Width = 964
        Height = 373
        Align = alClient
        Color = clInfoBk
        DataSource = DMRModelosHacienda.DSxMod110_Detalle
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
        ReadOnly = True
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDrawColumnCell = DBGDetalleModeloDrawColumnCell
        OnDblClick = DBGDetalleModeloDblClick
        Insercion = False
        ColumnaInicial = 0
        UsaDicG2K = True
        Changed = False
        Idioma = 'CAS'
        AutoDeseleccionar = True
        PermutaPaneles = False
        CamposAMarcar.Strings = (
          'TIPO_GANADERO')
        CamposChecked.Strings = (
          '1')
        CamposNoChecked.Strings = (
          '0')
        CamposAOrdenarImgs = DMMain.ILOrdGrid
        CampoAOrdenarColor = clInfoBk
        OrdenMultiple = True
        Columns = <
          item
            Expanded = False
            FieldName = 'TIPO'
            Width = 30
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'EJERCICIO'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'SERIE'
            Width = 50
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'RIG'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NUM_FACTURA'
            Width = 150
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'BASE_IRPF'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TITULO_IRPF'
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TIPO_GANADERO'
            Width = 53
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'P_IRPF'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'I_IRPF'
            Width = 90
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'MONEDA'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'FECHA_CON'
            Width = 72
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOMBRE_R_SOCIAL'
            Width = 300
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NIF'
            Width = 120
            Visible = True
          end>
      end
    end
  end
  inherited ALMain: TLFActionList
    Left = 6
    Top = 68
    inherited ARecargar: TAction
      OnExecute = ARecargarExecute
    end
    object AModeloOficial: TAction
      Caption = 'Mod. Oficial'
      Hint = 'Modelo Oficial'
      ImageIndex = 136
      OnExecute = AModeloOficialExecute
    end
    object AInstrucciones: TAction
      Caption = 'Instrucciones'
      Hint = 'Instrucciones'
      ImageIndex = 1
      OnExecute = AInstruccionesExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 4
    Top = 40
  end
  object CEDetalle: TControlEdit
    DataSource = DMRModelosHacienda.DSxMod110_Detalle
    EnlazadoA = CEDetalle
    PanelEdicion = PMain
    Complementario = PMain
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 390
    Top = 56
  end
  object CEDetallePMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 442
    Top = 58
    object CEDetalleMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEDetalleMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEDetalleMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEDetalleMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEDetalleMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CEDetalleMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEDetalleMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CEDetalleMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
      Visible = False
    end
    object CEDetalleMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object CEDetalleMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
      Visible = False
    end
  end
end
