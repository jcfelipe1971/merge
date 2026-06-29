inherited FMFacturacionCanal: TFMFacturacionCanal
  Left = 507
  Top = 295
  Caption = 'Porcentajes de Facturaci'#243'n'
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
        Width = 200
        DataSource = DMFacturacionCanal.DSQMCanales
        Hints.Strings = ()
        EditaControl = LFDBPorcentaje
        InsertaControl = LFEFCajas
      end
      inherited TSepNav: TToolButton
        Left = 200
      end
      inherited EPMain: THYMEditPanel
        Left = 208
        Width = 46
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 254
      end
      inherited TbuttComp: TToolButton
        Left = 262
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
            Top = 28
          end
          object LCanal: TLabel
            Left = 25
            Top = 41
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Canal'
          end
          object LPorcentaje: TLabel
            Left = 1
            Top = 64
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'Porcentaje'
          end
          object LBPorcen: TLabel
            Left = 110
            Top = 64
            Width = 8
            Height = 13
            Alignment = taRightJustify
            Caption = '%'
          end
          object LCaja: TLabel
            Left = 31
            Top = 19
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Caja'
          end
          object LIMporte: TLabel
            Left = 17
            Top = 86
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Importe'
          end
          object DBCBResto: TLFDBCheckBox
            Left = 59
            Top = 106
            Width = 310
            Height = 17
            Caption = 'Resto'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 4
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'RESTO'
            DataSource = DMFacturacionCanal.DSQMCanales
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBETituloCanal: TLFDbedit
            Left = 106
            Top = 37
            Width = 265
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMFacturacionCanal.DSxCanal
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 6
          end
          object LFEFCanal: TLFDBEditFind2000
            Left = 58
            Top = 37
            Width = 47
            Height = 21
            DataField = 'CANAL'
            DataSource = DMFacturacionCanal.DSQMCanales
            TabOrder = 1
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CANALES_ACTIVOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CANAL'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CANAL')
            Filtros = [obEmpresa, obEjercicio]
            Entorno = DMMain.EntornoBusqueda
          end
          object LFDBPorcentaje: TLFDbedit
            Left = 58
            Top = 59
            Width = 47
            Height = 21
            DataField = 'PORCENTAJE'
            DataSource = DMFacturacionCanal.DSQMCanales
            TabOrder = 2
          end
          object LFEFCajas: TLFDBEditFind2000
            Left = 58
            Top = 15
            Width = 47
            Height = 21
            DataField = 'CAJA'
            DataSource = DMFacturacionCanal.DSQMCanales
            TabOrder = 0
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_CAJAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CAJA'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'CAJA')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBTituloCaja: TLFDbedit
            Left = 106
            Top = 15
            Width = 265
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMFacturacionCanal.DSxCaja
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
          end
          object LFDBImporte: TLFDbedit
            Left = 58
            Top = 81
            Width = 103
            Height = 21
            DataField = 'IMPORTE'
            DataSource = DMFacturacionCanal.DSQMCanales
            TabOrder = 3
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = DMFacturacionCanal.DSQMCanales
          CamposAMarcar.Strings = (
            'RESTO')
          CamposChecked.Strings = (
            '1')
          CamposNoChecked.Strings = (
            '0')
          CamposAOrdenar.Strings = (
            'CAJA'
            'CANAL'
            'PORCENTAJE'
            'RESTO')
          Columns = <
            item
              Expanded = False
              FieldName = 'CAJA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PORCENTAJE'
              Width = 79
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMPORTE'
              Width = 77
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RESTO'
              Width = 39
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
    Left = 300
    Top = 10
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 350
    Top = 10
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 324
    Top = 136
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 322
    Top = 102
  end
end
