inherited FMCategoriaCliente: TFMCategoriaCliente
  Left = 743
  Top = 276
  Caption = 'Categorias de Cliente'
  ClientHeight = 260
  ClientWidth = 366
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 366
    Height = 236
    inherited TBMain: TLFToolBar
      Width = 362
      inherited NavMain: THYMNavigator
        DataSource = DMCategoriaCliente.DSQMCategoriaCliente
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBECodigo
      end
      inherited EPMain: THYMEditPanel
        Width = 78
        VisibleButtons = [neBuscar, neRango, neSalir]
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
      Width = 362
      Height = 206
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 354
          Height = 178
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = DMCategoriaCliente.DSQMCategoriaCliente
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_CATEGORIA_CLIENTE'
            CampoNum = 'CODIGO'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'CODIGO')
          end
          object LCodigo: TLFLabel
            Left = 17
            Top = 46
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Codigo'
            FocusControl = DBECodigo
          end
          object LTitulo: TLFLabel
            Left = 23
            Top = 68
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
            FocusControl = DBETitulo
          end
          object DBECodigo: TLFDbedit
            Left = 56
            Top = 42
            Width = 50
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CODIGO'
            DataSource = DMCategoriaCliente.DSQMCategoriaCliente
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 56
            Top = 64
            Width = 280
            Height = 21
            DataField = 'TITULO'
            DataSource = DMCategoriaCliente.DSQMCategoriaCliente
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 354
          Height = 178
          DataSource = DMCategoriaCliente.DSQMCategoriaCliente
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Width = 42
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 268
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 236
    Width = 366
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
end
