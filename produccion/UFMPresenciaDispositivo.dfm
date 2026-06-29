inherited FMPresenciaDispositivo: TFMPresenciaDispositivo
  Left = 470
  Top = 263
  Caption = 'Incid'#233'ncias de Presencia'
  ClientHeight = 261
  ClientWidth = 508
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 508
    Height = 237
    inherited TBMain: TLFToolBar
      Width = 504
      inherited NavMain: THYMNavigator
        Hints.Strings = ()
        BeforeAction = NavMainBeforeAction
      end
      inherited EPMain: THYMEditPanel
        Width = 46
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepTerc: TToolButton
        Left = 274
      end
      inherited TbuttComp: TToolButton
        Left = 282
      end
    end
    inherited PCMain: TLFPageControl
      Width = 504
      Height = 207
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 496
          Height = 179
          inherited G2KTableLoc: TG2KTBLoc
            Left = 73
            Top = -6
            DataSource = DMPresenciaDispositivo.DSQMDisPre
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'PRO_SYS_DISP_PRESENCIA'
            CampoNum = 'ID'
            CampoStr = 'DESCRIPCION'
            OrdenadoPor.Strings = (
              'ID')
          end
          object LDescripcion: TLFLabel
            Left = 45
            Top = 41
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object LId: TLFLabel
            Left = 90
            Top = 20
            Width = 11
            Height = 13
            Alignment = taRightJustify
            Caption = 'ID'
          end
          object LIdentificadorInicidencia: TLFLabel
            Left = 16
            Top = 63
            Width = 83
            Height = 13
            Alignment = taRightJustify
            Caption = 'Identificador disp.'
          end
          object LComportamiento: TLFLabel
            Left = 67
            Top = 85
            Width = 32
            Height = 13
            Alignment = taRightJustify
            Caption = 'Latitud'
          end
          object LBolsaHoras: TLFLabel
            Left = 58
            Top = 107
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Longitud'
          end
          object DBEDescripcion: TLFDbedit
            Left = 105
            Top = 37
            Width = 368
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = DMPresenciaDispositivo.DSQMDisPre
            TabOrder = 1
          end
          object DBEId: TLFDbedit
            Left = 105
            Top = 15
            Width = 50
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ID'
            DataSource = DMPresenciaDispositivo.DSQMDisPre
            Enabled = False
            TabOrder = 0
          end
          object DBEIdentificadorInicidencia: TLFDbedit
            Left = 105
            Top = 59
            Width = 272
            Height = 21
            DataField = 'IDENTIFICADOR_DISPOSITIVO'
            DataSource = DMPresenciaDispositivo.DSQMDisPre
            TabOrder = 2
          end
          object DBELatitud: TLFDbedit
            Left = 105
            Top = 81
            Width = 120
            Height = 21
            DataField = 'LATITUD'
            DataSource = DMPresenciaDispositivo.DSQMDisPre
            TabOrder = 3
          end
          object DBELongitud: TLFDbedit
            Left = 105
            Top = 103
            Width = 120
            Height = 21
            DataField = 'LONGITUD'
            DataSource = DMPresenciaDispositivo.DSQMDisPre
            TabOrder = 4
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 496
          Height = 179
          DataSource = DMPresenciaDispositivo.DSQMDisPre
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          CamposAMarcar.Strings = (
            'DEFECTO')
          CamposAOrdenar.Strings = (
            'DESCRIPCION'
            'ID'
            'IDENTIFICADOR_DISPOSITIVO'
            'LATITUD'
            'LONGITUD')
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Width = 38
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 269
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LATITUD'
              Width = 70
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LONGITUD'
              Width = 70
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 237
    Width = 508
  end
  inherited CEMain: TControlEdit
    Left = 336
    Top = 12
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 364
    Top = 12
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 392
    Top = 8
  end
  inherited FSMain: TLFFibFormStorage
    Left = 424
    Top = 8
  end
end
