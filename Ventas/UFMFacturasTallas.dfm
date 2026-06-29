inherited FMFacturasTallas: TFMFacturasTallas
  Left = 185
  Top = 164
  Caption = 'Facturas a clientes'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inline FRTallas_s: TFRTallas_s [0]
    Left = 0
    Top = 302
    Width = 1284
    Height = 286
    Align = alClient
    TabOrder = 4
    Visible = False
    inherited PNLDetalleTallas: TLFPanel
      Width = 1284
      Height = 286
      inherited DBGFDetalleTallasPrecios: TDBGridFind2000
        Width = 1282
        Height = 262
      end
      inherited DBGFDetalleTallas: TDBGridFind2000
        Width = 1282
        Height = 262
        IniStorage = FSMain
      end
      inherited TBMain: TLFToolBar
        Width = 1282
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
    Top = 302
    Height = 286
    inherited TBDetalle: TLFToolBar
      inherited NavDetalle: THYMNavigator
        Hints.Strings = ()
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Height = 209
      Visible = False
    end
    inherited PCPie: TLFPageControl
      Top = 231
      inherited TSPieRetCom: TTabSheet
        inherited PPieRetenciones: TLFPanel
          Width = 781
        end
      end
      inherited TSPieCarDtos: TTabSheet
        inherited PPieComisiones: TLFPanel
          Width = 781
        end
      end
    end
    inherited PCDetalle: TLFPageControl
      Height = 209
      inherited TSArticulos: TTabSheet
        inherited DBGFDetalle1: TDBGridFind2000
          Height = 181
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
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          inherited G2KTableLoc: TG2KTBLoc
            Base_de_datos = DMMain.DataBase
          end
        end
      end
      inherited TSOtros: TTabSheet
        inherited PCabOtros: TLFPanel
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
      inherited TSFEChile: TTabSheet
        inherited TBFEChile: TLFToolBar
          inherited NavFEChile: THYMNavigator
            Hints.Strings = ()
          end
        end
      end
      inherited TSOtrosChile: TTabSheet
        inherited PCabOtrosChile: TLFPanel
          inherited NavOtrosChile: THYMNavigator
            Hints.Strings = ()
          end
        end
        inherited PEdOtrosChile: TLFPanel
          inherited GBReferenciasDte: TGroupBox
            inherited PNLReferenciasDte: TLFPanel
              inherited PNLReferenciasDteCab: TPanel
                inherited NavReferenciasDte: THYMNavigator
                  Hints.Strings = ()
                end
              end
            end
          end
        end
      end
      inherited TSProveedores: TTabSheet
        inherited PNLProveedores: TLFPanel
          inherited NavProveedores: THYMNavigator
            Hints.Strings = ()
          end
        end
        inherited DBGProveedores: TDBGridFind2000
          Columns = <
            item
              Expanded = False
              FieldName = 'PROVEEDOR'
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'NOMBRE_R_SOCIAL'
              ReadOnly = True
              Width = 200
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'NOMBRE_COMERCIAL'
              ReadOnly = True
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECIO'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_ENTREGA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UTILIZAR_COSTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBSERVACIONES'
              Width = 300
              Visible = True
            end>
        end
      end
      inherited TSEnvioECF: TTabSheet
        inherited PNLReferencia: TPanel
          inherited GBReferencia: TGroupBox
            inherited PnlReferenciaDGII: TLFPanel
              inherited NavDGIIReferencias: THYMNavigator
                Hints.Strings = ()
              end
            end
          end
        end
      end
    end
  end
  inherited TBActions: TLFToolBar [3]
  end
  object TCTallas: TTabControl [4]
    Left = 0
    Top = 280
    Width = 1284
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
  inherited ALMain: TLFActionList [7]
  end
  inherited FSMain: TLFFibFormStorage [8]
  end
  inherited CEDetalle: TControlEdit [9]
    EnlazadoA = FRTallas_s.CETallas
    OnEnter = CEDetalleEnter
  end
  inherited CEDetallePMEdit: TPopUpTeclas [10]
  end
  inherited CENotas: TControlEdit [11]
  end
  inherited CENotasPMEdit: TPopUpTeclas [12]
  end
  inherited ALFacturas: TLFActionList [13]
  end
  inherited RelojNotas: TTimer [14]
  end
  inherited PMTraspaso: TPopupMenu [15]
  end
  inherited CEOtrosPMEdit: TPopUpTeclas [16]
  end
  inherited CEOtros: TControlEdit [17]
  end
  inherited RelojAdjuntos: TTimer [18]
  end
  inherited RelojEmail: TTimer [19]
  end
  inherited CEOtrosChilePMEdit: TPopUpTeclas [20]
  end
  inherited CEOtrosChile: TControlEdit [21]
  end
  inherited CEDirEntrega: TControlEdit [22]
  end
  inherited CEDirEntregaPMEdit: TPopUpTeclas [23]
  end
  inherited CEProveedores: TControlEdit [24]
  end
end
