inherited FMPedidosAProveedorTallas: TFMPedidosAProveedorTallas
  Left = 313
  Top = 144
  Caption = 'Pedidos a proveedor'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inline FRTallas_e: TFRTallas_e [0]
    Left = 0
    Top = 273
    Width = 950
    Height = 214
    Align = alClient
    TabOrder = 2
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
        IniStorage = FSMain
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
    TabOrder = 4
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
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 776
          Height = 205
        end
      end
      inherited TSNotas: TTabSheet
        inherited PCabNotas: TLFPanel
          inherited NavNotas: THYMNavigator
            Hints.Strings = ()
          end
        end
      end
    end
  end
  object TCTallas: TTabControl [2]
    Left = 0
    Top = 251
    Width = 950
    Height = 22
    Align = alTop
    MultiLine = True
    TabOrder = 1
    Tabs.Strings = (
      'Normal'
      'Tallas')
    TabIndex = 0
    OnChange = TCTallasChange
  end
  inherited PDetalle: TLFPanel [4]
    Top = 273
    Height = 214
    TabOrder = 3
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
  inherited CEDetalle: TControlEdit [5]
    EnlazadoA = FRTallas_e.CETallas
    OnEnter = CEDetalleEnter
  end
  inherited CEDetallePMEdit: TPopUpTeclas [6]
  end
  inherited CENotas: TControlEdit [7]
  end
  inherited ALMain: TLFActionList [8]
  end
  inherited CEMainPMEdit: TPopUpTeclas [9]
  end
  inherited CEMain: TControlEdit [10]
  end
  inherited FSMain: TLFFibFormStorage [12]
  end
  inherited ALPedidos: TLFActionList [13]
    Left = 527
  end
  inherited RelojNotas: TTimer [14]
  end
  inherited CEOtros: TControlEdit [15]
  end
end
