inherited FMArtBultos: TFMArtBultos
  Left = 425
  Top = 319
  Width = 488
  Height = 310
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Bultos'
  Position = poScreenCenter
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 478
    Height = 257
    inherited TBMain: TLFToolBar
      Width = 474
      inherited NavMain: THYMNavigator
        DataSource = DMArtBultos.DSQMArtBultos
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBETitulo
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        Width = 60
        VisibleButtons = [neBuscar, neRango, neSalir]
        Hints.Strings = ()
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
      Width = 474
      Height = 227
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 466
          Height = 199
          inherited G2KTableLoc: TG2KTBLoc
            Top = 39
            AutoSize = True
            DataSource = DMArtBultos.DSQMArtBultos
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'ART_BULTOS'
            CampoNum = 'BULTO'
            CampoStr = 'TITULO'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'BULTO')
          end
          object LBLBulto: TLFLabel
            Left = 49
            Top = 23
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Bulto'
          end
          object LBLTitulo: TLFLabel
            Left = 45
            Top = 46
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object LBLPeso: TLFLabel
            Left = 49
            Top = 89
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Peso'
          end
          object LBLVolumen: TLFLabel
            Left = 32
            Top = 132
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Volumen'
          end
          object LDiametroUnidades: TLFLabel
            Left = 30
            Top = 154
            Width = 42
            Height = 13
            Alignment = taRightJustify
            Caption = 'Di'#225'metro'
          end
          object LTipo: TLFLabel
            Left = 51
            Top = 65
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo'
          end
          object LAlto: TLFLabel
            Left = 55
            Top = 110
            Width = 18
            Height = 13
            Alignment = taRightJustify
            Caption = 'Alto'
          end
          object LAncho: TLFLabel
            Left = 185
            Top = 110
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ancho'
          end
          object LFondo: TLFLabel
            Left = 328
            Top = 110
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fondo'
          end
          object DBEBulto: TLFDbedit
            Left = 77
            Top = 19
            Width = 92
            Height = 21
            Color = clInfoBk
            DataField = 'BULTO'
            DataSource = DMArtBultos.DSQMArtBultos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnChange = DBEBultoChange
          end
          object DBETitulo: TLFDbedit
            Left = 77
            Top = 41
            Width = 377
            Height = 21
            DataField = 'TITULO'
            DataSource = DMArtBultos.DSQMArtBultos
            TabOrder = 1
          end
          object DBEPeso: TLFDbedit
            Left = 77
            Top = 85
            Width = 92
            Height = 21
            DataField = 'PESO'
            DataSource = DMArtBultos.DSQMArtBultos
            TabOrder = 4
          end
          object DBEDiametroUd: TLFDbedit
            Left = 77
            Top = 151
            Width = 92
            Height = 21
            DataField = 'DIAMETRO'
            DataSource = DMArtBultos.DSQMArtBultos
            TabOrder = 10
          end
          object DBEVolumen: TLFDbedit
            Left = 77
            Top = 129
            Width = 92
            Height = 21
            DataField = 'VOLUMEN'
            DataSource = DMArtBultos.DSQMArtBultos
            TabOrder = 8
          end
          object DBEFTipoBulto: TLFDBEditFind2000
            Left = 77
            Top = 63
            Width = 64
            Height = 21
            AutoSize = False
            CharCase = ecUpperCase
            DataField = 'TIPO_BULTO'
            DataSource = DMArtBultos.DSQMArtBultos
            TabOrder = 2
            OnChange = DBEFTipoBultoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'SYS_TIPO_BULTO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'TIPO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'TIPO')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMPedidos.EntornoDoc
          end
          object ETipoBulto: TLFEdit
            Left = 142
            Top = 63
            Width = 312
            Height = 21
            TabStop = False
            AutoSelect = False
            AutoSize = False
            Color = clInfoBk
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
          end
          object DBEAlto: TLFDbedit
            Left = 77
            Top = 107
            Width = 92
            Height = 21
            DataField = 'ALTO'
            DataSource = DMArtBultos.DSQMArtBultos
            TabOrder = 5
          end
          object DBEAncho: TLFDbedit
            Left = 220
            Top = 107
            Width = 92
            Height = 21
            DataField = 'ANCHO'
            DataSource = DMArtBultos.DSQMArtBultos
            TabOrder = 6
          end
          object DBEFondo: TLFDbedit
            Left = 362
            Top = 107
            Width = 92
            Height = 21
            DataField = 'FONDO'
            DataSource = DMArtBultos.DSQMArtBultos
            TabOrder = 7
          end
          object BCalcularVolumen: TButton
            Left = 170
            Top = 131
            Width = 21
            Height = 18
            Hint = 'Calcular Volumen'
            Caption = 'C'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 9
            Visible = False
            OnClick = BCalcularVolumenClick
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 466
          Height = 199
          CamposAMarcar.Strings = (
            'NO_UNIDADES')
          CamposAOrdenar.Strings = (
            'ALTO'
            'ANCHO'
            'BULTO'
            'DIAMETRO'
            'FONDO'
            'NO_UNIDADES'
            'PESO'
            'TIPO_BULTO'
            'TITULO'
            'VOLUMEN')
          Columns = <
            item
              Expanded = False
              FieldName = 'BULTO'
              Width = 37
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 260
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PESO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ANCHO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FONDO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VOLUMEN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DIAMETRO'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 257
    Width = 478
  end
  inherited CEMain: TControlEdit
    Left = 168
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 204
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 256
  end
  inherited FSMain: TLFFibFormStorage
    Left = 296
  end
end
