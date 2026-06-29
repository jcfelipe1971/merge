inherited FMRangosPortes: TFMRangosPortes
  Left = 298
  Top = 246
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Rangos en Portes'
  ClientHeight = 422
  ClientWidth = 566
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 566
    Height = 197
    inherited TBMain: TLFToolBar
      Width = 562
      inherited NavMain: THYMNavigator
        DataSource = DMRangosPortes.DSQMCabecera
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBETitulo
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
    end
    inherited PCMain: TLFPageControl
      Width = 562
      Height = 167
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 554
          Height = 139
          inherited G2KTableLoc: TG2KTBLoc
            Left = 62
            Top = 29
          end
          object LRanto: TLFLabel
            Left = 38
            Top = 13
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Rango'
          end
          object LTitulo: TLFLabel
            Left = 41
            Top = 38
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object DBERango: TLFDbedit
            Left = 77
            Top = 10
            Width = 65
            Height = 21
            DataField = 'RANGO'
            DataSource = DMRangosPortes.DSQMCabecera
            TabOrder = 0
            OnChange = DBERangoChange
          end
          object DBETitulo: TLFDbedit
            Left = 77
            Top = 32
            Width = 338
            Height = 21
            DataField = 'TITULO'
            DataSource = DMRangosPortes.DSQMCabecera
            TabOrder = 1
          end
          object RGTipoRango: TDBRadioGroup
            Left = 40
            Top = 62
            Width = 473
            Height = 51
            Caption = 'Tipo de Rango'
            Columns = 3
            DataField = 'TIPO'
            DataSource = DMRangosPortes.DSQMCabecera
            Items.Strings = (
              'Rango por peso'
              'Rango por importe'
              'Rango por bultos')
            TabOrder = 2
            Values.Strings = (
              '1'
              '2'
              '3')
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 554
          Height = 139
          DataSource = DMRangosPortes.DSQMCabecera
          Columns = <
            item
              Expanded = False
              FieldName = 'RANGO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Visible = True
            end>
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 197
    Width = 566
    Height = 201
    inherited TBDetalle: TLFToolBar
      Width = 566
      inherited NavDetalle: THYMNavigator
        DataSource = DMRangosPortes.DSQMDetalle
        Hints.Strings = ()
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 566
      Height = 179
      DataSource = DMRangosPortes.DSQMDetalle
      PopupMenu = nil
      OnColEnter = DBGFDetalleColEnter
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'INDICE'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clGrayText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TITULO'
          Width = 199
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 398
    Width = 566
  end
  inherited CEMain: TControlEdit
    Left = 320
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 356
    Top = 4
  end
  inherited ALMain: TLFActionList
    Left = 424
    Top = 8
    object ATMPRangos: TAction
      Category = 'Procesos'
      Caption = 'Editar Rangos'
      Hint = 'Editar Rangos'
      ImageIndex = 18
      OnExecute = ATMPRangosExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      Hint = 'Procesos'
      ImageIndex = 16
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 480
    Top = 8
  end
  inherited CEDetalle: TControlEdit
    Left = 286
    Top = 112
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 346
    Top = 106
  end
end
