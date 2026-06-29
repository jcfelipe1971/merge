inherited ProFMTipoMarcajes: TProFMTipoMarcajes
  Caption = 'Mantenimiento de Tipo de Marcajes'
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
        DataSource = ProDMTipoMarcajes.DSQMProTipoMarc
        Hints.Strings = ()
        EditaControl = DBEDescTipoMarc
        InsertaControl = DBETipoMarc
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Visible = False
      end
      inherited TbuttComp: TToolButton
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
          inherited G2KTableLoc: TG2KTBLoc
            Left = 47
            Top = 42
          end
          object LFLabel1: TLFLabel
            Left = 15
            Top = 34
            Width = 67
            Height = 13
            Caption = 'Tipo Marcajes'
          end
          object LblTitulo: TLFLabel
            Left = 54
            Top = 58
            Width = 28
            Height = 13
            Caption = 'T'#237'tulo'
          end
          object DBCkhBProductivo: TLFDBCheckBox
            Left = 19
            Top = 81
            Width = 81
            Height = 17
            Caption = 'Productivo'
            ClicksDisabled = False
            Layout = checkboxRight
            TabOrder = 0
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'PRODUCTIVO'
            DataSource = ProDMTipoMarcajes.DSQMProTipoMarc
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBETipoMarc: TLFDbedit
            Left = 87
            Top = 30
            Width = 52
            Height = 21
            DataField = 'TIPO'
            DataSource = ProDMTipoMarcajes.DSQMProTipoMarc
            TabOrder = 1
          end
          object DBEDescTipoMarc: TLFDbedit
            Left = 87
            Top = 52
            Width = 270
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = ProDMTipoMarcajes.DSQMProTipoMarc
            TabOrder = 2
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = ProDMTipoMarcajes.DSQMProTipoMarc
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRODUCTIVO'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 194
    Width = 390
    EdgeOuter = esNone
  end
  inherited ALMain: TLFActionList
    Left = 280
    Top = 68
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      Hint = 'Listados'
      ImageIndex = 14
    end
    object ALstCodBarras: TAction
      Category = 'Listados'
      Caption = 'Listado de C'#243'digos de Barras'
      Hint = 'Listado de C'#243'digos de Barras'
      ImageIndex = 38
      OnExecute = ALstCodBarrasExecute
    end
    object ALstConf: TAction
      Category = 'Listados'
      Caption = 'Conf. Lst C'#243'digos de Barras'
      ImageIndex = 77
      OnExecute = ALstConfExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 320
    Top = 68
  end
end
