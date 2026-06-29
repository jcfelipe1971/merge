inherited FMCodigoIncoterm: TFMCodigoIncoterm
  Left = 515
  Top = 250
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'C'#243'digos Incoterm'
  ClientHeight = 195
  ClientWidth = 440
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 440
    Height = 171
    inherited TBMain: TLFToolBar
      Width = 436
      inherited NavMain: THYMNavigator
        DataSource = DMCodigoIncoterm.DSQMCodigo
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBECodigo
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TbuttComp: TToolButton
        Visible = False
      end
    end
    inherited PCMain: TLFPageControl
      Width = 436
      Height = 141
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 428
          Height = 113
          inherited G2KTableLoc: TG2KTBLoc
            Top = 32
            DataSource = DMCodigoIncoterm.DSQMCodigo
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_CODIGO_INCOTERM'
            CampoNum = 'CODIGO'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'CODIGO')
          end
          object LCodigo: TLFLabel
            Left = 24
            Top = 22
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo'
          end
          object LTitulo: TLFLabel
            Left = 29
            Top = 43
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object LGrupo: TLFLabel
            Left = 28
            Top = 65
            Width = 29
            Height = 13
            Alignment = taRightJustify
            Caption = 'Grupo'
          end
          object DBECodigo: TLFDbedit
            Left = 61
            Top = 18
            Width = 76
            Height = 21
            DataField = 'CODIGO'
            DataSource = DMCodigoIncoterm.DSQMCodigo
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 61
            Top = 40
            Width = 357
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'TITULO'
            DataSource = DMCodigoIncoterm.DSQMCodigo
            TabOrder = 1
          end
          object DBEFGrupo: TLFDBEditFind2000
            Left = 61
            Top = 62
            Width = 36
            Height = 21
            DataField = 'GRUPO'
            DataSource = DMCodigoIncoterm.DSQMCodigo
            TabOrder = 2
            OnChange = DBEFGrupoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_GRUPO_INCOTERM'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'GRUPO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'GRUPO')
            Filtros = []
          end
          object ETituloGrupo: TLFEdit
            Left = 98
            Top = 62
            Width = 320
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 3
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 428
          Height = 113
          DataSource = DMCodigoIncoterm.DSQMCodigo
          CamposAOrdenar.Strings = (
            'CODIGO'
            'GRUPO'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'CODIGO'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GRUPO'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 171
    Width = 440
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
