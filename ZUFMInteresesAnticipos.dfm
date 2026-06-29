inherited ZFMInteresesAnticipos: TZFMInteresesAnticipos
  Left = 293
  Top = 184
  Caption = 'Intereses Anticipos'
  ClientHeight = 412
  ClientWidth = 538
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 538
    Height = 169
    inherited TBMain: TLFToolBar
      Width = 534
      inherited NavMain: THYMNavigator
        Hints.Strings = ()
        EditaControl = DBECliente
        InsertaControl = DBECliente
      end
      inherited EPMain: THYMEditPanel
        Width = 21
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      inherited TSepTerc: TToolButton
        Visible = True
        Left = 249
      end
      inherited TbuttComp: TToolButton
        Left = 257
        ImageIndex = 19
        Visible = True
        OnClick = TbuttCompClick
      end
      object TButtMostrarTodos: TToolButton
        Left = 280
        Top = 0
        Hint = 'Mostrar Todos'
        Caption = 'Mostrar Todos'
        ImageIndex = 18
        OnClick = TButtMostrarTodosClick
      end
    end
    inherited PCMain: TLFPageControl
      Width = 534
      Height = 139
      inherited TSFicha: TTabSheet
        object SBVerAsientos: TSpeedButton [0]
          Left = 336
          Top = 105
          Width = 79
          Height = 19
          Hint = 'Doble click o Ctrl+Alt+S para ver el asiento generado'
          GroupIndex = -1
          Down = True
          OnDblClick = SBVerAsientosDblClick
        end
        inherited PEdit: TLFPanel
          Width = 526
          Height = 111
          inherited G2KTableLoc: TG2KTBLoc
            Top = 38
          end
          object LCliente: TLFLabel
            Left = 42
            Top = 26
            Width = 38
            Height = 13
            Alignment = taRightJustify
            Caption = 'LCliente'
          end
          object LFechaCorte: TLFLabel
            Left = 24
            Top = 70
            Width = 58
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha Corte'
          end
          object LPorInteres: TLFLabel
            Left = 38
            Top = 92
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = '% Inter'#233's'
          end
          object LAsiento: TLFLabel
            Left = 297
            Top = 92
            Width = 35
            Height = 13
            Alignment = taRightJustify
            Caption = 'Asiento'
          end
          object LCtaContrapartida: TLFLabel
            Left = 18
            Top = 48
            Width = 62
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cta. de Pago'
          end
          object LID: TLFLabel
            Left = 70
            Top = 4
            Width = 11
            Height = 13
            Alignment = taRightJustify
            Caption = 'ID'
          end
          object DBEAsiento: TLFDbedit
            Left = 336
            Top = 88
            Width = 83
            Height = 21
            Color = clAqua
            DataField = 'ASIENTO_VISIBLE'
            DataSource = ZDMInteresesAnticipos.DSQMAnticipos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
          end
          object DBECliente: TLFDBEditFind2000
            Left = 86
            Top = 22
            Width = 91
            Height = 21
            DataField = 'CLIENTE'
            DataSource = ZDMInteresesAnticipos.DSQMAnticipos
            TabOrder = 1
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CLIENTES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CLIENTE'
            CampoStr = 'TITULO'
            CampoADevolver = 'CLIENTE'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBETituloCliente: TLFDbedit
            Left = 178
            Top = 22
            Width = 333
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = ZDMInteresesAnticipos.DSxClientes
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
          object DBDTPFecha: TLFDBDateEdit
            Left = 86
            Top = 66
            Width = 91
            Height = 21
            DataField = 'FECHA_CORTE'
            DataSource = ZDMInteresesAnticipos.DSQMAnticipos
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 3
          end
          object DBCBEstado: TDBComboBoxValue
            Left = 420
            Top = 88
            Width = 90
            Height = 21
            Style = csSimple
            Color = 13553407
            DataField = 'CONTABILIZAR'
            DataSource = ZDMInteresesAnticipos.DSQMAnticipos
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            Items.Strings = (
              'No contabilizado'
              'Contabilizado')
            Values.Strings = (
              '0'
              '1')
            ParentFont = False
            ReadOnly = True
            TabOrder = 6
            TabStop = False
          end
          object DBEFCta: TLFDBEditFind2000
            Left = 86
            Top = 44
            Width = 91
            Height = 21
            DataField = 'C_CONTRAPARTIDA'
            DataSource = ZDMInteresesAnticipos.DSQMAnticipos
            TabOrder = 2
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'tipo=5'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa, obEjercicio, obCanal, obPgc]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBEDescCta: TLFDbedit
            Left = 178
            Top = 44
            Width = 333
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = ZDMInteresesAnticipos.DSxCuenta
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 7
          end
          object DBEInteres: TLFDbedit
            Left = 86
            Top = 88
            Width = 91
            Height = 21
            DataField = 'INTERES'
            DataSource = ZDMInteresesAnticipos.DSQMAnticipos
            TabOrder = 4
          end
          object LFDID: TLFDbedit
            Left = 86
            Top = 0
            Width = 91
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ID'
            DataSource = ZDMInteresesAnticipos.DSQMAnticipos
            ReadOnly = True
            TabOrder = 8
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 526
          Height = 111
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLIENTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INTERES'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_CORTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REGISTRO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ASIENTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUENTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'C_CONTRAPARTIDA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMPORTE_INTERES'
              Visible = True
            end>
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 169
    Width = 538
    Height = 219
    inherited TBDetalle: TLFToolBar
      Width = 538
      EdgeOuter = esNone
      inherited NavDetalle: THYMNavigator
        Width = 105
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbRefresh]
        Hints.Strings = ()
      end
      object ToolButton2: TToolButton
        Left = 105
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object TBMostrarAnticiposDisponibles: TToolButton
        Left = 113
        Top = 0
        Hint = 'Mostrar Anticipos Disponibles'
        Caption = 'Mostrar Anticipos Disponibles'
        ImageIndex = 30
        OnClick = TBMostrarAnticiposDisponiblesClick
      end
      object TButtSeleccionarTodo: TToolButton
        Left = 136
        Top = 0
        Hint = 'Seleccionar Todo'
        Caption = 'Seleccionar Todo'
        ImageIndex = 146
        OnClick = TButtSeleccionarTodoClick
      end
      object ToolButton3: TToolButton
        Left = 159
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 538
      Height = 197
      PopupMenu = nil
      Columns = <
        item
          Expanded = False
          FieldName = 'Z_MARCADO'
          Width = 47
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'ANTICIPO'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'COD_CLI_PRO'
          ReadOnly = True
          Width = 78
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'CANTIDAD'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'Z_INTERES_ANTICIPO'
          ReadOnly = True
          Width = 120
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'Z_FECHA_CORTE'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'Z_IMPORTE_INTERES'
          ReadOnly = True
          Width = 119
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'Z_ID_INTERES_ANTICIPO'
          ReadOnly = True
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 388
    Width = 538
    EdgeOuter = esNone
  end
  inherited CEMain: TControlEdit
    Left = 316
    Top = 4
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 552
    Top = 12
    inherited CEMainMirango: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 352
    Top = 4
    object AListadoIntereses: TAction
      Category = 'Listados'
      Caption = 'Listado de Intereses Anticipos'
      ImageIndex = 14
      OnExecute = AListadoInteresesExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 396
    Top = 8
  end
  inherited CEDetalle: TControlEdit
    Left = 502
    Top = 8
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 454
    Top = 6
    inherited CEDetalleMifirst: TMenuItem
      ShortCut = 16450
    end
    inherited CEDetalleMiprior: TMenuItem
      ShortCut = 16465
    end
    inherited CEDetalleMinext: TMenuItem
      ShortCut = 16471
    end
    inherited CEDetalleMilast: TMenuItem
      ShortCut = 16457
    end
    inherited CEDetalleMiinsert: TMenuItem
      ShortCut = 16454
      Visible = False
    end
    inherited CEDetalleMidelete: TMenuItem
      ShortCut = 16460
      Visible = False
    end
    inherited CEDetalleMiedit: TMenuItem
      ShortCut = 16451
      Visible = False
    end
    inherited CEDetalleMipost: TMenuItem
      ShortCut = 16472
      Visible = False
    end
    inherited CEDetalleMicancel: TMenuItem
      ShortCut = 16470
      Visible = False
    end
    inherited CEDetalleMirefresh: TMenuItem
      ShortCut = 16499
    end
    object CEDetalleMiaprox: TMenuItem
      Caption = 'B'#250'squeda aproximada'
      Visible = False
    end
    object CEDetalleMiexacta: TMenuItem
      Caption = 'B'#250'squeda exacta'
      Enabled = False
      Visible = False
    end
    object CEDetalleMiimprime: TMenuItem
      Caption = 'Imprime pantalla'
      Enabled = False
      Visible = False
    end
    object CEDetalleMirango: TMenuItem
      Caption = 'Filtra rango'
      Visible = False
    end
    object CEDetalleMireport: TMenuItem
      Caption = 'Imprime report'
      Enabled = False
    end
    object CEDetalleMicopy: TMenuItem
      Caption = 'Copiar'
      Enabled = False
      Visible = False
    end
    object CEDetalleMicut: TMenuItem
      Caption = 'Cortar'
      Visible = False
    end
    object CEDetalleMipaste: TMenuItem
      Caption = 'Pegar'
      Visible = False
    end
    object CEDetalleMisalir: TMenuItem
      Caption = 'Cerrar la ventana'
      Visible = False
    end
    object CEDetalleMibuscar: TMenuItem
      Caption = 'Buscar'
      Visible = False
    end
  end
end
