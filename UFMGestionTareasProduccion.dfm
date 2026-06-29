inherited FMGestionTareasProduccion: TFMGestionTareasProduccion
  Left = 325
  Top = 186
  Width = 800
  Height = 500
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Gesti'#243'n de Tareas de Producci'#243'n'
  Constraints.MinHeight = 500
  Constraints.MinWidth = 800
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 790
    Height = 447
    inherited TBMain: TLFToolBar
      Width = 786
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
      end
    end
    object PNLInformacion: TLFPanel
      Left = 2
      Top = 69
      Width = 786
      Height = 376
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 1
      object Splitter1: TSplitter
        Left = 263
        Top = 0
        Width = 6
        Height = 376
        Cursor = crHSplit
      end
      object PNLTareas: TLFPanel
        Left = 0
        Top = 0
        Width = 263
        Height = 376
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object PNLCabTarea: TLFPanel
          Left = 0
          Top = 0
          Width = 263
          Height = 40
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object LTarea: TLFLabel
            Left = 0
            Top = 0
            Width = 263
            Height = 13
            Align = alTop
            Alignment = taCenter
            Caption = 'Tarea'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object NavTarea: THYMNavigator
            Left = 2
            Top = 16
            Width = 100
            Height = 22
            DataSource = CrmDMConsultaAcciones.DSxSeguimiento
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
            Flat = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object DBGTareas: TDBGridFind2000
          Left = 0
          Top = 40
          Width = 263
          Height = 336
          Align = alClient
          DataSource = DMGestionTareasProduccion.DSQMTarea
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          AutoCambiarColumna = False
          AutoPostEnCheckBox = False
          AutoStartDrag = False
          AutoStartDragInterval = 0
          IndiceBitmapOrdenable = 0
          IndiceBitmapAscendente = 0
          IndiceBitmapChecked = -1
          IndiceBitmapDescendente = 0
          BuscarNums = False
          CampoAOrdenarColor = clInfoBk
          MensajeNoExiste = False
          SalirSiVacio = False
          SalirSiNoExiste = False
          Posicion = tpCentrado
          OrdenMultiple = True
          Filtros = []
          Columns = <
            item
              Expanded = False
              FieldName = 'FECHA_INICIO_TAREA'
              Width = 82
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EJERCICIO'
              Width = 39
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SERIES'
              Width = 39
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RIG_OF'
              Width = 54
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LINEA_FASE'
              Width = 42
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SUBORDEN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LINEA_TAREA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TAREA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ORDEN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPOTAREA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMENTARIO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RECURSO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANTIDAD'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ARTICULO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRE_COS_UNI_PRE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL_VAR_PRE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECIO_FIJO_PRE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL_PRE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRE_COS_UNI_REAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL_VAR_REAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECIO_FIJO_REAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL_REAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_FIN_TAREA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IDENTIFICADOR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ENTRADA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_ORDEN'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANTIDAD_UTIL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_UTILLAJE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESC_UTILLAJE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIEMPO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIEMPO_UTIL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UDS_FABRICADAS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CANTIDAD_IMPUTADA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OPERACIONES_NUM'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OPERACIONES_TIEMPO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL_IMP'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PRECIO_IMP'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TOTAL_HORAS'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MAQUINA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIEMPO_PRODUCCION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FORMULA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RESULTADO_FORMULA'
              Visible = True
            end>
        end
      end
      object PNLResto: TLFPanel
        Left = 269
        Top = 0
        Width = 517
        Height = 376
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        object PNLFase: TLFPanel
          Left = 0
          Top = 0
          Width = 517
          Height = 121
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object LFase: TLFLabel
            Left = 0
            Top = 0
            Width = 517
            Height = 13
            Align = alTop
            Alignment = taCenter
            Caption = 'Fase'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LFaseLinea: TLFLabel
            Left = 37
            Top = 16
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = 'Linea'
          end
          object LFaseFase: TLFLabel
            Left = 40
            Top = 40
            Width = 23
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fase'
          end
          object LFaseEstado: TLFLabel
            Left = 30
            Top = 59
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Estado'
          end
          object LOrdenCompuesto: TLFLabel
            Left = 243
            Top = 16
            Width = 53
            Height = 13
            Alignment = taRightJustify
            Caption = 'Compuesto'
          end
          object LOrdenEscandallo: TLFLabel
            Left = 244
            Top = 40
            Width = 52
            Height = 13
            Alignment = taRightJustify
            Caption = 'Escandallo'
          end
          object LOrdenEstado: TLFLabel
            Left = 263
            Top = 59
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Estado'
          end
          object DBEFaseLinea: TLFDbedit
            Left = 69
            Top = 12
            Width = 121
            Height = 21
            DataField = 'LINEA_FASE'
            DataSource = DMGestionTareasProduccion.DSQMFase
            TabOrder = 0
          end
          object DBEFaseFase: TLFDbedit
            Left = 69
            Top = 34
            Width = 121
            Height = 21
            DataField = 'FASE'
            DataSource = DMGestionTareasProduccion.DSQMFase
            TabOrder = 1
          end
          object DBEFaseEstado: TLFDbedit
            Left = 69
            Top = 56
            Width = 121
            Height = 21
            DataField = 'ESTADO'
            DataSource = DMGestionTareasProduccion.DSQMFase
            TabOrder = 2
          end
          object DBEOrdenCompuesto: TLFDbedit
            Left = 302
            Top = 12
            Width = 121
            Height = 21
            DataField = 'COMPUESTO'
            DataSource = DMGestionTareasProduccion.DSQMOrden
            TabOrder = 3
          end
          object DBEOrdenEscandallo: TLFDbedit
            Left = 302
            Top = 34
            Width = 121
            Height = 21
            DataField = 'ESCANDALLO'
            DataSource = DMGestionTareasProduccion.DSQMOrden
            TabOrder = 4
          end
          object DBEOrdenEstado: TLFDbedit
            Left = 302
            Top = 56
            Width = 121
            Height = 21
            DataField = 'ESTADO'
            DataSource = DMGestionTareasProduccion.DSQMOrden
            TabOrder = 5
          end
        end
        object PNLMaterial: TLFPanel
          Left = 0
          Top = 121
          Width = 517
          Height = 121
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 1
          object LMaterial: TLFLabel
            Left = 0
            Top = 0
            Width = 517
            Height = 13
            Align = alTop
            Alignment = taCenter
            Caption = 'Material'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object LMaterialLinea: TLFLabel
            Left = 37
            Top = 16
            Width = 26
            Height = 13
            Alignment = taRightJustify
            Caption = 'Linea'
          end
          object LMaterialTipoPieza: TLFLabel
            Left = 13
            Top = 40
            Width = 50
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tipo Pieza'
          end
          object LMaterialEstado: TLFLabel
            Left = 30
            Top = 59
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Estado'
          end
          object DBEMaterialLinea: TLFDbedit
            Left = 69
            Top = 12
            Width = 121
            Height = 21
            DataField = 'LINEA_MAT'
            DataSource = DMGestionTareasProduccion.DSQMMaterial
            TabOrder = 0
          end
          object DBEMaterialTipoPieza: TLFDbedit
            Left = 69
            Top = 34
            Width = 121
            Height = 21
            DataField = 'TIPO_PIEZA'
            DataSource = DMGestionTareasProduccion.DSQMMaterial
            TabOrder = 1
          end
          object DBEMaterialEstado: TLFDbedit
            Left = 69
            Top = 56
            Width = 121
            Height = 21
            DataField = 'ESTADO'
            DataSource = DMGestionTareasProduccion.DSQMMaterial
            TabOrder = 2
          end
        end
        object PNLMarcajes: TLFPanel
          Left = 0
          Top = 242
          Width = 517
          Height = 134
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 2
          object LMarcajers: TLFLabel
            Left = 0
            Top = 0
            Width = 517
            Height = 13
            Align = alTop
            Alignment = taCenter
            Caption = 'Marcajes'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBGridFind20001: TDBGridFind2000
            Left = 0
            Top = 13
            Width = 517
            Height = 121
            Align = alClient
            DataSource = DMGestionTareasProduccion.DSQMMarcajes
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Insercion = False
            ColumnaInicial = 0
            UsaDicG2K = True
            Changed = False
            AutoCambiarColumna = False
            AutoPostEnCheckBox = False
            AutoStartDrag = False
            AutoStartDragInterval = 0
            IndiceBitmapOrdenable = 0
            IndiceBitmapAscendente = 0
            IndiceBitmapChecked = -1
            IndiceBitmapDescendente = 0
            BuscarNums = False
            CampoAOrdenarColor = clInfoBk
            MensajeNoExiste = False
            SalirSiVacio = False
            SalirSiNoExiste = False
            Posicion = tpCentrado
            OrdenMultiple = True
            Filtros = []
            Columns = <
              item
                Expanded = False
                FieldName = 'ID'
                Width = 29
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CADENA'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PROCESADO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA_LECTURA'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FECHA_PROCESADO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ID_GRUPO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'EMPRESA'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'EJERCICIO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CANAL'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SERIE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'BORRAR_DETALLE'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'HORA_PROCESADO'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ID_TAREA'
                Visible = True
              end>
          end
        end
      end
    end
    object PNLFiltro: TLFPanel
      Left = 2
      Top = 28
      Width = 786
      Height = 41
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object LEstado: TLFLabel
        Left = 12
        Top = 11
        Width = 33
        Height = 13
        Alignment = taRightJustify
        Caption = 'Estado'
      end
      object CBEstado: TLFComboBox
        Left = 49
        Top = 8
        Width = 105
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          'E-Mail'
          'Fax'
          'Llamada Telef'#243'nica'
          'Todos')
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 447
    Width = 790
    EdgeOuter = esNone
  end
  inherited CEMain: TControlEdit
    Left = 688
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 724
    Top = 4
  end
  inherited ALMain: TLFActionList
    Left = 613
    Top = 4
  end
  inherited FSMain: TLFFibFormStorage
    Left = 653
    Top = 4
  end
end
