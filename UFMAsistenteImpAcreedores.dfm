inherited FMAsistenteImpAcreedores: TFMAsistenteImpAcreedores
  Left = 250
  Top = 158
  Width = 867
  Height = 618
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Asistente para Importar Acreedores'
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 857
    Height = 565
    TabOrder = 1
    inherited TBMain: TLFToolBar
      Width = 853
      TabOrder = 2
      inherited EPMain: THYMEditPanel
        Width = 33
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object PCMain: TLFPageControl
      Left = 131
      Top = 28
      Width = 724
      Height = 494
      ActivePage = TSImportar
      Align = alClient
      OwnerDraw = True
      Style = tsFlatButtons
      TabOrder = 0
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSSeleccionArchivo: TTabSheet
        TabVisible = False
        OnShow = TSSeleccionArchivoShow
        object LBLSeleccionarArticulo: TLFLabel
          Left = 0
          Top = 0
          Width = 716
          Height = 32
          Align = alTop
          Alignment = taCenter
          Caption = 'Selecci'#243'n de Archivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object GBArchivo: TGroupBox
          Left = 0
          Top = 32
          Width = 716
          Height = 452
          Align = alClient
          Caption = 'Seleccione el archivo del que se importar'#225'n los proveedores:'
          TabOrder = 0
          DesignSize = (
            716
            452)
          object LInformacionHoja: TLFLabel
            Left = 60
            Top = 100
            Width = 96
            Height = 13
            Caption = 'Informacion Fichero:'
          end
          object EdArchivoImp: TLFEdit
            Left = 12
            Top = 48
            Width = 663
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            OnChange = EdArchivoImpChange
          end
          object ButtSelArchivo: TButton
            Left = 682
            Top = 48
            Width = 23
            Height = 21
            Hint = 'Seleccionar el archivo con las tarifas a importar'
            Anchors = [akTop, akRight]
            Caption = '...'
            TabOrder = 1
            OnClick = ButtSelArchivoClick
          end
          object BInformacionHoja: TButton
            Left = 26
            Top = 96
            Width = 23
            Height = 21
            Hint = 'Informacion de hoja a importar'
            Caption = 'i'
            TabOrder = 2
          end
          object CBHojaAImportar: TLFComboBox
            Left = 12
            Top = 70
            Width = 663
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            ItemHeight = 13
            TabOrder = 3
            OnChange = CBHojaAImportarChange
          end
          object ProgresoImportacion: TProgressBar
            Left = 2
            Top = 434
            Width = 712
            Height = 16
            Align = alBottom
            Min = 0
            Max = 100
            TabOrder = 4
          end
        end
      end
      object TSAsociarColumnas: TTabSheet
        ImageIndex = 1
        TabVisible = False
        object LBLAsociarColumnas: TLFLabel
          Left = 0
          Top = 0
          Width = 716
          Height = 32
          Align = alTop
          Alignment = taCenter
          Caption = 'Asociar Columnas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object GBAsociarColumnas: TGroupBox
          Left = 0
          Top = 32
          Width = 716
          Height = 452
          Align = alClient
          Caption = ' Asociar los datos a importar con la aplicacion '
          TabOrder = 0
          object Splitter: TSplitter
            Left = 2
            Top = 273
            Width = 712
            Height = 10
            Cursor = crVSplit
            Align = alBottom
            Color = clMedGray
            ParentColor = False
          end
          object SGDatosImp: TStringGrid
            Left = 2
            Top = 15
            Width = 712
            Height = 258
            Align = alClient
            Color = clInfoBk
            ColCount = 7
            DefaultColWidth = 75
            DefaultRowHeight = 17
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing]
            ParentFont = False
            PopupMenu = PMCamposDisponibles
            TabOrder = 0
            OnDrawCell = SGDatosImpDrawCell
            RowHeights = (
              17
              17
              17
              17
              17)
          end
          object PNLAsosciarColumnas: TLFPanel
            Left = 2
            Top = 283
            Width = 712
            Height = 167
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            object PNLArticulo: TLFPanel
              Left = 0
              Top = 0
              Width = 712
              Height = 167
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 0
              object VLEValoresConstantes: TValueListEditor
                Left = 0
                Top = 25
                Width = 712
                Height = 142
                Align = alClient
                TabOrder = 0
                TitleCaptions.Strings = (
                  'Campo'
                  'Valor')
                OnExit = VLEValoresConstantesExit
                ColWidths = (
                  185
                  521)
              end
              object PNLTitulos: TLFPanel
                Left = 0
                Top = 0
                Width = 712
                Height = 25
                Align = alTop
                TabOrder = 1
                object LSeparadorDecimal: TLFLabel
                  Left = 248
                  Top = 6
                  Width = 90
                  Height = 13
                  Caption = 'Separador Decimal'
                end
                object LFCBPrimeraFilaTitulos: TLFCheckBox
                  Left = 4
                  Top = 4
                  Width = 200
                  Height = 17
                  Caption = 'Primera Fila contiene Titulos'
                  ClicksDisabled = False
                  ColorCheck = 57088
                  TabOrder = 0
                  TabStop = True
                  Alignment = taLeftJustify
                  OnChange = LFCBPrimeraFilaTitulosChange
                end
                object ESeparadorDecimal: TLFEdit
                  Left = 344
                  Top = 1
                  Width = 49
                  Height = 21
                  TabOrder = 1
                  OnChange = ESeparadorDecimalChange
                end
              end
            end
          end
        end
      end
      object TSImportar: TTabSheet
        ImageIndex = 3
        TabVisible = False
        OnShow = TSImportarShow
        object LImportarAcreedores: TLFLabel
          Left = 0
          Top = 0
          Width = 716
          Height = 32
          Hint = 'LBLImportar'
          Align = alTop
          Alignment = taCenter
          Caption = 'Importar Acreedores'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object GBInfo: TGroupBox
          Left = 0
          Top = 181
          Width = 716
          Height = 303
          Align = alClient
          Caption = ' Informaci'#243'n del proceso '
          TabOrder = 0
          object MEMInfoProc: TLFMemo
            Left = 2
            Top = 31
            Width = 712
            Height = 270
            Align = alClient
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 0
          end
          object PProgresoImportacion: TProgressBar
            Left = 2
            Top = 15
            Width = 712
            Height = 16
            Align = alTop
            Min = 0
            Max = 100
            TabOrder = 1
          end
        end
        object PNLImportar: TLFPanel
          Left = 0
          Top = 32
          Width = 716
          Height = 149
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          DesignSize = (
            716
            149)
          object LUltimaFilaImportada: TLFLabel
            Left = 328
            Top = 120
            Width = 98
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ultima Fila Importada'
          end
          object MEMInfo: TLFMemo
            Left = 0
            Top = 0
            Width = 716
            Height = 113
            Align = alTop
            BevelInner = bvNone
            BevelOuter = bvNone
            BorderStyle = bsNone
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              
                '[] Ha rellenado correctamente todos los par'#225'metros necesarios pa' +
                'ra la creaci'#243'n de una nuevo '
              'proveedor.'
              ''
              
                '[] Si desea modificar alguno, acceda a la pesta'#241'a correspondient' +
                'e para su modificaci'#243'n.'
              ''
              
                '[] Si por el contrario los datos son correctos, pulse el siguien' +
                'te bot'#243'n para comenzar el proceso.')
            ParentFont = False
            TabOrder = 0
          end
          object ButtCrear: TButton
            Left = 232
            Top = 115
            Width = 75
            Height = 25
            Anchors = [akLeft, akBottom]
            Caption = 'Crear'
            TabOrder = 1
            OnClick = ButtCrearClick
          end
          object EUltimaFilaImportada: TLFEdit
            Left = 432
            Top = 117
            Width = 65
            Height = 21
            TabOrder = 2
            Text = '0'
          end
          object BContinuar: TButton
            Left = 504
            Top = 115
            Width = 75
            Height = 25
            Anchors = [akLeft, akBottom]
            Caption = 'Seguir'
            TabOrder = 3
            OnClick = BContinuarClick
          end
        end
      end
    end
    object PNLBotones: TLFPanel
      Left = 2
      Top = 522
      Width = 853
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object ButtNext: TButton
        Left = 638
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Siguiente'
        TabOrder = 0
        OnClick = ButtNextClick
      end
      object ButtAnt: TButton
        Left = 470
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Anterior'
        TabOrder = 1
        OnClick = ButtAntClick
      end
      object ButtCancel: TButton
        Left = 28
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Cancelar'
        TabOrder = 2
        OnClick = ButtCancelClick
      end
      object ButtCerrar: TButton
        Left = 638
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Cerrar'
        TabOrder = 3
        Visible = False
        OnClick = ButtCerrarClick
      end
    end
    object TVMain: TTreeView
      Left = 2
      Top = 28
      Width = 129
      Height = 494
      Align = alLeft
      AutoExpand = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      HideSelection = False
      Indent = 19
      ParentFont = False
      ParentShowHint = False
      ReadOnly = True
      ShowHint = False
      ShowRoot = False
      TabOrder = 3
      OnChange = TVMainChange
      OnCollapsed = TVMainCollapsed
      Items.Data = {
        010000002A0000000000000000000000FFFFFFFFFFFFFFFF0000000003000000
        11496D706F7274617220436C69656E7465732C0000000000000000000000FFFF
        FFFFFFFFFFFF00000000000000001353656C656363696F6E6172206172636869
        766F290000000000000000000000FFFFFFFFFFFFFFFF00000000000000001041
        736F6369617220636F6C756D6E6173210000000000000000000000FFFFFFFFFF
        FFFFFF000000000000000008496D706F72746172}
    end
  end
  inherited TBActions: TLFToolBar
    Top = 565
    Width = 857
    TabOrder = 0
  end
  inherited CEMainPMEdit: TPopUpTeclas
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
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'ESeparadorDecimal.Text')
  end
  object PMCamposDisponibles: TPopupMenu
    AutoHotkeys = maManual
    AutoLineReduction = maManual
    Left = 152
    Top = 8
    object MINoImportar: TMenuItem
      Caption = 'No Importar'
      OnClick = PMCamposDisponiblesClick
    end
  end
end
