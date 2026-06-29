inherited FMEstructura: TFMEstructura
  Left = 435
  Top = 223
  HelpContext = 246
  Caption = 'Estructura contable'
  ClientHeight = 371
  ClientWidth = 472
  OldCreateOrder = True
  Position = poDefault
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 472
    Height = 347
    Hint = 'Niveles de contabilidad'
    inherited TBMain: TLFToolBar
      Width = 468
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      inherited EPMain: THYMEditPanel
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object TButtSep1: TToolButton
        Left = 25
        Top = 0
        Width = 8
        ImageIndex = 21
        Style = tbsSeparator
      end
      object TButtGraba: TToolButton
        Left = 33
        Top = 0
        Hint = 'Graba los niveles contables en la base de datos'
        Caption = 'Graba'
        ImageIndex = 41
        OnClick = TButtGrabaClick
      end
      object TButtBajaNiveles: TToolButton
        Left = 56
        Top = 0
        Hint = 'Elimina los niveles contables en la base de datos'
        Caption = 'Baja Niveles'
        ImageIndex = 29
        OnClick = TButtBajaNivelesClick
      end
      object TButtSep4: TToolButton
        Left = 79
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtGeneraContabilidad: TToolButton
        Left = 87
        Top = 0
        Hint = 'Genera la contabilidad en base a la estructura '
        Caption = 'Genera Contabilidad'
        ImageIndex = 19
        OnClick = TButtGeneraContabilidadClick
      end
      object TButtCancela: TToolButton
        Left = 110
        Top = 0
        Hint = 'Elimina las cuentas contables ( si es posible )'
        Caption = 'Cancela'
        ImageIndex = 27
        OnClick = TButtCancelaClick
      end
      object TButtSep2: TToolButton
        Left = 133
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtRegeneraGes: TToolButton
        Left = 141
        Top = 0
        Hint = 'Regenerar las cuentas de gesti'#243'n'
        Caption = 'Regenera CuentasGes'
        ImageIndex = 26
        OnClick = TButtRegeneraGesClick
      end
      object TButtSep3: TToolButton
        Left = 164
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButtPropaga: TToolButton
        Left = 172
        Top = 0
        Hint = 
          'Propaga estructura+cuentas a todos los canales de la misma Empre' +
          'sa-Ejercicio'
        Caption = 'Propaga'
        ImageIndex = 86
        OnClick = TButtPropagaClick
      end
      object TButtTraspasaUno: TToolButton
        Left = 195
        Top = 0
        Hint = 'Traspasa la estructura contable a un canal determinado'
        Caption = 'Traspasa Uno'
        ImageIndex = 35
        Visible = False
        OnClick = TButtTraspasaUnoClick
      end
      object TButtCancelaTodos: TToolButton
        Left = 218
        Top = 0
        Hint = 'Cancela la estructura en todos los canales sin saldo'
        Caption = 'Cancela Todos'
        ImageIndex = 20
        OnClick = TButtCancelaTodosClick
      end
      object LBLEditable: TLFLabel
        Left = 241
        Top = 0
        Width = 3
        Height = 22
        Layout = tlCenter
      end
    end
    object PNLEdicion: TLFPanel
      Left = 2
      Top = 28
      Width = 468
      Height = 317
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object PNLNiveles: TLFPanel
        Left = 0
        Top = 36
        Width = 217
        Height = 262
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object LBLNiveles: TLFLabel
          Left = 27
          Top = 59
          Width = 79
          Height = 13
          Alignment = taRightJustify
          Caption = 'Niveles Actuales'
        end
        object LBLDigitos: TLFLabel
          Left = 72
          Top = 79
          Width = 34
          Height = 13
          Alignment = taRightJustify
          Caption = 'D'#237'gitos'
        end
        object EDTNiveles: TLFEdit
          Left = 111
          Top = 55
          Width = 34
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object ANITempo: TAnimate
          Left = 80
          Top = 124
          Width = 57
          Height = 61
          Active = False
          CommonAVI = aviFindComputer
          StopFrame = 8
          Visible = False
        end
        object SEDigitos: TSpinEdit
          Left = 111
          Top = 76
          Width = 57
          Height = 22
          EditorEnabled = False
          MaxValue = 8
          MinValue = 0
          TabOrder = 2
          Value = 1
        end
      end
      object PNLVisualizacion: TLFPanel
        Left = 217
        Top = 36
        Width = 251
        Height = 262
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object SGNiveles: TStringGrid
          Left = 0
          Top = 0
          Width = 251
          Height = 262
          Align = alClient
          BorderStyle = bsNone
          ColCount = 3
          Ctl3D = False
          DefaultColWidth = 75
          DefaultRowHeight = 18
          DragKind = dkDock
          Enabled = False
          FixedColor = clSilver
          FixedCols = 2
          RowCount = 15
          FixedRows = 4
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goRowSelect]
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          RowHeights = (
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18
            18)
        end
      end
      object StatBarMain: TStatusBar
        Left = 0
        Top = 298
        Width = 468
        Height = 19
        Panels = <
          item
            Bevel = pbNone
            Width = 320
          end>
        SimplePanel = False
      end
      object TRKBNiveles: TTrackBar
        Left = 0
        Top = 0
        Width = 468
        Height = 36
        Align = alTop
        LineSize = 2
        Max = 15
        Min = 1
        Orientation = trHorizontal
        ParentShowHint = False
        PageSize = 1
        Frequency = 1
        Position = 4
        SelEnd = 15
        SelStart = 4
        ShowHint = True
        TabOrder = 3
        TickMarks = tmBottomRight
        TickStyle = tsAuto
        OnChange = TRKBNivelesChange
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 347
    Width = 472
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
    Left = 385
    Top = 2
  end
end
