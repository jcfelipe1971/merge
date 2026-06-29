inherited FMTipoModelo: TFMTipoModelo
  Left = 407
  Top = 225
  Caption = 'Tipos Modelo'
  ClientHeight = 231
  ClientWidth = 410
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 410
    Height = 207
    inherited TBMain: TLFToolBar
      Width = 406
      inherited NavMain: THYMNavigator
        Width = 160
        DataSource = DMTipoModelo.DSQMTipoModelo
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton
        Left = 160
      end
      inherited EPMain: THYMEditPanel
        Left = 168
        DataSource = DMTipoModelo.DSQMTipoModelo
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 248
      end
      inherited TbuttComp: TToolButton
        Left = 256
      end
    end
    inherited PCMain: TLFPageControl
      Width = 406
      Height = 177
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 398
          Height = 149
          inherited G2KTableLoc: TG2KTBLoc
            Left = 67
            Top = 48
            DataSource = DMTipoModelo.DSQMTipoModelo
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'Z_TIPO_MODELO'
            CampoNum = 'CODIGO'
            CampoStr = 'DESCRIPCION'
          end
          object LbId: TLFLabel
            Left = 59
            Top = 33
            Width = 9
            Height = 13
            Alignment = taRightJustify
            Caption = 'Id'
          end
          object LbDesc: TLFLabel
            Left = 12
            Top = 55
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object LbPrefijoArticulo: TLFLabel
            Left = 2
            Top = 75
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'Prefijo articulo'
          end
          object LbPrefijoTituloArt: TLFLabel
            Left = 14
            Top = 97
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Prefijo titulo'
          end
          object LFDesc: TLFDbedit
            Left = 74
            Top = 51
            Width = 321
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = DMTipoModelo.DSQMTipoModelo
            TabOrder = 1
          end
          object LFId: TLFDbedit
            Left = 74
            Top = 29
            Width = 37
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'CODIGO'
            DataSource = DMTipoModelo.DSQMTipoModelo
            TabOrder = 0
          end
          object LFPrefijoArticulo: TLFDbedit
            Left = 74
            Top = 73
            Width = 28
            Height = 21
            DataField = 'PREFIJO_ARTICULO'
            DataSource = DMTipoModelo.DSQMTipoModelo
            TabOrder = 2
          end
          object LFPrefijoTituloArt: TLFDbedit
            Left = 74
            Top = 95
            Width = 200
            Height = 21
            DataField = 'PREFIJO_TITULO_ART'
            DataSource = DMTipoModelo.DSQMTipoModelo
            TabOrder = 3
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 398
          Height = 149
          DataSource = DMTipoModelo.DSQMTipoModelo
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PREFIJO_ARTICULO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PREFIJO_TITULO_ART'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 207
    Width = 410
    EdgeOuter = esNone
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
  end
end
