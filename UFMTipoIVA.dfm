inherited FMTipoIva: TFMTipoIva
  Left = 346
  Top = 549
  HelpContext = 302
  Caption = 'Tipo de IVA ( Aplicado a Art'#237'culos )'
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
        DataSource = DMTipoIVA.DSQMTipoIva
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBETitulo
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
        Busca01 = DBETipo
        Busca02 = DBETitulo
        Busca03 = DBEP_Iva
        Busca04 = DBEP_Recargo
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 288
      end
      inherited TbuttComp: TToolButton
        Left = 296
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
            DataSource = DMTipoIVA.DSQMTipoIva
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'SYS_TIPO_IVA'
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            Filtros = [obPais]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'TIPO')
          end
          object LTipo: TLFLabel
            Left = 48
            Top = 16
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LTitulo: TLFLabel
            Left = 43
            Top = 38
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = 'Titulo'
          end
          object LPorIVA: TLFLabel
            Left = 32
            Top = 60
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'I.V.A. %'
          end
          object LPorRecargo: TLFLabel
            Left = 17
            Top = 82
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Recargo %'
          end
          object LRegimen: TLFLabel
            Left = 27
            Top = 103
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Regimen'
          end
          object DBETipo: TLFDbedit
            Left = 76
            Top = 12
            Width = 47
            Height = 21
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'TIPO'
            DataSource = DMTipoIVA.DSQMTipoIva
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 76
            Top = 34
            Width = 282
            Height = 21
            DataField = 'TITULO'
            DataSource = DMTipoIVA.DSQMTipoIva
            TabOrder = 1
          end
          object DBEP_Iva: TLFDbedit
            Left = 76
            Top = 56
            Width = 47
            Height = 21
            DataField = 'P_IVA'
            DataSource = DMTipoIVA.DSQMTipoIva
            TabOrder = 2
          end
          object DBEP_Recargo: TLFDbedit
            Left = 76
            Top = 78
            Width = 47
            Height = 21
            DataField = 'P_RECARGO'
            DataSource = DMTipoIVA.DSQMTipoIva
            TabOrder = 3
          end
          object DBCBActivo: TLFDBCheckBox
            Left = 234
            Top = 61
            Width = 97
            Height = 17
            Caption = 'Activo'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 5
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVO'
            DataSource = DMTipoIVA.DSQMTipoIva
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCBDefecto: TLFDBCheckBox
            Left = 234
            Top = 80
            Width = 97
            Height = 17
            Caption = 'IVA por defecto'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 6
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'DEFECTO'
            DataSource = DMTipoIVA.DSQMTipoIva
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBEFRegimen: TLFDBEditFind2000
            Left = 76
            Top = 100
            Width = 47
            Height = 21
            DataField = 'REGIMEN'
            DataSource = DMTipoIVA.DSQMTipoIva
            TabOrder = 4
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TIPO_REGIMEN'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object DBETitTipoRegimen: TLFDbedit
            Left = 124
            Top = 100
            Width = 234
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMTipoIVA.DSxSysTipoRegimen
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 7
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          DataSource = DMTipoIVA.DSQMTipoIva
          CamposAOrdenar.Strings = (
            'P_IVA'
            'P_RECARGO'
            'TIPO'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 34
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 219
              Visible = True
            end
            item
              Alignment = taCenter
              Expanded = False
              FieldName = 'P_IVA'
              Title.Alignment = taRightJustify
              Width = 42
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'P_RECARGO'
              Title.Alignment = taRightJustify
              Width = 45
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
    Left = 292
    Top = 12
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 336
    Top = 16
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 290
    Top = 88
  end
end
