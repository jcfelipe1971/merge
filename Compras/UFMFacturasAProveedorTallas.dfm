inherited FMFacturasAProveedorTallas: TFMFacturasAProveedorTallas
  Caption = 'Facturas de proveedores'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inline FRTallas_e: TFRTallas_e [0]
    Left = 0
    Top = 273
    Width = 950
    Height = 214
    Align = alClient
    TabOrder = 4
    Visible = False
    inherited PNLDetalleTallas: TLFPanel
      Width = 950
      Height = 214
      inherited DBGFDetalleTallasPrecios: TDBGridFind2000
        Width = 948
        Height = 190
      end
      inherited DBGFDetalleTallas: TDBGridFind2000
        Width = 948
        Height = 190
      end
      inherited TBMain: TLFToolBar
        Width = 948
        inherited NavTallas: THYMNavigator
          Hints.Strings = ()
        end
      end
    end
    inherited CETallas: TControlEdit
      EnlazadoA = CENotas
      OnEnter = FRTallas_eCETallasEnter
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
          inherited NAVOtros: THYMNavigator
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
    end
  end
  inherited PDetalle: TLFPanel [2]
    Top = 273
    Height = 214
    inherited TBDetalle: TLFToolBar
      inherited NavDetalle: THYMNavigator
        Hints.Strings = ()
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Height = 137
    end
    inherited PCPie: TLFPageControl
      Top = 159
    end
  end
  inherited TBActions: TLFToolBar [3]
  end
  object TCTallas: TTabControl [4]
    Left = 0
    Top = 251
    Width = 950
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
  inherited CEMain: TControlEdit [5]
  end
  inherited CEMainPMEdit: TPopUpTeclas [6]
  end
  inherited CENotas: TControlEdit [7]
  end
  inherited CENotasPMEdit: TPopUpTeclas [8]
  end
  inherited ALFacturasProv: TLFActionList [9]
  end
  inherited CEDetalle: TControlEdit [10]
    EnlazadoA = FRTallas_e.CETallas
    OnEnter = CEDetalleEnter
  end
  inherited CEDetallePMEdit: TPopUpTeclas [11]
  end
  inherited ALMain: TLFActionList [12]
  end
  inherited FSMain: TLFFibFormStorage [13]
  end
  inherited RelojNotas: TTimer [14]
  end
  inherited CEOtros: TControlEdit [15]
  end
end
