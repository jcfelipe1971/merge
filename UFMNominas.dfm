inherited FMNominas: TFMNominas
  Left = 192
  Top = 313
  Width = 1917
  Height = 632
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'N'#243'minas'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1907
    Height = 579
    inherited TBMain: TLFToolBar
      Width = 1903
      inherited EPMain: THYMEditPanel
        Width = 22
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
      object PNLPeriodo: TLFPanel
        Left = 22
        Top = 0
        Width = 184
        Height = 22
        BevelOuter = bvNone
        TabOrder = 1
        object LPeriodo: TLFLabel
          Left = 10
          Top = 4
          Width = 36
          Height = 13
          Alignment = taRightJustify
          Caption = 'Periodo'
        end
        object CBPeriodo: TLFComboBox
          Left = 53
          Top = 1
          Width = 126
          Height = 21
          Style = csDropDownList
          DropDownCount = 13
          ItemHeight = 13
          ItemIndex = 0
          TabOrder = 0
          Text = 'Todos'
          OnChange = CBPeriodoChange
          Items.Strings = (
            'Todos'
            'Enero'
            'Febrero'
            'Marzo'
            'Abril'
            'Mayo'
            'Junio'
            'Julio'
            'Agosto'
            'Septiembre'
            'Octubre'
            'Noviembre'
            'Diciembre')
        end
      end
      object PNLFiltroUsuario: TLFPanel
        Left = 206
        Top = 0
        Width = 475
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LFiltroEmpleado: TLFLabel
          Left = 5
          Top = 4
          Width = 47
          Height = 13
          Alignment = taRightJustify
          Caption = 'Empleado'
        end
        object EFFiltroEmpleado: TLFEditFind2000
          Left = 56
          Top = 0
          Width = 49
          Height = 21
          TabOrder = 0
          OnChange = EFFiltroEmpleadoChange
          Base_de_datos = DMMain.DataBase
          Transaction = DMMain.TLocal
          BuscarNums = False
          BuscarChars = True
          AutoCambiarFoco = False
          CampoNum = 'EMPLEADO'
          CampoStr = 'TITULO'
          CondicionBusqueda = 'ACTIVO = 1'
          Posicion = tpCentrado
          ReemplazarCaracter = True
          SalirSiVacio = True
          SalirSiNoExiste = False
          Tabla_a_buscar = 'VER_EMPLEADOS_CUENTAS'
          Tabla_asociada.DesplegarBusqueda = False
          OrdenadoPor.Strings = (
            'EMPLEADO')
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
        end
        object EFiltroEmpleado: TLFEdit
          Left = 106
          Top = 0
          Width = 366
          Height = 21
          TabStop = False
          Color = clInfoBk
          Enabled = False
          ReadOnly = True
          TabOrder = 1
        end
      end
    end
    object PCMain: TLFPageControl
      Left = 2
      Top = 28
      Width = 1903
      Height = 549
      ActivePage = TSNomina
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 1
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSNomina: TTabSheet
        Caption = '&N'#243'mina'
        object TBENominas: TLFToolBar
          Left = 0
          Top = 0
          Width = 1895
          Height = 26
          Caption = 'TBENominas'
          EdgeInner = esNone
          EdgeOuter = esNone
          Images = DMMain.ILMain_Ac
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Separators = True
          object NavNominas: THYMNavigator
            Left = 0
            Top = 2
            Width = 240
            Height = 22
            DataSource = DMNominas.DSQMNominas
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
          object ToolButton1: TToolButton
            Left = 240
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object TButtNominasTodas: TToolButton
            Left = 248
            Top = 2
            Action = ANominasTodas
          end
          object TButtNominasPendientes: TToolButton
            Left = 271
            Top = 2
            Action = ANominasPendientes
          end
          object ToolButton2: TToolButton
            Left = 294
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object TButtSeleccionarTodas: TToolButton
            Left = 302
            Top = 2
            Action = ASeleccionarTodas
            ImageIndex = 146
          end
          object TButtDeseleccionarTodas: TToolButton
            Left = 325
            Top = 2
            Action = ADeseleccionarTodas
            ImageIndex = 147
          end
          object ToolButton5: TToolButton
            Left = 348
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object PNLBanco: TLFPanel
            Left = 356
            Top = 2
            Width = 225
            Height = 22
            BevelOuter = bvNone
            TabOrder = 1
            object LBanco: TLFLabel
              Left = 12
              Top = 4
              Width = 31
              Height = 13
              Alignment = taRightJustify
              Caption = 'Banco'
            end
            object EFBanco: TLFEditFind2000
              Left = 48
              Top = 0
              Width = 49
              Height = 21
              TabOrder = 0
              OnChange = EFBancoChange
              Base_de_datos = DMMain.DataBase
              Transaction = DMMain.TLocal
              BuscarNums = False
              BuscarChars = True
              AutoCambiarFoco = False
              CampoNum = 'BANCO'
              CampoStr = 'TITULO'
              CondicionBusqueda = 'ACTIVO = 1'
              Posicion = tpCentrado
              ReemplazarCaracter = True
              SalirSiVacio = True
              SalirSiNoExiste = False
              Tabla_a_buscar = 'VER_BANCOS_CUENTAS'
              Tabla_asociada.DesplegarBusqueda = False
              OrdenadoPor.Strings = (
                'BANCO')
              Filtros = [obEmpresa, obEjercicio, obCanal]
              Entorno = DMMain.EntornoBusqueda
            end
            object ETituloBanco: TLFEdit
              Left = 98
              Top = 0
              Width = 125
              Height = 21
              TabStop = False
              Color = clInfoBk
              Enabled = False
              ReadOnly = True
              TabOrder = 1
            end
          end
          object TButtCerrarSeleccionados: TToolButton
            Left = 581
            Top = 2
            Action = ACerrarSeleccionados
          end
          object TButtPagarSeleccionados: TToolButton
            Left = 604
            Top = 2
            Action = APagarSeleccionados
          end
          object ToolButton7: TToolButton
            Left = 627
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object TButtCrearOrdenDePago: TToolButton
            Left = 635
            Top = 2
            Hint = 'Crear Orden de Pago'
            Caption = 'Crear Orden de Pago'
            DropdownMenu = PPFormatos
            ImageIndex = 94
            Style = tbsDropDown
          end
        end
        object DBGNominas: TDBGridFind2000
          Left = 0
          Top = 26
          Width = 1895
          Height = 495
          Align = alClient
          DataSource = DMNominas.DSQMNominas
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGNominasCellClick
          OnColEnter = DBGNominasColEnter
          OnDrawColumnCell = DBGNominasDrawColumnCell
          OnDblClick = DBGNominasDblClick
          IniStorage = FSMain
          Insercion = False
          ColumnaInicial = 0
          UsaDicG2K = True
          Changed = False
          Idioma = 'CAS'
          AutoCambiarColumna = True
          AutoPostEnCheckBox = True
          AutoStartDrag = False
          AutoStartDragInterval = 0
          IndiceBitmapOrdenable = 0
          IndiceBitmapAscendente = 1
          IndiceBitmapChecked = 3
          IndiceBitmapDescendente = 2
          BaseDeDatos = DMMain.DataBase
          BuscarNums = False
          Campos.Strings = (
            'CTA_PAGO'
            'EMPLEADO'
            'PERIODO_HACIENDA')
          CamposAMostrar.Strings = (
            'CTA_PAGO'
            '0'
            'EMPLEADO'
            '0'
            'PERIODO_HACIENDA'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0'
            '0'
            '0')
          CamposADevolver.Strings = (
            ''
            ''
            '')
          CamposDesplegar.Strings = (
            '1'
            '1'
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'EMPLEADO'
            'CODIGO_TARJETA'
            'IMP_ANTICIPO'
            'IMP_DEVENGADO'
            'IMP_REMUNERACION'
            'IMP_RETENCION'
            'IMP_SEG_SOCIAL'
            'NOMBRE_R_SOCIAL'
            'PERIODO'
            'RIC_CIERRE'
            'RIC_PAGO'
            'IMP_CE_RETA'
            'IMP_COBROS_ESPECIE'
            'IMP_DIETAS'
            'IMP_EMBARGO'
            'IMP_ICECES'
            'IMP_OTROS'
            'IMP_PAGADO'
            'IMP_REMUNERACION_ESPECIE'
            'IMP_RETENCION_ESPECIE'
            'IMP_SEG_SOCIAL_EMPRESA')
          ColumnasCheckBoxes.Strings = (
            'CERRADO'
            'PAGADO'
            'SELECCIONADO')
          ColumnasChecked.Strings = (
            '1'
            '1'
            '1')
          ColumnasNoChecked.Strings = (
            '0'
            '0'
            '0')
          MensajeNoExiste = False
          Numericos.Strings = (
            'CUENTA'
            'EMPLEADO'
            'PERIODO')
          SalirSiVacio = True
          SalirSiNoExiste = True
          Tablas.Strings = (
            'CON_CUENTAS'
            'VER_EMPLEADOS_CUENTAS'
            'EMP_PERIODOS')
          Acciones.Strings = (
            ''
            ''
            '')
          Titulos.Strings = (
            'TITULO'
            'TITULO'
            'TITULO')
          BeforeColExit = DBGNominasBeforeColExit
          Posicion = tpCentrado
          OnBusqueda = DBGOnBusqueda
          Planes.Strings = (
            ''
            ''
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            'CUENTA'
            'EMPLEADO'
            'PERIODO')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'EMPLEADO'
              Width = 50
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'NOMBRE_R_SOCIAL'
              ReadOnly = True
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PERIODO'
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PERIODO_HACIENDA'
              Width = 30
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SELECCIONADO'
              Width = 30
              Visible = True
            end
            item
              Color = clMoneyGreen
              Expanded = False
              FieldName = 'IMP_REMUNERACION'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMP_REMUNERACION_ESPECIE'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMP_RETENCION'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMP_RETENCION_ESPECIE'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMP_DIETAS'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMP_CE_RETA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMP_COBROS_ESPECIE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMP_ICECES'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMP_SEG_SOCIAL'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMP_EMBARGO'
              Width = 80
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMP_DEVENGADO'
              Width = 80
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'IMP_ANTICIPO'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'IMP_OTROS'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'IMP_PAGADO'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMP_SEG_SOCIAL_EMPRESA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CERRADO'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_CIERRE'
              Width = 72
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'RIC_CIERRE'
              ReadOnly = True
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'RIC_CIERRE_SEG_SOCIAL_EMPRESA'
              ReadOnly = True
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CTA_PAGO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PAGADO'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_PAGO'
              Width = 72
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'RIC_PAGO'
              ReadOnly = True
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CODIGO_GESTORIA'
              ReadOnly = True
              Width = 100
              Visible = True
            end>
        end
      end
      object TSAnticipo: TTabSheet
        Caption = '&Anticipo'
        ImageIndex = 1
        object TBAnticipo: TLFToolBar
          Left = 0
          Top = 0
          Width = 1895
          Height = 26
          Caption = 'TBAnticipo'
          EdgeInner = esNone
          EdgeOuter = esNone
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object NavAnticipos: THYMNavigator
            Left = 0
            Top = 2
            Width = 240
            Height = 22
            DataSource = DMNominas.DSQMAnticipos
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
          object ToolButton4: TToolButton
            Left = 240
            Top = 2
            Width = 8
            Style = tbsSeparator
          end
          object TButtAnticiposTodos: TToolButton
            Left = 248
            Top = 2
            Action = AAnticiposTodos
          end
          object TButtAnticiposPendientes: TToolButton
            Left = 271
            Top = 2
            Action = AAnticiposPendientes
          end
        end
        object DBGAnticipo: TDBGridFind2000
          Left = 0
          Top = 26
          Width = 1895
          Height = 495
          Align = alClient
          DataSource = DMNominas.DSQMAnticipos
          TabOrder = 1
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = []
          OnCellClick = DBGAnticipoCellClick
          OnColEnter = DBGAnticipoColEnter
          OnDrawColumnCell = DBGAnticipoDrawColumnCell
          OnDblClick = DBGAnticipoDblClick
          IniStorage = FSMain
          Insercion = False
          ColumnaInicial = 1
          UsaDicG2K = True
          Changed = False
          Idioma = 'CAS'
          AutoCambiarColumna = True
          AutoPostEnCheckBox = True
          AutoStartDrag = False
          AutoStartDragInterval = 0
          IndiceBitmapOrdenable = 0
          IndiceBitmapAscendente = 1
          IndiceBitmapChecked = 3
          IndiceBitmapDescendente = 2
          BaseDeDatos = DMMain.DataBase
          BuscarNums = False
          Campos.Strings = (
            'EMPLEADO'
            'CTA_PAGO'
            'PERIODO')
          CamposAMostrar.Strings = (
            'EMPLEADO'
            '0'
            'CTA_PAGO'
            '0'
            'PERIODO'
            '0')
          CamposAMostrarAnchos.Strings = (
            '0'
            '0'
            '0')
          CamposADevolver.Strings = (
            ''
            ''
            '')
          CamposDesplegar.Strings = (
            '1'
            '1'
            '1')
          CampoAOrdenarColor = clInfoBk
          CampoAOrdenarBitmaps = DMMain.ILOrdGrid
          CamposAOrdernar.Strings = (
            'ANTICIPO'
            'CERRADO'
            'CODIGO_TARJETA'
            'EMPLEADO'
            'IMPORTE'
            'NOMBRE_R_SOCIAL'
            'PAGADO')
          CamposNoAccesibles.Strings = (
            'LIQUIDADO')
          ColumnasCheckBoxes.Strings = (
            'PAGADO'
            'LIQUIDADO')
          ColumnasChecked.Strings = (
            '1'
            '1')
          ColumnasNoChecked.Strings = (
            '0'
            '0')
          MensajeNoExiste = False
          Numericos.Strings = (
            'EMPLEADO'
            'CUENTA'
            'PERIODO')
          SalirSiVacio = True
          SalirSiNoExiste = True
          Tablas.Strings = (
            'VER_EMPLEADOS_CUENTAS'
            'CON_CUENTAS'
            'EMP_PERIODOS')
          Acciones.Strings = (
            ''
            ''
            '')
          Titulos.Strings = (
            'TITULO'
            'TITULO'
            'TITULO')
          BeforeColExit = DBGAnticipoBeforeColExit
          Posicion = tpCentrado
          OnBusqueda = DBGOnBusqueda
          Planes.Strings = (
            ''
            ''
            '')
          OrdenMultiple = True
          OrdenadosPor.Strings = (
            'EMPLEADO'
            'CUENTA'
            'PERIODO')
          Filtros = []
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'ANTICIPO'
              ReadOnly = True
              Width = 45
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMPLEADO'
              Width = 50
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'NOMBRE_R_SOCIAL'
              ReadOnly = True
              Width = 200
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMPORTE'
              Width = 77
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PERIODO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CTA_PAGO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PAGADO'
              Width = 40
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_PAGO'
              Width = 72
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'RIC_PAGO'
              ReadOnly = True
              Width = 60
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'LIQUIDADO'
              ReadOnly = True
              Width = 40
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'RIC_LIQUIDACION'
              ReadOnly = True
              Width = 60
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 579
    Width = 1907
  end
  inherited CEMain: TControlEdit
    Left = 760
    Top = 24
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 808
    Top = 24
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
    Left = 856
    Top = 24
    object AImportacionExcel: TAction
      Category = 'Procesos'
      Caption = 'Importaci'#243'n Excel '
      ImageIndex = 49
      OnExecute = AImportacionExcelExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 904
    Top = 24
  end
  object ALBotones: TLFActionList
    Images = DMMain.ILMain_Ac
    IniStorage = FSMain
    Reset = False
    Enabled = True
    Changed = False
    Left = 720
    Top = 24
    object ANominasTodas: TAction
      Caption = 'Todas'
      Hint = 'Ver Todas las Nominas'
      ImageIndex = 23
      OnExecute = ANominasTodasExecute
    end
    object ANominasPendientes: TAction
      Caption = 'Pendientes'
      Hint = 'Ver Nominas Pendientes'
      ImageIndex = 22
      OnExecute = ANominasPendientesExecute
    end
    object AAnticiposTodos: TAction
      Caption = 'Todos'
      Hint = 'Ver Todos los Anticipos'
      ImageIndex = 23
      OnExecute = AAnticiposTodosExecute
    end
    object AAnticiposPendientes: TAction
      Caption = 'Pendientes'
      Hint = 'Ver Anticipos Pendientes'
      ImageIndex = 22
      OnExecute = AAnticiposPendientesExecute
    end
    object ASeleccionarTodas: TAction
      Caption = 'Seleccionar Todas'
      Hint = 'Seleccionar todas las n'#243'minas'
      ImageIndex = 19
      OnExecute = ASeleccionarTodasExecute
    end
    object ADeseleccionarTodas: TAction
      Caption = 'Deseleccionar'
      Hint = 'Deseleccionar'
      ImageIndex = 27
      OnExecute = ADeseleccionarTodasExecute
    end
    object ACerrarSeleccionados: TAction
      Caption = 'Cerrar Seleccionados'
      Hint = 'Cerrar registros seleccionados'
      ImageIndex = 88
      OnExecute = ACerrarSeleccionadosExecute
    end
    object APagarSeleccionados: TAction
      Caption = 'Pagar Seleccionados'
      Hint = 'Pagar registros seleccionados'
      ImageIndex = 89
      OnExecute = APagarSeleccionadosExecute
    end
  end
  object PPFormatos: TPopUpTeclas
    Images = DMMain.ILMain_Ac
    Left = 1001
    Top = 24
    object MINormaCSB34: TMenuItem
      Caption = 'Norma CSB 34'
      Hint = 'Norma CSB 34 (Noviembre 2003)'
      ImageIndex = 143
      Visible = False
      OnClick = MINormaCSB34Click
    end
    object MINormaCSB34_1: TMenuItem
      Caption = 'Norma CSB 34.1'
      Hint = 'Norma CSB 34.1'
      ImageIndex = 143
      Visible = False
      OnClick = MINormaCSB34_1Click
    end
    object MINormaCSB34_1_Banesto: TMenuItem
      Caption = 'Norma CSB 34.1 Banesto'
      Hint = 'Norma CSB 34.1 Banesto'
      ImageIndex = 143
      Visible = False
      OnClick = MINormaCSB34_1_BanestoClick
    end
    object MINormaCSB34_1_Pastor: TMenuItem
      Caption = 'Norma CSB 34.1 Pastor'
      Hint = 'Norma CSB 34.1 Pastor'
      ImageIndex = 143
      Visible = False
      OnClick = MINormaCSB34_1_PastorClick
    end
    object MINormaCSB34_1_Bankinter: TMenuItem
      Caption = 'Norma CSB 34.1 Bankinter'
      Hint = 'Norma CSB 34.1 Bankinter'
      ImageIndex = 143
      Visible = False
      OnClick = MINormaCSB34_1_BankinterClick
    end
    object MINormaCSB34_1_BancoPopular: TMenuItem
      Caption = 'Norma CSB 34.14 Banco Popular'
      Hint = 'Norma CSB 34.14 Banco Popular'
      ImageIndex = 143
      OnClick = MINormaCSB34_1_BancoPopularClick
    end
    object MINormaSEPA: TMenuItem
      Caption = 'SEPA'
      Hint = 'Norma SEPA'
      ImageIndex = 143
      OnClick = MINormaSEPAClick
    end
  end
end
