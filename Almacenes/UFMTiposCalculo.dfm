inherited FMTiposCalculo: TFMTiposCalculo
  Left = 371
  Top = 233
  Width = 400
  Height = 301
  HelpContext = 133
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Tipos de C'#225'lculo'
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 390
    Height = 248
    inherited TBMain: TLFToolBar
      Width = 386
      ButtonWidth = 25
      inherited NavMain: THYMNavigator
        DataSource = DMTiposCalculo.DSQMTiposCalculo
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBECalculo
        OnClickBefore = NavMainClickBefore
      end
      inherited EPMain: THYMEditPanel
        Width = 23
        VisibleButtons = [neSalir]
        Hints.Strings = ()
        Busca01 = DBECalculo
        Busca02 = DBETitulo
        Busca03 = DBEComision
      end
      inherited TSepTerc: TToolButton
        Left = 251
      end
      inherited TbuttComp: TToolButton
        Left = 259
      end
    end
    inherited PCMain: TLFPageControl
      Width = 386
      Height = 218
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 378
          Height = 190
          object LBLCalculo: TLFLabel
            Left = 49
            Top = 12
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'C'#225'lculo'
          end
          object LBLNombre: TLFLabel
            Left = 47
            Top = 34
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nombre'
          end
          object LBLComision: TLFLabel
            Left = 42
            Top = 144
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Comisi'#243'n'
          end
          object LBLCargo: TLFLabel
            Left = 45
            Top = 78
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cargo %'
          end
          object LBLCargoLinea: TLFLabel
            Left = 200
            Top = 77
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cargo Lineal'
          end
          object Label1: TLFLabel
            Left = 207
            Top = 99
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descuento'
          end
          object Label2: TLFLabel
            Left = 14
            Top = 100
            Width = 70
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cargo Comerc.'
          end
          object LBLTipoRedondeo: TLFLabel
            Left = 21
            Top = 166
            Width = 63
            Height = 13
            Alignment = taRightJustify
            Caption = 'T. Redondeo'
          end
          object LBLPrecioPuntos: TLFLabel
            Left = 193
            Top = 122
            Width = 66
            Height = 13
            Alignment = taRightJustify
            Caption = 'Precio Puntos'
          end
          object Label3: TLFLabel
            Left = 14
            Top = 55
            Width = 70
            Height = 13
            Alignment = taRightJustify
            Caption = 'T. Precio Base'
          end
          object LFactor: TLFLabel
            Left = 54
            Top = 122
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Factor'
          end
          object DBECalculo: TLFDbedit
            Left = 89
            Top = 8
            Width = 42
            Height = 21
            Color = clInfoBk
            DataField = 'CALCULO'
            DataSource = DMTiposCalculo.DSQMTiposCalculo
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 89
            Top = 30
            Width = 267
            Height = 21
            DataField = 'TITULO'
            DataSource = DMTiposCalculo.DSQMTiposCalculo
            TabOrder = 1
          end
          object DBEComision: TLFDbedit
            Left = 89
            Top = 140
            Width = 81
            Height = 21
            DataField = 'COMISION'
            DataSource = DMTiposCalculo.DSQMTiposCalculo
            TabOrder = 10
          end
          object DBECargoP: TLFDbedit
            Left = 89
            Top = 74
            Width = 81
            Height = 21
            DataField = 'CARGO_PORCENTUAL'
            DataSource = DMTiposCalculo.DSQMTiposCalculo
            TabOrder = 4
          end
          object DBECargoL: TLFDbedit
            Left = 264
            Top = 74
            Width = 92
            Height = 21
            DataField = 'CARGO_LINEAL'
            DataSource = DMTiposCalculo.DSQMTiposCalculo
            TabOrder = 5
          end
          object DBEDto: TLFDbedit
            Left = 264
            Top = 96
            Width = 92
            Height = 21
            DataField = 'DESCUENTO'
            DataSource = DMTiposCalculo.DSQMTiposCalculo
            TabOrder = 7
          end
          object DBECargoC: TLFDbedit
            Left = 89
            Top = 96
            Width = 81
            Height = 21
            DataField = 'CARGO_COMERCIAL'
            DataSource = DMTiposCalculo.DSQMTiposCalculo
            TabOrder = 6
          end
          object DBEFTipoRedondeo: TLFDBEditFind2000
            Left = 89
            Top = 162
            Width = 81
            Height = 21
            DataField = 'TIPO_REDONDEO'
            DataSource = DMTiposCalculo.DSQMTiposCalculo
            TabOrder = 11
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'SYS_TIPO_REDONDEOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO_REDONDEO'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'tipo_redondeo <> -1'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBETipoRedondeo: TLFDbedit
            Left = 171
            Top = 162
            Width = 185
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMTiposCalculo.DSxTipoRedondeo
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 12
          end
          object DBEPrecioPuntos: TLFDbedit
            Left = 264
            Top = 118
            Width = 92
            Height = 21
            DataField = 'PRECIO_PUNTOS'
            DataSource = DMTiposCalculo.DSQMTiposCalculo
            TabOrder = 9
          end
          object DBEFTipoPrecioBase: TLFDBEditFind2000
            Left = 89
            Top = 52
            Width = 81
            Height = 21
            DataField = 'TIPO_PRECIO_BASE'
            DataSource = DMTiposCalculo.DSQMTiposCalculo
            TabOrder = 2
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TIPO_PRECIO_BASE'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO_PRECIO_BASE'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object DBETitTPB: TLFDbedit
            Left = 171
            Top = 52
            Width = 185
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMTiposCalculo.DSxTiposPrecioBase
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
          object DBEFactor: TLFDbedit
            Left = 89
            Top = 118
            Width = 81
            Height = 21
            DataField = 'FACTOR'
            DataSource = DMTiposCalculo.DSQMTiposCalculo
            TabOrder = 8
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 190
          DataSource = DMTiposCalculo.DSQMTiposCalculo
          CamposAMarcar.Strings = (
            'IVA_INCLUIDO'
            'RE_INCLUIDO')
          CamposChecked.Strings = (
            '1'
            '1')
          CamposNoChecked.Strings = (
            '0'
            '0')
          CamposAOrdenar.Strings = (
            'CALCULO'
            'CARGO_COMERCIAL'
            'CARGO_LINEAL'
            'CARGO_PORCENTUAL'
            'COMISION'
            'DESCUENTO'
            'PRECIO_PUNTOS'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'CALCULO'
              Width = 42
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 263
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CARGO_PORCENTUAL'
              Title.Alignment = taRightJustify
              Width = 51
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CARGO_COMERCIAL'
              Width = 75
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMISION'
              Title.Alignment = taRightJustify
              Width = 55
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCUENTO'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CARGO_LINEAL'
              Title.Alignment = taRightJustify
              Width = 86
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECIO_PUNTOS'
              Width = 79
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FACTOR'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 248
    Width = 390
  end
  inherited CEMain: TControlEdit
    Left = 288
    Top = 8
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 346
    Top = 10
    inherited CEMainMibuscar: TMenuItem
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
    Left = 290
    Top = 56
  end
  inherited FSMain: TLFFibFormStorage
    Left = 346
    Top = 54
  end
end
