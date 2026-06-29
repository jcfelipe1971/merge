object FMInfolotes_Produccion: TFMInfolotes_Produccion
  Left = 231
  Top = 169
  Width = 768
  Height = 479
  Caption = 'L'#237'neas de la Orden de Producci'#243'n'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PopupMenu = CELotesMaterialesPMEdit
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object PMain: TLFPanel
    Left = 0
    Top = 0
    Width = 760
    Height = 452
    Align = alClient
    Locked = True
    TabOrder = 0
    object HYDBGLotes: THYTDBGrid
      Left = 1
      Top = 27
      Width = 758
      Height = 178
      Align = alTop
      Color = clInfoBk
      DataSource = DMOrdenProduccion.DSQMOrdenProd_lotes
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnColEnter = HYDBGLotesColEnter
      OnDblClick = HYDBGLotesDblClick
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
      Idioma = 'CAS'
      AutoDeseleccionar = True
      ControlEdit = CEMain
      PermutaPaneles = False
      CamposAOrdenar.Strings = (
        'ALMACEN'
        'ARTICULO'
        'F_CADUCIDAD'
        'LOTE'
        'N_SERIE')
      CamposAOrdenarImgs = DMMain.ILOrdGrid
      CampoAOrdenarColor = clInfoBk
      OrdenMultiple = True
      Columns = <
        item
          Expanded = False
          FieldName = 'LOTE'
          Width = 48
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'N_SERIE'
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ARTICULO'
          Width = 132
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ALMACEN'
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLASIFICACION'
          Width = 126
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'F_FABRICACION'
          Width = 81
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'F_ENVASADO'
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'F_CADUCIDAD'
          Width = 68
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANTIDAD'
          Width = 60
          Visible = True
        end>
    end
    object TBMain: TLFToolBar
      Left = 1
      Top = 1
      Width = 758
      Height = 26
      EdgeBorders = []
      Flat = True
      HotImages = DMMain.ILMain_Ac
      Images = DMMain.ILMain_Ac
      TabOrder = 1
      Separators = True
      object NavMain: THYMNavigator
        Left = 0
        Top = 0
        Width = 80
        Height = 22
        DataSource = DMOrdenProduccion.DSQMOrdenProd_lotes
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Flat = True
        ParentShowHint = False
        PopupMenu = CEMainPMEdit
        ShowHint = True
        TabOrder = 0
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        Exclusivo = True
        ControlEdit = CEMain
        OrdenAscendente = True
        InsertaUltimo = False
      end
    end
    object PLotesMateriales: TLFPanel
      Left = 1
      Top = 205
      Width = 758
      Height = 26
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object NavLotesMateriales: THYMNavigator
        Left = 0
        Top = 3
        Width = 84
        Height = 22
        DataSource = DMOrdenProduccion.DSxOrdenProdLotesMat
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
        Flat = True
        ParentShowHint = False
        PopupMenu = CELotesMaterialesPMEdit
        ShowHint = True
        TabOrder = 0
        ModoDeSeguridad = True
        DelCaption = 'Informaci'#243'n'
        DelMessage = ' '#191' Borra el registro ? '
        Exclusivo = True
        ControlEdit = CELotesMateriales
        OrdenAscendente = True
        InsertaUltimo = False
      end
    end
    object HYDBGLotesMateriales: THYTDBGrid
      Left = 1
      Top = 231
      Width = 758
      Height = 220
      Align = alClient
      Color = clInfoBk
      DataSource = DMOrdenProduccion.DSxOrdenProdLotesMat
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
      ReadOnly = True
      TabOrder = 3
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      OnColEnter = HYDBGLotesMaterialesColEnter
      Insercion = False
      ColumnaInicial = 0
      UsaDicG2K = True
      Changed = False
      Idioma = 'CAS'
      AutoDeseleccionar = True
      ControlEdit = CEMain
      PermutaPaneles = False
      CamposAOrdenar.Strings = (
        'ALMACEN'
        'ARTICULO'
        'F_CADUCIDAD'
        'LOTE'
        'N_SERIE')
      CamposAOrdenarImgs = DMMain.ILOrdGrid
      CampoAOrdenarColor = clInfoBk
      OrdenMultiple = True
      Columns = <
        item
          Expanded = False
          FieldName = 'LOTE'
          Width = 48
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'SERIE'
          Width = 88
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ARTICULO'
          Width = 132
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'ALMACEN'
          Width = 47
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CLASIFICACION'
          Width = 126
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'F_FABRICACION'
          Width = 81
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'F_ENVASADO'
          Width = 66
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'F_CADUCIDAD'
          Width = 68
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CANTIDAD'
          Width = 60
          Visible = True
        end>
    end
  end
  object CEMain: TControlEdit
    EnlazadoA = CELotesMateriales
    PopUpMenu = CEMainPMEdit
    Teclas = DMMain.Teclas
    Left = 518
    Top = 80
  end
  object CEMainPMEdit: TPopUpTeclas
    Left = 568
    Top = 80
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
      Visible = False
    end
    object CEMainMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CEMainMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CEMainMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
      Visible = False
    end
    object CEMainMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object CEMainMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
      Visible = False
    end
  end
  object CELotesMateriales: TControlEdit
    EnlazadoA = CEMain
    PopUpMenu = CELotesMaterialesPMEdit
    Teclas = DMMain.Teclas
    Left = 536
    Top = 288
  end
  object CELotesMaterialesPMEdit: TPopUpTeclas
    Left = 576
    Top = 288
    object CELotesMaterialesMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CELotesMaterialesMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CELotesMaterialesMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CELotesMaterialesMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CELotesMaterialesMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CELotesMaterialesMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CELotesMaterialesMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
      Visible = False
    end
    object CELotesMaterialesMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
      Visible = False
    end
    object CELotesMaterialesMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
      Visible = False
    end
    object CELotesMaterialesMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
      Visible = False
    end
  end
end
