inherited FMSysCajas: TFMSysCajas
  Left = 476
  Top = 308
  Caption = 'Cajas del Sistema'
  ClientHeight = 218
  ClientWidth = 390
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 390
    Height = 194
    inherited TBMain: TLFToolBar
      Width = 386
      inherited NavMain: THYMNavigator
        DataSource = DMSysCajas.DSQMSysCajas
        Hints.Strings = ()
        EditaControl = DBTitulo
        InsertaControl = DBTitulo
      end
      inherited EPMain: THYMEditPanel
        Width = 46
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 274
      end
      inherited TbuttComp: TToolButton
        Left = 282
      end
    end
    inherited PCMain: TLFPageControl
      Width = 386
      Height = 164
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 378
          Height = 136
          object LBTipo: TLabel
            Left = 25
            Top = 44
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Caja'
          end
          object LBTitulo: TLabel
            Left = 18
            Top = 66
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object DBCaja: TLFDbedit
            Left = 52
            Top = 40
            Width = 75
            Height = 21
            Color = clInfoBk
            DataField = 'CAJA'
            DataSource = DMSysCajas.DSQMSysCajas
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBTitulo: TLFDbedit
            Left = 52
            Top = 62
            Width = 310
            Height = 21
            DataField = 'TITULO'
            DataSource = DMSysCajas.DSQMSysCajas
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = DMSysCajas.DSQMSysCajas
          CamposAOrdenar.Strings = (
            'CAJA'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'CAJA'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 274
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
    Left = 224
    Top = 56
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 266
    Top = 58
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 224
    Top = 112
  end
  inherited FSMain: TLFFibFormStorage
    Left = 270
    Top = 112
  end
end
