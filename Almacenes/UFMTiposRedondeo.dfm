inherited FMTiposRedondeo: TFMTiposRedondeo
  Left = 326
  Top = 278
  Width = 400
  Height = 301
  HelpContext = 134
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Tipos de Redondeo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 390
    Height = 248
    inherited TBMain: TLFToolBar
      Width = 386
      inherited NavMain: THYMNavigator
        DataSource = DMTiposRedondeo.DSQMTiposRedondeo
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBETitulo
      end
      inherited EPMain: THYMEditPanel
        Width = 46
        VisibleButtons = [neImprime, neSalir]
        Hints.Strings = ()
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
      Height = 218
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 378
          Height = 190
          object Label2: TLFLabel
            Left = 49
            Top = 29
            Width = 28
            Height = 13
            Caption = 'T'#237'tulo'
          end
          object Label3: TLFLabel
            Left = 3
            Top = 7
            Width = 74
            Height = 13
            Caption = 'Tipo Redondeo'
          end
          object Label1: TLFLabel
            Left = 28
            Top = 51
            Width = 49
            Height = 13
            Caption = 'Decimales'
          end
          object Label4: TLFLabel
            Left = 53
            Top = 72
            Width = 24
            Height = 13
            Caption = 'Valor'
          end
          object DBETipo: TLFDbedit
            Left = 82
            Top = 3
            Width = 33
            Height = 21
            DataField = 'TIPO_REDONDEO'
            DataSource = DMTiposRedondeo.DSQMTiposRedondeo
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 82
            Top = 25
            Width = 293
            Height = 21
            DataField = 'TITULO'
            DataSource = DMTiposRedondeo.DSQMTiposRedondeo
            TabOrder = 1
          end
          object DBEDecimales: TLFDbedit
            Left = 82
            Top = 47
            Width = 60
            Height = 21
            DataField = 'DECIMALES'
            DataSource = DMTiposRedondeo.DSQMTiposRedondeo
            TabOrder = 2
          end
          object DBEValor: TLFDbedit
            Left = 82
            Top = 69
            Width = 60
            Height = 21
            DataField = 'VALOR'
            DataSource = DMTiposRedondeo.DSQMTiposRedondeo
            TabOrder = 3
          end
          object DBGTrunca: TDBRadioGroup
            Left = 0
            Top = 94
            Width = 121
            Height = 91
            Caption = 'Trunca / Redondea'
            DataField = 'USO_TRUNCA'
            DataSource = DMTiposRedondeo.DSQMTiposRedondeo
            Items.Strings = (
              'No usar'
              'Truncar'
              'Redondear')
            TabOrder = 5
            Values.Strings = (
              '0'
              '1'
              '2')
          end
          object DBGMultiplo: TDBRadioGroup
            Left = 128
            Top = 94
            Width = 121
            Height = 91
            Caption = 'M'#250'ltiplo / Terminaci'#243'n'
            DataField = 'USO_MULT'
            DataSource = DMTiposRedondeo.DSQMTiposRedondeo
            Items.Strings = (
              'No usar'
              'M'#250'ltiplo'
              'Terminaci'#243'n')
            TabOrder = 6
            Values.Strings = (
              '0'
              '1'
              '2')
          end
          object DBGTipoTerminacion: TDBRadioGroup
            Left = 256
            Top = 94
            Width = 121
            Height = 91
            Caption = 'Tipo Terminaci'#243'n'
            DataField = 'TIPO_TERMINACION'
            DataSource = DMTiposRedondeo.DSQMTiposRedondeo
            Items.Strings = (
              'Precio igual'
              'Terminaci'#243'n'
              'Aproximar')
            TabOrder = 7
            Values.Strings = (
              '0'
              '1'
              '2')
          end
          object DBCBAlzaBaja: TLFDBCheckBox
            Left = 145
            Top = 72
            Width = 49
            Height = 17
            Caption = 'Alza'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 4
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ALZA_BAJA_TERMINACION'
            DataSource = DMTiposRedondeo.DSQMTiposRedondeo
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 190
          DataSource = DMTiposRedondeo.DSQMTiposRedondeo
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO_REDONDEO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 181
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR'
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DECIMALES'
              Width = 56
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 248
    Width = 390
  end
  inherited CEMain: TControlEdit
    Left = 260
    Top = 30
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 308
    Top = 34
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
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
  inherited ALMain: TLFActionList
    Left = 260
    Top = 72
  end
  inherited FSMain: TLFFibFormStorage
    Left = 308
    Top = 76
  end
end
