inherited FMADRTunelCodes: TFMADRTunelCodes
  Left = 452
  Top = 275
  HelpContext = 290
  Caption = 'ADR - C'#243'digos de Tunel'
  ClientHeight = 218
  ClientWidth = 390
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 390
    Height = 194
    inherited TBMain: TLFToolBar
      Width = 386
      inherited NavMain: THYMNavigator
        DataSource = DMADRTunelCodes.DSQMADRTunelCodes
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBECodigo
      end
      inherited EPMain: THYMEditPanel
        Width = 44
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 272
      end
      inherited TbuttComp: TToolButton
        Left = 280
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
            DataSource = DMADRTunelCodes.DSQMADRTunelCodes
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'ADR_TUNEL_CODES'
            CampoNum = 'CODE'
            CampoStr = 'NAME'
            OrdenadoPor.Strings = (
              'CODE')
          end
          object LCodigo: TLFLabel
            Left = 33
            Top = 46
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo'
          end
          object LTitulo: TLFLabel
            Left = 38
            Top = 68
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object DBECodigo: TLFDbedit
            Left = 70
            Top = 42
            Width = 65
            Height = 21
            DataField = 'CODE'
            DataSource = DMADRTunelCodes.DSQMADRTunelCodes
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 70
            Top = 64
            Width = 291
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'NAME'
            DataSource = DMADRTunelCodes.DSQMADRTunelCodes
            TabOrder = 1
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = DMADRTunelCodes.DSQMADRTunelCodes
          ControlEdit = CEMain
          CamposAOrdenar.Strings = (
            'CODE'
            'NAME')
          Columns = <
            item
              Expanded = False
              FieldName = 'CODE'
              Width = 63
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NAME'
              Width = 276
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
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 280
    Top = 84
  end
  inherited FSMain: TLFFibFormStorage
    Left = 320
    Top = 84
  end
end
