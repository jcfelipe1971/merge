inherited OpeFMSecciones: TOpeFMSecciones
  Left = 449
  Top = 183
  Caption = 'Mantenimiento de Secciones'
  ClientHeight = 441
  ClientWidth = 684
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 684
    Height = 235
    inherited TBMain: TLFToolBar
      Width = 680
      inherited NavMain: THYMNavigator
        DataSource = OpeDMSecciones.DSQMSecciones
        Hints.Strings = ()
        EditaControl = DBEDescripcion
        InsertaControl = DBESeccion
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
        OnClickRango = EPMainClickRango
      end
    end
    inherited PCMain: TLFPageControl
      Width = 680
      Height = 205
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 672
          Height = 177
          inherited G2KTableLoc: TG2KTBLoc
            DataSource = OpeDMSecciones.DSQMSecciones
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'OPE_SECCIONES'
            CampoNum = 'SECCION'
            CampoStr = 'DESCRIPCION'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'SECCION')
          end
          object LSeccion: TLFLabel
            Left = 52
            Top = 19
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Secci'#243'n'
            FocusControl = DBESeccion
          end
          object LDescripcion: TLFLabel
            Left = 35
            Top = 40
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
            FocusControl = DBEDescripcion
          end
          object LNTareas: TLFLabel
            Left = 537
            Top = 18
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#186' Tareas'
            FocusControl = DBENTareas
          end
          object LNPersonas: TLFLabel
            Left = 526
            Top = 40
            Width = 59
            Height = 13
            Alignment = taRightJustify
            Caption = 'N'#186' Personas'
            FocusControl = DBENPersonas
          end
          object LTReal: TLFLabel
            Left = 536
            Top = 62
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Total Real'
            FocusControl = DBETReal
          end
          object LTPosible: TLFLabel
            Left = 524
            Top = 84
            Width = 61
            Height = 13
            Alignment = taRightJustify
            Caption = 'Total Posible'
            FocusControl = DBETPosible
          end
          object LEstadoMarcajePedido: TLFLabel
            Left = 6
            Top = 62
            Width = 86
            Height = 13
            Hint = 'Estado Marcaje Pedido'
            Alignment = taRightJustify
            Caption = 'Estado marc. ped.'
            ParentShowHint = False
            ShowHint = True
          end
          object LCriterioOrden: TLFLabel
            Left = 28
            Top = 84
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Criterio Orden'
            FocusControl = DBETReal
          end
          object LSecuencia: TLFLabel
            Left = 368
            Top = 19
            Width = 51
            Height = 13
            Alignment = taRightJustify
            Caption = 'Secuencia'
            FocusControl = DBESecuencia
          end
          object DBESeccion: TLFDbedit
            Left = 96
            Top = 15
            Width = 57
            Height = 21
            DataField = 'SECCION'
            DataSource = OpeDMSecciones.DSQMSecciones
            TabOrder = 0
          end
          object DBEDescripcion: TLFDbedit
            Left = 96
            Top = 37
            Width = 385
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = OpeDMSecciones.DSQMSecciones
            TabOrder = 1
          end
          object DBENTareas: TLFDbedit
            Left = 589
            Top = 15
            Width = 64
            Height = 21
            Color = clInfoBk
            DataField = 'NTAREAS'
            DataSource = OpeDMSecciones.DSQMSecciones
            Enabled = False
            ReadOnly = True
            TabOrder = 7
          end
          object DBENPersonas: TLFDbedit
            Left = 589
            Top = 37
            Width = 64
            Height = 21
            Color = clInfoBk
            DataField = 'NPERSONAS'
            DataSource = OpeDMSecciones.DSQMSecciones
            Enabled = False
            ReadOnly = True
            TabOrder = 8
          end
          object DBETReal: TLFDbedit
            Left = 589
            Top = 59
            Width = 64
            Height = 21
            Color = clInfoBk
            DataField = 'TOTAL_REAL'
            DataSource = OpeDMSecciones.DSQMSecciones
            Enabled = False
            ReadOnly = True
            TabOrder = 9
          end
          object DBETPosible: TLFDbedit
            Left = 589
            Top = 81
            Width = 64
            Height = 21
            Color = clInfoBk
            DataField = 'TOTAL_POSIBLE'
            DataSource = OpeDMSecciones.DSQMSecciones
            Enabled = False
            ReadOnly = True
            TabOrder = 10
          end
          object DBCBMostrarEnMaquinas: TLFDBCheckBox
            Left = 528
            Top = 103
            Width = 137
            Height = 17
            Caption = 'Mostrar en M'#225'quinas'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 5
            TabStop = True
            DataField = 'MOSTRAR_EN_MAQUINAS'
            DataSource = OpeDMSecciones.DSQMSecciones
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object MCriterioOrden: TLFDBMemo
            Left = 96
            Top = 81
            Width = 385
            Height = 88
            DataField = 'CRITERIO_ORDEN'
            DataSource = OpeDMSecciones.DSQMSecciones
            TabOrder = 3
          end
          object DBEEstadoMarcajePedido: TLFDBEditFind2000
            Left = 96
            Top = 59
            Width = 57
            Height = 21
            AutoSize = False
            DataField = 'ESTADO_MARCAJE_PEDIDO'
            DataSource = OpeDMSecciones.DSQMSecciones
            TabOrder = 2
            OnChange = DBEEstadoMarcajePedidoChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'OPE_ESTADO_MARCAJE_PEDIDO'
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'ID_ESTADO_MARCAJE_PEDIDO'
              'TITULO')
            CampoNum = 'ID_ESTADO_MARCAJE_PEDIDO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Plan.Strings = (
              '')
            OrdenadoPor.Strings = (
              'ORDEN_EJECUCION')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloEstadoMarcajePedido: TLFEdit
            Left = 153
            Top = 59
            Width = 328
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 11
          end
          object DBESecuencia: TLFDbedit
            Left = 424
            Top = 15
            Width = 57
            Height = 21
            DataField = 'SECUENCIA'
            DataSource = OpeDMSecciones.DSQMSecciones
            TabOrder = 4
          end
          object DBCBHojaSiempreVisible: TLFDBCheckBox
            Left = 528
            Top = 125
            Width = 137
            Height = 17
            Caption = 'Hoja siempre visible'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 6
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'HOJA_SIEMPRE_VISIBLE'
            DataSource = OpeDMSecciones.DSQMSecciones
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 672
          Height = 177
          DataSource = OpeDMSecciones.DSQMSecciones
          CamposAOrdenar.Strings = (
            'SECCION')
          Columns = <
            item
              Expanded = False
              FieldName = 'SECCION'
              Width = 51
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Width = 387
              Visible = True
            end>
        end
      end
    end
  end
  inherited PDetalle: TLFPanel
    Top = 235
    Width = 684
    Height = 182
    inherited TBDetalle: TLFToolBar
      Width = 684
      inherited NavDetalle: THYMNavigator
        DataSource = OpeDMSecciones.DSQMSeccionesD
        Hints.Strings = ()
      end
    end
    inherited DBGFDetalle: TDBGridFind2000
      Width = 684
      Height = 160
      DataSource = OpeDMSecciones.DSQMSeccionesD
      Columns = <
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'LINEA'
          ReadOnly = True
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'DESCRIPCION'
          Width = 188
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TOTAL_REAL'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'TOTAL_POSIBLE'
          ReadOnly = True
          Visible = True
        end
        item
          Color = clInfoBk
          Expanded = False
          FieldName = 'POLIVALENCIA'
          ReadOnly = True
          Visible = True
        end>
    end
  end
  inherited TBActions: TLFToolBar
    Top = 417
    Width = 684
  end
  inherited CEMain: TControlEdit
    Left = 408
    Top = 0
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 448
    Top = 0
  end
  inherited ALMain: TLFActionList
    Top = 0
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 14
    end
    object APlanCapacitacion: TAction
      Category = 'Listados'
      Caption = 'Plan de Capacitaci'#243'n y Polivalencia'
      OnExecute = APlanCapacitacionExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Configuraci'#243'n R'#225'pida de Listados'
      ImageIndex = 77
    end
    object AListadoPlan: TAction
      Category = 'Listados;"Configuraci'#243'n R'#225'pida de Listados"'
      Caption = 'Listado Plan de Capacitaci'#243'n y Polivalencia'
      OnExecute = AListadoPlanExecute
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 368
    Top = 32
  end
  inherited CEDetalle: TControlEdit
    Left = 408
    Top = 32
  end
  inherited CEDetallePMEdit: TPopUpTeclas
    Left = 448
    Top = 32
    inherited CEDetalleMifirst: TMenuItem
      ShortCut = 0
    end
    inherited CEDetalleMiprior: TMenuItem
      ShortCut = 0
    end
    inherited CEDetalleMinext: TMenuItem
      ShortCut = 0
    end
    inherited CEDetalleMilast: TMenuItem
      ShortCut = 0
    end
    inherited CEDetalleMiinsert: TMenuItem
      ShortCut = 0
    end
    inherited CEDetalleMidelete: TMenuItem
      ShortCut = 0
    end
    inherited CEDetalleMiedit: TMenuItem
      ShortCut = 0
    end
    inherited CEDetalleMipost: TMenuItem
      ShortCut = 0
    end
    inherited CEDetalleMicancel: TMenuItem
      ShortCut = 0
    end
    inherited CEDetalleMirefresh: TMenuItem
      ShortCut = 0
    end
  end
end
