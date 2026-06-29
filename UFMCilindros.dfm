inherited FMCilindros: TFMCilindros
  Left = 581
  Top = 248
  HelpContext = 290
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  Caption = 'Cilindros'
  ClientHeight = 433
  ClientWidth = 659
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 659
    Height = 409
    inherited TBMain: TLFToolBar
      Width = 655
      inherited NavMain: THYMNavigator
        DataSource = DMCilindros.DSQMCilindros
        Hints.Strings = ()
      end
      inherited EPMain: THYMEditPanel
        Width = 44
        VisibleButtons = [neBuscar, neSalir]
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 272
      end
      inherited TbuttComp: TToolButton
        Left = 280
      end
    end
    inherited PCMain: TLFPageControl
      Width = 655
      Height = 379
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 647
          Height = 351
          inherited G2KTableLoc: TG2KTBLoc
            Top = 62
            DataSource = DMCilindros.DSQMCilindros
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'EMP_CILINDROS'
            CampoNum = 'CILINDRO'
            CampoStr = 'DESCRIPCION'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'CILINDRO')
          end
          object LBCilindro: TLFLabel
            Left = 59
            Top = 27
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cilindro'
            FocusControl = DBECilindro
          end
          object LBZ: TLFLabel
            Left = 86
            Top = 71
            Width = 7
            Height = 13
            Alignment = taRightJustify
            Caption = 'Z'
            FocusControl = DBEZ
          end
          object LB1: TLFLabel
            Left = 63
            Top = 92
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Banda'
            FocusControl = DBEBanda
          end
          object LBDescripcion: TLFLabel
            Left = 39
            Top = 49
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
            FocusControl = DBEDescripcion
          end
          object LBArticulo: TLFLabel
            Left = 57
            Top = 137
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Art'#237'culo'
            FocusControl = DBEFArticulo
          end
          object LBLblMaquina: TLFLabel
            Left = 53
            Top = 114
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'M'#225'quina'
            FocusControl = DBEFMaquina
          end
          object DBECilindro: TLFDbedit
            Left = 98
            Top = 23
            Width = 71
            Height = 21
            Color = clInfoBk
            DataField = 'CILINDRO'
            DataSource = DMCilindros.DSQMCilindros
            TabOrder = 0
          end
          object DBEZ: TLFDbedit
            Left = 98
            Top = 67
            Width = 71
            Height = 21
            DataField = 'Z'
            DataSource = DMCilindros.DSQMCilindros
            TabOrder = 2
          end
          object DBEBanda: TLFDbedit
            Left = 98
            Top = 89
            Width = 71
            Height = 21
            DataField = 'BANDA'
            DataSource = DMCilindros.DSQMCilindros
            TabOrder = 3
          end
          object DBEDescripcion: TLFDbedit
            Left = 98
            Top = 45
            Width = 271
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = DMCilindros.DSQMCilindros
            TabOrder = 1
          end
          object DBEFArticulo: TLFDBEditFind2000
            Left = 98
            Top = 133
            Width = 71
            Height = 21
            DataField = 'ARTICULO'
            DataSource = DMCilindros.DSQMCilindros
            TabOrder = 4
            OnChange = DBEFArticuloChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ARTICULOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ARTICULO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ARTICULO')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EDescripcionArticulo: TLFEdit
            Left = 170
            Top = 133
            Width = 205
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 5
          end
          object DBEFMaquina: TLFDBEditFind2000
            Left = 98
            Top = 111
            Width = 71
            Height = 21
            DataField = 'CODMAQ'
            DataSource = DMCilindros.DSQMCilindros
            TabOrder = 6
            OnChange = DBEFMaquinaChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'PRO_MAQUINAS_C'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODMAQ'
            CampoStr = 'DESCRIPCION'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object EDescripcionMaquina: TLFEdit
            Left = 170
            Top = 110
            Width = 205
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            ReadOnly = True
            TabOrder = 7
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 448
          Height = 188
          DataSource = DMCilindros.DSQMCilindros
          ControlEdit = CEMain
          CamposAOrdenar.Strings = (
            'ARTICULO'
            'BANDA'
            'CILINDRO'
            'DESCRIPCION'
            'Z')
          Columns = <
            item
              Expanded = False
              FieldName = 'CILINDRO'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Z'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BANDA'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ARTICULO'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 409
    Width = 659
  end
  inherited CEMain: TControlEdit
    Left = 368
    Top = 12
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 404
    Top = 12
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Top = 60
  end
  inherited FSMain: TLFFibFormStorage
    Top = 60
  end
end
