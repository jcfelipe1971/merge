inherited FMSIIUrlEndpoint: TFMSIIUrlEndpoint
  Height = 307
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'URL Endpoint'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 254
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        DataSource = DMSIIUrlEndpoint.DSQMURLEndPoint
        Hints.Strings = ()
      end
      inherited EPMain: THYMEditPanel
        Width = 29
        DataSource = DMSIIUrlEndpoint.DSQMURLEndPoint
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 257
      end
      inherited TbuttComp: TToolButton
        Left = 265
      end
    end
    inherited PCMain: TLFPageControl
      Height = 224
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Height = 196
          inherited G2KTableLoc: TG2KTBLoc
            Top = 52
          end
          object LTipo: TLFLabel
            Left = 23
            Top = 73
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LUrl: TLFLabel
            Left = 31
            Top = 95
            Width = 13
            Height = 13
            Alignment = taRightJustify
            Caption = 'Url'
          end
          object LPais: TLFLabel
            Left = 24
            Top = 51
            Width = 20
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pais'
          end
          object DBEPais: TLFDbedit
            Left = 48
            Top = 48
            Width = 57
            Height = 21
            Color = clInfoBk
            DataField = 'PAIS'
            DataSource = DMSIIUrlEndpoint.DSQMURLEndPoint
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBETipo: TLFDbedit
            Left = 48
            Top = 70
            Width = 57
            Height = 21
            DataField = 'TIPO'
            DataSource = DMSIIUrlEndpoint.DSQMURLEndPoint
            TabOrder = 1
          end
          object DBEUrl: TLFDbedit
            Left = 48
            Top = 92
            Width = 417
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'URL'
            DataSource = DMSIIUrlEndpoint.DSQMURLEndPoint
            TabOrder = 2
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Height = 196
          DataSource = DMSIIUrlEndpoint.DSQMURLEndPoint
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 32
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'URL'
              Width = 427
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 254
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
