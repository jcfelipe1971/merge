inherited FMSaldosCon: TFMSaldosCon
  Left = 679
  Top = 219
  HelpContext = 252
  Caption = 'Saldos Contables Agrupados'
  ClientHeight = 287
  OldCreateOrder = True
  PopupMenu = CEDetallePMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Height = 263
    inherited TBMain: TLFToolBar
      inherited NavMain: THYMNavigator
        Hints.Strings = ()
        EditaControl = DBETitulo
        InsertaControl = DBETitulo
      end
      inherited EPMain: THYMEditPanel
        Width = 46
        VisibleButtons = [neImprime, neSalir]
        Hints.Strings = ()
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
      Height = 233
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Height = 174
          Align = alTop
          object Label1: TLFLabel
            Left = 26
            Top = 40
            Width = 41
            Height = 13
            Caption = 'Consulta'
          end
          object Label3: TLFLabel
            Left = 39
            Top = 62
            Width = 28
            Height = 13
            Caption = 'T'#237'tulo'
          end
          object DBEConsulta: TLFDbedit
            Left = 74
            Top = 36
            Width = 75
            Height = 21
            Color = clInfoBk
            DataField = 'CONSULTA'
            DataSource = DMSaldosCon.DSQMConsultas
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBRGModo: TDBRadioGroup
            Left = 74
            Top = 84
            Width = 215
            Height = 65
            Caption = 'Modo'
            DataField = 'MODO'
            DataSource = DMSaldosCon.DSQMConsultas
            Items.Strings = (
              'Desde el inicio del ejercicio'
              'Agrupado por periodos mensuales')
            TabOrder = 2
            Values.Strings = (
              '0'
              '1')
          end
          object DBETitulo: TLFDbedit
            Left = 74
            Top = 58
            Width = 381
            Height = 21
            DataField = 'TITULO'
            DataSource = DMSaldosCon.DSQMConsultas
            TabOrder = 1
          end
        end
        object TBCalculos: TLFToolBar
          Left = 0
          Top = 179
          Width = 490
          Height = 26
          Align = alBottom
          AutoSize = True
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          Separators = True
          object LBLCalculo: TLFPanel
            Left = 0
            Top = 0
            Width = 459
            Height = 22
            BevelOuter = bvNone
            TabOrder = 0
            object Label4: TLFLabel
              Left = 3
              Top = 0
              Width = 69
              Height = 22
              Alignment = taCenter
              AutoSize = False
              Caption = 'Fec.C'#225'lculo'
              Layout = tlCenter
            end
            object DTPFecha: TLFDateEdit
              Left = 71
              Top = 0
              Width = 87
              Height = 21
              CheckOnExit = True
              NumGlyphs = 2
              TabOrder = 0
            end
            object CBCanales: TLFComboBox
              Left = 159
              Top = 0
              Width = 124
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 1
              Items.Strings = (
                'Todos los canales')
            end
            object CBBorrado: TLFCheckBox
              Left = 290
              Top = 0
              Width = 63
              Height = 22
              Hint = 'Borra los saldos anteriores'
              Caption = 'Borrado'
              Checked = True
              State = cbChecked
              ClicksDisabled = False
              TabOrder = 2
              TabStop = True
              Alignment = taLeftJustify
            end
            object CBDetalle: TLFCheckBox
              Left = 355
              Top = 0
              Width = 96
              Height = 22
              Hint = 'Detalla las sub-cuentas'
              Caption = 'Detalla Cuentas'
              ClicksDisabled = False
              TabOrder = 3
              TabStop = True
              Alignment = taLeftJustify
            end
          end
        end
      end
      object TSDetalle: TTabSheet [1]
        Caption = '&Detalle'
        ImageIndex = 2
        OnShow = TSDetalleShow
        object TBDetalle: TLFToolBar
          Left = 0
          Top = 23
          Width = 490
          Height = 23
          AutoSize = True
          ButtonHeight = 21
          EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
          EdgeInner = esNone
          EdgeOuter = esNone
          TabOrder = 0
          Separators = True
          object NavDeta: THYMNavigator
            Left = 0
            Top = 2
            Width = 200
            Height = 21
            DataSource = DMSaldosCon.DSQMConsultasDet
            Flat = True
            ParentShowHint = False
            PopupMenu = CEDetallePMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            ControlEdit = CEDetalle
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object PArriba: TLFPanel
          Left = 0
          Top = 0
          Width = 490
          Height = 23
          Align = alTop
          BevelOuter = bvNone
          Enabled = False
          TabOrder = 1
          object Label2: TLFLabel
            Left = 6
            Top = 4
            Width = 41
            Height = 13
            Caption = 'Consulta'
          end
          object DBExConsulta: TLFDbedit
            Left = 54
            Top = 0
            Width = 75
            Height = 21
            Color = clInfoBk
            DataField = 'CONSULTA'
            DataSource = DMSaldosCon.DSQMConsultas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBExTitulo: TLFDbedit
            Left = 130
            Top = 0
            Width = 344
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = DMSaldosCon.DSQMConsultas
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
          end
        end
        object DBGFDetalle: TDBGridFind2000
          Left = 0
          Top = 46
          Width = 490
          Height = 159
          Align = alClient
          DataSource = DMSaldosCon.DSQMConsultasDet
          Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
          TabOrder = 2
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnKeyUp = DBGFDetalleKeyUp
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          AutoCambiarColumna = False
          AutoPostEnCheckBox = False
          AutoStartDrag = False
          AutoStartDragInterval = 0
          IndiceBitmapOrdenable = 0
          IndiceBitmapAscendente = 1
          IndiceBitmapChecked = 3
          IndiceBitmapDescendente = 2
          BaseDeDatos = DMMain.DataBase
          BuscarNums = True
          Campos.Strings = (
            'CUENTA')
          CamposAMostrar.Strings = (
            'CUENTA'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0')
          CamposADevolver.Strings = (
            'CUENTA')
          CamposDesplegar.Strings = (
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'CUENTA'
            'TITULO'
            'PORCENT'
            'MULTIPLICADOR')
          MensajeNoExiste = False
          Numericos.Strings = (
            'CUENTA')
          SalirSiVacio = False
          SalirSiNoExiste = False
          Tablas.Strings = (
            'CON_CUENTAS')
          Titulos.Strings = (
            'TITULO')
          Posicion = tpCentrado
          OrdenMultiple = True
          Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'CUENTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 261
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MULTIPLICADOR'
              Title.Alignment = taRightJustify
              Width = 35
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PORCENT'
              Title.Alignment = taRightJustify
              Visible = True
            end>
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Height = 205
          ReadOnly = True
          ControlEdit = CEMain
          CamposAOrdenar.Strings = (
            'CONSULTA'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'CONSULTA'
              Title.Alignment = taCenter
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 393
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 263
    EdgeOuter = esNone
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEDetalle
    Left = 388
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 424
    Top = 40
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMiimprime: TMenuItem
      Visible = True
    end
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 232
    Top = 50
    object AVerSaldo: TAction
      Category = 'Otros'
      Caption = 'Visualizar saldos'
      Hint = 'Visualizar saldos'
      ImageIndex = 125
      OnExecute = AVerSaldoExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Otros'
      Caption = 'Otros'
      ImageIndex = 99
    end
    object ARecalcula: TAction
      Category = 'Procesos'
      Caption = 'Recalcula la consulta'
      Hint = 'Recalcula la consulta'
      ImageIndex = 3
      OnExecute = ARecalculaExecute
    end
    object AEliminar: TAction
      Category = 'Procesos'
      Caption = 'Eliminar todas las consultas de este usuario'
      Hint = 'Eliminar todas las consultas de este usuario'
      ImageIndex = 27
      OnExecute = AEliminarExecute
    end
    object AEliminarTodo: TAction
      Category = 'Procesos'
      Caption = 'Eliminar TODAS las consultas'
      Hint = 'Eliminar TODAS las consultas'
      ImageIndex = 20
      OnExecute = AEliminarTodoExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 278
  end
  object CEDetalle: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TSDetalle
    FichaExclusiva = TSDetalle
    Complementario = TBMain
    PopUpMenu = CEDetallePMEdit
    Teclas = DMMain.Teclas
    Left = 390
    Top = 76
  end
  object CEDetallePMEdit: TPopUpTeclas
    Teclas = DMMain.Teclas
    Left = 430
    Top = 74
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
