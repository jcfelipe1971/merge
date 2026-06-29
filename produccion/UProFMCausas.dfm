inherited ProFMCausas: TProFMCausas
  Left = 470
  Top = 263
  Caption = 'Mantenimiento de Causas'
  ClientHeight = 218
  ClientWidth = 390
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 390
    Height = 194
    inherited TBMain: TLFToolBar
      Width = 386
      inherited NavMain: THYMNavigator
        DataSource = ProDMCausas.DSQMCausa
        Hints.Strings = ()
        EditaControl = DBCausa
        InsertaControl = DBCausa
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 288
      end
      inherited TbuttComp: TToolButton
        Left = 296
      end
    end
    inherited PCMain: TLFPageControl
      Width = 386
      Height = 164
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 378
          Height = 136
          inherited G2KTableLoc: TG2KTBLoc
            Left = 73
            Top = -6
            DataSource = ProDMCausas.DSQMCausa
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'PRO_CAUSAS'
            CampoNum = 'CAUSA'
            CampoStr = 'DESCRIPCION'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'CAUSA')
          end
          object LCausa: TLFLabel
            Left = 39
            Top = 42
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Causa'
          end
          object LDescripcion: TLFLabel
            Left = 13
            Top = 63
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object LOrden: TLFLabel
            Left = 40
            Top = 85
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Orden'
          end
          object DBCausa: TLFDbedit
            Left = 73
            Top = 37
            Width = 50
            Height = 21
            DataField = 'CAUSA'
            DataSource = ProDMCausas.DSQMCausa
            PopupMenu = CEMainPMEdit
            TabOrder = 0
          end
          object LFDBDescCausa: TLFDbedit
            Left = 73
            Top = 59
            Width = 272
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = ProDMCausas.DSQMCausa
            TabOrder = 1
          end
          object DBOrden: TLFDbedit
            Left = 73
            Top = 81
            Width = 32
            Height = 21
            BiDiMode = bdLeftToRight
            DataField = 'ORDEN'
            DataSource = ProDMCausas.DSQMCausa
            MaxLength = 3
            ParentBiDiMode = False
            TabOrder = 2
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = ProDMCausas.DSQMCausa
          Columns = <
            item
              Expanded = False
              FieldName = 'CAUSA'
              Width = 48
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 259
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ORDEN'
              Width = 33
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 194
    Width = 390
  end
  inherited CEMain: TControlEdit
    Left = 256
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 292
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 328
    Top = 40
  end
  inherited FSMain: TLFFibFormStorage
    Left = 224
    Top = 32
  end
end
