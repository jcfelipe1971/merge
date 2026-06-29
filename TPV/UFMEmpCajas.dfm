inherited FMEmpCajas: TFMEmpCajas
  Left = 599
  Top = 122
  Caption = 'Cajas de la Empresa'
  ClientHeight = 485
  ClientWidth = 655
  PopupMenu = CEFormasPagoPMEdit
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 655
    Height = 225
    Align = alTop
    inherited TBMain: TLFToolBar
      Width = 651
      inherited NavMain: THYMNavigator
        Width = 198
        DataSource = DMEmpCajas.DSQMEmpCajas
        VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbDelete, nbEdit, nbPost, nbCancel, nbRefresh]
        Hints.Strings = ()
        EditaControl = DBTitulo
        InsertaControl = DBTitulo
      end
      inherited TSepNav: TToolButton
        Left = 198
      end
      inherited EPMain: THYMEditPanel
        Left = 206
        Width = 46
        VisibleButtons = [neRango, neSalir]
        Hints.Strings = ()
        OnClickRango = EPMainClickRango
      end
      inherited TSepTerc: TToolButton
        Left = 252
      end
      inherited TbuttComp: TToolButton
        Left = 260
      end
      object PNLSerie: TLFPanel
        Left = 283
        Top = 0
        Width = 222
        Height = 22
        BevelOuter = bvNone
        TabOrder = 2
        object LSerieVenta: TLFLabel
          Left = 19
          Top = 4
          Width = 24
          Height = 13
          Alignment = taRightJustify
          Caption = 'Serie'
        end
        object CBSerie: TLFComboBox
          Left = 48
          Top = 0
          Width = 169
          Height = 21
          ItemHeight = 13
          TabOrder = 0
          OnChange = CBSerieChange
        end
      end
    end
    inherited PCMain: TLFPageControl
      Width = 651
      Height = 195
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 643
          Height = 167
          inherited G2KTableLoc: TG2KTBLoc
            Top = 20
          end
          object LBTipo: TLabel
            Left = 31
            Top = 8
            Width = 21
            Height = 13
            Alignment = taRightJustify
            Caption = 'Caja'
          end
          object LBTitulo: TLabel
            Left = 24
            Top = 30
            Width = 28
            Height = 13
            Alignment = taRightJustify
            Caption = 'T'#237'tulo'
          end
          object LAlmacen: TLabel
            Left = 11
            Top = 52
            Width = 41
            Height = 13
            Alignment = taRightJustify
            Caption = 'Almac'#233'n'
          end
          object LAgente: TLabel
            Left = 18
            Top = 73
            Width = 34
            Height = 13
            Alignment = taRightJustify
            Caption = 'Agente'
          end
          object LSerie: TLabel
            Left = 263
            Top = 8
            Width = 24
            Height = 13
            Alignment = taRightJustify
            Caption = 'Serie'
          end
          object DBCHKActivo: TLFDBCheckBox
            Left = 473
            Top = 6
            Width = 51
            Height = 17
            Caption = 'Activa'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 5
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'ACTIVA'
            DataSource = DMEmpCajas.DSQMEmpCajas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBCaja: TLFDbedit
            Left = 57
            Top = 4
            Width = 75
            Height = 21
            Color = clInfoBk
            DataField = 'CAJA'
            DataSource = DMEmpCajas.DSQMEmpCajas
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
          end
          object DBTitulo: TLFDbedit
            Left = 57
            Top = 26
            Width = 310
            Height = 21
            DataField = 'TITULO'
            DataSource = DMEmpCajas.DSQMEmpCajas
            TabOrder = 1
          end
          object DBEFAlmacen: TLFDBEditFind2000
            Left = 57
            Top = 48
            Width = 75
            Height = 21
            DataField = 'ALMACEN'
            DataSource = DMEmpCajas.DSQMEmpCajas
            TabOrder = 2
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'ART_ALMACENES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'ALMACEN'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'ALMACEN')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object DBFAgente: TDBEditFind2000
            Left = 57
            Top = 70
            Width = 49
            Height = 21
            DataField = 'AGENTE'
            DataSource = DMEmpCajas.DSQMEmpCajas
            TabOrder = 3
            OnChange = DBFAgenteChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_AGENTES'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'AGENTE'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = False
            OrdenadoPor.Strings = (
              'AGENTE')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object ETituloAgente: TLFEdit
            Left = 107
            Top = 70
            Width = 261
            Height = 21
            Color = clInfoBk
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
          end
          object LFConf: TLFPanel
            Left = 0
            Top = 96
            Width = 643
            Height = 71
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 7
            object GBPeticionUsuario: TGroupBox
              Left = 0
              Top = 0
              Width = 308
              Height = 71
              Align = alLeft
              TabOrder = 0
              object DBCBTicketUsuario: TLFDBCheckBox
                Left = 8
                Top = 19
                Width = 225
                Height = 17
                Caption = 'Petici'#243'n de usuario al crear ticket'
                ClicksDisabled = False
                ColorCheck = 57088
                TabOrder = 0
                TabStop = True
                Alignment = taLeftJustify
                OnChange = DBCBTicketUsuarioChange
                DataField = 'PIDE_USER'
                DataSource = DMEmpCajas.DSQMEmpCajas
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object DBCBTicketClave: TLFDBCheckBox
                Left = 8
                Top = 45
                Width = 225
                Height = 17
                Caption = 'Deshabilitar la petici'#243'n de clave de usuario'
                ClicksDisabled = False
                ColorCheck = 57088
                Enabled = False
                TabOrder = 1
                TabStop = True
                Alignment = taLeftJustify
                DataField = 'PIDE_CLAVE'
                DataSource = DMEmpCajas.DSQMEmpCajas
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
            end
            object RGAgente: TDBRadioGroup
              Left = 308
              Top = 0
              Width = 335
              Height = 71
              Align = alClient
              Caption = 'Opciones de facturaci'#243'n'
              DataField = 'PIDE_AGE'
              DataSource = DMEmpCajas.DSQMEmpCajas
              Items.Strings = (
                'Facturaci'#243'n seg'#250'n el Agente de la Caja'
                'Facturaci'#243'n seg'#250'n el Agente del Usuario')
              TabOrder = 1
              Values.Strings = (
                '0'
                '1')
            end
          end
          object LFDBCBProv: TLFDBCheckBox
            Left = 473
            Top = 28
            Width = 116
            Height = 17
            Caption = 'Pedir a proveedor'
            ClicksDisabled = False
            ColorCheck = 57088
            TabOrder = 6
            TabStop = True
            Alignment = taLeftJustify
            DataField = 'PEDIR_A_PROV'
            DataSource = DMEmpCajas.DSQMEmpCajas
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object DBESerie: TLFDbedit
            Left = 292
            Top = 4
            Width = 75
            Height = 21
            Color = clInfoBk
            DataField = 'SERIE'
            DataSource = DMEmpCajas.DSQMEmpCajas
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 8
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 643
          Height = 167
          DataSource = DMEmpCajas.DSQMEmpCajas
          PopupMenu = CEMainPMEdit
          PermutaPaneles = False
          CamposAMarcar.Strings = (
            'ACTIVA')
          CamposChecked.Strings = (
            '1')
          CamposNoChecked.Strings = (
            '0')
          CamposAOrdenar.Strings = (
            'ACTIVA'
            'AGENTE'
            'ALMACEN'
            'CAJA'
            'SERIE'
            'TITULO')
          Columns = <
            item
              Expanded = False
              FieldName = 'CAJA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULO'
              Width = 256
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SERIE'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ALMACEN'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AGENTE'
              Width = 60
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ACTIVA'
              Width = 34
              Visible = True
            end>
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 461
    Width = 655
  end
  object PDetallle: TLFPanel [2]
    Left = 0
    Top = 225
    Width = 655
    Height = 236
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 2
    object PCDetalle: TLFPageControl
      Left = 0
      Top = 0
      Width = 655
      Height = 236
      ActivePage = TsFormPago
      Align = alClient
      OwnerDraw = True
      TabIndex = 1
      TabOrder = 0
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSUsuario: TTabSheet
        Caption = '&Usuario'
        OnShow = TSUsuarioShow
        object TBUsuario: TLFToolBar
          Left = 0
          Top = 0
          Width = 647
          Height = 24
          EdgeBorders = []
          Flat = True
          TabOrder = 0
          Separators = True
          object NavUsuarios: THYMNavigator
            Left = 0
            Top = 0
            Width = 240
            Height = 22
            DataSource = DMEmpCajas.DSQMUsuarios
            Flat = True
            ParentShowHint = False
            PopupMenu = CEUsuariosPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            ControlEdit = CEUsuarios
            OrdenAscendente = True
            InsertaUltimo = False
          end
        end
        object LFPDetalleUsuarios: TLFPanel
          Left = 0
          Top = 24
          Width = 647
          Height = 184
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBGUsuario: TDBGridFind2000
            Left = 0
            Top = 0
            Width = 647
            Height = 184
            Align = alClient
            DataSource = DMEmpCajas.DSQMUsuarios
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
            Idioma = 'CAS'
            AutoCambiarColumna = False
            AutoPostEnCheckBox = False
            AutoStartDrag = False
            AutoStartDragInterval = 0
            IndiceBitmapOrdenable = 0
            IndiceBitmapAscendente = 0
            IndiceBitmapChecked = 3
            IndiceBitmapDescendente = 0
            BaseDeDatos = DMMain.DataBase
            Transaction = DMEmpCajas.TLocal
            BuscarNums = False
            Campos.Strings = (
              'USUARIO'
              'AGENTE')
            CamposAMostrar.Strings = (
              'USUARIO'
              '0'
              'AGENTE'
              '0')
            CamposAMostrarAnchos.Strings = (
              '0'
              '0')
            CamposADevolver.Strings = (
              ''
              '')
            CamposDesplegar.Strings = (
              '1'
              '1')
            CampoAOrdenarColor = clBlack
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            ColumnasCheckBoxes.Strings = (
              'ACTIVO')
            ColumnasChecked.Strings = (
              '1')
            ColumnasNoChecked.Strings = (
              '0')
            MensajeNoExiste = False
            Numericos.Strings = (
              'USUARIO'
              'AGENTE')
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tablas.Strings = (
              'SYS_USUARIOS'
              'VER_AGENTES')
            Acciones.Strings = (
              ''
              '')
            Titulos.Strings = (
              'NOMBRE'
              'TITULO')
            Posicion = tpCentrado
            OnBusqueda = DBGUsuarioBusqueda
            Planes.Strings = (
              ''
              '')
            OrdenMultiple = True
            OrdenadosPor.Strings = (
              'USUARIO'
              'AGENTE')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            Columns = <
              item
                Expanded = False
                FieldName = 'USUARIO'
                Title.Alignment = taCenter
                Width = 44
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'NOMBRE'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ReadOnly = True
                Title.Alignment = taCenter
                Width = 220
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'AGENTE'
                Title.Alignment = taCenter
                Width = 44
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ReadOnly = True
                Title.Alignment = taCenter
                Width = 220
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ACTIVO'
                Title.Alignment = taCenter
                Width = 34
                Visible = True
              end>
          end
        end
      end
      object TsFormPago: TTabSheet
        Caption = 'Formas de Pago'
        ImageIndex = 1
        OnShow = TsFormPagoShow
        object TBFormasPago: TLFToolBar
          Left = 0
          Top = 0
          Width = 647
          Height = 24
          EdgeBorders = []
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_In
          TabOrder = 0
          Separators = True
          object NavFP: THYMNavigator
            Left = 0
            Top = 0
            Width = 240
            Height = 22
            DataSource = DMEmpCajas.DSQMFormasPago
            Align = alClient
            Flat = True
            ParentShowHint = False
            PopupMenu = CEFormasPagoPMEdit
            ShowHint = True
            TabOrder = 0
            ModoDeSeguridad = True
            DelCaption = 'Informaci'#243'n'
            DelMessage = ' '#191' Borra el registro ? '
            Exclusivo = True
            ControlEdit = CEFormasPago
            OrdenAscendente = True
            InsertaUltimo = False
          end
          object ToolButton1: TToolButton
            Left = 240
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
          object TButRecargarFP: TToolButton
            Left = 248
            Top = 0
            Action = ARecargarFP
          end
        end
        object LFPDetalleFormas: TLFPanel
          Left = 0
          Top = 24
          Width = 647
          Height = 184
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBGFormasPago: TDBGridFind2000
            Left = 0
            Top = 0
            Width = 647
            Height = 184
            Align = alClient
            DataSource = DMEmpCajas.DSQMFormasPago
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
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
            Idioma = 'CAS'
            AutoCambiarColumna = True
            AutoPostEnCheckBox = False
            AutoStartDrag = False
            AutoStartDragInterval = 0
            IndiceBitmapOrdenable = 0
            IndiceBitmapAscendente = 1
            IndiceBitmapChecked = 3
            IndiceBitmapDescendente = 2
            BaseDeDatos = DMMain.DataBase
            Transaction = DMEmpCajas.TLocal
            BuscarNums = False
            Campos.Strings = (
              'FORMA_PAGO')
            CamposAMostrar.Strings = (
              'FORMA_PAGO'
              '0')
            CamposAMostrarAnchos.Strings = (
              '0')
            CamposADevolver.Strings = (
              '')
            CamposDesplegar.Strings = (
              '1')
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            ColumnasCheckBoxes.Strings = (
              'FACTURACION'
              'ACTIVA')
            ColumnasChecked.Strings = (
              '1'
              '1')
            ColumnasNoChecked.Strings = (
              '0'
              '0')
            MensajeNoExiste = False
            Numericos.Strings = (
              'forma_pago')
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tablas.Strings = (
              'CON_CUENTAS_GES_FP')
            Acciones.Strings = (
              '')
            Titulos.Strings = (
              'cuenta_pago')
            Posicion = tpCentrado
            Planes.Strings = (
              '')
            OrdenMultiple = True
            OrdenadosPor.Strings = (
              '')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'EJERCICIO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ReadOnly = True
                Title.Alignment = taCenter
                Width = 44
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CANAL'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ReadOnly = True
                Title.Alignment = taCenter
                Width = 35
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'SERIE'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ReadOnly = True
                Title.Alignment = taCenter
                Width = 60
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FORMA_PAGO'
                Title.Alignment = taCenter
                Width = 44
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clGrayText
                Font.Height = -11
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ReadOnly = True
                Title.Alignment = taCenter
                Width = 220
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CUENTA_PAGO'
                Title.Alignment = taCenter
                Width = 90
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'FACTURACION'
                Title.Alignment = taCenter
                Width = 34
                Visible = True
              end
              item
                Alignment = taCenter
                Expanded = False
                FieldName = 'ACTIVA'
                Title.Alignment = taCenter
                Width = 34
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ORDEN'
                Width = 35
                Visible = True
              end>
          end
        end
      end
    end
  end
  inherited CEMain: TControlEdit
    EnlazadoA = CEUsuarios
    Left = 300
    Top = 10
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 350
    Top = 10
    inherited CEMainMiinsert: TMenuItem
      Visible = False
    end
    inherited CEMainMibuscar: TMenuItem
      Visible = False
    end
    inherited CEMainMireport: TMenuItem
      Visible = False
    end
  end
  inherited ALMain: TLFActionList
    Left = 278
    Top = 100
    object AAjustaCajas: TAction
      Category = 'Procesos'
      Caption = 'Ajustar Cajas de la Empresa'
      Hint = 'Ajustar Cajas de la Empresa'
      ImageIndex = 80
      OnExecute = AAjustaCajasExecute
    end
    object ARecargarFP: TAction
      Category = 'Procesos'
      Caption = 'Recargar FP'
      Hint = 'Recarga todas las Formas de Pago de la Empresa'
      ImageIndex = 26
      OnExecute = ARecargarFPExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Procesos'
      Caption = 'Procesos'
      ImageIndex = 16
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 322
    Top = 102
  end
  object CEUsuarios: TControlEdit
    EnlazadoA = CEFormasPago
    FichaEdicion = TSUsuario
    PopUpMenu = CEUsuariosPMEdit
    Teclas = DMMain.Teclas
    Left = 392
    Top = 16
  end
  object CEFormasPago: TControlEdit
    EnlazadoA = CEMain
    FichaEdicion = TsFormPago
    PopUpMenu = CEFormasPagoPMEdit
    Teclas = DMMain.Teclas
    Left = 464
    Top = 16
  end
  object CEUsuariosPMEdit: TPopUpTeclas
    Left = 432
    Top = 16
    object CEUsuariosMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEUsuariosMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEUsuariosMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEUsuariosMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEUsuariosMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 45
    end
    object CEUsuariosMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 46
    end
    object CEUsuariosMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEUsuariosMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEUsuariosMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEUsuariosMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
  object CEFormasPagoPMEdit: TPopUpTeclas
    Left = 512
    Top = 8
    object CEFormasPagoMifirst: TMenuItem
      Caption = 'Primero'
      Enabled = False
      ShortCut = 16464
    end
    object CEFormasPagoMiprior: TMenuItem
      Caption = 'Anterior'
      Enabled = False
      ShortCut = 16449
    end
    object CEFormasPagoMinext: TMenuItem
      Caption = 'Siguiente'
      Enabled = False
      ShortCut = 16467
    end
    object CEFormasPagoMilast: TMenuItem
      Caption = #218'ltimo'
      Enabled = False
      ShortCut = 16469
    end
    object CEFormasPagoMiinsert: TMenuItem
      Caption = 'A'#241'adir'
      Enabled = False
      ShortCut = 45
    end
    object CEFormasPagoMidelete: TMenuItem
      Caption = 'Borrar'
      Enabled = False
      ShortCut = 46
    end
    object CEFormasPagoMiedit: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      ShortCut = 16453
    end
    object CEFormasPagoMipost: TMenuItem
      Caption = 'Grabar'
      Enabled = False
      ShortCut = 16455
    end
    object CEFormasPagoMicancel: TMenuItem
      Caption = 'Cancelar'
      Enabled = False
      ShortCut = 16472
    end
    object CEFormasPagoMirefresh: TMenuItem
      Caption = 'Refrescar'
      Enabled = False
      ShortCut = 16466
    end
  end
end
