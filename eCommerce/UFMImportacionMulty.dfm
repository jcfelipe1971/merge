inherited FMImportacionMulty: TFMImportacionMulty
  Width = 754
  Height = 374
  ActiveControl = LBFicheros
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Importacion Ficheros Multy'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 744
    Height = 321
    inherited TBMain: TLFToolBar
      Width = 740
      inherited EPMain: THYMEditPanel
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object TBSep1: TToolButton
        Left = 25
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBBorrarLogs: TToolButton
        Left = 33
        Top = 0
        Action = ABorrarLogs
      end
      object TBReleerCarpetaImportacion: TToolButton
        Left = 56
        Top = 0
        Action = AReleerCarpetaImportacion
      end
    end
    object PNLConfiguracion: TLFPanel
      Left = 2
      Top = 28
      Width = 740
      Height = 93
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      DesignSize = (
        740
        93)
      object LRutaImportacion: TLFLabel
        Left = 21
        Top = 4
        Width = 81
        Height = 13
        Alignment = taRightJustify
        Caption = 'Ruta Importaci'#243'n'
      end
      object LRutaTratados: TLFLabel
        Left = 34
        Top = 26
        Width = 68
        Height = 13
        Alignment = taRightJustify
        Caption = 'Ruta Tratados'
      end
      object LFechaContabilizacionCompras: TLFLabel
        Left = 8
        Top = 47
        Width = 94
        Height = 13
        Alignment = taRightJustify
        Caption = 'Fecha Cont Compra'
      end
      object DERutaImportacion: TDirectoryEdit
        Left = 106
        Top = 1
        Width = 434
        Height = 21
        DialogOptions = [sdAllowCreate]
        NumGlyphs = 1
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 0
        OnChange = DERutaImportacionChange
      end
      object DERutaTratados: TDirectoryEdit
        Left = 106
        Top = 23
        Width = 434
        Height = 21
        DialogOptions = [sdAllowCreate]
        NumGlyphs = 1
        Anchors = [akLeft, akTop, akRight]
        TabOrder = 1
        OnChange = DERutaTratadosChange
      end
      object LBFicheros: TListBox
        Left = 540
        Top = 1
        Width = 199
        Height = 43
        Anchors = [akTop, akRight]
        ItemHeight = 13
        TabOrder = 4
        OnDblClick = LBFicherosDblClick
        OnKeyPress = LBFicherosKeyPress
      end
      object CBCrearCliPro: TLFCheckBox
        Left = 106
        Top = 70
        Width = 434
        Height = 17
        Caption = 'Crear Cliente/Proveedor si no existe'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 3
        TabStop = True
        Anchors = [akLeft, akTop, akRight]
        Alignment = taLeftJustify
      end
      object DEFechaContabilizacionCompras: TLFDateEdit
        Left = 106
        Top = 45
        Width = 121
        Height = 21
        CheckOnExit = True
        NumGlyphs = 2
        TabOrder = 2
      end
    end
    object PNLDatosImportados: TLFPanel
      Left = 2
      Top = 121
      Width = 740
      Height = 198
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 2
      OnResize = PNLDatosImportadosResize
      object Splitter: TSplitter
        Left = 365
        Top = 0
        Width = 7
        Height = 198
        Cursor = crHSplit
        Align = alRight
        Color = clAppWorkSpace
        ParentColor = False
      end
      object PNLLog: TLFPanel
        Left = 0
        Top = 0
        Width = 365
        Height = 198
        Align = alClient
        BevelOuter = bvNone
        Constraints.MinWidth = 350
        TabOrder = 0
        object LRegistro: TLFLabel
          Left = 0
          Top = 0
          Width = 365
          Height = 13
          Align = alTop
          Caption = 'Registro'
        end
        object MLog: TMemo
          Left = 0
          Top = 13
          Width = 365
          Height = 185
          Align = alClient
          Lines.Strings = (
            'MLog')
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
      object PNLErrores: TLFPanel
        Left = 372
        Top = 0
        Width = 368
        Height = 198
        Align = alRight
        BevelOuter = bvNone
        Constraints.MinWidth = 350
        TabOrder = 1
        object LErrores: TLFLabel
          Left = 0
          Top = 0
          Width = 368
          Height = 13
          Align = alTop
          Caption = 'Errores'
        end
        object MErrores: TMemo
          Left = 0
          Top = 13
          Width = 368
          Height = 185
          Align = alClient
          Lines.Strings = (
            'MLog')
          ScrollBars = ssVertical
          TabOrder = 0
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 321
    Width = 744
  end
  inherited CEMain: TControlEdit
    Top = 0
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 320
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
    Left = 376
    Top = 0
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      Hint = 'Procesos'
      ImageIndex = 16
    end
    object AImportarFicheroSelecionado: TAction
      Category = 'Procesos'
      Caption = 'Importar Fichero Selecionado'
      Hint = 'Importar Fichero Selecionado'
      ImageIndex = 49
      OnExecute = AImportarFicheroSelecionadoExecute
    end
    object ABorrarLogs: TAction
      Category = 'Procesos'
      Caption = 'Borrar Logs'
      Hint = 'Borrar Logs'
      ImageIndex = 20
      OnExecute = ABorrarLogsExecute
    end
    object AReleerCarpetaImportacion: TAction
      Category = 'Procesos'
      Caption = 'Releer Carpeta Importacion'
      Hint = 'Releer Carpeta Importacion'
      ImageIndex = 26
      OnExecute = AReleerCarpetaImportacionExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'DERutaImportacion.Text'
      'DERutaTratados.Text'
      'CBCrearCliPro.Checked')
    Top = 0
  end
end
