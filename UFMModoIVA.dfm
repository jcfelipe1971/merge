inherited FMModoIva: TFMModoIva
  Left = 464
  Top = 475
  HelpContext = 303
  Caption = 'Modos de IVA (Aplicados a Clientes/Proveedores)'
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
        DataSource = DMModoIVA.DSQMModoIva
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBEModo
      end
      inherited EPMain: THYMEditPanel
        VisibleButtons = [neBuscar, neImprime, neRango, neSalir]
        Hints.Strings = ()
        Busca01 = DBEModo
        Busca02 = DBETitulo
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
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
            DataSource = DMModoIVA.DSQMModoIva
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_MODO_IVA'
            CampoNum = 'MODO'
            CampoStr = 'TITULO'
            OrdenadoPor.Strings = (
              'MODO')
          end
          object LBLModo: TLFLabel
            Left = 36
            Top = 25
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Modo'
          end
          object LBLTransaccion: TLFLabel
            Left = 9
            Top = 47
            Width = 54
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Trans.'
          end
          object DBEModo: TLFDbedit
            Left = 68
            Top = 21
            Width = 33
            Height = 21
            CharCase = ecUpperCase
            DataField = 'MODO'
            DataSource = DMModoIVA.DSQMModoIva
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 102
            Top = 21
            Width = 265
            Height = 21
            DataField = 'TITULO'
            DataSource = DMModoIVA.DSQMModoIva
            TabOrder = 1
          end
          object DBCHKIva: TLFDBCheckBox
            Left = 68
            Top = 67
            Width = 97
            Height = 17
            Caption = 'Aplicar I.V.A.'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 4
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'IVA'
            DataSource = DMModoIVA.DSQMModoIva
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCHKRecargo: TLFDBCheckBox
            Left = 68
            Top = 86
            Width = 97
            Height = 17
            Caption = 'Aplicar Recargo'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 5
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'RECARGO'
            DataSource = DMModoIVA.DSQMModoIva
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCHKDeducible: TLFDBCheckBox
            Left = 68
            Top = 105
            Width = 97
            Height = 17
            Caption = 'Deducible'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 6
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'DEDUCIBLE'
            DataSource = DMModoIVA.DSQMModoIva
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFTipoTransaccion: TLFDBEditFind2000
            Left = 68
            Top = 43
            Width = 33
            Height = 21
            DataField = 'TIPO_TRANSACCION'
            DataSource = DMModoIVA.DSQMModoIva
            TabOrder = 2
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TIPOS_TRANSACCION'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TIPO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBETituloTransaccion: TLFDbedit
            Left = 102
            Top = 43
            Width = 265
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMModoIVA.DSxTransaccion
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = DMModoIVA.DSQMModoIva
          ControlEdit = CEMain
          CamposAOrdenar.Strings = (
            'IVA'
            'MODO'
            'RECARGO'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'MODO'
              Title.Alignment = taCenter
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 216
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'IVA'
              Title.Alignment = taCenter
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RECARGO'
              Title.Alignment = taCenter
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO_TRANSACCION'
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
  inherited CEMain: TControlEdit
    Left = 250
    Top = 32
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 302
    Top = 34
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 196
    Top = 32
  end
  inherited FSMain: TLFFibFormStorage
    Left = 350
    Top = 0
  end
end
