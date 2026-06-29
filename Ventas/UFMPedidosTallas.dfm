inherited FMPedidosTallas: TFMPedidosTallas
  Top = 107
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inline FRTallas_s: TFRTallas_s [0]
    Left = 0
    Top = 303
    Width = 1278
    Height = 270
    Align = alClient
    TabOrder = 4
    Visible = False
    inherited PNLDetalleTallas: TLFPanel
      Width = 1278
      Height = 270
      inherited DBGFDetalleTallasPrecios: TDBGridFind2000
        Width = 1276
        Height = 246
      end
      inherited DBGFDetalleTallas: TDBGridFind2000
        Width = 1276
        Height = 246
        IniStorage = FSMain
      end
      inherited TBMain: TLFToolBar
        Width = 1276
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
  inherited PMain: TLFPanel [1]
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
        inherited PNLCabNotas: TLFPanel
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
  object TCTallas: TTabControl [2]
    Left = 0
    Top = 281
    Width = 1278
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
  inherited PDetalle: TLFPanel [4]
    Top = 303
    Height = 270
    inherited TBDetalle: TLFToolBar
      inherited NavDetalle: THYMNavigator
        Hints.Strings = ()
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Height = 170
    end
    inherited PCPie: TLFPageControl
      Top = 215
    end
  end
  inherited CEMain: TControlEdit [5]
  end
  inherited CEMainPMEdit: TPopUpTeclas [6]
  end
  inherited CENotas: TControlEdit [7]
  end
  inherited CENotasPMEdit: TPopUpTeclas [8]
  end
  inherited ALPedidos: TLFActionList [9]
  end
  inherited CEDetalle: TControlEdit [10]
    EnlazadoA = FRTallas_s.CETallas
    OnEnter = CEDetalleEnter
  end
  inherited CEDetallePMEdit: TPopUpTeclas [11]
  end
  inherited FSMain: TLFFibFormStorage [12]
  end
  inherited ALMain: TLFActionList [14]
  end
  inherited CodBarras: TCodeBar [15]
  end
  inherited PMSeleccEsc: TPopupMenu [16]
  end
  inherited PMTraspaso: TPopupMenu [17]
  end
  inherited CEOtros: TControlEdit [18]
  end
  inherited CEOtrosPMEdit: TPopUpTeclas [19]
  end
  inherited RelojAdjuntos: TTimer [20]
  end
  inherited RelojEmail: TTimer [21]
  end
  inherited CEDirEntrega: TControlEdit [22]
  end
  inherited CEDirEntregaPMEdit: TPopUpTeclas [23]
  end
end
