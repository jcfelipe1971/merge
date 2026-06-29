inherited FMPGCEquivalencias: TFMPGCEquivalencias
  Left = 357
  Top = 223
  Caption = 'PGC Equivalencias'
  ClientHeight = 492
  ClientWidth = 761
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 761
    Height = 468
    inherited TBMain: TLFToolBar
      Width = 757
      inherited NavMain: THYMNavigator
        Hints.Strings = ()
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        Width = 44
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 272
      end
      inherited TbuttComp: TToolButton
        Left = 280
        Width = 8
        Caption = 'AOpen'
        Style = tbsSeparator
      end
      object LFPanel1: TLFPanel
        Left = 288
        Top = 0
        Width = 427
        Height = 22
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 2
        DesignSize = (
          427
          22)
        object LBLFlecha: TLFLabel
          Left = 205
          Top = 0
          Width = 20
          Height = 22
          Alignment = taCenter
          AutoSize = False
          Caption = '>>'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Layout = tlCenter
        end
        object DBLCBOPGC: TDBLookupComboBox
          Left = 3
          Top = 1
          Width = 200
          Height = 21
          Anchors = [akTop, akRight]
          KeyField = 'PGC'
          ListField = 'TITULO'
          ListSource = DMPGCEquivalencias.DSxOPGCs
          TabOrder = 0
        end
        object DBLCBDPGC: TDBLookupComboBox
          Left = 224
          Top = 1
          Width = 200
          Height = 21
          KeyField = 'PGC'
          ListField = 'TITULO'
          ListSource = DMPGCEquivalencias.DSxDPGCs
          TabOrder = 1
        end
      end
      object ToolButton1: TToolButton
        Left = 715
        Top = 0
        ImageIndex = 26
        OnClick = ToolButton1Click
      end
    end
    inherited PCMain: TLFPageControl
      Width = 757
      Height = 438
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 749
          Height = 410
          object GBOrigen: TGroupBox
            Left = 0
            Top = 0
            Width = 749
            Height = 84
            Align = alTop
            Caption = 'PGC Origen'
            TabOrder = 0
            object LBLOCuenta: TLFLabel
              Left = 7
              Top = 28
              Width = 34
              Height = 13
              Caption = 'Cuenta'
            end
            object LBLOTitulo: TLFLabel
              Left = 7
              Top = 52
              Width = 28
              Height = 13
              Caption = 'T'#237'tulo'
            end
            object DBEOCuenta: TLFDbedit
              Left = 54
              Top = 24
              Width = 159
              Height = 21
              CharCase = ecUpperCase
              DataField = 'O_CUENTA'
              DataSource = DMPGCEquivalencias.DSQMEquivalencias
              TabOrder = 0
            end
            object DBEOTitulo: TLFDbedit
              Left = 54
              Top = 48
              Width = 681
              Height = 21
              DataField = 'O_TITULO'
              DataSource = DMPGCEquivalencias.DSQMEquivalencias
              TabOrder = 1
            end
          end
          object GBDestino: TGroupBox
            Left = 0
            Top = 84
            Width = 749
            Height = 84
            Align = alTop
            Caption = 'PGC Destino'
            TabOrder = 1
            object LBLDCuenta: TLFLabel
              Left = 7
              Top = 28
              Width = 34
              Height = 13
              Caption = 'Cuenta'
            end
            object LBLDTitulo: TLFLabel
              Left = 15
              Top = 52
              Width = 28
              Height = 13
              Caption = 'T'#237'tulo'
            end
            object DBEDCuenta: TLFDbedit
              Left = 54
              Top = 23
              Width = 158
              Height = 21
              DataField = 'D_CUENTA'
              DataSource = DMPGCEquivalencias.DSQMEquivalencias
              TabOrder = 0
            end
            object DBEDTitulo: TLFDbedit
              Left = 54
              Top = 48
              Width = 681
              Height = 21
              DataField = 'D_TITULO'
              DataSource = DMPGCEquivalencias.DSQMEquivalencias
              TabOrder = 1
            end
          end
          object LFDBNotas: TLFDBMemo
            Left = 0
            Top = 168
            Width = 749
            Height = 242
            Align = alClient
            DataField = 'NOTAS'
            DataSource = DMPGCEquivalencias.DSQMEquivalencias
            TabOrder = 2
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Top = 410
          Width = 749
          Height = 0
          Align = alBottom
          CamposAOrdenar.Strings = (
            'D_CUENTA'
            'D_PGC'
            'D_TITULO'
            'O_CUENTA'
            'O_PGC'
            'O_TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'O_TITULO'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'O_CUENTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'D_TITULO'
              Width = 300
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'D_CUENTA'
              Visible = True
            end>
        end
        object DBGFEquivalencias: TDBGridFind2000
          Left = 0
          Top = 0
          Width = 749
          Height = 410
          Align = alClient
          DataSource = DMPGCEquivalencias.DSQMEquivalencias
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnDblClick = DBGFEquivalenciasDblClick
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
          IndiceBitmapChecked = -1
          IndiceBitmapDescendente = 2
          BaseDeDatos = DMMain.DataBase
          Transaction = DMPGCEquivalencias.TLocal
          BuscarNums = False
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'D_CUENTA'
            'D_TITULO'
            'O_TITULO'
            'O_CUENTA')
          CamposNoAccesibles.Strings = (
            'D_PGC'
            'O_PGC'
            'ID_PGC_EQUIVALENCIA'
            'NOTAS')
          MensajeNoExiste = False
          SalirSiVacio = False
          SalirSiNoExiste = False
          Posicion = tpCentrado
          OrdenMultiple = True
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'O_TITULO'
              Width = 400
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'O_CUENTA'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'O_PGC'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clGrayText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'D_TITULO'
              Width = 400
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'D_CUENTA'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'D_PGC'
              Title.Font.Charset = DEFAULT_CHARSET
              Title.Font.Color = clGrayText
              Title.Font.Height = -11
              Title.Font.Name = 'MS Sans Serif'
              Title.Font.Style = []
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 468
    Width = 761
  end
  inherited CEMain: TControlEdit
    FichaEdicion = nil
    FichaExclusiva = nil
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
end
