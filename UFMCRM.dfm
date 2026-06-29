inherited FMCRM: TFMCRM
  Left = 308
  Top = 160
  Caption = 'CRM'
  ClientHeight = 467
  ClientWidth = 705
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 705
    Height = 443
    inherited TBMain: TLFToolBar
      Width = 701
      inherited NavMain: THYMNavigator
        DataSource = DMCRM.DSXCRM
        Hints.Strings = ()
        OnClick = NavMainClick
        EditaControl = DBEFCliente
        InsertaControl = DBEFCliente
      end
      inherited EPMain: THYMEditPanel [1]
        Left = 220
        DataSource = DMCRM.DSXCRM
        Hints.Strings = ()
        OnClickBuscar = EPMainClickBuscar
      end
      inherited TSepNav: TToolButton [2]
        Left = 300
      end
      object ToolButton1: TToolButton
        Left = 339
        Top = 0
        Width = 8
        Style = tbsSeparator
      end
      object LSelAgente: TLFLabel
        Left = 347
        Top = 0
        Width = 41
        Height = 22
        Caption = 'Agente'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object EFAgente: TLFEditFind2000
        Left = 388
        Top = 0
        Width = 57
        Height = 22
        Color = clInfoBk
        Enabled = False
        ReadOnly = True
        TabOrder = 2
        OnChange = EFAgenteChange
        Base_de_datos = DMMain.DataBase
        Transaction = DMMain.TLocal
        BuscarNums = False
        BuscarChars = True
        AutoCambiarFoco = False
        CampoNum = 'AGENTE'
        CampoStr = 'TITULO'
        Posicion = tpCentrado
        ReemplazarCaracter = True
        SalirSiVacio = True
        SalirSiNoExiste = True
        Tabla_a_buscar = 'VER_AGENTES'
        Tabla_asociada.DesplegarBusqueda = False
        OrdenadoPor.Strings = (
          'agente')
        Filtros = [obEmpresa]
        Entorno = DMMain.EntornoBusqueda
      end
    end
    inherited PCMain: TLFPageControl
      Top = 58
      Width = 701
      Height = 383
      OnChange = PCMainChange
      inherited TSFicha: TTabSheet
        inherited PEdit: TLFPanel
          Width = 693
          Height = 355
          Hint = 'Clic sobre este elemento cambia ente Cliente y Cliente Potencial'
          ParentShowHint = False
          ShowHint = True
          inherited G2KTableLoc: TG2KTBLoc
            Top = 32
            DataSource = DMCRM.DSXCRM
            Base_de_datos = DMMain.DataBase
            Tabla_a_buscar = 'VER_CRM_CABECERA'
            CampoNum = 'ID'
            CampoStr = 'INCIDENCIA'
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
            OrdenadoPor.Strings = (
              'ID')
          end
          object LCliente: TLFLabel
            Left = 5
            Top = 11
            Width = 51
            Height = 18
            Alignment = taCenter
            AutoSize = False
            Caption = 'Cliente'
            Color = 16776176
            ParentColor = False
            Layout = tlCenter
            OnClick = LClienteClick
          end
          object LIncidencia: TLFLabel
            Left = 6
            Top = 36
            Width = 49
            Height = 13
            Alignment = taRightJustify
            Caption = 'Incidencia'
          end
          object LFecha: TLFLabel
            Left = 399
            Top = 36
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LRecepcion: TLFLabel
            Left = 552
            Top = 36
            Width = 30
            Height = 13
            Alignment = taRightJustify
            Caption = 'Fecha'
          end
          object LRuta: TLFLabel
            Left = 406
            Top = 14
            Width = 23
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ruta'
          end
          object LSemana: TLFLabel
            Left = 543
            Top = 14
            Width = 39
            Height = 13
            Alignment = taRightJustify
            Caption = 'Semana'
          end
          object LFDbTitIncidencia: TLFDbedit
            Left = 60
            Top = 32
            Width = 328
            Height = 21
            DataField = 'INCIDENCIA'
            DataSource = DMCRM.DSXCRM
            TabOrder = 1
          end
          object DBDTPFecha: TLFDBDateEdit
            Left = 433
            Top = 32
            Width = 88
            Height = 21
            DataField = 'FECHA'
            DataSource = DMCRM.DSXCRM
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 2
          end
          object DBMMDatosIncidencia: TLFDBMemo
            Left = 60
            Top = 120
            Width = 613
            Height = 121
            BevelInner = bvNone
            DataField = 'NOTAS'
            DataSource = DMCRM.DSXCRM
            ScrollBars = ssVertical
            TabOrder = 4
          end
          object DBDEFechaResp: TLFDBDateEdit
            Left = 586
            Top = 32
            Width = 87
            Height = 21
            DataField = 'FECHA_FUTURO'
            DataSource = DMCRM.DSXCRM
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 3
          end
          object DBEFCliente: TLFDBEditFind2000
            Left = 60
            Top = 10
            Width = 67
            Height = 21
            DataField = 'CLIENTE'
            DataSource = DMCRM.DSXCRM
            TabOrder = 0
            OnChange = DBEFClienteChange
            AutoCambiarFoco = False
            Base_de_datos = DMMain.DataBase
            BuscarNums = False
            Tabla_a_buscar = 'VER_CLIENTES_EMPRESA'
            Tabla_asociada.DesplegarBusqueda = False
            CampoNum = 'CLIENTE'
            CampoStr = 'TITULO'
            ReemplazarCaracter = True
            SalirSiNoExiste = False
            SalirSiVacio = True
            OrdenadoPor.Strings = (
              'CLIENTE')
            Filtros = [obEmpresa]
            Entorno = DMMain.EntornoBusqueda
          end
          object ECliente: TLFEdit
            Left = 128
            Top = 10
            Width = 260
            Height = 21
            TabStop = False
            Color = clInfoBk
            Enabled = False
            TabOrder = 5
          end
          object DBERuta: TLFDbedit
            Left = 433
            Top = 10
            Width = 67
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'RUTA'
            DataSource = DMCRM.DSXCRM
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 6
            OnChange = DBEAgenteChange
          end
          object DBESemana: TLFDbedit
            Left = 586
            Top = 10
            Width = 67
            Height = 21
            TabStop = False
            Color = clInfoBk
            DataField = 'SEMANA'
            DataSource = DMCRM.DSXCRM
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGrayText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 7
            OnChange = DBEAgenteChange
          end
          object GBIncidencia: TGroupBox
            Left = 60
            Top = 247
            Width = 614
            Height = 74
            Caption = 'Incidencia'
            TabOrder = 8
            object DBCHKClienteActivo: TLFDBCheckBox
              Left = 64
              Top = 16
              Width = 121
              Height = 17
              Caption = 'Cliente Activo'
              ClicksDisabled = False
              TabOrder = 0
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'CLIENTE_AUSENTE'
              DataSource = DMCRM.DSXCRM
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCHKClienteNuevo: TLFDBCheckBox
              Left = 64
              Top = 32
              Width = 121
              Height = 17
              Caption = 'Cliente Nuevo'
              ClicksDisabled = False
              TabOrder = 1
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'CLIENTE_NUEVO'
              DataSource = DMCRM.DSXCRM
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCHKVisitaEfectuada: TLFDBCheckBox
              Left = 64
              Top = 48
              Width = 121
              Height = 17
              Caption = 'Visita Efectuada'
              ClicksDisabled = False
              TabOrder = 2
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'VISITA_EFECTUADA'
              DataSource = DMCRM.DSXCRM
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCHKAusente: TLFDBCheckBox
              Left = 248
              Top = 16
              Width = 121
              Height = 17
              Caption = 'Ausente'
              ClicksDisabled = False
              TabOrder = 3
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'AUSENTE'
              DataSource = DMCRM.DSXCRM
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCHKVolver: TLFDBCheckBox
              Left = 248
              Top = 32
              Width = 121
              Height = 17
              Caption = 'Volver'
              ClicksDisabled = False
              TabOrder = 4
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'VOLVER'
              DataSource = DMCRM.DSXCRM
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCHKAnular: TLFDBCheckBox
              Left = 248
              Top = 48
              Width = 121
              Height = 17
              Caption = 'Anular'
              ClicksDisabled = False
              TabOrder = 5
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'ANULAR'
              DataSource = DMCRM.DSXCRM
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCHKVisitaComercial: TLFDBCheckBox
              Left = 400
              Top = 16
              Width = 121
              Height = 17
              Caption = 'Visita Comercial'
              ClicksDisabled = False
              TabOrder = 6
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'VISITA_COMERCIAL'
              DataSource = DMCRM.DSXCRM
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCHKGestionDeCobro: TLFDBCheckBox
              Left = 400
              Top = 32
              Width = 121
              Height = 17
              Caption = 'Gestion de Cobro'
              ClicksDisabled = False
              TabOrder = 7
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'GESTION_DE_COBROS'
              DataSource = DMCRM.DSXCRM
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCHKEntregaMaterial: TLFDBCheckBox
              Left = 400
              Top = 48
              Width = 121
              Height = 17
              Caption = 'Entrega de Material'
              ClicksDisabled = False
              TabOrder = 8
              TabStop = True
              Alignment = taLeftJustify
              DataField = 'ENTREGA_MATERIAL'
              DataSource = DMCRM.DSXCRM
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
          object DBRGTipo: TDBRadioGroup
            Left = 61
            Top = 55
            Width = 612
            Height = 58
            Caption = 'Tipo'
            Columns = 3
            DataField = 'TIPO'
            DataSource = DMCRM.DSXCRM
            TabOrder = 9
            OnChange = DBRGTipoChange
          end
          object BDuplicaDatos: TButton
            Left = 1
            Top = 72
            Width = 57
            Height = 25
            Hint = 'Duplica los datos del '#250'ltimo registro entrado'
            Caption = 'Duplica'
            TabOrder = 10
            Visible = False
            OnClick = BDuplicaDatosClick
          end
        end
      end
      object TSSemana: TTabSheet [1]
        Caption = '&Semana'
        ImageIndex = 2
        OnShow = TSSemanaShow
        object PNLSemana: TLFPanel
          Left = 0
          Top = 0
          Width = 693
          Height = 355
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object PNLSemanaTop: TLFPanel
            Left = 0
            Top = 0
            Width = 693
            Height = 30
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object LSemSemana: TLFLabel
              Left = 13
              Top = 8
              Width = 39
              Height = 13
              Alignment = taRightJustify
              Caption = 'Semana'
            end
            object LSemRuta: TLFLabel
              Left = 133
              Top = 8
              Width = 23
              Height = 13
              Alignment = taRightJustify
              Caption = 'Ruta'
            end
            object ESemSemana: TLFEdit
              Left = 56
              Top = 4
              Width = 57
              Height = 21
              TabOrder = 0
              OnChange = ESemSemanaChange
            end
            object ESemRuta: TLFEdit
              Left = 160
              Top = 4
              Width = 57
              Height = 21
              TabOrder = 1
              OnChange = ESemRutaChange
            end
          end
          object PNLDetSemana: TLFPanel
            Left = 0
            Top = 30
            Width = 693
            Height = 229
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 1
            object HYTDBGrid1: THYTDBGrid
              Left = 0
              Top = 0
              Width = 693
              Height = 229
              Align = alClient
              Color = clInfoBk
              DataSource = DMCRM.dsXSemana
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clGrayText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
              ParentFont = False
              TabOrder = 0
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -11
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = []
              OnDblClick = HYTDBGrid1DblClick
              IniStorage = FSMain
              Insercion = False
              ColumnaInicial = 0
              UsaDicG2K = True
              Changed = False
              AutoDeseleccionar = True
              TabFicha = TSFicha
              PermutaPaneles = True
              CamposAMarcar.Strings = (
                'ANULAR'
                'AUSENTE'
                'CLIENTE_AUSENTE'
                'CLIENTE_NUEVO'
                'ENTREGA_MATERIAL'
                'GESTION_DE_COBROS'
                'VISITA_COMERCIAL'
                'VISITA_EFECTUADA'
                'VOLVER')
              CamposChecked.Strings = (
                '1'
                '1'
                '1'
                '1'
                '1'
                '1'
                '1'
                '1'
                '1')
              CamposNoChecked.Strings = (
                '0'
                '0'
                '0'
                '0'
                '0'
                '0'
                '0'
                '0'
                '0')
              CamposAOrdenar.Strings = (
                'AGENTE'
                'CLIENTE'
                'FECHA'
                'FECHA_FUTURO'
                'INCIDENCIA'
                'RUTA'
                'TIPO'
                'TIT_AGENTE'
                'TIT_CLIENTE'
                'TIT_TIPO')
              CamposAOrdenarImgs = DMMain.ILOrdGrid
              CampoAOrdenarColor = clInfoBk
              OrdenMultiple = True
              Columns = <
                item
                  Expanded = False
                  FieldName = 'FECHA'
                  Width = 72
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CLIENTE'
                  Width = 36
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIT_CLIENTE'
                  Width = 179
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'TIPO'
                  Width = 26
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'INCIDENCIA'
                  Width = 256
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'FECHA_FUTURO'
                  Width = 78
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CLIENTE_AUSENTE'
                  Width = 20
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'CLIENTE_NUEVO'
                  Width = 20
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VISITA_EFECTUADA'
                  Width = 20
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'AUSENTE'
                  Width = 20
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VOLVER'
                  Width = 20
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ANULAR'
                  Width = 20
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'VISITA_COMERCIAL'
                  Width = 20
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'GESTION_DE_COBROS'
                  Width = 20
                  Visible = True
                end
                item
                  Expanded = False
                  FieldName = 'ENTREGA_MATERIAL'
                  Width = 20
                  Visible = True
                end>
            end
          end
          object PNLPieSemana: TLFPanel
            Left = 0
            Top = 259
            Width = 693
            Height = 96
            Align = alBottom
            BevelOuter = bvNone
            TabOrder = 2
            object LKilometros: TLFLabel
              Left = 11
              Top = 5
              Width = 48
              Height = 13
              Alignment = taRightJustify
              Caption = 'Kilometros'
            end
            object LGasolina: TLFLabel
              Left = 18
              Top = 27
              Width = 41
              Height = 13
              Alignment = taRightJustify
              Caption = 'Gasolina'
            end
            object LBilletes: TLFLabel
              Left = 26
              Top = 49
              Width = 33
              Height = 13
              Alignment = taRightJustify
              Caption = 'Billetes'
            end
            object LPeajes: TLFLabel
              Left = 27
              Top = 72
              Width = 32
              Height = 13
              Alignment = taRightJustify
              Caption = 'Peajes'
            end
            object LParking: TLFLabel
              Left = 192
              Top = 6
              Width = 36
              Height = 13
              Alignment = taRightJustify
              Caption = 'Parking'
            end
            object LTelefono: TLFLabel
              Left = 186
              Top = 28
              Width = 42
              Height = 13
              Alignment = taRightJustify
              Caption = 'Telefono'
            end
            object LHotel: TLFLabel
              Left = 203
              Top = 50
              Width = 25
              Height = 13
              Alignment = taRightJustify
              Caption = 'Hotel'
            end
            object LComidasViaje: TLFLabel
              Left = 175
              Top = 73
              Width = 53
              Height = 13
              Alignment = taRightJustify
              Caption = 'Comidas V.'
            end
            object LComidasInvitacion: TLFLabel
              Left = 363
              Top = 6
              Width = 49
              Height = 13
              Alignment = taRightJustify
              Caption = 'Comidas I.'
            end
            object LGastosPequenos: TLFLabel
              Left = 354
              Top = 28
              Width = 58
              Height = 13
              Alignment = taRightJustify
              Caption = 'Gastos Peq.'
            end
            object LVarios: TLFLabel
              Left = 383
              Top = 50
              Width = 29
              Height = 13
              Alignment = taRightJustify
              Caption = 'Varios'
            end
            object LTotal: TLFLabel
              Left = 550
              Top = 7
              Width = 30
              Height = 13
              Alignment = taRightJustify
              Caption = 'Total'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LEfectivo: TLFLabel
              Left = 532
              Top = 28
              Width = 48
              Height = 13
              Alignment = taRightJustify
              Caption = 'Efectivo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object LTarjeta: TLFLabel
              Left = 539
              Top = 50
              Width = 41
              Height = 13
              Alignment = taRightJustify
              Caption = 'Tarjeta'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBEKilometros: TLFDbedit
              Left = 64
              Top = 2
              Width = 100
              Height = 21
              DataField = 'KILOMETROS'
              DataSource = DMCRM.DSxTotSemana
              TabOrder = 0
            end
            object DBEGasolina: TLFDbedit
              Left = 64
              Top = 24
              Width = 100
              Height = 21
              DataField = 'GASOLINA'
              DataSource = DMCRM.DSxTotSemana
              TabOrder = 1
            end
            object DBEBilletes: TLFDbedit
              Left = 64
              Top = 46
              Width = 100
              Height = 21
              DataField = 'BILLETES'
              DataSource = DMCRM.DSxTotSemana
              TabOrder = 2
            end
            object DBEPeajes: TLFDbedit
              Left = 64
              Top = 68
              Width = 100
              Height = 21
              DataField = 'PEAJES'
              DataSource = DMCRM.DSxTotSemana
              TabOrder = 3
            end
            object DBEParking: TLFDbedit
              Left = 232
              Top = 3
              Width = 100
              Height = 21
              DataField = 'PARKING'
              DataSource = DMCRM.DSxTotSemana
              TabOrder = 4
            end
            object DBETelefono: TLFDbedit
              Left = 232
              Top = 25
              Width = 100
              Height = 21
              DataField = 'TELEFONO'
              DataSource = DMCRM.DSxTotSemana
              TabOrder = 5
            end
            object DBEHotel: TLFDbedit
              Left = 232
              Top = 47
              Width = 100
              Height = 21
              DataField = 'HOTEL'
              DataSource = DMCRM.DSxTotSemana
              TabOrder = 6
            end
            object DBEComidasViaje: TLFDbedit
              Left = 232
              Top = 69
              Width = 100
              Height = 21
              DataField = 'COMIDAS_INVITACION'
              DataSource = DMCRM.DSxTotSemana
              TabOrder = 7
            end
            object DBEComidasInvitacion: TLFDbedit
              Left = 416
              Top = 3
              Width = 100
              Height = 21
              DataField = 'COMIDAS_VIAJE'
              DataSource = DMCRM.DSxTotSemana
              TabOrder = 8
            end
            object DBEGastosPequenos: TLFDbedit
              Left = 416
              Top = 25
              Width = 100
              Height = 21
              DataField = 'GASTOS_PEQUENOS'
              DataSource = DMCRM.DSxTotSemana
              TabOrder = 9
            end
            object DBEVarios: TLFDbedit
              Left = 416
              Top = 47
              Width = 100
              Height = 21
              DataField = 'VARIOS'
              DataSource = DMCRM.DSxTotSemana
              TabOrder = 10
            end
            object DBETotal: TLFDbedit
              Left = 584
              Top = 3
              Width = 100
              Height = 21
              Color = clInfoBk
              DataField = 'TOTAL'
              DataSource = DMCRM.DSxTotSemana
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 11
            end
            object BGuardar: TButton
              Left = 618
              Top = 71
              Width = 67
              Height = 23
              Caption = 'Guardar'
              TabOrder = 12
              OnClick = BGuardarClick
            end
            object DBEEfectivo: TLFDbedit
              Left = 584
              Top = 25
              Width = 100
              Height = 21
              DataField = 'EFECTIVO'
              DataSource = DMCRM.DSxTotSemana
              TabOrder = 13
            end
            object DBETarjeta: TLFDbedit
              Left = 584
              Top = 47
              Width = 100
              Height = 21
              DataField = 'TARJETA'
              DataSource = DMCRM.DSxTotSemana
              TabOrder = 14
            end
          end
        end
      end
      object TSVisitas: TTabSheet [2]
        Caption = '&Visitas'
        ImageIndex = 3
        object PNLVisitasTop: TLFPanel
          Left = 0
          Top = 0
          Width = 693
          Height = 30
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object LVisitasRuta: TLFLabel
            Left = 13
            Top = 8
            Width = 23
            Height = 13
            Alignment = taRightJustify
            Caption = 'Ruta'
          end
          object LDesdeFEcha: TLFLabel
            Left = 148
            Top = 8
            Width = 64
            Height = 13
            Alignment = taRightJustify
            Caption = 'Desde Fecha'
          end
          object EVisitaRuta: TLFEdit
            Left = 40
            Top = 4
            Width = 57
            Height = 21
            TabOrder = 0
            OnChange = EVisitaRutaChange
          end
          object BRegenerarVisitas: TButton
            Left = 576
            Top = 3
            Width = 105
            Height = 25
            Hint = 'Regenera la tabla de visitas para este a'#241'o.'
            Caption = 'Regenerar Visitas'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnClick = BRegenerarVisitasClick
          end
          object DEFechaVisita: TLFDateEdit
            Left = 216
            Top = 4
            Width = 121
            Height = 21
            CheckOnExit = True
            NumGlyphs = 2
            TabOrder = 2
            OnChange = DEFechaVisitaChange
          end
        end
        object PNLVisitas: TLFPanel
          Left = 0
          Top = 30
          Width = 693
          Height = 325
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object DBGVisitas: TDBGridFind2000
            Left = 0
            Top = 0
            Width = 693
            Height = 325
            Align = alClient
            DataSource = DMCRM.DSVisitas
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
            IndiceBitmapOrdenable = 1
            IndiceBitmapAscendente = 2
            IndiceBitmapChecked = 3
            IndiceBitmapDescendente = 3
            BaseDeDatos = DMMain.DataBase
            Transaction = DMCRM.TLocal
            BuscarNums = False
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            CamposAOrdernar.Strings = (
              'CLIENTE'
              'CODIGO_POSTAL'
              'TITULO'
              'TITULO_LOCALIDAD')
            ColumnasCheckBoxes.Strings = (
              'D01'
              'D02'
              'D03'
              'D04'
              'D05'
              'D06'
              'D07'
              'D08'
              'D09'
              'D10'
              'D11'
              'D12'
              'D13'
              'D14'
              'D15'
              'D16'
              'D17'
              'D18'
              'D19'
              'D20'
              'D21'
              'D22'
              'D23'
              'D24'
              'D25'
              'D26'
              'D27'
              'D28'
              'D29'
              'D30'
              'D31'
              'D32'
              'D33'
              'D34'
              'D35'
              'D36'
              'D37'
              'D38'
              'D39'
              'D40'
              'D41'
              'D42'
              'D43'
              'D44'
              'D45'
              'D46'
              'D47'
              'D48'
              'D49'
              'D50'
              'D51'
              'D52'
              'D53'
              'D54'
              'D55')
            ColumnasChecked.Strings = (
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1'
              '1')
            ColumnasNoChecked.Strings = (
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
              '0'
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
                FieldName = 'CLIENTE'
                Width = 49
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO'
                Width = 145
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'CODIGO_POSTAL'
                Width = 41
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'TITULO_LOCALIDAD'
                Width = 147
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'FRECUENCIA'
                Width = 23
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'VENTAS_2'
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'VENTAS_1'
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'VENTAS'
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'PREVISION_VENTA'
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D01'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D02'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D03'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D04'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D05'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D06'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D07'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D08'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D09'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D10'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D11'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D12'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D13'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D14'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D15'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D16'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D17'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D18'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D19'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D20'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D21'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D22'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D23'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D24'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D25'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D26'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D27'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D28'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D29'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D30'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D31'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D32'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D33'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D34'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D35'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D36'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D37'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D38'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D39'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D40'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D41'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D42'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D43'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D44'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D45'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D46'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D47'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D48'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D49'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D50'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D51'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D52'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D53'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D54'
                Width = 20
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'D55'
                Width = 20
                Visible = True
              end>
          end
        end
      end
      inherited TSTabla: TTabSheet
        inherited DBGMain: THYTDBGrid
          Width = 693
          Height = 355
          DataSource = DMCRM.DSXCRM
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit]
          UsaDicG2K = False
          ControlEdit = CEMain
          CamposAMarcar.Strings = (
            'ANULAR'
            'AUSENTE'
            'CLIENTE_AUSENTE'
            'CLIENTE_NUEVO'
            'ENTREGA_MATERIAL'
            'GESTION_DE_COBROS'
            'VISITA_COMERCIAL'
            'VISITA_EFECTUADA'
            'VOLVER')
          CamposChecked.Strings = (
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1'
            '1')
          CamposNoChecked.Strings = (
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0'
            '0')
          CamposAOrdenar.Strings = (
            'AGENTE'
            'CLIENTE'
            'FECHA'
            'FECHA_FUTURO'
            'INCIDENCIA'
            'RUTA'
            'TIPO'
            'TIT_AGENTE'
            'TIT_CLIENTE'
            'TIT_TIPO')
          Columns = <
            item
              Expanded = False
              FieldName = 'RUTA'
              Width = 30
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SEMANA'
              Width = 28
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLIENTE'
              Width = 39
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIT_CLIENTE'
              Width = 194
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TIPO'
              Width = 28
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INCIDENCIA'
              Width = 283
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'FECHA_FUTURO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLIENTE_AUSENTE'
              Width = 20
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CLIENTE_NUEVO'
              Width = 20
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VISITA_EFECTUADA'
              Width = 20
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'AUSENTE'
              Width = 20
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VOLVER'
              Width = 20
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ANULAR'
              Width = 20
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VISITA_COMERCIAL'
              Width = 20
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GESTION_DE_COBROS'
              Width = 20
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ENTREGA_MATERIAL'
              Width = 20
              Visible = True
            end>
        end
      end
    end
    object PNLTop: TLFPanel
      Left = 2
      Top = 28
      Width = 701
      Height = 30
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object LBUsuario: TLFLabel
        Left = 4
        Top = 7
        Width = 36
        Height = 13
        Alignment = taRightJustify
        Caption = 'Usuario'
      end
      object LAgente: TLFLabel
        Left = 330
        Top = 8
        Width = 34
        Height = 13
        Alignment = taRightJustify
        Caption = 'Agente'
      end
      object DBEUsuario: TLFDbedit
        Left = 44
        Top = 4
        Width = 61
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'USUARIO'
        DataSource = DMCRM.DSXCRM
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        OnChange = DBEUsuarioChange
      end
      object EUsuario: TLFEdit
        Left = 106
        Top = 4
        Width = 217
        Height = 21
        TabStop = False
        Color = clInfoBk
        Enabled = False
        TabOrder = 1
      end
      object DBEAgente: TLFDbedit
        Left = 368
        Top = 4
        Width = 67
        Height = 21
        TabStop = False
        Color = clInfoBk
        DataField = 'AGENTE'
        DataSource = DMCRM.DSXCRM
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGrayText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
        OnChange = DBEAgenteChange
      end
      object EAgente: TLFEdit
        Left = 436
        Top = 4
        Width = 260
        Height = 21
        TabStop = False
        Color = clInfoBk
        Enabled = False
        TabOrder = 3
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 443
    Width = 705
    EdgeOuter = esNone
  end
  inherited CEMain: TControlEdit
    DataSource = DMCRM.DSXCRM
    Left = 587
    Top = 0
  end
  inherited CEMainPMEdit: TPopUpTeclas
    Left = 615
    Top = 0
  end
  inherited ALMain: TLFActionList
    Left = 643
    Top = 0
    object AListadoCRM: TAction
      Category = 'Listados'
      Caption = 'Listado CRM'
      ImageIndex = 14
      OnExecute = AListadoCRMExecute
    end
    object AListadoSemana: TAction
      Category = 'Listados'
      Caption = 'Listado Semana'
      ImageIndex = 14
      OnExecute = AListadoSemanaExecute
    end
    object AListadoVisitas: TAction
      Category = 'Listados'
      Caption = 'Listado Visitas'
      ImageIndex = 14
      OnExecute = AListadoVisitasExecute
    end
    object AListadoVisitasxDias: TAction
      Category = 'Listados'
      Caption = 'Listado Visitas x Dias'
      ImageIndex = 14
      OnExecute = AListadoVisitasxDiasExecute
    end
    object LFCategoryAction1: TLFCategoryAction
      Category = 'Listados'
      Caption = 'Listados'
      ImageIndex = 77
    end
    object ADisenarListadoCRM: TAction
      Category = 'Listados;"Dise'#241'ar"'
      Caption = 'Dise'#241'ar Listado CRM'
      ImageIndex = 21
      OnExecute = ADisenarListadoCRMExecute
    end
    object ADisenarListadoSemana: TAction
      Category = 'Listados;"Dise'#241'ar"'
      Caption = 'Dise'#241'ar Listado Semana'
      ImageIndex = 21
      OnExecute = ADisenarListadoSemanaExecute
    end
    object ADisenarListadoVisitas: TAction
      Category = 'Listados;"Dise'#241'ar"'
      Caption = 'Dise'#241'ar Listado Visitas'
      ImageIndex = 21
      OnExecute = ADisenarListadoVisitasExecute
    end
    object LFCategoryAction2: TLFCategoryAction
      Category = 'Listados;"Dise'#241'ar"'
      Caption = 'Dise'#241'ar'
      ImageIndex = 77
    end
    object LFCategoryAction3: TLFCategoryAction
      Category = 'Nuevo'
      Caption = 'Nuevo'
      Hint = 'Nueva Entrada'
      ImageIndex = 57
    end
  end
  inherited FSMain: TLFFibFormStorage
    Left = 671
    Top = 0
  end
end
