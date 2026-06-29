inherited FMAlbaranesTallas: TFMAlbaranesTallas
  Left = 249
  Top = 213
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inline FRTallas_s: TFRTallas_s [0]
    Left = 0
    Top = 279
    Width = 1178
    Height = 268
    Align = alClient
    TabOrder = 4
    Visible = False
    inherited PNLDetalleTallas: TLFPanel
      Width = 1178
      Height = 268
      inherited DBGFDetalleTallasPrecios: TDBGridFind2000
        Width = 1176
        Height = 244
      end
      inherited DBGFDetalleTallas: TDBGridFind2000
        Width = 1176
        Height = 244
        IniStorage = FSMain
      end
      inherited TBMain: TLFToolBar
        Width = 1176
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
      inherited TSCartaPorte: TTabSheet
        inherited TBCartaPorte: TLFToolBar
          inherited NavCartaPortes: THYMNavigator
            Hints.Strings = ()
          end
        end
        inherited PNLCartaPorte: TLFPanel
          inherited PNLMatNat: TLFPanel
            inherited PNLMatricula: TLFPanel
              inherited TBMat: TLFToolBar
                inherited NavMat: THYMNavigator
                  Hints.Strings = ()
                end
              end
            end
            inherited PNLNaturaleza: TLFPanel
              inherited TBNat: TLFToolBar
                inherited NavNat: THYMNavigator
                  Hints.Strings = ()
                end
              end
            end
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
      inherited TSOtrosChile: TTabSheet
        inherited PEdOtrosChile: TLFPanel
          inherited GBReferencia: TGroupBox
            inherited PNLReferenciasDteCab: TLFPanel
              inherited NavReferenciasDte: THYMNavigator
                Hints.Strings = ()
              end
            end
          end
        end
        inherited PNLDteCab: TLFPanel
          inherited NavOtrosChile: THYMNavigator
            Hints.Strings = ()
          end
        end
      end
    end
  end
  object TCTallas: TTabControl [2]
    Left = 0
    Top = 257
    Width = 1178
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
    Top = 279
    Height = 268
    inherited TBDetalle: TLFToolBar
      inherited NavDetalle: THYMNavigator
        Hints.Strings = ()
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Height = 191
    end
    inherited PCPie: TLFPageControl
      Top = 213
    end
  end
  inherited CEDetalle: TControlEdit [5]
    EnlazadoA = FRTallas_s.CETallas
    OnEnter = CEDetalleEnter
  end
  inherited CEMain: TControlEdit [6]
  end
  inherited CEMainPMEdit: TPopUpTeclas [7]
  end
  inherited ALMain: TLFActionList [8]
  end
  inherited FSMain: TLFFibFormStorage [9]
  end
  inherited CEDetallePMEdit: TPopUpTeclas [10]
  end
  inherited CENotas: TControlEdit [11]
  end
  inherited CENotasPMEdit: TPopUpTeclas [12]
  end
  inherited ALAlbaranes: TLFActionList [13]
  end
  inherited RelojNotas: TTimer [14]
  end
  inherited CECartaPortes: TControlEdit [15]
  end
  inherited CEMCartaPortesPMEdit: TPopUpTeclas [16]
  end
  inherited CEMatricula: TControlEdit [17]
  end
  inherited CENaturaleza: TControlEdit [18]
  end
  inherited CEMatriculaPMEdit: TPopUpTeclas [19]
  end
  inherited CENaturalezaPMEdit: TPopUpTeclas [20]
  end
  inherited PMTraspaso: TPopupMenu [21]
  end
  inherited CEOtros: TControlEdit [22]
  end
  inherited CEOtrosPMEdit: TPopUpTeclas [23]
  end
  inherited CEDirEntrega: TControlEdit [24]
  end
  inherited CEDirEntregaPMEdit: TPopUpTeclas [25]
  end
  inherited RelojAdjuntos: TTimer [26]
  end
  inherited RelojEmail: TTimer [27]
  end
  inherited CEOtrosChile: TControlEdit [28]
  end
end
