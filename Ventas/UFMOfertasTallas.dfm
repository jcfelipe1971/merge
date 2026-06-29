inherited FMOfertasTallas: TFMOfertasTallas
  Left = 330
  Top = 141
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inline FRTallas_s: TFRTallas_s [0]
    Left = 0
    Top = 279
    Width = 1224
    Height = 268
    Align = alClient
    TabOrder = 4
    Visible = False
    inherited PNLDetalleTallas: TLFPanel
      Width = 1224
      Height = 268
      inherited DBGFDetalleTallasPrecios: TDBGridFind2000
        Width = 1222
        Height = 244
      end
      inherited DBGFDetalleTallas: TDBGridFind2000
        Width = 1222
        Height = 244
        IniStorage = FSMain
      end
      inherited TBMain: TLFToolBar
        Width = 1222
        inherited NavTallas: THYMNavigator
          Hints.Strings = ()
        end
      end
    end
    inherited CETallas: TControlEdit
      EnlazadoA = CENotas
      OnEnter = FRTallas_sCETallasEnter
    end
  end
  inherited PDetalle: TLFPanel
    Top = 279
    Height = 268
    inherited DBGFDetalle: TDBGridFind2000 [0]
      Height = 169
    end
    inherited TBDetalle: TLFToolBar [1]
      inherited NavDetalle: THYMNavigator
        Hints.Strings = ()
      end
    end
    inherited PCPie: TLFPageControl
      Top = 213
      inherited TSPieRetCom: TTabSheet
        inherited PPieRetenciones: TLFPanel
          Width = 794
        end
      end
    end
  end
  inherited PMain: TLFPanel [2]
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        Hints.Strings = ()
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
      end
    end
    inherited PCMain: TLFPageControl
      inherited TSOtros: TTabSheet
        inherited PNLCabOtros: TLFPanel
          inherited NavOtros: THYMNavigator
            Hints.Strings = ()
          end
        end
      end
      inherited TSNotas: TTabSheet
        inherited PCabNotas: TLFPanel
          inherited NavNotas: THYMNavigator
            Hints.Strings = ()
          end
        end
      end
      inherited TSDirManual: TTabSheet
        inherited PNLDirManual: TLFPanel
          inherited NavDirEntrega: THYMNavigator
            Hints.Strings = ()
          end
        end
      end
    end
  end
  object TCTallas: TTabControl [3]
    Left = 0
    Top = 257
    Width = 1224
    Height = 22
    Align = alTop
    MultiLine = True
    TabOrder = 3
    Tabs.Strings = (
      'Normal'
      'Tallas')
    TabIndex = 0
    OnChange = TCTallasChange
  end
  inherited TBActions: TLFToolBar [4]
  end
  inherited CEDetalle: TControlEdit [5]
    EnlazadoA = FRTallas_s.CETallas
    OnEnter = CEDetalleEnter
  end
  inherited CEDetallePMEdit: TPopUpTeclas [6]
  end
  inherited ALMain: TLFActionList [7]
  end
  inherited CEMainPMEdit: TPopUpTeclas [8]
  end
  inherited CEMain: TControlEdit [9]
  end
  inherited FSMain: TLFFibFormStorage [12]
  end
  inherited ALOfertas: TLFActionList [13]
  end
  inherited RelojNotas: TTimer [14]
  end
  inherited PMImprimeOfertasE: TPopupMenu [15]
  end
  inherited PMPartidas: TPopupMenu [16]
  end
  inherited PMTraspaso: TPopupMenu [17]
  end
  inherited CEOtros: TControlEdit [18]
  end
  inherited CEOtrosPMEdit: TPopUpTeclas [19]
  end
  inherited RelojAdjuntos: TTimer [20]
  end
  inherited CEDirEntrega: TControlEdit [21]
  end
  inherited CEDirEntregaPMEdit: TPopUpTeclas [22]
  end
end
