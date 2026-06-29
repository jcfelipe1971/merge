inherited ProFMMedidasOFC: TProFMMedidasOFC
  Left = 249
  Top = 185
  ActiveControl = PMain
  Caption = 'Mantenimiento de Medidas'
  ClientHeight = 419
  ClientWidth = 584
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 584
    Height = 201
    Align = alTop
    inherited TBMain: TLFToolBar
      Width = 580
      inherited NavMain: THYMNavigator
        Width = 60
        DataSource = ProDMMedidasOFC.DSMedidas
        VisibleButtons = [nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
      end
      inherited TSepNav: TToolButton
        Left = 60
      end
      inherited EPMain: THYMEditPanel
        Left = 68
        Width = 20
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Left = 88
      end
      inherited TbuttComp: TToolButton
        Left = 96
        Action = ANotas
        Caption = 'Generar notas y traspasar'
      end
    end
    inherited PCMain: TLFPageControl
      Width = 580
      Height = 171
      inherited TSFicha: TTabSheet
        object SBAEscandallo: TSpeedButton [0]
          Left = 152
          Top = 121
          Width = 23
          Height = 22
          GroupIndex = -1
          OnDblClick = SBAEscandalloDblClick
        end
        object SBAEscandalloG: TSpeedButton [1]
          Left = 244
          Top = 121
          Width = 23
          Height = 22
          GroupIndex = -1
          Caption = 'AEscandalloG'
          OnDblClick = AEscandalloGExecute
        end
        inherited PEdit: TLFPanel
          Width = 572
          Height = 143
          object LNotas: TLFLabel
            Left = 310
            Top = 51
            Width = 28
            Height = 13
            Caption = 'Notas'
          end
          object LMedida4: TLFLabel
            Left = 172
            Top = 79
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Medida 4'
          end
          object LMedida3: TLFLabel
            Left = 16
            Top = 79
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Medida 3'
          end
          object LMedida2: TLFLabel
            Left = 172
            Top = 58
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Medida 2'
          end
          object LMedida1: TLFLabel
            Left = 16
            Top = 58
            Width = 44
            Height = 13
            Alignment = taRightJustify
            Caption = 'Medida 1'
          end
          object LID: TLFLabel
            Left = 49
            Top = 11
            Width = 11
            Height = 13
            Alignment = taRightJustify
            Caption = 'ID'
          end
          object LEscandallo: TLFLabel
            Left = 5
            Top = 102
            Width = 55
            Height = 13
            Alignment = taRightJustify
            Caption = 'Esc. Origen'
          end
          object LArticulo: TLFLabel
            Left = 25
            Top = 35
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Articulo'
          end
          object LEstandallo: TLFLabel
            Left = 156
            Top = 100
            Width = 60
            Height = 13
            Alignment = taRightJustify
            Caption = 'Esc. Destino'
          end
          object LFID: TLFDbedit
            Left = 64
            Top = 9
            Width = 49
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ID_MEDIDA'
            DataSource = ProDMMedidasOFC.DSMedidas
            ReadOnly = True
            TabOrder = 0
            OnChange = LFIDChange
          end
          object LFDBNotas: TLFDBMemo
            Left = 310
            Top = 66
            Width = 257
            Height = 75
            DataField = 'NOTAS'
            DataSource = ProDMMedidasOFC.DSMedidas
            TabOrder = 8
          end
          object LFDBMedida4: TLFDbedit
            Left = 218
            Top = 75
            Width = 79
            Height = 21
            DataField = 'MEDIDA_4'
            DataSource = ProDMMedidasOFC.DSMedidas
            TabOrder = 6
          end
          object LFDBMedida3: TLFDbedit
            Left = 64
            Top = 75
            Width = 79
            Height = 21
            DataField = 'MEDIDA_3'
            DataSource = ProDMMedidasOFC.DSMedidas
            TabOrder = 5
          end
          object LFDBMedida2: TLFDbedit
            Left = 218
            Top = 53
            Width = 79
            Height = 21
            DataField = 'MEDIDA_2'
            DataSource = ProDMMedidasOFC.DSMedidas
            TabOrder = 4
          end
          object LFDBMedida1: TLFDbedit
            Left = 64
            Top = 53
            Width = 79
            Height = 21
            DataField = 'MEDIDA_1'
            DataSource = ProDMMedidasOFC.DSMedidas
            TabOrder = 3
          end
          object LFDBEscandalloOferta: TLFDbedit
            Left = 64
            Top = 97
            Width = 79
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ID_ESCANDALLO'
            DataSource = ProDMMedidasOFC.DSMedidas
            ReadOnly = True
            TabOrder = 7
          end
          object LDBArticulo: TLFDbedit
            Left = 64
            Top = 31
            Width = 121
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ARTICULO'
            DataSource = ProDMMedidasOFC.DSMedidas
            ReadOnly = True
            TabOrder = 1
          end
          object LFCBTraspasar: TLFDBCheckBox
            Left = 65
            Top = 122
            Width = 184
            Height = 17
            Caption = 'Traspasar tareas a notas oferta'
            ClicksDisabled = False
            TabOrder = 9
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'TRASPASAR_NOTAS_PEDIDO'
            DataSource = ProDMMedidasOFC.DSMedidas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DescArticulo: TLFDbedit
            Left = 186
            Top = 31
            Width = 286
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DescArticulo'
            DataSource = ProDMMedidasOFC.DSMedidas
            ReadOnly = True
            TabOrder = 2
          end
          object LFDBEscandallo: TLFDbedit
            Left = 218
            Top = 97
            Width = 79
            Height = 21
            DataField = 'ID_ESC_GENERADO'
            DataSource = ProDMMedidasOFC.DSMedidas
            TabOrder = 10
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 572
          Height = 143
          DataSource = ProDMMedidasOFC.DSMedidas
          Columns = <
            item
              Expanded = False
              FieldName = 'ID_MEDIDA'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ARTICULO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 30
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MEDIDA_1'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MEDIDA_2'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MEDIDA_3'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MEDIDA_4'
              Width = 50
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DescArticulo'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ID_ESCANDALLO'
              Width = 50
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 395
    Width = 584
  end
  object LFPanelDetall: TLFPanel [2]
    Left = 0
    Top = 201
    Width = 584
    Height = 194
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object TBDetalle: TLFToolBar
      Left = 0
      Top = 0
      Width = 584
      Height = 27
      EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
      Flat = True
      Images = DMMain.ILMain_Ac
      TabOrder = 0
      Separators = True
      object NavDetalle: THYMNavigator
        Left = 0
        Top = 0
        Width = 100
        Height = 22
        DataSource = ProDMMedidasOFC.DSDetMedidas
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
    object DBGDetall: TDBGridFind2000
      Left = 0
      Top = 27
      Width = 584
      Height = 167
      Align = alClient
      DataSource = ProDMMedidasOFC.DSDetMedidas
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
      IndiceBitmapChecked = 3
      IndiceBitmapDescendente = 0
      BaseDeDatos = DMMain.DataBase
      BuscarNums = False
      CampoAOrdenarColor = clInfoBk
      CampoAOrdenarBitmaps = DMMain.ILOrdGrid
      ColumnasCheckBoxes.Strings = (
        'Traspasar')
      ColumnasChecked.Strings = (
        '1')
      ColumnasNoChecked.Strings = (
        '0')
      MensajeNoExiste = False
      SalirSiVacio = False
      SalirSiNoExiste = False
      Posicion = tpCentrado
      OrdenMultiple = True
      Filtros = []
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TAREA'
          ReadOnly = True
          Width = 200
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CANTIDAD'
          ReadOnly = True
          Width = 60
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Traspasar'
          Width = 60
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LINEA_FASE'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'UNIDADES'
          Width = 55
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TIEMPO_UNITARIO'
          Visible = True
        end>
    end
  end
  inherited CEMainPMEdit: TPopUpTeclas
    inherited CEMainMifirst: TMenuItem
      Visible = False
    end
    inherited CEMainMiprior: TMenuItem
      Visible = False
    end
    inherited CEMainMinext: TMenuItem
      Visible = False
    end
    inherited CEMainMilast: TMenuItem
      Visible = False
    end
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMidelete: TMenuItem
      Visible = False
    end
    inherited CEMainMiedit: TMenuItem
      Visible = False
    end
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
    Top = 32
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
    object AGeneraEscandallo: TAction
      Category = 'Procesos'
      Caption = 'Generar Escandallo'
      OnExecute = AGeneraEscandalloExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Top = 32
  end
  object ALMedidas: TLFActionList
    Images = DMMain.ILMain_Ac
    Reset = False
    Enabled = True
    Changed = False
    Left = 496
    Top = 36
    object AEscandallo: TAction
      Caption = 'AEscandallo'
      OnExecute = AEscandalloExecute
    end
    object ANotas: TAction
      Caption = 'Traspasar tareas a notas oferta'
      Hint = 'Crear nota'
      OnExecute = ANotasExecute
    end
    object AEscandalloG: TAction
      Caption = 'AEscandalloG'
      OnExecute = AEscandalloGExecute
    end
  end
end
