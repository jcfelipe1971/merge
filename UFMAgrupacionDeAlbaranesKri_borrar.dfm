inherited FMAgrupacionDeAlbaranesKri: TFMAgrupacionDeAlbaranesKri
  Left = 184
  Top = 225
  Caption = 'Agrupacion De Albaranes'
  ClientWidth = 707
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 707
    inherited TBMain: TLFToolBar
      Width = 703
      inherited NavMain: THYMNavigator
        DataSource = DMAgrupacionDeAlbaranesKri.DSQAgrupacionAlbaranes
        Hints.Strings = ()
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
      end
    end
    inherited PCMain: TLFPageControl
      Top = 69
      Width = 703
      Height = 261
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 695
          Height = 233
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 695
          Height = 233
          DataSource = DMAgrupacionDeAlbaranesKri.DSQAgrupacionAlbaranes
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_S_AG'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TAREA_1'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TAREA_2'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TAREA_3'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TAREA_4'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TAREA_5'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TAREA_6'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TAREA_7'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TAREA_8'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TAREA_9'
              Visible = True
            end>
        end
      end
    end
    object PNL: TLFPanel
      Left = 2
      Top = 28
      Width = 703
      Height = 41
      Align = alTop
      TabOrder = 2
      object LAgrupacion: TLFLabel
        Left = 14
        Top = 12
        Width = 54
        Height = 13
        Caption = 'Agrupacion'
      end
      object LIntervaloAlbaranes: TLFLabel
        Left = 297
        Top = 12
        Width = 91
        Height = 13
        Caption = 'Intervalo Albaranes'
      end
      object DBAgrupacion: TLFDbedit
        Left = 72
        Top = 8
        Width = 121
        Height = 21
        Color = clInfoBk
        TabOrder = 0
      end
      object DBEIntervaloAlbaranes: TLFDbedit
        Left = 392
        Top = 8
        Width = 185
        Height = 21
        Color = clInfoBk
        TabOrder = 1
      end
    end
  end
  inherited TBActions: TLFToolBar
    Width = 707
  end
  inherited CEMain: TControlEdit
    Left = 368
    Top = 0
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 404
    Top = 0
  end
  inherited ALMain: TLFActionList
    Left = 440
    Top = 0
  end
  inherited FSMain: TLFFibFormStorage
    Left = 480
    Top = 0
  end
end
