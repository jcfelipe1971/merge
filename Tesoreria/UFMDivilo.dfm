inherited FMDivilo: TFMDivilo
  Left = 679
  Top = 281
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Divilo'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    OnResize = PMainResize
    inherited TBMain: TLFToolBar
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
      end
    end
    object PCMain: TLFPageControl
      Left = 2
      Top = 28
      Width = 498
      Height = 302
      ActivePage = TSImportacion
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 1
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSImportacion: TTabSheet
        Caption = 'Importacion'
        OnShow = TSImportacionShow
        object PNLImportacion: TLFPanel
          Left = 0
          Top = 29
          Width = 490
          Height = 245
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object splImportacion: TSplitter
            Left = 240
            Top = 0
            Width = 8
            Height = 245
            Cursor = crHSplit
            Color = clAppWorkSpace
            ParentColor = False
            OnMoved = splImportacionMoved
          end
          object PNLExcel: TLFPanel
            Left = 0
            Top = 0
            Width = 240
            Height = 245
            Align = alLeft
            BevelOuter = bvNone
            Caption = 'PNLExcel'
            TabOrder = 0
          end
          object PNLDiviloAImportar: TLFPanel
            Left = 248
            Top = 0
            Width = 242
            Height = 245
            Align = alClient
            BevelOuter = bvNone
            Caption = 'PNLDiviloAImportar'
            TabOrder = 1
          end
        end
        object TBImportacion: TLFToolBar
          Left = 0
          Top = 0
          Width = 490
          Height = 29
          DisabledImages = DMMain.ILMain_In
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Separators = True
        end
      end
      object TSPunteo: TTabSheet
        Caption = 'Punteo'
        ImageIndex = 1
        OnShow = TSPunteoShow
        object TBPunteo: TLFToolBar
          Left = 0
          Top = 0
          Width = 490
          Height = 29
          DisabledImages = DMMain.ILMain_In
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Separators = True
        end
        object PNLPunteo: TLFPanel
          Left = 0
          Top = 29
          Width = 490
          Height = 245
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object splPunteo: TSplitter
            Left = 240
            Top = 0
            Width = 8
            Height = 245
            Cursor = crHSplit
            Color = clAppWorkSpace
            ParentColor = False
            OnMoved = splPunteoMoved
          end
          object PNLFacturas: TLFPanel
            Left = 0
            Top = 0
            Width = 240
            Height = 245
            Align = alLeft
            BevelOuter = bvNone
            Caption = 'PNLFacturas'
            TabOrder = 0
          end
          object PNLDivilo: TLFPanel
            Left = 248
            Top = 0
            Width = 242
            Height = 245
            Align = alClient
            BevelOuter = bvNone
            Caption = 'PNLDivilo'
            TabOrder = 1
          end
        end
      end
    end
  end
end
