inherited FMTipoNCF: TFMTipoNCF
  Left = 451
  Top = 188
  Caption = 'FMTipoNCF'
  ClientHeight = 236
  ClientWidth = 479
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 479
    Height = 212
    inherited TBMain: TLFToolBar
      Width = 475
      inherited NavMain: THYMNavigator
        DataSource = DMTipoNCF.DSQMTipoNCF
        Hints.Strings = ()
        OnClick = NavMainClick
        EditaControl = DBETitulo
        InsertaControl = DBETipo
      end
      inherited EPMain: THYMEditPanel
        Width = 78
        VisibleButtons = [neBuscar, neImprime, neSalir]
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
      Width = 475
      Height = 182
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 467
          Height = 154
          inherited G2KTableLoc: TG2KTBLoc
            Left = 80
            Plan.Strings = (
              'PLAN JOIN (VER_CABECERAS_FACTURA CAB INDEX (PK_GES_CABECERAS_S),'
              
                '           VER_CABECERAS_FACTURA FAC INDEX (GES_CABECERAS_S_FAC_' +
                'ID),'
              '           VER_CABECERAS_FACTURA TER INDEX (PK_SYS_TERCEROS))')
            DataSource = DMTipoNCF.DSQMTipoNCF
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'Z_SYS_TIPO_NCF'
            CampoNum = 'TIPO_NCF'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'TIPO_NCF')
          end
          object LTipo: TLFLabel
            Left = 70
            Top = 38
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LTitulo: TLFLabel
            Left = 65
            Top = 60
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = 'Titulo'
          end
          object LTipoDocumento: TLFLabel
            Left = 12
            Top = 81
            Width = 79
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Documento'
          end
          object DBETipo: TLFDbedit
            Left = 96
            Top = 34
            Width = 121
            Height = 21
            DataField = 'TIPO_NCF'
            DataSource = DMTipoNCF.DSQMTipoNCF
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 96
            Top = 56
            Width = 345
            Height = 21
            DataField = 'TITULO'
            DataSource = DMTipoNCF.DSQMTipoNCF
            TabOrder = 1
          end
          object DBCBVTipoDocumento: TDBComboBoxValue
            Left = 96
            Top = 78
            Width = 137
            Height = 21
            Style = csDropDownList
            DataField = 'TIPO_DOCUMENTO'
            DataSource = DMTipoNCF.DSQMTipoNCF
            ItemHeight = 13
            Items.Strings = (
              'Ambas'
              'Compras'
              'Ventas')
            Values.Strings = (
              '0'
              '1'
              '2')
            TabOrder = 2
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 467
          Height = 154
          DataSource = DMTipoNCF.DSQMTipoNCF
          CamposAOrdenar.Strings = (
            'TIPO_NCF'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO_NCF'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 212
    Width = 479
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
end
