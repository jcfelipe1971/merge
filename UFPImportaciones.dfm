inherited FPImportaciones: TFPImportaciones
  Width = 692
  Height = 628
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Importaciones'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 682
    Height = 575
    inherited TBMain: TLFToolBar
      Width = 678
      inherited EPMain: THYMEditPanel
        Width = 41
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object PCMain: TLFPageControl
      Left = 2
      Top = 28
      Width = 678
      Height = 545
      ActivePage = TSHojaCalculo
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 1
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSHojaCalculo: TTabSheet
        Caption = 'Hoja Calculo'
        object PNLSeleccionFichero: TLFPanel
          Left = 0
          Top = 0
          Width = 670
          Height = 95
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            670
            95)
          object LInformacionHoja: TLFLabel
            Left = 33
            Top = 58
            Width = 96
            Height = 13
            Caption = 'Informacion Fichero:'
          end
          object LSeparadorDecimal: TLFLabel
            Left = 395
            Top = 57
            Width = 90
            Height = 13
            Caption = 'Separador Decimal'
          end
          object EdArchivoImp: TLFEdit
            Left = 5
            Top = 7
            Width = 611
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
            OnChange = EdArchivoImpChange
          end
          object ButtSelArchivo: TButton
            Left = 617
            Top = 7
            Width = 23
            Height = 21
            Hint = 'Seleccionar el archivo con las tarifas a importar'
            Anchors = [akTop, akRight]
            Caption = '...'
            TabOrder = 1
            OnClick = ButtSelArchivoClick
          end
          object CBHojaAImportar: TLFComboBox
            Left = 5
            Top = 29
            Width = 636
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            ItemHeight = 13
            TabOrder = 2
            OnChange = CBHojaAImportarChange
          end
          object BInformacionHoja: TButton
            Left = 5
            Top = 54
            Width = 23
            Height = 21
            Hint = 'Informacion de hoja a importar'
            Caption = 'i'
            TabOrder = 3
          end
          object BImportar: TButton
            Left = 565
            Top = 52
            Width = 75
            Height = 25
            Hint = 'Lee el fichero y previsualiza datos.'
            Anchors = [akTop, akRight]
            Caption = 'Leer Fichero'
            TabOrder = 4
            OnClick = BImportarClick
          end
          object PBProgresoImportacion: TProgressBar
            Left = 0
            Top = 79
            Width = 670
            Height = 16
            Align = alBottom
            Min = 0
            Max = 100
            TabOrder = 5
            Visible = False
          end
          object CBPrimeraFilaTitulos: TLFCheckBox
            Left = 231
            Top = 56
            Width = 157
            Height = 17
            Caption = 'Primera Fila contiene Titulos'
            Checked = True
            State = cbChecked
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 6
            TabStop = True
            Alignment = taLeftJustify
          end
          object ESeparadorDecimal: TLFEdit
            Left = 491
            Top = 54
            Width = 49
            Height = 21
            TabOrder = 7
          end
        end
        object PNLCeldas: TLFPanel
          Left = 0
          Top = 95
          Width = 670
          Height = 422
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object Splitter: TSplitter
            Left = 0
            Top = 236
            Width = 670
            Height = 9
            Cursor = crVSplit
            Align = alBottom
            Color = clMedGray
            ParentColor = False
          end
          object SGDatosImp: TStringGrid
            Left = 0
            Top = 0
            Width = 670
            Height = 236
            Align = alClient
            Color = clInfoBk
            ColCount = 7
            DefaultColWidth = 75
            DefaultRowHeight = 17
            FixedCols = 0
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goColSizing]
            ParentFont = False
            TabOrder = 0
            RowHeights = (
              17
              17
              17
              17
              17)
          end
          object PNLAsociaciones: TLFPanel
            Left = 0
            Top = 245
            Width = 670
            Height = 177
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 1
            OnResize = PNLAsociacionesResize
            object VLETipoColumna: TValueListEditor
              Left = 0
              Top = 0
              Width = 337
              Height = 177
              Align = alLeft
              Strings.Strings = (
                '=')
              TabOrder = 1
              TitleCaptions.Strings = (
                'Columna'
                'Tipo')
              OnValidate = VLETipoColumnaValidate
              ColWidths = (
                181
                150)
            end
            object VLECampoAsociado: TValueListEditor
              Left = 337
              Top = 0
              Width = 333
              Height = 177
              Align = alClient
              Strings.Strings = (
                '=')
              TabOrder = 0
              TitleCaptions.Strings = (
                'Columna'
                'Campo')
              OnValidate = VLECampoAsociadoValidate
              ColWidths = (
                181
                146)
            end
          end
        end
      end
      object TSImportacion2: TTabSheet
        Caption = 'Importacion'
        ImageIndex = 1
        object LProgreso: TLFLabel
          Left = 0
          Top = 257
          Width = 670
          Height = 13
          Align = alTop
          Caption = 'Progreso'
        end
        object PNLImportacion: TLFPanel
          Left = 0
          Top = 0
          Width = 670
          Height = 257
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          DesignSize = (
            670
            257)
          object BBorrarLog: TButton
            Left = 594
            Top = 232
            Width = 75
            Height = 25
            Anchors = [akRight, akBottom]
            Caption = 'Limpia Log'
            TabOrder = 0
            OnClick = BBorrarLogClick
          end
        end
        object PBProgreso: TProgressBar
          Left = 0
          Top = 496
          Width = 670
          Height = 21
          Align = alBottom
          Min = 0
          Max = 100
          TabOrder = 1
          Visible = False
        end
        object MLog: TLFMemo
          Left = 0
          Top = 270
          Width = 670
          Height = 226
          Align = alClient
          TabOrder = 2
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 575
    Width = 682
  end
  inherited CEMain: TControlEdit
    Left = 272
    Top = 8
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 312
    Top = 8
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
    Left = 360
    Top = 8
  end
  inherited FSMain: TLFFibFormStorage
    Left = 400
    Top = 8
  end
end
