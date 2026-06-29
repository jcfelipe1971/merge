inherited FMSysGestiones: TFMSysGestiones
  Left = 540
  Top = 257
  HelpContext = 286
  Caption = 'Mantenimiento de Gestiones'
  ClientHeight = 255
  ClientWidth = 594
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 594
    Height = 231
    inherited TBMain: TLFToolBar
      Width = 590
      inherited NavMain: THYMNavigator
        Hints.Strings = ()
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        Width = 46
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 274
      end
      inherited TbuttComp: TToolButton
        Left = 282
      end
      object PNLPaises: TLFPanel
        Left = 305
        Top = 0
        Width = 278
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object Label1: TLFLabel
          Left = 8
          Top = 4
          Width = 22
          Height = 13
          Caption = 'PGC'
        end
        object DBLBPGC: TDBLookupComboBox
          Left = 36
          Top = 0
          Width = 237
          Height = 21
          KeyField = 'PGC'
          ListField = 'TITULO'
          ListSource = DMSysGestiones.DSxPgC
          TabOrder = 0
        end
      end
    end
    inherited PCMain: TLFPageControl
      Width = 590
      Height = 201
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 582
          Height = 173
          object Label7: TLFLabel
            Left = 52
            Top = 54
            Width = 36
            Height = 13
            Caption = 'Gesti'#243'n'
          end
          object Label3: TLFLabel
            Left = 60
            Top = 77
            Width = 28
            Height = 13
            Caption = 'T'#237'tulo'
            FocusControl = DBETitulo
          end
          object LFLabel1: TLFLabel
            Left = 415
            Top = 54
            Width = 22
            Height = 13
            Caption = 'Pa'#237's'
          end
          object DBETitulo: TLFDbedit
            Left = 96
            Top = 74
            Width = 412
            Height = 21
            CharCase = ecUpperCase
            DataField = 'TITULO'
            DataSource = DMSysGestiones.DSGestiones
            TabOrder = 1
          end
          object DBEGestion: TLFDbedit
            Left = 96
            Top = 52
            Width = 89
            Height = 21
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'GESTION'
            DataSource = DMSysGestiones.DSGestiones
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBEPais: TLFDbedit
            Left = 443
            Top = 52
            Width = 65
            Height = 21
            TabStop = False
            CharCase = ecUpperCase
            Color = clInfoBk
            DataField = 'PAIS'
            DataSource = DMSysGestiones.DSGestiones
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 2
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Top = 173
          Width = 582
          Height = 0
          Align = alBottom
          ControlEdit = CEMain
          CamposAOrdenar.Strings = (
            'CUENTA'
            'NIVEL'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'CUENTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 331
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NIVEL'
              Width = 63
              Visible = True
            end>
        end
        object DBGFGestiones: TDBGridFind2000
          Left = 0
          Top = 0
          Width = 582
          Height = 173
          Align = alClient
          DataSource = DMSysGestiones.DSGestiones
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = DBGFGestionesDblClick
          IniStorage = FSMain
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          Idioma = 'CAS'
          AutoCambiarColumna = False
          AutoPostEnCheckBox = False
          AutoStartDrag = False
          AutoStartDragInterval = 0
          IndiceBitmapOrdenable = 0
          IndiceBitmapAscendente = 1
          IndiceBitmapChecked = 3
          IndiceBitmapDescendente = 2
          BaseDeDatos = DMMain.DataBase
          Transaction = DMSysGestiones.TLocal
          BuscarNums = False
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'GESTION'
            'TITULO')
          CamposNoAccesibles.Strings = (
            'PAIS'
            'PGC'
            'GESTION')
          CamposNoAccMenosAlIns.Strings = (
            'GESTION')
          MensajeNoExiste = False
          SalirSiVacio = False
          SalirSiNoExiste = False
          Posicion = tpCentrado
          OrdenMultiple = True
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PAIS'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Width = 29
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GESTION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'PGC'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 231
    Width = 594
  end
  inherited CEMain: TControlEdit
    FichaEdicion = nil
    FichaExclusiva = nil
    Left = 424
    Top = 16
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 384
    Top = 16
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 462
    Top = 34
  end
  inherited FSMain: TLFFibFormStorage
    Left = 498
    Top = 38
  end
end
