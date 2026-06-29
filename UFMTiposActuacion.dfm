inherited FMTiposActuacion: TFMTiposActuacion
  Left = 378
  Top = 258
  HelpContext = 293
  Caption = 'Tipos de Actuacion'
  ClientHeight = 335
  ClientWidth = 476
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 476
    Height = 311
    inherited TBMain: TLFToolBar
      Width = 472
      inherited NavMain: THYMNavigator
        DataSource = DMTiposActuacion.DSQMTiposActuacion
        Hints.Strings = ()
        OnClick = NavMainClick
        EditaControl = DBETitulo
        InsertaControl = DBETipo
      end
      inherited EPMain: THYMEditPanel
        VisibleButtons = [neBuscar, neImprime, neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
    end
    inherited PCMain: TLFPageControl
      Width = 472
      Height = 281
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 464
          Height = 253
          inherited G2KTableLoc: TG2KTBLoc
            Top = 48
            DataSource = DMTiposActuacion.DSQMTiposActuacion
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_TIPO_ACTUACION'
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'TIPO')
          end
          object LTipo: TLFLabel
            Left = 38
            Top = 37
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LTitulo: TLFLabel
            Left = 31
            Top = 59
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object LDescripcion: TLFLabel
            Left = 4
            Top = 81
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripcion'
          end
          object LHintDescripcion: TLFLabel
            Left = 64
            Top = 228
            Width = 385
            Height = 13
            Alignment = taCenter
            Anchors = [akLeft, akRight, akBottom]
            AutoSize = False
            Caption = 'Texto por defecto para observaciones'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBETipo: TLFDbedit
            Left = 64
            Top = 33
            Width = 41
            Height = 21
            CharCase = ecUpperCase
            DataField = 'TIPO'
            DataSource = DMTiposActuacion.DSQMTiposActuacion
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 64
            Top = 55
            Width = 385
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'TITULO'
            DataSource = DMTiposActuacion.DSQMTiposActuacion
            TabOrder = 1
          end
          object DBMDescripcion: TLFDBMemo
            Left = 64
            Top = 77
            Width = 385
            Height = 150
            Anchors = [akLeft, akTop, akRight, akBottom]
            DataField = 'DESCRIPCION'
            DataSource = DMTiposActuacion.DSQMTiposActuacion
            TabOrder = 2
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 464
          Height = 253
          DataSource = DMTiposActuacion.DSQMTiposActuacion
          CamposAOrdenar.Strings = (
            'TIPO'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 47
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
    Top = 311
    Width = 476
  end
  inherited CEMain: TControlEdit
    Left = 192
    Top = 34
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 230
    Top = 38
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 264
    Top = 32
  end
end
