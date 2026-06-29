inherited FMGamaPrecioReposicion: TFMGamaPrecioReposicion
  Caption = 'Gama Precio Reposicion'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        DataSource = DMGamaPrecioReposicion.DSxGamas
        Hints.Strings = ()
      end
      inherited EPMain: THYMEditPanel
        Width = 78
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepTerc: TToolButton
        Left = 306
      end
      inherited TbuttComp: TToolButton
        Left = 314
      end
    end
    inherited PCMain: TLFPageControl
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          inherited G2KTableLoc: TG2KTBLoc
            Left = 80
            Top = 64
            AutoSize = True
            Plan.Strings = (
              
                'PLAN SORT (JOIN (VER_CABECERAS_ALBARAN CAB INDEX (GES_CABECERAS_' +
                'S_IDX2),'
              
                '                 VER_CABECERAS_ALBARAN ALB INDEX (GES_CABECERAS_' +
                'S_ALB_ID),'
              
                '                 VER_CABECERAS_ALBARAN TER INDEX (PK_SYS_TERCERO' +
                'S)))                ')
            DataSource = DMGamaPrecioReposicion.DSxGamas
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_GAMAS'
            CampoNum = 'GAMA'
            CampoStr = 'TITULO'
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'GAMA')
          end
          object LGama: TLFLabel
            Left = 79
            Top = 52
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'Gama'
          end
          object LTitulo: TLFLabel
            Left = 81
            Top = 73
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = 'Titulo'
          end
          object LDescuento: TLFLabel
            Left = 44
            Top = 96
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = '% Descuento'
          end
          object LIncremento: TLFLabel
            Left = 54
            Top = 120
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Incremento'
          end
          object DBEGama: TLFDbedit
            Left = 112
            Top = 48
            Width = 121
            Height = 21
            DataField = 'GAMA'
            DataSource = DMGamaPrecioReposicion.DSxGamas
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 112
            Top = 70
            Width = 305
            Height = 21
            DataField = 'TITULO'
            DataSource = DMGamaPrecioReposicion.DSxGamas
            TabOrder = 1
          end
          object DBEDescuento: TLFDbedit
            Left = 112
            Top = 92
            Width = 121
            Height = 21
            DataField = 'DESCUENTO'
            DataSource = DMGamaPrecioReposicion.DSxGamas
            TabOrder = 2
          end
          object DBEIncremento: TLFDbedit
            Left = 112
            Top = 114
            Width = 121
            Height = 21
            DataField = 'INCREMENTO'
            DataSource = DMGamaPrecioReposicion.DSxGamas
            TabOrder = 3
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          DataSource = DMGamaPrecioReposicion.DSxGamas
          Columns = <
            item
              Expanded = False
              FieldName = 'GAMA'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 230
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCUENTO'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INCREMENTO'
              Width = 80
              Visible = True
            end>
        end
      end
    end
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
end
