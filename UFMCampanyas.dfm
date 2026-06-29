inherited FMCampanyas: TFMCampanyas
  Left = 504
  Top = 307
  HelpContext = 21
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Campa'#241'as'
  ClientHeight = 271
  ClientWidth = 525
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 525
    Height = 247
    inherited TBMain: TLFToolBar
      Width = 521
      inherited NavMain: THYMNavigator
        DataSource = DMCampanyas.DSQMCampanyas
        Hints.Strings = ()
        EditaControl = DBCHKActiva
        InsertaControl = DBCHKActiva
      end
      inherited EPMain: THYMEditPanel
        Width = 78
        VisibleButtons = [neImprime, neRango, neSalir]
        Hints.Strings = ()
        Busca01 = DBECampanya
        Busca02 = DBETitulo
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
      Width = 521
      Height = 217
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 513
          Height = 189
          inherited G2KTableLoc: TG2KTBLoc
            Left = 76
            Top = 32
          end
          object LBLCampanya: TLFLabel
            Left = 26
            Top = 20
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Campa'#241'a'
            FocusControl = DBECampanya
          end
          object LBLTitulo: TLFLabel
            Left = 43
            Top = 42
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
            FocusControl = DBETitulo
          end
          object LBLValor: TLFLabel
            Left = 47
            Top = 86
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Valor'
          end
          object LBLInicio: TLFLabel
            Left = 13
            Top = 64
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Inicio'
          end
          object LBLFin: TLFLabel
            Left = 220
            Top = 64
            Width = 47
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Fin'
          end
          object DBECampanya: TLFDbedit
            Left = 75
            Top = 16
            Width = 64
            Height = 21
            Color = clInfoBk
            DataField = 'CAMPANYA'
            DataSource = DMCampanyas.DSQMCampanyas
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 75
            Top = 38
            Width = 283
            Height = 21
            DataField = 'TITULO'
            DataSource = DMCampanyas.DSQMCampanyas
            TabOrder = 1
          end
          object DBCHKActiva: TLFDBCheckBox
            Left = 380
            Top = 18
            Width = 73
            Height = 17
            Caption = '&Activa'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 5
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVA'
            DataSource = DMCampanyas.DSQMCampanyas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBValor: TLFDBCheckBox
            Left = 380
            Top = 40
            Width = 113
            Height = 17
            Caption = 'Usar fecha valor'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 6
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'VALOR_SI'
            DataSource = DMCampanyas.DSQMCampanyas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBDTPFin: TLFDBDateEdit
            Left = 271
            Top = 60
            Width = 87
            Height = 21
            DataField = 'FINAL'
            DataSource = DMCampanyas.DSQMCampanyas
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 3
          end
          object DBEValor: TLFDbedit
            Left = 75
            Top = 82
            Width = 75
            Height = 21
            DataField = 'VALOR'
            DataSource = DMCampanyas.DSQMCampanyas
            TabOrder = 4
          end
          object DBDTPInicio: TLFDBDateEdit
            Left = 75
            Top = 60
            Width = 87
            Height = 21
            DataField = 'INICIO'
            DataSource = DMCampanyas.DSQMCampanyas
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 2
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = DMCampanyas.DSQMCampanyas
          CamposAMarcar.Strings = (
            'ACTIVA')
          CamposChecked.Strings = (
            '1')
          CamposNoChecked.Strings = (
            '0')
          CamposAOrdenar.Strings = (
            'ACTIVA'
            'CAMPANYA'
            'TITULO'
            'VALOR')
          Columns = <
            item
              Expanded = False
              FieldName = 'CAMPANYA'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 206
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTIVA'
              Width = 28
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR'
              Width = 69
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 247
    Width = 525
  end
  inherited CEMain: TControlEdit
    Left = 160
    Top = 28
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 204
    Top = 28
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
    Left = 208
    Top = 76
  end
  inherited FSMain: TLFFibFormStorage
    Left = 154
    Top = 78
  end
end
