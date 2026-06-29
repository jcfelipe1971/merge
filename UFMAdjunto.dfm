inherited FMAdjunto: TFMAdjunto
  Left = 339
  Top = 236
  Width = 968
  Height = 450
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Adjunto'
  Constraints.MinWidth = 850
  FormStyle = fsNormal
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 958
    Height = 397
    TabOrder = 1
    inherited TBMain: TLFToolBar
      Width = 954
      inherited NavMain: THYMNavigator
        DataSource = DMAdjunto.DSQMAdjuntos
        Hints.Strings = ()
        OnClickAfterAdjust = NavMainClickAfterAdjust
      end
      inherited EPMain: THYMEditPanel
        Width = 21
        DataSource = DMAdjunto.DSQMAdjuntos
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 249
      end
      inherited TbuttComp: TToolButton
        Left = 257
        ImageIndex = 26
      end
      object TBCambiaDestinoAdjunto: TToolButton
        Left = 280
        Top = 0
        Action = AMoverABD
      end
    end
    object PNLAdjuntos: TLFPanel
      Left = 2
      Top = 28
      Width = 954
      Height = 367
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object DBGFAdjuntos: TDBGridFind2000
        Left = 0
        Top = 29
        Width = 954
        Height = 338
        Align = alClient
        DataSource = DMAdjunto.DSQMAdjuntos
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        OnDblClick = DBGFAdjuntosDblClick
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
        BuscarNums = False
        CampoAOrdenarColor = clInfoBk
        CampoAOrdenarBitmaps = DMMain.ILOrdGrid
        ColumnasCheckBoxes.Strings = (
          'WEB')
        ColumnasChecked.Strings = (
          '1')
        ColumnasNoChecked.Strings = (
          '0')
        MensajeNoExiste = False
        SalirSiVacio = False
        SalirSiNoExiste = False
        Posicion = tpCentrado
        OnRowChange = DBGFAdjuntosRowChange
        OrdenMultiple = True
        Filtros = []
        Columns = <
          item
            Expanded = False
            FieldName = 'TITULO_ADJUNTO'
            Width = 400
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DESCRIPCION_REPOSITORIO'
            Width = 156
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'NOMBRE'
            ReadOnly = True
            Width = 163
            Visible = True
          end
          item
            Color = clInfoBk
            Expanded = False
            FieldName = 'FECHA'
            ReadOnly = True
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'WEB'
            Visible = True
          end>
      end
      object PNLTitulo: TLFPanel
        Left = 0
        Top = 0
        Width = 954
        Height = 29
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          954
          29)
        object DBETituloRelacion: TLFDbedit
          Left = 4
          Top = 4
          Width = 948
          Height = 21
          Anchors = [akLeft, akTop, akRight]
          Color = clInfoBk
          DataField = 'TITULO'
          DataSource = DMAdjunto.DSQMAdjuntos
          Enabled = False
          TabOrder = 0
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 397
    Width = 958
    EdgeBorders = []
    TabOrder = 0
  end
  inherited CEMain: TControlEdit
    DataSource = DMAdjunto.DSQMAdjuntos
    Left = 360
    Top = 8
  end
  inherited CEMainPMEdit: TPopUpTeclas
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
    Left = 432
    Top = 8
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Archivo'
      Caption = 'Archivo'
      ImageIndex = 57
    end
    object AAbrir: TAction
      Category = 'Archivo'
      Caption = 'Abrir'
      Hint = 'Abre el archivo'
      ImageIndex = 65
      OnExecute = AAbrirExecute
    end
    object AGrabarComo: TAction
      Category = 'Archivo'
      Caption = 'Guardar como'
      Hint = 'Guarda el archivo en una carpeta local'
      ImageIndex = 41
      OnExecute = AGrabarComoExecute
    end
    object AEnviarEmail: TAction
      Category = 'Archivo'
      Caption = 'Enviar por Email'
      Hint = 'Envia el archivo como adjunto en un email.'
      ImageIndex = 34
      OnExecute = AEnviarEmailExecute
    end
    object AImprimir: TAction
      Category = 'Archivo'
      Caption = 'Imprimir'
      ImageIndex = 14
      OnExecute = AImprimirExecute
    end
    object AMoverABD: TAction
      Category = 'Procesos'
      Caption = 'Mover archivo de fichero a base de datos'
      Hint = 'Mover archivo de fichero a base de datos'
      ImageIndex = 43
      OnExecute = AMoverABDExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AMoverAFichero: TAction
      Category = 'Procesos'
      Caption = 'Mover a Fichero'
      Hint = 'Mover a Fichero'
      ImageIndex = 42
      OnExecute = AMoverAFicheroExecute
    end
    object AMoverABDAdjunto: TAction
      Category = 'Procesos'
      Caption = 'Mover archivo de fichero a base de datos de Adjuntos'
      Hint = 'Mover archivo de fichero a base de datos de Adjuntos'
      ImageIndex = 43
      OnExecute = AMoverABDAdjuntoExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 472
    Top = 8
  end
end
