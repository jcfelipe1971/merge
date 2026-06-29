inherited FMProtocolosDeVenta: TFMProtocolosDeVenta
  Left = 662
  Top = 452
  Caption = 'Protocolos De Venta'
  ClientHeight = 195
  ClientWidth = 372
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 372
    Height = 171
    inherited TBMain: TLFToolBar
      Width = 368
      inherited NavMain: THYMNavigator
        DataSource = DMProtocolosDeVenta.DSQMProtocolos
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBEProtocolo
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
    end
    inherited PCMain: TLFPageControl
      Width = 368
      Height = 141
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 360
          Height = 113
          inherited G2KTableLoc: TG2KTBLoc
            Top = 32
            DataSource = DMProtocolosDeVenta.DSQMProtocolos
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_PROTOCOLO'
            CampoNum = 'PROTOCOLO'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'PROTOCOLO')
          end
          object LProtocolo: TLFLabel
            Left = 12
            Top = 22
            Width = 45
            Height = 13
            Alignment = taRightJustify
            Caption = 'Protocolo'
          end
          object LTitulo: TLFLabel
            Left = 29
            Top = 43
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object DBEProtocolo: TLFDbedit
            Left = 61
            Top = 18
            Width = 76
            Height = 21
            DataField = 'PROTOCOLO'
            DataSource = DMProtocolosDeVenta.DSQMProtocolos
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 61
            Top = 40
            Width = 289
            Height = 21
            DataField = 'TITULO'
            DataSource = DMProtocolosDeVenta.DSQMProtocolos
            TabOrder = 1
          end
          object DBCBDefecto: TLFDBCheckBox
            Left = 61
            Top = 66
            Width = 121
            Height = 17
            Caption = 'Defecto'
            ClicksDisabled = False
            TabOrder = 2
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'DEFECTO'
            DataSource = DMProtocolosDeVenta.DSQMProtocolos
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 360
          Height = 113
          DataSource = DMProtocolosDeVenta.DSQMProtocolos
          CamposAOrdenar.Strings = (
            'DEFECTO'
            'PROTOCOLO'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'PROTOCOLO'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              ReadOnly = True
              Width = 347
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DEFECTO'
              ReadOnly = True
              Width = 47
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 171
    Width = 372
    EdgeOuter = esNone
  end
  inherited ALMain: TLFActionList
    Left = 248
    Top = 32
  end
  inherited FSMain: TLFFibFormStorage
    Left = 216
    Top = 32
  end
end
