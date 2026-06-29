inherited ProFMTiposDefecto: TProFMTiposDefecto
  Left = 470
  Top = 263
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  Caption = 'Mantenimiento de Tipos de Defecto'
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
        Hints.Strings = ()
        EditaControl = LFDBCodigo
        InsertaControl = LFDBCodigo
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
            DataSource = ProDMTiposDefecto.DSQMDefecto
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'PRO_SYS_TIPO_DEFECTO'
            CampoNum = 'CODIGO_DEFECTO'
            CampoStr = 'DESCRIPCION'
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'CODIGO_DEFECTO')
          end
          object LDefecto: TLFLabel
            Left = 36
            Top = 42
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo'
          end
          object LDescripcion: TLFLabel
            Left = 14
            Top = 62
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object LFDBCodigo: TLFDbedit
            Left = 73
            Top = 37
            Width = 76
            Height = 21
            DataField = 'CODIGO_DEFECTO'
            DataSource = ProDMTiposDefecto.DSQMDefecto
            PopupMenu = CEMainPMEdit
            TabOrder = 0
          end
          object LFDBDescDefecto: TLFDbedit
            Left = 73
            Top = 59
            Width = 272
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = ProDMTiposDefecto.DSQMDefecto
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = ProDMTiposDefecto.DSQMDefecto
          CamposAOrdenar.Strings = (
            'CODIGO_DEFECTO'
            'DESCRIPCION')
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO_DEFECTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
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
end
