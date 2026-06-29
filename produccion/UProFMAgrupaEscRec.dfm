inherited ProFMAgrupaEscRec: TProFMAgrupaEscRec
  Left = 379
  Top = 200
  Hint = 
    'Recurso que engloba los recursos por fase de un escandallo. Util' +
    'izado en c'#225'lculo de coste marcajes'
  Caption = 'Recurso por Agrupaci'#243'n Escandallo-Fase'
  ClientHeight = 255
  ClientWidth = 450
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 450
    Height = 231
    inherited TBMain: TLFToolBar
      Width = 446
      inherited NavMain: THYMNavigator
        DataSource = ProDMAgrupaEscRec.DSQMProEscRec
        Hints.Strings = ()
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Visible = True
      end
      inherited TbuttComp: TToolButton
        Hint = 'Recalcula precio'
        Visible = True
        OnClick = TbuttCompClick
      end
    end
    inherited PCMain: TLFPageControl
      Width = 446
      Height = 201
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 438
          Height = 173
          object LEscandallo: TLFLabel
            Left = 12
            Top = 48
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Escandallo'
          end
          object LFase: TLFLabel
            Left = 40
            Top = 70
            Width = 23
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fase'
          end
          object LRecurso: TLFLabel
            Left = 24
            Top = 27
            Width = 40
            Height = 13
            Alignment = taRightJustify
            Caption = 'Recurso'
          end
          object LPrecio: TLFLabel
            Left = 34
            Top = 92
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Precio'
          end
          object LFDescEsc: TLFEdit
            Left = 151
            Top = 47
            Width = 277
            Height = 21
            TabStop = False
            Color = clInfoBk
            ReadOnly = True
            TabOrder = 0
          end
          object LFDescFase: TLFEdit
            Left = 151
            Top = 69
            Width = 277
            Height = 21
            TabStop = False
            Color = clInfoBk
            ReadOnly = True
            TabOrder = 1
          end
          object LFDescRecurso: TLFEdit
            Left = 151
            Top = 24
            Width = 277
            Height = 21
            TabStop = False
            Color = clInfoBk
            ReadOnly = True
            TabOrder = 2
          end
          object DBEscandallo: TDBEditFind2000
            Left = 72
            Top = 46
            Width = 78
            Height = 21
            DataField = 'ID_ESC'
            DataSource = ProDMAgrupaEscRec.DSQMProEscRec
            TabOrder = 3
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'PRO_ESCANDALLO'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ID_ESC'
            CampoStr = 'COMPUESTO'
            CampoADevolver = 'ID_ESC'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBFase: TDBEditFind2000
            Left = 72
            Top = 68
            Width = 78
            Height = 21
            DataField = 'LINEA_FASE'
            DataSource = ProDMAgrupaEscRec.DSQMProEscRec
            TabOrder = 4
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'PRO_FASES_ESC'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'LINEA_FASE'
            CampoStr = 'FASE'
            CampoADevolver = 'LINEA_FASE'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBFaseBusqueda
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBRecurso: TDBEditFind2000
            Left = 72
            Top = 24
            Width = 78
            Height = 21
            DataField = 'RECURSO'
            DataSource = ProDMAgrupaEscRec.DSQMProEscRec
            TabOrder = 5
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'PRO_RECURSOS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'RECURSO'
            CampoStr = 'TITULO'
            CampoADevolver = 'RECURSO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OnBusqueda = DBRecursoBusqueda
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBPrecio: TLFDbedit
            Left = 72
            Top = 90
            Width = 79
            Height = 21
            DataField = 'PRECIO'
            DataSource = ProDMAgrupaEscRec.DSQMProEscRec
            TabOrder = 6
          end
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 231
    Width = 450
  end
end
