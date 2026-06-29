inherited FMTipoLineaVentaKri: TFMTipoLineaVentaKri
  Caption = 'Tipo de Linea de Venta'
  ClientHeight = 226
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 202
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        DataSource = DMTipoLineaVentaKri.DSQMTipoLineaVentaKri
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBEID
      end
      inherited EPMain: THYMEditPanel
        Width = 78
        DataSource = DMTipoLineaVentaKri.DSQMTipoLineaVentaKri
        VisibleButtons = [neBuscar, neReport, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 306
      end
      inherited TbuttComp: TToolButton
        Left = 314
      end
    end
    inherited PCMain: TLFPageControl
      Height = 172
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Height = 144
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = DMTipoLineaVentaKri.DSQMTipoLineaVentaKri
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_TIPO_LINEA_VENTA_KRI'
            CampoNum = 'ID'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'ID=ID order by ID'
          end
          object LBLTipo: TLFLabel
            Left = 33
            Top = 51
            Width = 21
            Height = 13
            Caption = 'Tipo'
            FocusControl = DBEID
          end
          object LBLTitulo: TLFLabel
            Left = 32
            Top = 73
            Width = 28
            Height = 13
            Caption = 'T'#237'tulo'
            FocusControl = DBETitulo
          end
          object DBEID: TLFDbedit
            Left = 66
            Top = 48
            Width = 64
            Height = 21
            DataField = 'ID'
            DataSource = DMTipoLineaVentaKri.DSQMTipoLineaVentaKri
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 66
            Top = 70
            Width = 283
            Height = 21
            DataField = 'TITULO'
            DataSource = DMTipoLineaVentaKri.DSQMTipoLineaVentaKri
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Height = 144
          DataSource = DMTipoLineaVentaKri.DSQMTipoLineaVentaKri
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 202
  end
  inherited CEMain: TControlEdit
    DataSource = DMTipoLineaVentaKri.DSQMTipoLineaVentaKri
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
  end
end
