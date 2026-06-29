inherited FMProdProduccion: TFMProdProduccion
  Left = 514
  Top = 292
  HelpContext = 278
  Caption = 'Procesos de Producci'#243'n'
  ClientHeight = 218
  ClientWidth = 390
  OldCreateOrder = True
  PopupMenu = CENotasPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 390
    Height = 194
    inherited TBMain: TLFToolBar
      Width = 386
      inherited NavMain: THYMNavigator
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBETitulo
      end
      inherited EPMain: THYMEditPanel
        Width = 46
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        Busca01 = DBEProceso
        Busca02 = DBETitulo
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 274
        Visible = False
      end
      inherited TbuttComp: TToolButton
        Left = 282
        Visible = False
      end
    end
    inherited PCMain: TLFPageControl
      Width = 386
      Height = 164
      ActivePage = TSNotas
      TabIndex = 1
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 378
          Height = 136
          object LBLProceso: TLFLabel
            Left = 23
            Top = 30
            Width = 39
            Height = 13
            Caption = 'Proceso'
          end
          object Label2: TLFLabel
            Left = 34
            Top = 52
            Width = 28
            Height = 13
            Caption = 'T'#237'tulo'
          end
          object LBLDuracion: TLFLabel
            Left = 19
            Top = 74
            Width = 43
            Height = 13
            Caption = 'Duraci'#243'n'
          end
          object Label1: TLFLabel
            Left = 144
            Top = 74
            Width = 28
            Height = 13
            Caption = 'Horas'
          end
          object LBLPrecio: TLFLabel
            Left = 32
            Top = 96
            Width = 30
            Height = 13
            Caption = 'Precio'
          end
          object DBEProceso: TLFDbedit
            Left = 68
            Top = 26
            Width = 41
            Height = 21
            DataField = 'PROCESO'
            DataSource = DMProdProduccion.DSQMProcesos
            TabOrder = 0
          end
          object DBETitulo: TLFDbedit
            Left = 68
            Top = 48
            Width = 301
            Height = 21
            DataField = 'TITULO'
            DataSource = DMProdProduccion.DSQMProcesos
            TabOrder = 1
          end
          object DBEDuracion: TLFDbedit
            Left = 68
            Top = 70
            Width = 69
            Height = 21
            DataField = 'DURACION'
            DataSource = DMProdProduccion.DSQMProcesos
            TabOrder = 2
            OnKeyPress = DBEDuracionKeyPress
          end
          object DBEPrecio: TLFDbedit
            Left = 68
            Top = 92
            Width = 104
            Height = 21
            DataField = 'PRECIO'
            DataSource = DMProdProduccion.DSQMProcesos
            TabOrder = 3
            OnKeyPress = DBEDuracionKeyPress
          end
        end
      end
      object TSNotas: TTabSheet [1]
        Caption = '&Notas'
        ImageIndex = 2
        OnShow = TSNotasShow
        object TBNotas: TLFToolBar
          Left = 0
          Top = 0
          Width = 378
          Height = 23
          AutoSize = True
          ButtonHeight = 21
          EdgeBorders = []
          TabOrder = 0
          Separators = True
          object PNLNotas: TLFPanel
            Left = 0
            Top = 2
            Width = 282
            Height = 21
            Align = alLeft
            BevelOuter = bvNone
            Enabled = False
            TabOrder = 0
            object DBEProcesosNot: TLFDbedit
              Left = 1
              Top = 1
              Width = 41
              Height = 21
              Color = clInfoBk
              DataField = 'PROCESO'
              DataSource = DMProdProduccion.DSQMProcesos
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
            end
            object DBEDesNotas: TLFDbedit
              Left = 43
              Top = 1
              Width = 239
              Height = 21
              Color = clInfoBk
              DataField = 'TITULO'
              DataSource = DMProdProduccion.DSQMProcesos
              Enabled = False
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
          end
          object ToolButton1: TToolButton
            Left = 282
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object NavNotas: THYMNavigator
            Left = 290
            Top = 2
            Width = 88
            Height = 21
            DataSource = DMProdProduccion.DSQMProcesos
            VisibleButtons = [nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            PopupMenu = CENotasPMEdit
            ShowHint = True
            TabOrder = 1
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBMNotas
            Exclusivo = False
            ControlEdit = CENotas
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object PNLENotas: TLFPanel
          Left = 0
          Top = 23
          Width = 378
          Height = 113
          Align = alClient
          Enabled = False
          TabOrder = 1
          object DBMNotas: TLFDBMemo
            Left = 1
            Top = 1
            Width = 376
            Height = 111
            Align = alClient
            DataField = 'NOTAS'
            DataSource = DMProdProduccion.DSQMProcesos
            TabOrder = 0
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 378
          Height = 136
          ControlEdit = CEMain
          CamposAOrdenar.Strings = (
            'DURACION'
            'PRECIO'
            'PROCESO'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'PROCESO'
              Width = 62
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 214
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DURACION'
              Width = 52
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECIO'
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
    EnlazadoA = CENotas
    Left = 210
    Top = 20
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 248
    Top = 8
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 248
    Top = 78
  end
  inherited FSMain: TLFFibFormStorage
    Left = 288
    Top = 78
  end
  object CENotas: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSNotas
    FichaExclusiva = TSNotas
    PanelEdicion = PNLENotas
    Complementario = TBMain
    SubComplementario = ALMain
    PopUpMenu = CENotasPMEdit
    Teclas = DMMain.Teclas
    Left = 237
    Top = 118
  end
  object CENotasPMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 274
    Top = 118
    object CENotasMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
      Visible = False
    end
    object CENotasMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
      Visible = False
    end
    object CENotasMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
      Visible = False
    end
    object CENotasMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
      Visible = False
    end
    object CENotasMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
      Visible = False
    end
    object CENotasMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
      Visible = False
    end
    object CENotasMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CENotasMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CENotasMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CENotasMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
