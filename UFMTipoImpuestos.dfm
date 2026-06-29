inherited FMTipoImpuestos: TFMTipoImpuestos
  Left = 581
  Top = 269
  HelpContext = 2006
  Caption = 'Tipo Impuestos'
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
        DataSource = DMTipoImpuestos.DSQMTipoImpuestos
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBETitulo
      end
      inherited EPMain: THYMEditPanel
        Width = 78
        VisibleButtons = [neImprime, neRango, neSalir]
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 306
        Visible = False
      end
      inherited TbuttComp: TToolButton
        Left = 314
        Visible = False
      end
    end
    inherited PCMain: TLFPageControl
      Width = 386
      Height = 164
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 378
          Height = 136
          object LTipo: TLFLabel
            Left = 51
            Top = 40
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LTitulo: TLFLabel
            Left = 46
            Top = 62
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = 'Titulo'
          end
          object LPorcentaje: TLFLabel
            Left = 21
            Top = 84
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'Porcentaje'
          end
          object DBETipo: TLFDbedit
            Left = 78
            Top = 36
            Width = 47
            Height = 21
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'TIPO'
            DataSource = DMTipoImpuestos.DSQMTipoImpuestos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 78
            Top = 58
            Width = 255
            Height = 21
            DataField = 'TITULO'
            DataSource = DMTipoImpuestos.DSQMTipoImpuestos
            TabOrder = 1
          end
          object DBEPorcentaje: TLFDbedit
            Left = 78
            Top = 80
            Width = 47
            Height = 21
            DataField = 'PORCENTAJE'
            DataSource = DMTipoImpuestos.DSQMTipoImpuestos
            TabOrder = 2
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = DMTipoImpuestos.DSQMTipoImpuestos
          CamposAOrdenar.Strings = (
            'PORCENTAJE'
            'TIPO'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 77
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 196
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PORCENTAJE'
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
    Left = 248
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 276
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 228
    Top = 106
  end
  inherited FSMain: TLFFibFormStorage
    Left = 268
    Top = 106
  end
end
