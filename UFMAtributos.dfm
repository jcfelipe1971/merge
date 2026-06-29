inherited FMAtributos: TFMAtributos
  Caption = 'Mantenimiento de Atributos'
  ClientWidth = 508
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 508
    inherited TBMain: TLFToolBar
      Width = 504
      inherited NavMain: THYMNavigator
        DataSource = DMAtributos.DSQMAtributos
        Hints.Strings = ()
      end
      inherited EPMain: THYMEditPanel
        Width = 78
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 306
      end
      inherited TbuttComp: TToolButton
        Left = 314
      end
      object PNLFiltroTipoAtributo: TLFPanel
        Left = 337
        Top = 0
        Width = 152
        Height = 22
        Anchors = [akLeft, akTop, akRight]
        BevelOuter = bvNone
        TabOrder = 2
        DesignSize = (
          152
          22)
        object CBTipoAtributo: TLFComboBox
          Left = 4
          Top = 1
          Width = 146
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          ItemHeight = 13
          TabOrder = 0
          OnChange = CBTipoAtributoChange
        end
      end
    end
    inherited PCMain: TLFPageControl
      Width = 504
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 496
          inherited G2KTableLoc: TG2KTBLoc
            Plan.Strings = (
              
                'PLAN JOIN (VER_ARTICULOS_CUENTAS GART INDEX (PK_CON_CUENTAS_GES_' +
                'ART),VER_ARTICULOS_CUENTAS ART INDEX (ID_A))')
            CamposADesplegar.Strings = (
              'TIPO')
            DataSource = DMAtributos.DSQMAtributos
            Tabla_a_buscar = 'ART_ATRIBUTO'
            CampoNum = 'ID'
            CampoStr = 'ATRIBUTO'
            OrdenadoPor.Strings = (
              'ATRIBUTO')
          end
          object LTipo: TLFLabel
            Left = 35
            Top = 47
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LAtributo: TLFLabel
            Left = 20
            Top = 69
            Width = 36
            Height = 13
            Alignment = taRightJustify
            Caption = 'Atributo'
          end
          object LFLabel1: TLFLabel
            Left = 35
            Top = 103
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LAtributoPadre: TLFLabel
            Left = -5
            Top = 125
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Atributo Pdre'
          end
          object DBEFTipo: TLFDBEditFind2000
            Left = 61
            Top = 44
            Width = 59
            Height = 21
            CharCase = ecUpperCase
            DataField = 'TIPO'
            DataSource = DMAtributos.DSQMAtributos
            TabOrder = 0
            OnChange = DBEFTipoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'ART_TIPO_ATRIBUTO'
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
          object ETituloTipo: TLFEdit
            Left = 121
            Top = 44
            Width = 344
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
          object DBEAtributo: TLFDbedit
            Left = 61
            Top = 66
            Width = 404
            Height = 21
            DataField = 'ATRIBUTO'
            DataSource = DMAtributos.DSQMAtributos
            TabOrder = 2
          end
          object DBEFTipoPadre: TLFDBEditFind2000
            Left = 61
            Top = 100
            Width = 59
            Height = 21
            CharCase = ecUpperCase
            DataField = 'TIPO_PADRE'
            DataSource = DMAtributos.DSQMAtributos
            TabOrder = 3
            OnChange = DBEFTipoPadreChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'ART_TIPO_ATRIBUTO'
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
          object ETituloTipoPadre: TLFEdit
            Left = 121
            Top = 100
            Width = 344
            Height = 21
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
          object DBEFAtributoPadre: TLFDBEditFind2000
            Left = 61
            Top = 122
            Width = 59
            Height = 21
            CharCase = ecUpperCase
            DataField = 'ID_PADRE'
            DataSource = DMAtributos.DSQMAtributos
            TabOrder = 5
            OnChange = DBEFAtributoPadreChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'ART_ATRIBUTO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ID'
            CampoStr = 'ATRIBUTO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBEFAtributoPadreBusqueda
            OrdenadoPor.Strings = (
              'TIPO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloAtributoPadre: TLFEdit
            Left = 121
            Top = 122
            Width = 344
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 6
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 496
          DataSource = DMAtributos.DSQMAtributos
          Columns = <
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ATRIBUTO'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Width = 508
  end
  inherited CEMain: TControlEdit
    DataSource = DMAtributos.DSQMAtributos
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
end
