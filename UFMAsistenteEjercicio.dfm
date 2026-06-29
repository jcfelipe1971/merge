object FMAsistenteEjercicio: TFMAsistenteEjercicio
  Left = 437
  Top = 479
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Asistente de Creaci'#243'n de Nuevo Ejercicio'
  ClientHeight = 349
  ClientWidth = 592
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object TVMain: TTreeView
    Left = 0
    Top = 0
    Width = 121
    Height = 308
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
    TabOrder = 0
    OnChange = TVMainChange
    OnCollapsed = TVMainCollapsed
    Items.Data = {
      01000000280000000000000000000000FFFFFFFFFFFFFFFF0000000004000000
      0F4E7565766F20456A6572636963696F270000000000000000000000FFFFFFFF
      FFFFFFFF00000000000000000E53656C65636369F36E204D6F646F2C00000000
      00000000000000FFFFFFFFFFFFFFFF00000000000000001353656C65636369F3
      6E20456A6572636963696F220000000000000000000000FFFFFFFFFFFFFFFF00
      0000000000000009547261737061736F732B0000000000000000000000FFFFFF
      FFFFFFFFFF000000000000000012437265616369F36E20456A6572636963696F}
  end
  object PNLBotones: TLFPanel
    Left = 0
    Top = 308
    Width = 592
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object ButtNext: TButton
      Left = 508
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Siguiente'
      TabOrder = 0
      OnClick = ButtNextClick
    end
    object ButtCancel: TButton
      Left = 26
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Cancelar'
      TabOrder = 1
      OnClick = ButtCancelClick
    end
    object ButtAnt: TButton
      Left = 428
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Anterior'
      TabOrder = 2
      OnClick = ButtAntClick
    end
  end
  object PCMain: TLFPageControl
    Left = 121
    Top = 0
    Width = 471
    Height = 308
    ActivePage = TSSeleccion
    Align = alClient
    OwnerDraw = True
    Style = tsFlatButtons
    TabOrder = 2
    TabActiveColor = clWhite
    TabInactiveColor = 14936298
    object TSSeleccion: TTabSheet
      TabVisible = False
      object LSeleccionModo: TLFLabel
        Left = 0
        Top = 0
        Width = 463
        Height = 32
        Align = alTop
        Alignment = taCenter
        Caption = 'Selecci'#243'n Modo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RGEjercicio: TRadioGroup
        Left = 72
        Top = 70
        Width = 330
        Height = 110
        Caption = 'Seleccione opci'#243'n:'
        Items.Strings = (
          'Ejercicio Siguiente'
          'Ejercicio Espec'#237'fico')
        TabOrder = 0
      end
    end
    object TSSeleccionEjercicio: TTabSheet
      ImageIndex = 1
      TabVisible = False
      object LSeleccionEjercicio: TLFLabel
        Left = 0
        Top = 0
        Width = 251
        Height = 32
        Align = alTop
        Alignment = taCenter
        Caption = 'Selecci'#243'n Ejercicio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object GBEjercicio: TGroupBox
        Left = 72
        Top = 70
        Width = 330
        Height = 110
        Caption = 'Seleccione Ejercicio a crear :'
        TabOrder = 0
        object LEjercicio: TLFLabel
          Left = 99
          Top = 51
          Width = 40
          Height = 13
          Alignment = taRightJustify
          Caption = 'Ejercicio'
        end
        object UPEjercicio: TUpDown
          Left = 196
          Top = 47
          Width = 16
          Height = 21
          Associate = LFEDEjercicio
          Min = 1990
          Max = 2200
          Position = 1990
          TabOrder = 0
          Thousands = False
          Wrap = False
        end
        object LFEDEjercicio: TLFEdit
          Left = 143
          Top = 47
          Width = 53
          Height = 21
          BiDiMode = bdLeftToRight
          Color = clInfoBk
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentBiDiMode = False
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
          Text = '1990'
        end
      end
    end
    object TSTraspasos: TTabSheet
      ImageIndex = 2
      TabVisible = False
      object LTraspasos: TLFLabel
        Left = 0
        Top = 0
        Width = 463
        Height = 32
        Align = alTop
        Alignment = taCenter
        Caption = 'Traspasos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RGTraspasos: TRadioGroup
        Left = 72
        Top = 70
        Width = 330
        Height = 110
        Caption = 'Seleccione modo:'
        Items.Strings = (
          'Realizar todos los traspasos autom'#225'ticamente'
          'No realizar los traspasos en este momento')
        TabOrder = 0
        OnClick = RGTraspasosClick
      end
      object CBContAnalitica: TLFCheckBox
        Left = 107
        Top = 117
        Width = 278
        Height = 17
        Caption = 'Traspasar toda la contabilidad anal'#237'tica'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 1
        TabStop = True
        Alignment = taLeftJustify
      end
    end
    object TSCreacion: TTabSheet
      ImageIndex = 3
      TabVisible = False
      object LCreacionNuevoEjercicio: TLFLabel
        Left = 0
        Top = 0
        Width = 463
        Height = 32
        Align = alTop
        Alignment = taCenter
        Caption = 'Creaci'#243'n Nuevo Ejercicio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object ButtCrear: TButton
        Left = 192
        Top = 170
        Width = 75
        Height = 25
        Caption = 'Crear'
        TabOrder = 0
        OnClick = ButtCrearClick
      end
      object GBInformacion: TGroupBox
        Left = 0
        Top = 233
        Width = 463
        Height = 65
        Align = alBottom
        Caption = 'Informaci'#243'n del proceso:'
        TabOrder = 1
        object LBLInformacion: TLFLabel
          Left = 24
          Top = 29
          Width = 3
          Height = 13
        end
        object ANITempo: TAnimate
          Left = 323
          Top = 28
          Width = 16
          Height = 16
          Active = False
          CommonAVI = aviFindComputer
          StopFrame = 8
          Visible = False
        end
      end
      object MEMInfo: TLFMemo
        Left = 40
        Top = 43
        Width = 393
        Height = 125
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
            'ra '
          'la creaci'#243'n de una nuevo ejercicio.'
          ''
          
            '[] Si desea modificar alguno, acceda a la pesta'#241'a correspondient' +
            'e '
          'para su modificaci'#243'n.'
          ''
          
            '[] Si por el contrario los datos son correctos, pulse el siguien' +
            'te '
          'bot'#243'n para comenzar el proceso.')
        ParentFont = False
        TabOrder = 2
      end
    end
  end
end
