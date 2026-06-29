inherited FMTiposMoneda: TFMTiposMoneda
  Left = 378
  Top = 258
  HelpContext = 293
  Caption = 'Tipos Moneda'
  ClientHeight = 226
  ClientWidth = 389
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 389
    Height = 202
    inherited TBMain: TLFToolBar
      Width = 385
      Wrapable = True
      inherited NavMain: THYMNavigator
        DataSource = DMTiposMoneda.DSQMTiposMoneda
        Hints.Strings = ()
        OnClick = NavMainClick
        EditaControl = DBEFMoneda
        InsertaControl = DBEFMoneda
      end
      inherited EPMain: THYMEditPanel
        Width = 52
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 280
        Visible = False
      end
      inherited TbuttComp: TToolButton
        Left = 288
        Visible = False
      end
    end
    inherited PCMain: TLFPageControl
      Width = 385
      Height = 172
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 377
          Height = 144
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = DMTiposArticulo.DSQMTiposArticulo
            Tabla_a_buscar = 'SYS_TIPO_ARTICULO'
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'TIPO')
          end
          object LBLMoneda: TLFLabel
            Left = 25
            Top = 38
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Moneda'
          end
          object LFCodigo: TLFLabel
            Left = 31
            Top = 16
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#243'digo'
          end
          object LBLValor: TLFLabel
            Left = 40
            Top = 103
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Valor'
          end
          object LBLTipo: TLFLabel
            Left = 43
            Top = 82
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LBLNombre: TLFLabel
            Left = 8
            Top = 60
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object LFValor: TLFDbedit
            Left = 68
            Top = 100
            Width = 125
            Height = 21
            DataField = 'VALOR'
            DataSource = DMTiposMoneda.DSQMTiposMoneda
            TabOrder = 5
          end
          object LFDCodigo: TLFDbedit
            Left = 68
            Top = 12
            Width = 43
            Height = 21
            CharCase = ecUpperCase
            DataField = 'COD_MONEDA'
            DataSource = DMTiposMoneda.DSQMTiposMoneda
            TabOrder = 0
          end
          object DBETipo: TDBComboBoxValue
            Left = 68
            Top = 78
            Width = 85
            Height = 21
            Style = csDropDownList
            DataField = 'TIPO'
            DataSource = DMTiposMoneda.DSQMTiposMoneda
            ItemHeight = 13
            Items.Strings = (
              'Billete'
              'Moneda')
            Values.Strings = (
              '0'
              '1')
            TabOrder = 3
          end
          object DBETitulo: TLFDbedit
            Left = 68
            Top = 56
            Width = 283
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = DMTiposMoneda.DSQMTiposMoneda
            TabOrder = 2
          end
          object DBEFMoneda: TLFDBEditFind2000
            Left = 68
            Top = 34
            Width = 43
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'MONEDA'
            DataSource = DMTiposMoneda.DSQMTiposMoneda
            TabOrder = 1
            OnChange = DBEFMonedaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_MONEDAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'MONEDA'
            CampoStr = 'TITULO'
            CampoADevolver = 'MONEDA'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'MONEDA')
            Filtros = []
            Entorno = DMColadas.EntornoDoc
          end
          object ETituloMoneda: TLFEdit
            Left = 112
            Top = 34
            Width = 239
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 4
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 377
          Height = 144
          DataSource = DMTiposMoneda.DSQMTiposMoneda
          CamposAOrdenar.Strings = (
            'TIPO'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 56
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MONEDA'
              Width = 49
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 168
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 202
    Width = 389
    EdgeOuter = esNone
  end
  inherited CEMain: TControlEdit
    Left = 192
    Top = 34
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 230
    Top = 38
    inherited CEMainMibuscar: TMenuItem
      Visible = False
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
