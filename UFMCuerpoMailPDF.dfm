inherited FMCuerpoMailPDF: TFMCuerpoMailPDF
  Left = 449
  Top = 187
  BorderIcons = []
  Caption = 'Texto del cuerpo del email en curso ...'
  ClientHeight = 573
  ClientWidth = 764
  OldCreateOrder = True
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 764
    Height = 549
    inherited TBMain: TLFToolBar
      Width = 760
      TabOrder = 3
      inherited EPMain: THYMEditPanel
        Width = 25
        VisibleButtons = [neSalir]
        Hints.Strings = ()
        OnClickSalir = EPMainClickSalir
      end
      object TSep1: TToolButton
        Left = 25
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TButSeleccionarTodo: TToolButton
        Left = 33
        Top = 0
        Hint = 'Seleccionar Todo'
        Caption = 'Seleccionar Todo'
        ImageIndex = 146
        OnClick = TButSeleccionarTodoClick
      end
      object TButtDeseleccionarTodo: TToolButton
        Left = 56
        Top = 0
        Hint = 'Deseleccionar Todo'
        Caption = 'Deseleccionar Todo'
        ImageIndex = 147
        OnClick = TButtDeseleccionarTodoClick
      end
    end
    object PnlBotones: TLFPanel
      Left = 2
      Top = 512
      Width = 760
      Height = 35
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 0
      object FBtnAceptar: TFlatButton
        Left = 245
        Top = 5
        Width = 97
        Height = 30
        Color = clMenu
        ColorFocused = clBtnFace
        ColorDown = clBtnFace
        ColorBorder = clGrayText
        ColorShadow = clWhite
        Caption = 'Aceptar'
        Layout = blGlyphLeft
        ParentColor = False
        TabOrder = 0
        OnClick = FBtnAceptarClick
      end
      object FBtnCancelar: TFlatButton
        Left = 429
        Top = 5
        Width = 97
        Height = 30
        Color = clMenu
        ColorFocused = clBtnFace
        ColorDown = clBtnFace
        ColorBorder = clGrayText
        ColorShadow = clWhite
        Caption = 'Salir'
        Layout = blGlyphLeft
        ParentColor = False
        TabOrder = 1
        OnClick = FBtnCancelarClick
      end
    end
    object PnlNotas: TLFPanel
      Left = 2
      Top = 189
      Width = 760
      Height = 323
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 4
      TabOrder = 1
      object LVAdjuntos: TListView
        Left = 4
        Top = 160
        Width = 752
        Height = 159
        Align = alClient
        BorderStyle = bsNone
        Checkboxes = True
        Columns = <
          item
            AutoSize = True
            Caption = 'Adjunto'
          end
          item
            AutoSize = True
            Caption = 'Nombre'
          end
          item
            Caption = 'Tipo'
            Width = 40
          end
          item
            Caption = 'Id Adjunto'
            Width = 0
          end>
        GridLines = True
        MultiSelect = True
        RowSelect = True
        TabOrder = 0
        ViewStyle = vsReport
      end
      object PNLMensaje: TLFPanel
        Left = 4
        Top = 4
        Width = 752
        Height = 156
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        object MmCuerpo: TLFMemo
          Left = 0
          Top = 23
          Width = 752
          Height = 133
          Align = alClient
          BevelInner = bvNone
          BevelOuter = bvNone
          BorderStyle = bsNone
          TabOrder = 0
        end
        object PNLSubject: TLFPanel
          Left = 0
          Top = 0
          Width = 752
          Height = 23
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          DesignSize = (
            752
            23)
          object ESubject: TLFEdit
            Left = 0
            Top = 1
            Width = 750
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            TabOrder = 0
          end
        end
      end
    end
    object PNMail: TLFPanel
      Left = 2
      Top = 28
      Width = 760
      Height = 161
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object LBLMail: TLFLabel
        Left = 6
        Top = 9
        Width = 91
        Height = 13
        Alignment = taRightJustify
        Caption = 'Direcci'#243'n de env'#237'o'
      end
      object LFCBMail: TLFComboBox
        Left = 101
        Top = 5
        Width = 335
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
      end
      object CBEnvioTodasDirecciones: TLFCheckBox
        Left = 452
        Top = 8
        Width = 93
        Height = 17
        Caption = 'Enviar a todas'
        ClicksDisabled = False
        ColorCheck = 57088
        TabOrder = 1
        TabStop = True
        Alignment = taLeftJustify
      end
      object LVDirecciones: TListView
        Left = 0
        Top = 0
        Width = 760
        Height = 161
        Align = alClient
        BorderStyle = bsNone
        Checkboxes = True
        Columns = <
          item
            AutoSize = True
            Caption = 'Nombre'
          end
          item
            Alignment = taCenter
            Caption = 'FIC'
            Width = 35
          end
          item
            Alignment = taCenter
            Caption = 'FAC'
            Width = 35
          end
          item
            Alignment = taCenter
            Caption = 'ALB'
            Width = 35
          end
          item
            Alignment = taCenter
            Caption = 'PEC'
            Width = 35
          end
          item
            Alignment = taCenter
            Caption = 'OFC'
            Width = 35
          end
          item
            Alignment = taCenter
            Caption = 'FCR'
            Width = 35
          end
          item
            Alignment = taCenter
            Caption = 'FAP'
            Width = 35
          end
          item
            Alignment = taCenter
            Caption = 'ALP'
            Width = 35
          end
          item
            Alignment = taCenter
            Caption = 'PEP'
            Width = 35
          end
          item
            Alignment = taCenter
            Caption = 'OFP'
            Width = 35
          end
          item
            Alignment = taCenter
            Caption = 'OCP'
            Width = 35
          end>
        GridLines = True
        MultiSelect = True
        RowSelect = True
        TabOrder = 2
        ViewStyle = vsReport
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 549
    Width = 764
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
end
