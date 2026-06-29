inherited FMSincronizacionHubSpot: TFMSincronizacionHubSpot
  Left = 234
  Top = 150
  Width = 1497
  Height = 488
  BorderIcons = [biSystemMenu, biMinimize, biMaximize]
  BorderStyle = bsSizeable
  Caption = 'Sincronizacion HubSpot'
  OldCreateOrder = True
  PixelsPerInch = 96
  TextHeight = 13
  inherited PMain: TLFPanel
    Width = 1487
    Height = 435
    inherited TBMain: TLFToolBar
      Width = 1483
      inherited EPMain: THYMEditPanel
        Width = 33
        VisibleButtons = [neSalir]
        Hints.Strings = ()
      end
    end
    object PCMain: TLFPageControl
      Left = 2
      Top = 28
      Width = 1483
      Height = 405
      ActivePage = TSCompaniesContacts
      Align = alClient
      OwnerDraw = True
      TabIndex = 0
      TabOrder = 1
      OnResize = PCMainResize
      TabActiveColor = clWhite
      TabInactiveColor = 14936298
      object TSCompaniesContacts: TTabSheet
        Caption = 'Companies/Contacts'
        ImageIndex = 1
        object splCompanies: TSplitter
          Left = 0
          Top = 161
          Width = 1475
          Height = 8
          Cursor = crVSplit
          Align = alBottom
          Color = clAppWorkSpace
          MinSize = 100
          ParentColor = False
          OnMoved = splCompaniesMoved
        end
        object PNLCompanies: TLFPanel
          Left = 0
          Top = 0
          Width = 1475
          Height = 161
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object DBGCompanies: TDBGridFind2000
            Left = 0
            Top = 25
            Width = 1475
            Height = 136
            Align = alClient
            DataSource = DMSincronizacionHubSpot.DSCompanies
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnCellClick = DBGCompaniesCellClick
            OnDrawColumnCell = DBGCompaniesDrawColumnCell
            OnDblClick = DBGCompaniesDblClick
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
            IndiceBitmapAscendente = 1
            IndiceBitmapChecked = 3
            IndiceBitmapDescendente = 2
            BaseDeDatos = DMMain.DataBase
            BuscarNums = False
            Campos.Strings = (
              'ID_CLIENTE')
            CamposAMostrar.Strings = (
              'ID_CLIENTE'
              '3'
              'TELEFONO'
              'NOMBRE_COMERCIAL'
              'NIF')
            CamposAMostrarAnchos.Strings = (
              '0')
            CamposADevolver.Strings = (
              '')
            CamposDesplegar.Strings = (
              '1')
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            MensajeNoExiste = False
            Numericos.Strings = (
              'ID_CLIENTE')
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tablas.Strings = (
              'VER_CLIENTES_EF')
            Acciones.Strings = (
              '')
            Titulos.Strings = (
              'TITULO')
            Posicion = tpCentrado
            Planes.Strings = (
              '')
            OrdenMultiple = True
            OrdenadosPor.Strings = (
              'ID_CLIENTE')
            Filtros = [obEmpresa, obEjercicio, obCanal]
            Entorno = DMMain.EntornoBusqueda
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'HUBSPOT_COMPANY_ID'
                ReadOnly = True
                Width = 110
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ID_CLIENTE'
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'NAME'
                Width = 200
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COMPANY_CIF'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COMPANY_DOMAIN'
                Width = 110
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PHONE'
                Width = 110
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'EMAIL'
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ADDRESS'
                Width = 120
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'ZIP_CODE'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CITY'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'COUNTRY'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'SECTOR'
                Width = 90
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DISCOUNT_PROFILE'
                Width = 90
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'RESULTADO_ENVIO'
                ReadOnly = True
                Width = 85
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'DATE_ADD'
                ReadOnly = True
                Width = 110
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'DATE_UPD'
                ReadOnly = True
                Width = 110
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'DATE_SINC'
                ReadOnly = True
                Width = 110
                Visible = True
              end>
          end
          object TBCompanies: TLFToolBar
            Left = 0
            Top = 0
            Width = 1475
            Height = 25
            AutoSize = True
            ButtonHeight = 25
            DisabledImages = DMMain.ILMain_In
            EdgeBorders = []
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 1
            Separators = True
            object NavCompanies: THYMNavigator
              Left = 0
              Top = 0
              Width = 260
              Height = 25
              DataSource = DMSincronizacionHubSpot.DSCompanies
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
            object TBSep1: TToolButton
              Left = 260
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object TBEnviarCompaniesContactos: TToolButton
              Left = 268
              Top = 0
              Hint = 'Enviar datos Companies/Contacts'
              Caption = 'Enviar'
              ImageIndex = 36
              OnClick = TBEnviarCompaniesContactosClick
            end
            object TBSep4: TToolButton
              Left = 291
              Top = 0
              Width = 8
              ImageIndex = 37
              Style = tbsSeparator
            end
            object TBRefrescarCompaniesContactos: TToolButton
              Left = 299
              Top = 0
              Hint = 'Refrescar Datos'
              Caption = 'Refrescar Datos'
              ImageIndex = 26
              OnClick = TBRefrescarCompaniesContactosClick
            end
            object TBSep6: TToolButton
              Left = 322
              Top = 0
              Width = 8
              ImageIndex = 27
              Style = tbsSeparator
            end
            object TBCrearCliente: TToolButton
              Left = 330
              Top = 0
              Hint = 'Crear Tercero + Cliente'
              Caption = 'Crear Cliente'
              ImageIndex = 104
              OnClick = TBCrearClienteClick
            end
          end
        end
        object PNLContacts: TLFPanel
          Left = 0
          Top = 169
          Width = 1475
          Height = 208
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object DBGContacts: TDBGridFind2000
            Left = 0
            Top = 25
            Width = 1475
            Height = 183
            Align = alClient
            DataSource = DMSincronizacionHubSpot.DSContacts
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnCellClick = DBGContactsCellClick
            OnDrawColumnCell = DBGContactsDrawColumnCell
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
            IndiceBitmapAscendente = 1
            IndiceBitmapChecked = 3
            IndiceBitmapDescendente = 2
            BaseDeDatos = DMMain.DataBase
            BuscarNums = False
            Campos.Strings = (
              'TERCERO_CONTACTO')
            CamposAMostrar.Strings = (
              'TERCERO_CONTACTO'
              '3'
              'CORREO'
              'TELEFONO'
              'NOMBRE')
            CamposAMostrarAnchos.Strings = (
              '0')
            CamposADevolver.Strings = (
              '')
            CamposDesplegar.Strings = (
              '1')
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            MensajeNoExiste = False
            Numericos.Strings = (
              'CONTACTO')
            SalirSiVacio = False
            SalirSiNoExiste = False
            Tablas.Strings = (
              'SYS_TERCEROS_CONTACTOS')
            Acciones.Strings = (
              '')
            Titulos.Strings = (
              'APELLIDOS')
            Posicion = tpCentrado
            Planes.Strings = (
              '')
            OrdenMultiple = True
            OrdenadosPor.Strings = (
              'CONTACTO')
            Filtros = []
            Entorno = DMMain.EntornoBusqueda
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'HUBSPOT_CONTACT_ID'
                ReadOnly = True
                Width = 110
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'HUBSPOT_COMPANY_ID'
                ReadOnly = True
                Width = 110
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'TERCERO_CONTACTO'
                Width = 80
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'DELFOS_COMPANY_ID'
                ReadOnly = True
                Width = 80
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'FIRSTNAME'
                Width = 110
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'LASTNAME'
                Width = 110
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'EMAIL'
                Width = 110
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'PHONE'
                Width = 110
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'JOBTITLE'
                Width = 110
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DEPARTMENT'
                Width = 110
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'RESULTADO_ENVIO'
                ReadOnly = True
                Width = 85
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'DATE_ADD'
                ReadOnly = True
                Width = 110
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'DATE_UPD'
                ReadOnly = True
                Width = 110
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'DATE_SINC'
                ReadOnly = True
                Width = 110
                Visible = True
              end>
          end
          object TBContacts: TLFToolBar
            Left = 0
            Top = 0
            Width = 1475
            Height = 25
            AutoSize = True
            ButtonHeight = 25
            DisabledImages = DMMain.ILMain_In
            EdgeBorders = []
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 1
            Separators = True
            object NavCompanies1: THYMNavigator
              Left = 0
              Top = 0
              Width = 260
              Height = 25
              DataSource = DMSincronizacionHubSpot.DSContacts
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
            object TBSep2: TToolButton
              Left = 260
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
          end
        end
      end
      object TSDeals: TTabSheet
        Caption = 'Deals'
        ImageIndex = 1
        object PNLDeals: TLFPanel
          Left = 0
          Top = 0
          Width = 1475
          Height = 377
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object splDeals: TSplitter
            Left = 1217
            Top = 25
            Width = 8
            Height = 352
            Cursor = crHSplit
            Align = alRight
            Color = clAppWorkSpace
            ParentColor = False
            OnMoved = splDealsMoved
          end
          object DBGDeal: TDBGridFind2000
            Left = 0
            Top = 25
            Width = 1217
            Height = 352
            Align = alClient
            DataSource = DMSincronizacionHubSpot.DSDeals
            TabOrder = 0
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -11
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = []
            OnCellClick = DBGDealCellClick
            OnDrawColumnCell = DBGDealDrawColumnCell
            OnDblClick = DBGDealDblClick
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
            IndiceBitmapAscendente = 1
            IndiceBitmapChecked = 3
            IndiceBitmapDescendente = 2
            BaseDeDatos = DMMain.DataBase
            BuscarNums = False
            CampoAOrdenarColor = clInfoBk
            CampoAOrdenarBitmaps = DMMain.ILOrdGrid
            ColumnasCheckBoxes.Strings = (
              'ACTIVO')
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
            Entorno = DMMain.EntornoBusqueda
            Columns = <
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'HUBSPOT_DEAL_ID'
                ReadOnly = True
                Width = 110
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DELFOS_DEAL_ID'
                Width = 110
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'HUBSPOT_CONTACT_ID'
                ReadOnly = True
                Width = 110
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'HUBSPOT_COMPANY_ID'
                ReadOnly = True
                Width = 110
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DEAL_URL'
                Width = 110
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DEAL_AMOUNT'
                Width = 110
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'CURRENCY'
                Width = 110
                Visible = True
              end
              item
                Expanded = False
                FieldName = 'DEAL_STATUS'
                PickList.Strings = (
                  'Cita programada'
                  'Calificado para comprar'
                  'Presentaci'#243'n programada'
                  'Propuesta aceptada'
                  'Contrato enviado'
                  'Cierre ganado'
                  'Cierre perdido')
                Width = 110
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'RESULTADO_ENVIO'
                Width = 85
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'DATE_ADD'
                ReadOnly = True
                Width = 110
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'DATE_UPD'
                ReadOnly = True
                Width = 110
                Visible = True
              end
              item
                Color = clInfoBk
                Expanded = False
                FieldName = 'DATE_SINC'
                ReadOnly = True
                Width = 110
                Visible = True
              end>
          end
          object TBDeals: TLFToolBar
            Left = 0
            Top = 0
            Width = 1475
            Height = 25
            AutoSize = True
            ButtonHeight = 25
            DisabledImages = DMMain.ILMain_In
            EdgeBorders = []
            EdgeInner = esNone
            EdgeOuter = esNone
            Flat = True
            HotImages = DMMain.ILMain_Ac
            Images = DMMain.ILMain_Ac
            TabOrder = 1
            Separators = True
            object NavDeals: THYMNavigator
              Left = 0
              Top = 0
              Width = 260
              Height = 25
              DataSource = DMSincronizacionHubSpot.DSDeals
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
            object TB3: TToolButton
              Left = 260
              Top = 0
              Width = 8
              Style = tbsSeparator
            end
            object TBEnviarDeals: TToolButton
              Left = 268
              Top = 0
              Hint = 'Enviar Deals'
              Caption = 'Enviar Deals'
              ImageIndex = 36
              OnClick = TBEnviarDealsClick
            end
            object TBSep5: TToolButton
              Left = 291
              Top = 0
              Width = 8
              ImageIndex = 37
              Style = tbsSeparator
            end
            object TBRefrescarDeals: TToolButton
              Left = 299
              Top = 0
              Hint = 'Refrescar Datos'
              Caption = 'Refrescar Datos'
              ImageIndex = 26
              OnClick = TBRefrescarDealsClick
            end
          end
          object PNLDealsDatos: TLFPanel
            Left = 1225
            Top = 25
            Width = 250
            Height = 352
            Align = alRight
            BevelOuter = bvNone
            TabOrder = 2
            DesignSize = (
              250
              352)
            object LDealsDatosCompany: TLFLabel
              Left = 2
              Top = 3
              Width = 75
              Height = 13
              Caption = 'Company Name'
            end
            object LDealsDatosCIF: TLFLabel
              Left = 2
              Top = 43
              Width = 16
              Height = 13
              Caption = 'CIF'
            end
            object LDealsDatosLastName: TLFLabel
              Left = 2
              Top = 99
              Width = 48
              Height = 13
              Caption = 'LastName'
            end
            object LDealsDatosFirstName: TLFLabel
              Left = 2
              Top = 139
              Width = 47
              Height = 13
              Caption = 'FirstName'
            end
            object LDealsDatosPhone: TLFLabel
              Left = 2
              Top = 179
              Width = 31
              Height = 13
              Caption = 'Phone'
            end
            object LDealsDatosEmail: TLFLabel
              Left = 2
              Top = 235
              Width = 25
              Height = 13
              Caption = 'Email'
            end
            object DBEDealsDatosName: TLFDbedit
              Left = 2
              Top = 19
              Width = 245
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              Color = clInfoBk
              DataField = 'NAME'
              DataSource = DMSincronizacionHubSpot.DSDealsDatos
              Enabled = False
              ReadOnly = True
              TabOrder = 0
            end
            object DBEDealsDatosCIF: TLFDbedit
              Left = 2
              Top = 59
              Width = 245
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              Color = clInfoBk
              DataField = 'COMPANY_CIF'
              DataSource = DMSincronizacionHubSpot.DSDealsDatos
              Enabled = False
              ReadOnly = True
              TabOrder = 1
            end
            object DBEDealsDatosLastName: TLFDbedit
              Left = 2
              Top = 115
              Width = 245
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              Color = clInfoBk
              DataField = 'LASTNAME'
              DataSource = DMSincronizacionHubSpot.DSDealsDatos
              Enabled = False
              ReadOnly = True
              TabOrder = 2
            end
            object DBEDealsDatosFirstName: TLFDbedit
              Left = 2
              Top = 155
              Width = 245
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              Color = clInfoBk
              DataField = 'FIRSTNAME'
              DataSource = DMSincronizacionHubSpot.DSDealsDatos
              Enabled = False
              ReadOnly = True
              TabOrder = 3
            end
            object DBEDealsDatosPhone: TLFDbedit
              Left = 2
              Top = 195
              Width = 245
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              Color = clInfoBk
              DataField = 'PHONE'
              DataSource = DMSincronizacionHubSpot.DSDealsDatos
              Enabled = False
              ReadOnly = True
              TabOrder = 4
            end
            object DBEDealsDatosEmail: TLFDbedit
              Left = 2
              Top = 235
              Width = 245
              Height = 21
              Anchors = [akLeft, akTop, akRight]
              Color = clInfoBk
              DataField = 'EMAIL'
              DataSource = DMSincronizacionHubSpot.DSDealsDatos
              Enabled = False
              ReadOnly = True
              TabOrder = 5
            end
          end
        end
      end
      object TSConfiguracion: TTabSheet
        Caption = 'Configuracion'
        object TBConfiguracion: TLFToolBar
          Left = 0
          Top = 0
          Width = 1475
          Height = 25
          AutoSize = True
          ButtonHeight = 25
          DisabledImages = DMMain.ILMain_In
          EdgeBorders = []
          EdgeInner = esNone
          EdgeOuter = esNone
          Flat = True
          HotImages = DMMain.ILMain_Ac
          Images = DMMain.ILMain_Ac
          TabOrder = 0
          Separators = True
          object NavConfiguracion: THYMNavigator
            Left = 0
            Top = 0
            Width = 248
            Height = 25
            DataSource = DMSincronizacionHubSpot.DSConfiguracion
            VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast, nbEdit, nbPost, nbCancel, nbRefresh]
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
          object TBSep3: TToolButton
            Left = 248
            Top = 0
            Width = 8
            Style = tbsSeparator
          end
        end
        object PNLConfiguracion: TLFPanel
          Left = 0
          Top = 25
          Width = 1475
          Height = 352
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          DesignSize = (
            1475
            352)
          object LURL: TLFLabel
            Left = 21
            Top = 43
            Width = 22
            Height = 13
            Alignment = taRightJustify
            Caption = 'URL'
          end
          object LToken: TLFLabel
            Left = 12
            Top = 67
            Width = 31
            Height = 13
            Alignment = taRightJustify
            Caption = 'Token'
          end
          object EURL: TLFEdit
            Left = 48
            Top = 96
            Width = 449
            Height = 21
            Color = clInfoBk
            TabOrder = 0
            Text = 
              'https://europe-west4-eighth-duality-480016-c6.cloudfunctions.net' +
              '/tecilMiddleware/delfos/'
            Visible = False
          end
          object DBEToken: TLFDbedit
            Left = 48
            Top = 64
            Width = 1419
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'ACCESS_TOKEN'
            DataSource = DMSincronizacionHubSpot.DSConfiguracion
            PasswordChar = '*'
            TabOrder = 1
          end
          object DBEURL: TLFDbedit
            Left = 48
            Top = 40
            Width = 1419
            Height = 21
            Anchors = [akLeft, akTop, akRight]
            DataField = 'URL'
            DataSource = DMSincronizacionHubSpot.DSConfiguracion
            TabOrder = 2
          end
        end
      end
    end
  end
  inherited TBActions: TLFToolBar
    Top = 435
    Width = 1487
  end
  inherited CEMainPMEdit: TPopUpTeclas
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
  inherited FSMain: TLFFibFormStorage
    StoredProps.Strings = (
      'EURL.Text')
  end
end
