inherited ZFMTalones: TZFMTalones
  Left = 690
  Top = 193
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  Caption = 'Talones por Tercero'
  ClientHeight = 570
  ClientWidth = 675
  PopupMenu = nil
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 675
    Height = 281
    Align = alTop
    inherited TBMain: TLFToolBar
      Width = 671
      inherited NavMain: THYMNavigator
        Hints.Strings = ()
      end
      inherited EPMain: THYMEditPanel
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepTerc: TToolButton
        Visible = True
      end
      inherited TbuttComp: TToolButton
        Hint = 'Marcar como servidas todas las l'#237'neas'
        Caption = 'Bloquear'
        ImageIndex = 68
        Visible = True
        OnClick = TbuttCompClick
      end
      object TButtAbreCierra: TToolButton
        Left = 339
        Top = 0
        Hint = 'Cierra y bloquea el documento'
        Action = ABloquear
      end
    end
    inherited PCMain: TLFPageControl
      Width = 671
      Height = 251
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 663
          Height = 223
          inherited G2KTableLoc: TG2KTBLoc
            Top = 36
            Tabla_a_buscar = 'Z_TALONES_CAB'
            CampoNum = 'ID'
            CampoStr = 'TALON'
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'ID')
          end
          object LRIG: TLFLabel
            Left = 54
            Top = 6
            Width = 11
            Height = 13
            Alignment = taRightJustify
            Caption = 'ID'
          end
          object LabEstado: TLFLabel
            Left = 173
            Top = 5
            Width = 33
            Height = 13
            Alignment = taRightJustify
            Caption = 'Estado'
          end
          object LTercero: TLFLabel
            Left = 28
            Top = 49
            Width = 37
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tercero'
          end
          object LBLDescripcion: TLFLabel
            Left = 9
            Top = 137
            Width = 56
            Height = 13
            Alignment = taRightJustify
            Caption = 'Descripci'#243'n'
          end
          object LBLFecha: TLFLabel
            Left = 35
            Top = 160
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LBLLugar: TLFLabel
            Left = 176
            Top = 160
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Lugar'
          end
          object LFCobros: TLFLabel
            Left = 8
            Top = 181
            Width = 89
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cobros Pendientes'
          end
          object LAnticiposPagados: TLFLabel
            Left = 9
            Top = 203
            Width = 88
            Height = 13
            Alignment = taRightJustify
            Caption = 'Anticipos Pagados'
          end
          object LPagosPendientes: TLFLabel
            Left = 230
            Top = 184
            Width = 86
            Height = 13
            Alignment = taRightJustify
            Caption = 'Pagos Pendientes'
          end
          object Diferencia: TLFLabel
            Left = 268
            Top = 204
            Width = 48
            Height = 13
            Alignment = taRightJustify
            Caption = 'Diferencia'
          end
          object LCuenta: TLFLabel
            Left = 31
            Top = 93
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cuenta'
          end
          object LCuentaCobro: TLFLabel
            Left = 0
            Top = 115
            Width = 65
            Height = 13
            Alignment = taRightJustify
            Caption = 'Cuenta Cobro'
          end
          object LBanco: TLFLabel
            Left = 34
            Top = 71
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Banco'
          end
          object LBLTalon: TLFLabel
            Left = 38
            Top = 28
            Width = 27
            Height = 13
            Alignment = taRightJustify
            Caption = 'Tal'#243'n'
          end
          object LContador: TLFLabel
            Left = 346
            Top = 28
            Width = 43
            Height = 13
            Alignment = taRightJustify
            Caption = 'Contador'
          end
          object DBEID: TLFDbedit
            Left = 70
            Top = 2
            Width = 97
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'ID'
            DataSource = ZDMTalones.DSCabecera
            ReadOnly = True
            TabOrder = 0
          end
          object DBEDescripcion: TLFDbedit
            Left = 70
            Top = 134
            Width = 420
            Height = 21
            DataField = 'DESCRIPCION'
            DataSource = ZDMTalones.DSCabecera
            TabOrder = 6
          end
          object DBDTPFecha: TLFDBDateEdit
            Left = 70
            Top = 156
            Width = 96
            Height = 21
            DataField = 'FECHA'
            DataSource = ZDMTalones.DSCabecera
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 7
          end
          object DBELugar: TLFDbedit
            Left = 207
            Top = 156
            Width = 283
            Height = 21
            DataField = 'LUGAR'
            DataSource = ZDMTalones.DSCabecera
            TabOrder = 8
          end
          object DBETercero: TLFDBEditFind2000
            Left = 70
            Top = 46
            Width = 96
            Height = 21
            DataField = 'TERCERO'
            DataSource = ZDMTalones.DSCabecera
            TabOrder = 2
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'Z_VER_TERCEROS_CLI_PRO'
            Tabla_asociada.DesplegarBusqueda = False
            Campos_Desplegar.Strings = (
              'TERCERO'
              'NOMBRE_R_SOCIAL')
            CampoNum = 'TERCERO'
            CampoStr = 'NOMBRE_R_SOCIAL'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
          end
          object DBETituloTercero: TLFDbedit
            Left = 167
            Top = 47
            Width = 323
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'NOMBRE_R_SOCIAL'
            DataSource = ZDMTalones.DSxTerceros
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 9
          end
          object LFDBCobros: TLFDbedit
            Left = 101
            Top = 179
            Width = 121
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'C_Pendientes'
            DataSource = ZDMTalones.DsCobros
            ReadOnly = True
            TabOrder = 10
          end
          object LFDBPagos: TLFDbedit
            Left = 321
            Top = 179
            Width = 121
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'P_Pendientes'
            DataSource = ZDMTalones.DsPagos
            ReadOnly = True
            TabOrder = 11
          end
          object LFDBAnticipos: TLFDbedit
            Left = 101
            Top = 201
            Width = 121
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'P_anticipos'
            DataSource = ZDMTalones.DsAnticipos
            ReadOnly = True
            TabOrder = 12
          end
          object DBEFCuenta: TLFDBEditFind2000
            Left = 70
            Top = 90
            Width = 96
            Height = 21
            DataField = 'CUENTA'
            DataSource = ZDMTalones.DSCabecera
            TabOrder = 4
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'tipo=5'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBETitulo: TLFDbedit
            Left = 167
            Top = 90
            Width = 323
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = ZDMTalones.DSxCuenta
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 13
          end
          object DBEDiferencia: TLFDbedit
            Left = 321
            Top = 201
            Width = 121
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'Diferencia'
            DataSource = ZDMTalones.DSCabecera
            ReadOnly = True
            TabOrder = 14
          end
          object DBCuentaCobro: TLFDBEditFind2000
            Left = 70
            Top = 112
            Width = 96
            Height = 21
            DataField = 'CUENTA_COBRO'
            DataSource = ZDMTalones.DSCabecera
            TabOrder = 5
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = True
            Tabla_a_buscar = 'CON_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CUENTA'
            CampoStr = 'TITULO'
            CondicionBusqueda = 'tipo=5'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object LFDBTitCuentaCobro: TLFDbedit
            Left = 167
            Top = 112
            Width = 323
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = ZDMTalones.DSxCuentaCobro
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 15
          end
          object DBEFBanco: TLFDBEditFind2000
            Left = 70
            Top = 68
            Width = 96
            Height = 21
            DataField = 'BANCO'
            DataSource = ZDMTalones.DSCabecera
            TabOrder = 3
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_BANCOS_CUENTAS'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'BANCO'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBETituloBanco: TLFDbedit
            Left = 167
            Top = 68
            Width = 323
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = ZDMTalones.DSxBancos
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 16
          end
          object DBTalon: TLFDbedit
            Left = 70
            Top = 24
            Width = 97
            Height = 21
            DataField = 'TALON'
            DataSource = ZDMTalones.DSCabecera
            TabOrder = 1
          end
          object DBETituloEstado: TLFDbedit
            Left = 212
            Top = 2
            Width = 278
            Height = 21
            Color = clInfoBk
            DataField = 'TITULO'
            DataSource = ZDMTalones.DSxEstado
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 17
          end
          object DBEContador: TLFDbedit
            Left = 395
            Top = 25
            Width = 95
            Height = 21
            DataField = 'Z_CONTADOR'
            DataSource = ZDMTalones.DSCabecera
            TabOrder = 18
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 663
          Height = 223
          DataSource = ZDMTalones.DSCabecera
          CamposAOrdenar.Strings = (
            'BANCO'
            'CUENTA'
            'FECHA'
            'IMPORTE'
            'TALON')
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TALON'
              Width = 97
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DESCRIPCION'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BANCO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LUGAR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'IMPORTE'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUENTA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Diferencia'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CUENTA_COBRO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Z_CONTADOR'
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 546
    Width = 675
  end
  object PDetalle: TLFPanel [2]
    Left = 0
    Top = 281
    Width = 675
    Height = 265
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object LFPageControl1: TLFPageControl
      Left = 0
      Top = 0
      Width = 675
      Height = 265
      ActivePage = TCobros
      Align = alClient
      MultiLine = True
      OwnerDraw = True
      ParentShowHint = False
      ScrollOpposite = True
      ShowHint = True
      TabIndex = 0
      TabOrder = 0
      TabPosition = tpBottom
      TabActiveColor = clWindow
      TabInactiveColor = 14936298
      object TCobros: TTabSheet
        Caption = 'Cobros'
        object LFToolBar1: TLFToolBar
          Left = 0
          Top = 0
          Width = 667
          Height = 26
          AutoSize = True
          BorderWidth = 1
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Wrapable = False
          Separators = True
          object NavCobros: THYMNavigator
            Left = 0
            Top = 0
            Width = 160
            Height = 22
            DataSource = ZDMTalones.DsCobros
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
            Flat = True
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            EditaControl = DBGFDetalle
            InsertaControl = DBGFDetalle
            Exclusivo = True
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object ToolButton1: TToolButton
            Left = 160
            Top = 0
            Width = 8
            Style = tbsSeparator
            Visible = False
          end
          object HYMEditPanel1: THYMEditPanel
            Left = 168
            Top = 0
            Width = 80
            Height = 22
            VisibleButtons = [neBuscar, neRango, neReport, neSalir]
            ParentShowHint = False
            PopupMenu = CEMainPMEdit
            SalirCaption = 'Salida'
            SalirMensaje = ' '#191' Abandonar esta Ventana de Edici'#243'n ? '
            ShowHint = True
            TabOrder = 1
            Visible = False
            Flat = True
            Exclusivo = True
            ControlEdit = CEMain
          end
          object ToolButton2: TToolButton
            Left = 248
            Top = 0
            Width = 8
            Style = tbsSeparator
            Visible = False
          end
          object ToolButton3: TToolButton
            Left = 256
            Top = 0
            ImageIndex = 26
            Visible = False
          end
        end
        object DBGFDetalle: TDBGridFind2000
          Left = 0
          Top = 26
          Width = 667
          Height = 213
          Align = alClient
          Color = clInfoBk
          DataSource = ZDMTalones.DsCobros
          Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
          AutoPostEnCheckBox = True
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
          CamposNoAccesibles.Strings = (
            'LINEA'
            'VENCIMIENTO'
            'CTA_PAGO'
            'LIQUIDO'
            'PAGADO'
            'TIPO_EFECTO'
            'IMPAGADO'
            'COD_CLI_PRO'
            'DOC_NUMERO')
          ColumnasCheckBoxes.Strings = (
            'MARCADO'
            'Abrir Cartera')
          ColumnasChecked.Strings = (
            '1'
            '1')
          ColumnasNoChecked.Strings = (
            '0'
            '0')
          MensajeNoExiste = False
          SalirSiVacio = False
          SalirSiNoExiste = False
          Posicion = tpCentrado
          CamposCalcAOrdenar.Strings = (
            'LIQUIDO_MONEDA')
          CamposCalcReferencia.Strings = (
            'LIQUIDO')
          OrdenMultiple = True
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'MARCADO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CTA_PAGO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LIQUIDO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Abrir Cartera'
              Visible = True
            end>
        end
      end
      object TAnticipos: TTabSheet
        Caption = 'Anticipos'
        ImageIndex = 1
        object LFToolBar2: TLFToolBar
          Left = 0
          Top = 0
          Width = 667
          Height = 26
          AutoSize = True
          BorderWidth = 1
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Wrapable = False
          Separators = True
          object NavAnticipos: THYMNavigator
            Left = 0
            Top = 0
            Width = 160
            Height = 22
            DataSource = ZDMTalones.DsAnticipos
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
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
          object ToolButton4: TToolButton
            Left = 160
            Top = 0
            Width = 8
            Style = tbsSeparator
            Visible = False
          end
          object HYMEditPanel2: THYMEditPanel
            Left = 168
            Top = 0
            Width = 80
            Height = 22
            VisibleButtons = [neBuscar, neRango, neReport, neSalir]
            ParentShowHint = False
            PopupMenu = CEMainPMEdit
            SalirCaption = 'Salida'
            SalirMensaje = ' '#191' Abandonar esta Ventana de Edici'#243'n ? '
            ShowHint = True
            TabOrder = 1
            Visible = False
            Flat = True
            Exclusivo = True
            ControlEdit = CEMain
          end
          object ToolButton5: TToolButton
            Left = 248
            Top = 0
            Width = 8
            Style = tbsSeparator
            Visible = False
          end
          object ToolButton6: TToolButton
            Left = 256
            Top = 0
            ImageIndex = 26
            Visible = False
          end
        end
        object DBGridFind20001: TDBGridFind2000
          Left = 0
          Top = 26
          Width = 667
          Height = 213
          Align = alClient
          DataSource = ZDMTalones.DsAnticipos
          Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
          AutoPostEnCheckBox = True
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
          CamposAOrdernar.Strings = (
            'TALON'
            'LIQUIDO'
            'DOC_TIPO'
            'COD_CLI_PRO'
            'CTA_PAGO'
            'TIPO_EFECTO'
            'VENCIMIENTO'
            'PAGADO'
            'MONEDA')
          CamposNoAccesibles.Strings = (
            'LINEA'
            'VENCIMIENTO'
            'CTA_PAGO'
            'LIQUIDO'
            'PAGADO'
            'TIPO_EFECTO'
            'IMPAGADO'
            'COD_CLI_PRO'
            'DOC_NUMERO')
          ColumnasCheckBoxes.Strings = (
            'MARCADO')
          ColumnasChecked.Strings = (
            '1')
          ColumnasNoChecked.Strings = (
            '0')
          MensajeNoExiste = False
          SalirSiVacio = False
          SalirSiNoExiste = False
          Posicion = tpCentrado
          CamposCalcAOrdenar.Strings = (
            'LIQUIDO_MONEDA')
          CamposCalcReferencia.Strings = (
            'LIQUIDO')
          OrdenMultiple = True
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'MARCADO'
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'C_CONTRAPARTIDA'
              ReadOnly = True
              Visible = True
            end
            item
              Color = clInfoBk
              Expanded = False
              FieldName = 'CANTIDAD'
              ReadOnly = True
              Visible = True
            end>
        end
      end
      object TPagos: TTabSheet
        Caption = 'Pagos'
        ImageIndex = 2
        object TBDetalle: TLFToolBar
          Left = 0
          Top = 0
          Width = 667
          Height = 26
          AutoSize = True
          BorderWidth = 1
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          Wrapable = False
          Separators = True
          object NavPagos: THYMNavigator
            Left = 0
            Top = 0
            Width = 160
            Height = 22
            DataSource = ZDMTalones.DsPagos
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
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
          object ToolButton7: TToolButton
            Left = 160
            Top = 0
            Width = 8
            Style = tbsSeparator
            Visible = False
          end
          object HYMEditPanel3: THYMEditPanel
            Left = 168
            Top = 0
            Width = 80
            Height = 22
            VisibleButtons = [neBuscar, neRango, neReport, neSalir]
            ParentShowHint = False
            PopupMenu = CEMainPMEdit
            SalirCaption = 'Salida'
            SalirMensaje = ' '#191' Abandonar esta Ventana de Edici'#243'n ? '
            ShowHint = True
            TabOrder = 1
            Visible = False
            Flat = True
            Exclusivo = True
            ControlEdit = CEMain
          end
          object ToolButton8: TToolButton
            Left = 248
            Top = 0
            Width = 8
            Style = tbsSeparator
            Visible = False
          end
          object ToolButton9: TToolButton
            Left = 256
            Top = 0
            ImageIndex = 26
            Visible = False
          end
        end
        object DBGridFind20002: TDBGridFind2000
          Left = 0
          Top = 26
          Width = 667
          Height = 213
          Align = alClient
          Color = clInfoBk
          DataSource = ZDMTalones.DsPagos
          Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
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
          AutoPostEnCheckBox = True
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
          CamposNoAccesibles.Strings = (
            'LINEA'
            'VENCIMIENTO'
            'CTA_PAGO'
            'LIQUIDO'
            'PAGADO'
            'TIPO_EFECTO'
            'IMPAGADO'
            'COD_CLI_PRO'
            'DOC_NUMERO')
          ColumnasCheckBoxes.Strings = (
            'MARCADO'
            'Abrir_Cartera')
          ColumnasChecked.Strings = (
            '1'
            '1')
          ColumnasNoChecked.Strings = (
            '0'
            '0')
          MensajeNoExiste = False
          SalirSiVacio = False
          SalirSiNoExiste = False
          Posicion = tpCentrado
          CamposCalcAOrdenar.Strings = (
            'LIQUIDO_MONEDA')
          CamposCalcReferencia.Strings = (
            'LIQUIDO')
          OrdenMultiple = True
          Filtros = [obEmpresa, obEjercicio, obCanal]
          Entorno = DMMain.EntornoBusqueda
          Columns = <
            item
              Expanded = False
              FieldName = 'MARCADO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CTA_PAGO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'LIQUIDO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Abrir_Cartera'
              Visible = True
            end>
        end
      end
    end
  end
  inherited CEMain: TControlEdit
    Left = 528
    Top = 44
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 560
    Top = 44
    inherited CEMainMifirst: TMenuItem
      ShortCut = 16450
    end
    inherited CEMainMiprior: TMenuItem
      ShortCut = 16465
    end
    inherited CEMainMinext: TMenuItem
      ShortCut = 16471
    end
    inherited CEMainMilast: TMenuItem
      ShortCut = 16457
    end
    inherited CEMainMiinsert: TMenuItem
      ShortCut = 16454
    end
    inherited CEMainMidelete: TMenuItem
      ShortCut = 16460
    end
    inherited CEMainMiedit: TMenuItem
      ShortCut = 16451
    end
    inherited CEMainMipost: TMenuItem
      ShortCut = 16472
    end
    inherited CEMainMicancel: TMenuItem
      ShortCut = 16470
    end
    inherited CEMainMirefresh: TMenuItem
      ShortCut = 16499
    end
    inherited CEMainMibuscar: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiaprox: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiexacta: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMiimprime: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMirango: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMireport: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMicopy: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMicut: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMipaste: TMenuItem
      ShortCut = 0
    end
    inherited CEMainMisalir: TMenuItem
      ShortCut = 0
    end
  end
  inherited ALMain: TLFActionList
    object Procesos: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      GroupIndex = 10
    end
    object ABloquear: TAction
      Category = 'Procesos'
      Caption = 'Cerrar Tal'#243'n'
      GroupIndex = 11
      ImageIndex = 68
      OnExecute = ABloquearExecute
    end
    object Alistados: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      GroupIndex = 20
    end
    object ATalon: TAction
      Category = 'Listados'
      Caption = 'Talon'
      GroupIndex = 21
      OnExecute = ATalonExecute
    end
  end
end
