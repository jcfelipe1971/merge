inherited ZFMMaquinasDet: TZFMMaquinasDet
  Left = 240
  Top = 329
  Caption = 'Mantenimiento Caracter'#237'sticas M'#225'quina'
  ClientHeight = 547
  ClientWidth = 756
  OldCreateOrder = True
  PopupMenu = CEDetallePMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 756
    Height = 523
    inherited TBMain: TLFToolBar
      Width = 752
      inherited NavMain: THYMNavigator
        DataSource = ZDMMaquinasDet.DSQMMaquinasC
        Hints.Strings = ()
        EditaControl = LFDBCodMaq
        InsertaControl = LFDBCodMaq
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
      inherited TbuttComp: TToolButton
        Visible = False
      end
    end
    inherited PCMain: TLFPageControl
      Width = 752
      Height = 493
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 744
          Height = 117
          Align = alTop
          inherited G2KTableLoc: TG2KTBLoc
            Left = 88
            Top = 44
            DataSource = ZDMMaquinasDet.DSQMMaquinasC
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'Z_MAQUINAS_CAB'
            CampoNum = 'CODMAQ'
            CampoStr = 'DESCRIPCION'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'CODMAQ')
          end
          object LRIG: TLFLabel
            Left = 48
            Top = 20
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'M'#225'quina'
          end
          object LObservaciones: TLFLabel
            Left = 67
            Top = 43
            Width = 22
            Height = 13
            Alignment = taRightJustify
            Caption = 'Obs.'
          end
          object LHorasCambioPlancha: TLFLabel
            Left = 192
            Top = 66
            Width = 108
            Height = 13
            Alignment = taRightJustify
            Caption = 'Horas Cambio Plancha'
          end
          object LCambioPlancha: TLFLabel
            Left = 12
            Top = 65
            Width = 77
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cambio Plancha'
          end
          object DBMNotas: TLFDBMemo
            Left = 93
            Top = 39
            Width = 572
            Height = 22
            DataField = 'OBSERVACIONES'
            DataSource = ZDMMaquinasDet.DSQMMaquinasC
            TabOrder = 2
          end
          object LFDBCodMaq: TLFDBEditFind2000
            Left = 93
            Top = 17
            Width = 88
            Height = 21
            DataField = 'CODMAQ'
            DataSource = ZDMMaquinasDet.DSQMMaquinasC
            TabOrder = 0
            OnChange = LFDBCodMaqChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'PRO_MAQUINAS_C'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CODMAQ'
            CampoStr = 'DESCRIPCION'
            CampoADevolver = 'CODMAQ'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
          end
          object DBDescMaquina: TLFDbedit
            Left = 182
            Top = 17
            Width = 483
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'DESCRIPCION'
            DataSource = ZDMMaquinasDet.DSxDescMaquina
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object LFDBTiempoCambio: TLFDbedit
            Left = 303
            Top = 62
            Width = 89
            Height = 21
            DataField = 'TIEMPO_CAMBIO_PLANCHA'
            DataSource = ZDMMaquinasDet.DSQMMaquinasC
            TabOrder = 4
          end
          object LFDBCambioPlancha: TLFDbedit
            Left = 93
            Top = 62
            Width = 89
            Height = 21
            DataField = 'ML_CAMBIO_PLANCHA'
            DataSource = ZDMMaquinasDet.DSQMMaquinasC
            TabOrder = 3
          end
        end
        object PDetalle: TLFPanel
          Left = 0
          Top = 141
          Width = 744
          Height = 324
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBGFDetalle: TDBGridFind2000
            Left = 0
            Top = 0
            Width = 744
            Height = 324
            Align = alClient
            DataSource = ZDMMaquinasDet.DSQMMaquinasD
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            Insercion = False
            ColumnaInicial = 3
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
            BaseDeDatos = DMMain.DataBase
            BuscarNums = False
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            MensajeNoExiste = False
            SalirSiVacio = False
            SalirSiNoExiste = False
            Posicion = tpCentrado
            OrdenMultiple = True
            Filtros = []
            Columns = <
              item
                Expanded = False
                FieldName = 'EMPRESA'
                Visible = False
              end
              item
                Expanded = False
                FieldName = 'CODMAQ'
                Visible = False
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'LINEA'
                ReadOnly = True
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TINTA'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'VELOCIDAD'
                Width = 75
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'GRAMOS_TINTA'
                Width = 112
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'GRAMOS_BARNIZ'
                Width = 122
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'POLIMEROS'
                Width = 83
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CAMBIO_COLOR'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'HORAS_PREPARACION'
                Visible = True
              end>
          end
        end
        object TBDetalle: TLFToolBar
          Left = 0
          Top = 117
          Width = 744
          Height = 24
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          TabOrder = 2
          Separators = True
          object NavDetalle: THYMNavigator
            Left = 0
            Top = 0
            Width = 240
            Height = 22
            DataSource = ZDMMaquinasDet.DSQMMaquinasD
            Flat = True
            ParentShowHint = False
            PopupMenu = CEDetallePMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFDetalle
            InsertaControl = DBGFDetalle
            Exclusivo = True
            ControlEdit = CEDetalle
            OrdenAscendente = True
            InsertaUltimo = True
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 744
          Height = 465
          DataSource = ZDMMaquinasDet.DSQMMaquinasC
          Columns = <
            item
              Expanded = False
              FieldName = 'CODMAQ'
              Width = 79
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBSERVACIONES'
              Width = 466
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 523
    Width = 756
    EdgeOuter = esNone
  end
  inherited CEMain: TControlEdit
    Left = 500
    Top = 24
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 528
    Top = 24
  end
  object CEDetalle: TControlEdit
    FichaEdicion = TSFicha
    FichaExclusiva = TSFicha
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 644
    Top = 27
  end
  object CEDetallePMEdit: TPopUpTeclas
    Left = 672
    Top = 32
    object CEDetalleMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEDetalleMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEDetalleMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEDetalleMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEDetalleMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 16429
    end
    object CEDetalleMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 16430
    end
    object CEDetalleMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEDetalleMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEDetalleMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEDetalleMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
