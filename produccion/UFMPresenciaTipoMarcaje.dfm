inherited FMPresenciaTipoMarcaje: TFMPresenciaTipoMarcaje
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
        Width = 216
        DataSource = DMPresenciaTipoMarcaje.DSQMTipoPre
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton
        Left = 216
      end
      inherited EPMain: THYMEditPanel
        Left = 224
        Width = 46
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepTerc: TToolButton
        Left = 270
      end
      inherited TbuttComp: TToolButton
        Left = 278
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
            DataSource = DMPresenciaTipoMarcaje.DSQMTipoPre
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'PRO_SYS_TIPO_PRESENCIA'
            CampoNum = 'TIPO'
            CampoStr = 'DESCRIPCION'
            OrdenadoPor.Strings = (
              'TIPO')
          end
          object LDescripcion: TLFLabel
            Left = 45
            Top = 41
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object LTipo: TLFLabel
            Left = 80
            Top = 20
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LIdentificadorTipoMarcaje: TLFLabel
            Left = 0
            Top = 63
            Width = 99
            Height = 13
            Alignment = taRightJustify
            Caption = 'Identificador Marcaje'
          end
          object DBEDescripcion: TLFDbedit
            Left = 105
            Top = 37
            Width = 368
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = DMPresenciaTipoMarcaje.DSQMTipoPre
            TabOrder = 1
          end
          object DBETipo: TLFDbedit
            Left = 105
            Top = 15
            Width = 50
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TIPO'
            DataSource = DMPresenciaTipoMarcaje.DSQMTipoPre
            ReadOnly = True
            TabOrder = 0
          end
          object DBEIdentificadorTipoMarcaje: TLFDbedit
            Left = 105
            Top = 59
            Width = 272
            Height = 21
            DataField = 'IDENTIFICADOR_TIPO_MARCAJE'
            DataSource = DMPresenciaTipoMarcaje.DSQMTipoPre
            TabOrder = 2
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 496
          Height = 179
          DataSource = DMPresenciaTipoMarcaje.DSQMTipoPre
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          CamposAMarcar.Strings = (
            'DEFECTO')
          CamposAOrdenar.Strings = (
            'DESCRIPCION'
            'ID'
            'IDENTIFICADOR_TipoMarcaje'
            'LATITUD'
            'LONGITUD')
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 232
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IDENTIFICADOR_TIPO_MARCAJE'
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
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
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
